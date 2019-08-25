Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C876C3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 13:03:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C2DC2082F
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 13:03:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lndGJmYE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="QKyz1SJW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C2DC2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jgd364TWzv09PASS8ZBcet1W0Dygqku1smM4mwJx3SY=; b=lndGJmYEHO8PkU
	tklygxjT4ofTz3IVzIsXVED/T8PzuUdH2qrX2IEChwMJAu9s4XsE/jCw7j1OuD0zmq9CplcKirhdG
	FWys77TxDq+vmOCwl6t1xd6NZTU2Bpd1tpNMBJKer2pbD3yctWz/EHThouEFJgnUxzOZSV63xYjt7
	ZLy8LEoZ1QgjdnH3eWTk0YbtrFwZQlcGm7cGNT8YwzSF7cAcKsI4HSoT/fn700UGKJjLQ63OyvhHG
	iVtp/FDVKoXm0ebBuM3/bw0rgvjEcHCClUMqa7Y3YFpw7S3z6aWoKjRSBTmCJFNtwM+VpQPy2BQrq
	Q3guhk2Q/yAb7ALrbR8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1sAT-0002wg-Vd; Sun, 25 Aug 2019 13:02:50 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1sAQ-0002vn-Ju
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 13:02:48 +0000
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
IronPort-SDR: qNABGxpzW1qSci7SKBrZbKYsHhdYTfOnSoZtPf67LSYcyDxukLEtbhPf13eUPPaynO8m1g52cD
 i4yEEBU/t/CDsA7VkcQlag0qfR+Tr1GB8LeJ2GGan5VkxgFvvIl9OAUQqlzoN4dvewaBjH2AoG
 lso5WFPHyzaCuF0DrRT76gksijKOtkUYC+4wLE7EDRG2OeL/f8dmowcjlattbkK1goSKxau10H
 CpCSnWXJvkTX25sCOSd2PxKYooN/KAqAS9/aA04C84PSaWfGxlALbEbFYeUE8ew11HWizbu4PK
 X+c=
X-IronPort-AV: E=Sophos;i="5.64,429,1559545200"; d="scan'208";a="46445040"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Aug 2019 06:02:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 25 Aug 2019 06:02:40 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sun, 25 Aug 2019 06:02:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpanFxQl7KVq+wvQ/8ACpfDKfdOFC9LlGmE/Oy0QUvFNGWphYa8O4H9fz8rHpx3jN2InOmikVTQ5aFx3RG4gBkWESfN2n1CvB015lGzpc3pLr671lNyvf365+KzKUiN3v7WeR5L6uDX4etprQORa3rgFm12wk7Co/puUi/M4xQcr+SceQ0pTrmsR41q4ZWDaqO2ol8Ic2ZwfZcwCDkdBUr2ZHywzSUHS/Jq1kHTC3WbbJ2gx/pXps30OIR7uSlEmMFnzcGwZyTPDbTTDyE2pDSl4hlm6W7X2HObqma6bZu2qRoAPFcWr7EIesbnCJW8Nu0D+5aQPepLLoWekkCubIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFr1F7mbUWaSWcoNHTD0kdIRdPsGuFTEZ+Wmdv6fF/Y=;
 b=Pn6PT0EwKw4uPDmZYxTtVXyvlmsCiqjFH1KTtIzNipChXg/CJEhYgfJqoiWyTH5/y6ijUzLYjHOGR+TqFB8eE2eRFy8Gx21ZaKzSFgp3AmiSxuD21BpDauN68MpOKYJ/icBmhvbVxrUnqHnHJUbG4J3qvmjvl3Gq2kmSsk1sxjgH3ekdM/U9krhTR2ZiMcD8Cc05UY6gXK1RDYgJPTQzCq9Oo+EG0tzzWk/GIK9zQmnEjDshtnO8L7fqI2WaigwQdi1bJf1T/3VpTOujVSU6Nsl/9XD1csSyFlRstuHSQHR1DHfyE7CLuetS6xh8rxAhYgOOzPUusFWirlNmvLtciA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFr1F7mbUWaSWcoNHTD0kdIRdPsGuFTEZ+Wmdv6fF/Y=;
 b=QKyz1SJWGLNpFHFSpQreRbeR2KX9YqGnsAFh2zzfkksKiNVVdQYYDTCc61CJ1VsGttpqJyHPhQTvsXXViI1JZWTi5iWPPlTD+Gs3EXwHUn+i21NW8PF+r7Ja4E6IWOzkeqe0YaIIg9hcJjiIhXQrIy6tDsihxV2yyO8UpffcFRM=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3549.namprd11.prod.outlook.com (20.178.250.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.19; Sun, 25 Aug 2019 13:02:39 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Sun, 25 Aug 2019
 13:02:39 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH 0/5] mtd: spi-nor: move manuf out of the core - batch 0
Thread-Topic: [PATCH 0/5] mtd: spi-nor: move manuf out of the core - batch 0
Thread-Index: AQHVWcrqkdBlY7ZNLEeSbvjl5RDoUqcLv8GAgAAXXwA=
Date: Sun, 25 Aug 2019 13:02:38 +0000
Message-ID: <6098471f-ab8a-4887-7065-2d2266492ee8@microchip.com>
References: <20190823155325.13459-1-tudor.ambarus@microchip.com>
 <20190825133853.32532641@collabora.com>
In-Reply-To: <20190825133853.32532641@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0304.eurprd07.prod.outlook.com
 (2603:10a6:800:130::32) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.53.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e65b71b2-372d-4b71-0f88-08d7295c81c8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3549; 
x-ms-traffictypediagnostic: MN2PR11MB3549:
x-microsoft-antispam-prvs: <MN2PR11MB35492DA34F9DDE0580AFFFD0F0A60@MN2PR11MB3549.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-forefront-prvs: 01401330D1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(376002)(396003)(366004)(39850400004)(199004)(189003)(316002)(6246003)(54906003)(6512007)(446003)(31686004)(25786009)(476003)(2616005)(53936002)(486006)(11346002)(6486002)(4326008)(2906002)(76176011)(99286004)(229853002)(6436002)(71200400001)(71190400001)(31696002)(52116002)(86362001)(305945005)(14454004)(256004)(14444005)(66066001)(66476007)(66556008)(64756008)(66446008)(6916009)(66946007)(3846002)(6116002)(53546011)(6506007)(386003)(102836004)(26005)(186003)(8936002)(36756003)(8676002)(81166006)(81156014)(7736002)(478600001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3549;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lRgpjMT0aRfblOeWkx9uOd2FLVI1hg19H3h9vmJYMWrhVRuL85J1hfYmCROSOQuZCoCaCCifQ9mSCP2H6UMPjKlzm8lcwVbYO5UjPlVGtPJOsxyGpEVoTObQPVkjXXTsoI0plKU//rrA+ii7xxX7fW7UZyrZ0NMXtM5SYWxENBXnTIrU3zkZ6MtfTfvwU66X2nd1B8BWtrlYhRKELSt8AjRtEX7zQg8lnGafEmnTXS6t+tUynHB7xRTw6IJgUojwWu2FjywN347WFNLh0a7eHbKQBMae/DxI6F3mH8I6ddjsWkoCPmDN6Au3leH50ScSwEl7yisAOLo7Yj6s19tbd+oDpyXE6pDx9TEHopgW7unvmBr6ntLwb1l/w+/3vCcdZu4LeeA5UfVTE5/4Rr4kLj8kuX5qbkAAoIsoD3+HKfE=
x-ms-exchange-transport-forked: True
Content-ID: <781FEA68F19F6D4EB799DCD55D7C42CF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e65b71b2-372d-4b71-0f88-08d7295c81c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2019 13:02:38.9905 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wrRcPxwZHHUjoo9SzOboNL36NRKZ5lwnvuufo3XLQCYb2FSiWtmm3+JbOUpB4huO+xKRtEb/bo1KUkD3+fiGIuUF2MweyV3NTWYx7bCzuxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_060246_692944_945A028A 
X-CRM114-Status: GOOD (  13.47  )
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



On 08/25/2019 02:38 PM, Boris Brezillon wrote:
> External E-Mail
> 
> 
> On Fri, 23 Aug 2019 15:53:33 +0000
> <Tudor.Ambarus@microchip.com> wrote:
> 
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> This series is a prerequisite for the effort of moving the
>> manufacturer specific code out of the SPI NOR core.
>>
>> The scope is to move all [FLASH-SPECIFIC] parameters and settings
>> from 'struct spi_nor' to 'struct spi_nor_flash_parameter'. We will
>> have a clear separation between the SPI NOR layer and the flash
>> parameters and settings.
>>
>> 'struct spi_nor_flash_parameter' describes the hardware capabilities
>> and associated settings of the SPI NOR flash memory. It includes
>> legacy flash parameters and settings that can be overwritten by the
>> spi_nor_fixups hooks, or dynamically when parsing the JESD216
>> Serial Flash Discoverable Parameters (SFDP) tables. All SFDP params
>> and settings will fit inside 'struct spi_nor_flash_parameter'.
> 
> While we're at moving things around, I think it'd make sense to move
> all '[DRIVER SPECIFIC]' fields (which are actually SPI NOR controller
> driver specific fields) to a separate struct:
> 
> struct spi_nor_controller_ops {
> 	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
> 	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
> 	int (*read_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
> 	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
> 	ssize_t (*read)(struct spi_nor *nor, loff_t from,
> 			size_t len, u_char *read_buf);
> 	ssize_t (*write)(struct spi_nor *nor, loff_t to,
> 			size_t len, const u_char *write_buf);
> 	int (*erase)(struct spi_nor *nor, loff_t offs);
> };
> 
> struct spi_nor {
> ...
> 	const struct spi_nor_controller_ops *controller_ops;
> ...
> };

Yep, this is a good idea. I'll make a patch and add your Suggested-by tag.

Thanks!

> 
>>
>> Tested uniform and non-uniform erase on sst26vf064b flash using the
>> atmel-quadspi driver.
>>
>> In order to test this, you'll have to merge v5.3-rc5 in spi-nor/next.
>> This patch depends on
>> 'commit 834de5c1aa76 ("mtd: spi-nor: Fix the disabling of write protection at init")
>>
>> Tudor Ambarus (5):
>>   mtd: spi-nor: Regroup flash parameter and settings
>>   mtd: spi-nor: Use nor->params
>>   mtd: spi-nor: Drop quad_enable() from 'struct spi-nor'
>>   mtd: spi-nor: Move clear_sr_bp() to 'struct spi_nor_flash_parameter'
>>   mtd: spi-nor: Move erase_map to 'struct spi_nor_flash_parameter'
>>
>>  drivers/mtd/spi-nor/spi-nor.c | 236 ++++++++++++++++-----------------------
>>  include/linux/mtd/spi-nor.h   | 254 ++++++++++++++++++++++++++++--------------
>>  2 files changed, 269 insertions(+), 221 deletions(-)
>>
> 
> 
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
