Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D524EC021A1
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 19:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIByQDeBvajZg2cdgQSzvfvYcfqWdpJ2XPh3HH0GvKw=; b=UWygyf2J0m9qvf
	X7O312IN5kIBHmKGoUFA0vjrTWiuKl54M9ITRirPYaKSOAb13Pn8p7xwW7YI1byzmO/hNW6NOiUow
	az2mgZ3pAWxrNkMPQnsM/aOy998EyS/QgYCazkNEyB8WxGR0xHeVNL1FURSBBQFD3jb1MwrQT9TcV
	rxO5Sz+2phQEgtQwDNfXSqLvh98F0WGvxYIIpx3XiFZj+SB9tIy9p4qsrxgmdfXilxLC/bqcPtTfn
	2umxZSRDDo8Lz2As/0cnHJAe5MVyRM4v2VP0KvVcuXt5zI8C7hns8yNr1CfHOAJCZGJRbYVbQOVNw
	CQ7WIJpl7WNGZV/umDfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZm6-00000001DWH-1vv2;
	Mon, 10 Feb 2025 19:48:58 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thZin-00000001CSF-0p4p
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 19:45:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+fEP7mjTxdd95p+nB3HdlEwxToSk11GZGElidlQUG2p+GzLvT7lj00Z3QKgdhjUFHS9fuy3sf9GefSP4XIRZ3jYCBBKe++qi0qlYOBy5c2HDbJIZoRNThBL9lGMXaBaxUfN+mJhsj2xmnmSL68/ohw6h4MihqR9rGkXgKpJ9TNdLWJkTt7kV1TCZ5JXBDjNEbgQRTcJNnaQq4R+l7SRWFJgSNgRpSJecI5vLvJYnLzqYUeT1gayunZugVYAJcIncm7sgqNCmkZ+rNKe0/W6sOCtaQLVwBW+O6+w9+Y5nqGf4b8VGbO6lfIvVuSGB/OF9wbsuAh99ja7nMnK1S+JOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aX2BcB6vOf9Wjj1gND2dqNRqbtLNxQeSnELHYRej1o=;
 b=BZ9PS7E5rl5xVBcbzponjBlOpOT7Hih954j+EPYilLeflDaTqdGw1bicR/FNzKYkeuNSud1gevaHNtTrebfLP4HvbTvigpMMUMHqVheRI6X7UJWxJfZHzG2V6AUBW77kOSBw0dvZ3G+HWE3FvWWZSAQ+4rgxMeBDfS3UKXc4PJo68Rm9dta5iTZztddIvxaJBa7rz0yHxIr46YYZV+Oio26uGMfnTCn1wKntqeLiiJVREpYNF3xml1rx38yMhqDMRDbwhLkIjEUBpKuJm8dZIagsUPCq3GItk3gwYOfqSnjAZxrTshmfmFpUr71PUvHtolUgd43SDJX0U6VMtdsNAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aX2BcB6vOf9Wjj1gND2dqNRqbtLNxQeSnELHYRej1o=;
 b=P8+G2Bln3Pfl49QAS/xIJmgxv2zrm2Y5ohSAdyv7BQ7k/3o2QshKLDVIPG5B2xuU5CbRFmRi2/e8kES0nR+fwymg7dT3td24garKxLJkoQnHpx1z6bOqUO0GbUnfjN8eL3qi1V8lDBFYoFIvjhugGBVNwAKxivbr3phvvbq/dI5/hseNPGcJN2QqghUkOaXLBaOWfBKJo3MUwlLnlJOiLP2Mr4JXLc+nAW0yFEaz/hEA2Nmw57WrVwoquv9POcul0O7bh2mwxC8Y6cQcC5VKMIRPXzLAdsD+ESuSx3ekTdfpAjSOFTqqzhXd9+NW2CsgsuZv+qhXo3lPA9XADFBT9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9188.eurprd04.prod.outlook.com (2603:10a6:102:222::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 19:45:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 19:45:26 +0000
Date: Mon, 10 Feb 2025 14:45:13 -0500
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
Subject: Re: [PATCH v2 10/12] dt-bindings: memory-controllers: Add
 fsl,elbc-gpcm-uio
Message-ID: <Z6pXSWQdJCS9ZXOJ@lizhi-Precision-Tower-5810>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-10-8137b0c42526@posteo.net>
Content-Disposition: inline
In-Reply-To: <20250207-ppcyaml-v2-10-8137b0c42526@posteo.net>
X-ClientProxiedBy: SJ0PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: fdee1320-6ba8-448d-0f26-08dd4a0b7754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4QjY1hyObPLlvaBs6t48H4sNS+qTHI4vYnEVHFJUi4vbjH/lXu0f3d+sgM?=
 =?iso-8859-1?Q?abfSFtMbZ6XBfMCNGYDwP7xSMwbU2ueM0L+RjmgzD7WSLeDNGi7veEMf44?=
 =?iso-8859-1?Q?Cy58r3gQPVC/IAY6S9b0BWQ67GSgGpdstrh2s8D+JjMD3Y+kJBG3Z3D5Z/?=
 =?iso-8859-1?Q?racZo/1xESrou9XHD79GjcpS4xm21vpRtryu/67txFGwR+Cl0G/Mua6C4K?=
 =?iso-8859-1?Q?ULYnB8GX90XuTbuBl3txjgmZc3ZCicvwzIyHeGWI99ogltrlYIWaD83leN?=
 =?iso-8859-1?Q?Zo68agg3qfirzqNW3f2xmy31YPEbs2A2XOGhWJ1lAvM020FYPFbyr2XhVu?=
 =?iso-8859-1?Q?gjZFGxnopTky6YHT7bDuYq+msNzkOMXxqG/MaYt5BG02bcUpq5BlOcStKz?=
 =?iso-8859-1?Q?zkx5LyEBToLZS5HpWv6X5F5qnjGPSDaT9I262SWx6TZz4Sd/UReCFBjBe2?=
 =?iso-8859-1?Q?SN38YThogn1T3tBg2zhrOMFa2rOqjquklym4WZnTdeCVVvzlCvUz6lNR3/?=
 =?iso-8859-1?Q?7dSXIUyG8IQDkcgEMuwbSIe+klWB7/PrndjzjH8oHX5L7NPMUSnpPtiK4o?=
 =?iso-8859-1?Q?QUUTJh2fzO/+y34DrUrBvRx5OMOqUOcHM2WuLlvARtNtlasRIoRS79ELEe?=
 =?iso-8859-1?Q?LuNIVNQqOkNzXEYWhFHcyHrAPyfR8dinvmfgvSP2L2DzGF7bVjzfXNLF6v?=
 =?iso-8859-1?Q?WjDBKrrNJQ8tHogs72SsHgpo3IxOWFhEm5/AdrD00ETYgLu5tk4DGrBXeU?=
 =?iso-8859-1?Q?p7v+qEkuZyQFori3YNL1nJmRdmKLiBdegtur8vu3zFHGRmnF2w4a/BA/LY?=
 =?iso-8859-1?Q?AaNxinfejmpymN6hODheSphkX074cBuGfNRHGQ612DCeWAQ8QloS5QqFrt?=
 =?iso-8859-1?Q?Km8/zgfmELtMLsbwJVrsGrLDODW+2gMC20NF0YqR/l4rGVjOrNxUeENdu8?=
 =?iso-8859-1?Q?NwUplKh8WAU/eO1IoHi1IVdaS4aDomRT3p+gU0DYgq+on+yDf59dl/jfnS?=
 =?iso-8859-1?Q?pSh1ZjdQ7JuUTvbjT6QSPXxuq9alSe8IQ+4/IaWV3+SY1LS+Wy+TNjJ0YD?=
 =?iso-8859-1?Q?hrLFmwiDaILXGyGQZOPMRz9MX3+WQAoZKtVJY/DyUBv05xgL+rZaph7+b5?=
 =?iso-8859-1?Q?keJwK0ISzyREUkwdNt/HUC2hV8MgoC14jXZ96Y6jRtkmhIUa2NoVAuC6Ei?=
 =?iso-8859-1?Q?WERCeP3OrDxe4eUkP/4Bm7ywLL9H2cyFUy78MNidg/QnDq8lz43lliz5ml?=
 =?iso-8859-1?Q?OK3+Z9VG1PhTueoPDtjFAtWfR4Yf1gSATQNvawZx5UD07VtFTIbHnfBUZF?=
 =?iso-8859-1?Q?L5QMfm49g3n/3sEKtJrkfKfQtiUCizUGhOvZ8lQ7iunNzFtZfguANG3W4q?=
 =?iso-8859-1?Q?j8YwkeBmAwVmowhiYcUvpLMLiaWdZ420k1pno+BDkfMXT1ojb/mAi/kf8X?=
 =?iso-8859-1?Q?S3IYcWUKcI3ugQGK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sknx/ZsI+MBUeoj1xnGP4b5AJhmFFmKM07GGvsi/MgOJdo+zLVSPwcKVMR?=
 =?iso-8859-1?Q?9C7j2gGdFTDXcZ50bK2g7YHU6avoflBKDyjRuKydYcdgebVy3PnUzI7aO4?=
 =?iso-8859-1?Q?HIRhdToCx9nhyPZ+4oyn7yt6HXJM16L1NFrvN2Wvsbf2hotAHH1orRLdVS?=
 =?iso-8859-1?Q?HhhKEWo+cXXD/ZXoDdex24O/dK+gFOqwc2rI6x0jnsjl32zBbW+vXnfo4J?=
 =?iso-8859-1?Q?81F7wrK2gbZnr/YV16ZdGG7D3I0Yz88Y7y31uHROa7SYV3zoBPOVNb47O9?=
 =?iso-8859-1?Q?gHBPTKuOZgjqCdjvwie8IpcDJzIaGX6RjpywW/CO8u+mo0xKm4bFyE7sDe?=
 =?iso-8859-1?Q?oOyNcqpP9UGg3AaG4j/uTS8kx2sFwJIBqDMWtlB4pUUneL+D6GxNzl1Fto?=
 =?iso-8859-1?Q?fmMA4lnYsxlFXGTG/ErjY7WjXep++LZ8au1Vl87M8CZk8Fro+/sRvkipzR?=
 =?iso-8859-1?Q?cxGkWFaM4xvD/iYtLLIJU2bbG77pxl15CP1vk+ZVaDcUAT8tW9pRvrWMqA?=
 =?iso-8859-1?Q?xvjtqdosw7ki+4rwbvcUqlcL0mCqZAf9B1y33WHi4GGn1+FYn9knwMFz5O?=
 =?iso-8859-1?Q?/oUAJ4lKQ3Bnm0UW9PGJW/bPV/7Hw6xCVLwtgfwNml7rzEF2OnmzdJW94z?=
 =?iso-8859-1?Q?xA37YIQJtqi7RFcfG3havpMLBCoA3egi4P6GgX0APNzBGWaLut6RAjdpK1?=
 =?iso-8859-1?Q?5v8iYX8IE6I3uoAPSK+QdwJQ4//DLw8uA+TvPwFx7he+cYzfV88YXdtfHF?=
 =?iso-8859-1?Q?7xPn88vbFJwGLB96lpxIgPj7QyA1PadDc+9dmlkQ25PDoAjPwdECcv4l3k?=
 =?iso-8859-1?Q?atXaX0wlkbQwl4BBeNm9d5yhasFzq+Qv/DQDnCWyGXxPUqaYWansXxiC2j?=
 =?iso-8859-1?Q?FYfxofC7XM6rpFSWIvjnsLcqxR7XTmPKaS7xMITB2jGeZTAl1OHunG+0TU?=
 =?iso-8859-1?Q?sB6TYmlSBKSol0OWTEJFb+du4iGYHNTLMabUt9wrs4JyysQv4thvqtDCax?=
 =?iso-8859-1?Q?7FolNqqo7gfFb17b7e1K3MTirpVRIe95RyOdYnC4E5y5Uuq90OT6eAc9iz?=
 =?iso-8859-1?Q?ilnV1MZtMnC+ZYdbR+30o3LACHkgrNssfq9m7DiWFL4Rm1XGNu1BUOAT0/?=
 =?iso-8859-1?Q?wKM9Tnyv9taXBHv+MT4ZP1pSZLowWtLyIiKAoxzhZMqBuYpJo5Q+3c8D9L?=
 =?iso-8859-1?Q?dqI08Wk5TubU48AT18V7OwYO8/4X56ncUExzMwRl8wKO5lJYX6vck/eYx6?=
 =?iso-8859-1?Q?w2CAdy220x+8E/Sp7HH/1BskLE/zebf5KufIPcLl0rK6FotwYQ3G+sP8Y5?=
 =?iso-8859-1?Q?V6r2hynhPFT3TUKu04j61oOLO/M2jUJHRe14+xDGBwfejI52yx4jsnZSPi?=
 =?iso-8859-1?Q?jz7av8iLv4c6uiM+r7J+vf1NpNYiMZezd8VjdKG54Nm6f8YHIWWo8ko0ZR?=
 =?iso-8859-1?Q?w5teRuQAPJ5YBwq6eORtmFnwN2ObE33lLMM7ulPuSRmDSsZmnCzCDTB7Xx?=
 =?iso-8859-1?Q?HaY68gAmHTnKg5HGyCtbDvw7aYlY97D1CYwU8noSTrS2wZ5pbpl7+Sfuco?=
 =?iso-8859-1?Q?KFM8PkfXF3OuZ0h4k/lHQ+dybMMh6ldTyyX23N579CC/TjVpX/gJ0k58kM?=
 =?iso-8859-1?Q?+wSrhZSzE5Tz0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdee1320-6ba8-448d-0f26-08dd4a0b7754
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:45:26.6262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bmx/MP5c9XuR3qR/gzCItCtgFZCznQqPmfPISeSr+6C8SwuboaKLOy2wUDjdrq8nn8h94UdE/9L4YKyU/IH4Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_114533_235452_F5ACD1FC 
X-CRM114-Status: GOOD (  20.04  )
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

On Fri, Feb 07, 2025 at 10:30:27PM +0100, J. Neusch=E4fer via B4 Relay wrot=
e:
> From: "J. Neusch=E4fer" <j.ne@posteo.net>
>
> Formalize the binding already supported by the uio_fsl_elbc_gpcm.c
> driver.
>
> Signed-off-by: J. Neusch=E4fer <j.ne@posteo.net>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>
> V2:
> - split out from fsl,elbc patch
> - add description
> - remove "device_type" property
> - move to bindings/memory-controllers
> ---
>  .../memory-controllers/fsl,elbc-gpcm-uio.yaml      | 59 ++++++++++++++++=
++++++
>  1 file changed, 59 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl,elb=
c-gpcm-uio.yaml b/Documentation/devicetree/bindings/memory-controllers/fsl,=
elbc-gpcm-uio.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..381584b400a0ad98c6d9e0b38=
f2877d44603ed84
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/fsl,elbc-gpcm-=
uio.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/fsl,elbc-gpcm-uio.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Userspace I/O interface for Freescale eLBC devices
> +
> +description:
> +  The Freescale Enhanced Local Bus controller (eLBC) supports flexible a=
ccess
> +  to memory devices, through the General-Purpose Chip-select Machine (GP=
CM).
> +  The purpose of this binding is to designate devices attached to eLBC/G=
PMC for
> +  use by userspace.
> +
> +maintainers:
> +  - J. Neusch=E4fer <j.ne@posteo.net>
> +
> +properties:
> +  compatible:
> +    const: fsl,elbc-gpcm-uio
> +
> +  reg:
> +    maxItems: 1
> +
> +  elbc-gpcm-br:
> +    description: Base Register (BR) value to set
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  elbc-gpcm-or:
> +    description: Option Register (OR) value to set
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  uio_name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +required:
> +  - compatible
> +  - reg
> +  - elbc-gpcm-br
> +  - elbc-gpcm-or
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    localbus {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <1>;
> +
> +        simple-periph@2,0 {
> +            compatible =3D "fsl,elbc-gpcm-uio";
> +            reg =3D <0x2 0x0 0x10000>;
> +            elbc-gpcm-br =3D <0xfd810800>;
> +            elbc-gpcm-or =3D <0xffff09f7>;
> +        };
> +    };
>
> --
> 2.48.0.rc1.219.gb6b6757d772
>
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
