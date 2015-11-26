<!-- 
require('stores/blog-store/blog-store.tag');
require('stores/album-store/album-store.tag');
require('functional/app-dispatcher/app-dispatcher.tag');
require('functional/app-router/app-router.tag');
 -->

require("../styles/styles.css");
require("surface/surface.tag");
require("input-surface/input-surface.tag");
require("layout-controller/layout-controller.tag");
require("autosize-text-area/autosize-text-area.tag");


<app>
	<layout-controller id="mainLayout" layout_function={mainLayoutFunction} layout_options={mainLayoutOptions}  onready={this.onready}>
		<input-surface id="header" classes={['name-input']} value={localStorage.name} placeholder="Your name..."></input-surface>
		<surface id="content">
		  <h3>Hi!</h3><p>I'm a surface!<br>I live inside a context.</p><p>You can add <b>HTML</b> content to me and style me with <b>CSS!</b></p>

		</surface>

		<layout-controller id="footer" layout_function={parent.footerLayoutFunction}>
			
			<autosize-text-area id="input" classes={['message-input']} resize="none" placeholder="Enter your message here..."></autosize-text-area>
			<surface id="send" classes={['message-send', 'button']} width={60} height={undefined}>
				Send
			</surface>
			<surface id="back" classes={['message-back']} ></surface>

		</layout-controller>

	</layout-controller>

	<script type="text/es6">
		import LayoutDockHelper from "famous-flex/src/helpers/LayoutDockHelper";
		import FamousInitializer from "shared/FamousInitializer";


		this.mainLayoutFunction = (context, options) =>{
			var dock = new LayoutDockHelper(context, options);
            dock.top('header', options.headerSize, 1);
            dock.bottom('footer', options.footerSize, 1);
            dock.fill('content', 1);			

		}
		this.mainLayoutOptions = {
            headerSize: 34,
            footerSize: 50			
		}

		this.footerLayoutFunction = {
			dock:[
				['fill', 'back'],
				['left', undefined, 8],
				['top', undefined, 8],
				['right', undefined, 8],
				['bottom', undefined, 8],
				['right', 'send', undefined, 1],
				['fill', 'input', 1]
			]
		}


        $(document).ready(()=>{
			let sendButton = document.getElementById("send");
			
			sendButton.on("click", (e, o)=>{
				alert("heloo");
			})

			let textBoxName = $("#header")[0];
			textBoxName.on("change", ()=>{
				localStorage.name = textBoxName.getValue();
			});

			let textBoxMessage = $("#input")[0];
			textBoxMessage.on("scrollHeightChanged", ()=>{
				var height = Math.max(Math.min(textBoxMessage.getScrollHeight() + 16, 200), 50);
				if (this.mainLayout.getLayoutOptions().footerSize !== height) {
					this.mainLayout.setLayoutOptions({footerSize: height});
            		return true;
        		}
        		return false;

			});

			textBoxMessage.on("keydown", (e) =>{
				if(e.keyCode === 13){
					e.preventDefault();

				}
			});
        });


		this.onready = ()=>{
			console.log("app.onready called");


			/* Another way to configure the layout
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
			*/



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