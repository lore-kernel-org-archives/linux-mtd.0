Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7CDCF9C69
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2024 21:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+HxMUiJZWOqD0nh4pEdxb50HSAtEJnLBkaaftMgdDk=; b=dlAIA6asOSUY8q
	I3IXB8itgq3zTIrLByFCn4+MbinrmjWvK3htJ0NWz/r1BlhGTLnnf5sfBwirKN+78dyZzD6zQH9l7
	egSnl0FdrWQj4Vuo2T22WxN6VNIXI/wZKlFAggte5iBfj7J18WFP3SJFCJF7lb6rqb4hrQTQm51NK
	YzbpLnCqSFokbQT6TryZtZL73TxuSi+S/zj4LOnqCKAHs1Mwrvxzyf/mAnEI5pPpiCpxgnOAY41We
	tajNkWCQa5Y8MSP/EEii6Xbw/8fCatSCkkAMdlEudN+Z4h1jp9WuzOKVDl1mXP8NNJD9DmQyrKYb1
	2jnxt6pxY0f++aKuOCxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srlMp-0000000Cy6b-0jLS;
	Fri, 20 Sep 2024 21:40:43 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srlMm-0000000Cy5s-1lue;
	Fri, 20 Sep 2024 21:40:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wk8Oh/yNceRwdQsZYZ7ImKJqCsWEAT07gK1j30R2hWazDmgcEFxNnDuQZVb9HPiNDanuUM5+hHeSkTqaB+U51S/rxN/FHcoy3u6yuGkctyXC/1uxJjc4xZkq1+O2hK2zyXgKEJQGYc3Yl0g25jdbJ6DBjjNkLHZrFbnCzsgkdQRhpvM1A+VzRAK+IJXNJyC6mIT9Xu/c49gfGfjcq94rSO0Q1C030zBgwPAro6Qcs4pEwsafl7ZeSfg0P+Kwh0wqieJivvlvYFeqHhoNCUpmwEM78lkqSouToa4KFrsbIcwfsHJ6uNe5bIegtTqP8Y3BftpeGyrLmljLIhN5D2ke1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKIkrTyzfHNQ//U4uk35K5Cp51nMNsuuWNejGC6Fd+w=;
 b=tdd6eMV6Iv5OLPnQZ0dy74lFXKDoxSj8XV0Af0XN62fU4CS3fi9Y6xV3yhsgamfWA7IE65VkMQDrjmy0WTVPySUBdi2u8xWBtm1g7bmmVBqdUdH9D89IM1udV4LPuCptv+fV/cKHkck3xFjYGbpkPC6SEm+yEjuJccZ9I5yvzXh1aN09Jio/j5cvVu2u2/UNCMa3Np665DZrGwjh8U/t75PicUV9LsFUg5leu18v5IbVpQaFRDOw64WNf7MNAC2kyNbQgMqS+oJeiLvAcYpGXSsT7fikxm/cKulz3i9+oRQadWqojtYHzrU9grS3xUOlloL0H62PHKPDtJlNtrb2Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKIkrTyzfHNQ//U4uk35K5Cp51nMNsuuWNejGC6Fd+w=;
 b=PCrgdGG9nlZMGMrSPlJ3Bn42k6+Pqtx5lh1esitKcbblRS6neRviTbem7Y/BJzaE/0D9qs04vEja9/1oNlSEK1dT8hs619eZVnHoG4NRyfyUDwhALX5CzJ+ALlOg2YXhUQUmn079REts+ozbSeIsGg4LSgS2JjlGqob7HyXIjE0Nm7d/3jZrnwMkjECkz2JfNeZIK7xhOe3+KKwWOk1aP6He1r+z44SZhx4olNicykOtYAiMpF8FEhXjcRIcoOk/SvJ69nA3UDQ8l4t92lkfA79TCZwnkakI1IGUTQi0HTic55qvm1YmnrwopS29r9ImPFc4KfS2UiX6VPoQGFkzdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB9735.eurprd04.prod.outlook.com (2603:10a6:150:118::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 21:40:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 21:40:25 +0000
Date: Fri, 20 Sep 2024 17:40:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: support vcc-supply regulator
Message-ID: <Zu3rv99P6zFnUhYe@lizhi-Precision-Tower-5810>
References: <20240920-spi-v1-0-97f220c2e10c@nxp.com>
 <20240920-spi-v1-2-97f220c2e10c@nxp.com>
Content-Disposition: inline
In-Reply-To: <20240920-spi-v1-2-97f220c2e10c@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB9735:EE_
X-MS-Office365-Filtering-Correlation-Id: 64243d62-50ec-492d-9582-08dcd9bcd68c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XzrWdaMpIjrVvqhyvNXs/XbV4uAaA+e44oH/qnAFFbjLQL/X7+ihNBdHFvEf?=
 =?us-ascii?Q?50W2J9E8rB+jYTXPYkleYwWmDK+ihKD99T7OKIRDbVT8zxWgIgVhDeT5nTOr?=
 =?us-ascii?Q?/lw8dGYs32VFkwi7rg5gLkCV0cyAR1RIVkDDAwNWfs8IM3vimc68HbrMpzVQ?=
 =?us-ascii?Q?U7BGQaVCUTH1SSj6fEeL6rUf0al/V3b5PfpK+wS0SG7h4UObEoSv55A0okBr?=
 =?us-ascii?Q?dtFqtZEQQGxigL1Bi3G4PjcCHgpsLti5pJhS90DjIdCMp0UiiweYlbo9rX41?=
 =?us-ascii?Q?phzt3vTNT4oNMempT+digDM1H0Jf2O+k6Tn8aCzz/mx67qcjJBT234Ckiq8y?=
 =?us-ascii?Q?ZyH4/A31qMxrb2yRT1kMkKZzIF4YkuTlboMTGo3KX84wMGiU3qHSB1ooXwUQ?=
 =?us-ascii?Q?s1dfo7X/+55A9iSX3/zfFWw/rHxWFun+/6jYRVN3CRzAYAXe0EmTX7LXP2mk?=
 =?us-ascii?Q?w4rJq0uHmrpmXdahfm6AJeiEHSKLnLwmnuZ7Kc8EWo9ItkVmNwLGdNb6ti+U?=
 =?us-ascii?Q?U40W4ltha6Ni/IevcbN0R8G0hq0UpmaTVw3F4yGXAvFD9NyrkMxj1NGQAG3z?=
 =?us-ascii?Q?/C/xjXpqW5pSq8mlFP4jM6an+4Jhei2sOHDEkmEUml8YSaTbAAfrFBqHzGaO?=
 =?us-ascii?Q?85T6baL4P6xoQYV9u1uSudipdK3xW/XDWNlqt8zMds4m9GiCSDmqMG/6J+yA?=
 =?us-ascii?Q?Tjj7LxOviNGW8KVKSkqNitK2w+65B4SXyIJZM41l8aeKPWqg0858wxy3Xes7?=
 =?us-ascii?Q?ww7KT/xjj267PQtDdciBjuvhVVo0/o04eosHbTPDd/KNU56Sn292Yb6n1cY5?=
 =?us-ascii?Q?EaLoQ2Ccpw7aihPjvAUHL5Id35IpNbnjXsyTZkEKJtdpfvs+z5XfslTrBJpr?=
 =?us-ascii?Q?pdtEve1oK/ENbbeQ8t7cHMaflFFO0BdDlSNAZ9oGRvWtdOMsFmlroQ3T0bhm?=
 =?us-ascii?Q?CneIZTtCTqeml//ik622AHFjEbM0wNGrOlazG5KtrLtNCYJqlCxXDyaLwv6r?=
 =?us-ascii?Q?Cz18PJKr2W08HCHVNahiJ2n2cQ2DqT9GFGLKiTCnJQ+Ulg8MlhS6Nw6t7C3i?=
 =?us-ascii?Q?TSjvLOAzAiWnw6RsrCw7Q45uCNJW9BpT4t03p9PfSwqbfvT7xEYvrHUKoZBe?=
 =?us-ascii?Q?1agVG8byewTwHVuLoULxDGK//XmA2fqvS4wBg5GVBLf6G3tK28iKu17Fs4+s?=
 =?us-ascii?Q?TAzwZ58mP3Lh22fFbDhuUlObHN/YqYMlL5aps+82uhZFy+c9bV3CnLCxnng2?=
 =?us-ascii?Q?ahuajbuXuqFeRw9d8W0CKIB5X1iPiWvdBd5DAGVR8pGi3FVvnd4CCGqQz0UK?=
 =?us-ascii?Q?ikRdjbmJAjDhuwwcXz9OMQdvFV76KOncUaTsxGapmAtTnDoORyrZnEYOReQu?=
 =?us-ascii?Q?2mfjkKZRAhP775w22IZDaaeA2HnCWXWmyPEYAX+e5++xBEXeCg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uVtckTF2GOOr+9DbNWKnzB8r/Rd0Ya4lHlO3uBtUY3QnoQN2OrgffdT44BXZ?=
 =?us-ascii?Q?b9JdA7WpeLNFdHO4zmnHPAPJ/0INDavJj1FnzROxNonC00ba6hWjlNTJeu7s?=
 =?us-ascii?Q?n8v4Zoc4XXer2U3caHHrDBrls57kUDEhfl6sbxfUDfWF3JI+O3qD6cOuozd5?=
 =?us-ascii?Q?hYR2xDJdVDIGzNk9o4gY+31jREbqMyVGYnPODgQotksQpQJe/gadwhijAClZ?=
 =?us-ascii?Q?Fhudf7aQZ7wVpA74qJTxg2s1T4wOZwxfOMZ15sBBWIiIMa+Uw0yMOluJK8qq?=
 =?us-ascii?Q?CmejY9jPbdnyQc+spJN3JUc/4T9EbwFbejqT7flMqWNX/LHZODYAuz6w/JyT?=
 =?us-ascii?Q?KzxxlAphHb+ZLnr5qVqt6702UlwsEKvQTGQ8j2sV/87CmwM5JqMeH2cHJb6+?=
 =?us-ascii?Q?2uJvAKM40dRR0hGSJKeyxHilpZCOUYciM/stCVH8l3BiWm4c4Ov3s7slIgQG?=
 =?us-ascii?Q?uDQLSE80WkFvblq52NL96v4EkvRv0JmTBoBFXqaUHWZaLl50aiD/4s/GG14W?=
 =?us-ascii?Q?lNv+Kpa4ulMnYpaeoZEg3Eaum2yRR6JT0joNiNCJBznyGbmDYK2SCQtGjdry?=
 =?us-ascii?Q?tKowRwFsWMZiCKPcFoMLanfyaxPKKnJbriDoOLo07AtGJGZfvR3NXuMCiygK?=
 =?us-ascii?Q?B6tRrvo8qPWMY6CcfYALCJ/TVO5455ZzULPS/xYQtbdSM7EJuz1C4KCqcDZc?=
 =?us-ascii?Q?3/7hefGEFQIIPkJ2IgFasepku9Xu0Aii+EZNUNkSySsLdNRaD5q1jaCtzs35?=
 =?us-ascii?Q?moMQZEh4N9fzR9XwcbTsRURCkaraB54X4oFlWnouiTtMYb6MBjKLkokBzEG3?=
 =?us-ascii?Q?l7tkSO70KI0y7rC9035c67bH3hukZiCk14LXC4zRaRCRo0r/H2ppJ5qweRCE?=
 =?us-ascii?Q?3lFBxSe+08/7B8hXOYui5Cxe1PH8ve/R4oKbbDdX4gryb/Nli+yyB/3SuH2g?=
 =?us-ascii?Q?uXvAkz3Aqbfqir1PT8WWj1kXunuA4qUgp5gcp+Kqd7ftXwFrQ87m4ktzdJJf?=
 =?us-ascii?Q?fVsWLL+2w2qjx0G8x9Il7kiagoQTd7JVu695EogOqLNSlXIs+w/DkGWqJIuB?=
 =?us-ascii?Q?2zmveBtkPB5eO4GLk1Z6fCzHoeuUJm4owJ2OkKRbPqkAhnic7szMO/6T5XsO?=
 =?us-ascii?Q?bkxfv8ksg3zGIHKGWdWz4wGmc94NyvoSNYaLerQPCAtn6AxQdADTxsa1vnqD?=
 =?us-ascii?Q?V2RiJ2D47o5yvAFRinof3rYgTTsou2qIBz4fIyaK21S7wyr6v/CBdYWvTOQp?=
 =?us-ascii?Q?Kzl36svyC43guJBvTXycV8RvIWQuJU3EtMWd9gh3uf/uHZOoLRh8bulxmxW3?=
 =?us-ascii?Q?RATnvxSv7S92/AOCxeF+2213BxeKfDE4rQ714KGlIoLiFCXE05XsXAsc4HwR?=
 =?us-ascii?Q?NYO77LO4CaOBhdqS+IG8LRIsQyvP0pruGWAXyywkftNvHTOnoleBYX7EP/qe?=
 =?us-ascii?Q?IklgmlOXExt3W1FV8pu8MKlPl/nFpg4WVDVyIdPPeePffXbuXvyrJfUYalyx?=
 =?us-ascii?Q?zdc7d7nznfKG/8WeCapUgjFxdU6TiRWfB0TH6viOO4OJt/SZznVODaJmUXZ3?=
 =?us-ascii?Q?sPyyOuswUwDvqMFTQGY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64243d62-50ec-492d-9582-08dcd9bcd68c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 21:40:25.7887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3WHDsRizpdGRNcFstlOzj6BMVOSJjN3LSuxZwVE/w9TiVf/6VtomCA27AwsQ1ydWz6rS5EfDF8R1JJwMytkZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9735
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_144040_533008_D1A9A956 
X-CRM114-Status: GOOD (  17.34  )
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

On Fri, Sep 20, 2024 at 04:54:07PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> spi nor flash needs power supply to work properly. The power supply
> maybe software controllable per board design. So add the support
> for an optional vcc-supply regulator.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/mtd/spi-nor/core.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 9d6e85bf227b..0449afe6bb20 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -17,6 +17,7 @@
>  #include <linux/mtd/spi-nor.h>
>  #include <linux/mutex.h>
>  #include <linux/of_platform.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
> @@ -3462,6 +3463,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (!nor->bouncebuf)
>  		return -ENOMEM;
>
> +	ret = devm_regulator_get_enable_optional(dev, "vcc");
> +	if (ret)
> +		return ret;
> +

I think devm_regulator_get_enable_optional() should be called in
spi_nor_probe(). spi_nor_scan() is public API, which may call many time.
That will cause regulartor reference counter wrong.

Frank

>  	ret = spi_nor_hw_reset(nor);
>  	if (ret)
>  		return ret;
>
> --
> 2.37.1
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
