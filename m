Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5196EDEBF5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 21:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFNBUjkbHLFXXFGT31k8se7atY+UqTyGa/D6UjLTqFs=; b=KTRo7Nin2n7L22
	sXexyziHF7UG6ZCF4oevxYKyxtrp2aEWhWLxWwe3MZZnSxISWzr8hWMpBAzmJSoNuN6EJPWXqiEfK
	/9JN1ohGRR9yF1NvLH885zeRJam95GwXYpVufC641/UbDizE7m4f9zEA0aa+50z2jPPOYPi9QxAAa
	FJnRX9+xqS55jiOtDTqxaPHjq1WNL3pPJeggHpkOdalWVD+zgwtiYTYN2sv2+5XFaKyuT32hvhrq4
	Q1pRop1Bela6TVI4/L5esStlbf1V1b7MIdI9tMn6NFJ0FHT+MdLbUxmfYtds1HLu7fDzWqFpZB5GL
	u0zcreSkY58b3iMKQFdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWtk-0000000FxOv-3d0D;
	Tue, 03 Mar 2026 21:03:20 +0000
Received: from mail-francecentralazon11013034.outbound.protection.outlook.com ([40.107.162.34] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWtg-0000000Fx1H-3EHt
	for linux-mtd@lists.infradead.org;
	Tue, 03 Mar 2026 21:03:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXcDD4Xw3Hzp3b8G3k+CJ/POKSmuBNX4gVcTYrltP7O9l3u6aGW0TJCQA3b3DG9g8SleFHnyMf3SPRkZ8jhN8aESvvGuI1xp3gKn90l4CsC999RBwNTaaBuovdRr+e9soqI/fLzIzJPjLRvK7Yk42TnmUdbyOTJIjN+BmRphgMD3B7D/Ltr24z0mabR2ug/33t9BKufkVg2lrJ1oa+BMeCv1ja352qR+B+9dqeu4pflh3hNxPImYEHm6881XbJ9lqHsL507n+ycR/XXtkARW9yWCe5f6wDL1G2TFuMflGcaDr9wq60MVIf2QAIUcadXu55j379aFI6AghWzZaNFHtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAJzS9nCZ/hgfd2wb3dF0fvzJPwf1/sUtRjXelozbSU=;
 b=GWwgCH7jXjOmm2UMTTi/hcZ7apzncGHWewiGDwJelHeSGZeo8KZisnsv0v9SMBBekTcmdFu28V10miymm1nFPErDGWKW1yXByzg6cwZH0NBmeKHgSc7WP50OjqzKTPlW/CP+DRKPdTDykfEojiCOLZM+eUHH7qp36UcNHa49+Cwop6q2Y7VLC5HZo9mLw/+bb3OJWQBHw4ohOBM6awneXg8nGRnBp/P6bhUYQ4+/9xf19IDezAx0sj7sFgaZG9csqzWdNNXHOoTM9YaIcq8ad9OVdVRSaFhLS6ML0hnHyTcYqBL/lkdpHoUsI4yLIFArxvKHUo7n93dPY2a4R/FeCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAJzS9nCZ/hgfd2wb3dF0fvzJPwf1/sUtRjXelozbSU=;
 b=N9mrh1IlUMea3DMm+EO40djvP9giwHGZLFVFa1/4qwrhbtKO1caeAIcH6tnm67RVpYUX1OrGRW5g4lbjyqPhmNI/qLI3K2TDwqI3eFWhhV7zh+n9D3K7yTHMguP7LddqvFeROa5M/4WmNQ+ASci6BM7Kz68RaGQnK5N9v9FcqAkfPexjJjyLzmEFK1aXnBmnb1yhVlglr8GBCRbkbU4zz77gy3KdSVMSBuUfsJJ81z1MvVf7uOATAZpdX/Ho8UwASK36Kyk3qTZ13BoviwL6fvw2FvkyPhPnqIgFEIuCUeQ4tgFNmd/L1q0UAJgEVWtxlmoreM698cTYE2H/3M1e1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 21:03:05 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 21:03:05 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>,
	Eberhard Stoll <eberhard.stoll@kontron.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH RFC 4/7] mtd: spinand: toshiba: Add RX sampling delay values
Date: Tue,  3 Mar 2026 16:01:16 -0500
Message-ID: <20260303210131.2966214-21-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-4-9326bbc492d6@kontron.de>
References: <20260303-fsl-qspi-rx-sampling-delay-v1-4-9326bbc492d6@kontron.de>
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: a02cc38c-7315-497d-ab61-08de7968435b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: 7oM0H/XisoelCXkwVKCEvRK9lFrL7KywlHOh07oKr5m3DEf2SUncs18LgMILHo3Mt1Qg+Xi+DWsl5gwh4ZZSkua/cAp1Y9vXXzyQnlK2uECd2uPvFFpHKHzjWlziGgSak/4duxNXUjf0nOtWFZJHTVmR7YxLXqhYanvfeWsJdDg2iNNdLengeaZvuuvsJcvNBP/uEU9c/1xMtBn1B03yGBKmgKLt42cT2cDShNPemaq8CpSNm1xeJb1ilY1bp9vwrKfBm4vlwH1VvBL9w/xPwjJYmpk8ZEn1U4q6Unu5eVG1HKs70sba8g4foBTKvArZI9dZy83Gvxw65GqKhgGm6wm3aZ6KMgtoDGjcMOKTgbLT8x6URP/Gm/V5YQuUX3knR9XvYGYn1L/F1P7COQEoJZVd+M9zHIe0H5GJroQ3YtdFcCATa4tFLXD/8nMhPp7QfzckG3CALDvXtd/3ftoTQzIRFPcbsrzvRIskmHYFDJZQkAOTI+ISb5OWOqwJf992BM7z4kyjC0xJvkAeBtNQQGbCjzedsaEf91YO7g40rpAO4dMrVoaXtDRVehNVcN6IByqc3eulLvEQG+XVwH6AdBNTzRxOIrHWT/vQ7NBIu7u1y6af0U70ckM7KACS05n0lioP9y0Eh2sfdCDtkGtJN0JBSgR0pdHcWS6udkIZ+vwzDbZ2FlYrp0C+PcCu5KzjOyj3ZT/i+PfDRNT2PjFQ3094u2tFKm+DhoiqXzTTmW1kmHmqB24JF06dPd1u8UMWWUfsQ3R5Wje7WXExEeAYSOIcrKtQSosUwvucbTkXqjs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VPPvMIOZoT+8ThA9I6uv+1+8oFB03OeZwEBUAhuK3q+eBSW/TdJHbeefi5ba?=
 =?us-ascii?Q?vYjMi+cSSTB7m54QwNhuFMQTAqqzZE3iS5JS6a10Jh4IEV0uts+e8pQ0ufcV?=
 =?us-ascii?Q?H2wREDhb3nacZBfmz6sBCFSG9v6LKlM/6FFxXpu2ruh1I52XjoBd6vf4RGYz?=
 =?us-ascii?Q?P+wbq63qa0sPzBdbVq9R8n4uwTEtL5iV9QkipyA8U0iB5kqlFh+GuC/LN7ru?=
 =?us-ascii?Q?bGbpTt2N5ECfz6927AQWXO+UMl5T2jYgQ/ODu++n1f29byXW0Evwri6OXkJi?=
 =?us-ascii?Q?oeItCT5EcGKamHkxnVbg1dKktZAdrsXWxM5gJLp450H9/Cp75mgLndIg6W7K?=
 =?us-ascii?Q?qMH2uDRqsAPsaxT1EdGGUn4fapL95dPezW4Fj8KwRR1UtUWMqfbuh8xHHFfV?=
 =?us-ascii?Q?18yXvFUdMj+QV4lS5sj3H+1jnF9ty6LSoVB/K4J5ybEJ/sNXDnLScoK+t/f1?=
 =?us-ascii?Q?Djq7TdBPONDXOYd8NJg+PP+qCjpjM1id+urx0u9sEL+oOu7k2C0xkx5ywDLe?=
 =?us-ascii?Q?12/4vA8q7NG5O2YZwkpcuvJ+GrAKN9NC7FA3W4+NfaVddHVSVO6j0AuTBZ6t?=
 =?us-ascii?Q?+SgYs73UuFnO0bWnviToQoHGaRZg8mBVPZoNCgo4iwHPEMdjI773f0b9yEyI?=
 =?us-ascii?Q?D3a5soNTCHKyLCD8zABEFpkM7vuEUlWWvZsXXa6C1/iqOzWE+j+FlfNdI+27?=
 =?us-ascii?Q?YMUVnxjwGRXZQ+CzP/ODqA2uZJxavDyBkjmSVB9DZ+EiXoqUJwoff9kL1Kip?=
 =?us-ascii?Q?gTGInfxMIsEEvu3PVRMiWDt8ytWzkWOu7YqoN13PYrBG8IQ4hZ5P5N4i4UJ1?=
 =?us-ascii?Q?tUm9CTCFK0bKMW01nteH4gFrlbTLavTEz0u7wJDFdGULYa2NBHJQ7DzbTfjO?=
 =?us-ascii?Q?1bkKhtngS8hReD3YasIl8fBOZ+h60xX0Kw4pQEA7M1NPsnn3rBL5jQC98c1T?=
 =?us-ascii?Q?mspu3+ux108CECnTAyx/CdHpkyOsTKD3PEOEanInfLk/7+wKJaQqUYvSMbcD?=
 =?us-ascii?Q?Vtty2ZWCinl4a2eSuRkdSs7oKZ7CMsGF7GVDX61IZngDn9tXyOaiRSTv+Yb3?=
 =?us-ascii?Q?HXmqzbPnluAP8IUhj/hnujDJiLACsR8T204lw898iE5F8rHfUNC+09u/Y2T7?=
 =?us-ascii?Q?b6Fr/UT8SNZNLbi4L+Q2UXi30Mqena9Xkn2OCp/cLaK2nf98pmizvSQ3YRUD?=
 =?us-ascii?Q?Vcm+vOn/Z5/tPp47iTz4TNCU3PbAKCBL0OR72GoPb4LFBvpF/TXIC+q19Va0?=
 =?us-ascii?Q?lFYsGgeVlqfjIYUhGCiibkEYuUBLWMGZOFFbefJdD4eCvQO2w4daFY/5+wGj?=
 =?us-ascii?Q?Wrv49L7TRkSpBmcljsQg65FW9YW2wzOgOoREWwpoo/uHRY/b1xb8J7jSPV30?=
 =?us-ascii?Q?iHdCErO0Kfq+Dbx5EZzyI62ND4jqThF2zcmeeO9m/av554PO3hGVXf9Kz1+k?=
 =?us-ascii?Q?lC3mVat3JK4TgQeidkfDREw+nM2vBFuFUzyiJ95g75VorvZ0sNJPRwBrssjq?=
 =?us-ascii?Q?sggU5LwMrdxfS+4KIMSiuEmbxFb0Y9Q6nRNRLP+88Bbu3d02sAA627A3Sg8b?=
 =?us-ascii?Q?GK4Z2HGqn+RzP5F581jwoHhlFFhJqNkxWBnSzwdoG8T77a/PQH8JFXG7DU6z?=
 =?us-ascii?Q?dM+eJ7CgupzNfqYwCaTf3Yxi2bitiWyZm7FEfTSYWqQ8mpgq/H0lSUUVtIEo?=
 =?us-ascii?Q?p8vvMBRMpB33BfgZyDuBqNXbAWWuYL2p8R3bC2xihugcFRpxqW/GtmRYvoqm?=
 =?us-ascii?Q?EFo0fA4qew=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a02cc38c-7315-497d-ab61-08de7968435b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:03:05.0367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VPgpNpD/IeZnElQnPerCkwabm19uFH1rMvCns5u76W6JxEy4n8+uLEWf+IhFyNzfpWV4TPPD6+5TdBlN3y93Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6858
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_130316_820144_79B74CF4 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
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

From: Frank Li (AI-BOT) <frank.li@nxp.com>

AI bot review and may be useless.

> -				     tx58cxgxsxraix_ecc_get_status)),
> +				     tx58cxgxsxraix_ecc_get_status),
> +		     SPINAND_RX_SAMPLING_DELAY(6)),

Inconsistent indentation: use tabs to align with opening paren on
previous line. Should be two tabs + spaces to match column position.

> +		     SPINAND_RX_SAMPLING_DELAY(8)),

Same indentation issue across all added SPINAND_RX_SAMPLING_DELAY()
lines. Verify alignment matches the struct initializer style used
elsewhere in the file.

> -				     tx58cxgxsxraix_ecc_get_status)),
> +				     tx58cxgxsxraix_ecc_get_status),
> +		     SPINAND_RX_SAMPLING_DELAY(6)),

Line 195: trailing comma after SPINAND_RX_SAMPLING_DELAY(6) is correct
for struct init, but confirm this macro expands to a valid struct
member or initializer list entry.

No resource leaks or locking issues detected in error paths. Patch is
primarily data-driven table updates with no dynamic allocation or
synchronization primitives.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
