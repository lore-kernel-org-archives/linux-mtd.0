Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5433C76194
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 13:36:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A99162190F
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 13:36:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ag7AM8tA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="fnegQO9B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A99162190F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwrfrhQF5T//fK2zbnWgasZxl5oclMOG7/XYrSAe19g=; b=ag7AM8tAKrrJSP
	wTJQtIgt42jPJ/NsoGQNopYT6oYtuL6r6B0UwHmdBFC8Y4Na8Vi76zzEbs0Jf8prFkkRstQS0Mcdd
	gyZxD5lUzQ9wHyWvZtSciWbfX0z+Irw6dy94bmr+T8I1hwkq5aminsigwGLpvV2FXL3UVPBVTjLbb
	C/d4PcN4/zF8eMOpKRRJWygzD6qMBVRaCzdveJxqgZaDpN7p5s6FpW7Euo2ggW0lBq5npXwytKkou
	D2IxsaHBvFcM4Pb7dbxLnvckvcckznycf/cpmYTwCoOJED1AeLQrJrhAEFC+LaWdXcc3xEGRAXg9v
	ufc+IiJfnMmBz4BKJXtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqduN-0006rZ-IQ; Thu, 25 Jul 2019 13:35:47 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqduJ-0006qn-Rm
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 13:35:45 +0000
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
IronPort-SDR: Oz98wVKSGGIR5isOLGvinfofzh9NfvX2tDI4sHRHfeR1OMXPEI1zoD0yDBQO4X95t94wld4MCj
 WpGwgUh0m4OtiCjufygeYJHiZMHZb5WJmQFpbChOmfc54EJ9ABI3TYWe7EO0xBYFysKsifwtJ3
 QOsVI9DdfesjSYuCHmVzotNsSyhvUvW1zGkXGBzyT0kfvWC6BYJOI1H/P3JAETRxP+iWkYY2oz
 P/F1KdQ711zeYDI41NIj3j3f6ely9WH32lNnhqhPaHdMc8IiNTR2ANtosBAygSIjrvRHbrHEJT
 nFE=
X-IronPort-AV: E=Sophos;i="5.64,306,1559545200"; d="scan'208";a="41939302"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Jul 2019 06:35:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 25 Jul 2019 06:35:41 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 25 Jul 2019 06:35:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7N8wJAe8Y7+CYunIogOChN2LYB4Uil8RxL2kmE9TFslw4P+HsSWkgMsWeXFdp06/Q6rgzZ3M4Tu8cbk7l2tuLUDmDcR04bFAlPien6JkF4X6svOYpneXZuOzuIrBbVsByT7hbqll7EaKgXmwKWksoneSaIFCd4ypVRMR+h+zyt5vzb1Kgm5ROE91Dh6IISQD+jO6yo4qPvNVS2z45yNe65iSOhkTHqSksTN7G5zw12KA7PhPEeDRyfMCN484otsYy7+s6bZb3Xfs1SmhOi8gXlyYwFfBQc3yZlgbEu8qwrHvwIejTpkBsgtWUiEY5U5oy/5z/LZz6LvVSVAAOWjPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmMzd5xNtNot3gzCkQX/1uQl6HU56XwIVfRn4IntNGk=;
 b=UbVY0xh1DF1dq+nQh9Z/brzRpMt0Zk+RbSICwC8eocXnv4FfU3DcUeXSHmNK0tBgL/NTXtPi7jZOutt0gIhvyoWnKBgTWQKr1M153dtzzwOA5uEDfSnKMgQ5uQfiiCeGbVvlvcIvBIczZQDh8BKz4kM01Z2/SMOqLzrDvfGWUBw3Yg2p7H0TU+8vfoQQ/NbW0weeUeu3rgsUlT6pyUsIH+Ss8FjheKTcOyBdwF+oBICVaZ/kEuKr3rcDcXWNM3mrJK5K1iaqNdXOkIbuqmCTqTvpn7yl7dXcLuzncjCTx1++FdM1lZLREo2GeoFN4Jke560NYxSSQdpFLAWJTCl7dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmMzd5xNtNot3gzCkQX/1uQl6HU56XwIVfRn4IntNGk=;
 b=fnegQO9BaSpyM/eMiTIeg1nDcbBvY45yyepxkWSar4vJhh17qQWFqSWphp/Dr5R9n5YORHH0aIQlQHV0ud+EdI/AEORB1pyd67xsVcVOsOe7mZgszGqoWAuhglqhtECik4qvRQKXKKZW91MF4gCMwmzLm934s2tW3ckLZfWEW0E=
Received: from CH2PR11MB4438.namprd11.prod.outlook.com (10.186.149.223) by
 CH2PR11MB4294.namprd11.prod.outlook.com (10.141.118.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 13:35:38 +0000
Received: from CH2PR11MB4438.namprd11.prod.outlook.com
 ([fe80::a9cc:45df:96cb:4b81]) by CH2PR11MB4438.namprd11.prod.outlook.com
 ([fe80::a9cc:45df:96cb:4b81%4]) with mapi id 15.20.2073.017; Thu, 25 Jul 2019
 13:35:38 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Move m25p80 code in spi-nor.c
Thread-Topic: [PATCH v2 1/2] mtd: spi-nor: Move m25p80 code in spi-nor.c
Thread-Index: AQHVPtFNjfEG9DN44ESnRp+H/g0b8qbbN92AgAAWBICAAAr8AIAABS4A
Date: Thu, 25 Jul 2019 13:35:38 +0000
Message-ID: <7a754275-94be-9b6f-0d66-a72faaec13f7@microchip.com>
References: <20190720080023.5279-1-vigneshr@ti.com>
 <20190720080023.5279-2-vigneshr@ti.com>
 <f6410e21-18c3-9733-4ea5-13eb26ad6169@microchip.com>
 <20190725143745.634efcd6@collabora.com>
 <dbb33973-bb6f-9a01-b821-693387aff98a@microchip.com>
In-Reply-To: <dbb33973-bb6f-9a01-b821-693387aff98a@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0083.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::36) To CH2PR11MB4438.namprd11.prod.outlook.com
 (2603:10b6:610:4a::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df473081-f7b0-48e7-b3da-08d71104faa4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CH2PR11MB4294; 
x-ms-traffictypediagnostic: CH2PR11MB4294:
x-microsoft-antispam-prvs: <CH2PR11MB4294F849D4DA130035C944E0F0C10@CH2PR11MB4294.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(376002)(136003)(39860400002)(346002)(199004)(189003)(8936002)(476003)(11346002)(2616005)(14444005)(186003)(81166006)(81156014)(486006)(305945005)(31686004)(99286004)(76176011)(6506007)(446003)(14454004)(71190400001)(6486002)(386003)(6916009)(71200400001)(102836004)(53546011)(66066001)(26005)(229853002)(64756008)(6246003)(4326008)(31696002)(66446008)(53936002)(54906003)(52116002)(3846002)(6436002)(86362001)(8676002)(478600001)(7736002)(25786009)(66946007)(66476007)(68736007)(36756003)(256004)(5660300002)(6116002)(66556008)(316002)(2906002)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR11MB4294;
 H:CH2PR11MB4438.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fh3pRUzYQM/PzJysCcmeCwv+jr4HdDa0TLust8eSd27JhIEIkm7O50CNU3c2OSZ891+agAtnino0382JiqiI4xaDGH12pWuYjqGd1fIjmxtmoejhhfDe1XGoqJnoeWsslpZuRonT1vzZNc5FAoMODmaT5+hlMRKz7q3RJ/ciLyrpVqW7Sw7yQEgZS22GqhteEWX5vHVUDUfhoC5mV+5F3P3WT9g8uQ5urRtVpRnKwCCStvuME2v8msKDAu9VCyM6pvTWWgceRYX4YnXka+qy8uIPKUE/26TDqYyLxpK5LhOthJyIxmm+YxG+NF7nEZr8MPaoXs8csmPk5qwGfbJiLR1WBJCtUny0FxvwzOH5Nu2mZofD2XsgBRcEz20Dl/zWdpS+767jk2XxQbGytZBUKJa1h4fxDR6NyjGiXMVSUnQ=
Content-ID: <2A2625F7C9471C4F88FF00BDE0494FAF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: df473081-f7b0-48e7-b3da-08d71104faa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 13:35:38.1875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4294
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_063543_929142_E6F8721E 
X-CRM114-Status: UNSURE (   7.10  )
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
Cc: yogeshnarayan.gaur@nxp.com, vigneshr@ti.com, bbrezillon@kernel.org,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 07/25/2019 04:17 PM, Tudor Ambarus wrote:
>>>> +static ssize_t spi_nor_spimem_xfer_data(struct spi_nor *nor,
>>>> +					struct spi_mem_op *op,
>>>> +					enum spi_nor_protocol proto)
>>>> +{
>>>> +	bool usebouncebuf = false;  
>>> declare bool at the end to avoid stack padding.
>> But it breaks the reverse-xmas-tree formatting :-).
>>
>>>> +	void *rdbuf = NULL;
>>>> +	const void *buf;  
>>> you can get rid of rdbuf and buf if you pass buf as argument.
>> Hm, passing the buffer to send data from/receive data into is already
>> part of the spi_mem_op definition process (which is done in the caller
>> of this func) so why bother passing an extra arg to the function.
>> Note that you had the exact opposite argument for the
>> spi_nor_spimem_xfer_reg() prototype you suggested above (which I
>> agree with BTW) :P.
> In order to avoid if clauses like "if (op->data.dir == SPI_MEM_DATA_IN)". You
> can't use op->data.buf directly, the *out const qualifier can be discarded.

I'm wrong, the const qualifier will be discarded when passing the buf argument.
Please ignore.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
