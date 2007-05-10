Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HmGDA-0005nJ-PY
	for linux-mtd@lists.infradead.org; Thu, 10 May 2007 17:30:10 -0400
Received: by ug-out-1314.google.com with SMTP id m2so521751uge
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 May 2007 14:30:06 -0700 (PDT)
From: borasah@gmail.com
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: NAND flash write goes wrong
Date: Fri, 11 May 2007 00:37:08 +0300
References: <200705102150.31171.borasah@gmail.com>
	<1178824593.22802.48.camel@zod.rchland.ibm.com>
In-Reply-To: <1178824593.22802.48.camel@zod.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="Iso-8859-9"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200705110037.08480.borasah@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Josh,

> > I have a MIPS based board and want to use its NAND flash for storage.
> > NAND chip is a Samsung part: K9F1208UDA. It has 16KB erase block size and
> > 512 byte page size.
> > 	cat /proc/mtd
> > 	dev:    size   erasesize  name
> > 	mtd0: 02000000 00020000 "mtdram test device"
> > 	mtd1: 00800000 00004000 "NAND FS 0"
> > 	mtd2: 03800000 00004000 "NAND FS 1"
> >
> > As you see there are two partitions on it. I want to use "NAND FS
> > 1"(56MB) for rootFS storage. I obtained mtd-utils from the site and
> > compiled them for both the host and the target. I am using "mkfs.jffs2
> > command on the host" to generate a jffs2 image.
> > 	./mkfs.jffs2 -p 0x3800000 -s 0x200 -e 0x4000 -r rootfs -o img -l
> > Then on the target I do
> > 	flash_eraseall -j /dev/mtd
>
> Could you try without the -j and see if it fares any better?

Thanks for your suggestion. I tried it. But seems the same...

jffs2: Erase block size too small (16KiB). Using virtual blocks size (32KiB) 
instead
CLEANMARKER node found at 0x00000000 has totlen 0xc != normal 0x0
Empty flash at 0x00003f5c ends at 0x00004000
CLEANMARKER node found at 0x00004000 has totlen 0xc != normal 0x0
CLEANMARKER node found at 0x00008000 has totlen 0xc != normal 0x0
Empty flash at 0x0000bffc ends at 0x0000c000
CLEANMARKER node found at 0x0000c000 has totlen 0xc != normal 0x0
CLEANMARKER node found at 0x00010000 has totlen 0xc != normal 0x0
mtd->read(0x7a50 bytes from 0x105b0) returned ECC error
Empty flash at 0x00013ffc ends at 0x00014000
CLEANMARKER node found at 0x00014000 has totlen 0xc != normal 0x0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000151c8: 0x004f 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000151cc: 0xfbba 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000151d0: 0x00ff 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000151d4: 0x9400 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000151d8: 0xff82 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000153ec: 0x81ed 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000153f0: 0x03e8 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000153f4: 0x69e8 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000153f8: 0x4fd0 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000153fc: 0x4fd0 
instead
Further such events for this erase block will not be printed
...
Inode #265 was a directory with children - removing those too...
Inode #266 was a directory with children - removing those too...
Inode #342 was a directory with children - removing those too...
...
mtd->read(0x118 bytes from 0x1d973c) returned ECC error
jffs2_get_inode_nodes(): Data CRC failed on node at 0x001d96f8: Read 
0x0dbe310a, calculated 0x6853096b
...


--
Bora SAHIN
