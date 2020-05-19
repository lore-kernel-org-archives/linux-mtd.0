Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D595C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 10:07:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33507206D4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 10:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jnNaTDv7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqxbbDC0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33507206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hyXjzM/8KFJgpzspwOJP7huKEoogJNNysIo61Uq22+U=; b=jnNaTDv7eDqTruuP0DT5CFzTaS
	k3+omlxbmRXSTkLVYNxj+seUUsn2WaJ1jhMw2cpY1hSnQ5lqAsSDu2QLOVIRTL3+mwu9M9YDUvMLW
	N+p1bbDczTX5mU7nNp4p1g7nNrKXJwH56B2a5FNIu+QDe2xq/BblPqDDmBxqD/jGTGtMlDu1fUwXX
	GUcoozLEgsxMO6GkjLrJI0XUtS9OfrlpCnNg0INMddZY8Q4BrShDGfjdlIpo5vnTG2k4lv30x7RQd
	XKQV0iZLoJmhDFg+0WRKM/66FLRIVjuwCUqWBwZCWb8D3jckdq13e0M+EqAT0uddroSjN4cCqUYRX
	p1+0fS9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaz9F-0001wX-7e; Tue, 19 May 2020 10:06:57 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaz7s-0000np-EB
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 10:05:34 +0000
Received: by mail-wm1-x342.google.com with SMTP id w64so2787377wmg.4
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2020 03:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1GMSJCrVKCMzm4RoTB2snBSGZpkdY3EFXYzNpB+xzY4=;
 b=GqxbbDC0jocpqGUD1GN7Ds69rwrA0JczU3I6iaX/nBBLNBJNsAUS1PVbzwgaW+OnKE
 X8PGEnjA1MJLxPYivD8yWuM+3ZfMQihBgWeNJnWhG1ZgKDh8Anhb8kbuk2ogj1Y0ewwm
 TNfL1N9L7+eFLW3t8ocPvJ9wXhovd4rxVkC1y3Eu5qFw7yStZAsCbct7VIrKeNJGNlwX
 RsjYNu//FmvxdqsJbeJoDa+wgD/1a7ZNyLGqxmaz4cqOQ6Qa4DnB+1NBpD3qgVnSlLpv
 5Lyg1491lLXqp4zpY94LR1S5jwi2usnYE5mdSHhlAhiDbyTbYo/oxa80waqPnH6w0sqj
 Xb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1GMSJCrVKCMzm4RoTB2snBSGZpkdY3EFXYzNpB+xzY4=;
 b=jcRPCLigBWpnTXH1qyDe0CoXrvpJrKapzjGGRNaVx1O7bkbtw3ax2/vkU4lpH5FYoI
 zP96xbyl3cNArJcwF/KmiLXvdduvlcpK5IERC3i7+NRkPUMgvXQSGLjWm+1Mcr8MucSp
 R02Ft+LutQL+vtDejt/m/MC5YSLYxwi3wD00kUWC4Y0c+iz+WRZwGvnahLZP/DTNH640
 EQ0HRoxB6pxPBNFqYRNV36U5ZPdPvhLJYnaol+1t5381CeoToGkzLjOaRk9r7hDoKZa5
 ANfie4Q9f9KV9F26rFTT4gucqkDA8XzIxw23h7SuBwX88KiF2IjRCsJkRF6onhqseE6G
 V+bA==
X-Gm-Message-State: AOAM532bwOzizWUDpmE1K6LYE85JLOjpdlJ8gwOH5KVm92s9lLEycXOf
 9Qs0cFAU9aMjtqaG1EzUhxo=
X-Google-Smtp-Source: ABdhPJySVGHY3Ow4lEdRvcSpfi2x+vjpHrg10Futm+xnWY0KfG5b4LhONXz7f/w5AcQOFUkANOVNuQ==
X-Received: by 2002:a1c:7305:: with SMTP id d5mr4717705wmb.85.1589882730918;
 Tue, 19 May 2020 03:05:30 -0700 (PDT)
Received: from ubuntu-G3.micron.com ([165.225.86.140])
 by smtp.gmail.com with ESMTPSA id b18sm19968008wrn.82.2020.05.19.03.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 03:05:30 -0700 (PDT)
From: Bean Huo <huobean@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 s.hauer@pengutronix.de, boris.brezillon@collabora.com, derosier@gmail.com
Subject: [PATCH v5 5/5] mtd: rawnand: micron: Micron SLC NAND filling block
Date: Tue, 19 May 2020 12:05:07 +0200
Message-Id: <20200519100507.19323-6-huobean@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519100507.19323-1-huobean@gmail.com>
References: <20200519100507.19323-1-huobean@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_030532_588891_D8368D12 
X-CRM114-Status: GOOD (  16.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: huobean@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bean Huo <beanhuo@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Bean Huo <beanhuo@micron.com>

On planar 2D Micron NAND devices when a block erase command is issued,
occasionally even though a block erase operation completes and returns a
pass status, the flash block may not be completely erased. Subsequent
operations to this block on very rare cases can result in subtle failures
or corruption. These extremely rare cases should nevertheless be
considered. These rare occurrences have been observed on partially written
blocks.

To avoid this rare occurrence, we should make sure that at least 15 pages
have been programmed to a block before it is erased. In case we find that
less than 15 pages have been programmed, we will rewrite first 15 pages of
block.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Bean Huo <beanhuo@micron.com>
---
 drivers/mtd/nand/raw/nand_micron.c | 102 +++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index b3485b0995ad..c5fd9e60f46d 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -36,6 +36,9 @@
 #define NAND_ECC_STATUS_1_3_CORRECTED	BIT(4)
 #define NAND_ECC_STATUS_7_8_CORRECTED	(BIT(4) | BIT(3))
 
+#define MICRON_SHALLOW_ERASE_MIN_PAGE 15
+#define MICRON_PAGE_MASK_TRIGGER GENMASK(MICRON_SHALLOW_ERASE_MIN_PAGE, 0)
+
 struct nand_onfi_vendor_micron {
 	u8 two_plane_read;
 	u8 read_cache;
@@ -64,6 +67,7 @@ struct micron_on_die_ecc {
 
 struct micron_nand {
 	struct micron_on_die_ecc ecc;
+	u16 *writtenp;
 };
 
 static int micron_nand_setup_read_retry(struct nand_chip *chip, int retry_mode)
@@ -429,6 +433,93 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 	return MICRON_ON_DIE_SUPPORTED;
 }
 
+static int micron_nand_pre_erase(struct nand_chip *chip, u32 eraseblock)
+{
+	struct micron_nand *micron = nand_get_manufacturer_data(chip);
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	u8 last_page = MICRON_SHALLOW_ERASE_MIN_PAGE - 1;
+	u32 page;
+	u8 *data_buf;
+	int ret, i;
+
+	data_buf = nand_get_data_buf(chip);
+	WARN_ON(!data_buf);
+
+	if (likely(micron->writtenp[eraseblock] & BIT(last_page)))
+		return 0;
+
+	page = eraseblock << (chip->phys_erase_shift - chip->page_shift);
+
+	if (unlikely(micron->writtenp[eraseblock] == 0)) {
+		ret = nand_read_page_raw(chip, data_buf, 1, page + last_page);
+		if (ret)
+			return ret; /* Read error */
+		ret = nand_check_is_erased_page(chip, data_buf, true);
+		if (!ret)
+			return 0;
+	}
+
+	memset(data_buf, 0x00, mtd->writesize);
+
+	for (i = 0; i < MICRON_SHALLOW_ERASE_MIN_PAGE; i++) {
+		ret = nand_write_page_raw(chip, data_buf, false, page + i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int micron_nand_post_erase(struct nand_chip *chip, u32 eraseblock)
+{
+	struct micron_nand *micron = nand_get_manufacturer_data(chip);
+
+	if (!micron)
+		return -EINVAL;
+
+	micron->writtenp[eraseblock] = 0;
+
+	return 0;
+}
+
+static int micron_nand_write_oob(struct nand_chip *chip, loff_t to,
+				 struct mtd_oob_ops *ops)
+{
+	struct micron_nand *micron = nand_get_manufacturer_data(chip);
+	u32 eb_sz = nanddev_eraseblock_size(&chip->base);
+	u32 p_sz = nanddev_page_size(&chip->base);
+	u32 ppeb = nanddev_pages_per_eraseblock(&chip->base);
+	u32 nb_p_tot = ops->len / p_sz;
+	u32 first_eb = DIV_ROUND_DOWN_ULL(to, eb_sz);
+	u32 first_p = DIV_ROUND_UP_ULL(to - (first_eb * eb_sz), p_sz);
+	u32 nb_eb = DIV_ROUND_UP_ULL(first_p + nb_p_tot, ppeb);
+	u32 remaining_p, eb, nb_p;
+	int ret;
+
+	ret = nand_write_oob_nand(chip, to, ops);
+
+	if (ret || ops->len != ops->retlen)
+		return ret;
+
+	/* Mark the last pages of the first erase block to write */
+	nb_p = min(nb_p_tot, ppeb - first_p);
+	micron->writtenp[first_eb] |= GENMASK(first_p + nb_p, 0) &
+					MICRON_PAGE_MASK_TRIGGER;
+	remaining_p = nb_p_tot - nb_p;
+
+	/* Mark all the pages of all "in-the-middle" erase blocks */
+	for (eb = first_eb + 1; eb < first_eb + nb_eb - 1; eb++) {
+		micron->writtenp[eb] |= MICRON_PAGE_MASK_TRIGGER;
+		remaining_p -= ppeb;
+	}
+
+	/* Mark the first pages of the last erase block to write */
+	if (remaining_p)
+		micron->writtenp[eb] |= GENMASK(remaining_p - 1, 0) &
+					MICRON_PAGE_MASK_TRIGGER;
+		return 0;
+}
+
 static int micron_nand_init(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -515,6 +606,17 @@ static int micron_nand_init(struct nand_chip *chip)
 		}
 	}
 
+	if (nand_is_slc(chip)) {
+		micron->writtenp = kcalloc(nanddev_neraseblocks(&chip->base),
+					   sizeof(u16), GFP_KERNEL);
+		if (!micron->writtenp)
+			goto err_free_manuf_data;
+
+		chip->ops.write_oob = micron_nand_write_oob;
+		chip->ops.pre_erase = micron_nand_pre_erase;
+		chip->ops.post_erase = micron_nand_post_erase;
+	}
+
 	return 0;
 
 err_free_manuf_data:
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
