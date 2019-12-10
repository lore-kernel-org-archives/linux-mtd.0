Return-Path: <SRS0=XIAy=2A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E94AC43603
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 16:42:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC5820828
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 16:42:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BOz88Omd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="d6xY0Z2m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BC5820828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnglv8qS+BfN+syM545oHCPUxvdXvFc/+jx0XkA4jDs=; b=BOz88OmdYjAiag
	WQPPFeYBjN0wdFHonmdhbjkr/JlY2B/ZSwZa9dVFndwHlCro0QKUzwhoyBv0Ds1kUdp+/FXYGEGIp
	TUbA6DZR6gZo9usJVXaN2iN/Wh2C3qvRyVYt1pALx80wPWl5GXtGaN4EHw8BNPE9MHCPvNvmTiG1T
	sCt9hplD46gWcy9nGN6hUfOtEDIOvMc4m6AB51wCWzhN26GRyd2NylKpVaRRyrPtxIH+HnybeAEME
	KrLezvjnhx8uu6y9hOEe7QYIfGGe7Wu1JKIRVEj6Af9VhGGBFdp3mAClY4UdwYDiWVCmMc7oqQ/Av
	reDMk0b8fTYCHWt60Wkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieiaE-00049L-CV; Tue, 10 Dec 2019 16:41:58 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieiaA-000485-Ek
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2019 16:41:56 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
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
IronPort-SDR: rkjiic8pwGIckqZmEIM0drfmatvACuKijco2MEeNW5OxwCV+QIW4BICAxoDu4fGEhP6K4w/xsL
 yX6Bx96h4XxM7CjFfIB7cIwB5ygddhIAXjmaoTiizIcOvbTdKXSqbSqX3PNBNC5HAM570+nqUd
 7FdwtjqU78MTz8CCbrizCGx4gCAXUOjsVaDxhHi7cXg12grZi/YgjM0USQdI/826STOsIpcuaZ
 it3JKunwVxy6HJxeIC6oT75Umr+q6MTViwm4gJ2I9qJ82QnSV76lbcg911jqLUrmWcBv4u5qdK
 dq8=
X-IronPort-AV: E=Sophos;i="5.69,300,1571727600"; d="scan'208";a="59875114"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Dec 2019 09:41:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 10 Dec 2019 09:41:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 10 Dec 2019 09:41:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krZzx/E0tuXF4v/q+RYbTHEbDyL+hFQe28TjTkADxioEh6vltTMoTNhpQh/HaVDc2Fh8WgIfnc6e85BwwgluororKx0l0xU0Fzar90kRiaxUrV2XzxqNl1TMOrx8U6UitnPPvsdoDnTM4VU1pnipq8N1ZWQ0XVkU09UUJgErMTWMOeFT/ly+eilpGInvPIDBOBy7Ukemwp9nsJtak/sscF28FFn4LnF0INVqAFLbp9J4h8OFxnp17nrz0cgiUTpuAKOZWGasgU1+glItcTC5XuBZDYmO6K8u+xdYGprf9DIWksU7iQXwBYLtybuaqOzoF77YBNUaN8w7GezlVIYgXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDbaF5wTpCINPBruo46X4bGfbK8RGvT+ihEEBCZITFw=;
 b=G1mqp4VIPgpMt9TazMd8Or4pvtz19ngC0zxAoH9/hffQdgIQ7qjzRD1Qp4GOVWUWxXssB81cMj9ofvu4o2WkvHB53vSB2RjICvQK3QENpHvdwpMdg1zP6Qs7PiYCErnbCz6Idi7/SKJEyQD1rkCwMAunKlhlsZjnD5W+idafoYGzg+EMNAtqCRbyQqj9UcVHU/3U0raK8bMSUHpluTvAs88JSQTGaYnommR+K1V10rVl3S74ThQrEJ0kn6wLX53Vd71W8nviFBkvXerMwvGH0AfFVr46G4KyaHrsT6QS0EjM0MKOikmYa9fJd0XMQGIlBmH/fycihYeSQqpWXe2dUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDbaF5wTpCINPBruo46X4bGfbK8RGvT+ihEEBCZITFw=;
 b=d6xY0Z2mIxBzTcS5w8TwmT14EJuXjDmJrb63b3ObdV4DSkEjaZ/LvIlGq43cgtST6Yo5hptIdUU1hmKaDslTgrpsxkld593n4VZWz/eguy8iwmM6lAr0BZhdQNfLEheCLtXnb7COoB1kx0oLKa8dra/6OG8XF1vahz7TcVBwGtE=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4142.namprd11.prod.outlook.com (20.179.149.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Tue, 10 Dec 2019 16:41:39 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9%5]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 16:41:39 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>
Subject: Re: [PATCH 3/3] mtd: spi-nor: Add USE_FSR flag for n25q* entries
Thread-Topic: [PATCH 3/3] mtd: spi-nor: Add USE_FSR flag for n25q* entries
Thread-Index: AQHVqzmf8iwWvE8bpkiqAqAWQ7JzzKezmuaA
Date: Tue, 10 Dec 2019 16:41:39 +0000
Message-ID: <2d931347-d927-4674-86ff-7eb285624bfc@microchip.com>
References: <20191205065935.5727-1-vigneshr@ti.com>
 <20191205065935.5727-4-vigneshr@ti.com>
In-Reply-To: <20191205065935.5727-4-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR10CA0059.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::39) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191210184131635
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f618676-2990-4b0f-57a0-08d77d8fd420
x-ms-traffictypediagnostic: MN2PR11MB4142:
x-microsoft-antispam-prvs: <MN2PR11MB41427D20C33592D46EEB9254F05B0@MN2PR11MB4142.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(189003)(199004)(81156014)(54906003)(81166006)(36756003)(4326008)(66476007)(66446008)(53546011)(66946007)(498600001)(8676002)(66556008)(6506007)(64756008)(186003)(71200400001)(26005)(6512007)(6486002)(6916009)(52116002)(86362001)(5660300002)(2906002)(2616005)(8936002)(31686004)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4142;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MNFTtI6iuNVS5LL8OtlRbevYwRFwDxGRQUAiwbZYMmgGUgCR0rpJN/z2XdTC/AqmxjNsCwNH+pAQxdZaPlvFvGfvSsya3vJtCGkPOB60SF7erIffXVKA/IiiNCCxC07xg5NiUJ0vH3wAUPDpdrUr6s8W4/Re+40Yfo5zGJLOzWpVr9IFrG4KQB6eIYbln+QZGr16X4/pOPq6MCfcePIXgIofgHkZ1wdfw4rDILTBlcVGDFtiLfpuQhm8Z+pOAlawmQ5Q8QB+KVls/ZKdfbdmObh241j7fG3fh09qRvMExOAdB5Ll94E8jjBQxIZjff6CSiLbwOBagnx46KwFuexNAREdNbhh/VkX3l7sd++bJtGNex8GmcPFzlfHpJ3aRmgUTSuIWmaS+ClxjsnyGA8b4DwHw6Ooqi00UtXvDked7o6Kc7ABOafV0Pz2Df2FI4B+
x-ms-exchange-transport-forked: True
Content-ID: <B798DD62F152CC40AFAC13268B2B0A7A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f618676-2990-4b0f-57a0-08d77d8fd420
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 16:41:39.0218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r4eX4ScMCg/kozu3S1yZ1VkDlHq9U8Nqs+BWDxzTfZ9ftb+ZKmm5kdVLXSTDVwAA3ZnhZxOyP6iSrDx70h9qq5acAnKvgVQgA2dxhza+wOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_084154_513250_2FF87926 
X-CRM114-Status: GOOD (  10.82  )
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
Cc: richard@nod.at, john.garry@huawei.com, Ashish.Kumar@nxp.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Vignesh,

On 12/5/19 8:59 AM, Vignesh Raghavendra wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add USE_FSR flag to all variants of n25q entries that support Flag Status
> Register.

On a first look, all Micron flashes define the Flag Status Register. Do you know
if there are any Micron flash that don't support FSR? If not, would you be
interested in doing some documentation work to check this?

I think we can do this more generic, always set SNOR_F_USE_FSR for micron
flashes, like below. More, if FSR is specific just for Micron, we can get rid of
the USE_FSR flag too.

Thanks, Vignesh.

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f4afe123e9dc..fe10beea60c3 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -4595,7 +4595,7 @@ static void sst_set_default_init(struct spi_nor *nor)

 static void st_micron_set_default_init(struct spi_nor *nor)
 {
-       nor->flags |= SNOR_F_HAS_LOCK;
+       nor->flags |= SNOR_F_HAS_LOCK | SNOR_F_USE_FSR;
        nor->params.quad_enable = NULL;
        nor->params.set_4byte = st_micron_set_4byte;
 }
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
