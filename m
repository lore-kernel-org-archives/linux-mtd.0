Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1ClYKC-00051p-7A
	for linux-mtd@lists.infradead.org; Mon, 03 Jan 2005 14:57:09 -0500
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2005010314580711044
	for <linux-mtd@lists.infradead.org>; Mon, 03 Jan 2005 14:58:07 -0500
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351813A0@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Mon, 3 Jan 2005 14:57:04 -0500 
MIME-Version: 1.0
Content-Type: text/plain
Subject: DOCboot kernel panic can't mount file system????
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All

  I have been using docboot to try to get my DOC2000 128Mbyte (inftla device
TSOP) a bootable device.  I am able to get docboot working and the kernel
going but when it comes to mounting the file system I am hitting a road
block.  I have everything built into the kernel.  The two mtd partitions are
registered.  The inftla1 device is registered.  When I boot not from the DOC
using the same kernel image I can mount the doc and view the file system
(/dev/inftla1).  In the command line I have tried a number of root= options
(/dev/mtdblock2, /dev/mtdblockc, /dev/inftla1, 3102) none seem to work.

  Are there any suggestions as to how to get my file system to mount??????


Thanks,
John
