Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150B0D61010
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 12:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v06fN7Zqa7hNPNJzauedUsw8832LdLNBTpON+TrwsuY=; b=MEwwhFyYQ82dtL
	giO3u3X9Dj8Gn2zBMWTnZuY76uhWDfMwJwXU6EhTi8g/UsAVlRQQT0OzhrAFzjd8e+cjENiNtHoiB
	C7vjhw302YuGRSj/HMsVJP0UcjEBVpy3t5cDvQZN2X0YNs7bqvQkmDdNYvL/pLF6sWZYEX3odmGC/
	YTyLfdiu3xF4YtOGBOQ2j9xRs8TJb8rmlUbB3afRsLNHzkEmom537qayGmsTyNNmXzasLBDLYNl04
	d0ksznFHhcuX9+FnDi0g7lEHw/UNPEAC/H1BhoLZsyql5x+PxpoO6ljsvoWGpQFhFXwq3tSAWxcCY
	NVtO7nuZg5C2aEr5K9qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQqX-00000000555-1zpJ;
	Thu, 29 Jan 2026 12:10:01 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQqS-0000000053D-30VF
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 12:09:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 46F044E42318;
	Thu, 29 Jan 2026 12:09:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C92F606B6;
	Thu, 29 Jan 2026 12:09:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DAFCE119A882B;
	Thu, 29 Jan 2026 13:09:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769688594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N/5zFX37gkLq6zQzP//9Uu1etqb4FGSMMBO3Ww7P5LM=;
	b=FBClNdApMgGANmMOaVTusO8jUimByyvt1k6XUcAIfX1A25ChtZ6rXNNfBaZnKp5KTx365m
	3DztWDl1HLEURJA7P9AsYZFksQB7uJ3pSLcMFPDQYBCz6mmpvevihqYXMGUe+8H2w7ofBJ
	wuDfPskhmrZiiWhCJSxaCdpRfZiq86XJlh1Z2BNE81Yf1OZuE8KXccMQ5VlXVI0AxA2J/6
	I4Xvt3WvF8G2smiuXndE7rF7ksR3Zr7+BgMo/SyenZZS7dLZPhjoYa85ZELjZqYOtYelm2
	O1Rhe5ObTqw2LwbKhvn1Ud7AhCf0JZ8eBYRpG3Ot+geXOIudXat6PMkkzywYQw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 29 Jan 2026 13:09:28 +0100
Subject: [PATCH v15 2/3] mtd: Move struct mtd_concat definition to header
 file
MIME-Version: 1.0
Message-Id: <20260129-mtd-virt-concat-v15-2-c56a232efbd2@bootlin.com>
References: <20260129-mtd-virt-concat-v15-0-c56a232efbd2@bootlin.com>
In-Reply-To: <20260129-mtd-virt-concat-v15-0-c56a232efbd2@bootlin.com>
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
X-CRM114-CacheID: sfid-20260129_040956_892967_46E4FD51 
X-CRM114-Status: GOOD (  14.26  )
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
