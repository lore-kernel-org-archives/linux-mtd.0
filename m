Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015B2C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 11:09:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8326205C9
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 11:09:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GRVJmSXL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="iKah0Zbq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8326205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0PofrH5a5tvp5mvKK+exTHcVYgevtqOUcGlniiNZeQ=; b=GRVJmSXLx6Snz4
	HRctD11hQDWZqbOzk12uh2m9+60BpaHrat2iqk8A9Yks+vT0mazTelKkYaxDSHDiZqgliE3R0s7TI
	CxHOgUSNiipROK9sb1c57JwuxTgw36PJM7a7ZTowyNP++OB189WvnobnL3NqRieTjid838kqUnZpA
	OnTcfFfseyNsQ/PanxxJ9qFv1lc9Vpj2NvrxBLMH88NeunvJPmtpa6h21jqIYEdeb9l9MntXh1jRv
	p4wX6b3A/B/kdC/Xn2h4YYWYxDabdb6eIXcmeJxoISIAj8TXDXA/iielHjy3UGlljx2ns278OCFgt
	qWe+gUtKGaSxD32ToPYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9pNc-0006IQ-LG; Fri, 29 Mar 2019 11:09:00 +0000
Received: from mail-co1nam03on0610.outbound.protection.outlook.com
 ([2a01:111:f400:fe48::610]
 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9pNY-0006Hv-Bh
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 11:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4Vh+/WNk68BZzHxjsdD2yDd0fRnNLJ+H0k1/ZNZ4qg=;
 b=iKah0Zbq3yrm1VxYnECl0r3NB/tzLBUDldZAv72kSELWGYZ/uNGdPow/RcVKhYLYWhyF+dxMhMLM2QZL/jsbZuCY1rm/rlUpIrGXsOTMfRzdkE/xyXiiuM3NM70Ma1oOo18z6/3oE0iLVvOvhLeRBd0U/0Sm4Ls1Dbigd9a2x5I=
Received: from MWHPR02MB2623.namprd02.prod.outlook.com (10.168.206.9) by
 MWHPR02MB2430.namprd02.prod.outlook.com (10.168.204.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.15; Fri, 29 Mar 2019 11:08:52 +0000
Received: from MWHPR02MB2623.namprd02.prod.outlook.com
 ([fe80::c89d:e485:cb5e:89cf]) by MWHPR02MB2623.namprd02.prod.outlook.com
 ([fe80::c89d:e485:cb5e:89cf%5]) with mapi id 15.20.1730.019; Fri, 29 Mar 2019
 11:08:52 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: RE: [LINUX PATCH 2/3] spi: spi-mem: call
 spi_mem_default_supports_op() first
Thread-Topic: [LINUX PATCH 2/3] spi: spi-mem: call
 spi_mem_default_supports_op() first
Thread-Index: AQHU5Ve+/XGEIGmXmEig+1VwCkqidaYhdasAgAD9PwCAAAHSQA==
Date: Fri, 29 Mar 2019 11:08:52 +0000
Message-ID: <MWHPR02MB2623F73BEA721D64EE2C3BF9AF5A0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1553771784-3364-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20190328205522.272e1da6@collabora.com>
 <cf7c971c-4b58-e965-3ca7-b72239772737@ti.com>
In-Reply-To: <cf7c971c-4b58-e965-3ca7-b72239772737@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=nagasure@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c52ad7d-cdf3-4c0b-6a16-08d6b436ed67
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR02MB2430; 
x-ms-traffictypediagnostic: MWHPR02MB2430:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR02MB24303046B0BDF5110D7B4C31AF5A0@MWHPR02MB2430.namprd02.prod.outlook.com>
x-forefront-prvs: 0991CAB7B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(376002)(346002)(396003)(136003)(13464003)(189003)(199004)(71200400001)(486006)(74316002)(86362001)(2906002)(316002)(8936002)(305945005)(110136005)(25786009)(102836004)(5660300002)(54906003)(9686003)(53546011)(6246003)(6506007)(76176011)(26005)(7416002)(97736004)(99286004)(6436002)(55016002)(105586002)(7696005)(81156014)(7736002)(33656002)(68736007)(106356001)(6306002)(476003)(478600001)(66066001)(966005)(14454004)(11346002)(3846002)(81166006)(71190400001)(53936002)(6116002)(14444005)(186003)(229853002)(256004)(52536014)(4326008)(446003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2430;
 H:MWHPR02MB2623.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YgxiA9nh2mGzWTk0XD/lxQR8d2/CB94/pzlhct3+qHn29laKYbGYsFK5ScfZSiZjBY9jXLyoGCtJjEKRa8P8BxymtlOrHJTb6tzZb72dgrzSgvMKtgkGJVEFnXW+FTsBiK3Q+q4MugGpIU1oOpMeBS2xC+vgYDxuFm7laY7BzkBS2ziJeTdkXZBHeJoSohc8uKHM/ApxAwG0jw5STxEyGr/R4vej6/wXMYMSrF6qjeM1nBXxK5OtIdJaVhS9jnfBRbo0tpPdo3DCihIIPOjKP8zxbH6dCst0ipR8Mu4kiNeWRx6p1c4eVUJ9VINaJCdUPc23xMo1IHWLOYI030k/3YPARVZYUYwpRmctwESQtTFH1ZAbWoR5MGd11MrMaV5FOpK3Y1bX91jnhIhPrBUf9jusJ6/d58nmvJPKps7uHyQ=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c52ad7d-cdf3-4c0b-6a16-08d6b436ed67
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2019 11:08:52.2694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_040856_454332_B5B144BB 
X-CRM114-Status: GOOD (  19.42  )
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
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>,
 Michal Simek <michals@xilinx.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Vignesh,

> -----Original Message-----
> From: linux-spi-owner@vger.kernel.org <linux-spi-owner@vger.kernel.org> On Behalf Of
> Vignesh Raghavendra
> Sent: Friday, March 29, 2019 4:32 PM
> To: Boris Brezillon <boris.brezillon@collabora.com>; Naga Sureshkumar Relli
> <nagasure@xilinx.com>
> Cc: broonie@kernel.org; bbrezillon@kernel.org; linux-spi@vger.kernel.org;
> dwmw2@infradead.org; marek.vasut@gmail.com; richard@nod.at; linux-
> mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Michal Simek <michals@xilinx.com>;
> nagasuresh12@gmail.com
> Subject: Re: [LINUX PATCH 2/3] spi: spi-mem: call spi_mem_default_supports_op() first
> 
> Hi Naga Sureshkumar
> 
> On 29/03/19 1:25 AM, Boris Brezillon wrote:
> > On Thu, 28 Mar 2019 16:46:24 +0530
> > Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
> >
> >> Call spi_mem_default_supports_op() first, before calling controller
> >> specific ctlr->supports_op().
> >> With this, controller drivers can drop checking the buswidths again.
> >
> > No, this was done on purpose, in case the controller does not want the
> > default check to be applied (say it does not need bus-width props to
> > be defined and has another way to check if a device can be accessed in
> > dual, quad or octal mode).
> > Just call spi_mem_default_supports_op() from your driver
> > ->supports_op() hook if needed.
> >
> 
> Could you rework to follow Boris's suggestion here?
Sure. I will update.

Thanks,
Naga Sureshkumar Relli
> 
> >>
> >> Suggested-by: Vignesh Raghavendra <vigneshr@ti.com>
> >> Signed-off-by: Naga Sureshkumar Relli
> >> <naga.sureshkumar.relli@xilinx.com>
> >> ---
> >> Details can be found at https://lkml.org/lkml/2019/3/1/183
> >> ---
> >>  drivers/spi/spi-mem.c | 7 +++++--
> >>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c index
> >> 5217a56..56aa158 100644
> >> --- a/drivers/spi/spi-mem.c
> >> +++ b/drivers/spi/spi-mem.c
> >> @@ -189,11 +189,14 @@ static bool spi_mem_internal_supports_op(struct spi_mem
> *mem,
> >>  					 const struct spi_mem_op *op)
> >>  {
> >>  	struct spi_controller *ctlr = mem->spi->controller;
> >> +	bool ret;
> >> +
> >> +	ret = spi_mem_default_supports_op(mem, op);
> >>
> >>  	if (ctlr->mem_ops && ctlr->mem_ops->supports_op)
> >> -		return ctlr->mem_ops->supports_op(mem, op);
> >> +		ret =  ctlr->mem_ops->supports_op(mem, op);
> >>
> >> -	return spi_mem_default_supports_op(mem, op);
> >> +	return ret;
> >>  }
> >>
> >>  /**
> >
> 
> --
> Regards
> Vignesh
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
