Return-Path: <SRS0=YvPJ=ZY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BDCC432C0
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2019 06:35:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E7B20881
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2019 06:35:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g6laKYu2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UAoxV4tr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E7B20881
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9EHdrGxLzqGuDeMBozJaDuKMMUfM1NrNyoiN52edF5Y=; b=g6laKYu2dLLoC2
	xsRRVQ3gRPxaxzfLvG2X5fsQ5bDxnv0G3l4m9y9hCQHRq3MSAkVrtVL1uKabh/nkUaQD/jANQrs9I
	dKUzjP50UQeFUg+fairjP+WlZy5JDaa117VHF+tgiWk8jgGpeqa2f0iG6OTNHe8oKfjvdcOam01PA
	Xf5ByJnYBgPQ/t2EY7/WqUK9M8uOmIXqyGdMs+8SOKsivcWfx34drE3AWBJTH4ELRVxmHZFbr2UZi
	QJCZThn/a2b43nIs0jW7a1KKgFp0FyxzwcwLL5W65rxgaC7e2H/bH0cvTMhpZ5M4uv8NUGshg75v8
	6K96vLf9u6WUz+RPbCgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibfIt-0004jg-GD; Mon, 02 Dec 2019 06:35:27 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibfIq-0004ig-Lc
 for linux-mtd@lists.infradead.org; Mon, 02 Dec 2019 06:35:26 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20191202063519epoutp025cade87c084f48421d65fef745a1f2db~cel9jkzFC2429724297epoutp02M
 for <linux-mtd@lists.infradead.org>; Mon,  2 Dec 2019 06:35:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20191202063519epoutp025cade87c084f48421d65fef745a1f2db~cel9jkzFC2429724297epoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1575268519;
 bh=x9eSLjTHbnyoirTGHqzSOKthJrd7EbGZtAGfO5GSqts=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UAoxV4trfk9xwKTJdaKEm4WiPZ57gdhadTRx5wb1FaX5/FM/WlWPG+VEzn1vTcDcb
 X6FzITfetd1D6+F2yTWwge1qCoh6UjU6IiDrC5wH82USJslP8LFLmZ4pYuL8Xt7q3R
 6S+8UsGYFNukxcWNJbky7F0ssRiENaEl1uGIgUBM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191202063519epcas1p15da26ab99657f9c7410517f30b6653c0~cel9QhoLa2429024290epcas1p1W;
 Mon,  2 Dec 2019 06:35:19 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.166]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 47RFjL2bcgzMqYkw; Mon,  2 Dec
 2019 06:35:18 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 3E.71.52419.6A0B4ED5; Mon,  2 Dec 2019 15:35:18 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20191202063518epcas1p4c27eb3123148b1ce151144409c632e3d~cel8BJ29y0512905129epcas1p48;
 Mon,  2 Dec 2019 06:35:18 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191202063518epsmtrp105627912d65575aae70675c2df61788b~cel8AjThU0427804278epsmtrp1d;
 Mon,  2 Dec 2019 06:35:18 +0000 (GMT)
X-AuditID: b6c32a37-59fff7000001ccc3-96-5de4b0a669a9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 3F.79.10238.6A0B4ED5; Mon,  2 Dec 2019 15:35:18 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191202063517epsmtip23ca2dcfc6cff488c88661e2c2edf8208~cel73ut3R2970029700epsmtip2o;
 Mon,  2 Dec 2019 06:35:17 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: js07.lee@gmail.com, Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 js07.lee@samsung.com
Subject: [PATCH 3/3] mtd: spi-nor: Fix wrong TB selection of GD25Q256
Date: Mon,  2 Dec 2019 15:35:07 +0900
Message-Id: <20191202063507.21311-3-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202063507.21311-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLKsWRmVeSWpSXmKPExsWy7bCmvu6yDU9iDV4/FLH4O+cdk8Wjm79Z
 LXY3LWO3OLrnHrPFxyUODqweO2fdZffYvKTe486PpYwefVtWMQawROXYZKQmpqQWKaTmJeen
 ZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gCtVVIoS8wpBQoFJBYXK+nb2RTl
 l5akKmTkF5fYKqUWpOQUGBoU6BUn5haX5qXrJefnWhkaGBiZAlUm5GQ8e9zEWLCPreLajJvs
 DYzrWLsYOTkkBEwkrt04xt7FyMUhJLCDUeLshYNgCSGBT4wSJ34aQiS+MUrMOTMDruP7hn9s
 EIm9jBIXp52Dav/MKNH2exlYFZuAlsSN35tYQRIiAgsZJeZdesIEkhAWcJWYefU0O4jNIqAq
 8fr2ZDYQm1fAUuLYg4dMECvkJVZvOMAMYnMKWEks/LycHSLeyCbR8TOqi5EDyHaROP7QDSIs
 LPHq+BaoEimJl/1tUHaxxM6VE8GOkxBoYZR4tHwJVMJY4t3btcwgc5gFNCXW79KHCCtK7Pw9
 lxHEZhbgk3j3tYcVYhWvREebEESJksSbBy0sELaExIXHvVAlHhLvHphBgqGXUWLjot+MExhl
 ZyEsWMDIuIpRLLWgODc9tdiwwBg5kjYxgpOSlvkOxg3nfA4xCnAwKvHwGrx4HCvEmlhWXJl7
 iFGCg1lJhPe60sNYId6UxMqq1KL8+KLSnNTiQ4ymwHCcyCwlmpwPTJh5JfGGpkbGxsYWJmbm
 ZqbGSuK8HD8uxgoJpCeWpGanphakFsH0MXFwSjUw+iYt0TkaEquSl/A53kvnzpfs0zcqQ1v/
 1Hs33WB3UhBc+KBCRiVrc2gYW7jqz8wAxpv+PFPzdrq8/nv38tqExt+biq173mhO/Wztelws
 MoNB5639dvt7zN1sYft4Q+03v2ljsCzu26CjfLNYgHOPy/IPYlc/6Zwz9mh5fNS39mHVzxrV
 eTOVWIozEg21mIuKEwEzfdamYAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgluLIzCtJLcpLzFFi42LZdlhJXnfZhiexBod2MFv8nfOOyeLRzd+s
 FrublrFbHN1zj9ni4xIHB1aPnbPusntsXlLvcefHUkaPvi2rGANYorhsUlJzMstSi/TtErgy
 nj1uYizYx1ZxbcZN9gbGdaxdjJwcEgImEt83/GPrYuTiEBLYzShxbt5TNoiEhMSjnV9Yuhg5
 gGxhicOHiyFqPjJKLFnxiAmkhk1AS+LG702sIAkRgaWMEleufGAESQgLuErMvHqaHcRmEVCV
 eH17MthQXgFLiWMPHjJBLJCXWL3hADOIzSlgJbHw83KweiGgmp/rLrJPYORdwMiwilEytaA4
 Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOHy0NHcwXl4Sf4hRgINRiYe349XjWCHWxLLiytxD
 jBIczEoivNeVHsYK8aYkVlalFuXHF5XmpBYfYpTmYFES532adyxSSCA9sSQ1OzW1ILUIJsvE
 wSnVwOiifmLFe9kj149ezhQyzZvy6rO937yWd+lLD/E823Rp3q60HLMNVXVmDMcapvOqncjt
 YfecwLA1obl19yfuiq137oX37lUp8GS7Fmx2R+nbnDeXonx3b3c8rbbS6fAsN4dJPpXnJiQY
 1Iad4JBM7gv8M7F/if+Dyj/bzzJOkb1vpNJw+A+D0FYlluKMREMt5qLiRABPjgASGwIAAA==
X-CMS-MailID: 20191202063518epcas1p4c27eb3123148b1ce151144409c632e3d
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191202063518epcas1p4c27eb3123148b1ce151144409c632e3d
References: <20191202063507.21311-1-js07.lee@samsung.com>
 <CGME20191202063518epcas1p4c27eb3123148b1ce151144409c632e3d@epcas1p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191201_223524_950806_F050BF65 
X-CRM114-Status: GOOD (  14.68  )
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

For GD25Q256, wrong SR bit for top/bottom selection
are being used. Fix it to use appropriate bit.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 227b56b0a5b0..7cd29491ceae 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2395,7 +2395,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{
 		"gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			SPI_NOR_TB_SR_BIT6)
 			.fixups = &gd25q256_fixups,
 	},
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
