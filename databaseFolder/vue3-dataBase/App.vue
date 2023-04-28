<template>
  <div class="dataBaseDemo">

    <div class="title has-text-centered">
      dataBase_Demo
    </div>


    <form
      @submit.prevent="addPhoto"
    >
      <div class="field is-grouped mb-5"> 
        <p class="control is-expanded">
          <input 
            v-model = "newPhotoContent" 
            class="input"
            placeholder="image URL or Text input" 
            type="text" 
            >
        </p><!-- field to add image url-->

        <!-- IAM TESTING THIS OUT-->

        <p class="control">
          <button
          :disabled = "!newPhotoContent" 
          class="button is-info"
          >
            Add
          </button>
        </p>
      </div>
    </form>

    

    <div 
      v-for="entries in db_entries"
      class="card mb-5"
    >
      <div class="card-content">
        <div class="content">

          <div class="columns is-mobile is-vcentered">
            <div class="column">
              {{entries.content}}
            </div>

            <div class="column is-5 has-text-right">
              <button 
                @click="deletePhoto(entries.id)"
                class="button is-danger"
              > <!-- this is the button to delete something from the database-->
                &cross;
              </button>
            </div>

          </div>

          
          
        </div>
      </div>
    </div>

  </div>

  
</template>


<script setup>
/*
  imports
*/


import { ref, onMounted } from 'vue'
import { v4 as uuidv4 } from 'uuid'
import { collection, onSnapshot, addDoc, doc, deleteDoc } from 'firebase/firestore'
import { db } from '@/firebase'

/*
  firebase database of photos
*/

const photosCollectionRef = collection(db, 'photos')


/*
  entries
*/

const db_entries = ref([
/*  {
    id: 'id1',
    content: "test",
    done: false
  },

  {
    id: 'id2',
    content: "test",
    done: false
  },

  {
    id: 'id3',
    content: "test",
    done: false
  }
  */
])

/*
  get db_entries
*/

onMounted( () => {

  /* const querySnapshot = await getDocs(collection(db, 'photos'))

  let db_photos = []

  querySnapshot.forEach((doc) => {
    // doc.data() is never undefined for query doc snapshots
    console.log(doc.id, " => ", doc.data())
    
    const photo = {
      id: doc.id,
      content: doc.data().content,
      done: doc.data().done
    }

    console.log(doc.data().content);

    db_photos.push(photo)
  })
  db_entries.value = db_photos */

  onSnapshot(photosCollectionRef, (querySnapshot) => {

    const db_photos = []

    querySnapshot.forEach((doc) => {
      const photo = {
        id: doc.id,
        content: doc.data().content,
        done: doc.data().done
      }

      db_photos.push(photo)
    })
    db_entries.value = db_photos
  })
})

/*
  addPhoto
*/

const newPhotoContent = ref('')

 const addPhoto = () =>{


  addDoc(photosCollectionRef, {
    content: newPhotoContent.value,
    done: false
  })


  /*const newPhoto = {
    id: uuidv4(),
    content: newPhotoContent.value,
    done: false
  }
  db_entries.value.unshift(newPhoto) */
  newPhotoContent.value = ''
}

/*
  deletePhoto
*/

const deletePhoto = id =>
{
  deleteDoc(doc(photosCollectionRef, id))
}

</script>



<style>
@import 'bulma/css/bulma.min.css';

.dataBaseDemo {
  max-width: 400px;
  padding:20px;
  margin: 0 auto;
}

</style>