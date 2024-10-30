Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8568CD6B6D9
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2024 20:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cgj5wjCaXrtL5EAUuTxyV3q5K6APBnpyGiwVZg5hsj0=; b=dEtvWLimMcY8OZ
	IryUETWENqOl03L44e4+eXQg6WoIJGKErJg+9FmQNAqncwkQAzX0ZKgRL9eyIV0sV1bed8yWp+xqu
	u8OaUm7ClAbghnONweSBQPdnw+XdKRLx2Y3qATokxdPUcekC9hjcVyAs00Z98msNjpkNDdDusW8l5
	JAiE9+/HcNsGcuPcDzviQpX26/1jJT/JGCCBS7aeswsIDVMoUjhxHfz6691B20mY2paaY9EbYLQxL
	aVJt5KBEGVQf9+w1ZnC03J3aUCo5S1WjLaSB+aY4oeE46DCMlseOj4pbA7HEOw2J9OdoMGLSNYMJJ
	zvLNBLkn8hnqG2JdO/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6FiM-00000001kLK-1CIA;
	Wed, 30 Oct 2024 20:54:50 +0000
Received: from mail-am7eur03on20627.outbound.protection.outlook.com ([2a01:111:f403:260e::627] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Fgj-00000001k9t-37qt
	for linux-mtd@lists.infradead.org;
	Wed, 30 Oct 2024 20:53:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBFLLkn2Gf2BHneqezroO/kYyq0ipOZdR5XrrxMb5wjwlJ3pWZbQ3A7UnMCNKl3yddVdV4aMDf+De4NkBGuAd/Gu/jOU4jPvQt1PAUxA1XTprUuqV31ioo7wfPqEXK08m6MNKPM7LK98HCNqT9wehF2bkJf/TgvmWf783izMwi8b0jIJvJaETk+kZuXhP8oh8x68lBxFfvrfxofIw6C3JEU1cE4/5zmLQzbEUaPEdqjFBtFuhJ6QW3D61g4Bp99NtijSjO6xLvPgvUR2ecP/p8CGPUoeVkozXBBG6aY2fVQJ8EFNrY7bnb0xqX1bW1UqlKW5VmfIVVIL9iO/3SgKQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UW4/JX+4XzGp9pKh4Pdq9q+J0XPPKfzH7gytiwyDpNU=;
 b=AYnHekTM+lGaIXVv1QB85C5Gt57PdBDftqozvs9grtat+LESjWnwubfcorX13h83qKh/PcfreVQZzQ6Hdvt6r7pUkmcK9lDMrnmMySTEMX3nWjWtIYwXU/5xU+Sr5KSBMmJT08fg4NZ/jwMyvwfjhJzKqL74KF8mHzCflU9MXKt5XNqsyDLvFQVR0SxehfZA3LALChWyJLL46zvhNv5TwBZzlvvS02TdwTzpn3TAIvYNVsyZ5ZM9QZvnvp/qBVN9tu8UgCAlqdWNq9LobwfZKpHnj5n3t1V9VMve049yJ4IXi17e5I4Y1GdHN6l/xq51ymJvah1nQAk2acXOVBQ9mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UW4/JX+4XzGp9pKh4Pdq9q+J0XPPKfzH7gytiwyDpNU=;
 b=QbyP1XV4sqK9grbvpYnhFFhzGoDrxHf/UdQo3ssxqpHzXkPPnE3Zuf4hXX0HFpwn+0nGM+e004DsZxk0JcskZQYEDWdNPK6NsKX2rN0hZ41QfHslELCaJfomOnFLfk9FzaaTHjCCFlq4zByGDM16tBvazzBup558nOg9pIegovDE70tNeMWED3szxPQBxQVDnbv5p4jgSy7QueEWogz8Kdejz3oEqO/YUxZ/o2S1MBe7BAepfjoGlkMBKzc3e0dATlbPyzEe8jJVMx0KmJpnYFko0IRpajDaKcqplZWizIws/LweQSt2qztjesvqRX0xaG3Q6Kf5KVyAQUXU1A5zgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com (2603:10a6:150:22::11)
 by AM0PR04MB6963.eurprd04.prod.outlook.com (2603:10a6:208:18b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 20:52:59 +0000
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::b7f2:1d0:6b6a:ba58]) by GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::b7f2:1d0:6b6a:ba58%7]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 20:52:58 +0000
Date: Wed, 30 Oct 2024 15:52:52 -0500
From: Han Xu <han.xu@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
	Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 01/24] spi: spi-mem: Extend spi-mem operations with a
 per-operation maximum frequency
Message-ID: <20241030205252.ufylezzvhravfqr4@cozumel>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-2-miquel.raynal@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20241025161501.485684-2-miquel.raynal@bootlin.com>
X-ClientProxiedBy: BY5PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:a03:180::39) To GV1PR04MB9071.eurprd04.prod.outlook.com
 (2603:10a6:150:22::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9071:EE_|AM0PR04MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b5a19c-178d-4a9f-8cae-08dcf924d629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lNhTdYAPQY46ySaMU28hY7siNinj9XVCnZQwrvMF+NBu1toKZl8Axoz12wRw?=
 =?us-ascii?Q?DmEQc4f/5a3Uy9QX5vgtvCklFcO0WODiBYp6921+d/0xDvYj+07+gi074bGS?=
 =?us-ascii?Q?oZ15AKzaZ4DSWUlxsSUQHqWjZTB/T3SJbfOB4l/QUwBKKwTvlVwrPy+atayR?=
 =?us-ascii?Q?CV6eniPAet5AdwwdovJisNWShpW53h2j5D/JE3X+QUYZQ0swMOj01BWSWpUi?=
 =?us-ascii?Q?tgSbi7fO0RQFQAKNvh0/uU6GkWacfLcedgogAR3J17e5MHd6cI7h3uWoZVSV?=
 =?us-ascii?Q?esuhPAikewiWEU4bTfL+KvkM9bzcWhKggyvQvc6JaUJ0rvfj1atmgxjks6Cc?=
 =?us-ascii?Q?Xh6YNPdQPlVpLr5xqNBeX/GweZB+HLyjP3RK5N5vcZgiuKTXN3eDXeAGYKwQ?=
 =?us-ascii?Q?RG61TXU/Sp+aAMTlmNcQk6a+bKKEdWW0H8pQktDrM+hc/F8yHkuZoE0OwIGf?=
 =?us-ascii?Q?GYfak3BHkX7F+zXerTjBqAnHjXAb5jhi7UoPpm28p6iSuSmhS8ZotIGUnN0L?=
 =?us-ascii?Q?l35p0VPaiU97FCPYZyHu7ihn284oRkZ7t1wg0HG4PY3UyzzZgU3HQxT6QRE+?=
 =?us-ascii?Q?xSVH2Z+oOwtgxGO6pgLENpvhLtbbv76sfH/GIgRoS6zYN5h+Zpa80fBQXV+q?=
 =?us-ascii?Q?T+UykRoxWY0eqvogEaH8OzlFJY/Jv9u3ssUA0dRV/UyLfZ9ShVk8DWiwuPwj?=
 =?us-ascii?Q?3J0tExJrVWZaOBMxyaqcDIV9ipjbUgSwGWrWA6OdzWtN1s9JFBXWZ2kj8BJ7?=
 =?us-ascii?Q?IvUWgJvAjAnC2MXP+Y6gtQrjCfpyiCz+bxHrCKZLbkx/KrQ+YFCc+UZ8+B0y?=
 =?us-ascii?Q?B7ogBFyASjL0bm+fffVA+sYrFkFQPyxutI1vRTK7xSjYEJ0K3nbHNaAuS+tt?=
 =?us-ascii?Q?F8UfrIIvxQdcgW8ydVwErT33LgLUXp1EUt4UuNWOb5HqrfWW7bsT/evUaW1g?=
 =?us-ascii?Q?kwcXLinljdgRet1p2BrH1gwoP6YurTEworLLZAAt2fGKgfPGCgISxWY+2Jz6?=
 =?us-ascii?Q?1SE69jP92S4bWFOdGJMCXfCqQ0Lo18lcR1Xqcx6qN4KTbaXL8SbNjBwDLhON?=
 =?us-ascii?Q?5I/6Byh9S29hWpG7+J3ZY+Hr73oZmcNUburpIZWsKY7EzPqcxnjIlY2wZjcv?=
 =?us-ascii?Q?ZkgxbvctsEkzw4RIBHSgMi6xzhuY0Dxsy5mcyLFAdc4qkDy5LGznzipenSxX?=
 =?us-ascii?Q?PaaNWpUa+AdojEOIELE1vA7gh2vxNEJ/6ZYUUssiVxJn5GgdIbzakTLvPhkw?=
 =?us-ascii?Q?vVrKrTwS2GQQAQq/OuWrV0l2gRs6ozAk31zl3x0lyIrHND24nyBDZthldF+U?=
 =?us-ascii?Q?mO1YKBIi5tfc7dQ/Ko0irMnQzhXSS+S5RJaf6W5CRjWYoj0rbfkKa9ATHy6p?=
 =?us-ascii?Q?3yP1YtQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9071.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KeHgYWwIpFhdDvCgR9scLsh8jXxO4GZ5VHaoXwD0zfQkyUYXeXvV09TtHdSK?=
 =?us-ascii?Q?2Yjo3/pn8j7M6P7d0SUGGrJ0rVK2opBcfyiksI6Laj7XJXV/VSQnM4CuEtnG?=
 =?us-ascii?Q?9IRl27Dm5f8mJ2F5+jumdJ3XPzcPqfA2hQFveFus7rnn0jqTDdOVM6eZz7KR?=
 =?us-ascii?Q?sQJuvvwcMdQaA32fgbTXhBpoH9ToS90bHf3IsPdKhrcQ5gHusEkwuvOlTD9+?=
 =?us-ascii?Q?w0k1/SN7t1R7O5ZBxwIDtqW8mfnLDajJmzKC36ZASIG7bIlQj+G8Gc9aaE90?=
 =?us-ascii?Q?9YxfL4BBPlX5tIpWnb4iVD2uJZVC5Nv9ebZ0XGPYN7ygY/bS0+x0vI4h7nVv?=
 =?us-ascii?Q?jqs60diR8lHDCfds+Tzy2N6cdaLoiiPq8j4DndfXS0xL5DGDEFXgZW5qCyHG?=
 =?us-ascii?Q?KBFFePmk+9/Gloaj/IoHC44DHwGMeU57aqOe180s/TVzV0rIWXdmK9cYofgn?=
 =?us-ascii?Q?nrYeIFncVr3wici+Frjd1TJut1feM1Xj1WuF9uw6jYe3HPhf+sq90UIOH0mG?=
 =?us-ascii?Q?N+JnwPzr7ZkrHkjEmynOjZcyNT14v5BUZG6pe6g+oJmuye7SHjrmo3L/OGH7?=
 =?us-ascii?Q?hShIMCNs4B124ff2nIfJLFophTEgBOrUXWhGAzuirsUubWq/ZLE3y3Q6ChM3?=
 =?us-ascii?Q?Cms3MfkR7t5cIDwGgXucHkMkW+G9T1EPRJuf6VAVTQOY/1q+aT6XFzDCNN4J?=
 =?us-ascii?Q?bwICBnIxeUBfDZWjjvf2AcelKnWQCZv4dR/YirFPTASEQ0I4lPIlVxJ161OH?=
 =?us-ascii?Q?ZMKkvTdcHn3KY8E3nnmoiA1ma8exGexC5sYAQaHLHFUTEcP3T8w+cO5yLw08?=
 =?us-ascii?Q?3J2hjcy2/kdgji2ybyxGcnQRXAJioOGnrUXyzR1I3psVlzClko1BubyONwFA?=
 =?us-ascii?Q?iQUjjRIFyce7D4XUx9kWU4cZHxufNiV50hCR01s/mGm+KpYZ2klKGVhWp03e?=
 =?us-ascii?Q?ZVpvoIdB2y9c47pfqUn3nev+3nCeQ6XGAo818Z6BNCaihRuq3rptxKg9aJw7?=
 =?us-ascii?Q?S1+3P5JK7sxDVoJKY5uM2oSn4Mv6pRqa/qMTgdM4aKVg7Q/yhW2nsP8DMsz+?=
 =?us-ascii?Q?2XrD0PpYSR+TsXnemgThqGdsG1D2L0RtWn1sb8FKlJr0j73Ymm1z2rcAJ+bY?=
 =?us-ascii?Q?sUyj3g+MlJLA3Yy6S4Eey4GwLFPX3a4fkfPGa3KfbFOojnqVssA2amloedpQ?=
 =?us-ascii?Q?/yiZJ7CwIA8ItfbnlU5GtJ/iT7uJ5AnfawBaaUuTY17bcgYk1cuoPC1PAW68?=
 =?us-ascii?Q?kiQTEQ1cwaiq7Q6S/cf+nC1ZhqqV+KNRWUSV2IT2SGICTA/TCjMvsy+UbgwV?=
 =?us-ascii?Q?gw+n3hOoXuFOJjebOHXELQJ0IETsspaQH+xT5t5U6kdM6nj0EfJ9EKR2cONf?=
 =?us-ascii?Q?InfJsKDG93y8s0TOGof8dnWL7hoawNLMcEycbL39Qmv+EEn0lBmOCtnJdOUy?=
 =?us-ascii?Q?nAGmLpngoX8wbcuzIDNofjeFRceHDOEgt9Htm+Q73xFlPxZBJWSUk0oVeZVx?=
 =?us-ascii?Q?z/GyYdzClNZdc2SWEC5HeY6kEUpOjNdeDQGoZUudN+evTpbo1SCRyZ+vKugQ?=
 =?us-ascii?Q?+pq4C3RPo0BALYmy58TF5FxZae6VZs/SvHbUMWzU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b5a19c-178d-4a9f-8cae-08dcf924d629
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9071.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 20:52:58.8619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymYbtoZa7GCOz0D84dZ+LCNdp3PAHhIj/ZsyasS5O2obehiSvNdr5kyRDTkDIdsq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6963
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_135310_011276_9038D8DF 
X-CRM114-Status: GOOD (  42.16  )
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

On 24/10/25 06:14PM, Miquel Raynal wrote:
> In the spi subsystem, the bus frequency is derived as follows:
> - the controller may expose a minimum and maximum operating frequency
> - the hardware description, through the spi peripheral properties,
>   advise what is the maximum acceptable frequency from a device/wiring
>   point of view.
> Transfers must be observed at a frequency which fits both (so in
> practice, the lowest maximum).
> 
> Actually, this second point mixes two information and already takes the
> lowest frequency among:
> - what the spi device is capable of (what is written in the component
>   datasheet)
> - what the wiring allows (electromagnetic sensibility, crossovers,
>   terminations, antenna effect, etc).
> 
> This logic works until spi devices are no longer capable of sustaining
> their highest frequency regardless of the operation. Spi memories are
> typically subject to such variation. Some devices are capable of
> spitting their internally stored data (essentially in read mode) at a
> very fast rate, typically up to 166MHz on Winbond SPI-NAND chips, using
> "fast" commands. However, some of the low-end operations, such as
> regular page read-from-cache commands, are more limited and can only be
> executed at 54MHz at most. This is currently a problem in the SPI-NAND
> subsystem. Another situation, even if not yet supported, will be with
> DTR commands, when the data is latched on both edges of the clock. The
> same chips as mentioned previously are in this case limited to
> 80MHz. Yet another example might be continuous reads, which, under
> certain circumstances, can also run at most at 104 or 120MHz.
> 
> As a matter of fact, the "one frequency per chip" policy is outdated and
> more fine grain configuration is needed: we need to allow per-operation
> frequency limitations. So far, all datasheets I encountered advertise a
> maximum default frequency, which need to be lowered for certain specific
> operations. So based on the current infrastructure, we can still expect
> firmware (device trees in general) to continued advertising the same
> maximum speed which is a mix between the PCB limitations and the chip
> maximum capability, and expect per-operation lower frequencies when this
> is relevant.

Hi Miquel,

I met the similar problem when working on the Micron MT35XU01GBBA SPI NOR chip.
The chip can work at 166MHz in SDR mode but 200MHz in DDR mode. I found Read ID
failed on some platforms when using 200MHz as maximum frequency, so I have to
lower the maximum frequency with some performance loss.

I think the patch is useful but the SPI NOR doesn't have such vendor-specific
predefined SPI_MEM_OPS like SPI NAND. Do you have any suggestion on how to handle
this case? Thanks.

> 
> Add a `struct spi_mem_op` member to carry this information. Not
> providing this field explicitly from upper layers means that there is no
> further constraint and the default spi device maximum speed will be
> carried instead. The SPI_MEM_OP() macro is also expanded with an
> optional frequency argument, because virtually all operations can be
> subject to such a limitation, and this will allow for a smooth and
> discrete transition.
> 
> For controller drivers which do not implement the spi-mem interface, the
> per-transfer speed is also set acordingly to a lower (than the maximum
> default) speed, or 0, to comply with the current API.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/spi/spi-mem.c       |  8 ++++++++
>  include/linux/spi/spi-mem.h | 11 ++++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 17b8baf749e6..ab650ae953bb 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -356,6 +356,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  {
>  	unsigned int tmpbufsize, xferpos = 0, totalxferlen = 0;
>  	struct spi_controller *ctlr = mem->spi->controller;
> +	unsigned int xfer_speed = op->max_freq;
>  	struct spi_transfer xfers[4] = { };
>  	struct spi_message msg;
>  	u8 *tmpbuf;
> @@ -368,6 +369,9 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  	if (!spi_mem_internal_supports_op(mem, op))
>  		return -EOPNOTSUPP;
>  
> +	if (!op->max_freq || op->max_freq > mem->spi->max_speed_hz)
> +		((struct spi_mem_op *)op)->max_freq = mem->spi->max_speed_hz;
> +
>  	if (ctlr->mem_ops && ctlr->mem_ops->exec_op && !spi_get_csgpiod(mem->spi, 0)) {
>  		ret = spi_mem_access_start(mem);
>  		if (ret)
> @@ -407,6 +411,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  	xfers[xferpos].tx_buf = tmpbuf;
>  	xfers[xferpos].len = op->cmd.nbytes;
>  	xfers[xferpos].tx_nbits = op->cmd.buswidth;
> +	xfers[xferpos].speed_hz = xfer_speed;
>  	spi_message_add_tail(&xfers[xferpos], &msg);
>  	xferpos++;
>  	totalxferlen++;
> @@ -421,6 +426,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  		xfers[xferpos].tx_buf = tmpbuf + 1;
>  		xfers[xferpos].len = op->addr.nbytes;
>  		xfers[xferpos].tx_nbits = op->addr.buswidth;
> +		xfers[xferpos].speed_hz = xfer_speed;
>  		spi_message_add_tail(&xfers[xferpos], &msg);
>  		xferpos++;
>  		totalxferlen += op->addr.nbytes;
> @@ -432,6 +438,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  		xfers[xferpos].len = op->dummy.nbytes;
>  		xfers[xferpos].tx_nbits = op->dummy.buswidth;
>  		xfers[xferpos].dummy_data = 1;
> +		xfers[xferpos].speed_hz = xfer_speed;
>  		spi_message_add_tail(&xfers[xferpos], &msg);
>  		xferpos++;
>  		totalxferlen += op->dummy.nbytes;
> @@ -447,6 +454,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  		}
>  
>  		xfers[xferpos].len = op->data.nbytes;
> +		xfers[xferpos].speed_hz = xfer_speed;
>  		spi_message_add_tail(&xfers[xferpos], &msg);
>  		xferpos++;
>  		totalxferlen += op->data.nbytes;
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index f866d5c8ed32..8963f236911b 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -68,6 +68,9 @@ enum spi_mem_data_dir {
>  	SPI_MEM_DATA_OUT,
>  };
>  
> +#define SPI_MEM_OP_MAX_FREQ(__freq)				\
> +	.max_freq = __freq
> +
>  /**
>   * struct spi_mem_op - describes a SPI memory operation
>   * @cmd.nbytes: number of opcode bytes (only 1 or 2 are valid). The opcode is
> @@ -95,6 +98,9 @@ enum spi_mem_data_dir {
>   *		 operation does not involve transferring data
>   * @data.buf.in: input buffer (must be DMA-able)
>   * @data.buf.out: output buffer (must be DMA-able)
> + * @max_freq: frequency limitation wrt this operation. 0 means there is no
> + *	      specific constraint and the highest achievable frequency can be
> + *	      attempted).
>   */
>  struct spi_mem_op {
>  	struct {
> @@ -132,14 +138,17 @@ struct spi_mem_op {
>  			const void *out;
>  		} buf;
>  	} data;
> +
> +	unsigned int max_freq;
>  };
>  
> -#define SPI_MEM_OP(__cmd, __addr, __dummy, __data)		\
> +#define SPI_MEM_OP(__cmd, __addr, __dummy, __data, ...)		\
>  	{							\
>  		.cmd = __cmd,					\
>  		.addr = __addr,					\
>  		.dummy = __dummy,				\
>  		.data = __data,					\
> +		__VA_ARGS__					\
>  	}
>  
>  /**
> -- 
> 2.43.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
