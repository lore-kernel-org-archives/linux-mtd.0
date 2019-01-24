Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F17C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 15:52:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5201218AF
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 15:52:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VqAy+VrY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5201218AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fvD1w6USzJrRdJC1PtGmdvypkPkX83KX6IcSJC5+Asg=; b=VqAy+VrYzhMEhD
	nz+KBf4UF1xi+9ab5GvBSgYPvqzAjTM/A1Cr3PwRoHOiBkGPMlsT1OK7YEaS4kUk+Yxbd7nmdmQis
	DRgMjt5PATNzRGzhV94WHSDXTQITPxEYZ59h1qiOnYEldL6Rs3rG170INZn15Gk/bDFO/e8S8cjfV
	tgrFHgQkXXfJVq4omrdxD1cRH6JJ91m2fnz9Et6YiJHWBUUZOqwWcpLILavVJ1Uq71i7xASSmRJP8
	iO0lhohN1TMZBIaizt7DxvY3eka8OZsOqdrqp5/qF7utL2epKCvJs/YqwLiRjYu/KCSOlJsdSaduv
	ZJ3NzqYR3HOolUAcKyYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmhIu-00037t-Tm; Thu, 24 Jan 2019 15:52:32 +0000
Received: from mx2.mailbox.org ([80.241.60.215])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmhIo-0002xf-3h
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 15:52:30 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id D3652A1AC0;
 Thu, 24 Jan 2019 16:52:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id qzugxR9fQG1X; Thu, 24 Jan 2019 16:52:21 +0100 (CET)
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: mtdcore.c: Remove empty lines at end of sysfs related
 functions
Date: Thu, 24 Jan 2019 16:52:20 +0100
Message-Id: <20190124155220.20258-1-sr@denx.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_075226_988125_47C234EE 
X-CRM114-Status: GOOD (  11.15  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some sysfs functions have empty stray lines after the return statement.
This patch remove those empty lines.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Boris Brezillon <bbrezillon@kernel.org>
---
 drivers/mtd/mtdcore.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 999b705769a8..bc4cd92509f3 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -155,7 +155,6 @@ static ssize_t mtd_flags_show(struct device *dev,
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE, "0x%lx\n", (unsigned long)mtd->flags);
-
 }
 static DEVICE_ATTR(flags, S_IRUGO, mtd_flags_show, NULL);
 
@@ -166,7 +165,6 @@ static ssize_t mtd_size_show(struct device *dev,
 
 	return snprintf(buf, PAGE_SIZE, "%llu\n",
 		(unsigned long long)mtd->size);
-
 }
 static DEVICE_ATTR(size, S_IRUGO, mtd_size_show, NULL);
 
@@ -176,7 +174,6 @@ static ssize_t mtd_erasesize_show(struct device *dev,
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE, "%lu\n", (unsigned long)mtd->erasesize);
-
 }
 static DEVICE_ATTR(erasesize, S_IRUGO, mtd_erasesize_show, NULL);
 
@@ -186,7 +183,6 @@ static ssize_t mtd_writesize_show(struct device *dev,
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE, "%lu\n", (unsigned long)mtd->writesize);
-
 }
 static DEVICE_ATTR(writesize, S_IRUGO, mtd_writesize_show, NULL);
 
@@ -197,7 +193,6 @@ static ssize_t mtd_subpagesize_show(struct device *dev,
 	unsigned int subpagesize = mtd->writesize >> mtd->subpage_sft;
 
 	return snprintf(buf, PAGE_SIZE, "%u\n", subpagesize);
-
 }
 static DEVICE_ATTR(subpagesize, S_IRUGO, mtd_subpagesize_show, NULL);
 
@@ -207,7 +202,6 @@ static ssize_t mtd_oobsize_show(struct device *dev,
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE, "%lu\n", (unsigned long)mtd->oobsize);
-
 }
 static DEVICE_ATTR(oobsize, S_IRUGO, mtd_oobsize_show, NULL);
 
@@ -226,7 +220,6 @@ static ssize_t mtd_numeraseregions_show(struct device *dev,
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE, "%u\n", mtd->numeraseregions);
-
 }
 static DEVICE_ATTR(numeraseregions, S_IRUGO, mtd_numeraseregions_show,
 	NULL);
@@ -237,7 +230,6 @@ static ssize_t mtd_name_show(struct device *dev,
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE, "%s\n", mtd->name);
-
 }
 static DEVICE_ATTR(name, S_IRUGO, mtd_name_show, NULL);
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
