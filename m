Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD368C3815B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 11:48:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFFA4206D4
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 11:48:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K6N97HJo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Cohp0hee";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="hRjSL8b6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFFA4206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Oa+sDNHw4u7/Giwj75+41ZxyNehd5O5hyV8WnZE9jw=; b=K6N97HJoiudwqq
	xLDvg6HJ2UeZU0JLdU1JfCNrPum/SVk0y9bFiwBIsN3KqTVxjJ7bpvdTXZS8VegGZHyTMJ1A1wH6M
	dZtXoxqQ9ig+Cn9AQnN6H0oPZaWSjbSNBNLudvAHznmrRbU25XaIw4+Lc4rKusN3hh2h7ZoE344Rm
	DKnFvrQop3hFox4mSZCohCyErX9/c3J3CV9iGZNc7eRCIBiwQHEandOJ2EP9zGlZteHaC8vq9xDpK
	j+oEzmc5wA6t8blgSOPyL3V/IhrZXBlX1NPU4wI/eoQyZRFfo8+A7plSlozKZoK9eUlh0uxtq01zh
	NbnB6u7PYzS6pMiFZJUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQUuh-0002BS-Cs; Mon, 20 Apr 2020 11:48:35 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQUue-0002BB-6g
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 11:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587383312; x=1618919312;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=12mtXm1CwhPXrSe9livA0fnH+JMw/ziO65c0PHZX0xQ=;
 b=Cohp0hee6fiygmjF3722BS/MY1cNUjcOFhgsy8gqH96LYxsMeTmRIrsk
 a00l+KaANqiPTwMFUvPOtmdgpHQ0l9QNGHOp1YwJsNeIoRfpLEiQn7OL8
 uUvKMzaNv/NDAYebWJTKNrI4pva8lLHm/q3wREr1Oy/3loJtq9FjKJzY2
 s3kHwskh/Fb7KAUXA1I1KExgNmEiA9rFD62wpKHlVrmFln/93mjW7UZcG
 4l0A13y0er06u2LAwB6xMqjb+gMcJPk4MiJfSZ/sUS8Z460YvM0wodsvs
 nFBmF2b3LFk3wZ7ItDyxZuDvg+K2pATXo/elVd/RH4mZCyHv9BRSWjfWW w==;
IronPort-SDR: QHBUax5iBt+WZJE18PUN+HZudzHX+HDlMvx6jXpC34H3PLMvSJ4z5fwpHhnr3v1w8ODei89/RD
 awHmnBBePe/VnaO1q/LVuamZZ28OcsOOjqk45LuzUD/0ImA4IDIL05jo691rXgfM7XH0yW0noR
 7aQuiic9F8pg+wpLqZH6sBoZ6QtgbmiG6FA7DfYbyJ+mdumEmL7fijyFtXJ2DMgK4CuOfr5m2B
 w1u48bSYyfcw2xOg7yhYSqRohI4oXSOABpepDi87kPwyHLc0B9O6FduAXE9bHMTw22UV0pnxVH
 D5Q=
X-IronPort-AV: E=Sophos;i="5.72,406,1580799600"; d="scan'208";a="76538874"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2020 04:48:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Apr 2020 04:48:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 20 Apr 2020 04:48:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGcr2mmV/ytxvKNQroe6JwCTU6QCCk1YilMjSdHwHnTdsS13nkBZ8cKwtJaa7DHDrsi5cnJ3elUzaB5bMxeTHaADUEV8xSqCJNmlwvwiCRpacXCe+4NyYaZ1hWjW1xzJDpCnQIEbrBKaDCTJ4AW+tSNr1URRvML91BPE7NCB5i444CcscR3qEY7aGmjtRNPwa5iUv7e+l17quWdtyq7XEJrkD+iRKt7PAkOiC/ZBOFJeS8tHiPm6TjZZnywtoG1Y2TWXgWyp8nP0XVkYzd+rmlaE3JMq+eDkw7Lx9+NS2Lu8AcVyAp7GYjvnX608yoxL6n5o7YTEavX4rbjNozlaAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZERUPpPH9dKbF9PiaNFfiz03knMy7yUKvqyZ/Iacek=;
 b=XQM0wI1EEwdUueOcVhc1CgA/7uVVO5ABtdLULCfOoKU5aYxXo5X+nBXeQ0MeA2SSqrTp4EjCWZPy7eVZ1JT5D0ep8uz9Zx3B2oCYXQ9UlYb8QJ46MR6Ox3+QX6CzsWZrdCfVeAlQAuZQTMa4oMqiStOdjcVUlWmTL8NEmOfs7Oe8aMz4s4cT2m/KCOLfVcmIL0eI3dILdFrzYO9vnk4DhLSxkeCysjbZigRDW81noOZFSKtSmhqIgv55uW7resYxZcw6ueY+z1Pqf9ELtCdMJIq10U6AXNYSrGzk4/TnTfPlogQthUy8hHX+Kjxv+4QbHSygAN5k/KZt7IUQ+Y+jJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZERUPpPH9dKbF9PiaNFfiz03knMy7yUKvqyZ/Iacek=;
 b=hRjSL8b6ZKkPLC+so9/T52FlNDMejSHbZ6mlIeh2E0vt6ggbChBxsvCcoQmraTyiTDBu7fSetvkzbJIVZ96Sa93cbUHIZH/TwTBv1Ce1IfeqrTBXJaT+6e6KWcKczVmiPaHX7xnGB28hbSazRd8dn+MMMESnWBHehSV/z3H5vkM=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4468.namprd11.prod.outlook.com (2603:10b6:a03:1c9::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Mon, 20 Apr
 2020 11:48:26 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2921.027; Mon, 20 Apr 2020
 11:48:26 +0000
From: <Tudor.Ambarus@microchip.com>
To: <kuwano.takahiro@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Enable dual and quad read for s25fl256s0
Thread-Topic: [PATCH] mtd: spi-nor: Enable dual and quad read for s25fl256s0
Thread-Index: AQHWFwmZOAVDCV93B0S2YM0sf4gLnw==
Date: Mon, 20 Apr 2020 11:48:25 +0000
Message-ID: <2327187.pN4NURfQ3z@192.168.0.120>
References: <20200327094434.25924-1-Takahiro.Kuwano@cypress.com>
In-Reply-To: <20200327094434.25924-1-Takahiro.Kuwano@cypress.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38b20457-ff0a-4c57-4430-08d7e520bc8c
x-ms-traffictypediagnostic: BY5PR11MB4468:
x-microsoft-antispam-prvs: <BY5PR11MB44682305F2579E3DBA3D1E93F0D40@BY5PR11MB4468.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:486;
x-forefront-prvs: 03793408BA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:OSPM;
 SFTY:;
 SFS:(10009020)(366004)(396003)(136003)(346002)(39860400002)(376002)(8676002)(81156014)(8936002)(86362001)(316002)(478600001)(6506007)(53546011)(71200400001)(186003)(26005)(9686003)(6512007)(66556008)(66446008)(66476007)(64756008)(91956017)(76116006)(5660300002)(4326008)(2906002)(6486002)(4744005)(6916009)(14286002)(66946007)(54906003)(39026012)(138113003);
 DIR:OUT; SFP:1501; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Prx7PLKQKWy/NDpUyjyDryEwWbuTj+LRESxQ0vw9hO/07abN9YWovG16l1E9ZmMPOVUcsKSr6/GqqaNVHnGmpsd2MBGnjTGw4njkXQCSW8xLGklajBeRUVkIjh3dNq4V4YqJOHfCetO1+YUhohkRhbLR2WX3S4RkIQc57Pe6hBP0dvKF5oSoeeCciSEN/TawzMKZvQ8Le9Tz6L+tLU3PRBHk+ib8AXRmCWgrGhxuIaka4M4S/CMHoNm7huLuqdMcnfB1QO7AEImSIdBfhOP6tegzZM+7t8qPbGNh9yPS84UxWHUfyALfuYA9gPP698XYbWb35uXFWhMzOFDIZsZVUA+D/+y4weJSQQPe+emYFY876KeOBM+4eTn3AARJMgNKbFRDbRiPCFidy8EJsxTTBorWcT4bB5YUbtD1O7TDOxPh49ni8W4whVue/BfOdBEq5I6npZt2rKGNBQeuVj9xYUx0jrB2PSb4T3q6hn7r+ecoPtZ9uhRhMHod+wPp3iwOHJxY2Mgq85yIeUx+Wit6zG6rQCm5ZmCMVNTcd2CAXjaX34PM/+Klm8l0xQbPwHKU17eBxcD1ikXC+miuPXY6sFbWT4wCC+sxbOHN2z3DsFmI16XtEbpJF0LkKaTu1Ii1qoCNi5vJBhDQQxGn7DCXl5iir2c8KBCF5sf7cWLNtVi06UiXaQei7EC77HcdWoFhhjqU6+B8f10iEKVJzLc683tU79viOBfBaJ/dEskiTDIeYTBb3pRX98e0AVsw7y+Qu3XU328ipJcZwJYYm/6ej7hRZDlZLypHko4Ty0ItXJo=
x-ms-exchange-antispam-messagedata: qRlgEQvn1MQHQy5Va7gt95caKKcSTrcbeWbUc6mLtvi24Z14wPKqKCNx/u9/SX0hVMrifNSjVwhXDKZGofIFEyQeMiL9gzuWONm5ZvqEpnYsr+GgvSOFA8h8PgdYbpS0Gj6oXd2BhYbpZ6CdVlI4aQ==
x-ms-exchange-transport-forked: True
Content-ID: <7CC003CA56D819438474886CF019B0D8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b20457-ff0a-4c57-4430-08d7e520bc8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2020 11:48:25.9648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N7KQNzeMnuvMaZRPRNBsdm2LMJ5S0Js6Akejv0NpF+7UB+JK5GAWmkSw3E+6WET0BCm7EulCWwWXcHMoO1tOONecESZ4WXIxwcWe92DJXeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_044832_355380_07CA6BB5 
X-CRM114-Status: UNSURE (   8.28  )
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
Cc: vigneshr@ti.com, richard@nod.at, Takahiro.Kuwano@cypress.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Bacem.Daassi@cypress.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Friday, March 27, 2020 11:44:34 AM EEST kuwano.takahiro@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@cypress.com>
> 
> The s25fl256s0 supports dual and quad read like s25fl256s1.
> Enable it by adding SPI_NOR_DUAL_READ and SPI_NOR_QUAD_READ
> flags to the flash_info entry. Tested with the device and
> confirmed that is working.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@cypress.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Rebased and applied, thanks.
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
