Return-Path: <SRS0=ZvR1=RQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34905C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 13:46:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00EE12087C
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 13:46:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZtDFc+OQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00EE12087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zte.com.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=LykigqqHRy/Da5DBaYku2dbENGP9rSGj/fSWWNvr8UQ=; b=ZtD
	Fc+OQMpyFXQIyZncXcdk/FVEcxDWy6WgW1xCHohDC8xma0jCsgz3nrJKp190DoyE2LrIiwze5YeLo
	kWOGtekWX14sR+CpukX0Uig/Kpalu4WWg0TKVLSPCDDIgo23PY1OTIy/Al8PruiFniKAITLNqJhMe
	Y3nDWswS4T67M57G/CxzCTAQFU/m+0Qfp+Dfgb+OhSgAh5KuHNl5y7iQJGE2lzu2TrTIbz8i6WyiR
	LDnaaiVXTwmOUTkTDkBffZ/Zadxcf+Wo1YUlsrVJn0z2aK+4JCiww/iEV4+7SwguvtvftY4uOXgr4
	OotgBM3wrlPTLf9KG8uUi9UNVITBBQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h44D3-0003LR-7N; Wed, 13 Mar 2019 13:46:17 +0000
Received: from smtprz14.163.net ([106.3.154.247] helo=smtp.tom.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h44Cx-0003Ks-Um
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2019 13:46:15 +0000
Received: from 172.25.16.147 (unknown [172.25.16.147])
 by freemail02.tom.com (Postfix) with ESMTP id 4202BB00D4A
 for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2019 21:46:02 +0800 (CST)
Received: from 172.25.16.91 (HELO smtp.tom.com) ([172.25.16.91])
 by localhost (TOM SMTP Server) with SMTP ID 2049720325
 for <linux-mtd@lists.infradead.org>;
 Wed, 13 Mar 2019 21:46:02 +0800 (CST)
Received: from antispam2.tom.com (unknown [172.25.16.56])
 by freemail02.tom.com (Postfix) with ESMTP id 794F8B00D31
 for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2019 21:46:01 +0800 (CST)
Received: from antispam2.tom.com (antispam2.tom.com [127.0.0.1])
 by antispam2.tom.com (Postfix) with ESMTP id 76B4A816F8
 for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2019 21:46:01 +0800 (CST)
X-Virus-Scanned: Debian amavisd-new at antispam2.tom.com
Received: from antispam2.tom.com ([127.0.0.1])
 by antispam2.tom.com (antispam2.tom.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dk3ughK_kfHf for <linux-mtd@lists.infradead.org>;
 Wed, 13 Mar 2019 21:45:59 +0800 (CST)
Received: from localhost (unknown [110.184.152.196])
 by antispam2.tom.com (Postfix) with ESMTPA id 9562B81067;
 Wed, 13 Mar 2019 21:45:58 +0800 (CST)
From: Liu Xiang <liu.xiang6@zte.com.cn>
To: bbrezillon@kernel.org
Subject: [PATCH v2] mtd: spi-nor: Return error when nor->addr_width does not
 match the device size
Date: Wed, 13 Mar 2019 21:45:53 +0800
Message-Id: <1552484753-3393-1-git-send-email-liu.xiang6@zte.com.cn>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_064612_234033_DC771985 
X-CRM114-Status: UNSURE (   8.36  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, Liu Xiang <liu.xiang6@zte.com.cn>,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, liuxiang_1999@126.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In some is25lp256, the DWORD1 of JEDEC Basic Flash Parameter Header
is 0xfff920e5. So the DWORD1[18:17] Address Bytes bits are 0b00,
means that 3-Byte only addressing. But the device size is larger
than 16MB, nor->addr_width must be 4 to access the whole address.
An error should be returned when nor->addr_width does not match
the device size in spi_nor_parse_bfpt(). Then it can go back to
use spi_nor_ids[] for setting the right addr_width.

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
---
 drivers/mtd/spi-nor/spi-nor.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6e13bbd..63933c7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2811,6 +2811,14 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	}
 	params->size >>= 3; /* Convert to bytes. */
 
+	/*
+	 * If the device exceeds 16MiB, addr_width must be 4.
+	 * addr_width == 3 means the Address Bytes we are
+	 * reading from BFPT is wrong.
+	 */
+	if (params->size > 0x1000000 && nor->addr_width == 3)
+		return -EINVAL;
+
 	/* Fast Read settings. */
 	for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_reads); i++) {
 		const struct sfdp_bfpt_read *rd = &sfdp_bfpt_reads[i];
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
