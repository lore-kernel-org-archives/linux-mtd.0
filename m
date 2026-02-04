Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF7FE83EEF
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Feb 2026 08:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NrTgVLrQs7ijuTEeiTIi+bGBtbxuwM0qxIzpfbda1PY=; b=P0jzHYjcqNqnAu
	4igcHQsNSr6eKZHHibL4qURXTEfDiPHTXQ1A0bKehMC8nxKgxypFTchyCkwXNRnEIpZ/dpPPS8dxt
	IPg2SvmeyjTqkjvRnHl5szs/sYYkgUpc/He3NtYJLZPZBS1ftoU+3dAQqHcmiO8UvG8iDHskBKkUQ
	WHlvcPUuO8HCfR/xUU8G5igqcIhSrfIWQzYaQ1FCpkWkOpMaSlDcyfGIzpIlGjiEBD/HOcAMxKf5a
	o9tDVFpTofEllgTh/K+bunDjpZJop4uXag6hm6QCna5foPZzF2IHhvkdqfhRC12LItwGzhGTds8uU
	qYz5R9EuT6vFZ9zswwZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYJN-000000087Ho-3LAo;
	Wed, 04 Feb 2026 08:32:33 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYJK-000000087Fo-27Z4
	for linux-mtd@lists.infradead.org;
	Wed, 04 Feb 2026 08:32:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8E5D5C24396;
	Wed,  4 Feb 2026 08:32:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F08D560745;
	Wed,  4 Feb 2026 08:32:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23ADA119A88EE;
	Wed,  4 Feb 2026 09:32:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770193948; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IYfYtxqAQMooFvbBZW5NCWAmFPox9AqB9Ege5HL77z0=;
	b=v5ZRduBKWMMRuSKuRspNwIDtb7UudzHiBBXA3eaFDXAdK4Y2CcfMgctUqny75n40aMSI1M
	hzfqWzsO5mkhQVHC2hWmFCONPGAHZUjxKYeCytL6I+yiViC/yn096vy8PmHYbhs2kenbDC
	aFQvcGcJRUmXd67k6sRMol45gQlHx+A7Oirhb02Ie93ydFwcY13aahBd+Yds8WYhFI6Tki
	szVvh9RMDp5ukN4A+9446DDh80FC8fMW32HxgWJfniD3lxSTjFUuZr0hP3ch8hsbeXujuK
	3CNv3Bx9QQ+9SEKopzBdU0h4Fq29HoRd4hDOQR3ZEbqjAyYRnjuBA8fwSDf2zA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 04 Feb 2026 09:32:17 +0100
Subject: [PATCH v17 2/3] mtd: Move struct mtd_concat definition to header
 file
MIME-Version: 1.0
Message-Id: <20260204-mtd-virt-concat-v17-2-5e98239bb55b@bootlin.com>
References: <20260204-mtd-virt-concat-v17-0-5e98239bb55b@bootlin.com>
In-Reply-To: <20260204-mtd-virt-concat-v17-0-5e98239bb55b@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 Michal Simek <monstr@monstr.eu>, 
 Bernhard Frauendienst <kernel@nospam.obeliks.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_003230_691376_C94F2D1C 
X-CRM114-Status: GOOD (  14.15  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>

To enable a more generic approach for concatenating MTD devices,
struct mtd_concat should be accessible beyond the mtdconcat driver.
Therefore, the definition is being moved to a header file.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/mtd/mtdconcat.c    | 12 ------------
 include/linux/mtd/concat.h | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index f56f44aa8625..6f2aaceac669 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -20,18 +20,6 @@
 
 #include <asm/div64.h>
 
-/*
- * Our storage structure:
- * Subdev points to an array of pointers to struct mtd_info objects
- * which is allocated along with this structure
- *
- */
-struct mtd_concat {
-	struct mtd_info mtd;
-	int num_subdev;
-	struct mtd_info **subdev;
-};
-
 /*
  * how to calculate the size required for the above structure,
  * including the pointer array subdev points to:
diff --git a/include/linux/mtd/concat.h b/include/linux/mtd/concat.h
index d6f653e07426..b42d9af87c4e 100644
--- a/include/linux/mtd/concat.h
+++ b/include/linux/mtd/concat.h
@@ -9,6 +9,18 @@
 #define MTD_CONCAT_H
 
 
+/*
+ * Our storage structure:
+ * Subdev points to an array of pointers to struct mtd_info objects
+ * which is allocated along with this structure
+ *
+ */
+struct mtd_concat {
+	struct mtd_info mtd;
+	int num_subdev;
+	struct mtd_info **subdev;
+};
+
 struct mtd_info *mtd_concat_create(
     struct mtd_info *subdev[],  /* subdevices to concatenate */
     int num_devs,               /* number of subdevices      */

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
