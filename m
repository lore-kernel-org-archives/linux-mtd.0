Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CmGOj-0002cK-9O
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2005 14:00:48 -0500
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2005010514004400773
	for <linux-mtd@lists.infradead.org>; Wed, 05 Jan 2005 14:00:44 -0500
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351813A1@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Wed, 5 Jan 2005 14:00:35 -0500 
MIME-Version: 1.0
Content-Type: text/plain
Subject: Problems mounting file system and booting with DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

  I will try again and see if I can get some insight as to my problem.  I
have linux-2.4.28, DiskOnChip 2000 128Mbyte ( new type INFTL).  I have a
floppy drive and a hard drive attached to my pc104 stack.  I have put
Docboot on the diskonchip and set it where I can boot from the floppy also.
Using lilo on the floppy I can boot to my hard drive and to the DOC.  Doing
this I know that the image on the DOC is good.  When I try to have Docboot
boot the diskonchip I disable the hard drive in the bios (seems there is a
slight problem when the hard drive is enabled in the bios), the kernel
starts to load but then the root file system will not get mounted.
INFTL_mount fails.  When I boot using the floppy and the DOC as the boot
device everything seems to work.  I am assuming INFTL_mount succeeds.  One
thing I notice when using the floppy and booting to the diskonchip the mtd
partitions are not registered.  /proc/mtd just show mtd0.

Thanks
John 
