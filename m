Received: from ns2.arlut.utexas.edu ([129.116.174.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18K2Um-0002jq-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2002 20:21:16 +0000
Received: from ns5.arlut.utexas.edu (ns5.arlut.utexas.edu [10.4.1.6])
	by ns2.arlut.utexas.edu (8.12.5/8.12.5) with ESMTP id gB5Kpnlg062502
	for <linux-mtd@lists.infradead.org>; Thu, 5 Dec 2002 14:51:50 -0600 (CST)
Received: from arlut.utexas.edu (koffer.arlut.utexas.edu [10.8.17.114])
	by ns5.arlut.utexas.edu (8.12.5/8.12.5) with ESMTP id gB5Kpn1j074186
	for <linux-mtd@lists.infradead.org>; Thu, 5 Dec 2002 14:51:49 -0600 (CST)
Date: Thu, 5 Dec 2002 14:51:48 -0600
Mime-Version: 1.0 (Apple Message framework v548)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Subject: mdblock device not registering
From: Ken Offer <koffer@arlut.utexas.edu>
To: LinuxMTD <linux-mtd@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Message-Id: <5F99B6E0-0893-11D7-971A-000393467F1A@arlut.utexas.edu>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a strange one.

I checked out the latest MTD cvs (on 20021202) and integrated it into 
my 2.4.19 Yellow Dog kernel.  When I try to load the mtdblock module 
NONE of my initialization debug statements print and the mtdblock 
device is NOT registered.  I do an lsmod and the module is loaded.  If 
its loaded, why isn't it printk'ing?  I thought the only way a module 
could load is if its initialization succeeds.

This doesn't happen under the 20020819 source code.  The mtdblock 
module loads fine, my debug statements print and the mtdblock device is 
registered.

Has anybody else tried the latest cvs code with a 2.4 kernel (as 
opposed to a 2.5 kernel)?

+-----------------------------------------------------------+
|  Ken Offer        koffer@arlut.utexas.edu         ARL:UT  |
|  Office: 512-835-3859                  Fax: 512-835-3259  |
+-----------------------------------------------------------+
