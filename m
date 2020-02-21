Return-Path: <SRS0=1RF0=4J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1353C35641
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2020 09:30:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE3592073A
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2020 09:30:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t8/W6KiN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ZXP+0hal"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE3592073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WlGNYw24b2VmONF5wMnpQwCxfr5JHKl+XEj05j1qXgU=; b=t8/W6KiNpLigcc
	7GvRJmWCtfxqzAQTUHaHKB2zOcFRkrSqdt2S+2gR5WJq1imacbAZogJ6E79gifZfv87MDpsWcpEza
	luDGT/iTZu4P3mEsZvYKbQDV8ddIut2vUz8Ro3M7wKXJgsz0CThyLZhEghL3Cv2GqtfgoNRXmkZBZ
	VRKbvhR7WWE0EL6MuzxSYiAmjG9LjGC1ru6lJpvgSrZTWqpkmVHXrjsCr/E4BoM0a5YSza+0LL/W6
	YkBqBiOt52hjM/PjVfjoJRHai2VjijetKDoScw+JrVtSRDoFu8vCMcSuQxrCsGERbkibVZ9gAjptx
	wMqyd1c4+5idRrpI5S9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j54dr-0002QA-VZ; Fri, 21 Feb 2020 09:30:39 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j54dm-0002Nm-5L
 for linux-mtd@lists.infradead.org; Fri, 21 Feb 2020 09:30:38 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: IZ4YJpjTM6jRUrUht8P/029ppEpzGdFKb1nauSf3/Q7rDs1XVo2Ccqgex9zoj0uIloujeotRgp
 gIKYLCzDoDSTn8y8em1a6zwhk6rwCHJPsWZfjsDAz+SI9S6opx82t+dZxJoNva+m2wAOiWCAV8
 5bEk7MOqY4knE3Gobj6MRjXBhpQ+BwvF+SfNaDbdKZ1XCOhfW8VFCEX+uf7/hGMvhqzZ9/YTLW
 J/7sbGf4i9KnixD8yF3APyLT5qOiwjRXeyYoq2B3Om2HsM9qu2rly3+LajfrCJgskjZI3vCdvJ
 Qxk=
X-IronPort-AV: E=Sophos;i="5.70,467,1574146800"; d="scan'208";a="64936164"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Feb 2020 02:30:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 21 Feb 2020 02:30:24 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 21 Feb 2020 02:30:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuULK3EA49BOyGdeBSYj6k9Rw+1QY6o6LprhAkYfsSR2hQ2AAOJ3/uQkKJM2jh6x+TQLC6obEZsoMRERenybDFA5bcYRvjg4g1glT81gxRASdbByvFrXY9peGDcfv88JDNLPVEyr5WIiZLqa60ov7fBB8KX8CtxHaH8VuCsU0xCLlCcsafk5f6Hj0c7G3P5BgRxSdQZKaptea3uwspigTAHxd0LxUHXFU9VINSqmZF2q2vo2WkfAqSdoOEJZRtNjBDYirl8ZqqFMvAubY0hZOmU48QGIAViR2g8U8ksGqL6iv0KWaC084vZSEt7mv85UoJo0l2Zb0IFY0cHooRoVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiANWRdNPZNLTGRs/VwXO30FKeAtANHCCYKJPlwoLjo=;
 b=Ev0dxM2rczKQHOkB4bunMeCE2EloAH1rMgF/ITllkLpJEpKAuAieSGuzFm3Ya7uangTVsQcxB0sFD8wIw+acgwasGoXojic2E05Z4+aXSJYGQj1KyEF1sgTmulAl1+A8+hOaCz8o7rS+VkafS7dxILrXIhju0Npj7Lx94FisHpGaCX7jR4ca3X/QApoDC3P+X7s9m+HDKU6B6ybcrP/l0u4aS8jclRpYQps9XWvVgV0dWAEgrGxcpuwUBjxKOGxc62DZsR5ZC0XMsO7I63A4apyF86lezp9/uN3tgOh+qk3nP7RXf8C9g5pHGT3g5YlifTmVDLYn7bF7+/235NSbzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiANWRdNPZNLTGRs/VwXO30FKeAtANHCCYKJPlwoLjo=;
 b=ZXP+0halC7PB7j6c0AUMrPRVrYpg+pEb7t/YO0JW4Sb4Df+NWWISkk/aJCpK2V18emtpNk0cKSiN2GBjMiYttmuciviATo536OKXcfPjXwFawePucD0C3GfnpjkT15/8LnnhtCD21BWCLBXz1DtDHQiffl8obPJKMsZaD4bntdA=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3550.namprd11.prod.outlook.com (20.178.251.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Fri, 21 Feb 2020 09:30:23 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2729.033; Fri, 21 Feb 2020
 09:30:23 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <js07.lee@samsung.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Topic: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Index: AQHV6JmIi2pGqMNGHESG9Z9T0h6ocA==
Date: Fri, 21 Feb 2020 09:30:22 +0000
Message-ID: <21102931.kdR8orL0iI@localhost.localdomain>
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <ed9ae10ab3be4da90779cb6f8d6c6cf1e9fbc968.camel@samsung.com>
 <9aaabe654603679dffdbf4c57bcfe0ff@walle.cc>
In-Reply-To: <9aaabe654603679dffdbf4c57bcfe0ff@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f094454-92ae-4db4-f07b-08d7b6b0ad53
x-ms-traffictypediagnostic: MN2PR11MB3550:
x-microsoft-antispam-prvs: <MN2PR11MB355048CF05C5D919A80BF61AF0120@MN2PR11MB3550.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0320B28BE1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(376002)(136003)(396003)(39860400002)(199004)(189003)(8676002)(66446008)(66556008)(91956017)(64756008)(76116006)(53546011)(8936002)(81166006)(66946007)(81156014)(86362001)(54906003)(6506007)(66476007)(110136005)(316002)(478600001)(26005)(5660300002)(9686003)(6512007)(6486002)(71200400001)(4326008)(2906002)(186003)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3550;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /6Ytcj4MqQsMPDCIVjkefys8ga79wemmNKzVT586vrqLn4ha+Ol2HAYz1IoRGNfroSrOiIhfaraxhykTfARFDYozoxUGLOnSjoLgcUg35tmU/Gv+XVNpge6ydbSPINlgMG78xnvDSXk+JQz8VIn7LQ2z6c0c7qLTJ85WhTMazmW5vdJQInLkMPEwC60i3XZLuUFFPthgL/HGsZ9v/P1BImxUTCodHM55JgTvxWtxuEm58bQFSVaaAu6Avbze/3Dd1cf2ELUZC6U55NHHOvb7yLXpVykO98Op9wDy/JdymkM3+VjzRw29Ycmjy3ybmuNC7b6CvHAk1v98+rP7AwWQFlRfMsptiIixd5U++5oFgWTYujDsU/pekmE7toiq6UV9bVOMoh0CCEJD3E+IkSydYErTMU6sN6sJ8sRtO0xtuMgZN7QXfvEw8w0V9ZaA4xu2qu8GJvU6NEHgqVsDyxGQhDF+iJ2SdkYg6g6Midrjt7P4e9UrcGRKnGExSon7ETQj
x-ms-exchange-antispam-messagedata: t/b1+tPw82U1G3aBCh+k2U9OQz+51QMd1xui1UmF1ar+QcZ+z+lvonktJhP2sI5mI8OXLUWZ4GRsr+jyvXZFGnWgZ1JSco657Om1GmFvXfrOGi8k0ff7rTvujv+/bba58Lp/32wlabpJmkLVIFMpWw==
x-ms-exchange-transport-forked: True
Content-ID: <7F1BD24335ECA14FA17F509B8D506FD2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f094454-92ae-4db4-f07b-08d7b6b0ad53
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2020 09:30:23.0605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RjtPx1h0rZwC6oLjlFAlYoVg6tUFxdWY5LbtaseSI30BjBLXt/IMbJl666M8wX8wkctlPVxiEsDtdFvD3U+b5hx9omES9dVkFmQwm8FTLeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3550
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_013034_299908_C4E2D09E 
X-CRM114-Status: GOOD (  28.79  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, js07.lee@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thursday, February 20, 2020 9:09:03 PM EET Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> Am 2020-02-19 11:50, schrieb Jungseung Lee:
> > Hi, Tudor and all

Hi, Jungseung, Michael,

> > 
> > 2020-02-10 (Mon), 11:26 +0000, Tudor.Ambarus@microchip.com:
> >> On Monday, February 10, 2020 12:29:34 PM EET Michael Walle wrote:
> >> > > It's bytes. Take a look at W25Q128JV. The sector size for this
> >> > > flash is
> >> > > 64KByte. The flash has 256 sectors. For this specific case:
> >> > > bp_slots_available = 6;
> >> > > bp_slots_needed = 8;
> >> > > 
> >> > > The if condition is true, so
> >> > > bp_slot_count = 6;
> >> > > bp_min_slot_size = 64k << (8 - 6); //256k
> >> > 
> >> > But nor->info->n_sectors is not 64k, its 256. Do you mean
> >> > sector_size
> >> > (like in
> >> > my example below? Then we are on the same page
> >> 
> >> Indeed, there is a typo in the pseudo code; I'm happy that the
> >> example is
> >> correct at least. I meant sector_size, not sectors. Now we should
> >> exercise the
> >> logic to all the known (corner) cases. Maybe Jungseung will tell us
> >> if he
> >> spots a flaw in the overall logic.
> > 
> > I didn't find any flaw in this logic. But IMHO for the pseudo code.
> > 
> > bp_slots_available = (bp_mask >> shift) + 1 - 2;
> > bp_slots_needed = ilog2(nor->info->n_sectors);
> > 
> > if (bp_slots_needed > bp_slots_available) {
> > 
> >     bp_slot_count = bp_slots_available;
> >     bp_min_slot_size = nor->info->sector_size <<
> >     
> >         (bp_slots_needed - bp_slots_available);
> > 
> > } else {
> > 
> >     bp_slot_count = bp_slots_needed;
> >     bp_min_slot_size = mtd->size >> bp_slot_count;
> > 
> > }
> > 
> > Probably we can use directly nor->info->sector_size for bp_min_slot_
> > size.
> > 
> > sector_size x n_sectors = mtd->size
> > mtd->size / n_sectors = mtd->size >>
> > ilog2(n_sectors) = sector_size
> > 
> > bp_slot_count is equal to log2(n_sectors) now so if we can trust the
> > value, we can also trust sector_size.
> > 
> > After change it,
> > 
> > if (bp_slots_needed > bp_slots_available)
> > 
> >     bp_min_slot_size = nor->info->sector_size <<
> >     
> >         (bp_slots_needed - bp_slots_available);
> > 
> > else
> > 
> >     bp_min_slot_size = nor->info->sector_size
> 
> Yes, thats what I pointed out in my previous mail, too. So I guess we
> agree on that.

Yes, agreed on this.

> 
> > This is a comment from my previous mail.
> > 
> >> > The exact fact is that locks operate in two different ways
> >> > according to flash model.
> >> > 
> >> > (1) the smallest protected portion is fixed.
> >> > 
> >> >     for BP0-2 : 1/64
> >> >     for BP0-1 : 1/4
> >> > 
> >> > (2) the smallest protected portion is inversely propotional with
> >> > number of sectors.
> 
> Again. please don't consider the ratio of the protected area to the
> flash size.
> This is only the result of applying the sector size and IMHO really bad
> for
> understanding. Use the number of protected sectors. Thus your (2) is
> actually
> always one sector (as you've already pointed out above).
> 
> > (1) - if the slot is insufficient.
> > (2) - if the slot is sufficient.
> > 
> > From the fact, that could be rewritten like below. I think it's more
> > intuitive one.
> > 
> > if (bp_slots_needed > bp_slots_available)    // (1)
> > 
> >     bp_min_slot_size = mtd->size >> bp_slots_available;
> 
> Given the reasoning above, I'd prefer having the number of sectors and
> thus
> the sector_size. Eg. keep the following
> 
>      bp_min_slot_size = nor->info->sector_size <<
>           (bp_slots_needed - bp_slots_available);

Both variants seem to work, this is a matter of taste. I would also use the 
sector_size variant because it emphasizes that the sector size is not enough
large to be used as the min protected density. And it is in correlation with 
the else case, it's easier (for me) to read it.

> 
> > else                                         // (2)
> > 
> >     bp_min_slot_size = nor->info->sector_size;
> > 
> > We could also find a few flashes that does not following the overall
> > logic. For example, "en25qh256" and "en25qh16" which was manufactured

oh, the horror! :)

> > by EON. They are always following way (2) no matter what the number of
> > slot is. It seems that it could be handled like below with custom hook
> > later.
> > 
> > if (bp_slots_needed < bp_slots_available || force)
> 
> For the en25qh16 the "bp_slots_needed < bp_slots_available" is already
> true, isn't it?

yes, en25qh16 is covered. BP3 for EON is what the other manufacturers refer to 
TB.

> But good catch for the en25qh256. IMHO the rework of the BP bits should
> already
> add a flag (together with a reference to this flash) so this information

Is en25qh256 the only flash that breaks the rule? EON did the locking wrong 
for this flash. BP bits are pretty useless in this example because they can 
either protect the upper/lower 32 sectors, or the entire flash. They have a 
bad locking granularity.

I don't like that the info->flags is growing.

If we consider that what EON did was an error, we can introduce a 
post_info_init hook, where we can set a SPI_NOR_BP_SECTOR_LOCK flag into a 
nor->params.locking_ops->flags.

Either way, the introduction of such flag should be done in a separate patch. 
The eon entries do not advertise lock support, we can deal with them with a 
patch on top of the generic bp lock support. A dedicated patch will be smaller 
and easier for readers to grasp.

> is not lost. what about sth like MIN_LOCK_SIZE_IS_ONE_SECTOR.
 
Yes, we should fix/add support for this. How about SPI_NOR_BP_SECTOR_LOCK?

Jungseung, are there any other caveats that you found? Would you work towards 
implementing this generic bp lock proposal? 

Great discussion guys. Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
