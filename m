Return-Path: <SRS0=w4g4=5D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE171C5ACD7
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 12:08:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85A1F2076D
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 12:08:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G7bX5QS1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Gm8l52eK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85A1F2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Su5jWu+ZDqx9U0dfajwEfJ9zblUTmzY8RE4m9TaYGY=; b=G7bX5QS1P9Ydqz
	kG53Bmcww7ZEBiIVpl8g7poH/WpqjVqrEKbI1U9CjdC50LHv4atx/D7kAfCiX6ihbVqo6x2DrzeCJ
	BOjrEOxFOROCWebHwxYNypikGN9C8PeH5ndOSyZU0Jsq9GIYQUjSOPHnS9Mw5z0HPdwOpDImXJsgf
	wpvOCgokLCuHMLDPxViAbpz4rMOn/v9dnrjg1ly0NP3mZQoEBo131fxxO/xj9DReTcCLeLH+DJ3nu
	/ZvV4c3NUrt9VB61mgB7B5KHzgg2pTRq7PLu+AKuAYouKnauQn26eTF96pgtr4pFtnvQzW6BVvj9a
	Aa6QUuS2sqtZAJp1Ji/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEXV4-0006vx-B9; Wed, 18 Mar 2020 12:08:42 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEXUf-0006LN-90
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2020 12:08:20 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200318120808epoutp01d09f8d488e68d0af9cba65a065e3f312~9ZKGMehjF2654126541epoutp01g
 for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2020 12:08:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200318120808epoutp01d09f8d488e68d0af9cba65a065e3f312~9ZKGMehjF2654126541epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584533288;
 bh=fyZp6a+c4cPqZEZFSf0DfCn+ljfStUrctulVgmwNU+A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Gm8l52eK2jFmhdouAHCxTNIN+AXehvJ/yAiKA9oC9Fd8TNQ2l5YwOXjEYWBY1dluQ
 NhXNLLXUcfQNiS5PBOQNcfAaJElzWaZn1K8PYEVvabChh1Ege830UCrD3BXyluafYQ
 JOHNrk3+7s3QRgu2/WzXoYrZ/Hd/IShdkRiPXejg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200318120807epcas1p4e8c8a57959bd614c5577a0cbeb414ffc~9ZKFKZPD72648226482epcas1p4p;
 Wed, 18 Mar 2020 12:08:07 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.159]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 48j81y2gb5zMqYlt; Wed, 18 Mar
 2020 12:08:06 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 C6.2B.04140.52F027E5; Wed, 18 Mar 2020 21:08:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200318120804epcas1p37b89db641c44ac84a778447bc6d7fbf2~9ZKCDhvUb3102231022epcas1p3I;
 Wed, 18 Mar 2020 12:08:04 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200318120804epsmtrp2cf645ddea3d9868fd8ad5f4ea0c27da9~9ZKCCkvC32606926069epsmtrp2-;
 Wed, 18 Mar 2020 12:08:04 +0000 (GMT)
X-AuditID: b6c32a36-fbbff7000000102c-82-5e720f25a1bd
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 BE.00.04158.42F027E5; Wed, 18 Mar 2020 21:08:04 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200318120804epsmtip266a8e0b51e250169767454dbd2e4b27c~9ZKB3rhdX0265702657epsmtip2a;
 Wed, 18 Mar 2020 12:08:04 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, js07.lee@gmail.com,
 chenxiang <chenxiang66@hisilicon.com>, Michael Walle <michael@walle.cc>,
 John Garry <john.garry@huawei.com>, js07.lee@samsung.com
Subject: [PATCH v2 3/3] mtd: spi-nor: support lock/unlock for a few Micron
 chips
Date: Wed, 18 Mar 2020 21:06:15 +0900
Message-Id: <20200318120615.4639-3-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318120615.4639-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+e1uu3fl6jLNDoNoXTKYoG7O6VUyBCVuWSEVKRXTm95U2qt7
 p6T0UBk9xEwroyf0WNpLWlMsC8vUsJRKNMwoe4kYpiOzIrCwbXdR/33POZ/vOYfz+xGY6ptM
 TRRaHRxvZc2UfI60pVMbExUxnzfpDnSF0S8HXyDa86BCRv8+65XQH1/NyOh7FfU4Pdnrxukp
 Vwo9+/QLnkIwraeHcWbk3C2ccXZNypgm1z7mzc/LiKluvoaY7qHbEqa9zSnPIDablxdwbB7H
 azhrri2v0JqfTKVvyE7NNsbr9FH6RDqB0lhZC5dMpa3JiFpZaPZtRmmKWXORL5XBCgIVs2I5
 bytycJoCm+BIpjh7ntmu19mjBdYiFFnzo3NtliS9Thdr9JE55oKT9dVSe2/Irn7nXawMDSoq
 kYIAMg7Gj7VIKtEcQkXeQdDVdF8mBl8RdExXIzH4gWDqWSP+1/KkpR8XC20IPE9qgpZpBGWe
 4QAlJyNhaMYTKISRRyXgvOJvrCBCyfUw8Lwc82spGQGPhi4gv1aSNJQ3jQRHLIbr7vYAoyAT
 oeLhIOZvBKRbDn1jDUEoDZo/10pFHQrj3c3BvBqmvW1yUQvQerUWF81OBB8bXEHIAN7JRl9X
 gsBILdy8GyOml0DrzLnAQhg5D7zfq2R+BEglHNyvEhEKJt47g2MB+kYOy0TNwKn+k5h4iRoE
 E8duSGvQotP/JpxH6BoK5+yCJZ8T9PbY/x/KgwI/LjL+Drr4bE0HIglEhSgJt92kkrHFQoml
 AwGBUWHKSzttJpUyjy0p5XhbNl9k5oQOZPSdshZTL8i1+f6v1ZGtN8YaDAY6Lj4h3migFirr
 XppNKjKfdXA7OM7O8X99EkKhLkPznPd7Nm7XNbhWrzNEv3O/fqHtWXClrmv0Jr9nWVpayPWx
 +ltZh7zpj4msaq9096OEbv3a1G5TnbZqSb9224ktEUvTn64qXTYZ92G87oOmPHPFp014eRm7
 P0u9PVPiat/a2dsIPXP7Cm3H1+YMv81EdOfG8NQze8dmnaNJA7+O6CIpqVDA6iMxXmD/AJkt
 ooaHAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJLMWRmVeSWpSXmKPExsWy7bCSvK4Kf1GcwekmMYvr164wWmza38Rq
 8XfOOyaLRzd/s1rsblrGbvH29AZ2i49LHCz+n/3A7sDhsXPWXXaPx3M3snu0HHnL6rF5Sb3H
 nR9LGT36tqxi9Dh+YzuTx4G9LWwBHFFcNimpOZllqUX6dglcGTOW9bEUnOapuNSyi7mB8Rpn
 FyMnh4SAicTJbZfYuxi5OIQEdjNKvLq5jBkiISHxaOcXli5GDiBbWOLw4WKQsJDAR0aJs9Ok
 QWw2AS2JG783sYL0igjMYpJYvL+HGaReWCBAYs/UPJAaFgFViaM3FjKC2LwCFhKNmx+zQ4yX
 l1i94QDYKk4BS4mmg9eYIebbSey9u4B5AiPvAkaGVYySqQXFuem5xYYFRnmp5XrFibnFpXnp
 esn5uZsYwQGopbWD8cSJ+EOMAhyMSjy8CZsK4oRYE8uKK3MPMUpwMCuJ8C4uzI8T4k1JrKxK
 LcqPLyrNSS0+xCjNwaIkziuffyxSSCA9sSQ1OzW1ILUIJsvEwSnVwMh8e7n0cavVjBtb1zk7
 b3u6ZZ72p9ORbId3+SRdeG4xe8NOi03t1fz1y87La4buOJm3bGJU0i69jiaBqY0LFh56EPSk
 zMTkWJ643eUrK4JVOI+wcX1e/TJy97aFipXK1lx7kzzKU0MW81kYi3/6HfA8qfmgiiajmX+f
 RFnr+4JKHbaEOVt7dJRYijMSDbWYi4oTAdYLPTA8AgAA
X-CMS-MailID: 20200318120804epcas1p37b89db641c44ac84a778447bc6d7fbf2
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200318120804epcas1p37b89db641c44ac84a778447bc6d7fbf2
References: <y> <20200318120615.4639-1-js07.lee@samsung.com>
 <CGME20200318120804epcas1p37b89db641c44ac84a778447bc6d7fbf2@epcas1p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_050817_681204_6EE8E5BF 
X-CRM114-Status: GOOD (  15.40  )
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
and that also support 4bit block protection (bp0-3).

This patch support lock/unlock feature on the flashes.
Tested on n25q512ax3. The other is modified following the datasheet.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/micron-st.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 3874a62d8b47..6c034b9718e2 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -47,12 +47,16 @@ static const struct flash_info st_parts[] = {
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      NO_CHIP_ERASE) },
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
