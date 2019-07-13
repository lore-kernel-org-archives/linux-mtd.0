Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=DATE_IN_PAST_96_XX,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 528DCC433FF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 09:22:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21D42206B8
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 09:22:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QTJY3dYX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="sF6FuUHA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21D42206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=gbIohjp/wv3zZy+kulijOJXx/QHKDeckp7q+0al9934=; b=QTJY3dYXdj5tGP
	AaG1pxyOy56/y5PDN6VBxgd+WmBryRlyW3f/Q1UsxteRqAvGq/xE4lp0XxemRkI4wNC/vNdbSDZg5
	ivT+3t1S6VNuQhJRB+fjROwLZKa7RKf1KZaWScx4aT7+/acTeeoYJyCOfvNUscaVkjmm9gGSqP9+P
	2xmKvlMJjFlbpsVs9aG3Rw/PcX+cM+oGdeNkHN9l5mbYegnF5ANxWHwRs7a5K7T4pMX74H4jRXId9
	6PwE5K4l30OWotVH6lzTXhygcQGOpJ6eB97Crl85HQp8rTg4/78MF8RDx5BX8pWyHUpbpZqngT2K3
	ohuEFi4ybpCEx732jQsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht7I1-00079h-Vq; Thu, 01 Aug 2019 09:22:25 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht7Hy-00079I-Rp
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 09:22:24 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20190801092218epoutp02c607a929592f1b0822752447b36c2649~2whpRStsb0441504415epoutp02C
 for <linux-mtd@lists.infradead.org>; Thu,  1 Aug 2019 09:22:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20190801092218epoutp02c607a929592f1b0822752447b36c2649~2whpRStsb0441504415epoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1564651338;
 bh=RLPDIXKbju/4DvltlPu3nrVVEMFmpsiHo2Mnt0QD/D4=;
 h=From:To:Subject:Date:References:From;
 b=sF6FuUHAbETAecYEsGdFteF+PqrcMuMUB7pRr5819Nqkb8BTr2qVankX/W1Wmk3+s
 5t+ge43MzkMZYT2PDJrFub6LNVHYGk2+xuathLGdP4E+RlEH1+bPigL39PZbKeYf6+
 iGKXTHL2ZsopK74OMRWA5PApriMNdgBx+9StQbAw=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190801092218epcas1p2f14dc60db67dfa16047de7235f43385c~2who3gzQT2294622946epcas1p2N;
 Thu,  1 Aug 2019 09:22:18 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.159]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 45zlDn26z7zMqYkZ; Thu,  1 Aug
 2019 09:22:17 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 46.C3.04088.94FA24D5; Thu,  1 Aug 2019 18:22:17 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190801092216epcas1p18622c765605e4b616d6eaf9fa55d2f3a~2whngWzSz1251012510epcas1p1-;
 Thu,  1 Aug 2019 09:22:16 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190801092216epsmtrp2c72a8ee743914fe4cc60d5f8ea17f92e~2whnfgy3m0507305073epsmtrp2X;
 Thu,  1 Aug 2019 09:22:16 +0000 (GMT)
X-AuditID: b6c32a35-85dff70000000ff8-15-5d42af498294
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 02.A8.03638.84FA24D5; Thu,  1 Aug 2019 18:22:16 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190801092216epsmtip15a4daa801e6eb33910aa746a1feaf900~2whnWPTe31751017510epsmtip1x;
 Thu,  1 Aug 2019 09:22:16 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Subject: [PATCH] spi-nor : Remove SPI_NOR_HAS_TB flag on s25fl512s
Date: Sat, 13 Jul 2019 22:56:20 +0900
Message-Id: <20190713135620.21016-1-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTURjmePdxJ64u0+oggutGlMJq1zm9ipqayI2MpKBCWeumFyftq91N
 0wg1LGpYtpQCP8JyaSpiqH2szGIqhoIU/jApKxQyc36libaEtt1J/Xue9zzPed7znhdFJC5+
 KJqvNzMmPa3FBYG8p30RMtmhjlSV/Mr0VrKt/C4g+9+1I6StpQohN+rmA8jJcTeffHm5SUgO
 9HxGyCqHC5BL9mTyo60KJAdSjpoJIdX1KJLqbL0uoLrsJdSntYeAGr93nqrckFM3u1tBJpql
 TdAwdC5jkjL6HENuvj4vET98XH1QrYyREzIijozFpXpaxyTiaRmZsvR8radBXFpAay2eUibN
 svj+pASTwWJmpBoDa07EGWOu1kjIjftYWsda9Hn7cgy6eEIuj1J6lGe0mi9TScZe0YWeviZe
 KVgQWoEIhVg0HGp7EGAFgagEew5ghXNFwJGfAPbdqQUcWQVwZnyUv2npWOz1W14BWDk64lct
 e8jSLOJVCbBI+MHdyfcehGDfA+Bcb63PHoylwrdj7b50HrYbLla3Ay8WY3Fwcfk9wkWEw7bH
 bxCvGWINAui0Ojx5qIekwQVXOKcJhj8Gu/2vCIXL868EHGaho8Um5LzlAE422/0iBZyfa0e8
 9yBYBOx4sZ8r74QOd72vBwTbAud/VfC5KDG8dlXCSXDo+lrO4zCE76Zu+CdBwYXpCZ9Vgqng
 wEqN8BYIq/kX0ABAK9jOGFldHsMSRuL/n+kEvk2LVD4H1SMZToChAA8SSytSVBI+XcAW6ZwA
 oggeIm7ccUAlEefSRcWMyaA2WbQM6wRKz/BsSOi2HINnb/VmNaGMUigUZHRMbIxSge8Q318j
 VRIsjzYz5xjGyJg2fQGoKLQU9C+dLbujHGbs0fWCQeI9FlLdW3BCk6CavH30yRFZz5mZmvgv
 E0M6qx17XXj62KXW6cFv4rESd4kVUO5x07o+rC8+JUMaFF9wasL1e49U3JytTu84vRpWHJ5+
 0RY9WCeaXCsMfNYoaP7WMHtyr+j8+vCtXdV/su6WFE1psssqDuM8VkMTkYiJpf8CvmsajH8D
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsWy7bCSnK7HeqdYg0NHzSxWt0xntDhyYS2z
 xcSVk5kt/s55x2Tx6OZvVovdTcvYLY7uucdsMXnnG0aLj0scLG5PnMzowOWxc9Zddo/NK7Q8
 Nq3qZPPYvKTe486PpYweN+cVevT/NfDo27KKMYAjissmJTUnsyy1SN8ugSvj/mO7gn2cFXsO
 L2NpYHzP3sXIySEhYCKx/sM+JhBbSGA3o8SHnXUQcQmJRzu/sHQxcgDZwhKHDxd3MXIBlXxk
 lDg5bztYL5uAlsSN35tYQRIiAh+YJC5POsUCkhAWcJI4cX0tWBGLgKrEhylrGUFsXgFLiQ+f
 LzJDLJCXWL3hAPMERu4FjAyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGCw0tLawfj
 iRPxhxgFOBiVeHhPdDrGCrEmlhVX5h5ilOBgVhLhXSxuHyvEm5JYWZValB9fVJqTWnyIUZqD
 RUmcVz7/WKSQQHpiSWp2ampBahFMlomDU6qB0TosOfKhsLLTPY3TIg1Kt5yusyYu8O2We+kj
 KR/CrSV96EwIdy/LjFlrFJ/tWlsbYSvwiP/Pt+VePBOsZUPVbBe91ZGY8HFR5P3A3dq8wYtF
 J3xYveLPBo6/8bvUmLnUjjD2uwSKqtZPrMtNDr1/89OXlvWR5fpJJn3ThFw3v7WarG0SsllR
 iaU4I9FQi7moOBEAzlxTISsCAAA=
X-CMS-MailID: 20190801092216epcas1p18622c765605e4b616d6eaf9fa55d2f3a
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190801092216epcas1p18622c765605e4b616d6eaf9fa55d2f3a
References: <CGME20190801092216epcas1p18622c765605e4b616d6eaf9fa55d2f3a@epcas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_022223_137009_E03C3741 
X-CRM114-Status: GOOD (  16.68  )
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

Currently, the Top/Bottom protection function (SPI_NOR_HAS_TB) is
implemented to fit some flashes with TB bit on SR.

s25fl512s has TBPROT bit on CR1, so the TB protection is not working on it.
Fix the wrong flag on s25fl512s.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 03cc788511d5..c4f58944b482 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2022,7 +2022,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
 			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
+			SPI_NOR_HAS_LOCK | USE_CLSR) },
 	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
