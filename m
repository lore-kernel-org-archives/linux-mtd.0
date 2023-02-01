Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C73C38142
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Feb 2023 09:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=MrMgyLjLndl7ABwDtB/BKfLfAqeECGFx/V3+p6Wqe/c=; b=PYX
	xmmwoABM2w5cUI0XuBODwmuSmyV9a/jlcXu1hFJmrYBUczJCThVMiJPifxQf7oRLk8Wj3uh0moQeN
	aDUaqeqyCl1nf4PMRwyNA1U3ukEwUGMrz3Ur/Rfntx+t0n38C67Jzobsvtk+77x7vd9z3eKRTSg5t
	Ueo66hitKLm8YI60vbRVLEzCWegLXBn8NfTry0rNliiORdo1Un/7jlLF4ErINW/or0YsWefo3WyRZ
	yR/Jp08fNp3uX9CB6BlojRMShAkIm5ws5WVIvXAEhfofrMmS6Mq9V+cHlLvpHQJaTT4mA09pV4MlO
	ZMWMXuWfn+duH+qzaN2PJDg96ACV7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9SL-00B1Y8-J7; Wed, 01 Feb 2023 09:31:05 +0000
Received: from mxhk.zte.com.cn ([63.216.63.35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9S9-00B1Po-1P
	for linux-mtd@lists.infradead.org; Wed, 01 Feb 2023 09:30:54 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4P6Gqp1Ycrz6FN00;
	Wed,  1 Feb 2023 17:30:46 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 3119UQ3S099088;
	Wed, 1 Feb 2023 17:30:26 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Wed, 1 Feb 2023 17:30:29 +0800 (CST)
Date: Wed, 1 Feb 2023 17:30:29 +0800 (CST)
X-Zmail-TransId: 2af963da313540da8db5
X-Mailer: Zmail v1.0
Message-ID: <202302011730294177177@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <tudor.ambarus@linaro.org>
Cc: <pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBtdGQ6IHNwaS1ub3I6IHJlbW92ZSBkdXBsaWNhdGUgaW5jbHVkZWQgaGVhZGVyIGZpbGVz?=
X-MAIL: mse-fl1.zte.com.cn 3119UQ3S099088
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID 63DA3146.003 by FangMail milter!
X-FangMail-Envelope: 1675243846/4P6Gqp1Ycrz6FN00/63DA3146.003/10.5.228.132/[10.5.228.132]/mse-fl1.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63DA3146.003/4P6Gqp1Ycrz6FN00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_013053_276039_9F9E9EA3 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
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

From: ye xingchen <ye.xingchen@zte.com.cn>

linux/delay.h is included more than once.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/mtd/spi-nor/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e9ea14598ec3..d67c926bca8b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -16,7 +16,6 @@
 #include <linux/math64.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
-#include <linux/delay.h>

 #include <linux/mtd/mtd.h>
 #include <linux/of_platform.h>
-- 
2.25.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
