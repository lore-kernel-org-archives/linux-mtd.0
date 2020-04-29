Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4836BC83003
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 06:48:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AA5B206D6
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 06:48:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tcl2qcAu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ZZN2FTdA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="iWPy6ybo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AA5B206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmTGW8wU8p0/7ev3C3ajZAqHJze0qjNePMjv9W6t9N4=; b=Tcl2qcAux99g8T
	N1vffL0KVvoiTSNjb9gHYuX4fbexo1FLCKzq6e5hMf3Eo8usTGGD2ABpgVWZAiikeVffbACPOmI0F
	hpI+lPg2l1yXh+/bR+jrf7JjEjdxTSsVAIKxGyT55Ayi3eM4SR8Tk75rxZwt16HO7UbA6IodYF7Od
	CLvUwPy28jZl1GxoT3fS4+ZKRciz9lzrehvPrzSOtDiMXfPAKh6gKkCPAwr3Ui50YZ6G/nfeMCCxS
	qBfkkoIjvNhOLxKkLb2i8qYW049uhBDBVT1+/eSyji3o7JH5MMDzZlx7WkehxRjYr0mjen+r2M1+Q
	R5gXs9it1x9QDE1wD+OQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTgW7-0007QE-De; Wed, 29 Apr 2020 06:48:23 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTgW5-0007Pm-3T
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 06:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1588142901; x=1619678901;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9EwwuObO3NuTLCJRWt/nQ9meQBQzlwX1uZH6VQTX634=;
 b=ZZN2FTdAxKVb4P/zj4gFhYVJcG0Wt3MCAeDoAuDf5usg0bNQw7oQPqHE
 Ijcg4szCdE/bV6pU55JHXDVV1TpeKEIdN6U+/678dV0PU83CtXpwkRiD6
 rfvCr8wTsZaRPZjeeYU5e/etywukama5++YQrdswF1HvnQC8ZsmvJKCrI
 rendmc93tLzbEbmdn5IcM8PhBBjiLNIhj1czjemugrfi26Pr98CGIdlPv
 vvfnoBRmdwJYiZiJkGSA+ESTenGFv3dvgGK0WKQPez6sjCAZVidd4TpTw
 /UVde5aMrtpZs6+AQNIsxnMbi1/kJZqKkDEPlAFV4/6IhUaz6Z5vY+DNQ Q==;
IronPort-SDR: 65P4fenYF2oV1LneIuhBTK6RPmtGdDUpqFJ8+q2ldGNUWDURM5zp1VORkLx4+zCJqbPfr4XJXF
 Q3SRT+MxU1cOrfYDoAvaFH1kPupVOzTmwmWeBq5zkpkyFZnbNlPEKll39SQHowZl+v6RJXwktM
 sQQlNdBIPCmUGAz0+waWkauMgtEy0viaH7MwPlUPRRMUu6EWAg8TsDYbiilG/1/6zZsOkCMxtE
 7TL8Jec9t6HGgUM9sCnOamlCb6zh6QIA4VIdNHCV3ZI0a6xaFFDa8wsv9RAlZs+QW8+hxaR5WJ
 EtU=
X-IronPort-AV: E=Sophos;i="5.73,330,1583218800"; d="scan'208";a="74897272"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Apr 2020 23:48:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 28 Apr 2020 23:48:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 28 Apr 2020 23:48:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uho/fVVKTi7zTpneAcnEHTjHWFVbyvxxT3bAbgcwkz8HPYUDKw5kjwfFdXP9vHMnlVnNkqAsrD1hDLzBCGbdLLcJ4ztB0noN+MlCp/uW6bRSlkXZtGvdLmIA/ssyDBxgTaM526XLmczbWcNG4DB4GLZEyZu8pvo8Spvc7FMX01niPA2tajmK1y2Wm1jf+kfZmQDyE+xWfjIc+PNyCk/hteVXBnR57gDHZVPaGsy7CeFP659E3d6mu8aPR7ZcWmeD/ifOv2VosYQpHEd4wR3Z95rj2+k537L16v5M8opMu2DWTrIQWVS4xT/twP5QD/+4VjKtmFqTUu1zCXdXTn/5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EwwuObO3NuTLCJRWt/nQ9meQBQzlwX1uZH6VQTX634=;
 b=ICsOmSjQvktLycL2ZOpxWvR+Sjzrx73Z92GEUx597x+u6TBxJOFvwvan/RGNNa6prwRGJ6cU6ZdrmuDJtoSbWmPbEnVhAdx2bkcP2O7sxfayFSLaAhQurhsaEZ6c9xznGXjrtgEZDOISr1GPtWbfMm4SBJ67ZVrNEUoc1l3Owi0b6UZqDw/Y0XD+u8bO4effqsmH04YVmuX/XRfoOmvQHvJrR0JqYZVzKVAZmUXhu5y0sljJd58LI/xKMdGjLcQVuVY2SbgLbQldVewjHcGgmU9/pWnqkEkf/SOBzctD+3RIMEndbnv3q1Zf0XuwuA6Zghj/t7q1GDMs88scWUfVpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EwwuObO3NuTLCJRWt/nQ9meQBQzlwX1uZH6VQTX634=;
 b=iWPy6ybomXLbAAz/pJ+TjnhS/fZN+LNkHq4ZHu6ji1KPGXQ/7o/VveSvJ/OPbePPbXuMW0U+PtZ3gdx5SpItPuEeCo49+ToFBJiUJkdbnQzXFnBv4qv0xC7mmdcDtk7DQsvn8oKH/vxnUEVkida3pVIxNHVX8KI9jHPOrU0LVEY=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4289.namprd11.prod.outlook.com (2603:10b6:a03:1ce::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Wed, 29 Apr
 2020 06:48:19 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2937.028; Wed, 29 Apr 2020
 06:48:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Uniformize the return value in
 spi_nor_*_ready()
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Uniformize the return value in
 spi_nor_*_ready()
Thread-Index: AQHWF6Z/y2HPIm6OI06flI5wCCnJXQ==
Date: Wed, 29 Apr 2020 06:48:18 +0000
Message-ID: <1596773.Crg54zjmCZ@192.168.0.120>
References: <20200421063129.244466-1-tudor.ambarus@microchip.com>
 <38a730a2-2a16-6ed4-3203-31e1fbe8dd99@ti.com>
In-Reply-To: <38a730a2-2a16-6ed4-3203-31e1fbe8dd99@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfe67175-d65a-45cc-d8cf-08d7ec094d3b
x-ms-traffictypediagnostic: BY5PR11MB4289:
x-microsoft-antispam-prvs: <BY5PR11MB428954B7F2B73EF891054954F0AD0@BY5PR11MB4289.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 03883BD916
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(39860400002)(396003)(346002)(366004)(6486002)(5660300002)(6506007)(53546011)(8676002)(4744005)(8936002)(4326008)(66476007)(316002)(66446008)(54906003)(478600001)(66946007)(14286002)(64756008)(26005)(186003)(2906002)(66556008)(6512007)(91956017)(76116006)(9686003)(6916009)(86362001)(71200400001)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eiYltrrVMsuQHLdFspp7RsEoSgUZ8Px/O9nJu+h/TMcMX74/Wo7NEH+ZIR08vMXWb/aomnR1t862BhbXOU7bAIzoG5RBxXnLQ+mv9q0GwK/SvZPfJQ1Kd+4OfvLNV00ZLRBWnK6FsWFXADjLo1QJtOMZclvbOK991/dmrcO1u/UYTabji/gefzaHQwlUZCyZbGpgYpCL6wRqa1gTcZ6Rnhge0t90avSMCEt3pv0LsZAvUtdGCaCS3ongEPvwlCSTqtX2DnnxbiSIfgWH+PbbIVlW94UrLZ7xhrfZJ6vKel/7r4JTnhGJq2c/wTnNGknK38rcWnMyFKHL04WS/El5sfJWeeIMmQi1PmXnjMDx9zOw4RGrNFdTx5rsInfn4H6Wwt42r5Q8LWpeE3QJKbfYmM9zvMUpmVbdPCoQeI2oOIO0wgZRuZkKxCUl1LJM22JL/orQrbAO165hqtYQrWNt7S8nISurkmwJ1tTkO75ik7EM8ASxYcQ75B36X2ULBbyZ
x-ms-exchange-antispam-messagedata: Zo77QTWmBnxUwJkZRAqz3ryYqNB8lYSQ1K18efTV+g7zN7UQLt/MmLvpi32WeV3QiZVzvX3936L+F6v7DMFga/50mkGtSQECJ5TP7l7QkNvxuoa9XyS6GiPnSjZCFAfme3t4fSNUln0Hhm1vnz8t9gWxEkggc2HBJcf2/47tmwtR2+YbOnU81sPguyllKegnB3dUKyXlFjDK9FU+O2BtupNEQ9Oqop/jVg/sYNPHfzYmLCrHOcPE+wlv2D02DJkLdxjB7fgTJJdX6Sa5th/IHUiWDcrP8Dcx92s7mVuPyN3ZtoPEC11ETgZ9NKKbMyMkU4PkcSyXksotVJvcYHskeDO1d83iQNqzs/jOQQoH3AEJcTfpTAGCmfGJfvIg0N8mLZ956i5CsYh06u5nxAKUk/BGDyLbrtUhqghukp6sglPBG7q2yJw3sQa6W2vGfqjcm0Do38AX5nZvYnoXjjZ+WoIx9HssbCZrIwE73mZhLnWbPOl32ZRCW+07lOZ5jkWzA+sWStX8PePtskPZIh6EKEBaHlXeCo+SgnbSF4548zDEdE5HWoLph33cBrHCBRqif5MIT0/5ekRQiI77mqjnUQYsPo93dB6Cz4TuURPkgTwrKdXl4hh4W3Ht0FxRdUr9wdZcGwFRThVhLv3O/79DQFbFe5XX3JSwt492/itbuFFrJOpFGIwzYI9yaksFXQbkSglzmxGWJmQUMsR3CZTXbzB8EzFhSaXUZZUNnRSh7qL4rgf4JLKk9RIw2njuS0JwZYjZBoyegpG38sjaY5yohjcPcIEiP5Uzlo4/gruPB1s=
x-ms-exchange-transport-forked: True
Content-ID: <1D129C7869110244829A19CDD2594980@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe67175-d65a-45cc-d8cf-08d7ec094d3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2020 06:48:18.8824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zqOj74Ma+0LbHUEHSJJFO5Cjb4EKckNnIskWc3IlYPQ+JWrhUhLCQFqCKHi2oVoEaTAtRJxf6I+hu570DQeSTCl4JrC5wlFbfgOtfZhhVAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4289
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_234821_153446_95F13A77 
X-CRM114-Status: UNSURE (   8.87  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, April 28, 2020 3:06:19 PM EEST Vignesh Raghavendra wrote:
> > From: Tudor Ambarus <tudor.ambarus@microchip.com>
> > 
> > spi_nor_ready() returns 1 if ready, 0 if not ready and -errono on errors.
> 
> s/-errono/-errno
> 
> With that:
> 
> Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Fixed the typo and applied. Cheers.

> 
> > Do the same in all the spi_nor_*_ready() children.
> > 
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> > ---
> > drivers/mtd/spi-nor/core.c | 2 +-




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
