Return-Path: <SRS0=zfSv=H7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A089BC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 14:04:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31EC164E13
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 14:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31EC164E13
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RDpMe8s/M+xP1TA6Jvb8UDVlV9XHLdwmuKZ89BMqb0c=; b=nksqtkrGeC7cNATpsFY9KsBhg
	9/8Lyc59EDQ4fLg7sYL02bPIb5noRGf2rovickBXmBLgku0GmVxO367kAGkH2lcRWZ3dRp44r6lqA
	g/uuQ5jAX8sfoIo8suJ8NxvBDW8vstdDJwMuqnhvCZu8kVb49gibGRJZjaJMHsYN1D2UIXEhlN98w
	ppN8RgPJ+zYtjGlc0VsK/JF90vGURHP5lZByfra2BfxNA4M6+0upqF8pli9lEvt0MTjmPu97+dARz
	Dqa0nYHPEe3sJGUyTe4wZXJ4xcK9uZw9SIgMxDPBNcWNlOUyuTeUi8vquhfxPyVOiWCultQQOJXtV
	HvNPjaBaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGj9J-0004MP-3T; Mon, 01 Mar 2021 14:03:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGj9F-0004LZ-69
 for linux-mtd@lists.infradead.org; Mon, 01 Mar 2021 14:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1614607425; x=1646143425;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=naveYo9romtRXGmeaqPyVhftXvWkNFCJrx55p9Xe5Ew=;
 b=tKZZUWmH7B2CtNgZu/N9NJDRMNRqGRSDTru+0wT0Gzo9oJGJolo2LPRA
 qbFh5+5MDea/MKDkLVZAhoeqdT5q5mvXwVbUPUtIarwC9yJamEptRfTdm
 m/f/prhf9zKYbNYHJA48+yTti0V+KqMz8AyqTTgHGPZ4FXLIT7yzBjCC7
 fLkQPgJa+5jt5uoRcYIWZhyZZVRuu8U2x74jzFmTCZ8q7gSw3RzEvUpmQ
 6UG+6cM7myVTAhY4TTYZNfNrqgBILLp1OyXg8LDrW9G7S1tGh6hHtfFVw
 n2SI6abgQDSO+GLEwiV8PNKvOj8YunZmQxYlHxmmAV9xrTdrEvUaldDwM Q==;
IronPort-SDR: lh6Q9hEn9fIQexox4Julw+qHwWK1uwvY0HZ2JiZ5RowR3XBuiIXB0fnXPxqEtO/Gg1o6R47m89
 Soc+MMn3dHW8mvlqJgX95whVYX8AWJQ5SkIdCtWp/QW55IoU2aMRVCpU9QitS584rWAG9zz9Rf
 VmoZHxSijGopFjQf7Oul9QKL68BWBswibYW5jZhqBYb5nOY8w+AzDX0+s1z8T/PU/70r2N6klQ
 UEYPIUxDupHl7BhBDvH9i+OiiZI7BR/7AHNTYcFb+DJzOEBiqibWxbCP9gzlfV6VMNZL0SYUr4
 9M4=
X-IronPort-AV: E=Sophos;i="5.81,215,1610434800"; d="scan'208";a="110990985"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2021 07:03:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 1 Mar 2021 07:03:40 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Mon, 1 Mar 2021 07:03:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObJcjXTvJegR+Y8Rw7NcfzWnpHzq81jwsVBxPrQE/CYmduk3uUrdtXHDkUXAoVpoJ+HmUHG16CESV1FIa/B+vVFeLgdNLfj+GtSSntvCzSYsbq7AM1Xv8vtBD4AA+W4llolPBFHgcxYboWUMt7JGAgeGFsPZj3TlLiqjITnJdrTuEDH6f911boGzvPwo4+iAFPGbtH9zUj6RRYOAcAcGvGaydA9fU0BGsqVOWDIo9/vCyKJfEb7F9CcHpcf6JfpR3UlPFUDfkbe9UzQD0vft1IYC2S4RCuvbyflrXZTkR+AHE7vAMjRvq3xye7ZHB7qdHjfFm5udFhofKoMeX6M8HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naveYo9romtRXGmeaqPyVhftXvWkNFCJrx55p9Xe5Ew=;
 b=BKEJQXid1QOnuz0FpKqfsISK/am5mM4zMCa/LBaPe4R6+1ZxxD6NqMkHNuPINq/6ZF6S6hWPpOPOtMo0H9jX5+Weu1KuERXsCltdInp5v0Vs/Hh8nWKvgNna4P8Mrxy2N4Jdpd2yB/ou3btKzubYHrbuykHl9aCyF7QXoFgNF516gQp/Fc4RcD0TsZA30csqCT6tc7/tPfcqfFKx/ohMEN+OsaZyCbH/b3Ck+dL8Y4ReG9A0gEWRGqCINu5kgzNXjK7uFyVGiihKUMVPijA/gSLoUFPo2jbkY0uEJxlfoy3iuULuA2DrbwWb4eweP/p3ypA55l7C6eVfYLOn0Quxjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naveYo9romtRXGmeaqPyVhftXvWkNFCJrx55p9Xe5Ew=;
 b=FpYSIh6lUyZ/P3n7Yraw4iqDvUbhTyVKDIEnuDJhhxs9Uo/ufvwm/H0+x/qKlAvgFHqtfJcS9L2YfUpDzFe9goTyJd8R4eNXPb4p6Gr9XnP2mL49cVt93n0Hb78wJVltCHhevqxRnzzGHkoBrJ4lq1wAYNYwH5qY3fGbyJARzJI=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2733.namprd11.prod.outlook.com (2603:10b6:805:58::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Mon, 1 Mar
 2021 14:03:37 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 14:03:37 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
Thread-Topic: spi-nor: maxronix MX25L12835F support
Thread-Index: AQHXBFUKEDYf95dZGkCecCm8j19FKg==
Date: Mon, 1 Mar 2021 14:03:37 +0000
Message-ID: <8058864b-14ee-b5ed-97f2-862b87106f49@microchip.com>
References: <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
 <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
 <CAEyMn7bY9CisxoWcpF=zR+DYJpW+=EeWLGE_gAB3WK9hvkcuJQ@mail.gmail.com>
 <9263ef4d-7944-00bb-8e2f-b7d33e5aab87@ti.com>
 <e1901135-0433-d693-56c9-3a9fdaca1d55@microchip.com>
 <20210301133618.rzs4amh5ujwys277@ti.com>
In-Reply-To: <20210301133618.rzs4amh5ujwys277@ti.com>
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
x-ms-office365-filtering-correlation-id: dd1bb8b8-8f84-4ced-9e52-08d8dcbacf5a
x-ms-traffictypediagnostic: SN6PR11MB2733:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2733BFA60E0210E6FC8BD588F09A9@SN6PR11MB2733.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ke6z4Sc7NSD12NP/Rj3u/gU+WzKocsADrtiIcbeClxT6iKNyLJ2wbl3ziJCJj9RhyfPBeMhF0iwp0LSQ6tJC5FPLqZ4Im49dLs11gKZ1INQea02h9OfeUnK4/kaf6C9U+pFB6jhyclKSbqESIziFREefQkSKT/+YOua3HNQZ83ZjclEo3rFRuWouVWR9E2o1QxlkAdH9nWshZVWNpH2P9cv6R/J1mlSsBARpMJNJR5Tp+Q1qInMaDwoEjJu4QwV+/GgvZ0StKLO1tL8rDDXf37+jtv4iTsQvG60MmhZ32BTfTSFTKbT+tKTPvah3maci681ZhFvBfeMiZ6meT8hvionJEz2RjjkE32Q/gmFdvsfXGbGyIeowldoD0geo8MzbCWJcDG4RrGdrwVutgYFYc8GDhvu4Nq+VqiqtqXopmBQDRLrfRAEnNP8ZB2mKWPrDlJwmLd0iFD49ei0rcB1C7mt2DpEFfNmjABlsUF3+co2N5Q3aFHA46LPy7Q5Gdx/LkLjWkXMPYmQYMSuArn29bwJ3ntRJxrxsTHUAzMT/DeDf3f/hn9y7itnmSRV1kKJDwYhdOoOFvmvDtFVZYqtzpjfnctaKz93QTmyR4wcOmWM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(39860400002)(346002)(366004)(376002)(31686004)(478600001)(186003)(31696002)(6512007)(26005)(4326008)(6486002)(86362001)(6916009)(8676002)(2906002)(8936002)(36756003)(66946007)(66556008)(316002)(6506007)(64756008)(66446008)(53546011)(66476007)(76116006)(54906003)(2616005)(71200400001)(5660300002)(91956017)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aCtkTVZBbW16VDdYZ3NOVlpPTlpaOTFnazhLZDZMc3hkTTJBV1k1TGxZTnhB?=
 =?utf-8?B?VXRBTzc4S0RKVTdLREorTy8wTFJMaGt2NnBwRXVybXpwWlNSU0d1REEwd3Ra?=
 =?utf-8?B?dHRTN0NuaWdySFp5TnRTRG5ISmo3SGUvcGRqSzh6c1NrV2tPOVZLQ0krREcx?=
 =?utf-8?B?eGF4WlJZdTJXeDNPcnhnZXl2U21xdU1GVUlHUG5GYzJpUVdRWHR4QU5lYm1k?=
 =?utf-8?B?WXpiMTVVTjlUaWUvTTVxN25NL25HTTFaUytDbDlkTHNEaUwxell2L3VqYVJ5?=
 =?utf-8?B?SUpxaGJmaWl4aFdkZDlYYmg5Ri9DMUNHK1BqNGgvTGJTOHdzQXdXSm14d1ZZ?=
 =?utf-8?B?bGo0WldLV3RhbGFucDhCRXR5L2c1N1NkdERReEM3VVlhMnBhVStPNkdoenM0?=
 =?utf-8?B?VVA4b05hdm5jRlMzb3hwRm9GKzNUck0rY2ZPVEJ4YzlWVjRzOWtralVycVNr?=
 =?utf-8?B?UGVmRlRCdk9wVzdqYU00bmJUanVqbU1qRnJnc3VoMnRwYkYzbVhueWZQb1FK?=
 =?utf-8?B?dWZDZ1hmQ1EvNzNoY1BWWW1mQUxzSmR5RnlFRjJZNEZjOGlUNlFBRnJVd0JG?=
 =?utf-8?B?SVV3bXl5cmloV2F4cytEYjVRNVpsKzlPK0hZT0NmTDZWV0xWNGNiTXZQNmdB?=
 =?utf-8?B?KzVMSVRSUzBjM1lOSnhza2lRQjZyR3JCdkh6Wjd3VEc4Mi9VUU9XaERTRFph?=
 =?utf-8?B?bzAxQW51WGRsT0w3ZVNzWkRCREYyWnFBc25LUFFYdmVpNmo5bFBDNm9rTUxt?=
 =?utf-8?B?VTl3RFdCeVVhMnNCRDlLOU1zMnRNNGZmQkRLOUg3Vlh0Q2JSUEYzaldGM3U5?=
 =?utf-8?B?YTBmbU04ZEQ4SFFDS3VNTXZQY1BnSlBVTkVCVWJrUjRQYTEycVNlbkRzMlV3?=
 =?utf-8?B?QTJyNk00WFRDUDVzTVNVOUxjUldNR3RPWndlbmNaeHlaUDlTK0NDTEFvUGl1?=
 =?utf-8?B?ejNzQTV0VGdPUDFlYUpYdW1hWkIyZGhNS0lRc0xvN05ac3hqWmZHVFNrSitm?=
 =?utf-8?B?NVQwWURQUnlzdTdyekdmV0NDVjdXM3VZMjl0ZDlRYll5SjdHUVJkZnJzcXp6?=
 =?utf-8?B?UmdqdDBreWdsZ1QxZUlHY1E0YnN6SW1rMk41eEdtZGVWUkYzZDdWTUY2QnZT?=
 =?utf-8?B?bG9KLytLenA5cHdla2FKWUhRN3FqQUlqSk9GMVBhdEdMYlZtWFVHWURSeFFM?=
 =?utf-8?B?UnNBdHFqUG5XcWVIT0FHYVZVcjMxTDJxeU5XdDlXa29pZTQrT2MyZEc5SXkv?=
 =?utf-8?B?b2ZlWFdpYnVTRVdackI1aTRtakFEQzE1QUF1VGJKN0ttdFZhZnJzc2IyUUhP?=
 =?utf-8?B?VnFlSmRKcFBxN2xxM2NWYnhydGlQemlNbGxTQ1VXV3RHdEh4KzJTK1ZJMXY2?=
 =?utf-8?B?UUptMlRVVEFBbHdVZW96c00yY05uaUlPdnpvTmZnd0ovdEp4RlhvS3R4MU5j?=
 =?utf-8?B?dVdiYTZTUmVMYldaV2lsMFN0V1NMR2RubUhKb3dub2ZiUnk0T0Nmb1ZxWk9Z?=
 =?utf-8?B?L2lSUXIrSnlQT2hPSmVTRllucWpTMnZRcVMyalZBN3F2YXp2VkxPQVJyWWxp?=
 =?utf-8?B?ZnhHQ1QydVUrRjQrc1hlbW1JbHB5NzZXYmtpMXZscFBHdzUxOW5KV0c4S21G?=
 =?utf-8?B?eEhaNVgrZ01CTys0VW1kek1qME9ocXhROXR5UEJDcmV6Mm9zc3NYZVQwY0k4?=
 =?utf-8?B?UVB0QkExTEVFQmVmbHFCa1VoQ2tWQzJYSFp5TnVxTUlPYVZkbnp5cTExR1U4?=
 =?utf-8?Q?pkK+Wr5ZQJ5Epgm+VE=3D?=
Content-ID: <48F3D99F18CE95439E2EDE3B4B4784DF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1bb8b8-8f84-4ced-9e52-08d8dcbacf5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 14:03:37.1296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uI0/tG93Y85LBo2JE5xN6H3tk9oHKjR+zokywa/QmeuB+UVRhlKQmCCgjF2yXsgS1c69Ho16ncaThyUtZT5Ka0vPqC/+ybYu2sRe3pFR/AM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_090345_628267_A1E0576D 
X-CRM114-Status: GOOD (  20.48  )
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
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, ycllin@mxic.com.tw, michael@walle.cc,
 linux-mtd@lists.infradead.org, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/1/21 3:36 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 01/03/21 11:11AM, Tudor.Ambarus@microchip.com wrote:
>> On 3/1/21 12:52 PM, Vignesh Raghavendra wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Hi,
>>>
>>> On 2/28/21 3:22 AM, Heiko Thiery wrote:
>>>
>>> [...]
>>>>>>> +#define SPI_NOR_AIM_SFDP       BIT(23) /* Try to parse SFDP. Used by flashes
>>>>>>> +                                        * that share the same JEDEC-ID, but
>>>>>>> +                                        * where a flash defines the SFDP tables
>>>>>>> +                                        * and the other doesn't.
>>>>>>> +                                        */
>>>>>>>
>>>>>>>         /* Part specific fixup hooks. */
>>>>>>>         const struct spi_nor_fixups *fixups;
>>>>>>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>>>>>>> index 9203abaac229..1ebce775eae4 100644
>>>>>>> --- a/drivers/mtd/spi-nor/macronix.c
>>>>>>> +++ b/drivers/mtd/spi-nor/macronix.c
>>>>>>> @@ -50,7 +50,8 @@ static const struct flash_info macronix_parts[] = {
>>>>>>>         { "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
>>>>>>>         { "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
>>>>>>>         { "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
>>>>>>> -       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) },
>>>>>>> +       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256,
>>>>>>> +                             SECT_4K | SPI_NOR_AIM_SFDP) },
>>>>>>>         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>>>>>>>         { "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
>>>>>>>                               SECT_4K | SPI_NOR_DUAL_READ |
>>>>>>
>>>>>> I tried your patch and it works like expected. I can now read the
>>>>>> whole flash in ~2sec while without that it was ~6sec.
>>>>>>
>>>>>> # time dd if=/dev/mtd0 of=dump.bin
>>>>>> 32768+0 records in
>>>>>> 32768+0 records out
>>>>>> real 0m 2.08s
>>>>>> user 0m 0.01s
>>>>>> sys 0m 2.06s
>>>>>>
>>>>>> vs.
>>>>>>
>>>>>> # time dd if=/dev/mtd0 of=dump.bin
>>>>>> 32768+0 records in
>>>>>> 32768+0 records out
>>>>>> real 0m 6.16s
>>>>>> user 0m 0.05s
>>>>>> sys 0m 6.09s
>>>>>>
>>>>>>
>>>>>
>>>>> Great, thanks!
>>>>>
>>>>>> Should I prepare a patch with that change or will you do?
>>>>>
>>>>> Let's wait for a few days, so others can intervene. I'd like to
>>>>> clarify what's happening on mx66l51235l too.
>>>>
>>>> Since a few days have passed and no one has commented, I would like to
>>>> bring up the subject again.
>>>>
>>>> I can send a patch for the changes you suggested. What do you think?
>>>>
>>>
>>> Why not have a single entry for mx66l51235l/mx25l12805d with superset
>>> capabilities declared. And then use info->fixups->post_sfdp() to fixup
>>> capabilities for mx66l51235l based on absence of SFDP tables?
> 
> I think printing the correct flash name is somewhat important. Other
> than the handful of people who are reading this thread, few would know
> that SPI NOR calls mx25l12835f as mx25l12805d or vice versa. This can
> cause a lot of confusion among people trying to debug any issues.
> 
> So my vote goes for having separate entries for both the flashes and
> then adding a fixup hook to select the correct one by checking if SFDP
> read works.
> 

You can't have separate flash entries with the same JEDEC ID, because
you will always hit the first one that it is defined in the array.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
