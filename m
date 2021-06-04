Return-Path: <SRS0=b8TW=K6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93D8C07E94
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:45:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A1A861405
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A1A861405
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+TmRfDv33u3d+a27y3oslp4w7AHu1xAnbIrwNvoreGo=; b=hDcxxpGXLiHo2G
	eQbGEBvdPys19QPxjstWnkf5j1iqGPKcAnp6j4Ssv36fpNSGvvRjJM8M+x0Nkg9iRvk7WTPM9H6Q1
	bTksTtBXM5Ve4R+OCzoxJK/BRGpALeOGVBxQBk0D8RLIaobQNv5GVZPjovZdoauJawFuMXxVkFNIP
	oOUNLW8BQmffjGVTcw0+M3TYDiH5+PfSKIRlyCHq84kWpccFEJk6hiGXlyK/c5URMxtK0AxxnRG9o
	RsOnp/RxpoOVeoD/WT0Lu88iZBA6GaaKb8t+46IhXXbUjbIcx1l2dzfEXhtP2OMm4AGWZ55le9XL8
	2x9TQ2aMIwfxv3aqhFOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpC0F-00EDyQ-NG; Fri, 04 Jun 2021 15:44:55 +0000
Received: from mail-bn8nam11olkn2074.outbound.protection.outlook.com
 ([40.92.20.74] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpC0B-00EDuK-5r; Fri, 04 Jun 2021 15:44:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BoEXrpuCuCNqN2KCUTBAnfEexiitYs8x2hs+1QA7HrVysfNbrYaa5DZCutETmq1Ye+nm4JG2hMm94u/WHMatnpiDK9ThpoCrHeYWCnCSMXwghYcOW8VZaxE2Y/URgWhIfZjDVUneePhBJjW+bKtGgYWfoNHrTrlIoBcbt+GbqO5igG/QGdvVkm8sK4MVSdl++TbKjoKtK/8uAcBPHwYauMhtTz8b2tevBk324zoM2yiArbTyNgmGzs1ueKT4wLv8ISvzfyxshjTvgCbtl3NIcdaORkryuJOcTD1DtXGjG6V2lNmNwOyo3HAALNWsqbamIb92lGXDCVhiEYXoBnOqqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLkWwDdlZpIq+Axqr6sYTdAennxBi5+549LAGaQRrnM=;
 b=SKxASJomWn7wOdyHNFKfIgZjM6lc/QD1Kd9B17P2oDWn9vEApdvVSpXNle7VldElY55TirJjijsMFe0cF+OKQgelZ3OkCsFLWHmxN30+e4vGyOnr9LAmmhsTVw3qsX6qqd5vlJ2mIxP0O0ZUQdNrcoTu1PuXhKTxPK+rFAUj8ouoYYMiiW/PW9Hkl8fiZTZv9GhGMueoUTsl5MoLrWH/Izn8wSBZE0O0/0N/Dl9cyKu2gVmZhnARCWaru/e33oNsafb2pEdgysncGsT17iZIpwhkTDzZfQC14jB336adTUsUK63jp1AmKewRtvHPqlM7ChfHnf8ueaCG8mL+C4Y+kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLkWwDdlZpIq+Axqr6sYTdAennxBi5+549LAGaQRrnM=;
 b=eSPIHhcD/dzaS3RE+a6BLr/0LRUG0JJ8gDAsm9w+d+SM1QSlHrVdvVDcoA65WqqkKr+tYofsAfUOtkWkIu6yH5fQjjMr4RmLn1p9faOJMuVgNLn1xDVC7+sMNmpMuCHIknannUcacs0tY+YSTlSe1O1ApEnYXtrJxdA9tffXaMWqHSMhk5594d3Zff4/hWiT5pRgWX8xRsiDgAcy6rzKIPtl1nyP26lR0I2h2IzY9t/Iw9pflMnkUvPY3lP6KXUCau4OlFZw4grQs2zoulCAxtM+s781jrelgabjDrA07igZAGS5EUWZrpglaMqPCLVssiTKbSAcNXf+SSM3hq6HJw==
Received: from CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::42) by
 CO1NAM11HT073.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::95)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Fri, 4 Jun
 2021 15:44:47 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:3861::42) by CO1NAM11FT017.mail.protection.outlook.com
 (2a01:111:e400:3861::364) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Fri, 4 Jun 2021 15:44:47 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:A00800879C8CB3A3E2E69774DA87578762F6265927AC26F74E132FA3394E2824;
 UpperCasedChecksum:53AFDD8CEB085C3A5B99ABEF62532A19D7018793D8799A6A31E76C1FC66BFEDA;
 SizeAsReceived:7865; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::91a7:5b3:8e7c:621d]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::91a7:5b3:8e7c:621d%5]) with mapi id 15.20.4195.021; Fri, 4 Jun 2021
 15:44:47 +0000
Date: Fri, 4 Jun 2021 10:44:42 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-spi@vger.kernel.org,
 jon.lin@rock-chips.com, broonie@kernel.org, heiko@sntech.de,
 jbx6244@gmail.com, hjc@rock-chips.com, yifeng.zhao@rock-chips.com,
 sugar.zhang@rock-chips.com, linux-rockchip@lists.infradead.org,
 linux-mtd@lists.infradead.org, p.yadav@ti.com
Subject: Re: [RFC v4 1/8] dt-bindings: rockchip-sfc: Bindings for Rockchip
 serial flash controller
Message-ID: <SN6PR06MB5342573F4B6BE00695A569B2A53B9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210604151055.28636-1-macroalpha82@gmail.com>
 <20210604151055.28636-2-macroalpha82@gmail.com>
 <CAL_JsqJyk95R=t8xWC3r2=PpARsHAYMUeNENqquW9j0LBT8gxw@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJyk95R=t8xWC3r2=PpARsHAYMUeNENqquW9j0LBT8gxw@mail.gmail.com>
X-TMN: [PWZbZnJKKXVOTYrnq0QCHLZmgk4iI8kV]
X-ClientProxiedBy: SN1PR12CA0112.namprd12.prod.outlook.com
 (2603:10b6:802:21::47) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210604154442.GA28698@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN1PR12CA0112.namprd12.prod.outlook.com (2603:10b6:802:21::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Fri, 4 Jun 2021 15:44:45 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 10c0e4bb-deee-4ddb-aae8-08d9276fadca
X-MS-TrafficTypeDiagnostic: CO1NAM11HT073:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y+r5Q1o1WT5EuEPYES0qhFC73w2gyEtj0k2e2q9HBhc3j8dzDkZELz62524CeXY2OKGkSWjXUOqH+Ifmz+/Py/dBUrVckdFBgOSG7Z8jnMY4HmCn9kua4piSdVzm5g4j8WsXmCoSCJ7meTwUkyenPmRjhoNfJ8L9rH+bub5d4EmgkOG2gHro6CA2goymBnX7a8/VEGTMqoxJKbZxxomlMTnGjHbImx6wlhB7KkbfsAgug9dvT3HpYSI1F+6BVX4/Ts4lOEcmi9HwvJdSvZ6ycGzzlvBH+kvqzOdpVpgKwUqOvDMcyPs3/L0gT0/HV2mE1YanCVerVSc8MAxx40BGsYleuyFfq+br3DicX5x7tdOqetAGiONd4bgzvgX+olnkalQfxOWnmTUC5JbQm9UHWA==
X-MS-Exchange-AntiSpam-MessageData: D5sRPWscjCdeylRNFxZ23x0Zx6woM/2kbWJDVW1uTYgAMl+kw52cBxAqxYD6GGcdlTOfGdCsBiyVGC6+vtl0iq65i/q7o904PU6N0C2ezXgylCnwtpP1EIJqB5x1ggBM8mqtcg5j5/LcFNrvnAXLkA==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c0e4bb-deee-4ddb-aae8-08d9276fadca
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 15:44:47.3731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_084451_423594_951A17AE 
X-CRM114-Status: GOOD (  14.60  )
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

On Fri, Jun 04, 2021 at 10:31:21AM -0500, Rob Herring wrote:
> On Fri, Jun 4, 2021 at 10:11 AM Chris Morgan <macroalpha82@gmail.com> wrote:
> >
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > Add bindings for the Rockchip serial flash controller. New device
> > specific parameter of rockchip,sfc-no-dma included in documentation.
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  .../devicetree/bindings/spi/rockchip-sfc.yaml | 85 +++++++++++++++++++
> >  1 file changed, 85 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
> 
> Please resend to the DT list if you want DT patches reviewed.
> 
> Rob

My apologies, I will do so the next time. However, I am ceding this
patch series to Jon Lin at rockchip, so it is not necessary for this
specific patch series to be reviewed. I just wanted to post it publicly
so everyone could see my work.

Thank you.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
