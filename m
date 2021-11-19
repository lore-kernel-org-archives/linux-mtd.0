Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F814C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 09:10:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16FB161A86
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 09:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16FB161A86
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j0a14LsGmKJ2keQegMDkAZ70AUfuxsAkL+YD8qQkXFE=; b=ulegOP5NlGbtSB
	Xar+8NUm0CIzq48HiwN2stAtNfJKLYI/gTqJXXpmYpXmon4RhplTNCZsYRnnT/N8A3CY/gTNR9iG2
	AOQCZ/0+cVRUSDMe6UMmtDTYbGeEOa2ghA3D5FAkcHqPn8l4Ee/aNkkK63k6lLcvFAU4B8CAPiVsc
	d/Gidg+pl3bziwarHEGiIGW8xnV2ovgPlViZlKbnYwOM2Ql47+aCOkkoOCITpCYbx0V4nkHWNbKIb
	mVoJTy9cH730+cQKmLDP/EEcKXKBDbpUVD+Ijq21rJoaOpC3TUmGesOm6GK2j4i287s3gzYU7vN6f
	DE80Drh7AQjtnMQHsIaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnztf-009uk4-AJ; Fri, 19 Nov 2021 09:09:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnztY-009uiW-Ro
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 09:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637312960; x=1668848960;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=v6Jc38yYeFgHUncW4grO+SLM5EzbjQjod2OJHQ8ICPw=;
 b=POOI7BuWG5vWUeUHtHtCTL/ZRF66jDqtxCnVJjvPTtXnpajZzzrYz9Hg
 OU+NFxolMQ4M+R3g1W9LKgWfOSqVmR88XTHwOpUIO26olJMiDx6eQqCTV
 x0oiUmTKHyKdAVjkwT724xxitDhDw29ie1VGAIepqmutXCmPebUIShav0
 5U6SmOQtj34lYrxpCaBAFiIAhJ124AltUp2+fw/eHIORUITYSS2csGRxC
 O47w5/y2Prd9zcw8ITmvz7TUDUnc16EhpDNjkpHWiN4jC5EjqwoTM134V
 oh1aCnMKB6RJ4c0sYffb7EfIVul6FWKs28QhJIEJ1pJFShr7iwsEFvnLG w==;
IronPort-SDR: 51xgLExvPYZxPbBaif5H9M8K+w5ew9UrbT13CR7yQI8flGaYB3dX1bZuKz0qHstTewPkAtveWz
 Nc7zSEeLMKpivXKyTYtpO9chbFPgQ3gx2P8C6KqcrBpbw9P1o/4eRCRJF39JGgJhyAtPVg/SUx
 kzPGMuFs9dJfiRSsgjcYlSReDp9D/WqKVoGhfxsQ7fne0ZYF3Qs+1q7UhQHQA3XOz+c1A7lGCV
 lw2hce/kYFjIzV8wyRebWb7UiN3okhR2HbXGZQB2Es+9sZeufcrJQ0mfTguXD/3gnEk6jLtlxT
 JJMnfE6iJIXv4j+DPxt477MW
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; d="scan'208";a="137114239"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Nov 2021 02:09:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 19 Nov 2021 02:09:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 19 Nov 2021 02:09:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doKMKdzh95QemRR+yI9iXhobqeXgiExPwAOqU5lEsuJo8e3p+rVILmkB81DMB1Qiwj37CpUECHXqLLlHP8hequr8orn5K2rXNdPWLZXv5eY28BG+UTDdtBFz02Kt7+48hh5DzpGIYi7gOKwiByOlvbU1AD2sAIGcFsqLBHI9N7AwfnAd4V46WM/Xz4m5oJbXrovTjb5bRJvrcoLBzYOUWly/kdVr6hLKLCtW4wgs3aOUz6gwD8jtp/Znd9zireVJ5JjCI09dUKRHaiGJfu7eyyZcn/zOUcpzocHC4JIyVqGwwueZhauhYQwfchQ3WBTemGXmx42xBAkWGhFw2O5nDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6Jc38yYeFgHUncW4grO+SLM5EzbjQjod2OJHQ8ICPw=;
 b=UsK+ZoHaQKSnpkZMVhg1u17yw2EICiTSWOINea9sF/wpY4YarWEbxe3V8wB5/4F46ahXEM23VZqkV2PNXFWm7RhiMbjtuSY/Pyr0kFvsb8QLwb5Sjptg9xw0Q/ROnpO2FrwICwIKutiMVoqZ3KnNbZfaLPqS5mH6/3jwxkiMSZXCTJ5KgWfyc9zvqpAQ/v2wdInMX/d9gfgi7fYPWDHjlAPhMM/GibwCsjbu4RIW5SX8N6ZbNapPwhGkN7cW2ucTsklhAPUeQIGqIt02tRefnjAOjhnACHVDptyQm1973Y48igdG+Tqe6YvNXoz63DVNcgr6wKgQTqgwUwExnmFBTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6Jc38yYeFgHUncW4grO+SLM5EzbjQjod2OJHQ8ICPw=;
 b=Kp9AFbFP9/77o4mBpOVwCVAsfvtEg1VfQxEqOIoi2nWWevRSD9JsY0OGVDy2Z3hXfK4QMrUl/MH6x2U5GtY25NTbClrvOMAdgL+QRDxNNHkoIHLNFTvki9PsdSvLkSoNCO88PG+h//C977FfyGN5SvSijkG5k2K7HJaYAMnqXfA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2781.namprd11.prod.outlook.com (2603:10b6:805:62::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Fri, 19 Nov
 2021 09:09:12 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 09:09:12 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v7 0/3] mtd: spi-nor: Add support for Cypress
 s25hl-t/s25hs-t
Thread-Topic: [PATCH v7 0/3] mtd: spi-nor: Add support for Cypress
 s25hl-t/s25hs-t
Thread-Index: AQHX3SUdg+zJC0HPb0COlJ/0d4objA==
Date: Fri, 19 Nov 2021 09:09:11 +0000
Message-ID: <ed5395d0-3e39-de69-527f-a33e6de3d278@microchip.com>
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
 <d2503b2f-3190-7c0a-47dc-6ebf2f6e74ba@gmail.com>
In-Reply-To: <d2503b2f-3190-7c0a-47dc-6ebf2f6e74ba@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de5894a7-2007-4f47-8b89-08d9ab3c40b0
x-ms-traffictypediagnostic: SN6PR11MB2781:
x-microsoft-antispam-prvs: <SN6PR11MB2781C83FDB436F76E4F93F2DF09C9@SN6PR11MB2781.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K54RvxxpPN9kJ1guGYw2gP/J/iIjzuPus2oZ3uKuXTamRR/8DyfWa5iylKZF5U75jsbwVwviLHslz+lfjWhDfVngfO70ZA/Gvvea2SIY2rAGIjZxeCS9lwOYP/9bqS0Rke8QDrR9VEyVn3R3Xghg7HSQ9xauLyTElx7zRIz8JdFDuvElVaKlAbehU95yQK0h/a3B4Y5ilpZq+IUuGBXfMTvq5vKZpNorIXOrNXz0q5DatAygUVgNJojCvJmProz/7axYl9hDvDQFfsDqQG6UAMFfy9kevZ8vOB0hDBxr+tTCwaUXxY45HfLdlOx6jT8pMZwnFjD9/9BrtxR3zgrQmU9Chw55LQ9P3nA0uml0Dq9YGluvPDGlpXvsBIqaYIE16WTsx6ay86ZDmudKfbFD8Vc0NEMvMrxqpZSyFg1seUz1cZzCMhv8JmihmAJktUi2uuqwy/ogtyZVG4yx3L8sDyvqoZdkv5BKKVE2qRey1j9PsFSmq0lyhBE2024iK6KeknTiQaFvwjUyBNXUkcR41v+TnYqKpb2B3C70vH5O/tq3OFOQ+tvI2BYzBu/a4fBFPK9FrWb/YFFJvHRhXdUgATnhxEmAkJm70PHHA4yY1d92FjYBdwdMPs2dvBMcCTdq9McWVZKthLrlGAWN5gBeDVLbbGkQ/yoBER8iTpvliJKLI9UbZi6oELxnvi4jwvlgUkfCRTvPtBJMwmvyplhF/2GKmW/okuTqZWtyu5Dvd1vnHlM0pHDp3ZexYcvywRuwxgRagpSefhhQ+EPTZsUD7bnmzm6PkjabdEbLioLFwG60RGmsokvi4qOcXRx0XmOTqJFPtf4Te9+/KsHKhZVu9TKmIEWFzxvAiXKK3Qe260/Uil76O2hcch9FnSUA1dfhqpsyxC6xqR2P7bRzF6qiTQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(64756008)(2906002)(91956017)(8676002)(5660300002)(6512007)(66946007)(6506007)(53546011)(8936002)(110136005)(71200400001)(31696002)(508600001)(966005)(76116006)(66556008)(66476007)(4326008)(54906003)(83380400001)(316002)(26005)(66446008)(186003)(38100700002)(86362001)(31686004)(122000001)(36756003)(2616005)(38070700005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzNsWkR6cWplc3lwalRsWFZOeVNoWkFoZ3d5bnZibXVnUngvazNXcG1MQ0xz?=
 =?utf-8?B?VzlubSsydWpTSjk5VmdSQTJwR0hnbHZoajRESFNWRFR2Zi93UCs5VjlxNmk5?=
 =?utf-8?B?T3E0Nm15SSswQWZ5WVRuRmVkTEdhWFJwUnZheGtWcjJTNXgrZnVaVjNDS1FQ?=
 =?utf-8?B?RmRWRkJxWnZMVzJnNXo3bGV3Z1ZDTDgvaUlaNWR3eFVqT2RxUEwzckJOWVNH?=
 =?utf-8?B?SlRHQVQ1eHVKSFc5U0pNc0pqMG5LNDY3b1pmTWZvdTRRbEJYWG1tLzNUN1Na?=
 =?utf-8?B?OUZ5VnJFWDN0VjNrS2phOVNtMEJtQWRjWlVHUWh0T2dtOTB0SEp3bEFmQzMz?=
 =?utf-8?B?cFRsaERWWU5DS3dUMUkrUVlFcUJJMVo2VnRQbUJ0U3pqUUcxUFJsT3REaENU?=
 =?utf-8?B?MVp2VTgrdXQ5UVZPNE9yVkpUdkQ4bEM1K2ZvaCtRdWo1NmJpYlBSR2txdUJX?=
 =?utf-8?B?VnRPd25WZEQ1Y1laZnErSXVVVGgwZDgrelMzU2pyR0RLdWlWa3Q3QVA0VlFQ?=
 =?utf-8?B?OU1ZTllROWlic0t2eTZyOU9VZjRSQUovZDQyQXlIbkpTU2hGUGpVMVY5eStv?=
 =?utf-8?B?ejhkTUYvY2VrQjlPZkJRZUYxS3g4YzBMR2NRNy9Fc1JEWlFuaVFtd3ZLeDFP?=
 =?utf-8?B?dHpWWXMrMTFsK0tCcVJPUVpZc1pkOTNzM281UmNuQmdBSjhwMWtlWmJVRWVE?=
 =?utf-8?B?cGNveWpYaTI0ZUpSWXpnQm96T3hLQkYrcksxa2hGL0ZpSUR5UXBvVjVKZE8w?=
 =?utf-8?B?SGg5R21idFR0OTJ1YmV4SFZTRkVhY1hKL0pkS3pvaEhsbnZxMTZzSkQxSUdT?=
 =?utf-8?B?UHZCbmJTdWV2R3dMZVJJYkR2bmF0aE8vNllOZCtKc1VqNFFQQTViclN6anRs?=
 =?utf-8?B?NllDc0Z0NHhHU2RUMFRUdDhkMEgrM1BuaWU0MkhBT2pIUnFWWHVQWGIraWJV?=
 =?utf-8?B?TStpdzRWVmk0RS90dno2M2tGUW0zcDdLU09YcXQ5VTJQYTl5dW5SaU14dVZl?=
 =?utf-8?B?RUtsK2s5K3NueXZ3ZlY2cEROcS96eDU5RnVhLzIxM0FtSE45aUEzeGRxUUZE?=
 =?utf-8?B?V2dpQVJRaktVdjZ1MVNjYXVLYUZBS2hYT0tFTkNBZGkrNG80dFEzRDA5b2VO?=
 =?utf-8?B?OXpRVHFycGtEU21rMEJqWkxsWTd4a1E0cjdFaThmQU1ES2F0ZEo1RzZTWGJl?=
 =?utf-8?B?L3ppZ3VmcFVXUExtMWpPK1YxSzJBbkFEQk14TXB2QzJxb0ZMZTBmMGx3MEZC?=
 =?utf-8?B?SEdrNEhRVlV3WVdnZ3VFdUdpR0YwOGRiUHFySnRWaDR6dG1QZXM1UnhFaGNP?=
 =?utf-8?B?VVl4MzRqTWFGZ3JPd3NRdE9vTHl5ZEUyTmUydm8wY1I0bUp3QSs1dWNTZ3BY?=
 =?utf-8?B?NVdaOXhJd0Y5RXhLNUp4cWV0MnBwcTcxQzJWWWFnL0xkNEdPbmtPMWY0bjd5?=
 =?utf-8?B?SUxtYysybWdwUzZMYTliUDZUMjNFRVJ4RG44YzA0b21QdnNhYWQybVNhaGFl?=
 =?utf-8?B?cmwyQkEzdkpLTEJMODRSeW13VENRS2Z6MW04VndlRk1iYi9JNGxEeDM3VEgz?=
 =?utf-8?B?TnBpU2h2dmF0NWVsdVJrUzVrWjVvek15c2YzcFJLcVJBSnkzZ09ocFN4dFVk?=
 =?utf-8?B?M3gzYStwTlduTmVKUlNaZjU5elNQL2hqMkdyMnBRelNZL3NHWk1kS0JjYyt1?=
 =?utf-8?B?YzJJYjhxZDBsUWdMd1MzR0xva1BQSTQvWE4rbCtkYnc4NEhjL2RqUHFBU2VE?=
 =?utf-8?B?MWVnWDArZzdCaHphVFlCL255SElPRHlCQ2dCRVA0MDJOUFdHWVlYTkp3OE5I?=
 =?utf-8?B?THkvdXhrcFJaV0tuY0ZIdVBxYUNnczlmYmdXV2c1U1lOZllSTDhqbzFEL1BW?=
 =?utf-8?B?YTJGNzZzUTAyYWh4SlVWVy85eUNScFQvdVdHTWt5NUpKdnZhUlN5dmpEekpG?=
 =?utf-8?B?VVpWR05xM2RYcU5HN0dFNTVIQ2ZaeU5CZ0ZXWEFjOW1vWUQ2enNPckVqWnFX?=
 =?utf-8?B?NGVhTVdOeEd6SWFsWWR2ZW91WHpxUE5BZjVXdTJWbm8xSzMxNzF4WlQ3bEdT?=
 =?utf-8?B?TzBFVGlJQ0xQTm91WStRVGNLUW90eTZVMGpwMjMrWFJnQkd2NUhtclRGaXlM?=
 =?utf-8?B?ZGY4Y1hzK1JJdjUweGZldEJ0S3RLNGRxMkpZUmluaCs5a0VLMEVzVHhOMzAr?=
 =?utf-8?B?cVd6NFozSkZ4L09Ma0xubElSc0xTSkpya2pveTY2V05LM2pCU3BGaGk5aVZv?=
 =?utf-8?B?UDQwL3p1RjZHZWJOeWhYYkd3R2FnPT0=?=
Content-ID: <DA3C1321E94C284DB575C6503C56519B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de5894a7-2007-4f47-8b89-08d9ab3c40b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 09:09:11.9821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8QEAMkctEygJ4AepPDUW1Md2YdgURlFRx7NYDaMTbB2lGuNhUbgpvyZLW28auxjKEFUAsPt3REMruS8JDZfn3qxELMowE4ypnb9JzyoXY7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2781
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_010921_055245_12D4BD85 
X-CRM114-Status: GOOD (  13.67  )
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

On 11/17/21 11:23 AM, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hello,
> 
> Any feedback on this series of patches?

Hi, Takahiro,

We're in the process of fixing how the flash_info flags are used.
We already have an agreement on how things are going to look like,
I just need a bit of time to submit a new version of
https://lore.kernel.org/linux-mtd/20211029172633.886453-1-tudor.ambarus@microchip.com/

Until we pave the way on how to handle the flags, we don't accept
new flash additions, otherwise the flash_info entries will soon
become a maintenance burden. I'll soon finish the work, I won't
stall you much longer.

Cheers,
ta

> 
> On 7/19/2021 5:03 PM, tkuw584924@gmail.com wrote:
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.
>>
>> The summary datasheets can be found in the following links.
>> https://www.cypress.com/file/424146/download (256Mb/512Mb/1Gb, single die)
>>
>> The full version can be found in the following links (registration
>> required).
>> https://community.cypress.com/t5/Semper-Flash-Access-Program/Datasheet-Semper-Flash-with-Quad-SPI/ta-p/260789?attachment-id=19522
>>
>> Tested on Xilinx Zynq-7000 FPGA board.
>>
>> Device ID and SFDP dumps:
>> ------------------------------------------------------------
>> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
>> s25hl512t
>> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
>> 342a1a0f0390
>> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
>> spansion
>> zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>> 53464450080103ff00000114000100ff84000102500100ff81000116c801
>> 00ff8700011c580100ffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffe720faffffffff1f48eb086b00ff
>> 88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b82e7ffe3
>> ec031c608a857a75f766805c8cd6ddfff938f8a1000000000000bc000000
>> 0000f7f5ffff7b920ffe21ffffdc0000800000000000c0ffc3ebc8ffe3eb
>> 00650090060500a10065009600650095716503d0716503d000000000b02e
>> 000088a489aa716503967165039600000000000000000000000000000000
>> 000000000000000000000000000000000000000000000000716505d57165
>> 05d50000a015fc65ff0804008000fc65ff4002008000fd65ff0402008000
>> fe0002fff1ff0100f8ff0100f8fffb03fe0302fff8fffb03f8ff0100f1ff
>> 0100fe0104fff1ff0000f8ff0200f8fff703f8ff0200f1ff0000ff0400ff
>> f8ffff03
>> zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>> 8a0aa90112e154ae3a797df2c211ef61  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>> ------------------------------------------------------------
>>
>> ------------------------------------------------------------
>> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
>> s25hl01gt
>> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
>> 342a1b0f0390
>> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
>> spansion
>> zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>> 53464450080103ff00000114000100ff84000102500100ff81000116c801
>> 00ff8700011c580100ffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffe720faffffffff3f48eb086b00ff
>> 88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b82e7ffe6
>> ec031c608a857a75f766805c8cd6ddfff938f8a1000000000000bc000000
>> 0000f7f5ffff7b920ffe21ffffdc0000800000000000c0ffc3ebc8ffe3eb
>> 00650090060500a10065009600650095716503d0716503d000000000b02e
>> 000088a489aa716503967165039600000000000000000000000000000000
>> 000000000000000000000000000000000000000000000000716505d57165
>> 05d50000a015fc65ff0804008000fc65ff4002008000fd65ff0402008000
>> fe0002fff1ff0100f8ff0100f8fffb07fe0302fff8fffb07f8ff0100f1ff
>> 0100fe0104fff1ff0000f8ff0200f8fff707f8ff0200f1ff0000ff0400ff
>> f8ffff07
>> zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>> 1ad5a0d7d7e0e656986c1e678c416a7e  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>> ------------------------------------------------------------
>>
>> ------------------------------------------------------------
>> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
>> s25hs512t
>> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
>> 342b1a0f0390
>> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
>> spansion
>> zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>> 53464450080103ff00000114000100ff84000102500100ff81000116c801
>> 00ff8700011c580100ffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffe720faffffffff1f48eb086b00ff
>> 88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b91e8ffe3
>> ec031c608a857a75f766805c84d6ddfff938f8a100000000000080000000
>> 0000f7f5ffff7b920ffe20ffffd80000800000000000c0ffc3ebc8ffe3eb
>> 00650090060500a10065009600650095716503d0716503d000000000b02e
>> 000088a489aa716503967165039600000000000000000000000000000000
>> 000000000000000000000000000000000000000000000000716505d57165
>> 05d50000ee72fc65ff0804008000fc65ff4002008000fd65ff0402008000
>> fe0002fff1ff0100f8ff0100f8fffb03fe0302fff8fffb03f8ff0100f1ff
>> 0100fe0104fff1ff0100f8ff0200f8fff703f8ff0200f1ff0100ff0400ff
>> f8ffff03
>> zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>> f17d9e784602187a0933edec3688e30f  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>> ------------------------------------------------------------
>>
>> ------------------------------------------------------------
>> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
>> s25hs01gt
>> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
>> 342b1b0f0390
>> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
>> spansion
>> zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>> 53464450080103ff00000114000100ff84000102500100ff81000116c801
>> 00ff8700011c580100ffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
>> ffffffffffffffffffffffffffffffffe720faffffffff3f48eb086b00ff
>> 88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b82e7ffe6
>> ec031c608a857a75f766805c8cd6ddfff938f8a1000000000000bc000000
>> 0000f7f5ffff7b920ffe21ffffdc0000800000000000c0ffc3ebc8ffe3eb
>> 00650090060500a10065009600650095716503d0716503d000000000b02e
>> 000088a489aa716503967165039600000000000000000000000000000000
>> 000000000000000000000000000000000000000000000000716505d57165
>> 05d50000a015fc65ff0804008000fc65ff4002008000fd65ff0402008000
>> fe0002fff1ff0100f8ff0100f8fffb07fe0302fff8fffb07f8ff0100f1ff
>> 0100fe0104fff1ff0000f8ff0200f8fff707f8ff0200f1ff0000ff0400ff
>> f8ffff07
>> zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>> 1ad5a0d7d7e0e656986c1e678c416a7e  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>> ------------------------------------------------------------
>>
>>
>> ---
>> Changes in v7:
>>   - Some changes were missing in v6 patch. Fix it
>>
>> Changes in v6:
>>   - Remove 2Gb dual die package parts and related changes to split mulit
>>     die package support into another series of patches
>>
>> Changes in v5:
>>   - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()
>>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
>>
>> Changes in v4:
>>   - Reword 'legacy' to 'default'
>>   - Rename spi_nor_read() to spi_nor_default_ready()
>>   - Fix dummy cycle calculation in spansion_read_any_reg()
>>   - Modify comment for spansion_write_any_reg()
>>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
>>
>> Changes in v3:
>>   - Split into multiple patches
>>   - Remove S25HL256T and S25HS256T
>>   - Add S25HL02GT and S25HS02GT
>>   - Add support for multi-die package parts support
>>   - Cleanup Read/Write Any Register implementation
>>   - Remove erase_map fix for top/split sector layout
>>   - Set ECC data unit size (16B) to writesize
>>
>> Changes in v2:
>>   - Remove SPI_NOR_SKIP_SFDP flag and clean up related fixups
>>   - Check CFR3V[4] to determine page_size instead of force 512B
>>   - Depend on the patchset below to support non-uniform sector layout
>>     https://lore.kernel.org/linux-mtd/cover.1601612872.git.Takahiro.Kuwano@infineon.com/
>>
>> Takahiro Kuwano (3):
>>   mtd: spi-nor: spansion: Add support for Read/Write Any Register
>>   mtd: spi-nor: spansion: Add support for volatile QE bit
>>   mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups
>>
>>  drivers/mtd/spi-nor/spansion.c | 291 +++++++++++++++++++++++++++++++++
>>  1 file changed, 291 insertions(+)
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
