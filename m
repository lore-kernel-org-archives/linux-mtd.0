Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F310CD6E7B
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 08:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cj7UWbMUAvCBy2q1PnUU6F6K7EiLIxNxjnzNPD+g1DI=; b=imHhAnhR9vHDpP
	fqOLEratrR+es/tSKIL0oWIpqBS4cFkSUhfHXw2B6weu/vIBi/fAAnexg5QOTzCQLX2oysmC4OVfc
	+9H/04tOnN/93H0b67tOzc6utWJrZ1FJqB9R08XqpV2IA73Z1ngOnx0IsaqnIF1yCVUrqH744tFrm
	r/8/74ZzgoAxyN/qbtLVVkmr37eDSVGwYC6pV78DnGbta8E9/mW8Fp8sKFu7p4k1dHuAQ1LF6/rfZ
	MOaAXh64XMjqh7N42XIo/X6acQy2siPkIsltgZ9jNjVyY+J/GKkjJBVAYxRHYKEDji+AHK/QQT6K9
	Fw6QLZu27NKxMlcPEkYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQGW-00000000LIS-2ycY;
	Fri, 05 Jun 2026 08:50:56 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQGT-00000000LGz-0PZx
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 08:50:54 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2bf2247e38eso17304835ad.3
        for <linux-mtd@lists.infradead.org>; Fri, 05 Jun 2026 01:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780649452; x=1781254252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YD6JlpZB8VRwRhsmwmWgbgCmQfw1VyOwfiwGdy0zUc4=;
        b=IfwqVrk19+sZOBF57HfKA7ljLKhdbxCIxw7L6EvwBTyLyXSnW1WJXXj5K5pcQI9cpW
         ODC67DowXoSh/Iw0LSVZVucJfRhOkvm+Dn0GIhD34Urq7F5RQAEAHmAAmL4ah1bp5fU+
         +nzK0YOV/rikqOB9dXH+jhzN6fsfaWIj9XYefov88WaVJmLUSLk5OxPpr6wB10sfhjU1
         /ylgUKjCOGWQTCz12GfUwkC9g4YsD3ypcjCw1wL7StMGFyFqzpvj7pnTUXpOZSGdcHwF
         PFg+bVHJm7ctiWM3kITZcZpaoCfIjMhsAT+RSrr2ix+OOEApblTOkKSA1ZZHbRwHl6lp
         cOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780649452; x=1781254252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YD6JlpZB8VRwRhsmwmWgbgCmQfw1VyOwfiwGdy0zUc4=;
        b=KXG+vczy+NDxnaYREl7LFem7XOpHRoqhFqsYWG+SFXsiPz/wLovc7EPVN3c7ZFZfHI
         1Abm8k2idJOVaCKbeToDGEWXpcD/sCdG7VTV5g1PPlMhHlAe8nvUFYRL7GCY+5vMG+kT
         4NDWXYe6ihQX3dJCCdpg29IludLDb9Yh5epeRaXkc8CQ+9hgI2BrYiX+oKTucqjYmvfR
         5TDtjYQPcR/B9zmH49/A6W0W7mkX2KCHl0J76gg6gQrb1WlrihrF4jnaqugtmq+o4jli
         UO6oNRZw2NT0L6MnqdGjlJrM7YWYi67fIh0Q2hTFCMDLqwiedJbD7qmADM4UPOb0utJ2
         sc4g==
X-Gm-Message-State: AOJu0YzmSKhgUtmGSssLQzz8ENp3RAjrSNitmRxQwBOcH2AiKjRdh1A+
	ppuj3aypqA+LPjgvhrsYz5nkT3fdo/C5uCde7E046jdghqUIF3JBhlXS
X-Gm-Gg: Acq92OHm9IO7fCMZb5fqOjauzz0v7mMmwsXWOr3ZTwnKPJTsnXWwY6brJFKMSjZ6ay6
	SddPrzfXGy0qbZCPWuTiLKBT0fXiurVc2GUY4gDp6URCmglWs5QXHqQAn42wAt3xm8pc3uU7PiK
	pocrJiyL9Pq/mYR+x9p2Lt9iyP5DFzwEhzupYYhRi9X0V8A2/AiQ+UdYW0OX7ECeaN8KbGcp6Ca
	L2UyNt9qZ6iISqsSKSNejPpcp1L++SSiTIhAEh/PPiYwp7Av9+GwU2pAmH68xqojLCVWys/cfMH
	FO686xvD1fhm3lPMrk7g2t0CoYhHkcbnty8oHJAwJW9FMMxB1tc0x1jD5oBSvCNH6ke/Jgzro9d
	ATKqSBjQ3n2CsRa3vWFY4fXO6tKC0wla0UHFKnREICQ2WIVGwI4J/xAgVuVTWg6VdM0OLz5d8It
	k8pkBasYYwG/U2WCj98l/6g2mVBWqZgH802qITfaiPrzyjL1r0Eq3NwLlNA/pc7SO+zMQ=
X-Received: by 2002:a17:903:3b8b:b0:2bf:114b:924 with SMTP id d9443c01a7336-2c1e85ca6b6mr28695655ad.34.1780649452121;
        Fri, 05 Jun 2026 01:50:52 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa0236sm86673185ad.33.2026.06.05.01.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 01:50:51 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id AD5854163B72;
	Fri,  5 Jun 2026 16:50:49 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v3 1/2] mtd: spi-nor: Add support for MX25L12833F and MX25L12845G
Date: Fri,  5 Jun 2026 16:48:36 +0800
Message-Id: <20260605084837.1875896-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260605084837.1875896-1-linchengming884@gmail.com>
References: <20260605084837.1875896-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_015053_140788_17C3B272 
X-CRM114-Status: GOOD (  14.13  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Add support for Macronix MX25L12833F and MX25L12845G SPI NOR flashes.
These parts share the same JEDEC ID (0xc2, 0x20, 0x18) as the legacy
MX25L12805D.

The newer flashes support SFDP and 1-4-4 Page Program in 3-byte address
mode, but this 4PP capability is not defined in their SFDP tables.
Conversely, the legacy MX25L12805D lacks SFDP support entirely and does
not support 4PP.

To safely enable 4PP for the newer flashes without breaking the legacy
part, introduce a post_sfdp fixup. Since the legacy MX25L12805D does
not support SFDP, it falls back to static parameters and will never
execute the post_sfdp hook. The newer flashes will successfully parse
the SFDP, trigger the hook, and safely append the SNOR_HWCAPS_PP_1_4_4
capability.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index e97f5cbd9..1adb79832 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -83,6 +83,25 @@ mx25l3255e_late_init_fixups(struct spi_nor *nor)
 	return 0;
 }
 
+static int
+mx25l12805d_4pp3b_post_sfdp_fixups(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	/*
+	 * JEDEC ID 0xc22018 is shared by MX25L12805D (no SFDP, no 4PP) and
+	 * MX25L12833F/MX25L12845G (support SFDP and 4PP in 3-byte mode).
+	 * The legacy 05D lacks SFDP and will not execute this hook. For
+	 * the newer flashes, 3-byte 1-4-4 PP is not defined in SFDP, so
+	 * we safely enable it here.
+	 */
+	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_4_4;
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_4_4],
+				SPINOR_OP_PP_1_4_4, SNOR_PROTO_1_4_4);
+
+	return 0;
+}
+
 static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
@@ -96,6 +115,10 @@ static const struct spi_nor_fixups mx25l3255e_fixups = {
 	.late_init = mx25l3255e_late_init_fixups,
 };
 
+static const struct spi_nor_fixups mx25l12805d_4pp3b_fixups = {
+	.post_sfdp = mx25l12805d_4pp3b_post_sfdp_fixups,
+};
+
 static const struct flash_info macronix_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xc2, 0x20, 0x10),
@@ -130,9 +153,10 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
-		/* MX25L12805D */
+		/* MX25L12805D, MX25L12833F, MX25L12845G */
 		.id = SNOR_ID(0xc2, 0x20, 0x18),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
+		.fixups = &mx25l12805d_4pp3b_fixups,
 	}, {
 		/* MX25L25635E, MX25L25645G */
 		.id = SNOR_ID(0xc2, 0x20, 0x19),
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
