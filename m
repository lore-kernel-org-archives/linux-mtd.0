Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41255C5AC7A
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 10:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6OLuvkIDy5ECs1veF3cH8uajncwtbiEYEKJ3l4aSdA=; b=LFrsrhzfLxzpTm
	xrCThx9Jhf+M8M6Kmj24qEEADGgLW4deh1zSnrLfawNa64l8iRPU93zPjVteA+1l+fBMukkE91w+8
	w3ZaSAHF3edCqmlWnsvJX7CpIbzKBYGQRNisCbWhJ/ugz8bBcwDhlR/eUsPI70jJ4WpKZfOfjVr8f
	o8+bPmf0W2pl68MajC8efj/XkLHoSSPvN3EFzEqzAeoXv0fvpDMxvkPQfDqce9gA/B8fdT3egNp9L
	na3X6JVGr0dYkqgt/cCQCtcc7n00jKdqYUdud6wOL6tmAURoGXx/NCcyQdSm4TDxeCcaDWt8S1Ree
	ybgA0r6PDhg8aCCJRuYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHb9-00000007bmZ-0vOL;
	Fri, 07 Aug 2026 10:14:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHb5-00000007bfl-0FSL
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 10:14:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8FBD24E41135;
	Fri,  7 Aug 2026 10:14:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64E09603F0;
	Fri,  7 Aug 2026 10:14:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2BAB11C37522;
	Fri,  7 Aug 2026 12:14:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786097672; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FGrp6Bc185huOSMuGXBozfzRJivoLn2WUBJcDEKvaW0=;
	b=G8GlrcQpzuy0gDaZ5Cht8x8vwwX6DWmOJeVaViMXmAUC0uJGT6norpucVUd1q0k0EMQwa8
	0uO5o8+HZGNh2u/Dc8kvV9molnxQEC8vW+uO0fTG5VLfoAu6KUKKHx0lDIxcyV74IuQoM6
	9BCTVMG/l1CJ0HsRColyVcVMj+LOP+eSBxtorn8uBy5w3c8pg+6a3z0zNBGKbmysvFTZ/B
	SR8A72hKbVzQNDLdzGpfZR4spEc3SnHPU9TBtjKwscROt6OBkszS0PCIcrzPoVFToMjY9t
	cRy+AiiWEFTSYKJFRW3/55P94Os40iLy9fhkNjROkTqyZ8h3sl+4hq+uPOltLQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 07 Aug 2026 12:13:57 +0200
Subject: [PATCH v2 05/18] mtd: spi-nor: Move the SFDP header structure to a
 C header
MIME-Version: 1.0
Message-Id: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-5-7797642dfc40@bootlin.com>
References: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com>
In-Reply-To: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_031439_251268_605E05F3 
X-CRM114-Status: GOOD (  10.45  )
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

The sfdp_header structure is currently defined in sfdp.c, whereas the
sfdp_parameter_header structure is defined in sfdp.h. In order to ease
the reuse of this structure outside of the sfdp.c file, move this
structure to the sfdp C header (.h).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c | 11 -----------
 drivers/mtd/spi-nor/sfdp.h | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 285ac781fba8..e18bfb7d5dc3 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -34,17 +34,6 @@
 
 #define SFDP_SIGNATURE		0x50444653U
 
-struct sfdp_header {
-	u32		signature; /* Ox50444653U <=> "SFDP" */
-	u8		minor;
-	u8		major;
-	u8		nph; /* 0-base number of parameter headers */
-	u8		unused;
-
-	/* Basic Flash Parameter Table. */
-	struct sfdp_parameter_header	bfpt_header;
-};
-
 /* Fast Read settings. */
 struct sfdp_bfpt_read {
 	/* The Fast Read x-y-z hardware capability in params->hwcaps.mask. */
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index e8ed814c6530..2cbe22246c5e 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -149,4 +149,15 @@ struct sfdp_parameter_header {
 	u8		id_msb;
 };
 
+struct sfdp_header {
+	u32		signature; /* Ox50444653U <=> "SFDP" */
+	u8		minor;
+	u8		major;
+	u8		nph; /* 0-base number of parameter headers */
+	u8		unused;
+
+	/* Basic Flash Parameter Table. */
+	struct sfdp_parameter_header	bfpt_header;
+};
+
 #endif /* __LINUX_MTD_SFDP_H */

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
