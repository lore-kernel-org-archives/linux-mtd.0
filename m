Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1A2EDEBF7
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 21:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Lz5YtsX/WjQXnG0v3kZTpm8FaXeNCaHzpMDu/bQztc=; b=I+BZ3/fwbo7rkc
	3YpGjp5mAzg+r4ueOYvyXBj8ucZTDzsXv8NhCzAbNI269ij6FnJ/IOm6tZU4aQ4kLbYqZxcFET9l1
	+an7mh/ti4xEZOFWDo2QAAVDK9L6wAqaEr016ZYjgFKpDTir8T27aiLcaeuxtjvyCg93NmjAzAAzr
	wswmuJa9JnmBvmS+dIjHIUHbArGkiM2qxEgukOPky7ezL5bkOpwaglBpnjdynXaB01Fb9A98s6Ika
	V+U3biVDKErpPo+N6eU9qZxD+7NXscmJLhTirfQ5vtuu91PJmV133O1hnOw+47EKUv8cMaiVDURa/
	Q8Q5gkRI+rRvk029+yTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWtd-0000000FxFz-1o06;
	Tue, 03 Mar 2026 21:03:13 +0000
Received: from mail-francecentralazon11013034.outbound.protection.outlook.com ([40.107.162.34] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWtY-0000000Fx1H-3eQy
	for linux-mtd@lists.infradead.org;
	Tue, 03 Mar 2026 21:03:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBHN+3YYm9kT8YhK8R/GcJubyl/EdvKbQds8myDpIUitHGyHghRx/PtRFald55iZWG8Ivd92FfzTaXF5fL9Kr9eeKl+40SE4O7NIU9G2QURGewaAlVVp21b3EDYOEFnzPjp2MYh5aPh5tnSS9InQsslZA79UQVAClONwwS/oadVy6Geh/bm8FUkW/dLFFAH3QpHVOmP9XQYiAwKVw5YaSNyrUeUvlTCArS61WaBZBasCuvrJKLZ+Jo3DEE37MU3ttyqYeTs8rQZL2TF4uQGchWjERBVyyd4CTpDJncZ4RgUC2jwUHvapbpzoTdPpNY2XdmTdrbip0DGiFTppClzNXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJ1ymeCX8mr/RVzhDMvBVEz8lzXTgnoUTwdRrffJjxo=;
 b=LXVe8OSmnAK6g7I/GCE80ZfDCEpjtAqUCCf4MAiowhBWjGWeiFwg2cVLj5S16dVMFVbbzfovr8Vc/0pCyMfYE7/lRUbyQI/03HM2Z5s/i8k5FiylDqBrJTax9g+dNInJRDolQzSJnL1UJpW0vAGr0pODo5nLwgAniBHgDu7CILQzrM03vCqwy11h1EKUq1Jp4tVJxauV8C9osBTrEreFZF7Honubrt2p86k6QOlBvcxVKfvRYrPYOJdqONNBmL/mFxnPWW1wZWBOaMdc3IhcbJRGlIyygi98rqrFEDzWyLhIeqtgq3RrYibkiOXcku7x0J3fy0AnDDAGM5N/YWLXCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJ1ymeCX8mr/RVzhDMvBVEz8lzXTgnoUTwdRrffJjxo=;
 b=DlLneizstOZU3znPrFUOV8Of7Mi1NK749jEAgwa+hJGt8CZ1eNN3cYhhMdJVfCh4VDgYcDQRaUvyTdTZkYGzqMptgCLswNplIFYpDy/5VaptTvOUdg/sLemdPiQWnucO6ft/JHH+BaW7U9sXtdf07jLmViFQ4rykiBaf86ShtQznlstopLZaDy2055xQPa8NKXGBKWrIXAYASjnNmh8nji30uqPxDBYQmv08wnuWxg1NuvP6/SBp0ve5jC8/H1FPSBaTz7Ycy5mYu3AnOVjCxIolO9CqqOpzT/O5omEIEeFGtsc6qYt7xaOIbOStdoYfSP+DR/aGOvqtkPj6pF6SXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 21:02:56 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 21:02:56 +0000
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
Subject: Re: [PATCH RFC 5/7] spi: Add RX sampling point adjustment
Date: Tue,  3 Mar 2026 16:01:13 -0500
Message-ID: <20260303210131.2966214-18-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-5-9326bbc492d6@kontron.de>
References: <20260303-fsl-qspi-rx-sampling-delay-v1-5-9326bbc492d6@kontron.de>
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: 385fdd43-83cd-47a6-bf49-08de79683e07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: eGiS9x8kJRVy4q5dpZo6zfSZJSR/FvbrGut3pZtvqwAjmH0Xmie34ngLSMJQmZzrOYaitlo24iqTeUuZd0yk1CR7pxc9dAhCJNoFsl6ahYT9c9D4wJVu28n7/bQ+6WsziD35zqcyqdXgQ+KbaFhwSPepL0aC91ZYDZEZeI4ROfrLulxiM1mgkDNMXtG/HN8cFWzDk/uXatQSRn3j8xDaJ6b+wRU+zBKHcFw4Flz3s8/6ExRAjIifAnCISwkfHBmUkcNoZYa2ab3wh+nL8upkh5s0oJR0VXz2sSCJ4ysD4ETlhnOV2Gdr9tUpi4N72S7wDl/lAWAkNWfjA10ctoJZMzG54NLYp052d3tBkB9/koAJnSShnDIPKI/yxNizihCrLOQJrfI/ibVQKd41LHVpAZyf5GNex4ypvuq59iTwhN3ZbQPfLR+hoOBnwbstc41Cwxz+DXedz8ujfg9MM0FdTa7nSxDgGegJESqJBlvuSsNdSo2lz8yfBUw9hGDH3r06J88ecOAWrRN0x/EOv/AZwkXKFGMwHpj7UG3OmIsCHS9/0oVTZ0I/mky3l/CJNq0VssY1aLrMVWLLQSaSHjjumVpIGbgez+ibiKDRf6bLc6VT8T/zHb/+ooQmviOEcz/8S7ZxP03w3A6zgh8QcgyROyWe8XnGNDzMo2TEwoqySvyJ35695SYAuRrlszFZenAE0ZtSUUghJi5bYjYGwM5ObFl9bCd7LTI1IUbGDBNbQykg4Wyy9AknPtl0uFn5gzY0zgCJgxZK5ock8xb+jYm/vURL7LGW3tnYVokTsJz5pQ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OWEspUL7NuEH0B+Q6QoBGVcL4jDB4QxKl6nIo9wZbvHT7D8kBbXsjP6+tPEO?=
 =?us-ascii?Q?qVvlQODTuTNARMEI193qrF/ThXW0M1o/GSAGCC9RXsZsFtECg4JVBvAet23m?=
 =?us-ascii?Q?BkiFtTbSU3c4x4Nd2cZIlGb9Oi7N5xbLkpATD+hmvhgjpUrQNh0YIk7F9gtY?=
 =?us-ascii?Q?Y+g+KYm3MatF31XTC7W4yivYZbOqnAa8ZR4LNoWmhNMAryWi2GjNdrk1tkRJ?=
 =?us-ascii?Q?pABSg2wc5N5IxyV/beZpqw3WXUez/UheGrs/2n+MoJB8pEHROI683zpecY25?=
 =?us-ascii?Q?ybJ9ztoe77rQ0r2veSapUcUWpOlhaijJktsFlZVUP0nH5J/8qJwZF699/N79?=
 =?us-ascii?Q?BqsjGjD8NnrUxBoZv7P7VBDpTJKe2SPzMowAtftaWHloBv0Jy41zJtmeLC/m?=
 =?us-ascii?Q?Fbz19agsK5NyginB9Zq9hEitYh9Wkwj7VmEXAv/d/OHOlPcWxa/bfn9nQDK2?=
 =?us-ascii?Q?HoRhyNtMRtQGm1a4P3rpTuEA/f05yXI50/KvBZX/WE9vX5esQfLneyTYLtTF?=
 =?us-ascii?Q?CEwx+s1umLywUj2Xsqe97TVU9pBbpd4rsRXIr4w4t1g0gZVmtK1iyZqM8vnW?=
 =?us-ascii?Q?XtHQTklG3ZNuouEwtPeyZ3IR8lMjLg64x17nsmzbHexFWoMFURne/Alimwbr?=
 =?us-ascii?Q?JRfJEl/ye2kaCuaD6ClVBva98F48Dy656bAOkLhn7oyvyrIsw5OV2ZdPiJHy?=
 =?us-ascii?Q?yLtWayWu4sgDCLCoT3kJyRmQGyKNJ3Dy9ajwRcmmfd1NM307zitYb6lA2grt?=
 =?us-ascii?Q?4qbGH13rflySYgBlrMAj8Goo4cnliDnPpOuMmAEUzVXJFoJ4JI55oxV/VUG8?=
 =?us-ascii?Q?f5+2nPUxSPAuk/BPq3E7a8vflOcWgy4r2AHIy6jG+6KmQ7GZLoh6Rp13X2if?=
 =?us-ascii?Q?hSi6UBd+Wz66QxGQ4gYsUpEML/6goUjAkYwhYd49UkDV2uMMGALVNZ2iv6oe?=
 =?us-ascii?Q?xd4huZxgoJZmyYlLORAc44u0qygno991+eIzDh1eb+wcQaNLKWLhXmhSC4+E?=
 =?us-ascii?Q?kUQiYVWQVjDjqPuRZAW2j+N61ue3HqQpjHJxR8LEmMfvlYr5nMbUWqOhQ+AK?=
 =?us-ascii?Q?K6DlIklWcD8lrp8RHrEokH0C1ugqV7ePojfuRm4KVGNlpZMsQkSF+aw7y09n?=
 =?us-ascii?Q?48z2PFmFEFc9IaQBFzfncNwj7GGGIpmJUCUOGuVRrNfXn0A533jpf1PQxckL?=
 =?us-ascii?Q?w2x67tmhbx4HjY5RzzqoZQJkouKzxga91XiDClNQQSk39lL67Rx7QhOYAkkP?=
 =?us-ascii?Q?kUoFX0cc9fxbDp+S0MjxSvmBD9Co7YJfva2W1KYg1owxzPp0Ih1lfbIBwRoF?=
 =?us-ascii?Q?PtXODy3SevaXlB/7GxVfIUeoAhkxTIpbAiYuH5GiW2iKlPF7PNFCNOqn3yBc?=
 =?us-ascii?Q?n7OsT3iHRT9Pi/22GO3EOr7/TZ2OniMDD5l2DyK7aY0QdHBQGdfvuzVE9bJk?=
 =?us-ascii?Q?QY/dC6MIEZPAt8vWyXUHoq7ph1Ff9I1dz09SaugFn9JgIaB+16Zw+rtF/r3p?=
 =?us-ascii?Q?RJ+ywg4q3NDh6QNmOpG8FcUxXyPSUce9YRjoIBiUZGkn5PJvTCKzmOzzSjFI?=
 =?us-ascii?Q?Mrnm/FEoMuE5iVDFLZEzJLyU/bHq0iMksECv+MenAI2MKR+eh5WEhG4TZpX8?=
 =?us-ascii?Q?J1/KYoyauykUaveiLdHd5JYgADLmxdguu30DeKYbXQbNtvNnKiS+9yNqq2UZ?=
 =?us-ascii?Q?781qOsS0TSjmlBpXWzlaGe8qDcB9NaBTkmEjUjSVawk7lGfJJwcdCUOHGGV5?=
 =?us-ascii?Q?rYgJMpHRmg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 385fdd43-83cd-47a6-bf49-08de79683e07
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:02:55.9529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCNvp6wWPDkla7oUxepDknTDpw1xfCv7PgghYRgSX8Q8gfmeLlqk2Q++rPlrG473q27H3PNb0urOgdRoVOr3mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6858
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_130308_927886_021CDA36 
X-CRM114-Status: GOOD (  14.86  )
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

> +unsigned int spi_calc_rx_sampling_point(struct spi_device *spi, unsigned int *freq,
> +					u16 max_delay_cycles,
> +					u16 delay_cycles_per_clock_cycle)
> +{
> +	unsigned long long temp;
> +	u16 delay_cycles;
> +
> +	/* if sampling delay is zero, we assume the default sampling point can be used */
> +	if (!spi->rx_sampling_delay_ns)
> +		return 0;
> +
> +	temp = *freq * delay_cycles_per_clock_cycle * spi->rx_sampling_delay_ns;
> +	do_div(temp, 1000000000UL);
> +	delay_cycles = temp;

Potential overflow: multiplying three u32/u16 values before assigning to
u64. Cast operands to u64 before multiplication to avoid intermediate
overflow.

> +	if (delay_cycles > max_delay_cycles) {
> +		/*
> +		 * Reduce the clock to the point where the sampling delay requirement
> +		 * can be met.
> +		 */
> +		delay_cycles = max_delay_cycles;
> +		temp = (1000000000UL * delay_cycles);
> +		do_div(temp, spi->rx_sampling_delay_ns * delay_cycles_per_clock_cycle);
> +		*freq = temp;

Same overflow risk in denominator multiplication. Cast to u64 first.

> +	dev_dbg(&spi->controller->dev, "calculated RX sampling point delay: %u cycle(s) at %lu KHz", delay_cycles, *freq / 1000);

Line exceeds 80 chars. Break into two lines.

> +unsigned int spi_set_rx_sampling_point(struct spi_device *spi, unsigned int freq)
> +{
> +	if (spi->controller->set_rx_sampling_point)
> +		return spi->controller->set_rx_sampling_point(spi, spi->max_speed_hz);
> +
> +	return freq;
> +}

Bug: function receives 'freq' parameter but ignores it and passes
'spi->max_speed_hz' to the handler instead. Should pass 'freq' or remove
the parameter.

> +	spi->max_speed_hz = spi_set_rx_sampling_point(spi, spi->max_speed_hz);

This call happens after spi_set_cs_timing() check but before the mutex is
unlocked. Verify this is the intended placement and that no locking issues
exist with controller callbacks.

AI bot review and may be useless.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
