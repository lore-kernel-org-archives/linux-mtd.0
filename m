Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF66460A2628
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JCaVKOZi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=neyg6qmT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7y0uXQ8w2f+E61/fqwGCHSd7/XGQ+3DkkTRsisH/29o=; b=JCaVKOZi66FPLQZlfyOTmFAOKi
	Ll3joO66RChI0TZuLTJJ8+zWebrSrNJ/XDolsUh12f0HaCKGCuIUk5lkoFSe4ywX0WOo3vp58UV1z
	5IdyTdZGSHUNgHAwL+9sMYZvlFKs+LuUNHJcgLL9VQt8YCLIEX5fmk20A4zXmC/meLrhqfiEJo5Jx
	upIObj7RE62FAMiLxXlkDE2LJZ0oeUvq88k76j5Q833VDiQ/I8R2un4VjTyDHDyJ73JhQhxwPIGZ7
	TPkUhwMseWr7lEBKM7s36g7LowM5GUklOjSdgCD/vQGhUKUiHMJMIOLhEeBFnant0bjdazXPjawxc
	pJc85BeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrdh-0000000FIaV-1M76;
	Fri, 27 Nov 2026 08:49:05 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrdc-0000000FIWr-0vSZ;
	Fri, 27 Nov 2026 08:49:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iarn8R1Ys1Py+5Cgbw2TF86eWql1I+/EWRpJ47hepO4M2qwU9FVgfIcdV9JAv7fPVT6yHJc8+9QVeB3BJjhTfcQxpGiYpL+M5EENRtdcr7deKlbnYrgitZ9UEY7cbyRrqpynY22S7I44asdbFnCZLDdZkeYgXHEQQyhajPYywewgoxTTq8mrkBrMXqaz4lMvl9udWccZaJqChWNKAqf1XXOBBFaZQAOPWBRzpkG+iwE8phFGmYNw+RkSbdYjJVkuk19i/EZUUK6Ut3vFJUh5tUCpaPhkMoaWyQpj+Bc7SLLju+mXSAlgOa89awK+uLK/+3oI+98lMfvk4TQFf/cm2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/9nysUAzo/sUvB/H87KxmuFhaOI/JhNQOPVqJx+WJA=;
 b=IgE7EJGLdZmyNUgOsqom3lqRrEZ12SG9qXKyt7pH93fypVJm2VjJUxBBHXJAWHtYZiYKMY5ncBEwJCOoX2KVxXXrPfTgfkbyABhIHGnYTDkINxhZQYSJqNDXjZzmi9WgkfDe3RzVYdgIjM0JfUOoLqU7z9lBiqUxm6Xe8sFBVFwlsBX1hes+Q4VfsX1BrZ0YAnG32cGSsqsSgN6/DShB3jANGt/2IbwFVR9Io8sGKDIuMv8SznRM86MRrVYJq0z6DU1x1sYpHBsxL4ZVmraNKm7BpUzdDcslsVtvKN6v3q/Me/+40jGp21qs2Xp/UM/HMYZvQdwx7JosqovylgXmiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/9nysUAzo/sUvB/H87KxmuFhaOI/JhNQOPVqJx+WJA=;
 b=neyg6qmTmStJWEVfgzrS+3S/CnB2PMyNJbDgq1vc5ZVV3npwfEtlMhiW1RGDZG8gsgV8aTcQCwvn/ziTxmCYmfIfo98pcdZwg7oHmtaDFDssNfye88BjHzP1dft9q4gePJR9TTlM5hId9c2kyT0JImk0pH0I22swzz0EmLUihMR/XNwNYxrbg8duyhgtqiF6soZCtqpVzATaHQCmcTby65KaIxpLQBaIXtlFflIuXxUOudHWaaVaIwg0eDp3eCAReTDN5PA+S0JLJCcUMWRzrzYu2Iy0JG/zjKB+7OFHt7Hl1+6tNDnlfocfOoox+O/IlyKirjk4VRG+vKF5W6uB5g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by PA2PR04MB674656.eurprd04.prod.outlook.com
 (2603:10a6:102:601::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 08:48:53 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%7]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 08:48:53 +0000
Date: Fri, 27 Nov 2026 16:53:59 +0800
From: Bough Chen <haibo.chen@oss.nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Liang Yang <liang.yang@amlogic.com>,
	Feng Chen <feng.chen@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC 02/16] spi: spi-mem: Stop checking the dummy buswidth
 against board wiring
Message-ID: <20261127085359.euu6z5rydr655ycr@shlinux89>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-2-fd036402fd37@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-2-fd036402fd37@bootlin.com>
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|PA2PR04MB674656:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb6c318-5d47-4a32-de22-08df4c6343b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|19092799006|376014|7416014|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|11063799006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: 6nHCKI+hs5gu8T6kZX6mem+V2Nty6h+ykOCcZV+a+pOIPRWejyr3uLSBxvD9v9lraVgiZlwt5YT1/6I0kZCv/t78l0QuTj/s7Io0N5ekZdQq5uNWuQKBrq8co60kA+h2BrZmvuQJENUOOU+plbE+ebU8/3O3vs1lq1y97Qd8oj6DQnOPwADGF9Wzeg2TLtVqHPNIGgRfvWyYJPrBAT0jyDOjA7PLUXnhpVeFHwKm2Clw7qYofvO5AmropDVN79z0MgCEljVJULAiW2aqhnLSZN7eYNYz1etGyfXSXZoLWpXZBbDx+kL1BhWcT/jNe5qhi69ftVhgvuXfsD6oJb3afcLWNzN7VeUxXhwie79vhayGpS8kw3U5P8FCIXtVnzw4knbOGKvXho9QAI2Hq5Z2Hc+VS0Hg6qeQoNHRxn0myhnEhFp4rrAd0g7irF2lZMYGDSlXKl6itd/LT41wRfFW0ksSTybCi0XJ5NNktFTboJisZWWRRwDnefo01i4WlK8gQgqdrCM/qerGYA1NjpA086Stgul96VEqvXGQgtVuzBK811uTwDu5cjDWiXqrWTIe4rXHhsG6b0zb4kqISsjAX8/BuM/NzYzNJyrobxSJpgA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(19092799006)(376014)(7416014)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(11063799006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ztkymg4PGnN5nhctfBV5xV33VMhiFwxqikBupDWI5kmF8SpsY+aqmvrOgcze?=
 =?us-ascii?Q?h4vHOBYzll8sLpEO4CbDdGbV5JstmjqhQt7O/Mr37YWeLz7YiHnjhk9QSdXz?=
 =?us-ascii?Q?jq9y9EVwZyq4iWt8w3Awa9ADsuhQIbKZzO7Ese1ZWvWsqqXdOiMepEafdDJ/?=
 =?us-ascii?Q?cGvYJfeQSbyNeds+9d0rNt9uDAyh1P1N9DmyOYYqkzJ9jGGuLBGoCoHtErCh?=
 =?us-ascii?Q?+0MVgui8air929+MaC0GZCxbe/BZY41KOvp4YvxxL2S5q6YkkRDriOJSpTaP?=
 =?us-ascii?Q?A+HusPI6uAaXgc3G91S8lrlyKEVvRVDeWQd4OOI3IlRpIYlpMNCO2lS28/GW?=
 =?us-ascii?Q?qrOWJYUJXq2bJrqt/jQ5vKVKN1AsBWbLWKgYwcDC+F+Rg0KN9D/q96QjOlaR?=
 =?us-ascii?Q?6VQvZbyR4Zeibx6oAZH556bSevzxabHwg/NTDC4eO5dG//mSdynTYBWiclgh?=
 =?us-ascii?Q?Q9d64pQWc0OHJC9w83kdEUCOKFR2hochFpcNh5HcIlg6RzhDokVP1RTusnZb?=
 =?us-ascii?Q?/hrYlxu4DDk9Cx/uilaazZfBLd8nWEZtEWBlD+OaVeyKSBwpyStdmOowR4u+?=
 =?us-ascii?Q?BFPlJUr5oe9PfWPzGf3B/9kB6mCq9/gkgn4QHLqN8FLGMBmBVbGfyPR8mr8X?=
 =?us-ascii?Q?IRZHwd3LiarwT9SGUGsQp6EqYzhJ0W9KrbGFAg2e4IE9VEneKp7ETfEo0nPW?=
 =?us-ascii?Q?BLva2ohdr8VqXCxbYyl1dII04rCGgaQJpjz0wdJP5OxfmUIR85cbH0d4Tyuc?=
 =?us-ascii?Q?ZkfqzX4IfXIf0c+aHIV/RkClmw6jqFjuzlt87InBESBAi/7um21QEXN4PI7p?=
 =?us-ascii?Q?DmZXLPHsGrYOImhrEzKHK2b4rK9Wy6h6/3fVLTUkPZ9A/IKL57hkx6fFjcb0?=
 =?us-ascii?Q?64ZBJhUWwraTcvFObABY41Ew95y4270S0THi7pqB+2W/Sga/H0JwdahRQDuC?=
 =?us-ascii?Q?07APO1UIiXCoW3wZuJCjmZU2zacpgdZ/jxriSgEPxW16IkHoPepal4K/gUMr?=
 =?us-ascii?Q?LfohDYUKSCPkS3TGXzzkv2Q/SJVIEBbxIJKLuuzTaKOD8uf6VGFPXN/okVAT?=
 =?us-ascii?Q?OK+1/uYYgbBqmHZCT/UgsUq49V24QPkL5KPL2W/Ha2HhP6CufeoyMhEpBcBg?=
 =?us-ascii?Q?NwWKX05cef1gnNjRAFhIP830lTR6Exx+SJCXIMPMUCRgvF8xt6nHq7LuZdXZ?=
 =?us-ascii?Q?AaJEk++JP6n3maycN1W72V4njsCo4y/n1toHRnn/WMbSLIAmeek3oj5UZsnD?=
 =?us-ascii?Q?k6rxBx0bFRYp9BiphNvvuQFZnZBxkynZETn+/MHgOmwuIMvg8E8zJEZrR6+T?=
 =?us-ascii?Q?IsjxMkA2ucOY9qmAKiqLbghTQ19awJRy2Ke0pdrRrWpyxiK8Cjr+eHqb80mb?=
 =?us-ascii?Q?UyC9noSMYxjOWzP0wFQxYwdq1V926hbn+2B4xEyTR6rX33ZQN/OAAdwmsnnW?=
 =?us-ascii?Q?/vaSJfLsSOFLXFAT3MLxqPjRmTph+tN6cMDDLwoR6T+RgXbNZkzz9LoP94PU?=
 =?us-ascii?Q?Rv0ubbUawQ09b9WkEWeDHwbxr/oIGfPEF8a3jTnTBZbKwzsmp74D2Jj9XJ8b?=
 =?us-ascii?Q?gejtTU97/+ETWbQRk/cI24nwjXw3bZLf0OvBXgLB+ouCq2vc1n7i+i3uosxQ?=
 =?us-ascii?Q?0/NrsTtYfwlS7b2Y42ZdrX6/m8J1eapbvfKkXl8VSREhQir0zY5KyFe9fNIZ?=
 =?us-ascii?Q?O31T8o2Ow6KmAB3zuTpsdWOGzw+C/mAhypIF2IPn42fTp92wJztVJktS+Ug3?=
 =?us-ascii?Q?5n7bLLwAfMtN/q3XS6qz/WMBFrwu0LAaSCIBlpMWma4Y/KA++Tt4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb6c318-5d47-4a32-de22-08df4c6343b2
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 08:48:53.4613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aafNgz5nvQya5/rGJEG+5TFReOfJ9YCqgxwdeDzs+PWPZa4WzX8PbUspzHjLYO3ZMJWpcIrztzU4au53EhW65h0JCm2NEUlbbbELvfwod9l86FQZTUNwZhxLEjm4uq/R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB674656
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_004900_260386_35EE802F 
X-CRM114-Status: GOOD (  19.53  )
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 06:51:16PM +0100, Miquel Raynal wrote:
> The dummy phase does not transfer any data. Its buswidth only describes
> the pin state during the dummy cycles, so it must not be validated
> against the board's Tx/Rx wiring.
> 
> Drop that check (the sanity check in spi_mem_check_op() stays).
> 
> Suggested-by: Pratyush Yadav <pratyush@kernel.org>
> Link: https://lore.kernel.org/linux-mtd/20241112075242.174010-1-linchengming884@gmail.com/T/#m7cc1a5055702f5a42a8f3949c968842d845914d7
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> This is not really a fix, so no fixes/cc:stable is on purpose.
> ---
>  drivers/spi/spi-mem.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index c64e906ba919..9b8b8f2b3387 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -152,9 +152,10 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
>  	    spi_check_buswidth_req(mem, op->addr.buswidth, true))
>  		return false;
>  
> -	if (op->dummy.nbytes &&
> -	    spi_check_buswidth_req(mem, op->dummy.buswidth, true))
> -		return false;
> +	/*
> +	 * The dummy phase implies no actual transmission nor reception.
> +	 * Its buswidth therefore does not matter much.
> +	 */
>  
Hi Miquel,

With this change, do you plan to add the linked patch back?
Setting the dummy buswidth to match the data buswidth is more reasonable.

Regards
Haibo Chen
>  	if (op->data.dir != SPI_MEM_NO_DATA &&
>  	    spi_check_buswidth_req(mem, op->data.buswidth,
> 
> -- 
> 2.56.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
