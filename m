Received: from mail-px0-f193.google.com ([209.85.216.193])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MdEQP-0007Qc-Ot
	for linux-mtd@lists.infradead.org; Tue, 18 Aug 2009 02:27:54 +0000
Received: by pxi31 with SMTP id 31so1730217pxi.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Aug 2009 19:27:47 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 18 Aug 2009 10:27:46 +0800
Message-ID: <39811fe10908171927g6ef3ec83x4ae3442b32380dc0@mail.gmail.com>
Subject: UBINIZE and UBIFS
From: Jacky Lam <jackylam.gsl@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

	I have a problem of embedding a UBIFS image by ubinize. Here is the
config file I am using:
===============================================================
[rootfs]
mode=ubi
image=rfs.bin
vol_id=0
vol_size=10485760
vol_type=dynamic
vol_name=rootfs

[areatest]
mode=ubi
image=test.bin
vol_id=1
vol_size=15728640
vol_type=dynamic
vol_name=areatest

[areauser]
mode=ubi
image=areauser.bin
vol_id=2
vol_size=47185920
vol_type=dynamic
vol_name=areauser
================================================================================

	areauser.bin is created by:

	mkubifs -v -g 1 -r areauser -o areauser.bin -m 4096 -e 516096 -c 92 -x none

	The final image is created by:

	ubinize -o final.raw.2 -m 4096 -p 512KiB ubinize_all.cfg	


	After burning the raw image to nand flash, everything works fine and
ubifs can be mount successfully. All the files are readable. But after I
unmount the ubifs and want to mount again. The following error is happened:
------------------------------------------------------------------------
...
<Many ECC errors reported>
...
UBI error: ubi_io_read: error -74 while reading 516096 bytes from PEB
55:8192, read 516096 bytes
UBIFS error (pid 42): ubifs_scan: corrupt empty space at LEB 1:4691
UBIFS error (pid 42): ubifs_scanned_corruption: corrupted data at LEB 1:4691
UBIFS error (pid 42): ubifs_scanned_corruption: first 4096 bytes from
LEB 1:4691
UBIFS error (pid 42): ubifs_scan: LEB 1 scanning failed
...
<Many ECC errors reported>
...
UBI error: ubi_io_read: error -74 while reading 516096 bytes from PEB
55:8192, read 516096 bytes
UBIFS error (pid 42): ubifs_recover_master_node: failed to recover
master node
mount: mounting ubi0:areauser on /mnt/areauser failed: Invalid argument

-------------------------------------------------------------------------

	However, if I runtime update the areauser.bin by ubiupdatevol, there is
no such problem.

	I have no cue on this, could anyone give me some suggestion?

	Thanks.

BR,
Jacky
