Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC81C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:11:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 944AA64F12
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 944AA64F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kb5k/ewBQPcXtP5ktAZhAvu42e3iYPRwcRZ37/E9qMI=; b=XnLD67cAG+MWRzj/g+jkrSm7R
	LbvEWU5dXGvbZPAstZZ7zYaJML6UioC9dm3Gksx2muuqdU6vyBLf7U6KLqPToYMq2u/fFb+S5YZQv
	roT7mwO0xSyUkrDz+dudohYqO5tMewG2sBpPaoJa2dLt324PK5snIxuiTaaNKQQxn56d89C3/UXfY
	lU1p9+JhSkQGDcD8hWxtE4gEPXQvb11l1jDeV7jlAZI5Q9a9tCR8pkQm0f7UBeqSMMgh5yxkuFoeo
	OxEIWuGeZrZwxHxAETp0MqqtCJjvqOtb7NoJr9Ctn7OCUloWN6/36mTVYpcnbu14FxcSgf89FL4BG
	gIAaSUphA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKdo9-00Ay0x-DT; Fri, 12 Mar 2021 09:10:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKdnq-00Axz6-10; Fri, 12 Mar 2021 09:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615540190; x=1647076190;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+Zr0m90Iwo5ugq5zr4Qv+z7Raw6AjkrkqyTJcMqNJ90=;
 b=JRrORRToTt0MNOdJtUr53d5U+XdsRSGrQL5zKpz53+yUKKutWVxgAozC
 gdWtQc2Zk902UfRGvFEP7KUwRmkRIB7ZlePYOaqdrUpSPLqLL9vcA0pL+
 om3c1AexQRhvi5sm3ZBPG1BcXgfvVmrtIkBKYyYdzeV1oygqW3YNMtUJD
 Drv+SaBEPdAtpAzp5AP8xUcmA4KDFZKnzKU1/+lc4SFtKMB8aOrNdxd8N
 2BVhsc8LsD09rG4pjaCd2AZhIYOgKQxwMDzZ3r1UgJt5oonOvV2lL9/zH
 mkPo5cav0HBEn9jhy14E2ktALDTvVgEiFo5MDCSYGGVxGDnceizHwuc29 g==;
IronPort-SDR: /IHsVe6lge3Sd+ifgFSgARMMRYxK70PmkppZngswPz11nqPsbkrJXdzBdylk1dT5YJ8gL9Me5m
 mL7vRTGwRsTW6XULZAYIW8znHxh2tzgDSRfiDJ4TtXV10uq9YY/ZRIFUtUytAvEmLFq79uxnnW
 1o9gwMlhCfTmfY8Yrqz4ivRK7mziLknkkGEl+IzBPB0K0s2PzC0XhSMUAU0LlpR0jZ4S5Plafr
 WO5W5quxeTW4JdvLcjgCv1S2baXY4JyOSsrshIWXyac8S60UsxCJoFxepNB/igNWBPlZHIUA/o
 xlY=
X-IronPort-AV: E=Sophos;i="5.81,243,1610434800"; d="scan'208";a="109732665"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Mar 2021 02:09:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 12 Mar 2021 02:09:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Fri, 12 Mar 2021 02:09:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfL7gdMTrJ6Sra8Ql5dWga/7qf0SMMc6vJ0RQ/xnV4vwKxz5TlNJJ4kPnhUVsd65c7zlXcp/FBmVWbvHv+ieIT5IhjuAa32sHY+8fJlhzliHkNUS5ehUuV/msv4/osvYQN1OFzeDWWK6uayvnOZPJ1HP1e46vEdbZmy1l52quzg1itBqcvozyArck8KRGEocbdckNErchHC2TWplz8SYHDqe+IOXcAdf+JmrTBY2ZE8EPTLS16349jqAWK7k5cEzrD2LquRVElpDC/US80MB9SWE5uybnN/g7jmI/11TRN5akqThHovXvnbBlWQRrNlxwAYik+lTlR3gGIT2A+HrXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Zr0m90Iwo5ugq5zr4Qv+z7Raw6AjkrkqyTJcMqNJ90=;
 b=HBPQC6uO6zRW/YOcRIN0w/TuhdJBSoddOiHR/bPTrxO5gMvDSXghHkt22KiUKv8135Kt1kvlBohhHQNDYrBsuFGV+QJCnq8Rr78LEEgNqiiMQsx0InVg0+r33C5emYuamxDptrIxBNhta3bIPvbDJzClLRY0lDuG/U72ixiMTHCGJz3f1CKND93nuTc7/gB163IxC/hqzDlIKDhPzquuDsIp6vUEp3v3xxMt2kl47dxecgtkz9GQeFaVaarvOkbiFYvRsQ5cCYI3u0kdzVYR9i9RTxMxA06tlTjv+lYaz/qbwmEhlsXCTcsP7LLyMcS3oRPztD4V0poC1NLmzQKQyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Zr0m90Iwo5ugq5zr4Qv+z7Raw6AjkrkqyTJcMqNJ90=;
 b=K6bWo2ZCvg4bQSEXO8wQfwf6A3ua/oPVNc8foy+4iVfPaHwMeWgfxKy1USVB8mOmuW1LXW45IZ8V9Gcc5wsok27AxXFiXrjKuO7ZtgSKVHvE2fFORY2pv6c1ynHi7U4qI92Qrtewe7iAtRZJw7nuxZY2WpdEdDHS478B4Gb48WY=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4793.namprd11.prod.outlook.com (2603:10b6:806:fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Fri, 12 Mar
 2021 09:09:42 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 09:09:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <nm@ti.com>, <kristo@kernel.org>, <robh+dt@kernel.org>, 
 <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>
CC: <lokeshvutla@ti.com>
Subject: Re: [RFC PATCH 0/6] spi: Add OSPI PHY calibration support for
 spi-cadence-quadspi
Thread-Topic: [RFC PATCH 0/6] spi: Add OSPI PHY calibration support for
 spi-cadence-quadspi
Thread-Index: AQHXFx9voVlY5U/87kSEhShnaEXyTw==
Date: Fri, 12 Mar 2021 09:09:42 +0000
Message-ID: <9c551f56-4c00-b41a-f051-8b7e197fbcdc@microchip.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
In-Reply-To: <20210311191216.7363-1-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: a4060122-66a4-4a7a-a6b3-08d8e53692af
x-ms-traffictypediagnostic: SA2PR11MB4793:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB4793DB8BED805DB110AB1CD6F06F9@SA2PR11MB4793.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ixsd2cgPwumLFT+QoArkVCHx76KBzpZu3aF1rcuZJyR8SepkTffvXhPoXkd7DFjX7wq0Ul9+UCKcD3nHolrvaLc4h65GCIDTI8HaeyRA4YUmXr9OZaf3miZ0ew441qAH3sVTQ+v32wZlKFe9kme7zgycIyVim1DrXso01qxf3P8xPpWXTOtSM8f/8Eu+OjGTkNF5zRoIYKbT1Std82XPApqTRNWUtswMRhvKQxfj51yzFkQxhNbnUNF045Y5GDDUypu7utFvAkrElBlR6eRevrgvIs6kEHYlQWfEcLnwyImf5q8NjNl8M9gbHpnPc3PKmRNBuv8xU2VV2B9ZH5L6qqzQh1LjIsQCqwZ5g5etYXQ0aPmGbm1ddwAhcT07PSNUeslfRZBmD2h26n8VxThcgxUfaESCxDJrMGwxQGy8naoPM83/vFSKNEzsRtgs+K43JycpIGDF7gCqhhs2HHDeV2mju3efe/HhtwpCSTEY9GNf57JXHDaAHyfYuIQJU2Dhkjv4XrlqC6qLZvtu8xVymn4uPQq+FQWae5yB2zB/G2xq68Awh1OyZqJ4AY9hLftcDR0IBQBvBsFvIPaP+qJj64IVHMQnYym6fY/Pq6gmIFaY5qBoQ+fK+Bt8IbVFJdyAFw4uCPkCclQ0zyCtsjlO04TwkUE5KzSxccDDsjeppt7J/9mCuV4ePCKZBlu+8ViaP4TTUwhFLEBrcq1mLr3Y1g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39850400004)(136003)(376002)(366004)(346002)(64756008)(53546011)(36756003)(71200400001)(86362001)(76116006)(6506007)(966005)(186003)(66946007)(31696002)(91956017)(2906002)(8676002)(6512007)(316002)(6486002)(66476007)(110136005)(921005)(66446008)(66556008)(478600001)(4326008)(2616005)(7416002)(8936002)(83380400001)(26005)(5660300002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SUF1SWlwRDdUTnpnOUUxSEdXRG9KZ0pjdTMwN2dEbEpHUE9sU3NDbkJ2d0dM?=
 =?utf-8?B?L1YxWmZmSCtJakRMWnEweU1XQ1N2ZE41V0swc2FxREVWcUtxV21yc3h5c3ND?=
 =?utf-8?B?cGk3aGhyVTJocDkrbXNnby9uQ3FXdzRBQUdEVGlSVmZGMDNRcksxNENFcWJx?=
 =?utf-8?B?UkNLSHBVbmhFVXgvSTFOcnd2Z3FjOW50ZmNOWjNMY0lZMC9QUXcrbUF6OEFq?=
 =?utf-8?B?SDMzZFRGeFRUVTVpbVQ3bm96aW9lTlc5Q3E1ZnpyL3hRc0dGa2hRc1hmNkRm?=
 =?utf-8?B?QkZjUzM3d2JzOUJGQm40TS8raDZOWGo0N2FUZERXZmlIZ2NnQWxUdjdObVVP?=
 =?utf-8?B?Q1QwR0dIdDBXM0xlTTZUYStvWkhRSG9ER29pLzVGOGN0dVlnSjhmSWRZREsz?=
 =?utf-8?B?bTZqdFR4V1pDcGdzYU16WldJZkVVVXBIWURLSGRNL3pVWEhQZXE2MTJMd3dy?=
 =?utf-8?B?VWlSZURzU1YyRjZWMjNYWUJuRmVReTlqYWQrRUpUbHBsckxaWGsrbkxLZy83?=
 =?utf-8?B?c3JYNXhRU2ZFTjFHK01RRVJtemZ4V0xaSHU3dGx3SjlBR2YxMWlpOVp5QU5q?=
 =?utf-8?B?d3BvYWExemQ4d3RSR2Q0THBwQ3VSbnh5NDNZemJkaVBOTE9scDRjbkNnRkhB?=
 =?utf-8?B?NzI0MWNlOUdVNnRhVDlhVlBrZzh0NU1iSHNCcFFtcEFXcGxzNVJFUmJoZTFv?=
 =?utf-8?B?WGFCWmU5MldYWDJ6UFZFT1VNajZGSTdmY214U0YrSFpIOXJoYnBUNDdldXlO?=
 =?utf-8?B?NEltSW1mMFViaDdJM3RRd1RqQVBFSDBJVWxrMVV4Zzk4c1B3NGxSdGlYc21V?=
 =?utf-8?B?aktWZkxUTjhqc1E3MkdIcFFseWdsUndIZnBQb2dwQUhUTEJkQ0tIbGwyMUlu?=
 =?utf-8?B?WFhPdVU0NjlqRGkrOVBGRlE3YTJWS29iakNKL1p2OS9odkduandYVmMrWGh0?=
 =?utf-8?B?d1hjMmRweDdBRXk4bTNoQVhyNC84M1Fhd1ZYL1d3Ulc5em9ldjhTU20ranBC?=
 =?utf-8?B?cHZqNWYrdkU2bUQvS1dac2NmQXVxejg2NE1vV21JTlMxaHdNd3R5ZkorMEpC?=
 =?utf-8?B?c3IxTFhid2YwT29XK1I1bnp6VzBTRzc3ZnNscU5raDF1bU5YSW1VaWtCK1Fx?=
 =?utf-8?B?amNWMlVUVi9GWHBpQnd1d0V4WXJxYTllZ1gycmY2bG1SV044MUFMSGFJZzMy?=
 =?utf-8?B?YWhCWkVTQmVYS0REMEI1QzgycEhNN3VSUEh0WUw1ZUtJWk1RenJ2QlBRTldU?=
 =?utf-8?B?K2FDT3RSTTJCTjZxNFhOd3NxSkRpSHBvSStpeUxxb0xkSUp6ZitiL1lIcEdi?=
 =?utf-8?B?cVh1S1dqUGE4Nk5VVkVrRDJtNjA5L1F4R3ZJUXBUNXY3RjhjUUM5YXJHaFly?=
 =?utf-8?B?blBlMW4rcXUzN2hOZ3hsNHJzazN5ZENhc1V1UHhhSUtPZ3pmZXl5NFZsM0Jv?=
 =?utf-8?B?RVAyZktDSHV1NjJEMU5lTTBjQXBCaEZmYjhkQkhUSTVtc1N3blhQTmRPTzdx?=
 =?utf-8?B?RUF0WVJVdFlrTW5Bc1NCRTd6YmVwcXQ1cklzVmF6RURQMmlObmNxTnpaajBt?=
 =?utf-8?B?a2dCd0FjdWNzbkJRUDZXZmw1bnZjRDR0U2Y2eFFLVHorYUtGMGtZQnBucXFV?=
 =?utf-8?B?YnBYQ0oxeDQxNXZZV2ZXdC9hcHdvM0lQckwrcyt3Q2tKRUVTVmpFekZ4cms0?=
 =?utf-8?B?Y3lRQ1gzUEFZTllDS01xeVdzc2w2S3JEeWEzKzdiMHp4TmMxNTdDTGFBZEdH?=
 =?utf-8?Q?h2cuBTc36+2WD2vHXE=3D?=
Content-ID: <B4A408DB1B61EF4381F9E463C332448E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4060122-66a4-4a7a-a6b3-08d8e53692af
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 09:09:42.4197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /aZpRY5ISU8GH84IYIrW++8DkMA3EdlUSAeUplRPt+IPEpnw6Q9+e9dJJ/Cv9SBg6pW8OjlP8EA6dYDvIoy8RZttBJ5M9OqRt/evNBcvHHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_090952_023092_E95B8E95 
X-CRM114-Status: GOOD (  25.16  )
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

On 3/11/21 9:12 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi,
> 
> This series adds support for OSPI PHY calibration on the Cadence OSPI
> controller. This calibration procedure is needed to allow high clock
> speeds in 8D-8D-8D mode. The procedure reads some pre-determined pattern
> data from the flash and runs a sequence of test reads to find out the
> optimal delays for high speed transfer. More details on the calibration
> procedure in patch 5/6.

Can the calibration sequence be avoided if the controller is informed
about the frequency on which the flash operates?

Can you add more details about the optimal delays? Are we talking about
flash's AC characteristics? Is the calibration still needed if the upper
layer informs the QSPI controller about the needed delays?

Cheers,
ta

> 
> The main problem here is telling the controller where to find the
> pattern and how to read it. This RFC uses nvmem cells which point to a
> fixed partition containing the data to do the reads. It depends on [0]
> and [1].
> 
> The obvious problem with this is it won't work when the partitions are
> defined via command line. I don't see any good way to add nvmem cells to
> command line partitions. I would like some help or ideas here. We don't
> necessarily have to use nvmem either. Any way that can cleanly and
> consistently let the controller find out where the pattern is stored is
> good.
> 
> The dts patch depends on [2].
> 
> Tested on TI's J721E EVM.
> 
> [0] https://patchwork.ozlabs.org/project/linux-mtd/patch/20210302190012.1255-1-zajec5@gmail.com/
> [1] https://patchwork.ozlabs.org/project/linux-mtd/patch/20210308011853.19360-1-ansuelsmth@gmail.com/
> [2] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210305153926.3479-2-p.yadav@ti.com/
> 
> Pratyush Yadav (6):
>   spi: spi-mem: Tell controller when device is ready for calibration
>   mtd: spi-nor: core: consolidate read op creation
>   mtd: spi-nor: core: run calibration when initialization is done
>   spi: cadence-qspi: Use PHY for DAC reads if possible
>   spi: cadence-qspi: Tune PHY to allow running at higher frequencies
>   arm64: dts: ti: k3-j721e-som-p0: Enable PHY calibration
> 
>  arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi |  55 ++
>  drivers/mtd/spi-nor/core.c                  |  74 +-
>  drivers/spi/spi-cadence-quadspi.c           | 820 +++++++++++++++++++-
>  drivers/spi/spi-mem.c                       |  12 +
>  include/linux/spi/spi-mem.h                 |   8 +
>  5 files changed, 916 insertions(+), 53 deletions(-)
> 
> --
> 2.30.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
