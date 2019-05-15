Return-Path: <SRS0=9tRn=TP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3591BC04E53
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 23:27:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0534420818
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 23:27:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pj5fL43Q";
	dkim=fail reason="length tag value exceeds body size" (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="QwgAGliT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cisco.onmicrosoft.com header.i=@cisco.onmicrosoft.com header.b="k2C5wjpz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0534420818
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cisco.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5IUNG3AIOXBGcXtSW+YdJF0asEDFxKpX3Sfp6yRlFg=; b=Pj5fL43Q8q64r2
	JR45HbPRRrDjzJj3Ac+c4EiAsQVFRYLHBRTFUuju8/kgFsTdJnGwr8EQcPsEfPCwSF/7usCDZtyjX
	OE2e+mlpkwl8dENghtVItKd0JPZhWayGKoub6kcWWMoHhD9X4z3jFRxqXBf0I8GJ6mXZpLgBgdLbb
	lg5EyJZODsbaFFpCQgbuNo20Lq8ZNRhUFUcN9vtR2jeD5sxxaPjV7hgJLNqJWCBtmsVbs2aEnu+mZ
	dELdkAl5+09vRHABF1jSyinhNH/YvWR0pZPjLp99a3lX6R0ag6VRnbslfOaDEKUGYx3p/fYd9zICb
	MqAqm7pj/lhA8vdGCXWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR3JT-0002DJ-18; Wed, 15 May 2019 23:27:55 +0000
Received: from rcdn-iport-4.cisco.com ([173.37.86.75])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR3JO-0002Ct-Vd
 for linux-mtd@lists.infradead.org; Wed, 15 May 2019 23:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2176; q=dns/txt; s=iport;
 t=1557962870; x=1559172470;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5c5DQYhG/jJ1bAZEGeIak3Ak/+ZyMLBCUmfVcu3CWhY=;
 b=QwgAGliTP7TC4rL3CXOHEH8puGtJ5D+NYnhWL3AfSNabsoOy2q1DjQdx
 3cdsUhOEkdP7J3FKrFJQNG6+YaEhKGCQ+pZCMF9arON8DUSg+GLmiBFfR
 vBZWScXsbhhOQdNTKQpMRb1oQxJ3sMhwGHtIOs2+m5uujWepZwZSvh4zD A=;
IronPort-PHdr: =?us-ascii?q?9a23=3AXodavhO+hIBlQdSIalYl6mtXPHoupqn0MwgJ65?=
 =?us-ascii?q?Eul7NJdOG58o//OFDEu6w/l0fHCIPc7f8My/HbtaztQyQh2d6AqzhDFf4ETB?=
 =?us-ascii?q?oZkYMTlg0kDtSCDBjgLPHjaSMzGuxJVURu+DewNk0GUMs=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BIAACbn9xc/4kNJK1kHAEBAQQBAQc?=
 =?us-ascii?q?EAQGBUQcBAQsBgT1QA4E+IAQLKIQRg0cDhFKKIYIyJYk/jWaBLoEkA1QJAQE?=
 =?us-ascii?q?BDAEBLQIBAYRAAheCFCM0CQ4BAwEBBAEBAgEEbRwMhUoBAQEDARIREQwBATc?=
 =?us-ascii?q?BBAsCAQgYAgImAgICHxEVEAIEDgUigwCBawMODwECoGwCgTWIX3GBL4J5AQE?=
 =?us-ascii?q?FhQYNC4IPCYELKAGLTheBQD+BOAwTgkw+ghqFNDKCJosBIYI+mUQ5CQKCCY8?=
 =?us-ascii?q?Ig1YblW4tlC6MYwIEAgQFAg4BAQWBTziBV3AVZQGCQYIPg2+KU3KBKY9GAQE?=
X-IronPort-AV: E=Sophos;i="5.60,474,1549929600"; d="scan'208";a="559990086"
Received: from alln-core-4.cisco.com ([173.36.13.137])
 by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 15 May 2019 23:27:46 +0000
Received: from XCH-ALN-020.cisco.com (xch-aln-020.cisco.com [173.36.7.30])
 by alln-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id x4FNRkrL006165
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
 Wed, 15 May 2019 23:27:47 GMT
Received: from xhs-rcd-003.cisco.com (173.37.227.248) by XCH-ALN-020.cisco.com
 (173.36.7.30) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 15 May 2019 18:27:46 -0500
Received: from xhs-rcd-003.cisco.com (173.37.227.248) by xhs-rcd-003.cisco.com
 (173.37.227.248) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 15 May 2019 18:27:45 -0500
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (72.163.14.9) by
 xhs-rcd-003.cisco.com (173.37.227.248) with Microsoft SMTP Server
 (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 15 May 2019 18:27:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com; 
 s=selector1-cisco-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5c5DQYhG/jJ1bAZEGeIak3Ak/+ZyMLBCUmfVcu3CWhY=;
 b=k2C5wjpzNm6JebKffy1MDc4+71TcoKwu1yqkdHxm4ggDYUZ2DZEql6GI1sulYpa3SYJOy7w6rbHdKiknbGSgLupmGq9DXFUx69SpCAsHc9DWXHFZBk3InhbcjSaquCs41owgT0HvcjzBQ7JrflLAjk4Nu44zDfbbDppG/GhxPLc=
Received: from BYAPR11MB3461.namprd11.prod.outlook.com (20.177.187.14) by
 BYAPR11MB2903.namprd11.prod.outlook.com (20.177.225.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Wed, 15 May 2019 23:27:44 +0000
Received: from BYAPR11MB3461.namprd11.prod.outlook.com
 ([fe80::494e:92a0:85c6:a3dd]) by BYAPR11MB3461.namprd11.prod.outlook.com
 ([fe80::494e:92a0:85c6:a3dd%7]) with mapi id 15.20.1900.010; Wed, 15 May 2019
 23:27:44 +0000
From: "Shreya Gangan (shgangan)" <shgangan@cisco.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: Removal of dump_stack()s from /fs/ubifs/io.c
Thread-Topic: Removal of dump_stack()s from /fs/ubifs/io.c
Thread-Index: AQHVC2FVil2C0hxsCESyeW0kls9eBqZsX3uA
Date: Wed, 15 May 2019 23:27:44 +0000
Message-ID: <5B190BFA-DF2A-4469-85E2-14A7347B7A8E@cisco.com>
References: <E44E4181-1CFB-493C-8023-147472049D19@cisco.com>
 <CAFLxGvysPg3FO4kT0QrRsYTr219WVttQMeat_StqbifTPrGLmA@mail.gmail.com>
In-Reply-To: <CAFLxGvysPg3FO4kT0QrRsYTr219WVttQMeat_StqbifTPrGLmA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shgangan@cisco.com; 
x-originating-ip: [2001:420:30d:1254:f50a:d60e:60dd:2496]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc127610-8c60-4b15-1220-08d6d98cef09
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BYAPR11MB2903; 
x-ms-traffictypediagnostic: BYAPR11MB2903:
x-microsoft-antispam-prvs: <BYAPR11MB290368AF3D79CBEAE4E55335DB090@BYAPR11MB2903.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(366004)(396003)(346002)(189003)(199004)(6246003)(316002)(7736002)(4326008)(68736007)(6436002)(102836004)(229853002)(36756003)(14444005)(25786009)(256004)(53936002)(66946007)(66556008)(66446008)(64756008)(76116006)(73956011)(6486002)(66476007)(82746002)(2906002)(33656002)(305945005)(6512007)(8676002)(76176011)(5660300002)(486006)(6116002)(2616005)(11346002)(6506007)(478600001)(54906003)(81156014)(99286004)(53546011)(446003)(8936002)(6916009)(86362001)(186003)(71200400001)(71190400001)(83716004)(46003)(14454004)(476003)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR11MB2903;
 H:BYAPR11MB3461.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mXbNM1NZAQebI0Ib5s/qKGOAvPPjIfis/2IjDMklWQiCNndb06TqTHmzreI4Mbfac3lB+M4F7u+wcatOYLaC0TYTy+urtb+4aZt+SRqGSotIoMsyeNVg9TghoYFqpp0kFcnmOPg4s4clitFqMp/g98+CrXa6Rn5f0TEhNot+b7DifHhObOZqa5GLcASfJ5Pdx2o2IHTNLvgpiiqAuhb3HoWO0vdIfgJUOhg4vM8vaIbaELasue93Y7WpSLp4q0iCmVIQ+Ak/ezsJh1EUM2cZGQsz/nxqSbd43PSYXttKlK/Ub8KxufsFA4BVQ/QwnqJMD9qzf4Ns0rsx9namZoNWZZiwiHJv9QWAw+c5PGItQyHivPVdEsikh6SfJMg/vg3wRZXCm0guaMyEa7DQob8xcvbOBhLcRyamgEVYV8/LrfA=
Content-ID: <AF2D337ED8479B47B4626A6289C37337@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dc127610-8c60-4b15-1220-08d6d98cef09
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 23:27:44.7232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2903
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.30, xch-aln-020.cisco.com
X-Outbound-Node: alln-core-4.cisco.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_162751_157420_BAE45B7D 
X-CRM114-Status: GOOD (  14.72  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Richard,

On 5/15/19, 2:01 PM, "Richard Weinberger" <richard.weinberger@gmail.com> wrote:

> On Wed, May 15, 2019 at 10:45 PM Shreya Gangan (shgangan) <shgangan@cisco.com> wrote:
> >
> > Hi,
> >
> >  /fs/ubifs/io.c has dump_stack() in multiple functions upon errors and sometimes warnings.
> > Since the error and warning messages seem to be unique, the functional value of these dump_stacks is not apparent.
> > Why are these dump_stacks required and what issues might occur upon the removal of these?

> They are not required, but they are just useful. While you are right that the locations within UBIFS are unique,
> they are not for the whole kernel context.
> Filesystem functions can get called via many different paths from VFS...

Isn't that true for any kernel error though.
Want to understand why it would be essential for ubifs to have these over the other kernel modules? 
Can't the developer add the dump_stack later for debugging reasons?

> Why do you want to remove them, what is the benefit?

The way our system is using the ubifs, for a device which is 'no longer there' could be frequent 
'no such device' errors when
1. there might be multiple write accesses to the filesystem before the responsible process is terminated 
2. the filesystem is unmounted after this
The result would be flooding of the console or message logs with both the error messages and the dump_stack,
making it really ugly.
Is there a specific way a 'no such device' issue is handled to avoid the messages from flooding with the dump_stacks?

Regards,
Shreya

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
