Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A02AC433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 07:01:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67C2A2076B
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 07:01:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hLEqRHo9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="oAMpxhei";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="UwXrLole"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67C2A2076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8+6CbYkBweOUmD4p6hdu2KpH+t/9B4f/Z+/fS5lvIs=; b=hLEqRHo9EGBNl0
	lfb9Wbzf5+7zzk5tOjXEasjOOQ6csLk2oRKgfCG321EzYWtjI5tGq/5eGEerAaRnQxutUMOCVmzZC
	h6zXExbzE/I1UHTph0rqwUJOY90BmLlo20/8kglKh3xXjGylI2M9cpmecbR9ETwqBP5A7DmTauLAf
	qHlCR02Z7wJDe0zv3hCP4S1vnvXL1NIVlW+alKEt7WDnd5zHqdAxJkk1etV6S104fEvqNSviJyuEF
	GyY54ewRlPuiehjQIAEiG+CKpSppK1ztE7bIsz4uLPriUgXYbt0tlxaw8hQWDf2jXj0wwm7EmYVWJ
	CITza0th1G9S4Zl6KLyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfeRx-000288-9i; Mon, 01 Jun 2020 07:01:33 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfeRv-00027c-9r
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 07:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1590994891; x=1622530891;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0+8FUMEi9BKsHiSzup5nhdSrUqN3fXVb5O3Z7TcXTis=;
 b=oAMpxheiiMvas+CjCT1ylt41sKfHyBD5564nS4qkU4TEeCCAb1IfW4BY
 /DBOqKGp9fvxmMGnzb4HA+VBHfr+eGHuWLgABOsp1IvPGxoexrQ1LbyZ0
 /DvKn+uwWeWlnkfwK+q02uXlqnqAbCTqHcto2P/s5i1ed+Ef2OXl+FIYz
 LTQxWjiMKerJt3TA0G6Zp7g7ej/dA2jBRWxDN6pUXUSgNncrZ0i/lrkWx
 ZNPMY9SY6ClWIJE3kdx1zBF4pJhn5KFMWnB/4K3wz6t/lJuQo9pUyWQog
 s4F+T2VmHkpYS54lJZ4Jz885IDI50SpYNYlgMypbMmFG2emrwg0NAlJax g==;
IronPort-SDR: qPVaH21Q75YRwodv2ScwzwoXjla2AmfBMHJWB9SL1Qb0afIHBO758CpJuNO6oVjIjNwajBFySa
 n77CdbPhwnNEa5xm+MJo8RPDS3zc6Slxn7Gl6PFq49isH49oBGHcmLLYswPacX3Xikf26X6LPd
 5N49zifKKGbBZN24it/b6VDiz27e7mJI29SkmVcmoRd3EoouLuAkoXlL4MAcOR0lRHH6ppNAHe
 K/AzQU8Z6uvkAZhef2GbDK16303vSCMfX4UBv1egBklI7gmCgVNAPCKvDdPVsEgVkA1Q0njfjr
 AdI=
X-IronPort-AV: E=Sophos;i="5.73,459,1583218800"; d="scan'208";a="75061190"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Jun 2020 00:00:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 1 Jun 2020 00:00:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 1 Jun 2020 00:00:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gx6PXI+/2AmN3UioC/AmTxMLG0/dbDWbuXpslmBVYeMkMzB4fKBPdY0x+nv9HhsEpdB7kjB9Ml0E0dswrRFDnm1DYsYyysth0Zj1E/ThLab/uE9onHuphkykRdupE7leJF5Rxdda3Bi8nqml8VAviGS+wCIlYDa9jBmB5f2kHHsu1i3tuzfTeDyGAUN1/aXYyxTNOjBcHosJNKkfVHtb9D+uTmHbj2Uy/e3i8MhFMc4/HdEydxiVm4NJ2C1m3aQmCOPQMjsEz0FGqpGG3r8ARbgWRIHPkvLELJd/NWAEVob3Tpuw4iw8eL6Egn8noKYe+3h8MOFvoXBY873if4bKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRqymHqnXLNNfYboxhQ9KzTlcCKG7jnFiZHI2jbJDlA=;
 b=BRM4Wc/kdlJ5eZxK+xEYHroDuu9EJMO352B3xDa3NwYIROIy9i7If/5rSfPRLAlsAAYRdtQv383kCEc6EQIL+o/7YDn1hP80/iFg1c4RcGJP+8wCvxKiJds0AhLaSb8VvYEDu5oOCgMPfz4gIWbYB7Bq4sxCDLO6oQ1KBD6hUYcAL7oAPRkGeGpYfzx6zKdR6fvYBFSOhOhhtM1ipZt8xCTE7cvQm6vaF1WU8TfiLnRWwgqm415MQZGmwFUWlZx0uTUKp/qrCsngJPPMIwx5ipLl4tQ6KZa/spBaPKAL8K+P+W1ZgnHAK73jr3UTkPuEme8Lr1rNZ9lR2DBeHIxtYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRqymHqnXLNNfYboxhQ9KzTlcCKG7jnFiZHI2jbJDlA=;
 b=UwXrLoleYFXq3JY/AugJ0sorHYOLtMeqSIYhacaYNN8X8L8Of4rxQFO8UIOeq6iBLQ5k3ZNRHlnjltWuy0jpYl+Bb/2HbY5C5f2rUjBbc/Q0InkTZnqqVuTYXO6XeCmy6j+H2otNo0/owrp4wXtN6ad3YZNVtfAvF87K4Ni1h1A=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4168.namprd11.prod.outlook.com (2603:10b6:a03:181::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Mon, 1 Jun
 2020 07:00:34 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.3045.022; Mon, 1 Jun 2020
 07:00:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <broonie@kernel.org>
Subject: Re: [PATCH v3 8/8] spi: Move cadence-quadspi driver to drivers/spi/
Thread-Topic: [PATCH v3 8/8] spi: Move cadence-quadspi driver to drivers/spi/
Thread-Index: AQHWN+JYwTPU7GcYXEOZEVBVNroLHg==
Date: Mon, 1 Jun 2020 07:00:34 +0000
Message-ID: <2051214.IORyQiarUF@192.168.0.120>
References: <20200601054725.2060-1-vigneshr@ti.com>
 <20200601054725.2060-9-vigneshr@ti.com>
In-Reply-To: <20200601054725.2060-9-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa2c79d9-69e7-42ff-1cce-08d805f97b2e
x-ms-traffictypediagnostic: BY5PR11MB4168:
x-microsoft-antispam-prvs: <BY5PR11MB4168848F8DD36D0336AD6A58F08A0@BY5PR11MB4168.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0421BF7135
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XEvPcbc3EUMX4heYQH+dKBSQET416vgTrXS845XA3DUmp3HAdMYGYs1QUO20AT4nDi9ntAGicxJdudcKyQaQIU7oOj6EgNeEfim7On3Di0DLxL+MoY1ITq1zmVvXV2qCmBwH097GJWny4BNs4QFfmH/eQgK7WNu47Y9GgzhFBs15jk+Rpko8VTHEVmO4aelcp4aIBBw074dbPiBRsInWV+8hQqqitV3/LS5c1bG5SCkdyHBM2pkEtcCuoavR/93/0uD8e6plzlexwAzAhAvD7Nhilvyr8iHRVDVqguN8KFmL68D9YnbzRmgR2SfMEuW20iYyibNxo1mFBaP5ACg1hw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(396003)(39860400002)(136003)(366004)(316002)(5660300002)(83380400001)(26005)(14286002)(4326008)(7416002)(91956017)(86362001)(66446008)(66476007)(76116006)(64756008)(66556008)(186003)(71200400001)(54906003)(110136005)(66946007)(53546011)(6486002)(9686003)(6512007)(478600001)(2906002)(8936002)(6506007)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: X/p395m+m514Rtw1pgw9/XG4mDtrpVJFBVJSZywZh+DQVx9owpRh94hO/Ag18GnKj4WjGBpGSun5DnLEX66uMk8kC7LWY/oUybJNsiHNrGi3HlHXPGXFShU2mlqyIgcFLVOIxxX0IVPU30i/AFRqQHvXxBbrE6gZ31VXQnC99tU0jZm4n43AuPoOOpL1Q5eLxwE6Ih2cET+tu6Ru+SMaACrzkDVwZx7C5AcP5Xnn7RPC4ogakaAYKxG4YzLHG4MJAgJf8/3zEjvvmc9fzPdC18WYB70EYOHm+QbR8H47yeVGnhKa0ZviMnXrlHwe1QIo3oDsr6qZ9KJtnYG1mQ1tEe2ZDZbf5Fb7YdXYBN2VMnFlDurWmw70CF/1p490PctFedTsSWhFXYt2oPDhhTwi8bkjXED4ATn5Pk9HnpuHzZNkajSyXhrMuItAx7mNv7zJ3acjrrcx5NQXf3SJWUw9iw9VzXimDwz/39abEOi+vu8=
x-ms-exchange-transport-forked: True
Content-ID: <969BD4A2FE8FEA43B671AF2D528936C2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2c79d9-69e7-42ff-1cce-08d805f97b2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2020 07:00:34.3221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VI5FwlPOX7RtQ63H7J0ilDxjFB1SR2VxwrA0SKfgPu4HctwU4sXuougSfwNVvNm2LkPAFFJnG5nBsZhx8d5+VUq9ULZxGicNzACjxw/X3aA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_000131_485055_FC8E6C02 
X-CRM114-Status: UNSURE (   9.71  )
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
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Mark,

On Monday, June 1, 2020 8:47:25 AM EEST Vignesh Raghavendra wrote:
> From: Ramuthevar Vadivel Murugan
> <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Now that cadence-quadspi has been converted to use spi-mem framework,
> move it under drivers/spi/
> 
> Update license header to match SPI subsystem style
> 
> Signed-off-by: Ramuthevar Vadivel Murugan
> <vadivel.muruganx.ramuthevar@linux.intel.com> Signed-off-by: Vignesh
> Raghavendra <vigneshr@ti.com>
> ---
>  drivers/mtd/spi-nor/controllers/Kconfig            | 11 -----------
>  drivers/mtd/spi-nor/controllers/Makefile           |  1 -
>  drivers/spi/Kconfig                                | 11 +++++++++++
>  drivers/spi/Makefile                               |  1 +
>  .../spi-cadence-quadspi.c}                         | 14 +++++++-------
>  5 files changed, 19 insertions(+), 19 deletions(-)
>  rename drivers/{mtd/spi-nor/controllers/cadence-quadspi.c =>
> spi/spi-cadence-quadspi.c} (99%)

If this patch set looks good to you, would you take it through the SPI tree? 
If so, I would need an immutable tag, so I can merge back in spi-nor/next in 
order to fix a small conflict that will appear in drivers/mtd/spi-nor/
controllers/Kconfig. Vignesh would have to respin this patch on top of v5.7-
rc1. With this addressed:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
