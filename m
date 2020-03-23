Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0256CC4332B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 12:55:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB98C206F9
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 12:55:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H2I0Vz6I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="rCkhO7RN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB98C206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTX/pfIr3RyIpQAZKHRKuJTHDc/szIj1P4hd5a1+g3U=; b=H2I0Vz6IYjDhXb
	HbRSRyfJI0QIhu3rxb4Sk21h5v1F6aEXqt/2uf/Tj/ZDhVoWupyGF4mx1uKaxh6Xbo7CX7QjXM1+I
	vg6G3+r4OfHiLd81Z3y/u054+ItUU+Ba/EH82v36rfSmWGkirTlByJy86zFIZpwOY47ikHe/Hx216
	ASBCZJUwOOHruAwE/lII8+6xGcFiqDjWM9hJg72Rz4UFYqDFahsGUP6oev/YKusMr7mqOF1nzLIMt
	0ZsqGj44oJRvpOD4y3Q4qbhKUL6Od9fm9tvC35ktaJokVzA51XMJBgPBVoQ4tMHzsNMxw1XKKVc2Z
	9zJUQq5xVn2z3CVemuow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGMcS-0002EF-1Q; Mon, 23 Mar 2020 12:55:52 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGMcN-0002CY-WC
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 12:55:50 +0000
IronPort-SDR: 5AdLF/4XZNCxDdRkC+Td+WHTV3G73MSFmaspQJichpDlFXB628Pqlnllz/QmEs+cH8eNy01zp/
 nRZXTd6+o4ZYrQ6J+kNsigKlEEa1CpVkaDvS7peZVpzugaDYEmTw0vb6l8n0/kCRKOGposf+5I
 5NfTf3/nJYHCwShHYlwWkXk4aFRmRnS+pRlbWzZJGI1zDnvXJFBoq7wus+3W89UwT7cXurvq0P
 SQs32fBgQJWCfSQVYqZlH+N4Jgf5bAvsGf4J2Y15zqsvcsh+vh4Ab2aT4hpFeRFIQdT6VFrT31
 3mE=
X-IronPort-AV: E=Sophos;i="5.72,296,1580799600"; d="scan'208";a="70916531"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 05:55:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 05:55:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Mar 2020 05:55:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVz4oL0pO7avj4dJObnwoxuWwtwL6RKn5tjdDsbuMi3r+zQOCS5jlLrvwjdiYP57OcZJq4U7isW1uBPXupM8l0jmiroK0zxaVu51miXIoP92xanMHcuZAbuHVdsEIlMuPQuxmdCdEgsATIl56pxFGI1iDqGwElCjQTGFHa5FqfVZ6uWOw2snhwLZHHbiSVCuhJA0bObbHMjk6691yc9gOHbqIxc04WJN9MUC+fPWYM9aru42QJ9oaC6TS8r3Oux4pv/oA/H2Gx5fDRr4UUT5ilXBNdHGrnVRbYj+SsAA+JKy+I7dox2T7s/7etgaDjzWvD28xvW5xltIGFbu0EimyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hx+intj+ziBo8fk0xVsSMFhJo27j0Pk4IBJCpTgmbTg=;
 b=B11veqDI/gjfsm3aFxleOqJyWF2vWBa5uyvKEoDATBsy4WAAfj29bkdFCH9wLHTRmLu6Mv7Jk5C0nrJb/d34oInIh1uEXmXNefzFcQF0p9UiDLXwxKZDk4BTY+uxZ/4qJ/BfZXJujv+CiR4x0uG8xlajMH3rq6QnrLTkHgE9CqJsTX2A6IW+o9iSM4CTzqMHTVunJJiPwjgBPdkUXB2ZdLYxp1v8OI5zRrIfIwdYlFewcyVGR1juriQGEdZ3VmT/NuxPXowZz0mae28Pzpm+0oogmB7jvYRf3M2xq8puPF2PqkiVn2l5o3aSFD6uuyHJGOQuufvP4Lx5NIFOvMLhlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hx+intj+ziBo8fk0xVsSMFhJo27j0Pk4IBJCpTgmbTg=;
 b=rCkhO7RNs2nrYd3367958vPFJB/dQR0tSxxUtZyVJ1EqxVe8cacFN1K6nmMSJurDqZ1w1TTsCXEyTPnRrvYuc/eEY0gLQ7yyOHKQP8vaRWTSPU2Pd8GmQQnuZrFD6e2qgMokwMwxmBjxb131R9mP6yGnUQIdPtXI+k2F+Pu/S4w=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4386.namprd11.prod.outlook.com (2603:10b6:a03:1bc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19; Mon, 23 Mar
 2020 12:55:40 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 12:55:40 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>
Subject: Re: [PATCH v3 4/5] mtd: spi-nor: Add SR 4bit block protection support
Thread-Topic: [PATCH v3 4/5] mtd: spi-nor: Add SR 4bit block protection support
Thread-Index: AQHWAPTegR7iigdWDECxp9El2paD96hWH0yAgAADfoA=
Date: Mon, 23 Mar 2020 12:55:40 +0000
Message-ID: <8548006.u9pkoXE8D1@192.168.0.120>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <20200323092430.1466234-6-tudor.ambarus@microchip.com>
 <26331bf950dc9945aad93f874dcf15d639fe3424.camel@samsung.com>
In-Reply-To: <26331bf950dc9945aad93f874dcf15d639fe3424.camel@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a793b714-0ccb-4fe0-9ecd-08d7cf297da4
x-ms-traffictypediagnostic: BY5PR11MB4386:
x-microsoft-antispam-prvs: <BY5PR11MB43863E36437BF1ECA7CE41F2F0F00@BY5PR11MB4386.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(39860400002)(136003)(366004)(199004)(53546011)(186003)(81166006)(81156014)(91956017)(76116006)(26005)(6506007)(316002)(8936002)(54906003)(8676002)(71200400001)(64756008)(6486002)(66476007)(66446008)(478600001)(14286002)(86362001)(6916009)(5660300002)(6512007)(9686003)(2906002)(66556008)(66946007)(4326008)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4386;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GLKpEA0Et2zfgEVOnxpK/l4ClnWUWiTfPhbWzdRUzS80Eu4Ox6EZXmWozEXwX1OIXpYEFNM0dxDDkKEF8GcsR8K9JiQia3oiepMq9q/g2qq2xcX6v0FBAd5VGonj1YiFerT+sAwTp+UkhP62n3dgbSXUjdlR6ggM1gExjTnzuQXYaHfp6MxI/SlS4LfIVDy8L5BAG5nL2u20ySYAAgREStkSpit/dgf1w5qWb7m1JDxG6Tyjql0yfISujeYO6QAeIIzDVax4d81MQLokJXy3asB6hS8KcJx9+f7+LD2cGYFAf/iOtAKpez+jK8XjFhpNtIl48HDERGOf18kT9vtvgIAoYcvtkhve1eeMFBs0IYON6VnFVL9IiUUtKcxccZZYJgMjFVnHfAbBEWUA/ggp22FSHw/XWnuEcACQl6HWHhvIAEdXhu9PZR9EZDcD0h2r0NRO4U3COkLdZSnb7a1bqsV0UXo39bmC1qAA6fZ0pSKVaePStruN6iZuglvGGcxb
x-ms-exchange-antispam-messagedata: l1I7ZUtwEabFjZcACMjw7e0BO2zaUJpusY6T8wivA/GRflHPsa9/cIBysFf5+gmf1rXp0wgKitwTOV9wArHq0dqt9fG/yQKmo4UtgSWEGyCOzoz2q+SX764M+wHrL8J4X9MnjvadOZzeeIvJTc24aQ==
x-ms-exchange-transport-forked: True
Content-ID: <AD2188F9263836469DE1F04D69096177@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a793b714-0ccb-4fe0-9ecd-08d7cf297da4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 12:55:40.3914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IBVBSNc1uNT/l1BKpwfrZixmqH0n+HOjwlR5tbf8G3GWlO2VvD4cl8PMR4fuO94AI6tRt8RvdifF3AxMdFDC6fg0HuWwIO0Y+5oXd27DO6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4386
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_055548_118923_2DCE9E15 
X-CRM114-Status: GOOD (  14.41  )
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
Cc: michael@walle.cc, linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, March 23, 2020 2:43:09 PM EET Jungseung Lee wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Hi,

Hi, Jungseung,
> 
> On Mon, 2020-03-23 at 09:24 +0000, Tudor.Ambarus@microchip.com wrote:
> > From: Jungseung Lee <js07.lee@samsung.com>
> > 
> > Currently, we are supporting block protection only for flash chips
> > with
> > 3 block protection bits (BP0-2) in the SR register.
> > 
> > Enable block protection support for flashes with 4 block protection
> > bits
> > (BP0-3).
> > 
> > Add a flash_info flag for flashes that describe 4 block protection
> > bits.
> > Add another flash_info flag for flashes in which BP3 bit is not
> > adjacent
> > to the BP0-2 bits.
> > 
> > Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> > Reviewed-by: Michael Walle <michael@walle.cc>
> > Tested-by: Michael Walle <michael@walle.cc>
> > [ta:
> > - introduce spi_nor_get_sr_bp_mask(), spi_nor_get_sr_tb_mask()
from the previous patch set
> > - drop Micron n25q512ax3 / BP0-3) boilerplate description
> > - be explicit in spi_nor_get_locked_range_sr aboyt SR_BP3 as Michael
> > suggested,
> > - amend commit description]

I'll drop these comments when/if applying. Let me know if you're ok with the 
changes that I did. Please do the same for patches 3/5 and 5/5.

> > Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> > ---
> > 
> >  drivers/mtd/spi-nor/core.c  | 66 +++++++++++++++++++++++++++------
> > 
> > ----
> > 
> >  drivers/mtd/spi-nor/core.h  | 10 ++++++
> >  include/linux/mtd/spi-nor.h |  2 ++
> >  3 files changed, 60 insertions(+), 18 deletions(-)

cut

> Tested with a n25q512ax3 (bp0-3) and w25q128 (bp0-2).
> It passed all of my test cases.
> 
> Tested-by: Jungseung Lee <js07.lee@samsung.com>

Great! Since you are the author of the patch, it's not necessary to add your 
T-b tag, but I'll amend the commit description to say that it was tested on 
n25q512ax3 (bp0-3) and w25q128 (bp0-2).

Also, would you please review patches 1 and 2 from the series?

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
