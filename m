Return-Path: <SRS0=sguX=LZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C9FC11F64
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jul 2021 05:27:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7145061419
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jul 2021 05:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7145061419
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuA0TURqUjXaMeFs3Udynl6FbYW3kBTCRzC+ohMgitU=; b=HJjLmTo0XknYsk
	QT0NyR+5bf7lW8sGlYF1SmaWtDE1LSKxdxOUOw0JmD2YVATwfp5bSl01jOt/rjYwyeaEAvAFSHGso
	brI4r2hkZUKSwtOqMZspt1zMZEBe5nONDjAx9miU4Ayvf1r5KX1vMCj+DnpDOKgkdxO4xgMEqGLHh
	bYikuYfkFzaqRpUmAoKiARjqLqqlgMvfg3Og2U5KFlUuldnreob0RA4gV5YaX5rtj//k6sLKjRVbl
	8inr+8rxzWqjFP6s8ZDm98sOoERoqxozDmkrHIy4Qg/q1W6WylMilA1ZvEWym4AxkyvGkmu1NUB2G
	/VXnY2ZPne5BvBLwjmNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lypDA-00G8u3-49; Thu, 01 Jul 2021 05:26:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lypD2-00G8t2-ER
 for linux-mtd@lists.infradead.org; Thu, 01 Jul 2021 05:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625117156; x=1656653156;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0em5fEjrQkoVIF5DhNlq+Gw7kzOqERAuseGi3qTIiZU=;
 b=NjOg2tIhAUjTY321ENrltdwnbI88GOhNd4TeRFDZPo34SXoBflEzkN4+
 kuyBfta8okLRCS6NCZfOkHs2mOZ8Lv40JXDCfbJLvSmA8P0YpYxv7Mc+8
 8dJzpQFGtNYm6QOEvac9uhu9Dv8ZIz3oxAAlvzY928//QI96AP+6KQlul
 GtXBRjNcXV5Iamb06tnZm6FeYjbzrrdwfYILn3vId1VtSTDsJdcL5KJty
 gXVNha9uxdeOUGBGbyNkJgkNnPFois2YrV2mI8RZSE8V+a1aA3ASE2Ja4
 5zk66YFDel9i3YfN4zPqXnmvPvCtj43w36anlU4u0eNifWWGiQkwiasRs A==;
IronPort-SDR: qCdAXDpi5npuvd2Oa2qK9XtdUX+yAilKlgtaI16PmYnFYM2sYRmwDlUBzBBDxc/LyxOwsZ6FoR
 N1IVhCrZL3lyErM6OqKZwTndFYV6EEh+N6oBJCDlC1nWED+rVWapkY1sKKkb5rG4R7UuEIkppG
 26Xc2Gmo/86e5tbnegSNe+Pv1f1K2Dh8w/soo8V6xDMuojdcbRsffEDuuF5KyRtx0hCCMAHc0L
 ipQk1rpiLsyVDorR4RjxI3AdMVfNasH/FgbJQmAMXxYy8p1Fxqyys+NXqhqOnBNepccTy/ArD9
 Mrw=
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; d="scan'208";a="127291014"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Jun 2021 22:25:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 30 Jun 2021 22:25:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Wed, 30 Jun 2021 22:25:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ix/gFnNuNef3NMoo5Hp7yYnh3ZeXvZ5xu0lZeR4Vdm3cJHUJ0b/2mGnLw06YTxJ7FsN4TMYjTVmzBCbVqQP+6duLd1cjr3Pj3p7meJKNSDg0jJkw/g2vPCR/VvxKxA5LsPCFVLlykLQWKdQhbynnFfKzJWOxIvS8AfeHQNA5cLkxLQbDHINLXwWB2NRv8itUHZWy7tug/kbgA2uxxz4q32HIYxNnETkMtDr5WpmtOSMLO84XAiDizvDGnFLNmOPS+csku+9QZXMszZLZd70uuFvNTY1vZM+P8TYtUbrJkEVJUFmoKLdK0xC6c9Sft+UZMF2/nI2BqJf8YbxczqHMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0em5fEjrQkoVIF5DhNlq+Gw7kzOqERAuseGi3qTIiZU=;
 b=TZlj/W8L05qH0TTZVzzKk7Ac/VWPJB6yHxbgvIT5E/pw/dRFX7uw4YIDopszgv3kfXn9cS//z04c3vr+KPAN1RO2rv/8xeUth0CkdUgC06Asqu87P6EkA0xUaJIeVriOEWax3SDKXy/1Gh95wM15FsgVDELdmx9iBIK4fXcjJRa3OCq5Dq5HfValnML40LSxk9gAmDC0lKB7k+3BiLKNyCmlH+aKYBeLRoAnct1AyWGBI9xWM1hhCSDJehRQOB+DpF316dxVTHnF6ZPxtOMawYJbsb8anlZpsoUHCnCpUqYw3zdEW/yeSmkYMXrsdZCd2qDoc3DF3ecsi+J8WsJqMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0em5fEjrQkoVIF5DhNlq+Gw7kzOqERAuseGi3qTIiZU=;
 b=X3LDrm3HnFtclz/0zn1arMa4ufbbHzOY0VV3yL5jeqk8Qidlwun7r/U4C5EN87KetA3z7s7tsshNFDXGQrlbKbqSfib/s56KF159rUv+RWkUFLtbDk3OPENpeCNeBJdOhBAk++Eq3TnKBljF8lUiH6mZzwm0Mk1sCU7NeYZgE+A=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by PH0PR11MB4823.namprd11.prod.outlook.com (2603:10b6:510:43::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 05:25:52 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4%9]) with mapi id 15.20.4264.028; Thu, 1 Jul 2021
 05:25:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
CC: <code@reto-schneider.ch>, <linux-mtd@lists.infradead.org>, <sr@denx.de>,
 <reto.schneider@husqvarnagroup.com>, <miquel.raynal@bootlin.com>,
 <p.yadav@ti.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] mtd: spi-nor: Add support for XM25QH64C
Thread-Topic: [PATCH v1] mtd: spi-nor: Add support for XM25QH64C
Thread-Index: AQHXa9nZhBHIVrQioUm7jO1Sivr3QKstm2iA
Date: Thu, 1 Jul 2021 05:25:51 +0000
Message-ID: <45e174c5-fd9f-912d-4315-d6efdb8d7cac@microchip.com>
References: <20210613121248.1529292-1-code@reto-schneider.ch>
 <1ba367f93650cb65122acd32fb4a4159@walle.cc>
 <0328347c-572d-b636-5542-99cb36e9efa9@microchip.com>
 <064317e561f1ad20282efe778f633723@walle.cc>
 <a5877032-ab30-a85d-cd42-93b75a84ab49@microchip.com>
In-Reply-To: <a5877032-ab30-a85d-cd42-93b75a84ab49@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50c86359-7c7a-44a7-e37c-08d93c50b159
x-ms-traffictypediagnostic: PH0PR11MB4823:
x-microsoft-antispam-prvs: <PH0PR11MB4823C0737ADBE1566ECB7EE3F0009@PH0PR11MB4823.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mqa78fLtNCcX4M5O0hsd2FoWDR2TIx1AbcyCwt8vvYsqkptq6HESNNj5INYmB5RGMvpIxFbW3cW1E7JGpL6+5flUcgyPohKyBt+qqDm6pY9TePGdjtppbMG5I0rGyd33wtKm+dq+/8+QJNbtXzKvbCTp/GV8lWM3snZvZJrGeyoCcTG76t5nbeJE/TEuOtQ1Q0i5OdcY38yLKlvqi3MEpjcNA6e5T3VOc+Bskhu8/3uCgrpWSMPe80vgnQpDJY+QE5zyvAhD1d/nO6FovzkXUzYu3ZhHaNYkETDpBNJZCiyLtdOquU40ZWoJrbGcyT+p4T4EQQscygw0dW9Hu5B12EFKbAC/dwTMFzhqxBfkBZqSDnAQkLLZSQGAhVMJWHN2EKSKveZe/RcmJ0zSSOV0VoC4J6jte6pO13INcIH6RkRGDH/SlZdo5yl8t9hVUG7at0gse25wFurGRmagkaYR4ToDepdY2tDwRteiDUCfFHIUE8ydeDrDC4RxGCqH2ApwyOhLv86SLcF1O5nmgrT6Oegx3NVrTmXdT48rh0LUfucxdhaK9CQmyP0BAiAlmesizyxD4jybdk8U7KN9txKYoAugT79QQ4pbbc6aOm/Tdqcu6j8RitFp7nuotF3GkBmoW4diAsb+VUDNduXx0UCBcX+V0qQNIwbI3LvU6z0q7X9RvpqUZ6lb8kGk5wAKOESo+wkb4FNLcnVSQ82QLmbMar/TWrMYou79C+0BgsTN/a9CnsqvvxZY++jL4IV4YUvk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(31686004)(6916009)(6512007)(66946007)(8676002)(64756008)(83380400001)(66476007)(91956017)(8936002)(66446008)(66556008)(76116006)(31696002)(316002)(186003)(2906002)(2616005)(7416002)(54906003)(5660300002)(4326008)(26005)(53546011)(86362001)(4744005)(38100700002)(36756003)(478600001)(71200400001)(6486002)(122000001)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3Q1NUhlTjRyWkdKQTJFUTRzVnp0MSthSmxMQ05URytISkx4aUdndE5VZHIz?=
 =?utf-8?B?Unc0NUQ4b2c4OVNodnE5UmRmSjRvZ01TeGh3TkVieHdsNWdDeEZ2aFFyMHZY?=
 =?utf-8?B?amdPQ0dNbzdvRnFwQXBHU2NCZXZHLzJuKzN1TVNaYnVSQmlYL1h1SG9HS3Bm?=
 =?utf-8?B?NmRlbHRzR0tBZmlqSjNnYUExWThsN1l0Z0k2OVN2TFJjMTVhaGtzelJxdnUv?=
 =?utf-8?B?MTFkQW9HVnpEczJCazhDaVpGcVN2SjhnZGFYekZzbEN6UnBhVEs0Rmd1REZR?=
 =?utf-8?B?UFFPVERLbHhlSE1WcytPazhNWm5zVWYyb2k3b0J6cmtlYlpEMjVLOUorREIr?=
 =?utf-8?B?WGdua3BUeWd3V29BcTZXdEJvQlNXc0FCSGRjeHBNSE81aWdmQStjbVR5SnBx?=
 =?utf-8?B?eVYxa0l6dVhRSDE0a3NnaWZPK1kyZi9oNks5VjZiYmZNamhSYkJ1M1BzamQ1?=
 =?utf-8?B?ZmhaaDhzS0hqbll5QlY1YkR6V0RuV3ZzZTRvTDRGbnRxZnhkcTM1NFBGQWhV?=
 =?utf-8?B?WXkwVG1TWmd2WFA3SU1yZXNXdHdnc1RwTjR1MVFTTi82d3ZrTityRW5NNGJy?=
 =?utf-8?B?dGQ3bUhmTllpZmNRRHl0YU93d04rRkhuL1BGRHVqY3V1eENzbVlZbDFPSnlJ?=
 =?utf-8?B?dmM4akJheXk3Z2JVL3JhaVRZZ0ZaM1RXZ3J5ZVdWc0UweUpCaitKM1paL3RE?=
 =?utf-8?B?KytsY2RoUU1vK0VaVDNSNFIrWVoyQ1FiSU53aFYzMmFzVkpkdHRlSjhCemor?=
 =?utf-8?B?eG0zQXlIRXZKTG5hYndOTFdZYnhvQlJmMVpOc1VDS0Z1ZFE1TEpVSG1KU0Zn?=
 =?utf-8?B?T3FnYXI5QUF1UHg1enBVQkpwdDI3MUE2QndRQnRna0R6SXZUMERhU2ZjUzUv?=
 =?utf-8?B?M1o2eHBTRTdZVFVVdi9GTUMzQUcxWTZINHA1ZjlqR1IzSjJyUUxzY2c1NHdG?=
 =?utf-8?B?RUdKZE1vcDFFbEQrRjM5UVJUY2xwNmZ4WTVaQ1orOHhGMXdYa0dCd2NDMXBV?=
 =?utf-8?B?amtnSTRMNlBKbDgwcnd1aVRrQ2tqTU5MRXhyQzdFcXpqZk1ZRGtBcjFWNnlQ?=
 =?utf-8?B?VnZqdXhnbTJCcngwMDZ4MDlobW9yQ2dhcGFIT0FjQ1RtSzBnQ0tFd1d0RVRj?=
 =?utf-8?B?ZWxxaGNYR2Rad3pnMUswWTZ5VnFqNjBleWhMbjJlMVA2OVoxQnp0SlhKNHZo?=
 =?utf-8?B?K1hLd1N3UFd0eWh6UWl6OGhIcDVreGJtbnZvckxHWFhxVUZSa0VnbGxGaEV5?=
 =?utf-8?B?aUxzMnpsZlRDOWV3Z3VMc3F2T3pzeTFFKy9za0o4QkJoYmtNR1d6KzRSQ1Iy?=
 =?utf-8?B?TlAwVCtTYXI0QjRlOHlTZE1LRGp0NXFwMkxpUjFRUjhyU2hCNDdVeW9wMXRo?=
 =?utf-8?B?cnhlTTNQRnhudmp2bVdPekllZnN1MnZ4RGRSdVpscms2MnZscVZzc0RGdEJn?=
 =?utf-8?B?VUJMcmpqUVVUQm0rNnBONFp2Si9PcDl0R2ZVa1lyL1ZlblBoSkFnT2d5UWk4?=
 =?utf-8?B?UnZjTWVOMWxram1JdUN3OWVFeWlzOEk4WWpVek1ONVYvU3J2ZitnaWJpR3FI?=
 =?utf-8?B?VUhIUlp1K2plTmdjQklRYnNYd0hxZmFLMnQzQUVaOHRiMmVOMy8xaWVWd3Zv?=
 =?utf-8?B?aXFEQ3o3eFRhSjRSRStNU0lhcEplT29qb2tPSzRkRUhZcDV4dlZJNVFLRWFO?=
 =?utf-8?B?UHQrT0dSWEFETFVndWZKS2F6ME11a2MyVjlqeDBDcmlRNHRXRDB1Y01OZUha?=
 =?utf-8?Q?va6luC+LkoHv3XQCGA=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <BF607FB09FB41844AD5AA952F07B063C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c86359-7c7a-44a7-e37c-08d93c50b159
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 05:25:51.9198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1olSCQWqQxl9a/sGLplKm3oF1nYIlU2oUWCZCHaMb2LtCVeWggK8fji1a3MxTnO6Rg5fIx+9Hdy8EkOhDfS0ePqC/LGrOg44Rf/D3Kg2oy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4823
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_222556_610155_EAA4D0EB 
X-CRM114-Status: GOOD (  14.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On 6/30/21 9:28 PM, Tudor.Ambarus@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 6/30/21 5:15 PM, Michael Walle wrote:
>>>
>>> Can the SFDP dump fit in the commit message when introducing a new
>>> flash ID?
>>
>> As ASCII hex dump? I'd guess we need some instructions how to do
>> that. 4k would be 256 lines with 16 byte per line.
>>
>> But yes, I had the same thought.
> 
> How about asking for the SFDP data in the cover later each time a

s/later/letter

> new flash addition is proposed?
Vendors shouldn't complain if we publish the SFDP data, since it can be freely read
from their flash products. I'll update the documentation and add this requirement for
new flash additions.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
