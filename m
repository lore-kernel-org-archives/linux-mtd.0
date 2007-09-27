Received: from mtagate6.de.ibm.com ([195.212.29.155])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IaxZ6-0007xm-Jd
	for linux-mtd@lists.infradead.org; Thu, 27 Sep 2007 18:54:25 +0100
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate6.de.ibm.com (8.13.8/8.13.8) with ESMTP id l8RHqbII531034
	for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2007 17:52:37 GMT
Received: from d12av04.megacenter.de.ibm.com (d12av04.megacenter.de.ibm.com
	[9.149.165.229])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.5) with
	ESMTP id l8RHqbIL2297872
	for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2007 19:52:37 +0200
Received: from d12av04.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av04.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l8RHqbPd012133
	for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2007 19:52:37 +0200
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: Artem <dedekind@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/4 try2] ubi-utils: migrate to new libubi
Date: Thu, 27 Sep 2007 19:52:06 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200709271952.06870.alexs@linux.vnet.ibm.com>
Cc: Frank Haverkamp <haver@linux.vnet.ibm.com>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patchset migrates the remaining tools (pddcustomize, ubimirror and
pfiflash) to the new libubi.

Changes since try1: I have discarded the libubi_common files, device
paths are now integrated in every utility.

I've tested the new version with the scripts in ubi-utils/scripts/ubi_*
and everything works fine.

 mtd-utils.orig/ubi-utils/inc/libubiold.h       |  310 ----------
 mtd-utils.orig/ubi-utils/src/libubiold.c       |  768 -------------------------
 mtd-utils.orig/ubi-utils/src/libubiold_int.h   |  119 ---
 mtd-utils.orig/ubi-utils/src/libubiold_sysfs.c |  232 -------
 mtd-utils.orig/ubi-utils/src/libubiold_sysfs.h |  109 ---
 ubi-utils/Makefile                             |    6
 ubi-utils/src/libpfiflash.c                    |  141 +++-
 ubi-utils/src/libubimirror.c                   |   51 +
 ubi-utils/src/pddcustomize.c                   |   47 -
 ubi-utils/src/pfiflash.c                       |    3
 ubi-utils/src/ubimirror.c                      |    3
 11 files changed, 171 insertions(+), 1618 deletions(-)

Kind regards,
Alexander Schmidt
