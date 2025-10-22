Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270BCCCD1AB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 10:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opuWVfTJK1LREoyV3Qa9+goXU+HUsdHaPgM+2/WmRC4=; b=W5g62y8ZnbkHAT
	JdD7iy4M1XIJtMBa/kCsIVEvfgxn0lnPrI826sU+AEBjAHdkH/zzbBXmnuvy7wT5RMTQOhEkNA6Is
	tjxstyw7VVJi71cRykjEipdaR5y9GpfQHodUnpnHPKMSxTbqatFXtDPGcGloRw87+hlVBCuTk2D0g
	TjGn+yQaP6OSrbp9+WKhK64k4IRj84D6p7D6O8YO8tJ9ksWel7d0OkQEcecNXt6rU3mtvCOEDVWWD
	cW+iLfBWQErBNoDrCwhiCTp5VykUyn1m96hWzJ3A7rwcz6tu73XIs3BeRA+RXKMaFxeLK7UTyzlR8
	6RSODEHbv5dZtPnbqqdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVl6-00000002PNd-28Ol;
	Wed, 22 Oct 2025 10:07:56 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVl3-00000002PLF-2H2z
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 10:07:54 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-292322d10feso7285965ad.0
        for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2025 03:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761127673; x=1761732473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Rin+olPBDSpDNBx3ZCCvnc8fn5rgxCNRJAfPjBnGKs=;
        b=CaAVjsAZOaDvFBjOSfcBMs8G4U9XD7YZZo+ZCcx4z+RZ1Jnh4QyZGYnLA1em1V2LDw
         0z0j0FweaQPgIfdMSxYi/fdnumsEWk/kjN4Cj3KtzzMsiNtw6TiXX6UEvPOL+hC0mNgZ
         zBNcJkZVIt9WA0YibBBRfz7WOp/C/ucdQt6YXP32llD2sN+UwPEKMqYSxzTbhKM2oLON
         lA8ME1TQIFDLZHVIA8AsPw28u5R9LqbD8sONSlLQwoavrc7QK97XJzRFIuMayt1TMRnc
         J/o+fwmPO52prNM05gLUm+6uER8/qkvb5nYr5/QAYxQBVGvCI8ZWrL1nWZ3CfbQgvy3Q
         bnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761127673; x=1761732473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Rin+olPBDSpDNBx3ZCCvnc8fn5rgxCNRJAfPjBnGKs=;
        b=aEic1uzXb906ALMmpmtbbyaI+5Y7PAgz4Bdlh/24i4JxznudC8DnZaZkKTxaEDSrJh
         xrhzBnass2ow9a/zkl0EnQ2VRiV6FTCfLLJON2unpVYrW2tj7pO99RBA4yBq5DRdGsQ0
         +1JimX6hzzh1rHBQUr9YzxVOQ7NH5pPRD1MWcJ3zs3SnCrjC7n3K9o+TZarXrjIZPGe2
         DJMcjcvUnHdTaZnQbUtzyGczlHtfAba8bkmm8/Af5vetGa/w1328I0mmr8FnsOwct1dI
         0pmiCvVFBJHgOZ/nVqGxEDSWOEResbRSfomYAcYVoOPP5IZ3yc1FugwyLNLuxnFAUh4I
         nPDA==
X-Gm-Message-State: AOJu0YxOx2wwTqMbLf6OkD6Bk5iD4pFtBLly4+2hPHBH0/v2agh8suxE
	D20aR8tn8NCWqo4SK2KhDf0nBO6lG0GBvsgmRwh6Rdf7A0krtXZPGG3x
X-Gm-Gg: ASbGncv7hBorHnBaUsIaCZ93CCjnu7zJNb0UTACpbF9UDtoX+REg++dVHlazXhKggw/
	JI1nzH46SQkMURPhp03gyTGGyEI/SBJA1CIS3v4XY5Rf/+xaU3jovJEOLfKQ0rg0r5EJJHHlzJH
	nqMtVAH7pgSVauaU2LSAU3qRB7X+xo4c97Kn59H8kU4lNVlFqKZ3TFH2pRjGVti4PRViFTxFhpH
	IfvJiTdJx790iTzx9UhGae4Y0uvThmYqn9nTE95/QzjunbvzvgqaPwM+5Lr9xPljb0H3XE09dR6
	pBFLrPtYtXia7vBWKS5/Z3g/hBAogL0EtblUUEldJE1zthMkwMvW/wVk5LwcJJuW9cW9/vYjc8G
	P3Ji1K2d2ZXH8UBg36nHLQ3Xa7hh08iPiY5xlR+ALjhqK9YNUgBn33JhuVkHd2kfSKSh3QLNBHm
	ymszTPek8Rn4D5Lr0RlSNtbyOaDEwD0ldi1QjnDxdSkMcpHue2/O29drcQZPJ2uCSfygO3ssyLn
	Lz6ZGA=
X-Google-Smtp-Source: AGHT+IEUiygtgTqcwUWRzcMEa52HUa99Ij9lNtSOVruV1mseZ8SjR/ReWp+fLosN/bNvr0EnD8Nfhw==
X-Received: by 2002:a17:902:e5c3:b0:271:9b0e:54c7 with SMTP id d9443c01a7336-2935e03624bmr12703345ad.11.1761127672529;
        Wed, 22 Oct 2025 03:07:52 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fdd10sm133774585ad.83.2025.10.22.03.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 03:07:52 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Date: Wed, 22 Oct 2025 19:07:21 +0900
Subject: [PATCH 2/3] mtd: spi-nor: sfdp: introduce smpt_map_id fixup hook
MIME-Version: 1.0
Message-Id: <20251022-s25fs-s-smpt-fixup-v1-2-ce26d4084b2d@infineon.com>
References: <20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com>
In-Reply-To: <20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, tkuw584924@gmail.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761127659; l=3033;
 i=Takahiro.Kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=BOiQy4dkt6OnjJhuvrMGCPaSRKLELL+BS8cMn1Du9Sg=;
 b=Xv6/MqkpU/YGPwnfT1w6kk7uH7YbY+SaOmwrijqqxPSaYsfx0aw+bu55VD2QXPyeW5K9SbIvL
 7L78EonnLmFD0zAWJeTxbcH9Sg8Qdb6d30Uj46pghfMDe4gR79e0+gr
X-Developer-Key: i=Takahiro.Kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_030753_632580_DB967137 
X-CRM114-Status: GOOD (  17.19  )
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

Some chips have inconsistency in SMPT that derives wrong map ID and
fails to detect correct sector map. Introduce smpt_map_id() into
struct spi_nor_fixups. That is called after map ID detection by SMPT
and chip specific implementation can correct map ID.

Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.h |  3 +++
 drivers/mtd/spi-nor/sfdp.c | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 5ad46d95d09cc9d527f71579a71eed210e726f68..16b382d4f04f207aa26190ed8bdf2d19885f7315 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -411,6 +411,8 @@ struct spi_nor_flash_parameter {
  * @post_bfpt: called after the BFPT table has been parsed
  * @smpt_read_dummy: called during SMPT table is being parsed. Used to fix the
  *                   number of dummy cycles in read register ops.
+ * @smpt_map_id: called after map ID in SMPT table has been determined for the
+ *               case the map ID is wrong and needs to be fixed.
  * @post_sfdp: called after SFDP has been parsed (is also called for SPI NORs
  *             that do not support RDSFDP). Typically used to tweak various
  *             parameters that could not be extracted by other means (i.e.
@@ -429,6 +431,7 @@ struct spi_nor_fixups {
 			 const struct sfdp_parameter_header *bfpt_header,
 			 const struct sfdp_bfpt *bfpt);
 	void (*smpt_read_dummy)(const struct spi_nor *nor, u8 *read_dummy);
+	void (*smpt_map_id)(const struct spi_nor *nor, u8 *map_id);
 	int (*post_sfdp)(struct spi_nor *nor);
 	int (*late_init)(struct spi_nor *nor);
 };
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 9a47dcaca06ae2ad85ac8503658083b1d56d8b96..a8324c2da0acf2953a4a62e2a9f7ed31fcd8b4f2 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -730,6 +730,16 @@ static u8 spi_nor_smpt_read_dummy(const struct spi_nor *nor, const u32 settings)
 	return read_dummy;
 }
 
+static void spi_nor_smpt_map_id_fixups(const struct spi_nor *nor, u8 *map_id)
+{
+	if (nor->manufacturer && nor->manufacturer->fixups &&
+	    nor->manufacturer->fixups->smpt_map_id)
+		nor->manufacturer->fixups->smpt_map_id(nor, map_id);
+
+	if (nor->info->fixups && nor->info->fixups->smpt_map_id)
+		nor->info->fixups->smpt_map_id(nor, map_id);
+}
+
 /**
  * spi_nor_get_map_in_use() - get the configuration map in use
  * @nor:	pointer to a 'struct spi_nor'
@@ -783,6 +793,8 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 		map_id = map_id << 1 | !!(*buf & read_data_mask);
 	}
 
+	spi_nor_smpt_map_id_fixups(nor, &map_id);
+
 	/*
 	 * If command descriptors are provided, they always precede map
 	 * descriptors in the table. There is no need to start the iteration

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
