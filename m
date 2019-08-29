Return-Path: <SRS0=8wrd=WZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A77C3A59F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 08:09:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55535215EA
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 08:09:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eywYF/xi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="EJOKJ4s8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55535215EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ps449K9VngUVHpI8uK7zBeg6PhKrPuTNFhhoBZ+lQN0=; b=eywYF/xivApaLc
	0NAiSdiWKo82kItO3vodatRSNPbaOv5UJpAnrGEWQHTO7LOFkN/iHWQ05AxVBn4Hq/U9RQhHpSDtC
	W7mSeFUVYL68vjTwe0vETZJuvcGsrn3ptAnbr+F74dCl8ZD9PiCbQIXnZKTRCtcmfbXHsGRJqQwY5
	3W2GsEd8tRElhsLM9Fm+BOBmyKJgItQI7PEa2LqvMQIOUEa4Lt9O25siOGGKrwaOz2GaCKSeY8IPo
	KWGCUZK7ZY+vcDl3rkSKj05Q/DQ5eqWZdrEi0h/T+GPyH/K2p03nTWJD55jd5XFcX2rvE4Yf0/kF9
	j1wX1tLOBrWY2ArfPlNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3FUq-00089s-FY; Thu, 29 Aug 2019 08:09:32 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3FUm-000899-2r
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2019 08:09:30 +0000
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
IronPort-SDR: aBiHHtAF0SXHRnOFZ3EupBhemLMeoLdiXr7DBUg2LJu6MLUN7wzuJeMj/Iwhs+6BNAxgIe8i1Y
 DJhKkxIrDC3HJlpdLQcllYLmi6mrQ3IUhLdpXHXeEuyFE1VTpGupqy1aLm+sLOtnyFU45/FHQv
 KavkaUdbDPGg/GizdiuHUS9eE5QG1YpUCHkD9FQfDXaiRtV4ibxeYxXauwD3kHLuuk8qRmN6dJ
 7aYSAY5pT4Mr+tTEbPNigrPgn4df+ahzW/B6iWicRprPtQUSTJ5lFEJtL4XL8hKWch/xN6+VVM
 Y5A=
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; d="scan'208";a="47067660"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Aug 2019 01:09:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 29 Aug 2019 01:09:19 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 29 Aug 2019 01:09:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CX+NTksMmLIcNHemPFrmiitIeVyk66egBillShGSonG6MRTIjrnevpKVL/n/qf6kE8rD42jn46PDCyc+FQhZpy9USv1giXy6iwru4zgNRz2LemONgojq2gaoIp2G1FUkh04NLMyo3fZD9OsN32Sw3XblHPl+fAkicMGHSQCHScL8D/zRdG9bGH+AlzB2bnlg9gTivndxs2UPsk9+V0eiEe2aCIj063pTUbVutQQUdtL3v98gzH8y2XzCitKCxjPMc4MFl/4Ix8Uky/xn0nQscnj8l8PhR0SsmyaYhNqgxea3TENuGP/k0Xyy/+SFwBcHI4mywxwd5CFtKm0xVBIk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ES/DJARpdwOfq1ShRnlX/u+RkquoAkF73ASGWfqpzdg=;
 b=Kg6AP5ApzOM3JAYOAPmj2wu6PqcLEVaaJn68TPRz2oNjpxlKpj7JTAlFFF8ntW7lOeAweiIwc8OQOkPpgCqkUUK2IzNuNUZh7y7H8hSCTZoYMmxrLxsrfibIxD5F8Gi9tl1VpRPp+cBKfUX/4SAmxE8ajtEsuHxEB+HfClZNIPxsMA35ir22RbdBCsez9cUUuFt7sPTA9btDkh7y98yJKhVgn8xilhyVuLM8BsvEARyJX9C7QglAYvP1v1cNKh/scQSruYIJF6IxnOIxIqIc+NPnJ2FKzzDnp3PP0AN2YyT9IDeBr0rjCcJ7Moq7fksUtI3R1cVgn55Oui1IYO2gAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ES/DJARpdwOfq1ShRnlX/u+RkquoAkF73ASGWfqpzdg=;
 b=EJOKJ4s8mpdPjE33GmyVqfsmHtqUgEKEjazPNFuwYkVKGpFY7RQc62TWTaEmvJh4Seybvt8v4ZOJeiNThLI6D7G1DTef9AwUIiz9ezobm+WQ3PGR2QCOcfRp894XIxWMvEBO6VBXtRjQihs4jGWvG8m62a73QvZWp1jrhdq/llM=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4352.namprd11.prod.outlook.com (52.135.38.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 08:09:18 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 08:09:18 +0000
From: <Tudor.Ambarus@microchip.com>
To: <ashish.kumar@nxp.com>, <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>, 
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [EXT] Re: [Patch v3] drivers: mtd: spi-nor: Add flash property
 for mt25qu512a and mt35xu02g
Thread-Topic: [EXT] Re: [Patch v3] drivers: mtd: spi-nor: Add flash property
 for mt25qu512a and mt35xu02g
Thread-Index: AQHVUcNYVX8MlxJF80625T3aIY1jHqcO+5qAgALc5gCAAAYCAA==
Date: Thu, 29 Aug 2019 08:09:17 +0000
Message-ID: <a5049dca-e00e-ca28-7853-526ec7eac281@microchip.com>
References: <1565692705-27749-1-git-send-email-Ashish.Kumar@nxp.com>
 <e55cd1f9-7359-5484-d258-1f3ea51584b6@microchip.com>
 <VI1PR04MB4015E5BA7BE9763A105AD47D95A20@VI1PR04MB4015.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB4015E5BA7BE9763A105AD47D95A20@VI1PR04MB4015.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0701CA0044.eurprd07.prod.outlook.com
 (2603:10a6:800:90::30) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abe8cb2d-2c6c-418d-e009-08d72c583084
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4352; 
x-ms-traffictypediagnostic: MN2PR11MB4352:
x-microsoft-antispam-prvs: <MN2PR11MB4352799C7D62E78CB4B31DDCF0A20@MN2PR11MB4352.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(39860400002)(376002)(366004)(396003)(13464003)(189003)(199004)(76176011)(386003)(6506007)(53546011)(102836004)(2501003)(7416002)(11346002)(66946007)(476003)(2616005)(66476007)(186003)(66556008)(66446008)(64756008)(446003)(26005)(5660300002)(14444005)(7736002)(2906002)(229853002)(256004)(36756003)(305945005)(14454004)(86362001)(71190400001)(31696002)(71200400001)(3846002)(6116002)(6246003)(66066001)(31686004)(54906003)(81166006)(81156014)(8676002)(8936002)(316002)(110136005)(486006)(478600001)(53936002)(6512007)(4326008)(25786009)(52116002)(99286004)(2201001)(6436002)(6486002)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4352;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vYEUPQtT2OngswJWNy0e2UYIuCV84zBLMjMqs/ySh+rQFBQOJe2L7suy18+TPAILOq4BLiutuV7a/XTKUT+V8yd5uLc9qEY5qoTqA1At3B13nMvqguERrEe9luvsvMXZo3F8CFuKy8VefdA6e3aN0ADWxjcDI8oz9cQ4s4wdnWfHHDIE7qlzVqHHCZh+FsWPQwf34B/6ziR/KIn6mleIDtSVdS/GmhZ1UFEzJzBoaNLO1H8APU578apyhl3Zyff2z0yBUdbeln4zkbOmCMF5NbH7vDxtAykjsqbCHKpqgossjTEYzdh5BL8yoLpiLkapPXfPPI02xjoQ6Esp/Oy+ck6zhpudfJsE70K277WLFFf6KmwtXVtfypD8zpy/yAC4GXLlrarPl+cWM3hkXfhY4u3uXCBHQs7TnW1mr9l3t9o=
x-ms-exchange-transport-forked: True
Content-ID: <45D04FD31922344C9A51C5D83810FB83@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: abe8cb2d-2c6c-418d-e009-08d72c583084
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 08:09:18.0322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9HeVVRK3OBELr0eJiogruQ2Tc6zGPYQdaZY4UOgKLeSydjxtbFDjv62e1atLXnB4c2cWT7jJgLPmqQN3qviF5ECUbE+GCSgdbWVCOzExS1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_010928_241815_594D2B02 
X-CRM114-Status: GOOD (  16.05  )
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
Cc: kuldeep.singh@nxp.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/29/2019 10:47 AM, Ashish Kumar wrote:
> External E-Mail
> 
> 
> 
>> -----Original Message-----
>> From: linux-mtd <linux-mtd-bounces@lists.infradead.org> On Behalf Of
>> Tudor.Ambarus@microchip.com
>> Sent: Tuesday, August 27, 2019 5:34 PM
>> To: Ashish Kumar <ashish.kumar@nxp.com>; marek.vasut@gmail.com;
>> dwmw2@infradead.org; computersforpeace@gmail.com;
>> miquel.raynal@bootlin.com; richard@nod.at; vigneshr@ti.com; linux-
>> mtd@lists.infradead.org
>> Cc: Kuldeep Singh <kuldeep.singh@nxp.com>; linux-kernel@vger.kernel.org
>> Subject: [EXT] Re: [Patch v3] drivers: mtd: spi-nor: Add flash property for
>> mt25qu512a and mt35xu02g
>>
>> Caution: EXT Email
>>
>> Hi, Ashish,
>>
>> On 08/13/2019 01:38 PM, Ashish Kumar wrote:
>>> External E-Mail
>>>
>>>
>>> mt25qu512a is rebranded after its spinoff from STM, so it is different
>>> only in term of operating frequency, initial JEDEC id is same as that
>>> of n25q512a. In order to avoid any confussion with respect to name new
>>> entry is added.
>>> This flash is tested for Single I/O and QUAD I/O mode on LS1046FRWY.
>>>
>>> mt35xu02g is Octal flash supporting Single I/O and QCTAL I/O and it
>>> has been tested on LS1028ARDB
>>>
>>> Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
>>> Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
>>> ---

cut

>>> +
>>> +     /* Micron */
>>> +     { "mt25qu512a", INFO6(0x20bb20, 0x104400, 64 * 1024, 1024, SECT_4K |
>>> +                             USE_FSR | SPI_NOR_DUAL_READ |
>>> +                             SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES)
>>> + },
>>
>> I'm looking at the following datasheets: mt25qu512a [1] and n25q512a [2].
>> Both flashes have the same Extended Device ID data. What will happen, is
>> that you'll always hit the first valid entry, so "mt25qu512a", and you'll indicate
>> a 'wrong' flash name for n25q512a. If there is nothing that differentiate
>> between the two, maybe you can add a comment in the code that says that
>> "n25q512a" was re-branded to "mt25qu512a" after the STM spin-off.
>> Whatever solution will be, it will be better if you do it in a separate patch.
> Hi Tudor,
> Considering both are same, should I rename to mt25qu51a, and add SPI_NOR_4B_OPCODES or
> Keep n25q512a, and comment about mt25qu51a  and add SPI_NOR_4B_OPCODES.

I see two options:
1/ either rename "n25q512a" to "mt25qu512a (n25q512a)" and add the
SPI_NOR_4B_OPCODES
2/ or keep "n25q512a", add SPI_NOR_4B_OPCODES, and add a comment about
re-branding to mt25qu512a.

Which one do you like better? What about you, Vignesh?

> 
> For separate patch comment you mean split mt25qu512a and mt35xu02g into 2 patch.

yes, send a separate patch for mt35xu02g, as the changes are not related.
> 
>>

cut

>>> +     { "mt35xu02g",  INFO(0x2c5b1c, 0, 128 * 1024, 2048,
>>> +                     SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
>>> +                     SPI_NOR_4B_OPCODES) },
>>
>> Is there a public datasheet for this flash?
> No,  data sheet in under NDA, I have asked micron FAE for public data sheet, will resend after the same is published. 
> 

No need to wait, I'll trust you. It was better if I could verify the info, but
if we can't, that's it. Just send a different patch for this change.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
