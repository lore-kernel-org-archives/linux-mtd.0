Return-Path: <SRS0=vQrn=CL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DE3C433E2
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2020 19:37:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1C362083B
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2020 19:37:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dz4B3lJZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.b="idnU+vA9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1C362083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P+GZl+AyqRsAgRi9odWkTWawPV9kiZcKgFUTwd4XQSc=; b=dz4B3lJZBgPEwy9YGje0Rm9JWN
	2GUDIdLtDh26ti3XlxKSjylNLjogsgFD+uqmq+Pk2yhq+IswOlQVh8fXWJRBSeYoU1BbSGZGeaa6n
	MS/DjwC20TdmT0vPCK1u4jmZ/6VcD9o4tSw5Ev1m3jLwbWdHcmVoTYmcFTY74sXctCKIMdNJyYcM0
	qiPxNpy9pBSXrXXYqdvEtemHa6k8NNdq53u81JZaDj7L47ajPLz8W3DJVrb3/e77jkdy3CakUjgAV
	j1f0xmS/ju313s9RhSfrIwNYBX26GBnAGy7YJ5bzNo9cC2dbR8Xaqjb1JKvrofcef9vC1Kp9eOjSz
	Weo/rsQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDYYG-0007mj-0b; Wed, 02 Sep 2020 19:36:12 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDYYD-0007ln-15
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2020 19:36:10 +0000
IronPort-SDR: eTPSsuGXNbNtxTdps8fCzudoUCxAyQvqiGZG+sMvZ/5W6bjIffAINp/xPjXsVM8PNXtBf77ngk
 XYvC6KdTjUlg==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="154870166"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="154870166"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 12:35:47 -0700
IronPort-SDR: rlO6LQD24La/LeNZrkrr0UgRq3wdR8OHz1htDU+5X/ESLJC2Fh7R1+ae0I4WA23YTeC9zZRJcq
 v25xniPB2Qdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="297784014"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga003.jf.intel.com with ESMTP; 02 Sep 2020 12:35:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Sep 2020 12:35:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 2 Sep 2020 12:35:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 2 Sep 2020 12:35:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcqqDrRGay3aPhPpZuTpB2DvN8kRoUpdRdRB/X+Y/Jlsrv5HqsLOwFpuA73BL0s0s7h+m9NuOjA81bPXa/cSAmTyCTQ8lby2PeUD3N2HqWakthMv+SYYPlvZYwlslB74hnZG6LyWqGXtsCuhluQAFDWc/5oLWVt5UsZKQVEk1HNmSCksQnObqPiBiO4bsUHO4Sy2WRfCb8bNed3nst96WI7y6ZNiHxORTQ02/EUFK+KkXQnXVqhwCQ4rSx3760tDB7Y/62Us5XMc80wjxB3o4IC1qn3Se/Lu4zmHbrJTRbnrqjQQxFLqjEWVYbP/Pz+dl+wp4IHSkRyfal9z+A1V2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6YKfGrmG2FD8+nMe1cGRuYgIhXXC9l8PQgiCyCXFqI=;
 b=Az+Fw4y4wsF5+ZohqD98h3X1W2Rerc7kntTcCtSiqCLdPygygaWIoMsvlpv0sXxypyaiYOgNMZ0EVD9ShoO8AurOY/Sj6t560H2W1zQD0/Dv55S3MsY8mT43lz6aldXVvuivwYeES4Lc6qyXhafvPmbbvzf2deTUkc/fuPrDKNpzZir8N90ItLHJZ/u8bC9Umd4jW3SPtuPuqq3ggl6aD2yYhurm7wfcu9G3RVgvmifANL2iTYBXRSqlfa0qM7DGM+W4LRCpJ/6Z8Q8bDmtoST3o9u5aGucxDeWLXx564UbKn4j857Kx9ZiZ9TImFRCijGmT5oH/rRVWl7qF7omTsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6YKfGrmG2FD8+nMe1cGRuYgIhXXC9l8PQgiCyCXFqI=;
 b=idnU+vA9C+eDfG+s9K0HJkhbtSH3EaSlo9vtylan5+rWOJznOpv0J7haBRAp8ll9UGqMWitOQM4kB+Hb+588dkBzacrnlCuJ882VZgitGIfbU1/1pvIgF9gIeykdquzGDKJ6vTm8kgpHNIzqClqlxnfqRyOPSGChUY1rrFP4K34=
Received: from MN2PR11MB4032.namprd11.prod.outlook.com (2603:10b6:208:135::10)
 by MN2PR11MB3902.namprd11.prod.outlook.com (2603:10b6:208:150::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 19:35:45 +0000
Received: from MN2PR11MB4032.namprd11.prod.outlook.com
 ([fe80::691f:ec35:f768:dbd4]) by MN2PR11MB4032.namprd11.prod.outlook.com
 ([fe80::691f:ec35:f768:dbd4%5]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 19:35:45 +0000
From: "Wang, Liugi" <liugi.wang@intel.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: SPI NOR Flash read speed too slow ~0.5MB/s
Thread-Topic: SPI NOR Flash read speed too slow ~0.5MB/s
Thread-Index: AdaBXxxb7D40wfT0Stap2YEnI0wdJg==
Date: Wed, 2 Sep 2020 19:35:45 +0000
Message-ID: <MN2PR11MB4032B7F379D8A43B47D69E73802F0@MN2PR11MB4032.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [70.15.1.233]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64afe98b-b20b-4c86-5fc0-08d84f7762f5
x-ms-traffictypediagnostic: MN2PR11MB3902:
x-microsoft-antispam-prvs: <MN2PR11MB3902518611826575528CDF98802F0@MN2PR11MB3902.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8gcea12UfO3m2qYPhNSx8AaQx7o/wNJeC0iDDd/+ej44BJQ+Zfe6z2VnEMhbYF9B6fpT1v1tfFSDtJPtLvhZiZG32n4/iWU3Kf6vvffM2CCI+n3S8PICiggmPdH9DNOipuzbo5A8apO/jllUTvLI02rqAM6vdt2OffayxAzZQoQncsvHKQhg44AAX/BgGfhGEwSn5FQolHt6UYFTYUogxdWa+/PW5KzaUPPp3jBIGBEk8l56Jf0ZiJns1ZNC46TkZ5QOpF8kjJw1zoPHqTFHuXTv/bOxf1vc1BzgVsUR6Uo3F1rJdCKY6ogPHdrtzGgY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4032.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39830400003)(52536014)(5660300002)(66946007)(64756008)(66446008)(66556008)(76116006)(86362001)(66476007)(83380400001)(33656002)(8676002)(6916009)(2906002)(508600001)(9686003)(8936002)(55016002)(186003)(7696005)(26005)(71200400001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 2OTLWbpFHosUph/P87OKt86LhHCniuAsl9tDsftXp0uCD3X4bLO+Ec9tvFYR+4FF8hKPavjWMkAKKzRQmzhwzoXXo/ztoR3S5BOWC0n+Z0EKrY4kmsR4L1S1hTYXiens2d/gfhNlF1trIKbpYwFnhpMUn2jFlXNurl8QwgJlC6mDHS0L6z32Onfp+R4Jlbd5x7Qh1O6/aZGKrZR9MzT219E//+/+4TBWFcrsB174FU00x/B6tg+D7s5pC6/xxsJz1C5rEE3CXrYNvWkbP3VXPb20y9IBNDyiMX+gQgxAMLrXK8jML3MmKHaVJrgppEpTBVeFP+6Qht5qdUoMqIQFEPed9EE3Pp3+I5waIqVoNiMYABADrGJo3vOzjlIyiM2O61pZ1edUArz5E3BUJBQJR49Hkjsysqqf55vXiSz9jDlkEELKWdFtwVLFqN3BSn1ONSjm5TljGY4/R4HLNapZ/Itlo1KWLYKLNNN7aL0VBtaYg2680RzwlETtjhZDeNLQaCQ4xYMQEr1QLMvZdGgAmfJXIOaQw5FnVd0wOMjBqv2kf2SDj2r+mkwwPqQY2FiMtW21t5nbq0bwZWCoqiYuBHJ/hoka6jA++Q0Ff1Ha2gUsqJgTgy8Io5CWW+qro+4lfJSpiGjW5Bj1Iaq/qYnbTQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4032.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64afe98b-b20b-4c86-5fc0-08d84f7762f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 19:35:45.1486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZsQ7g754vKm3kiOqcjGX9XtwnQ4wGP0T5g3oTkI8u9/G+c7aCDh9c11kqoQNZpY6FFFqMNh+3nTw+QoAUlWnUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3902
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_153609_218527_CB9DC559 
X-CRM114-Status: GOOD (  11.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi There,

I have a test setup running on Linux 4.19. The platform BIOS firmware is in a 64MB Micron Tech MT25QL512A NOR flash device. 
It is listed as /dev/mtd0.

When copy content from /dev/mtd0 to /temp folder,  it takes a long time to finish.
root@lab:~/tmp# dd if=/dev/mtd0 of=test1 bs=4096 count=8192
8192+0 records in
8192+0 records out
33554432 bytes (34 MB, 32 MiB) copied, 62.6115 s, 536 kB/s

root@lab:~/tmp# dd if=/dev/mtd0 of=test1 bs=16777216 count=2   
2+0 records in
2+0 records out
33554432 bytes (34 MB, 32 MiB) copied, 62.4701 s, 537 kB/s

I also tried QUAD mode and different SPI clock frequency 48MHZ, 24MHz. But I still got the similar read speed ~0.5MB/s.

Further debugging with an oscilloscope, it shows that for every read period of ~8us, there is an idle/delay interval about 120us.
This could explain why the averaged read speed was low.

We don't know where this long idle/delay period coming from and how to reduce it. 
The read period is very short ~8us and the delay interval 120us is too long. 

Is this kernel issue or SPI NOR driver issue? Or, something else?

Thanks

Liugi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
