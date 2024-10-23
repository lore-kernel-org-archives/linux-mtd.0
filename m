Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F665CFA474
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2024 21:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+yDU+UbhI8DgzxReoyCO3rcW/mokTclR9B+LAnso5i0=; b=NR1iCVEuRC/+f9
	ULU2f1pmW+4yfvvNitCMQ13/TXjxUtYQIJ4dY8caHi34jt2D+cgTLt2yeDZOGSxk8ifYW66J97yIe
	SfLRcL1WVE7s4sSaPDvZRbyierdn4+VfwNTik/nWfea/EYs8cb+3fwCNNGVY63lSwuOqwJQQuNIh/
	SQobSxbyrgwSI9/2kT5ZaGBIZkivEzhb1tdaK3T5rEVukLMXSJKr3H3ZVfCeTOUuOW+DswQva6cCb
	BDS769gL4znjGU/wC38CFZiq2wgXv8IGjx9AzdTM+71QhKnwmaCUbE8ZrQh0fsQMtEuIKmlR+s3Ij
	bTOQpKRAwY8+igp13y1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ifP-0000000FwbP-2YtB;
	Wed, 23 Oct 2024 21:13:19 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ifM-0000000FwaU-3Vr5
	for linux-mtd@lists.infradead.org;
	Wed, 23 Oct 2024 21:13:18 +0000
Received: by mail-qk1-x742.google.com with SMTP id af79cd13be357-7b147a2ff04so15758585a.3
        for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2024 14:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729717995; x=1730322795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MCdIPw1scUzZ/qF39vP4SWy2EyXqMACy7FsQ1MZaVb4=;
        b=mn1qqpqfuYCqPkEe3fE9/NCEft0vMrJ9rO+xNOXNy2fO3G6CxlUptn2QBxfEwhlX8m
         8c/jz+Na2l03nJd4cR4Zi5gAWFhM7G4OTaJwixDsypJ+WEHZQkfWZsTsKCO/wNAzsp4f
         UxXfyFtsadXsmRrzkN2NEnY6+8RrllpYc5nvPiGjt7YHUaJWzMBbOf8QEqycH2kp7yu3
         xeb7Hvb/fMsS1qgoigv2zv9NVQvujXwjwBQiP9oaoooTBDlrUZui43DYpN6BJfYpTpan
         oi+KR/YJ81/uZnbUvt799wdrFT5iyQJ1MFK1J3yWELQkWLa6MHbFtAuX8r1WHKWeA9qw
         0NNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729717995; x=1730322795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCdIPw1scUzZ/qF39vP4SWy2EyXqMACy7FsQ1MZaVb4=;
        b=jizx32Yd3hcyMrdApKwr8aDPbXwHpv7ZVfaQ9WDSRhmqZJJTKRV2CtAaHaTOksoF5D
         zESjXdDGVol9zirUqdCMampxD1I2tLpdRFlobL9w24hP5nSboJSDYhno2qrfuIw/Jg5S
         CjB0Sl920VyYMVNeC7upbynE+zlt3Xge+aOumc2LhG1MEwZDxDCc6P4InRccOthUdoVe
         hwd7zPQd3wnBy7zSXdZm+yRe2OkQsDqdtqXJk3zULKEb9GPZfscKDnIERTg6L205/zSm
         pYKQq1AQkohuGG/RncYzhB8KP7vu/HEtH4ugrkJKILTGf/DUfkUBBEqExH6zkg+Ame4N
         gtMw==
X-Gm-Message-State: AOJu0YwHkElHyNL8EDIMrzSCgd1j8SAHEEfwFpq6EwVqpYAjfzakjLVz
	SJmE18B6lo82E7mcRvLMPiiAB3YtQBsr+8v+N+YxcQhCQ7V2R/UP
X-Google-Smtp-Source: AGHT+IG6SHQd2UbknuiJO0zSgtIat6OwS2EA3NcHpw+bDSwcHDqrbswyTjGufQI99cN8Tay7klbeKA==
X-Received: by 2002:a05:620a:1926:b0:7b1:4a48:56bb with SMTP id af79cd13be357-7b17e5bc5a1mr443735485a.56.1729717995075;
        Wed, 23 Oct 2024 14:13:15 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b165a037fbsm421212785a.60.2024.10.23.14.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 14:13:13 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	arnd@arndb.de,
	dinghao.liu@zju.edu.cn
Cc: linux-mtd@lists.infradead.org,
	zzjas98@gmail.com,
	chenyuan0y@gmail.com,
	Zichen Xie <zichenxie0106@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] mtd: diskonchip: Cast an operand to prevent potential overflow
Date: Wed, 23 Oct 2024 16:13:10 -0500
Message-Id: <20241023211310.13015-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_141316_901553_23BEBF55 
X-CRM114-Status: GOOD (  11.91  )
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

From: Zichen Xie <zichenxie0106@gmail.com>

There may be a potential integer overflow issue in inftl_partscan().
parts[0].size is defined as "uint64_t"  while mtd->erasesize and
ip->firstUnit are defined as 32-bit unsigned integer. The result of
the calculation will be limited to 32 bits without correct casting.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
Cc: stable@vger.kernel.org
---
v2: Correct "Fixes" tag.
v3: Shorten subject and adjust commit log wrapping.
v4: Add Cc tag.
---
 drivers/mtd/nand/raw/diskonchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 8db7fc424571..70d6c2250f32 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1098,7 +1098,7 @@ static inline int __init inftl_partscan(struct mtd_info *mtd, struct mtd_partiti
 		    (i == 0) && (ip->firstUnit > 0)) {
 			parts[0].name = " DiskOnChip IPL / Media Header partition";
 			parts[0].offset = 0;
-			parts[0].size = mtd->erasesize * ip->firstUnit;
+			parts[0].size = (uint64_t)mtd->erasesize * ip->firstUnit;
 			numparts = 1;
 		}
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
