/*
Feathers SDK Manager
Copyright 2015 Bowler Hat LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
package view.mediators
{
	import model.SDKManagerModel;

	import org.robotlegs.starling.mvcs.Mediator;

	import starling.events.Event;

	import view.ChooseProductScreen;

	public class ChooseProductScreenMediator extends Mediator
	{	
		[Inject]
		public var sdkManagerModel:SDKManagerModel;
		
		[Inject]
		public var screen:ChooseProductScreen;
		
		override public function onRegister():void
		{
			this.screen.products = this.sdkManagerModel.products;
			//since the user may navigate back, we may need to repopulate the
			//appropriate fields in this screen.
			this.screen.selectedProduct = this.sdkManagerModel.selectedProduct;
			this.addViewListener(Event.COMPLETE, view_completeHandler);
		}
		
		private function view_completeHandler(event:Event):void
		{
			this.sdkManagerModel.selectedProduct = this.screen.selectedProduct;
		}
	}
}