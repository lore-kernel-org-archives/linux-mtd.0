Return-Path: <SRS0=b8TW=K6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B532C07E94
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 12:52:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9CA560FDA
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 12:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9CA560FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XogiOV68peIb8ID63W1sAe1T3JVFMQ1SWVthe6mxqPQ=; b=4mkPisvwkyHcto
	E/kDBpM4fwZY/olFiAT7bFLthNDIP/Z4Fim9wLnICD48chIXpt/7321eWZyiyh+zImh/H0GhSno/z
	Yf2HXdyYWsNIsADmCIBqsbWITT3zO7KDfcbvOVVMnrqc65siPUb5yilCEIv2XNG6MhFXW0MwUD5vJ
	6iM1ydNxLjP/ch/GmDxMaPIUjUOLskCbBuXIwmQgtpuC/TDdezpYJNVpKBh+N4CJUVq6Byk/zjWJv
	cg+QfvuO13kM+7XYFnaLgTpYOKwwqX1mvleU+ZWspD0gHvSDw/7I/7DZyhN5B9kG7EYocii23r4lw
	r32KIaAN198dyagWwwzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp9IH-00DZTn-Gl; Fri, 04 Jun 2021 12:51:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp9IC-00DZT2-MW
 for linux-mtd@lists.infradead.org; Fri, 04 Jun 2021 12:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1622811077; x=1654347077;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lRKzQsixmSyyGSVpUwF0bj4nEBs9wdPsIGfEfVk1dDo=;
 b=ddI5YUg1MPao13H37AHQ6VAlEEV9YpVWHC3tgNYQeWdwS+f9/Z3qZ62z
 RXF/EJkU5N6RUaRRElAuiv/c7lXSCQ2ZjW3tvzLT7nGZ4lYZM6ApVPA4e
 oi1mQt/lS4IFBGQMTDb+aY6pk/wVfTItsvym9PL176XsOA8gBhjn70nFZ
 2btfN6gLYwoVQ8WbXe1AucNjuSKncB0S4kf6vYySazMsaKbOF/DefqED/
 2Q1If68O23NHD+fKN7L18RrN6+rz3HbZEKtX22oM2IEAlCZ3Ynu22E3TR
 d6bbVL5EFCtB97U60UurzNOdFn7UqRFldHSeRwMmYPtZbdDxUymHWdk2V A==;
IronPort-SDR: vplrv+VEQYlEC32Kv6RM10+aVB02mXtjscDdzkwHGiZZ94GUDaCzxLabD/tFAkRBEZS5EHsDjG
 HKZSDskFZxSWx9ECzwmxPpo/Lo7iM1viguUz5ttvv598BAHGcXMsI6zaOted5/QKwhIIuc51Lf
 dp/nx8sChFzBUzmrfdEEccdJuDEsbSkgclg3NuKg1K2Do7PJ8x1wZ85CDJvTd2MAYkjRl0acXI
 CIki75VCuMLD//5fq6+A7SRv/S6sDU0rhB8C3CKQcwoDZCprsyoxE1inUzQ1BqzTcgxXEqfEVe
 LE0=
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="123552048"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Jun 2021 05:51:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 05:51:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Fri, 4 Jun 2021 05:51:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGRUhY21leX7vovBDnnv7xblcPYTQgAv5opXUR6Sq+SvqDeFzvbsEFtg6G44jo5suEpXHgyYo55h4Wpl3cMcKbShK5BW7pCJqsIAUuJpDmM5taO3m1EdTqHaDQAooi53LUbvfSkwESixgFyiPcVG/uJfUMepTXrglMMh0YbYghARnNIOP0RGvuGMtA0BoOIdBl8H89mIxoDp7G0F+rR5/JZbvecuQSfWC+uvltNgFuCq1IoWYTMiXENyRNvXG2MrLv1Lf4mQG08q1O9gId0VPkRX2MmnDvF8RsUqVif5rOZQDimTcFbEfh1s1htBZ++8rLmZTA8NShrPZlqONCArWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRKzQsixmSyyGSVpUwF0bj4nEBs9wdPsIGfEfVk1dDo=;
 b=kh/RmKfJMBxGaidEsVhO4+aWy44qaqJfRnTMezdZGlzYHc2xPvrGAymIiGpEszlA2bKunOoRbNoyQS1mAs0uQRtS4QsZtSy4MV5LAZEeDCIlG8YItDOxCQjNuRLqZ9GBwIu57ex8/B1OexYBP8jiRu7UkO+bPleEVPiwXU2dmAlaYyq3sw07Dn7ee53vQA5dNzvL8CTOoMF76ydRGvbTDmrvHLtm3HufMVb//Ek1aik1a0elMofhDRiBnd+dSMMWzJGnmeielpQFEWnSCMQcEBie/UbkVRrYrzOoyM3ptkxRdbFw3s4cNz/97wAR1N9mNeh3OsZiS0Zg9mPFSKOGww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRKzQsixmSyyGSVpUwF0bj4nEBs9wdPsIGfEfVk1dDo=;
 b=s8Kc7E42RWdCinb7LH9pJ6trL26n8dB2DV4paKIIVX4l+IqcviTz8sKVVNduEK80xKZzlWKVD8e/xvLo6u/SBQIMb1JBQRxOrInhdzH4fkN2ZxsH5crvXjEbQshyeC0TyrnBneHqh1Hsh96JHXWk2WzVXkwOr4EAfWboSmeglqU=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MWHPR11MB1407.namprd11.prod.outlook.com (2603:10b6:300:26::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 12:51:07 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370%4]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 12:51:07 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v5 5/5] mtd: spi-nor: otp: implement erase for Winbond and
 similar flashes
Thread-Topic: [PATCH v5 5/5] mtd: spi-nor: otp: implement erase for Winbond
 and similar flashes
Thread-Index: AQHXWUBIr2GjRJwDcE6xSP4dVP0iHA==
Date: Fri, 4 Jun 2021 12:51:07 +0000
Message-ID: <2e9a403d-e38a-32d8-e46c-c9a0a79d6576@microchip.com>
References: <20210604100252.9975-1-michael@walle.cc>
 <20210604100252.9975-6-michael@walle.cc>
In-Reply-To: <20210604100252.9975-6-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac49d679-b201-4970-80ad-08d927576be1
x-ms-traffictypediagnostic: MWHPR11MB1407:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1407C6981623732C38811D6EF03B9@MWHPR11MB1407.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J65d28uUUxltW9+CdUJSVmOFlWutaOwGhi06VDWhKaRYFzNdy1pf45lAlk4LJ5j68Sd2l+Uj/NAwIedCfq/wRLpOlVCXlWptN96fPVQqypLx/+kgnoSXKgvaIbl1CKHQkcn3lFKMofFBGhW+H3gz6DWTiiwjtaIq4JCyFIKMuQvFYP6Q8hmAG+B7BlWkN9z4u5/Q9SeyRz8zLC0GOtyIcEaRIeiaddCOk7Tk+iZcIF7o8da1PMOM2V/vx6JmgxvqgwpeZsX3ULoQ2o7LRjyb+PrpfaSBZCMmrERnyB+B5wGt56C2w+/nKtF8YgpgT6n0h46NoRiGXAGplGrLYOz6dxEGAOI++mfPuYSJVoavpVTDjquHe/Av4hyMHYC0X1xzTHhOuyiTysm+P7/5IQArLXcjamMIRJu5k3KsJj35FpHAxFmlvjyUrZBzw/8V6jL0Z4gdaraZR8XDzCmlRsLV5sBm0GlZ7RJYYKHxzRU6JhLwucUcrJlayu3OLgSBaFBod0LBJA+aRbfv9LfHn878fs0dyY8BXhNARlHJ5mRB7si/ddOAaPz8FADRQRD36xr4xsZP4sqVM/fDQtNY1uqcMDKgp/WyvVOhp//9jIS6XSH/vYi1bYC8VkPKmU4AbATvJm27eN4X/XXMbPUTydokVrh+aXVbSdNHSYtfM7iSQTiXua+V5iAS5Lah23ZQMDif
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(136003)(396003)(39860400002)(366004)(122000001)(38100700002)(8936002)(71200400001)(6506007)(31696002)(53546011)(8676002)(6512007)(83380400001)(26005)(6486002)(478600001)(86362001)(4326008)(186003)(2906002)(316002)(110136005)(54906003)(31686004)(66946007)(91956017)(36756003)(66476007)(5660300002)(2616005)(64756008)(66556008)(76116006)(66446008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NnMwYWVEMUhjc2R3bktBY29ZVGgzZEJFclRvYU1wRXNKTGZXVG9laTJoYnBL?=
 =?utf-8?B?R3I4b3ZGbmxxMjhKYUlIZEtqVkRGY3ptZG9MZ2hyQ1NIcTA3TGlSbWYzeGdu?=
 =?utf-8?B?QnErTldqZFFlN2xydjJtN2FPMmZyeWNaeTdvZldhbVBPVjZkMUcxZUd3OTFR?=
 =?utf-8?B?K00rUG15ejh2V2NaOU9NbW1rd2lWMkE5cWtQUnNGWnlrZ09DL1Y2RkZBZStL?=
 =?utf-8?B?YUNFOXhZQWU3UzBxMGJ0ZmdNRldmUHJwK0lmMWh5dDV1dzQycmtqT2E5MHFF?=
 =?utf-8?B?TTNIeExVdzQ1dzNNbndQYmRSMGovc2ZtQjFORkhGTUFLbnRHT2U2S2RDczE5?=
 =?utf-8?B?WVVsL2ZJdVhuMEhCVWdFVERMVkdWdHZzVHpoN2Z5Z3hKdHZjRm5MNmt1Rmpk?=
 =?utf-8?B?YXFPUXlWSjJiSllpdGkreGFsUitWblR0bWlMWlY4Uit1aUozcFFkanRYTmk1?=
 =?utf-8?B?dUJuMGhrMEVzaEM1ZmxVMytnOWZjRWNnYzd6UGxwV0d1TnVwSjkwMDlxNGQw?=
 =?utf-8?B?ZjV1bzQxNFVVSSt2M3lGTnlRd0pBWGpHVDNvVkZqNytXV3IrcXh4ZElqS0hn?=
 =?utf-8?B?VG5QYkdlV1RRc3pLSm5XVTJFQmtaV0VtU3RFQklYaFVaNU9hcXRqK3R1VVdv?=
 =?utf-8?B?S1ZRb08rcFZWbkF3K09NMFlMY1d5VUhLRW9rYmhaZUZBQjUzaTR1aHFUTXQ1?=
 =?utf-8?B?Z0hDWXYxVkVaTzdiV3V1QWJKRVRSSU1QdHBIMXVtd3JjdnEzMUhuN1JWcTVi?=
 =?utf-8?B?M1RGQnphbFNFQ2dPemVxQ3pCeXVnbGhML0RLWVdGaENMeW9mZk44MHZvNUM0?=
 =?utf-8?B?Y1hBRGFPek9NYy9iSUwxNHY4VXJtaGNmd1lEbTVzdVpzMyswK3RFOUVCUEM0?=
 =?utf-8?B?dzAwOHVPSVJGTnVRR0EvLzFRQjJwdVdXSFdxRC9FdlVpVEN0R3JYeU81L0s2?=
 =?utf-8?B?RzZwYVlvTkx5NEh3WUJKejJtVHlCUVRoZGRaeXh5cXg4RXBQK1RRdVZYN2sr?=
 =?utf-8?B?Ti9adVcrY2JqYjJ2RmFzY0ZWL1VUVXFpMWFzd2FTcjFjY2dXNm1YY3MxT1pC?=
 =?utf-8?B?YXBBbWd4TmtEQUFvNm8yVTdmTi9vRVQ5ZlI3cUlYa2I5Ty92aGc3bUc4ems4?=
 =?utf-8?B?dDBoWVNlUDFidmxKZFJka0Vsb2VSRW1JK0Z3Rkdpa0k3Uzl0MGpRdzhwNlpx?=
 =?utf-8?B?QVJ3eXpmZmtNTVRKelFNaWJKTHY5cUpTb0E5b1ZHaitxYVkzeUNhdFhrMVBS?=
 =?utf-8?B?RkpXU0U2YWtFeVdKV0gwQlVHdnpKKy9PQWhrdnpMYVR4Y2JoOXU5d3lSU3BP?=
 =?utf-8?B?YlJObEpCV0ZQSDZwVGlNNEJWcGZHdmszaHErRWU4T3MxeWgwaHE0YUVKRTJP?=
 =?utf-8?B?djAxUmNhSjhIWFk4QnRYbXAxdzRHRGJTTjM3OTdYZ0FGblBhUXhtS3RZcTlJ?=
 =?utf-8?B?ZzlMSyt2aFl1UEp0K2RYYjE4VENDMmdaU3M4V1AyRjhaamtvNDlneG9vb0s4?=
 =?utf-8?B?YmlvdjBMYjNMK0h0OE83U0Q5djVPRCtIVjBwNDE1dHMrSzF6Q0xxcFd4eEov?=
 =?utf-8?B?bWR5NXQ0NFdWb1VnT3hyYzJDMi9UcGVzUzJZbWlPVmlHUU5oYjR4b3ZMNXE3?=
 =?utf-8?B?dk1GN0lhK1Q5SFA1WmF5RWZ1UFVMclBtbmVMcG8wYXdLbnJOOEZlcmxGaU55?=
 =?utf-8?B?N3dzaDNTZGFKdG9iaU82NjFPbjB0UzE4amkwTXMwblpKU0xUc0Q3S1FTbk1U?=
 =?utf-8?Q?zlbRqmT9Ya7RA+hHe4=3D?=
Content-ID: <7E42EB8E1428474EB0A7AAD980E5DE00@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac49d679-b201-4970-80ad-08d927576be1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 12:51:07.1212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: icgwbI/iZ9ZqrLx+FR/4Ddy2rNfHE5woOEFMQRKg7Ls4wOLXH4yKd9z4XGOXKrj0U7w5TlZc9vA6/WYg86ckF/5UX0XLXbdj+DfskjaZME0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_055116_778445_9767D6D1 
X-CRM114-Status: GOOD (  26.86  )
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

On 6/4/21 1:02 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Winbond flashes with OTP support provide a command to erase the OTP
> data. This might come in handy during development.
> 
> This was tested with a Winbond W25Q32JW on a LS1028A SoC with the
> NXP FSPI controller.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/core.c    |  2 +-
>  drivers/mtd/spi-nor/core.h    |  4 ++
>  drivers/mtd/spi-nor/otp.c     | 86 +++++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/winbond.c |  1 +
>  4 files changed, 92 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f6a6ef2d8bd8..a21b0085de05 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1318,7 +1318,7 @@ static u32 spi_nor_convert_addr(struct spi_nor *nor, loff_t addr)
>  /*
>   * Initiate the erasure of a single sector
>   */
> -static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
> +int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>  {
>         int i;
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 28a2e0be97a3..9398a8738857 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -207,6 +207,7 @@ struct spi_nor_otp_organization {
>   * @read:      read from the SPI NOR OTP area.
>   * @write:     write to the SPI NOR OTP area.
>   * @lock:      lock an OTP region.
> + * @erase:     erase an OTP region.
>   * @is_locked: check if an OTP region of the SPI NOR is locked.
>   */
>  struct spi_nor_otp_ops {
> @@ -214,6 +215,7 @@ struct spi_nor_otp_ops {
>         int (*write)(struct spi_nor *nor, loff_t addr, size_t len,
>                      const u8 *buf);
>         int (*lock)(struct spi_nor *nor, unsigned int region);
> +       int (*erase)(struct spi_nor *nor, loff_t addr);
>         int (*is_locked)(struct spi_nor *nor, unsigned int region);
>  };
> 
> @@ -503,10 +505,12 @@ ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
>                           u8 *buf);
>  ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
>                            const u8 *buf);
> +int spi_nor_erase_sector(struct spi_nor *nor, u32 addr);
> 
>  int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);
>  int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
>                            const u8 *buf);
> +int spi_nor_otp_erase_secr(struct spi_nor *nor, loff_t addr);
>  int spi_nor_otp_lock_sr2(struct spi_nor *nor, unsigned int region);
>  int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int region);
> 
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index 89fe52e3851a..983e40b19134 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -120,6 +120,38 @@ int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
>         return ret ?: written;
>  }
> 
> +/**
> + * spi_nor_otp_erase_secr() - erase a security register
> + * @nor:        pointer to 'struct spi_nor'
> + * @addr:       offset of the security register to be erased
> + *
> + * Erase a security register by using the SPINOR_OP_ESECR command.
> + *
> + * For more information on the term "security register", see the documentation
> + * of spi_nor_otp_read_secr().
> + *
> + * This method is used on GigaDevice and Winbond flashes.
> + *
> + * Return: 0 on success, -errno otherwise
> + */
> +int spi_nor_otp_erase_secr(struct spi_nor *nor, loff_t addr)
> +{
> +       u8 erase_opcode = nor->erase_opcode;
> +       int ret;
> +
> +       ret = spi_nor_write_enable(nor);
> +       if (ret)
> +               return ret;
> +
> +       nor->erase_opcode = SPINOR_OP_ESECR;
> +       ret = spi_nor_erase_sector(nor, addr);
> +       nor->erase_opcode = erase_opcode;
> +       if (ret)
> +               return ret;
> +
> +       return spi_nor_wait_till_ready(nor);
> +}
> +
>  static int spi_nor_otp_lock_bit_cr(unsigned int region)
>  {
>         static const int lock_bits[] = { SR2_LB1, SR2_LB2, SR2_LB3 };
> @@ -360,6 +392,59 @@ static int spi_nor_mtd_otp_write(struct mtd_info *mtd, loff_t to, size_t len,
>         return spi_nor_mtd_otp_read_write(mtd, to, len, retlen, buf, true);
>  }
> 
> +static int spi_nor_mtd_otp_erase(struct mtd_info *mtd, loff_t from, size_t len)
> +{
> +       struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +       const struct spi_nor_otp_ops *ops = nor->params->otp.ops;
> +       const size_t rlen = spi_nor_otp_region_len(nor);
> +       unsigned int region;
> +       loff_t rstart;
> +       int ret;
> +
> +       /* OTP erase is optional */
> +       if (!ops->erase)
> +               return -EOPNOTSUPP;
> +
> +       if (!len)
> +               return 0;
> +
> +       if (from < 0 || (from + len) > spi_nor_otp_size(nor))
> +               return -EINVAL;
> +
> +       /* the user has to explicitly ask for whole regions */
> +       if (!IS_ALIGNED(len, rlen) || !IS_ALIGNED(from, rlen))
> +               return -EINVAL;
> +
> +       ret = spi_nor_lock_and_prep(nor);
> +       if (ret)
> +               return ret;
> +
> +       ret = spi_nor_mtd_otp_range_is_locked(nor, from, len);
> +       if (ret < 0) {
> +               goto out;
> +       } else if (ret) {
> +               ret = -EROFS;
> +               goto out;
> +       }
> +
> +       while (len) {
> +               region = spi_nor_otp_offset_to_region(nor, from);
> +               rstart = spi_nor_otp_region_start(nor, region);
> +
> +               ret = ops->erase(nor, rstart);
> +               if (ret)
> +                       goto out;
> +
> +               len -= rlen;
> +               from += rlen;
> +       }
> +
> +out:
> +       spi_nor_unlock_and_unprep(nor);
> +
> +       return ret;
> +}
> +
>  static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
>  {
>         struct spi_nor *nor = mtd_to_spi_nor(mtd);
> @@ -418,4 +503,5 @@ void spi_nor_otp_init(struct spi_nor *nor)
>         mtd->_read_user_prot_reg = spi_nor_mtd_otp_read;
>         mtd->_write_user_prot_reg = spi_nor_mtd_otp_write;
>         mtd->_lock_user_prot_reg = spi_nor_mtd_otp_lock;
> +       mtd->_erase_user_prot_reg = spi_nor_mtd_otp_erase;
>  }
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 9a81c67a60c6..96573f61caf5 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -139,6 +139,7 @@ static int winbond_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>  static const struct spi_nor_otp_ops winbond_otp_ops = {
>         .read = spi_nor_otp_read_secr,
>         .write = spi_nor_otp_write_secr,
> +       .erase = spi_nor_otp_erase_secr,
>         .lock = spi_nor_otp_lock_sr2,
>         .is_locked = spi_nor_otp_is_locked_sr2,
>  };
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
