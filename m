Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962CCC19F29
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Aug 2022 06:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Kc0G286hiaRTxOEDSsHV6kdrr4AFA8SDJ50y8bIJ/U=; b=f/2ShFVp3g1mi6
	Oclt80amVeO5PSRe4ggKR+jjSogig4tkQO06SbU/V26Pak5iqBS/YZX9ULCBj9XnNqLSDLd1pKllN
	nTV34TBLLu1L7fIQ1ihCDB7W0dRP3Bw0YSwG4m7EPXauD3ahk9DGJvldjUFAFJ57Q9Gvb0r+hdIQk
	Gm5Uqebm23FoidlAJG1uS2PMasXcSCzi9U0Gfzsq3SeXNRmxXD/WKBXa0DGTC4bgXpHYANVuQ1pfL
	ew3HJTbtZXJvZdsE3EEAFsX8xh976nbUUT+Ak4wcofkVCLKn06X5ho7MBZExmR1HyIPrJT4QGiwRe
	hsRD4JrqtPVGNs38m6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPc-004nli-EB; Sat, 06 Aug 2022 06:35:52 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKDPP-004nU8-Rc
	for linux-mtd@lists.infradead.org; Sat, 06 Aug 2022 06:35:41 +0000
Received: by mail-pf1-x42f.google.com with SMTP id 130so3924299pfv.13
        for <linux-mtd@lists.infradead.org>; Fri, 05 Aug 2022 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=EdUwMue/HhfQRgMkv4B4ZnI3CQjm9NVBz5Ikr7kvDaA=;
        b=DjmoJF4ZPI1ZdATED76+PYZqH7aMPzflakGAtUPq62bXNtXycBWTE0gSjSFVtIQKvI
         6v4g229VmOITlRrLEFCOz+R+bbCNa2z7wnRgGOYWK/wyseUOhW+ASF63dtzjXLniKSAd
         QmjukL4OIM4gbyDBa47DDe/Dm3QNeqw80jHK8NN7TsvaYtPm4RqIRipj08neASFkICol
         Ra1JGvkSm8bMQH/4RjRG1TZ/W1xrVUuF6QzkEu32mR+XMO8ttx3wlTXOiJey0KkKDIMG
         TwpTuR1GC65Sq8IsQs5Zedyk6Xy7SzPKopBcyRt8kVTn8DLIUiCO2bEwDMWnqdAl7Mop
         pdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=EdUwMue/HhfQRgMkv4B4ZnI3CQjm9NVBz5Ikr7kvDaA=;
        b=E93BC+LV96P0z5sq+Wep6tJQBDyZHeFr+KFiNlZ9QuM4yvzOhMnwXMSdAcVTqeKMhn
         EWQ7MqbX1OfF6x0j7UFTWrQk9ueK5msWUfsId7zVm5VSzemB0F6CWkBTI+0YRiYfqjai
         8fNvWtjltCSPqY5gd2z1ISRSaM6ibQepoDtBMhgUCzHu9Hgk7BACEdMU8CgcNNEeAioT
         v1dtkqIkHpkjPcNPK8bbui4SEhoJT/PWQJMukitC2bzJYIzRm186HrOmnoiKAMasfxFG
         sthGm5tGlP6aagULYxDKQDYvr2/0VHeljNCgTz9V89JZ1/o0HVaZFfI57xWXK512mNbA
         z0hA==
X-Gm-Message-State: ACgBeo3og7Dc5puCHjr5RjFIt37HAfFHrUvELOSfgToeTriyvfxG3oVq
	wzDW/gsWHWe0eS0069VW1RfEb0F43MyqJw==
X-Google-Smtp-Source: AA6agR6LrXwQwB7ANvxJmwDxbvpxq6+6b759DT/WutukkbDX+AGL34I6uZUBNBAouqoqFkqQ94KOlA==
X-Received: by 2002:a62:1687:0:b0:50d:3364:46d4 with SMTP id 129-20020a621687000000b0050d336446d4mr10207635pfw.74.1659767738428;
        Fri, 05 Aug 2022 23:35:38 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id a18-20020a63e852000000b0041b67615584sm2418452pgk.68.2022.08.05.23.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 23:35:38 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 7/8] mtd: spi-nor: spansion: Introduce DEF_4BAM mfr flag
Date: Sat,  6 Aug 2022 15:34:25 +0900
Message-Id: <6cbf3bc0e8908d6e907bd8c705ce9376765837ba.1659764848.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
References: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_233539_915342_3EBC6AD4 
X-CRM114-Status: GOOD (  12.04  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

The params->addr_mode_nbytes is set to 3 during BFPT parse in case of
BFPT_DWORD1_ADDRESS_BYTES_3_OR_4. Infineon SEMPER multi-chip devices are
in 4-byte address mode by factory default. A new manufacturer flag,
DEF_4BAM is introduced for such devices to fix the
params->addr_mode_nbytes to 4 in post_bfpt_fixup().

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index fc9cc3484aa3..22b0be5d312b 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -10,6 +10,7 @@
 
 /* flash_info mfr_flag. Used to clear sticky prorietary SR bits. */
 #define USE_CLSR	BIT(0)
+#define DEF_4BAM	BIT(1)	/* 4-byte address mode by default */
 
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
@@ -581,6 +582,17 @@ static int spansion_nor_sr_ready_and_clear(struct spi_nor *nor)
 	return !(nor->bouncebuf[0] & SR_WIP);
 }
 
+static int
+spansion_post_bfpt_fixup(struct spi_nor *nor,
+			 const struct sfdp_parameter_header *bfpt_header,
+			 const struct sfdp_bfpt *bfpt)
+{
+	if (nor->info->mfr_flags & DEF_4BAM)
+		nor->params->addr_mode_nbytes = 4;
+
+	return 0;
+}
+
 static void spansion_nor_late_init(struct spi_nor *nor)
 {
 	if (nor->params->size > SZ_16M) {
@@ -595,6 +607,7 @@ static void spansion_nor_late_init(struct spi_nor *nor)
 }
 
 static const struct spi_nor_fixups spansion_nor_fixups = {
+	.post_bfpt = spansion_post_bfpt_fixup,
 	.late_init = spansion_nor_late_init,
 };
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
