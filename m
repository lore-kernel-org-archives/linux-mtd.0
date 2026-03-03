Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677A6EDEBF6
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 21:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NhW9z0U0LK9cuqrhYHXxAndUT28ZLNlaK53rSAMpdk=; b=xfv2Hd7VXPgnxH
	fLnuIA7MrrLTdKS+A7u5D3tYH1QOuX8cuky5G111+HJYTO0ZpczCBaXZ3A8dNECsPT+8QghnublB+
	LPwfPVhliGplMsmsgfElo1EC13rXIqdEqOBkYR6+0Yacz6rgShDh1us842s4kvDOXMvZhhrU7uyGq
	Og51SPowFB+/q6bDnSL+MLC0b/DOV5P0/fDAshCTCF9RooZwwWCOBXSyP6WtrjrPcnE2vhtga9T9K
	tCHc9dA16VtkayW/MFihBeNyGz9MnC/zfzgI+NVt+jJ/uE5+DM09G/EcAJczAHd7K7rdQRG0yAlrj
	fRUkJh3hAphGJkg886MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWth-0000000FxKv-3pfK;
	Tue, 03 Mar 2026 21:03:17 +0000
Received: from mail-francecentralazon11013034.outbound.protection.outlook.com ([40.107.162.34] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWtf-0000000Fx1H-02X8
	for linux-mtd@lists.infradead.org;
	Tue, 03 Mar 2026 21:03:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQU9JpGf3iLlSOALuglb86I1gELd9cyxCxU1S/KbPXl4s6QQE6w6RG7pnrZICa56llNCg6fKi6a2KWYmL0+AwqX9Ol29ESYZW8mYjGPQBgEEQgDw9Q72Ox2Jpefn/f0SmWqwbgLIK5rSAwvlWdPrEeburwG/ZRJ+C+9IWeb1N0Nm+7VNuSC8cdDdIMHHwcFd15kTHOymhvgSzf1L4pZmfIhCc5XqCcM9CxkR4eEJBRzHw16D/bpf7eixgpE9jjDq/uApnhkNZNY27lsveMsediBDgyRe0Z12KpoNfvnK/Au1kBkf8yxThtZFnX5NSU8P0gX3ag2Zw8hyc1Hp0P7OWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYG0XSCpEmu7+M3Cljqa6KbEAVooEdSVoBcM62IKIhs=;
 b=duc0aAa0oCLujmpj9I1GuMA/4wZx8ob58wLUhvUsz7evWkrTOBdBbKQvYbvDIpfLuA4rToSWtWw3aZg1SnJ6fk5zhGlNpkWmeqc1DpTCOBQvRSRDnToCt0UX8EOgATSejvt9peDvJUpberrxQOnyvKyTkTm0y8nFoA0NrChGTcNhHto6hlgOXUddjMPZNdFmDpM3+mNHTsKO6wySq/pTqIacC/wj7nAL+udLC6JXL2cyrmYJgTE326a73DVq7nn/3rVqaiS29NtxwbGdL5RhcfONoodC1AgcvSWj8R6aKHhsi6v5j3b1t/J3dPWHrTC40hz/5LRV/zH7cuyH9nmgOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYG0XSCpEmu7+M3Cljqa6KbEAVooEdSVoBcM62IKIhs=;
 b=ADe0yrOkFBGLKareZWnwpvOYBdSpDBpEaqo2PWKTXzIoyLe8D8xi/8UJCK2omlajONLP+Bx28ZtnLGzaL55DLi4IUphbre9rUDqKPUTPYPAHRVccxP9dUc4Btkim8uDKXNhMjIrCWzqQ0ks0YeMtXaFptSqScQ/iEG3C5s1WpwenVwVFtEZ8b0yBphAki7RawGTLb0Fxz4KrxPEbiNp0flkzif98HGLKwEdeYbcZLwmnTKLDziLB6+kOkO+GtdKYcSpBo8oWdJk4iA1R0MI5hidiMUdyH4dm2tdriUWYxqctwUHORTiNPZ4O3K/1mY0o13NtJionjxbGf4g7+Unu3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 21:03:01 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 21:03:01 +0000
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
Subject: Re: [PATCH RFC 2/7] mtd: spinand: Add support for clock to RX delay setting
Date: Tue,  3 Mar 2026 16:01:15 -0500
Message-ID: <20260303210131.2966214-20-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-2-9326bbc492d6@kontron.de>
References: <20260303-fsl-qspi-rx-sampling-delay-v1-2-9326bbc492d6@kontron.de>
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f8b059-37e7-433d-a9ca-08de79684173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: RPEKjCKvSAV4r6Ya0Te140mZlcS/s0zRUeqT5IFq7Ktvex15EaQLGg5CpMADrCptbZoSbX13bl6lAGP5bZ1iq8e2Eye8DvDRPX3jkBAHEIW5LxMSo6AjKMVK3kU30/TSHk11aHur9k7wlUyIGGEHg5wLFaWILWNbuj4xMXFJLIzO6Gf/TApaeTieVtyyiKgKcWslTad9+HpbLzlGjoCGXTu7EpZa9FquoxqUAWZA1paFtI1bvhOczhg9sKoGqlBgm1wg+H1ZaC9GcD0hnW92LmA0RRimlK3pUpYIpkDd4eCaGjt19RhPYZ+9YZRtNWGDgy0kM98+p+3sn2tqBzbEa7WFQgrdhrRNyvRb9wfI7n83yNlNBulwwhunz0eQ3wXLdkOByDdblFnj6sy0UhAjuQ/aR4JAet1OpK+8n36v/HsablK15kdrf1c+B7fEkbQ2I5PKcXZrNO7izp9Z/CWUA4s8fTniGL+o5iODt64lT7kuAkSuH1YysnXMvpMWagUwOBPMQ3RLt7J58PRy0jVdX4y4znZ8GW5Cvyy87gvDaC0Lwn7iDc527l7Qt4QGFWt/s/HqyMH2MgspTqf6UvHsJ9rqRx25JtecWHA6B3vpHVZsexnm6wjPq+k4RpXDOXseuAws914zhsLoQ0CQwi9NIWZ0iyhsZ9jVonwKaGRqVP2pkwbah7pK/6FIEyufvtROiUCxd2v9ogsihiCUbgAYBLEe5ZVi+OrR+SMIoL9o0xte0YKbfC/DNur5Z6vDJCEUrzrWNTXdCLs4GzdHxg3zMxFdl2E4iwDv/JUY2UAnp/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zT0WVJ91wfBPRWU75o2bi15EU5gMD4tXdWHZwcCq7fCHB7CtKHvhfuRJ59Af?=
 =?us-ascii?Q?3/kpt6Gi573q1CauQN6g8BcD4X+DQ1LZIjQ2PkjuQfZkkqfwUQEudqPW/ddo?=
 =?us-ascii?Q?ppPEbZ5CDBOZ+SHtVGses6DVmcR/XZv3JZVjLjlzCvrWb2ZnVGq+5Xb5UWFI?=
 =?us-ascii?Q?vKKz0A8mZWTiAGDvzespW0pEiTNwjvuOF+hm/twisjEpFGX9BAO+z14dk9ja?=
 =?us-ascii?Q?tCJnGfZ5BZaOEjrDGEm7muftAfyvymtXhKORn0PLfFEON+okJI6GXsTUXeJS?=
 =?us-ascii?Q?Tu4cOoATijpQO4gwTw9pkPcVxwzxw+WyMR4lIM8CNO0sWGiLdRJ99NaRJkzw?=
 =?us-ascii?Q?F8v3YHVj5rHdUJpLUR8mSuxJLvGtjf9DjU2uLa2lfBPYSMYaG0C4G+i7abbV?=
 =?us-ascii?Q?4CyekE+BgKXZZFgH+RibrvweZdOXWoptKtQAxCPmLA8cEIorP5h5CCp9XgW5?=
 =?us-ascii?Q?x7v5jJQgzusS7AYTn3n+yjcLDdzKKFMwyw6q/2mWYtLNiPGXv+nawRk/koB/?=
 =?us-ascii?Q?PfH281f/GQj9zA41xZHH3W/HJ4/xbedDEfDLPoLIqEkJOrn1hVRhkyqwpzyJ?=
 =?us-ascii?Q?ra+x5qWNBcfVv9YTGlh7akqDMibkUICOwtsesf/DxgGlzpZCIjFcctO2emOk?=
 =?us-ascii?Q?zJChoqFOk/AboiwrpXZPew12ARLGTiIYgjrJoKRifjqtetizHuq3zFKIOzHI?=
 =?us-ascii?Q?+AfK/OxVndDdm6MBoBGcl85wsZbgH6o7N/xhoaPz+FaabDrE3etf/fQ5+uXe?=
 =?us-ascii?Q?bmp8JevdGmgOeCDh7VnUEh4aUnwTB8lXzu5s92k0pSleW9dfMyQOfuED8NF3?=
 =?us-ascii?Q?NFo8+554WXSBeV5PszYlEPZl4Ktv5cIV8+J0HwfSwUKX/1zLfQFPXMB2pzPW?=
 =?us-ascii?Q?QJNA0xlu6VhSjVrSJQT+Jqe2ThjOpD+fI63wtLIhjfn+JZdbMcXlOEPuf/w/?=
 =?us-ascii?Q?rgFE2SeaDfFsQbvraaf/GuBkpGKlhNkufneb5kbJqvrCOs+8XfFh8O48qh66?=
 =?us-ascii?Q?uqcGwe7T4J0loOEFuWOvtrYBzVaq6oRHthSvxqaMdnTUnNrf6hLPDyzcPLxX?=
 =?us-ascii?Q?C+QQJRho4XS7BBZVvILwiZmfSkbqfOg7QnePQq3crycYzT9Rl+r+Jm64upSl?=
 =?us-ascii?Q?AejALil9hxHpnFFp6/wqU55/KuMWW506+MKQc/QPwsZUPDy9i1dbMmyQcz68?=
 =?us-ascii?Q?yYiAKMe8767O/l3m7Ar4J8qlNoVo4HoHGvwv3yUhBTMw2jCSCyAaTpqtL3Zq?=
 =?us-ascii?Q?SadMJtOliKDSkNN9Xx7bKM61QyY/pTDUnDZIOwEbiCdlAmmc0NW5vq2PYmUk?=
 =?us-ascii?Q?3U/De7fTCxRsSBRLEUvA2P9tlKuV3rILVNSKWtP0UEGbYfqYTKW72ha+cvkX?=
 =?us-ascii?Q?F+xjC/5SyxFkYlbd1UMbzMpx3vsvVGWZAch9JacicnU7vgY7eHN4KxE+nTmE?=
 =?us-ascii?Q?RrJfBp/vJxDTig+cAZTJ8I6BGEca03ce8cVAHiNYLuDsz9F/EpUsKtDpvxft?=
 =?us-ascii?Q?eiEKJGGWuwmbT0QzGTo+a+67WV41Yj8CpLUiBtXCx0TrgY0UcBxbr98nl5MD?=
 =?us-ascii?Q?T+Fc2EIv5kSzFv2cORANwbPvuixFRY1Fr+c3NQQNErH2I/um1wL6oJeJhN24?=
 =?us-ascii?Q?wIBEiwHAOtloL+13QkEN7wpEhk8DJ451K3tJN6rT5LcTbLZMk1tmvss9W05A?=
 =?us-ascii?Q?dLA2tT6MDOYmImp7g93+YydVupudmli/vVV1nmFnzp216S3o5uxMXbtXFa9O?=
 =?us-ascii?Q?0hJtOuD9AQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f8b059-37e7-433d-a9ca-08de79684173
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:03:01.7903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qoOJ+/TWV2NUeMkcDjnWn2HTK59U7O8yFIaYnhseDNhvLz75NQZZOh3GWgIHP2zPDPyRJrXFrYFbmS4xsSjOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6858
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_130315_067198_57A9C9FF 
X-CRM114-Status: UNSURE (   9.39  )
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

> +		spinand->spimem->spi->rx_sampling_delay_ns = table[i].rx_sampling_delay_ns;

Line exceeds 80 columns (currently ~85). Break into two lines or shorten
variable names.

Also, this assignment happens unconditionally for every matched device.
Should there be a null check on spinand->spimem or spinand->spimem->spi
before dereferencing? Or is this guaranteed to be initialized at this
point in the probe flow?

> + * @rx_sampling_delay_ns: clock to rx data delay timing (tCLQV)

Good. Clarifies the datasheet reference.

> +	u32 rx_sampling_delay_ns;

Consider whether this field should be initialized to 0 or a sensible
default in the macro. Currently, devices that don't use the
SPINAND_RX_SAMPLING_DELAY() macro will have an uninitialized value
(likely 0 from kzalloc, but worth documenting).

> +#define SPINAND_RX_SAMPLING_DELAY(__delay)				\
> +	.rx_sampling_delay_ns = __delay

Macro looks fine. Consistent with existing SPINAND_* patterns.

---

AI bot review and may be useless.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
