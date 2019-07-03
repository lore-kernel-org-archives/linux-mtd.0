Return-Path: <SRS0=y7vF=VA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D2FC5B578
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2019 06:14:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 169EC21880
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2019 06:14:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JLQk8Myf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="mZl18DDC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 169EC21880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cc8rZ6/rG/mFiE8Efi1ddd5+gOkW5oL5u4SWL7wa92E=; b=JLQk8MyfA5PmSu
	gf7imHZ8VQ+UVMj0P96rU3DlzwQprH8qB9hNI0LsCulgbf/w60R9Qu4+BIXNH2VbnXlVZau1Y/zCy
	ZiMQ+1PPIJEUmb3IyFhPRDkELjlwtszv4HQuTtdB8XIhV3yLXnWyBBFR4oUq+7VmnWrbTSMKg7dtC
	PJK9DQz7qGgxwQpWVug1+T2nVnKly9qcHJ3mdxgnOUBJBN/6BUvXoV/bwUGHAD+B3/4iW1HCRqZbt
	+qjDs1DCeMwkedUQUMtqdGfi1mGMcs9q8hFyK0Tds+TxDufU6G6bwYfIQUdWA6r40z6J2tlHTSzRX
	/DYKtkLOn6PpR04XM1BQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiYWi-0004Xs-Cf; Wed, 03 Jul 2019 06:13:56 +0000
Received: from mail-eopbgr760079.outbound.protection.outlook.com
 ([40.107.76.79] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiYWf-0004Ws-DO
 for linux-mtd@lists.infradead.org; Wed, 03 Jul 2019 06:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymS6KkwwZTQC+sQ2EgEKDIkYDAqK4nnANFoc7YJBFLQ=;
 b=mZl18DDCg83hNVvpk5tkGNU4TnSSpKCvBM66b+rtod4UAUCP5Qyy1dSROAThO8wLIKRDjQoBDHDEJSunDW3NreyXKTe/jr6LA46YntNjLPPRGXmhus+1iIIjCQGcZMkePO73dGU0KCP7ud17DrRYuAf8bRJDtIDN9jWFdGAjJvU=
Received: from DM6PR02MB4779.namprd02.prod.outlook.com (20.176.109.16) by
 DM6PR02MB5898.namprd02.prod.outlook.com (20.179.68.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 06:13:47 +0000
Received: from DM6PR02MB4779.namprd02.prod.outlook.com
 ([fe80::936:90c8:a385:1513]) by DM6PR02MB4779.namprd02.prod.outlook.com
 ([fe80::936:90c8:a385:1513%4]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 06:13:47 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Helmut Grohne <helmut.grohne@intenta.de>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: RE: [LINUX PATCH v17 2/2] mtd: rawnand: pl353: Add basic driver for
 arm pl353 smc nand interface
Thread-Topic: [LINUX PATCH v17 2/2] mtd: rawnand: pl353: Add basic driver for
 arm pl353 smc nand interface
Thread-Index: AQHVKxERfpwoj8XL9UqMkCeJJ20MnKasaZ4AgAwLy6A=
Date: Wed, 3 Jul 2019 06:13:47 +0000
Message-ID: <DM6PR02MB47796F40DB186070031E5113AFFB0@DM6PR02MB4779.namprd02.prod.outlook.com>
References: <20190625044630.31717-1-naga.sureshkumar.relli@xilinx.com>
 <20190625044630.31717-2-naga.sureshkumar.relli@xilinx.com>
 <20190625141126.ggmxjcmdh76lguds@laureti-dev>
In-Reply-To: <20190625141126.ggmxjcmdh76lguds@laureti-dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=nagasure@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c3423f2-19b9-4b6e-651e-08d6ff7d9bfb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR02MB5898; 
x-ms-traffictypediagnostic: DM6PR02MB5898:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR02MB58982921A488BA22DDD79084AFFB0@DM6PR02MB5898.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:348;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(199004)(189003)(13464003)(66446008)(55016002)(6436002)(6306002)(52536014)(7416002)(53936002)(4326008)(7696005)(99286004)(33656002)(3846002)(11346002)(478600001)(446003)(6116002)(76176011)(6246003)(476003)(86362001)(26005)(68736007)(7736002)(256004)(5660300002)(9686003)(64756008)(73956011)(14444005)(6506007)(110136005)(66476007)(305945005)(316002)(229853002)(186003)(486006)(102836004)(74316002)(2906002)(8676002)(54906003)(8936002)(66946007)(25786009)(71200400001)(71190400001)(81156014)(53546011)(66556008)(966005)(76116006)(81166006)(14454004)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB5898;
 H:DM6PR02MB4779.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Hj+sdDPEqygBtoipPmFyKvDQr0MbIhoSCDlX6Sgg9Aqk3uzkP3I8J1bMi6EJV3fFOeLuxGAJSDoDGCwDEyx+gEHze7DaJ5XbI2uQWbB70AjcHV8fduu5OCHJPKV9JMNoUSKrqwVpyDH/8HPMGD5NO7WDTpcKg96nKwCHI96bXgLE8ndOCpsBzVtwfSFXqqYiMn0lloUiGyE0ImieLTGoh/dlIvs893fbd9JlwaNkz+2TuaJpRrS4CPxmH88EbC++q4USyHYARmMVkJY1YX0RiSyVfzmw9pkZngcd6rYFWVVgB43MonXSplv3gwYdMBWzr3U3gjOg4ZMUAQjlL0YjlhO0r0O3B7KOeI9AmVldC06StqYI26ARYYAExJcnY4Q+6v+XSNa1VC5lNmcsvUx4NklniX2Kjl+Q05lZECshUss=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3423f2-19b9-4b6e-651e-08d6ff7d9bfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 06:13:47.0853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nagasure@xilinx.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_231353_457215_2A0C8E3D 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: "vigneshr@ti.com" <vigneshr@ti.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "richard@nod.at" <richard@nod.at>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

> -----Original Message-----
> From: linux-mtd <linux-mtd-bounces@lists.infradead.org> On Behalf Of Helmut Grohne
> Sent: Tuesday, June 25, 2019 7:41 PM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Cc: vigneshr@ti.com; bbrezillon@kernel.org; yamada.masahiro@socionext.com;
> richard@nod.at; linux-kernel@vger.kernel.org; marek.vasut@gmail.com; linux-
> mtd@lists.infradead.org; miquel.raynal@bootlin.com; computersforpeace@gmail.com;
> dwmw2@infradead.org
> Subject: Re: [LINUX PATCH v17 2/2] mtd: rawnand: pl353: Add basic driver for arm pl353
> smc nand interface
> 
> Thank you for the quick update.
> 
> On Tue, Jun 25, 2019 at 06:46:30AM +0200, Naga Sureshkumar Relli wrote:
> > -> Tested Micron MT29F2G08ABAEAWP (On-die capable) and AMD/Spansion
> S34ML01G1.
> 
> I tested the v17 series with the MT29F2G08ABAEAWP. I can now mount existing jffs2
> volumes without issues.
> 
> When running nandtest on a 64MB area, I no longer see lots of consecutive errors. However I
> see few (4-8) single byte errors for random locations on about half the runs. In comparison, I
> couldn't reproduce these on the older driver on v4.14.
> 
> When writing random 1MB files on a fresh jffs2 filesystem and reading them back after
> umounting and mounting the filesystem, I got one faulty file in 50 attempts.
> 
> So this driver mostly works for me, but I suspect that something (possibly the tested
> hardware) doesn't fully work yet. To say more, I'll need long term testing results. In the mean
> time, I'm in favour of merging the driver.
What is your take on this?
Can we consider to merge this driver?
Could you please let me know?

Thanks,
Naga Sureshkumar Relli
> 
> Helmut
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
