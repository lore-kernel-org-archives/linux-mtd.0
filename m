Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833A1C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 06:31:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 529312074B
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 06:31:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k1ttWYQo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="wGIClMLW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Q+Eb0E/+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 529312074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTJ1/vDiSm4qHi3MnIqMri4k7+oMo3V6wutNJwEyKQ8=; b=k1ttWYQoADXi9k
	+4t/pjwDmw+jeiCHKXvC0/VytL7LlZxc8PQ+hUwRs0lo6Tg6JZvCtRTC/risqu/vAklt79z/arOw1
	Ri8bB5niBaMwuhjDC71YYN8MIT5zYszMyy14iTOY9m4m3ERpGW2L+wfkiaHo4rwrYreFMhyim50Sx
	Rju3RM5u8U7IulySMFhrdf788LVGZuIOVIiX9sjmATvJoM+IjoJx+pXHgQlOWMREfYTeUqDdO4GmQ
	25F8Tnmk5nNIKAwt9X0WOYhD8r363yIhYCr07sRFMPYuzciAPzI80OpvdDKj4+NgVNlhc1jTuGW8e
	oTreM8lHdpQJhXAXD9dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfdys-0007Vp-NE; Mon, 01 Jun 2020 06:31:30 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfdyo-0007Ul-2b
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 06:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1590993086; x=1622529086;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BBSWtcmn4SGel36kKgN6R6WjQ8EpO1oSp1aNkZZA9bA=;
 b=wGIClMLWpHfUgjSDxXsGSCYHsmX3EbEP52t3s0ycQ8ZTMbOqhKVKcuBT
 ziy1KFTFakGCmREA4KddCjLFiFSVNRc6+pTssXw300YZmgDkLF92ojwcY
 4k/Ubrrz7n4/I6oEiPIRaynpp6q5ciHEXpaLfDxl0i+AgtPwr7QNb5JvS
 nSCq3icC0sPMQHzL7wqSMNDhUP/Z4ea18Pl4kIotpOvJcyfAtzZHJELRZ
 1TZAGIzkwMo2ULea1Wr66Sdc4rDVTewf8HqPEQ1lzFe8eyfcp3jVp1IkM
 qHJC7zNig0rcoiSLg+Z7na2Cex1RvV4ye/R0p6hKK6w4rEqnDHpmie0tR g==;
IronPort-SDR: WwnjEd9mSQEXJIaTYqkjbxpg6siFlP0ZV4gF+1EIbiXbym/Q5QudbFM+JyECjq2FaUzaw6fqnW
 DbM1hboYMU/45URq6ApTRwE3tVoe3S+9cr9XoOPhiJRolGAjX2vrShTJb1fb0DXm3Ce8+oj584
 S5a3PtY2/9eDSv8DNfRYov73oGxwGOhCfJIM0emfRKdvTKnmZ/DF471CUFJAr0p516GbguawxJ
 ZXCT9gKlldU30aZtMfHjTNyqBnpZ6AdLKxcAerR2XB2QYI1hWWBZsCvtSjKGFHRSxPzVzwmf8W
 GLs=
X-IronPort-AV: E=Sophos;i="5.73,459,1583218800"; d="scan'208";a="75057090"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 May 2020 23:31:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 31 May 2020 23:31:17 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sun, 31 May 2020 23:31:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0H05WaewHGWRble1tjGR6rb1OvF99uj/uULW5cJn/KPeRYKVEDmQo+IXWn5wYlHE26SAHEYLOIxjUJEQViTBNKaZ1ot+DxRBTs8qcCPwwTCuEIOpfQIMJORSbs0hZZtbSBgeb2bgxXy+I+MBIATf0fdtE2/taYES1AujfxMb265lnGGHZFkk+G+84y6dttIGAu2snRJS9U0nUL/rLHgC403IzQIEO/2nKWDKPctaN1CUGna1rtpCRplWUReE4a1xXR36BtlVraZHjOunIW3BBJt3jMp/GDM0umPzRfmUrAbYL6w3oDUThhzt7NFv91AgVfoehzfJYnFr2BqcCc4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GEbi9d0ANblDX+i4kSM1QHInvXzM1X5qKyc8rKEUu4=;
 b=fbnyGefoGsuNlkiEHaNoGotP+/QqgxfjsU+dkr9JJ+Lwf7Ds7pm/mQ31aMdaPxjwR56lyOCohi0o5wnU8722/vbWxB8woFoIFY0tXuRrLCl0vOaaCMwcXgjzASQdeMwEdOpoZy5bzY0hafMjzNbx+WeiL5/VgSl77gBBwByEF9a/k2e2Z5MTxQO4OJkcTkqMcohymMvA8Q05oL08zK7YiSPQJRo2JqHTgicPFzDGjucOTIER2PpHfkf5/ozBmI+iQwm2T/YY8HNwz2I+poxH5EUKXWOMFvFyAjOetkSVch0N2TWSTra4obUnGKEIjHalBUhYp3zKxk9b3b+VSwNToQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GEbi9d0ANblDX+i4kSM1QHInvXzM1X5qKyc8rKEUu4=;
 b=Q+Eb0E/+BZGaYIp1kKQ4nrpDXjDjpLQstGsh7369+gK+1X4cJbxXsK+XSqpZ+u8WxO34Zs9PAmskf9oTKfoiy+PBesrbOpzXoy2dx8YH8un9x5o7eW4RZCwoB5tTE17uyrPfXqFEj/N8TJOgWM7U5Ll18X0cie8h2ofBoAmOCYI=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4482.namprd11.prod.outlook.com (2603:10b6:a03:1ca::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.22; Mon, 1 Jun
 2020 06:31:13 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.3045.022; Mon, 1 Jun 2020
 06:31:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>
Subject: Re: [PATCH v3 5/8] mtd: spi-nor: cadence-quadspi: Handle probe
 deferral while requesting DMA channel
Thread-Topic: [PATCH v3 5/8] mtd: spi-nor: cadence-quadspi: Handle probe
 deferral while requesting DMA channel
Thread-Index: AQHWN9hDLp2/kM6jfUiBO4uiVGA5TqjDTMsA
Date: Mon, 1 Jun 2020 06:31:13 +0000
Message-ID: <2115856.WxyBM9s6e4@192.168.0.120>
References: <20200601054725.2060-1-vigneshr@ti.com>
 <20200601054725.2060-6-vigneshr@ti.com>
In-Reply-To: <20200601054725.2060-6-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd89ba3c-1b60-44a3-c8c6-08d805f56193
x-ms-traffictypediagnostic: BY5PR11MB4482:
x-microsoft-antispam-prvs: <BY5PR11MB448291CEB9034B758124272AF08A0@BY5PR11MB4482.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0421BF7135
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XbdZwXDb3eHfpSO9B/vEpi0G8gVD/DOBYkqHMNZf4YRdXeGDx3A2o2UoKV9ttbUhhvvSsQPld27de1NP7xQpU8qtaQitgpwFGVGALFlJ94IIbtwevE8SrvNDm6X0H5IA796+P1FMUuajtmf6WhPkCTqm9MvORsAiPBxfaW5gymYSGdBFKgajvrrdDmoY0mAt/djBDkm+81w3gNcPZZV76960o2/jO2zL+iDlt4i9dch5NcXukxMVVpNK0oQHxePTrixd4OonPqq1hb3mFAeq1bdA9V93X4/9xGc0BsF/H30dvkyYoxKZe2uvD+2u7tAVLG2JqYAmU8aLFNeDECI9F203BwR6KofBfvxDKTrrp5ZXR1qO1YsH0Ao4j9IdR+mt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(366004)(396003)(346002)(136003)(39860400002)(66446008)(64756008)(66476007)(66556008)(66946007)(86362001)(6512007)(5660300002)(6486002)(9686003)(186003)(4326008)(14286002)(91956017)(316002)(478600001)(76116006)(54906003)(6916009)(4744005)(8676002)(83380400001)(8936002)(26005)(2906002)(6506007)(7416002)(71200400001)(53546011)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: IuzufmPLg+SpcFrz+fEnSeULdzrdatqDZifT2z7M2v/C1EvWbJjZGqeqk5pSA8DxCUU7m+6QE72IyoFj3K5pgC7JumajxcWz+AAPSEHAuvLnETr3woR4wskwo+CRm1bQ58L+PZmKpEG2p4aZUwlUU9y5natZ8g2P4KDnvkVQdf1PCp/lSvfqacqwbqXDeer7S4adNqYsi9iL3YLT9yFes0RI3NvbKe83PX7cKI3lcK1sOlyqVeR9nW4Z3MGGtgVaBchsVcCu5JrX6JL+ltbk1saXFrk+jpxa8FWrc0gjRwYGzmdZAGniEcsc80EHf+TMNjPa6FG6NB3lq+mET1vU6X0lAnQYFQGgkTY8vy7Wc2ffhA00nWM1o0OLXrAeRAM6oAwjmBwv7H2qmfbPmsUmvhNnr7SoCuHQlj0ULq7A4U7N0rrmu0L8c3YSr1PnB7c9Zmv2U/wnuVkEozXBbIrW7C74CphYNqunH62MScHRiQk=
x-ms-exchange-transport-forked: True
Content-ID: <A2B61C84E8F5FF4B8476EE2FAD606D7B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bd89ba3c-1b60-44a3-c8c6-08d805f56193
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2020 06:31:13.3817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4pcULYw/p0ZMld+wd8omsMRVWXyuORD8cPcp515hbCv5/qEESTQ9zLttAp/++ER6enwKG9N2tiDQKKsuJcxT3e9+J4C9sus9Z4lywxBR1f4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4482
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200531_233126_180992_610B01D3 
X-CRM114-Status: UNSURE (   9.24  )
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
Cc: marex@denx.de, bbrezillon@kernel.org, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vadivel.muruganx.ramuthevar@linux.intel.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, June 1, 2020 8:47:22 AM EEST Vignesh Raghavendra wrote:
> dma_request_chan_by_mask() can throw EPROBE_DEFER if DMA provider
> is not yet probed. Currently driver just falls back to using PIO mode
> (which is less efficient) in this case. Instead return probe deferral
> error as is so that driver will be re probed once DMA provider is
> available.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  .../mtd/spi-nor/controllers/cadence-quadspi.c  | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
