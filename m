Received: from albatros.havelsan.com.tr ([195.142.233.60])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eFO7-0004Cr-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 14:37:39 +0100
Message-ID: <009601c24205$690cc730$3064000a@nurpinar>
From: "nur" <nurpinar@e-kolay.net>
To: "MTD" <linux-mtd@lists.infradead.org>
Subject: DOC millenium doesnt work anymore 
Date: Mon, 12 Aug 2002 16:37:32 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

I have created two partitions as minix and msdos. After reboot, my kernel
printed a message as follows
Using configured DiskOnChip probe address 0ex8000
Possible Diskonchop with unknown ChipID FD found at 0xe8000
No recognised Diskonchip devices found

Anyone has faced such a problem?

Under romdos dformat /win:e800 /s:doc51.exb doesn't work
It can't find any diskonchip. dinfo /win:e800 doesnt work as well

running nftl_format after insmod nftl could harm my diskonchip? I don't
suppose, because it was ok after formating and re-booting.
I would like to know what was my mistake so that I won't do it again. Cos I
have one doc millenium left
Thanks

P.S. mtd-patch-2.4.0-test12-20001218-2230GMT doesn't apply to 2.4.0 kernel.
gives many errors
