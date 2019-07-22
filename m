Return-Path: <SRS0=6YPz=VT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F963C76188
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 06:01:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67F8821955
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 06:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hyV7q93c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="txJ5ZWv3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67F8821955
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cP9b5/k5FdilevKzkx38RonOmxZj3ukxDbThkFUbQk=; b=hyV7q93cHPNBe4
	Q1SAHt140nOIsQLO38a9nAa2f7eZ1ox5hrunqrlBXpSxtiGLtMSvUsOe0+KD+z6k06Us1LZ2COyIq
	UqzYvy2rQ8cj4bWPtF8eTuNHDC3VApKLxBmkN7qZwo1kmjpI7hL6U++S/mlq1M1QrP9zCZ3dn319U
	toS9CG5mpzh5qp6z6Twch9XDZai2YgDpOJT5UvPRi6eQ29ubtwpgrAgtHJbyZk+Ov5OeXW3BinLlM
	ouXbm1QLG4xc1ftOYuXr0hIeB3qrKtf8PJ3H2Z3GcyzMh/0B0OtpEt4mEVFvFSZ0PNXofRBrZn+kT
	GveJ6YItju8jqZsXyFdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpRNe-0001pr-58; Mon, 22 Jul 2019 06:01:02 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpRJq-00067R-Cb
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2019 05:57:08 +0000
Received: by mail-ed1-x542.google.com with SMTP id i11so39484582edq.0
 for <linux-mtd@lists.infradead.org>; Sun, 21 Jul 2019 22:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=bhNuL7XR6WEpgsenxUTTXd4yjWX8/ASS+IMSViWNwpg=;
 b=txJ5ZWv3UKmiuk5ssBeCveRyf9AJmr1QKUJybWC0DM2RF05KdMQrda6cmGBnCr/QLL
 ri+3uMOvgMfnu5d9xee6QcqvW2HvouJ8Xbm2s8JGvAU2ttSe3kiq+gBc6Uvvk0yKhmpV
 XwJ6dAmbOuW84v95gcIv4W5StOdwXDniKeA+ehK7WNVllMzF3y8a3/fT5lsOO+uyisDN
 LR49ltmjpBVUcbybXcr+5ta4q7B/Q9GWSbi5kUwp2kNbgcGBQJ0hLPRfcKpeJlR0WNwr
 tgkAJxU/LcV2m4fO6Dh+FsET5x4I8fmAYsKV6Ve4wm9jabUusrK0vFrJ28ybe257oVBA
 IXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=bhNuL7XR6WEpgsenxUTTXd4yjWX8/ASS+IMSViWNwpg=;
 b=G5FerVADB5MMgEapZwTcIge+zbUTcnORuW/ka7caTSDntGDR8m5JZtdbi48pH5jgbB
 VAY2K3+3ZJI84bRva/E77VrvgoDMPUPSJ5ynBuYWS66Lz9rffjbFjl/XiycJyz79mE66
 7pHirgQNMACwivFiR54MEdPnTuY+tiScUCe8aHMN04uMcaf+1szl4w3QZG1lBnxs1wJg
 CduDpxGi6KAioxs2wR1L/btvkLyurciKUCTJBUbNyjY+9igQwAn7fiFvxRkqiGHzzJBE
 t0gp3eURDVYxDbKV43/bEmkk7iGe7siyjCOyL60McsbYCEbGi6XGObGgckapAJegrCPl
 VLZQ==
X-Gm-Message-State: APjAAAWkeGQ5AOyMr+wDlZGujyNl4N7kvpLSMXOpbYjRpb0d4TUTSY3P
 BfQQFOwFxJtokbZSm1UASF0bS5yBaSMUpA==
X-Google-Smtp-Source: APXvYqxG50dPPkeMZPABlYE+bDSQXe0vmIiBeaCAjtUOw965SYgsTWI6lWdD9a3aFJBew6lyZc17xQ==
X-Received: by 2002:a17:906:a481:: with SMTP id
 m1mr27835309ejz.87.1563775025026; 
 Sun, 21 Jul 2019 22:57:05 -0700 (PDT)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id a6sm10351725eds.19.2019.07.21.22.57.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 21 Jul 2019 22:57:04 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Shivamurthy Shastri <sshivamurthy@micron.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jeff Kletsky <git-commits@allycomm.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: [PATCH 3/8] mtd: nand: create ONFI table parsing instance
Date: Mon, 22 Jul 2019 07:56:16 +0200
Message-Id: <20190722055621.23526-4-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722055621.23526-1-sshivamurthy@micron.com>
References: <20190722055621.23526-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190721_225706_677343_25695536 
X-CRM114-Status: GOOD (  13.58  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

ONFI table parsing is common, as most of the variables are common
between raw and SPI NAND. The parsing function is instantiated in
onfi.c, which fills ONFI parameters into nand_memory_organization.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/onfi.c          | 32 ++++++++++++++++++++++++++++++++
 drivers/mtd/nand/raw/nand_onfi.c | 22 ++--------------------
 include/linux/mtd/onfi.h         |  2 ++
 3 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/onfi.c b/drivers/mtd/nand/onfi.c
index 7aaf36dfc5e0..e78700894aea 100644
--- a/drivers/mtd/nand/onfi.c
+++ b/drivers/mtd/nand/onfi.c
@@ -87,3 +87,35 @@ void sanitize_string(u8 *s, size_t len)
 	strim(s);
 }
 EXPORT_SYMBOL_GPL(sanitize_string);
+
+/**
+ * fill_nand_memorg() - Parse ONFI table and fill memorg
+ * @memorg: NAND memorg to be filled
+ * @p: ONFI table to be parsed
+ *
+ */
+void parse_onfi_params(struct nand_memory_organization *memorg,
+		       struct nand_onfi_params *p)
+{
+	memorg->pagesize = le32_to_cpu(p->byte_per_page);
+
+	/*
+	 * pages_per_block and blocks_per_lun may not be a power-of-2 size
+	 * (don't ask me who thought of this...). MTD assumes that these
+	 * dimensions will be power-of-2, so just truncate the remaining area.
+	 */
+	memorg->pages_per_eraseblock =
+			1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
+
+	memorg->oobsize = le16_to_cpu(p->spare_bytes_per_page);
+
+	memorg->luns_per_target = p->lun_count;
+	memorg->planes_per_lun = 1 << p->interleaved_bits;
+
+	/* See erasesize comment */
+	memorg->eraseblocks_per_lun =
+		1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
+	memorg->max_bad_eraseblocks_per_lun = le32_to_cpu(p->blocks_per_lun);
+	memorg->bits_per_cell = p->bits_per_cell;
+}
+EXPORT_SYMBOL_GPL(parse_onfi_params);
diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index 2e8edfa636ef..263796d3298c 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -181,30 +181,12 @@ int nand_onfi_detect(struct nand_chip *chip)
 		goto free_onfi_param_page;
 	}
 
-	memorg->pagesize = le32_to_cpu(p->byte_per_page);
-	mtd->writesize = memorg->pagesize;
+	parse_onfi_params(memorg, p);
 
-	/*
-	 * pages_per_block and blocks_per_lun may not be a power-of-2 size
-	 * (don't ask me who thought of this...). MTD assumes that these
-	 * dimensions will be power-of-2, so just truncate the remaining area.
-	 */
-	memorg->pages_per_eraseblock =
-			1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
+	mtd->writesize = memorg->pagesize;
 	mtd->erasesize = memorg->pages_per_eraseblock * memorg->pagesize;
-
-	memorg->oobsize = le16_to_cpu(p->spare_bytes_per_page);
 	mtd->oobsize = memorg->oobsize;
 
-	memorg->luns_per_target = p->lun_count;
-	memorg->planes_per_lun = 1 << p->interleaved_bits;
-
-	/* See erasesize comment */
-	memorg->eraseblocks_per_lun =
-		1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
-	memorg->max_bad_eraseblocks_per_lun = le32_to_cpu(p->blocks_per_lun);
-	memorg->bits_per_cell = p->bits_per_cell;
-
 	if (le16_to_cpu(p->features) & ONFI_FEATURE_16_BIT_BUS)
 		chip->options |= NAND_BUSWIDTH_16;
 
diff --git a/include/linux/mtd/onfi.h b/include/linux/mtd/onfi.h
index 2c8a05a02bb0..4cacf4e9db6d 100644
--- a/include/linux/mtd/onfi.h
+++ b/include/linux/mtd/onfi.h
@@ -183,5 +183,7 @@ void nand_bit_wise_majority(const void **srcbufs,
 			    void *dstbuf,
 			    unsigned int bufsize);
 void sanitize_string(u8 *s, size_t len);
+void parse_onfi_params(struct nand_memory_organization *memorg,
+		       struct nand_onfi_params *p);
 
 #endif /* __LINUX_MTD_ONFI_H */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
