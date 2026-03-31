Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F4BFF60F9
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2026 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=moFHKdMaaVCdyAqpPm/OGkOHxVKIokqDWXG5Slq4thU=; b=i3zXd3lvxOEQGd
	Pl9LISNUQCionb5y4X86UOic9HyHZqCAHn3csHyEmWKpJpAhGTV1WsNZoeUdJ064h/Qkuw1bmtM6x
	ivabuZqigdFGjYFKrRRFPbghump5XeY4ocKikXYe8hnx96VuFgejFm2ThAvVzkvwy8q+drsn9HtoI
	5enMbUxnrIX+Qh39tSERhF+824sf+LK2q8SybNrzLhOEi2nqa+2+CmwIxc9zNIP6NautfEUW4Dy7g
	j1sGw2MIlhZ1MX/Skhr2PJPjZ/z+1ufC+BPDX21isAPrzoKDG7XMBQlbRAcvpdOkvXpX8Ad3T4B8p
	SBjS5tz4RZVFh33lWAsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Vng-0000000Ciq1-1AhL;
	Tue, 31 Mar 2026 09:54:20 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Vnd-0000000CipF-0yqU
	for linux-mtd@lists.infradead.org;
	Tue, 31 Mar 2026 09:54:18 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-12732e6a123so560958c88.1
        for <linux-mtd@lists.infradead.org>; Tue, 31 Mar 2026 02:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774950856; x=1775555656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J4NjLkSeK7tOc11RYbBwCiMEr0t3nU9/WnMqnzyoAbk=;
        b=P76+xVLBvR9qj8JL/k92nhHMEhqicba1nzLMbFBqXGlHU4iA9MustBMZdt+Gdt7Vwn
         fKp9bs1DajI5PEa0uID8vt6hiNAJcDIzSD8/5pA+gJ8uBh9cjgY38CndeMhL1JnTdIph
         jzhiAs0nQacwpE0jdojL0A8DAfXB0NaLyUMeYLjL7r017+YwWyvghJxv2rVO+ddcrG7z
         gaHpfnkW3tQGyNo7uAEufZW2WXgAh+6nze9rsJLRpzUixpUS+pvAuEuKXcTNoEfP1sP7
         26Lrk4soMrHLjD/R0VxcH8IHokjDegAGq2VCEzkIlNaNftHyvwFAu83G9JsVadlhoixH
         /WNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774950856; x=1775555656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4NjLkSeK7tOc11RYbBwCiMEr0t3nU9/WnMqnzyoAbk=;
        b=Wkfu54FICeguFbCdyWWMwEuwpUgstlnbQgj3GK6EILYZK3ICUcQVQ7WoIRE0W6nnuv
         b4ZLdG8Tn5YJjBJ1Z+tHI/faXYvOyB4q7i96WwoOhw7sy5pa3u19g0PibnixkZ/cuPoJ
         ISwmxpGIqAOd3zyJkZ3ERI4NaRD2r74RAKxrXV+qJ3KZK/ITjwAwAOQmQAHRujaGDI/x
         zkjlhQcf+Ig/ZE2ymRBezKPr9NYv7UAMREPfr4bRmdpD1ZtG/vSn9MwqbFrt+LmA+NuY
         k3tPh79kmYRD64a5HrMYenjLfCuEcoovQcl/YptNRc5ZtN7eEcFh+GO9K+fX5n0O3m47
         F9EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFh7tAKzKcCZ3MP+LSKM9zuVv/AMY0BGlQDujvOQdHmCNTzhRYMftQjKLxwhqKLB8KS8tZ9yOj1PM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3/QUmLzo9xXGVx651ZsHOsur70YdedwZS9CoXMBgsPQ3k9Svh
	IAv7Uw5jinmapTWPxDlLP2l/GYkK47/yRjSp0dXItVs2aG8dFswXB0QL
X-Gm-Gg: ATEYQzyi6+8QJl3X2cnNeqNrvPcueQjPaB01uTIGiLgDyF9DV2Dawy9Zhq4aCt2CQJS
	RS3W2lXdned8eHgMe5FRP+C9BeV0KlCIIWM3BxCRT7geLRssFhCe6MUunkwfc2bi3exvz/K7x9l
	0MRzcrjySiFmS1GalSsIkzWWYtw5zWinBURnNTgcNbEQM3qIV360Bah7arII0n3IKaapn/yNVGz
	sFlVx0I82zNJ7jqrnLUUIf4Ih5x6uqBIWq4mAnJ9vAR3nM9VzgE41xj1RfETUyBUKTCLGSsalsJ
	SY4/3gRY5PdDF0GBsOtEXCxWwZJZyfrIh27GJ5wBWZ7UEtQQgnJIWFAA3QbTPV34mNCvtZ7jcp+
	O4J72zaqAGm5H+AnFm1zT5gNk20vhdfJ9/nOhe+RwKu1qNTks9Y/SRH4YiDSqBIC5RQ17SbPRYr
	SOtRgD9vAgOn8B43VsqyOxJ3SlAug1uZP6tU+qJMUwokpPajKPLKkaazT022tPRA==
X-Received: by 2002:a05:7022:6182:b0:124:9e46:82d6 with SMTP id a92af1059eb24-12ab291277bmr8619579c88.25.1774950856245;
        Tue, 31 Mar 2026 02:54:16 -0700 (PDT)
Received: from ZC-202510311500 ([123.139.39.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c747e410sm9668962eec.25.2026.03.31.02.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:54:15 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoyu Lu <hechushiguitu666@gmail.com>
Subject: [PATCH v3] mtd: spi-nor: micron-st: Enable die erase support for MT35XU02GCBA
Date: Tue, 31 Mar 2026 17:53:51 +0800
Message-ID: <20260331095354.1861-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_025417_279300_2D816AEE 
X-CRM114-Status: GOOD (  15.12  )
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

The MT35XU02GCBA flash device does not support chip erase according
to its datasheet, but supports die erase. The existing code had a TODO
comment noting that the SPI_NOR_IO_MODE_EN_VOLATILE flag probably needs
to be enabled and the driver implementation needs to be converted to
use die erase.

This patch enables the SPI_NOR_IO_MODE_EN_VOLATILE flag and adds the
mt35_two_die_fixups to the MT35XU02GCBA entry, which includes the
micron_st_nor_two_die_late_init() function that sets up die erase
support.

With these changes, the flash device can properly use die erase
operations instead of chip erase.

Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
---
v3: Squash v1 and v2 into a single patch based on spi-nor/next as requested
v2: Remove TODO comment and rename mt35xu01gbba_fixups to mt35_two_die_fixups per review.

 drivers/mtd/spi-nor/micron-st.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 88033384a71e..c22d62545391 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -188,7 +188,7 @@ static const struct spi_nor_fixups mt35xu512aba_fixups = {
 	.post_sfdp = mt35xu512aba_post_sfdp_fixup,
 };

-static const struct spi_nor_fixups mt35xu01gbba_fixups = {
+static const struct spi_nor_fixups mt35_two_die_fixups = {
 	.post_sfdp = mt35xu512aba_post_sfdp_fixup,
 	.late_init = micron_st_nor_two_die_late_init,
 };
@@ -205,7 +205,7 @@ static const struct flash_info micron_nor_parts[] = {
 		.id = SNOR_ID(0x2c, 0x5b, 0x1b),
 		.mfr_flags = USE_FSR,
 		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
-		.fixups = &mt35xu01gbba_fixups,
+		.fixups = &mt35_two_die_fixups,
 	}, {
 		/*
 		 * The MT35XU02GCBA flash device does not support chip erase,
@@ -215,7 +215,6 @@ static const struct flash_info micron_nor_parts[] = {
 		 * MT35XU01GBBA, the SPI_NOR_IO_MODE_EN_VOLATILE flag probably
 		 * needs to be enabled.
 		 *
-		 * TODO: Fix these and test on real hardware.
 		 */
 		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
 		.name = "mt35xu02g",
@@ -223,7 +223,8 @@ static const struct flash_info micron_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ,
 		.mfr_flags = USE_FSR,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+		.fixups = &mt35_two_die_fixups,
 	},
 };

--
2.53.0.windows.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
