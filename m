Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QSyM-0003XM-RM
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 15:22:38 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id h5CEPeD29635
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jun 2003 17:25:40 +0300 (EEST)
Received: from ifaistos.intranet.gr (ifaistos.intranet.GR [146.124.20.203])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id h5CEPeY29631
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jun 2003 17:25:40 +0300 (EEST)
Received: from intracom.gr (pcrnd46 [146.124.20.92])
	by ifaistos.intranet.gr (8.9.1b+Sun/8.9.1) with ESMTP id RAA29426
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jun 2003 17:19:22 +0300 (EET DST)
Message-ID: <3EE88C84.6020803@intracom.gr>
Date: Thu, 12 Jun 2003 17:21:56 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed;
 boundary="------------030409090403080206090207"
Subject: [PATCH] Trivial fix for Oops on unmount.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------030409090403080206090207
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi

This is a trivial patch which fixes some oopses for me in 2.4.21-rc7 with
MTD compiled in instead of modules.

Regards

Pantelis


--------------030409090403080206090207
Content-Type: text/plain;
 name="oops.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="oops.patch"

--- drivers/mtd/mtd_blkdevs-24.c	Thu Jun 12 15:44:47 2003
+++ drivers-nand/mtd/mtd_blkdevs-24.c	Thu Jun 12 17:21:15 2003
@@ -239,8 +239,10 @@
 		tr->usecount--;
 		dev->usecount--;
 		dev->mtd->usecount--;
+		if (dev->mtd->owner)
 		__MOD_DEC_USE_COUNT(dev->mtd->owner);
 	out_tr:
+		if (tr->owner)
 		__MOD_DEC_USE_COUNT(tr->owner);
 	}
  out:
@@ -279,7 +281,9 @@
 		tr->usecount--;
 		dev->usecount--;
 		dev->mtd->usecount--;
+		if (dev->mtd->owner)
 		__MOD_DEC_USE_COUNT(dev->mtd->owner);
+		if (tr->owner)
 		__MOD_DEC_USE_COUNT(tr->owner);
 	}
 	

--------------030409090403080206090207--
