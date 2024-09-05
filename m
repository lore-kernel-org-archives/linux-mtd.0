Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F778CD4F58
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2024 05:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gm/TsWRbut4om/Cb4lPay8h9O4rhI4BOFiLytJg9KSQ=; b=P9MqVoZf9W2LBH
	W4qJlmGiurcLXsuaygjenhBgucEaNNVjQ+2z7QnTaj2+W7mFw31+snQ4Or6Ws3NM/OaaqEfpxkTcE
	VDMCjCkugukK40huXYqj6VgBTZs9pTlLL80BHSaM94ttQjLCwRirZaMhbOjZF+X+h4zrFPwpYTwnD
	Pb3yQSHNEzOaG6nWcKaIEf/yB/5tgBN7J1YMEr54O8TG/AVcOgMMAbN9VHZxwR0yv53fjFvMrRJ7/
	ws+PxsWTF1Lsr63F81or5sp4wCBsRe+2rnWxbNTiOH36Z2fzEmeJw80xfB59DHS3BKvvqqc7zUOMK
	uu3wqlCZi772p3f3UyJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm5TF-00000007653-1Vga;
	Thu, 05 Sep 2024 05:55:53 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm5T9-0000000762U-3d33
	for linux-mtd@lists.infradead.org;
	Thu, 05 Sep 2024 05:55:49 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5df9c34c890so255850eaf.1
        for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2024 22:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725515747; x=1726120547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcvMsJDZUgTK4x9w25QQdXqSLspvJqtCWujPzWg7AMk=;
        b=O32YiLDvUY7Jkuhx5mo+HcMS8SZDnycfJO0j9+o5LQsxwKs6Oi8K7sfzCMhNKvABAv
         sOQwcnraDJHGUDkJC/fpl91HLUjm2ti+yXa/9pP4R7MKfl+JnM22am5+RgktEVKck/FB
         H8tb0aT1/I+xkMiNQFRp7cmefLEHdyI6FhlJtr2WsIwijM2An0T4TZA6TsNjksa+MqRw
         71gLPTy0Endlknpzj+DbmN+O3QvfAE5I5ikAAmFfqa/4iaN25EKJXAYvQDolCvL/06n4
         poeT1p5UTNFwnXN/6LBhug5QSzMxrvmCMeasqm3toUhz+4aj9SL1ShCo7PCTI6bRSN3Y
         X+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725515747; x=1726120547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcvMsJDZUgTK4x9w25QQdXqSLspvJqtCWujPzWg7AMk=;
        b=EjEsPm71JwQqffGUDS0AdJ2RUtdzak1ltHeECiP+Dq/GoF07UTkOGskG0FZ3dSQDUs
         OdBSg6m7y0zIxi+mU6ECsLB3W0QNNzh2UimaVmr81QHZiMrsvq8W93LJKvwr3SUQtWR9
         gJrZMRoXTMLplRir8wHE3JW6s6Djt6cZxtUGdbUOeV2Hjg54po9SmZsk9x7ZvkYf8Y5W
         zzNS45tXdCINzzHmtSJkmERTShh5bkC9H/oYRCAhU05rNnIog+9UiA1VlAaoAVFGEuvi
         OSoqod6/ELjIPtdWXcwXSpxnd3q/sDg2F95P5T8WGhu50+1O8UshExCQrnSOHNGH52Mr
         wrvg==
X-Forwarded-Encrypted: i=1; AJvYcCUfgwH5TAYQnzvesoEzb/oC75kwoZT7wMkoEeAU852XbjzXpetwQnU7I9gfLEKgq3Nslw9hJ2fxst4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOBNknHVpurA+ZTFgElbCKJz1kagDp9nDvD/q2g40Azw6Qw9nc
	4sDe7Z/gngzpJ/8o7pRt0gOZTWCQpJx3GzXXqr9H/IpT5aBC4f5J
X-Google-Smtp-Source: AGHT+IEWrt51EUydiFhkdZrDSiCTxnG91yXpRuuCiGvbr+IzvMludHnM29bDlBOR3lD8IGLA7E+Ecw==
X-Received: by 2002:a05:6870:f613:b0:25e:1ca6:6d09 with SMTP id 586e51a60fabf-277900932a6mr24398037fac.8.1725515746776;
        Wed, 04 Sep 2024 22:55:46 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778542276sm2583299b3a.91.2024.09.04.22.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 22:55:45 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 6570E802EC;
	Thu,  5 Sep 2024 14:04:09 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 2/2] mtd: spi-nand: Add read retry support
Date: Thu,  5 Sep 2024 13:53:33 +0800
Message-Id: <20240905055333.2363358-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240905055333.2363358-1-linchengming884@gmail.com>
References: <20240905055333.2363358-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_225547_940991_A06124BF 
X-CRM114-Status: GOOD (  18.11  )
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

When the host ECC fails to correct the data error of NAND device,
there's a special read for data recovery method which host setups
for the next read retry mode and may recover the lost data by host
ECC again.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index e0b6715e5dfe..2f21ea926132 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -640,6 +640,7 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 	struct nand_io_iter iter;
 	bool disable_ecc = false;
 	bool ecc_failed = false;
+	u8 retry_mode = 0;
 	int ret = 0;
 
 	if (ops->mode == MTD_OPS_RAW || !spinand->eccinfo.ooblayout)
@@ -657,20 +658,45 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 		if (ret)
 			break;
 
+read_retry:
 		ret = spinand_read_page(spinand, &iter.req);
 		if (ret < 0 && ret != -EBADMSG)
 			break;
 
-		if (ret == -EBADMSG)
+		if (ret == -EBADMSG && spinand->info->fixups) {
+			if (spinand->read_retries && ((retry_mode + 1) < spinand->read_retries)) {
+				retry_mode++;
+				ret = spinand->info->fixups->setup_read_retry(spinand, retry_mode);
+				if (ret < 0)
+					break;
+
+				/* Reset ecc_stats; retry */
+				mtd->ecc_stats = old_stats;
+				goto read_retry;
+			} else {
+				/* No more retry modes; real failure */
+				ecc_failed = true;
+			}
+		} else if (ret == -EBADMSG) {
 			ecc_failed = true;
-		else
+		} else {
 			max_bitflips = max_t(unsigned int, max_bitflips, ret);
+		}
 
 		ret = 0;
 		ops->retlen += iter.req.datalen;
 		ops->oobretlen += iter.req.ooblen;
+
+		/* Reset to retry mode 0*/
+		if (retry_mode) {
+			ret = spinand->info->fixups->setup_read_retry(spinand, 0);
+			if (ret < 0)
+				break;
+			retry_mode = 0;
+		}
 	}
 
+
 	if (ops->stats) {
 		ops->stats->uncorrectable_errors +=
 			mtd->ecc_stats.failed - old_stats.failed;
@@ -1095,6 +1121,9 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->flags = table[i].flags;
 		spinand->id.len = 1 + table[i].devid.len;
 		spinand->select_target = table[i].select_target;
+		spinand->info = info;
+		if (spinand->info->fixups && spinand->info->fixups->init_read_retry)
+			spinand->read_retries = spinand->info->fixups->init_read_retry(spinand);
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.read_cache);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
