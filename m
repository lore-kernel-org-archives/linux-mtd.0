Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A52BC4363A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 10:26:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBFB6246B1
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 10:26:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PhbrxYz0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="jp9ayx2/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="hk/gorIg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBFB6246B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X7+1SgZ4+3trRxd37UH+eXLOGBnLFfdEpFXTfjJYmGY=; b=PhbrxYz0guW+LLQx4FFcV4U82
	I9o8t1hi/5mC76r6aJI9KsVQwso/uMK33o/+bRSX9cDAKqyL6kgUwsU6XmWvBOSEx0JXW3qSasuTR
	xrAvaYBxDhPvKEAmwDf4Vi05CtLF+FdA3NMZUQ/O9QblYVX+0NlkPFvKdCPAM33aKdOcK9BMBcIPQ
	ueYGmt6QaN94BG6QCHJDQTsHtbcaX3fPAWm5Tw7yiS1UyEZvqEW608BG6+x7l0L6PJZoHyWWnZE+h
	Tr3q6tKL4TeGCZTJY6T4JdfHcpX79kv3uerojnTHMB5y4eFzz4H47j1oPGhPJl0Jy+K/jSMvW75/F
	q0g9P+IGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXie5-0007qI-NK; Wed, 28 Oct 2020 10:25:33 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXie1-0007pF-Tw
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 10:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1603880731; x=1635416731;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PG3BuBb6fhnAMRuIGMjnnLTCQ1TwiOigd1jmvLmaAq4=;
 b=jp9ayx2/uiOEnfWJbZvX3e/GvDrNNvAQqhYy/OCgHnz99HIB1Zjg/3Ea
 RIs25RWRUqQL5KE2s7QsTK9KWuhlGQAZEaXSkJkh8fAVWU9QWtoCLyAyV
 yAzjHUfndlU6xoea6aYJCVt8tmvkOmvce364Ir23hcMEnl8oTstI6C4mM
 7AR9I3nuRlJDhWeYblIJyQN+YlJC/Exeqxo6dRg9gi33GSZlxs73DDa8n
 iXNCpCu8vAk8y5UJEtFF8U2SC47IYBnAv67saJGzK18mkeEG8rNAFjFlp
 VzNgywgZDXtfEsKpwhrzxI4KMQO1NEdp2q5GCqG1SNB/a+P33nm6i5vbD g==;
IronPort-SDR: h0JZJjUgFzhNcyzZfbHpEKilCIVApPLErjsd3PRdixbtMMvDkGOstLzyYiKGqq4KoY9DlvxtgN
 DZyc1VSLYZ+P5NghzzbRgbLYsQvFYT1ixK/nX1wqpFkFiFcRXMAbeSxGl2cyNeuR/SDiSR9jRJ
 jw5bqLY5lguDTRvEFi69JBb6loyEq7xuTVJ6UOU/1gje772TxAQ5qFhRvfQADWmqbtFXmE8c2V
 XRtfrepPS4Vw64G5UZ4YXM6qriWqgm3iU4h70c0eW7FehVgdR4wgI/0w3U5tlCWMnVTDwga7WS
 q4U=
X-IronPort-AV: E=Sophos;i="5.77,426,1596524400"; d="scan'208";a="96276571"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Oct 2020 03:25:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 28 Oct 2020 03:25:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 28 Oct 2020 03:25:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0USuTs95DbKRXPAu8SuwBqe0gW4NF20CpD/GPyRnV8bci6tcp/VOHg2oPEYwEhdTm2e49K9c2ptcCEswQByOPlwp5v9+SclfA7f9SgXP0FYpC4Rh8D0iGcpGzOUlHaf9sPreJcI/qRYO2GyKNIY9Q2rGbdSS+BBjsU3CQl9Dl0c0+7Bb/0elfw6CD5d8T4FBlfOs+iVmdzlCaaC/ktcfKuFQ1DsObrK+2z8D0DVpowIA1JZpIx7pyoN+Y/AqPpgREr5nWNJXaZiIYreV+tsPujPgegPlWu0/qifMbBWUiT+pBDOwucxZDvCChIVOo2RSSUK1LLZ/UiADICE/chZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PG3BuBb6fhnAMRuIGMjnnLTCQ1TwiOigd1jmvLmaAq4=;
 b=FJO+MZOkS4kYnVjKg2Ic5yVUUJPs/+BHxfSJ+CEKxrpOPLu0EkQ5NmeZYs98hvCJRdccOsBhJhrx4reNb0z8VfPtRr8r0gpxTJxxhYzYFntY49z+TVhmfK3DgPjZjkJBAj7hPmWS5sbJNMDxpczD03GEkyA/EhkK4MjukSBRxjy4/lqaprDkO5baB7aNPas3j/Y/O+/2SfilJe25q/IVJ+F1eOfmYrQ1fQyi7AQVCsSbLpNDjpbql7SZC19J0waikNuD5nrDDQh5EMnnLn2p5kayW9b+L8uc4syWrW2lhh6+e33EapZmprXAKQ1R8UHiUhVCjZa+Qat0HZA/NjZKmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PG3BuBb6fhnAMRuIGMjnnLTCQ1TwiOigd1jmvLmaAq4=;
 b=hk/gorIg+NNkHOqLlbEjlydvtRH/Excq5N1OIGY+MCEOPFc2zQ5w/Ytpce4PrPj1km0KzesVoZHJOjdAKuK7PaSZWAIDNWOkMMrY6RLOhESWSKqmgqwvjNLgaofawh7+FKN9tMDdVzBDHgEcb0+5NRuQhjLH+PR43XZ2tlb+rYQ=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MW3PR11MB4700.namprd11.prod.outlook.com (2603:10b6:303:2d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Wed, 28 Oct
 2020 10:25:25 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::413f:1b5f:5cec:3bb4]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::413f:1b5f:5cec:3bb4%7]) with mapi id 15.20.3499.018; Wed, 28 Oct 2020
 10:25:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <masonccyang@mxic.com.tw>, <broonie@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>, <matthias.bgg@gmail.com>,
 <ycllin@mxic.com.tw>
Subject: Re: [PATCH v4 7/7] mtd: spi-nor: macronix: Add Octal 8D-8D-8D
 supports for Macronix mx25uw51245g
Thread-Topic: [PATCH v4 7/7] mtd: spi-nor: macronix: Add Octal 8D-8D-8D
 supports for Macronix mx25uw51245g
Thread-Index: AQHWrRSmDndyYSszbECSYL7OWHzFOw==
Date: Wed, 28 Oct 2020 10:25:25 +0000
Message-ID: <e3bbdf22-9cb1-fd39-9bda-86147fc1f0f8@microchip.com>
References: <1590737775-4798-1-git-send-email-masonccyang@mxic.com.tw>
 <1590737775-4798-8-git-send-email-masonccyang@mxic.com.tw>
In-Reply-To: <1590737775-4798-8-git-send-email-masonccyang@mxic.com.tw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: mxic.com.tw; dkim=none (message not signed)
 header.d=none;mxic.com.tw; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.127.107.112]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 653bd488-56c6-4dba-834a-08d87b2bc8e9
x-ms-traffictypediagnostic: MW3PR11MB4700:
x-microsoft-antispam-prvs: <MW3PR11MB470055BDFE1DFA51EC064939F0170@MW3PR11MB4700.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0yr+/AAqtU784gxRUFrWF9y9acb3afj8U9gQ+9jPlDq3qJvGZs/lSmkR2AhZCfS/tkAxw8LoaaERX00eQnTsR/d6jFU8LhKnCs7KsA5cvJ9Gu/0fImtXAeJO7sPsZRvpPeBhdtRGBYmXPZjWAQY/F8TB3uFVkuETkuCdGqbqO6nt+H8JvbHKevTf6bUAKq0W5jeLINe70zJK8kpGrwZp9HClDUy1eJ6nP4tu9BDxWcj6moExPo0h5DpjlLPvtMhwzUC4rSL91RusMv+tMjH5/hg929V7NUejEFeFTwqLafAeGvuMJAmG1FGidIW0zLCYFRqwM1kSM4DM57gDZtGxp8WA+AuVnL6bvjLj/7zMpCO4I53dmBkv4kCc7CfeVixi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(396003)(346002)(39860400002)(366004)(91956017)(76116006)(6486002)(110136005)(54906003)(186003)(7416002)(71200400001)(478600001)(31696002)(26005)(53546011)(2616005)(8676002)(31686004)(6506007)(316002)(86362001)(8936002)(2906002)(36756003)(66476007)(4326008)(5660300002)(6512007)(66446008)(66946007)(66556008)(64756008)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: G98Lw1C1dE1dNv3pvWv23ahxMB9CQPicUvn3dNVPYSsJ4Z07kUx74mBa5nHNRs71qNr2TPxGKzZMXyEFsraXjKuEtylCJU4UMzBHMOQhxVs1gQjGyK1SKh+x4rC+0YEEqJ5tKDuqYLnnZcOqSRpFnEDcOfqniviiP1EI12RuvxcsQOVkTax0fwGE3J7x2Ndz5wYC1KvoD8kbuW5tU9BjRLV5obuYiYKRGAFw0oGNwCQ3PFwASinb2pDPYjT6WqvYP4tSQYt3WEoplrv2R0vOlkWrXLJweFEtT8pockzjOqciHKxDnPH7IGuj00LgWvvAHPcmNGjj0U94ycs07Om+ikw9nR+D94mo0vX4ijIV99xZ+5bhP1LrKv3nbHmpwAfbT/ISO/D6Pt5B1K8+uQ1W7HkaBrf7jcwkv/qX5FXNAYNFmbdEDSmtnuP9SMYka2KFRztixji0yK3gGs+cbYYWTD5uHsdWmmi/JfQFdr3DyRZKuEGnEnCOChnHRVwQDojgXmRZ6saY2MO7P5EzDIYQn6kSTz5qPu6+uOosG1YJB3Zq1TrgbHGw5gIOHIAzk8c/SKx2fq137sAjvNtKSMx53io3KlOB5bvetwdiR6+WKCN827iovCoozL6mMyF9WE7iFBCY1Odc8kKdnDnuD7IPFA==
x-ms-exchange-transport-forked: True
Content-ID: <1219999BFA9FA149AB04EFCE8239AF20@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653bd488-56c6-4dba-834a-08d87b2bc8e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 10:25:25.6217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rjiRjs7SVCefuM1+LVRBoGxTc36Zifk2SaHpKeWwSw812m3sZfeP89ee68p9aEntJJMPJt8vu/KVapiqSh8wND8Uw+r+NUiBbEqgyihslt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_062530_140190_3615BD3F 
X-CRM114-Status: GOOD (  23.18  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: juliensu@mxic.com.tw, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, p.yadav@ti.com, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Mason, YC Lin,

On 5/29/20 10:36 AM, Mason Yang wrote:
> Macronix mx25uw51245g is a SPI NOR that supports 1-1-1/8-8-8 mode.
> 
> Correct the dummy cycles to device for various frequencies
> after xSPI profile 1.0 table parsed.
> 
> Enable mx25uw51245g to Octal DTR mode by executing the command sequences
> to change to octal DTR mode.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/macronix.c | 55 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 96735d8..6c9a24c 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -8,6 +8,57 @@
>  
>  #include "core.h"
>  
> +#define MXIC_CR2_DUMMY_SET_ADDR 0x300
> +
> +/* Fixup the dummy cycles to device and setup octa_dtr_enable() */
> +static void mx25uw51245g_post_sfdp_fixups(struct spi_nor *nor)
> +{
> +	struct spi_nor_flash_parameter *params = nor->params;
> +	int ret;
> +	u8 rdc, wdc;
> +
> +	ret = spi_nor_read_cr2(nor, MXIC_CR2_DUMMY_SET_ADDR, &rdc);

nor->bouncebuf is DMA-able, use it instead of rdc

> +	if (ret)
> +		return;
> +
> +	/* Refer to dummy cycle and frequency table(MHz) */
> +	switch (params->dummy_cycles) {
> +	case 10:	/* 10 dummy cycles for 104 MHz */
> +		wdc = 5;
> +		break;
> +	case 12:	/* 12 dummy cycles for 133 MHz */
> +		wdc = 4;
> +		break;
> +	case 16:	/* 16 dummy cycles for 166 MHz */
> +		wdc = 2;
> +		break;
> +	case 18:	/* 18 dummy cycles for 173 MHz */
> +		wdc = 1;
> +		break;
> +	case 20:	/* 20 dummy cycles for 200 MHz */
> +	default:
> +		wdc = 0;
> +	}
> +
> +	if (rdc != wdc)
> +		spi_nor_write_cr2(nor, MXIC_CR2_DUMMY_SET_ADDR, &wdc);
> +
> +	if (params->cmd_seq[0].len) {
> +		params->octal_dtr_enable = spi_nor_cmd_seq_octal_dtr;
> +		params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
> +		params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
> +
> +	} else {
> +		params->octal_dtr_enable = NULL;
> +		params->hwcaps.mask &= ~SNOR_HWCAPS_READ_8_8_8_DTR;
> +		params->hwcaps.mask &= ~SNOR_HWCAPS_PP_8_8_8_DTR;
> +	}
> +}
> +
> +static struct spi_nor_fixups mx25uw51245g_fixups = {
> +	.post_sfdp = mx25uw51245g_post_sfdp_fixups,
> +};
> +
>  static int
>  mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
>  			    const struct sfdp_parameter_header *bfpt_header,
> @@ -84,6 +135,10 @@
>  			      SPI_NOR_QUAD_READ) },
>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048,
>  			      SPI_NOR_QUAD_READ) },
> +	{ "mx25uw51245g", INFO(0xc2813a, 0, 64 * 1024, 1024,
> +			      SECT_4K | SPI_NOR_4B_OPCODES |
> +			      SPI_NOR_OCTAL_DTR_READ)

octal dtr page program is supported?

> +			      .fixups = &mx25uw51245g_fixups },
>  };
>  
>  static void macronix_default_init(struct spi_nor *nor)
> 

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
