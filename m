Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C00C00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:56:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BB0A223AC
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 11:56:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hg/61Vt8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iwc3rXe5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BB0A223AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kAsh17g28C1o04F9Qq4njyA9DuveqYX3WjcAVIMblvY=; b=Hg/61Vt8sQ3Wy8o3ytu2dGpRu
	HIEJzMbP4c7sISFLdK1p1R4ztKHAuwuwdkIXHsc49qngX0b5QFG5G6aUqR+lCwC1B+6NW2susgprU
	zGM9BKdKPep99k3Bpw0lEVfDufXJrXaWE6b7xT8iMRr6XcQdlduEgBVRwO9VrpSxDV09Nst4grA79
	G7Upehsi2ZF+4Z7qIr1pXbSSfXdmRN/L1p7w5NyxXCkrtqemCTssL62usISL6IMJ4XMNN/AYIg8fe
	X7bChiLzrgHV23sJvV6pi+T5ts8lauIBPnKT7lM2oV1QShPEr8wIkiV2MW937KMgRGvH+lXmmc8TD
	hTqJhFghA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYQn-0002JM-N3; Mon, 02 Nov 2020 11:55:25 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYPm-0001uS-Df
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:36 +0000
Received: by mail-wr1-x442.google.com with SMTP id y12so14250081wrp.6
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4n/4+2lBYe8KEpcSc+k+jaUcNkTMwSw5Q+II+p0iyss=;
 b=iwc3rXe54abh0IHTgT8GJR7Ns9AFQ7uTzRFMH9TYCsgpN7aaTodko0Sqz7REftrzXB
 LpBvtJR8QSrIbHwXqeLx26kD+v6j/Ucf7/lSUy4f3F0EO0vh08+76ebSvforYcOwsv4q
 BROkYCbfu+Lu65EUy2c3+KDEe9aOlPW0JhQ0ftFNQDVg1crYkFcKu66zpbUDctqFznKT
 XnSYA0Zh/V2iF4PdxTCiVnVjLrQHk2Bfvg5hZv3mL4bQXlCrPOTRvebZjVkwcZJ5bJOO
 SgDW3ky2+6+Y7YyOWjSU3mxvPNuKal2OhrMAAPObvBHfXPVbimtPkZQLFx15Rr4y4yYr
 wXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4n/4+2lBYe8KEpcSc+k+jaUcNkTMwSw5Q+II+p0iyss=;
 b=srqRg+YY74aYpP2chtepdlxWkbSSbHyIlwv7Z2Z4lPDb265+TDH+plmlKcdNKKtTMy
 ALy3JoKlovbQDzBp2xXX6FpQbTvilt0uVTwcvkrNRVz3het3tlzurWvCRQNrjVjAXiYH
 8yibvDKoCCvUZmNCH1fqQzjXCpHUFzuNVnV+NiXxBq/zg0aaI/haIKA/FItzYyoMcCaR
 t/vQ0WxZ/XjU6K/0rtptPX1dLtPbck3SWfb7fO3HiyZhW/Df1K/+1MVfBMkOK+yBOxew
 vJ/VYsBc3bvou+uzuwOJ7YqDTKlmVHTOHX6MRrCHD+yjdn7NMJNJsUqyqc9CF7hMCQQH
 UU0g==
X-Gm-Message-State: AOAM531RYWzSfkpKoGmy3UrWRkuuPPSMMf5wPBQtjMg6UZT99zf9Rwe8
 0r3xpPcfAgztHvaxqT7Rw2Cfng==
X-Google-Smtp-Source: ABdhPJxeMB2reRQ16Bvj9g+9zwEA93NttwfMke0pPcXrs4Vw3KAh14l50poNFbDYG7hOWVp5QcZq4w==
X-Received: by 2002:a05:6000:36f:: with SMTP id
 f15mr19634536wrf.78.1604318061197; 
 Mon, 02 Nov 2020 03:54:21 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:20 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 06/23] mtd: nand: onenand: onenand_bbt: Fix expected
 kernel-doc formatting
Date: Mon,  2 Nov 2020 11:53:49 +0000
Message-Id: <20201102115406.1074327-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_065422_862001_4CDF4EBA 
X-CRM114-Status: GOOD (  21.21  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee.jones@linaro.org>
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
