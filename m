Return-Path: <SRS0=K+kN=OU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315D3C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 16:24:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EED5661139
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 16:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EED5661139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e0sFRzNp/IXDdSTWX99nPyBsaTcS+LVMMsRkVV5909s=; b=uzvFEI2KSfrMif
	xT1ZuGj8lA14TORHceiPdj+s8+1Q6nyKgReAHGEtE+jgFuuZd+PXcrLQLxdEMXo4bpIUPldz4rFFh
	ubBrYKHHLkDGv8jY5PtEXZFJikzau79Kz7hbBqEk2yC6hVtn0i6JE6M5pXckrRRtbvYwU/nLTlCVa
	P5JHZWfsAGgVjlkULsxABef5w7fmIeeF5aeYH9A4jDBAQqnN3l02aGoXjcsdzaIbAv23rEKGLxYzI
	TiMP8Au6ZuV378n9ugc7lGh0JIhY7/8C7q/MTkmZvE8bfOJ3YyTOcSSmG6pkwy08V1PEwXNedomx+
	XoH/O/miTh62VHiBu1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVyr0-00FE78-4S; Thu, 30 Sep 2021 16:24:14 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVyqx-00FE5q-Gk
 for linux-mtd@lists.infradead.org; Thu, 30 Sep 2021 16:24:12 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 r43-20020a05683044ab00b0054716b40005so8005602otv.4
 for <linux-mtd@lists.infradead.org>; Thu, 30 Sep 2021 09:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jaRYUQiOKOkrLqBF5lwhFRj5c/+UwufKN3OBnbmarYU=;
 b=qUARsv5IaOwHl70W+2zgrKIcEfEwuIGuuBCV/bvJgyYu4RyyKzQhUxvQdN7IoYqOz4
 TNUzNdneVFpDCFqj0npJtS4JMgm/NR3U4WdlG0R+ph8egyRLC3Db+KdwgQ4Sj2epuy5n
 b+qudvOhqJK7BzZNRgI22gv7QrZjtc1fGioKWD/AEADDVC42ZNafpwCzBNaQLjKYUwv+
 SIOlG4OPhgoOdRK7+G+fG1oQaGc1OS6CivyYMEZR9zVrS7x9z5tQOYBchc/PWYf9XUGH
 UyXk0BVdfTLTOj/YzyKpm+F0+UhdpFM898VMmT2BuenXPxBJs70r2UjuQbUzmmIP4rxo
 OikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jaRYUQiOKOkrLqBF5lwhFRj5c/+UwufKN3OBnbmarYU=;
 b=aXdEG0DxgGmAw36cxPE4esKd5rbLyGInMX8TlX8wT/xEEQ+wAbECst6LdO73nVqeW2
 OlzmLIuCYWvWZsCq14XvAgNFZG2Pl6T3IkeBAPDzKeQKX7VxYsL/6M+9ZNsZe2EAevsy
 5dmnkbJFt+otyr8Bv2sNJE2XzihmqnKqbc44RE3iI1AL/Vh8MNR+PsLKOZVHTCnGCz7M
 qxUPXFNGIKlPxK2/y8czQbNY7ataeb93wl9OfB/XYMFv7ubGOvt6oS9z7r1XSSFy7309
 JoqBB3T2fcC7mrv072uO+JX7DAXMv7C7cbnxjE3z7htnff2c2Dd38gc9OOkRp6zH97qU
 YrzQ==
X-Gm-Message-State: AOAM53217VotY858RfiIBR2pjoVxtJO8S7N4QFG6tgRt3TIdHoZutaFV
 H2mRtUv4Kc9Hgh7wCTDp80mua0RoWjg=
X-Google-Smtp-Source: ABdhPJxmIOYuaQPQafoRN7ibl2/VYhrltAtXDD/QhHnbmJVW308pVZTPAOHWkuAcQaT6J0KExAykOA==
X-Received: by 2002:a9d:604:: with SMTP id 4mr6132021otn.204.1633019048848;
 Thu, 30 Sep 2021 09:24:08 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id h18sm652833otg.2.2021.09.30.09.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 09:24:08 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH] mtd: rawnand: hynix: Add support for H27UCG8T2ETR-BC MLC NAND
Date: Thu, 30 Sep 2021 11:24:02 -0500
Message-Id: <20210930162402.344-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_092411_593898_2C40F43C 
X-CRM114-Status: GOOD (  15.26  )
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the H27UCG8T2ETR-BC MLC NAND. The NAND is used widely
in the NTC CHIP, is an MLC type NAND, and is 8GB in size. Neither
JEDEC nor ONFI detection identifies it correctly, so the ID is added
to the nand_ids.c file. Additionally, per the datasheet this NAND
appears to use the same paired pages scheme as the Toshiba
TC58TEG5DCLTA00 (dist3), so add support for that to enable use in
SLC emulation mode.

Tested on a NTC CHIP the device is able to write to a ubifs formatted
partition, and then have U-Boot (with proposed patches) boot from a
kernel located on that ubifs formatted partition.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/mtd/nand/raw/nand_hynix.c | 14 ++++++++++++++
 drivers/mtd/nand/raw/nand_ids.c   |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index a9f50c9af109..0d4d4bbfdece 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -686,6 +686,16 @@ h27ucg8t2atrbc_choose_interface_config(struct nand_chip *chip,
 	return nand_choose_best_sdr_timings(chip, iface, NULL);
 }
 
+static int h27ucg8t2etrbc_init(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	chip->options |= NAND_NEED_SCRAMBLING;
+	mtd_set_pairing_scheme(mtd, &dist3_pairing_scheme);
+
+	return 0;
+}
+
 static int hynix_nand_init(struct nand_chip *chip)
 {
 	struct hynix_nand *hynix;
@@ -707,6 +717,10 @@ static int hynix_nand_init(struct nand_chip *chip)
 		chip->ops.choose_interface_config =
 			h27ucg8t2atrbc_choose_interface_config;
 
+	if (!strncmp("H27UCG8T2ETR-BC", chip->parameters.model,
+		     sizeof("H27UCG8T2ETR-BC") - 1))
+		h27ucg8t2etrbc_init(chip);
+
 	ret = hynix_nand_rr_init(chip);
 	if (ret)
 		hynix_nand_cleanup(chip);
diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index b9945791a9d7..6e41902be35f 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -51,6 +51,10 @@ struct nand_flash_dev nand_flash_ids[] = {
 		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
 		  SZ_8K, SZ_8K, SZ_2M, NAND_NEED_SCRAMBLING, 6, 640,
 		  NAND_ECC_INFO(40, SZ_1K) },
+	{"H27UCG8T2ETR-BC 64G 3.3V 8-bit",
+		{ .id = {0xad, 0xde, 0x14, 0xa7, 0x42, 0x4a} },
+		  SZ_16K, SZ_8K, SZ_4M, NAND_NEED_SCRAMBLING, 6, 1664,
+		  NAND_ECC_INFO(40, SZ_1K) },
 	{"TH58NVG2S3HBAI4 4G 3.3V 8-bit",
 		{ .id = {0x98, 0xdc, 0x91, 0x15, 0x76} },
 		  SZ_2K, SZ_512, SZ_128K, 0, 5, 128, NAND_ECC_INFO(8, SZ_512) },
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
