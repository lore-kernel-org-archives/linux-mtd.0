Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D38BC3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 12:57:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC242082F
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 12:57:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nNRmR4o3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="cmxtziTw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC242082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lO7mWO1orAvWi70zP5g2IqZ7WMGAPrhU6rZn/4VWaT4=; b=nNRmR4o3SXIBUd
	rsj0thXLdHDAxu+R71DuMz4rQcAZPH1P91f5EzgDmGKjeZBAsDBtEGI/KJ/ek8q4jEVxciTWdf4pm
	bjCE8J9l4mpuZhEddxkdyiEUjmDZ589ZgCf1225G/zmvN9WF+nwpqbxWRbZBLARgTbfBpbdACTl62
	mNYDc/a7haFpkOxUrsPKNPx6sI+Gio82kXdPC9eWGFZpKFcLzKKiIAIfQmU7sCkM2U/KXwTLEHLG9
	HRiYuQZGfJWAXbBdw0EPHbhhYgMQyxqym6G6/1KLoWqi09PAL7omH8Q/m+cDKxcwHagoVwcvoSXUz
	QiY906yF0vTb1RClvqUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1s5Y-0001Pq-3B; Sun, 25 Aug 2019 12:57:44 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1s5U-0001PO-W8
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 12:57:42 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: BqTBbhOz71ulhhwt8Fc8CR2dTLjZfjiP8ouMRaOAbbdOvdTcgiSLSxsK1jf6PDXhK2koRnDErW
 L7cG3ZmnxSHXG0fb9+NbgVKMEiAVEzoa/Avqdw2p/fRH1JUHNBmBlaWviBg4YHgEs5YD8CHd4r
 tg3tMZUXAOJ+u5Q32wjPa4yrCtVi+HRm7wgl2CWs1GMBz0ha5lknjh8moTL2nWxxdDXiqSgMCz
 b9HGjbPHCR2rX9kU2CFkx+xFo+DXqB67FpWKJlBaqz+tmI/YO3MM/7TKKvxpLvnYeiBokh7Uab
 RPo=
X-IronPort-AV: E=Sophos;i="5.64,429,1559545200"; d="scan'208";a="43600850"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Aug 2019 05:57:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 25 Aug 2019 05:57:39 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 25 Aug 2019 05:57:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b93LrDpr9ivTM+0cECfsbAiDpQAbzbQYw1Co0IWGud7YxBrDbCXmBO84eRhfMIo5aaGcPNcdFTiO7Ml7ut9xtBHc2Ymg9YFNhAirPAHnI9Iz3IovdiAZWq6BcCXzLJHBjNVUWSkg+P/P1U5TylWbQJ8oF2fs5KCkZU00P0VBjr4lI5omMCC7nEkxpjlNi7t0dol9aJOFk10Cz/B27AgXQ4jRfLJCsMr+t2rNWUizuOLkiuLwJTqpg4BayYN5bCDAZwWl5xJ9HpMvDvU4Y7RLwOL/fV77LxhFF/k4Wifz0kufqNgeiAqhMtV3SYhO1N5G/5+2/h9ddODiFjP7nb32Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLHoupxZLKIpkyZtzfi4g7eSWxnCmK9ZCMrju3uJz/g=;
 b=B8A4HzbAk6pCRtuOARQd7w5tS/q1Q0Ospvopzv6lAW+5ItLfGhd0V/cjv2vS96UQfnQmxdNZ8gJ5rC+TB0PhK+/8Vzx38J4vjCziVsoehrZHZzKahDQVDgOdsIYy+gmcWixxUu9adp39sQ9m8hJRcfdoo4urKe73HF77QEYD7e41mpweuI02sphmfA9yyOQjVEA5UL2slB8xRl1+UinZuxfNyJsIzqVUxNg7G++cjpakUxhC5V+CYypmwMzKRuQOX9CxSsVxPNzuQyDcsUqVsUXCatvpfM4m2sxLs51rZMsC6QgdGc229A1XmdoCfnQ6SVKSVAR8R6iXpFjzLMH11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLHoupxZLKIpkyZtzfi4g7eSWxnCmK9ZCMrju3uJz/g=;
 b=cmxtziTwIYmZmrtCgx1NoAclqZpfrkUqHyT2vbmiHPz3t7DqEYeTHCkRKRUob8eonMelFlOd2jC9gVuZGMFU9l4z984/u0HkboIJQSPN+NhAfZ7ldZ6HfZfazx1p1CadjYFToChPVtEZlNv/FqD7FMtOdEDldQQWlmnBhvOumw4=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3549.namprd11.prod.outlook.com (20.178.250.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.19; Sun, 25 Aug 2019 12:57:35 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Sun, 25 Aug 2019
 12:57:35 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 7/7] mtd: spi-nor: Rework the disabling of block write
 protection
Thread-Topic: [PATCH v2 7/7] mtd: spi-nor: Rework the disabling of block write
 protection
Thread-Index: AQHVWnORmecMuD4IS0mom6s4UeawIacLyySAgAAJPgA=
Date: Sun, 25 Aug 2019 12:57:35 +0000
Message-ID: <836fcecd-766c-c7e3-74aa-06a148b146f8@microchip.com>
References: <20190824120027.14452-1-tudor.ambarus@microchip.com>
 <20190824120027.14452-8-tudor.ambarus@microchip.com>
 <20190825142421.35d31a9b@collabora.com>
In-Reply-To: <20190825142421.35d31a9b@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR06CA0085.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::14) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.53.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f83e9fdc-78ce-48be-e880-08d7295bccbf
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3549; 
x-ms-traffictypediagnostic: MN2PR11MB3549:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MN2PR11MB3549D93A79ED500996F8165FF0A60@MN2PR11MB3549.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01401330D1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(199004)(189003)(66946007)(6916009)(6116002)(3846002)(14454004)(305945005)(966005)(66066001)(66446008)(64756008)(66556008)(66476007)(14444005)(256004)(498600001)(7736002)(5660300002)(8936002)(26005)(102836004)(386003)(6506007)(53546011)(186003)(81156014)(81166006)(8676002)(36756003)(2616005)(476003)(25786009)(486006)(11346002)(53936002)(31686004)(54906003)(6246003)(446003)(6512007)(6306002)(31696002)(52116002)(86362001)(76176011)(2906002)(4326008)(6486002)(6436002)(229853002)(71190400001)(71200400001)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3549;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: M6T/7tJQExDC9RGVL0Phjqekt31JNXoIKkSreNaDsMJW9iFd51IKmYwCKfxocq50Z8TmgDprAiHPxxnwOXaq7UoKui2RWnFEda0vvkV4u1Lrc9dCLFFRBdKBGliNNYEo6aSM9hRyc2RGhlGIRZXZlEupxAK6yH6IqlrGNNzqRs7HgreU17wb9d2oh3t+F4Ib/YzOSceyljYrI3fa8OirudyEFvn9nT7wVRlymaWHyP2Odcu1AI4IMZ5bd4Jtg5tN9qUfATBkgNyDo7U+Ju6MCZu7ptI1rUKj83ST5xci+F10Epqsf2hzn/Dw7T4svQqaMpV98w6T9c44YIK4nveY7OD01D/Cx2JburO54FjY5FTZq9E4eh/JQYrNQWEkRiv9lXeH5SU2au2wiO5qcDHw3bK4g/sVACo8sg2rpJuNXDo=
x-ms-exchange-transport-forked: True
Content-ID: <B499477680E2A5449D8FE9048514BDA4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f83e9fdc-78ce-48be-e880-08d7295bccbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2019 12:57:35.1635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mr2PV9mNgjwvDga1KKW3k5Z1ywQbEXQU/B/ZeT97FTiE+mxj9ovTikdgPPIng2G97nbBoVujI+7AwKAHgScXUjjQjy82kWseffF87pOw0OU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_055741_070050_7127FA17 
X-CRM114-Status: GOOD (  17.40  )
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
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/25/2019 03:24 PM, Boris Brezillon wrote:
> On Sat, 24 Aug 2019 12:00:48 +0000
> <Tudor.Ambarus@microchip.com> wrote:
> 
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> Get rid of MFR handling and implement specific manufacturer
>> default_init() fixup hooks.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 30 ++++++++++++++++++++----------
>>  1 file changed, 20 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index fc9e14777212..f4e9fcca619f 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -4146,6 +4146,16 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>>  	return err;
>>  }
>>  
>> +static void atmel_set_default_init(struct spi_nor *nor)
>> +{
>> +	nor->params.disable_block_protection = spi_nor_clear_sr_bp;
>> +}
>> +
>> +static void intel_set_default_init(struct spi_nor *nor)
>> +{
>> +	nor->params.disable_block_protection = spi_nor_clear_sr_bp;
> 
> That's weird: you can unlock blocks but locking is not
> explicitly flagged as supported (SNOR_F_HAS_LOCK is not set). Is that
> expected?

Yes. Manufacturers have different methods for locking/unlocking blocks of
memory. Right now we support just the stm/sr locking operations. sst26vf064b for
example, uses dedicated registers for reading/writing which blocks are
protected, and not the Status Register.

The reason for having disable_block_protection(), is that some spi-nor flashes
are write protected by default after a power-on reset cycle, in order to avoid
inadvertent writes during power-up. Backward compatibility imposes to disable
the write block protection at power-up by default, so that you can erase/write
the memory without having to send an unlock-all command. Which is bad in my
opinion and that's why I proposed https://patchwork.ozlabs.org/patch/1133278/.

Even if sst26vf064b does not yet have the lock ops implemented (SNOR_F_HAS_LOCK
is not set), I would like to be able to interact with it, so to disable the
block protection at power-up. This flash, and others, support a Global Unlock
Command which unlocks the entire memory array in a single cycle. We can't
determine who supports this command purely by manufacturer type, and it's not
discoverable through SFDP, so we'll have to add a nor->info flag for it:
UNLOCK_GLOBAL_BLOCK (see https://patchwork.ozlabs.org/patch/1152606/).

In conclusion, even if SNOR_F_HAS_LOCK is not set (the locking ops are not
implemented), we can still have disable_block_protection() mechanisms to unlock
the entire flash at power-up.

> 
>> +}
>> +
>>  static void macronix_set_default_init(struct spi_nor *nor)
>>  {
>>  	nor->params.quad_enable = macronix_quad_enable;
>> @@ -4173,6 +4183,14 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
>>  {
>>  	/* Init flash parameters based on MFR */
>>  	switch (JEDEC_MFR(nor->info)) {
>> +	case SNOR_MFR_ATMEL:
>> +		atmel_set_default_init(nor);
>> +		break;
>> +
>> +	case SNOR_MFR_INTEL:
>> +		intel_set_default_init(nor);
>> +		break;
>> +
>>  	case SNOR_MFR_MACRONIX:
>>  		macronix_set_default_init(nor);
>>  		break;
>> @@ -4760,18 +4778,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>  	if (info->flags & SPI_S3AN)
>>  		nor->flags |=  SNOR_F_READY_XSR_RDY;
>>  
>> -	if (info->flags & SPI_NOR_HAS_LOCK)
>> +	if (info->flags & SPI_NOR_HAS_LOCK) {
> 
> If this flag implies SR_BP-based locking we should really rename it into
> SPI_NOR_HAS_SR_BP_LOCK to avoid any confusion.

Not only SR-based locking, should be a general flag that indicates that locking
ops are supported whichever they are. I would keep the SPI_NOR_HAS_LOCK and let
the manufacturer set its locking ops using the ->default_init() hook.

> 
>>  		nor->flags |= SNOR_F_HAS_LOCK;
>> -
>> -	/*
>> -	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
>> -	 * with the software protection bits set.
>> -	 */
>> -	if (JEDEC_MFR(nor->info) == SNOR_MFR_ATMEL ||
>> -	    JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
>> -	    JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
>> -	    nor->info->flags & SPI_NOR_HAS_LOCK)
>>  		nor->params.disable_block_protection = spi_nor_clear_sr_bp;
>> +	}
>>  
>>  	/* Init flash parameters based on flash_info struct and SFDP */
>>  	spi_nor_init_params(nor);
> 
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
