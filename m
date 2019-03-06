Return-Path: <SRS0=kH4D=RJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EA7C43381
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2019 10:59:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98DA820675
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2019 10:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U20spRGj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="DWEoH44g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98DA820675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IK3Up7VGEYJmxuDdD/5CDPkUhbyay8vF3jTMHqoMexI=; b=U20spRGj6w0iMJ
	ZgRCjKXSRswZP76Ga0k4H9h/1CEjNIZE8Bn7GhcnJ9OL+TiJkZ+gxe4K0odMMkkFrosIqgpyMUBfn
	YXt5+YXnQ59c43R+UPoio1mwMy8/LDVNRrIPS7qy5zR2fh6R7NDq6flCeTCgOLF1QILG8/GKuY6tz
	GD8Ltn67kPiJP2L368Ydy3nHYfiMzdQpLFsH7YnI/zPPndlkGhjyQ3r+ojS/Wwcb2Dmxm/uME1gcz
	pekPeffkyKSep1trhikggqsKVa9BHnavxWZnqWgUZS0w+lYNlLcK2UPuUdP1iq47FZb9Y8l1FvKar
	gn4M8vfrLWvUMzeAditQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1UGr-0002Q6-73; Wed, 06 Mar 2019 10:59:33 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1UGn-0002NG-Du
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2019 10:59:31 +0000
X-IronPort-AV: E=Sophos;i="5.58,447,1544511600"; d="scan'208";a="24895338"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 06 Mar 2019 03:59:21 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.108) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Wed, 6 Mar 2019 03:59:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCZsho+w6pXs1MUIwxUqWf/tcNCObKUmDxN1r7V3K/I=;
 b=DWEoH44gSItE+OKJ6/mnFYJB/f8ptgOCEPW1hkzHYNW8QSZkgCinHW3MCUv6iKNAO2r8ss9Zve7j35OuDN+CXEaJq6S2kR7/bGGkj2J0OEIuEy4GYonrTvE4ik/12lbD+Fst10wvoxINamHFS+fgaEhW22/ErShatE2jYQEa3VM=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB4083.namprd11.prod.outlook.com (10.255.130.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.16; Wed, 6 Mar 2019 10:59:18 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1665.019; Wed, 6 Mar 2019
 10:59:18 +0000
From: <Tudor.Ambarus@microchip.com>
To: <geert@linux-m68k.org>, <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: refine Spansion S25FL512S ID
Thread-Topic: [PATCH 2/2] mtd: spi-nor: refine Spansion S25FL512S ID
Thread-Index: AQHUrcRvVk/NwsnjPU6u4yY8M2eQPqX9XVmAgAFeX4A=
Date: Wed, 6 Mar 2019 10:59:17 +0000
Message-ID: <0e132c00-fb0c-c535-0f23-0cfa19a9a99e@microchip.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <09a2508e-f63e-4804-bf11-76832faae1f5@cogentembedded.com>
 <CAMuHMdVjvbcK21r9ajp9xKEGx=VHbXkrSB0ob2EjR8+dmNVdPw@mail.gmail.com>
In-Reply-To: <CAMuHMdVjvbcK21r9ajp9xKEGx=VHbXkrSB0ob2EjR8+dmNVdPw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0147.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::25) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 893ef816-3dc9-4c01-786a-08d6a222c744
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB4083; 
x-ms-traffictypediagnostic: BN6PR11MB4083:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCTjZQUjExTUI0MDgzOzIzOmFJZW1yRGlXZWJiM3ZXeXdxVkJCR3VYVzlI?=
 =?utf-8?B?R0wrSWlialgzampIcWJjeTEySmtab0FySUF1VEVoUkNLMjliclNSZXVHOEUx?=
 =?utf-8?B?NDV2eW1WaDg0eGFQYWJ0bzZwQk9QWC92S2xLL1hrMzQ5bTNTL1A5UlRGUFZj?=
 =?utf-8?B?K0VTaDA4aWxYQytYcENRM0EzUGNTV3k2cWc3TUJ0b2hodW1JVkpCYTFnZ3Fz?=
 =?utf-8?B?cUNZa1o0Tjl6VDBRL2JpZXlKQzljN0JVTkt2VUtWZnlTN0QyZjlPZXl5WHBM?=
 =?utf-8?B?dUVFTlk0V0ZmVVprbmdVUGhKcm5YN3IvVFFxOGxHSzZpdmlURnBRVkowTUlJ?=
 =?utf-8?B?MjZzZkI0QnBGOCthRzhQSkh3MEllNXpzd1N3Q2JpMGs2Vlc1N1FXc0JzTkg4?=
 =?utf-8?B?ZHhpU2d2cGYyOW41cm5zQmFKbzNJZ3VsbWJ6VXNIOXY5TFN1UU5FR1UwTWlh?=
 =?utf-8?B?WGhOdnN4NDBHZVY4aERJczdOS291bEVVeDR1V3k1SCt2V05kTzIzTGhZc3kx?=
 =?utf-8?B?Q29zbnJkMDZEOGhBMFdkOGdmeCtJZ1NnMkZZTi9BUk5XUHdVZXJhQVM2UGFz?=
 =?utf-8?B?ZnhaeU13OXZYSm9RTXJDOTMvajV3eHYycmRvVHQ1bkt1VHBlZlpVRFluZkNm?=
 =?utf-8?B?aTg4eTVDRWZNS2k3ZWlqdHBZVnR2TDB4TW42czlSUkpVc1paaC80UzRVd09H?=
 =?utf-8?B?dVNJdGNTNlRVOHpoWTVHU0VBMEdiVmx6TkVqMmRYajNEMkFYbks4RDFvdWpH?=
 =?utf-8?B?SGFDeld3NEVsVjUzSmJPcVQ2ZVlsenpxaUp4TzJ6Qml4SDBjMDVYTVB1elBk?=
 =?utf-8?B?WDN5czJHb3BpMmQyNzlERmpPL0d3bDdzdklvamM3RlZYSktaRGpWQ0lLcEUr?=
 =?utf-8?B?WW1MbFFpaUQrbktTdDQzV2JHL2YrU0FvWUFFYU83WGl2MkFtS2svb1N1R1Ev?=
 =?utf-8?B?c0ZEbVlNNitOb1pCMmprdGFQamlOVk1VZXhUR0w4ZFBsUVJMNDBwUklrd0Rn?=
 =?utf-8?B?T0ZOdmFCa2pnSHcwd0lLSHFvK1JJU0hCYjVCOWs1dzZabmI2Mzg3WFNHN1NH?=
 =?utf-8?B?ODZ1YzRaeVNJMEExTWl3TjZlMk5KNjVpNm5keTRWZVR2a3FaalFwWHhJK1JD?=
 =?utf-8?B?LzkzUy9rZmNraTRaK0lqcFZlU1h0T3V4d3pYalE2bEl4djZoekNkNXVocmpz?=
 =?utf-8?B?QWhKMGIzUHdsNFE1UUlhWEdZOThFM0E3M1gzTTFuTkFFTXVpZXFObmdRalNU?=
 =?utf-8?B?TjExWmtJMUVKcjdvdVhhQjlJVWRTMHRNcHRzR3NjNVhUMXdLYmw4a0k0UE5Z?=
 =?utf-8?B?Uzlhc0tubGUyWlBmSlNjeExLdHhuenVIMlhGbGhwRDVUNXRUMlgveG9qeXdO?=
 =?utf-8?B?MzhucVhZVTZXUXR2RTQ2YXdtK2pkSGhRdGp2RGVxRmZ0U1JoNmw3bzdiUEJs?=
 =?utf-8?B?N2REd3duRVJKSXp2RnVFR2VBSG11R05GMGhiS2dqdXFNR2N3b2FPajRjQ3k4?=
 =?utf-8?B?TFdFekpQbnU5a28vdDFqSkRuN0duOVhMT0NOVzlIZHo5UnBGYjFJYWZFaHoz?=
 =?utf-8?B?RjB0T2RVeWFzYU1VRGthTkJ0NWVYdDE0cU9WL0tkWTNYTHFkbHRhc3ZJQ1pM?=
 =?utf-8?B?eW4wa2JXSEF3L3VzLys4QkJpL1FNK1JmQkgxeThsa1ppVGJ2Um1CVjNtdHFp?=
 =?utf-8?B?enpCNGY4R2RZOTRSVG9YNlN0UmxhWXc0Q3JhbUpzemhFVlI2MFRlcVZRdlpC?=
 =?utf-8?Q?U7zU2omOzKNfezjExqZD62qYutFDpg3zjAOtU=3D?=
x-microsoft-antispam-prvs: <BN6PR11MB4083B4B37404EB8084977FA0F0730@BN6PR11MB4083.namprd11.prod.outlook.com>
x-forefront-prvs: 0968D37274
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(396003)(346002)(39850400004)(376002)(199004)(189003)(81156014)(6246003)(14454004)(476003)(110136005)(31696002)(316002)(486006)(446003)(81166006)(11346002)(2616005)(14444005)(186003)(478600001)(8936002)(54906003)(72206003)(26005)(256004)(8676002)(305945005)(66066001)(386003)(53546011)(5660300002)(52116002)(6506007)(76176011)(99286004)(86362001)(71200400001)(102836004)(71190400001)(97736004)(105586002)(4326008)(25786009)(7736002)(53936002)(31686004)(6436002)(229853002)(6512007)(36756003)(2906002)(6116002)(68736007)(3846002)(106356001)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB4083;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Tp+jFu91IyuwFwK7lLCfDrGkj+zZQavMB8qa4xUtoePV44g/eA5rS2v2UP10WCqxxh8cEwXGZI7BBfOOWVY5/ebwqjnPDbuadq+zQe4NlDVwMp2rsYNWuWfwMBX4LnlLnHbcs4F8d/cG2w97Ub0OgtEDScdiO5kGg8AqGH0FoMQVYIT63hoz/A0O2ILxhHYAJuknkNX6jcH9EKY4J4sm0iSgXgUOZU+0/BBrn4pZutu6bTK8eiK35BYYQM2xig3RBgf8Pj65lGNgduymG4Gh9xB1aw0nGPNZGbjKA8qqsg50KljdOm+vHJJngwkR9/sJNvS3PB4FmD0i6B0t/vcDGiB29rW3fRUZRqAZxbVPGPZ5oVZdPl1R3eveThBUDsftT8KAXsWhnQVQ8mQ8VixUSO3k0WM+q2ZZTuWa7FkvWOc=
Content-ID: <91D953FD3183164FB35E808D5EAA2858@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 893ef816-3dc9-4c01-786a-08d6a222c744
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2019 10:59:18.1009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4083
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_025929_570602_BDC720D7 
X-CRM114-Status: GOOD (  18.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, richard@nod.at, linux-renesas-soc@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Geert,

On 03/05/2019 04:05 PM, Geert Uytterhoeven wrote:
> Hi Sergei,
> 
> On Wed, Jan 16, 2019 at 6:53 PM Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
>> Spansion S25FL512S ID is erroneously using 5-byte JEDEC ID, while the chip
>> family ID is stored in the 6th byte. Due to using only 5-byte ID, it's also
>> covering S25FS512S and now that we have added 6-byte ID for that chip, we
>> can convert S25FL512S to using a proper 6-byte ID as well...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> This is now commit a2126b0a010905e5 ("mtd: spi-nor: refine Spansion
> S25FL512S ID"), and turns out to cause a regression on r8a7791/koelsch.
> Dmesg diff before/after:
> 
>     -m25p80 spi0.0: s25fl512s (65536 Kbytes)
>     -3 fixed-partitions partitions found on MTD device spi0.0
>     -Creating 3 MTD partitions on "spi0.0":
>     -0x000000000000-0x000000080000 : "loader"
>     -0x000000080000-0x000000600000 : "user"
>     -0x000000600000-0x000004000000 : "flash"
>     +m25p80 spi0.0: unrecognized JEDEC id bytes: 01, 02, 20
> 
> As the (old) U-Boot on my Koelsch keeps many module clocks enabled, I
> typically merge in my topic/renesas-debug branch, which makes sure all
> non-critical module clocks are disabled early during boot, to catch
> drivers not properly implementing Runtime PM.
> 
> However, it turns out this has some impact on JEDEC ID detection:
>   - When module clocks are left untouched, spi_nor_read_id() reads
>     0x01:0x02:0x20:0x4d:0x00:0x80.
>   - When my debug code has disabled module clocks during early boot,
>     The last byte is 0x00.
> 
> Before the above commit, only the first 5 bytes were compared, and the
> last byte was ignored, thus not causing problems.
> When comparing all 6 bytes, detection fails if the last byte is 0x00.
> 

We'll have to understand why just the 6th byte is different.

> I believe mainline U-Boot for R-Car Gen2 boards doesn't keep the QSPI
> module clock enabled, so this commit may breaks those boards.

Who provides the flash's input clock and at what frequency?

Cheers,
ta

> 
> To be investigated more (e.g. with a logic analyzer)...
> 
>> --- linux-mtd.orig/drivers/mtd/spi-nor/spi-nor.c
>> +++ linux-mtd/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1887,8 +1887,8 @@ static const struct flash_info spi_nor_i
>>         { "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>         { "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
>>         { "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>> +       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>>         { "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>> -       { "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>>         { "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>>         { "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>>         { "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
