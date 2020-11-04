Return-Path: <SRS0=yokd=EK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AFCC388F7
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 09:55:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6724F20781
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 09:55:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JQIueU+2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=infinera.com header.i=@infinera.com header.b="NHNryZED"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6724F20781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infinera.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tbtOxxVG4LzGxjF/wM0m2u5XEWG6dtI0LTQoxwGe5nQ=; b=JQIueU+2zMByEGPmP/JwvMhSp
	tWS1TzEDVSc4YH98KvZ1mN3m7vuz7HhT4waOVVpxKs5oVwdInayu+QWklUj4femVHXgV+T+iFzkx7
	PsjezHJYznPzoot6AUuWYCGMP3nHau8Dg368Du/LBqWZL7makBLsd7K9xcpk+1pkLfksKZeUvvtGJ
	qU8vVyTDYneaDgx0uGvqHpTuokO0mcSRq6hoAlat/kGHMJz/mUOk7l0hal13EjkRToiFhpuMpPYoJ
	1WSo6T2Hwr11BGOn8lZK4a55ow6gnZ0ZGM4f/ce97VKZzkKneAIsegiiNDuVPVuoGW6zuiOGbancv
	kVWg+qRnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaFUX-0005G8-1F; Wed, 04 Nov 2020 09:54:09 +0000
Received: from mail-dm6nam11on2085.outbound.protection.outlook.com
 ([40.107.223.85] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaFUT-0005Fe-HA
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2020 09:54:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGNk4M6us8tqGJfRKLmGLG0kWtMD0mVg4aGngVYeEDFBw3AIngleYfKT9CrZr+IYx3oE1fLdPZmNwPHWLBP0Rfnjm9YyQnjV4O+MRyIYfUWoYx5d6jGAi3apvJEVo43E6f2WbSyeR1POrxC2QUS0PG1X5ChkDZDEWDaxbGW05Eok5fuTGNdhwU7oyAzGaJEQ5PsmaTmeBw39Mc8ciEdb10yFpgsHyQSCx5mYXDo0cODNwk9rHPKbx//JBFUx8BgDg6Zpr8uQeL0httSvGQAyGwFiD+L4IB7qNyHVz+SPcjrOKjdLOMpKRPL4fxEpGJdECNQ3yZrP3pNl0IVrL70mMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ab8Q3oxc2kkLHHkFLXIod109QzFKMWuMdyhrPzlK7bA=;
 b=bA10N5moFXKCkbLlbtP3Rgkr+v1aVMyqc9SI7h1OF6t4CXoHKV2moujrzzZNiE4CgGBuFNAikEjwBy51r+CCODk/dN2kcOOgHvfBSMzEHZAetGkb1H7vgQDROeXAhz4TJTSkHhdGsXyDhYyrQk6OYLasbRtnbzcwTo2EMqRDI9o2TguD2c4smvnQyWs+kjQY5hnCNNskK7ue7pXkBeLTu1kVUP43oIw56fxaHGvHgqomY0B6kG1N8MLOZcUvWoKzVDKYTpRGGtbV8zfmVFyI90wXach0QlXB5CRd+x7mIIe1lMSNgN4rljGNvfIUqeJ7trMTlsHk9ho9vzlygMRKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ab8Q3oxc2kkLHHkFLXIod109QzFKMWuMdyhrPzlK7bA=;
 b=NHNryZEDfn3Fi2FDfYGkrt7KdLCGBDogVRCXu90TKgckfwKZfpXOOfE16uKM3ZQqO241a+UfG0QJugULVrKtVj7ntzSN1f8UWzh4/y+jDclXHchxZqpxrBmmldyw+bFrKhO11iVyziGrQtmYk1EG/3+KvK1seqIK6Rqs8FwtQfs=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR10MB1558.namprd10.prod.outlook.com
 (2603:10b6:903:26::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Wed, 4 Nov
 2020 09:53:59 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::a4b0:cd03:3459:6853]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::a4b0:cd03:3459:6853%2]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 09:53:58 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "vigneshr@ti.com" <vigneshr@ti.com>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Use status register where possible
Thread-Topic: [PATCH] mtd: cfi_cmdset_0002: Use status register where possible
Thread-Index: AQHWqIpTWSfEXw2OaEiocc+ivq8o4KmweGwAgAAOhQCAAAO2gIABFY8AgAXpLoCAAEZbAA==
Date: Wed, 4 Nov 2020 09:53:58 +0000
Message-ID: <2198bd20e69be374f7533f45118c98750eb5362a.camel@infinera.com>
References: <20201022154506.17639-1-joakim.tjernlund@infinera.com>
 <20201030184736.4ec434f5@xps13>
 <aefef0187e5ebbe315e57e834ff1ba756ba88817.camel@infinera.com>
 <20201030195251.687809f7@xps13>
 <931f422255204f0420e6f1b79657f9770ce0cf6e.camel@infinera.com>
 <31ce9a84-d949-c1d1-a8c6-44ead119ca1b@ti.com>
In-Reply-To: <31ce9a84-d949-c1d1-a8c6-44ead119ca1b@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ed3ab02-2b50-4543-0f2c-08d880a78d2b
x-ms-traffictypediagnostic: CY4PR10MB1558:
x-microsoft-antispam-prvs: <CY4PR10MB1558A3D6CA7198096E53A4DEF4EF0@CY4PR10MB1558.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TI++/7YAgM5gxCPR9e4engJwyQqnSb5VKhcySJOdg9WRVlzj3XMlI95aLmc5hAtQ1CXTNG+8uhTGsMpAw4fc9hfZB9i9Xod3aYEhulVvem8GHa8cl2Xp0KbyI3i2MUZ+leG6LS+H/jTSo/mX9z4yBR0XMXgNsz5SN83TcdIJR6z39BZYJHS3iz5KggmE8ujoF+4fGgp0Px3Dyf63AG4CaXTei0caJvyAy2i2hTh/mQAsSt1irCaA/p0H14+lisswc/mCqU/dCgP9j43trIZZye0khHbobi5r87+J92abjkNIdI50tTWA30cfoun+Ajs31xUV5CIYrzOCm8EZMRBzlA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2389.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39850400004)(366004)(136003)(66556008)(66476007)(66446008)(2616005)(64756008)(66946007)(5660300002)(76116006)(86362001)(6512007)(91956017)(36756003)(4326008)(71200400001)(186003)(110136005)(26005)(2906002)(316002)(4001150100001)(6486002)(8936002)(83380400001)(6506007)(53546011)(8676002)(478600001)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Eq5MJcBUZinOr+n9/8aat2PhI5GtelY7Zb86lPnjXFq0p25ZQIRRvysJFqPPeifd8bey6z4DBYaspAO+c9Q/0LYSJbg5TrRziiOvpypl9BC97bfLyjzs9MRx+1gBqmbjiocCIYNGu9SPc2bSZMb3oFO/GeWFxkr00JwaoIZIxEl25ycXeRkwG/gqpPNs79Hui2tRZF0/RKbRvN1akItldU3mxVphcfVJ2yT7NSXH9jzBpEKAUwA1e1uC6IVbgWBDNnDUlbo+CyTgT8Hk1+KJ6KuMfkiedEMMfofYh4U9y0nFKAQu3b3CZhRp/XoLKMBgUcRgBCcZ6rcq6tBp3njon4KeNu8aYk7SVRGA5RDKXQWhQiHqBJ79JBYjQBTPsUN8creK9VsVV67DPr9C+UbXPlzPW3L+mznxh+vPv/41iWmTwlw9ug32jk34WQG9H9QcXpoFz1bKWxZYQAzIuy96cjkmTwnRCbm34RaMSH+hIBFvo71ZTxvJ7ZE1LJRBgzs0dfrTfP+1oH3ceFD0OEHHX8tk9hVVMfu72TqC9a9/BQdwX7M2RJrDscgSKNLoUG6lI9scwtK11WyIcNCMs5n1WQBPogJ7/JuHOm7ntyqrzM7qeWsHOFykSleBG1+PWs6fb1eNgL01848RPKJaRt2g6w==
x-ms-exchange-transport-forked: True
Content-ID: <CC72FD33911D53438B493F0DB2B6E7AC@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed3ab02-2b50-4543-0f2c-08d880a78d2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2020 09:53:58.8408 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zTVtN+I4BuG2g8mjW8pAVDTCfX/mfUm/OM2ztIBc8dRZENiM/G2PNEZDvaTAKdIl/uAjhjiX6fMrNiM2EjgmnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_045406_119384_399BBD34 
X-CRM114-Status: GOOD (  29.61  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-11-04 at 11:12 +0530, Vignesh Raghavendra wrote:
> Hi Joakim
> 
> On 10/31/20 4:56 PM, Joakim Tjernlund wrote:
> > On Fri, 2020-10-30 at 19:52 +0100, Miquel Raynal wrote:
> > > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> > > 
> > > 
> > > Hi Joakim,
> > > 
> > > Joakim Tjernlund <Joakim.Tjernlund@infinera.com> wrote on Fri, 30 Oct
> > > 2020 18:39:35 +0000:
> > > 
> > > > On Fri, 2020-10-30 at 18:47 +0100, Miquel Raynal wrote:
> > > > > 
> > > > > Hi Joakim,
> > > > 
> > > > Hi Miquel
> > > > 
> > > > > 
> > > > > Please Cc the MTD maintainers, not only the list (get_maintainers.pl).
> > > > 
> > > > I figure all maintainers are on the list ?
> > > 
> > > I personally don't look at the list very often. I expect patches to be
> > > directed to me (in the current case, Vignesh) when I am concerned.
> > 
> > Added Vignesh
> > 
> 
> As Miquel suggested, I look at patches on mailing list at a lower
> priority than patches that are CC'd to me.
> 
> 
> > > 
> > > > 
> > > > > 
> > > > > Joakim Tjernlund <joakim.tjernlund@infinera.com> wrote on Thu, 22 Oct
> > > > > 2020 17:45:06 +0200:
> > > > > 
> > > > > > Commit "mtd: cfi_cmdset_0002: Add support for polling status register"
> > > > > > added support for polling the status rather than using DQ polling.
> > > > > > However, status register is used only when DQ polling is missing.
> > > > > > Lets use status register when available as it is superior to DQ polling.
> > > > > > 
> > > > > 
> > > > > I will let vignesh comment about the content (looks fine by me) but you will
> > > > > need a Fixes tag here.
> > > > 
> > > > This is not a Fixes situation, no bug just a hw enabling thing.
> > > > Also, I would like to see the Status patches be backported to 4.19 as well.
> > > 
> > > Backporting features is IMHO not relevant. I guess stable kernel only
> > > take fixes...
> > 
> > This is not a feature really and the 5.4 stable did get them, I ask 4.19 get them too.
> > 
> 
> commit 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling
> status register") was added in 5.3 and therefore is part of 5.4. But
> note that this is a "new feature" and therefore won't be backported to
> kernels older than 5.3.

Oh, my memory is off then, sorry.

> Similarly, this patch (when accepted) is not a candidate for stable
> kernel backports because the intention of enabling polling status
> register for Write Completion is to enable flashes that "don't" support
> DQ polling at all (mainly HyperFlash).
> Enabling this for all flashes that support the feature is not a bug fix
> IMO. Also, there isn't enough testing to prove that feature works for
> all CFI NOR flashes on all platforms and therefore would be risky to be
> backported to stable kernels.

This is 2 things,
 1. making it possible to use Hyper flash (HW enablement)
 2. improving the flash driver to function more precise(getting an accurate error rather than a TMO) for most AMD flashes.

1. happens on a regular basis in stable.
2. can be discussed for stable but should at least go into master now that status has been in there for a while



 Jocke
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
