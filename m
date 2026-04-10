Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49475E9905D
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Apr 2026 09:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NhJ5eQvzTckHQJgaThDDKpCSRffB3FJko5nk8qV0Rqg=; b=Zb4bqMiqg07JYY
	NgorcQ+nRKWAwy6X2A2ISeewk2y5tiDPLu0vI6DEH6OyYMMrX/8GXmiMXUV4PON2pJ9RBiPszZUQy
	O1o02GZKkRSv2adP0Ai6zDwp+NySeNRIKOwuVHiKUhM0P5r33kZtIvl3YY9LgH6bRIDJSVkasIkrX
	DFb+kdxRP2zjPbO0/z9KtReIU3A6fJ/4qXjK12M/t6C2dy8RZGJh/vRW2t8T4Z2CtKb5uP98XChyT
	fc155SxE9yDDPgkNR+uCN92F+iSPSeijydKwG/WHGhXzQg1WwBANjHuHN3ReEMBRVUKlnWF/e8gMq
	H2TBzxiGBU1tXyb6kyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7vv-0000000BtLH-16er;
	Fri, 10 Apr 2026 09:13:47 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7vr-0000000BtKt-0Xcx
	for linux-mtd@lists.infradead.org;
	Fri, 10 Apr 2026 09:13:44 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82a893d289bso909165b3a.0
        for <linux-mtd@lists.infradead.org>; Fri, 10 Apr 2026 02:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775812422; x=1776417222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rVJtR//B7KbN9PKryJUy2OetgeJEY6PM0HQrLNzUyAA=;
        b=nq6cUN96TZLztHj3TAoiay7MLC0sJTR9mmdSSRRCGR3dSqRZW7xQhcSe7m2pyVHjXT
         nYlPF2g71zJ2AbLaIReMvY9ypRHlpIGLS6LYTREQVWt4jghs0H2FZKgVyF7otQb/2+NT
         M35crHOuczp5ughQPKF/oJa1dksjHe75j7zSdmsR2d1wt6j6jXKTjrmtWS1YIXGL1AlJ
         cOIgZryTGaNDqHR6Sz2OY0TF3+r/F+vYWDSJpYulyHV9yXWjYEl2BVrT2Vs6gCWEQ+Wp
         ofyjsi/IMy2LGQrv3CZIPIfWUSwPK0XNC+W7gFZfLV9JC6vW6OYnfhZ/4Xcwf1bauov+
         g/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775812422; x=1776417222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVJtR//B7KbN9PKryJUy2OetgeJEY6PM0HQrLNzUyAA=;
        b=ExKxbN8VrRIcZcDjFBSWwuruMoz4QQLzZyQTYhNscg2IjxD7XyHzCckU8gGlgES32W
         oEuUVQCYkhI3Ck6ALQUvEDqT1QmxQWBPxan3sTSyjL6B8cgRpqYM5Z49/+Rj+x7lyKGk
         kgn36/iJ9omZvpvkkdd4+6f42wmsEECDzHaSAJh3UYgtC/9UHwFJfW1Qg3su7xfKUpB1
         X6kMZ/tuz0TPV4FlFdaxg0qpRDb14L35hiNKZTKrBKCsI49m4SVCO7bBr/cKyMxYi6O2
         712ove3Nxtmoemc/ZX7QCOvBkbQk2asN7BTzEdnuJ5yHU/4ODUva9yZya8p5EEhas8pC
         0Yrw==
X-Gm-Message-State: AOJu0YyLq9+xnqYOtjXvQzSPz+KRciKOUse+JTRnt1ae3yfZ/vRYNbVC
	OBn1ZCTBhrWUW35EaI5qMxMvRZ0Qbtum/piqC8Zjb1Bu6kQa6nUJ8+33
X-Gm-Gg: AeBDies8fW2h2yPvaGKrQv+ykEq2fGdUMRO5kdFsrV6DMllhK0iog4afbPXm3AVKKsr
	Qy2zFtR9d+maEKYUynyvRJMPW/owrWz8PrNaE/PmyLSehmnBWg2ra78thzUe5/BtaUm6KBhcpNB
	GA8eFlSHpvejztQoGNH/N8cMO+8T4Ed0gFAXqYG7srYZ+ZaD+Y3f26UtVH+4vbg2tWmNrHXicCk
	iylvdRwHP70XKU9guYrcDkNGIn/ulqANPYUNlNilZe6yUlPZ6wTEWDDtml1fIYKYqWpu0HoJCMd
	uCiO17SaqsT1Y8vBhJ0b3e9RPpIswwLMcxtRdKOaWiN6HN6SWGirc/fYUq0kiIuNLdHhjeEc8V8
	bL8F2p9WhQqhx4cs5e0RbQgS6JZG/5BtgLWi9y/7PNhzRFOuDnOL+pTaH3vmtbnFlzBlzddACxD
	a4NBpLOtvHADxEEsaVFE3U6ptnoeRXDwIwloC10k7PQ976qw==
X-Received: by 2002:a05:6a20:7d86:b0:398:9c94:2033 with SMTP id adf61e73a8af0-39fe3c98717mr2995423637.11.1775812421448;
        Fri, 10 Apr 2026 02:13:41 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c792190845dsm1742499a12.14.2026.04.10.02.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:13:40 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 56E364163B69;
	Fri, 10 Apr 2026 17:13:38 +0800 (CST)
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
Subject: [PATCH] mtd: spi-nor: macronix: Document support for additional flash aliases
Date: Fri, 10 Apr 2026 17:10:39 +0800
Message-Id: <20260410091039.389911-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_021343_187547_8AB27310 
X-CRM114-Status: GOOD (  12.41  )
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

Several Macronix SPI NOR flash devices share the same ID.
For instance, the MX25L51245G and MX25L51273G share the same ID
(0xc2201a) with the currently listed MX66L51235F.

Add these equivalent part numbers to the comments above their
corresponding flash_info entries.

While this change does not affect the functional driver logic, it
significantly improves the searchability of the kernel source tree.
This helps users easily verify that their specific physical part is
fully supported, preventing confusion and deterring redundant patch
submissions that attempt to add duplicate entries for these alias parts.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index e97f5cbd9..c557525b0 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -138,7 +138,7 @@ static const struct flash_info macronix_nor_parts[] = {
 		.id = SNOR_ID(0xc2, 0x20, 0x19),
 		.fixups = &mx25l25635_fixups
 	}, {
-		/* MX66L51235F */
+		/* MX25L51245G, MX25L51273G, MX66L51235F */
 		.id = SNOR_ID(0xc2, 0x20, 0x1a),
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.fixups = &macronix_qpp4b_fixups,
@@ -186,11 +186,11 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
-		/* MX25U51245G */
+		/* MX25U51245G, MX25U51293G */
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
-		/* MX66U1G45G */
+		/* MX66U1G45G, MX66U1G93G */
 		.id = SNOR_ID(0xc2, 0x25, 0x3b),
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
