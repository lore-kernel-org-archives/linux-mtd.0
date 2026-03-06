Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6018EFCC076
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Mar 2026 21:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GS9ZjIMrdQ2xapmfrypXDvTqfpixrF1QTeKjxorRsCk=; b=CZg3YwcvVEMFXf
	MPngjdxfWpuK2jhJXqXx9hv/2CrOzvqcYBBFsFkKq0Ao5UMdJt3j8dvAFWOzjxnttjjAsaC4OkW4I
	/pV1o76FEFarCohicul0dBCIPQbpjpMxNaRQY8xTvjciRNJfisCZ9om0sXewYxEdHfHSIQFljXeLK
	tTH5Y0Vi5vS8PClJfkTMqOhcUVmooFvkF99OeqeSYeq20G7RLRtPoH2nJLenbJOK07V0QRIt0vceP
	O00kNL95/LMuaLT6TJ1YmcMw+O1Fqd5PPzk12kSOpPV0PJfSDtf7uWkXkeIN5cXyIblRLrpRdV9ou
	/1RD7CQyCe/pAq8ERZ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyd8g-00000004YNw-3msp;
	Fri, 06 Mar 2026 21:55:18 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyd8f-00000004YNY-1SRq;
	Fri, 06 Mar 2026 21:55:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gilNAfjbBfGd/TxzzOgpXyiAHAOE04LH0BqSUWOSS6ceMg+hRXE2jQF81Ko2lij4honxl1xI/pyfcEfDCZEt4Gz6zEJQOSI8n7zsBk7WGfCFj4YFt27DSDwXZ81txnLfxkldaJ0t9dImZEJwcRjoMF4qa4yc796JCG8QamUSYo6piYCivVyMgbl4rrTzbdlcFQLL3JQYd2iR8kKSGLzuusG4ZWJii03Lxn+w6KUPBIFPFKpN7XGw2rpfrtq4BCfMz5VJqtKi8DEyEkOkuW/TCUObvc6SX5ykfToZrhHb+hRAv085g7mDOtcDLUZKOFDVak5lHhwMYGWybok38t1tsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5oiDXlkBWyQ0vxKHz9+Zq0DqoI0Xz3BVgBMsp8hxDc=;
 b=kvlHrZGxDMUsRiCY9GuhxH6BtvRPMXFz4VqlA8ZoRdp3BvLN9+DFYeNPasKz6tJyTrj7X2hfrfdOry8BSx9QH3O79Fk2JUMfc/gWlW8WN6vAHy2OVJL2OXKD8aq2jRUf5e3ENnmU67mpAypxtRRjFaCwUm1dZD/Pa/GDNlT0hTnfZCJSr2F15OBVulFxYSiREEY98pUuUnNuvcZJ8ZKJimscmTqR/agWaVbwLIim5y0QuTQOKzSELXBDHCrTYZsD/jbAtmn5gEekN82A7XzQVbQep08hZlyRU58ISXmPa+TItUPIAIhzgUVVL1dWAYIl6PR3KhZC7BOFamKeWsLBmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5oiDXlkBWyQ0vxKHz9+Zq0DqoI0Xz3BVgBMsp8hxDc=;
 b=YnBVkQL5DV0XTB71eLwm9qt7jXf5/rvqAO7pEuMoApdTk93GXvboI7pju5xoGEvFhSwIrOR+yEyj0czoE5QytimpTeWQiZddlAVuxuzb7mi1H/wUMn/OX7RBe7N2f5BBfDJVVw7kcF3dlnwq3ULcBTjEDOlAmNiGUdIYPu7l03x/czOSeG9ryClXlmjeuhPLSYC6hjQzZYHG4V2i70FrIvfV6MZgAX5CUJMIUF5dAmcYRl6JZg5oSdhIJvc1r6KvexYOe/LJgSSrSQoCzzR1NYITJ3C5Tb+YBKXXRX+PHcUI9bFS79wbFKDB17/O5W9DLS86NNM5J0fG2uwOlKczMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB7559.eurprd04.prod.outlook.com (2603:10a6:20b:295::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 21:55:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 21:55:10 +0000
Date: Fri, 6 Mar 2026 16:55:03 -0500
From: Frank Li <Frank.li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: mtd: mxc-nand: add missing compatible
 string and ref to nand-controller-legacy.yaml
Message-ID: <aatNNxC5XOoifVR3@lizhi-Precision-Tower-5810>
References: <20260306214226.403672-1-Frank.Li@nxp.com>
 <20260306214226.403672-3-Frank.Li@nxp.com>
Content-Disposition: inline
In-Reply-To: <20260306214226.403672-3-Frank.Li@nxp.com>
X-ClientProxiedBy: SN1PR12CA0067.namprd12.prod.outlook.com
 (2603:10b6:802:20::38) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a83689c-1137-4751-65ef-08de7bcb0987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: YNKRZD4sBjfYQIYFxXF24z+VwnvqGf2Gz+JIoaa+vOWiM9vC6dl44a+5RN+n25sBCH0WnX6i7+hPUjghbtxcoQxKEb+1t5tDNrdzBRDTXJfaKYRzG4JBwBG1PxiO8wwE2FCrsH0sM0syDczdMF4JOBaEuD83Jxe/mpNjlxp3bSy0Y8ZyR1Kb5qd13alpaJ1eLTbrIPBGKlfYGe88zn6OrqLGRBESY5JbqVP4OdPKNVj7DkCKouWsGd0b5MYdkKnrnCh0cg8uFutNUg+F1F3dptqHK8HwRj3024PeCjl+SMa+YX9NGqyVVz9u5aqURrik3VDT3Lxt7lCE3NyVvh6X63zVSs/nt/6gt7j5JodVwcQj1DsVIdNEbZcZJcZnTEtrG7ZVB1iqNDSYq0NIhgBxPRRKXKxMUIDNkskQXeE25APlCDA9k8i9QWtqdAbZhlNjbIPVxSZvVHxzuUE+T2Wb07Xfzx3+Q77DOM19FT4Eol+2o0vkptW4s/hGLH5Oi1LeGys2Wvu8x5wKoim3lXijgfIh5uauRJIXCvphmaF57shOxP/6Spo9TDc5ZTwj+2Z92G6hkDlLlz3a3XFQr7tWoxVXFZ3dKOsFQHgQIxvCYNSsulck5T2b0joiVwYAM3WVJ6klgXvcQA9WqFOb58ojpW6VA8ycwH+c46bOZeknpXM8wts2R6Wu78zIg6dVp39yJcvECeBcXuoPt2htEX+XZjY5O29rhqBHne2SkEIAT63xy82PDtWtEiYylcPM455wc7ut3qYnSFbPI2VI1Wq6skSErBzsan02qjnvoW11twAsjDsLv6JWLOfmKIFdrjj6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?R2dH4mdY5afmBJPy+GTHmDXLnYPmrn7a2BdtI0hreFV7AM9cWwLLVZ/ReU?=
 =?iso-8859-1?Q?i5NmWCT/TWpv8URU3buU4xzPsU2JZe85Hv3T4vztmtg7Q89YiKFKA9qIOE?=
 =?iso-8859-1?Q?U3C6WgKc2Uj5Z6YVnWfUt1OAFLnSwTl3M19ZYnjAP7MZDSctJRXbKcmFeT?=
 =?iso-8859-1?Q?sUvyhdNn3bflhbBXpsjQ5vv6PsFYK+KEFMTvdiKiVqO+uelY6S5Z3RF8o5?=
 =?iso-8859-1?Q?h2EGqe6V7ahN5LiY+NhfwNkbM7vFmGkUAynx/o2fyFhsr+yA3ZTTezp5xF?=
 =?iso-8859-1?Q?r68GZSNBDSa4PSaMASADGVTxoOqGiQLZ3lhO/2tOkmIZQXfTNWjh0PSBFF?=
 =?iso-8859-1?Q?obg8pBVldLuPya5fltpbbm+s294k5zOEkXC3tY5VJ1zsMzDLB/WOZykaDT?=
 =?iso-8859-1?Q?pYICnNdSit46ZP+K115Pu3U2eJtrD1lfbOLAUH4v45gPK/eL+KQBUbBWFh?=
 =?iso-8859-1?Q?jqE1DFsw3bVofhKuKcaz9+MsYj7AMwtMjmX8I48uqYmGK2QZoAflB925cX?=
 =?iso-8859-1?Q?jIh3z4/APJPwKvHACx0f9yJvw/6YqrBh+L5URNCoAZOSYscinLBZetDEKF?=
 =?iso-8859-1?Q?UOSvsKdbWQqnGYMkhGRZLNQ1AXC8lPb+0ra9Ukz30PIfYaKc+200jtt42i?=
 =?iso-8859-1?Q?N+/ecXpaZU0eiLGRv2x1zX+sZGGeIVVqGusGV221Oawr2Ha2qO7Gq99omz?=
 =?iso-8859-1?Q?JJtUCfl5Zy59+UfQqfvoX181YbCVD8BDxvcDTRJh6rzI5RkwEvnJAOx//B?=
 =?iso-8859-1?Q?JzVVE4ES6Zll7mxDUGFkoUthJKZJoVXR8xg5PGPrQLzM4ZbV1XP6VMn/0U?=
 =?iso-8859-1?Q?tyaKke7Oa3ftdlGhPSKpBgBquo3wDzSwy5Kdqz+6La7F//pDlueXrhW8cE?=
 =?iso-8859-1?Q?hF5RnsHqd2a6fRZy68gcTqhiDftj0v3KwGEJ32Twb0T8W9xIueUAiFGA8L?=
 =?iso-8859-1?Q?bwFz3YhcjQfm/868oZ6+ElYjyd8gPtgdaSp/Bmxf+uou6tDfFPn0zmmIVM?=
 =?iso-8859-1?Q?Kr9OWmV/dYoBBoW+8DeFZjyAKAuGxgbC535XmuMfBB5H2HgnY2e0C+tZQq?=
 =?iso-8859-1?Q?KgdmwtQM5w61+wlcRT81rTPegiByjHKJP2pmmzkKTgaVR1G31/nRIPg3oj?=
 =?iso-8859-1?Q?THpr38G1mGwCxp2vuYRSZdUqLyCxk2uzjuEMJcOYdyCioC+jxy5NHA419y?=
 =?iso-8859-1?Q?BhQvzeGGQC+ujSDSBN0IWIbOxrLQhU6Vg+Z+6KCv9BVPOEiKR1dXj3Wofi?=
 =?iso-8859-1?Q?hmAjUVIwHhYmgTnD7N4Mz/QuxVVEZwqsHvQHFQpRFt4wv+Y21t/mfZmSHN?=
 =?iso-8859-1?Q?APBTgOb7H6NYWWN9FbcgOqSY5KIUfAQh1jF2qLvifU06b+zgRQ9ka07R/d?=
 =?iso-8859-1?Q?vd7NvHDYvHxHQEAH86wKJR/mx6IBlh9PuUEhrNiFELXj/uJDapRY8V+x/d?=
 =?iso-8859-1?Q?CGbghbryv9pKkS3V6Ow4521i7il21OveRbj/rkmZ2OHijS+NV2iYekAIOg?=
 =?iso-8859-1?Q?fue8GymjUqgkaWMHUKnH38Vn1kCNii03rnJIDtJur89lsYnwetqvvpG6eb?=
 =?iso-8859-1?Q?5kJMuxgzfIw5XGJVrf5txDzTD3AsFakXwBg1OxplYODkLzEnV/D6oYK8/M?=
 =?iso-8859-1?Q?P0auJVBXJZGwoUgoJwzrxQWdiwdWLANGlPweZQYlmScvnxNlVH9CEqeNzZ?=
 =?iso-8859-1?Q?SYUFncb4b63ATkGQW7C3rGLqQ69VTHPVnt+ii6Q7X0xua22zwPsI/Wn3YS?=
 =?iso-8859-1?Q?zcmc25KJpnmboTVfUJZ38O+/6jYkrhkA+LtKJ0+gc4I6ShU/ml0kkOWh+E?=
 =?iso-8859-1?Q?FUHMKkAMfA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a83689c-1137-4751-65ef-08de7bcb0987
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 21:55:10.2824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uaob+hL1o3/ZY7EtTSZiwHEJmxbZm3r8Z+fGjKabjCjsYtp+jTMd8KdVW/qWA48jkYXkGNdkva6GmGW/X3u/Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7559
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_135517_393053_1034DF71 
X-CRM114-Status: GOOD (  15.30  )
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

On Fri, Mar 06, 2026 at 04:42:19PM -0500, Frank Li wrote:
> Add compatible string fsl,imx51-nand, fsl,imx53-nand and fsl,imx35-nand.
>
> Add missinge properties dmas and dma-names.
>
> Change reg's maxItems to 2 because i.MX53 have addition NAND flash intern=
al
> buffer space.
>
> Change ref to nand-controller-legacy.yaml allow legacy DT layout.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/mtd/mxc-nand.yaml      | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml b/Docume=
ntation/devicetree/bindings/mtd/mxc-nand.yaml
> index 433ae5727ad85..ec5b15341eb07 100644
> --- a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>
>  allOf:
> -  - $ref: nand-controller.yaml
> +  - $ref: nand-controller-legacy.yaml
>
>  properties:
>    compatible:
> @@ -18,12 +18,19 @@ properties:
>        - enum:
>            - fsl,imx25-nand
>            - fsl,imx27-nand
> +          - fsl,imx51-nand
> +          - fsl,imx53-nand
> +      - items:
> +          - enum:
> +              - fsl,imx35-nand
> +          - const: fsl,imx25-nand
>        - items:
>            - enum:
>                - fsl,imx31-nand
>            - const: fsl,imx27-nand
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

change to items's change missing to commit. will update at next version.

Frank

>
>    interrupts:
>      maxItems: 1
> @@ -31,6 +38,13 @@ properties:
>    clocks:
>      maxItems: 1
>
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    items:
> +      - const: rx-tx
> +
>  required:
>    - compatible
>    - reg
> --
> 2.43.0
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
