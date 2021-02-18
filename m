Return-Path: <SRS0=sGI+=HU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3FEC433E6
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 08:50:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD1BB64E76
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 08:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD1BB64E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xd8XfG/He6UGEa+mkxUKyJ3xaVBze5Lz/fnDEov1Fj0=; b=s9N9b+Gvs6m5BOv71CSyVuu5z
	+9sdp6f/EepWoLmxh8sGo3zYLEt6u9nfYUswa//8dhzco6SjNl313z6r9O21GCWzhPnlnSaoqAXDU
	F4YZHuRG4PFt5BSGDT/tv6qGul0piLjYRWIWJGdmmCk6lOUqBkmdSSAWnhNFAXYUIHrkYi5Kn0BJp
	oY/d0OCFZyMVAB/loLREgPGJwPdKfIcGCmimzOe/CrcR3PCpLaAqjQqkj+2HUV0i+YRLjZJ4WdS3w
	RAQBBGwn9Z7P8E+Ca3Z7y5QeQOoFRRatxPkd7BnhVz8Dxi6DZz035i4r826yyToRkfseCrei0mpg5
	fiEbmmSJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCezu-0000kJ-T1; Thu, 18 Feb 2021 08:49:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCezr-0000jf-Fx
 for linux-mtd@lists.infradead.org; Thu, 18 Feb 2021 08:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1613638155; x=1645174155;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WtZnqWQ3WCmpXqroDs8/eLciLZJ5alUB/zYDji7SLzc=;
 b=fIHnfMBVblyeOGj9G3j5SttU0cGo257GuvSsgjZVnf/N0l71hqchl8K+
 ms8vvyRlQdL7QIWRYl008Y6RGki0iYAEUPtniO77ZKnSE/pl6wQlsjPg3
 kyVV/PfirosE+rEle8Emv0PECA/F0o1igK3S+bgTwHB6LzCCwNYV2FkLH
 PxxBFQA4dm71idfFO6pX4uPqrswb4sCybnmYfFOj81jKOUSbzfZHwQWb6
 QVI+KVJoPbRFilyV3NucEEIv7U7K1vFQP/UzM8xPnCwkPDwwOmPEy96HT
 El3J88+T6S3Vm1XoZHY9ADlwDxK8PVGJyq9BKUyorhWROvxjgDYGSPs6P w==;
IronPort-SDR: +l4waZwIteMu84Ve+JEERrFkZHpKPrtgZm2q5sZ+EFxwKaE4G9ju6pmKPaedHNMbRGi8VgddWB
 vntpzX6lgPUWnLRGfEKAkVYpCxBT2REJCJbKnoBWvzqYP3FYXcdP16ZmrjUQKkD+4tag8NHDxZ
 niqoKsZyih5hpktLwKsVHYOr1UyUzYa7TWd3yPHTk9HKYDo79XFpXpU4Eu+u0scYUkAcen/7Uq
 OqWrfh9puVTYeyWEqXMlrALWeVne2CwmobX+v6BcInBXj1TYJz9aqTyvadfi77a6be23S7yiqj
 eAM=
X-IronPort-AV: E=Sophos;i="5.81,186,1610434800"; d="scan'208";a="115642244"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Feb 2021 01:49:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 18 Feb 2021 01:49:13 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 18 Feb 2021 01:49:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvJ4+Tiojei1cbbWO84m8yV8turPXPBa2ELTp/NpLNc9YLkSvkl1rptgO0rZoWmo9HfzGPQw9B3gULznvSNAhrDN9CU0+pDMMJf9MiWyTSp4vqeXN1108kDRp630+UTQ/aJj+wgZUm1u7rfMqgeedg1rDz7STZPS8WtNbEhXxS1R0wAXPxoN72/NaACdmo5ewEbBs5qu4wbvd83w05tqfx/pRvi0J5GVOo+5XqGlSFpcmsHojopp5Rrncf/wyQ7ACy4T21H+9C0vAD6mBEKn9efoOvGov4lTRCan5sPAtamOlxPax7c1fXD0JnO0XHiq8tY+PLYiTtQ4+kywlUppKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtZnqWQ3WCmpXqroDs8/eLciLZJ5alUB/zYDji7SLzc=;
 b=WnskUQG+6MUsNoBlnp17symd4MBHqstA1mTDf6KFmvyE8ZNhWCFcAzwFJE5TyrzdR18dMuKr5/e4BTX6z/bA7hukIRgGrxNcnz9TCTj3hfTfUItYsg3Yo+PtAcJQs+uzch2h0R+vpr+KqEoFNg7mhEzD+klYILoi1uYFW+yiK1kxhkZFaJ1hVg9XKDxCkMn7w7HsBHTV2Z8/V58MbSfGWFokewnwtreCUEgPCGpKcDcjjw93TnZ+Jpdkh80S3eTs2m9RHWd5dc5+XcOTZV26r0WFaTkXW1PfJo1r1OzilqXBX4XnJoZ4ayrXbD5OYNZzda+JuH1MVLuDqpRudHa8ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtZnqWQ3WCmpXqroDs8/eLciLZJ5alUB/zYDji7SLzc=;
 b=Qjq8vBY8k85PqBVDnEMDErzvqVpofnMkyjl+g18V1GjQXzUKyipoaf9QgjlycoYd2ccfoOE0WaHabkDupWLuOfW7mYvIjO0NbJ2j1wwl3iqFIOdEojIMm1NQVGhcTJLOccdK7GR5ES4eVx8cgyDWfLpxBk3tQxAwmmiRRXdRiic=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4638.namprd11.prod.outlook.com (2603:10b6:806:73::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.30; Thu, 18 Feb
 2021 08:49:08 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%4]) with mapi id 15.20.3846.042; Thu, 18 Feb 2021
 08:49:08 +0000
From: <Tudor.Ambarus@microchip.com>
To: <zhengxunli@mxic.com.tw>, <masonccyang@mxic.com.tw>
Subject: Re: spi-nor: maxronix MX25L12835F support
Thread-Topic: spi-nor: maxronix MX25L12835F support
Thread-Index: AQHXBFUKEDYf95dZGkCecCm8j19FKqpdnSwA
Date: Thu, 18 Feb 2021 08:49:08 +0000
Message-ID: <52400cb7-1ee2-a0e3-4e70-266096941d95@microchip.com>
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <OFCC984357.9DDA18A5-ON48258680.001E5476-48258680.001F9A54@mxic.com.tw>
 <a4d2999f-33b7-eeb3-db45-26cf2334b341@microchip.com>
In-Reply-To: <a4d2999f-33b7-eeb3-db45-26cf2334b341@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: mxic.com.tw; dkim=none (message not signed)
 header.d=none;mxic.com.tw; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8905b7e5-52ba-45d2-32d2-08d8d3ea0e41
x-ms-traffictypediagnostic: SA0PR11MB4638:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB46381651AAF715C054F0502CF0859@SA0PR11MB4638.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L/WpmjTXKqsJ/N2NC+ffZIozaN18a3bz3oTfqTSIK3c4tF+m/pnoV+NnMZ+r6jTGMycZ9q0jtDSwrGxdRa3e1iMhTRHdNXKr5ZybHPhANe+sW7WSYEOsLn8NPbLTm4bFyPbnZfzR4IVV4SuJB39D133TO6MT1ezrpzleXzscIoVbxjO/crzDGQM8VjqCzqdk9U3V/ypDQLKPokOgP1Qt4KmcnZks3IbG8qM6XPY/FZsMq7y1W9pbefzuDfv/Xgm+pMmJJHl0mc9XV66dNhMXj9ZgFxvLELjHVZerdy9FWKEZCOYcyOPMyL3hLP+OrQpiRXHPxKd9QF6y0X+4A1xU/zLIq9+2Rz0MJYCsA5NHYQIL/Xq/f2/Geb5+AQCytyZ/c+eF9ODafMA6/aNcpkajb9S4BlkEJVZqY+ex+/nMI1npjjLS7Z2A1R9KrLKpqZJcOvqNePYXdrQ9qOExK8GhzxPZs6q8PQhnucn7BRUxfe1nSmpE188qMLmbhH1Ox8e/2MLLX3OkrwquIxI3D1Tf0zXcXf5F4qSOFpSKf6tZnTSPy+yIWqwi2dALV+X931G9hccVrv74NNClZf6wDmGDGOsL8Yz4daJ6F1//Qp1xPaH/p9Bg9pCMTDY+KiqGsUs0fXdXMrUAZK7i9C6bDa7Gs5G1Njz+FWQbrQMsfwZsNgQGP+2swpht2swDpHryeU+7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(396003)(136003)(366004)(39860400002)(76116006)(71200400001)(31686004)(2906002)(83380400001)(53546011)(186003)(6486002)(6506007)(36756003)(64756008)(6512007)(110136005)(8676002)(66446008)(66556008)(86362001)(5660300002)(91956017)(478600001)(4326008)(31696002)(66476007)(2616005)(66946007)(54906003)(316002)(8936002)(26005)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?big5?B?MDcxVnFtVm5wL09sK1dzT2JWaG1ZN0VIamJJSFdGYXNFZG1RWHVhWDdlUWhwY3Vw?=
 =?big5?B?eENHTjdTdjlwTnFqeTFVVTVsZWFmSXpJcUZCZVRxa1NNOHdaelBZWVdVR0FFbWlv?=
 =?big5?B?bE0vNHMxcHFhUS9sV2FZeWpUYnJTTTF4T2trcVIwV1UwTHUrbFZKa0xZWFBPeVJj?=
 =?big5?B?eDJUSlpUWWQzUEVlME0zMXhRN2ZYQUVsRDkwWm5HU2VRTjhYZi8xU0IzRWJvZHFw?=
 =?big5?B?aGhBeU1MVmpza3R4UXlQMGRlTldhRkFuREg2akRyMXdiM1FKTk1kbDhmS21WaFRv?=
 =?big5?B?OTBVdHJ4WkQvd2tHL1VCaER2R1dIczdKaUdSeHFVVSs5UytCTnZWRllKMmZLdE1p?=
 =?big5?B?M1pWUnBZS2NyY0dWQkRieXlzYkVoRmkrU1lIQkFBUm4zb0FaNkpIZDl0YU1pcFlN?=
 =?big5?B?eDNvb1VQZXFlaU5rOHpNZ1hpWXVGSzFPNGNVRXplN1JGdTJ3NmlYTzQ0NC9na1FN?=
 =?big5?B?NDVvWGpnbmczb1RiVnRTSUU3cnZUOE8xVExaNDNrekJseFhCejFhQW9kYlJ4THYz?=
 =?big5?B?a0lBV0ZubkdaN1FyamZnZGdqcTBUTEpMcTQybzlGQXVSR0dwSVBFcGRTbk5HSXhv?=
 =?big5?B?cHZJWVN4dGFHNWF5a2p3SkR5QUROSFVnLzVPQysyQVp6dVBPL05BMmNQdDZQTDhP?=
 =?big5?B?KzVEOWRaU2RyUW5XMUdxSS9nbTNXTmp0SFpLYWNoZm1LVS9QYnhXMGxIRlRGdkFQ?=
 =?big5?B?eUc1THk3Ymk2RjU4dm1OcjlIb1RWWFZ4dC9Zb0owOHlQeFhVR2xyS0ZqbHZwd3ZX?=
 =?big5?B?YnVVa1JqSVErMVNwK294QzNYQ3FoWnlCZ3BFRXFySElUZ0V1K3hHR1lIY0pGSlpp?=
 =?big5?B?ZDAzd09IL1ZpYkU5OTFOR1ppcXE2Z0RmTW5CN3YvTE9mVjUySHppZWFLTzB2Y0E3?=
 =?big5?B?NndHazl0UFM4a01PYk5nOTRHOVdnT29Jb0lnc3BLNVdOcXFDWUwwR1o2QVJSZm95?=
 =?big5?B?M1pLL1NhQUxwdTdNOUdWUGxIazF1OC9oRkROZUlKa29rSzQ5YW1LNVF3NFZsOE1t?=
 =?big5?B?a05oellSTmhibzA2TU5HN1lqTkIyb2dZQkM4TDRzUTdhVkFzNnkxV1gxYStmbGNL?=
 =?big5?B?RnZYemVWT2hsQmhUM1kzbTZ1ZTVxS3dudDhlRWdWQ3ZyUjdGSllvRmdmdWY4cHZi?=
 =?big5?B?S2lDdSs0UmVqM3lSY3VnYWl4OG81bm5Cc0t4eXFJQXE2TGZHOG54WjdlSElDUVNm?=
 =?big5?B?SUEybkVDMUdwN1dkU2VmN2ROVjlsVHZxNWxJaERsSXZTZGlaSGhtR2tNOTluelNv?=
 =?big5?B?MG54ZFhQMlRkdFFkZ0xOL2UzU3ZxdEdhdVY0TVc1R2t0aC9WT2NGd1ZDMnVkamZ0?=
 =?big5?B?SDRjQytqTnpEcVlpcjJMNThEN0E1b0ZNRUNEY3JLSmcwKzZSNms2SXBMUlFERkhu?=
 =?big5?B?ZGYvNW5pK0RMaUlqc28yWmhoLzB4TWdna0tJbW55Sm9CREVCWncvOGRHdGNnT0NE?=
 =?big5?B?WDRGeEZDR2pJQjBMNndWcGFhQ0x5OHFtdjFsOHVHdUVSZDNjL0dSaDhIYXpxZ1VV?=
 =?big5?B?WTA3dFd1L2lsR2dpL3NjYThpUWlOeTJtOC91VDA4dXl2ZUJnTHpueG1DeHhJQUEy?=
 =?big5?B?R0Y5Z3RZdWtvbEh2WFcvMlZMMU5LaTlEbnlpNHluRld3TThWUXVyNkQ2ZnYzaXVx?=
 =?big5?Q?HiO5tmXVTz8fOQY47K7DH9vvwtI=3D?=
Content-ID: <E35B92F0C4F699448F096452884EDA7B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8905b7e5-52ba-45d2-32d2-08d8d3ea0e41
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2021 08:49:08.7269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RI0njBXbWvrAD/0rgl1Axggb35uzqTagJGz9Clfdyj19mjXcNEohH4Jv38MQr0Qthz+kd9BkehJ8n6yTq9WvpDXPuBT13TvJuip0K2yTmjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4638
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_034915_788053_5331C9A0 
X-CRM114-Status: GOOD (  18.35  )
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
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw, michael@walle.cc,
 linux-mtd@lists.infradead.org, heiko.thiery@gmail.com, p.yadav@ti.com
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMi8xOC8yMSA5OjU2IEFNLCBUdWRvciBBbWJhcnVzIC0gTTE4MDY0IHdyb3RlOg0KPiBIaSwg
Wmhlbmd4dW4sIE1hc29uLA0KPiANCj4gT24gMi8xOC8yMSA3OjQ1IEFNLCB6aGVuZ3h1bmxpQG14
aWMuY29tLnR3IHdyb3RlOg0KPj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+
Pg0KPj4gSGksDQo+Pg0KPj4gPFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4gd3JvdGUgb24g
MjAyMS8wMi8xNiCkVaTIIDA3OjE1OjMzOg0KPj4NCj4+PiA8VHVkb3IuQW1iYXJ1c0BtaWNyb2No
aXAuY29tPg0KPj4+IDIwMjEvMDIvMTYgpFWkyCAwNzoxNQ0KPj4+DQo+Pj4gVG8NCj4+Pg0KPj4+
IDxtaWNoYWVsQHdhbGxlLmNjPiwgPHAueWFkYXZAdGkuY29tPiwgPHljbGxpbkBteGljLmNvbS50
dz4sDQo+Pj4gPHpoZW5neHVubGlAbXhpYy5jb20udHc+LCA8anVsaWVuc3VAbXhpYy5jb20udHc+
LA0KPj4+DQo+Pj4gY2MNCj4+Pg0KPj4+IDxoZWlrby50aGllcnlAZ21haWwuY29tPiwgPGxpbnV4
LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPg0KPj4+DQo+Pj4gU3ViamVjdA0KPj4+DQo+Pj4gUmU6
IHNwaS1ub3I6IG1heHJvbml4IE1YMjVMMTI4MzVGIHN1cHBvcnQNCj4+Pg0KPj4+IEhpLCBhbGws
DQo+Pj4NCj4+PiAremhlbmd4dW5saSwganVsaWVuc3UgJiB5Y2xsaW4NCj4+Pg0KPj4+IE9uIDIv
MTYvMjEgMTE6NDggQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6DQo+Pj4+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91DQo+Pj4g
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4+DQo+Pj4+IEFtIDIwMjEtMDItMTYgMTA6Mjcs
IHNjaHJpZWIgUHJhdHl1c2ggWWFkYXY6DQo+Pj4+PiBPbiAxNS8wMi8yMSAxMDo1M1BNLCBIZWlr
byBUaGllcnkgd3JvdGU6DQo+Pj4+Pj4gSGkgYWxsLA0KPj4+Pj4+DQo+Pj4+Pj4gSSBmYWNlZCBh
biBpc3N1ZSB3aXRoIGEgU1BJIGZsYXNoIG9uIG91ciBib2FyZC4gV2UgdXNlIGEgbWFjcm9uaXgN
Cj4+Pj4+PiBNWDI1TDEyODM1RiBbMV0uIFVuZm9ydHVuYXRlbHkgdGhpcyBmbGFzaCBoYXMgdGhl
IHNhbWUgSkVERUMgSUQgbGlrZQ0KPj4+Pj4+IHRoZSBNWDI1TDEyODA1RCBbMl0uDQo+Pj4+Pj4N
Cj4+Pj4+PiBUaGUgbmV3ZXIgTVgyNUwxMjgzNUYgaGFzIHN1cHBvcnQgZm9yIGR1YWwvcXVhZCBy
ZWFkIG1vZGUgYW5kIFJEU0ZEUA0KPj4+Pj4+IHdoaWxlIHRoZSBvbGRlciBkb2Vzbid0Lg0KPj4+
Pj4+DQo+Pj4+Pj4gSSB0aG91Z2h0IHRoYXQgSSBjb3VsZCBkbyBhIGZpeHVwIHdpdGggYSBkZXZp
Y2Ugc3BlY2lmaWMNCj4+Pj4+PiBwb3N0X2JmcHRfZml4dXBzKCkgY2FsbCBidXQgYnkgbm93IHRo
aXMgc2VlbXMgbm90IHBvc3NpYmxlLiBUaGUNCj4+IG9sZGVyDQo+Pj4+Pj4gTVgyNUwxMjgwNUQg
aGFzIG5vIGZsYWdzIHNldCB0aGF0IGFsbG93cyBhIGNhbGwgdG8NCj4+Pj4+PiBzcGlfbm9yX3Nm
ZHBfaW5pdF9wYXJhbXMoKSBhbmQgaW1wbGVtZW50cyB0aGUgZml4dXAuDQo+Pj4+Pj4NCj4+Pj4+
PiBIYXMgYW55b25lIGFuIGlkZWEgaG93IHRvIHNvbHZlIHRoaXM/DQo+Pj4NCj4+PiBNYXliZSBt
YWNyb25peCBjYW4gaGVscCB3aXRoIHNvbWUgc3VnZ2VzdGlvbnMgb24gaG93IHRvIGRpZmZlcmVu
dGlhdGUNCj4+PiBiZXR3ZWVuIGZsYXNoZXMgYXQgcnVudGltZS4NCj4+DQo+PiBJbiBmYWN0LCB0
aGUgZHVwbGljYXRlIElEIGFsc28gY2F1c2VkIHVzIHRyb3VibGUuIE1heWJlIHlvdSBjYW4gcmVm
ZXIgdG8NCj4+IG91ciBjb2xsZWFndWVzJyBwYXRjaGVzIGFuZCBhZGQgYSBuZXcgSUQgYmVmb3Jl
IHRoZSBvbGQgSUQuDQo+Pg0KPj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0
L2xpbnV4LW10ZC9wYXRjaC8xNTg3NjMxMTIzLTI1NDc0LTItZ2l0LXNlbmQtZW1haWwtbWFzb25j
Y3lhbmdAbXhpYy5jb20udHcvDQo+Pg0KPiANCj4gTm8sIHRoYXQgcGF0Y2ggaXMgd3JvbmcgYmVj
YXVzZSBteDY2bDUxMjM1bCB3aWxsIG5vIGxvbmdlciBiZQ0KPiBkZXRlY3RlZC4gSSBzZWUgdGhh
dCBteDY2bDUxMjM1bCBhbHNvIHN1cHBvcnRzIFNFQ1RfNEssIGFzDQo+IG14MjVsNTEyNDVnIGRv
ZXMuIERvIHlvdSBrbm93IHdoeSBNYXNvbiBhZGRlZCBhIG5ldyBmbGFzaCBJRD8NCj4gV2FzIGl0
IGp1c3QgdG8gZ2V0IHRoZSBuZXcgZmxhc2ggbmFtZT8gSSdsbCBzZW5kIGEgcGF0Y2ggcmlnaHQN
Cj4gbm93IHRvIGNvcnJlY3QgdGhpcy4NCj4gDQoNCkknbGwgd2FpdCBhIGJpdCwgSSBzZWUgdGhl
cmUncyBzb21ldGhpbmcgZWxzZSBhYm91dCBteDY2bDUxMjM1bDoNCmh0dHBzOi8vbGludXgtbXRk
LmluZnJhZGVhZC5uYXJraXZlLmNvbS85MG1nRFprVi9wYXRjaC1tdGQtc3BpLW5vci1maXgtb3B0
aW9ucy1mb3ItbXg2Nmw1MTIzNWYjcG9zdDENCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
