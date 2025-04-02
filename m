Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4A3C3601B
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 08:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEB4cjT5d3aPSLtca24AkUwm/dU6/BCXgivp9wzg5Ik=; b=1MPfqDNggB6tQu
	KpbseXzdFgIGXeFlz2Oe438IKUNGO2oHF1GilXJ6Pa1xAwktSt4rArJbZOwY1UWN7mwtAZvuTEna4
	ds/97UU4h7//nhhIr2nd5uGzS7vZFtXbpmQPD6mva057oDn5MmTLO1J+/JtDgVswsJ+KyF0xro7cJ
	ipOQLDoYBhpVykQBEDd2jW3Tv0fFHOjHUWU2xbU4GWaqkFvyLeOKsdLoRIgiqCUIROU4vkQb4r424
	0+qS3RrnVl46DQQJW7angtAuSSeGf6nd68QaT9NBHPW7JKt1pU1ZoPyp3XtynVSnXRHFkT9Bj1tqE
	eo87dwHzW2q9XpEfdiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztvA-00000005bOf-3npd;
	Wed, 02 Apr 2025 08:58:05 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztuE-00000005bBj-0mAh
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 08:57:07 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2295d78b45cso39288955ad.0
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 01:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743584225; x=1744189025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWAPszpWlvrmrWFqRVfzalTuSm2t7m4HZ4+y2asZ5jM=;
        b=HVROsZxNQznNZXETF4+qdHTIKiGP9Ih5U2wD6Em3GnpxghpbOg5/THNYtPuhWQnUXk
         cYvtvro/XqdJoensYz4wS1Qumii5WO/uQ7MepwyhnvmE/gyOCM/jwYOKk4oB5DiEjp5x
         J3jREcodRonHAixEAZD+Yhx7Xr+kBl3s5k5VRF0IquOuZSrS2s/BtqQpz+AUeeJsmQX5
         FK5rsQcxZ7PyjiHNsWPjyc2ceLF67nimUWP9hMWLmT0SYaiMuYwSalfswqlWsOZ7ZXnr
         fCdcw4b8UduE5JLwsU1ytOkiHvdlndaLwjfsVGDbxpPlt8WhVxt1OzUfUIG2fadD9yEW
         tmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743584225; x=1744189025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWAPszpWlvrmrWFqRVfzalTuSm2t7m4HZ4+y2asZ5jM=;
        b=tBXQzEvW5G9f4iwMVa9bRBGNTfBBMCRg+qYMZNJuP3a4zq/sQH8fbS63+zXDqbW/8d
         VZL+lVqQxaQF9iPnUCiVXoAyhF/6GMkKNkpMELTZDmjsd77FJkz9HRrEmsFgE/RVIR8c
         j1ySYezeDdbFmOPn5q5N9r9TIByNR5++nkcdXu1o2DzXCRP985x/aBgj3n1NIGYw7Ucf
         zrahMZaejEWe0H+KGCtkPpPL5e87bSQhQFc+Hgn+2Yja67EP263FmVbbMsBoNK6+KL3p
         asRTziQiUaOIHvdyGyiAFKcZoK4TosxZIA+g8oBEZ27B2qaN7rF79JWE7FMqFcFFOcIQ
         UxmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNpitPUYnle2LmrUL8vktc3+HCmSa5Cl5YQqkviiZz2ym+7cUmC3O5XZOo/W6bC31AW8XuCR/AEyk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+Rh5LAgN0U42snku2zDk0WnLovrfJC9LZPCQWjoHPQdLPagEV
	WfYQsJc4meKuqGP4GiwL+CtudpziV4rSkrEL6EjgFdD3+Xddi8z9
X-Gm-Gg: ASbGncsxRa/ldvZg+gAxnjDbsXYpiJ3Hu6yIGKgFTNsQWns+KxfNY1vyxbTR0PgfmI5
	decUoiBBIY+2Ofhr+6A+UvBY3yZDTvZAfTNtyN4aiGC2AQW8FMYhzIyMRID1283a19PkDJnnMHC
	IW3fLVkNQkRjOoSWVRguyn+Dlgy54wyGv8EaAMGm845PyZZZknoqgF4pnyE6g3VU7KhtTVuTO+0
	2TVclT853CnztPmfOEBNAxk3lZiBwcuvAhEVc1E+CZ4stnZ3UboGFqUYe76ipryfwkRsDM3nNDX
	yscykgWvZFvCGFk9bGGjWpWCR/gHkEcP266UIbFs9E0YnfyhsYk5ngUiyIbg8289/MvL
X-Google-Smtp-Source: AGHT+IEB11GBk+GAE4+ZVetVY/CYu/AG8QyTGlgekDHi/jvsC7njBUNP5H6KE5bwxY7hZlGb8lzR/g==
X-Received: by 2002:a17:903:1c7:b0:224:c46:d166 with SMTP id d9443c01a7336-2292f9e53camr256175075ad.40.1743584225005;
        Wed, 02 Apr 2025 01:57:05 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1de7d7sm102753925ad.173.2025.04.02.01.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:57:04 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 0103E80605;
	Wed,  2 Apr 2025 17:06:10 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 2/3] mtd: spi-nor: macronix: Remove duplicate flash info entries
Date: Wed,  2 Apr 2025 16:51:28 +0800
Message-Id: <20250402085129.1027670-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250402085129.1027670-1-linchengming884@gmail.com>
References: <20250402085129.1027670-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_015706_224352_9EE487C8 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

To clean up the code and reduce duplication, this entry is removed.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 2acd8e28d1c4..07e0bd0b70a0 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -160,13 +160,6 @@ static const struct flash_info macronix_nor_parts[] = {
 		/* MX25U51245G */
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
 		.fixups = &macronix_qpp4b_fixups,
-	}, {
-		.id = SNOR_ID(0xc2, 0x25, 0x3a),
-		.name = "mx66u51235f",
-		.size = SZ_64M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
-		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		/* MX66U1G45G */
 		.id = SNOR_ID(0xc2, 0x25, 0x3b),
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
