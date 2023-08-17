Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B30DC3DA54
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Aug 2023 17:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6o3FWmCu1vpYQud1uD3zM3jVTJq+u0837iOjMu4HFk=; b=XTtQULtaN45Fu3uw3wjJ7zRz3N
	dZL4CYShrhqg29YhOT9tAWPCx3nl2se4n2Gdh/FYJAB+2YMnEleiQPtXqON3B8wk6KY1G4frK7uUN
	1ucsH3MQ0VLXTquBHW74rMtR2M9oRu0oflsgbC02/wESeyWO0QlObjHZtLevw8ClBngsDd5/wArwM
	ssIsaCu50ijTBZrIdiFSnJpvWazth9ouT7xVT79NMvakr0/He+MyrK20hSLQAjUggAD2R90POS5nh
	G5Ug8PA2FIh1P56W04Ik76Wnqs8x9dODTmGUU5qd1uyqDqoE2LQ0lQQr9xc5fLjn8AyonMXrg2tX+
	B7ZanPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWgPZ-006psg-1h;
	Thu, 17 Aug 2023 17:03:53 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWgPW-006psB-2u
	for linux-mtd@lists.infradead.org;
	Thu, 17 Aug 2023 17:03:52 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3490cce329bso173475ab.0
        for <linux-mtd@lists.infradead.org>; Thu, 17 Aug 2023 10:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692291829; x=1692896629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/CF1sp7z18+6hzC94tDeSNxB7GD4ts5/I3Q7/FCqPU=;
        b=kZhb+6h+olefCaUxLh+5ROA9Q5Q0bYberN/mtcsV1M3xiXoWcHawfL+WLHazoMNlDb
         e19laAhHDhd/bigAMTN6dsOCKk+QXlEjrreWfBIIoJPksyINsnUarmTi2/wzB738IMHz
         UVQxI0I+8LuQsQvrujmNvtP4pixmOtv3VjOZRb4T79qQizq5lSy4oMB04UryeWLgkNXT
         DLRuGGGWuFAiCJ7f3UjN0aBxOktVG9iOas4VPd1mG9fwr5Jt+cHHOqHpU9HIYVSvWrTL
         a0ntdHT0g8+90gwCEBRdgcHCNZw5ao3niLnF+rcpXo1NsaxNDIFoLM0VLZdnodpZWdH6
         MyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692291829; x=1692896629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/CF1sp7z18+6hzC94tDeSNxB7GD4ts5/I3Q7/FCqPU=;
        b=IjsSFlP/PaTJnjDxxH07K7xI9aiBnIjbdr8GTxajM1Fbz+2zWfo2jxneWgfTmWD+f9
         QvV4AcU/U5Y4SvR4E0gH9Kv8BBqDF1bIVmQsMUwZzFtC1GGZrggugn+5BR7tFbMfOA+L
         G00d9I79SB6Bjix4yzflWIJF+BZWSwC/s9NPS4S2fpExeq/wJ9t46Fk1K3plBuFQFNVq
         wp7IzzOl2rFR/Y7EGIcars8Y7wsaTw1WOdcJtq89hGodmpq0W8WEkJHZvlrCjXokxaMX
         tp11OGn2En6N1U0FUITDv09eSzcI1x9Gr6xkOzmhMWrPVtZ/8KCA6H+Y1hvZM7yelaIs
         +/hg==
X-Gm-Message-State: AOJu0Yzz60KfCOP8JIWqaUS6pXavqgwzViw9MHWQuCyblcth3fLM1WSu
	hzRN15CjRZtHbwP//7fZcAo=
X-Google-Smtp-Source: AGHT+IGS7UsBL/IVOjFXyITZjakLFnLw2xV75JF+PU9lUQC5ZN2voEGYjEhUJl+UjcQe77M9Cch8/A==
X-Received: by 2002:a92:ca0b:0:b0:348:b086:2c4b with SMTP id j11-20020a92ca0b000000b00348b0862c4bmr4778445ils.9.1692291828909;
        Thu, 17 Aug 2023 10:03:48 -0700 (PDT)
Received: from sun-virtual-machine.localdomain ([103.149.144.245])
        by smtp.gmail.com with ESMTPSA id r2-20020a92d982000000b00342093347d8sm5315859iln.76.2023.08.17.10.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 10:03:48 -0700 (PDT)
From: SSunk <ssunkkan@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	michael@walle.cc,
	pratyush@kernel.org,
	richard@nod.at,
	ssunkkan@gmail.com,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: [PATCH] Add support for more XMC series
Date: Fri, 18 Aug 2023 01:03:35 +0800
Message-Id: <20230817170335.3711-1-ssunkkan@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817152050.6679eae3@xps-13>
References: <20230817152050.6679eae3@xps-13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_100350_959462_782243A1 
X-CRM114-Status: GOOD (  14.60  )
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
Content-Type: multipart/mixed; boundary="===============4661509945995069759=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4661509945995069759==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Add XMC XM25QH128C/XM25QH256C/XM25QU256C/XM25QH512C/XM25QU512C
and set the parse_sfdp flag.

Signed-off-by: Kankan Sun <ssunkkan@gmail.com>
---
Hi Michael,
Since this is the first time I've submitted code to the Linux community, please forgive me for some of the missteps that I've made.
I uploaded the incorrect patch file.
In a previous e-mail you said：
XMC parts seem to have SFDP tables and they should work out of the box
without any patches with the generic spi nor driver [1]. Therefore,
you don't need any entry at all.

I think it is related to the PARSE_SFDP flag.
The XMC flash part supports SFDP, so i don’t need to add NO_SFDP_FLAGS() macro.
 drivers/mtd/spi-nor/xmc.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index 051411e86339..e78bf11792d9 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -11,11 +11,20 @@
 static const struct flash_info xmc_nor_parts[] = {
 	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
 	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		PARSE_SFDP },
 	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+		PARSE_SFDP },
+	{ "XM25QH128C", INFO(0x204018, 0, 64 * 1024, 256)
+		PARSE_SFDP },
+	{ "XM25QH256C", INFO(0x204019, 0, 64 * 1024, 512)
+		PARSE_SFDP },
+	{ "XM25QU256C", INFO(0x204119, 0, 64 * 1024, 512)
+		PARSE_SFDP },
+	{ "XM25QH512C", INFO(0x204020, 0, 64 * 1024, 1024)
+		PARSE_SFDP },
+	{ "XM25QU512C", INFO(0x204120, 0, 64 * 1024, 1024)
+		PARSE_SFDP },
+
 };
 
 const struct spi_nor_manufacturer spi_nor_xmc = {
-- 
2.34.1



--===============4661509945995069759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4661509945995069759==--
