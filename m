Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117451061B21
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2026 03:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pSHhtagWNp7/Q9joT8TxvsC0M7UgXS8Qjk+WRz1xF5Y=; b=1zbSJNMi5THrE0
	bmRcgzmKOwYmb1aQg3hGWZYZ6vWBijd+D0g58E22AWJYb45i21TiJr+mGu7hS9Mui3RZAjm10XuhY
	9N1pD+rGv7S9rbAVWHvc650+jyeNoRqZueYcXTJ+Jn3e8qTs4qj8+bvQjeMHTChifbUx/2EwloGZC
	ewvT+jfgktln9rmkV4kVNnkjYKXXbDSNaGIHIN1ljbfU325MyH4cIixIJEiB4lGzl3GWMTGOB6N+K
	SWOvgA54htUxhQb5qjpx+uz0Wfk7Dfsf3+UTxMws9D31j/cDMSXZMOuDvhauacUHjITVVG8LvWjuz
	adyjAOA0GDMLym1nj/WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7PRV-0000000CDA2-2c60;
	Tue, 31 Mar 2026 03:07:01 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7PRQ-0000000CD9f-0TWA
	for linux-mtd@lists.infradead.org;
	Tue, 31 Mar 2026 03:06:57 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so4147197eec.1
        for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2026 20:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774926415; x=1775531215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lt98my5dSHED1eT6na4Ue/Vw7/7t0HExMYX7rz50JRc=;
        b=WFevGyObKCF2qfPILD+oQJYftMz18J2tmjtOwdBGqzN8g4gLWydHthSFW1bfyaLGSI
         lYk7oyVbsHDoe8Rmch+FHF5PS4hm5ydIUlKWqQPwCN4DJlWNmQWcdDBgqGTUlHbomJwd
         BKYIyUdgyxkAdhEpSq+3UMFu3mbFQ43O41KmnLBzmhPikmQjjRJ/M8eK4GqVueOgq7kx
         WKV2YFuvX96q74RJraOA3N6GEmkQVo510CgbCxLVuKQ+h8ODt0zNmy8DcColcGSibxl4
         IeGZCHs5WbEsgzhDh09lPrB0IkhKyQe/PNu6MT8s/cpJR1DlXz1mzDgU4/wAGJN+QsFz
         vcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774926415; x=1775531215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lt98my5dSHED1eT6na4Ue/Vw7/7t0HExMYX7rz50JRc=;
        b=CvlFDEdI050Hhlnqw9KyCxRGe3uF6wOIT2OicXwQD2UuzMNNFBe/81z36wKnERxJAQ
         wl/+SFKPnLAq//jiaokbjlAJ6EwZ7fQhqG4ufk7LgeH3a4JXV1hLTGcRWOsLVFrpUTRG
         wkb+IpJu6GDPiWb/UCWZAK6290k1SlCnzwRDRn2gAA4l6ujpms8H7qR2NRKpQJ4JYP9w
         4zPb7T1rTAE1IexkUtXOaEFM8cWUdO/cZX08It/QAC7z919l5O3Vq34c2dNNpIX/92Z3
         3LlxfmBza5eKX9xnbaeA6T0sytqKoGZNSFI5UhYCHpj8LYxy9fI6cOOe7Han0EoSKf7Q
         czSw==
X-Forwarded-Encrypted: i=1; AJvYcCW2xTeVAb4KCWlVCzbNVsua45JayTygcXD7UtL+glchK2PowxIKXPcDokDK/8VtP+dhsBYCBcIGHIg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9OVWdfs4NJtAFxLgcve8M7Virn0Xj7BxYSor5t96C0WXxK55D
	GlbsB67baMvBFVzy3n4hA82YskY3iFN7DK5PKMOwFBFVWGgugNMN81XifR3qZ3cS
X-Gm-Gg: ATEYQzwKrrL7V65JUuihHj8eJ1HklONllHIyGkt0/LKZfOpgZZShjjgixRSiEdtiRBd
	N9ARSZxVdslKvP40DM7nnCrDPtocL5eXFzHTZ4K7v/qKxbfvmsxwjbVoJNLZ/AlPExKw0vDpDAG
	uOnACiLoEHfJMhv3/AiKxTB6IfBr4/xtWkwZwOlTXKdnhg0fgKVKgwK/b8dEp9OargSenx6kvny
	/ePxTZLaW8Rww2THGrDkLKpjzYRK93+2lOfOXcPc5D/y2gw2SR6Dqg/alxoEM5emz9f8w18PQeN
	UQF2aJjsl2ewzLtIIsYJ/B5RMkJCjfp5HPtOM8nYC+fJ2VKTyr66AVaB6FlarOe49dSDRcOWRxl
	OPg5un8Me/I2wm4y5miCisL8OD8Kvk4ygWGI8imVgxC/aCJwXet/EeAxIJxhYj8xlAmBLsFRhkl
	ExfQJ3tdkULcCNVEYaQpVwLW4E+zMF5GiUt9+YDcZ1lOwFyXx6KTo=
X-Received: by 2002:a05:7022:fb05:b0:128:d5bd:3572 with SMTP id a92af1059eb24-12ab28e4a9cmr7462020c88.31.1774926414912;
        Mon, 30 Mar 2026 20:06:54 -0700 (PDT)
Received: from ZC-202510311500 ([123.139.39.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97cb08csm14922301c88.3.2026.03.30.20.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 20:06:54 -0700 (PDT)
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
Subject: [PATCH v2] mtd: spi-nor: micron-st: Enable die erase support for MT35XU02GCBA
Date: Tue, 31 Mar 2026 11:06:42 +0800
Message-ID: <20260331030644.1120-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_200656_155254_396DDDAC 
X-CRM114-Status: GOOD (  14.69  )
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
v2: Remove TODO comment and rename mt35xu01gbba_fixups to mt35_two_die_fixups per review.

 drivers/mtd/spi-nor/micron-st.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 4e8c6ef14697..c22d62545391 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -185,7 +185,7 @@ static const struct spi_nor_fixups mt35xu512aba_fixups = {
 	.post_sfdp = mt35xu512aba_post_sfdp_fixup,
 };
 
-static const struct spi_nor_fixups mt35xu01gbba_fixups = {
+static const struct spi_nor_fixups mt35_two_die_fixups = {
 	.post_sfdp = mt35xu512aba_post_sfdp_fixup,
 	.late_init = micron_st_nor_two_die_late_init,
 };
@@ -202,7 +202,7 @@ static const struct flash_info micron_nor_parts[] = {
 		.id = SNOR_ID(0x2c, 0x5b, 0x1b),
 		.mfr_flags = USE_FSR,
 		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
-		.fixups = &mt35xu01gbba_fixups,
+		.fixups = &mt35_two_die_fixups,
 	}, {
 		/*
 		 * The MT35XU02GCBA flash device does not support chip erase,
@@ -212,7 +212,6 @@ static const struct flash_info micron_nor_parts[] = {
 		 * MT35XU01GBBA, the SPI_NOR_IO_MODE_EN_VOLATILE flag probably
 		 * needs to be enabled.
 		 *
-		 * TODO: Fix these and test on real hardware.
 		 */
 		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
 		.name = "mt35xu02g",
@@ -221,7 +220,7 @@ static const struct flash_info micron_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ,
 		.mfr_flags = USE_FSR,
 		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
-		.fixups = &mt35xu01gbba_fixups,
+		.fixups = &mt35_two_die_fixups,
 	},
 };
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
