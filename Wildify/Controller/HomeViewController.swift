
//  Created by Thor Remiendo on 31/10/2019.
//  Copyright © 2019 ZET. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

   override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }


}
