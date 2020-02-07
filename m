Return-Path: <SRS0=Kp4F=33=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22EAC352A2
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 12:17:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC6F820838
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 12:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hrJ3++lF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="IdWWNY3i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC6F820838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gW/Hpsd1QZDYO8hdGd1WVTb2WlSfsqFZZfgCXP9jTSc=; b=hrJ3++lFHPnrOE
	HJynlN3lnDlWVuPAG0mtgob6WcprzqBPlKjBehFhmAgqkFIS3dqKXMRMzJa41PVV/uy3xaN+knrb8
	kg27YTY/m/BYUcw0e4i6ClKYK/mH/XtXKp8+wDCUGAY0tiZoPFGwGY3EjmmEnMS2SrLPvScEW6KZb
	4jDqsdLAsD4lcuXVtTtMOeaSqbqGI7jzTGUzUMKnpolFe9Ad/t1DosKkElCGD1rFLQIzDo61bf7oG
	p1TZxFWiDQlKMueXDdZNmLoY7NNhyIssbVFXxogbdK1/OqYhvavU6g4Zqy4QY8YQc8CqtVfckut6+
	XpzLmyCFAi9CTlB/Dn8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j02Zk-0007Co-MO; Fri, 07 Feb 2020 12:17:36 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j02Zf-0007Be-1l
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2020 12:17:35 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: dW2GsqgAfBLoOsah8uSuzo4As8YIA8S9pd/74bdwJyYzQuc6uCkICo+Gd75bUMsMN5mfZSsy/6
 Ne+tSRZODGtlorpDO5gxQYE+zkFZMnDBMNE55rP6QN/wqRcs7bjaWdi/+IMRYTc41Dq2fWnRHU
 kZbwGhAJp3FvX0uyrYPyGr8By13RfZI2a5ozMEuF/FyRpR8LHXMUNFU7NlpYlvXpsvnM4xNLU+
 CRBCJfFPRY+j/XlPx+EwzZcEsHROsfNL2pt2UAjL8e2ShKPWpY6hJLn5gdsgbzII3ZASK6c8nY
 SFo=
X-IronPort-AV: E=Sophos;i="5.70,413,1574146800"; d="scan'208";a="67639531"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Feb 2020 05:17:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 7 Feb 2020 05:17:21 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 7 Feb 2020 05:17:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYONrYbNUZw64VFVsSAthpHuMe9lWCAzDrlBQto2UP5QxC7DURpTEc3Yz1LCHhiluMiRTIuY7Y1zUCv682LpceVVwK9N1XholHpJ2dEPJF/uXvvbqsKn6w+iuWajC5r7Va8EqDCM76HSVlJ03FGbAxZozEWT37Pv4Xn6Tki/8RF/eKbJ0xuR59LBkF+qV1Vj0cv9mDPJy5kmzktdXPK9x+6ZQAsMJ1YwEWNxTDjM+4V2w5Prdt0JkwsWURA5T5VI+hOYgjOXzFu/0t4B/ntS65j7m/qb9MaYa+pSwPf6xArXFCJUslzUl9YFtkYIKzSfm2+i8uT6tYlSLlfd/ZvA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNcKKk+QaSOpmq0+ckdzcwQRFmRzDNXcSNES0+S9ZZY=;
 b=CYzXDTsQQgH3l3fJrz1OWiNgRjTohjeavxpcrwgM7u8tFXOGyQgGr/WtvgIbDPIC1nG1vhDtpu9zO0Txm11f1EoBzHhVE5lwzD6lW3bRKXeylaBP2kUpohi7FNjpIArKXEaBSfp0o1ZP5PE8uVQFCJvXnJGiFJ6IQh4uFuT5nUWgiZz71lnkJ+wgHZAJf8LaUj/OMT9kBuRe81BPjGvW/By+F4Ro8QZC3PWls1+EBGG7h8k1r4p3r6+gNzwr8uc91v6rHpKuPMGVGItv34olKsgn29XQTO20/vMHGe4luvIXwKV3/UOy7r0deBjhBeGFgymM4FSYLgY3gctLvCScKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNcKKk+QaSOpmq0+ckdzcwQRFmRzDNXcSNES0+S9ZZY=;
 b=IdWWNY3iE8WWrMeP4kKK0v7LBXasTbAOUDlxod5YgZFncm7oR+h4EXsPkq4kX7O+jHkuG8+/jMooGPnX2RVeOI0uXwGlASqj7yGqeqEVg3EYencU6IoWZ4zpEeTGSJxstvYMNXQ06BnU/oihsS+AXPS/GXEBpB0+OirwI95nxTk=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4416.namprd11.prod.outlook.com (52.135.36.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Fri, 7 Feb 2020 12:17:18 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2707.020; Fri, 7 Feb 2020
 12:17:18 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <js07.lee@samsung.com>, <michael@walle.cc>,
 <js07.lee@gmail.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Topic: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Index: AQHV3bCHi2pGqMNGHESG9Z9T0h6ocA==
Date: Fri, 7 Feb 2020 12:17:18 +0000
Message-ID: <3576415.28M9a3X63c@localhost.localdomain>
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <141fe5bf27542420292864bf2d574a8c94dc6867.camel@samsung.com>
 <687e49cb-96d0-464f-0bc2-4537780e9731@ti.com>
In-Reply-To: <687e49cb-96d0-464f-0bc2-4537780e9731@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3fe115b-ac4a-4977-d7f4-08d7abc7ad30
x-ms-traffictypediagnostic: MN2PR11MB4416:
x-microsoft-antispam-prvs: <MN2PR11MB4416B2327FDD4DEF7F0C21B6F01C0@MN2PR11MB4416.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0306EE2ED4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(366004)(376002)(39860400002)(396003)(189003)(199004)(66946007)(66476007)(66556008)(81166006)(64756008)(26005)(81156014)(5660300002)(316002)(6486002)(71200400001)(8936002)(110136005)(8676002)(91956017)(76116006)(66446008)(86362001)(53546011)(6506007)(2906002)(186003)(478600001)(6512007)(9686003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4416;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vKxoMOsIlmIbqIhv3kjr9NAXJijr6G1eh+6bdrMMnjM6SDrgt+tBTa53OA8kyt7fFZgBH5+V/JE4XcLxkR9qZ0tEV7oFHn3QIqNmCxLRmQcQmNhdfpzY1BhT55io7jOdQ7WcL8tPOCX94Z8y2t+bF7C16Z+3uwdZTMJXo793+118haA1PeYdN9kzCr9UTU1H2av68DJQFf3pgY2S4RGgHYhYPLYor3F0ao5XpdSYqtAZQnNlgZePrkrtr6w7rblib6viJoyeckrLjqT5PjKs6uxhc9sLRnHGbQju0xLaZ+ZeElDjtbUlPf/MHBYIh/VLYIGV3/Gy+KO4heoW5IxD4uDlxgz6LekC1PK9GUnJCiHx/skLV8bW02LUIehNsKb2DElTc4I8tmbXm0LdOfuzKk1h9kbuuhHlNPkM2bJ53CcAtIYbFfAukL9HvCmj5z/L
x-ms-exchange-antispam-messagedata: CszLHk8MSrYjacCk7x53eWSCEH3MT4ExIOXAf9utoPYje64P7ZnQ9yU8J0sWZz1EwdExnv5YpJ5aq/jz1GYlRUAtu9/uT1+ydlvDWCYLwin/w1ncE31HWo/gihZUtvXWlD6xeH3UVTc17b//Tu3nUw==
x-ms-exchange-transport-forked: True
Content-ID: <C65B0B7C541557468ECB81B120C530BB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b3fe115b-ac4a-4977-d7f4-08d7abc7ad30
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2020 12:17:18.6306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pghl82v8lCT9wEQ6mQ8q67/LB3vDW0TwC+o8PMYQPLfXSqiDF5YNjJ27l7Ac3af34F6cJUrP34md3vqWT8ANr1ueJzII7Ybyxe7syBjk/ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4416
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_041731_249801_B4FE9262 
X-CRM114-Status: GOOD (  11.30  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Monday, February 3, 2020 3:56:58 PM EET Vignesh Raghavendra wrote:
> >>>>>>>>> /*
> >>>>>>>>> * Need smallest pow such that:
> >>>>>>>>> *
> >>>>>>>>> @@ -1908,7 +1972,17 @@ static int stm_lock(struct
> >>>>>>>>> spi_nor
> >>>>>>>>> *nor,
> >>>>>>>>> loff_t ofs, uint64_t len)
> >>>>>>>>> *   pow = ceil(log2(size / len)) = log2(size)
> >>>>>>>>> -
> >>>>>>>>> floor(log2(len))
> >>>>>>>>> */
> >>>>>>>>> pow = ilog2(mtd->size) - ilog2(lock_len);
> >>>>>>>>> -     val = mask - (pow << SR_BP_SHIFT);
> >>>>>>>>> +
> >>>>>>>>> +     if (nor->flags & SNOR_F_HAS_SR_BP3) {
> >>>>>>>>> +             val = ilog2(nor->n_sectors) + 1 - pow;
> >>>>>>>> 
> >>>>>>>> Why do you use a new calculation here? As far as I can
> >>>>>>>> see,
> >>>>>>>> the
> >>>>>>>> method is
> >>>>>>>> the same except that is has one bit more. That also
> >>>>>>>> raises
> >>>>>>>> the
> >>>>>>>> question why
> >>>>>>>> n_sectors is now needed?
> 
> Flash devices have variable sector size, 64KB, 128KB or 256KB... While
> mapping of number of sectors locked to BP bits is dependent on rules 1
> to 3 you mentioned below, the size or area of flash protected depends on
> sector size.
> 
> So, the current formula in spi-nor.c (ignoring TB and other boilerplate):
> 
> pow = ilog2(mtd->size) - ilog2(lock_len);
> val = mask - (pow << shift);
> 
> This works only for devices with 64KB sector size as 8MB flash with 64KB
> sector size would have 128 sectors (BP0-2 => 0b111 => 2^7).
> 
> A more generic formula would be:
> 
> Find n where 2^(n - 1) = len/sector-size
> OR 2^ (n - 1) = len * n_sectors / mtd->size
> 
> Which solves to:
> 
> pow = ilog2(mtd->size) - ilog2(lock_len);
> val = ilog2(nor->n_sectors) + 1 - pow;

The current mainline locking support is limited. Michael spotted a good 
improvement, but I think there are still others that we should consider.

We should use a single formula, for all the BP cases. How about the following:

bp_slots_available = (bp_mask >> shift) + 1 - 2;
bp_slots_needed = ilog2(nor->info->n_sectors);

if (bp_slots_needed > bp_slots_available) {
	bp_slot_count = bp_slots_available;
	bp_min_slot_size = nor->info->n_sectors <<
		(bp_slots_needed - bp_slots_available);
} else {
	bp_slot_count = bp_slots_needed;
	bp_min_slot_size = mtd->size >> bp_block_count;
}

When both can_be_bottom and can_be_top are true, we prefer the top protection, 
which is incorrect/buggy/sub-optimal. If the received offset is not aligned to 
one of the start addresses of the bp slots, then we should up/down align the 
offset to the closest bp slot, depending on TB and which (top or bottom) fits 
better. Based on the updated offset and length we can compute the lock range, 
and after that:

n = ilog2(bp_lock_range/bp_min_slot_size) + 1;
val = mask - (n << shift);

Cheers,
ta



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
