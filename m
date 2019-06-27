Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BD6C48BD7
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 11:38:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECC88204FD
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 11:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jJ4BZuf1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aampusa.onmicrosoft.com header.i=@aampusa.onmicrosoft.com header.b="eRQhDAIv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECC88204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aampglobal.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ponrwgRu55EW9eawxzOJFMZjMWqgT5bvBK4dB7SaXo8=; b=jJ4BZuf1eMYcZ7
	wG6Q22ep3Dg9zi5I570Ty112HdUz+R269ejuoG0OHFkU8nsaO/01BMid0BBz0HyZGCrTNO+GaeSDx
	nMhdel3JAAbQev5Phuf4z5xAmowfJ5/SDYrR3LCICIm4OC7G3O9a+zYJa/K5loTW1hJ1CWvFNQErI
	jC6rUlVR9YyQzN5ez9OKeLjkEXoN681ZmP7HAuv0MEv/O99+tvwvgFV92PmguoqjuLfPJezURGwNt
	SWkG36NuLlbUvwDY7b+/cLl00OOTOxqIn2VIoOanVGFZcZ+3dqjJbLt2jelVJAdUdyPGWM25YM/VB
	sZm2uhGzKQJfk+WrcNxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgSii-0007ug-37; Thu, 27 Jun 2019 11:37:40 +0000
Received: from mail-eopbgr740117.outbound.protection.outlook.com
 ([40.107.74.117] helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgSie-0007tu-JN
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2019 11:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aampusa.onmicrosoft.com; s=selector2-aampusa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFg+pNvjOnb0XfKsRW/he5LiYk4B14XRfxsEbhOqGRk=;
 b=eRQhDAIvt3SDuUWsB3nu5ZPMxG1wsd+HS8Ksx3gCKh4DRuxueQnlVIMiK7zpLO7+FFHdfrA8DpHPm9+q9UunDZx0xhXrQGWu7obbI2k6832N4yFzvhusijMr+CtOlMQ4EHLsFtTD1UPo6G0JPNIrZvs+QYhJ+GQKPus7IJs3944=
Received: from BL0PR07MB4115.namprd07.prod.outlook.com (52.132.10.149) by
 BL0PR07MB5009.namprd07.prod.outlook.com (10.167.180.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.17; Thu, 27 Jun 2019 11:37:33 +0000
Received: from BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::3105:a46:15ae:dc1d]) by BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::3105:a46:15ae:dc1d%7]) with mapi id 15.20.2008.017; Thu, 27 Jun 2019
 11:37:33 +0000
From: Ken Sloat <KSloat@aampglobal.com>
To: "hs@denx.de" <hs@denx.de>
Subject: RE: [U-Boot] [nand] [ubi] Discrepancy Between U-Boot and Linux NAND
 PEBs
Thread-Topic: [U-Boot] [nand] [ubi] Discrepancy Between U-Boot and Linux NAND
 PEBs
Thread-Index: AdUnZzM3sibvyNx6QX2i4/puOAuHIwC+PBkAAJ8NRGA=
Date: Thu, 27 Jun 2019 11:37:32 +0000
Message-ID: <BL0PR07MB41152FC4A4F24C1C6F3BDABDADFD0@BL0PR07MB4115.namprd07.prod.outlook.com>
References: <BL0PR07MB411523A25B85713C637090D3ADE40@BL0PR07MB4115.namprd07.prod.outlook.com>
 <9948b558-05fb-fa6b-ef67-ef702edcf319@denx.de>
In-Reply-To: <9948b558-05fb-fa6b-ef67-ef702edcf319@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=KSloat@aampglobal.com; 
x-originating-ip: [100.3.71.115]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cafe8074-d2da-4c83-92f9-08d6faf3d84c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BL0PR07MB5009; 
x-ms-traffictypediagnostic: BL0PR07MB5009:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BL0PR07MB50099117D2FBAD0B8D40D18FADFD0@BL0PR07MB5009.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:341;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39850400004)(396003)(136003)(346002)(376002)(199004)(189003)(53754006)(51914003)(13464003)(55674003)(99286004)(6116002)(3846002)(256004)(7696005)(72206003)(316002)(76176011)(966005)(33656002)(14454004)(102836004)(14444005)(6916009)(80792005)(54906003)(66066001)(5024004)(7736002)(2501003)(8676002)(8936002)(81156014)(71190400001)(9686003)(71200400001)(26005)(74316002)(1730700003)(81166006)(478600001)(446003)(6436002)(68736007)(4326008)(486006)(6306002)(66946007)(11346002)(2906002)(25786009)(86362001)(53546011)(2351001)(6506007)(186003)(229853002)(52536014)(305945005)(76116006)(5640700003)(6246003)(73956011)(64756008)(66556008)(66446008)(66476007)(53936002)(5660300002)(55016002)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR07MB5009;
 H:BL0PR07MB4115.namprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: aampglobal.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kSK8alCyhjZqMcZMkR8FGGGKgMNhB0Vk2wSdmPuKU/X3DkRsX6W1XDvNFO+FsxXJo0D1IaGSxsjGymfttq1mBLmZ3rnfQYNVK3F85saZB4TbfAwU6QjEGPMzHpEhRV0gYWeZFrTlXdurxM0kr8Uobv9j9a6KbUMJnG1O2jbO5E4jzPA0b8EFOdHaHUFHlTErTwLdDzs0LQoRuvUexDfuMt9l1WtbSjGj9nK8hzxiTVNmuxcW9RjA/HXsrieAfT+YZZHedkegC+31iw7Och5nSOHNkPrWn5xQ/27xF+msz4VFsxbSNS4P7OJZCa0jazuLWD40BPVuUdhOK4AHvC9Dd+Wo8H+jqlEROWcwYqvY7qW3zaK8Dx8PORjsceTQcYwK+s1P8LxV2L0wcpeHYrz7W6DpW8NDZnnGBaVYXMgIPts=
MIME-Version: 1.0
X-OriginatorOrg: aampglobal.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cafe8074-d2da-4c83-92f9-08d6faf3d84c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 11:37:33.1228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e20e3a66-8b9e-46e9-b859-cb654c1ec6ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ken.sloat@aampglobal.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR07MB5009
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: BL0PR07MB4115.namprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-TransportTrafficSubType: 
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 100.3.71.115
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-transporttrafficsubtype: 
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating; SFV:NSPM;
 SKIP:0; 
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: BL0PR07MB5009.namprd07.prod.outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_043736_704584_E8F7108E 
X-CRM114-Status: GOOD (  28.85  )
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
Cc: "oss@buserror.net" <oss@buserror.net>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "kmpark@infradead.org" <kmpark@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> -----Original Message-----
> From: Heiko Schocher <hs@denx.de>
> Sent: Monday, June 24, 2019 3:41 AM
> To: Ken Sloat <KSloat@aampglobal.com>
> Cc: oss@buserror.net; tudor.ambarus@microchip.com;
> kmpark@infradead.org; hs@denx.de; u-boot@lists.denx.de; linux-
> mtd@lists.infradead.org
> Subject: Re: [U-Boot] [nand] [ubi] Discrepancy Between U-Boot and Linux
> NAND PEBs
> 
> [This is an EXTERNAL EMAIL]
> ________________________________
> 
> Hello Ken,
> 
> Am 20.06.2019 um 14:55 schrieb Ken Sloat:
> > Hello All,
> >
> > I have been working on a system using a NAND flash along with U-Boot
> 2018.07 and Linux Kernel 4.14. This is an Atmel based system FYI so it uses the
> Atmel NAND driver. I create a UBI image with 3 separate volumes - 2 of these
> are a specified fixed size and the third is specified as the minimum needed to
> hold the current files with the auto resize flag set. As a note, before the first
> run auto resize operation, there is over 200 MiB of unused space in the
> NAND - meaning there should be plenty of free space available for UBI to
> leave overhead when auto-resizing for bad block handling. Another point of
> note, is that I use UBI within U-Boot as well in order to read the kernel image
> and dtb out of the UBIFS.
> >
> > I have noticed warnings in Linux when attaching UBI regarding not having
> enough reserved PEBs for bad block handling (it's short by 2). Upon further
> investigation into the issue, it appears as though there is a discrepancy
> between what U-Boot and Linux see in terms of the number of bad blocks:
> >
> > U-Boot:
> > ubi0: good PEBs: 4093, bad PEBs: 3, corrupted PEBs: 0
> > ubi0: user volume: 3, internal volumes: 1, max. volumes count: 128
> >
> > Linux:
> > ubi0 warning: ubi_eba_init: cannot reserve enough PEBs for bad PEB
> handling, reserved 71, need 73
> > ......
> > ubi0: good PEBs: 4089, bad PEBs: 7, corrupted PEBs: 0
> > ubi0: user volume: 3, internal volumes: 1, max. volumes count: 128
> >
> > After production flashing of a UBI image to NAND (with a "dumb" non UBI
> aware flasher), U-Boot will be the program to mount UBI. What this means is
> that it will complete the one time re-size operation. I used a Linux ramdisk
> image to flash from Linux and mount UBI in Linux for the first time to allow it
> to complete the auto-resize operation instead and compared:
> >
> > U-Boot:
> > ubi0: attaching mtd1
> > ubi0: scanning is finished
> > ubi0: volume 1 ("rootfs") re-sized from 1501 to 3385 LEBs
> > ubi0: attached mtd1 (name "mtd=0", size 512 MiB)
> > ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> > ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> > ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
> > ubi0: good PEBs: 4093, bad PEBs: 3, corrupted PEBs: 0
> >
> > Linux:
> > ubi0: attaching mtd6
> > ubi0: scanning is finished
> > ubi0: volume 1 ("rootfs") re-sized from 1501 to 3383 LEBs
> > ubi0: attached mtd6 (name "atmel_nand", size 512 MiB)
> > ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> > ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> > ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
> > ubi0: good PEBs: 4089, bad PEBs: 7, corrupted PEBs: 0
> >
> > As you can see, U-Boot resizes the image to 3385 blocks while Linux only
> 3383 - hence the 2 blocks that Linux would complain about had U-Boot
> resized the volume.
> >
> > I am not sure exactly what is causing this discrepancy as I just figured this
> out - but thought I would reach out and discuss it here. Obviously there are
> ways around this issue (program and mount UBI from Linux initially, don't use
> autoresize and specify all volume sizes, etc) but was wondering if there is
> some underlying problem. I noticed an older mailing discussion from several
> years ago where someone reported a similar issue regarding number of bad
> PEBs and seems the issue was chalked up to a potential driver problem on
> one side:
> > https://lists.denx.de/pipermail/u-boot/2015-June/216482.html
> >
> > Any insight would be helpful.
> 
> We use in U-Boot the code from linux 4.2 (commit
> 64291f7db5bd8150a74ad2036f1037e6a0428df2)
> (Yes, very old in the meantime)
> 
> So may there is a problem with this old code base in U-Boot?
> 
> Volunteers for rebasing the U-Boot ubi/ubifs code with a newer
> linux version are welcome.
> 
> But reading your Email again, may you should first investigate, why U-Boot
> and Linux see different good PEBs.
> 
> Also your kernel drops the warning:
> 
> ubi0 warning: ubi_eba_init: cannot reserve enough PEBs for bad PEB
> handling, reserved 71, need 73
> 
> You should look here deeper into it.
> 
> bye,
> Heiko
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

Thanks for the info Heiko,

I will see what I can find

Thanks,
Ken Sloat
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
