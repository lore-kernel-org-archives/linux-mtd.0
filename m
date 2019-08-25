Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487A9C3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 13:20:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18B322070B
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 13:20:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="okHyqYNl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="fBosKNth"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18B322070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BxXo6d5rLNq3kodzuszv8CX7RRF0ciW9Pd4NSbA+UAk=; b=okHyqYNlQzCTEe
	pNesvQJnyUWhv7k3Cu3mq2OtKOdYLSHYqv5PKroChLKD+GzZBHJnwv8wMx5KpmKDMswPyVNCQqXXU
	LYdK4QX4pz9dvJgImbdTEmaGe7popkFLeiVccHZvznp2R7cZhOtW+yFmWGOaamryGX2yqKLIElHEC
	ANFAGFu0+GkIKQwyfbwdMnENF2rj9/QQjj3jOQ9Jc+zXKtqx9iKdUQbyd6V/kdeO5C7QxEmmX1QsM
	qSKaZIg6eaFVZZ/EzbzhC71vstEAFZ4clfEaldal1RhjM2SCcXG9J4a/nYqybxWSEkh8zwCn+XuiI
	nbXKsq6UoF9+aSZ33dgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1sRG-0002G4-NH; Sun, 25 Aug 2019 13:20:10 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1sRD-0002C6-S2
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 13:20:09 +0000
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
IronPort-SDR: N/7/Mfnltcx4jlWrkbk6+6wTiXOz1IlHprqAwRb7+ckdS4MshxOF5kpykiwd9nYMH6VdBKmmBJ
 ZRfA75Y4hMQlWogG/v3xzGgjUO3UUbCqk+EpJjIVmUnGTyP5IxpzIUz5RNA4x2U+dlDe+RQWeO
 YPCCF1Tga4NAOKLVWC55FAU6BzRZ7CVy1BWsdhjPh5LGRMn3bLK6dkGPj7YvWXTrm2zzohY3j5
 Cz+by8gbt8YZJxtgsja020PhAZSYMfR+RkqKgvzXM8E1eD4RVhFvbXvubHEel7DNebR5XdJL3L
 p4s=
X-IronPort-AV: E=Sophos;i="5.64,429,1559545200"; d="scan'208";a="43601492"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Aug 2019 06:20:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 25 Aug 2019 06:20:00 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 25 Aug 2019 06:20:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWjyfNm2nMFse711pWHuBZDUGg2ZPoy5DkkaFC7o1iysepjKe35LKa7auPedKBTIq0EnuxJKEfDvSQtm59v27SV40GoAazxcCrD/wOPtdMPVOufTgHkzF58koMo35+L2fcNH8aqRpPR9pCk5bGPyILn5M2l8hAH2E3itBQZfqoPRGQlAG8hhUgCKpY0VeZ5H+nKBZFtksEpz2QafgPGpCxvLAYjnvCzorBJGgfnuxrG1jx+J+LzDr5hEpfjpT64C3OhmTRudG2QGcCjFS3WHusoBbBOX+yirW3tsxlEPaA2YYs7oE7nFi2aN/ojs45RLF9yHI7+dktVXsMDnn3vNeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcz3oJCTP2tCU5VeMacZ4nyRll6b50SnnEOeNfhoi+M=;
 b=NYhDG5PV2aYtnr0PPjrmwV0pbHC0NiltVBlatV+1FItLoq02i9JTZJXUh0x4BQQueqQ1lF08mDyGwCBIzZ411Q8EM7FP6X0YHOl8ri5p5M8IFmYfP8TkWlbtGlUqCqzhohlqYAJb4pD4h5+vlVriD68b9lY+7L8ClZ3kbfeDgp4FEH61LS8GryaKjzltLVey15ycy8Pf9DXSL7GHBIe0kZjnSuk4y2r1nmN74zMDfSuT7EwtcVA8xy9Eey0i6uT3hNLUYx0NjUnM6U7ugm4HQbBxUhB8kI9dHhsmkVwGILVf99wS1b2Wa1mHTa/fEZYZURiRgQ7RGir/aStJBnDDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcz3oJCTP2tCU5VeMacZ4nyRll6b50SnnEOeNfhoi+M=;
 b=fBosKNth0Uv4nhIbPrC4uMlZxcYGk+LXCuyiTL4HYbLmSOZc4sya1nexgNOhDd2HIq4AV3XUcXUKmgNcyM86TaVvMCQ0oNQ9zkRUPM3pMsJ7U6Ro+Qt4+bwQ8KGZop3QB8hvHl1EXiTPI6yAI+8G5IhMzz0BRWJUKdsV/P2ZM4Q=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4384.namprd11.prod.outlook.com (52.135.37.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Sun, 25 Aug 2019 13:19:57 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Sun, 25 Aug 2019
 13:19:57 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH 4/5] mtd: spi-nor: Move clear_sr_bp() to 'struct
 spi_nor_flash_parameter'
Thread-Topic: [PATCH 4/5] mtd: spi-nor: Move clear_sr_bp() to 'struct
 spi_nor_flash_parameter'
Thread-Index: AQHVWcrvkrm6wR4a/Ey8Wo3jUNa/D6cL2Q+AgAAC5YA=
Date: Sun, 25 Aug 2019 13:19:57 +0000
Message-ID: <6485db42-4449-cc9b-8e09-0ad89b259a8b@microchip.com>
References: <20190823155325.13459-1-tudor.ambarus@microchip.com>
 <20190823155325.13459-5-tudor.ambarus@microchip.com>
 <20190825150927.5374b1ea@collabora.com>
In-Reply-To: <20190825150927.5374b1ea@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0601CA0035.eurprd06.prod.outlook.com
 (2603:10a6:800:1e::45) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.53.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57a64cc5-7738-40cd-ace7-08d7295eecce
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4384; 
x-ms-traffictypediagnostic: MN2PR11MB4384:
x-microsoft-antispam-prvs: <MN2PR11MB438425EB5244151B8BE7C10FF0A60@MN2PR11MB4384.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01401330D1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(39850400004)(136003)(366004)(376002)(199004)(189003)(66476007)(66556008)(64756008)(66446008)(305945005)(31686004)(25786009)(4326008)(54906003)(6512007)(6486002)(53546011)(386003)(14444005)(256004)(31696002)(86362001)(99286004)(52116002)(53936002)(6246003)(71190400001)(8936002)(5660300002)(76176011)(6436002)(26005)(186003)(2906002)(66066001)(102836004)(81156014)(81166006)(8676002)(2616005)(14454004)(66946007)(486006)(7736002)(71200400001)(6116002)(3846002)(6506007)(476003)(11346002)(316002)(446003)(229853002)(6916009)(36756003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4384;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NhEJQIL23HALIKTu+OqZu25WPdzuS5yBgE4G96TBQ0FWCeZjfVY4PvmYPp1u7c2x0zzpVaHAxNsdk4a4OLaBC6Vq0x5gxQPfgA8ax9LDsZGDjVpSNrLAR0But74EHWWk+JeHku8lmbQ7EPODWpyx94v3XFroM5vYRdbJ4KWsXf7c6Is5Q3LldzTCZz54PjK8CKumSqKeiBKgERfjFeON5IlD6eup6mSs6pcQcNMtBRUQ0yKZFyMvUmzJb14T02+1+qNimhNvq4kcMiBf0iqhGp0wl1EhVzNW00NzCG6aKIAXXhmTYnsADpnpcevkoTipMlbVePn4W4RJHQmgx9So0yCGP3HTFZgkcSQNqVgrwK5xvtVA+DNiPy00p/LcrkGYdkr+Q5IFKsaaJVhi/FvQ2O3bSDCaeG3Ep44DjZgkLG0=
x-ms-exchange-transport-forked: True
Content-ID: <4435CA0145BC0146A51495677E043301@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a64cc5-7738-40cd-ace7-08d7295eecce
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2019 13:19:57.4485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vyxaUyWfT8dE2eCOAKytSYImWFTSyXVDYQ+YLPUKjooI6PKx7/wEjnDNzS8jNnXdx2QIYx3fJA17xfQTEb2wkFFMsynDMOUrv1LdHsHJBiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_062007_985523_B71ECA77 
X-CRM114-Status: GOOD (  17.98  )
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



On 08/25/2019 04:09 PM, Boris Brezillon wrote:
> On Fri, 23 Aug 2019 15:53:41 +0000
> <Tudor.Ambarus@microchip.com> wrote:
> 
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> All flash parameters and settings should reside inside
>> 'struct spi_nor_flash_parameter'. Move clear_sr_bp() from
>> 'struct spi_nor' to 'struct spi_nor_flash_parameter'.
>>
>> Rename clear_sr_bp()/disable_block_protection() to better indicate
>> what the function does.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 47 +++++++++++++++++++++++++++++++++----------
>>  include/linux/mtd/spi-nor.h   |  5 ++---
>>  2 files changed, 38 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 6bd104c29cd9..15b0b1148bf3 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -4477,20 +4477,45 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
>>  	return nor->params.quad_enable(nor);
>>  }
>>  
>> +/**
>> + * spi_nor_disable_block_protection() - Disable the write block protection
>> + * during power-up.
>> + * @nor:                pointer to a 'struct spi_nor'
>> + *
>> + * Some spi-nor flashes are write protected by default after a power-on reset
>> + * cycle, in order to avoid inadvertend writes during power-up. Backward
>> + * compatibility imposes to disable the write block protection at power-up
>> + * by default.
>> + *
>> + * Return: 0 on success, -errno otherwise.
>> + */
>> +static int spi_nor_disable_block_protection(struct spi_nor *nor)
>> +{
>> +	if (!nor->params.disable_block_protection)
>> +		return 0;
>> +
>> +	/*
>> +	 * In case of the legacy quad enable requirements are set, if the
>> +	 * configuration register Quad Enable bit is one, only the the
>> +	 * Write Status (01h) command with two data bytes may be used to clear
>> +	 * the block protection bits.
>> +	 */
>> +	if (nor->params.quad_enable == spansion_quad_enable)
>> +		nor->params.disable_block_protection =
>> +			spi_nor_spansion_clear_sr_bp;
> 
> Hm, doesn't look right to adjust the function pointer just before
> calling it. Can't we move that logic earlier (when doing the
> default/manufacturer specific init)? Also, as I said in one of my

No, we can't move it earlier to ->default_init() because the pointer to
quad_enable() function can be modified later on, when parsing SFDP. This should
stay here, after the quad_enable() method is known, so after the
spi_nor_init_params() call.


> previous emails, I'd prefer to have this hook moved to
> spi_nor_locking_ops and just have a flag to reflect when block
> protection can be disabled.

yes, I agree, will move.

> 
>> +
>> +	return nor->params.disable_block_protection(nor);
>> +}
>> +
>>  static int spi_nor_init(struct spi_nor *nor)
>>  {
>>  	int err;
>>  
>> -	if (nor->clear_sr_bp) {
>> -		if (nor->quad_enable == spansion_quad_enable)
>> -			nor->clear_sr_bp = spi_nor_spansion_clear_sr_bp;
>> -
>> -		err = nor->clear_sr_bp(nor);
>> -		if (err) {
>> -			dev_err(nor->dev,
>> -				"fail to clear block protection bits\n");
>> -			return err;
>> -		}
>> +	err = spi_nor_disable_block_protection(nor);
>> +	if (err) {
>> +		dev_err(nor->dev,
>> +			"fail to unlock the flash at init (err = %d)\n", err);
>> +		return err;
>>  	}
>>  
>>  	err = spi_nor_quad_enable(nor);
>> @@ -4635,7 +4660,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>  	    JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
>>  	    JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
>>  	    nor->info->flags & SPI_NOR_HAS_LOCK)
>> -		nor->clear_sr_bp = spi_nor_clear_sr_bp;
>> +		nor->params.disable_block_protection = spi_nor_clear_sr_bp;
>>  
>>  	/* Parse the Serial Flash Discoverable Parameters table. */
>>  	ret = spi_nor_init_params(nor);
>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>> index 17787238f0e9..399ac34a529d 100644
>> --- a/include/linux/mtd/spi-nor.h
>> +++ b/include/linux/mtd/spi-nor.h
>> @@ -480,6 +480,7 @@ struct spi_nor;
>>   * @page_programs:	page program capabilities ordered by priority: the
>>   *                      higher index in the array, the higher priority.
>>   * @quad_enable:	enables SPI NOR quad mode.
>> + * @disable_block_protection: disables block protection during power-up.
>>   */
>>  struct spi_nor_flash_parameter {
>>  	u64				size;
>> @@ -490,6 +491,7 @@ struct spi_nor_flash_parameter {
>>  	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
>>  
>>  	int (*quad_enable)(struct spi_nor *nor);
>> +	int (*disable_block_protection)(struct spi_nor *nor);
>>  };
>>  
>>  /**
>> @@ -535,8 +537,6 @@ struct flash_info;
>>   * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
>>   * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
>>   *			completely locked
>> - * @clear_sr_bp:	[FLASH-SPECIFIC] clears the Block Protection Bits from
>> - *			the SPI NOR Status Register.
>>   * @params:		[FLASH-SPECIFIC] SPI-NOR flash parameters and settings.
>>   *                      The structure includes legacy flash parameters and
>>   *                      settings that can be overwritten by the spi_nor_fixups
>> @@ -578,7 +578,6 @@ struct spi_nor {
>>  	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>>  	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>>  	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>> -	int (*clear_sr_bp)(struct spi_nor *nor);
>>  	struct spi_nor_flash_parameter params;
>>  
>>  	void *priv;
> 
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
