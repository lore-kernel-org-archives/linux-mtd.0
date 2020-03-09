Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B87C10F29
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 10:15:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AA7120828
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 10:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QMZlMWr8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="BTv5/0m9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AA7120828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ym+I+n+vYTE2xxKhtBQWxbeWlRakunV8z2wCvlBHb0=; b=QMZlMWr8WQyYzy
	66/83aiTxoDrs4voKGE1/t8Fow6J1IvPdwb+QFCfV7YTWwRA+qK0meMMOIAVupjujnp4gCjEuCGzn
	Tb8Ezc+IRaJAe90pH44VwlOgZvI3ZR7E3y02aXknt76yUzDMFPWBVkhwwdLKiurdFBNougEfQoA9r
	9ODo47E8d/g7fU1PNmc9phDJLr1aeRalReaV1CBR/b9vZNN/Jt1XCH/zu5bM0TsDnwIkj8/JsDGAg
	+40sZkEl8RBYnGQu1kXXxbh0R/mq6GHo9XEWLxonNIoV9pyJCGSMmdnD6KqzjWCZWsThD+6GE4TDl
	iZ73idLxkUqzZat8Ii4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBFRW-00011C-0M; Mon, 09 Mar 2020 10:15:26 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBFRK-0000ro-0D
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 10:15:17 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: Qpclgc2GfjKSQvf3v2P4OecX9W5zJaTfO8L7PumnYSOGnRms8cSBOrq0d9yh5Ts0i5KCpdahIm
 RjxHBcc1sB0S0XBFMU2MRIDAEP0oNDD88FXFUdGktJCT4WbNNjqDEKPLyhewyxYyPeGPluegeC
 FvT6NDgZV0GMJFZTKag9a5YU/2wWGT6a9zYZVMCyFCaq0+0QonPzvo+xTnu2et+l/FAfiqox9k
 kKORNVjeqc7lBSkxONPNKza1drncWfwmB2lKB82aosSy4BwCnp4V2gpqTI//LcUbM0V4KkxYO5
 h9U=
X-IronPort-AV: E=Sophos;i="5.70,532,1574146800"; d="scan'208";a="66560839"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Mar 2020 03:15:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 9 Mar 2020 03:15:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 9 Mar 2020 03:15:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRQXkGS9YGR3xSYHOXXneCWVLguTHooITdSHSPeOO3vXpoeNm/mQTXMeMrBcN1XZWyI/XMHf2OHDw9cwESjAD50XaohVWSXGX6w4z6dJ1r+8WAR2J6y10yokjsns6mvXtA62Eo0TXQPOP4Bp7+KgjVo6HirfYtfjRr6KjOG9eoOSY2jrCZ+efrE4oHGUV9iHNV8cGsaJUthL+Q4UbMLNphxrlN2wCtRgB4xAajQwTkBjX933WQQ3JZyWTLCQaUregXoky0E/73Dx+WKZ+iDlAnPXeuvV6sPtoczsD8FmdnxbJZ1aCH17KMGfIoKamBaCwt9DAec5gXG7w1u/jn/eMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+Vyo3/jGtujvWsSTvhYXW2to37apmK6xnV6oeEB9cc=;
 b=Pu3P5yB198UDXRSEaoJc7ghjbmdmVLyoY3HEgVaPv/59lnv5m0vanJd/Je6lBwCMgrwEWVSxrwQnAzkNhIxrTdBNO9uL8C+Mj/nUyioihZxe1r2Gahs/AvDG1oLoHyP7999aphFy3+NB914ivcbJm6LZaaSQZa1s4rEEWuqqUD77eVS8oIVXrWf9AaU49gzIMZRdVz8Qw30QJI8I3Syeu2jG1B+Btl520JDILOB42qFCrYl/uWxZb9ptEtgZL+Hz/HOrjAaVoAXuig2R+1Ttve/nw1LYQUK0WKXGo/hoB+MU1biemmUzSoIlCdAcW3/hHKTGwb+2/Kg73vzH1j3lMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+Vyo3/jGtujvWsSTvhYXW2to37apmK6xnV6oeEB9cc=;
 b=BTv5/0m90ZUrAv84sBCJf6DxPo8ro01SbhaU+VLHZCD+smbiKBnG2nvcrQDuSHoOkFhWT4wB6EUn1iaqyqCLwY6ZqqfJXKXKUkeBSMseJfjodLIwX8pDAs1bsJ48VD+A8MT383Zs7j4sza970hO0G6P2CaFXiXQi3RLeORNjMBY=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (2603:10b6:208:193::29)
 by MN2PR11MB4664.namprd11.prod.outlook.com (2603:10b6:208:26e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16; Mon, 9 Mar
 2020 10:15:04 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2793.013; Mon, 9 Mar 2020
 10:15:04 +0000
From: <Tudor.Ambarus@microchip.com>
To: <john.garry@huawei.com>, <vigneshr@ti.com>, <chenxiang66@hisilicon.com>
Subject: [RESEND PATCH 1/2] mtd: spi-nor: Clear WEL bit when erase or program
 errors occur
Thread-Topic: [RESEND PATCH 1/2] mtd: spi-nor: Clear WEL bit when erase or
 program errors occur
Thread-Index: AQHV9fuZcGfZbo+l3ECm/qszDCxAlg==
Date: Mon, 9 Mar 2020 10:15:03 +0000
Message-ID: <20200309101501.191530-1-tudor.ambarus@microchip.com>
References: <3245882.KdgdznRmvK@localhost.localdomain>
In-Reply-To: <3245882.KdgdznRmvK@localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 417fa825-f338-48b7-691d-08d7c412bc16
x-ms-traffictypediagnostic: MN2PR11MB4664:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB46647617594F6107DD67519DF0FE0@MN2PR11MB4664.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0337AFFE9A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(136003)(396003)(39860400002)(346002)(199004)(189003)(186003)(107886003)(81166006)(54906003)(81156014)(110136005)(8936002)(2906002)(36756003)(8676002)(4326008)(71200400001)(2616005)(26005)(6506007)(1076003)(86362001)(316002)(66556008)(66446008)(66476007)(64756008)(76116006)(478600001)(6512007)(5660300002)(6486002)(66946007)(91956017);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4664;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dv8tKf47/i7FTMCpJ9bCUcRoQAZvYTPreRmqukIkTLRO9Kul+GAQ0qDSmio2h7eUpoycYwbbJIaPHQxjZy8sfgLQECgj5akakyPlILPDYmyPrxqdeYlownr9IWC83HdPBjaRNbpqCEQ1Dy4HZa3y/UYVCvTgBnIaX8IKBUm6ahS8d952gI6h7XNZ4NL4qw6UYUVFqMqZTDYSt1/7glL2oxg1NIrJvw2hb+gaSw4BNGVzHlUfgg56BtEkfc3B2HYw4AS73zx0TTLylixGrEuy2e77ZE8KNxCDAT3+w2MuX+pMPKwIBZd/5qp2Js1jJhJowfydhiqd2DtZo6h1RMFz4ZlX/pIOEr7IEyqeAgQkYvdTnuUyaYCL9XyiwSJ7sX1ovhOtvjkd5W7GqecYfFypJZ7eJAo4Ug9hZZh99m2I5JOoQ4haD358fYkmaozTB51E
x-ms-exchange-antispam-messagedata: MNWY620YAQmaBQKJClwL9H5dbwt7/Iy6Xzse1ZUtHE+djPlsRIGSbetp9pP/O72+EGcDAlGyuC5rmWM+xrNAhRPczBfNQbUagon0xvgH3M01EUlrVordx/c+xKqjRFCOlHu6kYwb8vCnoeqQp0gmlg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 417fa825-f338-48b7-691d-08d7c412bc16
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2020 10:15:03.8966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cHzohdYghUCuRbsVUIkXwZYHo/F6mYOiItouyHkc37T4DTYSPDGdjMT7qH2y+tTz1bOn3syaZcHDW6qh3uBvHQEHmPn3WI60Z8hvplViqOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4664
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_031514_259379_220BE1F4 
X-CRM114-Status: UNSURE (   9.21  )
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
Cc: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org,
 js07.lee@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

When an Erase or Program error occurs on a spansion/cypress or a
micron flash, the WEL bit remains set to one and should be cleared
with a WRDI command in order to protect against inadvertent writes
that can possible corrupt the contents of the memory.

Winbond, macronix, gd, etc., do not support the E_ERR and P_ERR bits in the
Status Register and always clear the WEL bit regardless of the outcome
of the erase or page program operation (ex w25q40bw, MX25L25635E).

Issue a WRDI command when erase or page program errors occur.

Reported-by: John Garry <john.garry@huawei.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index caf0c109cca0..4376d8ad5834 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -819,6 +819,17 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
 			dev_err(nor->dev, "Programming Error occurred\n");
 
 		spi_nor_clear_sr(nor);
+
+		/*
+		 * WEL bit remains set to one when an erase or page program
+		 * error occurs. Issue a Write Disable command to protect
+		 * against inadvertent writes that can possibly corrupt the
+		 * contents of the memory.
+		 */
+		ret = spi_nor_write_disable(nor);
+		if (ret)
+			return ret;
+
 		return -EIO;
 	}
 
@@ -875,6 +886,17 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
 			"Attempted to modify a protected sector.\n");
 
 		spi_nor_clear_fsr(nor);
+
+		/*
+		 * WEL bit remains set to one when an erase or page program
+		 * error occurs. Issue a Write Disable command to protect
+		 * against inadvertent writes that can possibly corrupt the
+		 * contents of the memory.
+		 */
+		ret = spi_nor_write_disable(nor);
+		if (ret)
+			return ret;
+
 		return -EIO;
 	}
 
-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
