Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZtRD-0006pZ-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 14:22:52 +0100
Message-ID: <01b201c23895$6d771b00$1b0448c0@gv.com.tw>
From: "??" <kevin@gv.com.tw>
To: <linux-mtd@lists.infradead.org>
Cc: <dwmw2@redhat.com>
References: <018001c23892$e85bb4a0$1b0448c0@gv.com.tw>
Subject: jffs2 mounting problem
Date: Wed, 31 Jul 2002 21:23:15 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
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

   dear all,
   thanks for your help,

  now i try to:

 1> eraseall /dev/mtd1
 2> cp test.img /dev/mtdblock1

      test.img is created from:
     mkfs.jffs2 -r rootfs_jffs2 -e 16K -l -o test.img
     nand device is TC58128FT (16MBytes Nand flash)
      (should i use "nandwrite" instead of "cp" here?)

 3> mount -t jffs2 /dev/mtdblock1 /mnt

  then it still report many "magic bitmask not found"
   do i missing something?
   or is it caused by bad-block/ecc-error?

   thanks in advanced!:)

   best regards,
   kevin

> >  ----following message
> > > log------------------------------------------------------
> > > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00298014:
> > > 0xa3dc in
> > > stead
> > > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00298018:
> > > 0xccfe in
> > > stead
> > > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0029801c:
> > > 0xd1b5 in
> > > stead
> > > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00298020:
> > > 0xf8fd in
> > > stead
> > > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00298024:
> > > 0xb452 in
> > > stead
> > > Further such events for this erase block will not be printed
> > > nand_read_ecc: Failed ECC read, page 0x00007fc0
> > > nand_read_ecc: Failed ECC read, page 0x00007fc0
> > > nand_read_ecc: Failed ECC read, page 0x00007fc1
> > > nand_read_ecc: Failed ECC read, page 0x00007fc1
> > > nand_read_ecc: Failed ECC read, page 0x00007fc2
> > > nand_read_ecc: Failed ECC read, page 0x00007fc2
> > > nand_read_ecc: Failed ECC read, page 0x00007fc3
> > > nand_read_ecc: Failed ECC read, page 0x00007fc3
> > > jffs2_scan_empty(): Read 0x1000 bytes at 0x00df8000 returned -5
> > > mount: wrong fs type, bad option, bad superblock on /dev/mtdblock1,
> > >        or too many mounted file systems
----- following eraseall log -------------------------------
Erasing 16 Kibyte @ dc4000 -- 98 % complete.MTD_ioctl
Erasing 16 Kibyte @ dc8000 -- 98 % complete.MTD_ioctl
Erasing 16 Kibyte @ dcc000 -- 98 % complete.MTD_ioctl
Erasing 16 Kibyte @ dd0000 -- 98 % complete.MTD_ioctl
Erasing 16 Kibyte @ dd4000 -- 98 % complete.MTD_ioctl
Erasing 16 Kibyte @ dd8000 -- 98 % complete.MTD_ioctl
Erasing 16 Kibyte @ ddc000 -- 98 % complete.MTD_ioctl
Erasing 16 Kibyte @ de0000 -- 99 % complete.MTD_ioctl
Erasing 16 Kibyte @ de4000 -- 99 % complete.MTD_ioctl
Erasing 16 Kibyte @ de8000 -- 99 % complete.MTD_ioctl
Erasing 16 Kibyte @ dec000 -- 99 % complete.MTD_ioctl
Erasing 16 Kibyte @ df0000 -- 99 % complete.MTD_ioctl
Erasing 16 Kibyte @ df4000 -- 99 % complete.MTD_ioctl
Erasing 16 Kibyte @ df8000 -- 99 % complete.MTD_ioctl
nand_erase: attempt to erase a bad block at page 0x00007fc0

./eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ dfc000 -- 99 % complete.MTD_ioctl
nand_erase: attempt to erase a bad block at page 0x00007fe0

./eraseall: /dev/mtd1: MTD Erase failure: Input/output error
Erased 14336 Kibyte @ 0 -- 100% complete.
MTD_close
-----------------------end of log ----------------------------
