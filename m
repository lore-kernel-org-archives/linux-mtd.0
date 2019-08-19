Return-Path: <SRS0=wiZC=WP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44726C3A59B
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 06:04:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D9F2086C
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 06:04:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S9eOOeKt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="lp/MAVDU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13D9F2086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TI5/3WVGM0VNAIdAuf/GtqK8gSbXNJELyy0Pz/DUSgM=; b=S9eOOeKtNEHPyj
	896w6JfqnnE4+cmZE5xrhju/c5yaw840b2yZFD3xGIhpiDp1jGwZ/83ubH33CDpsdyVPOYAOBuNHK
	hFaxA509Cyem3huUQkttScxbe+olETbUTK971JhDWBtyiITF8a5XWnqckBlL5pi4LRWM/4RyndRr8
	n2pVDWL5pKxhdCV0y4pigfH7GD1uo6/5Ybdf0BdwRjOBKTkX0wsy3cjMRoFtjJDTAlcTc3uXHLUrL
	W7qt1DwL04eLUEdNU7nHn9GF9vEog0/Wd3p1Y99TnsuVdt5oz5zBNb026tYuOMZis4xAxlHPOQrmK
	to+cyXDkfrCW3XZnvrlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzalg-0000zx-N2; Mon, 19 Aug 2019 06:03:48 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzala-0000zT-MB
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2019 06:03:46 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: mDEN09ridQc9oMEEBdpebg0P9LsQ0Oi6VNtIGccRCKAXiLgHhDu5ZhQSmvbSf/RLWCSNpwYACR
 wkPU09yBk2+65mtU9HwxBSl0gXQPcFbsNz4ZASpIfZGu7xrPOpVwg1jix3+EYhuKQRRuJd9o7T
 RqhUI6JeLNuhQ6PMgDrFAehEHei0nMMg1cDM0GJ5SKdB9Mm6aBsEgDSAfC81MlVxmnp9p42C68
 8wj6CCUAmbLj+HDb1n2CFKp1dcU6AvBHTZUAiEz0SpZYaNvUQI5gb6ajpovIKBiJgiqkRhS7uq
 7nk=
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; d="scan'208";a="42726605"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Aug 2019 23:03:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 18 Aug 2019 23:03:30 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sun, 18 Aug 2019 23:03:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJ3ikrZhra7Oh9eJ0frKrIi7PaXlf9in1XBpEMqhI2tzQDpWqxm3QS2HjZIP+dIhonXfkI6vE6buN0j1d6z1zHvsRYSSxPHk0z3h9lTWWKex3pKmZ3rxvCCniysZWf/29uOWsCCFvutK/BhjQGsYv6cURONhlou6kt3MsK2+Rc/JmLwqv68cZjGs2Sxyv+Hq3igY6bCU24KDFb4zH2AcBqwFPM6zeo6l+lp0v+isyS8zy/R8Dl46y0vnssHGQ0DxFv8SfJmyGLtOi6B+ScR/Tux0ahPxVQ60GnepN/EqdtJYzUIBXnv5hHiBveJxkoemERPN11wAe2qE5/+P6KC8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTl3yRqqsKP9WZERr8g5GYxuvfPjSbb+oUVuAxnPGLk=;
 b=ZsbhQCwFXV3IQN5YJ99j7ilsr9E6x5/idCwpOcW+XW6okHK3GMlQTfdWFr2cVCdhQISXvVuOv8gS8Z3ClxEvw7kc4UXTYFj5h4qzhtIoxJcQQfqjOOXC8PMBM9Ca9yFt2eMYXhqqsJsTrlmi0VJXRV+/5twsAm/aRZnZ2ryDv51z+kLLckOAy6uq7oiEn4y9KUWxh6WisIAvG4icY6tvg0My8jcCplFqS2hdzUQbm9G8Ec8aSiBtCVDWTf9ycMQBYprL1q4Jzc+hGRFCOwu0b3zpelvQk4y94ZD4qusnqQxQ2XdcR85FWWuJOwB72pYPy0ATDklc/RoXtNO3JE5BDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTl3yRqqsKP9WZERr8g5GYxuvfPjSbb+oUVuAxnPGLk=;
 b=lp/MAVDUgPNF3PdOcUcsi1BmJTH6lj9n/W0JGroSJJtu1HTw2zhYOjL9ef+jNspSYsSN3mxmEsGIfDpbWB0VVjw2eZRBxLakPvJ24rv304Y3aQIOHlIYyAFCbqnY6UDbjm1PgMqITQ6WBW7kV5XDlgX6Z+oQgjN74jLOKwtSqRE=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3709.namprd11.prod.outlook.com (20.178.252.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 06:03:26 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 06:03:26 +0000
From: <Tudor.Ambarus@microchip.com>
To: <wenwen@cs.uga.edu>
Subject: Re: [PATCH] mtd: spi-nor: fix a memory leak bug
Thread-Topic: [PATCH] mtd: spi-nor: fix a memory leak bug
Thread-Index: AQHVVev6fATxhl9u4US1h72AjbWeGacB+8IA
Date: Mon, 19 Aug 2019 06:03:26 +0000
Message-ID: <e52a548a-0516-55ee-4005-5cc24c3a20b5@microchip.com>
References: <1566149993-2748-1-git-send-email-wenwen@cs.uga.edu>
In-Reply-To: <1566149993-2748-1-git-send-email-wenwen@cs.uga.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0902CA0034.eurprd09.prod.outlook.com
 (2603:10a6:802:1::23) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6282b93-2635-4e4e-d025-08d7246af320
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3709; 
x-ms-traffictypediagnostic: MN2PR11MB3709:
x-microsoft-antispam-prvs: <MN2PR11MB37099C8399E88F65C6BDFD1AF0A80@MN2PR11MB3709.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(136003)(346002)(376002)(396003)(189003)(199004)(186003)(4744005)(31686004)(478600001)(25786009)(81166006)(6246003)(14444005)(76176011)(6916009)(14454004)(31696002)(81156014)(4326008)(8936002)(229853002)(7736002)(52116002)(99286004)(6116002)(3846002)(305945005)(316002)(2906002)(54906003)(71200400001)(71190400001)(26005)(66946007)(66476007)(66556008)(64756008)(66446008)(86362001)(486006)(66066001)(6436002)(5660300002)(2616005)(446003)(11346002)(476003)(53936002)(6512007)(2171002)(6486002)(8676002)(36756003)(53546011)(102836004)(6506007)(256004)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3709;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9kY7q9NyQhU0ZXD0Ap51mPQiJTBGSnFPGKC8akfkgg1VnKvGFhyA4BzkakpuZqrKqb73hb8Mw0oJQB8arvyhxni1SOE1Ehj2nLaNrKvdjVPqpfJprPdvr6D65wgIb+2cjiw8pp5P5c5MErcB+kYyRELb/EkQ56I9isUj5qZ20BhUqTslKQrGuuptj+01vs1etMO3UqCRzkNWbPc/2KyOxGRXFtN7BxA6kEgsO0qSIZA3K5oPOlA0O3yjr0RMKN3ii/Ku7RgceiFBM2oqxmXeibFMbJtIu23OCrZ+sePOEQR6gP0/4WJQM0Cp5njK2WsdeVaWZ8uqcXk9msow8nRJSwbEiXSEHClSytPlFXnu/wzLjb0hYy2lvtxoFJ+9wPrI+6oxESccdEUw4oFpQDpz6zicuuWvvGtXfLV6Tua3Kc8=
x-ms-exchange-transport-forked: True
Content-ID: <0AAB7BCEA377584D96671AB8EC6B2B43@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e6282b93-2635-4e4e-d025-08d7246af320
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 06:03:26.2510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ahgs/gGSgQ0tZM/H8KC6hONzXhvbHrnIyufbCHKqML6gXO1sD/0DTfKK0s3EUvrzg5EEceB71V4UampYLGDabolkVJX6LHCXmrL2R1wB/4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3709
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190818_230342_819177_2F14509F 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/18/2019 08:39 PM, Wenwen Wang wrote:
> In spi_nor_parse_4bait(), 'dwords' is allocated through kmalloc(). However,
> it is not deallocated in the following execution if spi_nor_read_sfdp()
> fails, leading to a memory leak. To fix this issue, free 'dwords' before
> returning the error.

Looks good. Would you add a Fixes tag?
> 
> Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 03cc788..a41a466 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -3453,7 +3453,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>  	addr = SFDP_PARAM_HEADER_PTP(param_header);
>  	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
>  	if (ret)
> -		return ret;
> +		goto out;
>  
>  	/* Fix endianness of the 4BAIT DWORDs. */
>  	for (i = 0; i < SFDP_4BAIT_DWORD_MAX; i++)
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
