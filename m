Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BV9Sz-0001Cl-9W
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2004 09:38:12 -0400
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004060109481905790
	for <linux-mtd@lists.infradead.org>; Tue, 01 Jun 2004 09:48:19 -0400
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351812A4@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Tue, 1 Jun 2004 09:39:47 -0400 
MIME-Version: 1.0
Content-Type: text/plain
Subject: DOC Mill Plus 32M  What next?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello all,

  On my arm core board there is a DOC Plus 32M.  When I use the DOC2001Plus
driver I can probe the chip "docprobe".  The chip is reported in the proc
file system.
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00020000 00010000 "BootLoader"
mtd1: 00040000 00010000 "Params"
mtd2: 00200000 00010000 "Kernel"
mtd3: 001a0000 00010000 "Flash0 FileSys"
mtd4: 02000000 00008000 "DiskOnChip Millennium Plus"

What tools can I use on the chip to prepare it for use??  Nftl_format
reports wrong erase size of 0x10000?  I have read others postings and I am
not sure if I should be using nftl_format anyway?  Can soemone please tell
me the proper procedure to prep the chip for a jffs2 file system???

Thanks for the help!
John
