Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5777CC83003
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 07:11:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A00B2073E
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 07:11:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WIQJPv0x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="2AlLYQVT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="K4SckDp5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A00B2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sPNsVq7MPtDQumQYeYiO63Ui2PdgfaBpT2LPEXi0bAE=; b=WIQJPv0xYm8lc7
	cYmrUZ0Hr71PpZFvMT/YdLJotU2vo+02XEWz23GiYDfyoG+NIy+my2ZW+waw+HzK3rqzYftbO/5q/
	aF7oxSdo3wTZnr2vA+y64J2e0h6kZQlMcHrAXtbVOe1EvGhm1CH9c2diXX+6g0gpAeB9MldbmNvJ7
	M+0SpvfqBJ7OEXyRK+ZAsAyUnrBx12lZLDfNHxrOdwThoG3oCJ86sdEWiScS4EXm+uxFFx61LSSEv
	NEurVrrDjUuXHSrYFiwwEFDG+QBGPF1H3Z8Enxx7CigaPGLK7HNHM57CHCCCVYYW8Zp8ssNu1JgWo
	eDmNnAWWUWgDy3KRK8ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTgs6-0006zL-Hn; Wed, 29 Apr 2020 07:11:06 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTgs3-0006yk-Tm
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 07:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1588144263; x=1619680263;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=fpmsbRkS2O0tswvYxDR2db3l4W2CkpEmK+WEz1XNG+c=;
 b=2AlLYQVTsGNqHvuo34e9Tqz0MCEMq31fQsgiHciscfBmFEfo+tHH/lNJ
 4OdhyuL+aqBo1uCLf0RvoAn4igfrM1VJSG1+WzqIEs1ucSJavNiC1a+dA
 DB0TJ/E5U2RNv+qxcfxSaq4bAaCcp03z2XBEUcjOaU45/Ay1hXkdvN00d
 FpzgCod75Pfv4iJ19C82ZWVepWmbvQEgWdo/ZFlIg9wCVxoCiyoKAdlQo
 xApoTbjPlriOhKQaNKJWsZowZospKrYV3TMERMoDDJHcKFUAP3xxAoWpe
 uu+675xUG+FytRumUC53pIAzw/rdSP8IG+g8X8Tedcrl4ITct8G6YJczi Q==;
IronPort-SDR: Hytqi98lzZAG45SlglxOrIWew/VH9e9OIkLNu3EQ05nDuN8CcqLTe+G1ncZAuEhAwdQ1l7AjRs
 bFtWw9YGW1EiYwCzMnf8trSAqdCT39kGBQ8tcp07aei63z/vmKiMwo7LxilNRusDbv+ovMtPVw
 eVp+8uZeb3ykSyEXGYYLeQl2ZFMF47riOxklexg/9gx4AkEFTa9NVALcolfNeDeFWWZE+X3VsW
 k6USs8ok9un54tbjrRxJz4iwWnlac1j1U7B/8h8jy1DdMh0gyAH24ZzNpAu3GZegJdHa00hEnm
 NMU=
X-IronPort-AV: E=Sophos;i="5.73,330,1583218800"; d="scan'208";a="74903903"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Apr 2020 00:11:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 29 Apr 2020 00:11:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 29 Apr 2020 00:11:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+fzSSScOAA0TiDIjK26Vw0zzRgsoGfJr1lZRQVZIOmUUf4W/Vre5wxFOTJN8zR8Rzpo0I4bsf65bKEqbz63o7/iGO5Gjks+vYJDVv4fmmX3ynt2InSu0BUasvLWuDbMaRzyK/9JhXQHnxDcy2R5r0IyJXb6MKgHCJrwxj8+hVlCvs43w2+0iLQQUsKZYph+wHBVub+xfSRCBxdfGE40sFU1WAmERJh+GkV5VNf3+HljDYxFcaJtqTNtoRnBiR0PTObth6x0QiL6KZGTkDrhUmtoEZ4/mDRE8C2wqkal/lGQ8H1uJP5vAZynNV9VgCMNbA6pI1Nil/6Me3fkGKSphA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKobq6Dh6Kkwm2lhEu7oRnaXEQYavBydCcLAxKBvzxM=;
 b=KKwwH9JS+3ytMKg47H1iChaI1Vyvs2t1ofY04uROLDjX5ExzI2Rqv+iBpzRDs/WSb36oBAlqReFz/X4tst5TKgpVdhWy9X9YNxnvQu8+xpj3R+tPfFEkssee3ZJ/9repjQjamUaHPeVn62XZ6jdrsWRPyAM39mhQWJJVqRLJ0gq+7oWPijNLCicsMaHyA/FdFruDXrQVALF84rkzfpqegzF2dIp8oaaPvTSgiAS5G8aypgoCOGMxQtSFnBDCKQnOvvMC4SRK+3WMmhzAHgAzleNJTAPj2q2uEa5mIgbLsCQrWsCg3P2ao5+BLtKIBmnZsyFlS0EA3XUnji4gPxvA+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKobq6Dh6Kkwm2lhEu7oRnaXEQYavBydCcLAxKBvzxM=;
 b=K4SckDp5IqPtPptnrkw8UWdURcEuDO5hW27rwBgziIiINpNsWB276zQBwnfT6gwLMgSmbChfy7qFGoouy2x3bjwtfKASnE6xrKk8Auh+sPluxj2BuOENBr5yaWGg+14rtO6bOclLYi5yIsOJcURHmIM4/WfpbygXte+tSA/+Mow=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4007.namprd11.prod.outlook.com (2603:10b6:a03:189::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Wed, 29 Apr
 2020 07:11:01 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2937.028; Wed, 29 Apr 2020
 07:11:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: spi-nor: spansion: Differentiate between s25fl256s and
 s25fs256s
Thread-Topic: [PATCH] mtd: spi-nor: spansion: Differentiate between s25fl256s
 and s25fs256s
Thread-Index: AQHWHfVWQssMLhsP7EynPsc3LqjCPQ==
Date: Wed, 29 Apr 2020 07:11:01 +0000
Message-ID: <20200429071058.34385-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nokia.com; dkim=none (message not signed)
 header.d=none;nokia.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7039d9cc-cf97-4d68-540e-08d7ec0c792d
x-ms-traffictypediagnostic: BY5PR11MB4007:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4007CB91E47423300D8E4D2FF0AD0@BY5PR11MB4007.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03883BD916
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(366004)(396003)(346002)(376002)(39860400002)(6512007)(110136005)(36756003)(8676002)(2616005)(8936002)(478600001)(4326008)(1076003)(296002)(316002)(86362001)(66476007)(64756008)(5660300002)(66556008)(66446008)(66946007)(186003)(76116006)(91956017)(26005)(71200400001)(6486002)(107886003)(6506007)(2906002)(138113003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oRd6VagHEfViFzIwS3Gi2awI7CEAOgejxmGpPUKaKAIjzXb+9YObpfjwjugdHABtDxZur4EIffSvGAmZ0913vGpOHxK3KQRuYlEayCaOb7kKYk3QJRhZiQYVEzV7ggVjg73oXHgumjJuuYPTN8BEbU3FMKrPg8m0e1eq2dkQqxc+7rVYIOZ21yyYdavoJIwF3opSAU9EDWxdAG3WfBRx5Ic1RheEqn5rDHWDXMVQLqrhpLQBsIbcz1mkpktt0aKtNOSB62rXZSxJVF8q/jhqus13dfCxJSQe7hexASc6qBU8M7gcVT0JwlFr5ScsuQbDAAkrtXfhLVszc0nABEi2qRGHdrZ56br2pZIGYLbcVZvI/XOGzR5VTgpPJhmQzkVeVspEuIPpB1uCNe5ySb127gLgaB/uxF54t0CnWp6o7hOD4GOyhGvzIzyA/wciyStLQXj4VG7vJsk7pw+QO+9xXb7QRY1OhxMmt8uOZ2PBQW6GM9BsYuG8B9fwXjzLuIJs
x-ms-exchange-antispam-messagedata: lND/GGyYOx7OK/4jnBJFc7v20IJyu1y+0zZNKB5iuEm/rAhI6DrcDfi7f4mW/UqiUy/0HBw4jSXPt9jrvc2rzd22JfZAdq1VYCwfGcSup+bLfwgWXk3LOuHo6YpaQglzzHOGvMnzFainqgy/N9ebewvQ/BdeoCQ8K1DjDuJDCvfwCeCHd/v0sFhkYxgy/zD+ssNjJzguK8E9vdXb9B1zWtkBA5sgRXSeZnevrq9Tl0Nvd3zKqh5vV7EN6sk+L/gm2zb84MUYQ816BeOryYkdefbE2PgtEeXGXBQ6uNIWae2/E+3Gw56Nxfy4AmPF1KKC2QAjXMogXuzbV/+fVQTpwX9aXuZU2m+57MQlYR33uGXf5u6p0tU9yKhlHm543xRny0I3Sn0Q/RynwLu+u5fSxIsk7PL4fpNOjWFnYPDT2i/4ULjQywnPNeK2Z8aaGKcF+meE3Y0ZN/hByfbWtmC2N/RpyrNYNILKPmdt0quW81W9Bu7sfZ6o3/VsxDFp0VE6UTwi2gnLfCQjAMTAWpVF47GmJ1hBS0Vg0B8KEOanbEBsAY3ONQ4L8g84kZLH+1yA2cNY/k7ig3Ws6rUzftwoOcpSK1RcoUK1y4DZJeETQLfTKQtTjeq3awcHNRD0vTcmMn/1t7k20iSEzhaOlf3IiZLkFMkxyBJuyTt6u3g88cF2sEEngXq472JedR4V884gb4pwu/eMzzVSTgg64RcFDARCjhl52ntvZhDCynXHj1uqNJMLAPad0S16tI44RiyiDueqP7ikg/OHJS5D8vlTyNdceNypxAlz3tcyYJBlltw=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7039d9cc-cf97-4d68-540e-08d7ec0c792d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2020 07:11:01.1661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xXM6TD25CHn4Xic7L4VM4lUePAEwg924amGtlcw2HSy6QPBqRMRRbN0EA3W480TtfT0EKm6eTUycWoCBiuHnBuMA4/B9SWtZPT/CF9EG3eU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_001103_967243_B4CF5969 
X-CRM114-Status: UNSURE (   7.23  )
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
Cc: Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

s25fs256s was identified as s25fl256s. Differentiate between them by
the Family ID using the INFO6 macro.

Fixes: b199489d37b2 ("mtd: spi-nor: add the framework for SPI NOR")
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spansion.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 88183eba8ac1..a68975eb5303 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -22,15 +22,21 @@ static const struct flash_info spansion_parts[] = {
 	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256,
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			      USE_CLSR) },
-	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128,
-			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     USE_CLSR) },
-	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512,
-			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     USE_CLSR) },
+	{ "s25fl256s0", INFO6(0x010219, 0x4d0080, 256 * 1024, 128,
+			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      USE_CLSR) },
+	{ "s25fl256s1", INFO6(0x010219, 0x4d0180, 64 * 1024, 512,
+			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      USE_CLSR) },
 	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			      SPI_NOR_HAS_LOCK | USE_CLSR) },
+	{ "s25fs256s0", INFO6(0x010219, 0x4d0081, 256 * 1024, 128,
+			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      USE_CLSR) },
+	{ "s25fs256s1", INFO6(0x010219, 0x4d0181, 64 * 1024, 512,
+			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      USE_CLSR) },
 	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256,
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			      USE_CLSR) },
-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
