Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9A4C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 06:49:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89C61206C3
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 06:49:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IlPEBHGt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="2Xvy73mg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="fK3t+HTg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89C61206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7hbvE0VeQJyKiFkb6D2XmYhHDnHp5p7PBMNmr7THlQ=; b=IlPEBHGtAUVwfM
	+1D4d5jPOzVPpY1OGYmYjxjNwdIVyfKz2zvmOscSn3ohuIfiVy4cYWE7nnH60F7vEUQPi8/+zx4mm
	sh9hh98xHmfCm+KN/TA3Fk7pCqMcUC7czKsSU8/Xzsf+UsmRONOZRqKyqqFAinhiO+MH1KOP7hM+5
	PmcRjSF22hSFB0y6syQ9N2RVoKDqomDKZUD/YRG6mZdh76R+tAr5EuMIbeFpY69cbdjxvRP4mTg4c
	n4KttYuwjuTNe/LbcYOaLcRUkUK1PYS4BMpX/T2unjIF/7aqRKgEkZNKabqV35FtMfQ0uJUjMRDiC
	EEQb6bvSzr1O9oNk+3NA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfeGZ-0001g7-5c; Mon, 01 Jun 2020 06:49:47 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfeGW-0001fj-Vd
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 06:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1590994184; x=1622530184;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+8vJDa6Zd0rf+y4ysoGURD3mLOcl+7p1KdyiPDQ9cLk=;
 b=2Xvy73mgPwmR0n2TaDie0/803Duwqsvrt1GCFBhbnHyPqJVQ53AbQ1gv
 ApvN1IWV662Pr4cWFzhxAtW0r7+rvZTEdR/wMyyFA1qARBEHOCm6YmARC
 1nnV47r3sRCkbT6vXJ9Bpi7aAN5opBAYqdBgBaAHP5Uz//mOrgm8dptiY
 2GnMa+vCAJEVk4FpShUDDYQpCUVLAx2MbVbDI5bho6DqzUp3AOLTCjJLA
 p0ULbPzdiQ+XNt5FyZNWBGjuagi3jbeoiMOTqQob/CU1m0hzHWHLow8c7
 g2Zb/yKh5y1uiJYA32AaYiAxxLGDUCEAGp9GhV2nErP3upSoiHaYKqNpm Q==;
IronPort-SDR: xPvNjBlBiLVB2yqMcGOxN2uLhEaUXNYx0THc0Bgl8ASXhGb5NXFij72l5opMryoKB2FhCeDZrG
 GBngAvr1T1eyg/lPQvNJB0EZmdETPLHxdV9qx+8o+dOv3R4p9C2BcQHQexOpiDMzn2FFfv+AgM
 6anKOgJpHyxouH3MxG3vlZ/SSLyBdDUbCJVkw+sqvbp53Gv0tNXMC2y4O2/rczgU+IviVZjklj
 ex69VCGUA9gPOhqbiGUXluBR/aDw+p69XQu/UIc53boxLH6/QV91reUuSRSE44S4nWrL9IxZB4
 7HE=
X-IronPort-AV: E=Sophos;i="5.73,459,1583218800"; d="scan'208";a="75059760"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 May 2020 23:49:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 31 May 2020 23:49:32 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sun, 31 May 2020 23:49:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDGq1/BnO28hzLm1KnNWjB4//xPT8jU4b81ThdRJZ2XUuniqtMV0tcuif2+fvIY/DBU+Mca/gVgS0PhMeYmhn+nNR4klxfO0FqVC78+p1imZkCj7SxToN3jrzdV1D2nyXF4QRWh84w+Yh+m3M5Ghh2Dx32Q29xaYFMsexfVeLgxjm80D2NfFdRD8ixrKF5rFmpwN/QtFlztK56UyuBIUgRdLX1hFmsUZiNkHJbJ8+0NWYFtQ18/xB2GKQYyleh4JqVL9FuxbGgUh/Z711IknMPJNVDjX8pVlgec/9/emBFNp3Hel0dYBg8SviWyPqMk+8AUJA+qyPtqBT+XDy7jX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbMcrbEX1GD0tx9RA38IWZTAIHJl30J8hCUjzcscwRA=;
 b=hcGAxvSIL0wrFYA6pIwXVgayAuFNDFvq+IkVkm9uuN4fG1trw2d0dD0/hMVprpIWaaNn77MSIVUu6uIu2Z9JUCxu9MDFV6sQYfIjGRq0oYIJXisFD+Zt/ng77wrho+2hmePZ1xlxX91l3H7fyFbAP4lpEpMzgeQtCKz1K/lsO8l6pcx8qHsdekNSb4OU6r6RR3+zPrp3AXUs3/JsG71QWj5V8gId/JQJxSsN+szbHR4JO8SkbjB22JE7yOLSYTrHr9Gs9NavrbJ0/zNmfoC3psD1EAemANb450KHU6cjnI7/iglV9PO5llY7Lhzfg5ajoZFGZniAf/rKhWL9Umq5OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbMcrbEX1GD0tx9RA38IWZTAIHJl30J8hCUjzcscwRA=;
 b=fK3t+HTgHjwH64ZOCgFdnBxdyVWzFkfb2KmXoOnhofCYgNhzRIAIM1DJQC6qfEg7JubldfYSM0bdcCGaST3dEOAc0tCpPpGPeysGE+QHXo7vpMh2WwjC34o7P6kybeOpVz3HGqToQ+hTfytEsBRZp1IcKXxKTih6odP3pzIfUHM=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4258.namprd11.prod.outlook.com (2603:10b6:a03:1c2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Mon, 1 Jun
 2020 06:49:42 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.3045.022; Mon, 1 Jun 2020
 06:49:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>
Subject: Re: [PATCH v3 7/8] mtd: spi-nor: Convert cadence-quadspi to use
 spi-mem framework
Thread-Topic: [PATCH v3 7/8] mtd: spi-nor: Convert cadence-quadspi to use
 spi-mem framework
Thread-Index: AQHWN+DT7HfOrqJY3Uai3Z/950rmdA==
Date: Mon, 1 Jun 2020 06:49:42 +0000
Message-ID: <2026477.zaRYUy7Czx@192.168.0.120>
References: <20200601054725.2060-1-vigneshr@ti.com>
 <20200601054725.2060-8-vigneshr@ti.com>
In-Reply-To: <20200601054725.2060-8-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27064aec-be4f-48cd-5e1b-08d805f7f67b
x-ms-traffictypediagnostic: BY5PR11MB4258:
x-microsoft-antispam-prvs: <BY5PR11MB4258BBA43AA34ECCB7A9CE06F08A0@BY5PR11MB4258.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 0421BF7135
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OwQzQHSVAUnbPSKpFWAGBuULKJ+JG/UclJ+/oQoQFyARlIoa/2O3uGVuyjope+rt4lnetGFRbsiEunY4Fy6QJ/+AW/toyzPr3XlVmZ0pThCIEOjhJsxPXd/LK7d+UtghafEKXusvCvfNVHVywch+DKZSq6z77VqY+teBwSisz1Ff3k6PrqmDsInmcKEXnlPwl/asoBkqe0rz1WoAAR7Fwm7eGwQxoPQAvDZz/z/yERglt3YuM8d1QAGwwxRKmhaGyIQu2ADfow0kFy6kduDlfUJ/25U3ON2Rq6xNjImFU7BDDwwjFTL+vvVXCInl4+I7qFy2CIY48+3HmyDDasUA8nfRKJrIKlWTaS7Hc2NKAz5LNR16XyovRG4fQXnolMOY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(136003)(376002)(39860400002)(346002)(396003)(6512007)(9686003)(83380400001)(8936002)(86362001)(6486002)(6916009)(478600001)(4326008)(7416002)(66446008)(71200400001)(2906002)(26005)(14286002)(76116006)(91956017)(186003)(66476007)(66556008)(64756008)(66946007)(5660300002)(6506007)(316002)(8676002)(4744005)(54906003)(53546011)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: zypPyZexa/HWUu5aB84qzMWxbCgK8tPweYIxLkX9Iw9Zo5ZnyFMfwp23twwl+Y5UoKFWbEvIAT3dAVeNtHNAZrODW0xAYZoWZ/HJAMgVUDn2y4/nmr+UVj3refQ9vmWo52znOQ1bL/lr+BNQY2AV/CoAtDqJLT+tGdEKKbRylGfm9fzpoyOiWrYG/EFCteGMct5MP1nwiq0gTrrX75pve0HENqSZEy9ge1tnq/xJ9Ojqay/Q/FG7KVQKTtaNx5MQtdiLkocn0scNkd0pypKyK4buDokPDeR0a3wsMUITSSKd8UjerC2pA9N7eKy8cj1rpxJAol6+mhsYwfu53ssF7mnp0+7fsyceuzwEXnH7pUt+MeveCZxma0fJzYWHbQRbGAwMhdvfIon5dPpzhyeM+MBfBXDb9AJqdY8hmDquwWEmyV8/sZ7ZLKZWZEjPw71oQWO8ayf5lfx2wKoyAQOT9nG9fNiWoKNChZg58Wd6RDs=
x-ms-exchange-transport-forked: True
Content-ID: <3269A699FB75F64FB258808A4BA3AF58@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 27064aec-be4f-48cd-5e1b-08d805f7f67b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2020 06:49:42.1857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l98jfNMVUUG4xQHtw11hsI9GVg5fZJbb/9vkrlGyB9AkY26plQHsDgQXEaYt5UoR/SSSzwCi5MdROSL0274XsjANoYUB+Mr6LYOfruTd/BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4258
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200531_234945_082641_75DB1A18 
X-CRM114-Status: UNSURE (   9.11  )
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

On Monday, June 1, 2020 8:47:24 AM EEST Vignesh Raghavendra wrote:
> From: Ramuthevar Vadivel Murugan
> <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Move cadence-quadspi driver to use spi-mem framework. This is required
> to make the driver support for SPI NAND flashes in future.
> 
> Driver is feature compliant with existing SPI NOR version.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan
> <vadivel.muruganx.ramuthevar@linux.intel.com> Signed-off-by: Vignesh
> Raghavendra <vigneshr@ti.com>
> ---
>  .../mtd/spi-nor/controllers/cadence-quadspi.c | 476 +++++++-----------
>  1 file changed, 191 insertions(+), 285 deletions(-)

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
