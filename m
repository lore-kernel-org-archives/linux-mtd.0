Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EE2C0650F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 09:07:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AEA92067D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 09:07:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f0nvwh5F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="xyVjXtoW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AEA92067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEhebiIFDAuCcJhfAttt17sQoeGwJAuB28Oxqj9LBAs=; b=f0nvwh5FLZ9PwI
	k8gccgQx+pRVU1q6Vf0xSqgiPlLCJMKbxVZATekKVvNWWgbsvxQcyxHR8xZaKhX3TywD5nAhR8kR6
	bMmViraVSDDO0fSZIEjVYnlCeuEBPa5umfBJAOTHty1m4X9pWkNDUI/aJsNFMi6o7ZJ5UGOsDnh8V
	G0Q+Fm+4FH/5dYn7YSqVMVHZxzip7rKe8A/bQ2f6Q0k+kbE36DTmM5FJEOcsSblvDO0wJJ7yiZdxt
	Os2FPT0C9m4guLmJzaAl5P0Z2xVQ7/ZocvH1hNdIJWJ7elHs0hCo+zMW+M+9sKSQPOCdor+vhedup
	u/QC9g2Yq521msiTnmRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huYxL-0001wr-IT; Mon, 05 Aug 2019 09:07:03 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huYxE-0001wB-FZ
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 09:07:01 +0000
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
IronPort-SDR: v7hr0Dt2vH4S4+DqcPHjcraJ98MxXVZKZ3ulbn7MazMCVV8fHj3NeOg5KWc1q7NIO22+WQe7uB
 ydY79WqCZnaY+UZChimLk1/oCCcqmOxLE7B/FDKNTIu5Bu3L8QGizb5IstzzMoehvEPBFSia4D
 m3SojuhAhwDZNw3FGC2z9s5D92vlQo+6FyFU1S5bLaVzzbUFhbPJEV5n7xd5TX7bEipZuoYhbW
 CCNMGtcX6tIGF6/Zf0DUbwnM4IxgxLRnmnnSHOEPXJfdYjynCQ8upOJmaNI7WjOj8HH5ipj9jZ
 ljo=
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="43974237"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Aug 2019 02:06:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Aug 2019 02:06:48 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 5 Aug 2019 02:06:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqifNxVbGpaavMQ3ynSQvR7CxonTxfovkd/AA6RFDqJXEiTj3ru+KJp+ya3eROwqxaiXbDbdxfTm9CjMM6DV8BAhBXoO2py9dQJwwOvGkIQ48Vx0CNu8JPeicdYUofiax0Fwg5uWL1iN8LG844yevhGNcKk5D4T3P0YB6bbIOBVHN2KUmoLfuroWQn6Nc2v+EP+l1pFhTnsRlrK99OYeIyM20Ghgzi4pvJOQV/qkMhdmPSc211lqwvFqTUNf34xSUiAwkfvsSAHDgVrNuAcyj/vFaF92uAO4tguJQ3VIcJ/WGtput8/Pt4GywExjhHqR6tORErjME1DzZf0d26Y3FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN4eUvA6Xgx/287dBQgzCkem0ePRA+Qshv09DAw1+I0=;
 b=hRhxCAPFP4V16sklCU/3PcNMfcX+gN0aV5BzEgXmGXMWgCl9x1RrH8N+kZEQ530OX8yR3QLu6CfOalrYwgh9UDyOZy84W9Xif/ZxsEWBnFDpxpP3Qsndjez4qESXXk5Z9EDtplWScfG9yYK7YH9bpuQscrvg2sdGLwAJLksd9AQgUXF02x6ZqhfUuS573vh1uAuHB8iapGswUF0NZCwaGD751bwX5Xk+dqy68phDoq57i9rY6raoVvmCaqewt+n4hpwZJZPVKE0lY+NIJvbHXWBYOAqvyhK93sgLG4QpW9om/RZuCj5EyPn98ggBfgPZ7kWkmB40QGE0El0mQ7tvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN4eUvA6Xgx/287dBQgzCkem0ePRA+Qshv09DAw1+I0=;
 b=xyVjXtoWlXhYR84YtMo2aJwPHlgKcqQFPHxYr2cmClhGbnfKAhd+YUpajHyYyZlwbmUzXiwB0wKSuSUD5JH1QepkHBJs1LcaQmd7Bm73cz5osutB8tV6a3Sw43OP0odB5A3W2yl+99ZUEMhH8104H/qIf/YOLy9XuIvkPsQN00c=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4333.namprd11.prod.outlook.com (10.255.90.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Mon, 5 Aug 2019 09:06:47 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 09:06:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: Re: [PATCH v4 1/3] mtd: spi-nor: always use bounce buffer for
 register read/writes
Thread-Topic: [PATCH v4 1/3] mtd: spi-nor: always use bounce buffer for
 register read/writes
Thread-Index: AQHVSIVVg9Qji1Cq1EmeYAs+Xr0s4KbsSSOA
Date: Mon, 5 Aug 2019 09:06:47 +0000
Message-ID: <b125bf29-f1fd-6d33-4a7c-49cb94ef1488@microchip.com>
References: <20190801162229.28897-1-vigneshr@ti.com>
 <20190801162229.28897-2-vigneshr@ti.com>
In-Reply-To: <20190801162229.28897-2-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P18901CA0015.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::25) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 783263b4-c7e8-4408-275b-08d719843e51
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4333; 
x-ms-traffictypediagnostic: MN2PR11MB4333:
x-microsoft-antispam-prvs: <MN2PR11MB43332201DCD11E5E0BE65950F0DA0@MN2PR11MB4333.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(366004)(396003)(376002)(136003)(189003)(199004)(3846002)(6116002)(31696002)(14444005)(76176011)(31686004)(256004)(36756003)(26005)(81156014)(8936002)(305945005)(86362001)(81166006)(6486002)(478600001)(6512007)(25786009)(2906002)(54906003)(110136005)(71190400001)(71200400001)(316002)(6246003)(7736002)(52116002)(53936002)(486006)(14454004)(99286004)(476003)(66446008)(64756008)(66556008)(66476007)(102836004)(66946007)(8676002)(5660300002)(6436002)(229853002)(68736007)(53546011)(446003)(11346002)(6506007)(186003)(66066001)(4326008)(386003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4333;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rTBqgC95nWQ2V3sun7lNR3vMCIQOkBMAGQ7nGDxWdx6nnjfTG/tuNE1eVknbxF1pbFQdTOEFxN28qWs8pZSmiYeAvodTBW5h3qEtgd/Mcb7YfICVIZuT4p7XEHFZWX05ff6K4prf+0op1rSqJtBllpaL1CWRLq+QjuN59L+XgI5bVslSO1tbx8KpHNupFkfuek6DrT0CVcppfB6F05gZs+1gl38Kw58KojtjLvT+Rol4iNQRpH79h4GL8kJmow2RE/HqJt3h+yoSJ4+er5XGMKH3y0vNqmIjtda9PBKKTOZV51UwTzlJ6KnLSsEPRtwCRBloo+cIPvRWfeHgQhwEq1GVpK9tsbRV8YM5f/zdTqgOEXg6G0KlHdNAuczFuj/01C9kPtTqnLxgr1ljTDCXbUJbisGWQmnzGWGTQ5WjlWA=
Content-ID: <C58F9801A8CDD1419774F4C13B3E1EDC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 783263b4-c7e8-4408-275b-08d719843e51
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:06:47.0896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4333
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_020656_824909_CD39EF54 
X-CRM114-Status: GOOD (  14.60  )
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
Cc: marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/01/2019 07:22 PM, Vignesh Raghavendra wrote:
> External E-Mail
> 
> 
> spi-mem layer expects all buffers passed to it to be DMA'able. But
> spi-nor layer mostly allocates buffers on stack for reading/writing to
> registers and therefore are not DMA'able. Introduce bounce buffer to be
> used to read/write to registers. This ensures that buffer passed to
> spi-mem layer during register read/writes is DMA'able. With this change
> nor->cmd-buf is no longer used, so drop it.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
> 
> v4:
> Avoid memcpy during READID
> 
> v3: new patch
> 
>  drivers/mtd/spi-nor/spi-nor.c | 70 ++++++++++++++++++++---------------
>  include/linux/mtd/spi-nor.h   |  7 +++-
>  2 files changed, 45 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 03cc788511d5..e02376e1127b 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c

cut

>  /**
> @@ -1404,9 +1401,11 @@ static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
>  {
>  	int ret;
>  
> +	memcpy(nor->bouncebuf, sr_cr, 2);

I'm thinking out loud. This can be avoided by forcing all the callers to use
nor->bouncebuf. That would result in a:

static int write_sr(struct spi_nor *nor, size_t len)

write_sr_cr() can be removed. Memcopying 2 bytes is a small price to pay, we can
keep things as they are, to not be too invasive. But if you think that this idea
is worth it, tell.

> +
>  	write_enable(nor);
>  
> -	ret = nor->write_reg(nor, SPINOR_OP_WRSR, sr_cr, 2);
> +	ret = nor->write_reg(nor, SPINOR_OP_WRSR, nor->bouncebuf, 2);
>  	if (ret < 0) {
>  		dev_err(nor->dev,
>  			"error while writing configuration register\n");

cut

> @@ -2177,9 +2176,10 @@ static const struct flash_info spi_nor_ids[] = {
>  static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
>  {
>  	int			tmp;
> -	u8			id[SPI_NOR_MAX_ID_LEN];
> +	u8			*id;
>  	const struct flash_info	*info;
>  
> +	id = nor->bouncebuf;

nit: do init at declaration.

Also, you missed a place in which you can use the bouncebuf, search by "read_reg(":
ret = nor->read_reg(nor, SPINOR_OP_XRDSR, &val, 1);

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
