Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8222FC02198
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 19:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSiJr+HPO2Q7+LUyBWMzYMqVIh6NYv1i6dJeEOp0XVI=; b=hm7COaniZmm38h
	ksPxaRD1ngwrqiu6KnQ4XZ/EvVG1UmNlA3wMjLQIIfCH4GlVu0ouYL5VYfkuBLr9zzdfZT2WvJ8hr
	2tGWVeQqmizJW4nTENUvnsVEx8muOSxzTnhEzVysdeqaoJGHp2Y+XsXmbbVp2LT7Fv78b06EHL6UD
	l7c18dyQnw/CSl5Y0dMF/9IYQU6bbdTwy559L6H6uqksApgKW550b/o7dhOP3OllFLmxWuV/JGaNt
	yrhJ7xFWVBw+yrQqMAA0jEP80j6XQfmLdqNv8F/B4HdiO4871rOuFemGVFdt3l2aeTiUotkmmDKRv
	yGLwOUr7haq2lcSfMAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZcz-00000001A9r-3kCf;
	Mon, 10 Feb 2025 19:39:33 +0000
Received: from mail-am6eur05on2060d.outbound.protection.outlook.com ([2a01:111:f403:2612::60d] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thZcx-00000001A7P-0QVN
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 19:39:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAJpQ+2GjJJj0n1zqNUXSkOkUennzMxS6gF5iOgSLELEo2dDA+GqCsWyKBUBbvmjA+FosGF/mWshuMWARIIMpy+suK4MD6ZrB0+uABMy3ivSRVqZQ+3H+HVxS4GtrkleUel7puJ6/sIG7rOZYw4zqAuEWcrTp9zludI54JPuYMkeS5l9XSZy1dSK6ohqokcl9jvlV62A/7scoRkuGeEyGQgzzeF0PDcBXM0rHJWPZheG3sA0fsF9i1HFFy6GwfobHV4jUnqj4R7/Thc5Z95vAHXYUxOWJR5ytnzIFJZVkwS7awZMii1LeDNV6m6cXomKSnVEb6nv4WikPJ801rJHrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAmwXK8s2ViFQmlIUMzFtDUrgM6KezMlhSGOuLiVbQE=;
 b=pBKWSGke4Rez57EuVexYl14f/335/OO3qBheGPirbDVRC0zjI/eZvSUCjdeVJtNnIcLKbdXPMra8hNyWenWbp2Hl/fs0c5Gatnf+ucbt+cth7Y8D4Gq86w5pWlZ2jDCuAA2XeuH/8BIGc3l8TwRY17naw6kKq3JZK3R+c2CVHs23rsTRss4K3pAynutIytBz8C+GgKdez2LMAtko+GORTwBo2ol8NW55q6aQCxM6DhxmGr4PMOc+pkYrmY6YoVLg1yyJ//hGe3ySUTZZBQAWkhXnuN+rSyPYcmh2irG3trfcnQk1JuT2Qt1czCEFHFhmNjq2mb20j8NG2T8wI1AUnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAmwXK8s2ViFQmlIUMzFtDUrgM6KezMlhSGOuLiVbQE=;
 b=cVWl0KC+MxY1/HfspmyAtzgqj+yRGWu+dLLmZl3v/glIHoov1ulS8hjgD1UEA7APf2jxMuIbTcCKY42m5/Z5Wji72y3TwSWhvsg700iyqKKoH6VgtwFdZETvYAtelhNjds2wSu2yyCXnY3PL1JBQUcX2W6qm3F1SMBPXLTWDHxk5tsXMy02eCYXGcfm60ZfNgig5QrMUpMTaodQyuHY5uAIc8LUGtiZpA55aERFKVszIZQ49XvPlAe6CI5XPuYSMvAbbevXOG0/IQg6y6EN2D5k5i4Yjq4mFdI1WW52p/2yutSW8o7S3WkzKwAgwq4jrEHqORHMOOVgRrQBgMo9FnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8122.eurprd04.prod.outlook.com (2603:10a6:10:25d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 19:39:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 19:39:27 +0000
Date: Mon, 10 Feb 2025 14:39:13 -0500
From: Frank Li <Frank.li@nxp.com>
To: j.ne@posteo.net
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 05/12] dt-bindings: dma: Convert fsl,elo*-dma to YAML
Message-ID: <Z6pV4eauZj75+911@lizhi-Precision-Tower-5810>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-5-8137b0c42526@posteo.net>
Content-Disposition: inline
In-Reply-To: <20250207-ppcyaml-v2-5-8137b0c42526@posteo.net>
X-ClientProxiedBy: BY3PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a9a187b-6804-4a4d-74cc-08dd4a0aa174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Z13eRVXqqrGBb+B2ovc8EN0jGjelZdXbNvTd3IgA2CMlD8AYbXJByqwOVJ?=
 =?iso-8859-1?Q?RamfIeWgVCZTUreTLloUYwEECqlnZ9Y6Ww6uRNJEf2FgjVZw6NCaKjYPcO?=
 =?iso-8859-1?Q?HUf7yPNdSaGhsb2OxYA6UIFw8mF5c5RX5cAMEatUkICzpiKvW1OgXvW8T8?=
 =?iso-8859-1?Q?aM2wEvFJkBQiVHZHanzD0T/IDhX8A0P86HFhT/a7Vlj/kHTPqN1lEgBeYs?=
 =?iso-8859-1?Q?4rRasMFATgO8DedovYkDW8HoMhdTH6Zb2kJu/W/TCr5wGWpqJbIofLBcwy?=
 =?iso-8859-1?Q?UHqrJ1TE72zbyGJoIvv+y278a+Chc5hqtOhVL158haHGLXNXMffghimhZF?=
 =?iso-8859-1?Q?0q/Oo65O4ymQ78lFMnsxlNjwj+p2Q8GNJBdNpDJGOPfE4UaZzU/T4sV3DO?=
 =?iso-8859-1?Q?LGwna3THjdu+Zw62Im2tjio6xED0jZaTJ5jfnr6hJmpsP2I3Bv2sYQy1uB?=
 =?iso-8859-1?Q?VofFUYMhAJlPnnRAXLJO20ZxyjNyBBIjwQ7echfaURVCtqwONL38VyRijD?=
 =?iso-8859-1?Q?xUS13lGa1veA13mmj35d1FVw77Itk/thrlZGx4udG2qIYeTy52xOg0FGfi?=
 =?iso-8859-1?Q?ZCJblRTMJe086NrjF0mkHXdE2hVRe4CM0Nn179jxz9QUYfzwebIaqZaJXu?=
 =?iso-8859-1?Q?5C2LI4gSbXX5tzQFOOyKzjgKw7HfSurLZr6YpauH1J121UiFxdDuGmK7ka?=
 =?iso-8859-1?Q?FRjg4sSokGJ8AQKFroLWIKRkOJt6iYgDCdkmeLuIP2zeLY6QRAh2XJuvbC?=
 =?iso-8859-1?Q?uXv/1nGwyp4DInmmourPFyutcOZOEO8UoTvA+0PbZNt3zK2+Q6lkCLztpi?=
 =?iso-8859-1?Q?8o9wRlpm9giH5u/TvJlN+6+StBhZJIk7unTC4w45QP+Qfn/UUhCvLo9H4U?=
 =?iso-8859-1?Q?1x2q3FyzdoQfqug2QGMEinX5veHDHkSImBV92reNAh/p8HqzNkePSS/Oeo?=
 =?iso-8859-1?Q?o2bmJronNk8d+dbEO3kDTewa8wMJ0CugtNgWkigwTD/2BgnKgyMpyESmM5?=
 =?iso-8859-1?Q?W/bodeuy+R1Lq++Yf8S33CQetkdDTgDbKn26DXXmDJRocTmOty166MXV2f?=
 =?iso-8859-1?Q?4f/Tk26kp6Dd5xS1et0qZUN963y7Zd+OqbHzb1bdjd0OUe7Lr+uDJzuuhI?=
 =?iso-8859-1?Q?cR6hcXEBX2jUPR2uU/XE8L0A/Q/DeIbqDEZZP6bHs1sIeiWcKUVeWmk4vJ?=
 =?iso-8859-1?Q?Lhri6VM7OKfw4LJJcp5JTu7jxMyiAFdTKnu0d0EFJ3vBYtNWyGWBtV630V?=
 =?iso-8859-1?Q?RYH18Z2P/iM45dWu63R7mBGZlg9OgTd95Icrrr5p2IUJs0kEER/oJcu86L?=
 =?iso-8859-1?Q?eVvRxiaYqOVLShXTHjPE74Hz69Z2PXkovRyhMKYGGeUgmPVxEgW1qQ4Pli?=
 =?iso-8859-1?Q?aA3wBmKczUwgnUIY6xim2PKEd9JnAu/GJpxgJVE697ZzTYMnEsuJIN7u4N?=
 =?iso-8859-1?Q?WlnPX39oKeWynIRs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TiK1F3ZA+N7z3JvoR1KuSdRVEXOvU/UJMDIy/TP0gzVJ6g/1uKKNXQpk3r?=
 =?iso-8859-1?Q?AV8fM12AO/cmTdNl3DXf6CAhoGaNvx+RrQQAdN12CTKo/rwkJTO9m34aPR?=
 =?iso-8859-1?Q?AUCbYD/NVo+Bc8ftDkBuRKyPMANUtpH3FkQK1VMiycvAwRt1H0vMl13Rt8?=
 =?iso-8859-1?Q?bNWGmOKbJJSXIKY0Twj3fL5P7/u8IECvZSy6ixafcDLDoW31ka3hkfRdfV?=
 =?iso-8859-1?Q?qGvFYcWFeOQvlh2i8kcQrcY5KkFRpmNTc8Jfa3G7si34fbJIU7nfpSm8Xt?=
 =?iso-8859-1?Q?GplVeavAw5ws3Fyvt39hVj8cirbX46E6vnI1I4ZW5SVC3QLubkCEPn4jQh?=
 =?iso-8859-1?Q?v9IS0sFqGjv+23gtVn70YaRj9vN0h2jqN3UhwuDUASAxtwKIzGZsnzkmbw?=
 =?iso-8859-1?Q?gkws5rSe4dTluUggq39NoY8LNrgx3nonV0pwnox10Ce1vf2hRA/spEqgAD?=
 =?iso-8859-1?Q?w+Qh5UYkSCi1MHds4nub10JucRyHGXXsHRErgg0oKaDtevmW/NxZQ7PzxT?=
 =?iso-8859-1?Q?sFGJuIHbnx+OvvlbaliuIAelrvtJ2PaUV9EqXzfeZGnCTCJDy/iZHHTmsT?=
 =?iso-8859-1?Q?jSin9VHqqUgJZPBcaj0EQ5ACcwbKfzIemb0av8UphJIbNgLE6rNKRoid7I?=
 =?iso-8859-1?Q?0xVl6U0QA3BSttFG0yPF+FVl6Z+XZLArVxnlVdF3srMNfn6gvmwG+lwQHs?=
 =?iso-8859-1?Q?1CUynWnGTasB87TPvV39dj2bjWlsTzICgVvwwDpo06ekgxshcpF2fIdLKs?=
 =?iso-8859-1?Q?mVg2m1f4AAZPpxGwtO7aJZ/GaCgmb6bxxd/BjNjwHr0dzZZQcu2UUgjuPX?=
 =?iso-8859-1?Q?EsPNlT0OzRV8kCGcIAww1PGiVV17F+PvjlWTuJZqNDW2tDb1GXcXwYhAL+?=
 =?iso-8859-1?Q?Dk6o3jBWv8WqdCbCV3o5DgZ/6pL+8GldB+Q7qs6lgWeMmSK4kWjroKQ05E?=
 =?iso-8859-1?Q?/hPh/vGvceaXbodHPCucwR9bKwCNCcYqzRAhy6RdKP7rfZV0ICv1xX6ghq?=
 =?iso-8859-1?Q?/4Z14WXW3y3meRQ2wTw/5JtlQamzCpSNpNPOXbH7wsd3fTlxlZrRd7Bp+u?=
 =?iso-8859-1?Q?mvgV3+5R5vQle0oNGyFSF12I8AgfLsn8f/Zy041ITEgbNQgtRNCuGHgztr?=
 =?iso-8859-1?Q?xUnFTMls7ZU2T/o/ZaNixaabcSGiZR5U5l4cO/po9mM/TEWa6U5iKiOKEg?=
 =?iso-8859-1?Q?53xBgIOaN9IZ0ZT8ff1xKD41EQ7J0iByMzo4FRTCt7H3sGO6MZPfACrRHl?=
 =?iso-8859-1?Q?/aHdz4a2pIhQgveEOdfp7D+kNfwOJKw4Bg+bO6hjV5jq1bCuhcdOXo27H7?=
 =?iso-8859-1?Q?EEoQ6eWX3iF57L/k7BgniYVIotRgDeV3bpkdwZHVxX81h8bEs7hnhGnWIj?=
 =?iso-8859-1?Q?sL+PeKpUjYSDiAWHMWFTnBvqtqWOGLiREW4sIyh84uJsMntgnimzTuDkCg?=
 =?iso-8859-1?Q?6HUGNBqhdP8GREq/gRYt62fhjJHA5aAejaVv3c/e95fSPb89nM882I+yrG?=
 =?iso-8859-1?Q?FJYwajMLWHPPVlZMYC5MhD9ttoxA4vk+fiIzIH8fqmaeMsxEshSZ9g7CFP?=
 =?iso-8859-1?Q?gWa+N9NkvYkMJJNXqneRfat/m2hd8YSdBpp9gv+u08QqaNerLiOv7tdCQ2?=
 =?iso-8859-1?Q?rIQCGAYInqqUVKQTUfTXd3ryrWgpZDOqYZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9a187b-6804-4a4d-74cc-08dd4a0aa174
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:39:27.6968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDbOgUH1H2xht5eGoiMgguOU8McRyV34gRLpnvirib3HBnmLpZiZdB0dythALSMWC8oYrbMuh8ZsBgeCGfR04w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_113931_293871_F9C3D117 
X-CRM114-Status: GOOD (  23.64  )
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

On Fri, Feb 07, 2025 at 10:30:22PM +0100, J. Neusch=E4fer via B4 Relay wrot=
e:
> From: "J. Neusch=E4fer" <j.ne@posteo.net>
>
> The devicetree bindings for Freescale DMA engines have so far existed as
> a text file. This patch converts them to YAML, and specifies all the
> compatible strings currently in use in arch/powerpc/boot/dts.
>
> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>
> ---
>
> V2:
> - remove unnecessary multiline markers
> - fix additionalProperties to always be false
> - add description/maxItems to interrupts
> - add missing #address-cells/#size-cells properties
> - convert "Note on DMA channel compatible properties" to YAML by listing
>   fsl,ssi-dma-channel as a valid compatible value
> - fix property ordering in examples: compatible and reg come first
> - add missing newlines in examples
> - trim subject line (remove "bindings")
> ---
>  .../devicetree/bindings/dma/fsl,elo-dma.yaml       | 140 ++++++++++++++
>  .../devicetree/bindings/dma/fsl,elo3-dma.yaml      | 123 +++++++++++++
>  .../devicetree/bindings/dma/fsl,eloplus-dma.yaml   | 134 ++++++++++++++
>  .../devicetree/bindings/powerpc/fsl/dma.txt        | 204 ---------------=
------
>  4 files changed, 397 insertions(+), 204 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml b/Doc=
umentation/devicetree/bindings/dma/fsl,elo-dma.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3d8be9973fb98891a73cb701c=
1f983a63f444837
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl,elo-dma.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/fsl,elo-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Elo DMA Controller
> +
> +maintainers:
> +  - J. Neusch=E4fer <j.ne@posteo.net>
> +
> +description:
> +  This is a little-endian 4-channel DMA controller, used in Freescale mp=
c83xx
> +  series chips such as mpc8315, mpc8349, mpc8379 etc.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,mpc8313-dma
> +          - fsl,mpc8315-dma
> +          - fsl,mpc8323-dma
> +          - fsl,mpc8347-dma
> +          - fsl,mpc8349-dma
> +          - fsl,mpc8360-dma
> +          - fsl,mpc8377-dma
> +          - fsl,mpc8378-dma
> +          - fsl,mpc8379-dma
> +      - const: fsl,elo-dma
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      DMA General Status Register, i.e. DGSR which contains status for
> +      all the 4 DMA channels.

needn't maxItems
items:
  - description: DMA ...

> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Controller index. 0 for controller @ 0x8100.
> +
> +  ranges: true
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Controller interrupt.

Needn't description because no any additional informaiton.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  "^dma-channel@.*$":
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        oneOf:
> +          # native DMA channel
> +          - items:
> +              - enum:
> +                  - fsl,mpc8315-dma-channel
> +                  - fsl,mpc8323-dma-channel
> +                  - fsl,mpc8347-dma-channel
> +                  - fsl,mpc8349-dma-channel
> +                  - fsl,mpc8360-dma-channel
> +                  - fsl,mpc8377-dma-channel
> +                  - fsl,mpc8378-dma-channel
> +                  - fsl,mpc8379-dma-channel
> +              - const: fsl,elo-dma-channel
> +
> +          # audio DMA channel, see fsl,ssi.yaml
> +          - const: fsl,ssi-dma-channel
> +
> +      reg:
> +        maxItems: 1
> +
> +      cell-index:
> +        description: DMA channel index starts at 0.
> +
> +      interrupts:
> +        maxItems: 1
> +        description:
> +          Per-channel interrupt. Only necessary if no controller interru=
pt has
> +          been provided.
> +
> +additionalProperties: false

Need ref to dma-common.yaml?

> +
> +examples:
> +  - |
> +    dma@82a8 {
> +        compatible =3D "fsl,mpc8349-dma", "fsl,elo-dma";
> +        reg =3D <0x82a8 4>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        ranges =3D <0 0x8100 0x1a4>;
> +        interrupt-parent =3D <&ipic>;
> +        interrupts =3D <71 8>;
> +        cell-index =3D <0>;
> +
> +        dma-channel@0 {
> +            compatible =3D "fsl,mpc8349-dma-channel", "fsl,elo-dma-chann=
el";
> +            reg =3D <0 0x80>;
> +            cell-index =3D <0>;
> +            interrupt-parent =3D <&ipic>;
> +            interrupts =3D <71 8>;

'8',  use predefine MACRO for irq type.

Frank

> +        };
> +
> +        dma-channel@80 {
> +            compatible =3D "fsl,mpc8349-dma-channel", "fsl,elo-dma-chann=
el";
> +            reg =3D <0x80 0x80>;
> +            cell-index =3D <1>;
> +            interrupt-parent =3D <&ipic>;
> +            interrupts =3D <71 8>;
> +        };
> +
> +        dma-channel@100 {
> +            compatible =3D "fsl,mpc8349-dma-channel", "fsl,elo-dma-chann=
el";
> +            reg =3D <0x100 0x80>;
> +            cell-index =3D <2>;
> +            interrupt-parent =3D <&ipic>;
> +            interrupts =3D <71 8>;
> +        };
> +
> +        dma-channel@180 {
> +            compatible =3D "fsl,mpc8349-dma-channel", "fsl,elo-dma-chann=
el";
> +            reg =3D <0x180 0x80>;
> +            cell-index =3D <3>;
> +            interrupt-parent =3D <&ipic>;
> +            interrupts =3D <71 8>;
> +        };
> +    };
> +

...

> --
> 2.48.0.rc1.219.gb6b6757d772
>
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
