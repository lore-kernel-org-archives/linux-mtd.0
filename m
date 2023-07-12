Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2D2EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 21:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8LFDyygBFaej8JWGXUbcMCVZ90/JYdUa59TPHfljFq0=; b=y0vWPcEzs0J28M
	aD9O6bCHJhdgOPPLFYXUpAgb5Gg1KRa3lk+FonuJqskyV9H027n/qSVly0avAn917tti5nGesRedU
	dv623UHoMZol2WVC1uogHNS7W8cHUzD165soNfOPNcCs2oNZmv8sVx/SJ9WSr/Rit++akAYL2oSDU
	AC4Q0I1g3iVjwdX2wZobU8hiBKi2VUqAYTqhVswNIZgE2A/V4TSiqdeV31ieyQr0z8rTMmSJIM28L
	pgqO25D1Einnwg/L5N1SiAKLdU0hZvWaMbbVl0ds+jAq7a/mE68eQoYjHX5JSYxAhpsU88B7h9ouA
	aCy5v35bIoB0XqDuwCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJhs7-001MOH-0J;
	Wed, 12 Jul 2023 21:59:43 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJhs4-001MNs-3B
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 21:59:42 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b6ff1ada5dso121696921fa.2
        for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2023 14:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689199178; x=1691791178;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m1iTMnOkulGAjdkSjr5sFgiGCvdDIMihPf+seTqiI5c=;
        b=Rff9hpVphO8sZK/CozjaHMwduL0CpTp5U5XQB9Rnm3jdGvQka0r4vR/Yf5ZqZ2p2Yi
         mv4rN02TsatpXcOqSLMkuMOU2oAiuHlMG3lqItBELeh7Srw3n/YZYtls5MMMZQO1QZQ3
         ncAzJTQBPULZ/LRj/tGzrVWFswy4U6jDVRhFzTJv7HyRS+kFWjyy+WB2bkeh801FqCFo
         hFzlTd0rld8pYKYv2Vd4IKM/Hm8cBEsChirPT8X+5xNy13HVDyw11V4gWacpf0YJ5cRE
         QUESAWd9BTJOMld8r+TqdAgc0+BQQQZa+6s5Nix5Jj706Z9ef/bZAEgYa9jSd4sY06M+
         cMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689199178; x=1691791178;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1iTMnOkulGAjdkSjr5sFgiGCvdDIMihPf+seTqiI5c=;
        b=kIZtpddph/3bMLgdOiy+7D512pGI+BcRpZcVuDuaZ3HeWg5ivgceukNqiCx0HRTcKI
         IQKJ544ofPOoUJbILwHSN7NSQTSn3uXI9MnQ7XSd3pLfAG02Lp1b7VbvX+JW+xAVWFFd
         W+GLMaJrgvQ3D5Slu4KlDWAgO1Nha9Tbpw1JZyZlE5ht2nq0xddn0gCZhqEq/WkZKigP
         IXmAgKpPASldo/0rQEaZmvjiq6/v4FnqfCcw7EZzzjUVKK6hSr7xRiB6ayumJcF7TSr9
         xbVZ2zxLJLwPEFAzB2qdXjyH+JXd0oIAJRZW9n+pSPinFBXVJd+fYw/apEmGbThkeCJx
         L0Lg==
X-Gm-Message-State: ABy/qLZhSgqF81tXCbMndB7XAJCC3S3ijj48O3/PPPTTSNkNSYWjMvMf
	70sp9u3fFNSTjOl3VJ0S4NTvdA==
X-Google-Smtp-Source: APBJJlG8FT+xJEc2p9cZG8IWyqOA5xyCMotLk1YtyA9AIjuryoJJsKvWqwKRdYjBdbULfBqJaGq4Dw==
X-Received: by 2002:a2e:8ed0:0:b0:2b7:3b6c:a5e4 with SMTP id e16-20020a2e8ed0000000b002b73b6ca5e4mr2754195ljl.38.1689199178232;
        Wed, 12 Jul 2023 14:59:38 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id h17-20020a2e9011000000b002b6c92fa161sm1129656ljg.61.2023.07.12.14.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 14:59:37 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Jul 2023 23:59:36 +0200
Subject: [PATCH v2] mtd: spi-nor: Correct flags for Winbond w25q128
MIME-Version: 1.0
Message-Id: <20230712-spi-nor-winbond-w25q128-v2-1-50c9f1d58d6c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEcir2QC/3WNQQ6CMBBFr0Jm7RhmUCCuvIdhUWCASUyLrQEN6
 d2tJC5dvpf89zcI4lUCXLINvCwa1NkEfMigm4wdBbVPDJxzkVdEGGZF6zyualtne1z5/CCusWA
 yZc4iXFaQ1rOXQV97+dYknjQ8nX/vRwt97a/Jf5sLIeFQ1UPRtic21F3vao13R+dHaGKMH+AlZ
 eS/AAAA
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_145941_026170_3598C7BD 
X-CRM114-Status: GOOD (  14.14  )
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

The Winbond "w25q128" (actual vendor name W25Q128JV)
has exactly the same flags as the sibling device
"w25q128jv". The devices both require unlocking to
enable write access.

The actual product naming between devices vs the
Linux strings in winbond.c:

0xef4018: "w25q128"   W25Q128JV-IM/JM
0xef7018: "w25q128jv" W25Q128JV-IN/IQ/JQ

The latter device, "w25q128jv" supports features
named DTQ and QPI, otherwise it is the same.

Not having the right flags has the annoying side
effect that write access does not work.

After this patch I can write to the flash on the
Inteno XG6846 router.

The flash memory also supports dual and quad SPI
modes. This does not currently manifest, but by
turning on SFDP parsing, the right SPI modes are
emitted in
/sys/kernel/debug/spi-nor/spi1.0/capabilities
for this chip, so we also turn on this.

Cc: stable@vger.kernel.org
Suggested-by: Michael Walle <michael@walle.cc>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Only add the write access flags.
- Use SFDP parsing to properly detect the various
  available SPI modes.
- Link to v1: https://lore.kernel.org/r/20230712-spi-nor-winbond-w25q128-v1-1-f78f3bb42a1c@linaro.org
---
 drivers/mtd/spi-nor/winbond.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 834d6ba5ce70..6c82e525c801 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -121,7 +121,8 @@ static const struct flash_info winbond_nor_parts[] = {
 	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
 		NO_SFDP_FLAGS(SECT_4K) },
 	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K) },
+		PARSE_SFDP
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		.fixups = &w25q256_fixups },

---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230711-spi-nor-winbond-w25q128-321a602ee267

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
