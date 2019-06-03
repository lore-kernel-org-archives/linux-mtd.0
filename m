Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42968C28CC6
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 12:39:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C48925FCC
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 12:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z/07MUsm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fkW1nFXn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C48925FCC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WAmy31ewQFkrzUhTkjSXjnfY5jBHuoBaXZKHtwuoOWA=; b=Z/07MUsmfmufpO
	APiSO9QbCprarXJ6L/3jHhB7prCAy9Ex6CnAHmsr/uqRVtfymNd+Vgc+PclBdWXeEAGqw+WbpxMCT
	przukPYzeniisu158wNjI5QlV484p4QS7mKJxAagNVnfgvdBQde8g8cReuk5Y8HiKeassFMHQf8Ur
	M4C3Ur/JlJZRqXpB9uhqHZqo+d8e51IKHo2PeEov+qnZk1ibek5Vh2bcRW0XBQTD898vZUBSzNu9V
	9I5ZawaM9rab46cnH6McoT2hOLAukUlL8wP1S7mFjmNS160BkJXIpSi6n9nHFfJh+dMTUdFpxPZoB
	M7tzr4TVavRkjqlSxytw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXmEw-0001VX-1o; Mon, 03 Jun 2019 12:39:02 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXmEt-0001Um-DC
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 12:39:00 +0000
Received: by mail-pf1-x442.google.com with SMTP id d126so10572969pfd.2
 for <linux-mtd@lists.infradead.org>; Mon, 03 Jun 2019 05:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pwV/Sm23vrBT9LvoRG5nIcWDaJWbnGMNQkzBrzd0dmM=;
 b=fkW1nFXn0lMbPN42M2tsFbui+UT6YfnkrOOLBdqeWzw9ZBLt1fxIKRZ817K2pN7FNV
 wFMRWnC33fegqhD8KIpkO2NfPJEKHjIkGoSkK52r1L3lzCNjITn9pq1ftF5mACxAm7OU
 ho+SzUkubshcooLoR/Cs/MiVDdkaGfowxTDDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pwV/Sm23vrBT9LvoRG5nIcWDaJWbnGMNQkzBrzd0dmM=;
 b=qBMI17AkF3mboE33qbDmg3mT7t08DYdaeLf+DBfBMu/Pby3tt7qcapDpVeEQcWN57T
 N6JcWS77zegAthCm+Aj9g2/KyLBHhKKxb59GwOVIgzGMrYF2hEXTVwxZhGgntDwGmq7T
 qwztASck0uoUZqVp9NeSZ61q0DrOIHLPkvY0uAlVsfU8fcxpVQG1uu042t6mZg65vYZV
 JubCrMt3CRBgWz0hH4yVwZpvxmpLZOLVH0tuBLPRkO1C6rOxORDIFLH9RraEq9l3ovlV
 ApEJBlR1J7rr3C0EwWUHwkOvDSmqPxpsbkcwDVDanJ3e0C/ThAEZCvKXJje6K3KQFQ1C
 eTTQ==
X-Gm-Message-State: APjAAAWX4m1jOX5maQ0G1Sdpt/TQ+b+9CSZn42WnbDzepTktvlinUTNQ
 NzIoLI+tnYsa3hWYZa2+Op0VsQjhyJQ=
X-Google-Smtp-Source: APXvYqyKVbhwMgb3vuN3iCKZDMSZdVPLYgjJjWeRxozLWsIdkr1pTmw0AxXekAAcSP7l5eJPhfZAMg==
X-Received: by 2002:a63:6c83:: with SMTP id h125mr27004114pgc.86.1559565538329; 
 Mon, 03 Jun 2019 05:38:58 -0700 (PDT)
Received: from zhuohao-z440.tpe.corp.google.com
 ([2401:fa00:1:10:e25c:13cd:9607:cc7f])
 by smtp.gmail.com with ESMTPSA id j20sm14232899pfi.138.2019.06.03.05.38.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 05:38:57 -0700 (PDT)
From: Zhuohao Lee <zhuohao@chromium.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v7 2/2] mtd: spi-nor: enable the debugfs for the partname and
 partid
Date: Mon,  3 Jun 2019 20:38:53 +0800
Message-Id: <20190603123853.65676-1-zhuohao@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_053859_444272_BA6C5C05 
X-CRM114-Status: GOOD (  10.91  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: drinkcat@chromium.org, zhuohao@chromium.org, bbrezillon@kernel.org,
 richard@nod.at, briannorris@chromium.org, marek.vasut@gmail.com,
 boris.brezillon@collabora.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch adds spi_nor_debugfs_init() for the debugfs initialization.
With this patch, we can read the partname and partid through the
debugfs.

The output of new debugfs nodes on my device are:
cat /sys/kernel/debug/mtd/mtd0/partid
spi-nor:ef6017
cat /sys/kernel/debug/mtd/mtd0/partname
w25q64dw

Signed-off-by: Zhuohao Lee <zhuohao@chromium.org>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6e13bbd1aaa5..52b1a2da9ac0 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -3935,6 +3935,17 @@ static void spi_nor_resume(struct mtd_info *mtd)
 		dev_err(dev, "resume() failed\n");
 }
 
+static void spi_nor_debugfs_init(struct spi_nor *nor,
+		const struct flash_info *info)
+{
+	struct mtd_info *mtd = &nor->mtd;
+
+	mtd->dbg.partname = info->name;
+	mtd->dbg.partid = devm_kasprintf(nor->dev, GFP_KERNEL,
+					"spi-nor:%*phN",
+					 info->id_len, info->id);
+}
+
 void spi_nor_restore(struct spi_nor *nor)
 {
 	/* restore the addressing mode */
@@ -4036,6 +4047,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	mtd->_read = spi_nor_read;
 	mtd->_resume = spi_nor_resume;
 
+	spi_nor_debugfs_init(nor, info);
+
 	/* NOR protection support for STmicro/Micron chips and similar */
 	if (JEDEC_MFR(info) == SNOR_MFR_ST ||
 	    JEDEC_MFR(info) == SNOR_MFR_MICRON ||
-- 
2.22.0.rc1.311.g5d7573a151-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
