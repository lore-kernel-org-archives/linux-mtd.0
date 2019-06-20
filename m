Return-Path: <SRS0=7m8F=UT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MISSING_HEADERS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1999C43613
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 13:11:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E65206E0
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 13:11:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KlZOqnoO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aampusa.onmicrosoft.com header.i=@aampusa.onmicrosoft.com header.b="p8DXXE0x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E65206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aampglobal.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zv9oqSXpOJ4vWOrb5v1Gnfjgxcy+WEIwFMiq05qIT1A=; b=KlZOqnoOD4mY2a
	NkpU2qHeEfzZ9TWRvuaeUOQ/FIw1Q4R8csmRynHoaRrDzzK77QfSF4AgDZfY94Dd92+iuyqPlMCeU
	ODxvEgZdNuzqxDkwDq/rawHcy4hMZCP2/AxsycyQyEtBCoWRrTbz1SZfoC12ef9pVBV9J5qi7YGi0
	ZeL3zJpeTDPZpr/DiYzfubCB1sr/b9xkvJx6VHHkq6ObdOc6Zg/sj8HBK9cBlEnKV+LT3Nyhr3dQj
	uQcxERkYMHwxgMDYgip8kKPDGZUXpWE4YD/DGsgNdte1T/Qb7CSgjO58DGd1BjLbSejc8WM9ZyI+L
	65dfQD0bs1RouGXz49ZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdwqb-0002He-R9; Thu, 20 Jun 2019 13:11:25 +0000
Received: from mail-eopbgr700122.outbound.protection.outlook.com
 ([40.107.70.122] helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdwqW-0002Bn-Aj
 for linux-mtd@lists.infradead.org; Thu, 20 Jun 2019 13:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aampusa.onmicrosoft.com; s=selector2-aampusa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcmKeHJxvfHjkFi/GhfbltiEB5nGYsZBlxSDN2buNUU=;
 b=p8DXXE0x2GDyMzbVUhKbQ4rAXS/T8COie1IBHhpoFp3rn3K0D2AfI51G5PheO8Ln6oAUloilaKWQzKfGaLAcoinxlD+Dq5uiSvtM+IDi/gbhhy7nx+BzPwJYn+ymLQ+i1fwNxs7T2qrrxWS2ZKl38hGoguHTMIX381q2pT/ZmmM=
Received: from BL0PR07MB4115.namprd07.prod.outlook.com (52.132.10.149) by
 BL0PR07MB5746.namprd07.prod.outlook.com (20.177.243.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Thu, 20 Jun 2019 12:55:45 +0000
Received: from BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e]) by BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e%6]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 12:55:45 +0000
From: Ken Sloat <KSloat@aampglobal.com>
Subject: [U-Boot] [nand] [ubi] Discrepancy Between U-Boot and Linux NAND PEBs 
Thread-Topic: [U-Boot] [nand] [ubi] Discrepancy Between U-Boot and Linux NAND
 PEBs 
Thread-Index: AdUnZzM3sibvyNx6QX2i4/puOAuHIw==
Date: Thu, 20 Jun 2019 12:55:45 +0000
Message-ID: <BL0PR07MB411523A25B85713C637090D3ADE40@BL0PR07MB4115.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=KSloat@aampglobal.com; 
x-originating-ip: [100.3.71.115]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63e0c66f-c86b-4392-d375-08d6f57e9c4d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BL0PR07MB5746; 
x-ms-traffictypediagnostic: BL0PR07MB5746:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BL0PR07MB57463D6514EE7DE5BED0ABE9ADE40@BL0PR07MB5746.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(376002)(366004)(136003)(39850400004)(53754006)(189003)(199004)(64756008)(305945005)(71200400001)(66446008)(7736002)(86362001)(33656002)(55016002)(1671002)(66556008)(107886003)(72206003)(5660300002)(4743002)(76116006)(8936002)(478600001)(71190400001)(486006)(99286004)(6506007)(81166006)(7696005)(66476007)(109986005)(14454004)(476003)(2906002)(54906003)(316002)(74316002)(186003)(81156014)(102836004)(73956011)(59246006)(4326008)(25786009)(80792005)(53936002)(66946007)(966005)(8676002)(3846002)(66066001)(52536014)(14444005)(5024004)(9686003)(256004)(26005)(68736007)(6306002)(6436002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR07MB5746;
 H:BL0PR07MB4115.namprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: aampglobal.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: prPdnE+T8TRppJeeIczW8gkFNk/4S+ni+j7lvFsZ7U+gVdAldTib+drvEz3z1xWYdpTcFA4n+simgVv2UvFmTB1YldTlkM/sOkX/zZI/phxo5AGMQHnb3hHBVMe3hJXjobs4MQ8Wl/lVIia2qQNZSaSskC4HOkWd+5dVflWvuPaZxhNgKR1Eq7N5d7c0lImjkLzWpGi/CRUTLVAbdR/VG+VWZgvFaN2+p0zwB8qlfsEzQi3iXUvqdJd6qk4+n4Y0TElk58Dx69sVWMCHzVJHyHlDpy/MflzVzcATVIl+JKOUGPqf8m05eo9uqPR+o//oXW5YnkYBHLHXztgHwENiMxvaq3plEKbCCU8dp6v71GLNFNdq6wbvvQIQA+SCMeQJBcyxTdPuc0IvnRKPoiamSRs9DGJOVhnAPIvlR5EJxoI=
MIME-Version: 1.0
X-OriginatorOrg: aampglobal.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e0c66f-c86b-4392-d375-08d6f57e9c4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 12:55:45.5205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e20e3a66-8b9e-46e9-b859-cb654c1ec6ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ken.sloat@aampglobal.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR07MB5746
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
X-OrganizationHeadersPreserved: BL0PR07MB5746.namprd07.prod.outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_061120_441162_46F3CF51 
X-CRM114-Status: GOOD (  12.03  )
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
Cc: Ken Sloat <KSloat@aampglobal.com>,
 "kmpark@infradead.org" <kmpark@infradead.org>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "oss@buserror.net" <oss@buserror.net>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "hs@denx.de" <hs@denx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello All,

I have been working on a system using a NAND flash along with U-Boot 2018.07 and Linux Kernel 4.14. This is an Atmel based system FYI so it uses the Atmel NAND driver. I create a UBI image with 3 separate volumes - 2 of these are a specified fixed size and the third is specified as the minimum needed to hold the current files with the auto resize flag set. As a note, before the first run auto resize operation, there is over 200 MiB of unused space in the NAND - meaning there should be plenty of free space available for UBI to leave overhead when auto-resizing for bad block handling. Another point of note, is that I use UBI within U-Boot as well in order to read the kernel image and dtb out of the UBIFS.

I have noticed warnings in Linux when attaching UBI regarding not having enough reserved PEBs for bad block handling (it's short by 2). Upon further investigation into the issue, it appears as though there is a discrepancy between what U-Boot and Linux see in terms of the number of bad blocks:

U-Boot:
ubi0: good PEBs: 4093, bad PEBs: 3, corrupted PEBs: 0
ubi0: user volume: 3, internal volumes: 1, max. volumes count: 128

Linux:
ubi0 warning: ubi_eba_init: cannot reserve enough PEBs for bad PEB handling, reserved 71, need 73
......
ubi0: good PEBs: 4089, bad PEBs: 7, corrupted PEBs: 0
ubi0: user volume: 3, internal volumes: 1, max. volumes count: 128

After production flashing of a UBI image to NAND (with a "dumb" non UBI aware flasher), U-Boot will be the program to mount UBI. What this means is that it will complete the one time re-size operation. I used a Linux ramdisk image to flash from Linux and mount UBI in Linux for the first time to allow it to complete the auto-resize operation instead and compared:

U-Boot:
ubi0: attaching mtd1
ubi0: scanning is finished
ubi0: volume 1 ("rootfs") re-sized from 1501 to 3385 LEBs
ubi0: attached mtd1 (name "mtd=0", size 512 MiB)
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
ubi0: good PEBs: 4093, bad PEBs: 3, corrupted PEBs: 0

Linux:
ubi0: attaching mtd6
ubi0: scanning is finished
ubi0: volume 1 ("rootfs") re-sized from 1501 to 3383 LEBs
ubi0: attached mtd6 (name "atmel_nand", size 512 MiB)
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
ubi0: good PEBs: 4089, bad PEBs: 7, corrupted PEBs: 0

As you can see, U-Boot resizes the image to 3385 blocks while Linux only 3383 - hence the 2 blocks that Linux would complain about had U-Boot resized the volume.

I am not sure exactly what is causing this discrepancy as I just figured this out - but thought I would reach out and discuss it here. Obviously there are ways around this issue (program and mount UBI from Linux initially, don't use autoresize and specify all volume sizes, etc) but was wondering if there is some underlying problem. I noticed an older mailing discussion from several years ago where someone reported a similar issue regarding number of bad PEBs and seems the issue was chalked up to a potential driver problem on one side:
https://lists.denx.de/pipermail/u-boot/2015-June/216482.html

Any insight would be helpful.

Thanks,
Ken Sloat

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
