Return-Path: <SRS0=BbO6=Y6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39E8C5DF62
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 08:34:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B88B92173B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 08:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JyDXkciy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="MDEll9dw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B88B92173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/csr7ZHVAKw4VzKICbWoRu2py2FC64Kc9OMEyQ0V5KE=; b=JyDXkciy+KAJl0
	Yjw48TQeB8n6L8kwV9Rj3FWTDOjTw04iTCpOFNCh8xHqtMmKn7490CAfCjz7LnSU+5lxwU7WQQ0N5
	TP+w9VtH2/6rcK02W3oNC7PjdnNQmqGPNnD37LfdWjGYOpGTiy/ZnSQd7XhqA0fZyHSzjTr4OENqa
	W4triQv/5u/DtpG5QNvyFfC2McRHt6YedPPV9j5H0tgIUP0uTJr5CFl3Lw7AXjtA5cQVoAom7QEnl
	6p4JKhER6lVpxOqSlst2sdjrzTb6vXtBVNYSXWnuTa5QewQtsPE3N6zwk4/7Eex571kWuU52GZM63
	fH190nLMhH8sZP+TyT5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSGlR-0007GI-H7; Wed, 06 Nov 2019 08:34:05 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSGlM-0007FM-8i
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2019 08:34:04 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: OiXgMlX7YufWkTbhRTaKywoWJvYT1csv0K+ATz6h3HlhtBZSpqLFkiOhEA9gEdlB1PxrMlf7ow
 7Jh4NI4XYZHByHfTgUVKFgc7VPAD+5/nr/wYugz8YnlBXLmfT6blN0iBsE4YOE4ueXeqJNByJz
 2QiWCL5l6fU2twSAWrkkvsTD5bQ2UkdM3jIMwL11TaLCsvZw9QPcctGWWFx1VaMtA9OWnIgTzX
 EHaxAaTXlQAFwLciPpk6ZPAtJNRcYo1tOsd1GlX0CHpubDhfI4kGd2CmRg3RH0sC6790CdxFKI
 qy4=
X-IronPort-AV: E=Sophos;i="5.68,274,1569308400"; d="scan'208";a="55495022"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2019 01:33:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 6 Nov 2019 01:33:53 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 6 Nov 2019 01:33:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMoI8I/cSSe/aT+HqAPjngFXAOekhW8FxveQCClnDjjEwoG17b97Q+CuY1k7CRWauWkExjlM3CUoM2WTN+lkmVubV4MHpBwkymBSCPvr0tfmzz4+X3rS/JnyREWxUH48PKikV/L6Qn8hu9AYUwMVBn3U9/xpxyHEmn3yPlQWPFh77g8UXbtpdPITrEn8VmhEEtvwBSylqbUpXWFqVgOOQGG8LVFUVJwIMqf8tmiuIZhoE0RZB/Se7BzEvTWDCENBB7rYApKsXA0a3EM07UI3hc5SAby9Cmosvz8ESFPijKtfqfq7o3F3w+cbXfCPMgqNy3+9A0vSsIn4Taa4e5Yulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIF9Ne94AxEoD+tNXW/YYqWjt4VWxqJz8KTlw5HzWQM=;
 b=ePC5d4BT2VrgGc8qX7GFac7B9cm0pu47gr3MINVOh5Y2x3NMUpAH6ZZ4qN3BNrSE3dWAg6Y848T4e5p4L4ZK48pV3pqTSiLRfCnN8vH/S0wTjvg4C5NdC8n7lJ3qvc162FurAjtialCoaKsQgTg/4MmZ8M/rZXcYBeNNuAtzamGJ7e717J3tZ4UDEXan7kzklWY2Fcbki0hzxLdwPFJFZ5rmI02DnVOoJdGL72OolzZMAb+uTRxAKcoi5qwQk/U9dBdkGZ3A1ntJlz436fnWVPl6hi4jPk38zgqfmmYQ5c05tmnqwrkb1k8tIUCozzKgfXQHlpHxwgcX19+DjbN1Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIF9Ne94AxEoD+tNXW/YYqWjt4VWxqJz8KTlw5HzWQM=;
 b=MDEll9dwhXs/Jiwl3jFspybUivVJKMTiEwFJ9JRP/SzC21WPtyUeEbB72oYhaUSfEIXCSDTdLZ+jeRM+5SenJ+pw10zla6Qg+Ul57CWM/wR35OBkiuUclKt6C/h9CCpWfjcZWEWCwLn3vzVL6U1J+HEhA56YJ/B8cXU1DROSFko=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4063.namprd11.prod.outlook.com (10.255.180.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Wed, 6 Nov 2019 08:33:53 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.024; Wed, 6 Nov 2019
 08:33:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 13/20] mtd: spi-nor: Fix clearing of QE bit on
 lock()/unlock()
Thread-Topic: [PATCH v4 13/20] mtd: spi-nor: Fix clearing of QE bit on
 lock()/unlock()
Thread-Index: AQHVkW/+ecEbRc4nfkO7skTHWA7uQqd81AsAgAEC2gA=
Date: Wed, 6 Nov 2019 08:33:52 +0000
Message-ID: <af6fa950-495f-9e49-bcfe-09188e454b6d@microchip.com>
References: <20191102112316.20715-1-tudor.ambarus@microchip.com>
 <20191102112316.20715-14-tudor.ambarus@microchip.com>
 <14e9c474-1a92-b8be-12cf-56c7f6d0d696@ti.com>
In-Reply-To: <14e9c474-1a92-b8be-12cf-56c7f6d0d696@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0167.eurprd09.prod.outlook.com
 (2603:10a6:800:120::21) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ce2c41b-bb1f-48c0-538f-08d762940e08
x-ms-traffictypediagnostic: MN2PR11MB4063:
x-microsoft-antispam-prvs: <MN2PR11MB40636849779AE2A3DFCFD9C6F0790@MN2PR11MB4063.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(376002)(136003)(366004)(346002)(189003)(199004)(6512007)(7736002)(2906002)(4326008)(26005)(66066001)(53546011)(6436002)(36756003)(11346002)(476003)(6506007)(8676002)(386003)(81156014)(76176011)(52116002)(81166006)(186003)(66946007)(8936002)(66476007)(66556008)(102836004)(6486002)(229853002)(31696002)(316002)(86362001)(110136005)(54906003)(3846002)(6116002)(305945005)(2501003)(31686004)(64756008)(486006)(66446008)(99286004)(14454004)(14444005)(71190400001)(71200400001)(5660300002)(256004)(25786009)(6246003)(478600001)(2616005)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4063;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pRRqQharBTXXXtd9PlsM1J/OX9f0ZUe8NPt2stcRgD1Hb0ablJ5qdX+mzG3cDbKWey0yApRRp0LUYuvm7zbQzzS3ZAD7VUvMa8s39T+RUaL4dxWYCEj6uxczv2KQ/xqBJI3aq92xVl1ZyQX1MCEZPrx7yFo47iemJV3rqD7aYErmGkA7pENfdSriq+s32UWfd+mVspLMFO8MzqZNBmCQQx0yUqT0JuAVmun17P2JkHXpTPIsU2otIl8kieoB3Cgz6hkWvsYp69o/pE9nwylsrl9R2FXgIsNuq5ONl5YvsVxxIJqGGQqQMugOd0UCEWOI5J2ruplwfDzCOtO60eK7GUSsXaw85+z9cVrI+VG7whU84hCvhwy5xKUy62rY1WqYk4lPxT1eEybDY4OXXZFRXr+rF0EbZTwSo/dNNJLS3Ji2TlzGqKXTl6vE6f6Wxz89
x-ms-exchange-transport-forked: True
Content-ID: <83047FBCF1568C4ABD2AFE824BF8CFCE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce2c41b-bb1f-48c0-538f-08d762940e08
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 08:33:52.8691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R3w/DOWlinz7t9fzDhDG4OWXpIM4igYmNxr+7U1mBLFrSxvk9Y6qVlnvIjg2BDqu87zVo1rgidQJZNVIBfwPnoGhL7lgGfkJ3a66djKpt5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_003400_346687_5C96E2B7 
X-CRM114-Status: GOOD (  18.47  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/05/2019 07:07 PM, Vignesh Raghavendra wrote:
> On 02-Nov-19 4:53 PM, Tudor.Ambarus@microchip.com wrote:
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> Make sure that when doing a lock() or an unlock() operation we don't clear
>> the QE bit from Status Register 2.
>>
>> JESD216 revB or later offers information about the *default* Status
>> Register commands to use (see BFPT DWORDS[15], bits 22:20). In this
>> standard, Status Register 1 refers to the first data byte transferred on a
>> Read Status (05h) or Write Status (01h) command. Status register 2 refers
>> to the byte read using instruction 35h. Status register 2 is the second
>> byte transferred in a Write Status (01h) command.
>>
>> Industry naming and definitions of these Status Registers may differ.
>> The definitions are described in JESD216B, BFPT DWORDS[15], bits 22:20.
>> There are cases in which writing only one byte to the Status Register 1
>> has the side-effect of clearing Status Register 2 and implicitly the Quad
>> Enable bit. This side-effect is hit just by the
>> BFPT_DWORD15_QER_SR2_BIT1_BUGGY and BFPT_DWORD15_QER_SR2_BIT1 cases.
>>
> But I see that 1 byte SR1 write still happens as part of
> spi_nor_clear_sr_bp() until patch 20/20. So is this only a partial fix?

Fixing spi_nor_clear_sr_bp() would mean to add dead code that will be removed
anyway with patch 20/20. This patch fixes the clearing of the QE bit, while in
20/20 the QE bit is already zero when the one byte SR1 write is used, so the
quad mode is not affected. 20/20 fixes indirectly the clearing of all the bits
from SR2 but QE bit, because it's already zero. I would say it's not a partial
fix, but a different bug.

There are different angles to look at this, I chose the modifying of the quad
mode angle. Given the two arguments from above (avoid adding dead code and
changing of quad mode approach), I would prefer to keep things as they are. But
I get your approach too, so if you still want yours, I can do it. Please let me
know.

> Should this patch be rearranged to appear along with 20/20?

Not necessarily (different bugs) but I can bring 20/20 immediately after this
one if you want.

> 
> 
>> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 120 ++++++++++++++++++++++++++++++++++++++++--
>>  include/linux/mtd/spi-nor.h   |   3 ++
>>  2 files changed, 118 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 725dab241271..f96bc80c0ed1 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -959,12 +959,19 @@ static int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len)
>>  	return spi_nor_wait_till_ready(nor);
>>  }
>>  
> [...]
>> +/**
>>   * spi_nor_write_sr2() - Write the Status Register 2 using the
>>   * SPINOR_OP_WRSR2 (3eh) command.
>>   * @nor:	pointer to 'struct spi_nor'.
>> @@ -3634,19 +3723,38 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>  		break;
>>  
>>  	case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
>> +		/*
>> +		 * Writing only one byte to the Status Register has the
>> +		 * side-effect of clearing Status Register 2.
>> +		 */
>>  	case BFPT_DWORD15_QER_SR2_BIT1_NO_RD:
>> +		/*
>> +		 * Read Configuration Register (35h) instruction is not
>> +		 * supported.
>> +		 */
>> +		nor->flags |= SNOR_F_HAS_16BIT_SR | SNOR_F_NO_READ_CR;
> Since SNOR_F_HAS_16BIT_SR is set by default in
> spi_nor_info_init_params(), no need to set the flag here again
> 

I did this on purpose. I set SNOR_F_HAS_16BIT_SR here based on SFDP standard, I
want to indicate where the standard requires the 16 bit SR write .
spi_nor_info_init_params() initializes data based on info, but that data can be
overwritten (even with the same data) when parsing SFDP.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
