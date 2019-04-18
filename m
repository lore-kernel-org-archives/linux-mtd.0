Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02882C10F14
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 14:11:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C74F321479
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 14:11:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HKSVgWTF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="iziCrLrw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C74F321479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzggpRQ8pLNFAyV/ADIABJEJ40MjuWReMs48XeoDIDE=; b=HKSVgWTF/QNJ24
	PIp8MhmrqFOWdaGMhhVE0ORXhzXdULpv7pjNyfPMiy3Q9sMS3fv+u/F4UKyiP0uNpkevPC/5ZG85O
	FPRhwihfKoVzz+AKzD9/Znk/R4+fjB6HAE/fT4FAIwHasYUTdKo0/QGwK57d0+AbzHb5fNLHaIbZt
	aJDhCIkNJ1TnfF9/XB1Qhr7e83vy3yFgHHVFGA/qJ5i0ZvH52ZZCpoWL2RwX10qxRm3flZeGEJHAH
	v9vv1qodgh8SH5IV52XbJXnwR/sGJ/0HHGGGGO02JtwB8XQjN7ByUVWmMNionDaLvGOQvAHumFhyv
	kq7LA571xCBslivCq1JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH7l3-0007RP-WB; Thu, 18 Apr 2019 14:11:22 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH7ky-0007QM-KI
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 14:11:20 +0000
X-IronPort-AV: E=Sophos;i="5.60,366,1549954800"; d="scan'208";a="30585053"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 18 Apr 2019 07:11:12 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.108) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Thu, 18 Apr 2019 07:11:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULA6uS9lZOs0fkNikHNemWvqx4GlEJUO/b1qAjZw+Ts=;
 b=iziCrLrwcyRsy+X5RpWgciTOzR6UmA0RJ/GX8elfeX/Yjdx3IBajm1bCmbK+kLFwuOjqQnI/ptoC2CRKInDWFCUe95Y0eLs+twdXRFNoNqNbevUvgJ+0Q4YVHNo/3drjKyl8s0qy31dnHa/2csZMbk0ZZBm3IDcqcxqxHnVGGL4=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1587.namprd11.prod.outlook.com (10.172.24.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Thu, 18 Apr 2019 14:11:10 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e4c0:24a5:9a32:46e3]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e4c0:24a5:9a32:46e3%9]) with mapi id 15.20.1792.018; Thu, 18 Apr 2019
 14:11:10 +0000
From: <Tudor.Ambarus@microchip.com>
To: <nagasure@xilinx.com>, <liu.xiang6@zte.com.cn>, <vigneshr@ti.com>
Subject: Re: 4-Byte addressing issue with IS25WP256D nor flash
Thread-Topic: 4-Byte addressing issue with IS25WP256D nor flash
Thread-Index: AdTZgzps1dokp2Q3SSmhxyFZkToq1ADyQRIAAEN81xAF5ZbtAA==
Date: Thu, 18 Apr 2019 14:11:10 +0000
Message-ID: <dd6cc84d-7dc3-af55-9177-7930544f0dcf@microchip.com>
References: <MWHPR02MB2623388725B13BB7B133B98BAF4A0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <e1e2f867-8a28-c74b-7f01-5f798e37c81d@microchip.com>
 <MWHPR02MB2623D039832785A980B3B8EFAF400@MWHPR02MB2623.namprd02.prod.outlook.com>
In-Reply-To: <MWHPR02MB2623D039832785A980B3B8EFAF400@MWHPR02MB2623.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0089.eurprd04.prod.outlook.com
 (2603:10a6:803:64::24) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 540e8173-ff39-4c76-77c4-08d6c407b524
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR11MB1587; 
x-ms-traffictypediagnostic: BN6PR11MB1587:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BN6PR11MB1587D3BA51D0A051B92909CCF0260@BN6PR11MB1587.namprd11.prod.outlook.com>
x-forefront-prvs: 0011612A55
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(136003)(366004)(346002)(39860400002)(189003)(199004)(13464003)(316002)(8936002)(31696002)(186003)(14444005)(256004)(2201001)(99286004)(53546011)(386003)(26005)(81156014)(3846002)(486006)(2616005)(476003)(8676002)(6506007)(11346002)(102836004)(71200400001)(71190400001)(81166006)(86362001)(6116002)(2906002)(97736004)(76176011)(446003)(6486002)(4326008)(52116002)(5660300002)(6246003)(7416002)(229853002)(31686004)(36756003)(478600001)(25786009)(14454004)(6436002)(6512007)(72206003)(6306002)(54906003)(110136005)(53936002)(305945005)(66066001)(68736007)(966005)(2501003)(7736002)(505234006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1587;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d2BdIhDEZa5ZcH+7YkCy9Ewo9SGokYRs6gHzSNr3+MKY78p6HKXUDmVtr6Xcj+SxiF2FKCvcwxtnx/irtwJVTClIx6DBg4NalcNRqeF7bdzJMUcWcFyen04rcSYOuePvxumMgHYlriqlmzZ+ByHU/oPpOrUHAuFK+Mk3W1rmWRAidk3UnJQO3lH+elBwgQn4fns9Y3DnECOwni8/GzRKniyTNe0ACXd7DfdMuQrMub3kVFvOA69OkxXOVB6opVsnBUw+AzLkRqXu6puMYCnWCrjPWxYofWmclp3x0/a9xqxgJMYDWt+vzCZPCZoqDZeHT0UMlTnQ2nN04AQBHT0lxVCbZ9pNPfuS5p6xg7trviQrfPPboSPy5JYawcqc5zs+hYbfzROboC3ljdrvVVHoftWk8mb6m/r7U6wL7hIKPa8=
Content-ID: <411DC5CF29459A49976FEDCFCF984DA6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 540e8173-ff39-4c76-77c4-08d6c407b524
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2019 14:11:10.5928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1587
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_071116_888468_85D54BFC 
X-CRM114-Status: GOOD (  19.79  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, marek.vasut@gmail.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, nagasuresh12@gmail.com, michals@xilinx.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Naga,

On 03/19/2019 03:57 PM, Naga Sureshkumar Relli wrote:
> *External E-Mail*
> =

> *
> *
> =

> Hi Tudor,
> =

> =A0
> =

>> -----Original Message-----
> =

>> From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>
> =

>> Sent: Monday, March 18, 2019 11:05 AM
> =

>> To: Naga Sureshkumar Relli <nagasure@xilinx.com>; bbrezillon@kernel.org;
> =

>> broonie@kernel.org
> =

>> Cc: richard@nod.at; linux-kernel@vger.kernel.org; linux-spi@vger.kernel.=
org;
> =

>> marek.vasut@gmail.com; linux-mtd@lists.infradead.org; nagasuresh12@gmail=
.com;
> =

>> dwmw2@infradead.org; Michal Simek <michals@xilinx.com>; liu.xiang6@zte.c=
om.cn
> =

>> Subject: Re: 4-Byte addressing issue with IS25WP256D nor flash
> =

>>
> =

>> Hi, Naga,
> =

>>
> =

>> On 03/13/2019 12:30 PM, Naga Sureshkumar Relli wrote:
> =

>> > Hi,
> =

>> >
> =

>> >
> =

>> >
> =

>> > Currently I am facing an issue with is25wp256d part.
> =

>> >
> =

>> >=A0 1. With u-boot the data integrity is working(erase, write, read and=
 verify)
> =

>> >=A0=A0=A0=A0 with out any issues
> =

>> >=A0 2. Don=92t probe the qspi at u-boot, and boot Linux and do data int=
egrity
> =

>> >=A0=A0=A0=A0 (erase, write, read and verify) =A0and verification done s=
uccessfully.
> =

>> >=A0 3. At u-boot, do sf probe and after booting Linux, check for data
> =

>> > integrity
> =

>> >
> =

>> > =A0=A0=A0=A0=A0 (erase, write, read and verify) and verify is failing.
> =

>> >
> =

>> > And here are my observations.
> =

>> >
> =

>> > When we do sf probe at u-boot, as per the device size, u-boot is
> =

>> > changing
> =

>> >
> =

>> > The flash device addressing mode from 3 byte to 4 byte
> =

>> >
> =

>> >
> =

>> >
> =

>> > But Linux spi-nor frame work is using 3 byte commands with 3 Byte
> =

>> > addressing(because
> =

>> >
> =

>> > Of wrong sfdp information from the is25wp256d part). Hence data verifi=
cation is failing.
> =

>> >
> =

>> > i.e. sfdp information is saying that it supports only 3-Byte addressin=
g.
> =

>> >
> =

>> > that means, sfdp table for is25wp256d is wrong.
> =

>> >
> =

>>
> =

>> I couldn't find the sfdp table described in the datasheet. I would like =
to check if bfpt is not
> =

>> entirely wrong. Can you please hexdump the entire sfdp table?
> =

> sfdp header:
> =

> 0x53, 0x46, 0x44, 0x50,
SFDP Header: 1st DWORD

>0x6, 0x1,0x1, 0xff,
SFDP Header: 2nd DWORD
Number of Parameter Headers (NPH)=3D2

>0x0, 0x6, 0x1, 0x10,
JEDEC Flash Parameter Header: 1st DWORD
Parameter Table length: 0x10

>0x30, 0x0, 0x0, 0xff
JEDEC Flash Parameter Header: 2nd DWORD
Parameter Table Pointer

> =A0
> =

> Parameter table header
> =

> 0x9d, 0x5, 0x1, 0x3, 0x80, 0x0, 0x0, 0x2

is this a vendor table?

> Parameter Table data:
> =

dword[1]:
> 0xe5, 0x20, *0xf9*, 0xff,

indeed, A18:A17 is 00b, 3-byte only addressing. A18:A17 should have been of
value 01b.

dword[2]:
> 0xff, 0xff, 0xff, 0xf,
dword[3]:
> 0x44, 0xeb, 0x8, 0x6b,
dword[4]:
>  0x8, 0x3b, 0x80, 0xbb,
dword[5]:
> 0xfe, 0xff, 0xff, 0xff,
dword[6]:
> 0xff, 0xff,  0x0, 0xff,
dword[7]:
> 0xff, 0xff, 0x44, 0xeb,dword[8]:
>  0xc, 0x20,  0xf, 0x52,
   ^4KB erase  ^32KB erase
dword[9]:
> 0x10, 0xd8,  0x0, 0xff,
   ^64KB erase
dword[10]:
> 0x23, 0x4a, 0xc9, 0x0,
dword[11]:
> 0x82, 0xd8, 0x11, 0xce,
dword[12]:
> 0xcc, 0xcd, 0x68, 0x46,
dword[13]:
> 0x7a, 0x75, 0x7a, 0x75,
dword[14]:
> 0xf7, 0xae, 0xd5, 0x5c,
dword[15]:
> 0x4a, 0x42, 0x2c, 0xff,
dword[16]:
> 0xf0, 0x30, 0xf2, 0xa9
                     ^ xx1x_xxxxb is set, and confirms that the flash suppo=
rts
dedicated 4-Byte address instruction set.

BFPT looks sane, with the exception of the 3-byte only addressing.

You have the same problem as Liu. Check Liu's patch at
https://patchwork.ozlabs.org/patch/1071453/. Ideally would be to know if th=
ese 2
parts are the only ones that have this bug or if there are more. Can you co=
ntact
ISSI and ask them which parts are affected? If ISSI will not respond in a
reasonable amount of time, we can update Liu's patch to have a single post_=
bfpt
function that checks if the flash id corresponds to IS25(WP/LP)256D before
setting addr_width to 4.

Cheers,
ta

>> > Here are the steps that I am running.
> =

>> >
> =

>> > Write data using u-boot =A0like below
> =

>> >
> =

>> > 1. sf probe 0 0 0
> =

>> >
> =

>> > 2. mw.b 0x100000 11 0x100
> =

>> >
> =

>> > 3. sf write 0x100000 0x0 0x100
> =

>> >
> =

>> > 4. sf read 0x200000 0x0 0x100
> =

>> >
> =

>> > 5. md.b 0x200000 0x100
> =

>> >
> =

>> > 00200000: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ...=
.............
> =

>> >
> =

>> > 00200010: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ...=
.............
> =

>> >
> =

>> > 00200020: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ...=
.............
> =

>> >
> =

>> > 00200030: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ...=
.............
> =

>> >
> =

>> > 00200040: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ...=
.............
> =

>> >
> =

>> > 00200050: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ...=
.............
> =

>> >
> =

>> > 00200060: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ...=
.............
> =

>> >
> =

>> > 00200070: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ...=
.............
> =

>> >
> =

>> > 00200080: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ...=
.............
> =

>> >
> =

>> > 00200090: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ...=
.............
> =

>> >
> =

>> > 002000a0: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ...=
.............
> =

>> >
> =

>> > 002000b0: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ...=
.............
> =

>> >
> =

>> > 002000c0: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ...=
.............
> =

>> >
> =

>> > 002000d0: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ...=
.............
> =

>> >
> =

>> > 002000e0: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ...=
.............
> =

>> >
> =

>> > 002000f0: 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11=A0=A0=A0 ...=
.............
> =

>> >
> =

>> > And in Linux just try reading the data,
> =

>> >
> =

>> > root# mtd_debug read /dev/mtd0 0x0 0x100 test.bin
> =

>> >
> =

>> > root#hexdump -C -n 50 test.bin
> =

>> >
> =

>> > 0000000 ffff ffff =A01111 1111 1111 1111 1111 1111
> =

>> >
> =

>> > 0000010 1111 1111 1111 1111 1111 1111 1111
> =

>> >
> =

>> > *
> =

>> >
> =

>> > 0000100
> =

>> >
> =

>> >
> =

>> >
> =

>> > I did the below change in spi-nor.c
> =

>> >
> =

>> > iff --git a/drivers/mtd/spi-nor/spi-nor.c
> =

>> > b/drivers/mtd/spi-nor/spi-nor.c
> =

>> >
> =

>> > index 4216ce0..f8603ff 100644
> =

>> >
> =

>> > --- a/drivers/mtd/spi-nor/spi-nor.c
> =

>> >
> =

>> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> =

>> >
> =

>> > @@ -2890,6 +2890,11 @@ static int spi_nor_init_params(struct spi_nor
> =

>> > *nor,
> =

>> >
> =

>> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
nor->addr_width =3D 0;
> =

>> >
> =

>> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
nor->mtd.erasesize =3D 0;
> =

>> >
> =

>> > =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0} else {
> =

>> >
> =

>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if=
 ((JEDEC_MFR(info) =3D=3D SNOR_MFR_ISSI) &&
> =

>> Does all issi flashes have this problem?
> =

> No.
> =

>>
> =

>> >
> =

>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 params->size >=A0 OFFSET_16_MB) {
> =

>> >
> =

>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 nor->addr_width =3D 4;
> =

>> >
> =

>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 set_4byte(nor, info, 1);
> =

>> >
> =

>> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> =

>> >
> =

>> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
memcpy(params, &sfdp_params, sizeof(*params));
> =

>> >
> =

>> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> =

>> >
> =

>> > =A0=A0=A0=A0=A0=A0=A0 }
> =

>> >
> =

>> > Any further suggestions?
> =

>>
> =

>> We should implement this as a post_bfpt fixup hook.
> =

> Ok
> =

>>
> =

>> >
> =

>> > I have gone through https://lkml.org/lkml/2018/11/14/599.
> =

>> >
> =

>> > But I didn=92t see any further mails after that.
> =

>>
> =

>> Sorry, I forgot about it :(
> =

> No problem and thanks for asking more information.
> =

> =A0
> =

> Thanks,
> =

> Naga Sureshkumar Relli
> =

>>
> =

>> Cheers,
> =

>> ta
> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
