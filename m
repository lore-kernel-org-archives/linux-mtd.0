Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5C8606A31C
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 15:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KaW5+4gn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Q/XuVNfL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SNLYczQeiOPRO7kX7T0Jl4l/wdDGDXkjuEY1JF1WZ0s=; b=KaW5+4gntX9C8QLA5vsg2MxB3F
	HMVTziggZe2NMc/mQK6hRjSB2MG2+6uUU0ws8Wdx+BsX6jskxwJxeB3hsyzaQfu+wsqWS95+gxpZF
	V83hUj6djK1Vv2NgxVH+Fnvij427NeYH/KoI8BlJnrvG8mN6g3q1zuCpN61MFraCwC0loru+UP/u/
	rYDxHauscuEMjBo/16K8/hfzpnatDagHOUhVKuy38lOPigZI0eoZMSjNhuBvIToRwV3P56U5CVnA3
	AzXiV66A7i4Qp+kkAldG6KD84wciakR9e8tNlkmEuTKLF3DNe+wa/Yecp5SNngnv1j9B2O4rRvPQP
	uejVgpqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXC5-0000000AWiW-0i3t;
	Thu, 12 Nov 2026 15:58:33 +0000
Received: from mail-francesouthazon11011023.outbound.protection.outlook.com ([40.107.130.23] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXC2-0000000AWhg-0wxA
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 15:58:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0iHjLvYIKTFkIvIM9nU/o5inQHMgR5c98aQq9ZOu4IuWTz6DLI9HOJoIBA2cHyzHX9sr/GwSzV/rBMKVw0fnLaSfCq2dY4xnWabn7M8e4QE7P9zDhwmyuSlpEyGD3osu95jSl8cTmeGUwWjHd9UjAvbQT7EjVk4gbgxWweAx219AKrxShsPvwmo375Vi1gObCOw6RMSUoAqmDG/FA1lLBWe8e18QHkrtRrrHPmjXj4A7JV08Phc3Xpw4Mc++uHDgUuRB3JUwaemp3jsW504dK7YYzSuQhYTurQ8urxUUfBJvaXWTTXG2rU7huHvLtbuBS9o9kQXEQ5LvqGyR7/W4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgyiL02x4m9j/jH8c8HyEJMO5R9v00Ha20Yrs2mhXMM=;
 b=AQx73AWilvNfrqnhF+CnT07JO2WVdBXT9tCxLWE5GPjK2rvxKRmNfNGp3xlndXsC954/59WSvNAxEo6LYeQ/Ej63TIxbBQ0IqMUvToLftBB1DkA1Q0Uljt22FcKK3OHrPwikXNWwCi8glLXyYfmgrso8XoRrr6U582BZ7ZYsLpwyeY2PJosFNRjExi/cKd8SjMyHZccBY81u79Kep8S52HMVOeqbUaBailzEry5lPgnJdFwHRXSdYuPCRENrSM3D/H3v5n5OblNlE+/6rXnzreMEXhM8m9YhAxQbwQlv6dhRAjVGCiK120p7cXaN2XkJhfS6UkTkxC9pvkoRtmPxWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgyiL02x4m9j/jH8c8HyEJMO5R9v00Ha20Yrs2mhXMM=;
 b=Q/XuVNfLghklvuTUbOo6QsJbEwVocHhbDXonuXhIO3AR65gLtsQVU8bvbVqwVfPDa5jp75O/UjKDaUuCdqV6xqsbh9tPWl51LU8vUPJKtcdBs8gob0H1buQnG/sYbAEUpJXIo+ShiqU7xVfY7Jri71Dy6F9lThwfcPGZHwAkKkwetGMhqq+Ve7JFLMmz4Pd6bvFu7VO644GZHEo7BEJUxjrR0GG4dZ28avTsrSyQindfHfOuMfn6vlsW/tlgp7lE0FM59wWR2nlylGcX+m7ve+n90NNLKplTf1MilDDQJ/xxoRs4dQefPeERYfibmcdgAIFMaN/hTjI/TVMNFCJiYA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB8231.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 15:58:25 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 15:58:25 +0000
Date: Thu, 12 Nov 2026 10:58:18 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Frank Li <Frank.Li@nxp.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>, Chen Ni <nichen@iscas.ac.cn>,
	Kees Cook <kees+treewide@kernel.org>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	"open list:CADENCE NAND DRIVER" <linux-mtd@lists.infradead.org>,
	imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH 1/1] mtd: nand: raw: use dmaengine accessor API functions
Message-ID: <avXiGrK747XRApda@lizhi-Precision-Tower-5810>
References: <20261111202502.3860647-1-Frank.Li@oss.nxp.com>
 <sashiko-outbox-209681@kernel.org>
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-209681@kernel.org>
X-ClientProxiedBy: SA9PR11CA0016.namprd11.prod.outlook.com
 (2603:10b6:806:6e::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c364b7-c62b-497f-a942-08df40d5c8e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|19092799006|10067099003|4143699003|11063799006|260925021311599003|260925022911599003|260925021911599003|56012099006|261021135927099003|261022115727099003|261022113327099003|261026121527099003|261026130827099003|261028144727099003|261022075727099003|261022105027099003|261026140227099003|261026135527099003|261021133027099003|261021121427099003|261021123027099003|261021130227099003|261102124527099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 5KvDsHIZzaggZeBPYMc7eMQ1sNHZ0sUPmEePRacZe3xPyPrGiE/wpzq2OUW1LAAUym2jpLzQ+iz1WmLC9lEO0zcfHACWBSALmmcBrKoguR6QbNneRDC/dXsO/t+tbhrBTr65Yf+4M/DD5eaTCSR7yRIr5u6/4f5WP41dFtOiT/dBl24gySxtI+y2ydIrM61KJO7QeiiBSvPnESqvZ/fUp9FcEDPTbvNwOQntK6i0EPBivhfdoOVG16TjTv7kT5toHaTBaMUVtP7KScRcBfMIprgiMZZxvgJog3eK8sfqjdfnw3vLdFWcO1BV8YknKgMQ/1d3JBngwhPsHMNAv7VELVQ2VVgUx1/47HO/CCHA0wQfZX9a6KZZo4RxuFQmT0ExxAF+Jm65Gf3o7nqf+QGp/iYVypcWbHVatM+FEZshU+g6Xx7zUC5gyJjuwITtoMHwdxs0xjFpQo6eQX51fOoPPHUdFfA/QqvC/E3dBRxAnHNt6lWBCP8gCCRwJRbUu/sFR0gM79Hdz7905D6c2/KWXfhgz/WAtXHWU8C8nCCnPeWoo8WqmZreewp2QTxmsGoONIv2+UoNseQxr1uGL5NEihaErHMf1xxiVOilA5RdgYw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(19092799006)(10067099003)(4143699003)(11063799006)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(261021135927099003)(261022115727099003)(261022113327099003)(261026121527099003)(261026130827099003)(261028144727099003)(261022075727099003)(261022105027099003)(261026140227099003)(261026135527099003)(261021133027099003)(261021121427099003)(261021123027099003)(261021130227099003)(261102124527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pOu1m2K6RCDK8Ti1NdSfmjrErx+QM+TqWLslRcsOZo4YeUjxVyy1H3h+MM?=
 =?iso-8859-1?Q?es0f9lgZTCb6CfQGTN9w0e9NZxuOdsiCEPZWEsc1FhEO7wjFZ654VCcq1w?=
 =?iso-8859-1?Q?4uNfEvnDhzVAqQTaEto88HQfFTBB0o2ic+lxux7CTArCSCsqkQ3yzRGxwA?=
 =?iso-8859-1?Q?ttNrTCmQMCxya0doz3EE28y4wzboW1uiyf0S2NG0UYlKL9MuRGdzHJUidW?=
 =?iso-8859-1?Q?80XCw6TMoWQ7SjynO2NajEyrxh3QJzCrQJiDAJxvbooRytcwSFwFVP3Ttt?=
 =?iso-8859-1?Q?O6PatswEepjOM3KmEMsn7rFrnSs9/d/VQw5kkXT5PaslAHxO0Vinm+Qjss?=
 =?iso-8859-1?Q?2Vqbp8v00g+0pTJEugGudDjPnwhxiAYoFroJYJ4eMAXxbZDZmfcHvrkDs6?=
 =?iso-8859-1?Q?XTbvCA4FqYYXNiS/rG5SrkYwHi1aWi/QtA9mxd3HQ+aPXZiKwRhreRxQ3j?=
 =?iso-8859-1?Q?44UcSVI8xgEmIXdu6gNSA+RSeO066GOlaElfs1V/Xhlru++h+y5ovyP5Yx?=
 =?iso-8859-1?Q?+5im2ezRhLVZdWoxoRVKyJ67lhe57MthsYup/WwCyR+hU5MfXnvoUx9YZz?=
 =?iso-8859-1?Q?zp2psnbnylbZsDWOjginnMeV3PDG/sUKdk2AzVJkN7g4hb9w2FkQ83T1BJ?=
 =?iso-8859-1?Q?N1uzjONKfL6rdnBVX7Sl3QrnGagFfSbtKKlQ5ADO4iTWVOhwtCE0Hr9mc3?=
 =?iso-8859-1?Q?yT964lBXWzIyo6lRaW+Kzs6/6MW8G99N/ymVn41if5cu/1JfSNWOSxBs8x?=
 =?iso-8859-1?Q?TWJpN9w4xP8EkrgWUYBbIvpYegn/D+1DMHTqBp+xcfamMnPg8zOaPRPWoM?=
 =?iso-8859-1?Q?HmySRoDWaCIQyXaBnYZeIiY2QipAHud8yc2u91lN+Zo6VPyoWjDDDV4fAt?=
 =?iso-8859-1?Q?eTvXGuTds9dHK2+bi5afxPq7UqxHzWqYqo6fc8A6fOERnS7QSWhkWxXOvI?=
 =?iso-8859-1?Q?J8mpGOMm9akcG7OCaqPw0dzSeb0EZnRqwCnCTTGEsTEbwH/dhgGzwy8/fz?=
 =?iso-8859-1?Q?Y3CdqSo2lKFBO0sHrqWhb7XQz5DhUqHM+rLdXjhVM6ZtIcjwKjqgE/X1dk?=
 =?iso-8859-1?Q?XRG0BoM1kzusTjY8QKsAJfc4kNFobVD09gJMHtTPuAO8QsneWs6HeqIai8?=
 =?iso-8859-1?Q?fgEdDo3L8vw3PzMUNK6BKwxCfvn41XGZWjbWVtlKMEWncemr5/hlqWvGnh?=
 =?iso-8859-1?Q?er4G2feGk3SGsJJALpPgtXtwtOAMftF4OPSH96MTU6ZKkrBMwVms+DwdwZ?=
 =?iso-8859-1?Q?TckI/661RlgHQNPNzX3aFALk6RF6nPBPSrGxwWI26ITi/oUid5LKVDvP2Y?=
 =?iso-8859-1?Q?y+2jHa08m/OzHoapH351yWLTuRiHVJ9RtHEAdzSnZ8zepfMdqA0LAjevnB?=
 =?iso-8859-1?Q?OlIGv9rcNrWHgT/1TFnJqqEIpNGp929Fo3RoqFH/bDFYnAm7kKMFZYYuJE?=
 =?iso-8859-1?Q?RIUwKjNVQjpAVGkxuu0gqOebcXak/HodtCN7XQaWXg281/ZHLHNv7Unrms?=
 =?iso-8859-1?Q?/cVpjD1HDwGwNl50Yf3hqrhcOXQ03lKicqky+SSJnxUWayF/uY5wF+gl5p?=
 =?iso-8859-1?Q?JC9TGFGs3px4tu+rdCDbjhrSRrQS45a8+CGAq6I2328NWXEiIaWXw6WW+G?=
 =?iso-8859-1?Q?lFlSuJ5K30r90/uY+qikYDULjy8rStgR9u9QiSvEppN9mMwMnGJXCj2Tpk?=
 =?iso-8859-1?Q?VaPMJaGrLBGp3rnIa30RntP7nBJE+dz+N4mdD3L4HGYpbJ4k0SA0lG+4Yx?=
 =?iso-8859-1?Q?I3DfubSEoci9K9pNhLzhI6/2O1foI5e1NF07dLCCKTt3+SjI5ZbpPq6R+J?=
 =?iso-8859-1?Q?ixjlDQh4W2Dw/IoDNfX13VStgqdECHxUy/SbKgGUCEImKgADxxhg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c364b7-c62b-497f-a942-08df40d5c8e4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 15:58:25.3297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6IuI1DrLLkI+s+MgcPY0bbRPxGZxp15GUOJ9SSfc6z85yj8TS3fNgqEJe0Av+Q7wcXYvk0Rknz77aR++FsSG8id1VAq9r39v3dcWRV/qK5RiECTcwnjqb+XgG2q/1cY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_075830_428015_DC7D18F3 
X-CRM114-Status: GOOD (  23.78  )
X-Spam-Score: -1.7 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 08:51:17PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mtd: rawnand: cadence: unmap device mismatch in
>   cadence_nand_remove()
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [Critical] mtd: rawnand: fsmc: missing reinit_completion() in
>   dma_xfer() [1]
> --
>
> commit 9eda52238f6d5af7214b32eeb0870d65126ccf3d
> Author: Frank Li <Frank.Li@nxp.com>
>
> mtd: nand: raw: use dmaengine accessor API functions
>
> This commit replaces direct chan->device and device_prep_dma_memcpy()
> accesses in the Cadence and FSMC raw NAND drivers with
> dmaengine_get_dma_device() and dmaengine_prep_dma_memcpy().
>
> > diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/m=
td/nand/raw/cadence-nand-controller.c
> > index 2085632631c02..5e3d34f24f9d9 100644
> > --- a/drivers/mtd/nand/raw/cadence-nand-controller.c
> > +++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
> [ ... ]
> > @@ -3170,12 +3170,12 @@ static int cadence_nand_init(struct cdns_nand_c=
trl *cdns_ctrl)
> >  		}
> >  	}
> >
> > -	dma_dev =3D cdns_ctrl->dmac->device;
> > -	cdns_ctrl->io.iova_dma =3D dma_map_resource(dma_dev->dev, cdns_ctrl->=
io.dma,
> > +	dma_dev =3D dmaengine_get_dma_device(cdns_ctrl->dmac);
> > +	cdns_ctrl->io.iova_dma =3D dma_map_resource(dma_dev, cdns_ctrl->io.dm=
a,
> >  						  cdns_ctrl->io.size,
> >  						  DMA_BIDIRECTIONAL, 0);
> >
> > -	ret =3D dma_mapping_error(dma_dev->dev, cdns_ctrl->io.iova_dma);
> > +	ret =3D dma_mapping_error(dma_dev, cdns_ctrl->io.iova_dma);
> >  	if (ret) {
> >  		dev_err(cdns_ctrl->dev, "Failed to map I/O resource to DMA\n");
> >  		goto dma_release_chnl;
> > @@ -3204,7 +3204,7 @@ static int cadence_nand_init(struct cdns_nand_ctr=
l *cdns_ctrl)
> >  	return 0;
> >
> >  unmap_dma_resource:
> > -	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
> > +	dma_unmap_resource(dma_dev, cdns_ctrl->io.iova_dma,
> >  			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
> >
> >  dma_release_chnl:
>
> [Severity: Medium]
> Should cadence_nand_remove() also use dmaengine_get_dma_device() when
> unmapping cdns_ctrl->io.iova_dma?
>
> drivers/mtd/nand/raw/cadence-nand-controller.c:cadence_nand_remove() {
> 	...
> 	if (cdns_ctrl->dmac)
> 		dma_unmap_resource(cdns_ctrl->dmac->device->dev,
> 				   cdns_ctrl->io.iova_dma, cdns_ctrl->io.size,
> 				   DMA_BIDIRECTIONAL, 0);

Already fixed at

commit a018524a2ec96da5bb1965053967a20e0069ed9e
Author: Frank Li <Frank.Li@nxp.com>
Date:   Thu Sep 17 16:47:06 2026 -0400

    mtd: use dmaengine_get_dma_device() instead of chan->device->dev

    Replace direct dma_chan::device::dev access with the proper
    dmaengine_get_dma_device() for consumer API

Previous script have not recongize this pattern.

> 	...
> }
>
> When chan->dev->chan_dma_dev is set, dmaengine_get_dma_device() returns
> &chan->dev->device rather than chan->device->dev, so cadence_nand_remove()
> unmaps the resource against a different struct device than
> cadence_nand_init() used to map it, leaking the mapping on driver removal.
> It also leaves a direct dereference of struct dma_device.
>
> > diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fs=
mc_nand.c
> > index b13b2b0c3f300..831293a5bd814 100644
> > --- a/drivers/mtd/nand/raw/fsmc_nand.c
> > +++ b/drivers/mtd/nand/raw/fsmc_nand.c
> > @@ -486,7 +486,7 @@ static int dma_xfer(struct fsmc_nand_data *host, vo=
id *buffer, int len,
> >  		    enum dma_data_direction direction)
> >  {
> >  	struct dma_chan *chan;
> > -	struct dma_device *dma_dev;
> > +	struct device *dma_dev;
> >  	struct dma_async_tx_descriptor *tx;
> >  	dma_addr_t dma_dst, dma_src, dma_addr;
> >  	dma_cookie_t cookie;
> > @@ -501,9 +501,9 @@ static int dma_xfer(struct fsmc_nand_data *host, vo=
id *buffer, int len,
> >  	else
> >  		return -EINVAL;
> >
> > -	dma_dev =3D chan->device;
> > -	dma_addr =3D dma_map_single(dma_dev->dev, buffer, len, direction);
> > -	if (dma_mapping_error(dma_dev->dev, dma_addr))
> > +	dma_dev =3D dmaengine_get_dma_device(chan);
> > +	dma_addr =3D dma_map_single(dma_dev, buffer, len, direction);
> > +	if (dma_mapping_error(dma_dev, dma_addr))
> >  		return -EINVAL;
> >
> >  	if (direction =3D=3D DMA_TO_DEVICE) {
> > @@ -514,8 +514,7 @@ static int dma_xfer(struct fsmc_nand_data *host, vo=
id *buffer, int len,
> >  		dma_dst =3D dma_addr;
> >  	}
> >
> > -	tx =3D dma_dev->device_prep_dma_memcpy(chan, dma_dst, dma_src,
> > -			len, flags);
> > +	tx =3D dmaengine_prep_dma_memcpy(chan, dma_dst, dma_src, len, flags);
> >  	if (!tx) {
> >  		dev_err(host->dev, "device_prep_dma_memcpy error\n");
> >  		ret =3D -EIO;
> > @@ -547,7 +546,7 @@ static int dma_xfer(struct fsmc_nand_data *host, vo=
id *buffer, int len,
> >  	ret =3D 0;
> >
> >  unmap_dma:
> > -	dma_unmap_single(dma_dev->dev, dma_addr, len, direction);
> > +	dma_unmap_single(dma_dev, dma_addr, len, direction);
> >
> >  	return ret;
> >  }
>
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can dma_xfer() unmap
> dma_addr while the DMA transfer is still in flight [1]?

Existing problem.

Frank

>
> If an earlier transfer times out and its callback fires late,
> host->dma_access_complete is left signaled.  Because dma_xfer() does not
> call reinit_completion(&host->dma_access_complete) before submitting a new
> transfer, wait_for_completion_timeout() consumes the stale completion and
> returns immediately, so dma_unmap_single() runs while hardware DMA is
> still active on buffer.
>
> [1] https://sashiko.dev/#/bug/linux-836e69de-023a-4bd2-8b41-03e05feb8137
>
> --
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20261111202502.38606=
47-1-Frank.Li@oss.nxp.com?part=3D1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
