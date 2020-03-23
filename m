Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F8AC4332B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 21:31:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9B6E20719
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 21:31:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uf8MekVJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="VR71J1U3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9B6E20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csUu+02LmlYg2cOf6lMvoh7s+2+3wnVKf2eC1QiLBYg=; b=uf8MekVJRsPTBJ
	Tnb7fWQkSGplE1Hn+KSONfSXm8BpmSvjPOA4ZgxrE3nmzXX/NlEvANGkyKEiTy8tLhQvvW+VKSrwD
	JUipUnt+8NRM9HECXEp7Hz1w9eMFzGtYhPKs3+GRvMGPDLuOgawjQTchuiNXrjvKWHCdxi+lHIZdT
	LDqB97Q79N4aHZ/L2gUKI5HbVlKlpxzz8PkljbQfAhbr9vP8oOCCiJVrTVIUG0CP33C5NBROQBYQN
	U3WXOYYiO1iclnFs74icggvk+6AkR/ugS4vRJJzJTSPEj5RGtm7m6VMHbFBauUrxbXwbMz91UCyU5
	T5JZkzlqXkl4qJZXORKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGUev-0005Ni-S7; Mon, 23 Mar 2020 21:30:57 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGUer-0005NE-5T
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 21:30:56 +0000
IronPort-SDR: 5T0rLfQwm5HEPFEljEPCSp0wc96hC2XdeIm3Yoc4QhAt+9a/CVnq1GhIsPtHtSh/MW8JSt2hkr
 HbkzHd5XJ5Emzbn7lciJAoguX6PEun8Iriv49mntAD8oiKNL7arFFWg+H6Kdm6HsxdjPHRMytv
 F0havnOMEfVbtpLQS5Sdp5hS11uC3d8HGmewLKoYgreIpEm9946zUv+F9haW/MGIpYl/X/meKx
 HVgHw78KghqgTFl/ZCLwAWnmBGeLeI7jVDmIYTQiGbXZgh+v2poQB5JxaYWNTDPKIxx7iz4yo8
 TVg=
X-IronPort-AV: E=Sophos;i="5.72,297,1580799600"; d="scan'208";a="70999831"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 14:30:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 14:30:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 23 Mar 2020 14:30:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVCTLiAeMNkY6OclXVtwOoVkDPtTB3luc2XyTc+32Xz/o1dT8w5/JTHEfYVanrJT1wYRiXQjlviaCE5AJgoa69noHJkT3XDkGVs2z1CwJyfOP80p/igcLp1tMBTt0Wlvig6UR9gVrcIS7Oj7Pt6k9jT4RZJV34U4Z8SoiCGJgqeD+vQwb7w1kk4raf1RO3nS+RcQK9sn+dl+WYyyaGna+Yexq0QfuJtBr5xFzmjyyQlEkCWih2B0IH9fBfiv8eja0eBL3kNKH/K6M0kqU/rQ5m1tp8zmGYFa4mhPoM69Hm1kSuhI8LSbI16fVgckZS2tD2DZNrq/TUkqTILBXfOxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIbkqukq2x5QwE9SgFBekpztHq3WpLSoJDrsK1j/SVA=;
 b=ByXGssmogCf9oTBptTkvH3iHKQUBFNPXEyE1YYGBJOcHlqjT4uAho0c2NSXwKC+X5Bo3eLmwF/CyL+EGfCq59ruurAFa0OtMQoA3gF0PyrVmpeivSX46CPd25hyYGA1Myiwh+jHsVLlmDLhZEtgfezckKTLBqKw+7neVAIhGEKzUBV9oB+56jIybNCJ8ML/6Sgh9DhyR9JvKfZSHHFpiLBHgN4WNidsN1VXBnrCYQEjU0TV6oYNUVRVtfm0WMUFRRpQxlWDGAEz9FJEaeyGACNQgqtaFzKEnR9Qhv+YiTVI+sWog3g32ocvc3vW9NhiQAYl2VmQaVzib5zkajH0JSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIbkqukq2x5QwE9SgFBekpztHq3WpLSoJDrsK1j/SVA=;
 b=VR71J1U3IGOOZWrzRyiKz0oWrOzkkaJDVjVHuqy3XL+WMDWhIt3WJ9ydYWLfRMKIsQJkLSu/mYPggbnV62gMyUdP3EsyEr+iBHLTq9HPulXannDRqGVxepQUh+/3xZx0dq4JH0tcpp+82UKdjJHipdgwpOXj5LPMPSIuotEpm3Q=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Mon, 23 Mar
 2020 21:30:45 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 21:30:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
Thread-Topic: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
Thread-Index: AQHWAPTc+rZUxlHsAUikj/5G7+sVPw==
Date: Mon, 23 Mar 2020 21:30:45 +0000
Message-ID: <3123463.3oovMYBsBI@192.168.0.120>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <4551629.Jkd3TAmcGf@192.168.0.120>
 <401ca7a54a8d327a0397880db6a9a475@walle.cc>
In-Reply-To: <401ca7a54a8d327a0397880db6a9a475@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90fe06ed-b549-4741-feb1-08d7cf71725e
x-ms-traffictypediagnostic: BY5PR11MB4274:
x-microsoft-antispam-prvs: <BY5PR11MB42741B1CC1AB4BD826381A5BF0F00@BY5PR11MB4274.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(366004)(136003)(396003)(346002)(316002)(6486002)(53546011)(6506007)(71200400001)(26005)(186003)(54906003)(66556008)(64756008)(66476007)(66946007)(66446008)(76116006)(86362001)(91956017)(6916009)(14286002)(478600001)(5660300002)(8676002)(6512007)(8936002)(9686003)(81156014)(4326008)(81166006)(2906002)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4274;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yMZRNevdoL34dsQAlAzMBLA38guZdAJHCIxmuKxBssegGCKDg+6qTg6WLXAQXLQwC41XN/jHIEyEdPpQAggu5QqKy71w4IpZ+cBgmjPCfSBitN16tdfefA8wAZufg8Hm4TRl1gZBJeffrJWY1tWxopH2VhJQ9ST9LGVXzLhq3K5uw2oBtyQzrWOqtcXXh7W8jTX0JiQeTMzAXqcAmMxBn2pegyX0otANPulg2GFKujUqnUzSvtuNACDF1+jGsTJw5dZfqkdIIgqbm9RIaiR1LFsfgfActX5kqlu2cr2HpqzVCdWQoWn9OEwuNCs1H/KIOLHcvdcCAU7nWvYV/279xqTKHXGZJO7adrUPWZHNn8LKvSMtYIppIUXDxpd+Ogo/b0EU1usQFNtfIVf0SfkkRKwwqOugf/cSXypBK6/cPXFJwoPI6SZ/rGg9IN0hIA901ZMAWzZJVxO/q7NEmQe0FVxjnDzzmeUIeLe8lb7mzinEHzoh6wBoT6+cAvu54Hp1
x-ms-exchange-antispam-messagedata: R79mgTpOa9Zv+y5kr4s08TXo6s9lPOkOLMeqv8DhMP0WPZzDreNl4j1WDG0oYdHLhsneLKtvMA6pZQb9wiwU9AxReq7EmHfOYx5xaE2K/kpI60t28wfu9tCXF3Rs1I5x4dLgE/9ZQaOrQih4WwcI4w==
x-ms-exchange-transport-forked: True
Content-ID: <C96E957BCF5D3C49B7FF73467F73FF9B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 90fe06ed-b549-4741-feb1-08d7cf71725e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 21:30:45.1717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5tHGurOgBjzr0ipAj59HsLTeT+YjE5A95dCqlu8jL5pEID6cmcaG46fF3Yo52nt1zbunSjQZzh5w7y2n/EcoFzM4I+nWhyNC4E+m4EEErqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_143053_268554_39165348 
X-CRM114-Status: GOOD (  32.28  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, js07.lee@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, March 23, 2020 11:14:05 PM EET Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> Am 2020-03-23 21:26, schrieb Tudor.Ambarus@microchip.com:
> > On Monday, March 23, 2020 9:54:38 PM EET Michael Walle wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >> the
> >> content is safe
> >> 
> >> Am 2020-03-23 20:20, schrieb Tudor.Ambarus@microchip.com:
> >> > On Monday, March 23, 2020 8:27:13 PM EET Michael Walle wrote:
> >> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >> >> the
> >> >> content is safe
> >> >> 
> >> >> Hi,
> >> >> 
> >> >> Am 2020-03-23 10:24, schrieb Tudor.Ambarus@microchip.com:
> >> >> > From: Tudor Ambarus <tudor.ambarus@microchip.com>
> >> >> > 
> >> >> > Fix the gap for the SR block protection, the BP bits were set with
> >> >> > a +1 value than actually needed. This patch does not change the
> >> >> > behavior of the locking operations, just fixes the protected areas.
> >> >> 
> >> >> So instead of rounding up, it does round down now?
> >> > 
> >> > No. Why do you say that it rounds up? The behavior is not changed, the
> >> > patch
> >> > merely fix the protected area, which was wrong before. The round down
> >> > is
> >> > present before this patch.
> >> 
> >> TBH I don't understand what this patch should do. Could you give an
> >> example?
> > 
> > sure, let me try to be more explicit.
> > 
> >> >> > On a 16Mbit flash with 64KByte erase sector, the following changed
> >> 
> >> >> > for the lock operation:
> >> 16MBit is a bad example, because it is broken anyway, isn't it? We use
> >> a
> > 
> > it's not.
> 
> If I'm not mistaken this falls into the same category like the new 4bits
> BP
> flashes, because there are more slots free than needed. Ie. the last one
> "protect all" is either 110b or 111b and thus don't work with the old
> formula. This was actually my reason why there is no new formula for the
> 4 bits BP flashes; but the current one is not working with flashes
> <32Mbit.
> See the old long thread.
> 
> >> 32Mbit flash where 2MB are locked and the second 2MB are unlocked. Eg.
> >> a
> >> 50/50 split. I haven't seen any issued. Shouldn't it be then
> >> completely
> >> locked according this the following example?
> > 
> > I don't follow.
> 
> We've successfully used the "flash_lock 0 0x200" (with 4k sectors) on
> our
> boards to lock the first half of our 4MiB flash.
> 
> > The table from below was generated for the S25FL116K 16 Mbit flash.
> > BTW, one
> > has to disable CONFIG_MTD_SPI_NOR_USE_4K_SECTORS in order to test the
> > locking.
> > When you have a 4k sector erase, the locking is simply wrong, but this
> > is
> > another topic.
> 
> it should work with that too if you convert the number to the smaller
> sectors,
> ie multiply by 16; But yeah the cli tool has a broken interface. It
> should
> accept both offset and length in bytes; not one one in bytes and one in
> sectors,
> where the latter also changes with CONFIG_MTD_SPI_NOR_USE_4K_SECTORS.
> 
> >> >> > Number of blocks | BP2:0 before | BP2:0 now |
> >> >> > 
> >> >> >                1 | 010b         | 001b      |
> > 
> > - number of blocks is how many blocks you want to lock. One would do
> > for one
> > 
> > block:
> >     flash_lock /dev/mtd 0 1
> > 
> > i.e. lock a single erase block starting from offset 0.
> > 
> > - "BP0:2 before" is the result of the operation "flash_lock /dev/mtd 0
> > 1"
> > before this patch
> 
> Without your patch applied it works like expected:
> 
> [    1.914329] spi-nor spi0.0: w25q32dw (4096 Kbytes)
> # flash_lock -l /dev/mtd1 0 1
> # cat
> /sys/devices/platform/soc/20c0000.spi/spi_master/spi0/spi0.0/status_reg
> a4
> 
> A4 is 1010_0100, ie BP[2:0] = 001b and TB=1
> 

what happens if you request flash_lock -l /dev/mtd1 0 3?

> # flash_lock -u /dev/mtd1 0 64
> # flash_lock -l /dev/mtd1 0 32
> # cat
> /sys/devices/platform/soc/20c0000.spi/spi_master/spi0/spi0.0/status_reg
> b8
> 
> 
> With this patch applied:
> 
> # flash_lock -u /dev/mtd1 0 64
> # cat
> /sys/devices/platform/soc/20c0000.spi/spi_master/spi0/spi0.0/status_reg
> 00
> # flash_lock -l /dev/mtd1 0 1
> flash_lock: error!: could not lock device: /dev/mtd1
> 
>              error 22 (Invalid argument)

I'm wondering what was the reason for the -EINVAL.

> # flash_lock -l /dev/mtd1 0 2
> # cat
> /sys/devices/platform/soc/20c0000.spi/spi_master/spi0/spi0.0/status_reg
> a4
> 
> which is wrong, isn't it?
> 
Looks so. You should have obtained, 0xa8, right? Will recheck tomorrow 
morning.

Thanks for testing this! I don't have a 32Mbit flash ...

Cheers,
ta
> 
> > - "BP0:2 now" is the result of the operation "flash_lock /dev/mtd 0 1"
> > using
> > this patch
> > 
> > So before this patch, the lock operation was bad, because it locked 2
> > blocks
> > instead of one.
> > 
> >> >> >                2 | 110b         | 010b      |
> > 
> > - lock 2 erase blocks starting from offset 0. Results before this
> > patch, and
> > after this patch. Continue the logic on the following lines.
> > 
> > oops there's a typo in column 2, sorry. The value in column 2 should
> > have been
> > 011b.
> > 
> > So before this patch, when one requested to lock 2 block starting from
> > offset
> > 0, we would obtain 4 blocks locked, and he should have obtained just 2.
> > 
> > The scope of this patch is to first fix the locking ops, so that we can
> > introduce a more generic formula that gives the same results as before
> > introducing it. Without this patch, the new formula will silently fix
> > the bug
> > that is described here.
> > 
> >> >> >                3 | 110b         | 010b      |
> >               
> >               ^ typo s/110b/011b
> > 
> > rest of the examples are good.
> > 
> > Cheers,
> > ta
> > 
> >> >> >                4 | 100b         | 011b      |
> >> >> >                5 | 100b         | 011b      |
> >> >> >                6 | 100b         | 011b      |
> >> >> >                7 | 100b         | 011b      |
> >> >> >                8 | 101b         | 100b      |
> >> >> >                9 | 101b         | 100b      |
> >> >> >              
> >> >> >              ... | ...          | ...       |
> >> >> > 
> >> >> > For the lock operation, if one requests to lock an area that is not
> >> >> > matching the upper boundary of a BP protected area, we round down
> >> >> > the total length and lock less than the user requested, in order to
> >> >> > not lock more than the user actually requested.




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
