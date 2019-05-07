Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8848AC004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 13:18:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54C19205C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 13:18:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u/XTrbx1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="bs7r0vUH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54C19205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKJKJcXNfmf3oYie3qrGO9iwUuIijnre08lGyVo3DNE=; b=u/XTrbx1b3zyEA
	4BasFsI94UjNCP1l1jpQ37VkBVnJw8zeoF6uL+DzfQfgYSeb5zsIJ+y+KbBx64JB2vSJnKHp1aKFe
	1d0Ipo1mgoKVLYTJXJ86OywS89iM6TXWSP3zITYQ1aunpWsaO4qQ+QCBmzf5YgskTQSqQOBEh1lhY
	JedIuxkbB9PfFAV36Dq4D0JR5XmUMd38sXVanxOTSAMiTstLEqE8Eypldk91JIktSEdxXi4tpfAWl
	MahvxrYvo5H2r0uBHEmC7d0BdikNGsP+CP5XiccBjI0zHb4J5nV70v564eQ6hj8E5kyhkQJ/i7fby
	/hrRa8F61jLl2kraUIlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNzzE-0005p7-4e; Tue, 07 May 2019 13:18:24 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNzzA-0005oZ-8S
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 13:18:21 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.60,441,1549954800"; d="scan'208";a="33583058"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES128-SHA;
 07 May 2019 06:18:19 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.37) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Tue, 7 May 2019 06:18:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAG/p4ma7OSJVqVpDcW7Xm3FcQn6WgUzNpfhDr2bKXw=;
 b=bs7r0vUHMEZlitSmaTM/mgdlYig9lck/g16rBdzZGauWqBZk2Wzq6wS4v5Mqg4W74k+4axeAjRkVOmjYpGaaIt5kAhQfFhmD9rc8kSWDCwoFSggzzheSGLCuoAVC0hVgWJdggB5kMsIlVxzIsNVwMQAXPPSyzk6p8Le30xg6uIA=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB3873.namprd11.prod.outlook.com (10.255.128.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 13:18:08 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808%10]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 13:18:08 +0000
From: <Tudor.Ambarus@microchip.com>
To: <geert@linux-m68k.org>, <jonas@norrbonn.se>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Index: AQHU3uz1n9sAm8MvGUei5wsE+JArGKZft50AgAANmoCAAAIxgIAABqiAgAAbqwCAAAZdgIAAAKYA
Date: Tue, 7 May 2019 13:18:08 +0000
Message-ID: <eda4c8b2-2e10-6651-6c8e-e481c90fd1af@microchip.com>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
 <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
In-Reply-To: <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0801CA0076.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::20) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c51d425f-877b-4cb9-c81d-08d6d2ee7213
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BN6PR11MB3873; 
x-ms-traffictypediagnostic: BN6PR11MB3873:
x-microsoft-antispam-prvs: <BN6PR11MB3873E0A009289159A1D6664BF0310@BN6PR11MB3873.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:117;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39860400002)(366004)(396003)(136003)(189003)(199004)(8676002)(52116002)(6246003)(305945005)(7736002)(86362001)(99286004)(316002)(31696002)(71200400001)(71190400001)(6486002)(6436002)(81166006)(81156014)(229853002)(110136005)(6116002)(31686004)(3846002)(54906003)(8936002)(66476007)(68736007)(66446008)(14454004)(64756008)(73956011)(66556008)(66946007)(53546011)(6512007)(446003)(26005)(11346002)(4326008)(25786009)(5660300002)(186003)(36756003)(386003)(53936002)(6506007)(486006)(478600001)(2906002)(476003)(72206003)(14444005)(66066001)(76176011)(2616005)(102836004)(256004)(505234006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB3873;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6cyMjVkDgKkBx2pvIYklc1KWO4ayQkEk2thyQnJnAfUzOcZ8M/w9uNgjhAlBumSFUHEmSUpvRh6rXyp8fUkEtgFhVTvucxkcUq8MUdCY0mr6xYhs5PZpyyVREL4JMnum038XBJ8Hg11/1OedWwrdeGqrLC4moR/HCM6SZ+br9S2xFuJ/fLyL4VHDa3egdKXEO0WR0UdYRaILLZqRNvRIXJ5IBajzCK9U9P/AEgP+wokX4PLKzHMxof0zEXX9WjgmkEmsOgMxDKHTT5TDq9O+pAFP2MiS1DcUiy/JcqfueR/0U/WG+bPv1xyGhqkTV5A2qEULwRM0aK50duAkn70pBiLOhIAGXO7/TSDQifkgPWcD1mpkIQJEqLY9KEzCsgnHBfHBlhNsVIU4wW7NK+z+bdpwI9ui2T6wKmv95K6p3Ig=
Content-ID: <363764A45E4FFD45AB7AE65B490F8F81@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c51d425f-877b-4cb9-c81d-08d6d2ee7213
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 13:18:08.2016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3873
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_061820_306136_A39289E1 
X-CRM114-Status: GOOD (  17.06  )
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
Cc: linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 05/07/2019 04:15 PM, Tudor Ambarus wrote:
> Geert,
> 
> On 05/07/2019 03:52 PM, Geert Uytterhoeven wrote:
>> External E-Mail
>>
>>
>> Hi Jonas,
>>
>> On Tue, May 7, 2019 at 1:14 PM Jonas Bonn <jonas@norrbonn.se> wrote:
>>> On 07/05/2019 12:50, Geert Uytterhoeven wrote:
>>>> On Tue, May 7, 2019 at 12:42 PM <Tudor.Ambarus@microchip.com> wrote:
>>>>> On 05/07/2019 12:53 PM, Geert Uytterhoeven wrote:
>>>>>> On Wed, Mar 20, 2019 at 8:16 AM Jonas Bonn <jonas@norrbonn.se> wrote:
>>>>>>> Both the BP[0-2] bits and the TBPROT bit are supported on this chip.
>>>>>>> Tested and verified on a Cypress s25fl512s.
>>>>>>>
>>>>>>> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
>>>>>>
>>>>>> This is now commit dcb4b22eeaf44f91 ("spi-nor: s25fl512s supports region
>>>>>> locking") in mtd/next.
>>>>>>
>>>>>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>>>>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>>>>>> @@ -1898,7 +1898,9 @@ static const struct flash_info spi_nor_ids[] = {
>>>>>>>                          SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>>>>>>>          { "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
>>>>>>>          { "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>>>>>>> -       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>>>>>>> +       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
>>>>>>> +                       SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>>>>>> +                       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
>>>>>>
>>>>>> Setting SPI_NOR_HAS_LOCK causes the QSPI FLASH on r8a7791/koelsch to fail
>>>>>> probing.
>>>>>>
>>>>>> Before/after:
>>>>>>
>>>>>>      -m25p80 spi0.0: s25fl512s (65536 Kbytes)
>>>>>>      -3 fixed-partitions partitions found on MTD device spi0.0
>>>>>>      -Creating 3 MTD partitions on "spi0.0":
>>>>>>      -0x000000000000-0x000000080000 : "loader"
>>>>>>      -0x000000080000-0x000000600000 : "user"
>>>>>>      -0x000000600000-0x000004000000 : "flash"
>>>>>>      +m25p80 spi0.0: Erase Error occurred
>>>>>>      +m25p80 spi0.0: Erase Error occurred
>>>>>>      +m25p80 spi0.0: timeout while writing configuration register
>>>>>>      +m25p80 spi0.0: quad mode not supported
>>>>>>      +m25p80: probe of spi0.0 failed with error -5
>>>>>>
>>>
>>> In drivers/mtd/spi-nor/spi-nor.c you have:
>>>
>>> static int spi_nor_init(struct spi_nor *nor)
>>> {
>>>          int err;
>>>
>>>          /*
>>>           * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
>>>           * with the software protection bits set
>>>           */
>>>          if (JEDEC_MFR(nor->info) == SNOR_MFR_ATMEL ||
>>>              JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
>>>              JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
>>>              nor->info->flags & SPI_NOR_HAS_LOCK) {
>>>                  write_enable(nor);
>>
>> With more debug prints:
>>
>>     m25p80 spi0.0: spi_nor_init:3925: write_enable() returned 0
>>
>>>                  write_sr(nor, 0);
>>
>>     m25p80 spi0.0: spi_nor_init:3927: write_sr() returned 0
>>
>>>                  spi_nor_wait_till_ready(nor);
>>
>>     m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
>>     m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
>>     m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
>>                                      ...
>>     m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0xff
>>     m25p80 spi0.0: Erase Error occurred
>>     m25p80 spi0.0: spi_nor_init:3929: spi_nor_wait_till_ready() returned -5
>>
>>>          }
>>>
>>>          if (nor->quad_enable) {
>>>                  err = nor->quad_enable(nor);
>>
>>     m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0xff
>>     m25p80 spi0.0: Erase Error occurred
>>     m25p80 spi0.0: timeout while writing configuration register
>>     m25p80 spi0.0: spi_nor_init:3937: spansion_quad_enable() returned -5
>>
>>>                  if (err) {
>>>                          dev_err(nor->dev, "quad mode not supported\n");
>>>                          return err;
>>>                  }
>>>          }
>>>
>>> This is the only meaningful thing that I can see may have changed with
>>> this flag.  We now have an additional write_enable before quad_enable.
>>> What happens if you swap those two blocks above so that quad_enable is
>>> called first?
>>
>> With the two blocks swapped:
>>
>>     m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x0
>>     m25p80 spi0.0: spi_nor_init:3919: spansion_quad_enable() returned 0
>>     m25p80 spi0.0: spi_nor_init:3937: write_enable() returned 0
>>     m25p80 spi0.0: spi_nor_init:3939: write_sr() returned 0
>>     m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
>>     m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
>>     m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0x3
>>                                                                   ...
>>     m25p80 spi0.0: spi_nor_sr_ready:533: sr = 0xff
>>     m25p80 spi0.0: Erase Error occurred
>>     m25p80 spi0.0: spi_nor_init:3941: spi_nor_wait_till_ready() returned -5
>>     m25p80 spi0.0: s25fl512s (65536 Kbytes)
>>     3 fixed-partitions partitions found on MTD device spi0.0
>>     Creating 3 MTD partitions on "spi0.0":
>>     0x000000000000-0x000000080000 : "loader"
>>     0x000000080000-0x000000600000 : "user"
>>     0x000000600000-0x000004000000 : "flash"
>>
>> Note that spi_nor_wait_till_ready() still fails.
>>
>> While the device (which contains the boot loader) now appears to be
>> detected fine, reading returns bogus repetitive data, for all partitions:
>>
>>     # hd /dev/mtd0 | head
>>     00000000  33 33 33 33 33 33 33 33  33 33 3b bb ff ff ff ff
>> |3333333333;.....|
>>     00000010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
>> |................|
>>     *
>>     00001000  33 33 33 33 33 33 33 33  33 33 3b bb ff ff ff ff
>> |3333333333;.....|
>>     00001010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
>> |................|
>>     *
>>
>> If I remove the call to "write_sr(nor, 0)", everything works as
>> before, regardless
>> of swapping the blocks.
>>
> 
> Can you try this one?
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 73172d7f512b..b94a6eaaaca5 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1551,6 +1551,7 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
>         u8 sr_cr[2];
>         int ret;
>  
> +       dev_err(dev, "%s\n", __FUNCTION__);
>         /* Check current Quad Enable bit value. */
>         ret = read_cr(nor);
>         if (ret < 0) {
> @@ -3911,6 +3912,12 @@ static int spi_nor_setup(struct spi_nor *nor,
>  static int spi_nor_init(struct spi_nor *nor)
>  {
>         int err;
> +       u8 val;
> +       u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> +
> +       /* Check current Quad Enable bit value. */
> +       val = read_cr(nor);
> +       dev_err(nor->dev, "%s val = %02x\n", val);

        dev_err(nor->dev, "%s val = %02x\n", __FUNCTION__, val);

>  
>         /*
>          * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
> @@ -3921,7 +3928,7 @@ static int spi_nor_init(struct spi_nor *nor)
>             JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
>             nor->info->flags & SPI_NOR_HAS_LOCK) {
>                 write_enable(nor);
> -               write_sr(nor, 0);
> +               write_sr(nor, val & ~mask);
>                 spi_nor_wait_till_ready(nor);
>         }
>  
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
