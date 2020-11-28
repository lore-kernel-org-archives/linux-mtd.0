Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0183CC63697
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 11:01:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FCDA20857
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 11:01:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yihFZr8n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Inl75kVv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ZrDSnzHV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FCDA20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Content-ID:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wmy1vFAOlMJyXvTt5mw6/wgRc6rAMC3znDWp9gLYSs=; b=yihFZr8n8nClEdL+u7QebrxcRb
	VvVLwsrPQr2XexyZKrNl6hKE4i8n+oKCmqrPCMKJy6BZqp2uvgHW11rzXGHAeCD6kydeIkFFwAvq6
	PF7vUpRpa3R+Ujw4Bs2UG/tmbRRufDqveJmbsj36QdTFIgu1L+XYAMHDsxO1UbKBNv7iEPAjW+ZLk
	HTOvqI0juWVkCWfnwlSoPql8zwqd15LcxvRf9aIypDR4LAZHj7uDxoIn7OChu1wOaEoYbpt9ri4I3
	2g+K6r+wEiTBfsFn1jRMzB3mbMTfSVQCBMG40aYuLk7MOEIY5yJHPMY12U9e1hs+xA59lhaFxY/H7
	LCzeScvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kixy9-0001Pp-Hn; Sat, 28 Nov 2020 11:00:45 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kixy5-0001Oj-Uz
 for linux-mtd@lists.infradead.org; Sat, 28 Nov 2020 11:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606561242; x=1638097242;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=JLgLyA7et1tjSTRUGex9Q6jmjkpZnDh/xEDthoOKFgo=;
 b=Inl75kVvAmz6YecoJDmNcrCcsl5xoV1/0a84t0HpVGwvzOKAL9emXPTt
 T+LZ6iwpuERxh7H7G/aP3KqEVs3ZULXECXZ9JSIv0uvUtkNcNs4MEZwJu
 +EjyzxUc4g5VlKB2V7r2ns9mlIm2Y/FQUXYPvCvzb+UZHFoJ2qOYuieO/
 sMRM6o6Hrl9hqHA+XdAH5Sw1VdsluBtodorUgJPx3PD0AmPi5SXsPcpAA
 4V5NXrMOWjdjIlIdYqyT/xRU7jMkPJ2ZC8f0+RAoeoR16MRyp0vEC+e7A
 sfTK9s/boVXqaPqkRpvc7U12JbV17srMezm6D2/NvL0GOErmcQt1Hts/l w==;
IronPort-SDR: 2B277sMADf4GiIqJq/TI5sxER0+TQyp6GJTbxd6uIjSnFBrt8nSP9zPvujSSerWvx0ZENyVb/Z
 lKv+KB5vgnz+t7P3bF4GMtCo7iNUtFkexxprafnrkbO2pQO65fKNTxqVPJ/Mc00fBto83DVC7P
 41TKv8xCDYycggDlBGQxI1iKIf3liKDe83clEqUk8te9jGLEZGJu0XgIZNYDLMzeR/g/Igsolg
 Lro+sHQh0zN6NQPAvNN4DUUlH1JOspo+fQDD9pr9gsaQc54+jgNy9NqO4GrJ1Ti7CPeGA72qCU
 UJQ=
X-IronPort-AV: E=Sophos;i="5.78,377,1599548400"; d="scan'208";a="100083502"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Nov 2020 04:00:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sat, 28 Nov 2020 04:00:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Sat, 28 Nov 2020 04:00:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFU+7ZVMIy6gongZ6TiNlbWhFVyFOcECkmvzLJ/z8QFmKW+wmURT/fR+1kcPgpP7qkayqIP6Y8GVedfn7Mu70HYxcUM1Gbbr23NqzYAAMnv3VsR/JU6xeWidzR4EYietnC46Y+moFxzT8uhLFIQzbzZDzYvf9uLmd1LAj6ZfNCGisAaDxY2wyB5HtnifFUqM+HLeH8RKo86UTyusW2Ui0tlx9jRWjoLuaVaO3sGv1aAHeV6DvaUH8D+XoWKOG2hkF3GWfeD9azYeDC/MOtx/UZCg4PqSls7DzEMiw3mjGtJP4uneep/N8/goSDngR0dtz17VPrjomRgVx4gFku6uhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLgLyA7et1tjSTRUGex9Q6jmjkpZnDh/xEDthoOKFgo=;
 b=G30YoC02WARWYyYhxKewBHdLtOpSVv6wj6ye9rNnVLWYbnJ2dUzKJaPj1F3UzPPW8E9Zkoawcfk+78qAlquMWUJWdDfIMe2Moab0jvR+a4z2aHIxsrdZUy5wrJIO8IrkhyEQH6GpgJBLyY+fHjtxvnC1amnIXO5TzpzWhbULn4DYN2FXlMYC5TllW8q0g56cPdZVlkFbLgz7x/ytldWsW4U3M02dBFP3VUWuyz2yUSXWyAINhEwWDDTwLjJFLVgBpZgmjObrwQHICEVWELbbENrKxZPmO05wJf3jTxnhWry/j6/HoMHW6FztVDdxYzmofggAbeK5O4uwISYrbDcG3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLgLyA7et1tjSTRUGex9Q6jmjkpZnDh/xEDthoOKFgo=;
 b=ZrDSnzHVhtOUg+81Db+QM24wvwfkvO9HVuYscy3UOfu6UnzDHdznIGfeEJNhW6Q14QLGLjibT4KgbNQyoUYZnw103RuA844bRpELKhtgLbRseIk8D2FQVGKWlRrbDK0EvdZ83Xg83QpxNreqXnU4VvlpkF4UsUv+wr4RvI8rGn8=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2832.namprd11.prod.outlook.com (2603:10b6:805:5b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Sat, 28 Nov
 2020 11:00:39 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3611.026; Sat, 28 Nov 2020
 11:00:39 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: spansion: Set ECC block size
Thread-Topic: [PATCH v2 3/3] mtd: spi-nor: spansion: Set ECC block size
Thread-Index: AQHWxXW011wJ3HkJ+kmM38lb4/6CfQ==
Date: Sat, 28 Nov 2020 11:00:38 +0000
Message-ID: <ecff64ce-7170-0ca4-b10b-aa9f99f4bd46@microchip.com>
References: <20201118182459.18197-1-p.yadav@ti.com>
 <20201118182459.18197-4-p.yadav@ti.com>
In-Reply-To: <20201118182459.18197-4-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d526196b-c6a4-4db1-bc84-08d8938cd75b
x-ms-traffictypediagnostic: SN6PR11MB2832:
x-microsoft-antispam-prvs: <SN6PR11MB283298436B9C16F12897570CF0F70@SN6PR11MB2832.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FZjMhuPWGwH2qrV2EPDnpWZQ6Q6/gDzcXD+2MhAaolP77P2OzPklELriWkjXMk4zfZMrSFLUjSdWHLaCRNt5AF+UkWsXpRIwZlay+R7pAlh6pA28NjASw4SnJMwP6xs+2VPrxPBmMdDrC2H6z9p+W/uHpJlZJKdyaXeMPA+4ySXoJBfx9f0ala09lmKThcAB1zjz90xvZTq+AJ/PbY+XyRR2+ZVN8i6CBLyVhaormJ33fIIVKS+ipISEvURHPpwrovV4c1Tx/Hgn5hEBbiSUfKs8dkcCkmmDK3nz2vPl7GcIgmd9uGKN0p5Rb/KMTz57u6EsXV8SfPtym0klorwau5WstmtjW7A7MmVDBxMktKWICkXUqAlFD3XhFSUQ3xqK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(396003)(136003)(39850400004)(346002)(66556008)(2906002)(66446008)(66946007)(66476007)(64756008)(110136005)(316002)(6512007)(53546011)(71200400001)(76116006)(31696002)(26005)(6506007)(8936002)(8676002)(5660300002)(186003)(6486002)(2616005)(83380400001)(31686004)(36756003)(86362001)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RWg3YVIzNUx3K2JuMGF4Wm1SSEtoc282TFBBWEVtNy9Jd29ic2NQcGcvdlEy?=
 =?utf-8?B?djI0YXlRYTBaQzkwK1M5SW92elVWMXJ4S1hBWFdYbXRaMWdLODNLRlNSL0ND?=
 =?utf-8?B?RFRDLzdSckVtN0YrZUsxZ0tRTnVaL0JWVmNRYTVnWVRMNGM1UE5HU0FQZ0xM?=
 =?utf-8?B?RnBGYVhwNDVmb09TRzhZVDlnYkNVVHRWSUw3OWNwREpCVDlLTndpMGc2Q0Vw?=
 =?utf-8?B?eGlnL0t5L1JnOEYzMzdGMThEbkJiSzJCWTVTM3hZSThBU1hHSzNzWkxxNDVw?=
 =?utf-8?B?OFhwTGh6MlZmZzNjTStpdE5Ic2NuOTRHQmN2UFJHd1M5cTZQeTFqRTJ0RGhq?=
 =?utf-8?B?WURCVS9kbGUvb0Q3Z3hPZE9IS2J2bTd0NUdhL1RwM3FqS0tyUnRIUFBNbjJv?=
 =?utf-8?B?d2wrTTEycWY5T1Q0MU1IWThBcjdzOTVKY24wRmQreDVTTkpWNWJlcGNnYUJU?=
 =?utf-8?B?eG5DMDN5cjVYSW9FS2hEUlYvdk1mWXhWalU1bSs0cFZMalZhV0NQRGwzVVFh?=
 =?utf-8?B?WElocHBzbDNiZzBmTWQ3b3pHbWpqa2JvazNaWkYrcFpHVFJtQktYSk91S0JL?=
 =?utf-8?B?bEFkRHpTMmcyZFhreDF5Wm8wT2ZkYUd1MUdmTTBCOXRNWVM3SmtjRVRENWdz?=
 =?utf-8?B?WXU4alBtQW5MMUpIYTdpTXVFRjRqWklkK3Jnc1FUSkdPdUxFaXFDY2plTXBF?=
 =?utf-8?B?YWZrTDdBTWdpYW9PUkdTZ1FrOFlrTjkwci9LVk96SU1ZMS9NUHZlSXhNRTFX?=
 =?utf-8?B?d01hRW1XTWwrd1ducUQyM0tOL3FocExmcWZYVTg0RFZvUW5JL1JVTmRJVTV1?=
 =?utf-8?B?WjliM2Fpd2YwaDZjNWdiVXFHS1pydWRqT3VBQk4yNVBzNFpmaW9jWDloWnlH?=
 =?utf-8?B?c3RsbjE1bjZSWlVKNmtleWZibWFKQ1FRamZLL2NRZnR4NU8zOGlQQjlla2pN?=
 =?utf-8?B?RXdNdVFJNEtVVi84TFpsbGpFY09qUVhLVkJXbzA5YkNMbzArV1NjcWtZaDBm?=
 =?utf-8?B?MkpxMHJZVi9MRVRqTElkQUMwQzk0YlJWOXRLTys4NG16bWJWVHZLbjFteThD?=
 =?utf-8?B?bHg3eXdRd2RRajFxbU5lRU1ld2J5Rkl6S2dFVWdiYmdTZWhrc0NDaXkrV0tr?=
 =?utf-8?B?UGovaXV3UVRBQlFYU2wrSW1JMTRsaWhXcnY0QUpLeDlVY0hTWTZhekdJcUtO?=
 =?utf-8?B?aW9WNXBPYWowY2drenlSQlRpYjFTVlJHaUxYbEdsVitjSDBYb1FBMTYvOEZq?=
 =?utf-8?B?RkV4NWlML0R2WnRtN1VhT2xFd0w2amZyTHNBMkJydUlBN3dJSXRwSlNydHhQ?=
 =?utf-8?Q?oXOtUCsm+Illo=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <F32C946811C3B243BE9712BED5563EF2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d526196b-c6a4-4db1-bc84-08d8938cd75b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2020 11:00:38.9687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NTKCW93tNVorUbBrhAVm4QZRnsJEAsi8eAjPAMFMK7RmHMDcicY9R9yadthcaQMWczCV+TaSfxlUZgbAT7GKZDVQxMOK4GN+e9JbqZCVRPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2832
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_060042_276058_ABB4A029 
X-CRM114-Status: GOOD (  18.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/18/20 8:24 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The S28 flash family uses 2-bit ECC by default with each ECC block being
> 16 bytes. Under this scheme multi-pass programming to an ECC block is
> not allowed. Set the writesize to make sure multi-pass programming is
> not attempted on the flash.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
> 
> Notes:
>     New in v2.
> 
>  drivers/mtd/spi-nor/spansion.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index e487fd341a56..b0c5521c1e27 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -109,6 +109,7 @@ static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
>  static void s28hs512t_default_init(struct spi_nor *nor)
>  {
>         nor->params->octal_dtr_enable = spi_nor_cypress_octal_dtr_enable;
> +       nor->params->writesize = 16;
>  }
> 
>  static void s28hs512t_post_sfdp_fixup(struct spi_nor *nor)
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
