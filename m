Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B600EC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jan 2022 03:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CM2uZgskD7GzWwKi+FfGCE0ayEkXkraIBqyrHlMQ2io=; b=Hoh03iZTG3qqwn
	x9d+N8JCBXffO/DJr3MzJ0BrlC49/Rtgml+WUpDEh45G6+2+JcaEPVqyuQynZfzrNfpMUlIls6MLe
	Ju+lYctmDRyDfkBsuofTirwmRxxI95YJT82wloOe6dbl6Rgdlmj5FTVQ7AxvOrWQCsEx5jKpc1cj2
	i2BA3Ab8iwANCUfChmFtGKQk+R/b+ry56izWL8F9j8jri98J6782BYpXKvMmi5RS4T68vCFndV9MN
	jBK+shCP/MoXdN/0vCEWNZ13Iq6SEQmtsTB1uP7SrtDmSJBwYPGkwjuNugbozK8Tzdtv93u4tCKDg
	8In/lMMXNi86Z0CA0lvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8w7x-00Bnis-CV; Sun, 16 Jan 2022 03:22:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8w7i-00BnhG-Jk
 for linux-mtd@lists.infradead.org; Sun, 16 Jan 2022 03:22:32 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so15703207wmo.5
 for <linux-mtd@lists.infradead.org>; Sat, 15 Jan 2022 19:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y0RvgzcdSRbA/gXGiR6apnZgPu9pepPQ0gbrYqOPoLE=;
 b=Gw9tlcGHUBA7nL9vDVhM/NR8f84EcT3JgkX2vsS43sjZNMI5lvgxcXzixbJDkgIvEh
 zNH7DFhwQfJguxA87AAG2RHmLDCQiKzuCrWBcp90ZLjiG7kIuwTXxjOTYwSjgH1otBCv
 sVWyXVWCEZCx2xDOY5GWVIjLoieRuMbZIw1sxJ7bnD4Nl/BdsRgevK2VKY4LAH+Qraif
 /pUjmBC1JS+s1kxJ2d8rzdUkfSh0bRfhGRY7wvD7WhepJyYjLSS3tVoUIyzy0eH4Qx3S
 wL66lAN0rchlXkF55movnqeEnYd0bYJZ+lNkDkmc+PvwRQ/gMc4fJIRVmT0rWkuBRx1y
 KGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y0RvgzcdSRbA/gXGiR6apnZgPu9pepPQ0gbrYqOPoLE=;
 b=LaPUrpovOm7hj0gP3xLAyt/gu3H/VtsF4mSCgspQBDNKtbjN5HJQZdOU5waZ2W1pgM
 8CKl50aBphkuTzldGY67iG82g3wueVvnxL7aK01ex8s0bc5YQFN6NvqiDUWPDXtwq9Db
 XyhNnxVJ5aVSJHhPb8kkP/pcrtGLYMrCVRKrilOSxtAujPkux+n+NqpIWAA9KlQdFXe4
 OQsjJTz96i6knOFWDQMVWE9V6aR7iRnvJ8CW4z7MdgDHwbxG4bjY/nz5jvc9pa0uEbsR
 POxivsWSHyxvSf6+Anh6nwhDFVrnQPn9FS2hu6NQouivo2by6MskLYlf6X/kK1CQcCBE
 mPdQ==
X-Gm-Message-State: AOAM5332nF91R1HRC/Mzb21YSic00ejl8b8c+PSyYRgfm72YcDdB7Z+3
 2N/ln03yoQsDd1/lBzyS1U0=
X-Google-Smtp-Source: ABdhPJyo4nf0cRPn+sy7h83rr4UPkcSsMjlYgG5pSzjHC4ZsPh7KLffkSIuV75Wl41iYNRMVu+k8hg==
X-Received: by 2002:adf:f94a:: with SMTP id q10mr13990771wrr.263.1642303345120; 
 Sat, 15 Jan 2022 19:22:25 -0800 (PST)
Received: from localhost.localdomain (93-42-71-246.ip85.fastwebnet.it.
 [93.42.71.246])
 by smtp.googlemail.com with ESMTPSA id u16sm1446785wmq.23.2022.01.15.19.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 19:22:24 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] mtd: parsers: qcom: Fix kernel panic on skipped partition
Date: Sun, 16 Jan 2022 04:22:10 +0100
Message-Id: <20220116032211.9728-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_192230_672262_5E01B09B 
X-CRM114-Status: GOOD (  16.97  )
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

In the event of a skipped partition (case when the entry name is empty)
the kernel panics in the cleanup function as the name entry is NULL.
Rework the parser logic by first checking the real partition number and
then allocate the space and set the data for the valid partitions.

The logic was also fundamentally wrong as with a skipped partition, the
parts number returned was incorrect by not decreasing it for the skipped
partitions.

Fixes: 803eb12 ("mtd: parsers: Add Qcom SMEM parser")
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/parsers/qcomsmempart.c | 31 ++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index 06a818cd2433..f4fc7635c1f3 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -58,11 +58,11 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 			       const struct mtd_partition **pparts,
 			       struct mtd_part_parser_data *data)
 {
+	size_t len = SMEM_FLASH_PTABLE_HDR_LEN;
+	int ret, i, j, tmpparts, numparts = 0;
 	struct smem_flash_pentry *pentry;
 	struct smem_flash_ptable *ptable;
-	size_t len = SMEM_FLASH_PTABLE_HDR_LEN;
 	struct mtd_partition *parts;
-	int ret, i, numparts;
 	char *name, *c;
 
 	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_USE_4K_SECTORS)
@@ -87,8 +87,8 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 	}
 
 	/* Ensure that # of partitions is less than the max we have allocated */
-	numparts = le32_to_cpu(ptable->numparts);
-	if (numparts > SMEM_FLASH_PTABLE_MAX_PARTS_V4) {
+	tmpparts = le32_to_cpu(ptable->numparts);
+	if (tmpparts > SMEM_FLASH_PTABLE_MAX_PARTS_V4) {
 		pr_err("Partition numbers exceed the max limit\n");
 		return -EINVAL;
 	}
@@ -116,11 +116,17 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 		return PTR_ERR(ptable);
 	}
 
+	for (i = 0; i < tmpparts; i++) {
+		pentry = &ptable->pentry[i];
+		if (pentry->name[0] != '\0')
+			numparts++;
+	}
+
 	parts = kcalloc(numparts, sizeof(*parts), GFP_KERNEL);
 	if (!parts)
 		return -ENOMEM;
 
-	for (i = 0; i < numparts; i++) {
+	for (i = 0, j = 0; i < tmpparts; i++) {
 		pentry = &ptable->pentry[i];
 		if (pentry->name[0] == '\0')
 			continue;
@@ -135,24 +141,25 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 		for (c = name; *c != '\0'; c++)
 			*c = tolower(*c);
 
-		parts[i].name = name;
-		parts[i].offset = le32_to_cpu(pentry->offset) * mtd->erasesize;
-		parts[i].mask_flags = pentry->attr;
-		parts[i].size = le32_to_cpu(pentry->length) * mtd->erasesize;
+		parts[j].name = name;
+		parts[j].offset = le32_to_cpu(pentry->offset) * mtd->erasesize;
+		parts[j].mask_flags = pentry->attr;
+		parts[j].size = le32_to_cpu(pentry->length) * mtd->erasesize;
 		pr_debug("%d: %s offs=0x%08x size=0x%08x attr:0x%08x\n",
 			 i, pentry->name, le32_to_cpu(pentry->offset),
 			 le32_to_cpu(pentry->length), pentry->attr);
+		j++;
 	}
 
 	pr_debug("SMEM partition table found: ver: %d len: %d\n",
-		 le32_to_cpu(ptable->version), numparts);
+		 le32_to_cpu(ptable->version), tmpparts);
 	*pparts = parts;
 
 	return numparts;
 
 out_free_parts:
-	while (--i >= 0)
-		kfree(parts[i].name);
+	while (--j >= 0)
+		kfree(parts[j].name);
 	kfree(parts);
 	*pparts = NULL;
 
-- 
2.33.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
