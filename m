Return-Path: <SRS0=Oqae=H2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1,
	WEIRD_QUOTING autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2E2C433E6
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 16:31:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A09064EBA
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 16:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A09064EBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qk+eqX1OD9wj/YWCScQW6gFI6dPaTZBnCUdIQrKg/wY=; b=g9zvPDmPT5828fva5WWcwVwp2
	MPn5QbzH6N80Te0Q3zCBjSHI4t85bKbS2+NsNCd6Whl5OrNx4MmDO/V/Qd51jnVuMOhiFJp1apjsz
	OYB/eIHWMv24ihTTYCXRhDjlwbgfTFPGpeIHCRcpUVz8sRZnf2wgzafb+AV9MnpERjKjdoFugo2HT
	1d1WWf1tXW5awx1BEGvb4NamXkaZ7xmtq2byBuZ1J229vT6EYryZyuhS16J1gyFCyDFc0R7b6Shw8
	ySqUEuKNN1SPvoImITb1kv/nrTSW10j4Eu/YDyx8bdp/HSNgAnWxL1RHYDOOBDBrTPwYzxOl+Kak8
	K4Big81KQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEx3s-0003kB-LV; Wed, 24 Feb 2021 16:30:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEx3n-0003ib-Nj
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2021 16:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1614184247; x=1645720247;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0FXlSWvThSMnuiD9fG8Eq+iYEM/CODYivMtlpk4fFNw=;
 b=dxeTzaC+KkMvvX0G26AHovYpgZh9VCIjCtGwpg1fEIBm7e3qoG02Jfcq
 iQIFnUn0b+V9ssiIB5x7c7AFw92IiwxlDVUnGc09qSVkU1bFdVEym9RUo
 WI6iTzElQJNRyeqTLv3TnMUZNJ5y5puX6X5nkHWKbqRJAPID5Hwyt5rKk
 ouGLNfIM/EYRN6LE3Cv7BN4I7WrvdN7juLQbasaba3NpCd+pJygY6ofbi
 pVQooO1CnkPdg2GNZ1BAcAFz9scc8Ximodn1WDNl0u8D9EKY/5WFltDOY
 UQlaOruzDeyj/ca8DS9lteKloY+APlLKmnKL53iSDwKRs+UVk7DL701Wc Q==;
IronPort-SDR: ySnKak3c0UNcSk/pWxWZHhHcZD9nNJA4Ld+bpP76bB5RsGfcdys0gzD7THVlltSUk33JfRnMpN
 zL2mU/PdjU8N3fGHKujmRxDle7F4CtCVKp3zknQ558u3Y1MY+AhrhTPZiLq1BtIMhA0Jk0dE94
 0yNpRA+khN31r4l21nwVB5ZCtQE0w7HL1nMfgzuPxA3Mfr1RPDgVrz7WyYESrYIn0YdtGHoKaj
 L/vyAVr0gBo+Uuz9fiHlNwY2L1Er/1xIKrsOUrqBylEDyXBpquV31emL+u0z4XDlYMQhglz+b1
 nzQ=
X-IronPort-AV: E=Sophos;i="5.81,203,1610434800"; d="scan'208";a="45314346"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Feb 2021 09:30:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 24 Feb 2021 09:30:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 24 Feb 2021 09:30:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8IlSEw6tvnt12TiC13eSB9tBhOTW61i1rmTN8wnW+5i6GJlz94De7qkBxTEgRTUnEAUOnKJsIOas3jZ2x7U/ciBfhLAIy9zKRGPwJT4382DH+4pRJSVL8/n3mRMcuQMOH9Jk9utXOFnp/Au6It3CjJ6I0CL5TLBXoXPCfvpbyNJsJtPzT0ltAX+Q/++rARxktThWoiYHNShfShfVzl/87tZNIYcoljQYbs0fyMZfL4nmfb91LOrtesp80pcNInWOVQHrMvYBF12U9tJLzL2O5Vb0B3DWbOx9X0EacFRQs6Bd2eVj/z/HF0ckLubzknGkqiKsqja4T3VXYJqR/nhtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FXlSWvThSMnuiD9fG8Eq+iYEM/CODYivMtlpk4fFNw=;
 b=RBt/Fse1l9+ayQxgCOb2DGp98AzSSgO0k8dJptyOicdP2gzgOb0YahsutNnidv5eHs+vGIckRulwgE2UBmjzM5TqQmGiloaPTGa4GjAYKZDP85Qvyh12Z9GWtAn4mTVvqk56cJqhVpSI32LGh+6aQtgA2/kSjuQVFwsR72oReBJP7ypW75E0KT+OKUWYLaFtQH5DER5UA8rLCq8AGfLmJnjY6Vi/QiQdwgGaFPDmiymuTFNOkM06x2vXt6x/Gv4gOtUPBCk2Upo7S/Vj3bmDzJrdt78PKGOWO1x5Pvs6k5vBj7ceLGvA37d2HfNUgbh+CmPOqwrK81OQi8NJDRDgjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FXlSWvThSMnuiD9fG8Eq+iYEM/CODYivMtlpk4fFNw=;
 b=WtCbZ4DVq6Jt61LsDH+mJ3OMbMiGRpUWRaxrFeJpkAxsWBXmL8QFyEJXvL7BISlKvRpU4KHxofrL9CTnqfmLORPqpYoHPW8yGPb+3ZXIpFNhuOR3Q2v0TtEUcOhD0hmdUhIKhfzfsOhP3jO6BUxWyWVi2ZBdoHp4t/xnnIT6WbI=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 16:30:41 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 16:30:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <Yaliang.Wang@windriver.com>, <vigneshr@ti.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: Re: [PATCH] mtd: spi-nor: Use CLSR command for FL-L chips
Thread-Topic: [PATCH] mtd: spi-nor: Use CLSR command for FL-L chips
Thread-Index: AQHW8a94mMSXtQqoOE2NM8lFQHXK9Q==
Date: Wed, 24 Feb 2021 16:30:41 +0000
Message-ID: <2966c209-190c-750b-9313-605157e20604@microchip.com>
References: <20201116153956.588098-1-yaliang.wang@windriver.com>
 <f2fe7e4e-a651-491c-f894-8cc264c64744@microchip.com>
 <d2a66253-e755-280f-8f79-d141b3169c56@ti.com>
 <2c578dcb-b9da-a56a-593c-b654cef6e67a@windriver.com>
 <6f868908-ee07-690b-98ea-47d81acf009d@microchip.com>
 <d80d6cd2-87c3-c336-7add-b91ff4e0b177@windriver.com>
 <549f0999-ec8e-a2b0-2c2a-2c09a4951ad9@microchip.com>
 <17a9226e-7d95-f3e6-7d94-ce6415ccd991@windriver.com>
In-Reply-To: <17a9226e-7d95-f3e6-7d94-ce6415ccd991@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [79.115.63.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a8d5c38-d7e3-409e-802b-08d8d8e186fc
x-ms-traffictypediagnostic: SA2PR11MB5066:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB50661410C63E611801DCA6EFF09F9@SA2PR11MB5066.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f7Iv6cdpEARSnJqxdHK7szsEwiStneVeKsS9Y8nArXaj26UC7KxStibFy+ehxZags4ekYm3lW4Aiyb5NAgSvQxSTtiqSLh1QBPTtFzhZH0sRqjn5rwaUP8F0OjOkEi9uqMg4VXvV/UDmmoyGz7m/wSccjICKQ15dmKpsXlAVX0uzBfpy7/1RFhT6NM0HfJYDs6p/ufABKkefwqqxBQJ9WomtE3V7cIyBxkQJ1h4aOnwX1uMpaJbhvsjoJKii6kJJfrtheF5dnje3+H5W/J4hU9BDKD4Blt2lyQCcVWRUMJOlAqzg+JPtdZFsDWFcPKPSBnNH8+1oWWxim4C/aEbvGMJ0e0VEonzHBLGQRJyHgz/8Z7TBc1Tttj7i5nkOVbupdaS3xfRdMxzKm5pceO5aSMfadmHjJssdIqQ8vw/tzxEN0CuAp88Tu8nL5fI/8GIvi1NuREZFzN8a6Tf/vdOiHcCuupo0/UOlJ/RPybedyK3Rm4z9vAaBPM95yW1dWKvQc5S4OG7/1T3P4P3jLIprctNl6Q4WdKxkcrHljNhecYRAneFugcY6PAEoG7xZshc2eCR/Fcz4i2oZEpDARV2div+pgBWmgrmQEu0IBLFa5xc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(39860400002)(346002)(376002)(136003)(31696002)(26005)(36756003)(66556008)(66476007)(186003)(8676002)(8936002)(2616005)(4326008)(66946007)(64756008)(66446008)(86362001)(6512007)(76116006)(91956017)(53546011)(6506007)(5660300002)(6486002)(71200400001)(478600001)(2906002)(83380400001)(316002)(31686004)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aVVzV3N3UlNVeng1ZzFKZlpSYjdKOTExbFNscEtKN3RTcUY5VzFpU0E1bEhs?=
 =?utf-8?B?ZGs1UUd2Rm1MUGw2Vm1qTUFsTXk1cEhFdTlQUGFrZG54eEdoVUtIY3dBOG85?=
 =?utf-8?B?V0VIRURUS1Ruc2ZlbXlFMlJHRzI0bmNFUy9vSzkvODVhZWtmWGVQd3VOTDEr?=
 =?utf-8?B?M1hxZ1U0K1dmRDFUSWdBM2tPYXF5TklBOURtOWw5NFRhZlNnMmRZTGF2RnlE?=
 =?utf-8?B?VkdScEw1NjJnY0tyTE90TW1idWZHYWRSOGtxR2tmcHlEM3ljLzFndWpTMWRy?=
 =?utf-8?B?VmpCMERSc2tTUVYvYjFaNXNCOWR4Y1JKTkh6Z0N3Q04rTVF2ZDA1ZlZXRzRC?=
 =?utf-8?B?NVJWeDVheDZGaGVack1JWU42ZUs1dEdLL2QzbGRxYmtwd0tuRGVPWmNubjlG?=
 =?utf-8?B?SkZOclZOKzFqcE5zblV5WmkyOWo0bFprRmg5ZlhLU0VFeHBkLzlWVXpvb1kr?=
 =?utf-8?B?dTJXVUgwRGREU0xTaUFXWlYzc0lnb3N6Vm14TVl6WW5HM0dtWGk2WXM0RGRw?=
 =?utf-8?B?V3RvSFJ5TWExUjdJMlNmckx6QlBMVHpzUDVEVjIvV3QzKzNBdElkWk5ybWJN?=
 =?utf-8?B?NUpxb0NseFByNE9Yblk4NkRBNjVCakZqbFpBbEs4ZnYzTVVMMHVJY0llVTc0?=
 =?utf-8?B?NGZ1djNOL1VTYXZ5U2VuM1JUVUx5WGlVOVlYVlRGc0M0bmN3dlY3U3pKWTRy?=
 =?utf-8?B?T2RTRmZ5VFNocVloaTVWV2YyMllyQ2VWR3JBOERSQzlqaEt1U0JxVXp5MldE?=
 =?utf-8?B?ZitmRU9keGZpOUdLSkpXWExscW5HSDFuUWlkUmZIZzFiZ1BKdFFaTDU2VzQz?=
 =?utf-8?B?T3Z6a2ZkTElrWmZ1aWJsYjVieVdqY3pETjNnWHJpVGcwWFFMcVRJOW8wQmJs?=
 =?utf-8?B?SzczRmV2ZWUxRUFjd0ZadVBsN3dpSzN5RWhkT0hpZTVoOUNqOUpncWEwYU05?=
 =?utf-8?B?WWcwei9oZDB6dUd5bkJ5ek0yZWIwYjdiclI5SXU5Y3JUNk1TWU5JRFozWldX?=
 =?utf-8?B?TFpxdXFlMGNwOUp6VFdaa1lMMVNoTDY0V2dZSE9iMGdYd3BnRnA0ZU5SMkk5?=
 =?utf-8?B?aDRobkJJL1hWaGRyODczeWNQYVRSd3lDaTJzczIxbVlVVncxdkFyRHRyUzUz?=
 =?utf-8?B?SHZOdnpYajY1WmVIVFJIRGFCbTFuNzd6YnAxd3IvZTU0VE9JRlllSUFDK3FD?=
 =?utf-8?B?TVVMU0ZwajVnTkliTHFDa0xESFJucFRENDhmWXNZM1BBMTVmeGNvZkxvV1pj?=
 =?utf-8?B?b0dMSGdDMGp3RWxLb3FqZk9hUERoemc3eWNvZGc3c1VhMk9jN003Y1VhZFpH?=
 =?utf-8?B?N25aMGtGcmcrYUF6WkgrL1h6d3RzVjBoRFFXYXNrSW53UVRzM3dVZmpJbW50?=
 =?utf-8?B?b3ZmVzhxN2pDNU56RlZhK2J5Z01STjZlQmhXSnc3Rm90UTJLeXdOSDdQc1cy?=
 =?utf-8?B?OWJadEUrTmdaV01MaHoyK0hOZUU2dzhjYnFERVVram44Y1FUT3RyOVNKRVl0?=
 =?utf-8?B?VlFzZjkvREV6MWhPV1R4QkpMdDVCUGg0aE1VM2xBRkxicnBHOE5ERUp3eGRZ?=
 =?utf-8?B?U0tieEc2aTN3MDRPOTlGbGFwbENhTGtBRGEzZk1KN0pFa0g5UXVmNmtaNHZC?=
 =?utf-8?B?dkUvTFhzRW05MUFtY01WTHZwSHJxUFFmRzNISWFVQ3lRcTV1MDBodm85Z1JL?=
 =?utf-8?B?citxM3NMSXVHcXk4b3V2amNyVDY0VVpCbnUvZlpraDQwZzgvYkRva08zVDB2?=
 =?utf-8?Q?KPVKl1fjlSXDymFexE=3D?=
Content-ID: <D513638C5A3438429CBEA131A89B3DD0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8d5c38-d7e3-409e-802b-08d8d8e186fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 16:30:41.6134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lYvEVvEjKOzOgTU8f5M+WP3r2WbdQ2I3hy32V3KkcoOz+khDR9p5gkyFx4tVzs9jyhCbdMbeVfKS2KE/uTbSdSeirNBK7PHC6171sjxGiNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_113048_094507_B11AA040 
X-CRM114-Status: GOOD (  19.03  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMi8yNC8yMSA2OjI0IFBNLCBZYWxpYW5nLldhbmcgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSGksIFR1ZG9yDQo+IA0KPiBPbiAyLzI0LzIxIDE6
MzEgQU0sIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IFtQbGVhc2Ugbm90
ZTogVGhpcyBlLW1haWwgaXMgZnJvbSBhbiBFWFRFUk5BTCBlLW1haWwgYWRkcmVzc10NCj4+DQo+
PiBPbiAyLzIzLzIxIDY6MzYgUE0sIFlhbGlhbmcuV2FuZyB3cm90ZToNCj4+PiBFWFRFUk5BTCBF
TUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBr
bm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pg0KPj4+IEhpLCBUdWRvcg0KPj4gSGksIFlhbGlh
bmcsDQo+Pj4gU28gc29ycnkgdG8gcmVwbHkgc28gbGF0ZSwgbm93IEknbSBjb21taXR0ZWQgdG8g
c29sdmluZyB0aGlzIHByb2JsZW0uDQo+Pj4gQWZ0ZXIgY2hlY2tpbmcgb3ZlciBzaXh0eSBkYXRh
c2hlZXRzIGFuZCBhbG1vc3QgYXQgbGVhc3Qgb25lIGRhdGFzaGVldA0KPj4+IGZvciBlYWNoIGZh
bWlseSBvZiB0aGUgbWFudWZhY3R1cmVycywgSSBjYW4gZmluYWxseSBkZXZpbGVyIHNvbWUNCj4+
PiBjb25jbHVzaW9ucy4NCj4+IEdyZWF0ISBUaGFua3MgZm9yIGRvaW5nIHRoaXMhDQo+Pg0KPj4+
IDEuIFJEU1IyKDA3SCkgaW5zdHJ1Y3Rpb24gaXMganVzdCB1c2VkIGJ5IFNwYW5zaW9uIG1hbnVm
YWN0dXJlci4NCj4+IFRoZW4gd2UgY2FuIGRlZmluZSBpdCBhcw0KPj4gI2RlZmluZSBTUElOT1Jf
T1BfU1BBTlNJT05fU1IywqDCoMKgwqDCoMKgwqDCoMKgIDB4MDdoDQo+Pg0KPj4gYW5kIGRlZmlu
ZSBpdHMgcmVsYXRlZCBzdGF0aWMgZnVuY3Rpb24gaW4gc3BhbnNpb24uYy4NCj4+DQo+Pj4gQXMg
Zm9yIGFsbCBvdGhlciBtYW51ZmFjdHVyZXJzLCBtb3N0IGNvbW1vbiBpbnN0cnVjdGlvbnMgZm9y
IHJlYWRpbmcgU1IyDQo+Pj4gaXMgIjM1SCIswqAgYW5kICIxNUgiIGlzIGZvciByZWFkaW5nIFNS
My4gU29tZSBtYW51ZmFjdHVyZXMgaGF2ZSBzcGVjaWZpYw0KPj4+IHJlZ2lzdGVycyB0aGF0IGFy
ZSBzaW1pbGFyIHRvIHN0YXR1cyByZWdpc3Rlciwgc3VjaCBhcyAiSW5mb3JtYXRpb24NCj4+PiBS
ZWdpc3RlciIsICJTdXNwZW5kIFN0YXR1cyBSZWdpc3RlciIsICJFeHRlbmRlZCBSZWFkIFJlZ2lz
dGVyIiwNCj4+PiAiU2VjdXJpdHkgUmVnaXN0ZXIiLCAiRmxhZyBTdGF0dXMgUmVnaXN0ZXIiIGFu
ZCBhbHNvIGhhdmUgc3BlY2lmaWMNCj4+PiBpbnN0cnVjdGlvbnMgZm9yIHJlYWRpbmcgdGhlbSwg
c3VjaCBhcyIyQkgvMDlILzgxSC8yQkgvNzBIIi4NCj4+IEFyZSB0aGVzZSBjb21tb24gdG8gbW9y
ZSBtYW51ZmFjdHVyZXJzPyBJZiB5ZXMsIGl0IHdpbGwgaGVscCB1cyB0byBpbmZvcm0NCj4+IHVz
IHRvIHdoaWNoIG1hbnVmYWN0dXJlcnMgYWxsIHRoZXNlIG9wcyBhcmUgY29tbW9uLCBpdCB3aWxs
IHNwYXJlIHVzIHRvDQo+PiBza2ltIHRocm91Z2ggZGF0YXNoZWV0cyBsYXRlciBvbi4NCj4gSWYg
bm90IGNvbnNpZGVyaW5nIHRoZSBudW1iZXIgb2YgY2hpcHMgd2Ugc3VwcG9ydGVkIGluIGVhY2gg
bWFudWZhY3R1cmUNCj4gLCAiMzVIIiBhbmQgIjE1SCIgYXJlIG1vcmUgY29tbW9uIGluc3RydWN0
aW9ucyB1c2VkIGFtb25nIG1hbnVmYWN0dXJlcyAuDQo+ICIzNUgiIHRvIHJlYWQgU1IyIGlzIHVz
ZWQgaW4gInNwYW5zaW9uIiwgImF0bWVsIiwgImVzbXQiLCAiZ2lnYWRldmljZSIsDQo+ICJ3aW5i
b25kIiBtYW51ZmFjdHVyZXMuDQo+ICIxNUgiIHRvIHJlYWQgU1IzIGlzIHVzZWQgaW4gImdpZ2Fk
ZXZpY2UiLCAid2luYm9uZCIgbWFudWZhY3R1cmVzLg0KPiAiMzNIIiB0byByZWFkIFNSMyBpcyB1
c2VkIGluICJzcGFuc2lvbiIgbWFudWZhY3R1cmUuDQo+ICIwOUgiIHRvIHJlYWQgU1IyIGFuZCAi
OTVIIiB0byByZWFkIFNSMyBhcmUgdXNlZCBpbiAieG1jIiBtYW51ZmFjdHVyZS4NCj4gDQo+IEFz
IGZvciBTUi1zaW1pbGFyIHJlZ2lzdGVycywgdGhleSBhbHdheXMgdXNlZCBieSBtYW51ZmFjdHVy
ZXMgYWN0aW5nIGFzDQo+IGEgc3VwcGxlbWVudCBvZiBTdGF0dXMgUmVnaXN0ZXIsIGJ1dCB3aXRo
IGEgZGlmZmVyZW50IG5hbWUuDQo+ICJlb24iIHVzZXMgIjJCSCIiMDlIIiB0byByZWFkICJJbmZv
cm1hdGlvbiBSZWdpc3RlciIgYW5kICJTdXNwZW5kIFN0YXR1cw0KPiBSZWdpc3RlciINCj4gImlz
c2kiIHVzZXMgIjgxSCIgdG8gcmVhZCAiRXh0ZW5kZWQgUmVhZCBSZWdpc3RlciINCj4gIm1hY3Jv
bml4IiB1c2VzICIyQkgiIHRvIHJlYWQgIlNlY3VyaXR5IFJlZ2lzdGVyIg0KPiAibWljcm9uIiBh
bmQgInN0IiB1c2VzICI3MEgiIHRvIHJlYWQgIkV4dGVuZGVkIFJlYWQgUmVnaXN0ZXIiDQo+Pj4g
Mi4gUkRTUjIoMDdIKSBpbnN0cnVjdGlvbiBpcyBub3QganVzdCBleGlzdGVkIGluIFNwYW5zaW9u
ICJTMjVGTC1MIg0KPj4+IGZhbWlseSwgYWxzbyBleGlzdGVkIGluIFNwYW5zaW9uIlM3OUZMLVMs
IFM3MEZTLVMsIFMyNUZMLVMsIFMyNUZTLVMsDQo+Pj4gQ1lSUywgQ1kxNUIvVi1TTiIgZmFtaWxp
ZXMuIFdlIGp1c3QgaGF2ZW4ndCB1c2UgaXQgYmVmb3JlLCBpdCBoYXMgYmVlbg0KPj4+IHRoZXJl
IGZvciBhIGxvbmcgdGltZS4NCj4+IENvb2wsIGl0IGNhbiByZXNpZGUgaW4gc3BhbnNpb24uYyB0
aGVuLg0KPj4NCj4+PiAzLiBNYW55IG1hbnVmYWN0dXJlcnMgYXJlIHVzaW5nIENMU1IoMzBIKSBp
bnN0cnVjdGlvbiwgYnV0IHRoZSBmdW5jdGlvbnMNCj4+PiBhcmUgZGlmZmVyZW50Lg0KPj4+IFRo
ZSBtb3N0IGNvbW1vbiBmdW5jdGlvbiBvZiAiMzBIIiBpbnN0cnVjdGlvbiBpc8KgIHRvIHJlc3Vt
ZSB0aGUNCj4+PiBzdXNwZW5kZWQgYml0cywgYnV0IGluIG1hbnkgU3BhbnNpb24ncyBwcm9kdWN0
cyAsIHRoZSBmdW5jdGlvbiBpcyB0bw0KPj4+IGNsZWFyIFBfRVJSIGFuZCBFX0VSUiBiaXRzLiBJ
biBzb21lIG90aGVyIFNwYW5zaW9uJ3MgcHJvZHVjdHMoc3VjaCBhcw0KPj4+IFMyNUZTLVMpLCBT
cGFuc2lvbiBwcm92aWRlZCBhIGNvbmZpZ3VyZSByZWdpc3Rlciwgd2hpY2ggY2FuIG1ha2UgIjMw
SCINCj4+PiBpbnN0cnVjdGlvbiBleGVjdXRlIHRoZSBhbHRlcm5hdGl2ZSByZXN1bWluZyBzdXNw
ZW5kZWQgYml0cyBmdW5jdGlvbg0KPj4+IGxpa2Ugb3RoZXIgbWFudWZhY3R1cmVycy4NCj4+IFdo
aWNoIG90aGVyIG1hbnVmYWN0dXJlcnM/IEl0IHdpbGwgaGVscCB1cyBsYXRlciBvbi4NCj4gU3Bh
bnNpb24gIlM3OUZTLVMiIlM3MEZTLVMiIlMyNUZTLVMiIGZhbWlsaWVzIHByb3ZpZGVkIHRoZSBh
bHRlcm5hdGl2ZQ0KPiByZXN1bWluZyBmdW5jdGlvbiBmb3IgIjMwSCIgaW5zdHJ1Y3Rpb24sIGl0
IGNhbiBiZSBjb25maWd1cmVkIHdpdGgNCj4gQ29uZmlndXJhdGlvbiBSZWdpc3RlciAzLg0KPiBT
cGFuc2lvbiAiUzc5RkwtUyIsIlMyNUZMLVMiLCJTMjVGTC1QIiwiUzI1RkwtTCIsIkNZUlMxNkIi
IGZhbWlsaWVzIHVzZQ0KPiAiMzBIIiBpbnN0cnVjdGlvbiBqdXN0IHRvIGNsZWFyIFBfRVJSIEFO
RCBFX0VSUiBiaXRzDQo+IFNwYW5zaW9uICJTMjVGTC1LIiwgIlMyNUZMLUEiLCAiQ1kxNUIvVi1T
TiIgZmFtaWxpZXMgZXZlbiBkb24ndCB1c2UNCj4gIjMwSCIgaW5zdHJ1Y3Rpb24uDQo+Pg0KPj4g
V2UgY2FuIGRlZmluZSB0aGUgb3AgdGhhdCBjbGVhcnMgdGhlIFBfRVJSIGFuZCBFX0VSUiBiaXRz
IGluIHNwYW5zaW9uLmM6DQo+PiAjZGVmaW5lIFNQSU5PUl9PUF9TUEFOU0lPTl9DTFNSwqDCoMKg
wqDCoMKgwqDCoMKgIDB4MzBoDQo+PiB3aXRoIHN0YXRpYyBmdW5jdGlvbiBpbiBzcGFuc2lvbi5j
DQo+Pg0KPj4gVGhlIG9wIHRoYXQgaXMgdXNlZCBhdCByZXN1bWUsIGNhbiBiZSBsYXR0ZXIgYWRk
ZWQgaW4gdGhlIFNQSSBOT1IgY29yZS4NCj4+DQo+Pj4gNC4gUF9FUlIgYW5kIEVfRVJSIGJpdHMg
YXJlIGV4aXN0ZWQgaW4gbWFueSBtYW51ZmFjdHVyZXJzLCByZXNpZGUgaW4NCj4+PiBzcGVjaWZp
YyByZWdpc3Rlciwgc3VjaCBhcyAiSW5mb3JtYXRpb24gUmVnaXN0ZXIiIkZsYWcgU3RhdHVzIFJl
Z2lzdGVyIg0KPj4+IGFuZCBzbyBvbiwgYW5kIHRoZSBpbnN0cnVjdGlvbnMgZm9yIHJlYWRpbmcg
dGhvc2UgcmVnaXN0ZXIgYW5kIGNsZWFyaW5nDQo+Pj4gdGhlIEVSUiBiaXRzIHZhcmllcyBhY2Nv
cmRpbmcgdG8gdGhlIGRpZmZlcmVudCBtYW51ZmFjdHVyZXIuDQo+PiBBZ2FpbiwgaWYgdGhpcyBp
cyBmcmVzaCBpbiB5b3VyIG1pbmQsIGl0IHdvdWxkIGhlbHAgdG8gc2F5IHdoaWNoIG1hbnVmYWN0
dXJlcg0KPj4gYW5kIHdoYXQgaW5zdHJ1Y3Rpb25zLg0KPiBDaGVjayBhYm92ZSBjb21tZW50cy4N
Cg0KR3JlYXQsIHRoYW5rcyENCg0KPj4+IEJhc2VkIG9uIHRoZSBmYWN0cyBhYm92ZSwgYW5kIHRv
IHJlc29sdmUgdGhlIG9yaWdpbmFsICJzcl9yZWFkeSIgcHJvYmxlbQ0KPj4+IHdpdGhpbiAiUzI1
RkwtTCIgZmFtaWx5IG9mIFNwYW5zaW9uLCBJIHRoaW5rIHRoZSBzb2x1dGlvbiBpcyBub3QgbXVj
aA0KPj4+IGRpZmZlcmVudC4gV2UgbmVlZCBhICJzcl9yZWFkeSIgZnVuY3Rpb24gcG9pbnRlciBh
bmQgbWF5YmUgYSBuZXcgZmxhZyB0bw0KPj4+IG1hcmsgdGhlIHR3aXN0ZWQgc3RhdHVzwqAgcmVn
aXN0ZXIuwqAgQWN0dWFsbHkgSSBoYXZlIG1hZGUgYSByb3VnaCBmaXgNCj4+IHNyX3JlYWR5IGZ1
bmN0aW9uIHBvaW50ZXIgc2hvdWxkIGJlIGVub3VnaC4gVGhlIGRlZmF1bHQgdmFsdWUgZm9yIGl0
IHdpbGwNCj4+IGJlIGluaXRpYWxpemVkIGluIHRoZSBTUEkgTk9SIGNvcmUsIGFuZCBmb3IgeW91
ciB1c2UtY2FzZSwgeW91IGNhbiB1cGRhdGUNCj4+IGl0IGluIHlvdXIgbWFudWZhY3R1cmVyIGRy
aXZlci4NCj4+DQo+Pj4gYmFzZWQgb24gdGhhdChub3QgaW5jbHVkZSBmaXhpbmcgc3BpX25vcl94
cmVhZF9zciBhbmQNCj4+PiBzcGlfbm9yX2Zzcl9yZWFkeSkuIFdvdWxkIGxpa2UgdG8gbGVhcm4g
eW91ciBzdWdnZXN0aW9ucyBiZWZvcmUgZ29pbmcNCj4+PiBmdXJ0aGVyLg0KPj4gd2Ugc2hvdWxk
IGJlIGdvb2QuIFRyeSBhIHNtYWxsIHBhdGNoIGFuZCBhaXIgaXQuDQo+IFNvLCBtYXliZSBJIGNh
biBjb250aW51ZSB0aGUgZml4aW5nIHdvcmsgbm93ID8gQmFzaW5nIG9uIHRoZcKgIG1hY3JvIGFu
ZA0KPiB0aGUgc3RyYXRlZ3kgeW91IHN1Z2dlc3RlZCBhYm92ZS4NCj4gT3B0aW1pemluZyB0aGUg
b3JpZ2luYWwgInNyX3JlYWR5IiBmdW5jdGlvbiB3b24ndCBiZSB0b28gZGlmZmljdWx0IEkgdGhp
bmsuDQo+IA0KDQpZZXMsIHBsZWFzZS4gTGV0IHVzIGtub3cgaG93IGl0IGdvZXMuDQoNCkNoZWVy
cywNCnRhDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
