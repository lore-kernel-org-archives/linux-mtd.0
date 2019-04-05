Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52741C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 08:39:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2241C206C0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 08:39:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oCrVo2mI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="upYdxnF7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2241C206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOOJ2flLJmBTeHzBXV+WXGYhSdxSBObgQu361r8K7Yw=; b=oCrVo2mIkEu/ab
	YUWrktwnZnDCETgT//yRf/MW7tXJWEShjo+hz8xZs1q4Rybtk3ux4qdmhWerFKQBKeEen2RGBm89T
	f76aduQmiRYwUiGVIoVnikbiiV5jdVTHty3Gdn375iZcilsTshMARjP7hwhBK0EbbbhBZuAD1BlBe
	M5rVe1TYGln+vxMr2ncHzQmp/JfVbp+W4s4VIurlPGy2ZslLccjVhDQqZjk3zJeqbgHfjKymgrvOF
	YENkeHO5GqQhSMNU8TBAwuM44Fta+uOfnajlRF+LBABau3VUCM0iGrQPKJGsQYx3BfQ81fhlHmvFf
	PdaUhQsoIH8OyiVc/3MA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCKNI-0003L1-0N; Fri, 05 Apr 2019 08:39:00 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCKND-0003KX-7R
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 08:38:58 +0000
X-IronPort-AV: E=Sophos;i="5.60,310,1549954800"; d="scan'208";a="27716772"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 05 Apr 2019 01:38:52 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Fri, 5 Apr 2019 01:38:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tX31omYRTbHVxNmb8h9MAH6k9T2Rhz6Hr4+sIlnL7yI=;
 b=upYdxnF7RIvdZhasecJFac1DWVo7TDdwM9jRhvngj13vdHwsapLDO0UXWEJBB5cxEeTBsJI+vINapgkBrr4ZgQ00m1yvS/0ttKaSWjLuQMUQnuqy5FtvVokfWT2pEbafGXX7iF0h8UiJTNmXoUYJJ+dHojGZ3PR5tjd8buo1CE4=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1507.namprd11.prod.outlook.com (10.172.20.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.22; Fri, 5 Apr 2019 08:38:48 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e4c0:24a5:9a32:46e3]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e4c0:24a5:9a32:46e3%9]) with mapi id 15.20.1750.017; Fri, 5 Apr 2019
 08:38:48 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] MAINTAINERS: MTD Git repository is hosted on kernel.org
Thread-Topic: [PATCH v2] MAINTAINERS: MTD Git repository is hosted on
 kernel.org
Thread-Index: AQHU64axRyQk1EAR+EaWdQSWZRUGqaYtPuIA
Date: Fri, 5 Apr 2019 08:38:48 +0000
Message-ID: <ac1617d9-cd33-f576-05d7-245079464271@microchip.com>
References: <20190405080342.26330-1-miquel.raynal@bootlin.com>
In-Reply-To: <20190405080342.26330-1-miquel.raynal@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P18901CA0001.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::11) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [85.186.121.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33c57ab6-2e87-49da-2b82-08d6b9a21f36
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BN6PR11MB1507; 
x-ms-traffictypediagnostic: BN6PR11MB1507:
x-microsoft-antispam-prvs: <BN6PR11MB150770430642C35DCD0A5574F0510@BN6PR11MB1507.namprd11.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(396003)(346002)(376002)(136003)(199004)(189003)(71190400001)(76176011)(8676002)(11346002)(36756003)(2906002)(256004)(14444005)(102836004)(6506007)(97736004)(14454004)(53546011)(68736007)(66066001)(72206003)(6116002)(6436002)(3846002)(229853002)(386003)(4744005)(478600001)(6486002)(86362001)(31686004)(31696002)(25786009)(110136005)(6512007)(476003)(2616005)(105586002)(486006)(186003)(71200400001)(106356001)(81166006)(26005)(2501003)(5660300002)(7736002)(81156014)(6246003)(316002)(99286004)(53936002)(305945005)(8936002)(52116002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1507;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q8CS6WeA/TQ5avJSwTdEri9GH3X3qeYTptJDun7MTLQDf7FNb3Yqh3CFFWQDuZWvPCroM8WZvB/FI/25KhLP989bgvL75hMwpvAcPpoCIO35j7gsI9S4xfrw065HI3LW35Br2wTQNHbY7P1iih1RjaDiUPL33id33edKG8bWaFbRNfngWCU2YQTWkUTvgsS8vHFrzad56Hc+7LX6VmLUbOgfhaEUa72A0rbZgrRx9q3TIirFe5mnUQ8dpul/2HmL7SB3hUvDLWlA+TDgSSxHcCQRwATEPTbAsPC+dgfC/8J+mfCxh4s/c/IWT2CBDAnVropEKmsSzz9kVCOSoGsGPD/evcnejTD/aoaUfXChgN+s/V8szAUKAZBIwR0qbvfk74tZnaqElHfmkJUsQLCKin6n50bhRdfCyurVXoo6PiA=
Content-ID: <36B4BD3A8346B3458F7E6B5501094F4C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c57ab6-2e87-49da-2b82-08d6b9a21f36
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 08:38:48.4052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1507
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_013855_418498_6778A3E9 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 04/05/2019 11:03 AM, Miquel Raynal wrote:
> External E-Mail
> 
> 
> Because of the slowness of the infradead.org server, Linus requested
> that we send him PRs from another domain. We moved our Git repository
> to kernel.org and maintain the following branches:
> * Fixes based on the last -rc: mtd/fixes
> * Next branch based usually on -rc1: mtd/next, nand/next, spi-nor/next.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Changes in v2:
> * Drop nand/fixes and spi-nor/fixes, we won't use them.
> 
> 
>  MAINTAINERS | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Acked-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
