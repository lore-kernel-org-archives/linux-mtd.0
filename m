Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65F9C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 11:24:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 536E864F6D
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 11:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 536E864F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b9da2Jw9EblRD+z3PguNx9R0yMptOW6mQy60vbrJIRM=; b=RRPqxmHa1OMQGIdzuG8/rW+lh
	7zehNSvMHlXwdS0RxhzCg79TmdUeVnElUy+Wc3eM28KBJYFaHOht3zmondMcp9Ji+3WUlQreaGaT0
	LiVG3B5m/70w3gF5Qt8v+huivO9yqxUEUZqZ+BT1xYNACWLIPR2W/4HHETC782xNQm7IctM6N2nJl
	PAQsFwhp0FxBYcaAfsLBZJcRALe3OrYPUR4cU8NWZ63nJ5UlydrqJ+8HMI/sezO+lYiG2ZotQ07V6
	UvBpBEJbf1BhfAh2HIWizaQcpcdWsbqgASEmvjgt/yDHbsmiPN5luzEWejJyEnWkJZAv1Zh4HYWiU
	oWW7dCCbw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKftr-00BHzJ-Q3; Fri, 12 Mar 2021 11:24:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKfta-00BHws-QQ; Fri, 12 Mar 2021 11:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615548236; x=1647084236;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xCf6jAM0/8fNBQEybe1HPVg0B1BmtiMucJMgIUR8TfI=;
 b=uIIbAhsQuFPK6KqTNbD0dYbbp2u0fMd5tx/qUraAPe2eWC8ncqFeZwT6
 0cf0Vp6A55JHk/XIPu7W0ORgqqOlqRDrsJTKuV0GWTRhqliLiZGnIbiO/
 VuDvdKFJGm1EWtGpGdmsUHKwB3o3Cy/ZZ0PUajVaE5IehuomvEJPSo8aW
 4SDsklS6bElEpReb7DvAHOtUMo8uPSdM0TJqneVXDePs8bPA8Z4K6EVZW
 Gps/Sbi7xexwSdipPi/NAVzixYj1t513qI8MolojF8PSUYLxNBYRvAyRf
 I/9W+4PNcYnNzeRvFsz+fMdhV4iUp8RpIAtxivrVAECYXTqL7t58N0nMg Q==;
IronPort-SDR: f39UmCMJ8KNR9KhpGf6zhE+MbzEFZI0xFo7PUutazt36l5gW6shqc5m00bmdPnE9KNi/aWOhuR
 wDasVS/o8/fYn+0lR/o/008jWPJKWGfT7UqUr+GRhorcl1NUgTdyIHZlovjRpvhUTZVKiVAmol
 I0mdtPIbKF9axM1DXTTf1c9SeSDLxP18gb+9GAYmnGrBmwupBxQWN5IESZpmGwIOeJSqeWt995
 2rjbxgQDA6n0h9R+TUxJ0D3g5NRahvdsIkKjQwIYQwZiJBJsfYsCTk8DnSg7q31Fs0t/GPz4g7
 /k4=
X-IronPort-AV: E=Sophos;i="5.81,243,1610434800"; d="scan'208";a="109745296"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Mar 2021 04:23:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 12 Mar 2021 04:23:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Fri, 12 Mar 2021 04:23:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klcxhTYpa+WODg5Xuu8EKI6f35SrH1kNRdYxdmG1ah5C+dFq+b2x9b0m+Joap9DaxL+2QNKWPxKXtUwpefHedHVbvKCaNCHVfFa0lQz3TzcA3NncXXfRijvXbf3+lY0Ob+ZbY0DXVXpsjOCR0LSgAD2HNbA2DMICzFvCbwLe3OXJTTlERmnJIbasRCEF3SuLbK9CgHWr5jnA9zjLP/wWNrOVSpS1lkgaDlasAGlXTRf1ycan7qACPQ3lrfixgimoo3VE06LJNjjCRbbhW7BG5RYQUYY8mK3Fj8w29r/MNPyVICEUHhEMRBCilWOf4OD1LP1fDkCo8w6pzz2YRtresA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCf6jAM0/8fNBQEybe1HPVg0B1BmtiMucJMgIUR8TfI=;
 b=GWYmTDTz9MeUrnwJwI6QC2WA6KzF6E18gJc6hCEcgZFiIBmTQ2SYr9lXH5Uqb+cEkHym2oc7d5Tu2Yg3zr86M2Is8EV58oDOtN+Bvk4LPYqIKi+M+4vfM9Uw0w4Mm67o3atItcfIY4/Ac/yuaWHOKCnIALLB1n1F7SFM260R2hlB1yVW8m0m0COoDthSOZqscU6uw2Cqgup/Qa4w67DTrW8dCerTUYRt+5ftAX7s6c2vczkd104Kf8yLjBXILbDlxuV0tfld3ND6e5THCniGiRM2y4Fp9iXFQ0/oAS3oYeAxcb4lwriQOTLRH6fdHCFrYSWlqx3dU34G2fjfrRUpOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCf6jAM0/8fNBQEybe1HPVg0B1BmtiMucJMgIUR8TfI=;
 b=mJ33kwCn0SOxKxX543zqBK8v2oXWtGWVYFwl7RZQIkb0/epaQnTri94f4N9vZJ5mSkjT3hNv0MkfSVos1BojQSunw0H4nJFQObKoMEWUkyGl7USM8IZe8/De8wz/+C/YLK6ab1K9aBGSzcpXAMymOK2+6s3f+ctaaC9z4Oo3ZqY=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4891.namprd11.prod.outlook.com (2603:10b6:806:11e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 11:23:48 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 11:23:48 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <nm@ti.com>, <kristo@kernel.org>, <robh+dt@kernel.org>,
 <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <lokeshvutla@ti.com>
Subject: Re: [RFC PATCH 0/6] spi: Add OSPI PHY calibration support for
 spi-cadence-quadspi
Thread-Topic: [RFC PATCH 0/6] spi: Add OSPI PHY calibration support for
 spi-cadence-quadspi
Thread-Index: AQHXFx9voVlY5U/87kSEhShnaEXyTw==
Date: Fri, 12 Mar 2021 11:23:48 +0000
Message-ID: <25a72752-097e-5669-7087-1cf6da38b3ba@microchip.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <9c551f56-4c00-b41a-f051-8b7e197fbcdc@microchip.com>
 <20210312101036.jfz2733ssv4nhfey@ti.com>
In-Reply-To: <20210312101036.jfz2733ssv4nhfey@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d53c1e2d-cb34-4184-ba1e-08d8e5494e53
x-ms-traffictypediagnostic: SA2PR11MB4891:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB4891E472960EA53C239A2398F06F9@SA2PR11MB4891.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gwjs1z3tkVP7hB2r0XFYytTIo4dIAwU9XTgeFTXmizSCNHB6LdsXVMZoYJt0KpXXAyDyHxdDZ1lV9wFJe22I0sUZ9LImh0lpYNZ0csxwJLRqeOKwt4chXZr/LpuPNja+pYloj+DCf/sD0boSkPXPZHwyXXqI0tFsSELrHft3fY8pzAWvsV+y49H4zMIZWoy84/6v8KcbUWOiRnlBXXWtU9xdOkj9LkhJGvWnRkve3Klp+2EKkt6ys6t8YG+klmJBhquNHZs0GyFg72b33uZXaHfX+2M3tNxD9UEedV/Ox4KADROP5T8USvPwCFCGtIjbb2VCiROMN0b4xrxbvlT8q+snE/cRLC56R3HkO6P8xqEW2KlxhXt2eWBGp2f8l8sAsCe59RvmOYBvnjgciVKmY68zzqIzyHjASnSIdANZoLO4uodxRdClmAcDY/dUHEw+Hr/WL/6R5IxgjSvZzcgb5SbiVSw3k5QJnZAN+hgeYZa8xcp0dN6xrpN64akmz7hqRy0mK6c59ZKC3pVzCeGGc/eMt5z9eXpGChhgF3KkQhkKkwnWKsvf/wps5C6s1aeirrd9GvQO6LqBZHa1aHpOPI75BVSKM2LnsYp44ohVhjtjblZIP+hBbAspsT3B/kQOLOrUpRIICB98EWB2q77/dgdWsgcK1vCZlWl4dS55OsBWTESioepaA8tOsQbWRDJ7htpfRuJmV6ZCCwKLbwDTppy/YdLWNBMO6dkdfIXTTkA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(136003)(396003)(346002)(366004)(376002)(5660300002)(66476007)(66556008)(66446008)(66946007)(6486002)(4326008)(83380400001)(53546011)(6506007)(64756008)(8936002)(76116006)(91956017)(7416002)(71200400001)(8676002)(26005)(966005)(86362001)(6916009)(186003)(36756003)(54906003)(478600001)(31696002)(6512007)(2616005)(316002)(31686004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cURrT1dRRWIwbGpUZGRqWjlqYWhSdldNSHZBeWJlZGMvZVBjdmlvTkxBdHUx?=
 =?utf-8?B?NGpwbXpHUGFzM1JYT1FLVEFHdFhTbGhsT0hsMmEzdkErQjhXOVBHSVNxZTFq?=
 =?utf-8?B?Z2lLY2ltNktOSXh3dG5sQm83TWdVQzhQR0lYcUdETC9rOTdDOFBXdC9NcVZQ?=
 =?utf-8?B?SE82Zkk2Mm45VnRDWXFYVkpndEFiTjRJaUpuK0YybkVvejdyc2loYjRrWlls?=
 =?utf-8?B?WlMxZGRvZVBrMmhtWERUcFZpbXRaSG12N1FNWWtPckdybG9vWkQ2UlVLQ0RV?=
 =?utf-8?B?cGZ0YS9lRklZZHJqeFVtbFkyaktJaUx4Tm9yRGpjVTFFWUN1WllyR25BS3gz?=
 =?utf-8?B?QmttMkdmanFIUHByYlBuOXhxcGpzODBHUjNYTFNFQVdaaXlMenI5YzlCSjY3?=
 =?utf-8?B?ckZuNytqaUpDUExVSU5hQXhTWG41WmVySjM2aVpHWmVOMlNxNUl5R1RzZ0cr?=
 =?utf-8?B?T3RGRTdNS1BmSXFLRXFXMTdzZHBUS0hSQXhHWC85TDkxQ3lIRjFrNTROQi80?=
 =?utf-8?B?QWg5SXBiRTNtMS9rdFpyeDVGREZZOSsraE9tRStxT0ltUkF3S1RFc29WbHZu?=
 =?utf-8?B?Sk9zV013VDZ4MXd5TzRmcVJNOCs0TnljaUdVZDVMbkRtV3hJNUo1K0lVT2k0?=
 =?utf-8?B?TVpNOW5zNTBUbW80M3NCMDZFR1hGZEdaVmxFY1Z6SDAySkNSQU14SnU2cDR0?=
 =?utf-8?B?NCtsOUtscWFFenBaL1VMb2NvYWh5K2FIaU1JUE1ZQnY3NmY5cENOM1ZXSWdt?=
 =?utf-8?B?RGwxNVNqNUxFcTF6WXRDNEFhTmt0V2JGNHczZDlra1FYcEJ1VnlubENmSUlo?=
 =?utf-8?B?ZStvejN4Q2ZEVks0aEdBQzA5QWxxQjhUbURaemFicVZpMGZWdGhyUFc2MUN3?=
 =?utf-8?B?U1doT1BodW03clhoQVJWSHhDckc3UW1DdEwxbmFhVFJUTk5JMUYwRWdSN0V0?=
 =?utf-8?B?TkxjQU9YS0ZyUEpxZUpEbWNtTEVXemk5dHV3c2VocmcxOVpGcTEwWnRab296?=
 =?utf-8?B?bzNENWIxbHhKNGM2dndSK0lpSE1pK1BBRU90ZXVaMEEwVHpJY1IxMFk2ekRp?=
 =?utf-8?B?eVI5RjBRVVF4UDYwZnJ6b2tmK0dzcnp3ZnBRVFVjcDZueXpudVZ3YmVHVXVn?=
 =?utf-8?B?UXEybEtGUzFyY08vYXlmU2JKRW5GeE0yejNLTmQ5cDd0SkVmMXZyR28xaG9X?=
 =?utf-8?B?OGlraURmdUdjdU1pSlIzL2FQVnlyY0ZIU0Rqdk5CY254WURoZlVwcUtJRHgz?=
 =?utf-8?B?TlVKYll6M0NRQ0NONFNwSHAyQTRma2dDSXJUMG1acjNGeHlRdFlSaHlGQVZt?=
 =?utf-8?B?VG9YNUEvY3pTZkxKZ0lLa2twNm9kYWU1ZFdReUxtYzE1YitRMVhidHI3U29R?=
 =?utf-8?B?Z3daQXNpbDNrOHlQa1U5cCszQW1OTStMSjE0Z3U4SUpnNWwzRExWS1UycGNJ?=
 =?utf-8?B?dWNlM28xTmVDM1NYN0xaZnFOSThXc2NSQ0VSZFRZTU1nR24vdnFsQ0RRbXJp?=
 =?utf-8?B?MnJOcmJSN2dLZmFkV1llQVNPcExwQ1RXOEhQRmZFZVBnWktpUDkzTENNR21j?=
 =?utf-8?B?MDR5Mk42dGcwdWMzaTlBMmhvZXlXRGtsdjhMRWlZaGxPbm15cU9ERlpQTWNP?=
 =?utf-8?B?RkFYNlJYOXByK2o2TTRaWVF6NnhOWGlnVzR2ZWFNNy84eW85blMwZWxya2pa?=
 =?utf-8?B?TWIvNTBRcTY3djVFbFBTSTgvQ2ZhcG8rU2N2SDVYVUVJbVJ1TmJ1SlZuNnFU?=
 =?utf-8?Q?zUyrqai7QJjtfJrLgE=3D?=
Content-ID: <A96FC37D69134A4FB4EF6608255BD87C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d53c1e2d-cb34-4184-ba1e-08d8e5494e53
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 11:23:48.1751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rtn6gGsupmn4pRzVmvOX8Ih15oGibCaRAUtTqNXjqLcAF5Pf/PmEVnNWf8LPNfZ4LGgyYNrRxU3dhZsKfR+K5SgG19h6hDO8SJ9UU+yYBTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4891
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_112355_753655_600CBBC0 
X-CRM114-Status: GOOD (  32.95  )
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

On 3/12/21 12:10 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 12/03/21 09:09AM, Tudor.Ambarus@microchip.com wrote:
>> On 3/11/21 9:12 PM, Pratyush Yadav wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Hi,
>>>
>>> This series adds support for OSPI PHY calibration on the Cadence OSPI
>>> controller. This calibration procedure is needed to allow high clock
>>> speeds in 8D-8D-8D mode. The procedure reads some pre-determined pattern
>>> data from the flash and runs a sequence of test reads to find out the
>>> optimal delays for high speed transfer. More details on the calibration
>>> procedure in patch 5/6.
>>
>> Can the calibration sequence be avoided if the controller is informed
>> about the frequency on which the flash operates?

s/frequency/maximum supported frequency by the flash

> 
> Maybe I don't understand this correctly, but there should not be any
> frequency on which the flash operates. The controller drives the SPI
> clock so the frequency is decided by the controller. Sure, there is a
> max supported frequency for the flash but the controller can run it
> slower than that if it wishes. The flash has no say in that.
> 
> Anyway, the exact frequency at which the flash is running is not it is
> looking for. More details below.

I thought about choosing at the controller side:
min(max_frequency_controller, max_frequency_flash)

And there is also the need of changing the frequency on which an op
runs, like the READ SFDP cmd, for which it is recommended to be run at
50 MHz, but maybe this is another topic, let's see.

> 
>>
>> Can you add more details about the optimal delays? Are we talking about
>> flash's AC characteristics? Is the calibration still needed if the upper
>> layer informs the QSPI controller about the needed delays?
> 
> There is usually a delay from when the flash drives the data line (IOW,
> puts a data bit on it) and when the signal reaches the controller. This
> delay can vary by the flash, board, silicon characteristics,
> temperature, etc.

I wonder whether the delay advertised by the flash matters the most, while
all the other are negligible.
When I talk about delay, I'm thinking for example at the delay required
between two consecutive transfers without removing the chip select, or about
the minimum delay needed between the activation or the deactivation of the
chip select. These are all described by the flash. Does your controller have
such fields in its registers, to set such delays? If yes, is the calibration 
sequence still needed if all the delays are set correctly?

When I hear about "board delays", I think about the impedance of the lines,
which should correspond to the impedance of the Flash's IOs (which depends on
the frequency on which the flash runs). A mechanism to choose the best
frequency and impedance level can be added.

Flashes have an interval of temperature on which they are guaranteed to
work (I would expect in the same conditions). Information about temperature
ranges and associated delays (if measured?) can be passed too.

Cheers,
ta
> 
> At lower speeds (25 MHz for example) this delay is not a problem because
> the clock period is longer so there is much more time to sample the data
> line. It is very likely the controller will sample at a time when the
> data line is valid. At high speeds (166 MHz for example), especially in
> DDR mode, this delay starts to play a larger role because the time to
> sample the data line is much smaller. Now unless the delay is accounted
> for, it is possible that the controller samples the data line too late
> or too early and sees invalid data.
> 
> These delays depend on physical characteristics so it is not possible
> for any upper layer to inform the controller about it. How will they
> even know what the required delay is?
> 
> In summary, no, there is no way an upper layer can inform the controller
> about this delay.
> 
>>
>> Cheers,
>> ta
>>
>>>
>>> The main problem here is telling the controller where to find the
>>> pattern and how to read it. This RFC uses nvmem cells which point to a
>>> fixed partition containing the data to do the reads. It depends on [0]
>>> and [1].
>>>
>>> The obvious problem with this is it won't work when the partitions are
>>> defined via command line. I don't see any good way to add nvmem cells to
>>> command line partitions. I would like some help or ideas here. We don't
>>> necessarily have to use nvmem either. Any way that can cleanly and
>>> consistently let the controller find out where the pattern is stored is
>>> good.
>>>
>>> The dts patch depends on [2].
>>>
>>> Tested on TI's J721E EVM.
>>>
>>> [0] https://patchwork.ozlabs.org/project/linux-mtd/patch/20210302190012.1255-1-zajec5@gmail.com/
>>> [1] https://patchwork.ozlabs.org/project/linux-mtd/patch/20210308011853.19360-1-ansuelsmth@gmail.com/
>>> [2] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210305153926.3479-2-p.yadav@ti.com/
>>>
>>> Pratyush Yadav (6):
>>>   spi: spi-mem: Tell controller when device is ready for calibration
>>>   mtd: spi-nor: core: consolidate read op creation
>>>   mtd: spi-nor: core: run calibration when initialization is done
>>>   spi: cadence-qspi: Use PHY for DAC reads if possible
>>>   spi: cadence-qspi: Tune PHY to allow running at higher frequencies
>>>   arm64: dts: ti: k3-j721e-som-p0: Enable PHY calibration
>>>
>>>  arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi |  55 ++
>>>  drivers/mtd/spi-nor/core.c                  |  74 +-
>>>  drivers/spi/spi-cadence-quadspi.c           | 820 +++++++++++++++++++-
>>>  drivers/spi/spi-mem.c                       |  12 +
>>>  include/linux/spi/spi-mem.h                 |   8 +
>>>  5 files changed, 916 insertions(+), 53 deletions(-)
>>>
>>> --
>>> 2.30.0
>>>
>>>
>>> _______________________________________________
>>> linux-arm-kernel mailing list
>>> linux-arm-kernel@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>>
>>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
