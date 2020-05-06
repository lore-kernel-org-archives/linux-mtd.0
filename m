Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FD4C28CBC
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 03:56:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB672075E
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 03:56:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AbjfcjDa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="B5Z+Q2Xy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CB672075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDEqV5xgi4PKIQhoMAlfYx/N5qD8UZ6hNZGA9paxy0I=; b=AbjfcjDa4rUuAk
	RknwIOQeivgZ9V9njx9jQo6ibWhT/F71kbkX+PxDVy/CkGUAPrFTUNt5I+0NeMMu552fTp/QJiDCu
	gln7fuINuROZHZfWrao4nMsJJqEL/muLRl7Wz4J/Qi4NpZkr2vHnCE5CFtndZ2SUgMlFggKSJSCAu
	/W9H2d5fhhvyZ9HuvAnMR1DEzGawZXpw2S5/TmljPBeDP7Nz5CkLVBUaTuC4TE2gfDAn22IkhTKQH
	rv5u3BXMGXbq6gUUewR5PvP2A/d0GQYQrb2vafbjhbOyqAJNZlmn8fHDHSpp/bHtw6DKNlMp7tCtF
	T3A01ZBfTMU3bCHk9qJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWBAJ-0007Sn-EG; Wed, 06 May 2020 03:56:11 +0000
Received: from mail-co1nam11on2044.outbound.protection.outlook.com
 ([40.107.220.44] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWBAE-0007Qx-H2; Wed, 06 May 2020 03:56:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EePHOYSG+GJVKMPtuhF7wefSdG/qxWFSnpD6vZEx+X1rmUdRRSX1d+J2KartYSYwK741VUDR45DJDUIX/x7QMZsMLyDGU5dwooee93C0NH7S8GeK4T5L8U7LL8F9gzjKMMVCfRGh33b1/wocpzaNMDpdXGLJPL5SmVxApqHxMX0rXRtgJrDE/079OktsZZKPJdAQRgRo8Wl/B28Py5S+438hmJvAzq/PaywZ1It1pAD1cIGrlbTJA3hBPxHs0O/CeQYav28LvYTtDhGGxdgghSGtEOND98zIHx1PZI30VLDrrzBg3VacHyg10uI7RBeNNxjko0qyOU3ILBQWj/jt9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMr+xfMmDD5mwfkSVorR5igAduiTlas6PsSNzWKtcTM=;
 b=QnrcnpdLEDr8uOdc1fQusgoZu7qFvjSfN0ylu1KgUDWy8dDEIijqbvskxDNAG+4/1oP3f0m9ZByXp/PUaTh6/hVMfRHyeYRGcFlM87KAZX+yZbWu/lNebqb7ytkXhBdIce3bUZo4rQg5GAUNbPDXiars+NTWmpuT8ec5b0ekZe0KyzsY4x07jKVmS3Ig50HfbJya+g3chzkud9ow4XxkliU5tuAEfl55D42VdaM0NCYAP1lGqkp1hh604XTFM1bYeYDDRxaLLN29yuv6XfwPzaIrTKZVk6kq9YO6OLrEvJpjPEs5rhfzdN37K4bkwI2c8W6+eXswDYzjrCRh+UkozQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMr+xfMmDD5mwfkSVorR5igAduiTlas6PsSNzWKtcTM=;
 b=B5Z+Q2XyOFAAK6XFtWvt67Ytyifuce2SJ0GWwDMJD9yQaJWJxeLEyvnpiPEsF8NfdAAzD+AiVYCsuEXnBNjdL3WW8tsoLIphgPTAhl9RY5xFw79C/rcoXaf80zcsChswRsmUE6hCFgYvr06+vViaw+kpIlu/QrX7yyD5SqjcWTE=
Received: from BYAPR13MB2614.namprd13.prod.outlook.com (2603:10b6:a03:b4::12)
 by BYAPR13MB2821.namprd13.prod.outlook.com (2603:10b6:a03:f5::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.23; Wed, 6 May
 2020 03:56:04 +0000
Received: from BYAPR13MB2614.namprd13.prod.outlook.com
 ([fe80::c0fc:30a3:5e5f:c2b6]) by BYAPR13MB2614.namprd13.prod.outlook.com
 ([fe80::c0fc:30a3:5e5f:c2b6%7]) with mapi id 15.20.2979.025; Wed, 6 May 2020
 03:56:04 +0000
From: Sagar Kadam <sagar.kadam@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: RE: [PATCH 1/2] riscv: defconfig: enable spi nor on Hifive Unleashed
 A00 board.
Thread-Topic: [PATCH 1/2] riscv: defconfig: enable spi nor on Hifive Unleashed
 A00 board.
Thread-Index: AQHWHtYDB/cpTmsjKkuAl+bHjseykqiYg+KAgABe/XCAAUf3gIAASp8Q
Date: Wed, 6 May 2020 03:56:03 +0000
Message-ID: <BYAPR13MB2614FE811C8DD83BBDD3A26599A40@BYAPR13MB2614.namprd13.prod.outlook.com>
References: <BN8PR13MB2611968A7252308925FF18B399A70@BN8PR13MB2611.namprd13.prod.outlook.com>
 <mhng-29e22ca7-538a-4094-923f-8fbc0fd327b9@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-29e22ca7-538a-4094-923f-8fbc0fd327b9@palmerdabbelt-glaptop1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=sifive.com;
x-originating-ip: [116.74.144.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ba8cc5a-ea1f-4447-095b-08d7f1716601
x-ms-traffictypediagnostic: BYAPR13MB2821:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR13MB2821BCDFEA785476F3FC779E99A40@BYAPR13MB2821.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T46jBO/HAy+nkznpmlHXgg89vbQHrKaOfoLLW7jY5f/izzjmvqKWcaBGWN+PPH7QyPZXSLgI3xU3psfrMDntM2DRJAQSn8t9uy2ugnH2zpx/xKlCpHGera0IOqXhHUxCvKVWZ8uv8seVNWJ4ofBy19uhsuAJEZRW2Fx0dg4HYYlkcEcpMRwDNRZ4ZcIC5RAR7FwkPjG3cDVkoCtGDmhMrwSLXqA/Zg9NwRY+fyGAarYQDXQMQQKpwNa2B/azaQgBGnRpbAztKG9IfLGJhHzbZvg3NHHngYFv6dWdkbpSjRRSLPvCNr2EBNLsfXvC/Gzh+/07FV0qe/nsEqdcGl1Pz+7rFTdoOUVmjxB8BlIp8r4323BVl9Ie1UnW95H1AwFlcKJ+IqNcEtCnJOac6xWaBqgoLbiH3QBKV2cOME85fj/PzdshlAt/MVbj2csK64cGa1+be2ERBw8yNmhk16r6RCwBr60el10Rm8UjuRzYc5UkdJoS9X4ibDlC5a91AZ6yTY6xFOZ3YFoo4rRT8eHgPg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR13MB2614.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(136003)(376002)(346002)(39850400004)(396003)(33430700001)(64756008)(66446008)(86362001)(2906002)(52536014)(8676002)(8936002)(33440700001)(26005)(66946007)(76116006)(186003)(66476007)(66556008)(4326008)(44832011)(6506007)(33656002)(55236004)(7696005)(316002)(54906003)(9686003)(71200400001)(55016002)(478600001)(5660300002)(53546011)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Dc3ZddpYcevwexUKJDogtPKir4s18evR6R/B17PaP/0NxuV+fQSfFjjxDMdHvBJNfqiu/5d1aFdjw0Ia4X8RIUOuIxp7bupiwnEDLzotNu/c2ZADCMqZcn1Sk5fDZv9pAfptLJlgSIiJfeJjz0qU3ESek46Kwc9fZWg9c2YjyYaH2NePI/Uz4K8DCBKKo1BPRBOX+N5RjiNXG/1EXDqpqghHdJCxe1n4snap9QxjvRvQTn7bqrSieXaek7BzHGhZ6tDSOegroj7Siq+8+NbzywH5c+F3wbRFx+MvQuda9V4lSjNFOIjax5FhcAvO9D3jw9a4BRVxE9soLBmBSl5+vDDtkRSgNhBpDXbTkYccI2VO1RYG3Ke2RgXXcoOrOiCNSYtEbUTRTJHWlkTlb7Q5socpDGCRsQNCKESkXKJeEtJsa+NXMSt82vVcTTiGHwbWJkWZDbiV8OloLLFBfrqygA7z36VZR6t2X1ZUvB+rGsIegAb1bjpfBJDSxfkuou9lqaxOb7VTd76FWzZZ+TdLyjn2AAu70xnMPSyUK/EoJdph5c5IMz5TVRK9l8xq6YpxSj5/xOifg4cXQPHqE0HFH8f9eLY72dRe39e2iYyySWz69IjFAjnMdazHrgnM2RL97oktpyBs7xaOSwalHnN9O9yZlrmK6mZxVENhEB38xrTOhd9/goDkImTKpBtIsTlu7qW3m2AUtjSNTaalMKOkdnYewaa5Fzh0diOXu3SBpJdWcWITiuqYuwpGCp4GcVgcTJwPW167VbbxnwoTf2cOGZEhwDN6ad1x0YFmqKEbRtw=
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba8cc5a-ea1f-4447-095b-08d7f1716601
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 03:56:03.8718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ojcdPBVNsi9ZHYlPv2ljcbVWsq8IMmzjlb16GeMbxr3K0vxe67xpxl8lRtKPgfb8VCE1BHmbbAryOZv9qA1sAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR13MB2821
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_205607_234117_6FD6EF29 
X-CRM114-Status: GOOD (  24.91  )
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
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "richard@nod.at" <richard@nod.at>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Palmer,

> -----Original Message-----
> From: Palmer Dabbelt <palmer@dabbelt.com>
> Sent: Wednesday, May 6, 2020 4:54 AM
> To: Sagar Kadam <sagar.kadam@sifive.com>
> Cc: tudor.ambarus@microchip.com; miquel.raynal@bootlin.com;
> richard@nod.at; vigneshr@ti.com; Paul Walmsley
> <paul.walmsley@sifive.com>; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; linux-mtd@lists.infradead.org
> Subject: RE: [PATCH 1/2] riscv: defconfig: enable spi nor on Hifive Unleashed
> A00 board.
> 
> [External Email] Do not click links or attachments unless you recognize the
> sender and know the content is safe
> 
> On Tue, 05 May 2020 00:18:45 PDT (-0700), sagar.kadam@sifive.com wrote:
> > Hello Palmer,
> >
> >> -----Original Message-----
> >> From: Palmer Dabbelt <palmer@dabbelt.com>
> >> Sent: Tuesday, May 5, 2020 3:40 AM
> >> To: Sagar Kadam <sagar.kadam@sifive.com>
> >> Cc: tudor.ambarus@microchip.com; miquel.raynal@bootlin.com;
> >> richard@nod.at; vigneshr@ti.com; Paul Walmsley
> >> <paul.walmsley@sifive.com>; linux-riscv@lists.infradead.org; linux-
> >> kernel@vger.kernel.org; linux-mtd@lists.infradead.org; Sagar Kadam
> >> <sagar.kadam@sifive.com>
> >> Subject: Re: [PATCH 1/2] riscv: defconfig: enable spi nor on Hifive
> Unleashed
> >> A00 board.
> >>
> >> [External Email] Do not click links or attachments unless you recognize
> the
> >> sender and know the content is safe
> >>
> >> On Thu, 30 Apr 2020 02:58:51 PDT (-0700), sagar.kadam@sifive.com
> wrote:
> >> > Enable MTD based SPI-NOR framework in order to use spi flash
> available
> >> > on HiFive Unleashed A00 board.
> >> >
> >> > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> >> > ---
> >> >  arch/riscv/configs/defconfig | 2 ++
> >> >  1 file changed, 2 insertions(+)
> >> >
> >> > diff --git a/arch/riscv/configs/defconfig
> >> > b/arch/riscv/configs/defconfig index 4da4886..970580b 100644
> >> > --- a/arch/riscv/configs/defconfig
> >> > +++ b/arch/riscv/configs/defconfig
> >> > @@ -80,6 +80,8 @@ CONFIG_USB_STORAGE=y  CONFIG_USB_UAS=y
> >> CONFIG_MMC=y
> >> > CONFIG_MMC_SPI=y
> >> > +CONFIG_MTD=y
> >> > +CONFIG_MTD_SPI_NOR=y
> >> >  CONFIG_RTC_CLASS=y
> >> >  CONFIG_VIRTIO_PCI=y
> >> >  CONFIG_VIRTIO_BALLOON=y
> >>
> >> From the second patch's description I'm assuming that MTD still
> functions
> >> correctly without that change?
> >
> > Yes Palmer, the second patch is to enable QUAD write to nor flash..
> > MTD  function's correctly without second patch.
> >
> > Using the character interface (/dev/mtd0) mtd_utils (mtd_debug :
> erase/read/write) work fine.
> > We might require CONFIG_MTD_BLOCK, CONFIG_MTD_CMDLINE_PARTS
> in order to use MTD partitioning.
> > IMHO it can be at user's choice weather to use flash partitions or not, so I
> have not enabled. Please let me
> > know if I should enable these features as well.
> 
> Looks like arm64 has these:
> 
> arch/arm64/configs/defconfig:CONFIG_MTD=y
> arch/arm64/configs/defconfig:CONFIG_MTD_BLOCK=y
> arch/arm64/configs/defconfig:CONFIG_MTD_CFI=y
> arch/arm64/configs/defconfig:CONFIG_MTD_CFI_ADV_OPTIONS=y
> arch/arm64/configs/defconfig:CONFIG_MTD_CFI_INTELEXT=y
> arch/arm64/configs/defconfig:CONFIG_MTD_CFI_AMDSTD=y
> arch/arm64/configs/defconfig:CONFIG_MTD_CFI_STAA=y
> arch/arm64/configs/defconfig:CONFIG_MTD_PHYSMAP=y
> arch/arm64/configs/defconfig:CONFIG_MTD_PHYSMAP_OF=y
> arch/arm64/configs/defconfig:CONFIG_MTD_DATAFLASH=y
> arch/arm64/configs/defconfig:CONFIG_MTD_SST25L=y
> arch/arm64/configs/defconfig:CONFIG_MTD_RAW_NAND=y
> arch/arm64/configs/defconfig:CONFIG_MTD_NAND_DENALI_DT=y
> arch/arm64/configs/defconfig:CONFIG_MTD_NAND_MARVELL=y
> arch/arm64/configs/defconfig:CONFIG_MTD_NAND_FSL_IFC=y
> arch/arm64/configs/defconfig:CONFIG_MTD_NAND_QCOM=y
> arch/arm64/configs/defconfig:CONFIG_MTD_SPI_NOR=y
> 
> so I think we're good with just what you have here: MTD_BLOCK doesn't
> seem that
> useful, and the rest are drivers.  That said, these (along with SPI and
> SPI_SIFIVE) should really be in Kconfig.socs rather than defconfig.  Can you
> send a patch that does that?
> 

Yes sure, I will send a V2 series, where SPI,  SPI_SIFIVE,  MTD, 
and MTD_SPI_NOR will be a part of Kconfig.socs.

Thanks & BR,
Sagar Kadam

> >
> > To demonstrate a bit more with linux 5.7-rc3
> >
> > Specify on U-boot prompt:
> > # setenv bootargs "root=/dev/ram rw console=ttySIF0
> mtdparts=spi0.0:1024k(loader1),4096K(loader2),26M(rootfs)"
> >
> > After booting linux will enumerate mtd partitions:
> > # cat /proc/mtd
> > dev:    size   erasesize  name
> > mtd0: 00100000 00001000 "loader1"
> > mtd1: 00400000 00001000 "loader2"
> > mtd2: 01a00000 00001000 "rootfs"
> >
> > # cat /proc/partitions
> > major minor  #blocks  name
> >   31        0       1024 mtdblock0
> >   31        1       4096 mtdblock1
> >   31        2      26624 mtdblock2
> >
> > #Format mtdblock2 with mkfs.ext3/4 and mount results in
> > # mkfs.ext3 /dev/mtdblock2
> > mke2fs 1.44.5 (15-Dec-2018)
> > /dev/mtdblock2 contains a ext3 file system
> >         last mounted on /mnt on Thu Jan  1 00:00:14 1970
> > Proceed anyway? (y,N) y
> > Creating filesystem with 26624 1k blocks and 6656 inodes
> > Filesystem UUID: 1b09252d-e313-430c-9ecb-79b0cef003ca
> > Superblock backups stored on blocks:
> >         8193, 24577
> >
> > Allocating group tables: done
> > Writing inode tables: done
> > Creating journal (1024 blocks): done
> > Writing superblocks and filesystem accounting information: done
> >
> > # mount
> > none on / type rootfs (rw)
> > proc on /proc type proc (rw,relatime)
> > devpts on /dev/pts type devpts
> (rw,relatime,gid=5,mode=620,ptmxmode=666)
> > tmpfs on /dev/shm type tmpfs (rw,relatime,mode=777)
> > tmpfs on /tmp type tmpfs (rw,relatime)
> > tmpfs on /run type tmpfs (rw,nosuid,nodev,relatime,mode=755)
> > sysfs on /sys type sysfs (rw,relatime)
> > /dev/mtdblock2 on /mnt type ext3 (rw,relatime)
> >
> > Thanks & BR,
> > Sagar Kadam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
