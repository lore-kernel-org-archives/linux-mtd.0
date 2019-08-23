Return-Path: <SRS0=tnEL=WT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BA6C3A5A2
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2019 15:40:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9878B21019
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2019 15:40:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NdYrL+nj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="oHHTG9EF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9878B21019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IlzQY7geVBSCAyJqycpEV/Wvo1eXY0bu12dVY2Twkkg=; b=NdYrL+njLlltee
	yaQ2wkj4dl2URAjgGT5uDDIA9nHvu0p36B5Rlk9IkcWJJvTdza47CL1lsbyVNOaD81xzr6w/z33be
	pp4L4my+n277pM71NbP8mQ15gPHAH6r1Uss8og5gb/xtvKhZGZOvwk4u4Rzj1dRoJF3RAL2/0cgCO
	EhslcoHem8NskWNW6OPiI6h01tOMv45yR6K+Q/ABG74NVOIIRgdKclmdutOFkbiy1VOSu9zTRdRao
	K1kQC8ZG5j53qfmXB1o5OFJxg9wBVZ1bobcmrJRhVo3Z71C8brLj0wjs+4VE8Hsj5tclMK/G33nLI
	Z4g4skAfeUmtR9BxnBwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1Bfg-0005NJ-PK; Fri, 23 Aug 2019 15:40:12 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1BfS-0003yB-DB
 for linux-mtd@lists.infradead.org; Fri, 23 Aug 2019 15:39:59 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: zseLCFS1O6gU/1Z0VlVazSSgJCr9nfwtEOv8EbfwJctmVxpNcVvU1TER3lbLz9o9E712tEAQOk
 /2jrtEifDY5r0Gwtnfd72KOGrN76cDVdyeo4nRjYz5BqmQ7JZP+eftMSKfF3rqcA/4HfdiVSsD
 jf565KHNIzZgf0IcECb1TGMNRl8ulU31+hegzCZLA+MY77/KDUp85fV/xF4CY+quH16UCdM3Tw
 2zdVZtKoS2ad0cUshWGbZADCOvOVIXt+f7zArdqSga1jVqHFoMplO2HRCatFYDmZ/5KuZ6nhw5
 zmQ=
X-IronPort-AV: E=Sophos;i="5.64,421,1559545200"; d="scan'208";a="45393969"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Aug 2019 08:39:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 23 Aug 2019 08:39:54 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 23 Aug 2019 08:39:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuYE11Jx230q2x1sq2ux1KxoJVZsQgdLdongFrsXmYN5kCiC9NQmAgLd3jpXzqAf01e+jZbV2USnNaIufZj6nBX8v7eEmc/hNVnG53zViJ+azGQGHV6H29EWI6P7LMF0mJIRvm0My91yP4lu/0JwFU4H0V2rWHwxMhgrjd7ma2eF9vFb3Sy6DHwxo0b/2QIqt4HAygpkKJGR6BoB3pYlJ0nLJf7tnstdqm7Teq6gC8XY2dvCIAwnQFo1BKiT3MuHpUZBeq/MPqAJehEaCdZddOwdC6PLjFMvOjrKw9g7DJECf2dPzhF45P/diOKVE5F3q7Li/L3eeSr5xoMy0XAkYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwD+0HbtXVmzi2vgLmHJ7S94w1133RhhzVO1iuF9bNY=;
 b=PTGOi218oo9ha9/kKvqQ5mVdu1uB1eSnZeo392GpZwaZYVKrnFfk9d6n8ld+Wzw5mtHWNRPEiTdlMz6950L4MVhZ6ff/VVxTK8DoNzfg3ypfWQ22rbg7rqgDshYMswt70QkYwSkgK/ezFRurv/lp7v9qVdQPOMtJEwUKFOeUUVFDYzInvpvsm9869JR0EE/1QJRfWeAfY1Eglf00ebaBSJW9h/2XXXbnA1EaE8DZ0Dtd/glFwdZjdp+xLOVn7G5KtH6bF8PeRRJawq2OSZ+MOn/uBuygqepDJYKHiTTea69EVFLnWXcPkLTKw3o3JDRRjY+85iG/3S+3xKX9AVngUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwD+0HbtXVmzi2vgLmHJ7S94w1133RhhzVO1iuF9bNY=;
 b=oHHTG9EFkq9GDpIHgHBlyWOGhbG5h63ZBbpQ5M4cUM7I38oeYaqaCs3n9vHQzI13Rqpe0TuwfACCPTLS/GvnK4GCoVWfMM1lQcGMxjl+UHQoVfLbJ8WzCTr8h8g2o37msMCLywsiBTUJPp+3jPWSlHHXJKbwPhwq37I3avlgi0U=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3790.namprd11.prod.outlook.com (20.178.253.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 15:39:54 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 15:39:54 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <trivial@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH trivial] mtd: spi-nor: Remove unused macro
Thread-Topic: [PATCH trivial] mtd: spi-nor: Remove unused macro
Thread-Index: AQHVWckCovcz0915vkiPSX7w3f/ICA==
Date: Fri, 23 Aug 2019 15:39:54 +0000
Message-ID: <20190823153946.12860-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VE1PR03CA0045.eurprd03.prod.outlook.com
 (2603:10a6:803:118::34) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79a1914e-2d08-44ad-0dcf-08d727e024e5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR11MB3790; 
x-ms-traffictypediagnostic: MN2PR11MB3790:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB37904A2648AEDE029F14DECEF0A40@MN2PR11MB3790.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:341;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(366004)(376002)(136003)(346002)(199004)(189003)(186003)(14454004)(71190400001)(52116002)(81166006)(6512007)(71200400001)(66556008)(66446008)(8936002)(64756008)(2616005)(1076003)(2906002)(486006)(25786009)(256004)(7736002)(14444005)(99286004)(6436002)(4326008)(4744005)(50226002)(305945005)(6116002)(3846002)(316002)(8676002)(6506007)(26005)(81156014)(66946007)(2201001)(478600001)(36756003)(107886003)(6486002)(476003)(110136005)(86362001)(53936002)(102836004)(5660300002)(2501003)(66476007)(386003)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3790;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rjXBqQFHS037Wwx0u6vTYniKFU9OngTg9nsMe6J+61CG+QGAQrwC5L1SyyDVfI67B0WKZrMtfI/3KYFbl/76DF/gxvAGQaGrp7zX9URVBEp6jlay0HeZ/rGjS2EUnfgrKDd3oFI2heMpwgsMJp5PjzCuhKof5OvZhgIIAus3h81yRBO6TuOx/lNV3ODs2n6yIiAwR/PCawRLtSB7toh5T3kCtUoxL8XtCdTYqKmgqISYejyBQ9lzQa1kKsA3d76CZz+NQqW/zeBjTB6R9AASFdmOkKpAQWFgQ2aDqBPoBaWr/6QAAxftnvF9qfK8uG8+GFvTJ1mQ7mwufRhVD2idpbZYBOzZz3feQe2kn/skUdhUNxgVf0cPEXYJGACFF0jraNi2HZtZMCxC1+QvWvqzHXafeSSvEeJmehvQAkQ5kB8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a1914e-2d08-44ad-0dcf-08d727e024e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 15:39:54.4971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o9LVD0M/jXx01YQgE7UjBcfqmZeVsUMzBafnps+gAhUPtNeCwUY9lu+E25aH6XZVlj9/jADPx/veem92+gRdnnMYe0/ZF1WCGURuon7ryzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3790
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_083958_478324_B7A21C71 
X-CRM114-Status: UNSURE (   6.17  )
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

Remove leftover from nor->cmd_buf.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 include/linux/mtd/spi-nor.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 63560b375168..3075ac73b171 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -225,7 +225,6 @@ static inline u8 spi_nor_get_protocol_width(enum spi_nor_protocol proto)
 	return spi_nor_get_protocol_data_nbits(proto);
 }
 
-#define SPI_NOR_MAX_CMD_SIZE	8
 enum spi_nor_ops {
 	SPI_NOR_OPS_READ = 0,
 	SPI_NOR_OPS_WRITE,
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
