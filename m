Return-Path: <SRS0=DY/e=VO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A625C76195
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jul 2019 09:08:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 012062077C
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jul 2019 09:08:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aX8JKQRI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="cbm8sUtr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 012062077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKNh4Bdh9JwP1mBefEWUV+6d585xMEaRvtvzjBaP3Cg=; b=aX8JKQRIE7O5Fz
	HsZCJnQEV4VLlsVinALLsajP1zdSwVr360ZaqgOfiAGGUnfwzAwDOhffV4jfsNupCP+gvnpUjfuHf
	6aiWoIcWoYipY7reMhBWGZboeCeSwEWn8QTsZANKHbhzj3MWfvfNlbgqJGi7iIZ/hhVtg55sPpNkD
	Spx1XVdDSDi9+lghckTvDJc5MYjvW0a28b7x6Pn2P/RwXcjZwZFJy+10jTJxoftctEjdcLRGEfjUP
	aj2+mQOPz3bBGr9+ZRgC0fzu3dRD37jBtKTKrwS4kqjfSdX8VPMVns4eZXNQ6lWZaaf/Rqybacy3y
	GXkWh6Dr+a303nPuJjRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnfuj-0006rO-H9; Wed, 17 Jul 2019 09:07:53 +0000
Received: from mail-eopbgr780050.outbound.protection.outlook.com
 ([40.107.78.50] helo=NAM03-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnfuh-0006r2-2Z
 for linux-mtd@lists.infradead.org; Wed, 17 Jul 2019 09:07:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmDZ0XoaD1lYWwmrS7r19NUKhHZ+UGBTkHQWi/bYWIzrJTwvYMEK83EMSMc0DQw4+aeKBPhkAhJ4i99753oaB8MzAqQo66tlapU37VWOsjHk+3D2y8hGyeEF2PyphJEYxxOWgwRkbucJQQN6gGi2A6YO8i37RgW0JpUyReHIRJxLhgVoLBJBLg1CQ8Tix0zysJ3jK837QPPyWhuFpp1oodRyrDYBXIjtOkAaGvtihIhiZicLIQ46l5fX4hy0WSkb5qU6cN3e6VFrjwmTrApqmENeOM+dFwkaD4jP6D/vOK5HegNR4UsHWch+hIUzmCCU3/UAsqpxwq02wtQN7xgD6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fLep/glQMTbIUkGntWjZmp/WrLFZ37OmjbrmjU7D5A=;
 b=EljJRuXD9JtLQCiTdUuuUBc+m603dwD3NxrMUEp6HrOyKRHdeY1SGbyGKCDxL8+gXcfpHcjr5F4U83ecnatAav+/s7qUaA4Gh0BhpVqb+3/nWVDPT5xczNNByMD8Q9Kep/k+L2X0wZ4OwfckGYE4ANgJ2JmAOGjGAkfrsCEfp7F/srJp6XroJCGCqWRUTmMkei/2su9e+GFSuxJXO1brVR1xZsjhpdCrCjiqCUWbNhGN4COLhIBlz34bwKAy645HK/S8XvXM7edWIhI2Pk6/t29VUczToNFEl3UCQNccM6NLjuqxH8+I6r73+DzJxwWaR//qZCxtPFMPPcXcVxhGSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=xilinx.com;dmarc=pass action=none
 header.from=xilinx.com;dkim=pass header.d=xilinx.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fLep/glQMTbIUkGntWjZmp/WrLFZ37OmjbrmjU7D5A=;
 b=cbm8sUtrfO3kJQSvxx7222MoJNWOSFySJXe27nY7qTmPyhVzz/x9CfizvP2TAVr8TOEKlmlcdpF2BuRgJ+AwjI4Z66CLxKetZL6cndkt92OS9ROStoistSTBo2jZWVjVOQ6pRZNuC2Vxwd55F/+8vAEeqak43ewQmQMqbC/8WH8=
Received: from DM6PR02MB4779.namprd02.prod.outlook.com (20.176.109.16) by
 DM6PR02MB6668.namprd02.prod.outlook.com (10.141.187.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Wed, 17 Jul 2019 09:07:48 +0000
Received: from DM6PR02MB4779.namprd02.prod.outlook.com
 ([fe80::936:90c8:a385:1513]) by DM6PR02MB4779.namprd02.prod.outlook.com
 ([fe80::936:90c8:a385:1513%4]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 09:07:48 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: RE: [LINUX PATCH v18 1/2] mtd: rawnand: nand_micron: Do not over
 write driver's read_page()/write_page()
Thread-Topic: [LINUX PATCH v18 1/2] mtd: rawnand: nand_micron: Do not over
 write driver's read_page()/write_page()
Thread-Index: AQHVO5eo4+vjEMfVj0u12vHDQxXMaabM2dGAgAADsQCAAWJjoIAAMueAgAAPnnA=
Date: Wed, 17 Jul 2019 09:07:48 +0000
Message-ID: <DM6PR02MB47794065C8DF1E3FFAF58B54AFC90@DM6PR02MB4779.namprd02.prod.outlook.com>
References: <20190716053051.11282-1-naga.sureshkumar.relli@xilinx.com>
 <20190716093137.3d8e8c1f@pc-375.home>	<20190716094450.122ba6e7@pc-375.home>
 <DM6PR02MB4779307E32670683AE9F60D6AFC90@DM6PR02MB4779.namprd02.prod.outlook.com>
 <20190717095525.6e2e9730@pc-375.home>
In-Reply-To: <20190717095525.6e2e9730@pc-375.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=nagasure@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24bc5a8c-6d2c-410f-7256-08d70a963d63
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR02MB6668; 
x-ms-traffictypediagnostic: DM6PR02MB6668:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM6PR02MB66685CC260411A89CA981071AFC90@DM6PR02MB6668.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(396003)(366004)(346002)(136003)(376002)(13464003)(199004)(189003)(71200400001)(71190400001)(54906003)(2906002)(68736007)(14454004)(305945005)(52536014)(316002)(86362001)(76116006)(66476007)(53546011)(66946007)(66446008)(6506007)(66556008)(256004)(64756008)(486006)(14444005)(5660300002)(7696005)(76176011)(102836004)(6306002)(9686003)(55016002)(6246003)(53936002)(229853002)(6436002)(7416002)(66066001)(186003)(99286004)(4326008)(26005)(6916009)(8676002)(7736002)(11346002)(446003)(476003)(74316002)(81156014)(478600001)(33656002)(966005)(25786009)(6116002)(81166006)(3846002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB6668;
 H:DM6PR02MB4779.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JbMxJG5q9ijpCZrZpETUxJzG0FK1tZVZcEesr5eDaP3dhASApbloQSY9Vs6XDhiuhxiLb6GVEMiMJd/wKO47kL/SdggENTJCMNfb2hdn6aKhrOG2Xnuxd1L4IhgGKGAgCt1dEobxR3wC1x0NGJqgjUQM0fUOuCzU9ChveDfHlM3LvTlmAsIytq/VAgRxZ4Osarhre83Rau3cwgkG53WC0MIWuVbLh46xLqwdCynADcc/+0YRhWTMGslZP+u7Iv/xd07JjVc+zxqafYeF5tTifvQYduf7j1Ok96GBppFpZnPesJ29IfXoW1DlOyoRyfon9zpKkZUtZkXIo1mkFpW6OhOml0eirsYkKzR7ikNDeqols1qNUVpSgQn02eG5wjiN+TcaxjdOocGXV475j4HaoadahbIn2T5O4j+7isq3jsY=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24bc5a8c-6d2c-410f-7256-08d70a963d63
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 09:07:48.5895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nagasure@xilinx.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6668
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190717_020751_125676_4A3E43CA 
X-CRM114-Status: GOOD (  34.60  )
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
Cc: "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "richard@nod.at" <richard@nod.at>, Srikanth Vemula <svemula@xilinx.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 Michal Simek <michals@xilinx.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Boris Brezillon <boris.brezillon@collabora.com>
> Sent: Wednesday, July 17, 2019 1:25 PM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Cc: miquel.raynal@bootlin.com; bbrezillon@kernel.org; richard@nod.at;
> dwmw2@infradead.org; computersforpeace@gmail.com; marek.vasut@gmail.com;
> vigneshr@ti.com; yamada.masahiro@socionext.com; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org; Michal Simek <michals@xilinx.com>; Srikanth Vemula
> <svemula@xilinx.com>; nagasuresh12@gmail.com
> Subject: Re: [LINUX PATCH v18 1/2] mtd: rawnand: nand_micron: Do not over write
> driver's read_page()/write_page()
> 
> On Wed, 17 Jul 2019 05:33:35 +0000
> Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:
> 
> > Hi Boris,
> >
> > > -----Original Message-----
> > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > Sent: Tuesday, July 16, 2019 1:15 PM
> > > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > > Cc: miquel.raynal@bootlin.com; bbrezillon@kernel.org;
> > > richard@nod.at; dwmw2@infradead.org; computersforpeace@gmail.com;
> > > marek.vasut@gmail.com; vigneshr@ti.com;
> > > yamada.masahiro@socionext.com; linux-mtd@lists.infradead.org; linux-
> > > kernel@vger.kernel.org; Michal Simek <michals@xilinx.com>; Srikanth
> > > Vemula <svemula@xilinx.com>; nagasuresh12@gmail.com
> > > Subject: Re: [LINUX PATCH v18 1/2] mtd: rawnand: nand_micron: Do not
> > > over write driver's read_page()/write_page()
> > >
> > > On Tue, 16 Jul 2019 09:31:37 +0200
> > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > >
> > > > On Mon, 15 Jul 2019 23:30:51 -0600 Naga Sureshkumar Relli
> > > > <naga.sureshkumar.relli@xilinx.com> wrote:
> > > >
> > > > > Add check before assigning chip->ecc.read_page() and
> > > > > chip->ecc.write_page()
> > > > >
> > > > > Signed-off-by: Naga Sureshkumar Relli
> > > > > <naga.sureshkumar.relli@xilinx.com>
> > > > > ---
> > > > > Changes in v18
> > > > >  - None
> > > > > ---
> > > > >  drivers/mtd/nand/raw/nand_micron.c | 7 +++++--
> > > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/mtd/nand/raw/nand_micron.c
> > > > > b/drivers/mtd/nand/raw/nand_micron.c
> > > > > index cbd4f09ac178..565f2696c747 100644
> > > > > --- a/drivers/mtd/nand/raw/nand_micron.c
> > > > > +++ b/drivers/mtd/nand/raw/nand_micron.c
> > > > > @@ -500,8 +500,11 @@ static int micron_nand_init(struct nand_chip *chip)
> > > > >  		chip->ecc.size = 512;
> > > > >  		chip->ecc.strength = chip->base.eccreq.strength;
> > > > >  		chip->ecc.algo = NAND_ECC_BCH;
> > > > > -		chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
> > > > > -		chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
> > > > > +		if (!chip->ecc.read_page)
> > > > > +			chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
> > > > > +
> > > > > +		if (!chip->ecc.write_page)
> > > > > +			chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
> > > > >
> > > >
> > > > Seriously?! I told you this was inappropriate and you keep sending
> > > > this patch. So let's make it clear:
> > > >
> > > > Nacked-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > >
> > > > Fix your controller driver instead of adding hacks to the Micron logic!
> > >
> > > Not even going to review the other patch: if you have to do that,
> > > that means the driver is broken. On a side note, this patch series
> > > is still not threaded as it should be and it's a v18 for a damn NAND
> > > controller driver! Sorry but you reached the limit of my patience. Please find someone to
> help you with that task.
> > My intention is not to resend this 1/2 again. Sorry for that.
> > We already had some discussion on [v17 1/2],
> > https://lkml.org/lkml/2019/6/26/430
> > And there we didn't conclude that raw_read()/writes().
> 
> Yes, looks like I never replied to that one, but I think my previous explanation were clear
> enough to not argue on that aspect any longer/
You replied on that. But I thought that you have some more inputs to give.
Ok understood thanks.
> 
> > So I thought that, will send updated driver along with this patch,
> > then will get more information about The issue on the latest driver review.
> 
> More on that topic. I don't think you ever tested on-die ECC on a Micron NAND, otherwise
> you would have noticed that your solution completely bypasses the on-die ECC logic (and this
> will clearly break existing on-die ECC users). See, that's what I'm complaining about, Looks
> like you don't really understand what you're doing.
We tested it with pl353_read/write_page_raw(). Hence no information of bit flips.
As I said, will fix the driver to use micron _read_page_ondie().
> 
> > There is nothing like keep on sending this patch, As you people are
> > experts in the driver review, if this patch is a hack, then we will definitely fix that in
> controller driver. I will find a way to do that.
> >
> > But in this flow of patch sending, if the work I did hurts you, then I am really sorry for that.
> 
> I'm not offended, just tired going through the same driver over and over again, reporting
> things that are wrong/inappropriate to then realize you only addressed of a tiny portion of it in
> the following version. My last reviews were rather incomplete because of that, and now I'm
> giving up.
> 
> > Will fix this issue in the controller driver and will send the updated one.
> 
> How? You say you'll fix the issue but I'm not even sure you understand what the issue is?
> Clearly, the patch you've posted doesn't fix anything, it's just papering over the fact that your
> controller driver is not supporting raw accesses (or at least, not supporting it properly).
> 
> Have you even looked at the datasheet you pointed to in patch 2 [1]?
> Just went through it, and found a field that's supposed to control the ECC engine activation:
> ecc_memcfg.ecc_mode. I don't see anything changing that field in your code, so I guess raw
> accesses are actually not really happening with the ECC engine disabled...
It is happening, in the drivers ecc_init(), if the ecc mode is ON_DIE, then 
We are calling pl353_smc_set_ecc_mode(PL353_SMC_ECCMODE_BYPASS).
This will internally disables the HW-ECC.
> 
> > Could you please let me know if this is OK.
> 
> You can send a new version, I'm just saying I won't spend time reviewing it.
> 
> >
> > I will send the series as threaded one from next time onwards.
> >
> > Thanks,
> > pcieNaga Sureshkumar Relli
> 
> [1]http://infocenter.arm.com/help/topic/com.arm.doc.ddi0380g/DDI0380G_smc_pl350_seri
> es_r2p1_trm.pdf

Regards,
Naga Sureshkumar Relli

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
