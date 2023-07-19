Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB484EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 10:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IpKUAjgfl/KDFNnWp9bOoYr3G2ykRhqxyKHFIiuezPE=; b=Bz2hSHtFf5/Nrm
	Gy7oRI3qKVyxgJQ2dhBY7eekX/q26NfjprzC/CAMIIOWbxi3TOtXF3MumpF4iwq6QP5mD+7778BSs
	14G7CGITPhi7BznayHwLRHuYyfXE7VEhyaI9BTROdIA82p/Y74nxVTisAzPnle2o9rJ2xsEU+wpml
	oaI+ArjRz/rlr3cX0yoV4PlR2Qio0Dv9Wapxh8Kmk78A9z+RheAcDqCaXISvxBLMHCzlHo3UffosP
	yeNdi6bRK/xBd0Q4Hz52ZnnU2hat98a18stLsZuCWEs3ekUUDJsWWzYntxsnGKWgjx5YJ9Rr/vvrn
	gMn5ZSW7QubwcWnX+Nog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4VR-006iiI-2E;
	Wed, 19 Jul 2023 10:34:05 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4VO-006igF-0A
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 10:34:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbef8ad9bbso67327505e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 19 Jul 2023 03:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689762836; x=1692354836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VXj5YGAc3yTaYjQDt+pu+QsTbsvPJHMLueGYcTvQb+0=;
        b=DjurqgxKYZebo4JylN2vIh/fMENaVlf3jotRX8Jg7yXtW/SC4/fmqteKIL5pUDwRT6
         qUiuO9hCCAo7SZpXqJZT6QWZq3rQCFFm3GzgMJkWYYta4tF8BK+NExIKw3RHwNbzV0m4
         aimjZNFIJBteaTAmumlMqFjcDuXPnqDCrRMRFhvKB9DuPSZm5PgGuqGL88ly5WXcSGZO
         u2+zqv2maZfybRpyWkYBTHdEId0lrMrpeG4Hq2SMkCibTL1VcBaE/SMzkFVxZ3cmYEJB
         BKdiLAYb4dt6xD2czd8Gd2uBS0tjfiTZSA2u+5SupPo2nhYUOmkBVvcnvkeKjbt1wX/M
         T3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689762836; x=1692354836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXj5YGAc3yTaYjQDt+pu+QsTbsvPJHMLueGYcTvQb+0=;
        b=KUrzWQjiRDHFLjOKl0butQdLj69iVHXiVuIDl/caojj2ss1liNfYMoB8DjNAA0EQtG
         ZMyOm/KkhCxumUivS+Zul2LWnpdzR7yRiOutz22stfBt8ROJxDqVVvOsLzhKxytt6lDZ
         uFuPABvaxMkbuSkLMGT5XZiVoLKa+mdQ1hZvhl10Z7Nlz9O0pvIXHt8C/yU19fbZc0rd
         vEENTEtJBwjWxafC22nOlOvCDfOcjdH+3MW/78r355U8Gb1m/MNV7L99BSFju5m/RtDc
         8+gO9ztroXyvNgk5DyJXwe/XR7jqp+H+GLLgx+uxF+IUEZJNrVFrvCQgbnatTCuDUgGF
         W/xA==
X-Gm-Message-State: ABy/qLb4FhNsMgW9Blq7mJUycN4iccOzCJyXJYMVMVl3gzhmKl/eK9gR
	c4WJCJ0HtbwmVqxv9Qte1gg=
X-Google-Smtp-Source: APBJJlHb7B53XS1NPP9Kuu6/r1UpBABC4NsUI/V+drBqZJGeIG7P364BxAeqpOf1IQHIWTiJs/QlSA==
X-Received: by 2002:a05:600c:2150:b0:3fa:8fb1:50fe with SMTP id v16-20020a05600c215000b003fa8fb150femr1749513wml.15.1689762835416;
        Wed, 19 Jul 2023 03:33:55 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id g8-20020a7bc4c8000000b003fa8158135esm1377185wmk.11.2023.07.19.03.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 03:33:54 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] mtdblock: make warning messages ratelimited
Date: Wed, 19 Jul 2023 11:33:54 +0100
Message-Id: <20230719103354.2829366-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_033402_090764_9AAB3305 
X-CRM114-Status: GOOD (  14.63  )
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

When exercising various dev interfaces with stress-ng the mtdblock drivers
can be (ab)used to generate a lot of warning messages. Make these rate
limited to reduce the kernel log from being spammed with the same messages.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/mtd/mtdblock.c    | 2 +-
 drivers/mtd/mtdblock_ro.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index fa476fb4dffb..9751416c2a91 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -262,7 +262,7 @@ static int mtdblock_open(struct mtd_blktrans_dev *mbd)
 	}
 
 	if (mtd_type_is_nand(mbd->mtd))
-		pr_warn("%s: MTD device '%s' is NAND, please consider using UBI block devices instead.\n",
+		pr_warn_ratelimited("%s: MTD device '%s' is NAND, please consider using UBI block devices instead.\n",
 			mbd->tr->name, mbd->mtd->name);
 
 	/* OK, it's not open. Create cache info for it */
diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
index 66ffc9f1ead2..ef6299af60e4 100644
--- a/drivers/mtd/mtdblock_ro.c
+++ b/drivers/mtd/mtdblock_ro.c
@@ -49,7 +49,7 @@ static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	dev->readonly = 1;
 
 	if (mtd_type_is_nand(mtd))
-		pr_warn("%s: MTD device '%s' is NAND, please consider using UBI block devices instead.\n",
+		pr_warn_ratelimited("%s: MTD device '%s' is NAND, please consider using UBI block devices instead.\n",
 			tr->name, mtd->name);
 
 	if (add_mtd_blktrans_dev(dev))
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
