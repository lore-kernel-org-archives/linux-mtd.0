Return-Path: <SRS0=TEJX=ZZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	PDS_BTC_ID,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3058DC432C0
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 14:50:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 005ED2068E
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 14:50:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="puyPo4p0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="i5G8epX3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 005ED2068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHbDEe6JNQb6WeJKf2o23oz5uZekmlSri2dQrGXQgpY=; b=puyPo4p09VDN2o
	y+RWhTpKYcrembh6Un9HMMGG6NtkkMONW+BKXGvAkYLWme1ANigNzAjSPmf2NmJ6pIhaGvszaDWyG
	oyePQZzad8QhTiwtUpgLCdBnPq8NgDQhuGunvjsw7RYyFb28zT5Vo+4Q1acSX3X650p0TI2MWmE7/
	LlEaa73qCcom5lfgEMrzMgIog7CgVMpyqWCbEnX/Lace1iFR/3qmRsm+U2V3WqCDIHvqheNe2H1GN
	hB2jrgrHP5f/28PbUSyAZNLNGRM1KtQZ91P8hJTPVoPg9Gw5rW3HeiJbfGNFUucq4STpmJiRpqxW6
	ibfeJWvY1M49bn9wEyJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic9VB-00028C-6P; Tue, 03 Dec 2019 14:50:09 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic9V7-0001aP-G2
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2019 14:50:06 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
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
IronPort-SDR: JhVaj8aAzJJbfLzElp9vJjm58MBHm188GwM2t8ASiQHo6A7nTBFKDIeMrTGJlcJxVYEcRmwXCB
 6fJO1rju6uTzHaKC+tmyEJuNjB/dMzyxOekfb9Q4jFwCMuX3kdYsz0ah8J7UaYrmLBxw+9Jpbt
 +6cv92+YlXXw+9dgbLGUbnJP889KBQ8jjE5VaUtRevA+X6Zn6/p4QTAEUZ4siR8KJQCr6tvr6H
 AefPkf5oUiiFKT5Pb5kWoj0CB0miTFtBkpQ93TFORoqu2f+cNfwPLf69xfo2UQTv6CCz7YcnSg
 9aM=
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="60445757"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2019 07:50:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Dec 2019 07:50:02 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 07:50:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaTWhztqLt49my/mVtszo+X3b0NphazX7/55/Vab7DiM2LsX1ZiIUcneCh1YSJqBUZ3SxHTfTSXLXCZMBqV26RdbbRqpssqMXMOp4WjqWXC4QTAZ9ZOy7Nq4lT7VuRUCNneW5pnab1079VNzj5Ps12McuR6TEA6AqCGw8OpE6Ey9d0EWUQA4UjeHzKKy5ZgWzmrOE20KQNS3NtZD74ki5h6fHOeGyZ6vBitxBYGKd4pXA7/UgN4+M3nVtfE3r+Jiq81frBs6w03Vwk75uQ87E06FdJR0/cdzWLq2qfgChT1CnuuNeuInLek/R4gYIWXBQe9LLUF0FuhlqW+Fq0RfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2DVIxViO0Eejet6apQSIYlFMLx8g3Qk6sd2IEW6vsE=;
 b=GXNhzo66Y+0rhCOcQ8UkgtStDBuiI4oxluV0Q2FSSnAcoqqo4xLso05nDCoKW/aVDArnjrfoDhdpgcC4hT2jZeyvnq2K4ZmEHLFWbOkAe2ofyrdtjjBjO5OPusKG8kxGme68OTr5dtxGGX+jCuQIQWQbXUKNKLxFfzExs5aXcJP3imsGWTt+sxNvrW3Rl0cjPY+NDvXdqwJgABHIB16LTg3mlSL28OJ/aVwJMC0iPxUa0rkxud2bjQEN8MjbDx43w8rkEfs67BivbOVoC9r+5b6KGBZ9wHV7NGQcFVCVRjw3hj3w6ifZpG7MgM86QU0XPEGtegPvKLFMe1PZbqVoXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2DVIxViO0Eejet6apQSIYlFMLx8g3Qk6sd2IEW6vsE=;
 b=i5G8epX32jA1obYL6pielOZh8G6Z70gE7Gg1DG8KytfqBUDxBwPeokLg6b0Ceye8nW1qeKlBSvsZ+Eht7l1Rh75hrof42rL0VObZ8qVx9e2X9z5SIbvgIdhqXIS4JZeEx1GVXyecNxt9cifzB+oT+962DbcJRHLJF203rHDgikQ=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4383.namprd11.prod.outlook.com (52.135.36.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Tue, 3 Dec 2019 14:50:01 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9%5]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 14:50:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <john.garry@huawei.com>, <vigneshr@ti.com>, <richard@nod.at>,
 <miquel.raynal@bootlin.com>
Subject: [PATCH v2] mtd: spi-nor: Fix the writing of the Status Register on
 micron flashes
Thread-Topic: [PATCH v2] mtd: spi-nor: Fix the writing of the Status Register
 on micron flashes
Thread-Index: AQHVqejwCl518Aw3q0SW+i9wp+8yiw==
Date: Tue, 3 Dec 2019 14:50:01 +0000
Message-ID: <20191203144948.15137-1-tudor.ambarus@microchip.com>
References: <20191203141625.13839-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191203141625.13839-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0123.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::28) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.14.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e33acfd2-2efd-42aa-1a9f-08d778001300
x-ms-traffictypediagnostic: MN2PR11MB4383:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB43830BA50A81CD49CAED3AFEF0420@MN2PR11MB4383.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(366004)(376002)(136003)(199004)(189003)(52116002)(76176011)(386003)(102836004)(99286004)(4326008)(26005)(6506007)(110136005)(107886003)(316002)(54906003)(478600001)(5660300002)(66946007)(64756008)(66476007)(6512007)(6436002)(66446008)(66556008)(3846002)(6486002)(6116002)(86362001)(2201001)(2906002)(256004)(14454004)(186003)(1076003)(14444005)(36756003)(2501003)(7736002)(305945005)(25786009)(50226002)(81166006)(2616005)(8936002)(71190400001)(8676002)(81156014)(71200400001)(11346002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4383;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sMCvLLppz3E2ZiHRxyqDekknGpIvC4bpTG8wCmG+coQ/F46qj9X2bwnvxFCOPuh8n6Wu+Tfyp0/0GFYig+iIKPKhxRinshDo5xEpP5k3s8kL0bh8atEiIyVfNnm/l9PZ6Iwp2zZJG0haXDrU0Vqw1EeG3NzELbKI47ptUCt/K+TfGCVYdNCM7hJnqVf73wnl0YoMtr94xySMl1GbFju9iiboKqZkl3oGxrrFe505m2ydUhlnPcfw/lwyF31wfPftw1sW20/V3HkgK7/xXsmnd8I4h4Jb4IXOvo2iypHzNZ3q6R99ImVaNM7VfrBCwOV/Vo+wkWwo53L+pVhp0Pr0+FBMDQPAdEoSD1BzSgs5Au4TyP1ZXmbKyuO3I0GAy1gLj6cWDVXBk4MCeaD5T85U6KJEY0zaH7HUaddKB5+eO6c9VscFSRLQ7Br+z7wGCKw8
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e33acfd2-2efd-42aa-1a9f-08d778001300
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 14:50:01.3489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nYnzCqCqv/YV+H/m/9g8Beu1/xC7N0fM6FjJ6XQoJrb8LpuXxd7JVHO3fzxssovpvWwRDk4bg0vsdN3yh9z4XRAL+43sSHZtSy78UK7Pqw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4383
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_065005_583692_9662BF3A 
X-CRM114-Status: GOOD (  10.16  )
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

Micron flashes do not support 16 bit writes on the Status Register.
According to micron datasheets, when using the Write Status Register
(01h) command, the chip select should be driven LOW and held LOW until
the eighth bit of the last data byte has been latched in, after which
it must be driven HIGH. If CS is not driven HIGH, the command is not
executed, flag status register error bits are not set, and the write enable
latch remains set to 1. This fixes the lock operations on micron flashes.

Reported-by: John Garry <john.garry@huawei.com>
Fixes: 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit on lock()/unlock()")
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v2: reword commit subject

 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f1490c7b5cb9..7e41493f69d8 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -4607,6 +4607,7 @@ static void sst_set_default_init(struct spi_nor *nor)
 static void st_micron_set_default_init(struct spi_nor *nor)
 {
 	nor->flags |= SNOR_F_HAS_LOCK;
+	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
 	nor->params.quad_enable = NULL;
 	nor->params.set_4byte = st_micron_set_4byte;
 }
-- 
2.14.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
