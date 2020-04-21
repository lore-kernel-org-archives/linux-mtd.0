Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF57CC54FCC
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 06:59:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B28CD2073A
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 06:59:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y6YgpXBX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Djc8tQUa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="rllyWBna"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B28CD2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QYbQmeECUyZ7uQI3u3HwY61CyYXg/vB+DHPgSUwUEDw=; b=Y6YgpXBX51rNnZ
	8gHZLJ1PVo09RgJSJruTCE9ysOKbEQ2YdT09DSqUlQgtaRzfEIThRd9oDkP81UAj2vOENsak7ePz3
	8SKTcl78fwgMe0dRJcE/M1dhimSHocb6t306l/affJMDRnJ7X2d331qBWjsaMcvQO1Y7QZ3Ezjxj6
	GGRMLBGNnyQyRuDtXSL7ZsutTO3PxcolSDXf9SorMJjEz5vH4QxhMPxK1WrXeBeVsYLKV7JK1mPug
	L9lb6Zv7nVokZ6eTRCLAVzYZlsN5i7icbXlagCRu5c4Cpuc3zbmwhgTOv7IJWnAcCQZBubg4yL7ne
	t/IcZog0riQklJJvq4cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQms4-0001J8-Dn; Tue, 21 Apr 2020 06:59:04 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQmrz-0001DC-DZ
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 06:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587452339; x=1618988339;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=z7PNDeln6j1E0rigfzFRkuJwru0Q61gtUZgc1BZBlYs=;
 b=Djc8tQUaHYpoLw4tD7GHbbv4Sg6kdO3PQlS0Hk/SXMr1yLzA6P6694dT
 ZGnzbrKylFPc/td4D2sWeauIqSYb7bhqy7KMipt2jGNljqNsDKN61d340
 nZ21DnAJI6o3rQkW0InDJFl5lk8szu2jPuJwzY05x1LRSMIREjpacaS7+
 7LrrcjyfIWPpy197BpTw123/4XYP0RmEW6f1KWR0mezz4zDwDahRzS248
 rRjIzhf86WU0rAMx2hzBAoBkmZqUrDVX79SAYQcR4+lAnZ6///V8Kyaz4
 yZS/ZdXVHfwhEeUGoLUjtt1zsUMjBiRn4PyVnRgaqvXlMdLELQ7qcIORm w==;
IronPort-SDR: 10ujuXmvau6TEwbh6ZLuN2OUZI9XUKtJAKrEpZs4ebYLJhjdCX7i5CMK8G2oC6OzM1UlKIxPhr
 dpMuAMgBEdCduhItJAZqJ84cJEjfT7m4DGI0VC8GkX0c/ha+pqOX7M0UHFrJDEUerquqtg4i6A
 jRkSQU+ohe+qn2ErWdGLxiSMXt8E16+rcY9g0j7376QipILOFkI98wJ6nofq/t1et26sNBiAko
 sacTquKfj2SqCxDCJNdldGWWiaHQJeE8Fz6kqZLnloi4hSe5nVerQXXACI8z58TrUJDNpi+7x1
 eh4=
X-IronPort-AV: E=Sophos;i="5.72,409,1580799600"; 
   d="scan'208";a="9870429"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2020 23:58:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Apr 2020 23:58:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 20 Apr 2020 23:58:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xf0hgq+6c3KlJ4o4oJYYWg1h79rLYjpMTEMR/9qR7WcSvf7vT2HI51wdwD7m4nh/FpaPaBA1QElKE+AC3evErfYl1VFoPtSkl6kBEMGS5sZbYSgPbzuoTWaSg9Mlm3M2q3zLS1IJpctqGug5I2ySo13O5SUECUeB4kUDpOlCybdn+SIkh7+CcGuJQzqsUhiUYPfR8WksM+KzdWP8p0ciBPr7OpW0Vbd5zZ2W4TqVs44X3UT71cfcrhdmYmuL8Rj9BYxL4D9FYEX4hH+tPuQ1VF9ujGAN5ontri/sl2zEeOVfnd2hQUxt6befVobEgtcxg2jHxWLEvOPsZLDLxCU2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IFqhmJi1yFMiiPmY/V9/b48p+Bo2oPTC3G6NcEObSM=;
 b=f3lKy2YQYtvj630pSd7w5QZe39CNlDufIIvEfpIOxYrPtghPTp5eZVTl1f0ScJWIDKtFq5aszRTzem+wM1yqhkauTKLblEXhlGCdFVTFTQ8mUJ45qpcPlu6aS/9nkKOLFDW9RzqvaMOVY0VUbGzG3ooadFoKVbYp0+TsZiKdFnORNkH/8vFI2tdF/SyUQYIeZtBa9rh4C7uIczYkcnNTM0X6w7VzqwtgDrMSrqxYQjD/YP541lxwPifOOuZXv/fU9ELGSSIS6fh2gZM0CsafkMkbW/7H9CYZC/xM3SmJdCt6CDP6yX8mzjUBO22EPDwIwzTts9T6bC14kKKBqPxyig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IFqhmJi1yFMiiPmY/V9/b48p+Bo2oPTC3G6NcEObSM=;
 b=rllyWBnaA05lBrTW4NMorGRUuhnG7ELJCqudJHcn72uWk1GUZUqPhCY1jy2DZ91baWDeioSGM45jJqCdJyHRDiS2lRTCmVqcgrwIQBmqbiI1cf6Xhd3EGbIgK/g9Wy1WhG6zaulQPRgLcs7beQ6qcqJ6XnXqgZgiMA0GxK6FzN4=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4119.namprd11.prod.outlook.com (2603:10b6:a03:190::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 06:58:56 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 06:58:56 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mantas@8devices.com>
Subject: Re: [PATCH] mtd: spi-nor: fix 4-byte opcode support for w25q256
Thread-Topic: [PATCH] mtd: spi-nor: fix 4-byte opcode support for w25q256
Thread-Index: AQHWFwHieCOFTav6rUeke0dD3DMEOg==
Date: Tue, 21 Apr 2020 06:58:55 +0000
Message-ID: <14454062.LuVNJbZNcS@192.168.0.120>
References: <1586958510-24012-1-git-send-email-mantas@8devices.com>
 <43054851.jYS1km7NsV@192.168.0.120>
 <e4826369-f239-4b67-1da8-f7d9c8357abe@8devices.com>
In-Reply-To: <e4826369-f239-4b67-1da8-f7d9c8357abe@8devices.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7b6a09a-c8f3-4137-b303-08d7e5c17594
x-ms-traffictypediagnostic: BY5PR11MB4119:
x-microsoft-antispam-prvs: <BY5PR11MB4119374D03CCA34DAD87F88AF0D50@BY5PR11MB4119.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(346002)(376002)(396003)(39860400002)(136003)(366004)(66446008)(8676002)(66556008)(64756008)(86362001)(66476007)(316002)(76116006)(186003)(4326008)(9686003)(54906003)(8936002)(14286002)(2906002)(478600001)(66946007)(6916009)(6486002)(53546011)(6506007)(5660300002)(91956017)(26005)(6512007)(81156014)(71200400001)(138113003);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: opwVdn9Mow/pTLCh/PalfB/HReSm3544w+k8q9GC51zRXS7mY4UP06KfFRxlnu2BRBo+9CQqrWcPEHdJwPZbQmEorkfW9Y4SB13hEcmmY92FaZh3BgppOr1S2ipgzyOsST/DFP+4ww75lh4zlyjciRNi5J5p209vKxLz8NEAsM2R0m9yb/bSJvOC20KbzRFnd6RzY9/mV9KJ5aaH2qOH6VRpSq6iVofetz7rgmQ8u33l4iu/0kR+Rn2uZ4kOdKyfKeXdYpjqESqXRIFs80wNCnQxBnkQpgojyjzkRW2XEpBZFzWch801aHbrPSuLWZRECvVfDggSlqf0nZK79QXkyRSpDD1MBnIGBmG//9+gM7wnyZH+NlF7cFjMn2ZjBXQ7TXuBeX614zb7ET51EyxIWI/FcbPJ2fFJWbMP3B3zcYBhMat8bbWNHSimSgU3zY/Z2oNJiLy5VxGYMJmChT9W5jnZPHlrA4VZv59uMd0BSodbUSN+AT2cafSsh+/tepUw
x-ms-exchange-antispam-messagedata: +MLIQdO65u+jYXjHLhaAKnGJHyhXrRKl6hru4OrtSvh9jFUZhMkIQ9MtojiYAUvRxoYDzDEgFIH4gdzIlrkI8ILN6uAAbssjYpHvR65wkmgmGWukEO9TVJCz1ZCV2LLl0Xqs/lAlFofDU8Lb7mnZaQ==
x-ms-exchange-transport-forked: True
Content-ID: <8CC4F17F81862A49AAFE2791F1894642@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b6a09a-c8f3-4137-b303-08d7e5c17594
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 06:58:55.8224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joi7H8eXjHhdhE8xYVxkPjRo5T1FbaPSAT2+CeiT+0f7FZYxsDhTlrvnnXBffGy13G+6hfsSDug90SMMsY8CJB/0uymemwjl6H5yL4voRLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_235859_531310_2C6706B8 
X-CRM114-Status: GOOD (  21.15  )
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
 robimarko@gmail.com, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 gch981213@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, April 21, 2020 9:08:30 AM EEST Mantas wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> On 2020-04-20 13:53, Tudor.Ambarus@microchip.com wrote:
> > On Wednesday, April 15, 2020 4:48:30 PM EEST Mantas Pucka wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >> the
> >> content is safe
> >> 
> >> There are 2 different chips (w25q256fv and w25q256jv) that share
> >> the same JEDEC ID. Only w25q256jv fully supports 4-byte opcodes.
> >> Use SFDP header version to differentiate between them.
> >> 
> >> Signed-off-by: Mantas Pucka <mantas@8devices.com>
> >> ---
> >> 
> >>   drivers/mtd/spi-nor/sfdp.c    |  4 ----
> >>   drivers/mtd/spi-nor/sfdp.h    |  6 ++++++
> >>   drivers/mtd/spi-nor/winbond.c | 30 ++++++++++++++++++++++++++++--
> >>   3 files changed, 34 insertions(+), 6 deletions(-)
> >> 
> >> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> >> index f6038d3..27838f6 100644
> >> --- a/drivers/mtd/spi-nor/sfdp.c
> >> +++ b/drivers/mtd/spi-nor/sfdp.c
> >> @@ -21,10 +21,6 @@
> >> 
> >>   #define SFDP_4BAIT_ID          0xff84  /* 4-byte Address Instruction
> >>   Table
> >> 
> >> */
> >> 
> >>   #define SFDP_SIGNATURE         0x50444653U
> >> 
> >> -#define SFDP_JESD216_MAJOR     1
> >> -#define SFDP_JESD216_MINOR     0
> >> -#define SFDP_JESD216A_MINOR    5
> >> -#define SFDP_JESD216B_MINOR    6
> >> 
> >>   struct sfdp_header {
> >>   
> >>          u32             signature; /* Ox50444653U <=> "SFDP" */
> >> 
> >> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> >> index e0a8ded..b84abd0 100644
> >> --- a/drivers/mtd/spi-nor/sfdp.h
> >> +++ b/drivers/mtd/spi-nor/sfdp.h
> >> @@ -7,6 +7,12 @@
> >> 
> >>   #ifndef __LINUX_MTD_SFDP_H
> >>   #define __LINUX_MTD_SFDP_H
> >> 
> >> +/* SFDP revisions */
> >> +#define SFDP_JESD216_MAJOR     1
> >> +#define SFDP_JESD216_MINOR     0
> >> +#define SFDP_JESD216A_MINOR    5
> >> +#define SFDP_JESD216B_MINOR    6
> >> +
> >> 
> >>   /* Basic Flash Parameter Table */
> >>   
> >>   /*
> >> 
> >> diff --git a/drivers/mtd/spi-nor/winbond.c
> >> b/drivers/mtd/spi-nor/winbond.c
> >> index 17deaba..50b2478 100644
> >> --- a/drivers/mtd/spi-nor/winbond.c
> >> +++ b/drivers/mtd/spi-nor/winbond.c
> >> @@ -8,6 +8,32 @@
> >> 
> >>   #include "core.h"
> >> 
> >> +static int
> >> +w25q256_post_bfpt_fixups(struct spi_nor *nor,
> >> +                        const struct sfdp_parameter_header *bfpt_header,
> >> +                        const struct sfdp_bfpt *bfpt,
> >> +                        struct spi_nor_flash_parameter *params)
> >> +{
> >> +       /*
> >> +        * W25Q256JV supports 4B opcodes but W25Q256FV does not.
> >> +        * Unfortunately, Winbond has re-used the same JEDEC ID for both
> >> +        * variants which prevents us from defining a new entry in the
> >> parts +        * table.
> >> +        * To differentiate between W25Q256JV and W25Q256FV check SFDP
> >> header +        * version: only JV has JESD216A compliant structure
> >> (version 5) +        */
> >> +
> >> +       if (bfpt_header->major == SFDP_JESD216_MAJOR &&
> >> +           bfpt_header->minor == SFDP_JESD216A_MINOR)
> > 
> > Not sure if this is generic enough. Are you sure that the JV version will
> > never have an update for the sfdp tables?
> 
> No, I'm not sure. I also don't know about other changes that may come
> with a version update: will it have 4B opcode table? will it be

new 4bait table will just OR the SNOR_F_4B_OPCODES flags, no problem with 
that.

> different version again (say KV) with it's own quirks? Fix only what
> needs fixing was the idea. But I guess chances of new chip with no 4B
> opcodes and new SFDP table are pretty slim, so I'm OK with having >= in v2.

stripping 4B opcodes from a revision to another would be a first, but you're 
right, we can fix others when needed, so no need for a v2.
> 
> >> +               nor->flags |= SNOR_F_4B_OPCODES;
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static struct spi_nor_fixups w25q256_fixups = {
> >> +       .post_bfpt = w25q256_post_bfpt_fixups,
> >> +};
> >> +
> > 
> > If the post_bfpt hook is called, you already have a valid bfpt table. If
> > the differentiator between the JV and FV versions is that only the JV
> > defines the SFDP tables, then your w25q256_post_bfpt_fixups() can look
> > as:
> > 
> > static int w25q256_post_bfpt_fixups()
> > {
> > 
> >       nor->flags |= SNOR_F_4B_OPCODES;
> >       return 0;
> > 
> > }
> 
> FV chip that I have, do actually have SFDP tables (with
> minor_version==0). I've saw Chuanhong reporting that some FV chips don't
> have SFDP, but certainly this is not the case for all of them.
> 
oh, the horror :). I think I have a w25q256 somewhere, allow me some time to 
do some tests.

Cheers,
ta



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
