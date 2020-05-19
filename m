Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DCBC433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 13:16:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BBE9206D4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 13:16:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BCD5j2rx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BBE9206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iBkG46ERRO3CUn3b9rxlPiJ9qb4SzhRT9VqepKVahPE=; b=BCD5j2rxwmkO8b
	pAOMoeDLhM3QX/k9wQvT+Nba7Qp/hEPmVeZfSOAWa0VmZE7wL96oN3GsV9w2mcAQ4guUQeBeY9y7a
	oJqJLk7dxWjuhNBgZ8lnFKGXb5858g15vTN0k8KVBPpe7bQ7vNyAxWkrqN3AkJPOSXv1vokMVQ3Ph
	H0t6w3xTfUY1FN9JlUNXtQZI6wT7qqqww59ZuALvao+bO2k7SkZ1ZybKN2GBrffZ705ybm6rVT5uO
	MXeDwxy9WSknPooqjeBMaxBUckGFShMtpvBMvCq2vaOpibhpXMNmZXv8pBrKKfXkDjhwuJwO4VyfQ
	z7SbwUQixALzHmyK5T8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb26x-0006Ld-Fq; Tue, 19 May 2020 13:16:47 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb1rw-0002FH-SV
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 13:01:21 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8B7BCFF82A;
 Tue, 19 May 2020 13:01:14 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 62/62] mtd: rawnand: Stop using nand_release()
Date: Tue, 19 May 2020 15:00:35 +0200
Message-Id: <20200519130035.1883-63-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519130035.1883-1-miquel.raynal@bootlin.com>
References: <20200519130035.1883-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_060117_177225_B7631763 
X-CRM114-Status: GOOD (  11.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jonathan Corbet <corbet@lwn.net>, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This helper is not very useful and very often people get confused:
they use nand_release() instead of nand_cleanup().

Now that all drivers have been converted to do not use nand_release()
anymore, let's remove this helper.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/driver-api/mtdnand.rst |  6 ++++--
 drivers/mtd/nand/raw/nand_base.c     | 12 ------------
 include/linux/mtd/bbm.h              |  2 +-
 include/linux/mtd/rawnand.h          |  2 --
 4 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/Documentation/driver-api/mtdnand.rst b/Documentation/driver-api/mtdnand.rst
index 55447659b81f..0bf8d6ec3f54 100644
--- a/Documentation/driver-api/mtdnand.rst
+++ b/Documentation/driver-api/mtdnand.rst
@@ -276,8 +276,10 @@ unregisters the partitions in the MTD layer.
     #ifdef MODULE
     static void __exit board_cleanup (void)
     {
-        /* Release resources, unregister device */
-        nand_release (mtd_to_nand(board_mtd));
+        /* Unregister device */
+        WARN_ON(mtd_device_unregister(board_mtd));
+        /* Release resources */
+        nand_cleanup(mtd_to_nand(board_mtd));
 
         /* unmap physical address */
         iounmap(baseaddr);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 14387b967e8b..5d8d7c145774 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -6169,18 +6169,6 @@ void nand_cleanup(struct nand_chip *chip)
 
 EXPORT_SYMBOL_GPL(nand_cleanup);
 
-/**
- * nand_release - [NAND Interface] Unregister the MTD device and free resources
- *		  held by the NAND device
- * @chip: NAND chip object
- */
-void nand_release(struct nand_chip *chip)
-{
-	mtd_device_unregister(nand_to_mtd(chip));
-	nand_cleanup(chip);
-}
-EXPORT_SYMBOL_GPL(nand_release);
-
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Steven J. Hill <sjhill@realitydiluted.com>");
 MODULE_AUTHOR("Thomas Gleixner <tglx@linutronix.de>");
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 886e30441c90..d890805f5494 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -98,7 +98,7 @@ struct nand_bbt_descr {
 
 /*
  * Flag set by nand_create_default_bbt_descr(), marking that the nand_bbt_descr
- * was allocated dynamicaly and must be freed in nand_release(). Has no meaning
+ * was allocated dynamicaly and must be freed in nand_cleanup(). Has no meaning
  * in nand_chip.bbt_options.
  */
 #define NAND_BBT_DYNAMICSTRUCT	0x80000000
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 45dd57e2a223..12b1c8d0eea1 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1396,8 +1396,6 @@ void nand_wait_ready(struct nand_chip *chip);
  * sucessful nand_scan().
  */
 void nand_cleanup(struct nand_chip *chip);
-/* Unregister the MTD device and calls nand_cleanup() */
-void nand_release(struct nand_chip *chip);
 
 /*
  * External helper for controller drivers that have to implement the WAITRDY
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
