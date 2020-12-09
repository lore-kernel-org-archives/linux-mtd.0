Return-Path: <SRS0=ozsj=FN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3E2C4361B
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Dec 2020 09:31:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB49523B81
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Dec 2020 09:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB49523B81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0jfHNgYnmRFhPtBBSQ+LxI+rfGrVLaiR/9Agxq9ZiEs=; b=o50/36n08nbrcWtsVx86SSCsLA
	CHz78w0vYZ3pprcrOAjrQM1kvW6noS294rt+WdXqoBmJz/oGEmPSjD/WB8xR2Os/14ZrTkvhRXqFO
	ev+l4SlKBcg3qZV7JDFlCwXnfvIwXmt2KZ2Pr7POOSGYxu0eJriEQ3zfKYD5PWGvQPaJj9NcIRnZC
	zpqTypud51FPqtxbub8X1Ddf2mLQR7pxL+UL5l7sWK48z7FGXIXS1i9jmE7Tfk/bJTMFDcb2NVIZm
	5txaJPxJCEYgqQ0/71ZB0NNDLVzz13+2aucd6mWYhRao7sSAHD4jQk7yHVqSEkeV0C+zqvBHRlnNm
	6KYlOIXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmvoG-0002uH-St; Wed, 09 Dec 2020 09:30:56 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmvoE-0002tZ-Kn
 for linux-mtd@lists.infradead.org; Wed, 09 Dec 2020 09:30:55 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CrWwr0JddzknSf;
 Wed,  9 Dec 2020 17:30:04 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Wed, 9 Dec 2020 17:30:35 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] mtd: rawnand: simplify the cs553x_write_ctrl_byte()
Date: Wed, 9 Dec 2020 17:31:03 +0800
Message-ID: <20201209093103.20742-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_043054_924739_03C79819 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Simplify the return expression.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/mtd/nand/raw/cs553x_nand.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index 282203debd0c..a616aaa2e3dc 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -105,17 +105,12 @@ static int cs553x_write_ctrl_byte(struct cs553x_nand_controller *cs553x,
 				  u32 ctl, u8 data)
 {
 	u8 status;
-	int ret;
 
 	writeb(ctl, cs553x->mmio + MM_NAND_CTL);
 	writeb(data, cs553x->mmio + MM_NAND_IO);
-	ret = readb_poll_timeout_atomic(cs553x->mmio + MM_NAND_STS, status,
-					!(status & CS_NAND_CTLR_BUSY), 1,
-					100000);
-	if (ret)
-		return ret;
-
-	return 0;
+	return readb_poll_timeout_atomic(cs553x->mmio + MM_NAND_STS, status,
+					 !(status & CS_NAND_CTLR_BUSY), 1,
+					 100000);
 }
 
 static void cs553x_data_in(struct cs553x_nand_controller *cs553x, void *buf,
-- 
2.22.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
