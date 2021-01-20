Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30711C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 13:03:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE9CF23357
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 13:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE9CF23357
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=luargzhDtHsBTKAhj2Bxaubi/RBLx1lFd0Ysr6HurM0=; b=dWb+/MMpnsr2isYa6ZFq6FlAG
	RI+l6aajlnOqfBo87rTB31cJoDuQktopVIzq4f62u3HnTa1c6f2XAKwYuN6Dr346vv4CeZveUnOjI
	V/loSbiURJxxiHwgsOMlAjIVrqGJJavraEqcoFzQyR8d+diyT34Si46K6x+CcEkFf/lna2xPZrmtt
	OzPMIbY0DUjaHX1t21xpgFR+VYT15o4Ot9vlJ+ae52wGIqsNRbi0cunWdIXn+6ETa3d3l53Ei/bV3
	0WX4zN/og8Hkx9yiPzzNfbyaa9AuN9W0pqZYF3kRBllIWAh+VoSo0pyNBTRXE2ktL+MhzOqS1chgP
	cDioAc3sA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2D83-00050t-EF; Wed, 20 Jan 2021 13:02:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2D80-0004zc-Gp
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 13:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611147748; x=1642683748;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rAsgC8XDcV/RPuv5CcyY5SdKzJSf7D6s9PwFs6llirU=;
 b=YkAR9+6crJ45BSdVP+cj9LceN/bLP1hGIwx0jL48eOAUIMHuBqfzbn+g
 mb/hFTMMEKo59+ryJmnJu7ihaU+fdWo7f+rd+KkKqRjdW289bVoy+yVzJ
 hyWNahSvoh0WHSSCIDD1lsrMllHDZWrDFGeMjpLoYH+gph2/2jQmFmngY
 TKIZQuFvNlFAaObSpd+A6mHO9XOaPihiLkStG+dHTaB1nfygtvW/iFeAk
 59fFYtY8r3PYAtKavb/xibXlSEBVZ7sPnMvE0qI2sN387vU5rvg8fGg7r
 AIoiKQaWPw7Yivpd+mKm1kRQTdnfSEfB3/dr6TmxcTN6ucBngcS7XObJl Q==;
IronPort-SDR: s77K5eSt5i9fBugt+9bBUsnbvRP+i5w5IJ4O1kZUzUr846zNvk8F1Fat3qdQWLMmFXsgGaNKAd
 dmIk866jIcHR/2pmRKMgsiqL3zAf4l0b5XZO4jMlUZuvMPmrtTy/tmUDk3FL4xX3hGUBLQK4VR
 aWyAJj5VIIRZT7JYKLF1iyVusA2e1T6Onja37+jEj1DbpDyamHThhhp2wTMu49Oiv49+4UUquZ
 aDeTTwnIp2GImB4vNfHLVGcBKMmrKcI50FHz0Ue60WPungvz2ApnWgla49uzLMalGDrtmtjPvT
 pdw=
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="106101154"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jan 2021 06:02:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 20 Jan 2021 06:02:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 20 Jan 2021 06:02:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hm4Z2oxUA1MSTqSXTfpvKz7UMq7e4e4RpYDEzDH0FrsM7SRC+qXpJH/weG8Ke+iD78aGCyAMLgsZyA7C2cih2EQie8/Bxq2zupjnbFI7S2FlZxKT6FdLxARSutCl2i7A8LRqh8+GrVRK2tDJXoUx6zKAo8SrnHdWu+6S5qCA1u44q6qs4M+vYeJp8jVmXxJlvvFQ73ZoZ0xoWySF955GWTXbSuUgSdwyzdamwyc9BI8iCKAcHeNnA1MHU8LSicyFsAHLp0H+Z9e+y7tNn0DfNI+2immlmcmLfjwPOiEozbT/dKdIP9m8qrdCTlPTePnOFkZYWW3aHq1PkVwbsLHSLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAsgC8XDcV/RPuv5CcyY5SdKzJSf7D6s9PwFs6llirU=;
 b=e9KheeJv7tsALIt7aSGplw+JurOt0s16tlU2M+yqIggRtXhEJaVwSRcxdzJ6dWK+Il6VOfGdmTRccBplC9ATKBCr6Z0kXlJpb9sVQr9CePhr8LqCxNKpHvF7QAsqRh5e8wQ+K/eIFOlsGqtglsUMm0Vqpm9N/lX71z58dUghPqH164iedS05VNOYMUroyjN6eRa8xGbmSiSotl7THyb8Vlidk9QDHUCFQyoCcrZNPHWQqGjhYskpYkllyzGEPoPXk4q3crMVSbfz/8wRvBmj7D5uZke+imspZd8flHYjtQ+8oJYHh36Phrp1g96Cu5S0d5We8K493C+2Smj7VLiOXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAsgC8XDcV/RPuv5CcyY5SdKzJSf7D6s9PwFs6llirU=;
 b=AOvoettrdgm4efbI0U9WGIRCD+rzfrMV2rLJ2fPgTO/2EJR8WJ3iRyRY/6wqhvsIDVbeJBpswyvioO95PCJNTK9KupxPPZrMfoz3T3IlOK6Wo8ZmuxWuLtZJ6rsPy7tYii8OCp1XGBu1dUWT2sWhzVOGp3CTxu5IITV0fliHodk=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2941.namprd11.prod.outlook.com (2603:10b6:805:dc::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 13:02:21 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%3]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 13:02:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: sst: Add support for Global Unlock on
 sst26vf
Thread-Topic: [PATCH 2/2] mtd: spi-nor: sst: Add support for Global Unlock on
 sst26vf
Thread-Index: AQHW7yx9bcFo09HT2UCZICu/WmasJQ==
Date: Wed, 20 Jan 2021 13:02:21 +0000
Message-ID: <fb42e33b-2ad2-9607-0540-138bfd70c9ba@microchip.com>
References: <20210120105411.254890-1-tudor.ambarus@microchip.com>
 <20210120105411.254890-2-tudor.ambarus@microchip.com>
 <20210120122940.2xkiwghtszzyylnm@ti.com>
In-Reply-To: <20210120122940.2xkiwghtszzyylnm@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.1.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c4fa5ed-c71d-46e6-fff6-08d8bd439fe0
x-ms-traffictypediagnostic: SN6PR11MB2941:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2941617AEC306029F6130F2CF0A20@SN6PR11MB2941.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d5uHJtgH5Nq2r9qkb8DLrmrRCp5a88Njn0YzfG2J6yRyMlfrAeT1Ib7v3MTcou1fi6ZR0V1f5Pr1h/VNau2wV1TSTv87MW+BEIgnL10CZY5hEnO00Jv4XVxtonPImJ3kOtGyG18RUyhvTBsrkZZOA1ryEUFTptrtQicSBExTgwlRs1QIeY6H6QoO27f0ucENkeSCJuzubcSzDQA8781Cpg2dolAFFZmam1gmiBkx+bssnL5SEdWe+oFEaPxns8xUbvYzdYl9x7BcTASuEooTANHjLEX2p1jQde3BpyZyDKK/YZ+tH9qNQHXPod5Y48ybTt38IIH7fM3aZQ45jUW66LbALI5YDcBJ+moEj8j0iRn+NKqcn64KsPVDv4PsAeWXVb3cKVa6hcKpwoyRBetDlB9+N1fUI8fmx6MDNQlEoE/j56K11Z3Uv3vV+hmyhvwpuk/mVkD44i09YH+I3UFVF1sUu5ebQWHwHjdNpOsmYQ44QJIpEtKilhALZvX22IKsZcgOPIOEFeEjJc2mg9JJZnjxbKeJKf1YxOaQ3u9v0msEi8FxkSJJ05tou6wmQG2z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(26005)(54906003)(8936002)(498600001)(6506007)(53546011)(31696002)(66946007)(66556008)(71200400001)(64756008)(66446008)(4326008)(66476007)(86362001)(6916009)(91956017)(6486002)(2616005)(8676002)(966005)(76116006)(83380400001)(5660300002)(36756003)(2906002)(31686004)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NW9rckM4SmNRTUFpczN0YWc5M1BmUzBDTHRmQUN3cFFOeHY3a1ZUalVJSUVR?=
 =?utf-8?B?M3V5WVNqTWJSNHZqaGZsdnZ4SjdqcXhmbkFGZ3dWQWFZOXFSNG52TjJ2STEw?=
 =?utf-8?B?M0RPaHV6dVNqelpoTzlzWllDU29WWmR3QXptU1BpNEo1ZGxUeG1HcDA2aFZ3?=
 =?utf-8?B?SXFOa0lZM0tPMy9GNkxncU44NW9welZrK1EzSjV3NUpzWDQzQ3hjT2dVU0Vp?=
 =?utf-8?B?c0hOaEtHN0FvTXFCcHAwQXdLK09IbEFKRmRDa1JoY2x2Rlc3dUpXSlo4NzFJ?=
 =?utf-8?B?a0RQUFc5QVhMVmU2RC9QQnl0N2VFUW0wOHZWRzlXL3VXZkUybTdNQSs2a05G?=
 =?utf-8?B?cE54TVNyLzV6ZjQ2ZDZSOXN2YUZZQW9pV2dSYlVjTjRuSUZKSGswSkhlUnRY?=
 =?utf-8?B?U29zZUFabGxubGFRY3orWGVRbGpyOUNIRllFc0RnM29yYkFlM1RkM0FPYWhS?=
 =?utf-8?B?NUtmc2ZSRmVKQ0dKa2N4bHkzUVJKZUFoRncvWUl5amR3b3g0Ly92Q2FDTmFu?=
 =?utf-8?B?TjNnRzQyY2FoT0E5WW1wVjIwYkJJcGwzREFnNm1nbGFUMC9DOUZoWGFIbFNx?=
 =?utf-8?B?enlBYWlUY3FjeUd6VDFIOCt3aXdGakVyRUwra3RDbklNSzIvUHN5aG1LZGMw?=
 =?utf-8?B?dHhYR050OS9PdVlzcDQ1djkrVzNmSzM3dTJjUFlNbXVJc29zTGFvY2N6WkNF?=
 =?utf-8?B?d2tzcWhndTRLQVc0TGJsakV6bkllWjlWbzR0MEpwL216YkZEQmdsYzYvWmFY?=
 =?utf-8?B?a2s2MDIyZFE5UWQyVVEyS0wrT0hyTmw5U1R5ZnJSMXlCdHJKNWpFcURFeFJr?=
 =?utf-8?B?UUNrckJaT1J3dUFqYzNjR2NKWnhvUk83Q3ZiUEgrcnNod2VRcTEwS3pzRUkz?=
 =?utf-8?B?RDlxYXgramJhS1RqZ0tWTkUrMFBQUEJiRW5iVzVvQk1PblJ6SkJhRlFnNEN4?=
 =?utf-8?B?NkE5OTNrNVpzUHpoMEp2KzFOWEFrMGdCZTVrN0ZzcHlKZ1VoZ09UTk00UDNo?=
 =?utf-8?B?R1g4SUsyOTcyelc4Q2hJYVdIM1Q1T2hNbUt2c2dqS3JQRTBKUnp4UytZckpG?=
 =?utf-8?B?TWxKbGZ6TC9uZVJVdXhoa3hBTzdIOGZHN2ZyMVJDTHZIMDJWenI3ZFZnOGVu?=
 =?utf-8?B?YUZwdFZ0ZGk2VTV6SmNDMHVIUXlpbmJnbEd6Wjk2ZEJJYmpGTjF4eFRzQ0pR?=
 =?utf-8?B?M09wNFA3QjY0djY0V2VabmFENXRtM1dRRU5IdUQzSFZVR1hxaEtnZThQNmlZ?=
 =?utf-8?B?V2tHT2RnR04xemZmc0h4Ri9qK1VpdGtCaVlFTjFkS3VLcHhqcHRidmg5RU1M?=
 =?utf-8?B?VnhpazBNYVcwTU1SNHQxTnp2N2FocmYxeW03ZzR5TzZWWEcxTExaZFNVeWYr?=
 =?utf-8?Q?t+/BvwgJBWJBEUhwLi2isHIi8btHG75c=3D?=
Content-ID: <C32A84A273DB0B4685178DC4D95992ED@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4fa5ed-c71d-46e6-fff6-08d8bd439fe0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2021 13:02:21.4302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sXuR9QFXVSMHFFQwQqRtLb9TAz63waynOwpL/4hkDD0nVTpqZYsJmyAzs/N8FTr4prI4vm7o6aAJ2ZkMe3LLPYeehX2Yg4Gof3Ja4DvYi8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2941
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_080228_846115_26540E51 
X-CRM114-Status: GOOD (  22.56  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 michael@walle.cc, linux-mtd@lists.infradead.org,
 Kavyasree.Kotagiri@microchip.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 1/20/21 2:29 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,
> 
> On 20/01/21 12:54PM, Tudor Ambarus wrote:
>> Even if sst26vf shares the SPINOR_OP_GBULK opcode with
>> Macronix (ex. MX25U12835F) and Winbound (ex. W25Q128FV),
>> it has its own Individual Block Protection scheme, which
>> is also capable to read-lock individual parameter blocks.
>> Thus the sst26vf's Individual Block Protection scheme will
>> reside in the sst.c manufacturer driver.
>>
>> Add support to unlock the entire flash memory. The device
>> is write-protected by default after a power-on reset cycle
>> (volatile software protection), in order to avoid inadvertent
>> writes during power-up. Could do an erase, write, read back,
>> and compare when MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE=y.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/sst.c | 38 ++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
>> index 00e48da0744a..1cd2a360c41e 100644
>> --- a/drivers/mtd/spi-nor/sst.c
>> +++ b/drivers/mtd/spi-nor/sst.c
>> @@ -8,6 +8,39 @@
>>
>>  #include "core.h"
>>
>> +static int sst26vf_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>> +{
>> +     return -EOPNOTSUPP;
>> +}
>> +
>> +static int sst26vf_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>> +{
>> +     if (!ofs && len == nor->params->size)
> 
> Nitpick: ofs is not a boolean value. Don't treat it as such. (ofs == 0
> && len == nor->params->size) makes the intent much clearer.

I agree, will change. Cheers,
ta

> 
>> +             return spi_nor_global_block_unlock(nor);
>> +
>> +     return -EOPNOTSUPP;
>> +}
>> +
>> +static int sst26vf_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
>> +{
>> +     return -EOPNOTSUPP;
>> +}
>> +
>> +static const struct spi_nor_locking_ops sst26vf_locking_ops = {
>> +     .lock = sst26vf_lock,
>> +     .unlock = sst26vf_unlock,
>> +     .is_locked = sst26vf_is_locked,
>> +};
>> +
>> +static void sst26vf_default_init(struct spi_nor *nor)
>> +{
>> +     nor->params->locking_ops = &sst26vf_locking_ops;
>> +}
>> +
>> +static const struct spi_nor_fixups sst26vf_fixups = {
>> +     .default_init = sst26vf_default_init,
>> +};
>> +
>>  static const struct flash_info sst_parts[] = {
>>       /* SST -- large erase sizes are "overlays", "sectors" are 4K */
>>       { "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
>> @@ -39,8 +72,9 @@ static const struct flash_info sst_parts[] = {
>>       { "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32,
>>                             SECT_4K | SPI_NOR_DUAL_READ) },
>>       { "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
>> -                           SECT_4K | SPI_NOR_DUAL_READ |
>> -                           SPI_NOR_QUAD_READ) },
>> +                           SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> +                           SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>> +             .fixups = &sst26vf_fixups },
>>  };
>>
>>  static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
>> --
>> 2.25.1
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments India
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
