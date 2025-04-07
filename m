Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47C8C369A1
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 08:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68BXiFSKn3FVf7v8QuOS60bvtrfhupn2tu4E+EX+E90=; b=gwHywkqNfMPY1u
	TwrTYD87Es5gv8kcrwzzdsltNqLTv1zWgT3IAnPS/RTMfbUKduoVhii+i6e4DrpvNgKe3EydacjbN
	Rj+7qb6wy3j0kC3pZQ+qceikdZ4ZnplxYADK3OAW+RmJjFCe3xR5wVpAo43FsSOw01WO5dGVZf0ak
	tLyYcM7rqPn1zeoaMzAf+Sv/flo6GD6RvgdziXneZ4iBukrH7xL8vY/aO1r9e24F3SkMozOGJXoCN
	fTtquhmW9B+p3jxpg25W56HPbF2nhbd5y6fGt2u7fLDncJIjQE22Vo/SMW87yC96uWlnYwPqQzIBq
	URFH7NXMJyJ+SP7l06rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hVa-0000000Gvnn-3vHm;
	Mon, 07 Apr 2025 08:07:06 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hOZ-0000000GuId-0R3O
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 07:59:52 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-224171d6826so53561845ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2025 00:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744012790; x=1744617590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1O9zQlMZRDF7LK3DGvq/Uhx/OHVxdJWIZ8HatjwyBk=;
        b=YyM42M9mDdgi1gR+VeQ5abHMEhw2Sj0JfWr3RDZCjp6s4NyXYM2VWxhD6DR5ZZ6q1y
         7Bu88Sv/2LjPRgIX8MAjYy0pYt9c+j2pPm9iJGqYXMXmxSWHWiC2PhiPs40wpqYgVh9z
         9JB7/8nerkrKxMfDnntd+U7AGqkJCp1Ro1vG6BI0B/v+FJbONqPL3YuF6W6htFTNDLaC
         9qawq4ay7xqcQO3zyfLGbtOSLanPFuECUSh5wB+k2/enxsmy3/UqfaHSm9Q8APCbkMaL
         LNJxfhITSiRmRrPZ2yEeW9CpKAieIIXcL3WocwNKhkRIo8Ti1f8c/7ESs2+pkDNXNeC6
         rgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012790; x=1744617590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1O9zQlMZRDF7LK3DGvq/Uhx/OHVxdJWIZ8HatjwyBk=;
        b=BjEiKBdrd+LpL4G4XSKYQZ5+w2L6Wf0SzcgHNhL7bOlu3MJVNb+AH9xIUhtafZKdct
         CXvjbPJuPSz0OuLhgaB70+fT/macklR3K1gpxejiv2OKgZTzAg7Wt/x6Dfxft0CeaU5f
         cUC40himbRA+WAAo1pqGoqqZp8ThkOA838axCw4p5Oh9xbKsOUjZtGfoEbCAmTAyh5sN
         giLxAXeasc6xr8TVtGpwiQahJPTROLC4jhYEjl2kSR1AEfzBuCZfOdrgfr51WsnokmJF
         MATWG1eQyh9ujsY8RBw3spBWnrXcs9fIace12yWcm8tx+f2ZW6/MizjvN8So0m1pik4q
         52lA==
X-Forwarded-Encrypted: i=1; AJvYcCXfbjYsAB1nAbu0CK7ZLmUxgxFlaPWX3sETqgBK3Lh1ATLerNSUXSetbOGJ1Eccaz8wyJtqyEnyS+o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2gpXMBCj/yq39JhHL5UNcXGJNb0AhYI3j4yKc6HnukKiRVZJM
	tcIY9dpZKPv3NyeFNEcQUe+naR/cVswXePj44sgk/RAB+SzZvXws
X-Gm-Gg: ASbGncuH59HxgVtuelVtajY8bKXBP5FVvU9an9SE2I0OtPdGd7Qq6sLS1zIL0DrfcgM
	cB8+XxzBj+KZ6nfvGtVhQsO+/7WvEmys8ghwltHJq3v+gbu2eJqMHLTdj7uCDAQNEWRqT5E7qjU
	S6eWWAIlCG2nIV7I0lwPs3DjEJhtyCDdFmufK4eum6oOLkrVbt0V9JT5Rr+LAjgN3lxWN5THXIG
	tkBQbmM1rKgkglw1Q7JhRa3Mqau0NIEhF5YtCCIXiH5JNwx3puqDPGWR9WlftJf9Y9RxaU+3KHk
	a9FkRqjwbVAXyMZF2Nw7w1C5Qa9IpH4TYa390o25US+fiyMulon7ok1QVtbQ7kn8JaWq
X-Google-Smtp-Source: AGHT+IHd2dyG7PGO7w3nUgfbhHliSsLoD3UO4NI+MU+OxQcHsvYPua9u1wZB9NMCzwguGQtVDERgBA==
X-Received: by 2002:a17:903:1cb:b0:21f:7a8b:d675 with SMTP id d9443c01a7336-22a8a0428b8mr165368865ad.4.1744012789988;
        Mon, 07 Apr 2025 00:59:49 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c0202sm75162645ad.88.2025.04.07.00.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:59:49 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 07B27801D7;
	Mon,  7 Apr 2025 16:08:46 +0800 (CST)
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
Subject: [PATCH v2 2/3] mtd: spi-nor: macronix: Remove duplicate flash info entries
Date: Mon,  7 Apr 2025 15:53:59 +0800
Message-Id: <20250407075400.1113177-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407075400.1113177-1-linchengming884@gmail.com>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_005951_140367_151E85BB 
X-CRM114-Status: UNSURE (   9.00  )
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
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
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
