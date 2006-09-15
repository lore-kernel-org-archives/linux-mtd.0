Received: from tonnant.concentric.net ([207.155.248.72]
	helo=tonnant.cnchost.com)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GO360-0002uI-3h
	for linux-mtd@lists.infradead.org; Fri, 15 Sep 2006 03:06:24 +0100
Received: from arvindwin2000 (67.104.37.226.ptr.us.xo.net [67.104.37.226])
	(as arvind@4access-comm.com)
	by tonnant.cnchost.com (ConcentricHost(2.54) Relay) with ESMTP id
	28835112D21 for <linux-mtd@lists.infradead.org>;
	Thu, 14 Sep 2006 21:31:50 -0400 (EDT)
Message-ID: <00fa01c6d866$51306df0$6501a8c0@arvindwin2000>
From: "Arvind Agrawal" <arvind@4access-comm.com>
To: <linux-mtd@lists.infradead.org>
Subject: Nand Read Errors using Jffs2
Date: Thu, 14 Sep 2006 18:28:58 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We are using Micro Nand Flash 256MiB with Arm Linux 2.6.11.7 (which is more
than a year old) .
Time to time , I get mtd->read errors but most of the time data seems to be
O.K. and then will start getting inode errors.
Also the flash started it with just 3 bad blocks and now I have around 12
bad blocks, which means that either they have gone genuinely bad or because
of excessive read errors jffs2 marked them bad ;

# # time cp stage.jffs2 nand4/s14%

mtd->read(0x1044 bytes from 0x2f1c888) returned ECC error
Header CRC failed on REF_PRISTINE node at 0x02f1c888: Read 0x30303030,
calculated 0xa52a526a

# # time cp stage.jffs2 nand4/s10_1

mtd->read(0x1044 bytes from 0x2f0e558) returned ECC error
Unknown node type for REF_PRISTINE node at 0x02f0e558: 0x0000

# time cp stage.jffs2 nand4/s41_7
mtd->read(0x1000 bytes from 0x2f20000) returned ECC error
Newly-erased block contained word 0x30 at offset 0x02f20000
mtd->read(0x1000 bytes from 0x2f20000) returned ECC error
Newly-erased block contained word 0x0 at offset 0x02f20000


I need help to figure out that what may be causing this problem?
Could it be hardware timing related?
Or could point software, either old versions of mtd, jffs2 or the small
driver , we did for Micron NAND?

Any pointers are greatly appreciated.

thanks,
Arvind
