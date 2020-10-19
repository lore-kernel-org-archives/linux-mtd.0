Return-Path: <SRS0=sICc=D2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62291C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2020 17:16:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDDF622282
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2020 17:16:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="brHqntCl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="PLBOfPLB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDDF622282
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SFNBvstTLW187B+hdGA221pNhF25Qo1Va7pBb3Aa77o=; b=brHqntClNlzZDu7vwGN2/uz/v
	oUg3JQ+UFs0x5UaEQ7yX9QT128FlQplWRBTCowduDD33z46hvURRKQw9h3tyxYDym8W/B0gDN065v
	Zw1SI9D+lGyW/yvvHcwZWT/h7L9YUapGgRpl5vl6CSQDtCB7tIpX1WzSjAYrAJjaXcBN9dGPyfA6M
	WV1L5//S1GUBk/pAFPNEAC1EY/Vi3JxyVNsPXk9WhMH+77Y9op1FOek1vJj94+fzmf0czET05lrAW
	zVxSjGq1gcQbLMFIlZvpiePRweVPcE6mN8h8jFI+7Ty/4qVIt9jFJv1NHWU/H/u+Q61qFBXMyGUjp
	6UR7ueFOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUYl0-0000Yg-K2; Mon, 19 Oct 2020 17:15:38 +0000
Received: from mail-eopbgr80045.outbound.protection.outlook.com ([40.107.8.45]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUYkq-0000X4-NO
 for linux-mtd@lists.infradead.org; Mon, 19 Oct 2020 17:15:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiAVIjiDvA0k0tUGg4zibEW28D0T9juqG8KWy+wbpuG+24lG/QjoTY2IqiJeKsrxQOdShUfcZfAr5OTFrrXwjTB9/DA0KKoSI3hfVWwux+FU1oLh3dj8man7dze0i53ygJNAWY0BWIyjcLm5CNZZJmQKz3tMhK8pP9WXn7wvl8pmZK1YCExEpjUm4QUoR5HB8QZJ8T/8P9ysXeCpWje7rcxer0Q/ho6R+HWWQghSlSp76JhIwWrOeQK18wpvINa8hHwOmpHcOFkGIOeYCwdV8crUcxFGpIHPoQdbV9MtI0o+6o1fAYqC4kfzu4GA451NFQvvGT0/pPfOg5KjPvX4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7aOzgSdMuHyJHW89SITAFxrSRIrHvtSN2yayscefY8=;
 b=hw74sA7CmCkBoaj/kkHbo2mOplamMefpMVjq1uSKHIYeaqi5QF5RKpqoUtGEAX8dUrDpl7JY2+/txjcFQ/CLi6iWvxegVqZuNxh1imWaI1lCLJxKrOaa3f0nQuwCg6cXjVGwTzdGY3fcU0oSdx5psyLbEoqP0ORSRdUNr2IRmkV7rrLJcT5xyDOTY02bNlnDO/BxIvgxRF7SRpyPekSK5L7PEbI6FYa8eSY/XzN4OwzLEovxFMCFkgK45StN1sE/fzw6+3FJr7pe1I7FkJ5t0gOzl35BEVPPiYJdao8y9T7jnnBkiRGRFsf8pCKdwvPKvsuF4XrMkOF2CueVH/G/XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7aOzgSdMuHyJHW89SITAFxrSRIrHvtSN2yayscefY8=;
 b=PLBOfPLB1W13Sy4M2H4bva9frTlwkKatuakFO5x1NR6rUseKuQq0OtzCDBziKRADsas3j9p2IdzMttd6PM/mCTD8e11qLSrrkwG+aq7aEU6trk3knxt0MNtw90Q4z9cH/JoFYIKqaviykxJoluXFOgtseadpTmeUMoF4HMivM7w=
Received: from AM6PR0402MB3701.eurprd04.prod.outlook.com
 (2603:10a6:209:1a::16) by AM6PR04MB4104.eurprd04.prod.outlook.com
 (2603:10a6:209:4e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Mon, 19 Oct
 2020 17:15:20 +0000
Received: from AM6PR0402MB3701.eurprd04.prod.outlook.com
 ([fe80::98a3:6f4e:b00c:98ed]) by AM6PR0402MB3701.eurprd04.prod.outlook.com
 ([fe80::98a3:6f4e:b00c:98ed%3]) with mapi id 15.20.3477.025; Mon, 19 Oct 2020
 17:15:20 +0000
From: Han Xu <han.xu@nxp.com>
To: Fabio Estevam <festevam@gmail.com>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>
Subject: RE: [EXT] [PATCH v2] mtd: rawnand: ifc: Move the ECC engine
 initialization to the right place
Thread-Topic: [EXT] [PATCH v2] mtd: rawnand: ifc: Move the ECC engine
 initialization to the right place
Thread-Index: AQHWo7/+2dIz5N4fiUayWcr8hrRsLamfLv7w
Date: Mon, 19 Oct 2020 17:15:20 +0000
Message-ID: <AM6PR0402MB3701A1F9C6EB510D08819B60971E0@AM6PR0402MB3701.eurprd04.prod.outlook.com>
References: <20201016132626.30112-1-festevam@gmail.com>
In-Reply-To: <20201016132626.30112-1-festevam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [70.112.23.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 08d92935-6d0c-4e02-33ca-08d874528ecb
x-ms-traffictypediagnostic: AM6PR04MB4104:
x-microsoft-antispam-prvs: <AM6PR04MB4104B2E3D33EE8138E8B529B971E0@AM6PR04MB4104.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:305;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n4gFPHSBrgSb7+Jsk/TkszP0bf+YvF3e3anHZSEPH593TG8b7tXgncqmEZGj1YI8uxQY+u9QmfMShPpCXYasrsL0yyZkcHzYRtsime+6ZdWiDRFsN2gD2zEPHY+U//74qgPEPCvHJhYmfbK+dIpTpSbYuGb4d3duzcvYpAfEycAOBsLUZQ6lSANvJHZOcU8hZSdnSIEOhaaMISvdB96MJQ31Dkw17FQZdDtmcatFtzQPFCl+4yRiMuBoHvCQHoH9qx7tDOAiwGy0xz6ByxfkGP8xd+a7wZh1nouLlNQW0UETn391l2+n94dbRxE26PH4m+WPvvJmHTYvA+hRlmINQg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR0402MB3701.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(55016002)(33656002)(53546011)(8936002)(6506007)(8676002)(83380400001)(478600001)(5660300002)(186003)(76116006)(71200400001)(2906002)(4326008)(9686003)(66476007)(66446008)(44832011)(316002)(110136005)(66946007)(66556008)(64756008)(52536014)(7696005)(86362001)(26005)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: NM9lgflmPs3a5c9ogExL2NVYwEcL5ZRUtHrge24wT68iSTjJZpMWTRp7HdJlaQSpe5kUn+XdVV9IgYt/zoD8OnhMIKrrCN1JAv2NShsax92/9s5kGXpE0n2sLWHibrioDkDKNg3S9MQV/c3c6tiqEtpVtHr4d8wNXchuFwrZzpeOwh/vJFTP9XHKe0p+nPcCf2IPE3AtH5g6RbLXDSs1bindorID9CGm3a3K+Gw7EGCoyMPj3Pe9C9eSFJorWJMg2rubz/2O2MZyS+hLyADzuN6PGwrszCZomW7x++4grxMnYddDbmaxJNrKfC+mgTZBuJ5opXFAxs4uD8BY3IbevTYsx8OqNUlj8481clmZbbWmowjfb3pDncPgELov+KHDjfR1430iKaTNWjP3UTeKSEJX7gOKX8VHh3VWNc1BUOh8bsbo6s0g1n9D87FH7M3wKjFNX918cnnw8hjnVA+pzWZeTpgsgsQYCURB/q45uGQaAKo5rsM57pgAPce/hsQCZwQhj6ZNPzWVvn9YHpMFDK6vdHfcfTyC80gTpBVj+jvFXg3TmUYLP88lNrft9AjJybMp38PMjmfl9cdNMwESLIUl96sjZAyiJG1o0c2pPteokjRDQyCA1Y3g2+7yjHEKhp4orEH49oe8QayoRLrAaQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3701.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d92935-6d0c-4e02-33ca-08d874528ecb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2020 17:15:20.3078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3wzObBenNMc+t2xXFtEFuCf7purpKSk9kpnLWgLiK7ZnI2g2+Tv98xSFBXFZAMhE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_131528_883159_7F7DF13B 
X-CRM114-Status: GOOD (  23.03  )
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
Cc: "richard@nod.at" <richard@nod.at>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "vigneshr@ti.com" <vigneshr@ti.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Fabio Estevam <festevam@gmail.com>
> Sent: Friday, October 16, 2020 8:26 AM
> To: miquel.raynal@bootlin.com
> Cc: richard@nod.at; vigneshr@ti.com; boris.brezillon@collabora.com; linux-
> mtd@lists.infradead.org; Han Xu <han.xu@nxp.com>; kernel@pengutronix.de;
> Fabio Estevam <festevam@gmail.com>
> Subject: [EXT] [PATCH v2] mtd: rawnand: ifc: Move the ECC engine initialization
> to the right place
> 
> Caution: EXT Email
> 
> No ECC initialization should happen during the host controller probe.
> 
> In fact, we need the probe function to call nand_scan() in order to:
> - identify the device, its capabilities and constraints (nand_scan_ident())
> - configure the ECC engine accordingly (->attach_chip())
> - scan its content and prepare the core (nand_scan_tail())
> 
> Moving these lines to fsl_ifc_attach_chip() fixes a regression caused by a
> previous commit supposed to clarify these steps.
> 
> Based on a fix done for the mxc_nand driver by Miquel Raynal.
> 
> Reported-by: Han Xu <xhnjupt@gmail.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Tested-by: Han Xu <xhnjupt@gmail.com>

> ---
> Changes since v1:
> - Do not remove a blank line
> 
>  drivers/mtd/nand/raw/fsl_ifc_nand.c | 43 ++++++++++++++++-------------
>  1 file changed, 24 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c
> b/drivers/mtd/nand/raw/fsl_ifc_nand.c
> index 0e7a9b64301e..e345f9d9f8e8 100644
> --- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
> @@ -707,6 +707,30 @@ static int fsl_ifc_attach_chip(struct nand_chip *chip)  {
>         struct mtd_info *mtd = nand_to_mtd(chip);
>         struct fsl_ifc_mtd *priv = nand_get_controller_data(chip);
> +       struct fsl_ifc_ctrl *ctrl = priv->ctrl;
> +       struct fsl_ifc_global __iomem *ifc_global = ctrl->gregs;
> +       u32 csor;
> +
> +       csor = ifc_in32(&ifc_global->csor_cs[priv->bank].csor);
> +
> +       /* Must also set CSOR_NAND_ECC_ENC_EN if DEC_EN set */
> +       if (csor & CSOR_NAND_ECC_DEC_EN) {
> +               chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
> +               mtd_set_ooblayout(mtd, &fsl_ifc_ooblayout_ops);
> +
> +               /* Hardware generates ECC per 512 Bytes */
> +               chip->ecc.size = 512;
> +               if ((csor & CSOR_NAND_ECC_MODE_MASK) ==
> CSOR_NAND_ECC_MODE_4) {
> +                       chip->ecc.bytes = 8;
> +                       chip->ecc.strength = 4;
> +               } else {
> +                       chip->ecc.bytes = 16;
> +                       chip->ecc.strength = 8;
> +               }
> +       } else {
> +               chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
> +               chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
> +       }
> 
>         dev_dbg(priv->dev, "%s: nand->numchips = %d\n", __func__,
>                 nanddev_ntargets(&chip->base)); @@ -910,25 +934,6 @@ static int
> fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
>                 return -ENODEV;
>         }
> 
> -       /* Must also set CSOR_NAND_ECC_ENC_EN if DEC_EN set */
> -       if (csor & CSOR_NAND_ECC_DEC_EN) {
> -               chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
> -               mtd_set_ooblayout(mtd, &fsl_ifc_ooblayout_ops);
> -
> -               /* Hardware generates ECC per 512 Bytes */
> -               chip->ecc.size = 512;
> -               if ((csor & CSOR_NAND_ECC_MODE_MASK) ==
> CSOR_NAND_ECC_MODE_4) {
> -                       chip->ecc.bytes = 8;
> -                       chip->ecc.strength = 4;
> -               } else {
> -                       chip->ecc.bytes = 16;
> -                       chip->ecc.strength = 8;
> -               }
> -       } else {
> -               chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
> -               chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
> -       }
> -
>         ret = fsl_ifc_sram_init(priv);
>         if (ret)
>                 return ret;
> --
> 2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
