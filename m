Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D24AC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 08:27:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C94CC64E89
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 08:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C94CC64E89
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QJh937xzPwsJm0IWWTZF3JYYLUbpnNHcsNQyCKKjMM8=; b=LgPzONC3WgkUldIejLErUIRFA
	j59BqHrbCOloeyRHYQOBrtixegc2VwNU7VCa770wVGvSa/nJuIkofnqmdtPcnufxyXm3C13WxdJgf
	6dtkhG705iEIr3sHdal7Gs9Kizsh7XIMQGQV4Yr/CnZaJIFOCUJFQy+OfRh1zeGAxwmT2t74NwIGM
	oa8tr8DNrzBWMTCEYE2E8Atn8kVW+aGGYuKElx/hzTCOF+J5wXqVGPbKLTh8vbKnxEElRbvovuXa+
	9+CqBDMsFMyjERQ9WqjECIHFyl6jlhXsaOz/2FjWxijjWoAh7CPMmBENma/d9spU5c1TtUS+3Is2x
	epGJ7Ql8w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLiYV-00FDk7-Qv; Mon, 15 Mar 2021 08:26:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLiYL-00FDjW-Dr
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 08:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615796777; x=1647332777;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9815Q8LbPoetogWBLa2orlOpc0ZGgLAY6meaZiA3SwY=;
 b=N2VyO14mjjyxuLpbxAGCDOYYmutXzMZSRBvt4ptcdDMOPvLtNm9lnPdK
 SzHsTyq8Y6r/cKh0svSScg6dGbHveXu+UNQx9I2RPnFzzEhdF3TffRaiu
 tuF66noNitXuzlGVsiIcp4xiZkDCLEDC3MLihGdBD2gahDp9WNKu1mIsF
 w/PQPDRK1VeKWEDgILFIJPg9Izouv/1gWw8Ck1PwjuPeQ9qwNXpHAf+a3
 61i2UeZfT4wf8MyY6raCQgv00RD5ZWBY0L+qiYBfiTT01y4UYrnIfJW6+
 whY94JD+s5levzxcz+e0h1C4LBboJwnlP8NbEaqb32C4Hpbx6kcnXElVF Q==;
IronPort-SDR: DJdvTZwzY7ukHVOtU81DSgYgr0Y8+exvvGXqUKoKQ5GMo+NIUjZN5qNxwVhq+BAEuziAEczPoW
 ti2tNhb2N9MCjMSAcQkPVzGRnwtvDUD97PSjvlIwB5vAaDMpBIr83znnpbpvIp8qPMHnwPS4f0
 HXQHaSWyGB+OBU6bTRL8wnShQTyA6M1J8yvffKMzPqBAJXdJPFoEqSjpQie55j/WP0jDbF3unp
 emeSq+xJLkL3Ir0wjP3D7uWs9ltS75FKHgrN+ZgwlXiykLnjsoNK9dqpESqo2S6Vg6pLO1zdN6
 2tg=
X-IronPort-AV: E=Sophos;i="5.81,249,1610434800"; d="scan'208";a="47523649"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Mar 2021 01:26:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 15 Mar 2021 01:26:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 15 Mar 2021 01:26:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2gQGrGoKYA+1ml6GgUnOHSJU1z1Fn7S10W2rx4nspZ9DCXNXQjabSYMPSua5OlZPY3uT1T9bczvVLDZrBqbTUfUQl85ChU6MgRe2Iz3k4eVh0/YhEK5DAE9M1CJIy1kNYs+cb9bBz9a1etVHjkhhKx2sdWu3xIWOBHkceT7QqcW1maB1qmySoORjlf3+FOypSQpTsjhZJFofYrEZdk4Ssi26OGVsBRjLNhVNObEWrCtOZ9gyx/dqjvJ/Tiy7sTZjRlBOyoUr8JL1RL4nMNxaYnw5ztBSItt0Msc4ua2/ndLLP8yIqc2x7b5tnHa2MWKL2oBwtHPrSsn2lM7sc04cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9815Q8LbPoetogWBLa2orlOpc0ZGgLAY6meaZiA3SwY=;
 b=j/Hr1HGVN52lLN6A6yTiTk0+htudKJTyAP19hpQeBQHpUvT4trVS60n2V8AiStypj1KA2ccvjUOrypcPrUFKRelX4LyU5PE2u2o+27T2QigSJqNb+SkM8wFhpjy4g6iEXS8vwDqRuScWyOSApTHkFFXdSRNeHUh8X1M02x46ROlmSFaCTmWXLcelTU83dmM9I+YP/xzz5KmFaOQM9BvpL4rN0sLUnnTwgXuQ6NRPhJF8UddVyEcF3cQdLOIxEcFH6oC8OtYFJQ6yArTY6ea9SDKZayfBgcT3/jiIX68u1bOw8S85pZdMJGXZJ2gd0vIJLe8ou3LCXaJMCdGWv3FkYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9815Q8LbPoetogWBLa2orlOpc0ZGgLAY6meaZiA3SwY=;
 b=Xq/c6eCYeBf7qZaqJYUhFZnNG7uS7DRETkBtKCBH03wFDRGk3steCjGSJdrupaoJbWILMyGCqEE+OUXbKdCII62AI7P19j5BiDxUaBHfFdEA5ja/CiKXnVc+Lp0RIEGCw1VN2YAfDHOThVBAzygiErpmL+UfEM6VJwMR4rPZDEc=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 08:26:11 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 08:26:11 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH v4 3/4] mtd: spi-nor: winbond: add OTP support to
 w25q32fw/jw
Thread-Topic: [PATCH v4 3/4] mtd: spi-nor: winbond: add OTP support to
 w25q32fw/jw
Thread-Index: AQHXGXTasCA5v1Asb0eWrA7CFF4dWw==
Date: Mon, 15 Mar 2021 08:26:11 +0000
Message-ID: <8e7147bb-a9ba-2b4b-abea-69e72ddd82f4@microchip.com>
References: <20210306000535.9890-1-michael@walle.cc>
 <20210306000535.9890-4-michael@walle.cc>
In-Reply-To: <20210306000535.9890-4-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 373edc2f-78e0-47c2-28f2-08d8e78bfd7e
x-ms-traffictypediagnostic: SA2PR11MB4905:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB490563515EFD4D66F2B455C3F06C9@SA2PR11MB4905.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CFQnls850rAsPzJ2KGOjJoQdoFuCDLbcykrh45D1qsnqRfK1FW9Qeqsfm4kZrsuQBpgLM/sKLiuOKVHZI+dhueixclXLFfFADP2OehL5w7QxFXqVMm1PJTJi6kHrZXUt12Oqit2uL1dsoQCVY89iDUxZ6skO7AmYLCPsoVuomWSxgDhtqUTNyy+7uFYBw/gv0Clr+i2uIjqJUNltnb3Kpjt2NuXcVkJC1LfWXn6DQUEdpTpXO5DLd5XpY2sd1Yk0ukkyvGFYF5gpxiF5RpWBlEjZnRwMq8x7+xk3J2Z6qKxj0m4xnlMOqPUoys0C/l9d8z/ja0b6yZh0pY9ots5VapDpf/s/7TvqRMmEUvvETwlK2u1Gez/pmq0VbvxNNHR311tSrT812uQBV/RpHvSgj4TRKFn+7XPtN4HpJzPNfj6IfQ5KjW+wu6vVOME82j/9dsP9NSKrlGLI3CrI/v4zm8O+U2IuiC148RXcG5TyGo69ekYWmqnvdiO7BdbioW39XMFfkO7bvIlq64ihZlvf92de5Lmjf6hXoizGlhjqBgZkHnWsa0n7X9jxXoiMVYVRQA5KADvynnWQCQlSHV5g6Av4OZIGlHcU12Ll0SnEgXrufxrfccpZBMYoPGznL8wZCXm9l7T+pqWtsXNN18GDBQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(366004)(376002)(396003)(136003)(316002)(53546011)(2906002)(5660300002)(6506007)(66946007)(71200400001)(64756008)(31686004)(36756003)(76116006)(91956017)(186003)(26005)(6486002)(86362001)(4326008)(2616005)(110136005)(8676002)(8936002)(66556008)(66476007)(478600001)(66446008)(83380400001)(54906003)(6512007)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?KzdNSEd2N0tVY2cyRlVFazNJZnJ4Z1J5c0FNUW5WTFpXTys0WUtxK3RSQ204?=
 =?utf-8?B?OVdPUW9uTWFndmNhWlV4Ky83RkJGUzZxWWdzbmhoVmZqZC95VFlkc3NyODlB?=
 =?utf-8?B?Nm0rSkdZd3hWQlZGVE03VzJBc2E1Q0ZRYVBWai9HS2doRVJ6akNKSVhsUGt5?=
 =?utf-8?B?UmV6QjJWQ3BraVN4ODVjWDgyUjFrU2ZndlBqYXl0SHdCTmJoVEw0SXptNjhZ?=
 =?utf-8?B?OVZHc1UvcG83L25Oa2d3UWFtbVV4T0FFenE1UUhNMGE3cEh6RlJVZE5aZVFG?=
 =?utf-8?B?NVNWazBZdWJ0U29iTFdJbmwxR3dtZHZIc2NkVEZKaGhSd2tGaGNKaElHUlgz?=
 =?utf-8?B?OEw3Q2J2Y3p4aGhZSDY1RndoelJzODAzallEVDQxbnJnaTBQNW5vL1ptbjdz?=
 =?utf-8?B?UFB2SWJhNUNJKzNCR055Y1JXYzh0SjVGRkJqR0VmcVdKUGV0THlKV2MwOFpH?=
 =?utf-8?B?OGRnd05xTE91RVNLS1BHNS9sbWIzamZUbjR1NnJIaG9VbjRmQUxqNitFQStB?=
 =?utf-8?B?REl3MWJReE8vclh0OHJGUXN4Z1pseGJVUVVqaHluNUtPcHBIdkt0YTRjNnVR?=
 =?utf-8?B?TzRZaHJhcHBmTmpXdTV6V1dOYkZsNFFZU1hDNW0zY2l1MlRFK1l5NWlKWHdF?=
 =?utf-8?B?TURlN3YySmptUzhkeTJpdTRVMzRLYmtOWXRkY3lTWHhPbXFJQjQ2M1EyUWwr?=
 =?utf-8?B?NDVPY2szSE9kZzkrZHo1cUdRSjRaTjhtU2ZXSjFjcDNXZzZpV3FGZUUwb2xt?=
 =?utf-8?B?djg3V0VRQ2Q4V1B0VzRYWHpDYnVRT0JoeEFjWnFKWTY0RS85eDBIZFJtSlhG?=
 =?utf-8?B?aFJhRkxBRzZEczQxaFdnNStzRkNOekhlTUpFa3B5VmV3cW91aG0wVENuWFhl?=
 =?utf-8?B?WkorTGp2L3Z2NyszUmhqaVVab0prbHdMZWcrYTk2SEhYSlRKdG1Sblc5YjlB?=
 =?utf-8?B?dlRsNmJIQkdKcnJpU29ZTCt3TnMwck1NVHo5amszS1dpQTZUc1d5TUlmN1M2?=
 =?utf-8?B?aGsyQjhYUEdFZHZiT2JHcE4xMnZLck5GUW1IckVmZ1pGME8rVUpOczMwRUFY?=
 =?utf-8?B?YlVXME53aStSajNnZ0lRTCtrSEkvUWpqUFlQQWtwbVB4dXAyOGtPbnUvcXdm?=
 =?utf-8?B?dmJld2JORS9pSGg4QlloUnh6Y2J1Snp3SEJXbVJmYUkrbGZuN21wZEJHZUxR?=
 =?utf-8?B?czRoUkREaDlLTFFsUUEvZW5RTFd5elhJdGtyWUNJNm1aaGliU3A1UkhsVk9v?=
 =?utf-8?B?MFI5UnREV3VoMG5WVVRVUVdYeVMvN2xYYkwrbW16T2JlQVp3L296RkIwNkRS?=
 =?utf-8?B?SmdKQjEvcDBoVWFTc0hTc2xtWGdpWDd1TS9KbFZaVTF6djNDd09rV0ZsRXdn?=
 =?utf-8?B?Znlka0IvU2hCVFVsRzJ0YmtvSG5BcEx5dXdmSThuZlRwa29HTHc5cllVbDlx?=
 =?utf-8?B?d292T0dJaDNHbnVzb0tRWUhrTlNTaHBIMkxIelFjUHRKOUo1WmFSckJlNk8v?=
 =?utf-8?B?Ly9jVE9BWlhmSkNvWk9SNVlOMWFoRTdJalNtMkF4Q014Ykd3YmV4WGF0RnQ5?=
 =?utf-8?B?b0VlYUx1QnBqZXgyd3cybjgyT3BSYW5nT3JiY1JJaHdaUzhEdEZOV3VRdDZL?=
 =?utf-8?B?OSs0UTlDNm84TkJKVGUyZWs0UUR0cXM0enV3dWJ2UW9Ra0dSV2F6VlRIYTE1?=
 =?utf-8?B?YmIrdWx3bklzd1M3bjFpQ1NtNjVNR0JsZk41dExqdjhCejRQb1NCR0pKZ3pI?=
 =?utf-8?Q?BukyDLBypxxoHQP3dE=3D?=
Content-ID: <460FE0EE404C8240B39A7E652DF21A1F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373edc2f-78e0-47c2-28f2-08d8e78bfd7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 08:26:11.1622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tzmr1vxMIQJrhYUJKGKOTANM+ioNZwiuJKY0mfB+zbs8RifW8mqzHcS/uy3nyfkjqiflsHo5NqW3fao1IUlPRQH1JveLJ/Dub4zyPvqQChg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_082618_274900_7DB18640 
X-CRM114-Status: GOOD (  20.94  )
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

On 3/6/21 2:05 AM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> With all the helper functions in place, add OTP support for the Winbond
> W25Q32JW and W25Q32FW.
> 
> Both were tested on a LS1028A SoC with a NXP FSPI controller.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/winbond.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index e5dfa786f190..9a3f8ff007fd 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -55,14 +55,18 @@ static const struct flash_info winbond_parts[] = {
>         { "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
>         { "w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64,
>                            SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -                          SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> +                          SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +                          OTP_INFO(256, 3, 0x1000, 0x1000)
> +       },
> +
>         { "w25q32jv", INFO(0xef7016, 0, 64 * 1024,  64,
>                            SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>                            SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>         },
>         { "w25q32jwm", INFO(0xef8016, 0, 64 * 1024,  64,
>                             SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -                           SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> +                           SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +                           OTP_INFO(256, 3, 0x1000, 0x1000) },
>         { "w25q64jwm", INFO(0xef8017, 0, 64 * 1024, 128,
>                             SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>                             SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> @@ -131,9 +135,18 @@ static int winbond_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>         return spi_nor_write_disable(nor);
>  }
> 
> +static const struct spi_nor_otp_ops winbond_otp_ops = {
> +       .read = spi_nor_otp_read_secr,
> +       .write = spi_nor_otp_write_secr,
> +       .lock = spi_nor_otp_lock_sr2,
> +       .is_locked = spi_nor_otp_is_locked_sr2,
> +};

Should we have this in otp.c? It can be shared with gigadevice as well
as far as I understood.

Cheers,
ta

> +
>  static void winbond_default_init(struct spi_nor *nor)
>  {
>         nor->params->set_4byte_addr_mode = winbond_set_4byte_addr_mode;
> +       if (nor->params->otp.org->n_regions)
> +               nor->params->otp.ops = &winbond_otp_ops;
>  }
> 
>  static const struct spi_nor_fixups winbond_fixups = {
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
