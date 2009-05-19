Received: from yx-out-1718.google.com ([74.125.44.154])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6WLC-0004Us-MT
	for linux-mtd@lists.infradead.org; Tue, 19 May 2009 20:55:28 +0000
Received: by yx-out-1718.google.com with SMTP id 6so23522yxn.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 May 2009 13:55:10 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 19 May 2009 13:55:10 -0700
Message-ID: <66b2b2310905191355h1b99caaasd4636e4e9efc9aec@mail.gmail.com>
Subject: Nand driver acts different in two different settings
From: John Tobias <jtobias@viaas.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I have tested two scenarios for writing/reading a data on my nand
flash and it act's differently the nand driver on DM6446.

1st scenario:

I booted my board with NFS, mounted my nand flash partition manually
mount -t jffs2 /dev/mtdblock11 /mnt

Then, I put data on nand partition by copying the following
directories (/bin /lib):
cp -daR /bin /lib /mnt

I unmounted and remounted it and I didn't get any errors/warnings,
even I try many times.

2nd scenario:

I erased the said partition using flash_eraseall -j /dev/mtdblock11,
write the .jffs2 image on flash using nandwrite.
Then, I reboot my board to boot on nand. The first boot, I didn't get
any errors/warnings. But, after the 2nd reboot, I got the following
errors:

mtd->read(0x7b74 bytes from 0x2a9848c) returned ECC error
Empty flash at 0x02a9cea4 ends at 0x02a9d000
jffs2_scan_dirent_node(): Name CRC failed on node at 0x02a9d4b8: Read
0x87ca3075, calculated 0x9a7d2011
jffs2_scan_dirent_node(): Name CRC failed on node at 0x02a9e198: Read
0x1c93832c, calculated 0x1947e8af
jffs2_scan_dirent_node(): Name CRC failed on node at 0x02a9e660: Read
0xb08c7dea, calculated 0x7855f7e2
jffs2_scan_dirent_node(): Name CRC failed on node at 0x02a9eb2c: Read
0x06400c2b, calculated 0x06400c29
jffs2_scan_dirent_node(): Name CRC failed on node at 0x02a9faec: Read
0xa532c097, calculated 0x6e6e1332


Why it acts so differently the two scenarios, since I'm using same driver?.

Does booting on nand, the driver should behave differently?.
Am I missing something or is there any special cases that I need to do on nand?

Any help would be appreciated.

Thanks,

John
