Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D92C5DF82
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 05:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LA9CjsVXL20Dk+A8PiTQgFh8cuBsqvRtxG3eQQ7wM0Y=; b=vuH9qlqozFpV0t
	YEjbfQVQZBbaHIRBg/8KYYi/r1HAw6l80Wsc4Kr+aGUvgegmc+XQyH5tpKR3rVFCzSbrjWhZDP+q9
	PLzK6NUISktocXQZDAXaoT5JjCPYZ03hVLWIP047KgJYYD3b/UShSwMNkz4rORwSfmg3/8lRSzNSx
	BMijN/3vno4AkxHprhqKULXm8pVki9P+n6MpTA2jxr5XKTILg3a2OnjQlAqdJ9M870MBlmFsy1fmv
	UieryUAAXwmtesOVoJWczGHSf6JSfXWjTzQaILIYDVRFeXLka54pJH48tui83qsWtb6VIEAt0nMYr
	PrrFpqWrk4vAZThbqXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvmT-0000000At8j-0NtU;
	Thu, 20 Aug 2026 05:57:37 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvmN-0000000At5k-0CJE;
	Thu, 20 Aug 2026 05:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205451; x=1818741451;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qaZEgAXR6rAB+Z13l6NQRPdYAeMN+yiujol14ODN0Mk=;
  b=W+guIUqyFViBtNC9T1w8Mw7E6ilOQjVTGC3tSzS2Prz7A214bBMJ332h
   +2nTZkCrxZzmYCl3t+GuQcHte8dimrzHFXVX03PYknS9b7QISrHX86T9u
   RYVU1IErwMEbJHF7MmnrlOPYdm8FstsmmjJYge1ttN2eCf3YhjcctmxtI
   Q=;
X-CSE-ConnectionGUID: S8Hs61XdRgaiDa8L8B9wKw==
X-CSE-MsgGUID: GECDnyEYTE26Vv5znEGxKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105415986"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="105415986"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 07:56:29 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:56:28 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 07:56:28 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 05/23] mtd: spi-nor: Create the concept of fixup table
 with match function
Thread-Topic: [PATCH v3 05/23] mtd: spi-nor: Create the concept of fixup table
 with match function
Thread-Index: AQHdKzcyDj6MmXloh0iGUXlPNBcpnLamegRQ
Date: Thu, 20 Aug 2026 05:56:28 +0000
Message-ID: <8309659bd3a24f37aeef01a8d75844d5@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-5-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-5-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_225731_425318_8EC77E8D 
X-CRM114-Status: GOOD (  17.24  )
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

> Manufacturer ID tables increase and fixup() hooks proliferate. Having
> one possible structure per chip was fine until the fixups started being
> more and more common and needed, to some extend due to ID reuses. Mixing
> fixups and chips becomes hard and requires extra helpers to sort which
> ones are needed for a given chip, which every time this happens requires
> a lot of rework.
> 
> Replace the two-level fixup association (a manufacturer wide hook and a
> per flash_info hook) with a per-manufacturer list of fixups that can be
> looked up by flash ID and/or match function.
> 
> The match logic works as follows:
> - If there is an ID, it must match
> - If there is a match function, it must match (cumulative)
> - If there is no identifier (no ID nor any match function), it's a
>   catch-all entry typically used for flagging manufacturer fixups.
> 
> Suggested-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

[...]

> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index ca2703a5a338..f3862eb1a23a 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -905,7 +905,6 @@ static const struct flash_info spansion_nor_parts[] = {
>                 .sector_size = SZ_256K,
>                 .no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>                 .mfr_flags = USE_CLSR,
> -               .fixups = &s25fs_s_nor_fixups,
>         }, {
>                 .id = SNOR_ID(0x01, 0x20, 0x18, 0x03, 0x00),
>                 .name = "s25sl12800",
> @@ -941,7 +940,6 @@ static const struct flash_info spansion_nor_parts[] = {
>                 .size = SZ_16M,
>                 .no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>                 .mfr_flags = USE_CLSR,
> -               .fixups = &s25fs_s_nor_fixups,
>         }, {
>                 .id = SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x01),
>                 .name = "s25fl129p1",
> @@ -1001,76 +999,61 @@ static const struct flash_info spansion_nor_parts[] = {
>                 .id = SNOR_ID(0x34, 0x2a, 0x1a, 0x0f, 0x03, 0x90),
>                 .name = "s25hl512t",
>                 .mfr_flags = USE_CLPEF,
> -               .fixups = &s25hx_t_fixups
>         }, {
>                 .id = SNOR_ID(0x34, 0x2a, 0x1b, 0x0f, 0x03, 0x90),
>                 .name = "s25hl01gt",
>                 .mfr_flags = USE_CLPEF,
> -               .fixups = &s25hx_t_fixups
>         }, {
>                 .id = SNOR_ID(0x34, 0x2a, 0x1c, 0x0f, 0x00, 0x90),
>                 .name = "s25hl02gt",
>                 .mfr_flags = USE_CLPEF,
> -               .fixups = &s25hx_t_fixups
>         }, {
>                 .id = SNOR_ID(0x34, 0x2b, 0x19, 0x0f, 0x08, 0x90),
>                 .name = "s25fs256t",
>                 .mfr_flags = USE_CLPEF,
> -               .fixups = &s25fs256t_fixups
>         }, {
>                 .id = SNOR_ID(0x34, 0x2b, 0x1a, 0x0f, 0x03, 0x90),
>                 .name = "s25hs512t",
>                 .mfr_flags = USE_CLPEF,
> -               .fixups = &s25hx_t_fixups
>         }, {
>                 .id = SNOR_ID(0x34, 0x2b, 0x1b, 0x0f, 0x03, 0x90),
>                 .name = "s25hs01gt",
>                 .mfr_flags = USE_CLPEF,
> -               .fixups = &s25hx_t_fixups
>         }, {
>                 .id = SNOR_ID(0x34, 0x2b, 0x1c, 0x0f, 0x00, 0x90),
>                 .name = "s25hs02gt",
>                 .mfr_flags = USE_CLPEF,
> -               .fixups = &s25hx_t_fixups
>         }, {
>                 /* S28HL256T */
>                 .id = SNOR_ID(0x34, 0x5a, 0x19),
>                 .mfr_flags = USE_CLPEF,
> -               .fixups = &s28hx_t_fixups,
>         }, {
>                 .id = SNOR_ID(0x34, 0x5a, 0x1a),
>                 .name = "s28hl512t",
>                 .mfr_flags = USE_CLPEF,
> -               .fixups = &s28hx_t_fixups,
>         }, {
>                 .id = SNOR_ID(0x34, 0x5a, 0x1b),
>                 .name = "s28hl01gt",
>                 .mfr_flags = USE_CLPEF,
> -               .fixups = &s28hx_t_fixups,
>         }, {
>                 /* S28HL02GT */
>                 .id = SNOR_ID(0x34, 0x5a, 0x1c),
>                 .mfr_flags = USE_CLPEF,
> -               .fixups = &s28hx_t_fixups,
>         }, {
>                 .id = SNOR_ID(0x34, 0x5b, 0x19),
>                 .mfr_flags = USE_CLPEF,
> -               .fixups = &s28hx_t_fixups,
>         }, {
>                 .id = SNOR_ID(0x34, 0x5b, 0x1a),
>                 .name = "s28hs512t",
>                 .mfr_flags = USE_CLPEF,
> -               .fixups = &s28hx_t_fixups,
>         }, {
>                 .id = SNOR_ID(0x34, 0x5b, 0x1b),
>                 .name = "s28hs01gt",
>                 .mfr_flags = USE_CLPEF,
> -               .fixups = &s28hx_t_fixups,
>         }, {
>                 .id = SNOR_ID(0x34, 0x5b, 0x1c),
>                 .name = "s28hs02gt",
>                 .mfr_flags = USE_CLPEF,
> -               .fixups = &s28hx_t_fixups,
>         }, {
>                 .id = SNOR_ID(0xef, 0x40, 0x13),
>                 .name = "s25fl004k",
> @@ -1170,9 +1153,31 @@ static const struct spi_nor_fixups spansion_nor_fixups = {
>         .late_init = spansion_nor_late_init,
>  };
> 
> +static const struct spi_nor_fixup spansion_fixups[] = {
> +       { .fixups = &spansion_nor_fixups },
> +       { .id = SNOR_ID(0x01, 0x02, 0x20, 0x4d, 0x00, 0x81), .fixups = &s25fs_s_nor_fixups },
> +       { .id = SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x01, 0x81), .fixups = &s25fs_s_nor_fixups },
> +       { .id = SNOR_ID(0x34, 0x2a, 0x1a, 0x0f, 0x03, 0x90), .fixups = &s25hx_t_fixups },
> +       { .id = SNOR_ID(0x34, 0x2a, 0x1b, 0x0f, 0x03, 0x90), .fixups = &s25hx_t_fixups },
> +       { .id = SNOR_ID(0x34, 0x2a, 0x1c, 0x0f, 0x00, 0x90), .fixups = &s25hx_t_fixups },
> +       { .id = SNOR_ID(0x34, 0x2b, 0x19, 0x0f, 0x08, 0x90), .fixups = &s25fs256t_fixups },
> +       { .id = SNOR_ID(0x34, 0x2b, 0x1a, 0x0f, 0x03, 0x90), .fixups = &s25hx_t_fixups },
> +       { .id = SNOR_ID(0x34, 0x2b, 0x1b, 0x0f, 0x03, 0x90), .fixups = &s25hx_t_fixups },
> +       { .id = SNOR_ID(0x34, 0x2b, 0x1c, 0x0f, 0x00, 0x90), .fixups = &s25hx_t_fixups },
> +       { .id = SNOR_ID(0x34, 0x5a, 0x19), .fixups = &s28hx_t_fixups },
> +       { .id = SNOR_ID(0x34, 0x5a, 0x1a), .fixups = &s28hx_t_fixups },
> +       { .id = SNOR_ID(0x34, 0x5a, 0x1b), .fixups = &s28hx_t_fixups },
> +       { .id = SNOR_ID(0x34, 0x5a, 0x1c), .fixups = &s28hx_t_fixups },
> +       { .id = SNOR_ID(0x34, 0x5b, 0x19), .fixups = &s28hx_t_fixups },
> +       { .id = SNOR_ID(0x34, 0x5b, 0x1a), .fixups = &s28hx_t_fixups },
> +       { .id = SNOR_ID(0x34, 0x5b, 0x1b), .fixups = &s28hx_t_fixups },
> +       { .id = SNOR_ID(0x34, 0x5b, 0x1c), .fixups = &s28hx_t_fixups },
> +};
> +
>  const struct spi_nor_manufacturer spi_nor_spansion = {
>         .name = "spansion",
>         .parts = spansion_nor_parts,
>         .nparts = ARRAY_SIZE(spansion_nor_parts),
> -       .fixups = &spansion_nor_fixups,
> +       .fixups = spansion_fixups,
> +       .nfixups = ARRAY_SIZE(spansion_fixups),
>  };

With S25FS512S, S25HL512T, and S28HS512T,
Tested-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
