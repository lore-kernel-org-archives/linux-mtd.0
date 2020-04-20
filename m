Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75154C3815B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 07:29:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 398BB20BED
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 07:29:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ye2LD9E+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="0Dn4PQAA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="dEFyWEsa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 398BB20BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03KnSgZ8bfsMHnIPpBZqHNsmX2DnXKiX+m5/Htyy9uE=; b=Ye2LD9E+xaEltZ
	iJ3JLj4TLI20Rh2O0sjZhCsbPjlYwfU68IGrIO4tx4fRa+GaVgZgFzsMy/I6yNC0uOwpAKidY2aiE
	nsiHn4sAs98DnAtGFGiqWNtLbBSBBN/EgRdYT5Mq0kYN/LiGFDP+EFapYeX0eL5+5GSdOj+vu1hUc
	OVcbFGCHzjuMnMtS70OGBripZ4t6WwPaQKhg5xlepuIuihbXEyZMb9iG5BQKW+DjDkXVmRSrdLu/W
	5OSh8Z6owIuM5y6LYmRHmswT19Qt8MjIaOW/gCUbyXUGpjx+vsloEjWkQZXPgstq/4cXaEGSyRn6e
	zgKAl6MU301bE54EJOyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQQsL-0000j6-Pu; Mon, 20 Apr 2020 07:29:53 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQQsI-0000gz-7L
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 07:29:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587367789; x=1618903789;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=p/sErFrduiVuZDea+/0NQCV1CCLxUi6qI+Gr2Pvur04=;
 b=0Dn4PQAAuGXwfZmXfkLYnz/2HfatXPAFYBhwq7PtNpnXEaJErn+t40zs
 M2hu/mra/KDC9+Sep/DaojeUyq1M0axdL7YbRmSJ2MTal1HDuQOpgWIo2
 ErXKmPCBcXmZNqB0Z1+V4RrajUnp9bsfuDKNL/Sej28KrCGF6bzK10w/T
 fYCNsWpXbyM3kM9SFT/clpxbCP6Ost8mxjZ0uIpmk2Sad+qhQNQrUGMhk
 cNRsOwHNdB6MkaSjvf06OUpw5We3uxQpxis5oLv4GeyK5ULqB93mmTKwk
 1WpA4GQN0fdcFpKqQSgS4JWZJJk9w58h4FHneCqk/6OKIVgyHbkMwaIIb w==;
IronPort-SDR: N+oAmsbvAPBLXzu4lqlGqsl82Ssq+OCNuAf9qYFzpRMuT+F/jEKZbPEB8F98t7dIFENL7CU3vY
 oFsV2nilTIHZhHc53+RLSuiXfwaGH1suIMoJWbz8QOyv4OLB26LSYC3wC/AlfIJ/OVxmIeGyng
 Mq/Ne0JBvvbiQ4WNi4mVgLGKUhkPM5qfTIumxgLL2UNR0rcAX6U9KGTL3vp4NdRWQiv5+wwJrm
 UWL9xY0+u/VP5bzlq3mtzt1D48Np7mvgKc2eHw0hUaV3nhQe1+CA/4xheoGex5rot8I/YpjV3y
 Kkw=
X-IronPort-AV: E=Sophos;i="5.72,406,1580799600"; d="scan'208";a="76520715"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2020 00:29:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Apr 2020 00:29:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 20 Apr 2020 00:29:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k27jsvQZdelZXFoBKlhB5leUIA+9NE65iYBSMU8xsX4TsBw4uPZXQ7f7vPWCfg4qgNVSLUbjieNn/Fe5vlLKirFVo156lBfqzHx7I0h8193o/IFZx31vK+3Bl+1k6nR3+kfEkEZUbG97dBhUsKqbbgjRb0U/8drcjTiEo8YZzMy849Qb+cmLI6M7xENfyiUu31rFctqDWh9kcp2/HHzCNbkHaWZsShqqMR8BK0dDNkpwPweRmFMOdwOu8T+PW0paULPhCmkNr3eoiqPqPvEhR7d7YHc/UJkZuSs7kdvuMuYJqTY9g3+VGCW+SfawXLmFoRA4YalUi/Eu0vn++QFvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2kYR4z0xGHvV3t/ch9OVTwo/2S62DC6fdaRwjAV8ro=;
 b=UD7RfKclujgbGiCfNVlQAYcqtlnH735IZYJva/JD5is0a9DdvO1rUJQrk1qlVNUeowjKDmIIb8CQv4j0tPYbY4+aof8G8EsjNBV1FHMM7pRygsh8cS7F+eU+bRLEqroo3Lc5mEmhmUtKtZVY+yFSdYsyT7w7aae5UYuEjCzetGxWAlu3o3bClAp4tdMxXWBG0VcausqgkvDLn7PNv3v1Qm/uKawmf/T/dTqd9h72eZ31hSmIT4vfRT7QLozd/8Np7cN122BJQ5ksaBIl50ckRVySgA5T1zBT7Mbe+IqwiOkLQo2B/awk37SnCtVUz8YCTfljOGLhdI7rBGygDYaa2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2kYR4z0xGHvV3t/ch9OVTwo/2S62DC6fdaRwjAV8ro=;
 b=dEFyWEsaG/J/stJpOlg0s1te1rvTOtJyF/k54x+AHeUWrFX14xdo/rsL4Anbbqune+uZigb/ar2pnlGOi6SP/8aYdSZShor4X3gxSHzZrnNzuWlP4S2NG84f/NKN0gYroOAy+AsFHAB8/pwZQsZ3DXgOjLJE106or1gbrEfHPjM=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4136.namprd11.prod.outlook.com (2603:10b6:a03:192::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Mon, 20 Apr
 2020 07:29:41 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2921.027; Mon, 20 Apr 2020
 07:29:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <shreyasjoshi15@gmail.com>
Subject: Re: [PATCH] driver/mtd/spi-nor: Regression lock/unlock fail
Thread-Topic: [PATCH] driver/mtd/spi-nor: Regression lock/unlock fail
Thread-Index: AQHWFrKxoM6aHp0yskKh9iJVNA8DIaiBnYGA
Date: Mon, 20 Apr 2020 07:29:40 +0000
Message-ID: <2776438.Slas4mmtxa@192.168.0.120>
References: <20190919014916.1303-1-shreyas.joshi@biamp.com>
 <b23d7d84-73d8-7752-c671-f3f05d4c9966@microchip.com>
 <CABY4bmpv4cdYDHaLvXX9ReACytqQktTTv867BUB4MNH-NHoCxw@mail.gmail.com>
In-Reply-To: <CABY4bmpv4cdYDHaLvXX9ReACytqQktTTv867BUB4MNH-NHoCxw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9096b3f-e80a-441f-90c2-08d7e4fc96da
x-ms-traffictypediagnostic: BY5PR11MB4136:
x-microsoft-antispam-prvs: <BY5PR11MB4136F6D5913C966C7E043916F0D40@BY5PR11MB4136.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 03793408BA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(366004)(39860400002)(136003)(346002)(376002)(396003)(4744005)(316002)(81156014)(6486002)(54906003)(26005)(6512007)(9686003)(8676002)(2906002)(6916009)(966005)(76116006)(86362001)(91956017)(66946007)(53546011)(8936002)(6506007)(66476007)(66556008)(4326008)(14286002)(478600001)(186003)(66446008)(71200400001)(5660300002)(64756008)(39026012);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EN40qMyuLVe9DU+sdsyL+TvCiU/IrJ5OUyyob7yWebivgZje7sMycfLaBERax1KvZ9fT+uCAMzZODR3o+CICEEnGz0Xj/dpZ9bKQY/SanmM7lBFEIZVHuyxz7vrl8nuOGirWos9J+f6wUAvzq5YwWdbm1LOqn9kA9BwN4/QE48EX1L5M0XF5D30b7glZRAQogi+Jxv1sdWsPosxIX+S/1YMFM1+OYr5J2Sy/wwGFvVawGXy+JAshFJsw2l0Xb2t7foZcyUP2UuXYgp0ik5DEVz8eJYs20PGCsgUiRdgAqe26UpoSjVuq7NpcQdgf+sLPm8WfmgzEJG1FvWUOuwwHnvrWFuTaPgOdrmyeDV0GDE2I9FAOwmE7w6zue4Zocu5XQPBruVisImSjsoWv5h1sde5wgqodgLOOeDcRLsf94S3o9UR/VX6bOcbLrY4WdsnCFRP3NQzohKrxxFevP1SUecxIHojghOiTyu28C+5JdBktkxBXOtBQ8X1PgtaIH7BhOsinPjuNCmCIbdTj6+fqnMuhEQXRVO0V2ROcahAhLV07tECJENdqBCsksYVFlh93w15yhRdh5CYOv0GhPJVt+A==
x-ms-exchange-antispam-messagedata: eJY/xQIQKeUo7dWznEsbMniLrb8EgrrQqRUlmhcQ4Iuq9264yXpMNL9zBQgwrjmgmdT4Mz9KPu2vY2lADS6iVt2Ki2pMiNOeRmaK9HPEWuW2XJgnDUIOPHlF6SD8O6x9NTkUYFSnPrfiUn/VdTiQ/w==
x-ms-exchange-transport-forked: True
Content-ID: <776844AB23C8F0479FF5CB4BC55D946C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d9096b3f-e80a-441f-90c2-08d7e4fc96da
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2020 07:29:40.8533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ajMelYiDVqj93D6BDeXzvbmI4cd4XtRB2WShdjyOpxThhnTVmwpkdPboukwjA8Mwi/ZEbJ4a1OilXfFDesOeuA2jxlac2gkidTB3cKo9+y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_002950_359129_16C198FB 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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
Cc: marek.vasut@gmail.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Shreyas,

This is not a regression because locking was never enabled for n25q128a11.
Please apply the following patch on spi-nor/next, it should solve your locking 
problems:

https://patchwork.ozlabs.org/project/linux-mtd/patch/1587103677-244754-1-git-send-email-chenxiang66@hisilicon.com/

On Monday, April 20, 2020 4:25:55 AM EEST Shreyas Joshi wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe I tried but then I gave up since the latest code has no
> room for porting those changes. Instead, I have raised an issue in bugzilla
> here  -
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=206867#
> 
> Am I missing anything while raising the jira? Is it wrong way to raise issue
> or is that Ok? I didn't see any action so I was worried if I haven't raised

I don't know, I have never used bugzilla.kernel.org. A bug report to linux-mtd 
mailing list is good enough for me.

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
