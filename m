Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C6F105A583
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 11:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jdsvywzzeGqqu4mRXi0pRgbFzIW8Bepx7bShXCpmYI=; b=RhUCx2Lzx2VO3C
	9/f4DW/QzsCaUvYqCcOP4ySTzC4VbUEvdtQVXL+WuI0Y4y9TE1ZgIQRiTrWpkp+g0PmyjNRdEUVMM
	Q5MFKW9qWmk6FwHfd6vdEUWvwO4idfw2kOmK8xD7OhsV9Qtl8ZR12UsFnDz42yr7gaPRzVxugrbe3
	vpuM3GH1b3axTLePjWTItvS9DHiDkW5+mcU3PF+TLUnNpC6csQpj6k8udfuVBaccoTGN/ooQzAXOT
	8Az1KtUgJ6OAo+Nc+ybWgOBCCHIO/G0jv5bGhYYGCpMSCB8s52u0HxGq8PRptDnkGd/xBH/PrdLJU
	gdEBUzCJAQ2tO0EWwe6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eCz-0000000DweA-1KBT;
	Thu, 12 Mar 2026 11:28:05 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0eCu-0000000Dwdg-30yS
	for linux-mtd@lists.infradead.org;
	Thu, 12 Mar 2026 11:28:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C467ZLtaFaHQnsHACbeSKBkGT2ze+02TdRz5oqoWgGL1uwj99uGyaqPV0PRTaXV9VY2WFSDrri3jldfgjmQwxKUrPQ8o5AHoREtZTr/6DMX/Jf3KNjLkoh+gm3wHaVmVzjv2kvD5h9VcEPYTJaWKpq7c+gVhYVRO2MP8EK1aWRR8s/+xQohz8HxijThxXb1TjWC/kf0OUHH7uKkFcVfif3U4jojB70mTRGjQRGBG4+5n3mTZB5Atuq3mw8mMDvOXxa9nBKATGf1jwSqE0ymMnEHYlXMq7otxRdaac8P1ivF9G8AgKCNEPF7B3pF5vUHrqdlnmr/3MUbUDQOn0Ev+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzeY5GGRFjMTM9zs0OhDs+emmbDZsxaVVHFcer0Urr4=;
 b=LFDVQSFBuT2ZLRnz0bPfe2g5NDA5SFHcB19VvgmjbV1uN2BBGSenBft81Qxvu1uHZz9xtbrWnFTFCs51Wofs+2NLhU29LCFSm9CxIYrrtmljYgvas+BG1VIEqQWvZfhTt/kjdOSwZnNUQBgNhZaPIQXFjVgb9NuMJJhwggw8ghRdwWXVWVnrAFcYsm7hnrTYRTreux9LubcBLCm1grBuEdt7XDAqiGmaiLDaDgOasDysEgFN99BROncSsuaOMgR/Hu+M1gzUEXWdf4maGz/rcof4Fm4pMLbdhRNPTh3cDh8F98biUBBNYwDsQ8KuMnmgdHh/3oOzqAqKQf4ynIPDeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzeY5GGRFjMTM9zs0OhDs+emmbDZsxaVVHFcer0Urr4=;
 b=ojbKU3Tw06XCOTLTtXcStX/ptICB407XRFWkFC7lz4kW/P2i9Ct/8I9/4qoVqNELcK59xjGywZ2oae1jvgmtXnqWRZma7OACFyItYW+Dlcetxi2kIgjA6m8+oNeedlxMZP9FvjIlx1sO/ghzYSCUGe6srs1gIpyVpvjUxUtVsjg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB7243.jpnprd01.prod.outlook.com (2603:1096:400:f0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 11:27:50 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9700.015; Thu, 12 Mar 2026
 11:27:40 +0000
Date: Thu, 12 Mar 2026 12:27:27 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>,
	Weigang He <geoffreyhe2@gmail.com>,
	Daniel Palmer <daniel@thingy.jp>, Benjamin Krill <ben@codiert.org>,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: parsers: ofpart: call of_node_get() for
 dedicated subpartitions
Message-ID: <abKjH4ZQlwM_sl5V@tom-desktop>
References: <20260311153957.1984446-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260311153957.1984446-3-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Disposition: inline
In-Reply-To: <20260311153957.1984446-3-cosmin-gabriel.tanislav.xa@renesas.com>
X-ClientProxiedBy: FR4P281CA0316.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::16) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ca8ddf-7046-4854-25d9-08de802a5f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: AFodludiyHulxJw6U9xsl0Zgw0+3rfrXfuGxsxYwrkNwIWsXjmfLqnodoHbO/kR/GX3cA6tFaO1QRiyY+/+sai7xys+lvHy9h/qjEOvVpg0cgM00XWneeD8Q6yTm7b09eEUG2J6p6uIU6htAKifZ3luUDvJG99POCr6Xz0VyMIhtxbqx0yfJ1K1DADB1RC3NX8ARZd0ZBz7Moyh8LqIg2e4+Y0MB13yP6GYpcPmKTPrB2ASLOKDW+hDNMDoyYSQJ1O27s87+u+w94o19klZ+CjEosedu6LpBb/Hvz3rXuwKPYp5MPz6A4CVIDuZg5GotUSvgB17yHMeIC9qCBSA7WzfIQUiqbA759gpI099hfTrDD5HiBuvLd55zjWUDogTGF+HA7PaR+O1XgqdESoQR76i8kulFaWQGCbU9mZhkZTU001clJYR7KiHcTNndD7E7Z9ogsvGLLo1lDO1NwgaOBz1YklHaQ4+QbrqIinP0FU0jmlc2nLAavhpn3y+nRWuv/CcUe42G8FBm00BgWtIIqsAEPmZRDoYcoSzkRABWa9F9wRWmc/Ybs5kp8BbXBdHGDY25B1029lAHRTvgQoRtikJUBeD9mk882yn1HCk3EmOLaLGuaZYa24a6kGs5orZEf8nN3uZBkqHbDhHEs8mm2WfVGKy1fIUWDxleQRCYzPvXrcJeTUb9Y7aS/jLZfL4nTy/6IZa1zosD9W+3Zt7K3qnzpAAXir14dK69N3Orna1YYG7g+co3tb+AyBaGlgkuKRRvyVFek8muYr+m4IMERI1hxlNRuY0bi3v5aJP03JQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XxVuu7m5CcmFNcxE+yMBDaepYObFzkagbbFOf13N1oRr+C4+K/WzPFPRlVFR?=
 =?us-ascii?Q?fWS3V41Eq583sU4eEQK7LNfF5yftFYrKgeTyvZOR/di5EEOibIkfoLlkawWg?=
 =?us-ascii?Q?Sn5XaT/eIHQ8G7Kvm2YWgRul8qLdrgC7wXB71BuPYYGg/KZppzKuwcsZspY8?=
 =?us-ascii?Q?uGMGnkCvmKBKMxklndEszY2Q0NpThPAC9BygPC208D6gLkYLnl111l8Nohdq?=
 =?us-ascii?Q?5kYAr1+cNzZFu7+fd9fKi6haaXU2moSzC+USSoOu4df31/x7H55Tq5NtiCGE?=
 =?us-ascii?Q?BMcCAc0QLmVSL8faO+ZgeXUnGyFCShYvW3+/IxAD7QrK/BacXzVF0dasSSXh?=
 =?us-ascii?Q?Ji9bckWe/ydRJIm99gzJRqxX+Tc6A0k/W7Bjvkzl/yolSjw7JRMNkcv7fQ96?=
 =?us-ascii?Q?dcN2J3GylP5QzxEa0woOdxjOZ4ROpC+zoZJI2A8BOcRGRYDdT/dCigN0lYN6?=
 =?us-ascii?Q?ayQHFSwwKFw5ridGchFQuR3AMYxiqikN7uIyiOAv2GCGdh3jA3jn4ItNExwa?=
 =?us-ascii?Q?xZu/CNvJmxSs1F7cb3Yh6R4OAjB7cB+h6wLe6AuQIuVub89Sp5f/d+u4HnuH?=
 =?us-ascii?Q?3BxPaAFopxepd5mCv2ypGZXN3/g+/nK8tvOD8BmgGU1lXtyqHkGxj89iPMQS?=
 =?us-ascii?Q?7IhpowVjf9WIvicjZN4u2HKlSL1bx0bARd/YJHbqywPkOVnmXtW37McLeDgv?=
 =?us-ascii?Q?fuBBHWFwS+OjzQHJAVN2WJHzuO0OkoexHtsC4jT0vvFCgozhJIaKEmG6oAtz?=
 =?us-ascii?Q?EOJ0fx0cW2NbAkY3nia07LKTg4Fcna6mcpK39MMjMIV3yd8G6n0SByy2yxg2?=
 =?us-ascii?Q?K1/352wB4D98TGsa9wTDs7jEdMrlm+cgWA9QC+1LARX8YuglhRuRZ7Zb/9bm?=
 =?us-ascii?Q?P4x/kBq4tjxlI8z9bI9k9s/or6V8fxqQiz0KB9F0e+T1vyLjFJXeY1CcMIKn?=
 =?us-ascii?Q?SJjnihD382g056cRNZH7czjL48yDX019uKTazWwwrxMNlu0em817f+3jeRdW?=
 =?us-ascii?Q?MQkt2cRYTgqnackHGKVnAOYmzohKOvSj4Eo6S7Uxjs1l8TzMqHuHyJUYX2iB?=
 =?us-ascii?Q?F7YXjVoi03nVVmijPi6awfbiWkLInX7NQaRc8mFAixUx1NaDkBiP1NuJB7Uy?=
 =?us-ascii?Q?lZ2F4BRK4WRAfSOGoMinAOItaADkQzrouFgl9GRpsndRzTmpIuoVj8HDHBdB?=
 =?us-ascii?Q?AjL+4nXz77zOA1++QPgphMX/F5oqAT/fQ99u7QD0hRvZfeCHIEvCCpYQ6fPN?=
 =?us-ascii?Q?QFEbJkPDR5WHGojvB9FM+QE4Xmf2W4QLU3nHETGMf34VnKLHBHm+OcIrMw+Q?=
 =?us-ascii?Q?Dl5Me+dHEGo3fhfaSQzZyoI+PkE5FfymPSAsGISLccGTlApgtuzoy/6X9SMa?=
 =?us-ascii?Q?51Ps+gOPZfYwBv2Mu2jlFzYS5AL22jCEeG2X9QcfnllpAeUQDSb6f86KVudd?=
 =?us-ascii?Q?tDO3a1/ZPsbI0T9I9/U7E19V5eUFZLf/BgyoKK+ni563yxAcvVS+VzOdHu9+?=
 =?us-ascii?Q?+FLNIjq+M9auf5ILwV4js8l/RYuItg7tsRjYAiM+fZJ7UsmWKMi3wrE4FP+P?=
 =?us-ascii?Q?J34ajxam2J7pAimJMYmQPWZ5eZwsDE7zhUQNMMkddzCqOMTRlOUiil92sKGD?=
 =?us-ascii?Q?32P+SuoyZSxv9QRLQvt0gWIW8OudmsoWOeywB0o7Qte3DCP5dRAtZ10zvvlx?=
 =?us-ascii?Q?jzzNJOuw164RknvNZFpMpYwebSS0r94J3SLvrVyjZMK0LxVqdiORQ6SZECL5?=
 =?us-ascii?Q?X2ZZSgYWa2dOXcFuTvrb0wNOZYPdx9I0LKCy5A3p8qmUcGEyTdKq?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ca8ddf-7046-4854-25d9-08de802a5f0d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 11:27:40.6736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OITWutx2KYixpO6bPOtWk0X5AtUKbctsM/nDNHPrHxw/JAPbpDUe7xxNsjbQF5B1/uy0pbAK8JOgeKen0o9dAyqgNokB0TVfeEdwUd9xNOIjjbYuR7+v/aSdK6ylJIF1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7243
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_042801_156322_75E64C29 
X-CRM114-Status: GOOD (  23.85  )
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

Hi Cosmin,
Thanks for your patch.

On Wed, Mar 11, 2026 at 05:39:57PM +0200, Cosmin Tanislav wrote:
> In order to parse sub-partitions, add_mtd_partitions() calls
> parse_mtd_partitions() for all previously found partitions.
> 
> Each partition will end up being passed to parse_fixed_partitions(), and
> its of_node will be treated as the ofpart_node.
> 
> Commit 7cce81df7d26 ("mtd: parsers: ofpart: fix OF node refcount leak in
> parse_fixed_partitions()") added of_node_put() calls for ofpart_node on
> all exit paths.
> 
> In the case where the partition passed to parse_fixed_partitions() has a
> parent, it is treated as a dedicated partitions node, and of_node_put()
> is wrongly called for it, even if of_node_get() was not called
> explicitly.
> 
> On repeated bind / unbinds of the MTD, the extra of_node_put() ends up
> decrementing the refcount down to 0, which should never happen,
> resulting in the following error:
> 
> OF: ERROR: of_node_release() detected bad of_node_put() on
> /soc/spi@80007000/flash@0/partitions/partition@0
> 
> Call of_node_get() to balance the call to of_node_put() done for
> dedicated partitions nodes.
> 

Tested on RZ/G3E RZ SMARC Carrier II + PMOD SF3 connected to the
PMOD0_2A PIN HEADER.

rmmod spi_rzv2h_rspi
[   35.256402] Deleting MTD partitions on "spi0.0":
[   35.261078] Deleting scratch MTD partition
root@smarc-rzg3e:~# modprobe spi_rzv2h_rspi
[   38.058443] spi-nor spi0.0: supply vcc not found, using dummy regulator
[   38.083410] 1 fixed-partitions partitions found on MTD device spi0.0
[   38.089799] Creating 1 MTD partitions on "spi0.0":
[   38.094597] 0x000000000000-0x000002000000 : "scratch"
root@smarc-rzg3e:~# rmmod spi_rzv2h_rspi
[   40.996747] Deleting MTD partitions on "spi0.0":
[   41.001390] Deleting scratch MTD partition
root@smarc-rzg3e:~# modprobe spi_rzv2h_rspi
[   44.878004] spi-nor spi0.0: supply vcc not found, using dummy regulator
[   44.903571] 1 fixed-partitions partitions found on MTD device spi0.0
[   44.909980] Creating 1 MTD partitions on "spi0.0":
[   44.914777] 0x000000000000-0x000002000000 : "scratch"
root@smarc-rzg3e:~# rmmod spi_rzv2h_rspi
[   46.070797] Deleting MTD partitions on "spi0.0":
[   46.075469] Deleting scratch MTD partition
root@smarc-rzg3e:~# modprobe spi_rzv2h_rspi
[   47.093567] spi-nor spi0.0: supply vcc not found, using dummy regulator
[   47.117508] 1 fixed-partitions partitions found on MTD device spi0.0
[   47.123914] Creating 1 MTD partitions on "spi0.0":
[   47.128716] 0x000000000000-0x000002000000 : "scratch"
root@smarc-rzg3e:~# rmmod spi_rzv2h_rspi
[   48.032784] Deleting MTD partitions on "spi0.0":
[   48.037425] Deleting scratch MTD partition
root@smarc-rzg3e:~# rmmod spi_rzv2h_rspi[   48.520216] kauditd_printk_skb: 5 callbacks suppressed
[   48.520229] audit: type=1334 audit(946684832.940:22): prog-id=18 op=UNLOAD
[   48.532257] audit: type=1334 audit(946684832.940:23): prog-id=17 op=UNLOAD
[   48.539123] audit: type=1334 audit(946684832.940:24): prog-id=16 op=UNLOAD
modprobe spi_rzv2h_rspi
[   49.047496] spi-nor spi0.0: supply vcc not found, using dummy regulator
[   49.074166] 1 fixed-partitions partitions found on MTD device spi0.0
[   49.080554] Creating 1 MTD partitions on "spi0.0":
[   49.085348] 0x000000000000-0x000002000000 : "scratch"
root@smarc-rzg3e:~# rmmod spi_rzv2h_rspi
[   50.050056] Deleting MTD partitions on "spi0.0":
[   50.054703] Deleting scratch MTD partition


Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks, Tommaso


> Fixes: 7cce81df7d26 ("mtd: parsers: ofpart: fix OF node refcount leak in parse_fixed_partitions()")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>  drivers/mtd/parsers/ofpart_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
> index 181ae9616b2e..262c4221d23f 100644
> --- a/drivers/mtd/parsers/ofpart_core.c
> +++ b/drivers/mtd/parsers/ofpart_core.c
> @@ -75,7 +75,7 @@ static int parse_fixed_partitions(struct mtd_info *master,
>  			dedicated = false;
>  		}
>  	} else { /* Partition */
> -		ofpart_node = mtd_node;
> +		ofpart_node = of_node_get(mtd_node);
>  	}
>  
>  	of_id = of_match_node(parse_ofpart_match_table, ofpart_node);
> -- 
> 2.53.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
