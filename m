Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57394C79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FmZw7Tef4hnv5oMHIxBmc547VfKhigxBcvtg8KURvEs=; b=nDmOlPLgbO7bbG
	v+OEmivPjSzSeb3dxDaSF4N0Qtxk8PjeBhDh2iiZSIqI8SRw9AjsTj/Y12W0/7FFGLMwrHxoYcP+w
	k2c3yPBnjcTRgIYsFAlRcEiRd1rkdk0N9eniK/zQp5B6teRwnImutmGCjZElHm6ManJilD3tSAMZN
	H5ORbKogftJy21Ecdx7yX3dl0d8CsVKWzf8fYqp1RwemDx2BpbkUpRk/5M1m97sHq1dPTiku38/sK
	+S4iMsCBojPMcdSyQPa/CgZh8S/8haHyDkjrhVz/2A0Em/+s27Dz6FB3ZUw7v5+UZT1ETaikhx54E
	jZswTdNdq34LMrJI43NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YPy-000000030Pj-2IgO;
	Fri, 04 Sep 2026 18:13:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YPr-000000030BK-1U66;
	Fri, 04 Sep 2026 18:13:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9B28E1A19BE;
	Fri,  4 Sep 2026 18:13:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67C9F6057F;
	Fri,  4 Sep 2026 18:13:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CC9C11C787BD;
	Fri,  4 Sep 2026 20:13:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788545608; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BX6HzhqbTWzSYL12wdwc/dDBHVdUwewc3tbQce5ggU0=;
	b=VHEU8zv0u5soAmlctAMc/ksCtOG3IZ0bVeSJHNEwxhZTdgIcGU4zI+j2+1jZANW4YN7dvW
	tY39bqSK30Dsu0Hs7j2rpJ6iaIRLfiJ2Yi6UWTx1GrecqHzD5+7r7IZplk67n4gui91/Ws
	Xr6sphPI9gFFpocJuLmS8QZcnkvQtlfi7C1LoYwKCTIZZvyOzO4A+ARKEjsRnm92G1CSBh
	ucaz9pkUammEpaVSOO9y0AxauNgQ2aVClQScgO52V8G8S7/zuuPF7C8OGsSMLOumeiElF3
	F2m5g2fTzXzbdy2bu3diYSr5XggmOKcSnoMKsppTFNpS/mvdmfVbqDwlfHwcGA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 20:12:45 +0200
Subject: [PATCH v5 08/25] mtd: spi-nor: Move the SFDP header structure to a
 C header
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-8-2909a45fe4fa@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_111331_593107_F1C6B372 
X-CRM114-Status: GOOD (  10.63  )
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

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c | 11 -----------
 drivers/mtd/spi-nor/sfdp.h | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 823cda6874aa..95f47c0c9317 100644
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
