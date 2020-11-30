Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A8EC64E8A
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 14:53:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B600420719
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 14:53:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ITR23rQ7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="LJZoBYNK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="ovmX92k8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B600420719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=NMHM0oJOQB4VZmPlvBrmCK3NUGXybD/RMc6APb5Y83U=; b=ITR23rQ7980RmYrjI75EmGoFo
	qKyB2LcFbZoPVEfQaf+7dx9ZIAxnTc6Ps6GjmhW9adKUa7mPmYhJM6MIiXqFq+n7oXp1Ilg5ATM00
	uuOz2exU7tMgrhTKGRJw0P+cHeU3ifkrN71Xvryn7mPdZTX6AoFClTFVMjldqxpMrOSWKiXdCY6ql
	K+oGh6tdf8Vx6pwU8poPoFeXDGbqzG0dl9dxAWc6YMks/JafVgcEqYFL9MzSBZJGI0H6EHVU79MdF
	1u7WGoSM2OxL5qMd4p0QFsmDNxDxGRUevvloHHT8HieQdRa2XyFHGIhDgWPLkQAC7JGRKKW1+S6rj
	Qj+cidkAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjkXf-0001my-It; Mon, 30 Nov 2020 14:52:39 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjkXc-0001lw-KW
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 14:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606747957; x=1638283957;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=i73cQScyOXtQNhKCgBM0j0yco6YrKjuowVHgFUDbKic=;
 b=LJZoBYNKOllQRMD2v+tDvEum1Vch0wk7OqmKIqBjFcUmczFGTMG8Y8wT
 QH19VfEKgUDIVF3mT0TuG7W5o5ci/83oVX2Mv9yNvUD74onbcDhRFcye7
 u76LRsy7IONX1CuCMO2FVSa4wEaGRwenirwZhwHZ/KtB8290wS/jmLvt2
 adp2Ek/s22y6rH+jIVXyG5H0fJYgizkpt3+JB8g0Ef68X5K6lt+yXi2J5
 TWpXJ7wDLvC/GfJdZVVeV188l8gRVlf2MTQk+S7a9oHbEb+gN7Z6zSnaG
 eFnStqexJEDFSwfooVfFjd+RYD7nZ9w3IHYO1oixdt8bCSy/XoDOAElRV g==;
IronPort-SDR: FnHzlgx2YoQZHs8ddqBxeUk7QRvOTn00f2y3oWw8CIZfcnlgna2xWlY5cfl/Kn8K2fkm9F2Mne
 cJ342k2ooYe2D9XRAuye0RJRxfdm9mmZ4BgeOLxFMwe2Sc2tRBeAo0qcDFv3hEgmIIPYhFKN8C
 43iI2d+kjEZm0FaKF5N9wDdgL795AlNFIHHwltqkP5HIWpH4L7gzxFyIB2Fs3ZjZyq4DerViBU
 BHrv7MueD3/5GGBthYq0SfxbxqcZ2WhFPxQym9Q5pgs4WM00r5suRY8qc/UrOiwfoZFp2YvhyN
 Ogo=
X-IronPort-AV: E=Sophos;i="5.78,381,1599494400"; d="scan'208";a="155018471"
Received: from mail-sn1nam04lp2059.outbound.protection.outlook.com (HELO
 NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.59])
 by ob1.hgst.iphmx.com with ESMTP; 30 Nov 2020 22:52:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KN2u02cetZV3twosDHedAXKlVX7QaKTYZy49emQGRFT6In/PuTPPCBZjPoiIhDkSUnIgsOMXQ3FV7yBzUzlITDTuDpbYfXgLIS3iar1nBUSwwbi6ZdkRWROIGmZYN7+FEKwdKDCzZ81Y8SeX4eVKhirMJdXkSDivz7wd5G6NjJgONslTNSoTomO6GlDXTcVUXjVkb++fJU52LVZj/ztBspTqrlSx/Y4309sOjmNlZbHVKMnVN1rMLgMvOJyb6Oyx6kbKqCDHUo/wDJ+UNVgtglRVeNrII8En1/Xk7BZSP4HU7A9vPSUU1t/3unO2IqNZktnLmL+4C1y9xnZG3UWWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i73cQScyOXtQNhKCgBM0j0yco6YrKjuowVHgFUDbKic=;
 b=ciexDgL8wnK1bANdR1fvrO9+j7UyxJKL9HAsbwIAshvmtWsFtgH50H7MrbPY+L+ZvynyfKkccalIoWyEyMLTa0k5ErIJ0iBKXS4ebqKoOYIRYCwcIeJ3DQykrZn5lnE5yzwOl+WiPei4dQzOjsoqahRqFIGku6dqczFTXmc44V9NcRYuqv+w8yzlOsXfjiFSeL1+kS2EkZObU6fibz+FzLXcUnC9QnVygS4sQ4hazglCt9sPQAJR+PGMEdcLCSFS63HPLdqM4TZR17xgVugU/LrrVbf+CZhuBdsknPmBJ5mrfn7V8rP0V2Wev58ZeATmAP9OsLwWjVxjfMuT3tyCfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i73cQScyOXtQNhKCgBM0j0yco6YrKjuowVHgFUDbKic=;
 b=ovmX92k8Kky7+MY//6l26w0lpuAfwqiI+/u9WbzkeEHr6twYwyKPVg3nT438s2UhL+EA2+N2RX4vintYJYsORDlZYd9RC96+9lL7FCoGazG2gsJZSayEFX/L+4FiESE9QS2okrT3f6Rv7tz7hFgkbvPb28S1QRN+42HfvVB/01Q=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN6PR04MB4927.namprd04.prod.outlook.com
 (2603:10b6:805:93::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 14:52:30 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98%7]) with mapi id 15.20.3589.030; Mon, 30 Nov 2020
 14:52:30 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 16/45] block: switch bdgrab to use igrab
Thread-Topic: [PATCH 16/45] block: switch bdgrab to use igrab
Thread-Index: AQHWxaG7mCeKo37kOkm/uk6ftU/pPA==
Date: Mon, 30 Nov 2020 14:52:30 +0000
Message-ID: <SN4PR0401MB35984402FF62259631F178A09BF50@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-17-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2001:a62:155d:1001:2c26:fc00:7c60:29b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 669144bf-890b-4421-c399-08d8953f901f
x-ms-traffictypediagnostic: SN6PR04MB4927:
x-microsoft-antispam-prvs: <SN6PR04MB4927E44374573975A0CB3FC89BF50@SN6PR04MB4927.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ofyRCdhfnZWlX3fZSfsHkfvfeLrxaRoVaVTYTvg3WsmHhLF/vHoS3Q1Xk4RvUDYq3yq11f5850vA0SWIbF8OJyDl3pXqcbc77cBOODA0bxhCtCVX6+WPam9hDB+1k47Y4DLS0BAitdaHPT3aNoCl7hkzLnjzc+MnM9/4VPZWxJvLGbUI2H/bMDcttJnOiAR2FIxFFGrYgtkQESgLFuilE03zN1c6YtBShsSzJQJnrfhj7PiYNPZD5BR368u11o99eeMPPayhc0dp97ysPbZyzzQ4tz64/nAU9mEF9/tAeR6XnCnhFcAwJFqss8y+L2themWYmSR8Fux1uuOj756mmw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(4270600006)(8676002)(2906002)(4326008)(5660300002)(6506007)(558084003)(8936002)(186003)(76116006)(86362001)(91956017)(55016002)(33656002)(9686003)(7696005)(52536014)(19618925003)(66556008)(64756008)(66946007)(54906003)(71200400001)(316002)(110136005)(66446008)(478600001)(66476007)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?y2DzVk9PF4LHvHeFuTJBnxcd96WXbu0Uzab+SjAlkrHx1h7flDepdFB5AMaK?=
 =?us-ascii?Q?VFUCk5ZwSipScRyNkDffYfQ/34dsWmkYzfEiqBfdkhmRT4+HtH8wLXFtfH6U?=
 =?us-ascii?Q?mm1/4i23xhFvXv07sJDp59MpkSd3uiUUgGgJlEh7W5SYRhq0PMC1GSSeIiQb?=
 =?us-ascii?Q?waqDFfKx8cUD6KPonzG+ULY8b27RiPwLbg/G7rSzbxQIeVBtV3LNhsf0Ni8s?=
 =?us-ascii?Q?rBJl3AH7fNpPKT9XRJ9ynTUslivf+cK4m56xH0zo/FxGQ47pzSXCdNGElXK1?=
 =?us-ascii?Q?u2DAa8YKIFT2lWXyOXl4SGSuoZ5S+ZMeHBMQtJtbUtEA/ojDAGhQDrsQTxAN?=
 =?us-ascii?Q?BOTT2eOF4fA9+FdKbAVKWu1WPbPzDUyL2MJgcMsv6STWbybkT73mGtutrBR3?=
 =?us-ascii?Q?4OvM5RxRqkiIpP7c7ufU7Kvl3TrCSsb+0pPo3o681JrGQchpnNC6iozXzowE?=
 =?us-ascii?Q?9NxnlpdHPaNPxEWs4ojTAU6lNjux28U7K0GLv8SvLow3sGMpmxiHXbBI/sgI?=
 =?us-ascii?Q?pl30gdhXO/9UAJLk+bIkzdGJwFrhHt27AItAmYSJJL//R8MX+ilpGAKcMGIR?=
 =?us-ascii?Q?FfI3GgyvGgxzJZ06yDjA/8epfUNtq0ZiIsGGiYSeVzJNL++XIM3zkTIM+zLq?=
 =?us-ascii?Q?7kbU53RSN6cRMVc4kKivy4qJaXkuX5uCU3NTT+gI0XwaxEiAAlbmY2+61ukE?=
 =?us-ascii?Q?I57Ea2HXYCPRE2YvcZTTHK0tNIzba7T1s7ge/bar0qqWqHzcMqzropiQC5rj?=
 =?us-ascii?Q?V3+WthI6MHNZFdMdnuexhbdGnCpMCM2mOYD/lU/p+F7ktV+IM6zYOBHwaZEk?=
 =?us-ascii?Q?uIDasbzchVZTx+hxXm+CHsHXYfhJOj1rBVocjjBkzmpCO9dRmLBwNIYrGIuk?=
 =?us-ascii?Q?MAuPpHxc55lmnKoyrArglPiIXk0VNf30DT7rj3s2FIi+a3+u0I5k+cwq5BzG?=
 =?us-ascii?Q?sh/KqM50N7INgJnGmDbfdCmwl19H1gj4ghI0qKaiLs7hwyhqU/yTNwp9uqkY?=
 =?us-ascii?Q?4vOds73o0tHx4Vh2g5HhurjIKb07trejk9OyAo0cJtFRhFswH69aFmZG7IPR?=
 =?us-ascii?Q?bOFIFnTB?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 669144bf-890b-4421-c399-08d8953f901f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 14:52:30.5774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vBCTSjwnFG0YCjVi+xMBBfMlLOrnn+Bc4HWWQ4nL7n0gLLjDpaYZl+xEtTsKglrJ2pIelydu6/P0vAuVaEyolqSdx27yF01EEM2M7ErckrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4927
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_095236_825501_77C367FC 
X-CRM114-Status: GOOD (  11.81  )
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
Cc: "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
