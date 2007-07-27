Received: from mtagate5.de.ibm.com ([195.212.29.154])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IERgd-0005WB-AN
	for linux-mtd@lists.infradead.org; Fri, 27 Jul 2007 16:25:04 +0100
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate5.de.ibm.com (8.13.8/8.13.8) with ESMTP id l6RFOq0D895246
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 15:24:52 GMT
Received: from d12av04.megacenter.de.ibm.com (d12av04.megacenter.de.ibm.com
	[9.149.165.229])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.4) with
	ESMTP id l6RFOi6L2179086
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 17:24:52 +0200
Received: from d12av04.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av04.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l6RFORSc013868
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 17:24:28 +0200
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/5] ubi-utils: migrate to new libubi
Date: Fri, 27 Jul 2007 17:23:38 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200707271723.38987.alexs@linux.vnet.ibm.com>
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
pfiflash) to the new libubi. It also introduces a new libubi_common.c
file which contains some helper functions for the tools.

I've tested the new version with the scripts in ubi-utils/scripts/ubi_*
and everything works fine.

 mtd-utils.orig/ubi-utils/inc/libubiold.h       |  310 ----------
 mtd-utils.orig/ubi-utils/src/libubiold.c       |  768 -------------------------
 mtd-utils.orig/ubi-utils/src/libubiold_int.h   |  119 ---
 mtd-utils.orig/ubi-utils/src/libubiold_sysfs.c |  232 -------
 mtd-utils.orig/ubi-utils/src/libubiold_sysfs.h |  109 ---
 mtd-utils/ubi-utils/src/libubi_common.c        |   93 +++
 mtd-utils/ubi-utils/src/libubi_common.h        |   78 ++
 ubi-utils/Makefile                             |    6
 ubi-utils/src/libpfiflash.c                    |  132 ++--
 ubi-utils/src/libubimirror.c                   |   21
 ubi-utils/src/pddcustomize.c                   |   44 -
 ubi-utils/src/pfiflash.c                       |    3
 ubi-utils/src/ubimirror.c                      |    3
 13 files changed, 306 insertions(+), 1612 deletions(-)

Kind regards,
Alexander Schmidt
