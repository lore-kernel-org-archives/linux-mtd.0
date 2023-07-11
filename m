Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B70DEB64DC
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jul 2023 22:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fECnjlg5GrkHLnO/PWFNoGFSm2J/CseNVBY5Ryvr+N4=; b=zmZg+IuA467vxB
	NQGrehH/N9dMQIFSVObCd7gLYhVFpwULv6aeqE7Irk1LTnkTBTQPZMmpHsS+SJdnnHJTcU5MYO+Ko
	QVcSgudgCao0YByfTrl3DOZg79MFMdSAQrWryP3/oZAD1hc5T4NwjRBVwNnrQb/UiJE0idgnBlZWX
	IXo1cbdzfE8lFcmnLAH8M620O9O/oGUQBPQoVPJJkqcSGcsHbSfjtXs2XjrLwnw5DTpN8Mc6ekjbS
	V5cw9QMNfQP1i5tTkdGk6gXbVtfDMw9vpcfQJBw3aZguZRoF2UzjoUHNMfs1E1Tg6P2Cpt16+GrME
	5guBhm509fpxNJl/RKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJLRl-00FxRP-38;
	Tue, 11 Jul 2023 22:03:01 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJLRj-00FxQX-1Q
	for linux-mtd@lists.infradead.org;
	Tue, 11 Jul 2023 22:03:00 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fb94b1423eso9480852e87.1
        for <linux-mtd@lists.infradead.org>; Tue, 11 Jul 2023 15:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689112975; x=1691704975;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F0Z+tdeHGTaKzHcow1KpcWdGeQHImw6XYl8ad7qpvIU=;
        b=opoXvky99JLSERxqHP3e7AadJFBDskor1nn3ZdGiII4s5uVUMvgpRKU11dEzEghN/z
         qZDr31SmizAnRmueXaV4Fxasr4IaOihv27cwnrOkpneFtyPX9KuMwVk7dba9GGKMNQ/U
         Brw8S/N5o5pjr/XIE8yJw7Q+IvizmICzRvc+Sf1GoxHbFu0Dn4raiPX9RAHuVugZh5xN
         rshTpQzb4teh6teJTSa9QQ6+RMmj9zWIwMO7f3xVX5coudjLosmIZtqBPRbAXbsbS2KD
         K32HQtein9aaNpVh/0GhTCzZF3d113GHWiprgpyLVE6mBKQZ2kx4wVM3ge1Sj8NA673P
         90Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689112975; x=1691704975;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0Z+tdeHGTaKzHcow1KpcWdGeQHImw6XYl8ad7qpvIU=;
        b=Y784519FrPlxhN0t5lQm6HMNNFIIvlV0sJwK2RZORPiKbAlaZfgvo837bDjrVq++Xp
         KewkgrtbiSehiGBk2AKXqmSGgGu5caZaO/hIHtPxQ4aE+VonQus/psTeY5Twt7DTJpcP
         oQ+AH8WHgmYYp4bezcL6WJcNx/0wl5XstKSoCZoATe+joixuJ3Z/XheqVNLWzjSM2VWa
         v6ZIUcDp2i9cEndOvVvoqgvOcvWG0tZ6DCJNvyqhZCYCxqJOJ4GcfdyFh3jdpgg4yDAL
         /6aBWUDLIGl51P+ezN0zgTYfW5HHAfEl7kpZGBKfLmKms/vlmBBMiMZckmgA9zkpzLQX
         Iwlg==
X-Gm-Message-State: ABy/qLboUWLOQne+1/DLcoZi0JQjDH4RXyFdkWxwIsMdI7Sq094Ops8y
	m8+bitgLSZHKsG9bXKBkTLsJ+A==
X-Google-Smtp-Source: APBJJlGq6zZ3FxteufYERYIQNUpUpceO0dRrygOsbwoKYU5z9QAe2GSlieM91r14nBVCFfBPk6+tRw==
X-Received: by 2002:ac2:4c4b:0:b0:4f8:72fd:ed95 with SMTP id o11-20020ac24c4b000000b004f872fded95mr16316159lfk.22.1689112975359;
        Tue, 11 Jul 2023 15:02:55 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id o1-20020ac24341000000b004eff1163c37sm455369lfl.308.2023.07.11.15.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 15:02:54 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Jul 2023 00:02:53 +0200
Subject: [PATCH] mtd: spi-nor: Correct flags for Winbond w25q128
MIME-Version: 1.0
Message-Id: <20230712-spi-nor-winbond-w25q128-v1-1-f78f3bb42a1c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIzRrWQC/x3MOQqAQAxA0atIagOTiAteRSxcoqbJ6AyoIN7dw
 fIV/z8QJahEaLMHgpwa1VsC5RlM22CroM7JwI4LVxNh3BXNB7zURm8zXlwexA0WTEPlWISrGlK
 9B1n0/s9d/74f6ioqOWkAAAA=
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_150259_487286_8F2FEB4B 
X-CRM114-Status: GOOD (  13.68  )
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

The Winbond W25Q128 (actual vendor name W25Q128JV)
has exactly the same flags as the sibling device
w25q128fw. The devices both require unlocking and
support dual and quad SPI transport.

The actual product naming between devices:

0xef4018: "w25q128"   W25Q128JV-IM/JM
0xef7018: "w25q128fw" W25Q128JV-IN/IQ/JQ

The latter device, "w25q128fw" supports features
named DTQ and QPI, otherwise it is the same.

Not having the right flags has the annoying side
effect that write access does not work.

After this patch I can write to the flash on the
Inteno XG6846 router.

Cc: stable@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/spi-nor/winbond.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 834d6ba5ce70..a67e1d4206f3 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -121,7 +121,9 @@ static const struct flash_info winbond_nor_parts[] = {
 	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
 		NO_SFDP_FLAGS(SECT_4K) },
 	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K) },
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
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
