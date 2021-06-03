Return-Path: <SRS0=SghU=K5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FF8C4708F
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 00:07:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30612613BF
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 00:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30612613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=p4hOJxwmzcK72aVRxkq2+EI7CxT6docZtTP3XbYn6zU=; b=qhRX2cVN6iRxB4
	N8RIxrKXw/KERtA4SVCHaIOTF2ENr5/amDEL/4u4W+byrwRyfSx8GA/+YYT7/J/CqxGQTl9pbWr4e
	KKVRUmwF7J6l2e/TSDN59XSsDjntQUF8jmbKkydHN2tuivgS9w7Ih2+mJWj0+OtdcIxl3P87HqGdx
	rQ4QvZVHl2fx31PJ1RovPYjbTgzMm8Aoj67OZLjc6qTiD3kQ0DD6LChCFs59X44ySgMTbaAF8T3bY
	w4s2o/zjkMkefWLG6aJvmBcsu/MrZycdf35FKqVAUBBKVT3A50tSalsEU+aaUBAUCRbVlQJzL9Q+M
	z2m/CZ2fNRh6AD/6X8qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loas5-006Yqo-L6; Thu, 03 Jun 2021 00:06:01 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loas2-006Yl8-EG
 for linux-mtd@lists.infradead.org; Thu, 03 Jun 2021 00:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622678756; x=1654214756;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=x0A5I9VnxzDXiNVFX9pBDDngO7Cz3NslFa/BzMijjX4=;
 b=PA2kiBHOnrCKyum2Etf+s6am9c/uZX+ZzJy7UbJPwqC3jJ8ZfDxIc78f
 gCR+VE1sP+jkkRqjz8aGdelJ5/sB8BrNqEJbGUZbP24pdwjTtJUF+GytR
 mVqZevAr7/U9DgeeLPLSL6Gf1McYB69bzdjAf5DtHTn7YdP7Nxpu7X+c1
 SXY6ymy2cy9D+lI+RdUJ2Uof4KXMmx0DYtpGoyFhpwH1P78K7/j0unkj+
 I7o6HV8eWiXSKonjl1SKg5cv5LFFzrCv+AgAvHJGGHRTIeoN+HjOuQEoD
 LKTJJoUnhvA/2qssQsz/uFgVqa6BAPeDmGdjNganz33O+YppB17t7kl1H g==;
IronPort-SDR: yNidBVFfwP0++LZUETizwUBWEU+SN5FJSRje8d9L3HA9a4QVTuJ3JBJOnr3MIi9gFTJe/8eecu
 HStTZQKFFUCbQwS4FUr96K24Njy6EXoKXzzXdWil6RMp1mlvcZyH5L6EDrJGcuEI01DwcwTsMT
 pRAfIqTK9lzGNov0fGAd7mAjRIWGxXGtRygQBcLpHsPQyNrNh8eAPm4B6p63N0/Pve4ZLw44Aj
 5F+OH4wmt0QavYeTsh/8Wr2SfC0JwqhvrqLnTzBDcRmyBvK+vFVgn0C8tK5FZvqYFuYnCi5Zm1
 nbw=
X-IronPort-AV: E=Sophos;i="5.83,244,1616428800"; d="scan'208";a="175227080"
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jun 2021 08:05:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3farpPa7W2fK3OCqmeUNYp+1WtoYCwnIe0Eyf8Gl9wK74y8kMwubTUPkPw87CpKGPTkcsCJA9J9RAqWtkUv0UsxxqhLAK8cWomOg9Z8zyFWkNN88YJ683LYV5ZYV8pbUm37peQBiPXd9wVZQI6BV8Q2Mk0dx1jpu9xXV42LBxVyNxRkheUvOrmRJ/9MRHFnsDVqos7b2uq+tIZK9XE9JliB7EBArVO2kasvYJfSumxfor6O+1vK0XHfm+mw/xkcErs4ghhwSLe4cIBVMajW0UxCTW3in0EIueBnaojQ8cfbavKhj5EpsgJ9OMufl55s65UFOw5crSiQWgCh+1b94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0A5I9VnxzDXiNVFX9pBDDngO7Cz3NslFa/BzMijjX4=;
 b=SPf+169lZ4Rranyg6WH1JdhKDbAUaSshGdESKcqMmPHBbGpcq4V+phPl//qpeaC/DYlbh/8EhDzLHLeTEC+zWwoElyVp0Xi/AlW2/g0q2DrNxFSuHTWLBDNBeuU06i5v8Q99Pa3asHmqtqixTbxSC4f7rD3RpxOi9nZpQlptzvl/DuFwfPz1DeIX6f3+BG8I3nMxnfttIi60y3JhEM5xLf42wULnrsSEE2oj9mncz+uFj6xtd40VfngSmGBqLZ+gSPB/xc4YwVeUViYnUg+wtKXYBVgJF1Cv1LcybuW+jK+/MSMv1IzrVd2Gb7Y8Hf/7C3TFAvDRPaTQiM6cnkPQ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0A5I9VnxzDXiNVFX9pBDDngO7Cz3NslFa/BzMijjX4=;
 b=T+9a36hknCdvo2DPcnesnvQMhfho0Y0/EomLU5TO6dseSuE6OY42Ze5Cj51HfkCMU5dmKIdReUI5CcZqgM2t4/b0A3tomrcyTgMQ6g2QEB6b9szGMpVgTyTO334vQO/8TC2/JufqTsB97FPKYxMSfZ5pugNqxbTTzQXPdatyHjY=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BYAPR04MB5333.namprd04.prod.outlook.com (2603:10b6:a03:c2::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 3 Jun
 2021 00:05:45 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::6873:3d64:8f9f:faf0]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::6873:3d64:8f9f:faf0%7]) with mapi id 15.20.4173.034; Thu, 3 Jun 2021
 00:05:45 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC: Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>,
 Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>, Geoff
 Levand <geoff@infradead.org>, Ilya Dryomov <idryomov@gmail.com>, "Md. Haris
 Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
 <roger.pau@citrix.com>, Mike Snitzer <snitzer@redhat.com>, Maxim Levitsky
 <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, "nbd@other.debian.org" <nbd@other.debian.org>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "linux-mmc@vger.kernel.org"
 <linux-mmc@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>
Subject: Re: [PATCH 18/30] loop: use blk_mq_alloc_disk and blk_cleanup_disk
Thread-Topic: [PATCH 18/30] loop: use blk_mq_alloc_disk and blk_cleanup_disk
Thread-Index: AQHXV3xaE0d6OBaU4E62oTiV05BSaQ==
Date: Thu, 3 Jun 2021 00:05:45 +0000
Message-ID: <BYAPR04MB49659E527FE3E41660BF8589863C9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210602065345.355274-1-hch@lst.de>
 <20210602065345.355274-19-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39591f5b-3ff9-4e4f-1e41-08d9262355df
x-ms-traffictypediagnostic: BYAPR04MB5333:
x-microsoft-antispam-prvs: <BYAPR04MB5333C6D28F1EA2185F1A07B4863C9@BYAPR04MB5333.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PgVZpMqfBZsayGo6qHKvJ/SMB0aIT/hImnkZMDwIUFSs6fwOxe2azCZGsLYYbvBVkWrtWNrUFQJJzeMe3yYffc8YIVjA4vJhqd1Caf+JQrgRrW8iANW1Fa/HwaSNBqVMprKX3CCOr3cy1gDErClF4rDG2tsRuQIz2DZ3wl4lpipsRdWqfqfDlvSHTzPfY8HoDivgfEAPOqwhWAHjZq+glqlqQNx5ZuMHtvR23EDC4vpH/CigaR+TRxEQ1bhZnCzeXwSFOfClGAgqWJfg/YHx/QfV8bngLaMNrTL2snvIV7C4DvRbbyIzJWr1cYbirk42HHX09WrOtimpQWxEpl3MisB8trOfqX2JC4rdBvIjkUaD0Gu3Vd4tNq18VIg+f9BmBccbQ2EtncSTV4CHGdMbjwxBRIamRH6tg8R50QDEz0qRt2ydIbwr9cXW2KR46pgExiN/N5aOQNkcSCw02up2UrfqPreq+/AlBpqOOFH0QCZjF3KTAPdUTp8qjmEkDht0hhnuAIkkoYSevA85lQXGgxc8PooKuHlGX+GrZERL5amiEUT9pgFbBzsgSZjY3DhUCUiugbACiQpYZej9ts05kLxaCUEKkshvgopZWtO9nZk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB4965.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(52536014)(8936002)(55016002)(9686003)(8676002)(478600001)(110136005)(54906003)(83380400001)(76116006)(66476007)(2906002)(64756008)(66946007)(38100700002)(122000001)(5660300002)(66556008)(66446008)(71200400001)(26005)(4326008)(53546011)(86362001)(186003)(7696005)(6506007)(33656002)(7406005)(7416002)(558084003)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?5if6RR5+OJsZpshEstylBHTMiQTdBTwGqtBjzZ62XGcAt8S+WMU1R6WAr1?=
 =?iso-8859-1?Q?a51eNNNlEJ+VJlKHkoSqcgo2gIBhqaOpnahoP2sexcbCNSfIQ/mT23Hhrc?=
 =?iso-8859-1?Q?CcZvGJdjc6rYcwPcGxufFVIXA4VuS9ph3bVkXwT1KWFzecVa9v7sRZjstV?=
 =?iso-8859-1?Q?M52hDeZD+OF2CXi5MCN0ahoxnPtEEWQo3uJ627FGCuiWRxi9hBI4zHAyQD?=
 =?iso-8859-1?Q?n4L880UPigYemTZh2skZ2GRBM3EuXNgIf5eMrwx4/9GRA3thA3Vs6/Srr5?=
 =?iso-8859-1?Q?mGAI4xuVrUjS5kqBdndpNixJAX1SDSM/c5pjrP6MwNVZHaAJQaWiqd/HSt?=
 =?iso-8859-1?Q?qjXLVs9eg3uXezDIMZbbFb3XlhgYLwr4Kg+u+oojFoO86BfCoFfj1SZaLK?=
 =?iso-8859-1?Q?3Bh6HvFLoxKb6fnftF5GncLxb2klSGgVkwEBvxlUdRyF5hLfy0GDhWEiwn?=
 =?iso-8859-1?Q?yvPwGUF1+TCCnVDjIV4TQiM/anB4IJYj7Pz6AgJfWV68HWhWQrmXTYHpFh?=
 =?iso-8859-1?Q?CcLN8OXPeqiXrlUWuJSE+dkeXO0N/nWPs0Ztuv7AkzgDScv3MyeGOeHz3Z?=
 =?iso-8859-1?Q?Ao7F5TJClVo4s6Ru7csKZuy6fY4JU8hhN96B8/sDqt2aBqhr72Hc2stfoq?=
 =?iso-8859-1?Q?cWadzIwd6WVVg+F9M77H9ekG9yiSizSPk2biwRViJxMsn4pztStuwmqKi1?=
 =?iso-8859-1?Q?t83Qs/txRM7vkASOivFSKQe302k3TlOukOSYea41yEa1Pz3i6oIZnZefgv?=
 =?iso-8859-1?Q?NSQw9pYu9oSKGJ25XiFKSTq/j7vSbzks171YHmv9mcMt6wP8yl4LLXxCen?=
 =?iso-8859-1?Q?JXD+BD+GKbVnjs7pZSk99T99q+VCUnMr02tJUq6IfIA+Cq6AX93Q0L3v0A?=
 =?iso-8859-1?Q?qDn95YKDo18n5brnbC8adwYqFb9BWS7i9plCtUA5iAEgQG7cWDB/J/zCCE?=
 =?iso-8859-1?Q?6bE/YfhBuXNi264x616FmYWOFFz2gRTXVHBrqOmgFcjq+xeiwfUiLM3iIc?=
 =?iso-8859-1?Q?vQ1xF8dWT4I98ziJWB64LXJLu3oqZn592OlCv+12XP7AcL+hRIAMmaOLMh?=
 =?iso-8859-1?Q?+DjXC7TFUoHipM+C9D1rO1BB4cTG/35uwiag5HrH7/d45WzZmSsapFV0/+?=
 =?iso-8859-1?Q?eJTfrX8aYrolI4CV0AKZjhKyK1qJrHy2Iy3J4immKeUbAWIyN75+vD6817?=
 =?iso-8859-1?Q?SqCiq4gw9a0EywODdNX5I5vEzTROvlrHITNzRWZn3S0uJZceVLoeMQyUCr?=
 =?iso-8859-1?Q?1vuXs9xwNnyBoHWVfCBl3SNUv4bBHzezF7+hWC4DnOm+Vdn6CRvP+5sOy8?=
 =?iso-8859-1?Q?lJJ8x7HTy3feCkYVRWQwWhhN2a0eI7ohaqFaqoodESTjPUs1PcbecmVk6E?=
 =?iso-8859-1?Q?yOGxfM+lRI?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39591f5b-3ff9-4e4f-1e41-08d9262355df
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 00:05:45.3613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UZUf1SLT6UbGI1jPGaANmbjvJ+IN4ZVHUWumZOErHa4bTyMMnyBgRVRLyXW59SgP4r+36OBdgMCcwGD5GqSUCjl5bim8WN/7KVvAoUqr5pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5333
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_170558_534684_E300F0ED 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

Looks good.

Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
