Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3B8CCFA13
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Nov 2025 14:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wrRQPzNLMirgAUY2BZCjGoBMYffx3QWr8GOKKAnQmAo=; b=Fkno7LWM8z1knu
	mR9yx+xittdQQJuDiejpPRtaNvMxY2rIheEdmJi4H3bhl+j5ld1qDHNZsJ8mQBHsP4m838BaWy69m
	cfJuob/QPggl3IwN1YYG8dnwIb4nLaF3uh+t0Rg9MFGpzzIdPS+Bf8jNLBehnMfmNrzsAD2aQl+/4
	1VaKNkv4lU2YMmeX8cGIoZLPHajgZcHmMIVvH7Eb+sktDSThTXRDjCbGtevEznyziTJt3Cd9s6IIx
	zm8FHoPqg5fiEu1MdhAjfe72hXpKtF55FirQi9fHyWIdxA1bhGoB27YZoP5a0zKR4nBraILaGJpKI
	mMMz/i8/R3sHorZi8dmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISTp-00000005XyE-2JTZ;
	Mon, 10 Nov 2025 14:02:49 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISTm-00000005Xxk-2Hy1;
	Mon, 10 Nov 2025 14:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762783366; x=1794319366;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qZG9kvPfRV1aqGof0ckElg7ZY0VFrf9hHd7O1MQsbwQ=;
  b=nmZDDgiykqdW7L8NXOv3L8HeT/ovY7KSGJXznDxOB8vfQH7Q6pnJyVhT
   oRWmeQeXJJbroYeA0Sv1WlXkYlCxexBnurhoC8doLb8V96DmsevmTwcQO
   AvDdB/AjK2FH4uOJBH9S9J6Z7VENz5n98zwClHDhmbLW9z99a9uI+dJG+
   7Sx+BgsPP90AcFW0haRddreP++42ZGcsO3fRr1rgM6+Co4xLda0BGa5fJ
   JqOb9cHqoXUVa/oJTBkDMJSCK8gnXIxdaQp8CEvKReSnGJWP2q9va7fxG
   Nfvaz1xTSPypkGk+15+dI+Vi+MwOkJoiLkrgdCuPjLqzdqfafb8FZIGTD
   g==;
X-CSE-ConnectionGUID: XQksV4O4SC+2OApSeXoCAg==
X-CSE-MsgGUID: /u2QZrrrTru4pGPOQodGpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75937241"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="75937241"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 06:02:44 -0800
X-CSE-ConnectionGUID: dwJX/aowR1SL84yVPjfXZA==
X-CSE-MsgGUID: 7nH14OIZSS2EIrwg+LAIhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="193062713"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 06:02:44 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 06:02:42 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 06:02:42 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 06:02:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yzUbC1Xmc/D6yV2zkkO7X+Px2ZlnnT5gSBIm90dMAO+7d/v2NkY9SLA+Q7pyIGpVo56jWQwNidXSpKLHhy3Mr9S8xWsz/xPJx6bk4vdYVqt8TdYSZrLIPOFqjC3dav4pwtWBa/M60YkmrjOE4sS12wAHPDMC8CBRmWI3Ajra5mm5HAQufpUi6N+2f8Y2HFJTN9Lz3Xz5NVLni/m6PeHXlszXQQWiVyE4XHuXTGOrGMGeZ7W1bn1i9WYc/fR/zK1iP87nvUidEABd1PVPqCW+d9UTkUVg+ezgEHiS5hqxqp+vQPWGETzCZ1xFuTodRsJeCcoxibEqZsLWwwMVvldkCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSsDQzbGNLgLMukXZKfcoEKEX4TN8D7tl7IYu5F8Zxk=;
 b=IJ9l0PRbs9NzMhFPWO3O32jE5MSyJ78/5EtEacakEJaG36rZUbW9+iWh2LbxgiMmd/2SM7xZQAA60Yg3SVKKJlQRRfMtlBDQOGo/pGkl3Hh9b9IhEwnECnLVUp8aiy1WycGcudeI2upjLgN1o3T7uHlrjBxsAo3SMaIf49ogq6fFT+GWgcA5+sSadQ1vgkZI0tbw/AX0vwDTM6PZyA5b66Oh/4itm+efwfuSNf38JmSYBZw3OOKXT9UMVeAdGZUy8/Om/P/FLhRxmrh3hYRsWJhcT2seVzfQB4CDtfBWyhNALIFWs+KDwF27/QS12h4babO0Sx0jMfd/dVxYFsOTZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by DS4PPF7A0031045.namprd11.prod.outlook.com (2603:10b6:f:fc02::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 14:02:38 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::5670:5b2e:6ecb:dcaf%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 14:02:38 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Yury Norov
	<yury.norov@gmail.com>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, "Cabiddu, Giovanni" <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, Jonathan Cameron
	<jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang
	<ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Rasmus Villemoes
	<linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski
	<kuba@kernel.org>, Alex Elder <elder@ieee.org>, David Laight
	<david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, "Luck, Tony"
	<tony.luck@intel.com>, Michael Hennerich <Michael.Hennerich@analog.com>, "Kim
 Seer Paller" <kimseer.paller@analog.com>, "Lechner, David"
	<dlechner@baylibre.com>, =?iso-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Richard Genoud
	<richard.genoud@bootlin.com>, Cosmin Tanislav <demonsingur@gmail.com>, "Biju
 Das" <biju.das.jz@bp.renesas.com>, Jianping Shen
	<Jianping.Shen@de.bosch.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, qat-linux <qat-linux@intel.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 03/26] EDAC/ie31200: #undef field_get() before local
 definition
Thread-Topic: [PATCH v6 03/26] EDAC/ie31200: #undef field_get() before local
 definition
Thread-Index: AQHcTyLZlBp+VEoVpkGka3pFTqVJFrTr85wg
Date: Mon, 10 Nov 2025 14:02:37 +0000
Message-ID: <CY8PR11MB71340DBA5EA023F7CADD008A89CEA@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <cover.1762435376.git.geert+renesas@glider.be>
 <581bca4d109242bb5acb3be49dbf1bde780f2884.1762435376.git.geert+renesas@glider.be>
In-Reply-To: <581bca4d109242bb5acb3be49dbf1bde780f2884.1762435376.git.geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|DS4PPF7A0031045:EE_
x-ms-office365-filtering-correlation-id: 07020963-c15d-44ed-f9b8-08de2061ce64
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Ukoixdh8/bnnn0Yy33rOWJvyz3RDNFBSh5yXYAh437ZqCyLFYwnnnbX+IP?=
 =?iso-8859-1?Q?EJhoIv3FJbJCms1z0OhYji5B1agRpdxWm9I5Pi8kiUnzBfk0ddT2u8EFni?=
 =?iso-8859-1?Q?LUuvpWVSlb7ZcWmB9HJ8bhoElCZ41hHJxvYwHBlKlMQR7hfi46xNLkDpUi?=
 =?iso-8859-1?Q?NpDRrrQsEnhJ1NmJHU7Y8QXspSeznBo6eHezf163iN84//x5HX6fZoeVKw?=
 =?iso-8859-1?Q?8TZjH6CHqHDKmpZrXGHVIljB1wR1rf4rgIoSwRk8XaxheHBvoaJfAtZ8SY?=
 =?iso-8859-1?Q?OJC2KFDBMbZICGjeOtzGSkiWHHJUeuG4k+mH9a9XNhSjXvjb/fUgynlWO4?=
 =?iso-8859-1?Q?WvtRqMWWJ8fyO3Ul1YNfHTcvwSNuH9FNgVHXTSxXDRfWFe7Qwcdki8R9U+?=
 =?iso-8859-1?Q?ALiDzAYbBZ0MZI8BJijwB7Gs19I200hffW4SKFEcos6tvR/OrbaliPS0Kr?=
 =?iso-8859-1?Q?DEl9TGwunRfBlQHJRMwibyRDM8dElllEYROPJrfAEhXXdJ6CQ+VJ81sl8n?=
 =?iso-8859-1?Q?6vPObdv+Wa0JeLb+QUf91t2KUCBQvj2zrTCNkocubzryL9VHaM4IM4sXZ/?=
 =?iso-8859-1?Q?zRN1gcAhwBidqZj0YL6s4HIO5y5cbYeUS8EBiZcgGZp9+M1b59+qXYcnQN?=
 =?iso-8859-1?Q?BSxKrgIADE2QQ5toyWjArBZGzDsvWzQ3W1lftfMNEANcnJ/APmw4BDtyn3?=
 =?iso-8859-1?Q?CqVNHvG99mTn4M7vLGIAWdO5Sv8W5+xCu8f/7UhPUPAqRelb23MotGZNBU?=
 =?iso-8859-1?Q?sXv3fU6DJnWset4KaOH8sNBxzumPQeVl+XRARJ9LGqJZo4dj4SYmYyJI04?=
 =?iso-8859-1?Q?WUbnUFbpPIIaDG8gZITbpRQNX7WQQEOZEqKwZVLUr6I+MLFetCzIFGpAlR?=
 =?iso-8859-1?Q?Iv+njzSjXvf6rxWrxuWvdfyXBiEo3iKF5U4Nc2xyLL7+NnXa+TLGlUxAaS?=
 =?iso-8859-1?Q?nU+cVFkj1v7PZkcDd1qezE/SYCe0YXu1BgIackTzECcDlBTcYVHyh4gXGP?=
 =?iso-8859-1?Q?8e2QjAWOD8BQt40MnJ/hpIXVO+VNBODsn8SHDpWFtE4QUhBnS7eYRbNOHH?=
 =?iso-8859-1?Q?vYgSCmFn1JPMzFKbt7cUFD0GstT0ISUlggHBtjnwxa9qqiBsEvwxzfUquM?=
 =?iso-8859-1?Q?LD1vtP1TK673zrdlpO0DVCXC97ry25PvYVOjaUdEnwqkTwwoHXUJPCM9ep?=
 =?iso-8859-1?Q?FiZ/1zMzPKLykWv8gXnGmX65XTfaDduiIDt8komS6wuoQZqiv2DjP+Asz3?=
 =?iso-8859-1?Q?157u8fUdoZDe732plMRdXxKYU29q97QFfruzRP5CcbBCjLxBN3J1RwL4Pk?=
 =?iso-8859-1?Q?PM8nv5owHjq6x6H9raiiJA4Ua0NWOoalD+jBLCiT7JopMgzLvttvS0QCtZ?=
 =?iso-8859-1?Q?eMgWMj5I4eVOszML5wUPckEv/2PqGNDSxMOBZlm8z1pJwfeTlgbM0wl1x2?=
 =?iso-8859-1?Q?xCS/IcF/gNDDH4XaJ/RkVE098I2O5blZBElpxjiBfA+xpLxS+dm+oBr/M8?=
 =?iso-8859-1?Q?y3OGiyjlrCLtUzC2Qm8iK3rxccl/pcyioDDZzHI5V7jvDr920dFN3lVJ5M?=
 =?iso-8859-1?Q?RmCCWMk1SouY3feyOdn6FwSYF05P6SwZ9yfq2+5LMv3aQWyy8w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?lbvOFlvl/6b9cVnji49Zol6chG2c6qmMvYXSLBA9wjzC0ewgp3zBQOUJ1Z?=
 =?iso-8859-1?Q?bCXQHAuySWybnYfZF9RKyVPwFtt/0QQmrGPo22kQ1qTy/BGrVXwzE+CLie?=
 =?iso-8859-1?Q?2X51RginulLJCra4vsrIdnB/PNCotx8Vnzmin1cqmHZEnRKtJRjJN3xZ3m?=
 =?iso-8859-1?Q?v++S8e7R1Mo9yPnebz9If6gJs91jfgHPZ0pMfsrptrjIDjzjDjEexOQVve?=
 =?iso-8859-1?Q?W3kWsGNdgY9RnREUeEAZTqDwL/N8f0noW3PwXOtm5GF93Oy7uCc+cJUh9S?=
 =?iso-8859-1?Q?0zB/+2Wr5Z7BWTYlN62cXTshfRQSNHYmlR5RwReRiXgQp289VoXl8Gj2X4?=
 =?iso-8859-1?Q?w4zLG0iuUsDs2mBCn8Te4uRB6HqsgOOxls2JS8Gxp0qMrK4xXcLovYtvST?=
 =?iso-8859-1?Q?lLzOtOt6lm/P6ZWXQD7AtEC7BrqJsDWOO/6VvO8GxwTIdMRDy0pJhaqq4V?=
 =?iso-8859-1?Q?yVu65onOYg9+HH/j1kRT2/O2WyyFQ3T+Nq0h82M9gWRqywvrxMjZyXArk6?=
 =?iso-8859-1?Q?uSjhiY2kuClTgX+ojCZ1Tmf2M2KYVSSKpnOAsZ++dc2wo86Ur2q3doaN7Q?=
 =?iso-8859-1?Q?QOndC6+eL547AiRRE3uOIodfNVM6WbmIne3H4RHAuRE23kdGJ23zYjvDys?=
 =?iso-8859-1?Q?fDK4bPE2JpO77lmTvKeRVNRA9fqzYOmTw4kICMJM8TpUtl2MQhel92voDZ?=
 =?iso-8859-1?Q?JmXhdtHL7oPHGzHouJPAhbVOqoeMoRF9bHsjNGQUniEqkNrxZG8/VJ7lDM?=
 =?iso-8859-1?Q?H6dzJznGkajo0WReq75w2bxAxXaeFA6Eyat4A8HfJs1JmN38lQEyrJvX8k?=
 =?iso-8859-1?Q?WwaN3LoyEke+MAyL5IgVQN0/pbSM9SsD1PWNSAnDWk4VknNndJM6Xu5lIE?=
 =?iso-8859-1?Q?rOwUVDsQpEZc3elk8oqa+A3rsqn+gBsWUQOUgFA5LLT+/nAI9sNFqfQWEN?=
 =?iso-8859-1?Q?yxwwWcZ/mytRX2EvF3gD2vSvJn4B+k7AybiERqaMEWJpWOq/ZC07M0xYWC?=
 =?iso-8859-1?Q?1fHki/eWkpa8AGlmHUuAv/SFL5Jo77osaNY9Ze97eLa5UTB5sVblaRCD3X?=
 =?iso-8859-1?Q?jpPl7ZpJKDYjd4s/Ou4jg1sLe/0faXe0wWg8p43GFi0ZJidGYOv/KD0g87?=
 =?iso-8859-1?Q?kAEQoHSsWjKoFeeqiINtIi1aqpl5KNxi5UoOcUiFUUN6mhjkEKdtc+2s0v?=
 =?iso-8859-1?Q?WeufQQ4wLCo9JzAalGXtD/nXhxJmOXVPgcFMFe0ckSPn0Sx3+m7/rXh5HQ?=
 =?iso-8859-1?Q?Q1sd9T8Ai/8+Fz/HcW37Ivw8uXqpWMX5qgavME5SVkuTSIp1S9HwTcUucz?=
 =?iso-8859-1?Q?vSHr5DL3LjVnvlmn22Wx8v/7F+ExlukwoGYDUR739dVoVOknEK/gWwzZBx?=
 =?iso-8859-1?Q?F3R5oG7K+mgGT3G34L3SKCa7P4KEIwpro5+7GMhzulT8QboUAM0T8gcMln?=
 =?iso-8859-1?Q?TD7cOmVdble7uaig7aMUPtZI6kZW7uJTM5wCZkutPH82R3u974yVXfhWQr?=
 =?iso-8859-1?Q?ANbQhdiExySPawF2F6W6q9a2NIIH10ImI0J70L2n87pr3WVfUgbSXbeUVO?=
 =?iso-8859-1?Q?pjuv5a5uknJdD8Kf2URRig0MFeNL7ROR2+5Yfuvd+fEDQ7cpkMMeQdQQL5?=
 =?iso-8859-1?Q?JB9AqQLXNwoLNPaF3CknJwDeFIjF8HE/PM?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07020963-c15d-44ed-f9b8-08de2061ce64
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 14:02:37.8700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o/SOjpEBbEcNcg76PAAPiH34aRMlkRY7gv4W3yYyMaVYu3agIBvdY/Psf7rTB2GHbuYx58pZvbnlxD5HMNMJBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7A0031045
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_060246_779637_AABD5BC5 
X-CRM114-Status: UNSURE (   8.90  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: Thursday, November 6, 2025 9:34 PM
> To: Yury Norov <yury.norov@gmail.com>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Nicolas
> Ferre <nicolas.ferre@microchip.com>; Alexandre Belloni
> <alexandre.belloni@bootlin.com>; Claudiu Beznea
> <claudiu.beznea@tuxon.dev>; Cabiddu, Giovanni
> <giovanni.cabiddu@intel.com>; Herbert Xu <herbert@gondor.apana.org.au>;
> David Miller <davem@davemloft.net>; Linus Walleij
> <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>; Joel Sta=
nley
> <joel@jms.id.au>; Andrew Jeffery <andrew@codeconstruct.com.au>; Crt
> Mori <cmo@melexis.com>; Jonathan Cameron <jic23@kernel.org>; Lars-
> Peter Clausen <lars@metafoo.de>; Jacky Huang <ychuang3@nuvoton.com>;
> Shan-Chun Hung <schung@nuvoton.com>; Rasmus Villemoes
> <linux@rasmusvillemoes.dk>; Jaroslav Kysela <perex@perex.cz>; Takashi Iwai
> <tiwai@suse.com>; Johannes Berg <johannes@sipsolutions.net>; Jakub
> Kicinski <kuba@kernel.org>; Alex Elder <elder@ieee.org>; David Laight
> <david.laight.linux@gmail.com>; Vincent Mailhol
> <mailhol.vincent@wanadoo.fr>; Jason Baron <jbaron@akamai.com>; Borislav
> Petkov <bp@alien8.de>; Luck, Tony <tony.luck@intel.com>; Michael
> Hennerich <Michael.Hennerich@analog.com>; Kim Seer Paller
> <kimseer.paller@analog.com>; Lechner, David <dlechner@baylibre.com>;
> Nuno S=E1 <nuno.sa@analog.com>; Andy Shevchenko <andy@kernel.org>;
> Richard Genoud <richard.genoud@bootlin.com>; Cosmin Tanislav
> <demonsingur@gmail.com>; Biju Das <biju.das.jz@bp.renesas.com>;
> Jianping Shen <Jianping.Shen@de.bosch.com>; Nathan Chancellor
> <nathan@kernel.org>; Nick Desaulniers <nick.desaulniers+lkml@gmail.com>;
> Miquel Raynal <miquel.raynal@bootlin.com>; Richard Weinberger
> <richard@nod.at>; Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-clk@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linu=
x-
> renesas-soc@vger.kernel.org; linux-crypto@vger.kernel.org; linux-
> edac@vger.kernel.org; qat-linux <qat-linux@intel.com>; linux-
> gpio@vger.kernel.org; linux-aspeed@lists.ozlabs.org; linux-
> iio@vger.kernel.org; linux-sound@vger.kernel.org; linux-
> mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Geert Uytterhoeven
> <geert+renesas@glider.be>
> Subject: [PATCH v6 03/26] EDAC/ie31200: #undef field_get() before local
> definition
> =

> Prepare for the advent of a globally available common field_get() macro by
> undefining the symbol before defining a local variant.  This prevents
> redefinition warnings from the C preprocessor when introducing the common
> macro later.
> =

> Suggested-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Good to see the global field_{get,prep}() macros are available for use.
Thanks.

Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>

> [...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
