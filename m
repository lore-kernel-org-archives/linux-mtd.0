Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEB0CA9EC3
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2026 12:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sbR4IqjDDBy3B/PPXiKXZwr+JEM0W6bdaEuKTWMN9q4=; b=Ogfbnt/3CcdAcE
	19WifQuhEAdovZ7DAOwQWdEe2E6EOQFEloTBuNRzRjyuZgrUVWmYtCmoi9MT9d6taEymB5wDI6h8k
	6wRPfdkeAHym3D7uVl+h7Qy0yaVqNCFkfQB08GpixANdnn2suIltEp5pW8WMa4oAi25OyFw1ONNjQ
	JWsjBGSyUzNXEMX+t1Aj/BMy6EGD6xedzCF4RhK6SPAj590h2MvgsoAygKCOmky6BfbS/4+pOl4jx
	LKIOgojo7xwHvZnEUf3VvUWyhSzEyO0GRinZK7bA2/ltOkE6yl/MG5/hX4tOF0c+mScihAeg0f9wf
	xBQpGoJcRQ2CqhyE9nxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWfm-0000000831r-0Fd3;
	Sat, 10 Oct 2026 12:59:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWfj-0000000830x-2sxw
	for linux-mtd@lists.infradead.org;
	Sat, 10 Oct 2026 12:59:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4956869750eso4444415e9.2
        for <linux-mtd@lists.infradead.org>; Sat, 10 Oct 2026 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637169; x=1792241969; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p8FC7nJBpqq+qPZdfw+GCth6LuM5q+W9nKyNGFLLPQk=;
        b=CTFLtVBE4kNuA+PT28nxnpFsUDGW1FsbmBQnX/Exi1nTFLr5nNwVHqTSe1k8fqOKxJ
         WXZimaxEoTTUUxRVnp8ytNIig2tO1bxoHkAXq7PjolRyuPLXFw6J18vjbHhOnOqyuO+7
         UNX2PqccZ5QrGP7rIGNH4ID6GvD2KuaEqMeqkiKo1Wfr4INkdIVpAgfG+M5WOCbY1Xw7
         cSNMB3NwXCNwG9qYo4IWWfvh/Jo/ezZAItNr77vxmW67B1pWAhQaUi5369tlgO4n7uNr
         F1DDip6BLgujWqOPWjcJnzMzg/tKMXl4qneZBudpVK2+HvolXQB0uLVWYs+7XAYsc4Ut
         FAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637169; x=1792241969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8FC7nJBpqq+qPZdfw+GCth6LuM5q+W9nKyNGFLLPQk=;
        b=2nqCfHfcHnmbZNc6X+pOo0P5VTBtf2uN+UmwPdWYNIL1AlassVjJEYJfsQ5tfZVgrJ
         n+7qIfbiXchE9vwG8904GtPYDFmJOYrkZTL7MpODRXuYMXWcEwhRDEF3Tzmi4XvWM8rx
         vUAXpuKpjI5J69nrGPchz1ROsnkZeQD9uMry9suzC7z6QvDUdiOTpWqKqae9hFR/FnO/
         TD3Gl1RKmGEdLAP2hUY4JtUdygTNeXkkzEEBdrAMIxHwPAenbW1zGYUiqLwxiKfmVxAF
         2qiFqLvuecnllQIZdBVHxy7iNRtis9ZRUyx5EGYoHq4jyPTn127VCDr3IDVW37oUZ8cP
         7+xg==
X-Gm-Message-State: AFq9FYKnp9PfkYnMNnwJrHvOnhSe2b3Xs9SjvDDsiaGoJnz7SsqiBUhs
	3z5LzhtLfHm38I3y8FNUpZtzjGFaFtsFUdHYPg5vQ/1BCKJFJ0OXpnjIt6nAohVgW079Zg==
X-Gm-Gg: AYBFou0BJ+J6JKcizb+dlAeHS3zGhbMQvWk4+YhrRe4MeGH0cvcRt6mUtquhpOBZ7ew
	Im/YKdihyCEcumv8hFvr/QliSNdWvZuNJp3+i3GB5eG9zWkREkscnEKJnISDFHgka/+FrNA2Dyk
	Ugy67wCpTWvGqvdbiwhTuRMrgY4q01LuTsEJlbGehTmVlesuGiu/vQEToBqljKQIj5rQ8yuw9/q
	NEvr9idrzpcwS5cOfazwHZ8LC33BL80cMZ7Cy7pt/rJUieBSK0021riIVmnXTVdZttN0cshUUzW
	3OuE2WK7iDt3ZzxaAotrLZx1zqMn/6YK0fvf3jGndQxj2kOQ+KqxSYrGqxpW9pg/K5wLMAiABSd
	2q2Uyi7XflRp1EIE5U3H+EdH9S0URiFyWarMeBfZ2pKrUWna0RWzWceDNnJKcB2iTsZ+dFSlnMA
	RQHRGd5G755BnLkXnTdEULMt0oPbZZlPZ54UlE4BIwfu4suQJr7n/CZeRRm/a9NtbzW0ABOoriF
	1Y3M4XGB3515JWBrcLaZWRGxuFokWlUy6wgYw7zMKLzrxsORAVWSt8rJBV83nCoq3L4iVvBqILP
	WOZIq6nIZnpkPKHfldEzS2XUgecv4TU/BR5yS2XOtrh7FqwaUoqbea8KuI3E1g==
X-Received: by 2002:a05:600c:c176:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a18e4dce0cmr88426475e9.33.1791637169221;
        Sat, 10 Oct 2026 05:59:29 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18d12fe04sm82048945e9.4.2026.10.10.05.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 05:59:28 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH] mtd: spinand: heyangtek: Reserve both bad block marker bytes
Date: Sat, 10 Oct 2026 13:59:25 +0100
Message-ID: <20261010125925.175440-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_055931_735573_38BE0355 
X-CRM114-Status: GOOD (  14.46  )
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

Keep the two bytes read by the SPI-NAND bad-block check out of the free
OOB region. This is a separate MTD fix, compiled but not exercised
through OOB writes on hardware.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/mtd/nand/spi/heyangtek.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/spi/heyangtek.c b/drivers/mtd/nand/spi/heyangtek.c
index 7fc50fd3de..76d97ae970 100644
--- a/drivers/mtd/nand/spi/heyangtek.c
+++ b/drivers/mtd/nand/spi/heyangtek.c
@@ -35,8 +35,8 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 /*
  * HYF1GQ4UDACAE is a GD5F1GQ4-compatible die, so the OOB layout is taken
  * from gd5fxgq4xa: the on-die ECC parity occupies bytes 8..15 of each
- * 16-byte section, the bad block marker sits in byte 0 and the remaining
- * bytes are exposed as free.
+ * 16-byte section, and the remaining bytes are exposed as free, except the
+ * two bytes that spinand_isbad() reads as the bad block marker.
  */
 static int hyf1gq4_ooblayout_ecc(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *region)
@@ -60,9 +60,9 @@ static int hyf1gq4_ooblayout_free(struct mtd_info *mtd, int section,
 		region->offset = 16 * section;
 		region->length = 8;
 	} else {
-		/* section 0 has one byte reserved for the bad block marker */
-		region->offset = 1;
-		region->length = 7;
+		/* section 0 has two bytes reserved for the bad block marker */
+		region->offset = 2;
+		region->length = 6;
 	}
 
 	return 0;
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
