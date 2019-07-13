Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=DATE_IN_PAST_96_XX,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D6CC32751
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 02:06:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A8BB20B7C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 02:06:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E7MoLOwi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ibX65Sww"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A8BB20B7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RCrepUHOSbHJzkg7tp4K8Oli5ALXlvzoVnfmjM8a6E=; b=E7MoLOwi2/RNLE
	gqOoSdYLggqaeLZMY3ctvUWQgWMkVE7QyjUq6iEWhDx4ck8EFbJigDuzHeSGVufMO0iG4pZSayAjt
	wMVISyl/GINBBA0JhtFCx3/YrHz7NAuQ62g2hCX1zqJJ90Dbg4qoDBSGSLPto2S/XhSJRxzvJWrlV
	aNc7ckD3pY5Py7Yj6KqFw8wdaheJ03fLVENrB+B+RCPsxdvbra2zq7/Bk9HD+k/J4zyPyuuEA2ZJV
	JxwlTr+VhE8boD9P5schqBes6OlF7QoYDi+SFCwhStncN0iFHloVH6CPE9fI3lFqVSsaL2UucAvDx
	IBXGhSED9knsrtU72s4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht0TT-0008Hk-Rc; Thu, 01 Aug 2019 02:05:47 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht0TA-0007ow-7G
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 02:05:29 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20190801020525epoutp047ee9dc9be1990fc7c251a50b3e0b75fd~2qkMfaBWL2736427364epoutp04J
 for <linux-mtd@lists.infradead.org>; Thu,  1 Aug 2019 02:05:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20190801020525epoutp047ee9dc9be1990fc7c251a50b3e0b75fd~2qkMfaBWL2736427364epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1564625125;
 bh=oOGHoQ6EwfEwzS7x/MXD4YP6uUjvLs4l1JLc6WnGnLI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ibX65Sww9RcheOMVJOV6ZEgwbgbuUZ/AfvW9BiA9WDpq6rk5W1TSy6hzVh042B4SW
 ko1H++3vkO5rinpHuK6NWDARQKoimJkdjw9GWuhJ3FbGoLCG4dn0dfI7eCiUq7PWQi
 YI5P8BJQv3s7UHsRSpq8HMApP2nDauwp9u7BrcAo=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20190801020525epcas1p33419fdd3daca5f93dc0205566fe2590d~2qkMB9OJg0645306453epcas1p3d;
 Thu,  1 Aug 2019 02:05:25 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.165]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 45zYXg63X3zMqYkf; Thu,  1 Aug
 2019 02:05:23 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 03.F8.04066.3E8424D5; Thu,  1 Aug 2019 11:05:23 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190801020523epcas1p27580bead294a67fccea6fe8615e73da9~2qkKWmwlW1553515535epcas1p2r;
 Thu,  1 Aug 2019 02:05:23 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190801020523epsmtrp273527ee7775acf4307a82ffb3591e700~2qkKVwpmM1129811298epsmtrp2I;
 Thu,  1 Aug 2019 02:05:23 +0000 (GMT)
X-AuditID: b6c32a37-e27ff70000000fe2-20-5d4248e3db44
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 29.98.03706.3E8424D5; Thu,  1 Aug 2019 11:05:23 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190801020523epsmtip2e3d5c29db543dd912b4dffd97e40481f~2qkKJnPan0654406544epsmtip2N;
 Thu,  1 Aug 2019 02:05:23 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Subject: [PATCH v3 4/4] mtd: spi-nor: support lock/unlock for a few Micron
 chips
Date: Sat, 13 Jul 2019 16:15:41 +0900
Message-Id: <20190713071541.22090-4-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190713071541.22090-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHe3b3ctVmt2V5GFR2oSjB3Jybd6K1ctQl+yBFEcFYN72otN2t
 ezfLSlKTlaXZMDPUosheVCyxELWMMsWgrAyCJHvB6L2NVAxpGW3eSX37n/P8/uccznNwTBWQ
 qfF8zsXyHGMj5ZHSjgerEhPe0+stmrqaJKqlrBZRfc9aMcrbVI1R0w1+CTU6HJBRt0uvKKj+
 O28wqrrrO6LGGk3UK281MkXSXXWvFfTNa/F0e3O5nL7ZeJgembqM6OHze+mqaQ198lYzysJ3
 2tLyWCaH5eNYLtuRk8/lppOZW60ZVr1Bo03QGqkUMo5j7Gw6ad6clbAh3xYckIwrYGzuYCqL
 EQQycU0a73C72Lg8h+BKJ1lnjs2p1ThXC4xdcHO5q7Md9lStRpOkD5K7bHlPa09jztbo/deO
 lsqK0UjUcRSBA5EMbePt0uMoElcRnQhe+uoVYjCO4HnJJ5kY/ERQU3kZzVruN06ELT0Iyn2D
 EjGYQNDnn1CEKDkRDy8D7TP2GOKzBHx362WhhwXEFhg58QsLaSmxHMreNklCWkkYoaXqcbjF
 UmhpuzfDRBCpMHjWj4UKAdEpB+/oFYUImeFI4EzYsAC+DtwK59Uw4e+Ri1qAriavQjSXIRi9
 2hiGdOD3tQar4jhGrIIb3Yliehl0Bc7N1MSIaPBPVshCCBBKOOZRiQgJ39+VSUUN8Ox9pUzU
 NPR5JsP7qgyu5c6k4hRaXPevwwWEmtEi1inYc1lB69T9/1HtaObw4lM6UduTzb2IwBE5V/mw
 fJ1FJWMKhEJ7LwIcI2OUl2LXWlTKHKbwAMs7rLzbxgq9SB9cpRdTL8x2BM+Yc1m1+iSdTkcl
 G1IMeh0Zq7w4RVlURC7jYvewrJPlZ30SPEJdjDaa6io8iabMP+b9mzoUFaUWcwP3bszQPbCF
 NK70FBwbcy2GderYrYYVh1Klg1nbY5aoSvZlFv3ufcH1SKO/fOM9H4Zu8GdTdzzcnTQPDfvw
 bRlD94ihR9Yid7LJeL/4xZyjH6VRQ59/9Ju3z09ZYpnK3of/WB65KPn6Qag3vjKTUiGP0cZj
 vMD8BTRqGv+OAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsWy7bCSvO5jD6dYg+/zJC1Wt0xntDhyYS2z
 xcSVk5kt/s55x2Tx6OZvVovdTcvYLY7uucdsMXnnG0aLj0scLG5PnMzowOWxc9Zddo/NK7Q8
 Nq3qZPPYvKTe486PpYweN+cVevT/NfDo27KKMYAjissmJTUnsyy1SN8ugSvj/PQpzAVr+SpW
 tDexNjDe4e5i5OSQEDCROLjkM0sXIxeHkMBuRoktHUfZIRISEo92fgFKcADZwhKHDxdD1Hxk
 lOjobmEDqWET0JK48XsTK0hCROADk8TlSafAGoQFAiQ+NkeB1LAIqEq03F/JBGLzClhKrO4/
 wwgxX15i9YYDzCA2p4CVxNkZ78BsIaCae31drBMYeRcwMqxilEwtKM5Nzy02LDDMSy3XK07M
 LS7NS9dLzs/dxAgOSC3NHYyXl8QfYhTgYFTi4VXocYwVYk0sK67MPcQowcGsJMK7WNw+Vog3
 JbGyKrUoP76oNCe1+BCjNAeLkjjv07xjkUIC6YklqdmpqQWpRTBZJg5OqQbGljxDjtSlIfka
 j2sXNYXPucooyyH4qfjsMc+Dx+Qd1Iqyt/J1Xs+Vl5gYr5I/denT06J/br49X3ygc2bn2vaF
 h88J9/RUJX8IjV74Z97RtOuf2G8aMYqsOvxm4/sop8l6r7fk9z5duf2QcMK9jMTHnqdu3pB6
 sOlhjfget7/bDBgXRCccv5xwTomlOCPRUIu5qDgRABOtSspEAgAA
X-CMS-MailID: 20190801020523epcas1p27580bead294a67fccea6fe8615e73da9
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190801020523epcas1p27580bead294a67fccea6fe8615e73da9
References: <20190713071541.22090-1-js07.lee@samsung.com>
 <CGME20190801020523epcas1p27580bead294a67fccea6fe8615e73da9@epcas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_190528_453097_EA00D6EB 
X-CRM114-Status: GOOD (  18.05  )
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

Some Micron models are known to have lock/unlock support,
and that also support 4bit block protection bit (bp0-3).

This patch support lock/unlock feature on the flash.

Tested on w25q512ax3. The Other is modified following the datasheet.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 0d0b92de62db..8422f30c73f2 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1922,8 +1922,16 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{
+		"n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
+			SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_BP3)
+	},
+	{
+		"n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024,
+			SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_BP3)
+	},
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
