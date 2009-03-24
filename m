Received: from wbmler4.mail.xerox.com ([13.13.138.219])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmB9P-00060w-Fh
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 18:15:05 +0000
Received: from wbmlir2.mail.xerox.com (wbmlir2.mail.xerox.com [13.131.8.222])
	by wbmler4.mail.xerox.com (8.14.2/8.13.8) with ESMTP id
	n2OIEs98014980
	for <linux-mtd@lists.infradead.org>; Tue, 24 Mar 2009 14:14:54 -0400
Received: from wbmlir2.mail.xerox.com (localhost [127.0.0.1])
	by wbmlir2.mail.xerox.com (8.14.2/8.13.6) with ESMTP id n2OIEhDF022293
	for <linux-mtd@lists.infradead.org>; Tue, 24 Mar 2009 14:14:43 -0400
Received: from hermes.opbu.xerox.com (hermes.opbu.xerox.com [13.62.6.81])
	by wbmlir2.mail.xerox.com (8.14.2/8.13.6) with ESMTP id n2OIEgkG022253
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Tue, 24 Mar 2009 14:14:42 -0400
Received: from pogo.cesa.opbu.xerox.com (ns158-4.cesa.opbu.xerox.com
	[13.253.158.23])
	by hermes.opbu.xerox.com (8.13.8+Sun/8.13.8) with ESMTP id
	n2OIEdL2010036 for <linux-mtd@lists.infradead.org>;
	Tue, 24 Mar 2009 11:14:42 -0700 (PDT)
Received: from cesa.opbu.xerox.com (gto.cesa.opbu.xerox.com [13.62.136.98])
	by pogo.cesa.opbu.xerox.com (8.13.6+Sun/8.13.6) with ESMTP id
	n2OIEdBZ026558 for <linux-mtd@lists.infradead.org>;
	Tue, 24 Mar 2009 11:14:39 -0700 (PDT)
Message-Id: <200903241814.n2OIEdBZ026558@pogo.cesa.opbu.xerox.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] drivers/mtd/chips/cfi_cmdset_0001.c: correct block lock
	timeout
Date: Tue, 24 Mar 2009 11:14:39 -0700
From: Andrew Klossner <andrew@cesa.opbu.xerox.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The time parameters to WAIT_TIMEOUT are in units of microseconds, so
one second must be expressed as 1000000 not 1000000/HZ.

The Intel Strataflash part with which this patch was tested takes 0.7
seconds to lock/unlock, so one second does indeed seem to be a good
timeout value.

Signed-off-by: Andrew Klossner <andrew@cesa.opbu.xerox.com>
---
diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index f5ab6fa..97f3c71 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2041,7 +2041,7 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
 	 * If Instant Individual Block Locking supported then no need
 	 * to delay.
 	 */
-	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000/HZ : 0;
+	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000 : 0;
 
 	ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay * 100);
 	if (ret) {
