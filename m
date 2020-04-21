Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5B4C54FD0
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 11:14:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DF652071C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 11:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="crwZwXzA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="m12kndBM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="aKyIkmuv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DF652071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQpj09fPzdVg8ZdPdc2R5qo1eu6Dntu46glvC6P1YAI=; b=crwZwXzA0HrHiE
	1CAHubyFAgdleOAbx7Z8i10ojfj8V1Q5JpY0MUYGT3nb8Uz23rxMmLwm5mybhJUU5xCX/hxCyDdBQ
	CmXDbgKtKSgXfbz1SRFXc46TaM1GSSjVN48+wR2RkKZ5q+QX9cOpsyBcyol6TC+kKEHMZ0OF0qIpa
	wzWFfchbq8YezVIe+E/Ee5iMZJDFZnANmcccIF2ywoqvHR5dWuSLJewuAZnH1zE0pahBsM3OkyUSY
	scYI72rDx6935MeDQql/MCbhgmRVDSH4O4u7MdDUtKleN5ZRG5RigdLDVt3VN/8j9eLFwmix97EnY
	elsc95nOGeS1Cji+LcBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQqrR-0007fp-3i; Tue, 21 Apr 2020 11:14:41 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQqrN-0007f1-UF
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 11:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587467678; x=1619003678;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wYqIIJz8MstHQXu5pVc4YZq/bMhumbgQovHIG8MBpn0=;
 b=m12kndBMJda/c8ZTX8NoqHHpJJjldaE2P2s0MEuAZEvKWjty8PX+2dCe
 BOzhKf8om1ZqyVi1jF/+MMrv0qR2kDVYrlVwLF7xa00t7hbUEnTqch5Mi
 PaVre/Ydq8+ohhq+GCrnMfxwK961SP1RllGzkahJtVI9feQjHj/n3xq+t
 1ge/cVoh6pHctPYCssx06UDt+KLcxwAOC3/gb88g5lbz9zHEJGOGj18cE
 PvSt6US8YZ9dpDsgzX9v+vlJFba3HhPGl7VKQvJWpoUBjB2KCk02ehPuN
 ZYoCACXIyUCwNM9/Y+RTI2Wpcj2ZFuMmGkE3hGHEYzj+Fe/L4D/2HrgFu g==;
IronPort-SDR: Qft8OIItDNexHQ2CqAd3tO29KtX/xrz9ZTkkyT0vN4fa8PPI45TbxiAAS4+pCJm652rX5Ehdih
 7J0GlZiNaCwxE1XxQMdl6qAuWM30QwgwE5+xNoW3T2Az8kOPlKS4DlgJICjWDM0zME8ldloHPX
 9mLFb4t4zxRkD83vz0DmNFYmRsqPxFrTzJk+7yctr12cjvO70D02B3ORql5sqxPp/MfwFCO10y
 cEur7rAzDzWWcO3FhAsVMDh0Wg8YTDJWy/gJAqTEciyjWTk38vSKqeKxejCjVZNR84sQ+DqDfh
 g0A=
X-IronPort-AV: E=Sophos;i="5.72,410,1580799600"; d="scan'208";a="73261391"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2020 04:14:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 21 Apr 2020 04:14:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 21 Apr 2020 04:14:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exk8ri6xHhGbV8aD3nJHz50CEaZo4B+l4eguBIWJe69sJAyOcqMebx1B8JV4x9383xGnIQfHyXuLxvySVTO2++FHVBz8v2u3aJekWRDHmJpONzdqntIfXDlhuS45yz6rJhNyiiOioax9qp49nP0UFXI4w9ofGTvt7GanwLpoWCr74leepmYCrNb+AuUGFFs+CDJFFZlzcC1TgxIfmC5RXuDqLttURdlyS866/hswxyO0h8oA4+RWLAuhSEVfxqCa44QWXGIljH7jhvAQy0+Qxd6PQjJ2oCZKTDrKKkjabK2Ps+jkwg4dOvzY0LueyRmbhOop/NstNiHwtX7PnkMvdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYqIIJz8MstHQXu5pVc4YZq/bMhumbgQovHIG8MBpn0=;
 b=aZHl5mfCUeWkS18fg4VmrY0KfQK+g6ArWlWleuByKPqgTOz0oFV/l+gOhgUhHLLchBpmMkruDygYBSsviTO1QmWCsRZDkbE7jLeDFoPyeyrBKE7ORosyKIOZ3gmP3LlcNuDVafnnBGwTUlX1zOWUpMT9/xvHIRSK4w06Tiw129SU74+BGs/3KiH5ue3WcksWshVjkpWFOxgy+Pd9DUAthdoODSPm30YIdCvbcsWzqEXRxYsvWr+KEj/wtdA0/etUcUohR0ZraV3mJE+MmiRT/3UYbMoJKf2HZJpMrh863cFzHQgeD6Us+IKSKKV/VjKsrVk+xmP/yVx428NDxWV+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYqIIJz8MstHQXu5pVc4YZq/bMhumbgQovHIG8MBpn0=;
 b=aKyIkmuvvGsRGH1kbXybeoRRwzBHVvzrD4AFelYTfRwRlxBEWzx4MfGSeBjbri7ev7rhbCdEImf4k5wqL+d2SPfmKrlL8+4CCAt1nmc0z+HXwdH/EoA8GdadGv/8tJRG3YWuH0x5bM7Sg5hi0T7riOn3zZL22z17+CpWohRgAsQ=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4370.namprd11.prod.outlook.com (2603:10b6:a03:1c3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Tue, 21 Apr
 2020 11:14:32 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 11:14:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Fix wrong addr length and dummy when
 perform SMPT detection command
Thread-Topic: [PATCH] mtd: spi-nor: sfdp: Fix wrong addr length and dummy when
 perform SMPT detection command
Thread-Index: AQHWF7Im0s9aEwk5J0uVFa7stfIhRw==
Date: Tue, 21 Apr 2020 11:14:32 +0000
Message-ID: <1978273.VT0C5YHoa6@192.168.0.120>
References: <1587439812-49387-1-git-send-email-yangyicong@hisilicon.com>
 <5032403.BAliFFt8qx@192.168.0.120>
 <6c3bdfd9-1fd8-6a8e-0e30-03eb82f1f244@nokia.com>
In-Reply-To: <6c3bdfd9-1fd8-6a8e-0e30-03eb82f1f244@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c9f00a5-40e1-4b80-2114-08d7e5e52afa
x-ms-traffictypediagnostic: BY5PR11MB4370:
x-microsoft-antispam-prvs: <BY5PR11MB43706A5433B80EA5186AF443F0D50@BY5PR11MB4370.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(346002)(376002)(39860400002)(136003)(366004)(396003)(14286002)(2906002)(296002)(316002)(71200400001)(26005)(6512007)(76116006)(4326008)(91956017)(6506007)(53546011)(66556008)(64756008)(66446008)(66476007)(9686003)(6486002)(5660300002)(54906003)(66946007)(478600001)(8936002)(81156014)(8676002)(6916009)(186003)(86362001)(39026012);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QzcRrDtBzCqtUZU87Q9WvAowsGedb0z2abnUi2Q7fkFX+0tcH4kOxxDJTfukubF7Av+SujvaO150nywUJ/yDt7VkkrrHSaDcnuXH+HCy2p3jZjqOxzDsboLcH1OJ8Wolu21srYJA3PnhY7c//ObJ4MzqEgPo6+AGRF0KKVWKkIsx42yZrqsukwLndjxv7zIBVj0KH9iyRJ5JQdCDuG98jBT4AIXcXDnfCuLZnRh9IijBdBegAr9rKo3RA0zc2133b7AO7quVIQf8VyEL+aSXHthFt5WAJ+E06eniDMC8Iyo/TQ+SJf+E3n8wDKgwUaOBmL4xtpR8divgpHLfOx9ZIaeTDXBVAYhjgjGe53YQegU30qE6Y6ZvhE325B1wcgKH5T7nWPukaondfV8d7J7tz3M7fiK2AJ+oaC9LKxVnEMbhfYWAghlJRjM5iKSH53Mg/cnyNp0V2xK3mMdYPDWfZXJKJnuXBYT9BvfRTnqVSSvnMUvxme+6gjUYEOJB+GEu
x-ms-exchange-antispam-messagedata: cKnD/SSaw8lYGz3mhfF9SRwzRbt0QQRCIrWnJ9SymLXq9gOreraBeUgJpk9x/UD2akqgk2/vbKDmmr/nPb51YlpNbJYlxZQZXaIQOhU4eOTBeLDgUnBxxiXr9sEpgrUDIgo2rYKNjmCU5JuUnHSDGA==
x-ms-exchange-transport-forked: True
Content-ID: <6F824A76B9D3EC4AB9BA2D2F2D5CC979@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9f00a5-40e1-4b80-2114-08d7e5e52afa
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 11:14:32.6242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fAeImFzTAt42caEze79hD3FJX59Nut3+o8zD3wo/YSRzF7vo/WVkQczRKA2d4zuaoVBw4CBs+jFj4ylVNExQ4oEKyKVFzboYafTv4n8h7jQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_041438_070732_1882F16F 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com, richard@nod.at,
 john.garry@huawei.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, April 21, 2020 1:39:14 PM EEST Alexander Sverdlin wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Hi!

Hi,

> 
> On 21/04/2020 11:58, Tudor.Ambarus@microchip.com wrote:
> >> Well this will work and as the maintainers ignore the proper and even
> >> recommended by them solution,
> > 
> > There will be no patch left behind or ignored. Your patch is still pending
> > in the review state because I need some time to study the problem and I
> > couldn't allocate time for this yet. But I will address it in a week or
> > so.
> With all the rework of spi-nor it barely makes sense and if I rework the
> patches there is no way they can be backported to stable. I wonder why at
> all subsystem rework is prioritized over bugfixes in MTD.
 
You don't have to send a new version, I can review it in the form it is now. 
Also, I can port the patch to the latest spi-nor/next if I'll find it good, 
and you'll not feel like respining. Once we agree on the final form of the 
patch, we can backport it to stable if you care.

I prioritized the subsystem rework because it will be easier/clearer for 
others to write new code, and because it eased the maintainance. Maybe it was 
better to fix all the known bugs before reworking the subsystem, but that is a 
lesson to learn.

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
