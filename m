Return-Path: <SRS0=yEN0=UX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4909C43613
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 08:21:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 888352083D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 08:21:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MeFpXBqK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="OPhS1H2p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 888352083D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JNHtXt7pfpyx2hlVH9G7ZyJ5uCYmluBbnJwMJipmuyI=; b=MeFpXBqKnVH1c4
	5hbhfb2cp1PQyLfqLYEOxJm5q6utEbr+zVZJELCqVoRDsnMS4jvqLrjAWxlLiTHoJePaw3xmgSlRp
	2BO9K8B/HV13j1uYcv6JI2n+81kKKzAa3kznjzu5rF4zpDBhdbhMlNMyIkiYYwB5xa39pSNM2Z4hp
	SErmXzYTKSUNQgr+QL3x6YsmxyAZGRythmg3ROmZSOCN1FcQNOiYvkguuAZ57GyDfeyaS8eTKehBM
	53nAchqkV6p7B6dRN85Jw/pHROfgdPdlMzAO1a5sezr6ppp1kfAQDXyak+O+Z1XisOAp9vZ6+fvtn
	4w+7zsmixNhPjF7s0xXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfKDm-0004Fl-EO; Mon, 24 Jun 2019 08:21:02 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfKDg-0004F6-Jl
 for linux-mtd@lists.infradead.org; Mon, 24 Jun 2019 08:21:01 +0000
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
X-IronPort-AV: E=Sophos;i="5.63,411,1557212400"; d="scan'208";a="40145526"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Jun 2019 01:20:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 24 Jun 2019 01:19:53 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 24 Jun 2019 01:19:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdMJP7oY4mhWtu4RnQESrJD/8B0WsxRwntd5aIz+i+A=;
 b=OPhS1H2pqxZ30E3aRIiMfZI3b7ky9hYZJatJ+cdWmVtbO6UReq5GgTvFAoN6IQO7BpUcI1GhFgO0j67WtSfS/vgHakuL00AKe4YJGjSbL/oiu+ncy3bwOGfwx824TrNSDbrSpI5sI1eknuWC2nAhuoM44lKy7imKFmiHBKgrGA8=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1780.namprd11.prod.outlook.com (10.175.99.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 08:20:50 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36%9]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 08:20:50 +0000
From: <Tudor.Ambarus@microchip.com>
To: <f.suligoi@asem.it>
Subject: Re: [PATCH 1/1] mtd: spi-nor: add a presence check for non-JEDEC spi
 nor
Thread-Topic: [PATCH 1/1] mtd: spi-nor: add a presence check for non-JEDEC spi
 nor
Thread-Index: AQHU3+WAOo1QTk5/V0KHCow8ly8T6KapMG8AgAHG4YCAABRSAA==
Date: Mon, 24 Jun 2019 08:20:50 +0000
Message-ID: <7fcfd18c-45c9-37a7-270e-cd8b95796903@microchip.com>
References: <1553172946-2251-1-git-send-email-f.suligoi@asem.it>
 <55f74662-c5f6-2cdf-f1a0-c685f7ff1913@microchip.com>
 <c7ce7a2966a4414a90e84f30929cede1@asem.it>
In-Reply-To: <c7ce7a2966a4414a90e84f30929cede1@asem.it>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0102CA0083.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::24) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bde22ab-b7de-40dc-4f35-08d6f87cdde2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB1780; 
x-ms-traffictypediagnostic: BN6PR11MB1780:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR11MB17802F735C6167D59DF01BF7F0E00@BN6PR11MB1780.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(366004)(376002)(346002)(13464003)(189003)(199004)(5660300002)(71200400001)(71190400001)(6916009)(31686004)(6506007)(53936002)(3846002)(386003)(53546011)(6116002)(6512007)(72206003)(52116002)(66066001)(76176011)(229853002)(68736007)(6436002)(186003)(316002)(478600001)(966005)(26005)(11346002)(6246003)(81166006)(486006)(6486002)(476003)(8676002)(256004)(36756003)(305945005)(4326008)(7736002)(99286004)(102836004)(2906002)(14444005)(2616005)(8936002)(54906003)(81156014)(6306002)(66946007)(66446008)(66556008)(64756008)(86362001)(446003)(66476007)(31696002)(73956011)(25786009)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1780;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ir5UE96gPPqfS4SIIuFF2ny1mDU3RS5qMM8fNWqqTrGbH7CSQEMnJgavYkjMdAz+E8pVXu/41RB2rt23K/haRHMAGAG6q0o+GbZ0GF4Fqg4/pzNj8GXJu7a/PsLctNQ4+tZuTtxMG5o0I3yP3WNrTbpolT8WNF+SKd0/cXw1yBB84rg57jqvFLaAGF5g2l7Sxr0LK9YqoD4so5+JuD68vyX+IOXbPDlCqKJWDcZr/F/u0UgeudaN2itBvMZqnymVuUL51hHjCyAzh+bq6OB6CgldQ9Ay6O4xut35vm8Che+t4MZzfOX4qK+vmhiacibcJyRZkobfKyi53Khlp2WCzyYkMCoUFmkui/yqY3BQ8off9g3+X8eE+wCiTYDXAOkNySnnXQlSPxlfBLHyEnxV2K1TX2QiwpPHKHc4oW+f7cw=
Content-ID: <A2E2B264A8E28945B1651DC865E2528E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bde22ab-b7de-40dc-4f35-08d6f87cdde2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 08:20:50.5536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1780
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_012056_865850_83518530 
X-CRM114-Status: GOOD (  22.66  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, linux-kernel@vger.kernel.or,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org, richard@nod.at,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Flavio, Marek, Vignesh,

On 06/24/2019 10:07 AM, Flavio Suligoi wrote:
> External E-Mail
> 
> 
> Hi Tudor,
> 
>> -----Original Message-----
>> From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>
>> Sent: domenica 23 giugno 2019 06:00
>> To: Flavio Suligoi <f.suligoi@asem.it>; marek.vasut@gmail.com;
>> dwmw2@infradead.org; computersforpeace@gmail.com; bbrezillon@kernel.org;
>> richard@nod.at
>> Cc: linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.or
>> Subject: Re: [PATCH 1/1] mtd: spi-nor: add a presence check for non-JEDEC
>> spi nor
>>
>> Hi, Flavio,
>>
>> On 03/21/2019 02:55 PM, Flavio Suligoi wrote:
>>> External E-Mail
>>>
>>>
>>> This patch fixes the following kernel error message:
>>>
>>> "flash operation timed out"
>>>
>>> that occurs when a non-JEDEC spi-nor, declared in a Device Tree, but not
>>> physically present on the board, is involved in a write operation, as:
>>>
>>> cat datafile > /dev/mtd0
>>>
>>> In some cases, with enough quantity of data, the writing hangs for
>> minutes.
>>>
>>> This situation can happen, for example, in some embedded systems, when
>>> a non-JEDEC spi-nor is mounted using a removable add-on board. So is
>>> important to find a method to check a non-JEDEC device presence before
>>> using it.
>>>
>>> The presence of a JEDEC compliant device is implicitly verified during
>> the
>>> JEDEC auto-detect procedure.
>>> But for a non-JEDEC device, the presence must be explicitly checked,
>>> reading one or more known registers, according to the chip features.
>>>
>>> Without any check, if the spi-nor is declared in a Device Tree but not
>>> physically present on the board, the driver (i.e. m25p80) is loaded
>> anyway
>>> and the correspondent mtd device is also created.
>>> In this way any read operation on this device returns 0xff (or 0x00,
>>> depending on the driver and the hardware used) and any write operation
>>> hangs until the flash operation timeout occurs, with the "flash
>> operation
>>> timed out" error message.
>>>
>>> This patch adds the non-JEDEC spi-nor presence check before initializing
>>> the device.
>>>
>>> Note: currently this presence check supports only the Everspin mr25h40,
>>>       reading its status register.
>>>
>>>       The support for other non-JEDEC devices has to be added.
>>>
>>> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
>>> ---
>>>  drivers/mtd/spi-nor/spi-nor.c | 43
>> +++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 43 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-
>> nor.c
>>> index fae1474..d2cb710 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -3981,6 +3981,42 @@ static const struct flash_info
>> *spi_nor_match_id(const char *name)
>>>  	return NULL;
>>>  }
>>>
>>> +/**
>>> + * check_nojedec_nor_presence() - check the real presence of a non-
>> JEDEC nor
>>> + * @nor: pointer to a 'struct spi_nor'
>>> + *
>>> + * The presence of a JEDEC compliant device is implicity verified
>> during the
>>
>> s/implicity/implicitly
>>
>>> + * JEDEC auto-detect procedure.
>>> + * For a non-JEDEC device, the presence have to explicity checked,
>> reading
>>
>> s/explicity/explicitly
>>
>>> + * one or more known registers, according to the chip features.
>>> + *
>>> + * Return: 0 on success, -errno otherwise.
>>> + */
>>> +int check_nojedec_nor_presence(struct spi_nor *nor)
>>
>> all functions should start with spi_nor_*. How about naming it
>> spi_nor_check_nojedec_presence()?
>>
>>> +{
>>> +	struct device *dev = nor->dev;
>>
>> you use dev once, no need to declare a local variable for it.
>>
>>> +	const struct flash_info *info = nor->info;
>>
>> this will probably disappear, see below
>>
>>> +	int ret = 0;
>>
>> initialization not needed
>>
>>> +	u8 val;
>>> +
>>> +	/* Check presence for Everspin mr25h40 MRAM */
>>> +	if (!strcmp(info->name, "mr25h40")) {
>>
>> Couldn't we make this check for all non-jedec flashes? Aren't we safe to
>> assume
>> that all the flashes have a Status Register that contains a WEL bit which
>> come
>> with value zero by default?

Marek, Vignesh, do you know if this assumption is correct?

> 
> I don't know if all the non-JEDEC flashes have a Status Register with
> the same configuration and with the same default values. So for this 
> reason I thought to add a specific test for each single flash.
> In this way, every person who work with a specific flash can add
> a proper flash presence test.
> What do you think about this?

I'm not very happy with having a check for each specific flash, the code will go
nuts in size. Let's do a generic method, like the one I proposed above. If Marek
or Vignesh can not confirm if the assumption is correct, then we will have to
check the datasheets for each non-jedec flash declared in spi-nor to validate
the assumption :(.

ta

> 
>>
>>> +		/* Read the status register */
>>> +		ret = nor->read_reg(nor, SPINOR_OP_RDSR, &val, 1);
>>> +		if (ret)
>>> +			return ret;
>>> +
>>> +		dev_dbg(dev, "%s - status register = 0x%2.2x\n",
>>
>> %hhx?
>>
>>> +			info->name, val);
>>> +
>>> +		/* The factory preset of the status register is 0x00 */
>>
>> if we generalize this, the comment will become irrelevant. How about
>> something
>> like: "Check if flash is connected."
>>
>>> +		if (val == 0xff)
>>> +			return -ENODEV;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  int spi_nor_scan(struct spi_nor *nor, const char *name,
>>>  		 const struct spi_nor_hwcaps *hwcaps)
>>>  {
>>> @@ -4158,6 +4194,13 @@ int spi_nor_scan(struct spi_nor *nor, const char
>> *name,
>>>  			return ret;
>>>  	}
>>>
>>> +	/* Check non-JEDEC nor presence */
>>> +	if (!info->id_len) {
>>
>> if (name && !info->id_len)?
>>
>> How about moving the entire if block to
>> https://elixir.bootlin.com/linux/v5.2-rc6/source/drivers/mtd/spi-nor/spi-
>> nor.c#L4037?
>>
>> Cheers,
>> ta
>>
>>> +		ret = check_nojedec_nor_presence(nor);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>>  	/* Send all the required SPI flash commands to initialize device */
>>>  	ret = spi_nor_init(nor);
>>>  	if (ret)
>>>
> 
> Thanks,
> Flavio
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
