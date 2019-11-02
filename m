Return-Path: <SRS0=n7A6=Y2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07802CA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 11:29:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA04B20679
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 11:29:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l4Hxlqx1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="QDov+QF3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA04B20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=99wdurWauqexmqcpozAahY8b69x0z691br5aPd8uEbM=; b=l4Hxlqx1evpvCT
	BmQQfKC6o6g4d5prZsXgSu7iS7vitIlI4aWiVJLl2q3+TuwdF4GUKVapxhCPWtWvS80bNEjX8+EHH
	g55JP3hL/OaOt3so+tH8jd8qY4Y6dH4X7slHHkavujMPNa5C1GYxdMbZGQa2FpWB3D8D9oPrUHZn7
	lAMgXh1ATwXD2/+4xefHEIYJGNrZUaMRKsir1/OHA2EtXQ9Yb6OhD/J4LKIRXYxykR5eoqCp8LxZ6
	O5XB7yhH6Z4zU29S0q2GR6ONTDapHs2UrTaM6A+kPzPaSX+5QhHA+NIBCu8oN/8d74gNxvNEFbsA5
	8eVBSx1pn+o9ZE+qeqmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQrau-00009P-D4; Sat, 02 Nov 2019 11:29:24 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQrVx-0002pk-Vm
 for linux-mtd@lists.infradead.org; Sat, 02 Nov 2019 11:24:19 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: RzoSna1aSKdJXSTCpXJ+Ql2xqS0AAthS04Duax4W4m+ckfcU5cJ8ELAKlz2tTNIvbU9DYAxkPm
 GFBIU9YxJbc3nAueXf33j23kEzkKebWDPVLwUBUIVcuSNMbgPao5sVxJUT1x5UWx83DhZr2mGz
 jjwJfLQuIbbwh+EyxoSaSGyPHKrWehA0/ft7+ah0NXLa4lEZr/642WuLwUKrZ3tSfjPxN7de/A
 DNtkEry+ed4fhxD0hfjPWoB0Jz4F2hJkUkMoBZCMDwUQMGB1o4anycWIYXV+NHcChh9PnBDl7h
 BrM=
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="56751571"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2019 04:23:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 04:23:59 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 2 Nov 2019 04:23:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWUTVvKrQeomuHvvbyh/1h0zUguG/9jZDsUN60BdkgasCh/Fj3nuMC/3UrV+F0bIBHh0V5c3zqHwLmGIaNHWoZPUi+FevwbtJx/hRkeOtwSTk10ZTZdKclTDfUQKLJVkaokVTyLPSmTLreqF/vMuhUFEf4gfqyQOW6PN+HsAubsHuRweoLBA1ibt1ehGopiZqd20c/35PhTMsvNyFpRRkI2bafmAOc6HFcDEjBNkHuBQ6Pcy41aaoHCuBxSYFEH7RIomHr6esS291D51GfhdncZU1OBJrQPmyCgkgHKzwebSGuW4pksgsU+r/6kSvVErEkpFAEt39QqdN2qO9FgsoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EC+QcBIhm8YTiDdrZWBYCxC/fs9j4741osCzppg/Kz4=;
 b=jIg/NqWeicaXGpvayZEQTwYNhvOkHPdYfZ1imqfhRPAPFTv9JfdaGkPbRfVny68TxykqnLGr2pCn9sqdyYLu9ES4+OtyLzy99d2xFBH61/OmVblq11Y1ETFIYFIBASo9iZnqPo3hd40ihMywym3K7AcBYAK4JVqlMIF0m2Z1fGLM4eEPJr9hroQ2i1ONc9k4zwfC22BsTl3U+5Tm0FLsjp7WEs20cA57Pr27It3bIyKpzAp5UVk1cWKBToQcw8+Y1MleVA65/fmpwF7B5b8dFV+cOxInrhxqE5MYhsT7zusts4b8qCSBaHv1x1VBv30WpWfUxMYtetuzhKU6avWBQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EC+QcBIhm8YTiDdrZWBYCxC/fs9j4741osCzppg/Kz4=;
 b=QDov+QF3gPYJAJ5+wCM7k5dfmlw+uGgMQa30r9m0nlm+XXVnNCs+M1T6Vb6ixEExdVZdt0sK/hiu4lIV8iittZ6zChNQNsh90IpnIbcNKME//vHBV/BuyLtGihqWRcxwtAXfhRDqJpS63hueU4jGm46LiaM1Pqs9dGdfv7GEzz8=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3711.namprd11.prod.outlook.com (20.178.254.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Sat, 2 Nov 2019 11:23:58 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 11:23:58 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <vigneshr@ti.com>
Subject: [PATCH v4 19/20] mtd: spi-nor: Prepend "spi_nor_" to
 "sr2_bit7_quad_enable"
Thread-Topic: [PATCH v4 19/20] mtd: spi-nor: Prepend "spi_nor_" to
 "sr2_bit7_quad_enable"
Thread-Index: AQHVkXAEn4L6B6RufEiUUs8gUF4Ttw==
Date: Sat, 2 Nov 2019 11:23:58 +0000
Message-ID: <20191102112316.20715-20-tudor.ambarus@microchip.com>
References: <20191102112316.20715-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191102112316.20715-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0143.eurprd07.prod.outlook.com
 (2603:10a6:802:16::30) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b5d0f50-bfb0-4acf-f8e6-08d75f872736
x-ms-traffictypediagnostic: MN2PR11MB3711:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB371178C5CEFBE0042F5291B6F07D0@MN2PR11MB3711.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(1496009)(366004)(136003)(346002)(376002)(396003)(39850400004)(189003)(199004)(64756008)(386003)(316002)(446003)(4326008)(5660300002)(81166006)(6506007)(2616005)(76176011)(81156014)(11346002)(110136005)(476003)(25786009)(54906003)(8936002)(86362001)(486006)(14454004)(8676002)(102836004)(26005)(66476007)(50226002)(2906002)(6116002)(1076003)(2501003)(7736002)(3846002)(99286004)(71200400001)(36756003)(71190400001)(66556008)(256004)(305945005)(6486002)(6436002)(66946007)(66066001)(6512007)(66446008)(478600001)(186003)(52116002)(107886003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3711;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NII3mQ6T5KZ6t0e4Vs2HEwfN2Htaj8hurfdl7N/5sAlc75kTV9mfOYA0Bpa2xkGt0FCmhWWGVc0zqXRAj3DxqDJM5pDluvMjm287Tr49x2OfJrd57eo98N9dv/VTcxJrfXq6SgNiW0LYM0TcyO3W7bDq/SF+Lwor217/hruOWy6xdFy6EbBYilO2YQRvi4uHC4i0jWBD5VtSGoPHnSpYpmYRE/B1WFgTgETR6Wi6D+cvWijv1u+y8Cjxq0mCBNXHh/PAyFyNtmZtsoVlfClXymfe3Ebc884sVik6PPSUrMBTcgOklMFdZbS6ShwXzeIPltcNLRIL5K9NqoGn/uC6CvPVVgWpy38sQURGarlraPcsP/kpHXSDsd6JZaLqtGo1thpAbCFxrGobcaCF9U8g0tchPK6yoV2cuQJ6cDtnE2uck195lefGDIJe0YKRYcnV
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5d0f50-bfb0-4acf-f8e6-08d75f872736
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 11:23:58.4129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EGJZQx3A3Op/1QDA0lRWCZ+ki0jFXxiAx9CjMPHg2OIICqMOEWKpCnfzUDnJsudTQDRBu4xh64sR2jFXPWn6/ZzRlmBa/L89rWwjHE7Cx3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191102_042418_078546_F80CBB12 
X-CRM114-Status: UNSURE (   8.62  )
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
Cc: richard@nod.at, Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

All SPI NOR generic methods should be prepended by "spi_nor_".

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 85e5a56fb2d7..09b1af2cf0d4 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2129,7 +2129,7 @@ static int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor)
 }
 
 /**
- * sr2_bit7_quad_enable() - set QE bit in Status Register 2.
+ * spi_nor_sr2_bit7_quad_enable() - set QE bit in Status Register 2.
  * @nor:	pointer to a 'struct spi_nor'
  *
  * Set the Quad Enable (QE) bit in the Status Register 2.
@@ -2140,7 +2140,7 @@ static int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int sr2_bit7_quad_enable(struct spi_nor *nor)
+static int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
 {
 	u8 *sr2 = nor->bouncebuf;
 	int ret;
@@ -3733,7 +3733,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 
 	case BFPT_DWORD15_QER_SR2_BIT7:
 		nor->flags &= ~SNOR_F_HAS_16BIT_SR;
-		params->quad_enable = sr2_bit7_quad_enable;
+		params->quad_enable = spi_nor_sr2_bit7_quad_enable;
 		break;
 
 	case BFPT_DWORD15_QER_SR2_BIT1:
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
