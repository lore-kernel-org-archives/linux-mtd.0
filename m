Return-Path: <SRS0=tD4Y=MU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90571C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jul 2021 04:12:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 544E360F41
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jul 2021 04:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 544E360F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3d79o1Q8dpF6AxcIgqgdwk+cwMAkz1ilEmKeZ8hkao=; b=I9IAp2IX57BKje
	Y5fxAuG1/uLm6DTI/4NDf0rfKRRn2fAGio6fMKkkq67/fVyuJQxgTTtE8TLz4uvft1932yJsTIAzW
	38UUjupcrcYrhmTLLc361eQGEtGnNnnsPvNebnqWzsbuf1N07Xh9G8fRnlS7n4GC4gau+vzYBkNX+
	hWckUbfjl82RxtKFzdo1H4vweiv3rf3FDjhRscv1zIHdSIrRfFDd0OjPM/1KQW0ANoqaO9aKljAi7
	q6zmI8uZfbZLJI66CHSLK7I7azd0YUfdAsQXLw4ldA17OY6B3g+MXQmhqQkBVEgeFSpyVYAU1BS+L
	65QeOIKJzBSmKA5YVTDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8auS-00H1tP-7m; Wed, 28 Jul 2021 04:11:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8auO-00H1s9-JL; Wed, 28 Jul 2021 04:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627445465; x=1658981465;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BA8kuK+y9AjVXSgL212yzpXYTbva6WvD065xQDyHCSI=;
 b=vXJHOOnCOojufg7s7LJHuDYwNtuMCUhkUsGy24EkkrBjXdSpqiiQlvjd
 Bkb38dEZMMWvyo75pcZG+gYhy/Uor/gsWJxOul9j0+XQYE/En9R8X2oP6
 7uW3Et1jfc9K08ZgHxB71V8CnmsIRj/fqIq5zNClOIZvgUSrtzT5VCB7b
 n/RE4eBb3WvN3Fdu67kF9f2frShm6NRSjpfVT2FiJ9tJuYegXLSrTg9wb
 a3dP+++NGsIkIX1wPtAYGWgoILwX698fQ9EIBS1StO0rt6/A9F1dkiTOd
 DTo6n/wcyqSfqckT5eRUMmLDBIT+CLHw9Pw1BwjXpphzIGRqd20XuY5DG g==;
IronPort-SDR: hCxdaBnUqGtp4fvYD25VJfw7L6f7ZC/Ud3FXoprMuI/0uz7N7hV3BoSuf10216SIFQcP5cIv31
 YBDSojMNHrQXeO+csRfblIXpFuuJbfSUhWDDNCPBWHaSXEcU3EBI3ua1Hgc1Zk5r6KN8tb73AQ
 1ZGumbbDhSe1PH/BHVo/89zqMv/mQA3TZXpqJMu4VMenxjaZVMkDhOYFSyfRTsSZtNpliXl8da
 1iCNODVfyYe5umD0pEH5XWbKE8WoSpmDHgB8PuWMTasCmFHUnN6wl/gdIWTtTMy8wvdPO0l87e
 pkGKp/9Q6n2OI+wFWKY56+O8
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="130084540"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jul 2021 21:11:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Jul 2021 21:11:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Tue, 27 Jul 2021 21:11:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIJyj1fctSynPRyJhYBO4j0PwUL3nezkTCwG+BU6kLNQ4s2f21iz2vNpS/xuvRvOAbRc6RZgUCTdubA6Yl/k3TXoPRytnyArmE9EMiGjrehKWm88D2jsnpuvmAY4OoKxgZHlumJ497GhxvAP1r0he7GwDFyCkzJ4JfF0zUsTwa6mhUS3Dh5UeLBi9hC42yu4KQ7CAJzXAWlR23icrF6CMhgCFee1/bIYeWVN1tJ3s+0Gar5x5nf/MektABdg8v1bvCGr4CMEUig3JUkU9pCc6tmy/ppVL1Fy+dUUEMrQVSIHUbjqpeYog4WPt65Sd0QUGAxLzQCl+g9bAiCkX7406w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BA8kuK+y9AjVXSgL212yzpXYTbva6WvD065xQDyHCSI=;
 b=bKy2Iaq98TagyW/jj33zl9C9E77DzBIfSNegT7mU6MSylsZLXg3CN9rnavvRhJTWPb/2k0KuiwqkgfFCDvaFDlgiUl9svmTLXFkmZFsjok/0dXzEv3Yhi00BIKGjjMe8Ncln1hoJw0xqp7yifjM/8+29e0fIDIakdTlyAqDElHiMT2SGCKESQqCIFm6kMPG6IiFaHrbouxJUUSbumuDqYgPLpMxPGBcOVBvhAiaRGGl32YmmxJYuDOjSGlHayzxCTKUNjh7iZbIG+7EHcofMQCzb6PaJj1wMOCeIuSk3EQwPBRAPgIGaJIX8+ujBD3WMB4V5E3QJhatfmbVWcrtt2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BA8kuK+y9AjVXSgL212yzpXYTbva6WvD065xQDyHCSI=;
 b=FEmKwbn188QpExiJt0KyeoQXg7LTyCqxOVmNqqqXDepnSJOAGUz+NwS4R5WrD//VGxQENdZRCfNIIg6AZX2Tq0IiLAAsHCx/PvMoAaN7+Hc0tnI+oMV5y/m23Z3knxJ6qMdZYuCgSTEdrA2Fq/WRMyTEGyRafYJQ4w+/Q8Ap7ro=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by CO1PR11MB5156.namprd11.prod.outlook.com (2603:10b6:303:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Wed, 28 Jul
 2021 04:10:59 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::58e9:43d8:74e1:f266]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::58e9:43d8:74e1:f266%6]) with mapi id 15.20.4373.018; Wed, 28 Jul 2021
 04:10:59 +0000
From: <Tudor.Ambarus@microchip.com>
To: <macromorgan@hotmail.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>,
 <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <sr@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v2 06/35] mtd: spi-nor: manuf-id-collisions: Add support
 for xt25f128b
Thread-Topic: [PATCH v2 06/35] mtd: spi-nor: manuf-id-collisions: Add support
 for xt25f128b
Thread-Index: AQHXg2aSWY57Y1oUHEWzVUKyDbl+AQ==
Date: Wed, 28 Jul 2021 04:10:59 +0000
Message-ID: <6cfcc22e-5f78-59a6-9781-613be62f3178@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-7-tudor.ambarus@microchip.com>
 <SN6PR06MB534253FF244275974E04E2EBA5E99@SN6PR06MB5342.namprd06.prod.outlook.com>
In-Reply-To: <SN6PR06MB534253FF244275974E04E2EBA5E99@SN6PR06MB5342.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: hotmail.com; dkim=none (message not signed)
 header.d=none;hotmail.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a079996-9806-4969-14c5-08d9517db4d8
x-ms-traffictypediagnostic: CO1PR11MB5156:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB5156150E7CB9050D323458D6F0EA9@CO1PR11MB5156.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qCuLTxWtyNWalMTn/sYQdIy4FoMPcO7ovVuKIV+AacwmKsSLhgIFeWwAuGWTFWWeZBI1Sq7olGslNGYbrhzVIoxeXj4bZJA7UhZPVfwYNAiDEzVFoicimvjv4apJj3EoVpbCkrLRgp/eP4SeSSN9ERsKpz6IrVu7lM2eHuORaN1HQ1q44yus2CHHoqvkyJS5FSLoPD8NJL5pPH4xt3XpmtBNar3Y0KDtCB/LkgMvi9MKfei9lw05zCNeVy/xbDEM4kwHoozK2UR+Wc63xAEs4o8gaqtz6aPx2PYA58mF70PZZZDAZJmVe0dboUXza4vVaSGZ+7WtQ5UXgJYb6fQxiMFkTyCbQcET5iqLLVjummFESFotg6bLLWDdhT8UiTdLLvl3pwJqxPOE3NRlpsOiZh/s6cYGlKi5NeT+vjEtxY5nrhfEH9NeCJ+U0LXer5y/3QtFhq8avC4GtF5nltnyBylHGQ79qQMd1DUDiwRAPHMY5LOR2b0XxSp6/WtRHx+AO1J0pbH1bjWtPQZ9MR95zcW4R3Iytkf5zLsP+YAuBqv7jMqoBzAGXRh53RT0TXr+lXLu/6oJNQ+nuM1F1xk2Qomaq+C+e7+p+iSYTnxehkxb+pEDst/upFDHQhb/0JVMi6Hp7kGXMAK7ZiHVa9mv67YGnZB48AOfT+Lst9lx/ut6y+wmCXYD33LPLvpqrkg91FyY1wOJw8kWlvnaXH2wxEGp71OKLSxsNeAomJdb+CKYjiN9iBKuUu+9dNobdW4j///Zk2uPiyIu7w+2KpIGHgVqXlWLmZhJiKlCgmpAlfXbZzw6YZVDqnt0l8B8uP3nowt7i5gxk1rQvVuOFxO00K6seL95WWa4zLGbdfKgfBSx0FflVUSR1ipraQAJgjMQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(366004)(396003)(346002)(136003)(76116006)(6486002)(6506007)(53546011)(26005)(186003)(5660300002)(38100700002)(8936002)(966005)(7416002)(6916009)(64756008)(66446008)(66946007)(66556008)(66476007)(6512007)(86362001)(478600001)(8676002)(122000001)(36756003)(107886003)(71200400001)(91956017)(2616005)(54906003)(31686004)(316002)(2906002)(83380400001)(31696002)(4326008)(38070700005)(138113003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFBaMlpYSW12c1FpR0Jkem1Db0NkSTA3TEp3b0dVZFdZU2Qzb3ZxblAxWGlo?=
 =?utf-8?B?Q01BeTRjbkRjazJrMWdJK1dtOW5oSDZJWVNzVHNjQllDMW9xdFR1eFozR3lT?=
 =?utf-8?B?UE1kZTk2Rjc5aHhIb0VyZ3lUSmptRzNaVEg4MUdWaGIrRFdldjJCZGxvTVIv?=
 =?utf-8?B?eENoWXdmTnh5enM5N3NPaE1LdVZ0MmRZT1NkY1l4Q3pDTzh6TCtNYVlkbXFT?=
 =?utf-8?B?ZTMvUFY1d0liZm1XTUJRaFVOVG5aWVZJM2dXMUU5ZEVzakRGOElCdEFQVG1I?=
 =?utf-8?B?a0tiSDFuYmFtV21BbFlCcWFjc3Y1MisrK084RU5WbERZK0R0V0cwY3Q5cUpn?=
 =?utf-8?B?SHRJSEkwYTRHV1pRTk1yY3dYeHB0TWM2NzZ5SURvYnFJczducGdnMThENDQ0?=
 =?utf-8?B?ZldwRmNPWVYvcnY5Q2hYSFFERE80YnA4ek1vcHcwcmpUc1pUMDdaSVgyS3k4?=
 =?utf-8?B?ZWxSaURUa0NWdTFVSzB6ZTFwVWpKNmRtL2c5enp4SWQxVTRTZS9sVGZXcHU4?=
 =?utf-8?B?T0RJa3JDdHlPQjR0R01SaTVMV3AwR2h3dlY0RUpLOTVtbVNiYmVkcXVkNXlK?=
 =?utf-8?B?NVJ3WWlrYUlXaUs5SlVwcnZ3NG1YelBEL1NjRGw5RHlBUlo0N1NFaTZQUjVG?=
 =?utf-8?B?dEMxY085TjYrOTB0OXBmekVNOW11dHhad2NtQTRSQ1lEVjhoRzdwYjVMWERH?=
 =?utf-8?B?YURHTGlqNzdyUjM5NEwrb0R5bXd3MFZMMnFHYlJ1OFJPVVZ5RHlYY3pKeTF6?=
 =?utf-8?B?WG9JNWlSbEVXUUtUWUlNN0hFeVNVTURSVzRsZnlpMm4zdUtXS3JsQ3hiN0JT?=
 =?utf-8?B?SXZjb1ZxN29HTlJYRUowNm1iejhTQU5BOHBVT1NOWng0bFhVaUhvK05lbTQ0?=
 =?utf-8?B?TTh1WkpQSWpqampXdk45RDRqcEorc2k1RnJnSlNaeHNFeXhvVFlzTE5qVjUw?=
 =?utf-8?B?bWo5WGpBZmtYL01rZ1pxc2wwRlhsWEdBTlEvOXo3RGZOUk9YY1BTNzZtWURK?=
 =?utf-8?B?UUVxNytISXI4SGFEeHNEeEEzcWZBZjFkU1FaMHF2cGF3VmRyNG9sTVR2cUZG?=
 =?utf-8?B?Z1J6K0ZTNWdCWkpFUnY4amFPSjEwRm82dFFYNE56NGhzZUdJTFp5aHhzekxB?=
 =?utf-8?B?alVONVlNRlprbmttYlFHU2lEWnUrQXd0Um5heitpbjVGa3cvdmVzRkhsdzA5?=
 =?utf-8?B?V2ZyT0lnL3JEQ2VhZ1VlMEFrR3o5U21kcnN0ZHFuOE1CZHRTeWI3T1lyNndn?=
 =?utf-8?B?M2h0Ly83RDYrU1VOUGpFNFBvTjRzRGtWVVBHOExYY0UyNGdUR2FBWmJXckd0?=
 =?utf-8?B?RzdCU2tsL3pySkFOSWI3S2RiZElDVWllRG4vVFdySHU3K1p5WVZ0M0p0bGNX?=
 =?utf-8?B?UzdSanJwck54QTRrNkN5bWFzZnVxSSs0bGI3M3c3M1Vod2xsQ0xxaW1lN28y?=
 =?utf-8?B?MCtSSnpkVE1xenArdHlVYUR6VWRQd0xBSHIwcGkxM2VwTW5nUlVZZ1luQitZ?=
 =?utf-8?B?a1ZFOXAwTEkyeFRsT21wNVVDYzdzUlBpcVYyQzBkRlNsMng1TUN5RC9FSElr?=
 =?utf-8?B?a213SWJqNmJyL05pMUs3NzRObWZydjZPR0NJM1MyUjRGM0N6eVRud0tpZFlG?=
 =?utf-8?B?U3hxaGZYWEh1T3hHaGlzNmdOemxvUHpmRDlHKytMOVo1SlBFc1NiL3dCS1Zw?=
 =?utf-8?B?T1lDZzZmeFpGU3ZROEUvSWZ5L1k5V0IyaVRyNHNlYnpxN2F1blhvV0JRbXRk?=
 =?utf-8?Q?XyJ1jFcFzByfuA0Syk=3D?=
Content-ID: <9466D3A11496744B9050B4E29B897118@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a079996-9806-4969-14c5-08d9517db4d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 04:10:59.5501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4/IVGQxGYLQQss/+wJPl+rdWp6WcKQbuI8VQUTd7b6Vh6rN1ZlMJB19Yjr+t5CKMVKFKmEwWE7cBjW/vsZ0qjECG7x/iObyYUw+ichdyyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_211104_766896_DA7D23DA 
X-CRM114-Status: GOOD (  30.69  )
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

On 7/27/21 6:52 PM, Chris Morgan wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Tue, Jul 27, 2021 at 07:51:53AM +0300, Tudor Ambarus wrote:
>> Flash does not support continuation codes and may collide with a flash
>> of other manufacturer, Intersil being an example .
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>> 0000000 4653 5044 0100 ff01 0000 0901 0030 ff00
>> 0000010 000b 0301 0060 ff00 ffff ffff ffff ffff
>> 0000020 ffff ffff ffff ffff ffff ffff ffff ffff
>> 0000030 20e5 fff1 ffff 07ff eb44 6b08 3b08 bb42
>> 0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
>> 0000050 d810 ff00 ffff ffff ffff ffff ffff ffff
>> 0000060 3600 2700 f99f 6477 e8d9 ffff
>>
>>  drivers/mtd/spi-nor/manuf-id-collisions.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/manuf-id-collisions.c b/drivers/mtd/spi-nor/manuf-id-collisions.c
>> index bf7dba34f018..db31470ebf6a 100644
>> --- a/drivers/mtd/spi-nor/manuf-id-collisions.c
>> +++ b/drivers/mtd/spi-nor/manuf-id-collisions.c
>> @@ -13,6 +13,10 @@ static const struct flash_info id_collision_parts[] = {
>>       { "by25q128as", INFO(0x684018, 0, 64 * 1024, 256, SPI_NOR_SKIP_SFDP |
>>                            SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>                            SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>> +
>> +     /* XTX (XTX Technology Limited) */
>> +     { "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256, SPI_NOR_PARSE_SFDP |
>> +                         SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> 
> My apologies for being ignorant of this, but I'm not 100% sure of these
> two values (SPI_NOR_HAS_LOCK and SPI_NOR_HAS_TB), even though I

Oh yes, I forgot you have already mentioned this in the previous email thread.

> included them in my original commit. Looking at the datasheet for this
> I can see that there are 5 block protect bits (BP0 - BP4) corresponding
> to status registers SR2 through SR6. Status register bits SR7 and SR8
> correspond to "status register protect 0 and status register protect 1"
> bits as well. The Rockchip engineer I was testing the SFC with did
> not have these flags as well on their driver they were using for this
> chip too. I have tested with and without, and they seem to work
> regardless. Is there a way to know for sure if these should or should
> not be here?

We should do some locking tests to verify if these flags are ok for
this flash.

> 
> Here is a link to the datasheet I was working off of:
> https://datasheet.lcsc.com/szlcsc/2005251034_XTX-XT25F128BSSIGT_C558844.pdf
> 

I'll take a look and try to provide some guidelines on how the locking part
can be tested.

> When this is confirmed I'll be glad to provide my "Tested-by" line.

Cool, thanks! 
ta

> 
> Thank you.
> 
>>  };
>>
>>  const struct spi_nor_manufacturer spi_nor_manuf_id_collisions = {
>> --
>> 2.25.1
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
