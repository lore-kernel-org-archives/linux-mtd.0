Return-Path: <SRS0=fEDX=36=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3890C352A4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 09:47:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFA9B2080C
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 09:47:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eY98Mhqs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="nM7ZWoFT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFA9B2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRTeAU4lqXQB7G0566AH80l9v3ufNjgwjW4fc+fINpE=; b=eY98MhqsilRJ8g
	pv8xJhm+03NJuKnrrkS4oH7aphWkkiheMjBr1YTUaRedziVucvGGJa19sdBPo+1eYP+Ybf6OFcm8S
	enB4oUoQ2NDA+KAHf+wW9+l7/4RzQq6RqBdi2KoSy6RTaa1PaJ4wNmRcuY1X+A9MXVdLaU/ndXtN2
	bG+BMZU0VHgMdILbgE4ppEhD4mS+zVhvsm0kawVW0hpU+kUzaeiQap1QXR0OK/jqQQax3rOCORRz9
	gonCsHAx5eFspATAgVWT99eQIrcictTpHg8kYOz3OSnThcUMdCr06hYBVXv+fAtSwqTAPvqBuysy4
	rLMn5osbH7gC9rF9K2cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j15fK-0006Z2-5M; Mon, 10 Feb 2020 09:47:42 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j15fE-0006YX-US
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2020 09:47:40 +0000
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
IronPort-SDR: UnjFiEWHeBOEW3L6itqrBoM/yK+2BUtSgVgUKzohXvOaprKQzrptkPCsz5fVL1AG4w5dgqbt6H
 pfUXi+Dc18AG5e2zuG24H1tV4cu7gPg8IJ0AEUd+qVDLfiztD45gnzCSJxiDL0swgazq7gJr1+
 HQZOi1bBsCISlGw5+BqwBgtoUhuF8uTO0h4o1u33XgTKD6jN2jzeBTgMaIndPGVW2mj7PETAAP
 iRljqmLLZsGTZ5cDjNcHBR29yu1mab70Od36v0QeCdf8EuxRFUs+sfY5lJJQnzfD+TAXkUFe8N
 kN4=
X-IronPort-AV: E=Sophos;i="5.70,424,1574146800"; d="scan'208";a="63660688"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Feb 2020 02:47:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 10 Feb 2020 02:47:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 10 Feb 2020 02:47:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/uAaDhsSoQZVKp6+p/vd0vS9iSQ/uzimT25LPAguM4xh7Ltu16RtH55H7XqDX6ytBcVWn7f73rFuaCQikNRZT+pzOw1OmTzybgjFsQmnDbEkALIhun2bmC9sTQ3NmTMSQ7HhwtqV+f2VnQTJfDZ21g4XvbO4xq3l0BGp9crbhiaKhaZZuIe5NdP+PhBL5by4bn4/DYHZaL910itOVqju9p1gbzTr4q6YsDmZHqoJnK7oEww9Qn4qu9XzSIcsS+WtBwG9uxaKpnPGPBGsZT60xltW9c4IVTf6QVz4DygYs+cTqUa+Oog8tt1NJALylEqRxVnS5GydoCprQhLzlgOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6TcWm8DzLcWh7el54HyWuWdnAmWF0nEKCcDy75DOsI=;
 b=jLG16bhoWS1Wc6LjA1TkZR4OHTGGZ1bxKILEH/ZmUrtab6YOHqA5CSeIK8j71qFjhgLpHKEC1mvcPoIp55ofYG50XRu/Sk3wdPO2/ytbwakiER5u9YbUCXGfQyO4BR5LezNHL9VaHUCx5P62FIDGQVTR3pwk3EdwrkRDnauDFdMIIRag6dBh9UmyVpU216F4BMhQUDu+HSwtdcuTUxTHTjed9+LsbmPBS2lkgn/9FYTTxd03Bf6FtslBIfkw5ztIs0LDtrAgkiLJtIx7YNTwfT9ftUR/uKRA51d8iUxjLU7j7LgDN9KgcP2mJWksBRh9ztLMZYtCDRG9lzVp0523pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6TcWm8DzLcWh7el54HyWuWdnAmWF0nEKCcDy75DOsI=;
 b=nM7ZWoFTjPAotzZE1uwqZt3IADdEbvJrKvVzym2DuFuh3U6EyS+lsCPIgZpJmWXsT9xfYMaTKR5F60QahBZ/uhv9VIdNSfU+bJhhmwrhavZrkxGRtn36SJbO6Iv4tXQHVGnYPWG5Zg5FdgXUbpCdgICOdO0/xfQitOHLcUnHL/I=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4014.namprd11.prod.outlook.com (20.179.150.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Mon, 10 Feb 2020 09:47:25 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2707.028; Mon, 10 Feb 2020
 09:47:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Topic: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Index: AQHV3bCHi2pGqMNGHESG9Z9T0h6ocA==
Date: Mon, 10 Feb 2020 09:47:25 +0000
Message-ID: <4000296.ZurDTCRVlM@localhost.localdomain>
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <3576415.28M9a3X63c@localhost.localdomain>
 <56a82fb7956ef9004828569f0dbe8e8d@walle.cc>
In-Reply-To: <56a82fb7956ef9004828569f0dbe8e8d@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd20d885-2159-49a2-7b83-08d7ae0e3bcd
x-ms-traffictypediagnostic: MN2PR11MB4014:
x-microsoft-antispam-prvs: <MN2PR11MB4014EEE6858379F209BB3456F0190@MN2PR11MB4014.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(366004)(39860400002)(136003)(189003)(199004)(8936002)(478600001)(186003)(53546011)(2906002)(6506007)(6916009)(54906003)(8676002)(316002)(81166006)(81156014)(26005)(86362001)(6486002)(5660300002)(4326008)(71200400001)(6512007)(9686003)(64756008)(66446008)(66476007)(66556008)(91956017)(66946007)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4014;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5WCDiBWyEL0HwS+Xg42+txzoJPrpbdIDsEjukPLRf4qDu66LM10qGoh7YkNFND1BErl+8Jzs1ZR9K44BTy5HeR3IehLaa8wxrcQ2TYpjgW+CPaJxq3EZIwrNXlEpfxdz/2zqu/4x74mSWmpqOu3xlRvtbzDWPS+RAgHNKhc/v/+DH8ezob5y7F3tt+6Eo8QCvwmfIn+f7jkzJyInZc7dxVeJUVR1gCgbk60Gp3RU8ABjqn0B7TFJGvesXhwyelYLccLY7pTgsx2KseCwzGy0NWZ2FpDc4wZUDkGTD1ZSFsVjm8s1D180J/+mAkQLL6TvbZaMrbvb0iarZsS3lGEBCfAtYsdBW/7fjH+YBoqUbqx8rLzo0wGQE1w9az9AUaAlQ3doTOZe7MZKoGC15bI/ZVHPmrVREgQa1GPds9s3I0C26GhZ2qHaCt7mt2SC5fuL
x-ms-exchange-antispam-messagedata: ss3nyR5Jj90NmaZWuJGMuqiTJcpYxklZiJH/Vhga+bPnzD7wRvic9QB7TRbgDOqCgCKUBz/eL8D4PaKwwG+/wd/ZzYLRI4OL22R0sLc5S76d2Pf1xVJvEQc+fYMg4lcEYXHQvrutfJLL+G3T3g7ZZw==
x-ms-exchange-transport-forked: True
Content-ID: <3563373F7B71234397D0D1FFCD5FF152@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bd20d885-2159-49a2-7b83-08d7ae0e3bcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 09:47:25.0812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uw1twWzj8phcp4CVIUHPK/hMgrcClVi9u0JwqB189ezvUlxBtLxxdTMfNj/I/Oqu2YOdgmSj3Iz+O4E/TSo3OSk2sTX0rrRnHVv5Q1zOUuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_014737_079848_F4C11651 
X-CRM114-Status: GOOD (  25.63  )
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
Cc: js07.lee@gmail.com, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 js07.lee@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Michael,

On Monday, February 10, 2020 10:33:41 AM EET Michael Walle wrote:

cut

> > On Monday, February 3, 2020 3:56:58 PM EET Vignesh Raghavendra wrote:
> >> >>>>>>>>> /*
> >> >>>>>>>>> * Need smallest pow such that:
> >> >>>>>>>>> *
> >> >>>>>>>>> @@ -1908,7 +1972,17 @@ static int stm_lock(struct
> >> >>>>>>>>> spi_nor
> >> >>>>>>>>> *nor,
> >> >>>>>>>>> loff_t ofs, uint64_t len)
> >> >>>>>>>>> *   pow = ceil(log2(size / len)) = log2(size)
> >> >>>>>>>>> -
> >> >>>>>>>>> floor(log2(len))
> >> >>>>>>>>> */
> >> >>>>>>>>> pow = ilog2(mtd->size) - ilog2(lock_len);
> >> >>>>>>>>> -     val = mask - (pow << SR_BP_SHIFT);
> >> >>>>>>>>> +
> >> >>>>>>>>> +     if (nor->flags & SNOR_F_HAS_SR_BP3) {
> >> >>>>>>>>> +             val = ilog2(nor->n_sectors) + 1 - pow;
> >> >>>>>>>> 
> >> >>>>>>>> Why do you use a new calculation here? As far as I can
> >> >>>>>>>> see,
> >> >>>>>>>> the
> >> >>>>>>>> method is
> >> >>>>>>>> the same except that is has one bit more. That also
> >> >>>>>>>> raises
> >> >>>>>>>> the
> >> >>>>>>>> question why
> >> >>>>>>>> n_sectors is now needed?
> >> 
> >> Flash devices have variable sector size, 64KB, 128KB or 256KB... While
> >> mapping of number of sectors locked to BP bits is dependent on rules 1
> >> to 3 you mentioned below, the size or area of flash protected depends
> >> on
> >> sector size.
> >> 
> >> So, the current formula in spi-nor.c (ignoring TB and other
> >> boilerplate):
> >> 
> >> pow = ilog2(mtd->size) - ilog2(lock_len);
> >> val = mask - (pow << shift);
> >> 
> >> This works only for devices with 64KB sector size as 8MB flash with
> >> 64KB
> >> sector size would have 128 sectors (BP0-2 => 0b111 => 2^7).
> >> 
> >> A more generic formula would be:
> >> 
> >> Find n where 2^(n - 1) = len/sector-size
> >> OR 2^ (n - 1) = len * n_sectors / mtd->size
> >> 
> >> Which solves to:
> >> 
> >> pow = ilog2(mtd->size) - ilog2(lock_len);
> >> val = ilog2(nor->n_sectors) + 1 - pow;
> > 
> > The current mainline locking support is limited. Michael spotted a good
> > improvement, but I think there are still others that we should
> > consider.
> 
> Sure, as I said my patch was just to show, that there is an underlying
> problem
> and that we should not take the 4th BP bit to differentiate between the
> two
> different formulas.

Right, this is the goal.

Let me try to extend the description of the proposal.

> 
> > We should use a single formula, for all the BP cases. How about the
> > following:
> > 
> > bp_slots_available = (bp_mask >> shift) + 1 - 2;

This formula is derived from Michael's patch. 

A slot (to me) is a horizontal line in the Memory protection table. Maybe we 
can find a better/standardized name for this.

So for BP0-2, bp_slots_available = 6, and for BP0-3, bp_slots_available = 14. 
Notice that I stripped the two special cases: lock none and lock all.

> > bp_slots_needed = ilog2(nor->info->n_sectors);

With bp_slots_needed I tried to describe how many slots are needed if the 
protected density for the first slot is at minimum (sector size).

> > 
> > if (bp_slots_needed > bp_slots_available) {
> > 
> >       bp_slot_count = bp_slots_available;
> >       bp_min_slot_size = nor->info->n_sectors <<
> >       
> >               (bp_slots_needed - bp_slots_available);
> 
> mhh, what is the unit of bp_min_slot_size? bytes or sectors? I guess it
> should

It's bytes. Take a look at W25Q128JV. The sector size for this flash is 
64KByte. The flash has 256 sectors. For this specific case:
	bp_slots_available = 6;
	bp_slots_needed = 8;

The if condition is true, so
	bp_slot_count = 6;
	bp_min_slot_size = 64k << (8 - 6); //256k

which is exactly the protected density for the first slot. The protected 
densities of the other slots can be computed by multiplying with powers of 2.

> be bytes, eg for a 8MiB flash it would be 128kiB and for a 16MiB flash
> it would
> be 256kiB (if there are 3 BP bits).
> 
> > } else {
> > 
> >       bp_slot_count = bp_slots_needed;
> >       bp_min_slot_size = mtd->size >> bp_block_count;

typo: s/bp_block_count/bp_slot_count
> 
> this is a complicated way of saying its the size of one sector, isn't
> it?
> can't we use nor->info->sector_size here? Eg.
> 
> if (bp_slots_needed > bp_slots_available) {
>         bp_slot_count = bp_slots_available;
>         bp_min_slot_size = nor->info->sector_size <<
>                 (bp_slots_needed - bp_slots_available);
> } else {
>         bp_slot_count = bp_slots_needed;
>         bp_min_slot_size = nor->info->sector_size;
> }

you're right, we're in the else case, where the assumption that the minimum 
protected density is sector size is true, we can use directly nor->info-
>sector_size.

> 
> > }
> > 
> > When both can_be_bottom and can_be_top are true, we prefer the top
> > protection,
> > which is incorrect/buggy/sub-optimal. If the received offset is not
> > aligned to
> > one of the start addresses of the bp slots, then we should up/down
> > align the
> > offset to the closest bp slot, depending on TB and which (top or
> > bottom) fits
> > better. Based on the updated offset and length we can compute the lock
> > range,
> > and after that:
> > 
> > n = ilog2(bp_lock_range/bp_min_slot_size) + 1;
> > val = mask - (n << shift);
> 
> btw. we should catch the two special cases:
>   - lock none -> 0 (that was already the case)
>   - lock all -> all BP bits
> 
> The latter is important if "bp_slots_needed < bp_slots_available"
> because there
> are multiple settings for protect all. Most flashes will define any
> remaining
> setting for "protect all", but I've also seen flashes where the
> in-between ones
> were undefined (not mentioned) and only the "all bit set" was protect
> all.

This case is addressed by using bp_slot_count and bp_slots_available. We're in 
the else case from above. From bp_slot_count up to the bp_slots_available, 
those slots are "protect all".

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
