Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29311C47082
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 15:26:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D83611C9
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 15:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7D83611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMkwaQrp9uZWViJ5J7iuNU2prqQ2RSDJ26YRzWWXtkI=; b=zxSiHCw06Xjtpc
	1T4dhQaYUeRb+4iaVvdl6cR247d/jWJ0exhpzoQvMcCHoegzJVR3QWundcp/v0MiNmf3H09i7qkm5
	gBz/VajClhMD1CvjZVJzZ7pmRs5PiC0pxZO/dGcQwP1DfOUPo7jsXrcndCSRRjW9Xn2i+R3uza9Us
	+O4OimI3r0SnGcH/Ivzw7L9LFBRNFNnZjsx6Yz/7PSFEnZ+67mn3xqqVQtQZpJErDecaWjrHcTxAc
	PEESEiCDrTEzzUXcJcXzG4q2AWC+W/On97vcps01io91swytHL7kZlQG6A9jUti3h0mGfKrQtsKdI
	/PQAJBTPC/JAnbF+yBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llvPM-00FLWQ-Sx; Wed, 26 May 2021 15:25:21 +0000
Received: from mail-eopbgr00046.outbound.protection.outlook.com ([40.107.0.46]
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lluLW-00EnHl-KK
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 14:17:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzFbtTlsq0A48GqMEp7aOz9rAK1bKS/WcMyOuSFrK7ePK9QvavEgy02WxymVwUOwRQqpgO8AXE24jJHulkst/Ug7A5o4NbSLQAAybDhFY8YKt805ph/T0fPTu9Unlg9BmazUUPYkugKmFQdAJdxRUHoeUd9icJT9z5SLXHC7UmYZDFsP4EYZWZsFWv8uN+h9RnzRKUxjCAtZM608PPD4MXA144OfXWbmBwfj3paIlePBDeNwX0LnMCgFTwL9yBSDEOh7elijRV2liDFiSdp4Wb6lkMYPSVnbiu+onBAoeYdWvrIMGj1nH8vAmIvN8lTvug8VnOggVyl+i1vKXqZf8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zJtzU/X3wjc/k79g90Kp70mLSsyDHOLMGleEn2FKZw=;
 b=dtqtfeDMv756hd41fDmcpPJS7RMAvT/h5HEB9XohP4n3iBqEn3gfxYMOd2rXnNyVobwcXO3w65rt5A43A+8xqhGLLiL7h3dVgYxYvLtGajBgGI/F1gVP0mpNd8KtmacjNqQ4fhxXCypQAaSFQ3ObsTeBg9Gzlx3OUASAE70gkZ4qlesSwWILeKZykJn+HzLDw1L1RJYRP1et6KKJZVDxnZEgqfMh+jKKvQQrHukL7Q3OF5s7k8G99gARBtHRTL/Wj6RlU1a2X/6x4iiBTdrnW2t767XwOHL5nANQLB+oyFF1RBiZAQUfCtpCSPw3AxMsyp4z3z0KcJugDKl9w8jNBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zJtzU/X3wjc/k79g90Kp70mLSsyDHOLMGleEn2FKZw=;
 b=FGBSNKRYAOSz/RBI8l110WmV7mVTMUuQ9xnZ1JgK7lGoWwewUf/Jp4ZUERW8N5WWJtZG8RI7ikKyc25xmJ0e+AwhVKI+FTB2bZKmkdt6WdWe2NfQESpbcyBb9EryIguC1/sLEfyK7Ue1ajb7ugpJC6JGbRKvau3Zx5wqvOkWr9g=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DU2PR04MB8949.eurprd04.prod.outlook.com (2603:10a6:10:2e0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Wed, 26 May
 2021 14:17:14 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::705c:b16e:3072:3dc8]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::705c:b16e:3072:3dc8%7]) with mapi id 15.20.4173.021; Wed, 26 May 2021
 14:17:14 +0000
Date: Wed, 26 May 2021 09:17:00 -0500
From: Han Xu <han.xu@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Sean Nyekjaer <sean@geanix.com>, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: nand: raw: gpmi: new bch geometry settings
Message-ID: <20210526141700.5gygssig4rnzn6mj@umbrella>
References: <20210522205136.19465-1-han.xu@nxp.com>
 <13c975bc-b37b-8708-9ac7-acdc62ef7108@geanix.com>
 <20210525191308.jlxqvy7khptbuj4z@umbrella>
 <20210526094136.279976a6@xps13>
Content-Disposition: inline
In-Reply-To: <20210526094136.279976a6@xps13>
User-Agent: NeoMutt/20171215
X-Originating-IP: [70.112.23.252]
X-ClientProxiedBy: SJ0PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::12) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (70.112.23.252) by
 SJ0PR05CA0037.namprd05.prod.outlook.com (2603:10b6:a03:33f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend
 Transport; Wed, 26 May 2021 14:17:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52c13072-682c-4434-e3f4-08d92050f5c7
X-MS-TrafficTypeDiagnostic: DU2PR04MB8949:
X-Microsoft-Antispam-PRVS: <DU2PR04MB8949FBE030435A5040ABE86197249@DU2PR04MB8949.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5BrWaTmjrPtvlc8UzeF7QqxVg9vOiqY8G28g9Rez1JcVCh0oJHF6+sA2YJdOUtYDC1xes6gtBb+IWlS61Yz7W+bUUstCVZihdDpO63LspEJCRmPVKnIgEli3Nb2CCv+2WMHtgAvGPnftnoQYCU0TJVoezW2Nb+fCk63IHPymv2EFat/S4o9IDx2yrK7ZAwOWdWlYJxrl0r74sAVOYNn8i2tuetFme1JlMhYVKncwFmBbjhyicojbPm6cGn2DtWHRBQMTzKqI+lYDPM4oguXknsAn9IXNIvxB6xoaE8LmKP26553ELjn+UXVXP7nzT4dpkhuK9ix6il5MhOkURnvwbxkLcPQQBOUD4IzZEaFlAjCfJsQbFaO966r4NOfS8EMgg6s7vcEcdbA5WL4FpRZPKMShnp/QjkUtnIs7IlTMTcG+hWlixzIrAG1SWw6QRFeG1aXemz47veo1tUO1NS2uePwujX7jw5KiZO7/tLa5KBGIR1LWMIgB/XLkcH5bOg3+oxtUIqqwHlhBhQlVq/b/HluWoe+OtecZcEnN70uarlaKzooqOn2qSduj8BJehg3j24bGXsMPhqonRcvW7Z+o7u0jo6fHe4YsZkGbL8Vsv3lPAW8j8CHaABEucwgHJTKpHyFGQd4Sxd+ACn+YmdV7njrCoFwE6TlbOKjb0NEpPag=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(8676002)(9686003)(83380400001)(8936002)(1076003)(6496006)(6666004)(66574015)(66556008)(66476007)(316002)(478600001)(26005)(5660300002)(52116002)(16526019)(66946007)(38350700002)(2906002)(4326008)(86362001)(186003)(956004)(33716001)(6916009)(44832011)(38100700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?BpdJkvkPBuxyCT+74Lu8oN9c+QjTwgwl8GmNyakdMI6BRkzjk7ec1Jw9+h?=
 =?iso-8859-1?Q?r8UPgcf46HF3X70thwCCyHPZMDAcsXh8wjQsxSs4Fz/Zf/QHZjLRlVyecF?=
 =?iso-8859-1?Q?I6F4IUo3AfnHQklsNOpxZyGMuyyYN4/TYMnVc4mEPABVtXUNlruS3NXVX3?=
 =?iso-8859-1?Q?Rvh6uimxzjAgoDyIM0aeJJZV6MzMsbeCaLdGjiMj2JV05mYz/2wauIpp68?=
 =?iso-8859-1?Q?54O9QvrZSUJj17eMzxaZXCfrmRtg1SK5EhY9D/p1JS021VVtVyP53pU0mW?=
 =?iso-8859-1?Q?8+sQWVUKLkXDrLBt9giw8H06KBaFkpLqmKagiRwLveWX8n8AOS+LtrKtGi?=
 =?iso-8859-1?Q?bdDPOtYtGDn71b3R2wKvw9+A6WDF2ftkLiLN4yzpF4mPwPbzBmlnhw5a3v?=
 =?iso-8859-1?Q?fPAqCuAfGmgqhIjJDHbpTLoZQdg0qgZxOcK1Vi1Kf+fqQYJvgFRwjsGIdf?=
 =?iso-8859-1?Q?HeXok3qKr+VcL/9Q4LrHC3+idmOc6wFp1QXWq5utA5v6frJZYSXFXKKbPh?=
 =?iso-8859-1?Q?LF4l7wLIfrwYE6peQDfKICxTsoKsWDReciOEwUrMp3E3iUoYwpiEImIesy?=
 =?iso-8859-1?Q?WFpEw66l57BA4JAAPlC1RexQ9D+VMxUgvmx+r4hVY1Afgq6EKLTaqzqLKK?=
 =?iso-8859-1?Q?ZOoOgVcTk426FHTnyt88kuGEZIO3UwZy+OcrouCqN+8G0GvF+15yUwHBeW?=
 =?iso-8859-1?Q?UMY2Ugp94oFOqW09gleGgO6UXMqRGuxMU1cb2dTOjYn8SwCUUh8NcbOszK?=
 =?iso-8859-1?Q?UGETGIYiohkHkSSahnZg10j51DMMTZjXL8P9T1pFuFQKXioLAPutlf+eeS?=
 =?iso-8859-1?Q?ghRjM95XXnroqy6aNqxoaif761yzaSbee4mUyotpt9rzXY068QcrVH8Hn3?=
 =?iso-8859-1?Q?FaHG7K1/qVnHpxpakzXJ6PrLLm1Ojpnvgsilwn+iIzdwTrwN5IlWAviBeP?=
 =?iso-8859-1?Q?YJIQZ8bYREcef/PHnDWeB3JULz6iw2i0U8UMp5Hn+nBHSZSTgjr1NC5zl2?=
 =?iso-8859-1?Q?2DKC2DhQ0tzfOevpxHzHxh5c6GQxD/963JXBvL8BCn8FWwB6fwSJ8jDb8J?=
 =?iso-8859-1?Q?TMREJnCb981L8upD6qdRzRQQvO6o0/6nzDRsZNz2FLhHotjzA3itj8fLf4?=
 =?iso-8859-1?Q?PioR3sIGW5+AUEoO/TGLVMhe4y7izou+IrHFVV6flBYpa8sRw7MEmgK/w8?=
 =?iso-8859-1?Q?bagq4pDzca2DU1Swq25Bsxq13tnSpD+TjY0+lWfLpz7iwAtJIHL1DqemLX?=
 =?iso-8859-1?Q?vJW4DQEqN0w9TfkHt7itPC7bnCFMAjVt5PMw+YPmMwnv+vGIEihiXARv/g?=
 =?iso-8859-1?Q?d6sc0utdGGEdCxOJljtfGHBw/GxLOu4rrqLekWy3gjgs8tCVLjVP6jYTXc?=
 =?iso-8859-1?Q?dr4rkZIlWZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c13072-682c-4434-e3f4-08d92050f5c7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 14:17:14.6061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: toZoL6v/2IGmXYg7KZfrE8Wp2xzXdr9yZUIGr4C0aBBcvxKDRrViNl93eKCLVjly
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8949
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_071718_758504_F4AE0126 
X-CRM114-Status: GOOD (  62.91  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 21/05/26 09:41AM, Miquel Raynal wrote:
> Hi Han,
> =

> Han Xu <han.xu@nxp.com> wrote on Tue, 25 May 2021 14:13:08 -0500:
> =

> > On 21/05/23 07:44PM, Sean Nyekjaer wrote:
> > > On 22/05/2021 22.51, Han Xu wrote:  =

> > > > The code change updates the gpmi driver bch geometry settings, the =
NAND
> > > > chips required minimum ecc strength and step size will be the defau=
lt
> > > > value. It also proposes a new way to set bch geometry for large oob=
 NAND
> > > > and provides an option to keep the legacy bch geometry setting for
> > > > backward compatibility.  =

> > > =

> > > This will break all existing devicetree's. (this happened to us with =
the same style already merged u-boot patch)
> > >   =

> > > > =

> > > > - For the legacy bch geometry settings
> > > > The driver uses legacy bch geometry settings if explicitly enabled =
it in
> > > > DT with fsl, legacy-bch-geometry flag, or the NAND chips are too old
> > > > that do NOT provide any required ecc info.  =

> > > =

> > > NAND's are providing the minimum required ecc, the now legacy method
> > > actually gives more ecc bits and quite cheap when using hw ecc.
> > >   =

> > > > =

> > > > The legacy_set_geometry() sets the data chunk size(step_size) larger
> > > > than oob size to make sure BBM locates in data chunk, then set the
> > > > maximum ecc stength oob can hold. It always use unbalanced ECC layo=
ut,
> > > > which ecc0 will cover both meta and data0 chunk.
> > > > =

> > > > This algorithm can NOT provide strong enough ecc for some NAND chip=
s,
> > > > such as some 8K+744 MLC NAND. We still leave it here just for backw=
ard
> > > > compatibility and als for some quite old version NAND chips support=
. It
> > > > should be en/disabled in both u-boot and kernel at the same time.
> > > > =

> > > > - For the large oob bch geometry settings
> > > > This type of setting will be used for NAND chips, which oob size is
> > > > larger than 1024B OR NAND required step size is small than oob size,
> > > > the general idea is,
> > > > =

> > > >     1.Try all ECC strength from the minimum value required by NAND =
chip
> > > >       to the maximum one that works, any ECC makes the BBM locate in
> > > >       data chunk can be eligible.
> > > > =

> > > >     2.If none of them works, using separate ECC for meta, which wil=
l add
> > > >       one extra ecc with the same ECC strength as other data chunks.
> > > >       This extra ECC can guarantee BBM located in data chunk, also =
we
> > > >       need to check if oob can afford it.
> > > > =

> > > > - For all other common cases
> > > > set the bch geometry by chip required strength and step size, which=
 uses
> > > > the minimum ecc strength chip required.
> > > > =

> > > > Signed-off-by: Han Xu <han.xu@nxp.com>  =

> > > =

> > > One further point, u-boot older than v2020.04 will not be aligned wit=
h the way ecc bits is
> > > calculated with this patch applied(without the legacy option set).
> > > =

> > > It's quite a mess :/
> > > I would recommend to use the legacy mode as default, and add the new =
style as "modern" option.
> > > (Also in u-boot)
> > > =

> > > /Sean  =

> > =

> > =

> > Hi Sean,
> > =

> > I know this change brings mess but the legacy way is wrong. The way it =
determine
> > the data chunk size is arbitrary,
> =

> Yes, that's always the case: all default choices are arbitrary in the
> Linux kernel, there is actually a lot of logic provided by the core to
> handle that, unless the user requires something specific.
> =

> > take any 8K + 448 (not 744, typo in previous
> > comments) Micron NAND chips as example, the legacy way can only provide=
 16bit
> > ecc since data chunk size is set to 512B, but 24b/1K is required by NAN=
D chips.
> =

> This means a strength of 32 bits per kilobyte of data vs 24 bits per
> kilobyte.
> =

> > According to the A/B X/Y ecc requirement, this is not acceptable.
> =

> What you call the legacy way is even better, the only situation where
> it may be an issue is if the NAND chip does not feature enough OOB
> bytes to store the ECC codes, which does not seem to be your primary
> concern here.

Hi Miquel,

The legacy ecc strength is fine or even better by average, but it doesn't m=
eet
the requirement #2

(1) A / B >=3D X / Y
(2) A >=3D X

that's my primary concern.

> =

> > The new implementation might get weak ecc than legacy way in some cases=
 but it
> > is safety guaranteed.
> =

> What does "safety guaranteed" means?

set minimum ecc required by nand chip at least meet all requirements

> =

> > This reminds me the gpmi raw access mode changes in kernel 3.19, it als=
o changes
> > the driver behaviors and makes totally different output compared with o=
lder
> > versions. I know changes bring mess but we have to accept it at some po=
int
> > rather than keep compromising to the wrong way.
> =

> How is this an argument? I am usually in favor of moving forward when
> there is a real justification, but this does not seem the case, unless
> I am understanding it all the wrong way.
> =

> > The change has been in NXP kernel fork for a while, so quite a few cust=
omers are
> > using this bch geometry settings. I hope it can be upstreamed, any othe=
r things
> > I can do may mitigate the imapact?
> =

> You are well aware of the upstreaming process, trying to merge
> something locally, making it used and then complaining because not
> upstreaming it would break your customers really is your own
> responsibility.

Sorry I understand I should try upstreaming it early, so I am still looking=
 for
a chance to avoid further divergence.

> =

> IMHO the solutions are:
> - the current (mainline) default will remain the standard for
>   geometries which are already widely supported
> - if there are new geometries that must be supported and do not fit
>   because of the "legacy" logic, then you may detect that and try
>   to fallback to the "modern" way of calculating the ECC
>   parameters (or even jump directly to the modern way if the geometry
>   really is not currently supported officially)
> - if your customers want a specific chunk size/strength when
>   rebasing on top of a mainline kernel there are DT properties which do
>   that anyway
> - follow Sean advice: introduce a property requesting to use the
>   'modern' or 'legacy' logic (with a better name than modern) but first
>   check with Rob that this if valid.
> =

> Thanks,
> Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
