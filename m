Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LoDuv-0004ZG-VF
	for linux-mtd@lists.infradead.org; Mon, 30 Mar 2009 09:36:36 +0000
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.81.14.1])
	by krynn.se.axis.com (8.14.3/8.14.3/Debian-5) with ESMTP id
	n2U9XA2D010846
	for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2009 11:33:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by lnxricardw.se.axis.com (8.13.8/8.13.8/Debian-3) with ESMTP id
	n2U9aN1Q029243
	for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2009 11:36:23 +0200
Date: Mon, 30 Mar 2009 11:36:23 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Cleanmarker length change in nandflash
Message-ID: <Pine.LNX.4.64.0903301059340.9213@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Between Linux 2.6.23 and 2.6.24, the size of the jffs2 cleanmarker was=20
changed from 12 to 8 bytes (wbuf.c:OOB_CM_SIZE).

wbuf.c:jffs2_check_oob_empty() uses this constant when it's checking that=
=20
the oob is empty. Thus, if scanning an image written with Linux <=3D 2.6.23=
,=20
in Linux >=3D 2.6.24 it will consider the block as dirty since, there are=
=20
four extra zeros after the 8-byte cleanmarker.

This means that if one has a completely empty jffs2 image, written with=20
Linux <=3D 2.6.23, it will refuse to mount under Linux >=3D 2.6.24 . Mount=
=20
will fail with an I/O error (from scan.c:jffs2_scan_medium()), becuase=20
scan.c:jffs2_scan_eraseblock() will find all blocks dirty, but not one of=
=20
them containing a valid jffs2 node. As soon as there is a single data=20
note, it's not a problem, as it will find the data node and consider the=20
file system valid, ultimately allowing it to be mounted.

This is a problem in a system where there is a partition of the flash with=
=20
potential persistant data that must be maintained over kernel version=20
upgrades. If for some reason this partition is empty, it cannot be mounted=
=20
when going from Linux < 2.6.24 to >=3D 2.6.24 . While it would be possible=
=20
to implement a workaround in userspace when mounting the partition, it=20
seems to me that the underlaying problem should be fixed.

I can work on a patch, but I'd like a brief discussion first. Does jffs2=20
ever use the oob for anything else but cleanmarkers? Why does it matter to=
=20
jffs2 if the whole oob is empty or not? Wouldn't it suffice just to verify=
=20
the main memory array in the block (actually only 4KiB's are scanned=20
anyway), and the fact that a cleanmarker was present in the oob?

I.e. solution #1 would be to omit the call to jffs2_check_oob_empty() in=20
jffs2_scan_eraseblock, and simply set return BLK_STATE_ALLFF, even if the=
=20
oob wasn't empty. This would force the block to be erased later on and the=
=20
cleanmarker rewritten. However, I suspect the call to=20
jffs2_check_oob_empty() is there for a reason.

Solution #2 would be to add another state indicating that the block was=20
considered empty but should be erased anyway, but I thought that was what=
=20
BLK_STATE_ALLFF was for?

The call to jffs2_check_oob_empty() is inside an #ifdef=20
CONFIG_JFFS2_FS_WRITEBUFFER which I don't really understand either.=20
FS_WRITEBUFFER is required for NAND flash which have oobs but I suppose
could be enabled for NOR as well which doesn't.

Any thoughts?

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
