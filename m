Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A756FC2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26EDA2087E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gUOfrGW3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E1jmcNOb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26EDA2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kAsh17g28C1o04F9Qq4njyA9DuveqYX3WjcAVIMblvY=; b=gUOfrGW3EXz+zgyD+xsnu5WyT
	PslqjyTjwQNsfZLBgdWr0qhzUUsQx9Iz2iNcLN/t5GBjWdWzHeMyCT48QQ1QQRgMOe2Zj75pRM6HW
	MkVjWmKDNsdefDgd8uyoFbH+tzjbQSgPGLhkG7ayIt/hSndh38I1Q0kjDy7mZqJ7FLZmpg+G3y58q
	wxuT3aFXC8bk7lX20SAdrG0iKiLxDrSAbe9VD6Kjhkfx3ERJqNWi03KosKWqv+7DXD5wzs1N/gUos
	OCOdV33c64/xoaRCY2opOqfU3RKBItOc3kC/nxHrTCJfX6EGDFMHbLqNM0YSY+ozpSr8Z5yH3VZVF
	w4AZGB9kQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9QS-0002mn-Ty; Fri, 06 Nov 2020 21:37:40 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9Px-0002Yl-42
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:18 +0000
Received: by mail-wr1-x441.google.com with SMTP id y12so2771137wrp.6
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4n/4+2lBYe8KEpcSc+k+jaUcNkTMwSw5Q+II+p0iyss=;
 b=E1jmcNObPpOFAHqOiArNxpkGlw9Xo5gZkeh7M/ODJbeB9NBlxV9QjsO8ibIaw6sN7H
 4ynd+QJxlFIDKHDbtIyWiw9iTCSdgcAD9yURYwuna0zJ7eBjXBzOCKnvH+Ktj6d74/X1
 830yGufI3GL9HH7ngOMkelJcTtehVTWJSSS42zTF0svRJ18TSt08TNgmGR6a0T21JyIH
 at61Glf59Wbx1WZSA+p8LhCXIecr/kHQjRK4rRZfVj67/Qrk5GNklpKeMP2mYU8fEhoa
 l5DguekHO8FEVIcQFgUHCxXpkjX7hZwFyiVnyn5uJ9UXIvraXdrJgLBGJ0FECHw+Z/uG
 b+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4n/4+2lBYe8KEpcSc+k+jaUcNkTMwSw5Q+II+p0iyss=;
 b=q85zBOu7RNDJEaNZ9dUBcm3d92gfZBdO0AQtTqoGJukWocSwFWqN2b76QZeIcU04Mx
 Pm1DWdYeDpN/e5qszkDVt87dwkaumgYkiurRfUKchkFuDzuqOsw5YdCZQ6tf4g4uuDkM
 DSPYR2JM5wgr4SuMl+RI3NUTVR9e62odbt/j23Mbp6+bYxQXGabgTt80riW0/V+v3EKo
 sXx0UaAFnVh5Uy/mWzi2u9p5W5+hlkdGidQrrYEgT1ERg1IkM8SUtyIzGX05UrK1Rms0
 YgC5Utomenr1zyyPe4IKxV1esXeNigTDPTE7kAET3tBqVkq9eyfIRYX0zMRn/8/QIljb
 g1bA==
X-Gm-Message-State: AOAM532J0x5PlQDpy7RoTFbYZ5UtJ6ajR25E1oqidCvYYOOFzQXqtji/
 Ex9DU5ncrYcL/S+Rt/oCtUo4gA==
X-Google-Smtp-Source: ABdhPJwUR+1Evv+PkcCkaMHMH5kbjDzfUksJd9J8W72gMGDc4DtY2RyMLaISy4TjBi8Xzhfro7AAjg==
X-Received: by 2002:a5d:6b8e:: with SMTP id n14mr4502896wrx.238.1604698628060; 
 Fri, 06 Nov 2020 13:37:08 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:07 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 06/23] mtd: nand: onenand: onenand_bbt: Fix expected
 kernel-doc formatting
Date: Fri,  6 Nov 2020 21:36:38 +0000
Message-Id: <20201106213655.1838861-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163709_279618_2BD40778 
X-CRM114-Status: GOOD (  20.50  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/onenand/onenand_bbt.c:33: warning: Function parameter or member 'buf' not described in 'check_short_pattern'
 drivers/mtd/nand/onenand/onenand_bbt.c:33: warning: Function parameter or member 'len' not described in 'check_short_pattern'
 drivers/mtd/nand/onenand/onenand_bbt.c:33: warning: Function parameter or member 'paglen' not described in 'check_short_pattern'
 drivers/mtd/nand/onenand/onenand_bbt.c:33: warning: Function parameter or member 'td' not described in 'check_short_pattern'
 drivers/mtd/nand/onenand/onenand_bbt.c:57: warning: Function parameter or member 'mtd' not described in 'create_bbt'
 drivers/mtd/nand/onenand/onenand_bbt.c:57: warning: Function parameter or member 'buf' not described in 'create_bbt'
 drivers/mtd/nand/onenand/onenand_bbt.c:57: warning: Function parameter or member 'bd' not described in 'create_bbt'
 drivers/mtd/nand/onenand/onenand_bbt.c:57: warning: Function parameter or member 'chip' not described in 'create_bbt'
 drivers/mtd/nand/onenand/onenand_bbt.c:132: warning: Function parameter or member 'mtd' not described in 'onenand_memory_bbt'
 drivers/mtd/nand/onenand/onenand_bbt.c:132: warning: Function parameter or member 'bd' not described in 'onenand_memory_bbt'
 drivers/mtd/nand/onenand/onenand_bbt.c:145: warning: Function parameter or member 'mtd' not described in 'onenand_isbad_bbt'
 drivers/mtd/nand/onenand/onenand_bbt.c:145: warning: Function parameter or member 'offs' not described in 'onenand_isbad_bbt'
 drivers/mtd/nand/onenand/onenand_bbt.c:145: warning: Function parameter or member 'allowbbt' not described in 'onenand_isbad_bbt'
 drivers/mtd/nand/onenand/onenand_bbt.c:182: warning: Function parameter or member 'mtd' not described in 'onenand_scan_bbt'
 drivers/mtd/nand/onenand/onenand_bbt.c:182: warning: Function parameter or member 'bd' not described in 'onenand_scan_bbt'
 drivers/mtd/nand/onenand/onenand_bbt.c:230: warning: Function parameter or member 'mtd' not described in 'onenand_default_bbt'

Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/onenand/onenand_bbt.c | 32 +++++++++++++-------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/onenand/onenand_bbt.c b/drivers/mtd/nand/onenand/onenand_bbt.c
index 57c31c81be186..def89f1080071 100644
--- a/drivers/mtd/nand/onenand/onenand_bbt.c
+++ b/drivers/mtd/nand/onenand/onenand_bbt.c
@@ -18,10 +18,10 @@
 
 /**
  * check_short_pattern - [GENERIC] check if a pattern is in the buffer
- * @param buf		the buffer to search
- * @param len		the length of buffer to search
- * @param paglen	the pagelength
- * @param td		search pattern descriptor
+ * @buf:		the buffer to search
+ * @len:		the length of buffer to search
+ * @paglen:	the pagelength
+ * @td:		search pattern descriptor
  *
  * Check for a pattern at the given place. Used to search bad block
  * tables and good / bad block identifiers. Same as check_pattern, but
@@ -44,10 +44,10 @@ static int check_short_pattern(uint8_t *buf, int len, int paglen, struct nand_bb
 
 /**
  * create_bbt - [GENERIC] Create a bad block table by scanning the device
- * @param mtd		MTD device structure
- * @param buf		temporary buffer
- * @param bd		descriptor for the good/bad block search pattern
- * @param chip		create the table for a specific chip, -1 read all chips.
+ * @mtd:		MTD device structure
+ * @buf:		temporary buffer
+ * @bd:		descriptor for the good/bad block search pattern
+ * @chip:		create the table for a specific chip, -1 read all chips.
  *              Applies only if NAND_BBT_PERCHIP option is set
  *
  * Create a bad block table by scanning the device
@@ -122,8 +122,8 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 
 /**
  * onenand_memory_bbt - [GENERIC] create a memory based bad block table
- * @param mtd		MTD device structure
- * @param bd		descriptor for the good/bad block search pattern
+ * @mtd:		MTD device structure
+ * @bd:		descriptor for the good/bad block search pattern
  *
  * The function creates a memory based bbt by scanning the device
  * for manufacturer / software marked good / bad blocks
@@ -137,9 +137,9 @@ static inline int onenand_memory_bbt (struct mtd_info *mtd, struct nand_bbt_desc
 
 /**
  * onenand_isbad_bbt - [OneNAND Interface] Check if a block is bad
- * @param mtd		MTD device structure
- * @param offs		offset in the device
- * @param allowbbt	allow access to bad block table region
+ * @mtd:		MTD device structure
+ * @offs:		offset in the device
+ * @allowbbt:	allow access to bad block table region
  */
 static int onenand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 {
@@ -166,8 +166,8 @@ static int onenand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 
 /**
  * onenand_scan_bbt - [OneNAND Interface] scan, find, read and maybe create bad block table(s)
- * @param mtd		MTD device structure
- * @param bd		descriptor for the good/bad block search pattern
+ * @mtd:		MTD device structure
+ * @bd:		descriptor for the good/bad block search pattern
  *
  * The function checks, if a bad block table(s) is/are already
  * available. If not it scans the device for manufacturer
@@ -221,7 +221,7 @@ static struct nand_bbt_descr largepage_memorybased = {
 
 /**
  * onenand_default_bbt - [OneNAND Interface] Select a default bad block table for the device
- * @param mtd		MTD device structure
+ * @mtd:		MTD device structure
  *
  * This function selects the default bad block table
  * support for the device and calls the onenand_scan_bbt function
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
