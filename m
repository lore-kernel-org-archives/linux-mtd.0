Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1A5C2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 06:33:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F2DA206E9
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 06:33:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gOnok+N3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="O8MsPioS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F2DA206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=pYm7PFt+ILL5qlLxsuquzqOVhuoTXLOvRzIvzrBj73A=; b=gOnok+N3CqJMXh
	F+nSIoqNM9CZP9AQQrQc2nB+6mrhrHLWO/WGRzfIzT7mjExcS8hmCe4vP1pvYSn8T0+jTaXyOn6cZ
	jfQqKbUjKhPwSe4c89UmtrdRu9KGOXJgZmdJkgOPu2/F0bMICa2HJO6vWVjlwFZqzZcYrKkNWetDT
	knjYhcSbDLYxOtru3taV4JyRVYtrjpN1XJSUX8ouykpNJ7wBnaUKBV9hs+Nvbib6m/u/Gxjvlb1N3
	vZN5eTny4PUWgUo7VK9hXmTTgV/HZdX0TYFGHYLoZwGMtA/+MEcax6lVscwADiPUjK0+0PahXAUr4
	QaqiHRxhdhmUQQAQDgCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQmTJ-0006TE-5s; Tue, 21 Apr 2020 06:33:29 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQmTD-0006LS-GM
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 06:33:26 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200421063320epoutp011ccd3bb84c734b948c04e08bd92928ba~HwheeikUh0698206982epoutp01f
 for <linux-mtd@lists.infradead.org>; Tue, 21 Apr 2020 06:33:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200421063320epoutp011ccd3bb84c734b948c04e08bd92928ba~HwheeikUh0698206982epoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587450800;
 bh=TRFg0tTawZfs6fQO+5UxhXTPRBFWB9U3SCuDjr2m7XU=;
 h=From:To:Subject:Date:References:From;
 b=O8MsPioS8Lglcj7mXh7DR5PHDUI3kj4g5k/ZIIiCfgtcSmW8U3tBMzv/GcFtrlUeF
 1RNlCadb0V2vWNcZht7jw6zaE4jlovUvvB8hfXWICQ7JhdzuoPkLH5U0ebnhcEE/T1
 LEuzYGi4wAduVhOMy1n1L6UeKSe/5q6y21fCJp7A=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200421063319epcas1p192e37bdbe5b65a038d1f0eab1d8e7889~Hwhd8LePp2956529565epcas1p1c;
 Tue, 21 Apr 2020 06:33:19 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.166]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 495tzy5t7PzMqYkc; Tue, 21 Apr
 2020 06:33:18 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 C9.D5.04648.DA39E9E5; Tue, 21 Apr 2020 15:33:17 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200421063317epcas1p388256ada10113b38b92dca757cd11e41~Hwhb0w0Z41874418744epcas1p30;
 Tue, 21 Apr 2020 06:33:17 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200421063317epsmtrp26b2fb0f3b6f500dc97888ec0deb0114d~Hwhb0BPrY1697116971epsmtrp2D;
 Tue, 21 Apr 2020 06:33:17 +0000 (GMT)
X-AuditID: b6c32a37-1f3ff70000001228-f3-5e9e93ad419e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B9.30.04024.DA39E9E5; Tue, 21 Apr 2020 15:33:17 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200421063317epsmtip1a517270548ff2da2d4cdbf222b53b809~Hwhboig7K2798927989epsmtip1G;
 Tue, 21 Apr 2020 06:33:17 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, js07.lee@samsung.com
Subject: [PATCH] mtd: spi-nor: Enable locking for n25q00/n25q00a
Date: Tue, 21 Apr 2020 15:33:13 +0900
Message-Id: <20200421063313.32655-1-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRmVeSWpSXmKPExsWy7bCmvu7ayfPiDFo3Gls8uvmb1WJ30zJ2
 i49LHCz+n/3A7sDisXlJvcedH0sZPfq2rGL0OH5jO1MAS1SOTUZqYkpqkUJqXnJ+SmZeuq2S
 d3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QRiWFssScUqBQQGJxsZK+nU1RfmlJqkJG
 fnGJrVJqQUpOgaFBgV5xYm5xaV66XnJ+rpWhgYGRKVBlQk7GjdsbmAu2clVs37GPsYGxlaOL
 kZNDQsBEomH1M+YuRi4OIYEdjBLLr6yHcj4xSrTv3cAG4XxjlLhweRYTTMuMOUugqvYySvQ+
 fcgKkhAS+MwocWobC4jNJqAlceP3JlaQIhGBXkaJKzs3gxUJCzhI9D05xgZiswioSrSuegI2
 lVfAUmLR+gusEBvkJVZvOAC2QULgLqvE2QkHGSESLhKdhx5CnSEs8er4FnYIW0ri87u9bBB2
 scTOlRPZIZpbGCUeLV8CVWQs8e7tWqCpHBzMApoS63fpQ4QVJXb+ngs2n1mAT+Ld1x5WkBIJ
 AV6JjjYhiBIliTcPWlggbAmJC497oe70kJjasQnq+ViJY0t2Mk1glJmFsGABI+MqRrHUguLc
 9NRiwwJj5KjZxAhOO1rmOxg3nPM5xCjAwajEw7tBbF6cEGtiWXFl7iFGCQ5mJRFeCy2gEG9K
 YmVValF+fFFpTmrxIUZTYOhNZJYSTc4HpsS8knhDUyNjY2MLEzNzM1NjJXHeqddz4oQE0hNL
 UrNTUwtSi2D6mDg4pRoYp6Z9u7vsY1tBmbm1tEng5gvLr/Vzv78pZx73bqrtFzeh6ucxXe2p
 ulo8v1Ru3slVXhKSm3MpVs6kSfLx601ryr/LKLCG3djx9rjpmfa6Ja6bGp2evt+p89CPgUPn
 iEG9YV5w2Iu/vPEGPSe0Z17c+XfptZpv4ZtWvstzLf9446Xr/9eZm/i2KbEUZyQaajEXFScC
 ADn8hUtRAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFJMWRmVeSWpSXmKPExsWy7bCSnO7ayfPiDCYuk7B4dPM3q8XupmXs
 Fh+XOFj8P/uB3YHFY/OSeo87P5YyevRtWcXocfzGdqYAligum5TUnMyy1CJ9uwSujBu3NzAX
 bOWq2L5jH2MDYytHFyMnh4SAicSMOUuYuxi5OIQEdjNKtE4/xQSRkJB4tPMLSxcjB5AtLHH4
 cDFEzUdGiVO3OthBatgEtCRu/N7ECmKLCExklHg9jRnEFhZwkOh7cowNxGYRUJVoXfUEbCav
 gKXEovUXWCHmy0us3nCAeQIj9wJGhlWMkqkFxbnpucWGBYZ5qeV6xYm5xaV56XrJ+bmbGMEh
 oKW5g/HykvhDjAIcjEo8vBvE5sUJsSaWFVfmHmKU4GBWEuG10AIK8aYkVlalFuXHF5XmpBYf
 YpTmYFES532adyxSSCA9sSQ1OzW1ILUIJsvEwSnVwNi2MPdNbPTxvyfDcnrPcRs2X1y67/lS
 jZKlUzfJnF4h9nZ6ns7rupYzh/LsXbU6Gw4KWwaI2didNkyfa3RNOmjFTrPn2/YvlVi8Jmv3
 xTuTDLqis3QOhsfOTCyUPb/70UKns7YOJ0SWrmZ/57Uk/lvxF5WdqSp6D7h9dtWuS7/lfo59
 iVFIXaISS3FGoqEWc1FxIgBKWuT+/QEAAA==
X-CMS-MailID: 20200421063317epcas1p388256ada10113b38b92dca757cd11e41
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200421063317epcas1p388256ada10113b38b92dca757cd11e41
References: <CGME20200421063317epcas1p388256ada10113b38b92dca757cd11e41@epcas1p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_233323_792806_D53FBFB0 
X-CRM114-Status: GOOD (  15.04  )
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

n25q00 and n25q00a use the 4 bit Block Protection scheme and support
Top/Bottom protection via the BP and TB bits of the Status Register.

This patch enables the locking for n25q00/n25q00a.

Tested on n25q00 with cirrus controller. The other is modified
according to the datasheet.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/micron-st.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 6c034b9718e2..51d677844480 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -59,9 +59,13 @@ static const struct flash_info st_parts[] = {
 			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6 |
 			      NO_CHIP_ERASE) },
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6 |
 			      NO_CHIP_ERASE) },
 	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
