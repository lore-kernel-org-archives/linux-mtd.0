Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6FEC5B572
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 15:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=031asw1obud+aroqfW3RvHrmIvWrEHrDe5omS1skPjY=; b=UZ54Plbb29T7x7
	HY8lsGffBgbSnz9EWmPHlQvrf1f1WCv45qQCGWYFyneLLCol47jsGvwRZSNh459NRICFYSTbQ/G01
	coElG1symm2tO9Or9Sq7gUgTadQp/pjkWyS7iLgsxS9DV3bBtLcEq+w6e3nGwIXAVXpePt79osMIc
	FrRZ80LgjCCJASCK972fBaEMYlnc6j6jAUH9f0DSpPULCa3qK0M7bL22NS4EAocke+kgCDYtCL3p/
	4uU2PHxWCmsGWFpegk3h21/pbF6eFqzflq9wvm8qiTnJrb5W/HFZwj666UQwe5iG5NLQPdp6QMPmg
	Bi5H+FFrTa4imZctWEfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXE7-00000000xVp-3wvu;
	Thu, 13 Aug 2026 15:20:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXDz-00000000xJi-1uzr;
	Thu, 13 Aug 2026 15:20:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DB9E34E41208;
	Thu, 13 Aug 2026 15:20:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B0116602B8;
	Thu, 13 Aug 2026 15:20:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13EEC11C4E068;
	Thu, 13 Aug 2026 17:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786634400; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qteh83VivTCx6FaEB5GNy+dRpMiPZZQGFPwm5/AXQMw=;
	b=g+VL/uTAffqUiZSMAQt6MBjvUw6cHpQJwNurtXPixdPN/6Z1xGDXzMMHWTV/WKYWKwv2dB
	LhvPd7MdVU79N5l/8zdSDXkQofAIDRphIdfFlqZ5UIrxG8399SAcLkOliTaAbd8extg6S8
	5Qp2R4ExlZuM7o5rybKF0FbQ9IwHgu5CHuhUrTJSXIrLxpqKfwSdWMo3OIzfmZhi98uiZF
	kf14bxe4siLzANhdhup4zDNeHZsPhcLqBWw0Xmj83XTgPLClQqTMwFyHO6W8WcvJu6B2/3
	UpgzWswV46mALvt/RKiJapMSh2OZNYtDAcBz9sN5eCKTBJLoJrhsaO46/nr8OQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 17:19:07 +0200
Subject: [PATCH v3 07/23] mtd: spi-nor: Move the SFDP header structure to a
 C header
MIME-Version: 1.0
Message-Id: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-7-b637cf120d5c@bootlin.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
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
X-CRM114-CacheID: sfid-20260813_082007_840847_8FC4EC4B 
X-CRM114-Status: GOOD (  10.62  )
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
index 39cb8ac3a037..8e39bacddf16 100644
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
