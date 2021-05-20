Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81B2C43617
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 11:50:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 584396101E
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 11:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 584396101E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HlwYdpk7Weg+rOA6lmetTfKE8ab3BXJGqikCaosru64=; b=hjTAe6jaB1FQIIzkF3kQ//JVhH
	EbV0uYs7DKdESvaGzWCRFudQ6VgPOnunzf39YzsPSiu6+VUwjqOEACMw7h0XALApCGHIXwwvr1mu6
	iRAftTtQgkdBuqTBYTPtNL0rv50XRogINMWh/uADg7muEDNqPf7r6BCnyntjQQzHkb5bVxGFdTawL
	VoJi380y25GK2BYBtaXOqK/SFLpPNQ+PNtOMrkIptkHWysosTQ5pn14sRiNczad98i+VD3BvFhA/m
	f3X0CLd/bGVCiiPzcTts0SOoxvRwwXnvi78PugmE3LPwu+yhY1/hX891NKt8XKAwSyTVWmhbh/+hQ
	W0d0EXBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljhB4-000bfV-0P; Thu, 20 May 2021 11:49:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljhAp-000bbS-2P
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 11:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=QPaYVrSRdLkmionAM++uY77FvCctt4j++gqXCg4Vy6U=; b=rzfOBNeNMKNN5P0fAv5LkrHKBC
 SsMFX5YINVzLoaPOEF9CjMMqz5ahjsjL13s5MOLqcE+q4dxFoygfQRMTmmFXA13BMb29MxGjjlkPY
 eL8vEI8ez/+hF3ckj9fasg/4kkIq5CnesEVM+kWr+tiDzpvm5YI713MCXZfFheUE7GszzkVP+LzVe
 qcYOGSn3cGWzlnRUjJ9Wen8p3nUCnsE+DoCz2dFq1X5cmKZmHhQrdUI3ZKGYkMU/cP0vQXrr2A9zH
 FDTKOfrkYfr06OEoWWNjti5evtofLzKJDGu+FdrnKIIIggENkhhbvgidlGSfTk71sPharPP02fwbw
 jY9RfqjA==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljhAk-00GGsL-EV
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 11:49:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id u133so8994519wmg.1
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 04:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QPaYVrSRdLkmionAM++uY77FvCctt4j++gqXCg4Vy6U=;
 b=nGFmcYTSBurIZOqyQ2L5oGSwhqx8v9yvTrfoLO7TWlBNbQ/pu327A36Pl6xBdMzb6X
 BrC7JbeDLQgrmlSevT6ocOXBBRnMWF5rUjCbGSscWm/XppFvH2SbF0vo04FB9AuDB4Rl
 vDX0Rlvojrhx1A9uFV6MAzbf4kot+xjvD1k9jnR29/UgKCeMuOdRcj9wdH0ScdZ2/GUy
 APnY9mTVS6axoEVD0rV3HLeVeNm2y0dDITs8lHPCH8FAcVpA3hCn6j+rpn6Sw4mQPzc1
 Tkf7hA6GfceIJp6KyK0bHIdaxTWEITWtm7Skl80WDG22xxOwUit5UfL+pSmfYul5Mwa1
 4rRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QPaYVrSRdLkmionAM++uY77FvCctt4j++gqXCg4Vy6U=;
 b=skRKeWQWSPppOV33lW4rovOB53YKyOGq9NYXL4qyO5deRLgpGTV5kUFM2nb5MUJBCz
 bmuIsD18gkoJXzOLltUEg9BMRb+oBQqY2BLFEdushYRXf+6yWN2YqlxqgMIkCWssg/li
 Ht5emBALXa+E43B7EBSRAB1nuH0hMaNsXSnHYWOmmERdOnpgsP6pXJLpYdnULVdYDIX4
 ps7ksZ5yJ9GATOfGO7OCKVWUW+veCaSfmkj3MyX9bhHs8EqPsw+3WWZB6Co16xXD+Qua
 VCuu0j9cG0okczQWCQeewTNPvigJF8RXhxUPpG5p63PXObC9rVWmqk/gNqx4fhqt2hNw
 mc/Q==
X-Gm-Message-State: AOAM530IbOOojzfhMyn/8Ds+5P3mEfbr7iK8iIK9lEtSpYP4Db4fBN5d
 ArOpA+vi8NMCZBoz+N11mIwzdA==
X-Google-Smtp-Source: ABdhPJwi5TsXq9K487aycr86sXUt1qrwH5W0QT/pDOXjaR2fPO1nHdLIq2/BT2K1BJ2a6jeVHH9WwA==
X-Received: by 2002:a7b:cf15:: with SMTP id l21mr3291063wmg.30.1621511341154; 
 Thu, 20 May 2021 04:49:01 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id s83sm2478886wms.16.2021.05.20.04.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:49:00 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: boris.brezillon@bootlin.com, linus.walleij@linaro.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 2/2] mtd: partitions: redboot: fix style issues
Date: Thu, 20 May 2021 11:48:51 +0000
Message-Id: <20210520114851.1274609-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210520114851.1274609-1-clabbe@baylibre.com>
References: <20210520114851.1274609-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_044902_510142_5F9D05DE 
X-CRM114-Status: GOOD (  19.80  )
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

This patch fixes easy checkpatch issues.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/mtd/parsers/redboot.c | 69 +++++++++++++++++------------------
 1 file changed, 34 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
index 3ccd6363ee8c..feb44a573d44 100644
--- a/drivers/mtd/parsers/redboot.c
+++ b/drivers/mtd/parsers/redboot.c
@@ -17,15 +17,15 @@
 #include <linux/module.h>
 
 struct fis_image_desc {
-    unsigned char name[16];      // Null terminated name
-    uint32_t	  flash_base;    // Address within FLASH of image
-    uint32_t	  mem_base;      // Address in memory where it executes
-    uint32_t	  size;          // Length of image
-    uint32_t	  entry_point;   // Execution entry point
-    uint32_t	  data_length;   // Length of actual data
-    unsigned char _pad[256-(16+7*sizeof(uint32_t))];
-    uint32_t	  desc_cksum;    // Checksum over image descriptor
-    uint32_t	  file_cksum;    // Checksum over image data
+	unsigned char name[16];      // Null terminated name
+	u32	  flash_base;    // Address within FLASH of image
+	u32	  mem_base;      // Address in memory where it executes
+	u32	  size;          // Length of image
+	u32	  entry_point;   // Execution entry point
+	u32	  data_length;   // Length of actual data
+	unsigned char _pad[256 - (16 + 7 * sizeof(u32))];
+	u32	  desc_cksum;    // Checksum over image descriptor
+	u32	  file_cksum;    // Checksum over image data
 };
 
 struct fis_list {
@@ -90,12 +90,12 @@ static int parse_redboot_partitions(struct mtd_info *master,
 
 	parse_redboot_of(master);
 
-	if ( directory < 0 ) {
+	if (directory < 0) {
 		offset = master->size + directory * master->erasesize;
 		while (mtd_block_isbad(master, offset)) {
 			if (!offset) {
-			nogood:
-				printk(KERN_NOTICE "Failed to find a non-bad block to check for RedBoot partition table\n");
+nogood:
+				pr_notice("Failed to find a non-bad block to check for RedBoot partition table\n");
 				return -EIO;
 			}
 			offset -= master->erasesize;
@@ -113,8 +113,8 @@ static int parse_redboot_partitions(struct mtd_info *master,
 	if (!buf)
 		return -ENOMEM;
 
-	printk(KERN_NOTICE "Searching for RedBoot partition table in %s at offset 0x%lx\n",
-	       master->name, offset);
+	pr_notice("Searching for RedBoot partition table in %s at offset 0x%lx\n",
+		  master->name, offset);
 
 	ret = mtd_read(master, offset, master->erasesize, &retlen,
 		       (void *)buf);
@@ -150,14 +150,13 @@ static int parse_redboot_partitions(struct mtd_info *master,
 			     && swab32(buf[i].size) < master->erasesize)) {
 				int j;
 				/* Update numslots based on actual FIS directory size */
-				numslots = swab32(buf[i].size) / sizeof (struct fis_image_desc);
+				numslots = swab32(buf[i].size) / sizeof(struct fis_image_desc);
 				for (j = 0; j < numslots; ++j) {
-
 					/* A single 0xff denotes a deleted entry.
 					 * Two of them in a row is the end of the table.
 					 */
 					if (buf[j].name[0] == 0xff) {
-				  		if (buf[j].name[1] == 0xff) {
+						if (buf[j].name[1] == 0xff) {
 							break;
 						} else {
 							continue;
@@ -184,8 +183,8 @@ static int parse_redboot_partitions(struct mtd_info *master,
 	}
 	if (i == numslots) {
 		/* Didn't find it */
-		printk(KERN_NOTICE "No RedBoot partition table detected in %s\n",
-		       master->name);
+		pr_notice("No RedBoot partition table detected in %s\n",
+			  master->name);
 		ret = 0;
 		goto out;
 	}
@@ -204,7 +203,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 			break;
 
 		new_fl = kmalloc(sizeof(struct fis_list), GFP_KERNEL);
-		namelen += strlen(buf[i].name)+1;
+		namelen += strlen(buf[i].name) + 1;
 		if (!new_fl) {
 			ret = -ENOMEM;
 			goto out;
@@ -213,13 +212,13 @@ static int parse_redboot_partitions(struct mtd_info *master,
 		if (data && data->origin)
 			buf[i].flash_base -= data->origin;
 		else
-			buf[i].flash_base &= master->size-1;
+			buf[i].flash_base &= master->size - 1;
 
 		/* I'm sure the JFFS2 code has done me permanent damage.
 		 * I now think the following is _normal_
 		 */
 		prev = &fl;
-		while(*prev && (*prev)->img->flash_base < new_fl->img->flash_base)
+		while (*prev && (*prev)->img->flash_base < new_fl->img->flash_base)
 			prev = &(*prev)->next;
 		new_fl->next = *prev;
 		*prev = new_fl;
@@ -239,7 +238,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 		}
 	}
 #endif
-	parts = kzalloc(sizeof(*parts)*nrparts + nulllen + namelen, GFP_KERNEL);
+	parts = kzalloc(sizeof(*parts) * nrparts + nulllen + namelen, GFP_KERNEL);
 
 	if (!parts) {
 		ret = -ENOMEM;
@@ -248,23 +247,22 @@ static int parse_redboot_partitions(struct mtd_info *master,
 
 	nullname = (char *)&parts[nrparts];
 #ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
-	if (nulllen > 0) {
+	if (nulllen > 0)
 		strcpy(nullname, nullstring);
-	}
 #endif
 	names = nullname + nulllen;
 
-	i=0;
+	i = 0;
 
 #ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
 	if (fl->img->flash_base) {
-	       parts[0].name = nullname;
-	       parts[0].size = fl->img->flash_base;
-	       parts[0].offset = 0;
+		parts[0].name = nullname;
+		parts[0].size = fl->img->flash_base;
+		parts[0].offset = 0;
 		i++;
 	}
 #endif
-	for ( ; i<nrparts; i++) {
+	for ( ; i < nrparts; i++) {
 		parts[i].size = fl->img->size;
 		parts[i].offset = fl->img->flash_base;
 		parts[i].name = names;
@@ -272,17 +270,17 @@ static int parse_redboot_partitions(struct mtd_info *master,
 		strcpy(names, fl->img->name);
 #ifdef CONFIG_MTD_REDBOOT_PARTS_READONLY
 		if (!memcmp(names, "RedBoot", 8) ||
-				!memcmp(names, "RedBoot config", 15) ||
-				!memcmp(names, "FIS directory", 14)) {
+		    !memcmp(names, "RedBoot config", 15) ||
+		    !memcmp(names, "FIS directory", 14)) {
 			parts[i].mask_flags = MTD_WRITEABLE;
 		}
 #endif
-		names += strlen(names)+1;
+		names += strlen(names) + 1;
 
 #ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
-		if(fl->next && fl->img->flash_base + fl->img->size + master->erasesize <= fl->next->img->flash_base) {
+		if (fl->next && fl->img->flash_base + fl->img->size + master->erasesize <= fl->next->img->flash_base) {
 			i++;
-			parts[i].offset = parts[i-1].size + parts[i-1].offset;
+			parts[i].offset = parts[i - 1].size + parts[i - 1].offset;
 			parts[i].size = fl->next->img->flash_base - parts[i].offset;
 			parts[i].name = nullname;
 		}
@@ -296,6 +294,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
  out:
 	while (fl) {
 		struct fis_list *old = fl;
+
 		fl = fl->next;
 		kfree(old);
 	}
-- 
2.26.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
