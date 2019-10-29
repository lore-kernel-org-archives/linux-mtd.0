Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3CDCA9EAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:18:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8697D21734
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:18:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EaEZipmc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ueOaUdSN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8697D21734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drdxJFJgjzYjdzJvAVwg6nku/LLaiKjKcuQl+rbYtI4=; b=EaEZipmcKzx2Mz
	CeVcmjkoLTDXQMcH7gn1w5n1nMqevnoA2ox5Plhx1BliayoCHckiDtox0bxtRx+ZmH1XlXXEQorML
	DG1HYgk4bhsApvpqbuvC9qXwiHx7mnHW6Bx08+sB4yCnfmniEvGoI0aYuX3BucS3L2DSvNC/62ZWp
	CYArEAY9HqePIbsgy7Nc30xV0BcXsYFjBulcqjzLztGcu5afMdQAk3NzHG0HYHR1DbF8xsiN+taHC
	dHZgc2iqzC347Q0Bj1+FlG2t+fTsb50YV0mrSKF7ytJYgnwLU3LuzIVzPQUly0KCQv4FbedhnYNlz
	oguu+BcdQ9bLl68XJuzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPPVw-0003lz-5B; Tue, 29 Oct 2019 11:18:16 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPPUk-0002Uw-II
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 11:17:04 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: vVkiiLLHSRaxMpfpK3Ke7rSlW9pnI3n6e7sLdSFdw+FajeKC6T/E9Kc+8a3ZOl3rDmVQwSIlrj
 tFM6WNynvCRzNsb1nyEogf3QsFQ7gP2vWHD0GsK4IgB7ToE6Om+d9jp+OjATqkc6Rrezgh8sZ4
 u+UC+fjkuJQ8bcvVgHtJp+avAY7P19VlAUX47TACbb/g0qJP+z87kwtD6Xr+63XbBIsaI22RTq
 5hIx+0maZaxaPL1SsfeN7Gutw4aBuKV7iRRSe/9fZwNCddFvlIcDdbl44ufx9zttu3Dzu1u2Yq
 +t8=
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="53292001"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2019 04:17:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Oct 2019 04:17:00 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 29 Oct 2019 04:17:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYpY4eyNX5ibytc0fWhd8S7Tm3iVU0/HXbgCiXZ9QVyaZRM8Q93zjxysw2OSG/T9AHBDCeW7wxo5BgVQPtMqJWMZKWljNdtLnmVJrLVthN5mHR0DBC9GZfVsd92ESNQIb8IoXicGbGR0jxZ04ecc5TjJmQYdbg0OJy0CjMls6sX5Q/plQ+pb1t6nQhyKA6qLO03zyVqAgoNBqrcLI1+EYX5/W/WUs2kajv80bmR3fb2O9MQ1fo51xvYP9Cj5wrN38csyZ90QCDhshKH1rqLghH6iXdRSaNjCOA2qlj6c4JWiiO0t0gV9MyG0ahL535WvRFKfUOMENH4PF5Y3NunErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJfm5jh4Oz8X4fs+TaeWisQS8JOPbKaUWsgDfhGp8fo=;
 b=VyJYyav6gHAtL66JYhM3NObCMSemsoA6z2vhjtEP8n/l00D0WIeskltNkwT2D6EPPo6OfMU9I+Bxx9YGcfMghhFB8A0g9TQ8qVZErCHcon2r/rw82mqlzsGx8ghlv+kxnmEN4u0d2LWuy4epFOHWMpiLa7eMRvkDowWhhKhe3WtVQtTTFq48VfcjP3pTFnBPibCN+ng+SOTXw76P3yvFIf3Xx9iNniRrzgVW24KpKXtMehcIMo/OFVKTf1gHEH/s1O/cXVH8LWdp+G/XYl3mFhLmX3Y7rjJOCI2nO5op26Ht0vXNvg1EsP8qC7ILk9FF7C6bSxVNRdURcOezor5DvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJfm5jh4Oz8X4fs+TaeWisQS8JOPbKaUWsgDfhGp8fo=;
 b=ueOaUdSNF2m+RIdpJEyvsU29NQ/ifnAcf0P8XTGZGD+DeyLhZbX2g+XjPT4LzoDIjkT4vyeuWrkybUcDahR8ztW2IsZTTQV1ZK/7ldi+8UVa9mp4p8MVCflQss3yCef6uivGLGe4NynOSB3kKPrRiZ4YvwzZV9qeMHdv5Txevsw=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3823.namprd11.prod.outlook.com (20.178.254.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Tue, 29 Oct 2019 11:16:59 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 11:16:59 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: [PATCH v3 07/32] mtd: spi-nor: Don't overwrite errno from Reg Ops
Thread-Topic: [PATCH v3 07/32] mtd: spi-nor: Don't overwrite errno from Reg Ops
Thread-Index: AQHVjkphLyVSrUAb9kyKn0dz1sgAkQ==
Date: Tue, 29 Oct 2019 11:16:59 +0000
Message-ID: <20191029111615.3706-8-tudor.ambarus@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191029111615.3706-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0376.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::28) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [83.166.207.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a11ebe0-6295-4857-9289-08d75c6183f0
x-ms-traffictypediagnostic: MN2PR11MB3823:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB38232920B4676AFE17C75A80F0610@MN2PR11MB3823.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(346002)(136003)(376002)(396003)(189003)(199004)(478600001)(8676002)(4326008)(8936002)(66066001)(14454004)(36756003)(6512007)(107886003)(86362001)(11346002)(2616005)(476003)(486006)(6436002)(1076003)(2201001)(71200400001)(71190400001)(446003)(81156014)(81166006)(6486002)(50226002)(99286004)(66946007)(386003)(316002)(52116002)(6506007)(102836004)(76176011)(26005)(2501003)(305945005)(186003)(6116002)(110136005)(25786009)(2906002)(256004)(54906003)(3846002)(64756008)(66446008)(66556008)(66476007)(5660300002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3823;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lK+J0aQ+J7hmuyYns5kCzshQatVHTPy+eIB/Jqm4JzC64kSLytZjoUP2ATwKTmSa8JS7H4DB4FFCX+93Ymc9bQvw8b2aPhSCwnpx+9elz2AM3huGCFK79wd93Vn5YBD14gJZ3S4JRBQlFUNkLS3OvtCidJFvUBQzDO21k+ysrPGE8C1FDrH0QjxMf9RPGnsKuXkB2TTDpE5dF2DLwqEaF9UO5G1LTJEJSXeal2hcOA0yYLcQNd1AbjnFtrZzMPZEK35O7dy95ZtUFbQ+SyT0hbiU/5lj35Pk3jJgMyBr9q3xM87FxD9VlW8fQRQ2qFhsAyybtQyBK4z7vyZPqT2m5jKtrMwVPO8fapH2RJA3rhS5bwGxwNu4cRh0YsWS5hZki7e2p9KQvAM7q6eO5NaW1xZssoAVl/3GGXbMAUvoVVqfIH0Y4nnjml6rSBoXjSU4
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a11ebe0-6295-4857-9289-08d75c6183f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 11:16:59.3257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pu9f9vkJGFXBr0HhXMfAna8/rRDsqwSHvuIxEQJVnJ8obcx/ooYfN4xIY03ghjKV5xr1CS1PFxxPforGz89U188UrsploGjFvbuVxDIcbOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3823
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_041702_688501_3A6C6947 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Do not overwrite the error numbers received the Register Operations
methods.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c794eff69fe9..1a00438fd061 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1364,10 +1364,9 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 		spi_nor_write_enable(nor);
 
-		if (spi_nor_erase_chip(nor)) {
-			ret = -EIO;
+		ret = spi_nor_erase_chip(nor);
+		if (ret)
 			goto erase_err;
-		}
 
 		/*
 		 * Scale the timeout linearly with the size of the flash, with
@@ -1839,7 +1838,7 @@ static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
 	ret = spi_nor_read_sr(nor);
 	if (ret < 0) {
 		dev_err(nor->dev, "error while reading status register\n");
-		return -EINVAL;
+		return ret;
 	}
 	sr_cr[0] = ret;
 	sr_cr[1] = CR_QUAD_EN_SPAN;
@@ -1870,7 +1869,7 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
 	ret = spi_nor_read_cr(nor);
 	if (ret < 0) {
 		dev_err(dev, "error while reading configuration register\n");
-		return -EINVAL;
+		return ret;
 	}
 
 	if (ret & CR_QUAD_EN_SPAN)
@@ -1882,7 +1881,7 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
 	ret = spi_nor_read_sr(nor);
 	if (ret < 0) {
 		dev_err(dev, "error while reading status register\n");
-		return -EINVAL;
+		return ret;
 	}
 	sr_cr[0] = ret;
 
@@ -1932,7 +1931,7 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 	ret = spi_nor_write_sr2(nor, sr2);
 	if (ret) {
 		dev_err(nor->dev, "error while writing status register 2\n");
-		return -EINVAL;
+		return ret;
 	}
 
 	ret = spi_nor_wait_till_ready(nor);
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
