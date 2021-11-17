Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66301C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 12:26:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 256C861544
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 12:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 256C861544
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=LbQT9q/Gb3YKjvXNcvrIf9eob6mJXjrFRj482R8lqb4=; b=Db11kSXzopyODr
	mTmLy0Y1242WBcNqiIEiU3yRy8EKtIwWe6LEzHCd2QKwF0z50BkyfW4O78OEnFEkSotohRD7NSbOI
	I6AhsjHGLIsqxKY8qB1pg+mf+iWIVeZTl+zCF214vee14QiNq31tpFoQQgE3eLLCdtrPoTe0f7YoU
	tx1Ndsj7aJpkOPYR+Cmybtag8CDcggNxb+RZM57TAA/JKd0OaIQJ6errGTNCGsZJxCVWpMQFBmse9
	nI5H+uW5QuIeDT8SnFYEOSLymTvwJM7a/gJShdTzYmN4aces3HG1o/rX01GMSnl9peluLcQmKjtE2
	vYX/T1WJUIChD6VlKvzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnK02-004iJW-0t; Wed, 17 Nov 2021 12:25:14 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnJzz-004iIX-1z
 for linux-mtd@lists.infradead.org; Wed, 17 Nov 2021 12:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1637151910; x=1668687910;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=ejq9MXjBWY7SSYbExQZ7pBCqQimIUap4x+NA3qm5Ea4=;
 b=UQeRbTDA8WvghjchlOQICuBNJnb8j/5s0XFK1mdpPyZWDBl30U7GoGA1
 rAdr1BPKfo3eyxDXEa0Xt3+7RZ2KjIda6EikTskW2YUmZA5YTFUzOBB7j
 IBlp4mMOz7xY+WzLZkh83BTF7Ya3DI6Sh6t/mUUOfUCHtSl8R5Pw8l0Sc
 AIfFW18t9h3dhW9qIVzHDty51eJYMKksugeR9hyRgGuj4IWddk5WFGkAw
 yM7QVmof+aLPooTRKHuvkN+hrTjEelKdNeiGdnfSe1REkCc0DaLY/FXzl
 EnGcOatI6MHg/TYv9XslIX5nMIAWm+P2JhcBgkWlHsp1DQQR8BLfM8wWb A==;
X-IronPort-AV: E=Sophos;i="5.87,241,1631548800"; d="scan'208";a="185843618"
Received: from mail-bn8nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.171])
 by ob1.hgst.iphmx.com with ESMTP; 17 Nov 2021 20:25:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLtS3e6P65buN8f7713ImgVrfrveuf40q+3eXODcK9wjn4LCd6+jJNppDoxZqDHABUJZRDEAGgBuWaVPXS0J6gdpVNVNRZ/EM6eRKsGy85TPdq3WWx25OL+6DtLwlmMZvjOGsi6bi75EhKs3ShAsPdQMt+2cteXZOUsslB4pdknZHRejwIKRmEKa8uwCRqToXJBzyXSr/JxwbOaR0+Kdn/LVG00PjudnEnbQBtWJ00BiCMGJSCmNe7rFB08p1YaMYU4Vj6KfJF4t6iVusnaIJcXoIfGcfPNzHM8nuHopDuLQf7CDlBQtuKMvKGW8UoLPJD/rjEaQm/kYUYUyCHlGbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXiPvRJ+wmKCVGbBuapU/V+EH1q2Get2vbubfKE3sTw=;
 b=EYoNuNxA5ZTp/qjonbuEb1QFPlVIf2XCZjE3ZV3ay+rspE4ViR7baZl2qLFLYrIeuCdq/rZTE43plUYO83qidsK8TEeQWG4knlVSk2kkYA3HxdQ7IiNq7V/rksm5EHvhEIaikLiGfcIJcyNv9DyrD9YFPWwBHAe3DhZEQVw8BrVjFXGGy/9epk0c8RKCGhZv6xWq1EXH2FEhC2p1/G9tBVZSuBSBvx178YmpkroSLHJM86p6I/6rXSqUMTYmhPD0ReGENcVo2DoYVYUyuKZGUqGyAIko2TZjRILVyrPfAocADTAXQ/SLYn0JnmgUDla3GGVlj3ZRyfjtDcP3UixUbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXiPvRJ+wmKCVGbBuapU/V+EH1q2Get2vbubfKE3sTw=;
 b=DslZuHqj0s2t2M9xe9BaKhg6E/HeW9iqJVA+DqThU1otcWtE9KLyzp8ENaCRBeYKGmRHs99KzguJZ1i160hGIHXiusmVtsxHakeFn//6D4uyH09Dr1MDBGxt8xZ1EJTO8z5Dl7CA7Z2FKu8pPmvFPHn4z91Wt48ws8NKNjaEpq4=
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
 by PH0PR04MB7430.namprd04.prod.outlook.com (2603:10b6:510:18::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Wed, 17 Nov
 2021 12:25:05 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::3418:fa40:16a4:6e0c]) by PH0PR04MB7416.namprd04.prod.outlook.com
 ([fe80::3418:fa40:16a4:6e0c%4]) with mapi id 15.20.4713.021; Wed, 17 Nov 2021
 12:25:05 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: move all struct request releated code out of blk-core.c (rebased)
Thread-Topic: move all struct request releated code out of blk-core.c (rebased)
Thread-Index: AQHX23puPh6a94QiwkyaOhO/0f5NoA==
Date: Wed, 17 Nov 2021 12:25:04 +0000
Message-ID: <PH0PR04MB741623EA8A7D0BCA67EED1F79B9A9@PH0PR04MB7416.namprd04.prod.outlook.com>
References: <20211117061404.331732-1-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cd94c2e-30f8-49a0-a3e0-08d9a9c5492b
x-ms-traffictypediagnostic: PH0PR04MB7430:
x-microsoft-antispam-prvs: <PH0PR04MB743017B6923148D7DC98BC509B9A9@PH0PR04MB7430.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S1nK7DN4hpPV7HMADDuUeP6I0IUjhFfF2xJ4uogJDE+EG/HVv5jrbOu6HDz0eHrkWlK2uL8sdqAETqxuOjdWi/me6A7KHI/WQDNOHbPRAh9W4CHJ7fbHpg6zmyThRiZkAyGuESJpdAkBvJvLavnguJXGBt8zrwPOOg1rkyesRiNdhmfG21izfQKUTscRIdvT4/rLB58lFG+tm23M+5ivQvCGm/eCV1OBRDVwJ8PGMwngRW6XPQx/CmeQkETM34cuzOYsjQEUFHFTIKgz0hwQwn/JG3Rr5MTKQEY0MqbBnI8LSywHrKv6NGSKV3p61sm4WsSfqvPv1cMqBAWh+Dv0Ea2lO8hZT3nMzOwpQY82RBEy4zAok3aAz78099BrvQO9V83r7qVQSIngaeFXYkS+4NvjgPbzv/+f7rtsM9aCL13ZxHqEJbSI9N7ipkGLW4rLZpc129ItTEHvMgJKP2Cr+Q3E2AnxzK/4F0ggVaicC5kUq1IgqDDq41HUgbkyRuolyr7mhMvHcIqtGOFSP+/+wzgUivg4uyyt12oxdX/92taKzAak83EACqtXH4PeSHslitbgfXzj+VotEIgSkcb5OHxpVIaB/SnfKeud5wlqyIlF765AKU2M6K+nG+87wSkY7tB3DXLcAQl/4rYjpm5VPXzAsgakqV3/NpcyvufPMwrCHZ4Rr01hGmuk03N5OsM/heDgehRUF57WywOwgHRetg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66446008)(66556008)(83380400001)(52536014)(71200400001)(508600001)(64756008)(38100700002)(82960400001)(5660300002)(86362001)(8676002)(76116006)(66946007)(91956017)(316002)(26005)(53546011)(7696005)(110136005)(55016002)(8936002)(38070700005)(6506007)(4326008)(33656002)(4744005)(186003)(54906003)(2906002)(122000001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pPFh0FUu9jj0eaYAogI1rTrlEBJ9ysfjjr6ozOxb2z4+tOjt+uNvvWoHVscy?=
 =?us-ascii?Q?ME/uX4IKc0mwDVXF02AmnycvmvvM28qpb/QT3paeR0+zAaBk6wIJGHFMyxGc?=
 =?us-ascii?Q?hSl5NRIFb/Yw1NQb3Io/u1hwDRu8cbohKvp+obF7EOE68azefTa6ofPUv7JM?=
 =?us-ascii?Q?H7IG6WBmmGdHJdCp6Ynot+da5FvwojsTq9wOn4X6mVUWpeLbcyrJQL4ungNo?=
 =?us-ascii?Q?Uypy80lN7LFqeOTsolE4mwsuroLjlaqDI4/tXWZ6MBam5wZ8+D9vGMwXjCN4?=
 =?us-ascii?Q?zpTcCayNWjvdh+YkLdIaGSQLu4QyrJySFqdti2HurUsGsMj5VgtF5fh2x4vm?=
 =?us-ascii?Q?z2NyALy2Bma2FWXAjRH9h3i9mq+WyKsBU6cxLyorOVN8pVEOIo86rCFvjDKh?=
 =?us-ascii?Q?33Nh4GNjgPlrvkDLBQynaMQEQIAkX4Y3KFL2n6oC2NlDXmkGlM5++FvJ1eZS?=
 =?us-ascii?Q?YkSc7lXn52CeefVJ7M4zAGoACElDrTZ9AdPyL5cA0RjSjEJwbOls/6R/XJ76?=
 =?us-ascii?Q?sTuRdYAa8J/+GpIu8ahgTPxzRiErS8r8MWofyTHpfCXzNSyWcpT9DA/m/3yu?=
 =?us-ascii?Q?31CAF4tt48TN6Uj2VxVY8816gzGYkt7UIg6DJNQIQMhA/l2DB2Q2h13B2MmY?=
 =?us-ascii?Q?gnsUajKGJkkjdNK9GRJghZle0NmMWzu/h6rZvoE0gJes2zJ0GVsQR5JxXbLI?=
 =?us-ascii?Q?wJLj7iVNEmC4qDfQt4U/yg1AZKK343KTAFtwZYQ1hcKnO9APkbXIZcjMsX74?=
 =?us-ascii?Q?HnAUsEqC3eGB7cINgjMK8FbcWVdr02xrcWLoYbNrLmAhbowz27j3+VnMHt0r?=
 =?us-ascii?Q?2P0c1xaP0zFc613ExPkeLxGXR2kkVZp89emFHQoJ9UoQDAfp37TXFwztRoG4?=
 =?us-ascii?Q?V2QHaHpLE7ENAnryna4vG+I/1PTeJ/BjA3cysWWBnnq9GtDQGtM+ODeaws6g?=
 =?us-ascii?Q?53f+1E7lhQ3TU60cb1Pzy25ofDFpJ9w3TGc7W5WPCHLC0XaUdj0VL1xJ9qQx?=
 =?us-ascii?Q?nlc2u62TFaKCJ7eHjMY+9OXX4tGnnRIlo0PqfFmRZFl2TOXgTG0qtnu/4bxh?=
 =?us-ascii?Q?HVbnXAuB3DFNec0ZaQ0ZW+Ib5gsX+i61KzN/bBmFc+awPAiajONLwUj98GVy?=
 =?us-ascii?Q?+RSJdnBlOIBT6k+LTRB8vNVeS8YHVYUK7NPYDLONsltpA7ByJZJCDcBZ04Xj?=
 =?us-ascii?Q?cED7G58PGEpWLUCy6+cqyXyqup//mZzcSclrcMidVxz5/+5pvsLxs2l+bt8+?=
 =?us-ascii?Q?CtKEquHm3xeYWLNVNeLGlOz75BwK4qtwoRdOV2WfKa/RfQVtx3X2NbxdZG+V?=
 =?us-ascii?Q?8lo9jDDQZeBS5YJDDvEy7hAEfKQ2yfs+1ZkeJsN2nH/FQM5gSDozawgRs+LN?=
 =?us-ascii?Q?r0K6Wc6Z59Eg/4M60gLKT1T4KrD47KwwJojfYB2OkSmL5tKIOLucX+40bUaa?=
 =?us-ascii?Q?SYXCpeIxTjCgApkAMtARbpJrEKMCasZfI3HID/JS+ckVPBbiLr9LhU30en5U?=
 =?us-ascii?Q?wqvQU4qUQH+W1uvbJHicNzc/duwMgbWjt7I4jRwFoVx7drRM2wJ9xXsNfPrP?=
 =?us-ascii?Q?Mcr2Iflt1wXdKSFpsxRtXFqNgF42PqVi1kmJFHqugj35WqKkBSCJt0H4QAEk?=
 =?us-ascii?Q?3uzsTdTC3davTjh1re3UhObPeYP8PoCamKkGeOIHCoo30hLzVPnDaNjxiWcd?=
 =?us-ascii?Q?1E9kq29r0aVpQJwJD21SkOa27Pc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd94c2e-30f8-49a0-a3e0-08d9a9c5492b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 12:25:04.9350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oi94vUqmfndjSQEgLwBNGyeihLDvjk1i+mTVXyQzdES3JWmWwHhCTlDuY7RLZ6pSUPNIKOf5ryFaNByyKAXoMhb1Z6ZqQEHBjEnBkP9whMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_042511_137786_737351C2 
X-CRM114-Status: GOOD (  11.52  )
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

On 17/11/2021 07:14, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series (against the for-5.16/passthrough-flag branch) removes the
> remaining struct request related code from blk-core.c and cleans up a
> few related bits around that.
> 
> Diffstat:
>  b/block/Makefile            |    2 
>  b/block/blk-core.c          |  341 --------------------------
>  b/block/blk-mq.c            |  573 ++++++++++++++++++++++++++++++++++++--------
>  b/block/blk-mq.h            |    3 
>  b/block/blk.h               |   33 --
>  b/drivers/mtd/mtd_blkdevs.c |   10 
>  b/drivers/mtd/ubi/block.c   |    6 
>  b/drivers/scsi/scsi_lib.c   |   42 +++
>  b/include/linux/blk-mq.h    |   13 
>  block/blk-exec.c            |  116 --------
>  10 files changed, 552 insertions(+), 587 deletions(-)
> 

Looks good, for the whole series:
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
