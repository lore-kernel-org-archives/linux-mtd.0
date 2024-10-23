Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD35CFA478
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2024 21:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HurxT248P1fWmmCR4KaSjtnYajBM/3MpKMTX0xuyJ5M=; b=Vl6aVfrSDfSnDn
	ZN4y1nHj9X7x61FFL6oE5Vgi1+3K/Zr2/GALOmpZyr86+9xDng6WgIRnHqIGYgJuBkSoHCX6NRGST
	OTNQYi3iBcyaun/bf0f9UOQFmTnokBoi/VzHevnzuNWNTcBRiGc5l91Q/grMLRP+1tAjqLhkmD5x6
	fIPl5EKfyld4ooA/+75bstImPkR8GZTk3UAol7v1U+Ei0/pX14o7MoJAIqzItkIDob+22qLje3RJ1
	j4sszZYfv5wjYcxYp2diZ0HSAEvG+tGJVKNarUIdEgBdk5a8cfN50oo1Ra7lAl0l1l4/0WJZGq82G
	mHlrN6DvphV/faNkquNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3irq-0000000FyXj-1Sid;
	Wed, 23 Oct 2024 21:26:10 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3iro-0000000FyXB-0WJa
	for linux-mtd@lists.infradead.org;
	Wed, 23 Oct 2024 21:26:09 +0000
Received: by mail-oi1-x241.google.com with SMTP id 5614622812f47-3e5fbc40239so219526b6e.3
        for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2024 14:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729718767; x=1730323567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8p5HKt5YmndhY1o8uIjxK2AFUhC/YradmRqWJh5d9Eg=;
        b=P+KMkRk/z2bfY1iUSw2r+RqILsscFwqpNyM/P14CIkcTxf4u4DDM1QiVnP05+j5EnS
         yk7BbnHJGM12D9bBbFV2a/1hkj34AvM1pRGEdixcjrvFylPER/PloRsoueLtH8jhHe+7
         qOJ9vzKDdwqe2DLcvGJ3NxYoLvbz7YVhwJTrouol46BSdOtjr9utt+GbLFW2tzKjSkqQ
         z7HfmiOd4HSDSL9wEbgZ5oTNtQX3EtcceWx5c2sCcTcg95G059cP5ppKn+JMCHWCDv70
         vk5ImekwoZJeOaS98KnZJXltzv77oF6BvfloPM8+r2vP8bodLw4sPYhDX78iqGbCR71a
         3W6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729718767; x=1730323567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8p5HKt5YmndhY1o8uIjxK2AFUhC/YradmRqWJh5d9Eg=;
        b=DtDpw+lB/muM/p/9ZrNV3kaOxfXPR+duNAWvz1LnK2si88MNYkt0uzgHUmlK+YSd4I
         QKKZTu9y8R2MSGdJuFcy/nSlDtYdnYM85qsvonx2F0ZHePzpTf3pIJOD4thNWid2k81z
         jYUfUuGb0YTQrQP87BEshjrloQHZf4L1T7exFPIaHQyrWq7ZNnK89cGHZKhyTr+OuDXB
         3VOJvXFReKA6TgiKvG7QkOsNZ2X0f81Ssm+Pwm5dlSbJ9sKyaVDp9jnqR5DvgcCwcwVN
         vTeBXiJrAApBB9AvjVBm/D6K9aC8VEY9nZiTKAC7wsHGDebgy5ZKUIFirT3YSfPirE8Z
         qsdw==
X-Gm-Message-State: AOJu0YwLIfWrr7ckl3OZok/x80OsfnpFnTBXqCoYrrC9ZDkYsl2wDRo7
	hxlOVZexYwJcvngWb3bMLJZD9IRZM07LWjlgxJt1jiDw6zz8WsQ0
X-Google-Smtp-Source: AGHT+IHTsI6MVPosv5KTKr2YlsVNIKvMtmUibTmGg9kF4sSoEA/qFmZz4n9cSciEcR6KsJ4NCkf/ug==
X-Received: by 2002:a05:6808:211f:b0:3e6:769:354e with SMTP id 5614622812f47-3e624525cd3mr3809683b6e.25.1729718766632;
        Wed, 23 Oct 2024 14:26:06 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce0099eadasm43082536d6.87.2024.10.23.14.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 14:26:04 -0700 (PDT)
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
	Petr Machata <petrm@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>
Subject: [PATCH net v2] netdevsim: nsim_nexthop_bucket_activity_write(): Add a terminating \0
Date: Wed, 23 Oct 2024 16:25:21 -0500
Message-Id: <20241023212520.13376-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_142608_191734_642E146C 
X-CRM114-Status: GOOD (  11.82  )
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

This was found by a static analyzer.
We should not forget the trailing zero after copy_from_user()
if we will further do some string operations, sscanf() in this
case. Adding a trailing zero will ensure that the function
performs properly.

Fixes: c6385c0b67c5 ("netdevsim: Allow reporting activity on nexthop buckets")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
Reviewed-by: Petr Machata <petrm@nvidia.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
---
v2: Adjust subject and code format.
---
 drivers/net/netdevsim/fib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/netdevsim/fib.c b/drivers/net/netdevsim/fib.c
index 41e80f78b316..16c382c42227 100644
--- a/drivers/net/netdevsim/fib.c
+++ b/drivers/net/netdevsim/fib.c
@@ -1377,10 +1377,12 @@ static ssize_t nsim_nexthop_bucket_activity_write(struct file *file,
 
 	if (pos != 0)
 		return -EINVAL;
-	if (size > sizeof(buf))
+	if (size > sizeof(buf) - 1)
 		return -EINVAL;
 	if (copy_from_user(buf, user_buf, size))
 		return -EFAULT;
+	buf[size] = 0;
+
 	if (sscanf(buf, "%u %hu", &nhid, &bucket_index) != 2)
 		return -EINVAL;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
