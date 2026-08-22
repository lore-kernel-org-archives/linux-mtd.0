Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C282C5DF97
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Aug 2026 12:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C20Ffanv0mE7bHiX3gEmxJY1JRmqSiwBbTK9NJeJotU=; b=4ztMasjfikP7nX
	0bIyrPhLD4Ue4vG7qzfyizGaFOvQWrVadoT6VMRlca1Ru1Ov9eejzlSbXaROn2/+2+S8zRJXE7ZRc
	j4cxqCtlQmoxSz4pxTQBfcZvq+4ka8b0P2zACUiuUKLofCWTk1kj+FCWEpe4W5LcOrD8jP4JIbdqd
	OTIcslGm+lj8hBWWOJr8VZz0SKS0PJUPSphYzBAYNvlPBUf0n/se9GE32En21gfaxSuqXFSpu42NP
	n3eJ4ech1YqhYNCqPzXJt9CmqjXUPYoNdLuII97XnvgC868zj+hUISiBt8E1WILeJoRlxXN07E3zn
	BiKt15nS2SQ1gl2cvK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxkVR-0000000EVFS-0Co1;
	Sat, 22 Aug 2026 12:07:25 +0000
Received: from mail-japaneastazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxkVN-0000000EVF2-2Q1E
	for linux-mtd@lists.infradead.org;
	Sat, 22 Aug 2026 12:07:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYoBgRbO6LNoIpLLpxoLIldMIhtZxLp1wYSitKhGEDbjOpvPzodprLu9wUBzdeStROZiy6AFZlawx7XfnS1dmYdtaeZen3qxp+uA96u+1nyDCtZ6OuGbOLphfnRPLDd+06ad+iSSYnZsIO/BjRGkDsvLVfDBrSzNCj2HqyTBRD9lx59UzdqhIkjSH3z7lefI7Ctp7Jyk8aSTSipc8aiWcXHIvIXibspf1TKgqsPLUe4nmIzlQyry/oYvzF0GDUl5NKVfZWtwLHAqfCjRRqRCX2aZuHbFPuIEdjxPgAotco9lW9R+HoEEKWRpTDzMwGihSkUoHYkH29lWekAuhNs/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mch6Lucg8VdpMMfd8CPDiD+ydCcY4tIHmExoTcipf1s=;
 b=P40cGb3dsQ4vSputZzusipxngmnD1K2zsO9ILDJC3ME/cV8ATYOypY7Ac/C4dTozOs9Xk/iPK+VavJoiDkYJBHermE0uoc2so9BV6zDtZnUL2X+IXhwN8c+jVUsT1FQgLVuLaRoEQ9XbtdiSvkYkWj6cc+SU87uk7LRQkSol4HZRPVG6WJDMAvmTlXlTixwz/R0PrVo88Ge0yB+kWPkV02GFyUn/+XyM0zi8iriAWox9qcCn9A/ZFs2iJ4Zai9BIJqAeX5aN4cAzVnkMi4HuBODXgWGLrUXpS6FShJaFKBsYPs++tOw460P2z+SHNzf6Qyu/CJDvyuaiyhRmRsv32g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mch6Lucg8VdpMMfd8CPDiD+ydCcY4tIHmExoTcipf1s=;
 b=RexAo+S7Ea03jfbDXDGs7uWPAWNrs0I6jxfgwionemuGvYpwFnHDHuWuBGiTE6MOKqZ23/NvXUoDgO0BLztQ23bSt+T2/pnGuMsa9vUWEEctOQsSRUdmMF0JJshk9n73161RuS482gp5x9l8oBmD6TYEthBgPr4TWPrIicUnNSgzl692TJhMTGqZlHDgmlxNAsVRaWtz3l3CrX3MV2fx8bMBxEaADZt33YFD4jBoFv3XIPW6Ol37Eko8+chQVPFwk4xOtVbk/YRlx/0/TrOgI8pLuR78leGleQNMz7VgH6fl5Tzf4WraxDgCwDykF7DNsr8smsHgHS0r0vE4y3QsaQ==
Received: from OSZPR01MB7795.jpnprd01.prod.outlook.com (2603:1096:604:1b4::8)
 by OS9PR01MB15228.jpnprd01.prod.outlook.com (2603:1096:604:3b9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 12:07:04 +0000
Received: from OSZPR01MB7795.jpnprd01.prod.outlook.com
 ([fe80::7a31:a23c:129f:8288]) by OSZPR01MB7795.jpnprd01.prod.outlook.com
 ([fe80::7a31:a23c:129f:8288%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 12:07:04 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linchengming884@gmail.com
Cc: alvinzhou@mxic.com.tw,
	chengminglin@mxic.com.tw,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	mwalle@kernel.org,
	pratyush@kernel.org,
	richard@nod.at,
	takahiro.kuwano@infineon.com,
	vigneshr@ti.com,
	Shiji Yang <yangshiji66@outlook.com>
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: Add support for MX25L12833F and MX25L12845G
Date: Sat, 22 Aug 2026 20:06:25 +0800
Message-ID: <OSZPR01MB77956D321DA7F2F6E17853A2BCA22@OSZPR01MB7795.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605084837.1875896-2-linchengming884@gmail.com>
References: <20260605084837.1875896-2-linchengming884@gmail.com>
X-ClientProxiedBy: SE2P216CA0093.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::14) To OSZPR01MB7795.jpnprd01.prod.outlook.com
 (2603:1096:604:1b4::8)
X-Microsoft-Original-Message-ID: <20260822120626.375-1-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSZPR01MB7795:EE_|OS9PR01MB15228:EE_
X-MS-Office365-Filtering-Correlation-Id: 246baf23-47b7-4bc5-a219-08df0045e146
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799012|8060799015|16041099003|15080799012|24021099003|5072599009|41001999006|22091999003|4140399003|24121999003|23021999003|25010399006|40105399003|53005399003|2607281247196008|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KC3dQuabbCcvfhCy8sE0+D7za4Afq8FHDoA5CD9E95UfzriA6MRjthQP6zeB?=
 =?us-ascii?Q?tPuOD1SRKWx/I4WC8djxCDEA/FS99ykpRTTD/jik4DUJCmg3R+L3UdjCTx5Z?=
 =?us-ascii?Q?mOequ4zocOCMUFNaTBGPvlv/4HpC+sZsX48ukZi3rbx70QSKEB9/49HZG6Bj?=
 =?us-ascii?Q?XjsID1loP9YLWY5vFHYQ8ZhAUWHvPr24xV03ucPdowrapuuZswN/KjF+7J5G?=
 =?us-ascii?Q?h8+j5FJCKkdgGkbGrQgZJczIDq2Zmt7k47gMezlsIPiGb9T/RV0/Mw1l+I2q?=
 =?us-ascii?Q?Tq2/iMDT3NE+DTK2o/fEDgrWtNK8qHgA6OO7gJ0mS9ylL+IIbz1w2ETJbQ7a?=
 =?us-ascii?Q?zpINv2qYVRBfJigLMdE9UgiYtS9PjEycdfDnL0SdEun21ycwgVf5eIMy6H3y?=
 =?us-ascii?Q?+u9ccGOT+kcI1p16CpgoVYBLlGjHkcUi9EMGRqu/pX0kgjqs9srHPaKek2U1?=
 =?us-ascii?Q?Ml8XVLpCoZX36J2iTWccQV5SB99KBoAUwXvfIVDavnuiZLrHWc9BCD60iuxQ?=
 =?us-ascii?Q?VohQwN2zwuqHN+mexQ+xFLqlRYvdFu1f9dR/woVKafZ5rNXbvOBwFWNbWVD4?=
 =?us-ascii?Q?kor7aRYP92Mf1DaflngLesN/HwNpmNl1lTydMR/r+2cW+OdEsE9Jq+RW03Je?=
 =?us-ascii?Q?Bld/hpFEPQsuK57NC11ETxGpV3eOaRZ5AseUQn+TH1CVsF8er1RHfahmbW9J?=
 =?us-ascii?Q?y0AV3LWYTbVO1vxDwL7E+0eras5TiNVqFOR7Ed0HeYlkM2/ZlaoSj9PCyll7?=
 =?us-ascii?Q?9RbuNjavmDmPSrp84AnQuIfCuXt4M+Vpkyvb18cfwf09ZVbqbMNzKj9p5qTA?=
 =?us-ascii?Q?Aer1Uri5luC6x8PIbRa9z46dMPsIKoqlJuytLKWQIbU1r9O260GDHXQCv6tl?=
 =?us-ascii?Q?/23QVnT5fo9M/edpcqjchNqRtR/BJKKLIaef86G83NTuYc5HIUhvM4WJjmmJ?=
 =?us-ascii?Q?uj0cV/xFwYGNcB1YyRStRP4zl7XMCcZc0SinYYW71RbeiofMk9rRTy05GFR+?=
 =?us-ascii?Q?R2Oc5Q1y/UASAP79W8vr/JuZ9VHHFE9+VCAdllHZRh+0NmPrbbgT4LYo+KEr?=
 =?us-ascii?Q?a1RvvUChJMBM+wgldQCJxdSdW0s6hw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9N4xLYEOravGuMIAgWXkR3ZBBxhAcdQcZxsgDLmYL6lSv8fN285yCFqUph/J?=
 =?us-ascii?Q?a1YTOVnqY71a74F4w9x6V4KAf+eEoa5fmzjQr3mAxViL2TyPG6/mbd6mgNQ2?=
 =?us-ascii?Q?XK47sJz+49wZZSznmb/wHtd5IOpE1Ve0+SlykJBrb1jBu0wop0Z5t2CTYW1x?=
 =?us-ascii?Q?2a6ZcAdvdMMm5P5SpAqzRkFY0Pew6pAC7xw3eYctPZ8Vf9iVF1krnuLEC5si?=
 =?us-ascii?Q?HrOPOM0uvkIs9OjmKaxFJmIKiwm/Kv0Tv75see6ufxCQdCIlViJMy22QKwpJ?=
 =?us-ascii?Q?6w1Cy0E/gNy06aO8g7D8isH+A1GABmcOmOnrJ1jeziaExj0JKw8B7SjY9etO?=
 =?us-ascii?Q?4VNsGkvaRP7770MgMz9oiWEP+LxX7ZzsGi5y/Ol4R+3YUD1uB/G4WIK9k2s/?=
 =?us-ascii?Q?jPtwLaW0uvT1SjPK3jyFe/qXzfgVX9+3OK8KBekFzSVhzAEFidVxavrc7hP4?=
 =?us-ascii?Q?wK1IJewi/5/7OtXB8CbXWF+qPilF1gAOW5CCYGvrSGGZ8TyG6QodrnmwAFUH?=
 =?us-ascii?Q?fXM33VNXxAbA1YEm3DwmIRgb8m/36DjUEGuNJ0vwCxr+j8qytwRvuLlj3heP?=
 =?us-ascii?Q?O7fxiYG09cZc+Or10ooi6av2UtWO/ZuLpg9OOHcLWRkUgiDeCIhr/s0Y/n8o?=
 =?us-ascii?Q?e5stIbemmkOX+5K9wOmNeGmryDbrESJCs71mU3dry/pi6wOYZTZR1k+C11K+?=
 =?us-ascii?Q?Dt1J9lvGET7ZJYcgeDVNMUz4Xr9iM0IIDEmsKSuGt2O34C0F2S6cZOKvt8Ed?=
 =?us-ascii?Q?jtFa3mSS8shTjANwkwq4nemIUoFicCll89AanXqikyPwrZ1+1JUVYGWwvqLM?=
 =?us-ascii?Q?h/xOJKIr9GXPaUmpI6pmIkbXfadsZ+8IiLFYaWLzlfvnKYsg3sULJR1poVcJ?=
 =?us-ascii?Q?1oxXIImmo9pI1/kwbwbXCcj9WPzaxTW66OsgmElUJTyRK6ITJU6Vy8cXLmVo?=
 =?us-ascii?Q?yxeiV323KeYTJm8sc+6kqgPelDl0Ojd/MtAmy13WMWiJCbfAK6hkzmiTnznI?=
 =?us-ascii?Q?WM5+BjhfkbVkdpk4esVbgB9O5YlG/8n6Nh8J/kHa+6ErYRnjWGlH3ZPGE/+3?=
 =?us-ascii?Q?jYwz/F2TvmcHSYPRTIDQzd5ZCaJazNwaj5yfCZ7TxHhrUPj0Esw84jkNuF/o?=
 =?us-ascii?Q?dX8nletFcGMkMHGgVdLUPlmF6XkF7oV4kZL905DH5qhN/a/oR1IYPFNku7mf?=
 =?us-ascii?Q?GDQ1dxwAb2naXRA2kZUiuLzv8LC4/A4RG30ECktRJ4u+VLVlbrrrXVQqbxX+?=
 =?us-ascii?Q?tBP1kP0dkeByGensGtPNZspiH5TKKkOF0obV5WZKRbgREWpqCrB/wdidcDRA?=
 =?us-ascii?Q?KEBUMDNl3lCE1v98CVC1UX4wEiw7bqBuIG5aA12UlSLlADIqOCGGA9x/6STQ?=
 =?us-ascii?Q?QaxTYzQdeUumLSaki41V05HsgXdL?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 246baf23-47b7-4bc5-a219-08df0045e146
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7795.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 12:07:04.4229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15228
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_050721_627283_4980A018 
X-CRM114-Status: GOOD (  22.96  )
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

On Fri,  5 Jun 2026 16:48:36 +0800, Cheng Ming Lin wrote:

> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Add support for Macronix MX25L12833F and MX25L12845G SPI NOR flashes.
> These parts share the same JEDEC ID (0xc2, 0x20, 0x18) as the legacy
> MX25L12805D.
> 
> The newer flashes support SFDP and 1-4-4 Page Program in 3-byte address
> mode, but this 4PP capability is not defined in their SFDP tables.
> Conversely, the legacy MX25L12805D lacks SFDP support entirely and does
> not support 4PP.
> 
> To safely enable 4PP for the newer flashes without breaking the legacy
> part, introduce a post_sfdp fixup. Since the legacy MX25L12805D does
> not support SFDP, it falls back to static parameters and will never
> execute the post_sfdp hook. The newer flashes will successfully parse
> the SFDP, trigger the hook, and safely append the SNOR_HWCAPS_PP_1_4_4
> capability.
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/macronix.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index e97f5cbd9..1adb79832 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -83,6 +83,25 @@ mx25l3255e_late_init_fixups(struct spi_nor *nor)
>  	return 0;
>  }
>  
> +static int
> +mx25l12805d_4pp3b_post_sfdp_fixups(struct spi_nor *nor)
> +{
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
> +	/*
> +	 * JEDEC ID 0xc22018 is shared by MX25L12805D (no SFDP, no 4PP) and
> +	 * MX25L12833F/MX25L12845G (support SFDP and 4PP in 3-byte mode).
> +	 * The legacy 05D lacks SFDP and will not execute this hook. For
> +	 * the newer flashes, 3-byte 1-4-4 PP is not defined in SFDP, so
> +	 * we safely enable it here.
> +	 */
> +	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_4_4;
> +	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_4_4],
> +				SPINOR_OP_PP_1_4_4, SNOR_PROTO_1_4_4);
> +
> +	return 0;
> +}
> +
>  static const struct spi_nor_fixups mx25l25635_fixups = {
>  	.post_bfpt = mx25l25635_post_bfpt_fixups,
>  	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
> @@ -96,6 +115,10 @@ static const struct spi_nor_fixups mx25l3255e_fixups = {
>  	.late_init = mx25l3255e_late_init_fixups,
>  };
>  
> +static const struct spi_nor_fixups mx25l12805d_4pp3b_fixups = {
> +	.post_sfdp = mx25l12805d_4pp3b_post_sfdp_fixups,

It seems that this fixup won't be called at all because the dual/quad
io support is missing. See:

	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
					SPI_NOR_QUAD_READ |
					SPI_NOR_OCTAL_READ |
					SPI_NOR_OCTAL_DTR_READ))
		spi_nor_sfdp_init_params_deprecated(nor);

> +};
> +
>  static const struct flash_info macronix_nor_parts[] = {
>  	{
>  		.id = SNOR_ID(0xc2, 0x20, 0x10),
> @@ -130,9 +153,10 @@ static const struct flash_info macronix_nor_parts[] = {
>  		.size = SZ_8M,
>  		.no_sfdp_flags = SECT_4K,
>  	}, {
> -		/* MX25L12805D */
> +		/* MX25L12805D, MX25L12833F, MX25L12845G */
>  		.id = SNOR_ID(0xc2, 0x20, 0x18),
>  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
> +		.fixups = &mx25l12805d_4pp3b_fixups,
>  	}, {
>  		/* MX25L25635E, MX25L25645G */
>  		.id = SNOR_ID(0xc2, 0x20, 0x19),
> -- 
> 2.25.1
> 

Regards,
Shiji Yang

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
