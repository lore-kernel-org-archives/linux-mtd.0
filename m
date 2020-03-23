Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4744C54FCE
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 18:05:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F9A12072D
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 18:05:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kRgBjLAZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="lVWsXyZv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F9A12072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mhuutE9/lW+caTzO/btk5HGxaheifjPrTFp2Kx5nVHw=; b=kRgBjLAZCb0wuB
	VrILp9sQigORQ9Y6A631YsQ/OGf/3l8O4+owLJppMFgecMbXdNe2+/mS2tCWyc6NP/8AKeiNyPTFr
	DGhtWZBavzec9Vz0av/E2JGgslLxb9KEMgsj0q2q5NYDrDi3eSKxcTLUjOIzHlvbkqV/y+afxsmpL
	ZN7zObSQ21nxblCIOM/n25vOPlTjqpwkCureL97T/5r+Q29T7CmT31kLBT7M/hKLDUSAOf6YAdZVI
	hTR4lFnOebeH6jrK3+0ugWbjHbNzcoREVfBOs0BLjQtHyBmbKNQFRDJYxQNY3Qst/PHWH4adSboAx
	6SIPss6HMdoKDkg+BoDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGRS4-0007yF-AI; Mon, 23 Mar 2020 18:05:28 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGRS1-0007xR-64; Mon, 23 Mar 2020 18:05:26 +0000
IronPort-SDR: O0OEtdEBGCMtf+c040YkojGKHHHrKdU02Xc+hAfiSU7KejDyDCptFWvH11POiojjji6BoIA8s5
 +ia8tz7zrdTTD9RjejZSKd0K5mFlkh20Cv929hurPpp4tWJDe6XPU3zuAOjlPMOt1NZkMe1oFS
 8j8yz6F3+tJqTfSIyeMOQb90U72TLzE+wZM9R+GLQElDUHul3V7/gLWMqLmQbsST/qKOp6jCtj
 gM9EAF1Sfo5SZQsRzWx3aaBbmDJHBzkOmWejByBqFkEJCtq7A1Hw/Sp6iVzzEe3+Rr8L7HRRAd
 1yg=
X-IronPort-AV: E=Sophos;i="5.72,297,1580799600"; d="scan'208";a="68124581"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 11:05:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 11:05:21 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Mar 2020 11:05:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFFlFhicZeJNURe1vwZNnzHR04WX6k68eLvyNGi2tbnbIoVBZz5i5CTYiNFWjxlq3PTAviacLCJ9RrB7m6wP4ZNk24V8RFi6jrVgm/kt5PduX0IFmY64fN9OSA7Fepl+okIbTTQf4IbVSsdcnSVqs3DZP7fc57laId192RlRY/ZJubX4gGPre7Ond4OOSWbA5YvQZKbgTw+BDyysQ6xSXo7GfxRdzsLfehg6a8lCWvdYjMJvm5WTQVCk3nW7ZLmMdg6VDhZXsHBdP4aF3HcnvBjHK22aGYcUupDG8A+85Is50WOqSm1OAXUfRqrlkHozcRqSFXzoU/EnCzelt5nysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORZIZQ9QH2gXy60hU4XzBcOkvGzCI7YKEmP4PrF9SXo=;
 b=mYXpqYUrxq+iPLBH7fMJTGXGsVO85pjICjRkfZiJT5L7qNGQCgQCIvhmj92fGTmStga531RtYsYdak5Bz4QXUE6HKrjO1b3lR261DHEXaS2un0dgNIG1rmzqJnLmBly/3M89LMIZnE8+CYyQ/HK0gDBQrEdja7uCRYxRGIHs4+2gDHYskKewlDsjBOlGaFYoD/kAKVs50cQsNUZqFiQ/A+7O8ujBdmwzs9YXtMI3Dk09SRDDilTCQsGVNANvqrwWvxG+t1M9SSExvEhZ7UEVnHkeoyU9P/NoGfGI05FbXZw1XABebSaJPk1XxTFPCmz28SAl8ETkN87AJP4cCIKKiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORZIZQ9QH2gXy60hU4XzBcOkvGzCI7YKEmP4PrF9SXo=;
 b=lVWsXyZvGh7ddozYwPA9lcAUnnWc+gNabsEzKKSsv0AdtGGuEaYw02B03E5FkktNDN5oOi9L1n4W7VmaRfUvUmra5NfA9tSZv9+Lie8lnqjPD6oLuqRE+2pElymfax/PJMHuDPHWLXiC2GNRSQ8Iw3P55+QcT8Fc8toNiVGWV/k=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4273.namprd11.prod.outlook.com (2603:10b6:a03:1c9::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Mon, 23 Mar
 2020 18:05:19 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 18:05:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] mtd: spi-nor: controllers: aspeed-smc: Replace
 zero-length array with flexible-array member
Thread-Topic: [PATCH][next] mtd: spi-nor: controllers: aspeed-smc: Replace
 zero-length array with flexible-array member
Thread-Index: AQHWAT2dYkkVcusgCEGyODgFGQFHog==
Date: Mon, 23 Mar 2020 18:05:19 +0000
Message-ID: <3763037.C4K6B0S6ij@192.168.0.120>
References: <20200319224326.GA25390@embeddedor.com>
In-Reply-To: <20200319224326.GA25390@embeddedor.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ac718a8-515d-4026-0e01-08d7cf54bfcb
x-ms-traffictypediagnostic: BY5PR11MB4273:
x-microsoft-antispam-prvs: <BY5PR11MB42738928C170AE7EC674D1BDF0F00@BY5PR11MB4273.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(136003)(376002)(346002)(366004)(199004)(6486002)(6512007)(316002)(6506007)(53546011)(54906003)(9686003)(6916009)(66946007)(66446008)(66556008)(76116006)(64756008)(66476007)(86362001)(91956017)(71200400001)(8676002)(966005)(8936002)(14286002)(2906002)(81156014)(4326008)(81166006)(5660300002)(7416002)(186003)(26005)(478600001)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4273;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fcmT4zwUFB2QUNS6fAjvHvxguEOZ0FimJVFxt29o+UTooZQhxBoqQRZVqmEJKTdPjtmR03BMGyDjyIadAyPuXXtNhUokREqip+ZGjABhG3baCBoIzKjXaG2vZ8RlEl95nJ+JYdPVnHLe9BkyAlAEZ7+6sGacjfCyIpQErYH0sPgDhhjcF2SmYgR3CGMI8mJW82KSMGqEhhTlzYUw5EkRNdM7Yd9ESm/8nbIAuzcxMJHwOXoDk2yI7QyQxVG6ljFJKLY4DAc+JtS0pcJWuT/ljd0ItWVtQVGR99AY6hC/PrLIPwaZR18osBFe1COHcZYwRqBCZEWAqkHM/bBgCJXsmZVz2tH7ARwi5jByTgILfym9CZs2T1Yao1lV1bXX2Zr2X9nU4/8Grn7xQID66Nnw0fKV2jxE1LuoyVDyiafzy+CHbHLOCprz2KkN07iEEmslwXj1FhXhaJJ25+91q5HD6w948W/Onex0h2LA+FupsumNy7BeEwXXFePgqy3ELgNUWKtfg2JX0yEojcoKhS5FxD60ks/JJU4mGq3gTxz6sLSy0Nj+L+mLb/04Xjr4taGo
x-ms-exchange-antispam-messagedata: mBn/h78Y+zrS6FMvhuNXuwkfBlMEyqlEdROBhlU6qtguY2pkHP0ozQbAb3f7RPqJLGuk4C8fiKLnw4fgEOUgQlHLeviZN4pAV1t3iwfESAKLuBxhX33pGmngqTUG82ub43teWjDr1lRxn9CU2dF5wQ==
x-ms-exchange-transport-forked: True
Content-ID: <FED1B8B22CE39A488A3C2E3978C6CD3E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac718a8-515d-4026-0e01-08d7cf54bfcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 18:05:19.6373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: In0aEL5bF1Quf+gdTqNNYf1GjBC1gsRqCVTGcgG0lvchSkY+YmfI+8VwPP5ayyrsyuMC1kmbf2aN0D3+p1vqdL6uBQ6KkzlLNovAavHejWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4273
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_110525_262882_0A33661B 
X-CRM114-Status: GOOD (  11.14  )
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
Cc: vigneshr@ti.com, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
 richard@nod.at, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 joel@jms.id.au, miquel.raynal@bootlin.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Friday, March 20, 2020 12:43:26 AM EET Gustavo A. R. Silva wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/mtd/spi-nor/controllers/aspeed-smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
