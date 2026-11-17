Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118E0606A89D
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 09:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uFNtyoT1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ueAEB2tx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JK7SukmtOH0OFCehrU4sha8swigb/HMGNSVc2j90eVE=; b=uFNtyoT1riuiBjhQD7QFNui0D+
	Jjb9IvYvoLOIkOfpJrZMmZ8S//j58UaZN425qVlMk+xC+0mD69T4ghK5e36yUimjrb2quDtUVJzk1
	3CzK9QE+RYq94KiQwtT37ZdW3ufpTACTbdQzSHIccXQG+mnd3XXQEXoQ8z0AqFCITsnwqUFL5qt4p
	5vATMqRGi6PhZFAl9O3DLk7vdSuMcN4sLj/DFbzxz5C9r6rBEAW587PYX853qF86qdim7CfnAt3+X
	nI1pU2pA4zFa8OhS+L6rq4eCYMUm7X1SeBGQlL2GsWEaSckIcv0jiVgWXJeBhGeoDxVNwi0Sk5Onv
	wjG8KgTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdp-000000056z4-23Mu;
	Tue, 17 Nov 2026 09:38:17 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdl-000000056qP-1S4x
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 09:38:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E75E1C4EDB9;
	Tue, 17 Nov 2026 09:38:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99DED5FC81;
	Tue, 17 Nov 2026 09:38:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1626611BC0B8F;
	Tue, 17 Nov 2026 10:38:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908291; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=U2zcWgafVMtElah9OWy/kylKC33TgfREtsEF6Thc7FA=;
	b=ueAEB2txuOpQc6hJtPTYIDJytq+WC/AKQ6UL6eZNHAv35k1fmV9ANNahZT/Ec+aWIA7x60
	uk2/NLXmVdFlL80/hd1/SYRQ50ibwIuIaZW/DLxXixmst6ZOolMLLSWHwavm8ic1OqWxwp
	5iNbulW38qARIxWBF/GV28LuR727OJkso60gAJ3FLmKBLqCq6V9s1vSqfG7tgdqQ9c95YH
	dGzpyAe45MgrsY7BqrxpPBhpZyAx6BLqqMeju3ko5NUqUFovdH0lJR5b0tSvDE0+PMfUkj
	+mEis+LemMM0w+W9U4PoiaVCMtfnj0B29tLyeuffQ1feYLFtuKHNi6rDyboLVg==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 05/12] mtd: maps: pxa2xx: Remove #ifdef guards around shutdown callback
Date: Tue, 17 Nov 2026 10:37:43 +0100
Message-ID: <20261117093751.14988-6-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013813_573144_8EA43719 
X-CRM114-Status: GOOD (  10.72  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pxa2xx_flash_shutdown() calls mtd_suspend() and mtd_resume().

Unlike what their names suggest, those two functions aren't related to
CONFIG_PM, and neither is the platform_driver.shutdown() callback.

Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

v2: Don't use pm_ptr(), and rewrite commit message
---
 drivers/mtd/maps/pxa2xx-flash.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index bc303a9909d4..5846e09cea37 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -111,7 +111,6 @@ static void pxa2xx_flash_remove(struct platform_device *dev)
 	kfree(info);
 }
 
-#ifdef CONFIG_PM
 static void pxa2xx_flash_shutdown(struct platform_device *dev)
 {
 	struct pxa2xx_flash_info *info = platform_get_drvdata(dev);
@@ -119,9 +118,6 @@ static void pxa2xx_flash_shutdown(struct platform_device *dev)
 	if (info && mtd_suspend(info->mtd) == 0)
 		mtd_resume(info->mtd);
 }
-#else
-#define pxa2xx_flash_shutdown NULL
-#endif
 
 static struct platform_driver pxa2xx_flash_driver = {
 	.driver = {
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
