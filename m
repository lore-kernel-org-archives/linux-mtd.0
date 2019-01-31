Return-Path: <SRS0=cI5g=QH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE26C4151A
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 14:08:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6108B218AC
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 14:08:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H5xchHiD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6108B218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/j8hK8bOMse5HFGxEd8OBC9K2Z8d2/o2mtVWd8j3TPY=; b=H5xchHiDzhZq/8
	ORDKIe8S0J+7Ocip73LgDGtRxAd7jlpXr4g3eMscH0XPyhatiEwRIC19eoCMoUDDhntUYEbvYpNrm
	NxS3ZILTc0rCr0ETOzhQh/zLMEpQ8suSsFHrDxvN9Xk5EHtRe+uPI7zZjb4rz37IxA2+IF8ayJWpc
	GwaA005y0gPAcjfyvOBVhIjPiNbF3jSOJOHojxoPXqaDPrno49L6seoQhOq4/laFPFUXHbbnl6Ixi
	K9AllQWPcxVgqsHlE9bSv/FxbFPy6EwWsKNauT3pPl/SkG1euoAin5neWDahJBWDqeYK57pMr7PNc
	u678SFmkiS7c5RpFFnrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpD15-0000DT-IJ; Thu, 31 Jan 2019 14:08:31 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpD11-0008Tk-35
 for linux-mtd@lists.infradead.org; Thu, 31 Jan 2019 14:08:29 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1gpD0u-0004V8-LQ; Thu, 31 Jan 2019 14:08:20 +0000
From: Colin King <colin.king@canonical.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: part: fix incorrect format specifier for an unsigned
 long long
Date: Thu, 31 Jan 2019 14:08:20 +0000
Message-Id: <20190131140820.7422-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_060827_279199_2F71C890 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

An unsigned long long is being formatted with %lld instead of the unsigned
version %llu. Fix this.

Clean up cppcheck warning:
%lld in format string (no. 1) requires 'long long' but the argument type
is 'unsigned long long'.

Fixes: a62c24d75529 ("mtd: part: Add sysfs variable for offset of partition")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/mtdpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 60104e1079c5..cca681b1a514 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -568,7 +568,7 @@ static ssize_t mtd_partition_offset_show(struct device *dev,
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
 	struct mtd_part *part = mtd_to_part(mtd);
-	return snprintf(buf, PAGE_SIZE, "%lld\n", part->offset);
+	return snprintf(buf, PAGE_SIZE, "%llu\n", part->offset);
 }
 
 static DEVICE_ATTR(offset, S_IRUGO, mtd_partition_offset_show, NULL);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
