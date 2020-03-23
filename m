Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669A4C4332B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 21:34:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DD0520719
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 21:34:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z0ScBbDg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="AqfLYX56"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DD0520719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CaWRI4yccel0wpknC0kFWWuP/GslaLPWKD+tV2dh1PE=; b=Z0ScBbDgn1veCw
	T9ARI0QQJDJu7i9NWww3RT/Cuqib/fj4f5hJLAPwIHSZHvwG2mYHgSX3ZupoTATLuj/ZIdn6CEnuc
	pJ8e/BpYcbBafbLyNBLklgt/uCRBjH6yPXO7wOD83AqPYhX6FA80z5lyrVIP+1Tlme4euZSDTgcUJ
	cGciVkypUa3bdNAI08J1RvFoTihPWDYYqMIsIQ+QQw0KjKCDz5CnXyJTQXkis4DFOSUr4AVCSRMn7
	o5iT+7FIVZYLbSdwWIk4Q0NJaLBt/dBqpCbY0GR9tsyDL/b6Gaoc/n3B1vQcgvLp1gm30k8CZqGQT
	tke3ffs6ysgvRUJhviwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGUhs-0005uv-8x; Mon, 23 Mar 2020 21:34:00 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGUho-0005uW-Rq
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 21:33:58 +0000
IronPort-SDR: lHuHmNKZjfeLTwmCtrAteNY2NwYo/Us2ra7xr76gA+L7oJjxYzSNY/qV+Ug40s2Grp8eu3X9qp
 hjK14jGvXHcE4VK/cvGU0ZT7gj4613ASFJeXRWwsxab1jMNaM6WGkuYbJuyoupK5Qzw5i8qDF1
 zPwhDJOZBfq1IIo9HJ3lhjUmKx9Wxur8yUPEOy6IO5FWZkW8yohrMgblx3Xaq9QALDIZQ//y84
 Tylo8lu0unL4qqqxZZJ5gsvZtL3r7vuT2MvQu6RHzzhty1OEZndoe82ZK85SWvBbkoFprclv1l
 xLU=
X-IronPort-AV: E=Sophos;i="5.72,297,1580799600"; d="scan'208";a="71000353"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 14:33:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 14:33:56 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 23 Mar 2020 14:33:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNZwl6CGbxyfTaRSAIxrGHrf6OXyx0DC0MN3v9YuwSb3BXNQz5XaIXuxWIS3DRmcXjAs9pXbrBt0399yKJ4wLktkMOUk9bu6DSghoou6baOmGTcNZ6HMOpW16uZzNjM2Kh8W7q1gqq/sfx1bhrjO1WTWit2bPB5/M+hvvbEI6d/6IpBGRGtr3HYOAWvrrI4yrNH/V43DuATTGl+inCF4Lpg48oeLVK2e4FGpTT9O0m3nWnM47sepp5xm/eJcs0qK7i9YC2uc8LT0UW1HNywgzEHCm9IrI5QFKnxkfAL2YNIySC2hP/ip1SvySEMfA6/dgxo0xc0agT+vg/0NbCkwXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8gXbpuDC4fiRyfbWqLKX8SCSt1rOTzscz9FnMVaOF8=;
 b=NFrs13jo+TeQnz02f+sAauMItphjG8cfzRToDceXBBAT5qIkRwsOjeAWe0QWbH+EvTtFCKVP5NnNyFF7Yu67YdKCbuVDyPJBNgSOLNT+o+mkYIymyfaxYEyBnEb4OZ++3TJ0eQBwk5V+5UvE7SV9frCX+LZGtos3LZshbfIGyE9EBt7YJKcGjPfkcEtzh9loMkK7gQR93KVTft7aUssRDn4HZx+masvTyLDJfeezOW4uh7Ri0E25h2BM92vIAofLvNmFufu1B+jPQeyAMUYM/fUeHLuw3Fn5jn7y/1N3tQ/10TEG5Y4kxOYJYBk3Dfnj7d5n13j0Qlkqcw5gZxmkHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8gXbpuDC4fiRyfbWqLKX8SCSt1rOTzscz9FnMVaOF8=;
 b=AqfLYX56zJ5tNUAa+HotRlP85k6m9lDttgQibfbbSKgOlFuZC5pNEEblyvHTW03dJ+XjXWaFRUe4VWC+un3oMBQXWWbtQzfoM4hskdKF1ba1mtbqAgp1FaxtQ3QxrgVoIwB7iSO8XeW9ICgDRHUFj188cIz7Ik5+GpB3e15+q9s=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4308.namprd11.prod.outlook.com (2603:10b6:a03:1b9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Mon, 23 Mar
 2020 21:33:52 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 21:33:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
Thread-Topic: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
Thread-Index: AQHWAPTc+rZUxlHsAUikj/5G7+sVP6hWs5OA
Date: Mon, 23 Mar 2020 21:33:52 +0000
Message-ID: <6757753.zy4y8y8RWT@192.168.0.120>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <401ca7a54a8d327a0397880db6a9a475@walle.cc>
 <3123463.3oovMYBsBI@192.168.0.120>
In-Reply-To: <3123463.3oovMYBsBI@192.168.0.120>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8a3e3c1-cf3f-4458-59bb-08d7cf71e1d9
x-ms-traffictypediagnostic: BY5PR11MB4308:
x-microsoft-antispam-prvs: <BY5PR11MB4308A00EB3C7FCF6D416BE04F0F00@BY5PR11MB4308.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(376002)(396003)(136003)(39850400004)(81156014)(478600001)(81166006)(86362001)(6486002)(66556008)(91956017)(76116006)(66476007)(9686003)(6512007)(53546011)(6506007)(66946007)(4326008)(14286002)(5660300002)(6916009)(8676002)(8936002)(26005)(4744005)(2906002)(71200400001)(54906003)(64756008)(316002)(66446008)(186003)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4308;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C1m3yq8m7x4Z8cUBjFqWpK6PhgTamgwnBvuD1uvm/OLtLHctQHhZzDbwBic0m0aKtNUbyJCdj7RYuVIvRe2INlwKvG6w5L0zAKJI4UxjPGcgd+uOe26LmZIIXZRJcBx7YmwAvO4quJc0ANd5L9/qrtX7ajbayF2EiiX5bcGbT8eBVtG6m/1LeqCXOgXQqMv/D5gqoHTapJ0WhdSdA5Ywm6HwE+rfJOpMzb8awBihhHyYnH6/5jxWuAGFQ1XMpFdY05y2Y0YHMnUryJMweqMpwYOYdWzsCVj/HcuLQYicuGY9CnPCljn2csgqpkP5KPTB0x4QnBZzt6YqnCE+cpw2hKNofC/8l/oWV10qikR1eZMfwdhtlAVTRCeSTWgbNNXbsccC4DFDRQoKo5UBe/Xb2YdKGhvvkMetLLjXOkyYX+jJ49RPIFCd7JJfe/mAFZ7bbXswaYvQN7eZq9N35p6zxdQlzyf9HQEHSakffcIDcIJlbetPvUgrPGFvZUkta7M5
x-ms-exchange-antispam-messagedata: ivqOrZK7fT2Shsnlq54zgAGGsqB2z0xYGle+Xs76CyzmGsShvR0NwoO0eIcoy7djTC1x4NaRsx9te+01D4Yjb4VxSIzts4ePx3xAZ3607G+DyfZBXWrOM4NzyiWSnq3+lBU5YVkQXGiJrdDkZEubbg==
x-ms-exchange-transport-forked: True
Content-ID: <6F1D83DC0034F74695A8E5D95654FD36@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a3e3c1-cf3f-4458-59bb-08d7cf71e1d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 21:33:52.1927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NNkIQm5UDZVqfLAN8cSMArIQ7JU0/QGlUD+g2KYsB/gVA7rKZN+nL5b86bZz+Rtw7vGhObL1Zl01xHvcYWapQpvN75OT6GMKMys9wyKln14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4308
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_143356_911827_3CD5A8AE 
X-CRM114-Status: UNSURE (   5.90  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, js07.lee@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, March 23, 2020 11:30:44 PM EET Tudor Ambarus wrote:
> > With this patch applied:
> > 
> > # flash_lock -u /dev/mtd1 0 64
> > # cat
> > /sys/devices/platform/soc/20c0000.spi/spi_master/spi0/spi0.0/status_reg
> > 00
> > # flash_lock -l /dev/mtd1 0 1
> > flash_lock: error!: could not lock device: /dev/mtd1
> > 
> > error 22 (Invalid argument)
> 
> I'm wondering what was the reason for the -EINVAL.

Probably because the BP bits would have value zero.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
