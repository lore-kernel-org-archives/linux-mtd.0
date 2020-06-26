Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A595C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 10:38:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ED1B20775
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 10:38:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MRcTfb9n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="vY5Uav+l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="UM6MSrHn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ED1B20775
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8p4UplqNCT8874UzVS2PQCADLvPRZ3Y4fPVX/4OdtVM=; b=MRcTfb9nLitJ4YhoXzuMBdFXn
	3Zofh+PRNZmKZJYpdH5BxxIPSnWjzldkMyGuSlhYHWtXDXdQldBOPgBnS8a+0t0ojREfHBNCa3bQE
	qlOJ1Bke5mameW5dRuMl0BoA8HBeMB4ZNtZbHukwOH5eahxgpnLrRjBaIqZrHozkqYcZuVaLKxxOO
	fCEp9uJqX9+8Rm7rCEWPyftyJjuKphxGcw6B9Izhn8DmHm1gwIlSFYhQNVftf86xRfZXDhqmWAvae
	To4SoPbDzBnmnvmNNaAw6beQgpx1AMrhfQUIpuNskYxPccB8wWSCyPUP75QZNi11XuMe9tlgLZcUo
	mRSTgODwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joljx-0008MW-SE; Fri, 26 Jun 2020 10:37:51 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joljA-0007un-Fu
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 10:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593167821; x=1624703821;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dn0Y481lDOxfz/jhsA7+HyvtqJ5dxAZYsFV7h54yG7k=;
 b=vY5Uav+ly1O9bMGJ7yPoCjqSFUAyO5+KGUjzZzCVt4Et76AbkB278fLe
 ahpiahcHeZOliGnVKG3X4Rw/NnVWyn3q0emyt1a88rwwao++LCB+Q1K2F
 cNh4pCMJPcG0f8WO0DWb4KrdwS9g2vojjg6KsQB3HQJvRa/keIo6O9aLp
 1lQZXFOZFb54RdzOZtZQFF2sHoc8PWyQVVEn4duiWy2brgZ88VOonYtc6
 Fpijcy30ZwP4+cFUcBAjhmocEK5HQEczf2N2Xznkmf+VBAHzZ4PiRH2Z9
 4Y92ggrn8l9KRprvm7r7cG9vBsn0b3OGHGdT0ZRpK0REKvnA0kt7HN2K2 Q==;
IronPort-SDR: JjrrsRoK6+/Uou/54uU++Y6dIqy9BhpNVKfs/s4xWLdKUf3ORarnAbpiQgh7MNhH+a7W/jCO6D
 e9XqUQuWnJ7fkNZ4HNrcd+4tV7FGJVGrnNkTU6acJWFB7LxNWls/mtl/tFJ4jYCtKyQsN39Pdr
 E1pWllwSq3ygY86k5zl1NXlscOucJT4Jyw5POCJN0moandKdn0V46S5W79bzdcUsYGRG32+6R3
 ulMiEHt7P65DAHoI+y93VVYhTOiV6dQL0rzzV3XJZ1OFRvpTdb37ckR9Z77/hj8BZYpM4Zi6EH
 pcs=
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; d="scan'208";a="81000627"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jun 2020 03:36:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 26 Jun 2020 03:36:50 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Fri, 26 Jun 2020 03:36:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xi6SoTQ55IxvKzm2r9f95L67MgvE5E580ekcGzmCTAzphM1Oax/nbkIFtErX8M+jSXunQwPE8GuR/Ca9XNO7i/nkL6scwo7i1OK8tTYIk2oq2lh84QdM9VIKKgtWmXA8/PGvdHd7XRnCaeJx7z16SVd8i/meDhMNosS1wifvwaXBaNrrG1W5c65nnZoTuxQs9X+hY7oPR7amKJktkCpXP83IgN9fdfn5du/iZAQ5C8x59U87+QJwLTccCaS2Y1lxPAr+Pyz3hkw/NOLibsl1VZynLSEB9W+gCOOnFk8MSthCjo1Ytqgp5jWlXf30outxJnqD5H2xbx7OEC2WMxeHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dn0Y481lDOxfz/jhsA7+HyvtqJ5dxAZYsFV7h54yG7k=;
 b=PZg7gA59AV+gaZEnIJmztkvcsLpK/RLp11KstFgowBoeGu6h5XNS5U/sov2RcR0dJt7jaQZMF4LX/yUib1SqrumTSPA+TLEWJtOWmfdMcuv272jfx9LKz2pD2up5skSug2S1ZifZYlzsyVfYTg1KkhN370ieZtJ8QXJo1xQBEw1st+rQSpTLzYIvETCi76aSC7MR7SaCFiOdFv0WBJZ9Eg7kYhCCMWwiF8dZXNSLM14JTQ6ImZG+tkxAay7e1jDNDydB9TPoUB2GX/x4fQj5CyXzN2SXIYHVZGTiznvKU4LSEhsmTEgHYJ2FEf6U7mGRCgKZKUBjp2vnfbJX0znn1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dn0Y481lDOxfz/jhsA7+HyvtqJ5dxAZYsFV7h54yG7k=;
 b=UM6MSrHnew1WA7vEOTffiVN9DJ28pyaJoTk98HqG9Oljb1Oxn0g0cRbCcOQsgy+vpAlKaR4KHfxzppsuepxJbYiCrJ29Fr/9VmSH1p7xZ6QIdF0BTVi8vdvCa34aEAKhQaRSWoZKffepl+knLqS6BJ0DnkCugnO87pSsft9JyVQ=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3752.namprd11.prod.outlook.com (2603:10b6:a03:fc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Fri, 26 Jun
 2020 10:36:45 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 10:36:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Emmitsburg
 SPI serial flash
Thread-Topic: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel
 Emmitsburg SPI serial flash
Thread-Index: AQHWS6Ww9+pY9Ib+GUCSZSPcg3YVug==
Date: Fri, 26 Jun 2020 10:36:45 +0000
Message-ID: <484cd8fa-1d53-8918-a9c5-bd386777c074@microchip.com>
References: <20200615155748.920-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20200615155748.920-1-mika.westerberg@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [86.127.52.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e37f98dd-9dac-401f-c65c-08d819bcd2f8
x-ms-traffictypediagnostic: BYAPR11MB3752:
x-microsoft-antispam-prvs: <BYAPR11MB3752FD167F45A0A0D7A1E53DF0930@BYAPR11MB3752.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 0446F0FCE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cOn7f7mxunl7g8CFPDUVW+BeTKSNczHV3frq8I6GOwEXpMpyMIrheitEeYNCM0fvIoEA8h1Ch7A2kmJCAgOl+N3amzmcJiT7CgqLWb0T0Mu77sRcb0g+nWuoGLCxC+5eXUbRg9bpU7x4sCUX5s+UMZS78jSOLrcETFUo4abv+HiFdxmCiK1i4T7ydhjduwRd6GksI9FbKdrkDMB+PFR5Ej+QLXBtdxvUo73KxPvAHqxIUxN4XbVnQ2KjhIuUtR4cERqV4aMDlLSFnuc6BJ5Q0Sxasva+WHagCnlqfbtMT2oUoOjxWdZD/B+VL1N6IG49CBQwGO/8E2dlOSOCEBTQ5fGhlchimXfnPY4mq2mT/BTMx2lCGilKJEQ1TEei/uYn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(366004)(376002)(136003)(39860400002)(396003)(6916009)(4326008)(2906002)(71200400001)(478600001)(6512007)(53546011)(66946007)(26005)(66556008)(66446008)(4744005)(86362001)(91956017)(66476007)(64756008)(6506007)(76116006)(31696002)(31686004)(5660300002)(186003)(316002)(8676002)(36756003)(2616005)(6486002)(8936002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: nh9L+qbPqvmAc37+U5W2+KWV3GgthVZ6f9Bj6iYWe4KOFLunpiWEz3xh+ZXcUgz/b08amHQORdXwkVBtBelllliq3drtVG3qGdtJwbEVsFphORVAEPAZV0gYByBA4mmWnNgQeXeQci/W6bEr+6Pzk5nQ3bZrOo5PFN42iBnvNqjzTQD6FAgMVKcmGjyr7GPA/u1+hIa+2VCIFyqbIwKWlYJ5SP8T3y+elbdklswGzQ+MuMvD1y9S1eF1nnDLgbOmroW1c6Xbiz1zHQWnHDMHJVDL/djUc0x1N21YccQA6ocHJHGWHiYA/LTzYyD8D5/mosV48ZYH+6S18027OfPI88+86uHYQEcbgBxa9+AsixjX91lJI85mTb7DZwYlsfkHZtCgrsyUEgZUHdUxT3VX3GsTzWpiGOkmWTYyrzYQqK99kz51Qt+ZrcVDWGRAvC4GcV66ZLiFEdFK7sTMAIN63ET1zyMxvw/NizJPX/aXwik=
x-ms-exchange-transport-forked: True
Content-ID: <062500229FBFF9499EE1D73514E55B58@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e37f98dd-9dac-401f-c65c-08d819bcd2f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2020 10:36:45.5141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N4xna7iw7cvQ30Bug3a/uvHWeDEwrEwataTc5/2ObqdYKGDk4jC+/i4hfONrgvs+Fe9I7PYuKtV18HROMYHu++Gx4SPEjFzVTyXcXoQrvzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3752
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 6/15/20 6:57 PM, Mika Westerberg wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Intel Emmitsburg has the same SPI serial flash controller as Lewisburg.
> Add Emmitsburg PCI ID to the driver list of supported devices.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/controllers/intel-spi-pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
