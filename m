Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFE0CFA472
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2024 21:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HvAfMQUkFGzPIkwdmMRMmu7YcgHpl++AbQ25EHZbcW4=; b=LWeSgbah2IjP3h
	EaOc4rJnKLPG/1t/jq9KH6SCS/3OLSCOOWcb7Yv5s0gwZ4KF9Zc9eJ5TPfkniNQP7ldL4j33jwmAV
	81YebastirBNdX0Z5IpSJGZu8GvejOI2CX6LqB6eOzMq07BVJjfVs6QfOLpQV1fTqyevDrbN3YNfw
	ICpPtX5kPaXCmunir7h7Deu23yWYK+VUyaecEpH72IhjFv8F4bdBsAHVywYhqHnurd1+XK/VZUKH6
	oh+OAjk3DkhZSlxQVrryEt4qKp3EbXJhJIXXxEg9smQCWbNvOt/dNWQtEDeuglKLkM/UQpSBKaXFN
	UGkSL4aCHQ1BJJA9e5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3iXf-0000000FveF-37Z1;
	Wed, 23 Oct 2024 21:05:19 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3iXR-0000000Fvat-1YSw
	for linux-mtd@lists.infradead.org;
	Wed, 23 Oct 2024 21:05:06 +0000
Received: by mail-qv1-xf42.google.com with SMTP id 6a1803df08f44-6cbe3e99680so1605166d6.3
        for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2024 14:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729717503; x=1730322303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajjz0prkpVOfz9Fw34WpY+TPI8EWCjFu9lXxmVOj2VQ=;
        b=Y9fo/qK9pXgBwhCSmFznWYb7qv3kLqfmw+Nyosb+9yfWXWvfU/mRcrGsb0pP5dC7Am
         vBOMVgrYXN5Ks69qvUauLik0dxAg/C7sYo9Jk1s4OsIIz9HfBGrpoyOpUA7DI1NRvzge
         NdT/8NPqh2QVDy3Hd8pFU2bmf77NLY6GAxPgPHu50Il6/gLU2GfgS/xK2OsY+Gtln4zM
         f4GtuCsrv2MLETAggspq2XW/zIl+CEKIv+7kccez9yj6RVE2q7v6/lJemwBZAnU/ptyK
         4RXvmEfvpBK1YHOUoMinceX9OAShUjkyTKVWWR9Bpg6yTrACFbm1rLlrMbhtxBZgBlP/
         xzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729717503; x=1730322303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajjz0prkpVOfz9Fw34WpY+TPI8EWCjFu9lXxmVOj2VQ=;
        b=dy8b41Z79qaoQrasu9UUaqeUTATOEgQwnIpPnIFjWAWrfmV+brIdr5hA4xATqhNR3+
         NSluivdMqNpvFDBhOBibE+vW5nw8j1IdKHZCVPvQHdTg41DPCCExtC8XR7BW2dgaszuE
         hS/ik30Qim9s3ordQVSSxfD6IOYIHK4mYKnVoQS/jCIg+208AD3IRIycDaQ/QnNW7xQz
         olqD8vOagJaKL3imXYWBp7pYzGIXHp0SDgLQbSrtfGd+0myEkUQAUa8d1CnXLN05Y3uX
         6ydG4MLu6z+YKFTky0WhsgVKlRuwhz0+mIJnG09Kjn5DzwD943vSi9kFi+gIOn3bSy9Q
         LocQ==
X-Gm-Message-State: AOJu0YyuQ9/2yO5Xa3AiFq9eMVxV2xesGoWBsXzgUNrfE4GqHAjZBpov
	2f9I/78HJP5VWJHMe+J/MuyctjqIEoeO7dZzYbwrD0ZhLt/YHwLD
X-Google-Smtp-Source: AGHT+IEEnQu+OKtY9n0NgCSJ5Eb6n5HoQaOnxdXuoI1XHEo8lp4VqPTom23Aiol8dBOV/Aceap3hKw==
X-Received: by 2002:a05:6214:5b13:b0:6cc:38b6:5666 with SMTP id 6a1803df08f44-6ce34132d41mr43113076d6.8.1729717503355;
        Wed, 23 Oct 2024 14:05:03 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce009e26cdsm43114776d6.122.2024.10.23.14.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 14:05:02 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	arnd@arndb.de,
	dinghao.liu@zju.edu.cn
Cc: linux-mtd@lists.infradead.org,
	zzjas98@gmail.com,
	chenyuan0y@gmail.com,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH v3] mtd: diskonchip: Cast an operand to prevent potential overflow
Date: Wed, 23 Oct 2024 16:04:53 -0500
Message-Id: <20241023210452.12677-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_140505_433423_99EC345F 
X-CRM114-Status: GOOD (  12.02  )
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
---
v2: Correct "Fixes" tag.
v3: Shorten subject and adjust commit log wrapping.
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
