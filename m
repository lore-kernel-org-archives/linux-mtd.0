Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E66CA9EAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 09:30:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2346D2083E
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 09:30:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sGE+OU+0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="c+Qc4ud3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2346D2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SAbCWG72OrRVV+hCyBOp9gY4vVsvp0t1JVRSkv93q04=; b=sGE+OU+0fOliMd
	+i+Hvrlmcz/whyJu2L0Ojcukkob/lwYf//wt/3NxUyXMb33t7LAQMh1H0alj+qkNd7wMzq+F9y4vO
	w0b1nYdlKnZjQ744aVkwMjLBtProFrdFXwwn4qGiFSwMS/A/hgDHzp/YWVoNLvrFL3QV9hyl4wC7q
	nA5OjH1F0OPcqe3RtjLdcTvJU6JpcjFF3LxcHWkQ3D76rXdKCVf+mz4AfPCobyP0w1PkPO9v/DOcp
	5eRYDdIvWfsASJfTyeQb8ZvuyoyE++vXv/h1msCyKg3b0x+IqL/IcSYr+vCZCEdZPjLh7Ft5gn7qX
	RhqE6ELjcAOFDgzCGEew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPNpM-0000hs-K8; Tue, 29 Oct 2019 09:30:12 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPNpK-0000hT-Je
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 09:30:11 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: luomiyBvqg+0ArRUYoBInZWBkxsvajgkU6Lqvi5Di+1wxO1dl1hP5veZ9XSlU081rT6UOvQ66I
 NDckoI+guzQRtUtKhhLNrp5n+jdxZGOHP1MQkCCyzL50rSteq1D+3Q+FiXBLFX10sx1JbAm+dV
 WrV2NqTWpVgaXvaUFri8yVGNrHmkrGCjVeGV+DZEvT8cuQiqRvr57Haz+ufJBXczbUDXUUYWzV
 Mija7qM86ItG1jB+9d8s45v8R9pwoH8FwC3o/9eN98lE70NqWqTPiIEGg84QRwKaGNdNREQA1j
 WYQ=
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="54779637"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2019 02:30:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Oct 2019 02:30:09 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 29 Oct 2019 02:30:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mG/inXwspAXWpKAjhlqn7qFkb8V8hDsY2l7XzM+b43DZXCxfBSB0BmwZfcAYap806w6WHfiOPlaPE052AMLyZmT1Eqnm1bptpEmd9xaYTrhs0WmHDS+EKy6O+ij++Aif/7l+aYikn9aCaUk5bXZOxP0bCD2Ji/StCgvmFQPb0eA91ua0Z7lfPLi5d8HQI8xcCiQ623J3z90cQ8TLqENYgQkxMLfSVkBRwI1Rb2PR0USL+48rxKjdue5P4XaC8BZ5+fBCISLqEXlIradCgxulqTcbK/NkkRvJb48HNEEBJsaIIDlpbYTtSSz55J1XRMix4EiXDMAuhuGu/e2Q2eJ79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWQhUFaxmqvK24B1NVFOt6ar8nN1SP7t1x1pGpb/jF4=;
 b=UPyU6u1ePD937i0PB1t2RzO3bHkNnxzus0pWVwa3onBVpr3pyNAp/MwvumWrWT1BOWNm+9niR2qeQ2NI0XnEkvKSbY3bB+rIKF9BH7mzdnJ62caybbNElb2BsK9eJFERsDBWPsTD1bFJ1NYQTxSek67pPv+b8MSU5xzQISi8hFgiLLKOW5lHQMNSNOiAL9vJZTnX7hlR2nguygqEejfRoRT/bo/MOcoS6lC/lFiwmv/cNz439gvKHudaL4OTQ6iwGIIeMUCQDb9LguXrZTKYizwqSRpXOrVYuS8MgzP9Nx9WEAq9aB4EIiv9XnRDII+98RFGuF5jvtTMgUNK3p7BAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWQhUFaxmqvK24B1NVFOt6ar8nN1SP7t1x1pGpb/jF4=;
 b=c+Qc4ud3GyvXLeeLajWgyWDeQl3LAPUfv3mIcH0PgnLetjrcGqCFIwayx905tG2TNP6YIcOBO42oaRjCw5WEJiL6ILw6fCn3m0Kb+OTwX830meiHbrOMHmIy1dzyea2DFjveaoAVvM+Az9vynLKyFASEKx2ZI75DhhGijlGn3kY=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3645.namprd11.prod.outlook.com (20.178.254.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Tue, 29 Oct 2019 09:30:06 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 09:30:05 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: spi-nor: Enable locking for s25fl116k
Thread-Topic: [PATCH] mtd: spi-nor: Enable locking for s25fl116k
Thread-Index: AQHVjjtyIW9OLp/g5kaK9XgUMTe2Yg==
Date: Tue, 29 Oct 2019 09:30:05 +0000
Message-ID: <20191029092944.1322-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0287.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::35) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [83.166.207.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d527899-9343-4e87-f922-08d75c529524
x-ms-traffictypediagnostic: MN2PR11MB3645:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB36459BEF94C93DD6B0266ABDF0610@MN2PR11MB3645.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(346002)(39860400002)(366004)(189003)(199004)(50226002)(25786009)(110136005)(316002)(107886003)(71200400001)(3846002)(71190400001)(8936002)(6436002)(66066001)(5660300002)(14454004)(6486002)(6116002)(36756003)(6512007)(2906002)(2616005)(476003)(86362001)(99286004)(1076003)(486006)(52116002)(81166006)(8676002)(81156014)(256004)(14444005)(4326008)(66476007)(66446008)(64756008)(66556008)(26005)(478600001)(186003)(305945005)(7736002)(66946007)(102836004)(2501003)(386003)(6506007)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3645;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /xmzL0XAOYrEKEmeRbptr7KUYOgfC8By8STTMmjo8B3o2IyuFYUE069JBL5D6wXPgfAKz7ISc+Fcm8H/IfXItpFHofOXZZBh5ST4nhWKhC9xd30a9Be/gtrb7FnNjeFexESKZGXuDVd9Au2cLeYVEh0FY9cpm/X82XjBzSNk8vLXpbD68S1qRfCI/1ktKZIvf9wkMnID5brlODYXPcYXfxeJftr3WAR6XFLEgFOuWwtiJYhHo6g+4t3oUg2MzPEOsK5lynM4BXgdNLxgx1WpTtlcGaFMLMri8E87aw5uwfzfHtYRWaAm51Xguw4kj9sZs+cOvueuSTwq1R/CdJmRNmAJmCbv2/7SCKbMj9tPMwRQ2/vO9YuUr2qxLyEbzfewSJBAZsmHQObaFtL639jXNzgV1+YHiBCYrVvS142MiytaXqVjQ+Z5WjgUYTTi6faR
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d527899-9343-4e87-f922-08d75c529524
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 09:30:05.7885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nVv0gnDx7Z99h1vzANszygELFczTX+kYsQhwtAnyWEvtM34eg6QgoB0npYPCR6FbYr2ADHyyQ4WVY8VGUF6Sf27QoO+gNVrRs8RTDwThtv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3645
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_023010_671212_57A428BD 
X-CRM114-Status: UNSURE (   7.82  )
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

s25fl116k supports locking via the BP bits of the Status Register.

Tested with atmel-quadspi controller.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 2ce4c5cb789d..1dfcc9d4b463 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2530,7 +2530,9 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
-	{ "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
 	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
 	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ) },
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
