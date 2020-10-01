Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D92C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 13:22:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D1A220754
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 13:22:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rGAFZCn7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="OpUd81Yr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="K/vcFotl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D1A220754
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DsLUcEpEnmcwpv3oJJXzKbfCK5ks4XcTn4jtc33nXKo=; b=rGAFZCn7fGevVfNLxrtHgrvMH
	bkrem2rBtiYk8AAyNe5I24TnLAXegripO+uPvosJcZtc3KFIiVwKvfEvTGx3aL8M9Jn2GiaP0lAU2
	zK8e4YAabhrbH30JN0TJWe+YfpJ2D0LwtJfVJHkXvEtSFIryLcfIJ9QAvTCGZ3y9Npm8W81uJu5ez
	gSvnhxBzGXiok7ZJCD+1x7sdLuMuqM+kLf1XOW0g6m6jRHLElAi3GypkLF8XlnMwXXrcUfwK9s31q
	3b0FaFKGXcajTMcBVBPBe/y1N9PtpXYjy1V+anZfovaH4VTDDI2e5cYKWlGIcz5LnTQgOxFV/FJJX
	deA0MAX0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNyWf-0000xS-N8; Thu, 01 Oct 2020 13:21:37 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNyWc-0000wt-RH; Thu, 01 Oct 2020 13:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601558494; x=1633094494;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FYHHSBn8heQUx5/79FLaPU5U/gHWri+t6Tre4kerS3w=;
 b=OpUd81YrY59pRxdY67NwiuL7NP8ULntgy/iYjbewKXjW3qsPA8ysFaNG
 mqlYD9EwttI3tByfnq2v49VLd/iBDFhmmzX2M40hkeaA8twPwv45BB+fT
 Yiz/9ZKS5RuX2TkPCL7yyUUqaGFU2sG3MjLpcsNeNfRWClvk6N12J+XfP
 Nhr1Vg68WhQVGQBegqYbxTFqIxnF2CNVqoi/MAwvnMF/JoMybf7WIfKHD
 3cHon0ZdrrVlskBmU7COQ0sGOpR7ZPaCEggh1dPJ0e1+qnXOJSwU7oYOa
 Nk7EtACZEjHd0BllrDyXKLlIL5jMZi+szxZJqHl4R3Or+QhzNDwibOOZg A==;
IronPort-SDR: 0XHgO32+4RZno7SOhxifpkGrodL+sbGG8smdpfhgvzjEkHk4m/fPcAxOTij7gBAD5Kyo1Q8okK
 MIlvsLJEHT0zo+fP9rH6zmEyLRD2ABgYr50C5TtdGyw5Mf75LkatwiLk14SJsKKbjFNtw/Iw8T
 f4yy2xSV2ysgOS/kQU6hLUS1uXyvLLwX/jWPKaMsMDlLKq0yUygElRGIRq2l08yjrJiV+J4alo
 60QKN3taTapc3amQqLRQkWdwVjvrh7WKnsp+AFshpcPNpaRFU6WVhSeh3RliXm9YsR+4yI7R4P
 Agk=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="91088525"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 06:21:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 06:21:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 1 Oct 2020 06:21:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWikvx/OpYOL+ZaEa9BQ+xwo6SSV8HCIEF01EZ1F958neSfcUkNN5xDgz2YSPOi+dCa9PPeBY6C/UctiqNrhzsERKA/C4YoRqnSeIHAfCR9g4Ar9dL4ccvb+mZI6ljeDbAjjEAU+qrG723W8teU2Te1EbFSQ+jm98+iRuNH9F3nt9IZd/gdebuzdGlwW8Li9GpKGble5V3EyR2PWru0sUVQBnyx9X3mPZbdUrkurmmJMECvMFFoDTTgfqDILv0Su/ANIBXm1RCMFRSyq+/gGxrAqAAUubpuRtiFz/6AM772833zkATuhRXZ5NoFUCBdbuqyrR+BHQEELH7ShME6FTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYHHSBn8heQUx5/79FLaPU5U/gHWri+t6Tre4kerS3w=;
 b=BJgVcGhymWk/ts20PzQEXE1Iyfo8C4VCy4//d3ZyrJjiiFSFQbnfOyoM35suVM8fDZ+rlb2lgDORNxfFktiG53/cU4WPBeYopKMrz2MR09NRmJN46+gFlK/pDKwVL0yQXi+YNJLzOM955B9mZD5zMgonrh9SiOxorRMzY2ffUFd1qLOtiS/0akG0zN+7zo+c/EsPmkrCyAkN/W0R9uQKB3gm8TN6jn14wMKhVyoeThHg+ViEk9aPjaZNpUyjtUfvBDqy07bq5F+ANsJoF94elbxNrVTvQftqRcExMjQZ8RrNGzjoTFjAoPhcAGMBHCl/Oz5gnwutgHo2nBSkglSnKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYHHSBn8heQUx5/79FLaPU5U/gHWri+t6Tre4kerS3w=;
 b=K/vcFotl2KSyum4t7VnG1U5yh39bhL9LQpOdGCGidwWkl8Ha6DRYRKnFsIKGDQKz+BuiHCzb2rtyDKP2DYz4o9aOMjN/LbT16ZcT1mfvHCt/IEB+DUG14vDeN4b5jmFaqzj67Cl45ajwmILKEbed/LDT8fcMt4f00pnvMhrBLl0=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR11MB1467.namprd11.prod.outlook.com (2603:10b6:4:a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.35; Thu, 1 Oct 2020 13:21:30 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 13:21:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 1/2] mtd: spi-nor: atmel: remove global SNOR_F_HAS_LOCK
Thread-Topic: [RFC PATCH 1/2] mtd: spi-nor: atmel: remove global
 SNOR_F_HAS_LOCK
Thread-Index: AQHWl/XGolQmpEhmZUmGKx8TlQY45g==
Date: Thu, 1 Oct 2020 13:21:30 +0000
Message-ID: <915f2c88-1832-3c15-09ee-b0959e0ae70c@microchip.com>
References: <20201001122828.23186-1-michael@walle.cc>
In-Reply-To: <20201001122828.23186-1-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.51.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eedbf0e2-de6b-40f8-c0ab-08d8660ce8ef
x-ms-traffictypediagnostic: DM5PR11MB1467:
x-microsoft-antispam-prvs: <DM5PR11MB1467D3FE3F9D40FD142609FEF0300@DM5PR11MB1467.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +zB0hGQky0FNyPk+znpS3rI3LQcSGxwpycOfM+uRp4O6CmVGQtEc7NU3iAtebWAHGfdg/LPaKo90Tmp+SEYeCqdXOddKOWElBxL91Oe7+KPyGN3l+P4W0lTEfDKQSxuf5dxls09xWuJ+Q8jCnY9fWD80tv7LkiYJqjXAyrQkBJeDWYca95UHpEhjmwzv8vUNke675mllFLb380aqZ0GWCePxru4ZmjVJsTptCk8KuiwuvTHbPEXl8x6WZlGuGnq3Ijd1CEdvDisBv9ilyx56nlcRmqwLuGG5r7iWtkLdTYf9I3WNwgz6SRLnmPIHGb4oMcmE4mk6gSh7Tji41Ag06UiowYt39SQypMdu4USp3ZJBb7bVURsVn4cv0CVITc82
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(376002)(39860400002)(136003)(66446008)(6506007)(8676002)(53546011)(26005)(31686004)(5660300002)(186003)(36756003)(110136005)(66946007)(76116006)(316002)(91956017)(54906003)(478600001)(2616005)(8936002)(71200400001)(6486002)(64756008)(83380400001)(6512007)(86362001)(2906002)(31696002)(4326008)(66476007)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: tzT+ca2ze6OXKpVGeEBRG+8A7ZFYraXzctkCpDLFR5LTM5gG7N0vrPkxOHOqk/gwrcKCPEh7qwnmGsGW+UtSA/z/PAP1lIC/0vp3PZTQ3ZfH5EtUWuZssFESdncoH4tlmnuFMz0vg7T06rbtET9N18k0uq+ZPjP130sx9YmIBeLUm0QaPNzEQHKxFzqSSwJKjG+/X5kUA8IZttKTcdbgNiXdvxGFXGDy/s5kUJW6ycaBoH8t5rrE8GPSUZlTm0IGy6Lf+RhlyBBQRNzVLrDH5WyTWt3UD6K5CEJTOcpgQ8BpEvTm4vG/jtJjZo1FOLgaYqPsDCrWbv8c4tGYmJTPMRIf3TOB+cJnHQzO620IHMo3efPvW69UzZFnlfarMsbI90MJsudz5l6cwaA+TgI7xoj678mmVEbwbo02ECq1uodmGgu5kMMt273JHB2uBgn3q4CBycHfl8Uc7ItmCnUTind71OarB8QZ2dZZBTEi2llcfh1pMWCLgzBTve0e+ESKL8DGFshb9eCctj2bM0dJEeha1q4eaIf6I9jCdqbz9LFsKTFJ4x5ym6bCBQr3XzBssgeQJ4t4qNTALAg9ac6ZROrqrLi8t90+DPpUoxKZDJGa9wRS97c4o+33bz+mViO31MjYG6oGdYu3/e5H6VJszw==
x-ms-exchange-transport-forked: True
Content-ID: <4305E60F56515846A3215E59ABEF803F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eedbf0e2-de6b-40f8-c0ab-08d8660ce8ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 13:21:30.5063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wofotMS2whTh/MLgiNdmBoLCWz00lXYmrHtYrCwn07N92OFCCXnE5SMqWJiU7q/u+4Mqe1EBvvQMnvoAU+2foqAZoanNKBSM41xd1fWRQ8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1467
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_092135_179118_BA6A39B9 
X-CRM114-Status: GOOD (  22.30  )
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
Cc: richard@nod.at, vigneshr@ti.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/1/20 3:28 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> This is considered bad for the following reasons:
>  (1) We only support the block protection with BPn bits for write
>      protection. Not all Atmel parts support this.
>  (2) Newly added flash chip will automatically inherit the "has
>      locking" support and thus needs to explicitly tested. Better
>      be opt-in instead of opt-out.
>  (3) There are already supported flashes which don't support the locking
>          scheme. So I assume this wasn't properly tested before adding that
>          chip; which enforces my previous argument that locking support should
>          be an opt-in.
> 
> Remove the global flag and add individual flags to all flashes
> which supports BP locking. In particular the following flashes
> don't support the BP scheme:
>  - AT26F004
>  - AT25SL321
>  - AT45DB081D
> 

I like the idea. Thanks for the effort. Will check all those datasheets
and get back to you.

> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/atmel.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 3f5f21a473a6..49d392c6c8bc 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -10,37 +10,27 @@
> 
>  static const struct flash_info atmel_parts[] = {
>         /* Atmel -- some are (confusingly) marketed as "DataFlash" */
> -       { "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K) },
> -       { "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K) },
> +       { "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K | SPI_NOR_HAS_LOCK) },
> +       { "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK) },
> 
> -       { "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K) },
> -       { "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K) },
> -       { "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K) },
> -       { "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K) },
> +       { "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK) },
> +       { "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_HAS_LOCK) },
> +       { "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_HAS_LOCK) },
> +       { "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_LOCK) },
> 
>         { "at25sl321",  INFO(0x1f4216, 0, 64 * 1024, 64,
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> 
>         { "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8, SECT_4K) },
> -       { "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16, SECT_4K) },
> -       { "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K) },
> -       { "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64, SECT_4K) },
> +       { "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16, SECT_4K | SPI_NOR_HAS_LOCK) },
> +       { "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_HAS_LOCK) },
> +       { "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
> 
>         { "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
>  };
> 
> -static void atmel_default_init(struct spi_nor *nor)
> -{
> -       nor->flags |= SNOR_F_HAS_LOCK;
> -}
> -
> -static const struct spi_nor_fixups atmel_fixups = {
> -       .default_init = atmel_default_init,
> -};
> -
>  const struct spi_nor_manufacturer spi_nor_atmel = {
>         .name = "atmel",
>         .parts = atmel_parts,
>         .nparts = ARRAY_SIZE(atmel_parts),
> -       .fixups = &atmel_fixups,
>  };
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
