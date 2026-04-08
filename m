Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77C810FC447
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Apr 2026 21:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f9pw694yzOcqnBGHGGtmN6pJgR6XRU0nl2+C2nyXZRE=; b=plzFAAvmYFTTNF
	ruDtNsodgJX60pAX8hZD3Yf8S0Zl/iDN5CuIWAqDrBQw/PGgPg7AUys7fNv9z5Cx6HruzVwe1daoh
	51UC/lsdsQA6t1xEmMDXW/FYBk6SsOgWHAItlD74l210TqLuvPAguDiGSQIJwRy6YFAm2Tfxi44ec
	+AqlR4PW7pV62FJK7OQ6K2ldP1MFF7S5Lvu1wr5IWFTahqiIBa4eO99PATysSM97/VEK7Sb/chyfQ
	l0L2wJGR8F33UAl+eUVvAvlDPKMTLX1G2iW/Coq8EMpYGduZiQJLSQk4EHExkjYnvYGBxCrgwHsr1
	DCorHqfa9nWTBszPst7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAaZt-00000009RYt-353M;
	Wed, 08 Apr 2026 21:36:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAaZr-00000009RYZ-38Sq
	for linux-mtd@lists.infradead.org;
	Wed, 08 Apr 2026 21:36:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-482f454be5bso1693085e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 08 Apr 2026 14:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775684205; x=1776289005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rjVxWYOeFnQfJj1Uu8QEV+84w2reIr8oTpqTdhpQ/Ac=;
        b=LvLpPiZC9Q/EIIt+LQs12Q8TDuwm0Ai+jkFdwtNmsYDMhAl7N9OBYtDDvTZz03W298
         /u53KBzE8X6P9liCrsQBO2LnX4+JA6t/8ZCyHUFJ9fFzERPO7Cx0/NIQiNTa6/abvs7f
         LbDcdEhjkyXpkPwK5ExIrYhFi5WL4M+z2TohIb90nvUk2SNLqrtMjCBj7DVgprcRyjuF
         08b86Shl0lKDGC9BA8+KicBACmPXOvpHi3Atp/g7s9nSsmERH0TxABDIkIcgu6t2MZ8p
         96ocLe1Rx5n6Y3rn2l+R9qXPJhrhwFzoNTAqChkEfreG8RZxseGb60HL609Mq0QJnlJV
         +WdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775684205; x=1776289005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjVxWYOeFnQfJj1Uu8QEV+84w2reIr8oTpqTdhpQ/Ac=;
        b=L7rYOUBWTvKH0Eq0p58Gp6rI9+jDDD6ZMFWAFxpvRsKyZ7F5tCcEcxjeoDMte1h4zx
         9xlM/66PCc/R1696ZSTzSnVsxogW4vuUd2qEaRDwzyExoIhNIABEZki78j8ChgfFCUoj
         Q+vUL7mnCFcn89XqVmnNEDZC/z+J1zIiEAFKtVC8OKb30eu3RBoL7ieHJxk/nE3yWGfS
         jhNgkzpVsTro9e5zHrkD1nLVJjBngEStXmepQv/nv4esjH42A+8hD9DDy+WaPKR5v52k
         5F2VUx0WHKCNAG34nRRH8d2r8C1wpd4LBZIrT8lVABF+tnxOTAQXJpW5YGV0ROvi8Wa7
         x/DA==
X-Gm-Message-State: AOJu0YzjueF+4dQMAZhsVTBtyDPckYyRYNHq/XfqgJBWiWm7ONedAB4G
	Ijdl63wgEG/lDBXDgDzcKxCXsKLH0a6lt55P3oY0RijF4tUz91guerFoxRkN7g==
X-Gm-Gg: AeBDieudxFqb2uStPtGoLZ0htuFcxTsyljCzA0a6MDhtVw+00eNShPEI5a3TLDA2+e7
	6OUyfkiK94Y/zqeN3GwKAuRVNEUWIUGxDWj4DPYovmdOA4Dw9Qm0bt52gZf+GEYzVZbbJIk65dy
	DOwGRRY3a6FHnNdZLX4T/pbXN8P7qaucjX50rAhOytJA0TBzg/gX+WWITpicKaP/PVk+NwClkWO
	DDtUFb7pH/qXHimOoR2te+R448KdAjDs1QiwvYyM6ufw+lEs/nBzA1AGsHkhhr0eMLG9j/Krwxg
	gr3PCmmF1EC9/NAoVkZ8DpVm65rNFzqhLa4YdPhxuP5Xsyo/UCVrNiu44pMCHxjrJpehUCK8i40
	fAs36nyRQ74tfxc3r+vXu9d07r97KHaBTzWbM0FGZcRyG7P5O/gBTNh3OeI/SsFcb8usr70VnGh
	lhrH7bWVGHobMN15w8jG/EK/fGaZUgDJXJClGnbg4tCrv+lbuTVLcixNsBo0kn3JFrcLQKsBqPK
	H8Sgk3hUmuMVVAcjJzE
X-Received: by 2002:a05:6000:1a8b:b0:43d:1df7:e3af with SMTP id ffacd0b85a97d-43d595bbe8emr1451289f8f.22.1775684205254;
        Wed, 08 Apr 2026 14:36:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:c7c:37d6:c100:cca3:7cee:f0b5:b56f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43d473b8c1esm21404661f8f.12.2026.04.08.14.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 14:36:44 -0700 (PDT)
From: Adrian McMenamin <adrianmcmenamin@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Adrian McMenamin <adrianmcmenamin@gmail.com>
Subject: [PATCH] mtd: maps: vmu: add include to ensure maple mtd code builds
Date: Wed,  8 Apr 2026 22:29:51 +0100
Message-ID: <20260408212950.275065-2-adrianmcmenamin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_143647_790692_E51ACDD7 
X-CRM114-Status: GOOD (  10.18  )
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


maple.h included in vmu-flash.c references struct device and struct
device_driver, so we should explicitly include linux/device.h to ensure
the code builds without error.


Include header file required for build.

Signed-off-by: Adrian McMenamin <adrianmcmenamin@gmail.com>
---
 drivers/mtd/maps/vmu-flash.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 75e06d249ce9..e2a574a4b438 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/maple.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
