Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0663FEDEBF5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 21:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44cKXbfkWs/u6UvTkgCvHJVX22MTFjkuvpnMqoHUUlA=; b=nHC7nvScGW6tWM
	C5PzQktg1QuLSMjfRzxOz7UWotGQEYG5/HUz2YA886xDODqn0UB+Ye348H+A/AlfpyCCmmEZvAl+c
	pGIXCW0cb1Ym2hB6zgQrNjtJKD3fZaJXd9R3JnRwy7zgu1Dar9Eq1WMj+Ebv6ca4z7BcqmxonZY8i
	HuM0iiUlz5i0BG7Q5EjPXbenSsNvxDaGO3mQEFQRE7RqW01Ep6ZQDJ58a8ESGZidgEqe3P+iwKVW+
	erZUcqFSlcThocliJWDjMYIhSuddc7DYFi8ipaahhzjcLFXTRljXaA2t/t3AJMUDys0Q9O8pmB1dZ
	UqSIiSxY0PIlep71zedg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWtg-0000000FxIp-1oor;
	Tue, 03 Mar 2026 21:03:16 +0000
Received: from mail-francecentralazon11013034.outbound.protection.outlook.com ([40.107.162.34] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWtc-0000000Fx1H-42d4
	for linux-mtd@lists.infradead.org;
	Tue, 03 Mar 2026 21:03:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTaRrxKA9dNiu64+7S0HzhrTaQygkXuJR7sudnsu7yjIXvnz7IS/H43dUE49EbrLffvdtrBqAml7y7L8hNqiUWZGpSbVMyNAB0rkCls+ZMUfjEU0TQhODXjc6vfF8UJ6QEYMxOeXx8yJZgVUT13YAA5uYWq2Tw2Uxu9iHAOLeVWCTTe0McMEO/flBoU3ylFeZZWaSGZZBCKDNoi/awQ0JwZ0VREYMOTO7JpGfYEoQq0oTuIZp7/5j54ZImiE/U6XUalNRW3ctmDTmeew2TiDs6QPsP2Idir6ojrFRCR6Oo9UzTQsY1z/yigsbGpv6/X/dCuHZJTXlgf77advzPzUiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLm7yx+ZHAHbYjg5pwk1ht0AyoiqSJ37d/2uDblZWq8=;
 b=qyMK89EDcf7trtX2ZEUz2eJGrobBWS0ZR/AYNxtZb6K8TGyLGwenwjTAXucqu22Du/ujix/pI0N4LhEBGqHfTtCMFR41GBAQyd0OP62zeDEPck53zq62HQSM4vGAdAg6Ui+oAVqVHwCr55MmSP8ABDrcEmrJhrKXOUqxDVB/MxTc1nLX15fuj5CGlwBr0iq9gesvkPZ1cF+xBmYqqCZ0bBIK9a0o/ViX7gVIR6gwaBUHVqpWN4HjyqljYFLnPNnhafNv2/xXqrE3WaUKlxzb4uOA0OLmy7cAOfv3bBEutAlhAKWzu2GbZF6i7J+3/sD9d1uh4WHb0DrS+3MMWxAlAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLm7yx+ZHAHbYjg5pwk1ht0AyoiqSJ37d/2uDblZWq8=;
 b=IvsPmZRscCwI1W03F7UddzqUy746vxqBgzHdk3+8HYhDzvpTQCePUuL48P/afBunq6u8AvqcycogkIJHuGkwLnwHKzowGxb88pN2yPIEKjcRt3ABEp4AK/35ibHtJeCC+iq6+tNZsbaCvFWOwkBUQiMp/Wgx4L+gn92JR5x5Kn3oPzLgCc6WpgilV58zmXmEogcxA+BbNRUepD52GUuyr+zmHJs6Pb/HAQcKxEOJ/4HmSTXlJ2cFt+ggYBm+BAPT6dCGKHoOEJ3/v6etb8gwL7xJLUhXKtrAmq8BylGZThtu6w2GTBin7CZ3GrWpM+I5OIftbxvg4jqefti1+A96zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 21:02:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 21:02:59 +0000
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
Subject: Re: [PATCH RFC 1/7] spi: Add 'rx_sampling_delay_ns' parameter for clock to RX delay
Date: Tue,  3 Mar 2026 16:01:14 -0500
Message-ID: <20260303210131.2966214-19-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-1-9326bbc492d6@kontron.de>
References: <20260303-fsl-qspi-rx-sampling-delay-v1-1-9326bbc492d6@kontron.de>
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: 12239ea4-b135-42dd-3134-08de79683fab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: Ix1QuAbwvL1ltiKDVI6KKQP6PvgHTGP0RSzJhqmYZYioYJek+dccjZHb5Cjnj0GPPHseSmmASipurGTYWPHTi5+D2B6FaEKa8XnByalTG9YwMdAfTt5drXbht1fl6LZhcZGBll3fxs8YJy8JzpwvdZ3X/kNc9ZyKmV2EshKHxOpkWwVT/GAuTRg99vgCEGKf+HbNJsACWbxMFnv8xfdtrl3+ySTNQ8PsfnWtImfc9sRK6vwqdHr9NsiLkPUY6V569UnbBXzL4FPsGRNsKTLHJYrqGQ2vDn1qab1GZBAslSSNW9tQdg67xaezDJkkny337No1qk97XexC1mW0TlAJWJw/1vLtmUn1Msz0v+peGtwxBAEXe3KN9XwQBziedXNxpopTkIK8xFUkaVSlcH24j4G8hJG1BnyVjs4hg3i3RIc4Dv44zxB/iPgobTEht68qpdGOrHy9D73ZnXONkOMdr4Fthn5nQbBa99dvpdB3U9RJFifLSjF750fqVC1TdTsYDHTbLvC3n2BU3awyfRDm0gt0AOvSnkmLSOBzNPriDbUnRZATI0y+W7pfWTfgoehZcM5b3eCU17olYrPg/pUW0pHT7SqK6qe8vc2xEEc6zUuJm70x1sQN29NSQkIu3RG0jcUJhvI9Dw0s/Scg5aUDDPKJxZUJeeIvEwI2Ob+OnbXWvHjF1N6rVnIvDvaAILExP7JXQAvC1BoYhboq0EqbadyWwmnliXI27KMrsAVyo+jw3kkq+0bKx2Ic1cbzH3pKl/kxU6y7IlgYpVs8u6qVZKDPlbTFqD/EKb7h5q3RIhQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jVNmesqV07Y0q1q2weNxJsG4wxiLLpWacFkoXqSWsAMDUQ21pzz4hsXBeaOx?=
 =?us-ascii?Q?Gtzs+y3eXd1YowGFpSLnbKWxwKD2+pIyRdai4Zc4QY0zK+AJE7H0G85WZQJ0?=
 =?us-ascii?Q?x8JNFB19P6ZjPQhW8ecENtOWO3zIFq2Oc/XcaPzEakkwMMnlWnLGY4xRVg6d?=
 =?us-ascii?Q?BQoZIRHxzIUrmIG351mbolfUklUavt9YeJIG3GaJRtT2RDXuSPpUXvFhbBhO?=
 =?us-ascii?Q?7UiYfAb0EbdeTnitFmxyy/5/7YM1uTfJ8bbMB+gkXLG1BrYVtUdx802WMQBH?=
 =?us-ascii?Q?1PK2+Q/hgDP/odW026ahhmbBeBqXcLJ2HSMaVgtif/wSasN0mQTiXqgL4/SG?=
 =?us-ascii?Q?n1v6nqnXRriNsfmifVKdlBr2NEqR8mYvToRiXgLutuiiW8qojUKpGRGTnWNL?=
 =?us-ascii?Q?0LyoZcTIGllKFM4/SNPnTyftSL0nNpXYGosJfMgSRojL8FT8wubtyJ+7OuTR?=
 =?us-ascii?Q?QVS4s9eHsVNHT2KwgwrxkOXvLFP5hCxfVlbpLbIiU5K9HxUbFeIDk1WKXrjo?=
 =?us-ascii?Q?6K9KhKhs94jYC6pD+iOM2l85YuQUJjTGYPBN7Y/NeaovHjpJ2xKNpqavoT+H?=
 =?us-ascii?Q?jvwcMfqXMQO6BLiFwq4SuKjrg7h+NkM92lWM2mtu+y6dj33G1kk8Ze54IHRH?=
 =?us-ascii?Q?zXt0DCKTQLDc8Trbi3Coux1grlKveSjdOS3sv/zeqNX2WaJXX6B83Y7zgEEU?=
 =?us-ascii?Q?HYQ4XUMawMkqBkKfSr7TRtoBSGwvBXYcFvJb66tS0XjpsfohNa3bD8U56Uyp?=
 =?us-ascii?Q?Zb5AeHCyikGbI5BKAZMbzSGyX14MP6pCeYCvsDCTc78tYzgUtW43rj2duvbS?=
 =?us-ascii?Q?DA1FENcC9GFp2rtxt3YZAlPMviDCKWr3Mzr0SHyxwyP4C8OfV+eCImkRpKX5?=
 =?us-ascii?Q?HsWLa7aTa2Y3Y6SVjEmhnbX+zv8MfaS1J5nqOMteKECDiJiqdbiaKQggKRQL?=
 =?us-ascii?Q?FinAQxOgQxeorPkKnO/hGwS/zUQvNLtyWMpHgvc61f70uNoO/Ej5eqOkQ1Ck?=
 =?us-ascii?Q?yFm+qUajwoRRH/IYOnlV+LCB0p3H/4tgfiyXjb+lor+32n4oyYZIMqwGyDDP?=
 =?us-ascii?Q?ujbgG30niQa6JLvWALeAV4XoN6GUQi2EikxkLuF0/C/v4egLY4dkZ4ZrqzzI?=
 =?us-ascii?Q?T1LapEskrkDlTgQVXrac2tu2iPkhYXZ5M5vVwD5nHYsYzLIvb7mDJHor8d+/?=
 =?us-ascii?Q?4KH5URq5gN+lUBXkTtythER+9RKEglLtWRa6RBWCOplsU88XZFv+8ygz/IsR?=
 =?us-ascii?Q?7hJPL+xtKxc3WxTpVmiFev11QbzfLrfB9qIJbxmOIrp5pH1cYeLWpG9Hzijj?=
 =?us-ascii?Q?eMUsG1EHFzRlDUAEi2nNNCE93njIRTlmTMmlsOOzw3IMtTZkK8J2H02i0rMX?=
 =?us-ascii?Q?ZtOcA4PiSW+9QXdHkmNjE+QtcTi44W7MMI1kVvlOWVJfa3xn6rEsY4xpwumm?=
 =?us-ascii?Q?tXR2CTpFXmlnKnfqx2S9PFmR75vmq5XP2dVE5RtQj25rA9Zx5M7sFNqWJYcX?=
 =?us-ascii?Q?ZmKbkVTzgbjJTzqGAtRkOVTB8kZ4tzR+rfuocn3FawnRNVh0vQELAyHO8XXn?=
 =?us-ascii?Q?GINQ/g8tB+zw5b8I1jKSChh6L+CzWddhWZmqbBLJL1yvI8xbi02sc1Cz1Gn2?=
 =?us-ascii?Q?IoiTgBQgN1BDBIV2FjPI6rHtT9zbDftwCMjh360d2wNBiv6dP5bjq5DbbCpj?=
 =?us-ascii?Q?yqEvQX9CMXOUyU8qrfqTAG+C4A6nbwaDUJpAN1cYgkSaVr7PRaZ48YLmeF1V?=
 =?us-ascii?Q?pYV9jkQenA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12239ea4-b135-42dd-3134-08de79683fab
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:02:58.9626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEPIlPlQCwVVSIMpM75yXAjtkOA5KdoazlkbCtrxhmoVpc9s2ZHYUp500gfPh8eP4CZV/QL2P3zMEw5CUHe4AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6858
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_130313_005626_D9394F2C 
X-CRM114-Status: UNSURE (   8.68  )
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

> + * @rx_sampling_delay_ns: spi clk to spi rx data delay

Comment is too terse. Expand to clarify the unit and purpose:
"clock-to-RX-data delay in nanoseconds; see tCLQV in device datasheets"

> +	/* Transfer characteristics */
> +	u32			rx_sampling_delay_ns; /* clk to rx data delay */

The inline comment duplicates the field name. Remove it or expand the
block comment above to explain when/how drivers should use this field.
Also: is u32 the right type? Consider if negative values or larger
ranges are possible, or if this should be `struct spi_delay` for
consistency with cs_setup, cs_hold, cs_inactive above.

> +	struct spi_delay	cs_inactive;
> +	/* Transfer characteristics */

The comment "Transfer characteristics" is vague. Either name it more
specifically (e.g., "RX sampling configuration") or fold it into the
existing block comment at the top of the struct.

---

AI bot review and may be useless.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
