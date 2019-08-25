Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726DEC3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 14:28:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4185520673
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 14:28:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tSybyswn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="i5111ycM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4185520673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dlc2PTmEDbo/b5HFBGki+zbG0p1bDMnFvNJafLXhcIQ=; b=tSybyswnxp+62E
	4zsUFpDh+XDSPobuO7/olAzlpoCx+Z6g69AXap7fyznIFdoNBW6oML40oWIuFc1brcgdCdfJMucy2
	xPZGjiBafuRUDgGO1CDOw6/b+Xf8GKM5LvbDXb4vdnD60bYyFri9LCLbbzYAaAVjFmR1Ease6YjBn
	cdo+AhnyBszAVQKasAAwqFKzra+TXYrA2i+lOQPS2s8QU6at+cUk6YlPDH4djUsbsNL7wl92gkJRG
	z+qlLePFqAnfFg0vTNI7njyHJYCwHn0nBz7q6OgsXPVXIGIkSQVQ03d8t8M4xjdm40DwlPxZ9fjyp
	67Fy/tSc/9PVi6OZ3ehA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1tUk-0005cs-Dt; Sun, 25 Aug 2019 14:27:50 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1tUf-0005cA-U2
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 14:27:48 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: DLA63h3g81/T/e82VgWA+0rLS2FM2SEEk+gvaBBeodudc2Rs6Ou/cpYtqc6UxUb436nJkBFkiW
 eWjsZSoJ6NzJ2o2Jln7Ep4dqywdWVs0wIq/BJz19bwqwuen/8aDsGiTXxejdlBLSXlRfRGaxSo
 j2ce3wbO7wuX7EVmdVbJciEJdAIYIt//DPiL9L0HohcPfEjmU/95j2TbVV7N0phLjiv2oLI/D6
 Gsaf4KrZsHezPhih/g2FpkWGrkoARTop6fttnIWx3tnV1egXcr/AlxVg/91jf+spYcMoTbSSTo
 T0Q=
X-IronPort-AV: E=Sophos;i="5.64,429,1559545200"; d="scan'208";a="46515582"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Aug 2019 07:27:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 25 Aug 2019 07:27:41 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 25 Aug 2019 07:27:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWbsZs5Rp6fBfHGuN1THybS/FNYbE3n8qgvPSRZpGkowkBE/uIjl3Buuk4JCfysFli40+5H2F9NmTjZvCK6b/rnOPFtLDJXkjJoA8ELchwMFjlWt5Od1fCnJHBCA0R09BoZYEacixa3P5WhkJxahgl1EpuR++itToPU1lhJvUibIhQWXITEFHGG4+EN4h1p6HsqUA3j3PyIgZ7ASN26CchRLq4EputIkkCJw1nnLt6dTPAuTU2gXr90imvl7YyHidhnXyyeQe/Js44ve96koScILfqiYOuZzkF7IX7UshNA6DIfYK88FqJyU6YxLL/SRrxNr3PabLnERRG+UsT8RzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOT9H4AQ4oQ4FmWWB9fds+T6jR5iM6e/l9D5fTbAllo=;
 b=X9iA/T9P7huPwGXlQz/znXavNgOgPp4rZ3Bhl87CurbfjvCWEn14mkjkw9JpDVDtjJ7t5N6exUNTeqZ+zP71FQfmHMlfgkSUbHwVLM9s10ROxPpfDCyMxHAAXUhKpro8YDdXFa7hAA0PXOCshjvyji1xDEVCgHx6faBi3p+tlhAbKe/pxQpWHNJc1jg7TCq80wE5X0mFUqFyuWFgH/c/qX57AEo9VkAaaF7SL9OKyYJe5QYH6gUlnexlVChZZ9vRGuPxvFt62cZ3vbeeienYB9hzoiAATSv6aJfMev2wcxqE/NM69hQGQ0haXxE41MnkZL0Ead4brhAUTEwMTruI4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOT9H4AQ4oQ4FmWWB9fds+T6jR5iM6e/l9D5fTbAllo=;
 b=i5111ycMoTC7/aput5zNigV0ibsqu4HpQumspIouAlwspStFhInBotxvHwXm5Xzo3CZ/z+1XK5C37vNd7gCTFh4a4Fd6ePU3MqVBWtUXmPdBFdN++nnl/q7dUF7w6WWxkhAHIp0vGbH3vrOMlQy2ecW6EJCKQwNX+Fi3De6gKRo=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3838.namprd11.prod.outlook.com (20.178.252.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Sun, 25 Aug 2019 14:27:39 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Sun, 25 Aug 2019
 14:27:39 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: add Global Block Unlock support
Thread-Topic: [PATCH v2 1/2] mtd: spi-nor: add Global Block Unlock support
Thread-Index: AQHVWndBGiXUgYKWckGGG7tH1Lap/acL0hmAgAAbbAA=
Date: Sun, 25 Aug 2019 14:27:39 +0000
Message-ID: <42ab7f11-741d-a3f3-0a83-36a1b7600f0f@microchip.com>
References: <20190824122700.23558-1-tudor.ambarus@microchip.com>
 <20190824122700.23558-2-tudor.ambarus@microchip.com>
 <20190825144921.66139a65@collabora.com>
In-Reply-To: <20190825144921.66139a65@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0101CA0071.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:1f::39) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.53.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eda596bb-0a6c-48f6-6d32-08d7296861d1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3838; 
x-ms-traffictypediagnostic: MN2PR11MB3838:
x-microsoft-antispam-prvs: <MN2PR11MB383844975FDF33F7310201B1F0A60@MN2PR11MB3838.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01401330D1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(366004)(136003)(39850400004)(376002)(199004)(189003)(54906003)(36756003)(2616005)(305945005)(476003)(66066001)(5660300002)(14454004)(6436002)(53546011)(316002)(4326008)(6506007)(8936002)(26005)(7736002)(31696002)(3846002)(99286004)(386003)(486006)(52116002)(76176011)(186003)(6486002)(11346002)(446003)(102836004)(86362001)(25786009)(31686004)(6512007)(478600001)(6116002)(256004)(14444005)(71200400001)(8676002)(2906002)(71190400001)(66476007)(229853002)(66946007)(81166006)(64756008)(66446008)(6246003)(66556008)(81156014)(6916009)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3838;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m6HUKhX+3s1Vj+0uwAriD7MuMJ/v/wOC6P8ngOaoyRwaThyaKDG2nQ3b+6n/7iAHLSQqwhgiFgmwfZz+b56F1G6POOlhBaCceDEkvCkaDz9RCRU9DZYqyU5bBPKoK060DJ4Ea7oKrGq3a2G65ElPtHuOPUFvZBaAVhNzcuyAGLRun1EjhiIoRJ1yCRuN0CnXPsUXrdPNzr0XlxxnRORkpZ0LP6pRRl4W1KsMDraSmg1Mds9wBzuI+Zm0izmLMAnlrDlh5OQqEYhgoazAU7fHMyVremy+ZnMAQo1uA/5VEPTNtIVYRUytrDXkiAayYNyPvbwgzcgcFK4ukbOQtBcNVgE5q+AIy3Dy6bzz3bf39TuCry4Rhn55jZVfqek4hfO4l8T2xM/aFRVSy+64arKJLa3XAV6Om6PnEnRyntlvbxQ=
x-ms-exchange-transport-forked: True
Content-ID: <9C0C60E9C6FDF540A1DAA6086EA9E82D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: eda596bb-0a6c-48f6-6d32-08d7296861d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2019 14:27:39.2895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tCReSk9OsFbH4tFUYJbFiivcc+U1PvUISP0+cDu0zFH4ld7UlFeWVJYlqUdypuAdt8r/LrVJD8GaehX+oIk3K54Rht0SsbjXhJOJv1hYWYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_072746_146000_013A4926 
X-CRM114-Status: GOOD (  15.69  )
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



On 08/25/2019 03:49 PM, Boris Brezillon wrote:
> External E-Mail
> 
> 
> On Sat, 24 Aug 2019 12:27:12 +0000
> <Tudor.Ambarus@microchip.com> wrote:
> 
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> To avoid inadvertent writes during power-up, some flashes are
>> write-protected by default after a power-on reset cycle.
>> A Global Block-Protection Unlock command offers a single
>> command cycle that unlocks the entire memory array. This is
>> identical with what other nor flashes are doing by clearing
>> the block protection bits from the status register: disable
>> the write protection after a power-on reset cycle.
>>
>> We can't determine this purely by manufacturer type and it's not
>> autodetectable by anything like SFDP, so make a new flag for it:
>> UNLOCK_GLOBAL_BLOCK.
>>
>> Note that the Global Block Unlock command has different names
>> depending on the manufacturer, but always the same command value:
>> 0x98. Macronix's MX25U12835F names it Gang Block Unlock,
>> Winbound's W25Q128FV names it Global Block Unlock and
>> Microchip's SST26VF064B names it Global Block Protection Unlock.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>> v2: the check for UNLOCK_GLOBAL_BLOCK should be done the first
>> thing in spi_nor_disable_block_protection(). We use it for a faster
>> throughput, a single command cycle that unlocks the entire memory
>> array. Fix it.
>>
>>  drivers/mtd/spi-nor/spi-nor.c | 46 ++++++++++++++++++++++++++++++++++++++++++-
>>  include/linux/mtd/spi-nor.h   |  1 +
>>  2 files changed, 46 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 1896d36a7d11..c0ba6fe62461 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -196,7 +196,7 @@ struct flash_info {
>>  	u16		page_size;
>>  	u16		addr_width;
>>  
>> -	u16		flags;
>> +	u32		flags;
>>  #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
>>  #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
>>  #define SST_WRITE		BIT(2)	/* use SST byte programming */
>> @@ -233,6 +233,7 @@ struct flash_info {
>>  #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
>>  #define USE_CLSR		BIT(14)	/* use CLSR command */
>>  #define SPI_NOR_OCTAL_READ	BIT(15)	/* Flash supports Octal Read */
>> +#define UNLOCK_GLOBAL_BLOCK	BIT(16)	/* Unlock global block protection */
> 
> Let's add the corresponding SNOR_F_ flag so that manufacturer/sfdp init
> can set the flag directly.

Not really needed, because we can't determine this by parsing SFDP, there is no
field in SFDP to indicate this support. You can't set this at manufacturer
level, because it is not a per-manufacturer thing. Some flashes can support it,
some not even if all from the same manufacturer. So this global unlock command
it's at the per-chip level, and for the moment we should keep this flag just in
the flash_info's flags.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
