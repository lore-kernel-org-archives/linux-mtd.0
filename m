Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5FEC2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 03:50:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B7C120735
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 03:50:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oMdRrw6Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="l9LHXR2s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Mkb3WB7p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B7C120735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIx8QgvmlE4yfMSIeQk1mpU0tfTGNT/PT0/ozWanC+0=; b=oMdRrw6QTauIK1
	8mj30bBQR5gWnL4DPTEr85qSD4G2HEh84ofreZQiVdVtdFIT0bEQ+R8NbLCW20fajuQcn8eHqTbV3
	j0ZVoLguvVMCMaZdwJUkovtyuadgC0C5qnWflhC++OeP+/K6Dt1i2yMBa0GWEelRsK+BsZOOQ6xHo
	rlcG9bKLKHafIV5Als62j2+YH9dJyZKi/G9f0uVXkrZpYraeDFF0Hgt2VV4k1jUzsPDyKgjV1j0e6
	ZjPtoxpQyUf5rJPxHmsmpjFnegJIsvt5sfvQzSOfvJj41nABam4ruRzExCwrOmYgmBorNqoV/2m+5
	p2CS4aKzuYHQcyReJ0Qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQjvI-0002dT-FW; Tue, 21 Apr 2020 03:50:12 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQjvD-00014M-9V
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 03:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587441006; x=1618977006;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rNz94cq+ZNimHM1gxyrz1FCFUFFTF4s/CxaxZh/TuCU=;
 b=l9LHXR2s/BF1EW+0DCzOYiM/7rjd/4aeZX2sSeidIrS3H3FiT2jOmc45
 iNIBAhONwjSvFLrowR05knehgXtVhx5XF8/TkUMhuBpNydKvkENNelza7
 kLK3ovx39ZLNimyqWmZ4Jq3V+/Jw0JcWEmF87A6aXchQNyx+i9N1Zj9Gs
 2pk2BklWuKkorE4M8ta6ITflv7ynL2S1qJU5Z9r7mp9nh/FWTvSIvIzOH
 uMxj4aPaOuG1tWuRy7I8+VCijbFhflKwwbMG+D7ZhESoSb3w65Z0zJxXL
 lVMDqA+GLkJ2d9tHcUHJFWCkXfz3eAiqntQjrtMKaPlMXZRyNS0zsvGoe w==;
IronPort-SDR: f5lEwePConpMiSTyD8hdPI9ms4zj7QkpmiNmRuLbjx3CbnQMlV76Af4RpdsQ2EOFWNaF/ZDAu+
 P2Yo/myofWc7mS7+kZk/63nHxAbp/bnbVPgE0DqC321PI0ySOQkdGaYwGwhj8XbAJ+/58X/JJC
 QfvSkL+641Ae/TbZlWn4AfmV3qoXjk/VcOv4BW7gmg5RNut0Z6+ReE7IczRUq36vbLTK4YXxQL
 5t9/eAHhsVJtcdIuBKTA7PdaoEwHnXwNr+CPFJa54fIKH+C/6s7bW0lf3khme6etLr6Vdw2ZkJ
 9WE=
X-IronPort-AV: E=Sophos;i="5.72,408,1580799600"; 
   d="scan'208";a="9857200"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2020 20:50:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Apr 2020 20:50:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 20 Apr 2020 20:50:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzE+nRF1Rd6urCv2DNvwV+PGRbqcpIpiH9Jcmz/5GJn7VNjlYzsfQ1oCWGui6PpvG11a21S+tsCFMNn/pomNwvmjUDrJn8PHnYlqz6ONjXM809dJvhfD3ATZ0uQfOpxWwDEiOkGEZP3G422ibobLFRPmki2FuV2TJ2s4/re/Dfd9uO125CK739wC7p7AyH8FFsbkq8eY8hd1ufoiL/KtAKXRnRciSMO7WnHTgiMlbeF7h0pz1og8+o2Ae36FHytoBWcYEK7lJ5H8AKXqxAI7Vx+t0kM/A0kwonX6k9YWd7yGzovwYUSYmvpl4HYRlpPHSOzmRIpSOgSq/XOKkBgzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDr5Qs+uTJ6wrMKpbUJ8EykqRFjRbGApTXiLGqY5B1Q=;
 b=ZZoEoNwZJP04z7Wz/inqVcwnPafPitqaGsB5EXecXKNck9e60LIzCbssDmsbO8ckkGpLc4jf26uBDrX6Zpy9a7tr1xVJ+LRFORzoIPWNWrMcGVUvde/FlSBTjcQtWPpzrS/E8g14YMYVKnf4q7nFecepMgvCtzAZuxHm7ts/7crQ2ZTSxV+Rqtc4CxexE2vZr5x7abFt5J8uVYE4FI9BCztBOEhbQoLYCFXALbslw3FBu2EaS3SvfH3MnW3pZOUhCGx9AQ83vwPmWRPGIBWFB0PhsI98WuHzSKcLqi0QlRfk6ue4s1M8gf/7cY4yuXamPJFo7t6rrSXBMNczea7IXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDr5Qs+uTJ6wrMKpbUJ8EykqRFjRbGApTXiLGqY5B1Q=;
 b=Mkb3WB7pDzheCDeB+q1/WbvPBvicPMrjPhl6sVdSEUTtQKEvuzwY3mw1SYadpz58hF6G6dGQ/2GFgZQtK+dtTPQ2nFtW1B3vVQojI2yHZPp10ZMc/zhBvHfVjy10gbMPGFFUMb3AdTcXDYEzSnIpVcFY590NfiKK9Ct7rZJKvrI=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4465.namprd11.prod.outlook.com (2603:10b6:a03:1c0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 03:50:01 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 03:50:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 4/5] mtd: spi-nor: fix kernel-doc for spi_nor::info
Thread-Topic: [PATCH v2 4/5] mtd: spi-nor: fix kernel-doc for spi_nor::info
Thread-Index: AQHWFvT7+f0vyvpGZ0ub06KV7IY+MqiC8fIA
Date: Tue, 21 Apr 2020 03:50:00 +0000
Message-ID: <2315416.MpkWB2DdKe@192.168.0.120>
References: <b82675c7-9c90-d0a5-f221-9f51f89e448e@cogentembedded.com>
 <2f00fec3-8385-a7f6-6bae-9014fd46fb9b@cogentembedded.com>
 <8251539.igJhlKP8h3@192.168.0.120>
In-Reply-To: <8251539.igJhlKP8h3@192.168.0.120>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcb8ac07-b650-48cf-d16a-08d7e5a71177
x-ms-traffictypediagnostic: BY5PR11MB4465:
x-microsoft-antispam-prvs: <BY5PR11MB446529B24AFD219CA3CBFB53F0D50@BY5PR11MB4465.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(136003)(366004)(376002)(396003)(39860400002)(346002)(54906003)(2906002)(6512007)(66556008)(9686003)(478600001)(66476007)(6916009)(66446008)(64756008)(71200400001)(81156014)(66946007)(14286002)(76116006)(91956017)(26005)(8936002)(5660300002)(86362001)(8676002)(316002)(6486002)(6506007)(4326008)(186003)(53546011)(39026012);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H9RcNTmvNeaPCZhskZH6tmGnzQ5+gMYYGV669YzuPZKHd2DDnUxSyyV7g0DIctHYf4szhaA3FtV9YTG5kS20uq8cAM6vbTMKHQK3IaDM+nHxArChBrY/XR9tMVPh1vG4/H+oOSjeePcNgd5Bul4mNzDjTPxXOM6ZR6IhA3x/OKqSEOy32Ie/Htflta2cE2kxiFq0/X4eOP9pZBFlA6aAlDrId6g0zGg+PtGTXdUCRZg3vSl4/RtY6MDKLKWVsZFdOa5CZ6huGd8wYsq9iJrmQjWGd+GAtjY8rWvBSYrPAwoQU1D/2JIjO5llrSmNu0UmLIeK3ciObxVoPlm5t52pM5D9c0O1sYAw+oJGDLTwk7OjvWohsvNkMiD/tnFZj4/Z5kyql1CnfimkgLGJ13bTi7qfysO4ZLlj5DVDpAkVOT3QfOKpCGLKA1tfAkMXytQYN9VCCssNifSs1EXqOXMDedijb6I7k1veRZrDzG7WSmcxIQ2znQ4no+N2r8G+fCx6
x-ms-exchange-antispam-messagedata: 7otlzbj+TgldpUAx7TQNHqyiYVtCJOf4MYw5LD/uyiSb5rBm0hNfLbPD1zygzITiuRfv3O3bnYe+OHcCoa+stHOxrXMqHJtuFx0y2TWP8c85EyzZoCP9Je+RFAO9c8MYouqQsUiKHIqfi8WZUYRX3g==
x-ms-exchange-transport-forked: True
Content-ID: <C0C3E1903376A1439815A62638AF2926@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb8ac07-b650-48cf-d16a-08d7e5a71177
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 03:50:01.0609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K5AjFjNviCID9wdol6jrMI7fX7WEKW955b9XSeZTi+Mku8kWm6qvw6Mr5r8l9O0ifeicZsIDZofNeMCH07zrIEsT0eArPkYkNCpaaIkPYzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4465
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_205007_594346_5722DC40 
X-CRM114-Status: GOOD (  22.10  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, April 20, 2020 12:20:48 PM EEST Tudor Ambarus wrote:
> Hi, Sergei,
> 
> On Friday, April 3, 2020 11:49:48 PM EEST Sergei Shtylyov wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> > content is safe
> > 
> > When adding the 'info' field to 'struct spi_nor', some acronyms were in
> > lower case and some in upper case and the JEDEC acronym mistyped -- fix
> > these issues.
> > 
> > Fixes: 46dde01f6bab ("mtd: spi-nor: add spi_nor_init() function")
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > ---
> > Changes in version 2:
> > - rebased to the 'spi-nor/next' branch of the MTD repo.
> > 
> >  include/linux/mtd/spi-nor.h |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > Index: linux/include/linux/mtd/spi-nor.h
> > ===================================================================
> > --- linux.orig/include/linux/mtd/spi-nor.h
> > +++ linux/include/linux/mtd/spi-nor.h
> > @@ -335,7 +335,7 @@ struct spi_nor_flash_parameter;
> > 
> >   * @bouncebuf:         bounce buffer used when the buffer passed by the
> >   MTD
> > 
> > *                      layer is not DMA-able
> > 
> >   * @bouncebuf_size:    size of the bounce buffer
> > 
> > - * @info:              spi-nor part JDEC MFR id and other info
> > + * @info:              SPI-NOR part JEDEC MFR ID and other info
> 
> There is an inconsistency in this file when referring to SPI NOR. It's
> either called SPI-NOR or "SPI NOR". While I don't have a preference whether
> to keep the "-" or not, I think we should be consistent across the file and

Probably it's better to have "SPI NOR" instead of "SPI-NOR".

> use just a format. So would you care to fix all the comments in spi-nor.h?
> 
> >   * @manufacturer:      spi-nor manufacturer
> 
> 		^ here's another problem.
> 
> Also, I think I would fix all these typos in a single patch, the fixes are
> trivial enough, without affecting functionality and I'm not sure it is worth
> backporting them. But again I don't have a strong opinion, so if you want
> to keep these in separate commits that's ok for me.
> 
BTW, the rest of the patches in this series look good. Let me know if you're 
going to resubmit and address the rest of the doc/comments issues in this 
file.

Cheers,
ta



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
