Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBC8EDEBF0
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 21:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aWlL0noXvmeJMBjTj6mnZg9GRsciZc4PUdXHCnQnU0=; b=lUAMZWivnYovEW
	13L2uwh5j3lVuOjNSLtaIrmgGJqPZAQ4lMgMf5wPF+2Jer6KyGquiJpT+Kx5oofO9BSXi05TzrGps
	NNUYfBAJhijl/lIfHnwovh4o7B+wqpsP3ep3dQ4L/NJklbR48KPB/k/ty9VHDEjQNEEgbgkaHIS0G
	s9J3j7l0B14k7LZvet0lcl/YdJqtqpKoKF0+96y9xFt1i+J6/HwDvdKvXBKSKpmJBEPRX7E5XJiyB
	iK8MdfEJMqiPllWdLueimEDe794WZGDPlsVxedFgjsUOOFEzST6BRo0ARZhj792S4CifQqq/tW2ax
	i/9ILqRGpNcagyCuTTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWtj-0000000FxN1-2CZI;
	Tue, 03 Mar 2026 21:03:19 +0000
Received: from mail-westeuropeazon11013064.outbound.protection.outlook.com ([52.101.72.64] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWtg-0000000FxHA-0XPx
	for linux-mtd@lists.infradead.org;
	Tue, 03 Mar 2026 21:03:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XkcEfJJ0WaAKLfDp9EtmqxQRBoKTzJnTgMqOSH1N/HBhnpMEP3GLFZ3JzB771+N8bCiBODrb93+wgXMN+suu+nEDUIsIFtHmey1hui9lEAZWBG/uz+BuhWobcGbOeyLlw+zkKb7n/EFJs6KhJBP+JYvBrKBxo0MzHaCGn+57KGRYcYHyLJjLDUj9gsXtLMN5f3ziPS1LszKpwyp1ipcD6oXJ4rC8maqGJs8O/dj7K+zOc4p0soE4IrlCchNH+++xrnmX2Dk5p0wQzTmEfS/QeW43y5ffKzOxmwmhgXC53OBffA5X3Yauw2GDYcQJQmWJD9/RVU0wbEoS3Is8jdK62A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBf2T7z09usgbBZ3wZTiAXnO9iofJOVKJ5qBFaG17WY=;
 b=WSpBsM4+zv7fFmVFBDBQt9ZMf0w6zFaW3Y0KKdP5ec0BvgttpPYHbFNINRXWaBVcaM8boXOOUaIk9bnZF8fV8vzZkKyk42He9aovrxO5Jkfny/cGSAh8rqGJPl9oDw/QjwXRrzhJiU5r0a2gX9frQZafw0y1uOJIxKqkpQTpP9CmNpvWPSwzHOs7m8UHeLj1RdSdljKC/BKO8R8cMaDD1ZSF6nJxM/YUQ7XcspidBBJq+pajwLy3MhxG6fL2dXfNeuY4IQLk6ECZAxBNWep/3R+rAkF6NDclxCGiWAI+y3qFxoBei2WU5RFo9Tq4lXBg3i1sRwH2Gthsdo3xIOPHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBf2T7z09usgbBZ3wZTiAXnO9iofJOVKJ5qBFaG17WY=;
 b=ed3IWpPT8X3RWems/Q3TlCaLPn77DRrv0DlWqmaWAMmGhE3RYvYX2NlT8t1usWHk8gHwBPRP1z8Jkn9CES+FgmmXJBCvfBCvsXAwBuxirt2A38seAKB1BGkh3zxhJUu/TOJqMPkpDPkC/1u3MJwXoS0DENLEvDJT+LAf8luiYInnMAcFOhgR4lQitsCeY7onDcWL+vTs9Vj03MdupI6gNSlMvfziI9cgTrbE0YPuc8ZxfVL5wjoicoi0ZrHfYRc/Gb3BzeVPHxcelK13ZbfVf7Dm2yO415s4Ofoqv7uTdUOVGICfxhmk440g5kzYso+LVh64DH8LZo0/mEJRpDVL/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8639.eurprd04.prod.outlook.com (2603:10a6:102:21e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 21:03:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 21:03:07 +0000
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
Subject: Re: [PATCH RFC 3/7] mtd: spinand: winbond: Add RX sampling delay values
Date: Tue,  3 Mar 2026 16:01:17 -0500
Message-ID: <20260303210131.2966214-22-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-3-9326bbc492d6@kontron.de>
References: <20260303-fsl-qspi-rx-sampling-delay-v1-3-9326bbc492d6@kontron.de>
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8639:EE_
X-MS-Office365-Filtering-Correlation-Id: cd92376d-c44f-48b5-1afe-08de79684510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: FhwlsXgH6o+WZQkBDx2siy9+KqQaqMmHC3gXXEAhL6Ko8DP04LuGXx3NdPqVWQ/70PGE/YO8TgvyVi10KiwRINr2mAs4toViu3VBUXhWRvaxa2OLoQRQ6P9YFc9NCbc9M63tTf6NckW+ax+i2ZWZ9TbSAM/nFVeU3t3T0KvNHf5a4qCpOsHirJgZolodtwCujgOyZGcBgBI4aUhApRVTsn2Tl4HRuDQzs27h4EvQuzQZ6GHwmgyYOkBGLtfBjW2fvVesVE7n53s86xA71VONEqIjoolh+UADTc0P50PaO3hWreFQOXGjM+tKCQ/DeM0tHyUKAxf9J15sba/YOaonKWjeYJ87DanRoNZwl0kIIdLQ60pB5oD9ZGjdad/2GG5/NEGqhbHUNrHf7sOBTqa0yFQDBdPO8JSApqLPt1+GReTpiHH4U8ibpjR1HF0e7ulTboa/FyIWbRn9ANuyH7YLWtr6jLycPu1ZwKCusNDIe8D54uEc1QBj+kUo2z8EAjm/7jWNLhErpcBmLzKKwddePWpHT/aF+WcesrNewfLgG97wjaoD/O7ScEiibxOtng2PCYIboWHvT20Pi33D5nPTRXKi31fwfIS9aBZk6qKMmnDNrb2ZmX+TFaeBeg1TcAe0DGRrNdXfnwq43IDlHMhU1PDug0wDGtAIR/SFmLdH86eem0OMnxjs5gZK5jT2/lkAfLIrvGgBNwuVQBtzHoPqVDlgKinHLga+4izFGY5g5rgDQob1cx1dJ5S2SlzCmd3AWuvZegEgR/ak0rIUrV30nxLrHzZyzK9AJxlU/q1WpJA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXRTWWxUanc0a2xHcHN2cnFOVWpHbG83TUNucUhzdzFueklPc3lzNHZqSEZ4?=
 =?utf-8?B?SVpscnhjMGU4WW1XUk5IYU9tK1RRUXh5dWxpc0I4Z2VPTHd4WXJZN210MXBZ?=
 =?utf-8?B?czR3V1R2RDZQMlRhWmliTUUwY2Fwd2lremY0NUorRm8xZXZsajFtS2I2cTVm?=
 =?utf-8?B?R2NFYXo1RVpWanB3cG84T2FyS054K2cwZWg0QUJnS2RlVGNDam5vMkxJS0VD?=
 =?utf-8?B?bzhqL1hZNHdZTFlzZVlnSWRtVnZ3M3dHOE1nNlNhSUI1QldtNVRIMHJMTXJ1?=
 =?utf-8?B?MmxBcmNSTFp0MS9VK0Fhb1BsZ2JnRDdzaXVoTmIxRzVmNFdONVVkaVlDZG90?=
 =?utf-8?B?ZXBaRUx0NDhjT0lNcHBKbGhuZXZwRE53TkRzN1Yxb2hhTU9YeEY5T01ja1lY?=
 =?utf-8?B?Y3ZpeE80aUFPUmRTQ2dDTGhkM2M5SDFJWVRHR2lPR1R6OTFYSXhNRWRLeVhW?=
 =?utf-8?B?QWYwS0gzT1VNbW15UUpzR3RWME95SDBualJWZVYrSGlDaXkwNEF1eDNqTC9S?=
 =?utf-8?B?aTh5dkFNZG5DcThTcUVoeVRpSk53TjlOakhqNTZnUi9jbnRaZ2lDZTY2cTY2?=
 =?utf-8?B?a0VBeThaVmRudEE1dm8raGxGU0dNSlg5NU1mZ0IzMkwzVmN1akpOcU5GSmNB?=
 =?utf-8?B?R3RZN3BhTEtZZHl2akgrZ0VmQ2VsaVlZcEFkdGsvVGxUeWoxS3p4bU5xN1hH?=
 =?utf-8?B?am1kaFlPTFVLdFVtdzdSSk9uaEM2dDErT2JEVjNSN0hJaDRmZUd5UURMTVZX?=
 =?utf-8?B?eGRqK255dGZ3TDJXVUFXUzJOUlNBWWJLUnMyZzFKbG9RRnl0dnpaVVlGWXI1?=
 =?utf-8?B?bFBGamRKS0w4bmxXZnVvaFZCaDAxM3QvL292NElxRURqS1lOMGgxUW0yaHI0?=
 =?utf-8?B?MU0yaHVsQm1sbnhoRVZmQ0c4bTlacEN2RVBKM3lCMk5PZDNuVWZWS1hjSkpS?=
 =?utf-8?B?ZFlQRnBPS0xTdzl1YmhtSnF2bFdYSjg0eEhRUW1JRnBsMTNlc01QWUhjbkR1?=
 =?utf-8?B?bWZKZHQxSFRIYVhZOEF1Z01IbjJoMzVTdE1GOVRIamxaaUpXSU5rTGU5Ty90?=
 =?utf-8?B?eDRtdHB5RDlJSmFWc0VxMDVDblQ1dWFDYUI1ZVNRUkZHL3pSZ3YvVVVuaXU4?=
 =?utf-8?B?Wmw1aklHcmMwN25lUlBFcHdVVkt1UTBFSkpOVkh6eGVGU2QyZkhUaTJTYmk2?=
 =?utf-8?B?Um1sa0UrUHZpdFVoRWRuNHZ3SjlWTU9PUU5hbG4rSTVRSVROcDErVU5hdmkx?=
 =?utf-8?B?MHc5bWd3U2NOMEZrMUdhL2o0OElnV1BDVGZGTnIxT0RKSmd4eXA4NkVZUW9W?=
 =?utf-8?B?bW9EZHUxWXZuZWY1SWV5aXkvZkkyVGdBbnh6S1hMa3djM09KaWZ0SUZaZ1Nh?=
 =?utf-8?B?YzF1WDRTMFFmdFdLWHZ0b1k3aTBiT1lzTUV5dzVxS3FKVDZoY3VKWnY0YUVw?=
 =?utf-8?B?Q0h2Q3ozQ05rclloMkoySUxFME5iMGw3MnQ2a3hsRmhOd296WU5GZU9scWZJ?=
 =?utf-8?B?ZElJSDZ6Q3lhMGhmaWVySDk1eUJPbWQwZjlSSG92cVBYYzkvYVlSdllpemQx?=
 =?utf-8?B?WEtUNnRiUGhwbXZRVnVWaWx0OXNqd1doOERNVlZ1dGZnQmdLQ3gxZUIwOW9l?=
 =?utf-8?B?OERDL3dGTGF6d2tuRjUrTy9QK05PaDZxekNDdGQvc0FUYW9HVXpiRWdiZSsr?=
 =?utf-8?B?ajRpUGh5Q0UzSlUvZTViWTUvY2orMmhmcmRHUnp1LzRhTmlsVzNuMGNRRW5C?=
 =?utf-8?B?UDQ0VHVpNnMwQktkUEFPckh0MWZaVWU5cmswSi9aNGtLR1krcVlBSTlQSVl6?=
 =?utf-8?B?QXFKa3JBeFFmdWtuR1ZjeS91a0JsRDAwRENtRWZUT3I2LzRoVWp2SGhTUitO?=
 =?utf-8?B?bW80WEZ4MWp6L21WY0l3UFNNNUJJcmpRREl3QTBxRGM1bzg2K0dwTWVCbCtk?=
 =?utf-8?B?UG9tOVFjL2t4UjNsNU9uUlA1YWwrUE9YMThzREZZQ050dEdUcWYrK3R5cGph?=
 =?utf-8?B?YUhPN0x4U2J5b3NuWGpmYkxMRXlldmNBbzBuaHlmT3pneGNBeHJUaEYrUFZR?=
 =?utf-8?B?NDFTeUJ3V0JFNmIyMGtGK09PVmhIY09XZDUvWnhLbWFJT0RQa3VUY1pUb2px?=
 =?utf-8?B?djJXWjBmR3NmcEgxdElGQ1M2VWNUd29KRWpkbXNRbXc5eDl2UTgya2w5WEpw?=
 =?utf-8?B?Y0kxVElPRm5KZzh5RUxwRDlwWEI4bVg3Q2lDYUNHRWFVUFd3TFRBQXgyOEx0?=
 =?utf-8?B?cEY1MWlvM3hSNjROL2k0b1R4am9KTUkyeFZYcDBGUUNvaXNFV0Z2bHZTMFE0?=
 =?utf-8?B?Zy9hMVdRc3JrdE5zRFNxWVQvVEJGM0ZRakR5NCtTbmFEMlNvVk5EQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd92376d-c44f-48b5-1afe-08de79684510
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:03:07.8682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6chsOh9VPpCM4u4buEeDQDedG2SLqlgu8F1L6ToHNyxkQ2jt2frvhwQUJ+MkxyeQWXJraDbKWR3iQRyAqDCRpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8639
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_130316_174117_E8634A33 
X-CRM114-Status: GOOD (  10.84  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogRnJhbmsgTGkgKEFJLUJPVCkgPGZyYW5rLmxpQG54cC5jb20+CgpBSSBib3QgcmV2aWV3
IGFuZCBtYXkgYmUgdXNlbGVzcy4KClRoZSBwYXRjaCBsb29rcyBzdHJhaWdodGZvcndhcmTigJRh
ZGRpbmcgUlggc2FtcGxpbmcgZGVsYXkgcGFyYW1ldGVycyB0bwpXaW5ib25kIFNQSSBOQU5EIGRl
dmljZSBlbnRyaWVzLiBBIGZldyBvYnNlcnZhdGlvbnM6Cgo+IC0JCSAgICAgU1BJTkFORF9FQ0NJ
TkZPKCZ3MjVtMDJndl9vb2JsYXlvdXQsIE5VTEwpKSwKPiArCQkgICAgIFNQSU5BTkRfRUNDSU5G
TygmdzI1bTAyZ3Zfb29ibGF5b3V0LCBOVUxMKSwKPiArCQkgICAgIFNQSU5BTkRfUlhfU0FNUExJ
TkdfREVMQVkoNikpLAoKVHJhaWxpbmcgY29tbWEgcmVtb3ZhbCBvbiB0aGUgU1BJTkFORF9FQ0NJ
TkZPIGxpbmUgaXMgY29ycmVjdCBmb3IgdGhlCm1hY3JvIGNvbnRpbnVhdGlvbi4gQ29uc2lzdGVu
dCBhY3Jvc3MgYWxsIGh1bmtzLgoKPiArCQkgICAgIFNQSU5BTkRfUlhfU0FNUExJTkdfREVMQVko
NikpLAoKVGhlIGRlbGF5IHZhbHVlcyAoNiwgNywgOCkgYXBwZWFyIHRvIGNvbWUgZnJvbSBkYXRh
c2hlZXRzIHBlciB0aGUgY29tbWl0Cm1lc3NhZ2UuIE5vIG9idmlvdXMgbG9naWMgZXJyb3JzLCBi
dXQgY29uc2lkZXIgYWRkaW5nIGEgYnJpZWYgaW5saW5lCmNvbW1lbnQgZXhwbGFpbmluZyB0aGUg
dENMUVYgbWFwcGluZyBpZiB0aGUgdmFsdWVzIGFyZSBub3Qgc2VsZi1ldmlkZW50CnRvIGZ1dHVy
ZSBtYWludGFpbmVycy4gRm9yIGV4YW1wbGU6CgogIC8qIHRDTFFWIGZyb20gZGF0YXNoZWV0ICov
CiAgU1BJTkFORF9SWF9TQU1QTElOR19ERUxBWSg2KSksCgpUaGlzIGlzIG1pbm9y4oCUdGhlIGNv
bW1pdCBtZXNzYWdlIGFscmVhZHkgZG9jdW1lbnRzIHRoZSBpbnRlbnQuIFRoZSBwYXRjaAppcyBt
ZWNoYW5pY2FsbHkgc291bmQ6IGNvbnNpc3RlbnQgZm9ybWF0dGluZywgbm8gcmVzb3VyY2UgbGVh
a3MsIG5vCmxvY2tpbmcgaXNzdWVzLiBBbGwgZW50cmllcyBmb2xsb3cgdGhlIHNhbWUgcGF0dGVy
bi4KCk9uZSBzdHlsZSBub3RlOiBlbnN1cmUgdGhlIG1hY3JvIFNQSU5BTkRfUlhfU0FNUExJTkdf
REVMQVkgaXMgZGVmaW5lZAplbHNld2hlcmUgaW4gdGhlIHBhdGNoc2V0IChsaWtlbHkgaW4gYW4g
ZWFybGllciBwYXRjaCBpbiB0aGUgc2VyaWVzKS4KSWYgbm90IGFscmVhZHkgcmV2aWV3ZWQsIHZl
cmlmeSBpdHMgc2lnbmF0dXJlIG1hdGNoZXMgdGhlIHVzYWdlIGhlcmUuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
