Return-Path: <SRS0=sGI+=HU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE42C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 07:58:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CF5964E15
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 07:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CF5964E15
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bs5GFOds4exx/sv6Jy983ORCTpm5neBMbcNsC7b4xD4=; b=3NctiRl/kSBnAMQhfzr62vnK/
	l7uA/6XHHn64iUDlZwH5mzwriSA0ksbK9wxk9Aq5n/FGiWUhVOmDXc+RJWRqRMBWx+1nC+VkY9sUd
	LjUdDWhixPG97yVzeDX/Mbrlxy3ppNNWkH4OargE+HJVsC3YMXmVPRms1JiBEfUb6ZbAPJHFfQ5wK
	5aoBITZVRa84r4ecZMIj0VnthfneYbF2WIoTxSWIiBNitbOcb6iktrIXAbYKixES3ZOsXCv1cH2v6
	39DXyIke6st8As0JpMk34nVKgXeha1h2bK+V2jXQpZ2/dN7mnDt3e80UmZwRHzPTGXlSHyQpyVviM
	UC7eQfBVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCeB6-00050B-3x; Thu, 18 Feb 2021 07:56:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCeB1-0004yn-68
 for linux-mtd@lists.infradead.org; Thu, 18 Feb 2021 07:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1613635003; x=1645171003;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Dba2+Zy2ewkGvEDUmezTNmxXcSLvRKMCH8vRM6V7Wrs=;
 b=H3Fi/J4mql4IeuuVMbv140nAmSc2Tz/sXDRsr9FwSRdKZVnK4YmhPgsg
 d6qR1MNm3sPooI5SOo/epaD9/jnWcCng0EWCguPbINMIbgCU1yG104tPf
 zUi4YYalCLAFaHSLu0hBMVS3SJsu/etExmAskav1WFWp1CgZm8/0g1FMT
 KFK4asVPSaT+vvX3UA9irdZOOMJjjmGyhiD5sbSubE3KJPhW6cqj41qWB
 8qfjWIoNLpn+2xBfNKCJRxN/am7qt3+1KrUfOBgzyZULI3vp9XmJKxO9G
 NE11YThK5ctnvfL487gbR05Q6f4EhjXTXjcjaKG9Zfm0K/P/leZBmSyI3 A==;
IronPort-SDR: MY8I58FVoGTA/djDdpBLWCtxG9O+rp9tRz5NSFOlW3DaHpt2YjxlwagHM/VueUJjJwbt47jlYp
 FakhoCXjrED8cTtd8YJGXdyv4FksxJHLC9aYGpBcz1/gTJGJnIbvcQtOtgo90cSdk4bgKrVHg2
 Gu0tvjhPrB0rxod8zwCcW9QylkFK6t04FWLCNIhuP4w7L4BCEzrHigaqz/9kWKw16XQwkLgdP3
 TMSlyDg4nw5pZJTRzQYr0n6N1HV0/ut66SBk7R03Noy/TpGiUkFeDujykU3UB4ql+gpt0opB/h
 LbM=
X-IronPort-AV: E=Sophos;i="5.81,186,1610434800"; d="scan'208";a="115637254"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Feb 2021 00:56:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 18 Feb 2021 00:56:37 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 18 Feb 2021 00:56:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiDBSk2chy291L1DANyQFfeMXN99o+NFGhjqkZSbI6YRYKWVgfgcmvZDYb+U1vdsdRXsdL5aegprOPDMdcyoR11PIkonqrzJLyKYQ3O+MJ364chMtyMtbhzkiTZH0Bj+W847DgyvNxrKZU1EZxKVInWdLZc6ocDSYEG3AkG6bQ1JScmi4UF6FrrgqW5zut38cZnasPbSqn7UeVwDHy6Bqj7LYrUxqJTWiRVR7MSVhuhzKeAOYDthpR9DiZEyzT58HN9L15xlA3gN/xuUEzSEVu5H6QQ7dOqPFrHF90fEN4GMJFlakXFxTNMO9wV3ct2isJbOzTXGGW6qASVG+0Qylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dba2+Zy2ewkGvEDUmezTNmxXcSLvRKMCH8vRM6V7Wrs=;
 b=Di7VLFX47WU4e/suOTn2aP4V5G+7SBaZ7LmV4eJCuwH6Ch4yb+5NEjZ8B6EiCae1XOQC8KUZwoBBeASGUbmR44ypXYAbsPxwBBH6J0/LKscqK5UW0roUG+t2pisBFXIqRwpGJ9DHfcbJxDSs1ovn1pac19a1vLUxiKrwG8rE2+KoFva4jDtAwz/Svko6Xbn9ICVPN7j7JyRQfXcD9YD1ptfqwH1VtpR/7haW48/xtZQ26z5Ho0K5aWy7NqEX0TNfMhwyQ+QsYU4FS2AjQBT92kVbxvnE2wuPGvUkWp8jjt47vdcU8KH1lypH8l9z8GvKmi9j0wfc277UoUBWWEnFLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dba2+Zy2ewkGvEDUmezTNmxXcSLvRKMCH8vRM6V7Wrs=;
 b=daiLH/rhTXhGvLqG0Bevg3ntjMitmvqj8UUhQOUsciIkL25Na152oaQtjKaM3AFFVuP3G1L7oQv5K3j4SO72+EwHQG8wmiRGthvQyc9nMYLgJEeHixyF/Nmc8DiDW6s52DoPCq28MB3seQDZUkzNaCVC4z5UNUUMvKY/JM9oIQs=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 07:56:36 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%4]) with mapi id 15.20.3846.042; Thu, 18 Feb 2021
 07:56:36 +0000
From: <Tudor.Ambarus@microchip.com>
To: <zhengxunli@mxic.com.tw>, <masonccyang@mxic.com.tw>
Subject: Re: spi-nor: maxronix MX25L12835F support
Thread-Topic: spi-nor: maxronix MX25L12835F support
Thread-Index: AQHXBFUKEDYf95dZGkCecCm8j19FKg==
Date: Thu, 18 Feb 2021 07:56:35 +0000
Message-ID: <a4d2999f-33b7-eeb3-db45-26cf2334b341@microchip.com>
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <OFCC984357.9DDA18A5-ON48258680.001E5476-48258680.001F9A54@mxic.com.tw>
In-Reply-To: <OFCC984357.9DDA18A5-ON48258680.001E5476-48258680.001F9A54@mxic.com.tw>
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
x-ms-office365-filtering-correlation-id: b077c77d-a175-4923-6b24-08d8d3e2b70c
x-ms-traffictypediagnostic: SA2PR11MB5019:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB50199F86C477E2655795BD0AF0859@SA2PR11MB5019.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uPCi6WSBJr+0DZKibiohzPEgFXymVnvJNRNzFwkyG2h4ecceIUCuDgVOoznCD2svMcCnEwMp6rZt86lBeBr7pxAuCR7USbc4B8Aqrl4yUh7hqJ5hACgVHdD40vMa8ac3+QKRGwNS0MuOUUL39+cTrzZofs63W8vwXL/EynupoZMvn6pyOA42v00QcqleF2lePS6/mTT4vSKGD858ysH9awXzbIFirsUWrFRoUNnjpI0g2vexAptwlNo1eZWQ7iNxnSy6MOn21pEcYG5GX6IYBTU0DjpDLzkoia2g40VEAtbSc3ilHkFe7ZtLjqJnuiv+b/uHIKivzBmR1EtP0kJp6tcJFWIJldEfnkZW/5bf1HgmxfDbx3YBx9BUj8TGMswBQ3dmDA3a1/jYOe1yDlnr2NmeH54YdnWLCOtTOxsreu+NF/r1RJziBwK+h9Q/f2xI6FOVZzOrMSGZLde6otJsv74xsnLaMBuWVtM0c2fJ6oO8jMvGvCPkupNdZqfxq67rYBNAG0gnh4/WaGIrBRtqEVOhPttkxHoxZyseHqA3Gk8mLfeDm+dA/sdNtNnSbqZN1GuwfxaxAVPuhsAmBfxcQGicEoWz5/sTF+WeRE9aU9Fi1CeyfdFU78pCfDiPSlp/F5Cs30qdtIiXUuivZuRjnU+Y6OAtnVqQ+iUBRGOlYAIVEETAp/FX7LdYJBBROAP4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(366004)(376002)(396003)(346002)(316002)(31686004)(5660300002)(6506007)(6512007)(53546011)(26005)(110136005)(54906003)(71200400001)(4326008)(186003)(2616005)(6486002)(2906002)(8676002)(64756008)(966005)(66946007)(86362001)(66556008)(8936002)(76116006)(66476007)(91956017)(31696002)(66446008)(83380400001)(478600001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?big5?B?cDFGL0RkSmpoQzJJVEdyNVByYlUrSkZsbmFNQW0zT3NuMkRSelFvS05udEhpZzN5?=
 =?big5?B?dS81RUdLcmhYd0Foc3ovMUFyeVNiaE5vLzltbUZiT2hLRVFjR1FUVUpqTTdFbTdN?=
 =?big5?B?aHJOaEloV21vVjFjRFREQ3BjU2IvdlJKUHpVRUJrUGhOVEo5enNLTG95d2dLRy82?=
 =?big5?B?aVRhQURDaVlFS2F6c0s0TFk1L0RIN3dSU2tROS9hK3I5VXMwekpvQlQrVXFTemNp?=
 =?big5?B?UG14cHJaclZPUDFkQURNVWJQK1JVWVZKYlJha2pXVXI1aWZqRlk5SGJ4eVRYNUhr?=
 =?big5?B?enFTbi9ZdCtFUCtDMVo2OUVjT2RyekQrQjU5MEFFczkxRm83MldTTmdLK1Joa1du?=
 =?big5?B?T2FtMm15V2M0MWcyWVEyQW1tQUxlTENlajhpN0ZQdkRrLytaM0t1ZDBoYTd2dFBZ?=
 =?big5?B?Um5aOFhLcW9PNWFkelF6NVBlYzJvV3NyZkkxd0UxWUNOWlNyMlBIR2gwOWxWTk90?=
 =?big5?B?ejd0Mzl0N2k4enl4SUxDamhVRDRVYm9SUVExQzIybGR3V2hDa1gwK0M4SUdLMmw1?=
 =?big5?B?ZDVXMHFIamFKWkR0Z044UzVSTVFGMitiaSswZk9xQ2pXOFVXR0MycGdDMEFxT2tY?=
 =?big5?B?aEJuUW5jbWZTZklINVNBclhEcitkeDRsUjBvdzhOQmlYVTNGQjBEV00xZFpRclVV?=
 =?big5?B?QlQ5Ym9zSmpXOWlSNDIyTmV1cm5MYTBJeGNKU1ZzdGxRd1h2elE2d01MVjRGbnd2?=
 =?big5?B?WmwwQmJSOVN5aHc3RkQrOU1FVXBBMVpWczZsNTI0THJuQWxOZytzaXgzSi9VTUIy?=
 =?big5?B?U2hPYm5TaHE1aURXbzJMcGF4ZXlFMTFPZ2U4aDM1VUN5MmczaGpaYjNLNkxDdmsr?=
 =?big5?B?SWlXYlE5UkkzVGIwczdQR0JRTEhja2MxRU05MzNBOUpVMCtFZHRFMGU5UzBnWnBh?=
 =?big5?B?aURCdjAxSmtrb3BnVTF2OEs4eVJzN3d3dnIrTGJIejNBSStJUUZFY0NSRkdpTHlt?=
 =?big5?B?RXRmdTNBalNFdHZUNy9ndWxUM3R2YkZXc0lQcXlqQVdXTTlYSjBGdlFhQ0kwMHpq?=
 =?big5?B?TmxlMGlxZi9TUjk1L3lCaFZmRDA5Y3lnVjUzZUdoSnZIaHhibjZOdkVaWHFxTjVy?=
 =?big5?B?ajVjejVoMVRMNlV0ZWlqdWNYckp5QkM0bVJ3VjY3cTdxYzZwblpnODJlUXhXVTJ5?=
 =?big5?B?bUNRaHZFdCtVRElxdExJYS93dkVPMC9HNzM4cWMxWHR2ZEVxV1lNbzZBVzkzNVhk?=
 =?big5?B?Ujc0YUFSY0pBOHVPa3F4TktWSmVnZDZFU3pic2JLdzd6OXlyTy9WbTlJL3BqdkR1?=
 =?big5?B?cUp5MmxXYjJxOWhrYXhmdEVPS2szd2FwMmh0dW93WHBGZnMzZERBa1VpV29JZ1V1?=
 =?big5?B?VXpud0pScFl3UmNUT0JOZ241V2pSOC82TmphbGsyQUlSQ0VLeHc5cGpHVVRhMGRK?=
 =?big5?B?dG1lbkltZFJaYzYxVUxNazl5UXUzTWJVZWg5VXgycmJrWFkvZjlhcW1WTHVPcXRO?=
 =?big5?B?cHprUHZuRlJ5Qm05VTlMT01veWNtRmltVy9Rd0plV0tRODdvSFh6TEdReHJJRmJa?=
 =?big5?B?dHI2ZXhJS0xiU2ZuSUlyckJremFkYkM2Q2F5RGlGRGdoeHpEaiszek9RbGpza2o3?=
 =?big5?B?NE01WnNCM3RLV1dBMXdsVXJtWDZ1Vm44bFJLbk5IYzlGaW1rUEhoa1d5bGVIbzhP?=
 =?big5?Q?yrHHa4BUumUjEMwfSH7dbgk4pBo=3D?=
Content-ID: <FA5AC9D5A823744F952B8E44B0C26CE1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b077c77d-a175-4923-6b24-08d8d3e2b70c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2021 07:56:35.8724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q60fMzLugR0EAUYMolXRpchuXpcsmHgBUnzXD/0JGwg23wYvVOkmnZtj1sc8DfWAN1tj8Y4joyVjmYPJL107ZL0wjRLkz1qpL6ZdoUTwgvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_025643_591666_ABA3EFDB 
X-CRM114-Status: GOOD (  18.47  )
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

SGksIFpoZW5neHVuLCBNYXNvbiwNCg0KT24gMi8xOC8yMSA3OjQ1IEFNLCB6aGVuZ3h1bmxpQG14
aWMuY29tLnR3IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4g
DQo+IEhpLA0KPiANCj4gPFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4gd3JvdGUgb24gMjAy
MS8wMi8xNiCkVaTIIDA3OjE1OjMzOg0KPiANCj4+IDxUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5j
b20+DQo+PiAyMDIxLzAyLzE2IKRVpMggMDc6MTUNCj4+DQo+PiBUbw0KPj4NCj4+IDxtaWNoYWVs
QHdhbGxlLmNjPiwgPHAueWFkYXZAdGkuY29tPiwgPHljbGxpbkBteGljLmNvbS50dz4sDQo+PiA8
emhlbmd4dW5saUBteGljLmNvbS50dz4sIDxqdWxpZW5zdUBteGljLmNvbS50dz4sDQo+Pg0KPj4g
Y2MNCj4+DQo+PiA8aGVpa28udGhpZXJ5QGdtYWlsLmNvbT4sIDxsaW51eC1tdGRAbGlzdHMuaW5m
cmFkZWFkLm9yZz4NCj4+DQo+PiBTdWJqZWN0DQo+Pg0KPj4gUmU6IHNwaS1ub3I6IG1heHJvbml4
IE1YMjVMMTI4MzVGIHN1cHBvcnQNCj4+DQo+PiBIaSwgYWxsLA0KPj4NCj4+ICt6aGVuZ3h1bmxp
LCBqdWxpZW5zdSAmIHljbGxpbg0KPj4NCj4+IE9uIDIvMTYvMjEgMTE6NDggQU0sIE1pY2hhZWwg
V2FsbGUgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UNCj4+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0K
Pj4+DQo+Pj4gQW0gMjAyMS0wMi0xNiAxMDoyNywgc2NocmllYiBQcmF0eXVzaCBZYWRhdjoNCj4+
Pj4gT24gMTUvMDIvMjEgMTA6NTNQTSwgSGVpa28gVGhpZXJ5IHdyb3RlOg0KPj4+Pj4gSGkgYWxs
LA0KPj4+Pj4NCj4+Pj4+IEkgZmFjZWQgYW4gaXNzdWUgd2l0aCBhIFNQSSBmbGFzaCBvbiBvdXIg
Ym9hcmQuIFdlIHVzZSBhIG1hY3Jvbml4DQo+Pj4+PiBNWDI1TDEyODM1RiBbMV0uIFVuZm9ydHVu
YXRlbHkgdGhpcyBmbGFzaCBoYXMgdGhlIHNhbWUgSkVERUMgSUQgbGlrZQ0KPj4+Pj4gdGhlIE1Y
MjVMMTI4MDVEIFsyXS4NCj4+Pj4+DQo+Pj4+PiBUaGUgbmV3ZXIgTVgyNUwxMjgzNUYgaGFzIHN1
cHBvcnQgZm9yIGR1YWwvcXVhZCByZWFkIG1vZGUgYW5kIFJEU0ZEUA0KPj4+Pj4gd2hpbGUgdGhl
IG9sZGVyIGRvZXNuJ3QuDQo+Pj4+Pg0KPj4+Pj4gSSB0aG91Z2h0IHRoYXQgSSBjb3VsZCBkbyBh
IGZpeHVwIHdpdGggYSBkZXZpY2Ugc3BlY2lmaWMNCj4+Pj4+IHBvc3RfYmZwdF9maXh1cHMoKSBj
YWxsIGJ1dCBieSBub3cgdGhpcyBzZWVtcyBub3QgcG9zc2libGUuIFRoZQ0KPiBvbGRlcg0KPj4+
Pj4gTVgyNUwxMjgwNUQgaGFzIG5vIGZsYWdzIHNldCB0aGF0IGFsbG93cyBhIGNhbGwgdG8NCj4+
Pj4+IHNwaV9ub3Jfc2ZkcF9pbml0X3BhcmFtcygpIGFuZCBpbXBsZW1lbnRzIHRoZSBmaXh1cC4N
Cj4+Pj4+DQo+Pj4+PiBIYXMgYW55b25lIGFuIGlkZWEgaG93IHRvIHNvbHZlIHRoaXM/DQo+Pg0K
Pj4gTWF5YmUgbWFjcm9uaXggY2FuIGhlbHAgd2l0aCBzb21lIHN1Z2dlc3Rpb25zIG9uIGhvdyB0
byBkaWZmZXJlbnRpYXRlDQo+PiBiZXR3ZWVuIGZsYXNoZXMgYXQgcnVudGltZS4NCj4gDQo+IElu
IGZhY3QsIHRoZSBkdXBsaWNhdGUgSUQgYWxzbyBjYXVzZWQgdXMgdHJvdWJsZS4gTWF5YmUgeW91
IGNhbiByZWZlciB0bw0KPiBvdXIgY29sbGVhZ3VlcycgcGF0Y2hlcyBhbmQgYWRkIGEgbmV3IElE
IGJlZm9yZSB0aGUgb2xkIElELg0KPiANCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9w
cm9qZWN0L2xpbnV4LW10ZC9wYXRjaC8xNTg3NjMxMTIzLTI1NDc0LTItZ2l0LXNlbmQtZW1haWwt
bWFzb25jY3lhbmdAbXhpYy5jb20udHcvDQo+IA0KDQpObywgdGhhdCBwYXRjaCBpcyB3cm9uZyBi
ZWNhdXNlIG14NjZsNTEyMzVsIHdpbGwgbm8gbG9uZ2VyIGJlDQpkZXRlY3RlZC4gSSBzZWUgdGhh
dCBteDY2bDUxMjM1bCBhbHNvIHN1cHBvcnRzIFNFQ1RfNEssIGFzDQpteDI1bDUxMjQ1ZyBkb2Vz
LiBEbyB5b3Uga25vdyB3aHkgTWFzb24gYWRkZWQgYSBuZXcgZmxhc2ggSUQ/DQpXYXMgaXQganVz
dCB0byBnZXQgdGhlIG5ldyBmbGFzaCBuYW1lPyBJJ2xsIHNlbmQgYSBwYXRjaCByaWdodA0Kbm93
IHRvIGNvcnJlY3QgdGhpcy4NCg0KQ2hlZXJzLA0KdGENCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
