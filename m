Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AB8C28CC5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 03:15:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3E3E27B09
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 03:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="polDDiJj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QEj5nDUS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3E3E27B09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5676j4gxhfH2SaVaZlOLEL03s18WRQdkKFM5LJAQgog=; b=polDDiJjOYKQZo
	09vBAiY5X8GP4vVShH0MDQyE4RSLNZGtVCxUrmWlaYB+3qJaJqXSAOjbllsDVznpXlITT4JezuaKC
	cXExKu5xbWHjwwjAMWFjyaIV3x1OH4sCgP3zuyISJ6u2yOu+EK0tvwP9ixiDs14HPcSsaJi/RfHF6
	ck7DS9WBc+UJBTA7PvyPyaThXY46wme6Kk0lLK1k8pG/kWIWWLLNuq4l7svGGpIITKhBGTIvVKTsg
	94q3y2xbDiNVnxdBZTU32Lq5ecSlrJw5OPm4Rr9CrRQneMxS5L0Yhd4yan6ML1MdB/N7BscTjT3ah
	2NRaZpMZOS33P0YIH/0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXdRG-0000bt-C6; Mon, 03 Jun 2019 03:15:10 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXdR6-00084A-P4
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 03:15:02 +0000
Received: by mail-pg1-x543.google.com with SMTP id v9so7401185pgr.13
 for <linux-mtd@lists.infradead.org>; Sun, 02 Jun 2019 20:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vJFmd3FAu40HIn/X6mIsd3/+0s2AcHF9ptL9qhSoC2M=;
 b=QEj5nDUSlQdbLn00q0/fFclQZiizA28AoXZrSYKp9idup4EoohxnMrdh15KP2vA0y/
 izG1ZduYTkTxPN3tDgKWOHUUzVjKBDFQwIWAkgzKM9W2+S6EaubeIbg9sS53vi18bZac
 OjHKvNAyd1eT4XWq9q+6pwVTnaQJyacYNx9D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vJFmd3FAu40HIn/X6mIsd3/+0s2AcHF9ptL9qhSoC2M=;
 b=LVcDioXp4O7MfXELYDhcLIfrxXTUJElmDoGyIeMIARZU7vx3d/5uWm1oWCfqAxVbJf
 6TOw9/Qq3+DNwiICPAugjiXzAWBqHQ54PKGmgmBEtHJIclsztDYAOpI23ZNjb2m24mRA
 9nYkDx4blpfz+95k1pATJ/YYZUmVzqZmkwNjYMLur0Af8Y95zwoGEnulL0qj3VOruo3O
 sZlhGdqd9xZiI/ZHzTozyU6qrho4rGn9NNkNj+QvI/jvWJFbiSGa3xl2pkA1X+Hz1RBD
 XCPmsBcz6otdaL47PpHzu3IwNuYK6GJeWC2ZzirHfDd/8QuJi45uPAiY/Ssc0Oht9ida
 yZVw==
X-Gm-Message-State: APjAAAWLJWtIDIt9jI39icdLQHtc+DtPGbkxW5Uh0PasXeRTEMpHKEMh
 oLJ3gziAycsZT5Um7v+wksGF9MZqN7M=
X-Google-Smtp-Source: APXvYqxriL5by67Vz+QKDkOLx1UMuluTOEJtVBqAoqZcDWLEbSm+bVLdCXgp0QB8rOkaJp8Am6JRQw==
X-Received: by 2002:a63:158:: with SMTP id 85mr26305410pgb.101.1559531699914; 
 Sun, 02 Jun 2019 20:14:59 -0700 (PDT)
Received: from zhuohao-z440.tpe.corp.google.com
 ([2401:fa00:1:10:e25c:13cd:9607:cc7f])
 by smtp.gmail.com with ESMTPSA id b128sm6473234pfa.165.2019.06.02.20.14.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 20:14:59 -0700 (PDT)
From: Zhuohao Lee <zhuohao@chromium.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v5 2/2] mtd: spi-nor: enable the debugfs for the partname and
 partid
Date: Mon,  3 Jun 2019 11:14:51 +0800
Message-Id: <20190603031451.60749-2-zhuohao@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190603031451.60749-1-zhuohao@chromium.org>
References: <20190603031451.60749-1-zhuohao@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190602_201500_812435_2539CB12 
X-CRM114-Status: GOOD (  11.74  )
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
---
 drivers/mtd/spi-nor/spi-nor.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6e13bbd1aaa5..acc1915b380b 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -3935,6 +3935,18 @@ static void spi_nor_resume(struct mtd_info *mtd)
 		dev_err(dev, "resume() failed\n");
 }
 
+static void spi_nor_debugfs_init(struct spi_nor *nor,
+		const struct flash_info *info)
+{
+	struct mtd_info *mtd = &nor->mtd;
+
+	mtd->dbg.partname = info->name;
+	if (!mtd->dbg.partid)
+		mtd->dbg.partid = devm_kasprintf(nor->dev, GFP_KERNEL,
+						"spi-nor:%*phN",
+						 info->id_len, info->id);
+}
+
 void spi_nor_restore(struct spi_nor *nor)
 {
 	/* restore the addressing mode */
@@ -4036,6 +4048,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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
