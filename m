Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0004FEB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jul 2023 18:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XLENwJCGZOozZL0YyEQaqLlKd2120IcpTPlCXe/SyQ0=; b=PCIhqfKuKb/gU7
	7LMtumMyQfDDUN8babIQT/xJcu9vnS42FfxcZTvj9aAvHm6kmAupbaAGN3dlZVH041USskyX4Xu6L
	Q089dlTzkDJ0LFSUl0fH+PVmW5kTAkqbi1/G7Mmkq5VYl9Hor2bIfsa5W6jZGz5evfQcleUx+GhDF
	+53M5BLkqofFMY/IUALUwGQUpA6JvsaOvxSvK5M65QHB4jmqb7C1n4DcShW1HeqCTNJlaBHKBZvL3
	7v0DSCxZHtIF2exe6qK8Ee6y6qNoUBflH5vO0ClwSM/76v/JwY85V4keVaszwBNA/zdX5IFEVvjSB
	K5gWaQq5LjqA3QvPefiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKNXT-006xsl-1B;
	Fri, 14 Jul 2023 18:29:11 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKNXQ-006xri-0h
	for linux-mtd@lists.infradead.org;
	Fri, 14 Jul 2023 18:29:09 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b6f0508f54so34176091fa.3
        for <linux-mtd@lists.infradead.org>; Fri, 14 Jul 2023 11:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689359345; x=1691951345;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V8Wt8cMGCqy9CZq6012XBPM2kyz2Mn90yzkk5uGQWyU=;
        b=mvajMGQNG+5AvAaKOl4BVvuCD4zs13l7V8u70iG64R7IMoL+YUkkqskXvWa83uZY/G
         tU2iLxRoo/usmgBwqJQk4hnIuumPHp19LW+BiipO4d1rxi2u/CW7DEk8Yt9q13RhReES
         2p//ZDhe8aHwjamAXl7mWylHty+53enF4TOZDB36PCmCe8ivLlh7OtkCMjTN7rzH+Gbm
         YDFDQWE4OvKL1PwI3DpuPkZDOYfDT9tMiURUd6t+IOFsBp7ANcagPRbr84Wtyp46RDXV
         jtSrCA7MfuO5SyUHaqx/HwpKeFeC69gB1NJpbjhEI6uEEppjTmShQZkt5zvClfZNim9b
         zbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689359345; x=1691951345;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8Wt8cMGCqy9CZq6012XBPM2kyz2Mn90yzkk5uGQWyU=;
        b=fnzOLuZhG/x8pOPwaJ5Nxp1PtbKkCgEnN3vAn2BnYurPLWqpAHEo6H5ArC1bD8Th2n
         asi1gPYBDdJHpim97dGHZzP+ag2dfTjnijaFxXKbU17yTS5oca9o9sC3qpzB5g57zwO9
         TdVwkMLcbjRCuB1G5xJk32U11dX4k1RQ+A/Qckb0WOwxvYk1EQ7gp/idrJXxKk034Pfq
         BoHrZ6C2x1gK/TUZ9TqkOGFtQeNmdMwFqeYcRjLfthjkQZ8WWGF8OfsF4EwKAHd1PShw
         Cen00HjH4+S7KHBbJy+jhzoIRBAYAHG4/u+UvdSd5CwdzvY3HAP24smgqbLHHbfbQN91
         BwXA==
X-Gm-Message-State: ABy/qLYwgK54u4X2xbk8Zcbu14OvIh3eTZw7O5TCL3YFr7MMn/Sklndp
	5hnZ+V7Uboh/dKksoXoMF15OICSWGT9H5NKtvm4=
X-Google-Smtp-Source: APBJJlHCw4a7udF2Olxu1CeYC6D6ejTjPUE0r4lNRWXVSMD4v6zAA/CEHUxPcOzwszw4xt6K9ozOZA==
X-Received: by 2002:a2e:9c93:0:b0:2b6:e536:a2a9 with SMTP id x19-20020a2e9c93000000b002b6e536a2a9mr4728029lji.47.1689359345403;
        Fri, 14 Jul 2023 11:29:05 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f21-20020a2e9e95000000b002b1b92910c8sm2092229ljk.86.2023.07.14.11.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 11:29:05 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Jul 2023 20:29:03 +0200
Subject: [PATCH v3] mtd: spi-nor: Correct flags for Winbond w25q128
MIME-Version: 1.0
Message-Id: <20230714-spi-nor-winbond-w25q128-v3-1-bdb2192f079b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAO6TsWQC/43NTQrCMBCG4auUrI1kJvZHV95DXKRN0g5IUhNJl
 dK7mxZcuBBcvh/MMzOLJpCJ7FTMLJhEkbzLIXcF6wblesNJ52YoUIoagMeRuPOBT+Ra7zSfsLw
 DNlwiqEqgMVjVLF+PwVh6bvLlmnug+PDhtT1KsK4fE3+aCThwWzdWtu0BFXTnGzkV/N6Hnq1ow
 j8hzFApuqMFXTa6+oaWZXkD23C8bggBAAA=
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_112908_278615_3770914A 
X-CRM114-Status: GOOD (  15.36  )
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

The Winbond "w25q128" (actual vendor name W25Q128JV) has
exactly the same flags as the sibling device "w25q128jv".
The devices both require unlocking to enable write access.

The actual product naming between devices vs the Linux
strings in winbond.c:

0xef4018: "w25q128"   W25Q128JV-IM/JM
0xef7018: "w25q128jv" W25Q128JV-IN/IQ/JQ

The latter device, "w25q128jv" supports features named DTQ
and QPI, otherwise it is the same.

Not having the right flags has the annoying side effect
that write access does not work.

After this patch I can write to the flash on the Inteno
XG6846 router.

The flash memory also supports dual and quad SPI modes.
This does not currently manifest, but by turning on SFDP
parsing, the right SPI modes are emitted in
/sys/kernel/debug/spi-nor/spi1.0/capabilities
for this chip, so we also turn on this.

Since we suspect that older chips may be using the same
device ID, we need to keep NO_SFDP_FLAGS(SECT_4K) as these
older chips may not support SFDP.

cat jedec_id
ef4018
cat manufacturer
winbond
cat partname
w25q128
hexdump -v -C sfdp
00000000  53 46 44 50 05 01 00 ff  00 05 01 10 80 00 00 ff
00000010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
00000040  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
00000050  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
00000060  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
00000080  e5 20 f9 ff ff ff ff 07  44 eb 08 6b 08 3b 42 bb
00000090  fe ff ff ff ff ff 00 00  ff ff 40 eb 0c 20 0f 52
000000a0  10 d8 00 00 36 02 a6 00  82 ea 14 c9 e9 63 76 33
000000b0  7a 75 7a 75 f7 a2 d5 5c  19 f7 4d ff e9 30 f8 80

Cc: stable@vger.kernel.org
Suggested-by: Michael Walle <michael@walle.cc>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v3:
- Keep NO_SFDP_FLAGS(SECT_4K) around.
- Update commit message
- Link to v2: https://lore.kernel.org/r/20230712-spi-nor-winbond-w25q128-v2-1-50c9f1d58d6c@linaro.org

Changes in v2:
- Only add the write access flags.
- Use SFDP parsing to properly detect the various
  available SPI modes.
- Link to v1: https://lore.kernel.org/r/20230712-spi-nor-winbond-w25q128-v1-1-f78f3bb42a1c@linaro.org
---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 834d6ba5ce70..8f30a67cd27a 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -121,6 +121,8 @@ static const struct flash_info winbond_nor_parts[] = {
 	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
 		NO_SFDP_FLAGS(SECT_4K) },
 	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
+		PARSE_SFDP
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 		NO_SFDP_FLAGS(SECT_4K) },
 	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)

---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230711-spi-nor-winbond-w25q128-321a602ee267

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
