Received: from sphere.barak.net.il ([212.150.48.98])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AVYLP-0005Iw-MY
	for linux-mtd@lists.infradead.org; Sun, 14 Dec 2003 15:39:43 +0000
Received: from pc166 ([82.166.70.240]) by sphere.barak.net.il
	b2629777bce4038e9f419f7b71122558)
	with SMTP id <20031214153615.FLNJ4652.sphere@pc166>
	for <linux-mtd@lists.infradead.org>;
	Sun, 14 Dec 2003 17:36:15 +0200
Message-ID: <006701c3c257$a2116c60$a600a8c0@pc166>
From: "Isak Levi" <isak@barak.net.il>
To: <linux-mtd@lists.infradead.org>
Date: Sun, 14 Dec 2003 17:33:32 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1255"
Content-Transfer-Encoding: 7bit
Subject: problem using jffs2 with nand flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am using samsung 2k pages NAND flash and I am trying to use JFFS2 with the
flash.
I did the following steps:

1. eraseall /devfs/mtd/6
2. mount -t jffs2 /devfs/mtdblock/6 /mnt

while /mnt is empty, I am trying to copy ~11k file on it and encounter the
following error:
Only one page(2k) is actually being written to the flash (why is that?) and
after remounting the system
the file is only 4096 bytes long.
I get 'Unable to handle kernel request at virtual address ... ' within the
kupdated process.

any idea's?
Thanks
