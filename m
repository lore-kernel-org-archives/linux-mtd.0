Return-Path: <SRS0=1vkS=WR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0028BC3A59E
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 05:17:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C089622CE3
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 05:17:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G61FLof2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JkAh4bdf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C089622CE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=1QJW+8fk0jklOQWmi0tPaJq8kE7LIEgvw61Yzc2EoMQ=; b=G61FLof2wsxbeB
	5bqDbqPiQfPmVHAVGR1u/VWtQJsVC6yGkvoVMkMnpuEOdL7JbKcJNGZU8kXvkeZMQsDclRE3xvXp5
	hAmlloDta71wcvE9BjEmtdz7gYKd33u8crSSPfg9snEgtmx3goCWgMh3KVncWUgICfUiFnVhBcfAb
	m5gbXnEJdaMl8GpvLua9p8Zh7jfujO7IJ88xq3jjHC81CuBYQJJYJniNNrMCtu/slWF/FnHrT68pS
	LUhlUnhyMYJuT4Ver6mb7QODcDHijlCMRATsbEn/CDeKnTigJxub8t0eEcjW5pXwKHnhQCOqiVvvu
	i0Y8MSOCIVLWDzWmFwZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Iz9-0003j1-3B; Wed, 21 Aug 2019 05:16:39 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Iz4-0003ic-Bq
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2019 05:16:36 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20190821051628epoutp0341c74683ba2424e6deaf75c7df809c63~82EtTpyLG2659526595epoutp03H
 for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2019 05:16:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20190821051628epoutp0341c74683ba2424e6deaf75c7df809c63~82EtTpyLG2659526595epoutp03H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1566364588;
 bh=Uey4MB9nWCLScwG1ZMjoV63Cll8Wvt5wAHlmdhULlQs=;
 h=From:To:Subject:Date:References:From;
 b=JkAh4bdf1xCuLcbM+POY7OSMcYRrgjB60A/vqns+QMACnaCLWr7UZLiYe9SE2cBny
 8cPtErvOfJXAMTPe9guBl72osZYxs31usuW/g+keAu118UlW5M49UX2EzOEx96mtQG
 rJzhkhylRBy9rBcxEaGfHtEEGt1/iRsX5BWrFMJI=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20190821051628epcas1p456079dded51a60a7909fd414273aa154~82Es5N6wn0617606176epcas1p4l;
 Wed, 21 Aug 2019 05:16:28 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.164]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 46Cwqt5jyWzMqYkZ; Wed, 21 Aug
 2019 05:16:26 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 CA.B4.04160.AA3DC5D5; Wed, 21 Aug 2019 14:16:26 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20190821051626epcas1p4846ddc2378df756efaba78ed3a0a6057~82ErLXG9c0616206162epcas1p4n;
 Wed, 21 Aug 2019 05:16:26 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190821051626epsmtrp1f5bd206ccf8a2ee7e31018e717a91975~82ErKtf780221702217epsmtrp1D;
 Wed, 21 Aug 2019 05:16:26 +0000 (GMT)
X-AuditID: b6c32a38-b33ff70000001040-d4-5d5cd3aa31ae
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 AB.6B.03706.AA3DC5D5; Wed, 21 Aug 2019 14:16:26 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190821051625epsmtip2cbf132c14193000e0657a40484734e83~82Eq-YfAf0443104431epsmtip2n;
 Wed, 21 Aug 2019 05:16:25 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Subject: [PATCH v5 1/5] mtd: spi-nor: rename SR_TB to indicate the bit used
Date: Wed, 21 Aug 2019 14:15:37 +0900
Message-Id: <20190821051541.6083-1-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLKsWRmVeSWpSXmKPExsWy7bCmvu6qyzGxBkf/6VmsbpnOaHHkwlpm
 i4krJzNb/J3zjsni0c3frBa7m5axWxzdc4/ZYvLON4wWH5c4WNyeOJnRgctj56y77B6bV2h5
 bFrVyeaxeUm9x50fSxk9bs4r9Oj/a+DRt2UVYwBHVI5NRmpiSmqRQmpecn5KZl66rZJ3cLxz
 vKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtCBSgpliTmlQKGAxOJiJX07m6L80pJUhYz84hJb
 pdSClJwCQ4MCveLE3OLSvHS95PxcK0MDAyNToMqEnIydkx4yFWwVrlj/eyVbA+NG/i5GTg4J
 AROJr2/OsnQxcnEICexglDhz5j6U84lRovXiaXYI5xujxMn1G1hgWi6uOsoEkdjLKLH/4jdW
 COczo8Ti5vnMIFVsAloSN35vAkuICLxgkni7bzYrSEJYwFui4/cxNhCbRUBVYuLj/UwgNq+A
 hcSGOzvZIVbIS6zecIAZpFlCYAmbxK/3Bxi7GDmAHBeJz51QZwhLvDq+BapeSuJlfxuUXSyx
 c+VEdojeFkaJR8uXQCWMJd69XcsMModZQFNi/S59iLCixM7fcxlBbGYBPol3X3tYIVbxSnS0
 CUGUKEm8edACtVZC4sLjXlYI20Pi//FnYK8ICcRKLNhwhHUCo8wshAULGBlXMYqlFhTnpqcW
 GxaYIEfNJkZwUtOy2MG455zPIUYBDkYlHt6E69GxQqyJZcWVuYcYJTiYlUR4K+ZExQrxpiRW
 VqUW5ccXleakFh9iNAUG3kRmKdHkfGDCzSuJNzQ1MjY2tjAxMzczNVYS5134wyJWSCA9sSQ1
 OzW1ILUIpo+Jg1OqgZFF99QUV+kX3a/Kk7tkWFfuCPDV2tf8sWfqRcVJL9KL6hii43ykYi0l
 l32NE51kHjVlp1hZ/q4f3pea526uW753f6LGn+v6Mqa2Li2aBmJTS7ecr/KIitpcXnhku5Wd
 sKX2C4184aUh0U9CBSbr+m69f2hCypI9cUI8XxwnHHGwSn4gKD/PRYmlOCPRUIu5qDgRAHm7
 N0eAAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLMWRmVeSWpSXmKPExsWy7bCSvO6qyzGxBnt3s1isbpnOaHHkwlpm
 i4krJzNb/J3zjsni0c3frBa7m5axWxzdc4/ZYvLON4wWH5c4WNyeOJnRgctj56y77B6bV2h5
 bFrVyeaxeUm9x50fSxk9bs4r9Oj/a+DRt2UVYwBHFJdNSmpOZllqkb5dAlfGzkkPmQq2Cles
 /72SrYFxI38XIyeHhICJxMVVR5m6GLk4hAR2M0rsXbSHDSIhIfFo5xeWLkYOIFtY4vDhYoia
 j4wSp+ZcYQepYRPQkrjxexMrSEJE4AOTxOVJp1hAEsIC3hIdv4+BDWIRUJWY+Hg/E4jNK2Ah
 seHOTnaIBfISqzccYJ7AyL2AkWEVo2RqQXFuem6xYYFhXmq5XnFibnFpXrpecn7uJkZwiGlp
 7mC8vCT+EKMAB6MSD++Om9GxQqyJZcWVuYcYJTiYlUR4K+ZExQrxpiRWVqUW5ccXleakFh9i
 lOZgURLnfZp3LFJIID2xJDU7NbUgtQgmy8TBKdXAmHdmqlDslXN9WxufWfOLh7WsFt5w4ghX
 jfiM8pyDEtvykr7MuW6/QyHomtMBi3jptCu5Mmuvrjax0iz7zv2zsc9M4fQtrmVt634JR6x+
 yC17oPIln7Oi4gEZm3NLBQ25Hh26XPvn2FP3+XtULpUGZZxlneAm6SLwJXWid8g9PulTE1cK
 +USnKbEUZyQaajEXFScCANtZUgwtAgAA
X-CMS-MailID: 20190821051626epcas1p4846ddc2378df756efaba78ed3a0a6057
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190821051626epcas1p4846ddc2378df756efaba78ed3a0a6057
References: <CGME20190821051626epcas1p4846ddc2378df756efaba78ed3a0a6057@epcas1p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_221634_686962_228BA7E3 
X-CRM114-Status: GOOD (  17.03  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Each vendor uses different bits for SR_TB of flash.
To avoid ambiguity, rename SR_TB to indicate the bit used.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
v5:
 - remake patch based on latest spi-nor/next tree

 drivers/mtd/spi-nor/spi-nor.c | 10 +++++-----
 include/linux/mtd/spi-nor.h   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 3790830d0d99..587f23480e5d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1421,7 +1421,7 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	} else {
 		pow = ((sr & mask) ^ mask) >> shift;
 		*len = mtd->size >> pow;
-		if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB)
+		if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB_BIT5)
 			*ofs = 0;
 		else
 			*ofs = mtd->size - *len;
@@ -1551,13 +1551,13 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (!(val & mask))
 		return -EINVAL;
 
-	status_new = (status_old & ~mask & ~SR_TB) | val;
+	status_new = (status_old & ~mask & ~SR_TB_BIT5) | val;
 
 	/* Disallow further writes if WP pin is asserted */
 	status_new |= SR_SRWD;
 
 	if (!use_top)
-		status_new |= SR_TB;
+		status_new |= SR_TB_BIT5;
 
 	/* Don't bother if they're the same */
 	if (status_new == status_old)
@@ -1633,14 +1633,14 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 			return -EINVAL;
 	}
 
-	status_new = (status_old & ~mask & ~SR_TB) | val;
+	status_new = (status_old & ~mask & ~SR_TB_BIT5) | val;
 
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == 0)
 		status_new &= ~SR_SRWD;
 
 	if (!use_top)
-		status_new |= SR_TB;
+		status_new |= SR_TB_BIT5;
 
 	/* Don't bother if they're the same */
 	if (status_new == status_old)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 63560b375168..66c891f0d328 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -127,7 +127,7 @@
 #define SR_BP0			BIT(2)	/* Block protect 0 */
 #define SR_BP1			BIT(3)	/* Block protect 1 */
 #define SR_BP2			BIT(4)	/* Block protect 2 */
-#define SR_TB			BIT(5)	/* Top/Bottom protect */
+#define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
 #define SR_SRWD			BIT(7)	/* SR write protect */
 /* Spansion/Cypress specific status bits */
 #define SR_E_ERR		BIT(5)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
