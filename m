Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0757CC4CED1
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 10:48:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF0DB2133F
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 10:48:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CE0Auqj0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="TGlc8T8g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF0DB2133F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Htd/9D7z3Jqo2SmUWGbGlvkYbc57uxDV0p47EuEbmiU=; b=CE0Auqj0ckvUtj
	2LGaLXwastk1RZKEcnhz/c7bVoYSeS+qLzx/CPtB4EBf/8kHPja6tW5PQX/vMgaT5TIkD69b2kS6v
	nq8txOPWl61KJifHHEWkpQTde4N179Imfc54Jyxn0imwd6dgFHw7Y4sSXReTxVPJUgy2iS6+D5c6S
	22VlKDHgzJuKeEpUY3FcSe2QeCzcRfe2zEQckvb8UWwbP/ZfqIG0GYf5lq+4toqmeHwY1anR4haF0
	/vFPm84A60sjOKtmrlcH1O/Eo/gris9CXeFfoCs9XAxl1wIG7b0hOOW8GwXVZxBKp6ZaDTN1ofJ9L
	B9UxRL2zN8gPUIxVZzqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGL8i-0005CA-Sz; Fri, 04 Oct 2019 10:48:48 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGL8h-0005Bo-0M
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 10:48:48 +0000
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
IronPort-SDR: figmXGPcw+UIOyXXLmNGuVWh+TKCI0G4PlsXeBVaZ8BM9sMh55KYgyhO3vpQThJBrEWot4Pouc
 ytjTrW1wBYBQNMKK6HINLnuzAQ4sURrV0KrRfrQ5WM4DivGFjZAIzDLQgKz+KRcf0wlfhYXAk5
 SwDQcAPGsGVfzOscSV1e3NPAOfMOUwX9ID/PdeppOeVC0xwtQ+v1eGTpfmIb2pXoLatOBynOuZ
 ET+wJkJXUdiCMhHGXX1W6xKvuq1BwKGtTJD7eHmaLHVFPAW8w7x52+OEBHvPYSqdVkF4hz+O6r
 aFg=
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; d="scan'208";a="51745368"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Oct 2019 03:48:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 4 Oct 2019 03:48:46 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 4 Oct 2019 03:48:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzLQrp2n3rdK843xKHEy52nIdlY1imbN6bwO4rDd6pvK3dOBvk+VlbDY7HLv/GXySM144UJW+sEj8ELobEKct81oFzGH2TRVWYxutZyOhpIs+I5KkNCqJ1E0Ob+HVRmDvglN9dw80udwX1nsCay9v/t2drQ3zKN8TspWG9c8xvMFEGOtrF/qDJzlpJ+ejCWQXBBL1SH8y6a0V5RgZo2HH//ShbG8tlCkEnhy7HYjYhH/wmeSHNLnbVol+j33+DDJGFUcg1etkQV0hHfSpRe5XQ7oaYRjx/nirTUks8TDYBW9LsqTr6WCUtSQDKvPrS2Ck5g9qkFn6Cx3/GRU1I1mxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UoiInd9321iKkr+w9Z2Pc0b1rni+ks2ZMtGBUC2MjM=;
 b=Erqf7o5zbWSdTP5QrqeZEfeTRPqBdTqrCXRJoGjlPGCCjHMxeZDeCBMzIRq1f22Xz+DSaW2mWfmDxIRSs2efQE7Kb7+at/ae3I0V/C4f4IYDd23yPno/eIBuwO2/Kmzwa3T+CCWHrjwWUOxkUYSZIAJnRe9jCXdt4mxGsk4dGN2RXcetY9WeiVcQouI5rGb8DALrAuR2QTL1FKwZSG9OHuoliixAJ+VSwk/Vll19iGM2uQeFlSdcFkReTaMULgee0zv71AJBqDJXU3S+U42ZU+a6uyCNiLdIUHi2rnYMRSpLCsk9wZhO+e1MjlYRLmGLDSz6MAgoR/JCHLaxO3Ah4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UoiInd9321iKkr+w9Z2Pc0b1rni+ks2ZMtGBUC2MjM=;
 b=TGlc8T8gFxbm4zLMUdZMlwy9AcgGu8FFeeFGHUIt+ZOQfcIl+co4YQ0jrsFMnblNU0XpwMXq7vDIaFAjmwMoYUFUv1HKdaJfgxjnRcZ6D8PLBtryp3SuFo/TUdikMA84TiqI//fdSeEd2P4SPzyhj1tqRlsblmjw0VujhSIcBWs=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4222.namprd11.prod.outlook.com (52.135.36.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 10:48:45 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::340d:5a33:dc79:1184]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::340d:5a33:dc79:1184%5]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 10:48:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <john.garry@huawei.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix direction of the write_sr() transfer
Thread-Topic: [PATCH] mtd: spi-nor: Fix direction of the write_sr() transfer
Thread-Index: AQHVeqEtwNvmmNlG50ubt70oQPwmWadKTUqA
Date: Fri, 4 Oct 2019 10:48:44 +0000
Message-ID: <9156860e-d257-bee6-fac8-a1821e4b5bf2@microchip.com>
References: <c703dec2-dd11-5898-83ad-fb06127b6575@huawei.com>
 <20191004104746.23537-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191004104746.23537-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0802CA0021.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::31) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd2f9f49-7926-4b09-cf04-08d748b86daf
x-ms-traffictypediagnostic: MN2PR11MB4222:
x-microsoft-antispam-prvs: <MN2PR11MB422284C89065D0560916C64CF09E0@MN2PR11MB4222.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(376002)(346002)(366004)(136003)(199004)(189003)(53546011)(446003)(2501003)(11346002)(316002)(478600001)(99286004)(6246003)(6506007)(386003)(14454004)(102836004)(25786009)(64756008)(71200400001)(71190400001)(66476007)(66556008)(66946007)(66446008)(31686004)(86362001)(229853002)(486006)(2616005)(476003)(66066001)(52116002)(2906002)(305945005)(7736002)(4744005)(256004)(6512007)(6436002)(6116002)(3846002)(14444005)(31696002)(8676002)(81166006)(76176011)(8936002)(26005)(2201001)(81156014)(186003)(6486002)(110136005)(36756003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4222;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0Nqy8eAlkW1PRRpxdxaYLEa3X9tT89ihVOqdaSUta7ktOMY4YKPeQWa6nE/StTVCanibd3BeTMR0Am/JhrNJG6f7MsdLgcQNSRCcrUhQ3KDmRM0zqXqC3RxMO/qO9WNT9aEVvWfTFOf6XXWD44GGekw7DDmK7MGHEGXYlQyQD9xzMbTz6ZlAIZmadm+4EiOlQMICQjiIH/yFpL7SThcgd1Uo/7d6RF+MIuHNHNfT5UtfLGO26EUmcewZxIetpBd57ulHrWXVnpBQPwzLPZYfSSLsKe3g5wAFN30F7D+IfDnLoZavJ9dQhsOQDWlCIRxhMOcG+o9ioUcRIDuiTCXJqhxgTE/01KgDpN3iXsVaymsUN8p9cFBB4Qp5o35xsCsqHf4+J1+mi/gwzKfUtnV+EFq8/HcITYy/XHhL/FrBJro=
x-ms-exchange-transport-forked: True
Content-ID: <F22D9A0BBF44E246AA7546AC611AF05B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2f9f49-7926-4b09-cf04-08d748b86daf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 10:48:44.8984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: swJwc4sKJY/Ag3mG1GsahHoLPWnHcslOTluJGPhdBce9WP6pxqMtttG1iqD5Gw4KNMWzHiWho+Fscwrk28vxp2+PZvbLx0EoVSwsJnCvnxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_034847_094696_51691415 
X-CRM114-Status: GOOD (  11.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

John, does this fix your problem?

On 10/04/2019 01:47 PM, Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> write_sr() sends data to the SPI memory, fix the direction.
> 
> Fixes: b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")
> Reported-by: John Garry <john.garry@huawei.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 1d8621d43160..7acf4a93b592 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -487,7 +487,7 @@ static int write_sr(struct spi_nor *nor, u8 val)
>  			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR, 1),
>  				   SPI_MEM_OP_NO_ADDR,
>  				   SPI_MEM_OP_NO_DUMMY,
> -				   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
> +				   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));
>  
>  		return spi_mem_exec_op(nor->spimem, &op);
>  	}
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
