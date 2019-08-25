Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABDAC3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 12:24:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 481452070B
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 12:24:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AIwkQDL8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="TyFCh/Cs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 481452070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sfOwXdeh7uVDBC05zrKyogSq/hRVJk9SoTRyxWmmChQ=; b=AIwkQDL8qpX0O1
	iJ+/lCHnA5vtHZ85JgfYMY0C40V0mCesFl2XVZx3uY01R/aDTvoQ2aW+/710/WbvZEqcI8HEY46ru
	tMX0vb6Ka/PUK6orhgViQJKD8D++UC7w27h678NOHHQzX7FHlMZTdivuzjWmQSNLvCxvQS+jwuDOX
	KHmUyCFNWnD/Oh+74bEXRrc7bhX9+O4ytqXgSZKVDEf5HlQ7yBbAZ1l5HiKGMcvf1Weu60U3KmGOA
	Wbp92NawWlrqHgebblq2DW2STUsZnJvhLSrRegxAYgAdnP9JhammWbzvaVxJCUzgPrAyNl1VA1qPU
	eGSrIpxVoG6sv8Y45WEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1rYw-0006cX-6v; Sun, 25 Aug 2019 12:24:02 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1rYq-0006c4-NR
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 12:24:01 +0000
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
IronPort-SDR: VWc84WJLbaUQa2Fuy04wdpDLc/bOQDrQqYlKixvrpW65VcV9/8q/FqYStNO5U2u9BYVNDhU0mx
 Auw2+++uBWftN/7jvGuKgkyhud21skFiUK6ZBR/HyY2+GJddPSXWmTF7P6JlTmhx3iBgne8wGq
 9c6cQ3n9yYdKXfz5xCi257TDHLB6bOOcRCSMZzEWZjsy8Uox8W8P9IJrR1JB8caD83j0zkAv7g
 gRZmsrCkfTNQeRwZ6Cu4X7JJcP9mwTPsBSIJOHhl/UCowZ7KF7a53aLXMaEm6SSyKMmUpmyjG9
 tN0=
X-IronPort-AV: E=Sophos;i="5.64,429,1559545200"; d="scan'208";a="43599433"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Aug 2019 05:23:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 25 Aug 2019 05:23:51 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sun, 25 Aug 2019 05:23:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQ5xIIKxSnnVCdxzB0JI+IKFt510k6NPxkHa/m8aIOAkmBe4b0zxJmjtwQWpBz9g72w4zAW+d8o4HpPV5VIpMVsuhNVEjavn1J3FqPxEgx4JfIodnPZXt/2uUODem7gUAadbFY8jaS7HWsOrI/VqV+Xi7WeR3S8ud6ffk5OszGVejznxJ+DGmqvk0gQmB9QUqWoWw3FXMOg4pYCwb+H4aCxKpOJavILCkdS8n4c6NurhBhxT4e2oLJ1f4vs2CHcULiUG8mk5xkZ1u0us3EMdGeT5lCrIx2TLULjtnaoA6rYpZ+9h+wEE3yAzxjZkV1LE66iZf9+j/NvgLU1fLoFijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWyxkvUJqilrNZ5RkcmVRYby34W4BlqmD4jNUBOAgOk=;
 b=IRVvH5QuBDGZtfr9JHSmxwkw2/X8kC33gjlvGpJi90UTtLRRSTTbwIxv3Jn89OOZuSD/JQ+RMksoSRg7kEK8DEKhlOOazJlmOeMzQhPdHSbI/dzrea6OD1wS9VZl66iAIBDnwqgyMmra88cFIPtu5rLb/ahyNkz9vBfhaH4I8TbenoQ5t1S2KQfnt5FunvfYSwwp3Xm+9lbNzHBdYDB13a8Wbh8Z4gqgC5D99LhaEoPgHTAlUebqIyv9grViOUNRaLghx+KfapBWUpTi2exI+L8D3T4MV1LD7TMhINLZSNhtpQt3U4QDP2OBr8rVtBUt0ufVINQGL3y8JUxFrcxj9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWyxkvUJqilrNZ5RkcmVRYby34W4BlqmD4jNUBOAgOk=;
 b=TyFCh/CsumZ/8wwVgh3Qq1xgGYhJM6e6yj6pvGGIzYSEMAnE8HsBD5Q8Mu3ySyKmhtrZxHIfwm99YOOEABtPQULqn9ddKUJkKOQosgtAJFimb7lVv2t3I4GcpwLr/w9hMzeCUaPFmNU/Obr9g4xsXehzS3vdZfke22LXqzpx2tI=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3936.namprd11.prod.outlook.com (10.255.180.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Sun, 25 Aug 2019 12:23:46 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Sun, 25 Aug 2019
 12:23:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 4/7] mtd: spi-nor: Split spi_nor_init_params()
Thread-Topic: [PATCH v2 4/7] mtd: spi-nor: Split spi_nor_init_params()
Thread-Index: AQHVWnOOC9h2mNJjWkK/0S4j8FdZtqcLxS8AgAAFwgA=
Date: Sun, 25 Aug 2019 12:23:45 +0000
Message-ID: <78202b39-1c40-dbaa-3ebc-3481ecbe4643@microchip.com>
References: <20190824120027.14452-1-tudor.ambarus@microchip.com>
 <20190824120027.14452-5-tudor.ambarus@microchip.com>
 <20190825140302.21ca2623@collabora.com>
In-Reply-To: <20190825140302.21ca2623@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0051.eurprd04.prod.outlook.com
 (2603:10a6:802:2::22) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.53.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a333c52-47f9-4cba-833a-08d72957131f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3936; 
x-ms-traffictypediagnostic: MN2PR11MB3936:
x-microsoft-antispam-prvs: <MN2PR11MB39364E65A54E446CADC1E719F0A60@MN2PR11MB3936.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01401330D1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39850400004)(136003)(376002)(346002)(366004)(199004)(189003)(3846002)(6116002)(6436002)(8936002)(81166006)(81156014)(4326008)(36756003)(6246003)(66446008)(229853002)(53936002)(186003)(26005)(14444005)(256004)(76176011)(53546011)(99286004)(52116002)(25786009)(102836004)(6512007)(386003)(6506007)(66476007)(66556008)(8676002)(5660300002)(6486002)(86362001)(14454004)(7736002)(305945005)(446003)(316002)(31696002)(66946007)(64756008)(66066001)(478600001)(31686004)(476003)(54906003)(2616005)(11346002)(486006)(71200400001)(71190400001)(6916009)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3936;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: W3nkZytVppL1FcrjUItMviLncCNUi6Ll2SFP9iZpcoA3ioKJVu2z9tpF00V2ygWZdaJvQs17DgNqlUvxqgFd33CPn/WfUn1b7nucAHSCJOxOCmUXmt39jhMb4q2nAdDeHplo90tF1Rxp4da5v8p2yoOlVTxD2t2C7JVysQjfD5HTjQwrxexf/mOE6/tBKsVftcbTFIDxrp7R7UTyDy53yBngDC8BvMkohkXPkehtciPe4V+MSeqqIpk3YjkXuVmPeT3PFxTcKwgEELLs+qfNhn22N7gYBymF15OWGJEVUJVxnwPBw36ACyVWSH2f0kxm6m2nH2HaorT3jqWS2B4XuVoMHTvm9cHxHAX9DbIDVOXBF7oXVhxoLWZoJCVFF0xjX4cyhRhAFtscvfht2gPoyoil3pPddIigeL3Ec5iix78=
x-ms-exchange-transport-forked: True
Content-ID: <2387C189842A8F479F1ABC599FD15317@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a333c52-47f9-4cba-833a-08d72957131f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2019 12:23:45.7799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +jJjxBMDVriFtPxZ8ZIX2t1eAnLUNckBKDB5IPGXZvpWFTsim6twwQfmq/kMVkiGqExxPNqPIUbDWGyKAR37467d1vWC4U6bMkBYoWx84lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_052356_871676_A7815913 
X-CRM114-Status: GOOD (  17.53  )
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



On 08/25/2019 03:03 PM, Boris Brezillon wrote:
> External E-Mail
> 
> 
> On Sat, 24 Aug 2019 12:00:43 +0000
> <Tudor.Ambarus@microchip.com> wrote:
> 
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> Add functions to delimit what the chunks of code do:
>>
>> static void spi_nor_init_params()
>> {
>> 	spi_nor_legacy_init_params()
>> 	spi_nor_manufacturer_init_params()
>> 	spi_nor_sfdp_init_params()
>> }
>>
>> Add descriptions to all methods.
>>
>> spi_nor_init_params() becomes of type void, as all its children
>> return void.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 83 ++++++++++++++++++++++++++++++++-----------
>>  1 file changed, 63 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index c9514dfd7d6d..93424f914159 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -4186,7 +4186,34 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
>>  		nor->info->fixups->default_init(nor);
>>  }
>>  
>> -static int spi_nor_init_params(struct spi_nor *nor)
>> +/**
>> + * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
>> + * based on JESD216 SFDP standard.
>> + * @nor:	pointer to a 'struct spi-nor'.
>> + *
>> + * The method has a roll-back mechanism: in case the SFDP parsing fails, the
>> + * legacy flash parameters and settings will be restored.
>> + */
>> +static void spi_nor_sfdp_init_params(struct spi_nor *nor)
>> +{
>> +	struct spi_nor_flash_parameter sfdp_params;
>> +
>> +	memcpy(&sfdp_params, &nor->params, sizeof(sfdp_params));
>> +
>> +	if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
>> +		nor->addr_width = 0;
>> +		nor->flags &= ~SNOR_F_4B_OPCODES;
>> +	} else {
>> +		memcpy(&nor->params, &sfdp_params, sizeof(nor->params));
>> +	}
>> +}
>> +
>> +/**
>> + * spi_nor_legacy_init_params() - Initialize the flash's parameters and settings
>> + * based on nor->info data.
>> + * @nor:	pointer to a 'struct spi-nor'.
>> + */
>> +static void spi_nor_legacy_init_params(struct spi_nor *nor)
> 
> Nitpick: hm, I'm not a big fan of the 'legacy' term here as I'm not sure
> it reflects the reality. I guess this function will stay around, and
> even new NORs are not guaranteed to provide SFDP tables. How about
> spi_nor_set_default_params() or spi_nor_info_init_params()?

I can rename it to spi_nor_info_init_params() to be in sync with
                   spi_nor_manufacturer_init_params() and
                   spi_nor_sfdp_init_params()

or I can rename all to:
spi_nor_set_params()
spi_nor_set_default_params()
spi_nor_set_manufacturer_params()
spi_nor_set_sfdp_params()

Both are ok, but the second option seems better. What would you choose?

> 
> That's just a suggestion, so here is my
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> in case you want to ignore it.
> 
>>  {
>>  	struct spi_nor_flash_parameter *params = &nor->params;
>>  	struct spi_nor_erase_map *map = &params->erase_map;
>> @@ -4260,25 +4287,43 @@ static int spi_nor_init_params(struct spi_nor *nor)
>>  	spi_nor_set_erase_type(&map->erase_type[i], info->sector_size,
>>  			       SPINOR_OP_SE);
>>  	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
>> +}
>>  
>> +/**
>> + * spi_nor_init_params() - Initialize the flash's parameters and settings.
>> + * @nor:	pointer to a 'struct spi-nor'.
>> + *
>> + * The flash parameters and settings are initialized based on a sequence of
>> + * calls that are ordered by priority:
>> + *
>> + * 1/ Legacy flash parameters initialization. The initializations are done
>> + *    based on nor->info data:
>> + *		spi_nor_legacy_init_params()
>> + *
>> + * which can be overwritten by:
>> + * 2/ Manufacturer flash parameters initialization. The initializations are
>> + *    done based on MFR register, or when the decisions can not be done solely
>> + *    based on MFR, by using specific flash_info tweeks, ->default_init():
>> + *		spi_nor_manufacturer_init_params()
>> + *
>> + * which can be overwritten by:
>> + * 3/ SFDP flash parameters initialization. JESD216 SFDP is a standard and
>> + *    should be more accurate that the above.
>> + *		spi_nor_sfdp_init_params()
>> + *
>> + *    Please not that there is a ->post_bfpt() fixup hook that can overwrite the
>> + *    flash parameters and settings imediately after parsing the Basic Flash
>> + *    Parameter Table.
>> + */
>> +static void spi_nor_init_params(struct spi_nor *nor)
>> +{
>> +	spi_nor_legacy_init_params(nor);
>>  
>>  	spi_nor_manufacturer_init_params(nor);
>>  
>> -	if ((info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
>> -	    !(info->flags & SPI_NOR_SKIP_SFDP)) {
>> -		struct spi_nor_flash_parameter sfdp_params;
>> -
>> -		memcpy(&sfdp_params, params, sizeof(sfdp_params));
>> -
>> -		if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
>> -			nor->addr_width = 0;
>> -			nor->flags &= ~SNOR_F_4B_OPCODES;
>> -		} else {
>> -			memcpy(params, &sfdp_params, sizeof(*params));
>> -		}
>> -	}
>> -
>> -	return 0;
>> +	if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
>> +	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
>> +		spi_nor_sfdp_init_params(nor);
>>  }
>>  
>>  static int spi_nor_select_read(struct spi_nor *nor,
>> @@ -4693,10 +4738,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>  	    nor->info->flags & SPI_NOR_HAS_LOCK)
>>  		nor->params.disable_block_protection = spi_nor_clear_sr_bp;
>>  
>> -	/* Parse the Serial Flash Discoverable Parameters table. */
>> -	ret = spi_nor_init_params(nor);
>> -	if (ret)
>> -		return ret;
>> +	/* Init flash parameters based on flash_info struct and SFDP */
>> +	spi_nor_init_params(nor);
>>  
>>  	if (!mtd->name)
>>  		mtd->name = dev_name(dev);
> 
> 
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
