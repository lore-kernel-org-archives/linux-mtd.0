Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06EAFC43331
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 13:39:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C06552078A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 13:39:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OAuVYL54";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="iu7bdTrw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C06552078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ze4vgNZcM/dX/MrBd8BLM3/yg1LpPOA8hFwPhI6LpC0=; b=OAuVYL54tljKoh
	axBw9dMhuW7BS/UcLaKYf2JVvRD8ZIk9vzM1EvgAoD7b42J5S36elwzECln7mCYtDvTJ+Vb1Uw7Iu
	JAYErKo+ryEV3fPlV9/amLqdRHiQA4b0MqsZ5INOXONlPwBpxGl/v5Mk9qMIXnx14YJa6f1Qy50E/
	i5vkSYPo2galmKsEyu9jVcnIVFulwp+sdzBe2lJR3IfBOQMbQTmAQaJiq8Mn0OiCW0h1e5Wc7JXCq
	P1cQt8H1efVAitE5Rq+9K41GbZ6dw7XnYQx0PF8SiqjbZBM1e36n9+qiC3eyaUHyzh88nKfu7Z5gQ
	fFbldQX+WQQYRUJ7E7pQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH6FM-0001af-D9; Wed, 25 Mar 2020 13:39:04 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH6FH-0001aB-Lo
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 13:39:03 +0000
IronPort-SDR: Hifqbt3WCh/0Yo1yfkzuwwCvMCYtCGaTk9OkfxjyeVXpk4fym+22TQVwuKrpPFt83yIWvJ0xeO
 7Sr1ioOj/qy8Agye4xp32dBNBb44irq8syrCKe0RkMbMr9iNX3jVSgh4aGHO3YSDLBKUgH90Hg
 N3/WJyJkSd2aZIrG7aqk5xgEudn1cEHnxzILXnjKsJMjbg9n+pYjEVVRMGGQpblyRrjcAnu2Nm
 d+J4qz0OkONkTWIbtc8Iq40QWsn2QuVxUrS+JcLx8Gr/fYr0MBQqXOJpOE/Xi0hJ/mWckFAapV
 0FA=
X-IronPort-AV: E=Sophos;i="5.72,304,1580799600"; d="scan'208";a="73446972"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Mar 2020 06:38:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 25 Mar 2020 06:39:00 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 25 Mar 2020 06:39:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdo6NUL3obALjdbFgBmGRk6JGfthMJIEa1wSXZFrWoLIlWqyfjB5+Kkj1UezcMOMwBSXhpuwsmvr0gdcIDej1dFnUBjzEiIAPXz5VNKaoJTaTVgCaWC2rOa8hw36MgctxtmY4rhXZ9x0vTlTEGZA1cVsSg6db3iOxqKwWUbxkRjLZA1re3fpeYixhnkKzcJ9O1Yt3f82C905LUwq/jnTzL5B1WeWNQlTiJrzVCqZpm2b7cip4gbcSGMaXJIEWbRHdZB3JnnjG286eA0c6u0AweFRbLxTZnqosj3DjoMqTmPfWNK0U3sTptHYbMrSQQ/zc7H6OU0b5FQ5ZvaUFEf37g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNTc5uvnGD9PjQa6+t45JUQZJIDnjlsvGR50cFQJtQg=;
 b=C1KEpFFSEn4HkHm2ScEdoqUrInO+g5oIJ6WgHLHwUOv2OHxHYs6iXNocbJb0VBv8BeqoGkD/13xfwAPQ3/GAlVJ8TVtmNiuEaGudb+PTXn3E+urcWTkLLljkQ2sKv6X6MiXQrXsEo9DYLEn0GzOKQf5hJ993ERviTRUSyIdHbfeiojGHPRspv+uP2uEq4MLt7bc42wzFuZFc0qTofp8MnSvKtmAoJMMrs3Rz6O4iyMkYk/4KQJj8VTXAbsxVmy5KS4SMVElmLS35ixPWPpR4l4HIzznmHOsvmoRRGHh653zd/lG5DshStvp1oC0ME5V2tAQQHRMPujCN8oN1b5/O+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNTc5uvnGD9PjQa6+t45JUQZJIDnjlsvGR50cFQJtQg=;
 b=iu7bdTrw56+kkWe3TQN+HlS9KKqFNNARXgO0tORhqnl+1iDWDtoMkKGZa1TgHDUwBAUYCJR/tVvgrRWk11ipG3EVc3RMPYmnHaAHvvMRaMkMXTobQYCDIGPQgOLRW7Sq3DZgCzZOi0Zq/804khA9bVRX5+vAIyiZ+KEeufwRo3E=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4355.namprd11.prod.outlook.com (2603:10b6:a03:1c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Wed, 25 Mar
 2020 13:38:51 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.023; Wed, 25 Mar 2020
 13:38:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: Convert fallthrough comments into statements
Thread-Topic: [PATCH] mtd: Convert fallthrough comments into statements
Thread-Index: AQHWAis8DL2tMEYn3k6kmnWVwkN0ZA==
Date: Wed, 25 Mar 2020 13:38:51 +0000
Message-ID: <2957792.Qe9R54Rm4K@192.168.0.120>
References: <20200324222538.16446-1-miquel.raynal@bootlin.com>
 <3012544.xGDKOrPs75@192.168.0.120> <20200325121608.4d2e9f13@xps13>
In-Reply-To: <20200325121608.4d2e9f13@xps13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 541fb92d-86b4-498f-c6df-08d7d0c1daf1
x-ms-traffictypediagnostic: BY5PR11MB4355:
x-microsoft-antispam-prvs: <BY5PR11MB4355A70BFEE03FDF4EB975ABF0CE0@BY5PR11MB4355.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(346002)(39860400002)(366004)(136003)(81156014)(8676002)(8936002)(81166006)(14286002)(71200400001)(4744005)(5660300002)(64756008)(66556008)(66946007)(6506007)(53546011)(478600001)(54906003)(91956017)(66446008)(6916009)(76116006)(66476007)(26005)(2906002)(186003)(6486002)(4326008)(316002)(6512007)(86362001)(9686003)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4355;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ux/MyiIiBz9YR6PQFoxRdfglr7K9I1I/aatwSRsq+4eX+oWlhzekkOeHoePVvRT9UnQizK/qWLMfMaBb2U5kfg2n5XRQ8BH0JdAp+B1JthXkGQrJZiIVDW/g4R2kCFIc5Zc3zeqhojmcTYhGZpbk7fhyZL8rkw/RDFOtu0sntvMNofXI0fo0xZQDvrr6rhCe7O2r/W8ZC+jGTisniqLHOotw6to9YwiY4KD5bituE2T6GmZ9dQsbYUrYg2jdK41TSEpecRkm581OG703816S9O/VaznY07rIVneTm+BLe0qjfDTNG7FdPgg0KiRlA//MDI56epjTIp+47A92Jw59vxxWKigy2Hb0RggYfh16U0tJu/0uKZTQksisJZG/g3FFvow2L3Vq+jL8uZ2/taXTD3X4rc/S7Q3rjr9UV31KMTWTI7JIb9LsNKgphLs7wZ8cO2j+Q5ZFnyJT4eLqe6nBpOBsTTJQhxLfcyaOdIdFB3OOVQfMKZgruozu4RWLOXCL
x-ms-exchange-antispam-messagedata: xdWhUC0XAKinpvGAEmRoGkDmZBD4wYgbyZpzxL1mRnn8j+Bj4gMTwSlW1yiAr/OvPgR19C5/m7/aZUFHVupyc5gaL0O0ubQm6zTFlD3AbqLC2kwVAAal60VXqGuR5//JBQnBzTIDehWFGKeL7tE54g==
x-ms-exchange-transport-forked: True
Content-ID: <012B272FBA4E63478AAE0B8A2DB3044C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 541fb92d-86b4-498f-c6df-08d7d0c1daf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 13:38:51.4729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l/5lYGh8Q7PBi5i/lR465/N07H5TXqaBetQrUusbNsG9jgGyZHM9BlPekyUtoksFyNL+6Pmk/lL8NAzKYjZb/ziEtilwvq9E0IGd9/BzIyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_063859_769888_BC971221 
X-CRM114-Status: UNSURE (   9.23  )
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
Cc: joe@perches.com, richard@nod.at, linux-mtd@lists.infradead.org,
 vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wednesday, March 25, 2020 1:16:08 PM EET Miquel Raynal wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> <Tudor.Ambarus@microchip.com> wrote on Wed, 25 Mar 2020 11:06:08 +0000:
> > On Wednesday, March 25, 2020 12:25:38 AM EET Miquel Raynal wrote:
> > >  drivers/mtd/spi-nor/aspeed-smc.c                |  2 +-
> > >  drivers/mtd/spi-nor/spi-nor.c                   |  1 -
> > 
> > Hi, Miquel,
> > 
> > This will conflict with the SPI NOR changes that I made in
> > spi-nor/for-5.7: I moved all the SPI NOR controllers in
> > /drivers/mtd/spi-nor/controllers and drivers/mtd/spi-nor/spi-nor.c became
> > drivers/mtd/spi-nor/core.c.
> 
> Right, I based it on mtd/next. I will apply it after merging all your
> branchs and fix my patch if needed.
> 
If you avoid the conflict you can add:

Acked-by: Tudor Ambarus <tudor.ambarus@microchip.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
