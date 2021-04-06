Return-Path: <SRS0=MIf+=JD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2336AC433ED
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 07:01:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96A9560FE7
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 07:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96A9560FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M1ceIyG/H2TVoqwSnKxXpoCkg4gwVNkJWB7daZboQFA=; b=bfzBe4OxcGR43ykc9q8HsLHHQ
	8acm41uFKSKbIFo2RlNMflT3WjJM8ul5r0SdgBD+K8jKr6nH9PLUktAv5IodVhgUr8EKwXJL1wkFP
	yWMvzcvcX6F9rrlMsKjUKC+bExMhWzFu6u86EIadSezlbpxbE059LsKgaFWC0dPNCtueA7MsU49Ha
	wqrnfH6U7i4i9JhZFkTutenhqWZTJGAQ1D0EOF6m0NcUmPVhA6vQgjoDBFLzOaF5vEsb8ckis8u0Z
	lxOGG2rdIZ+eOHPCMZIPqUcVTUtpWNg+dvzkpRuVX5ESJJntvkHIZf/w0BLePZF9cj7ZonLIxfjww
	tdvU+6R6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTfhw-001inO-6W; Tue, 06 Apr 2021 07:01:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTfha-001ijA-97
 for linux-mtd@lists.infradead.org; Tue, 06 Apr 2021 07:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617692442; x=1649228442;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vHYkeVJb6aWck6GsHPGeYNaKJ/c/Q1C9F9GiMH+Vf6c=;
 b=aG7qZoMRY1/v1EPrWVB5KrRJzARaZwyYVJbnenznQfoB8j84zJYmJ29r
 dzYgSqSff3y/kBVDVrWSLik5cImHeBYeVwyQV2hNRnMj369t3vKP1SaSj
 7gHSuvyX4qERrzlPncy4xZRCTBVDcLdIOBbt4QSRAgcVjfi9sqIY9Goy5
 R/DBuRMo2QnmH8ruN5UIrlXcjxPDmHc/eGN+UgcU8dnbYCdP3LTaUIKiF
 puu5zJD9CXvOvx94N21qsj8mvVVpWlViKG01YVk/aL0Jrbgsw8VR6kXrX
 0mB4NTnaLxCJUi0YhJRrTldE3plY2W3dTDw+EPanNezPk0n15BxDXW1fl g==;
IronPort-SDR: nESWOBxrOkVAZxYB+WLRq7tC1W9AQzk/NcR7Uy1sMNUmxo2/RbTmTC5sLI48ZilGBg+JqnEmSV
 rwKIy4LIn8CK3CQZrkmyhJVkgvsbbP7OP8s1eMVCddZqEyiLaoOweJLb+UNaDtlRXD9X8jwqFr
 PbqEDmj18Ew4pPZcThZakrkI8SQGJ8Oia8DxG5pN7dYEfmfv2x97HWufzkz5FWU8iA/6D8tiL7
 IGm/nCoM8cpS6/5X1RhrOu/46hCipysiI/RjvN57aLglaDqROEok8ueLPJ4Mw+oy/ClZrhikTa
 qH4=
X-IronPort-AV: E=Sophos;i="5.81,308,1610434800"; d="scan'208";a="112564534"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Apr 2021 00:00:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 6 Apr 2021 00:00:29 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Tue, 6 Apr 2021 00:00:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ms32SK5j042+5okHAwcmvqnhlFfZq5Eh7ImYZP/GG44ZIHscqM+kER/YVeHw3KtszALF1DV8puPRmKWn9C0v5ClDH3j9exiieFB3JsvIz6QkkF/EJzu0Lgt2MSIn9aetYqgfWzrh1eGy9DePQ9QyvIlKFOOAUTVGe2v4eBgeTnqfqRZ0jYRQNovYkc0AFNTfE6E2zwsZ6tTfNASpixuHzz0FOnHsBB2t4cJdkPyvRVKl7mxxt1Nl+RHEnVyurD9Wbawt24XucyGkwat2IOWDSn2MwYixt9BBiqDG3J3cDLvfwQycBlrlFuQoFD8+Fwj6ZL/omYLLGr/EzSGq7nzCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHYkeVJb6aWck6GsHPGeYNaKJ/c/Q1C9F9GiMH+Vf6c=;
 b=DQIGsJsZdnDhHt2ojQofQv9tJGIVH4fqMOljQB75R4+ecIQuCFmCm31KMzGfyFLsx57o9SEa4db4GrUZxoRzG4ucreZ45v2zbOp8H+orqVBlxphrzQ6NwvhNdh6yUxCxzwNht52WeXSgquxSppoX58aRIwnJh3mql+zzAXgg5hYriMUR6bps0ymL3hgzAHyqaLQ8FwumlgFlUZIe9gGOU073SRfcdrcEJA3ZaTLOa2+4zX8PHi9BS/3cPsV686Soms0dDGl4O1IFZ1iIIHhgcknql+xc9UitcHGQgqaeo0MWWgE0sLgVR5S6JqMQtPeFtnQNzDl6Cnd37YvemgY9qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHYkeVJb6aWck6GsHPGeYNaKJ/c/Q1C9F9GiMH+Vf6c=;
 b=gjLoAKSoTxJ4RlwaOtQXBgeRW15ZPPhGVM4UnU8pL031nUih5LXVWX7XzwflfPD8s1jKRs57E57nCjKj3/2yfljOBV3mRmSWx3SsYlrUL+xjUJ8Zm/Ee0DquerXYANQqBEMWP74CBs/7kUHEmalOLzrNgLbp6aiVhGcBQ2KIfLQ=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3197.namprd11.prod.outlook.com (2603:10b6:805:c5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 07:00:25 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9%4]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 07:00:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <wanjiabing@vivo.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <kael_w@yeah.net>
Subject: Re: [PATCH] drivers: mtd: ubi: Remove unnecessary struct declaration
Thread-Topic: [PATCH] drivers: mtd: ubi: Remove unnecessary struct declaration
Thread-Index: AQHXKrKERA+jWDcYKEyqo31WQcPEpA==
Date: Tue, 6 Apr 2021 07:00:25 +0000
Message-ID: <ccba7901-676f-e8c5-2085-0f8f9d505754@microchip.com>
References: <20210406063751.522992-1-wanjiabing@vivo.com>
In-Reply-To: <20210406063751.522992-1-wanjiabing@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b93f8d6f-02a6-4bb5-3441-08d8f8c9a79f
x-ms-traffictypediagnostic: SN6PR11MB3197:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB319760F4345EC824242CF23FF0769@SN6PR11MB3197.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 45bgTcPQmT20kd4txgNoi6c4FB/HaspmR1PCXkV7VxILcS1diZOBUD8B3fW1pcX+/1f1g5az4mBnvmGUcKSOqRuu8v+y9xsR8JKPlDiczrn+D/tbkPNDzCbKdnPqBePv/JA+kLUmJgNAejHUst6y5L+3opIDish2CjDklX61heqc+uNEw5So7V2zxk2Xs9TTIVInwavP57AMR/MepgOpKtowgYW3LTlO5qCLNVWr4dbECHLHddhaZokwck1rdXFja+likDg7Iq0+tNw+m/42V8qxmqEgjrCucRClPpLnkWvmiX0OH9lEau1DCxmjSwMAjHDU7VZS0KCIhy7oxDoWukTZV+IzvLCeXpy2wPG8+AJWVGOzhU/UwtvTrTIjCIy6tk6+RTIC+cOkDWNHRGJvOY241xwOSnnnOD5rkmWyFQDqdSNOYtldJAooHbWwT8in0Z3x5FJ8ETOzdjfoDslP0+a2T888S2TBmD4c/ZOdKturpVEsayEKcaRBPpqM6tQ6NUSOvTiWSfH+gW7OZPBcseDayszaQniVFmz3Fxg5Wei0mkqdgEJ18TZcH4Spf92lrdA+VaqV21PPcmZGEk8hxw4l/M3tvANbMPNKA0XdusupwAup4c5ISM/tChIVnJHk8ZIgDXJiZkILrwVZC7UCoTDfyv4kHtJvmRfxcC5sTL1d1qb5GDjR+eOIKHgLx+PyLqVXaovTo/iXzMUGIXDefFVpAMmnRbd+DqZFhNDFQAHTC+G4im1D+MfPFpUrdPI1btZ+6O4IVAytqUd5fmFC9QkhuCBloX+5odn3UQhXLtSbFosqUF3zzeaIgt4dJyYh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(346002)(376002)(136003)(366004)(4326008)(8936002)(4744005)(83380400001)(6512007)(38100700001)(5660300002)(66556008)(2616005)(316002)(91956017)(478600001)(31686004)(31696002)(6486002)(86362001)(66446008)(76116006)(66946007)(53546011)(6506007)(36756003)(71200400001)(186003)(2906002)(110136005)(64756008)(26005)(8676002)(66476007)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UnVlL3RLMHhhRUtSOVA1QngwNkJ4MFU1S09QN2tOZWpDOGxtT3hJb2xPWE80?=
 =?utf-8?B?UGF2c2dEK20wdUhWbmE5eHhoRzBlbU1zMStrQ0ZXVkpvRDk2N2IvMDhOaUdU?=
 =?utf-8?B?amllNHh1dzdLWWlqWmVYRjBtYTkvZlJTd3JaazdyaDR5T2gwZGQ2NHNQazQ0?=
 =?utf-8?B?K3hHUXR6T2h0RGxSc3pyellLNURuMjlqRDFYMCtTMWY0UHNPTXZldmlsQno2?=
 =?utf-8?B?UVBtTDlmSmNZUXdzb3JkR28zMU1sTlpYaS9yNUlpcVRKSnVjRXdxRWNsUVgw?=
 =?utf-8?B?THdQVjZEVzZxSFdvaGk4U2Z2T0dzOHgrMkl5bkhGY1l2OE1jZnlDakhXNjNM?=
 =?utf-8?B?cExsUFZKU0pjVzNCaTBQRGZtZkY0WS9xdGNER0lJSFByZUFYcnVCSGw0bkRD?=
 =?utf-8?B?MGhWa2dHSmFIS2R0Z0NCTWwxdFhreXljalphOFVIYWxHSUJYYnAvZzNHczYw?=
 =?utf-8?B?alMvbUV4eUs3R3F0dUZtWU1tOWdKS2JPaXBXbm5MNnNFU3kvWTBzRGhpd1ov?=
 =?utf-8?B?U2tTZXE0TllhWExYeHBCOUZBbGtTOG4yQnNneDJlcTl4U0lIT3Y4OGdGT0Na?=
 =?utf-8?B?M3laOW1lQkk4eDhNS21qSUZhVi9CSlVCTW10WDIzUDV6cHJ2NW1GK2xnQ2E1?=
 =?utf-8?B?cXRuRzZkeWx4OFFlOERtK1lCYUJwNlhKTkE3MVJPTUowcGNUOGs5Vjc3S3Qr?=
 =?utf-8?B?VUI4a3h6NGVYSEVjL1kzWWJlbXdYU0JiV3NrMUdjVmJtV2c1QUNXRWlTUXR0?=
 =?utf-8?B?ZVJKMllQM2FBTkRHelM4SElIOGxmV2Z4YWI4OFluWWVJenVoazI1b1UycTlQ?=
 =?utf-8?B?bG5ZNUE3RGQ5Q3R5UE9zRTkycFJ1eGVVa0t2QVJmaStKZ0VwVG1NUjNINzJ3?=
 =?utf-8?B?Ymt3UXYvRW5oRDVsRzJ1OWRTcmlhaVlZVGdDMkRKN01zNXFXZ293Z01ML3Ev?=
 =?utf-8?B?Um9ZUk9IMXU5V0lOcmhORHBXNXM2K01TanFBbHQvNEhtR01QdjB6U25uN2FW?=
 =?utf-8?B?VWE3TTU1MDNIbjBhRHpISnVHbXg2eU94dXVhT2NwUVZ5ZGNZbHFBdEhGcEdU?=
 =?utf-8?B?VDdWL3BpaWdCR3I5ZnhrbVRjdUlxbmdSTFEwa1VLV2RIcDUyV3ZZbDNEeDJP?=
 =?utf-8?B?dlR6WU8yajVFSzRFU3FJRjlxZ1hHeGg4T3ZEV2g5a0ZrN3RycTFEU3FrcDhG?=
 =?utf-8?B?SmtTaVVvY3puMzVqWHdDbjdRMjN2VThuTmtsK2ZTTXBuRHViOUtoeXpHOG4w?=
 =?utf-8?B?NGRiTlY0bk9wY3VHSWMzb2EzbWpBaUx1cXhqR0RHakduaHh2R295SmJrWFUr?=
 =?utf-8?B?VHlyVHprT0RVUEVRNWNnY3orOGtORjRabjBpV0RVV2Rja3lOclhkSVdFbDF6?=
 =?utf-8?B?U0tUZHhqSFJ0Nm5DQzB1QWpuTEQ0TDZqT2EvYllBMXRMamhIdjFJTjlrMEZ0?=
 =?utf-8?B?NGZIeTlZeFVSMFBwZlJ0cVowRTRsV2Rvai9GNytXR2ZQS1ozdzRheGZWRHJU?=
 =?utf-8?B?NUJ2Q1VoQ0g2Y3F1dXM3TUpDTmxqdDRDSGNZKzhKZVAyN3ZJR0E3U3QwRkNO?=
 =?utf-8?B?RGt4QXgwdm9nUWVzbmU0a0IzV1B3akdKT3YrRjY3UFF6bTl6aGdSYVFkQlpY?=
 =?utf-8?B?VHVBZENqdk9mTXRIT05wVVBVbSt2Njc0YWRPNnNkTk5YZkhLMkNBNzYvUUs0?=
 =?utf-8?B?dmRrMFRZWE1FZW5kMk1qeDhQNGxhM25mOGJmSjZxbEgxVVhPMFYxY21TTnB6?=
 =?utf-8?Q?265K1b9GAddbUjRll8=3D?=
Content-ID: <6CADB44106BA0143A9518C08BE605DFC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b93f8d6f-02a6-4bb5-3441-08d8f8c9a79f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 07:00:25.5954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hGZgW1I98SMGDh0lqG7yk8aX6QUKY4E308ogxZY8YNJiG1uEJmjRaioyb52posNxbvBwnUPrYo3Ob3AcRI4F7d3Kfd7PV9zy7KpiGWmfKP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_080042_943107_D4CBF761 
X-CRM114-Status: GOOD (  17.06  )
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

On 4/6/21 9:37 AM, Wan Jiabing wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> struct ubi_wl_entry is defined at 178th line.
> The declaration here is unnecessary. Remove it.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

the subject of the patch should start with "ubi:", thus
"ubi: Remove unnecessary struct declaration"

with that:
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/ubi/ubi.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
> index c2da77163f94..7c083ad58274 100644
> --- a/drivers/mtd/ubi/ubi.h
> +++ b/drivers/mtd/ubi/ubi.h
> @@ -388,8 +388,6 @@ struct ubi_volume_desc {
>         int mode;
>  };
> 
> -struct ubi_wl_entry;
> -
>  /**
>   * struct ubi_debug_info - debugging information for an UBI device.
>   *
> --
> 2.25.1
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
