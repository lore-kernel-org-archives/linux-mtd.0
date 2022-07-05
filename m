Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC4BC43334
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 14:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7tjGmitJzIvbeOfby2XouhcQTsSjERXvuCkJURq4oQ=; b=UvdHLLApiKzMRX
	fslMSGw0x2awJBWQiCPooRoFySeIUS9X7ede2sWNa2ZZgjm1bzgn/69NIjn2K/h/AZh/XNXAgK7Gc
	oI9qAizSV5/MuBnSLiGTOkVpFGtobpmoUY6p5XF8eA36ane+StPOOf5nXUzIHietaQr/hS+92O5Kz
	bGF1q4IAoggBpTPT9i9F5I5PlNuTMTIClVDeirWOQQo2hcw7LRoXDrP5rWOfKagvPnN/ob1LqlbGl
	gHcA+xaylPeFvYffG5dWEsgayIJt3VecCsaTjpLCFzS5wtxFrMsTCsvfBhFMcIyK5+hl/cU78diF4
	WndRfxGD2chIgMOmK8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ja7-000pbh-F9; Tue, 05 Jul 2022 14:31:15 +0000
Received: from mail-eopbgr70081.outbound.protection.outlook.com ([40.107.7.81] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ja3-000pYn-SO; Tue, 05 Jul 2022 14:31:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsrmnRL17YVz4XtuRu3WIGlYhnuShpOSTiDAQxul1veo6zRUMTQkxDcygTsNnZBvKPJeneIPnKzLZ6DzaaztevVoKPsAjRZRX4pjY9+h+SnbGFv0GRVi7W3QwRsD5sQqz/59bwSx3OIoXXm8NaWjV8K/QPm4Otk6inU8eGh03zl6QsbI7avNC0vWFSp6ANgCK+0/s0Ens4tf1YY4+DdHZQcJu029NYZIRh+UXz2lfUfI8DjP3HdAEOkUGRuX39VcYZpLSUtjXXt7gn36zxQDOZgcebuLgi7IyNPWW5ue/FCeW1a7LehUgpK2cViSeowiFq7OO0AqJPh9TTOea/HGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGsMazPhNFLMMuStJlkFzTH9aGLRBUC4C1Tdwog5Y3c=;
 b=Y/EMJrM3k8Pf5qMVMDz2WbSoXeVcDPRBRG+PDJu8KKd71ke2wnANTd+JAlupuMk0NSZxBNESiw5GFZVzR4GFrL0hYoaBktF22V+LkZCjutxiiRWH/est9pcGyuEPh9DV3B20GLS410QoUrvK/jC9xT/ak2DZV4kImgTMbKq3ClZXmR7yKs7jhCjYQM4PVk2v+eWVCv/fLh+OWLLtmgbbNQnNLg/C/fWuC38YX+DELdg6ArYY6xs0qPMu7Z2Ll8RbX8iPLrQ1gTNsdV0/ebmw1pbtnt+WIDmtDfE5fmpa3hfunlxBLRYB+8Ps8Zf5bzlDTF3aNI4ujY6RnIASQSxblw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGsMazPhNFLMMuStJlkFzTH9aGLRBUC4C1Tdwog5Y3c=;
 b=ppVgW4BAPxYzBn0DL4s9AuMdno/hf5wTcuqL8KlxiocQNZ9JMRfbHHd5EWAl9d3UDMbiUnMzugC9rNL72aIY1sF9y7WLgrKQdGbLP+DlTD9rAmckKMslJWD549E4Suxekc7kZDeZKTTPkHYC6utTdCiUQooV2B55s6PNrpJRQu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by AM8PR04MB7857.eurprd04.prod.outlook.com (2603:10a6:20b:24e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 14:31:07 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::5c49:dd85:a8d0:2907]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::5c49:dd85:a8d0:2907%3]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 14:31:07 +0000
Date: Tue, 5 Jul 2022 09:31:00 -0500
From: Han Xu <han.xu@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bough Chen <haibo.chen@nxp.com>,
	"ashish.kumar@nxp.com" <ashish.kumar@nxp.com>,
	"yogeshgaur.83@gmail.com" <yogeshgaur.83@gmail.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"singh.kuldeep87k@gmail.com" <singh.kuldeep87k@gmail.com>,
	"tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
	"p.yadav@ti.com" <p.yadav@ti.com>,
	"michael@walle.cc" <michael@walle.cc>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"festevam@gmail.com" <festevam@gmail.com>,
	dl-linux-imx <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"zhengxunli@mxic.com.tw" <zhengxunli@mxic.com.tw>
Subject: Re: [PATCH 07/11] dt-bindings: spi: spi-nxp-fspi: add a new property
 nxp,fspi-dll-slvdly
Message-ID: <20220705143100.kkyjzllastptaoqe@umbrella>
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
 <1657012303-6464-7-git-send-email-haibo.chen@nxp.com>
 <ef676df1-77e0-b8ee-3950-97eade8ddd5b@linaro.org>
 <VI1PR04MB40167A70FBE772DF91047A4190819@VI1PR04MB4016.eurprd04.prod.outlook.com>
 <59d360ef-5374-c7a7-2995-854ab3715b25@linaro.org>
 <DU2PR04MB87747C9A8F18D8300461D6B197819@DU2PR04MB8774.eurprd04.prod.outlook.com>
 <f33ad190-f5c7-d9fa-088b-5538ab1f4d59@linaro.org>
 <DU2PR04MB877492F346BAA10B2AA7428497819@DU2PR04MB8774.eurprd04.prod.outlook.com>
 <777026d0-578c-500f-7da4-0e81fc211df2@linaro.org>
Content-Disposition: inline
In-Reply-To: <777026d0-578c-500f-7da4-0e81fc211df2@linaro.org>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: BYAPR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::30) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bdb9048-7fd6-48b7-1a3e-08da5e92ff71
X-MS-TrafficTypeDiagnostic: AM8PR04MB7857:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	CvDgr4uJ9dJ7aPQ9/9N1g+0HvDEUc3GU/dlEho7jul0FiZgKV9vFfRqt0rFUHpXfLNjkYH/mZS/acdQmJtzOXknv9PxiPYDfepRVcGR/vqDsnyl3g7XD/eETT20eKUhYbLd5JAXVUvOjZQSfLsi3oB1igriyIJ8S06ESXlHCunig8FZlruKpzUpWZZzvowGnPedkXIKicnaL9DJwjWzPt2PNcUw3KjPmgy1jaFy6laY/XLKOtjPngeUrhNG1nHuGluYGZhaFOvNupPfPDMl5bEIXyaYO1Gon3LhBTNwUvPnBnMeTAg1D4jX+Isbqs4PbciBQJa2hMzkZ8b6GNoe7D9y6RrdGisehiGF07onlqggjQIEeC1BXF9RUGVw1yOdkbjy7xkUcSGZ8mrnpx4rH4Gqo34WyuDoDmvwMieBOMncVDGeRL0E9tlXBy7rzSOQHWH/td/vBJ7uehfrLcKbQY65shvlnDZkZekjYuDPi07eqj/gQ9l2MoRMMRI0WrPqX4PMC7QHtN6npbEMKoposSf9eiGVCAioqAtJli2r9Q4sFHhKEdgXBoIfMZHOEgI8Jj8+GHoi/N2LUtvHjqc7XxXiLJK1NMUekpO3Cl+5LaVYSax/Tkf8XyYTp1zfoLYmefdpR6SIBgvtqJVF2GPSqmVL2MJRbnbxb8NeA1A2rz3m6ypejZE5GiK9jXxZg2lKpecbp1Dk7Euh+pmcqJQ6hQlQ7/qTxkwq4awBMyhvBFERSgOIBSzle8/9maZf9gZenPHx7Uv3oL9vVjP2jgaXz3gUpV5pM8oCHkkcoeZdEQVpe2kML7FPUDBoB3Ap8RUdD0MYvBUlPCvHtsSo9rIC7T+x5a/xmuM1SiulXY29Qgo4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(9686003)(6486002)(966005)(86362001)(53546011)(6512007)(26005)(316002)(33716001)(66946007)(66476007)(4326008)(8676002)(6666004)(45080400002)(6916009)(54906003)(478600001)(66556008)(52116002)(41300700001)(6506007)(186003)(1076003)(83380400001)(38350700002)(7416002)(8936002)(44832011)(2906002)(3716004)(38100700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?jYzRCuqIYCE7yp3AzYvFsqv4A3zNcjk9RCTTYAS6JFyVGgSGmcvUrFSrLr2Y?=
 =?us-ascii?Q?Y9nYoPrS9GMDfZo0BaOWJaFqf2hfskuMtXGFxIdbZ8i4Pai9JqafEs1yJOrM?=
 =?us-ascii?Q?xeuA3/GjFunJAhTXFys8jUEqS1WdtNBhb6UDHUeDAZGUvd8se5MRvdT5kFAA?=
 =?us-ascii?Q?au9SuP4UDZ67G4o56OKd0XefmG+e5jWjYU6LT28vSNRwx8KToxBiu8W/sVdT?=
 =?us-ascii?Q?iIk+nQJvaoDxVvPduusvwFUHIZN7Ocb/sv1EkSfPAcN3Z5DUgen5e/dLaF7y?=
 =?us-ascii?Q?v+YFuKilE9J9hohjEHSqjlZZmKY2wGfuFpHqdKM0KLMzWKUEPGi6QDoZ2Ged?=
 =?us-ascii?Q?LtLRsPJngp7dNVu3imTRw3MwNm0Yil0DWMwMmV0eoV4HMC3tbrHSL/AOj6/f?=
 =?us-ascii?Q?bCEtYAOdz/WaoxNXW/g41aUBHiXn56IPqY3vtE6SdNEQyOMb/Ifw4/jizS1L?=
 =?us-ascii?Q?U0N+D0YgGsKTyjUHlzhTaRqXvlJmYHp0ReRfBQnzMXQRrrwGjyBehVwrG0KX?=
 =?us-ascii?Q?nt7NMwSuT/Px0ZAi7N5dzHuy2bYz+CMxd2r5jLRmnICetcb+GtWJLYBNu2tZ?=
 =?us-ascii?Q?XCo3PjScPv5WCIi2dTNzCLtu4sOz8gVcAx7oplNt7zBjOOCa/1WSYx2sGknt?=
 =?us-ascii?Q?jlf/n2nGUOwAFDZT5wVdO5jJyBdFABXGuTnbxAQpSw24kyomZCBSo8FE8qHw?=
 =?us-ascii?Q?Pd8UUQjv8+D18hLv9Hr8h1VRjg6UbDp2WWluIkYPi0DVpcfoELJJZblmLbY9?=
 =?us-ascii?Q?GJpK+RLxycSGyfE1atJDa/6P2Wq8Iy13NplNG7E2cC5PiqZLhiCoqdTcVanL?=
 =?us-ascii?Q?JcFh9lqJZgN78fSZLPnfjKcmwpzm2XlIkreThJr0EApdR5tgLI/xIZTBAwhd?=
 =?us-ascii?Q?w+XDsX4BgMZiMJ2JWoLGqSAQFXQsTj6Vl8B7Wl9tFlh1AKLJF/QEDnTKgZOH?=
 =?us-ascii?Q?4DynhiApFWPUwjveAwu6aa5FLI3nnd5w3Y1D7z//VsH0MeerwHfT8p2DMOUt?=
 =?us-ascii?Q?OdTLNuBFAVJr6fwPe4w7Xu3nZrNHLIcdQ9XynEOEOKkl9GcaVhd8Gmu4oxOE?=
 =?us-ascii?Q?7G52Oy4iBYNvwUpqciazVJFaIy0Rn6fuAbvhb74M/3YKmlAgihG9PrHH/0ZQ?=
 =?us-ascii?Q?5TrNq+C0LlrhmmnxuujlmWXrfXi8pKN2rvKQHJRJw+Tc1yLBy5ktPzlt4X2Z?=
 =?us-ascii?Q?3CU35314gjNs7r7YyNHtdkBVH4187RiDrbeStGZSfRx08Tv1l7/lG/XUyYqf?=
 =?us-ascii?Q?25B3yzFyzf+6bMOsHrzIGbfKtTTRrxIiJFUIr4DX92ph9oix8H5fRSzgLhgz?=
 =?us-ascii?Q?g4Fhe6mHO2QEip+t8SlwYTcTQJJYvR9Rq+oTUUmXECe9kOhkTb80sv5ROwiU?=
 =?us-ascii?Q?nH3X0+RoNhxrIn0j33BlxmIes5v/3kc5AmQZP/aZiyDCdKVwN7ICbYwP+mUt?=
 =?us-ascii?Q?7kfTLp+khGS8ADoBVZV7O9U2UOoVRSyoq6rM1IfaiFqmTow2m76yCdPxQ0cH?=
 =?us-ascii?Q?B46W+2/vUj5ZD1f0TC2qXTZNvDP7nerrhIAPzSi0vJmNg6KZnvpSp7CNs/fm?=
 =?us-ascii?Q?oUbbHm1w2gGk0I+6HGHf7gCw2eHKkC4dARfVoqZy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdb9048-7fd6-48b7-1a3e-08da5e92ff71
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 14:31:07.4246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJ5zFiB35dBN/G9zDPAW8WSU+91C7cPyHzl5eggXO0APnAq2ytrCViFWGWTYVUmk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7857
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_073112_148685_8344E5E6 
X-CRM114-Status: GOOD (  17.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 22/07/05 04:03PM, Krzysztof Kozlowski wrote:
> On 05/07/2022 16:00, Han Xu wrote:
> >> So we probably misunderstood each other... looking at the driver it also explains
> >> the confusing. You encoded here register value which is pretty often wrong
> >> approach.
> >>
> >> This should be instead meaningful value for the user of the bindings, so usually
> >> using one of property units:
> >> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F&amp;data=05%7C01%7Chan.xu%40nxp.com%7C8b8e3e6291c24579020308da5e8f2916%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637926266207468995%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=KHgjKLX7M8CYfJoWqpVhNdZc%2FlZhZxp6CuaPTUYgwE8%3D&amp;reserved=0
> >> %2Fdevicetree-org%2Fdt-
> >> schema%2Fblob%2Fmain%2Fdtschema%2Fschemas%2Fproperty-
> >> units.yaml&amp;data=05%7C01%7Chan.xu%40nxp.com%7C0ffe3d706e064f14382
> >> 108da5e8a5add%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6379262
> >> 45564450475%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV
> >> 2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=Q4
> >> SfVnBN%2BQ0vYKJzRf%2FXZkCA1WGyPV9doFcb%2BLSKx4w%3D&amp;reserved=0
> >>
> >> I think you could use here clock cycles or clock phase, but then it has to be obvious
> >> it is that unit.
> > 
> > Hi Krzysztof, 
> > 
> > Let me clarify it, in the document a term "delay cell" was used to descript this register bit. 
> 
> Which document? The bindings (I cannot find it there)? Commit msg?

The SoC Reference Manual.

> 
> > Each delay cell equals "1/32 clock phase", so the unit of delay cell is clock phase. The value user need set in DT just number to define how many delay cells needed.
> 
> Your bindings did not say this at all.

I will explain all details in v2 patch.

> 
> Best regards,
> Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
