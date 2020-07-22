Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E73C433E2
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 07:46:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 835A220714
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 07:46:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AhTRwzDV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="HOrLDUWD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="a/9R+n5B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 835A220714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=/R1EnFEhZIWM0h+Ei/7Mei9M21PzGbOqCkEhO9Uoohs=; b=AhTRwzDVNaEeic/ckXHUiulC4
	ZwckP46fjoq3AWybyXwf3t/9wWSl6Wp19XrdkPD9Cpl/52jgdaeojFjuxfrneGDvvKnOnKsZYTNrL
	+2dDBzmrXlwpD6LBpjm2VVgdFItjL8m4l9isuRj2udAlSGsvRF2LS8rl+vPFsIVswhoZbQzFOVzM/
	KHvsHto70r4TuY0MJ8E8HG9wrQWfZm1brv5eZUqksrATsVk+oPzBoskFRTK1BdbyenraC6ZeQOt0M
	6Ql8MmdkyEb6ya9dHg45Y7fUg8xNY6g1EdQcVEcz6w2y261f4w3GuJwxb73ni4gOTa3EWl+QIG8YD
	xgofcLOwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy9RU-0003Ix-Ro; Wed, 22 Jul 2020 07:45:32 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy9RR-0003HB-S6
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2020 07:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595403930; x=1626939930;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=2dYsmetetAQjGFOstq75gNTdBHAVPGPd6z19LIgcbAs=;
 b=HOrLDUWDROmGTLJ+RtC3PNCoGyW/dnvUWbqsLiCn9frfR3nbrsemdsLc
 3HFWiIJnKtymWxO2PM1m54dv0DZZiNrerXWFFYiVJhkMcFVg7e3/Bazfk
 0pyRv0azuTQujhZK7Jx8LgznjN4GD4wCrTQ7f2H1yeeAkqoX8c5TNfCyF
 FxM56hUUagXjS3LvOgp/5sn0hjl2lNleBj5XSzq9wO/f2meJCZzSP1FEu
 rP83e4u/fsHKXqM2NwmVaHJn7+IrZh+B9BhD2lXU+j3Ex3UyvAI41zKBw
 S1zRdEaVdM7vO43PVHk9QxjssXr3+iQHynvU4nqFL5YDXmxCoy5EGe3og w==;
IronPort-SDR: SDjlXVEhUp0fAxb7HA0iZl2lppjVGzgppUkGG+WGLW49GubZShj2qUNUK5fNy4VXMQ7uM5NF6g
 MarhJ3NvqMvRPN/606pU/xuhmhczi+lE91rLKYEKA+oV6uoB5H0IdBUqdnKqU36BIXI5+/DVgT
 wgx9aceZ/vD9Eop0RBjUf+MudWDzMAGwbQcjD0PFQ5hzZ1q/QUjE19+Vql9NhvSaR8W98oqvMz
 qjibeh+XqSl2YoU50c12tPKRtuhHIbtFEukHVOoXJJV86GB5DD7DPM0Lpj5gzLvU6/YwO3x6Y6
 Q4U=
X-IronPort-AV: E=Sophos;i="5.75,381,1589212800"; d="scan'208";a="144357296"
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hgst.iphmx.com with ESMTP; 22 Jul 2020 15:45:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drU+PObeyP3UdTqV790WO7C7ywL2JUxTmqUeMUz5Stk/lb7uW1UesRnhM8Bghke9cpVbX1l+A0ghUYsD6uONEDPIfm/z73C0GptuwOLdoSOStVdRiK4ErYwGSMmTB8GIKxQcRNNzTxjcOPVWnXyT5Vx5KQURD3ibXiCeDKmWVmck++vNxZvfTwuK2LakYaiYqUVJY/uwDcNQEi0NOKYQyB9Ko0LK6xTwgHSA3zUUtmswN1NC7eaVqD/KQYJqitLhRooZBMUUzLJ2Q3ofLymn/bHO4FNyx94dLVizecb6ggSo72Ipoxfsan24IL40+mn2OdzVTf88LZL4EvK9AbABeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0K5mJznmfxjwY39VW0JeYpFKeILGV3n8VhABZp5fF0=;
 b=QHi8m12gXJAZFvDfFS+/9Ds0HLkoapN9cfjcRy0VvFYZTBR6NyuCx+otChUHAnb3qlIROeJaR8ji5RPiKRDI0L4/ARXAgOPzY/GfSRmtn4NuPG+79LUDpHZg53LN3S93p7x+FMV2P1bymnvylbv3SQvnD83FciBm2Bq6pct4/uFcyQ5NDK4VeqvN/5Vfoxsieogb7of8PRjCCfyHpS+mzpNFkWxHZ1PjyLYPjaNKJ4REhYDQb5bH3YH0rSJ+bLlCZlMxy+T95pW4MnG2MSILwebfSbMXDaYktgpq+5z9aDJ5CSNKM7zDdl29OErlCFRXEoLdsAgKHMXV4eNdyRh2LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0K5mJznmfxjwY39VW0JeYpFKeILGV3n8VhABZp5fF0=;
 b=a/9R+n5BrdGnFvHmK72vVSTNqZyTcUh2/W/H5HRXaBYZJJFj6fag2W8sUdt+D1wg8YbLPwkfmtSwkPd6qAfXsxozzx/9GJcww1xDIA9SHpfliZe3w2opM2huZfYgSW77aFyzYlj43Q6qS1FVjdu8ZM81iim5HkVQKJqFQRyTIDc=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN6PR04MB5166.namprd04.prod.outlook.com
 (2603:10b6:805:94::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Wed, 22 Jul
 2020 07:45:25 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::1447:186c:326e:30b2]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3195.026; Wed, 22 Jul 2020
 07:45:25 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 09/14] bdi: remove BDI_CAP_CGROUP_WRITEBACK
Thread-Topic: [PATCH 09/14] bdi: remove BDI_CAP_CGROUP_WRITEBACK
Thread-Index: AQHWX/E7tn9lZZ9OhUyy9G9ALxYa2w==
Date: Wed, 22 Jul 2020 07:45:24 +0000
Message-ID: <SN4PR0401MB35988BC2003CCDFC7CE8258F9B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200722062552.212200-1-hch@lst.de>
 <20200722062552.212200-10-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c408b401-570b-44b8-cdf6-08d82e133232
x-ms-traffictypediagnostic: SN6PR04MB5166:
x-microsoft-antispam-prvs: <SN6PR04MB51661888992ABF6700F326FB9B790@SN6PR04MB5166.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EfDnxd+GPm0gZxTebfIFv6FzPlTSO1L25VMdJjFqeTLDSm95+2EeoCncor1Ikx12NOs4A+eQLtb91OotgtTkwkMqjEjcLDYer1UXXwFK88XlDNn1VcC789J1XI+YCfboC4NQONkv1aqjH2CGDULcJvndJokgksu+OyxWeUJ7sui9iztfLHfi4h58+IcNHU9petmCnmts7XzJ8feEu8J7MzCOPz/+O66g51FfXLHwDFfuo/FKIH9r0/+Cg4GR4g+BJTTeRFfkvlUyiQGc9z/ZjV+LrFhQKJD7JCd+oqdQXKCqCMn/aQUmhjRqjxZN7XcLPYMVWY6tgZGNDWXbz1Uqpw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(9686003)(55016002)(86362001)(26005)(558084003)(7416002)(52536014)(5660300002)(83380400001)(186003)(76116006)(66946007)(66446008)(64756008)(66476007)(66556008)(8936002)(478600001)(54906003)(8676002)(7696005)(110136005)(316002)(2906002)(91956017)(4326008)(53546011)(6506007)(71200400001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 4Vf7Bw2L2SMhl3Jt3ilKs7ZxghqXd79kKvSP0ct+ChAlqLmLNj25NXPhAalKXCu+YIG48i068OUEUN4KbDcYD0Hs/4j3WJUCFvzLlt53HJvY/ue9U+1J4qJGyiIFHnJbqZkwfh5gcTysF4pp0RekCJ9GpLa/gL7pxT5vh35fxY/ONSjnEm1YFiihH0NflWOi62TZ4iUOtvcqy8kPeRgvhsMxNHAD+c3NVTilVhm32WxzcUWmG8IEJS+97EFA3iCNiQr3EbnB8sozmmMHjVZH0QG7Vp1YT2z2PL0ZR9pM5MyFMTN/unviq9YFquqWSSmDfyEu+VQ8XJYnvqHzkqTkEZ1ZiQ0x9U2ydIA5/YGw/KT8m+pA2hWsxgBhkidG5ZrFUqkSkUSwJ5jhWEusaX4QaW+vL6YHK4QyZrHGmLc9W5hvA0iDXzx+//rVN6Q5xL0DCjkkAO59PGD5+es9JShbbi+JPLfiXOeIrnzflaWg4qgWIqs51Z6d8CAdXS8f0wwv
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c408b401-570b-44b8-cdf6-08d82e133232
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 07:45:24.9244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SirNX0bUajLMGXRH0iKCjWPNXUs9Ukmcwo5ehc24DNrjMj6KWKusnbx4pI2xSrXuVT41q2axOQJFRyDnqTFudULMSRzXqqnqTrUhVIuh+2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_034530_094389_A05ED4D6 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 22/07/2020 08:27, Christoph Hellwig wrote:
> it is know to support cgroup writeback, or the bdi comes from the block
knwon  ~^

Apart from that,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
