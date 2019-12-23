Return-Path: <SRS0=1wRa=2N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DE9C2D0C0
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Dec 2019 13:45:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED1BC206CB
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Dec 2019 13:45:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aLsF6GxR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Xk19rMJ6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED1BC206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FBiQW0esQ6odsNkcNY9GyyIvDdIRIBXw4blQCxjC2rA=; b=aLsF6GxRJN47xp
	wCWEmNbhyrf8qIsQbzxgfzaEITMcmBErB6AVXke5cjDcQmuBGQuYbW7/8RFlxxfhdX2rWvnCFyRHy
	kyvm5NgyrJdB8arIgRRKKHyEo0re2sVdnFO5C/jEWHVRzPNpibKiviMyu3wMwBUSqzKx+g7IwGdyT
	sEuC6q6UtFsOKeL1BavzyFbkcBn0qn1qkDqaAl0rIqPNJnfPH767IBnWMbSQVTfOb5JjnarkbRymz
	ItAbLbf4nEgMRxrq3u+tSdiRt8TxBooJr96FiE8SzEhKcteK4Brf9LzIklqWZPoWoPc84tLVENrv5
	VkwEqfCLEKtRT+IZrvsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijO1k-0007Q4-Lw; Mon, 23 Dec 2019 13:45:40 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijO1h-0007Ov-0i
 for linux-mtd@lists.infradead.org; Mon, 23 Dec 2019 13:45:39 +0000
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
IronPort-SDR: SIu0SFZJd1VhhHMUcxQokW5wGVfvwNBs5/Ap2TP3BTacph2HZQ05PsrgRs19dX1tahZ6oVQjA9
 d6oWMKTOlx52JkyLuZMrl/ebh0qTZ88LaVgbAZdV1fcf3nJFhGgxcLsypn+e00pwMajnVY1pmf
 M70OGgx5/kiUe4rHAXG1dDEa/HBxNK0KB4Mj6NOIxOnW7EM4wFQj9wgW0UYCCq3nnlzL1oDgdx
 zm7SO15IgEB3OKI+Dmj9HQrEPGAa+hhh8lOZi4eGLO+JFtonx/eyf8LHiFw0bnXye3ynjIHZ94
 0Hc=
X-IronPort-AV: E=Sophos;i="5.69,347,1571727600"; d="scan'208";a="62742347"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Dec 2019 06:45:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Dec 2019 06:45:33 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Dec 2019 06:45:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiffU4vR8yAIy128rguoRkUoxBqexoe1TOwoJozo0hVw+ziRYaTov6VopRBZl12rAWVosEuF8zkvewqy4TV60uUPqhXvXMJZ3jTrTP6wv9n8HdK5YiP0FRcATz0/5lc/b/1svqOmfH/Gs2htIrwy80xI1kbkpSXFV6GY8i1TxMD/gC7kgSlr2x5n6aXyNXxyDObBXXQEnhe+j0hPfPer+w4bosqcdxaNOCIZLdt4/e8BcWCq56aAEK+NHTE7TioiTCE7ZQjsKTDB2g79z8pCukY/44CQ+PHGUChBsvShIKwZffWbqoILCoe4BqP2Y56jwOxnLNXtcaXT+lxN1Xdwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvrEQDLbiG/Au0HyTisL01q+yiRbJ3WN1eu61F9nDWE=;
 b=QcZICNB6QuoOmgaEencRaIB3093aUixyxSIwf839f+iNoquW8lw75nEHAAJlFJqg23wlnxj7t9GzK4CQjTg+ifMkOz6qTSPOwQUYK6oRCV2zKbssMgTkzNm973XEbzavu76q/pYknkGcxOADl1spDiPb3bR9FF5MMP1v9ViM8uS8awq4xl71DQeHwfBCmW2brOlpfoRAUhbT3p6Dh71B8eLDov7eaSw+1Ql+UsCNX3Gv5T0KcR9pJHS9hIcmKGi6OpKWfw4DQz/pJ39QeiR2wLaeD+nVYVKnqYgwuOTol3371/iH0VXWWG48tfJk+ZWqCFBLR4m8Yet54kVJ+pVTsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvrEQDLbiG/Au0HyTisL01q+yiRbJ3WN1eu61F9nDWE=;
 b=Xk19rMJ6dLQ/CecgqptsSXdbhhQ2GYsa47+KE7CMH4+gZCaPfDWuzEImtjzN74MPyTAuALFVKa35dFXV9hBPsq/tD5WpyySqCcPGiTj5qkHN/n1cepPV7Sa06SrRSjZDmv7+oY6/k20Z9bk2VQ4JKHJ944+pFTw1aadMY11pZvk=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4301.namprd11.prod.outlook.com (52.135.36.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Mon, 23 Dec 2019 13:45:32 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b%7]) with mapi id 15.20.2559.017; Mon, 23 Dec 2019
 13:45:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>, 
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH REPOST v3] mtd: spi-nor: use spi-mem dirmap API
Thread-Topic: [PATCH REPOST v3] mtd: spi-nor: use spi-mem dirmap API
Thread-Index: AQHVoXhGj+9EoTpkRkm1bTw10Ewlv6fH64oA
Date: Mon, 23 Dec 2019 13:45:31 +0000
Message-ID: <988a924d-98be-5b86-3ec2-f87f242de069@microchip.com>
References: <88969938-961b-973b-0c13-3792c394b1d3@cogentembedded.com>
In-Reply-To: <88969938-961b-973b-0c13-3792c394b1d3@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [86.122.210.80]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 382c302c-46af-4bab-2d3b-08d787ae6126
x-ms-traffictypediagnostic: MN2PR11MB4301:
x-microsoft-antispam-prvs: <MN2PR11MB43015075EC3F5CB4F5D37DDCF02E0@MN2PR11MB4301.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0260457E99
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(136003)(346002)(376002)(396003)(189003)(199004)(110136005)(316002)(71200400001)(8676002)(81156014)(81166006)(8936002)(6486002)(478600001)(4326008)(186003)(31686004)(6512007)(36756003)(53546011)(2906002)(31696002)(66556008)(64756008)(66446008)(66476007)(6506007)(2616005)(66946007)(86362001)(26005)(91956017)(5660300002)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4301;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UM4bXYlgk7jM+0qWZa9GS/itm+Dp5s8LvsIKKcfxX6wkMevXLGMGzHnh84/Zr88zbRkMXr/3B3thZgH3lbtpKmLwVUheLhHjwHB3bcLwUzwQoJzTctfod+bv4N6RwgcWMS51fRo2CFaidBBSb+oUagb0TicqwhHdkfA1nIDryasfPpco2LphdICC3uUvVLxLjp7IIuJ163IGA1f+nSqQh7EY8/cEXCVda4SxjTyJpmyN7Q04I5Xr2gsXJLQlI2hOKZQD0ekPefyp05pUWWtvRa7Xr/KQLzXaXmvkUIxrUcaHsD9mI4MItzb/xzzuruFglg15l2h+q0ehstCIUTrWvxwt6fwAmR1tGvs0LY+J4rnjSNUe/posdL7282pZDwfbXhxPjgcyydGbGoMUptGpS6BAv+n8On5jZz8Cs6EUUHfwabxW3PE+skWLGmt/cvQt
x-ms-exchange-transport-forked: True
Content-ID: <F173CA369473E04E97D3F30A6D33E07F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 382c302c-46af-4bab-2d3b-08d787ae6126
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2019 13:45:31.8816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IAKPJbm0x46espMt8zZA0bOu5gqjlP+jAtv6V+V07NFShT4Jqi+mrZzVE5s/hRjCumdo+dLRbbTPTd3sFQuMWiQYdRQW/0H3os1Z7uF78xc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_054537_129591_00EFE324 
X-CRM114-Status: GOOD (  13.94  )
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
Cc: marek.vasut@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Sergei,

On 11/22/19 11:02 PM, Sergei Shtylyov wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Make use of the spi-mem direct mapping API to let advanced controllers
> optimize read/write operations when they support direct mapping.
> 
> Based on the original patch by Boris Brezillon <boris.brezillon@bootlin.com>.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> ---
> The patch is against the 'spi-nor/next' branch of the MTD 'linux.git repo...
> Forgot to post to 'linux-mtd' 1st time... :-(
> 
> Changes in version 3:
> - simplified the way spi_mem_dirmap_{read|write}() are called;
> - refreshed the patch;
> - added Boris' tag.
> 
> Changes in version 2:
> - moved the spi_mem_dirmap_{read|write}() calls from spi_nor_{read|write}() to
>   spi_nor_spimem_{read|write}_data().
> 
>  drivers/mtd/spi-nor/spi-nor.c |   66 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h   |    5 +++
>  2 files changed, 71 insertions(+)
> 
> Index: linux/drivers/mtd/spi-nor/spi-nor.c
> ===================================================================
> --- linux.orig/drivers/mtd/spi-nor/spi-nor.c
> +++ linux/drivers/mtd/spi-nor/spi-nor.c
> @@ -311,6 +311,9 @@ static ssize_t spi_nor_spimem_read_data(
>                            SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
>                            SPI_MEM_OP_DATA_IN(len, buf, 1));
> 
> +       if (nor->dirmap.rdesc)
> +               return spi_mem_dirmap_read(nor->dirmap.rdesc, from, len, buf);
> +
>         /* get transfer protocols. */
>         op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->read_proto);
>         op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->read_proto);
> @@ -360,6 +363,9 @@ static ssize_t spi_nor_spimem_write_data
>                            SPI_MEM_OP_NO_DUMMY,
>                            SPI_MEM_OP_DATA_OUT(len, buf, 1));
> 
> +       if (nor->dirmap.wdesc)

This check is always true. The dirmap API is available just for the spi-mem
drivers, and we are already in the nor->spimem case.

> +               return spi_mem_dirmap_write(nor->dirmap.wdesc, to, len, buf);
> +
This doesn't guarantee that the buffer is DMA-able. You should instead modify
the spi_nor_spimem_xfer_data() method.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
