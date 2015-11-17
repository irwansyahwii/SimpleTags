<!-- 
require('stores/blog-store/blog-store.tag');
require('stores/album-store/album-store.tag');
require('functional/app-dispatcher/app-dispatcher.tag');
require('functional/app-router/app-router.tag');
 -->

require("surface/surface.tag");
require("input-surface/input-surface.tag");
require("layout-controller/layout-controller.tag");


<app>
	<layout-controller id="mainLayout" onready={this.onready}>
		<input-surface id="header" placeholder="Your name..."></input-surface>
		<surface id="content">
		  <h3>Hi!</h3><p>I'm a surface!<br>I live inside a context.</p><p>You can add <b>HTML</b> content to me and style me with <b>CSS!</b></p>

		</surface>
		<layout-controller id="footer">
			<surface id="back"></surface>
		</layout-controller>
	</layout-controller>

	<script type="text/es6">
		import LayoutDockHelper from "famous-flex/src/helpers/LayoutDockHelper";
		import FamousInitializer from "shared/FamousInitializer";


		this.onready = ()=>{

			this.mainLayout.layoutControllerOptions.layout = (context, options)=>{
				var dock = new LayoutDockHelper(context, options);
                dock.top('header', options.headerSize, 1);
                dock.bottom('footer', options.footerSize, 1);
                dock.fill('content', 1);			
           	};

           	this.mainLayout.layoutControllerOptions.layoutOptions = {
                headerSize: 34,
                footerSize: 50
            };

			this.mainLayout.refresh();



		}

	</script>
<!--	
	<app-dispatcher name="dispatcher"></app-dispatcher>
	<app-router name="router"></app-router>

	<topmenu>
		<btn-group>
	    <btn onpush={switchpage} route="blogs">Blogs</btn>
    		<btn onpush={switchpage} route="albums">Albums</btn>
 		<btn-group>
	</topmenu>


	<stores>
		<blog-store name="blogs"></blog-store>
		<album-store name="blogs" ></album-store>
	</stores>


	<script type="text/es6">
		import ClassA from "./classA";


		let cls = new ClassA();
		cls.speak();

		this.switchpage = function(e){
			var routeTarget = e.target.parentNode.getAttribute('route');
			riot.route(routeTarget);
		}
		this.includePages = function(){
			var initialPages = document.getElementsByTagName('pages')[0].cloneNode(true);
			this.root.appendChild(initialPages);
			document.getElementsByTagName('pages')[0].parentNode.removeChild(document.getElementsByTagName('pages')[0]);
		}
		this.registerWithRouter = function(){
			this.includePages();
			document.addEventListener('router-hello', function(e){
				//If no hash is given, mount the first page.
				if (!window.location.hash){
					//Route to the first page.
					var firstPage = this.root.getElementsByTagName('PAGES')[0].children[0].tagName.toLowerCase();
					riot.route(firstPage);
				}else{
					riot.route.exec(e.detail.router.router);
				}


			});

			var helloRouter = new CustomEvent('hello-router');
			document.dispatchEvent(helloRouter);

		}.bind(this);

		this.on('mount', function(){
			//Register with router.
			setTimeout(this.registerWithRouter, 1)


		});
	</script>
	-->
</app>