Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DB3C56201
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 08:39:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14D5E246D1
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 08:39:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f4lFKWrz";
	dkim=permerror (0-bit key) header.d=wdc.com header.i=@wdc.com header.b="nhcZf2Ri";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="0H5T2i43"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14D5E246D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=SnfU235bhmxTrNGMEOUeAjki3M6AFMdW5K9ZmrO8dyU=; b=f4lFKWrzImj2gO4vosy0D/xvm
	vO6CVFX+bjWQ2hafwamKOsuoyY6lUKS3dmE86x+WBDy6NY+MgkITIiNBhnYZkhckpzB/AMrgnnwXW
	jSnj4f/MpEvTSTJeXQvp8bWZ5cSReNgSlCDifeAMCpt/QipMl4Yb9IeyoRvCfoTKr7We/DRq8gJqs
	sZg77zmTDNX9CADQ4j1K9Wi/EFPXuazAl+jk1oe6r1lXfpo9WxHS0KMQ5oGFj2YZAGh3Worwz2V2A
	ZuRIhVZzqKZn3JXvivPW5FcmQL2UXboRjkdLwdSljiVGt0WtayGiNErchkL39q69bQE7j62A0lwKy
	hQuxVcSBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kffSe-0008IB-HC; Thu, 19 Nov 2020 08:38:36 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kffSY-0008Fb-FS
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 08:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605775614; x=1637311614;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=nhcZf2RiTornabsQHXhlRpPYsKJEombpZkI1FzUvtWaqqyBxxEYuixcs
 dX8PKTHSOze7Upf3vDTHhHZkJRH3hzMVmN5Kmxio7jLulEn68NT0IirMV
 sVp4Z5oD2fa+d+4yHCUlE29byn1c3W5xDCld9pQ4x18qCpgvn515mHV3B
 qUrrOntxFco8rDa7hZsvqfSQ0h+gH6wKQHTF0jfLGHuQLklrnnSOj5TjB
 7aBujff5nDod8C0wb7oeYIRNdt0BN2NsdBeqAELQFXvN8NgkMvml5v0UW
 GvJKzrFoBJs0CZqzUA3spKZfoyfoxbgGC8dCESwHJiAUUViV3A6tpoAYp Q==;
IronPort-SDR: 7kpecrLv1R+8Tn0CZmRF0yo+J7M5rxF63VVhvXMSVXhy0xPzBwLW9bRZ41RPQuFsLSPhrVgW2p
 Ynmljzaf5ROHMcakCa4XZ803Oubb8Irxuh0L0eAU6Q3z9Iwc6As0Dl5TYLU6rbLuzPURdwfoA9
 NBgF12olrN1laUNt5lJ46l/dLw+0nysf5AujmAWQE82XSaJMG8kn4XSl2u4WsXgxhx/Nq370hC
 DitD+xK1g8tiQSf/o/AMAAeHvZSa61iucXxhtjNy7psFUfQ8rmros+lKLLePsDMOIFyMc5QpEv
 Lp0=
X-IronPort-AV: E=Sophos;i="5.77,490,1596470400"; d="scan'208";a="256563203"
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2020 16:46:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUgnkraW+QYBqlXscVDNm1LVigFNdyHDXXPvENUQgvpzI8jpbi49DkIamXUsdYjH18fPlELdfRHAWLyFKuv1yf0rE/YWP/dN9CYYn7Z5CMe1FDdehH/6S1vPoPjNpWZ8OKDeucOl3z8z0OTX8mcQYk/PLeFaI61upG7yYSE4Y/EEzb34bEThcqM17Q7EImAs9cKnx3D96Xwx93iTRuFGt6G3hzUolYbtCfZC0WEHwwsNUIr9JHDpe3uF8dcXFRU231iWLzQFcp7XgeAugOZWXiUU6UIo6MX+QDyDK0UuyvXgTkk9svG0CPTRDnyDvUjZC2xqkMzxgu+LcAn9RsUt+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=ItdyS/TYh8LPv67rajQBVzLUBGeouOrjcTOxHEi0TQ5rON6NwcJTPIr/bskDEqGdKokt78i29jmuj/KoKmrszHkGvWOra4lAOKkpOqm5CbN8fJEwKMIqevR/KobKt1YxNpjxNBquyc2jTlfxT55B3VKOXWhFGcaora93Qdx6XbIG13/H5r5temmK4Jasa7lKTmy/CiFn0P0AnmSfMn2yYpbG2YllHgl4D3OtHaZ94V1574QFzIjcAhvM/CwbPnH08dW7TrK+ydG+QnSDIJUHjPfBUR0+4uCGwJWubshwG2Tz4Dzb2GBywmsSY3Cu8EBPw32FVQd7g2la4iohjx1udw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=0H5T2i43HPmpwn6z/c6M16KEb8JBBxQZZCug2FlTzcCTFev3Xixb1d1NAnH9FSwDFd6Bl7ZPS+rSMe/nSLRTaEEda2hOeTbUYAxhpnuTT9RG/c8OrxG2Ta+Siw2nepSNMUEvPzirHrQB3YgVRjWylAOMw/u5s5G9OneGk2UeyXU=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN6PR04MB4862.namprd04.prod.outlook.com
 (2603:10b6:805:90::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 08:38:26 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98%7]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 08:38:26 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 07/20] init: refactor name_to_dev_t
Thread-Topic: [PATCH 07/20] init: refactor name_to_dev_t
Thread-Index: AQHWvYgrYc1Qp0WgLEOTR53TfvPOSQ==
Date: Thu, 19 Nov 2020 08:38:26 +0000
Message-ID: <SN4PR0401MB35988935BAEBEC04C143EE759BE00@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-8-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2001:a62:157d:bf01:851e:5636:4e29:3e2e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b730e505-bdff-4d92-45ab-08d88c667bb5
x-ms-traffictypediagnostic: SN6PR04MB4862:
x-microsoft-antispam-prvs: <SN6PR04MB4862C4EF0AEAA7A94CCC4D829BE00@SN6PR04MB4862.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AYG6BnQlsuGA/acLvLJgD7cGr5/O+puH6AbW6Ju3ilicmeE2aoZVRwEBcJL8W8aHpanaHc8PRJyDum4B+H0jOgvDGD/rMvmlvtImEIktxVkuLuNFT4HUZNSHcSRjPusPZ2bo2XYdTh67fWzZvTAifSG9aOSwEKW9qAqJ5Y9aZZakuYlci1SV9LfPN05lKXRvygjeF/dKLfMFLrF3VwM3p4NNFkQwm6nLHd7nkqQtdj6Bq6P0EiGGhjJNs6jSXIUm+1kPjv2Euhf1k1OC92gcVCDrIY/6DjeLROMeEDlDPTIhaI8sR+zJZNo4tIxjgPes0DLo2qwiUKhorvU5EmOKrg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(8936002)(71200400001)(19618925003)(4326008)(33656002)(7416002)(9686003)(55016002)(66946007)(76116006)(478600001)(66476007)(66446008)(64756008)(86362001)(54906003)(66556008)(91956017)(52536014)(558084003)(2906002)(186003)(8676002)(4270600006)(7696005)(316002)(6506007)(110136005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: hA8+VzTCyu88zqp8ByagDd0VV9gn8kSx4RCMDL80KLf+qsSjq+JJ+bxL7h9DgMh0ZwH1/Hhzz24dfWQK6FvSCu2N2pODdFcZpmexlWvb43BEP7St9yobdcngjk3Lx23YjM1HMbAHTeBb0P7l1ZVhUM0+3BzwYQ3epRmAQhV+fdYJtfD4FNERaTCynw7pFA5B0GmOG2LWvsgbGA+FQ28CWZwmZ8HSz2yVlxB7oMiEt4oyfqDxdbDak+pMRivWO9tR1DX1RHpX1/lRr/ItsnPk2dguWy4anHW7zaImw/O6IIZT4sv3HbDpyH8j3bFI+Pi48foAdx8OazbcByGmP7l8WbieradKMX+tM+ZGCCqcwEW50guJ1Vnjpz+t7iXwUcvB3nW6FTXSjv+ERovMxV50QWObbeA6ZNDNMaucAYyMMejfC1z6KRC2TbfwNvBkfeynbCLY7kQj9a7md0DpP6tNT7E25J72eXrv6hhVxYOqxhvsNZnxZg1FpUlbkL5GRDCxaFgFofYR3IdLVebcBnr50AAiTO/o9WggMNLecfIc+ppyFZbur8YLgkersC1lMcL9QSzbG213UNIp6RuVTy/+FJlzDX9Gi27/XvknejmLj8VqY07T9dFYVsQZPclrWxlG0L889mu5DAIedBfF3TaUy2uAMoLTbmL2OsDxEH7c0w+XTm9Hqpv7dBhgiDMriKT2BXIVJXnQfgXxZHOaHgeBAw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b730e505-bdff-4d92-45ab-08d88c667bb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 08:38:26.2255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CUJKjc+O7Uc5n1gkeDg58OBnuesd0SrFF3yd4avvUfbb7H6fsgi8DwfU5idErUdSk0MYdyD7R2wm2ECOP3+WegiNVulxDiOK0nUj9qsmyKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_033830_749548_44C4FDB5 
X-CRM114-Status: GOOD (  11.09  )
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
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
