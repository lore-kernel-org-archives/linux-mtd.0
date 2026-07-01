Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83E3C43458
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 02:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCvLktU2LkUZ1QGYLBMtUGCxgnfMtTh5+HW13U7xg00=; b=fAW7p4/uRheOBV
	yabv4jAFUT0Es9FdjdrjJ43wB8H0g9fNTev10b0G8zjjuV1eAEDWcCLNVfmyMt8eLEnzEhwTVMcH9
	lFuWC7a+wzuX7rRM6LKvARpFZKRIgMJpj/XFZ8EMxp5TS5gZoMG69nwof3f3Os9oOy4awkHQJMSnT
	NBDzVenn6Qjgh/kg0wa93xeJ148KbNFjTMgtCCm0xZRp56HuBG3ylvcXIBVpCsqLd+gwcfjw7ATzT
	YP4esTH4+7b0tVvbNggqhhxszI0rJ/1vvQC+ziNgdMpZUXZ+iDVmGr7TwlJ9Tq3d+a1SrEvQZd+CA
	YgyJOSBTWje3yMT2nXYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekwm-00000000XYO-2EO0;
	Wed, 01 Jul 2026 02:45:08 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekwj-00000000XXf-3xan
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jul 2026 02:45:07 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c9a20f70263so35895a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2026 19:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782873905; x=1783478705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhdK0h9qN098ZBlBAGds8RFxtjxiKXaQo70sxkxPcBk=;
        b=JJGZsC6jkcplFcGSD1CvTM/vkhdy0jJeRS2FJkwULT0a9yu1S9NZcGMUWsqM+WMrRv
         xk/qnYjuRRzh2qhnI5GfZ40RTaTtnfcdUlB4iY0NFmhrVfU8MvFZLS8mwE7IOTYquAiS
         95wj7E84blVr1MSxsE++BeB+YNYDN0oYEkBQu43eKcoovpGrdjRhhlJvwFWYPF1ti6mI
         3AMSDR3ii0YSKC44YfS2ArQNgyocVaWTy7f98SBftgbkXPMoEhJHgTUR/EOCH1/ALFBw
         1yIda3m9Pv4BVxruDoeeM/mdUs+SayOMZZfps6bczSVhDcEzb3QocQuQA61eqOb3t8Hs
         uAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782873905; x=1783478705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lhdK0h9qN098ZBlBAGds8RFxtjxiKXaQo70sxkxPcBk=;
        b=ZrvOxxqz5OQKtPNQfmz0Dkfrxw3anqpn5Ypxd0w4RLyfA6XS9YrvvBv3qG8dvv4DeO
         QjL87l/umffORGfUnyt6NxU/yEcfHcajBIK7ZYm6SXPegnw9YL+APQBphi/S3K/NdRvQ
         Hm88Qg8Ppvk8IrjlKjdqIxMjiv+ooT/AsV+BfNeOoy6eJ0aP8HLwQHCyVF+muS19RXvS
         lhdGZ4vQ8sLv4t7AnH34qEwF5QUqfk5A0WM3819GoK3SWvPW/kvZdZVhS4CuF5e/86OF
         1fZZ+rpO2m0sGTfksdN/ObSyrWSZwFnUdeVzGQgx5NOO2aXnRzTZPHtJY4T6DbBxhlG1
         7AMw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8POeWBB/niKO4CP/kFv7V18PUiD6Lsbfem5jkSQOYDgw6Lc1YTyLDJ1v2fsizDxXRDBvUGRVBJfc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0tNFdVMMcDmCMr/t9aidJrieUcJ8sJwk5lMsLjCq6kD0qmuav
	o9Ptpp9P2n10uEhbuQRp8TQr3ATPKUoT26CrJWdQJysvNWSYSSWVgErb
X-Gm-Gg: AfdE7cmy5tEg2ZxqFbLpnPEOIppfWRg7B37wHQYGoY4p3xuF4KpqKPQMc4Pxn0jvyTV
	FSm3MOEBIfXKQzQpMAHH6dL1Oq7Mc1mJbjVpVoholYT26KSBbR/YTDaID+Cb6xWBdIL1qa80waR
	PsqoMK9IftAXfhkNWB3BKHj4Z8dNjBIYos3/3vOPdtFOtt7HJv7g1JOo9sPDpnPTvsD+nwf+MmT
	42JHuIeMk2Wt23kjlG9Umt499hf4/+5fzF2Ylth0EEFYwxCL/k1ter+99glchq8P0wXW7j5WVBQ
	LZE46g7BzG9VFhJfaHP5xZdiajFMA6CW5m53YRZ6mx9Q9D+o+BqwrV3P8Jj7M3SyG52wOgW3+Yh
	nk7Q9RdwZpRnfFmcKZj2o+Y/gFSihfdm0EAAajMFPj/v18fWjnccFsZ/Ucsr2bXtyq9xdLD1WS1
	AGOFYkY5YnMPWCDoTyQwe0R4/F8xTeuB07iMo=
X-Received: by 2002:a05:6a00:3487:b0:845:df4a:2a2c with SMTP id d2e1a72fcca58-847a81c1ea7mr3414947b3a.8.1782873904807;
        Tue, 30 Jun 2026 19:45:04 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02d41c0sm2993631b3a.33.2026.06.30.19.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:45:04 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 99FE2416A066;
	Wed,  1 Jul 2026 10:45:02 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: stable@vger.kernel.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 6.12.y 2/2] mtd: spi-nor: macronix: add support for mx66{l2, u1}g45g
Date: Wed,  1 Jul 2026 10:42:04 +0800
Message-Id: <20260701024204.2730472-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260701024204.2730472-1-linchengming884@gmail.com>
References: <20260701024204.2730472-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_194506_016354_B4EF5C13 
X-CRM114-Status: GOOD (  10.91  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

commit 797bbaa7531f75985b199e484451fa3f954382b3 upstream.

Due to incorrect values in the 4-BAIT table for these two flash IDs,
it is necessary to add these two flash IDs with fixups.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
Link: https://lore.kernel.org/r/20250211063028.382169-3-linchengming884@gmail.com
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/macronix.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 678ebaa220ca..6127565372c5 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -110,6 +110,10 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_128M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &macronix_qpp4b_fixups,
+	}, {
+		/* MX66L2G45G */
+		.id = SNOR_ID(0xc2, 0x20, 0x1c),
+		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x23, 0x14),
 		.name = "mx25v8035f",
@@ -165,6 +169,10 @@ static const struct flash_info macronix_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.fixups = &macronix_qpp4b_fixups,
+	}, {
+		/* MX66U1G45G */
+		.id = SNOR_ID(0xc2, 0x25, 0x3b),
+		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x3c),
 		.name = "mx66u2g45g",
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
