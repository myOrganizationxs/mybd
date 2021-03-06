<html>
	<head>
		<title>My first Three.js app</title>
		<style>
			body { margin: 0; }
			canvas { width: 100%; height: 100% }
		</style>
	</head>
	<body>
		<script src="js/three.min.js"></script>
		<script src="js/OrbitControls.js"></script>
		<script>

		//L�neas para crear una escena y una c�mara
			var scene = new THREE.Scene();
			var camera = new THREE.PerspectiveCamera( 75, window.innerWidth/window.innerHeight, 0.1, 1000 );
			camera.position.z = 40;
		//fin
		
			var controls = new THREE.OrbitControls( camera );
	  		controls.addEventListener( 'change', renderer );

		//Activar el motor gr�fico del navegador Web (puede ser Canvas, WebGL, etc)
			var renderer = new THREE.WebGLRenderer();
			renderer.setSize( window.innerWidth, window.innerHeight );
			document.body.appendChild( renderer.domElement );
		//fin

			var pointLight = new THREE.PointLight(0xFFFFFF);
		    pointLight.position.set(0, 0, 250);
		    scene.add(pointLight);

		//L�neas para construir un objeto; hay tres m�todos necesarios para construirlo: 
		//geometry(si ser� una esfera, etc) 
		//material(est� muy obvio), 
		//mesh(crea la malla donde cargar el objeto con su material). 
		//EL m�todo .add es para a�adirlo a la escena

			// var geometry = new THREE.RingGeometry( 1, 5, 32 );
			// var material = new THREE.MeshBasicMaterial( { color: 0xffff00, side: THREE.DoubleSide } );
			// var mesh = new THREE.Mesh( geometry, material );	
			// mesh.rotation.set( 1, 0, 0 );
			// scene.add( mesh );

			var material = new THREE.LineBasicMaterial({color:0xFFFFFF, opacity:1});
			var ellipse = new THREE.EllipseCurve(0, 0, 30, 20, 0, 2 * Math.PI, false);
			var ellipsePath = new THREE.CurvePath();
			ellipsePath.add(ellipse);
			var ellipseGeometry = ellipsePath.createPointsGeometry(100);
			ellipseGeometry.computeTangents();
			var line = new THREE.Line(ellipseGeometry, material);
			line.rotation.set( Math.PI/2, 0, 0 )
			scene.add( line );

			var central_geometry = new THREE.SphereGeometry( 5, 32, 32 );
			var central_material = new THREE.MeshPhongMaterial( { color: 0xDF0101  } );
			var central = new THREE.Mesh( central_geometry, central_material );
			scene.add( central );

			var sub_geometry = new THREE.SphereGeometry( 2, 20, 20 )
			var sub_material = new THREE.MeshPhongMaterial( { color: 0x2ECCFA } );
			var sub = new THREE.Mesh( sub_geometry, sub_material );
			sub.position.x = 20;
			scene.add( sub );
			var t=10;

			var sub2_geometry = new THREE.SphereGeometry( 2, 20, 20 )
			var sub2_material = new THREE.MeshPhongMaterial( { color: 0x3ADF00 } ); //verde
			var sub2 = new THREE.Mesh( sub2_geometry, sub2_material );
			sub2.position.x = 20;
			scene.add( sub2 );
			var t2=20;

			var sub3_geometry = new THREE.SphereGeometry( 2, 20, 20 )
			var sub3_material = new THREE.MeshPhongMaterial( { color: 0xFFFF00 } ); //amarilla
			var sub3 = new THREE.Mesh( sub3_geometry, sub3_material );
			sub3.position.x = 20;
			scene.add( sub3 );
			var t3=30;

			var sub4_geometry = new THREE.SphereGeometry( 2, 20, 20 )
			var sub4_material = new THREE.MeshPhongMaterial( { color: 0xFFFF00 } ); //amarilla
			var sub4 = new THREE.Mesh( sub4_geometry, sub4_material );
			sub4.position.x = 20;
			scene.add( sub4 );
			var t4=40;

			var sub5_geometry = new THREE.SphereGeometry( 2, 20, 20 )
			var sub5_material = new THREE.MeshPhongMaterial( { color: 0xFFFF00 } ); //amarilla
			var sub5 = new THREE.Mesh( sub5_geometry, sub5_material );
			sub5.position.x = 20;
			scene.add( sub5 );
			var t5=50;

			var sub6_geometry = new THREE.SphereGeometry( 2, 20, 20 )
			var sub6_material = new THREE.MeshPhongMaterial( { color: 0xFFFF00 } ); //amarilla
			var sub6 = new THREE.Mesh( sub6_geometry, sub6_material );
			sub6.position.x = 20;
			scene.add( sub6 );
			var t6=60;
		//fin

		//Donde la magia sucede
			var animate = function () {
				requestAnimationFrame( animate );

					sub.position.x = Math.sin(t*0.1)*30;
					sub.position.z = Math.cos(t*0.1)*20;
					t-=Math.PI/180*5;

					sub2.position.x = Math.sin(t2*0.1)*30;
					sub2.position.z = Math.cos(t2*0.1)*20;
					t2-=Math.PI/180*5;

					sub3.position.x = Math.sin(t3*0.1)*30;
					sub3.position.z = Math.cos(t3*0.1)*20;
					t3-=Math.PI/180*5;

					sub4.position.x = Math.sin(t4*0.1)*30;
					sub4.position.z = Math.cos(t4*0.1)*20;
					t4-=Math.PI/180*5;

					sub5.position.x = Math.sin(t5*0.1)*30;
					sub5.position.z = Math.cos(t5*0.1)*20;
					t5-=Math.PI/180*5;

					sub6.position.x = Math.sin(t6*0.1)*30;
					sub6.position.z = Math.cos(t6*0.1)*20;
					t6-=Math.PI/180*5;

				renderer.render(scene, camera);
				controls.update();
			};
		//fin

		//Color del fondo de la escena
			renderer.setClearColor( 0x0A2A1B, 1); 
			animate();
		</script>
	</body>
</html>