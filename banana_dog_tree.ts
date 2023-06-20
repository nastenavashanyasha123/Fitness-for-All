// Create an interface for Object that holds feature information
interface Features {
    name: string;
    description: string;
    level: string;
}

// Create an array of Features
let features: Features[] = [
    {
        name: 'Cardio Training',
        description: 'Increase your heart rate and cardiovascular health with a selection of cardio exercises.',
        level: 'Beginner'
    },
    {
        name: 'Strength Training',
        description: 'Build and maintain muscle with a balanced routine of strength trainings.',
        level: 'Intermediate'
    },
    {
        name: 'Flexibility Training',
        description: 'Improve mobility and posture with stretching and flexibility exercises.',
        level: 'Advanced'
    },
    {
        name: 'Yoga',
        description: 'Strengthen your body and mind with a practice of Yoga techniques and poses.',
        level: 'Intermediate'
    }
];

// Create HTML elements for the Features
let featureElements = document.createElement('ul');

features.forEach(feature => {
    let li = document.createElement('li');
    let h3 = document.createElement('h3');
    let p = document.createElement('p');
    let span = document.createElement('span');
    
    h3.innerText = feature.name;
    p.innerText = feature.description;
    span.innerText = `Level: ${feature.level}`;
    
    li.appendChild(h3);
    li.appendChild(p);
    li.appendChild(span);
    featureElements.appendChild(li);
});

// Create a container element to house the features
let container = document.createElement('div');
container.classList.add('fitness-for-all')
container.appendChild(featureElements);

// Add the container element to the DOM
document.body.appendChild(container);

// Create a header for the container
let header = document.createElement('h1');
header.innerText = 'Fitness for All';
container.insertBefore(header, featureElements);

// Create a button to expand and collapse the feature list
let toggleFeaturesButton = document.createElement('button');
toggleFeaturesButton.innerText = 'Expand Features';
container.insertBefore(toggleFeaturesButton, featureElements);

// Function to handle toggling the features list
let isFeaturesVisible = true;
function toggleFeatures() {
    if(isFeaturesVisible) {
        featureElements.style.display = 'none';
        toggleFeaturesButton.innerText = 'Show Features';
        isFeaturesVisible = false;
    } else {
        featureElements.style.display = 'block';
        toggleFeaturesButton.innerText = 'Hide Features';
        isFeaturesVisible = true;
    }
}

// Add event listener to toggle the features
toggleFeaturesButton.addEventListener('click', toggleFeatures);