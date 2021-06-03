Return-Path: <SRS0=SghU=K5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28707C47083
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 00:11:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEC42600CD
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 00:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEC42600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=X9PCXhYEjib79jAmzjME8mIDfSll2XMU0pWwMCZmGMg=; b=3Vd0F1rCdqbBsB
	xhRzC1CCRD0c1uZI6imvKuC7e1FkJ/VPNqppyyWUhMU5/T5h43ZyTKWEPFgRITcBe/85wdvSjRJcF
	Ydg8SCxBZJOCt+BEGb0itqebWdoGnXDrsmq82kIGeop8pPcDj70wMiwsTwAnx4r2n3NIMkcVI6LGr
	g1jw+IGrXyKp0jov0IY+vc3jnoouwlLYRDXOd6dVSbAvqKu3kSx1BMJfKkiT2fqfFA4oKvVB/ijp3
	i4+Geg789XiNccymmROk2Z0dLtEUqY73jwRcfEDhqggMf3+Z51liKXiphrO54N+ossfffPIentKW7
	W4Vx7BxTxl2n4o1KbxKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loawJ-006Zgc-8Y; Thu, 03 Jun 2021 00:10:23 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loawG-006Zfb-36
 for linux-mtd@lists.infradead.org; Thu, 03 Jun 2021 00:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622679019; x=1654215019;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=wST4v/KFEgsD+AHxp1B4bWyFrtO8jdP6tx0B6ojMsIk=;
 b=Frm1x8/pTrXp4nPxXGLuIO4P8ItJIPrCN46Q5/J5od09/hvLjK4h6wgm
 E7jqhfx3z9wk04M+Ne5WHCZO9P4ddU2r5pZQ+cfJFnwEDGe157cYO+wbl
 G0KtJBtkVh/lQPcTBcDXCjFcZTLuRWT2B5Qm+q2b2U73s8OrtI2uG+AkX
 Vi9kyZ6T/lEc7XfhfbEwvWzKhiGVg1zWoBcY1I/LOZZXOJVjECrKqrM8U
 Z+JaeNHV3rojmfduPnDyIhiTPgY79T7gqx6kFYkgSC7QZDDWIjRmlXOiE
 nPRqNOdWNHA3nIqUq4o1DYzgGfNN7F1GXHvIPxwhGsN1RMOXDi8nQersu A==;
IronPort-SDR: ZmknQuXoCnqDkfa8f/gIpbwcqsW3uxFIdkG6PulXIRgvre/V1WSuqDOxsKpr7HB12BBnz5bTJF
 dpg6fDUUhyjirRV+af+X4alFqYTr5oUWRrXWqVj5ekEdtvmwVj+iPCU5w8TuqpEHShe0SuLgiL
 quXXMMlt2JVZSIA7aAtVVNAi8tyYF+2kfYxk/N6iv7SP/zPHjRDhX0CIr4+aYsc1qKQWQ2lLfF
 1pwuG0X1Xj5/5yCDRAXWwP39oIHSazLjYk9RroQcS6fksS9XrRo0mCaN9h0b4MGo5ClYyMYoxw
 /BM=
X-IronPort-AV: E=Sophos;i="5.83,244,1616428800"; d="scan'208";a="170510803"
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jun 2021 08:10:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZLkwwoAD3gpyISBgdewagHua+umfTEXtt8fAoIQQxNtn3TUom7xGUlGVNuipekFI0LrGCtbcCOV6ybf7lgaQdxpzQZR7FVbCDUnIbEpwTImjwvqO023nPEx8LkjaRijDWaljEKaXFOI89FOGmhTA1ygVl97J+abx4sdYDQy420hpP9+vDjvGyTPwXanYpLR0hZXd9vvDvSATaLjkEu8cVVSuhNewa1/xZkA9X79wGbXzFcqw7097MX0VwzkbSAZekKsjiqEIxKXEcqBecIiFNnG3hTuRkfpOoLt8e2lK42q47i2H47OOOqTv3q0niqmFkO4WW5SeUHAE3ZC+SGdtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzWP3cG7e/e70cUAy0yiqwnLhD+NXwUwEN+x14H9+cw=;
 b=Y1+gV6oRpNBiL21Ns+WNrmpjHEagZm1EmHeba536kJYVWO5YSDDjpQIWIuLpb/3RvlQI9ysc82/v+EAZfxTla36zoWNGankQMBKMakzWzWLF8qF7Bun2UCq2wwVPc6rREOtUZmR7z/cUzttOUByKjIb8I5fernx5zRfxxA0bNHO9j9ueuOUG3qC5VaPB9CUJsQkNOKC0NOJw7DMV3X4v7VciGfv1irqIiISjpB70d4Kn94PTHhXF418Z75v06CxeAaguvL+ehlq4PJPP+jZmTlpeiW+8JGSTZTQTl3IYrSNZ/Uzx8MRTX8va8QvEquSLHkjRJY3Z6dJX1QWjQp+bAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzWP3cG7e/e70cUAy0yiqwnLhD+NXwUwEN+x14H9+cw=;
 b=KgmidU1Fw+7vpB9Uzsgux34KRcjT0kIms8M8fzVN0CdXWWJ12qjVA20G/kSPLgv3NQ7/mFf9/CEh7zLOM35fNA87mB0+qfmluO0klyMoHw+EtkWs6uJNOr7IH6rYQcWAMIBIdNmK16NxQlvi8bCPYnuCbqX9TTBnDgMXkIhqF6Y=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (52.135.233.89) by
 BYAPR04MB3861.namprd04.prod.outlook.com (52.135.214.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.24; Thu, 3 Jun 2021 00:10:09 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::6873:3d64:8f9f:faf0]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::6873:3d64:8f9f:faf0%7]) with mapi id 15.20.4173.034; Thu, 3 Jun 2021
 00:10:09 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, Denis
 Efremov <efremov@linux.com>, Josef Bacik <josef@toxicpanda.com>, Tim Waugh
 <tim@cyberelk.net>, Geoff Levand <geoff@infradead.org>, Ilya Dryomov
 <idryomov@gmail.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang
 <jinpu.wang@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mike Snitzer
 <snitzer@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov
 <oakad@yahoo.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian
 Borntraeger <borntraeger@de.ibm.com>, "dm-devel@redhat.com"
 <dm-devel@redhat.com>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, "nbd@other.debian.org" <nbd@other.debian.org>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "linux-mmc@vger.kernel.org"
 <linux-mmc@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>
Subject: Re: [PATCH 20/30] nullb: use blk_mq_alloc_disk
Thread-Topic: [PATCH 20/30] nullb: use blk_mq_alloc_disk
Thread-Index: AQHXV3xgq8Qh2KPeAkCUNVGDF6BX9g==
Date: Thu, 3 Jun 2021 00:10:09 +0000
Message-ID: <BYAPR04MB4965DDD0F4479F5B492A30D2863C9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210602065345.355274-1-hch@lst.de>
 <20210602065345.355274-21-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 410c689a-bed7-4693-4767-08d92623f325
x-ms-traffictypediagnostic: BYAPR04MB3861:
x-microsoft-antispam-prvs: <BYAPR04MB3861AC0DB66ED1C3B922E6C3863C9@BYAPR04MB3861.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:431;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aSCUd3+tO2dW2W0V3W+l+z6iJa3IoJNFdybg9gYTu9cedQ5lLVvPpm91O+dgVW8ql8UgQUxU6WWy+SnXx4hkRSkEbO+Bh9nDVmSGwmMOGkQ1nHjaRH0AmmcUwOEgU8PZj0bie3HHe1HkTiR9t6S8uH0KYFxKuxPIpGACKfziR9SdgoJQgLBMsLpbcl/XMriIfz/BZePIx+YXeYb0iTZg1zQtisRQ8BHOzvcW9ojTtcViOSd0wEtiPtkPj9ECItd8k4g/tUkuJBZ4Atf6k6pkELhctJZ8WJ42PKiGHu8LVUlUFVPDN2VXhagXLymt7dDZFFWHppkOKUONGWiIdwRpSsODUHoao48cLNskAR6ZEXegvXyqzYYouET3Q0OIYmUwslAg8gnSfVyx+RA2Rzpr2haw1NRfeR8epVcIitoaVUWk4+eJMy/yHTuFQy6ansUVygucOFjq4n5CAbUDWG6Ze00DEqPbx1sGyplv+rZCuJ3RE45DyM89gvL+b6fQ1xcV3jiGTFdg5yKmctnZmapwoPLqBzlIAqKUQandH72F1kQ2EMY5/mqgVQY/NPHh71VFoA/EQHV29oPgt9v0n+SjOM12CltqYJUFiycBsklsHDQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(6916009)(55016002)(9686003)(86362001)(52536014)(54906003)(8936002)(316002)(26005)(33656002)(122000001)(83380400001)(6506007)(7406005)(5660300002)(2906002)(66946007)(71200400001)(76116006)(4326008)(66556008)(66476007)(66446008)(64756008)(38100700002)(8676002)(7416002)(186003)(478600001)(7696005)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?tOMRmQzBu9HBrmE54pFYwQCAZwjNFQViLIYp42OXhgbm6VKfnHeKq6ibJR?=
 =?iso-8859-1?Q?XVtDPmSP9FYrKIi5HErHCnz8ZolVYTOTq88vxqGNp5E8WT++gvcDXHWzfQ?=
 =?iso-8859-1?Q?7F22uB4d6Y7jZld1kooNlgaZuhcOZcWVK5jZsiQX+Vnu5A/I0GM6g6pXG/?=
 =?iso-8859-1?Q?fANsvMtPVZl4OWLL2+zaMRzi0z4pS0r4jQpoJHOglAaZtuCNoz9bScDYZd?=
 =?iso-8859-1?Q?AEvlPDPcaU86D30vRAfxCysnlB1/4/Jt1MXUWHSmp8VPpBXRNLlDGEqQxm?=
 =?iso-8859-1?Q?yjCAb9tCYwQfYIz6bHAigje3Yd7B2eiHgPvxT0MqDL2+eflNzyXrCr3o6r?=
 =?iso-8859-1?Q?8UyJSz27O4zzS/20AtH04M+SPYCu8ZwG+hkW9ykY/xrisflV8VjyxJNEKP?=
 =?iso-8859-1?Q?syxQYvDaTwngygKAaCnYFDz2soLqZOyR3u63/D5w2gGDjyoVdakYkl5JrT?=
 =?iso-8859-1?Q?9Vs+HX399Av3uvglcvTgN0NDHBSxG2r2hLTZQIlfUdcTJgqbjEEbTzHh6i?=
 =?iso-8859-1?Q?f5IcKkyHFjcXOS8rdDFlqyJhhOXgloM0oDOXQcVVqLJJYYU8BsOfyIdyIu?=
 =?iso-8859-1?Q?pUOu2kZO3V6uNs6z5PMGZkekzt+S0uxCreJuGgQrKkBZMs48NO+3sbdnsU?=
 =?iso-8859-1?Q?4c6IMFPVWUid+K4P+Y26m0ZmGTZvgHW7EkcU3dFejhLkpHrBxNr4AXEZ2R?=
 =?iso-8859-1?Q?4TZn363tV9qBc7iYebk3NLvLRw3CV5c7IR84da+AVEFOGpO1yX+IYrvoJb?=
 =?iso-8859-1?Q?t7O3F27g+Q5KnNOqFYGbyqb35w7zFyF8QHTbKK8sldGZ2gqzSOBQY3lCLE?=
 =?iso-8859-1?Q?apO2p5Ip0z38niJbY5R/NGjElnkFYxnVQfDKaCjVIIGmhZWgLnu4hiOqzo?=
 =?iso-8859-1?Q?L8+IQB2+pqtlGfnUlBmSIzDBc3+49PFeL2MsQlwM5E9n1hY9qPOUyqbmET?=
 =?iso-8859-1?Q?rpcgr9YIpy7KXg0uR2TRn+2BeJzIBgIqtRJywgwZgA+B8CJ3RwFWYeL1n/?=
 =?iso-8859-1?Q?hY7Q7ycu4z8lPJyJAlsshldtZCy3E1sv89KZsNPETY4AQEr3vHlaaun+xd?=
 =?iso-8859-1?Q?vgyqfQ9WCG1L8tMRnzKsqh3RlrakY3XIEVU8StpIxjZlCsJpMf83zURXip?=
 =?iso-8859-1?Q?9D/f68Z33Hy6P74gkVsgSBM+9qbr+SvWM25poIJijA7qHdhsegGFjmiBA1?=
 =?iso-8859-1?Q?lGWdWKKQOqEX8dKOfdNFEOHYdtB9duMlsdbxaXtMAssT2AMavt2G7XtQ6I?=
 =?iso-8859-1?Q?isoClhWwp/3vVg6ae+fZei/Sg1PoAPAHoD6EWQaKtiyFmWRy4+3YFr/Q13?=
 =?iso-8859-1?Q?HTATyFL9dJB3hIn1M5qIgz0y2yIG8dpT5nMVQTnH8b/gBTJhn1ETaotnmi?=
 =?iso-8859-1?Q?ckYH8Sgs2Z?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410c689a-bed7-4693-4767-08d92623f325
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 00:10:09.2084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: csvqD0vw659M62vyGjnjyxGD18c3A93cKZHc7kill9AefsspYbo6IxhVdXG3I88JuR8UAroB3qRvmH2ffepP66pf7ZnPFJxPeY8tuhTHcyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3861
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_171020_237354_7823E1B1 
X-CRM114-Status: GOOD (  15.80  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 6/1/21 23:56, Christoph Hellwig wrote:
> Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and
> request_queue allocation.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/null_blk/main.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
> index d8e098f1e5b5..74fb2ec63219 100644
> --- a/drivers/block/null_blk/main.c
> +++ b/drivers/block/null_blk/main.c
> @@ -1851,13 +1851,12 @@ static int null_add_dev(struct nullb_device *dev)
>  
>  		rv = -ENOMEM;

Is above initialization needed ?

>  		nullb->tag_set->timeout = 5 * HZ;
> -		nullb->q = blk_mq_init_queue_data(nullb->tag_set, nullb);
> -		if (IS_ERR(nullb->q))
> -			goto out_cleanup_tags;
> -		nullb->disk = alloc_disk_node(1, nullb->dev->home_node);
> -		if (!nullb->disk)
> +		nullb->disk = blk_mq_alloc_disk(nullb->tag_set, nullb);
> +		if (IS_ERR(nullb->disk)) {
> +			rv = PTR_ERR(nullb->disk);
>  			goto out_cleanup_disk;
> -		nullb->disk->queue = nullb->q;
> +		}
> +		nullb->q = nullb->disk->queue;
>  	} else if (dev->queue_mode == NULL_Q_BIO) {
>  		rv = -ENOMEM;
>  		nullb->disk = blk_alloc_disk(nullb->dev->home_node);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
