Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24479C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 10:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2Gn3XAqLOVtSIShP3hVoXpSwLXtwLKOPKxC5Q2CUCc=; b=hsEz1MsulTLBRY
	fcF+8wM1+SiaCnE33x8hcy5JOMQkr4rA71ts8PhIA6ocInec+hbamb8YaGp8lVRrgFOcZDVIyqWYi
	ZuObwwdaPYSJnehHPgrIpCzYAu66x2HbY76XvklR8JbZOem7pFrsCJ5afTW+0aNw/9oFOpTpS9B85
	K/7yA0Mt/Hf0JCzZpw+rdseF2oTjYIThv0yjP9bo0fLSOX9DvP8qAl8dbBOSrxv8LQ+zsYwy+chll
	5WJtai1Lfn/hkJju9WpS3IfEbXYmCjPvHf9U6MbFFV9xmsJsTJv0PcY/RYEXf5bz+ZvRIltZTaEK5
	E0epKfgJgzKh5wUVfmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhUHJ-00D40V-Sn; Thu, 21 Apr 2022 10:43:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhUHG-00D3zT-4F
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 10:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650537790; x=1682073790;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yLiRzHQKA+VO8dfPc6svx2o6BT3V8e+S7u1QGk4pt1g=;
 b=V9X3KkRwuzTxCBKBAx48ihtWF38qi2WMOIyvVGx3PjvRIYTROoran0O1
 VDrGn82RI9yMCbG6t5QNqsevPzOdJMB9f1birBG6J2rtDOa1KXIWYsQsa
 OzEmGX6G+7JvqtgrbGMOyxCHVdLHzgtxEiPM8YrsC/7NHKaTQE6U5d4pQ
 cYHxH9KqNSJW9wCWH+7ipPV8hpiXtUi1SA9vriF0EjZqA0U2znKj2FN0/
 OVy8FJQOO6x+GZt4odhrBfufAwoc4kA2cpH4eAsENG7bknpvX+iTn1V4V
 7KJsNCFOfYySWTBLzX71MUJR4LiqKaBcfWgGLBWIlX1h93jZjXwNGBDWZ g==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="170409439"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 03:43:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 03:43:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Apr 2022 03:43:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sr9okd1w+f7T7qhvawJAivAEwzc6edujFlMzXdYcYxkidCBxhlcWYVCA1mF8SwSqhAQLHii8RZMKIQXhqo34v6icnxMVkKGZkd+xgUzo8H1xeAVnWkfiz5oleJaHvO1zUcB7LYoTJRseCqx96expDrMxkiGs82Q/HkB+kiObu6Az4unMJ1fTuxxXaYo3yfuzFlBSAE5cWfA5OvHbJVKpiCNKk4FcAwBX4IS2Q53wvMjMcq941IgyxAP6JFdg5sCOc36Edzhe/Z1Y/6ckNlQ0/N4uVpre1AmwqDhpehydtgIBrXAHlM57uIFIyUWf67h8k2clDrexG5lYUil5qtPOng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLiRzHQKA+VO8dfPc6svx2o6BT3V8e+S7u1QGk4pt1g=;
 b=H8fYhnD99yzppnFERRLNRBPEFei+3KeK7Qmi/XRST2by7kY9OdnwLLrEmWZpAZLVsczhsX7SobYUuwpcbDNdcpF0iDRCOhtUT1T97LN5X9YN1/jJ/l32oPSd6nOYpnv2uCCDrSnArcEFmLrDvuPkJ7gfwVPS4U9zdErkVZMlOg8ZpR09fff6p6NvjWiPypBUs32bUmdsxBRNLaFQFFkvU7x+R00kPnNf4Zmlm8+358Z6XMGf4+VfL0JH9+TRRczB2v6cx91/k0niz/gNaYj+Fpv/Oto/s3L4JXAR/abgAQf5DSyUlsJj0cr9qNqek/KNs4KWiVZ1ZgTxYs9dkxEfXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLiRzHQKA+VO8dfPc6svx2o6BT3V8e+S7u1QGk4pt1g=;
 b=TMtNMJomSQgJnCXiH/B36RSHvkK/+dbxNsHThmwI+sZTYw2NZ0YxFRhmDkRSs/9uLpLJQrmXxj4eHzFdCJg1z8KxJWWYcpsJT3qjQ4jRX3OhU+UOUJEA2D0U6XZ74KP6St46A4GRF0ThYfdG0YXrTdSJMACnh6/bJNLprQaExQs=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4592.namprd11.prod.outlook.com (2603:10b6:806:98::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 10:43:07 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Thu, 21 Apr 2022
 10:43:07 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v13 3/4] mtd: spi-nor: spansion: Add local function to
 discover page size
Thread-Topic: [PATCH v13 3/4] mtd: spi-nor: spansion: Add local function to
 discover page size
Thread-Index: AQHYVWyWulCv0OdjyEeuQCPnmM24cg==
Date: Thu, 21 Apr 2022 10:43:07 +0000
Message-ID: <35eaf3b8-d602-592f-7a9a-865baba14a3f@microchip.com>
References: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
 <228838a08ce42b886869cc8d59a4029193afe0d8.1650532121.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <228838a08ce42b886869cc8d59a4029193afe0d8.1650532121.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0867381-29c7-4cdb-53b7-08da2383b8ee
x-ms-traffictypediagnostic: SA0PR11MB4592:EE_
x-microsoft-antispam-prvs: <SA0PR11MB4592B40A3BA5497887BAF22CF0F49@SA0PR11MB4592.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HOotk3R7FTnFVAlMWtWCSYlKzj/8jgF4N9zTZtZ7GBcxISiz9XDTzbUe5ssu9qtoJP2tTZDup0x+QDyul1OfZrEvRijXjXX5ap0hek4R+vF7uZC6BsbrkAYQ6q5l+K/KCjNoC4+UyMCD0xyWtPblRQPTjkBgkxcNAz5+9ss7xIj69CiRxctJIU5fZ0C3Wl80a3Mi14eyyVMlk7ReS8/WuITYZqRsREE8fmNimtgBK8G1GWi/fXdO0XbLyQ75aqtA8yHK5+k0/nibdQzk0E5n/u8lugeJNVukCE0PnxNpuQzs40ADtEYPAqyeG1MKnSDC3qlQQJWO4C/UWoJepGC74inh/NDqTLnDI0eFxQGUrUySNF1MBEo1GCwjPlefB3TaBRHo3rXp6znLecrcZXTo1bc/wSD1MmIt9Lb+nCK3lRFKYpCVU7bm2wexXXkKD2ws7KNE3JoT5Ar9Fz4YDqFVgMt3Yyu4qycdp1p9unC4R5CSQFsLOx+X/u662xGj8XftT+MXDS2jU/kluk1qkV9asQ5cdNqoE9ZCXS8sms2FWoBTXH5viFcMV9ZNOEgRCDEyXxB80ElaPfdjSsVbvkpiEP6DUe9Qfh460F655XVXFtwLX9tXsGL870FQ2gvQ1gaMoCpzslX2SBih46uOZkDuiCOxdbmkDV8h1hVt7Dgf7c6O7F/c2ccixrWosrBeJtLZ2/0jqjGu/KCRHTSrmUhw03MsD8CrJ9PeGYtQOdksHOcoAanC2Jqo40geye5JwWaDB9VlpliVmtQK3quDT7dYlrtrofiN1aqFkdU3AergGZthaOuAwm75oo8FfUOOxTjztPamNRnG6SD+o1Jeo+3sh+pftQ7JovEMcWkRhyNiCiU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(91956017)(31686004)(31696002)(316002)(26005)(186003)(5660300002)(83380400001)(966005)(2616005)(122000001)(2906002)(8676002)(64756008)(66446008)(6486002)(86362001)(76116006)(8936002)(508600001)(6506007)(71200400001)(6512007)(66946007)(54906003)(110136005)(36756003)(38100700002)(38070700005)(66556008)(66476007)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N21wazNoMjNMSVRiTENGTlZGVVVPWW9xQ3VVUm1VZlZvY1Izam9ENUNTQlli?=
 =?utf-8?B?OGQxelgxM1pCU20yU0pLR0RKeTFZYUI5OGI0ZDhLWS9OdE5hNVhxKzVxeG9W?=
 =?utf-8?B?NmNSUk9HOUp3UUZPYUE1MnBlSkcxMHMrN0JMODV1ekN1QmRlTTJLcGM5VE91?=
 =?utf-8?B?cVRtaGtyOFQrem93ZXNQcUlBenlRalY1UDFhbGlzVGh3SjVpaVBtWHg3a1oz?=
 =?utf-8?B?ako5Y3JwdktJeVBmVWlXMG1KenIrelRGSGswd2hWWEhwejNncUhJU2x3V2h3?=
 =?utf-8?B?a2EzZ2xHRnNpL296NzczcmhDdUF0Wk9UVlNZVVFwdS92YVhnb3JUUnpkZ3FP?=
 =?utf-8?B?UWt2Z1NWNkhFdUExNFZGUEJNNlRTRmRxMjVoU3gxOWRlNllRRjJEcWJSaEoy?=
 =?utf-8?B?MFhrSW53NGpmSGtVbGdTN2NnZkNPZUl4MGJ5QStUaG1rMmtMZkdoQ21Lb2dt?=
 =?utf-8?B?b2xsRFFOUjYrZ0VhaEdramREajcrbGpaQjN4T0JPSWZ2RDFvY1NRSjJ3YjFH?=
 =?utf-8?B?Wi96YWovbzNVMmtXRExFZTBYYUpGK3dBbXhiTzg1M2Q4NGxyZGJzNTcyV2oz?=
 =?utf-8?B?R3ZSdHVaa0ozTlZ2VW9tbEtyNWYvbHhaQ3BwY3JwdCtvSkNCZ1cwZHQ3NUlD?=
 =?utf-8?B?RVh0MExBNWNDVjFueHNVWkd6NmI3WXNYSVlWRjJCNmFLZ25jOExtc1IrcWJx?=
 =?utf-8?B?ZjJ5anRFc0dQS0VWQk9QOVJCQkl1OHF5NmhFM1Nua0xRd0xwNTMzRER3Qzlj?=
 =?utf-8?B?UEJ5UldNK0lET3lMdVBGTmN2ZjlOTFRsQWtNTzJxaGxaOTN4T09UWDFYMis4?=
 =?utf-8?B?L0RhRm8zc3EzYnp3NVl4UTB1ZE9uNEZ2SnlaNGpSdTYzZE0za0dDVFVuN0xU?=
 =?utf-8?B?dDNsZWlCRjhIaldnN2dXb1hpTnpQSzlWSldPTUtVdzk1UjZzNUwrZi9GRkh5?=
 =?utf-8?B?VEc4cGJvYTN3RXVTL25Tak5JMlhmV3pCNDlaTkNtRFhFZHY3YTFRUHg3YW9Y?=
 =?utf-8?B?dDAvcWJYdkdlM1BSRzVzMVNxN0JUb2VsUmZtZVVELzRwMk5QN0FPem9XQzJ1?=
 =?utf-8?B?Q1h5aWg2Mk1yV0lmbk00dXRVZm40Q3c3cFdYSmVZR1FGQ0pjTDFqNmU2VDZu?=
 =?utf-8?B?OUZFWmk3ZmRwNjRrdmhzYTFkNEFpODF1ZDU4a2ZOVmpsZzBuNW96ZnlKWEw1?=
 =?utf-8?B?V05jalpzdDNKeFE4TUJpeFljN2ZRTVRJZldKUnlxUmVOc0tHNjhHS2M3bEx3?=
 =?utf-8?B?eGcyYmpicVJnL3ZVMWdWUTRTbmlLSHRYUFNkWlBWY2JPR2dKVW1VQzJ5NGk2?=
 =?utf-8?B?OFlGMnFWaTU2RG13SDlFUFJMeHY0NjNUUC9lc1cvOHg2dk8vR2p3ZTBOK29H?=
 =?utf-8?B?YTZkQzB3aUc1UXN3S2hTaGw2T0NaZGM3dWlwNGlaSlJWYUZ2a2s5a3lPTVVN?=
 =?utf-8?B?ZTNERzZYV3F1T0ZFaXhMNTFoYW5RVmR3djdSUkFFN05HOEM0YTdmenF1ZWky?=
 =?utf-8?B?dVVKMUFXamM1Vm54cml4VTk2eVhJbkEwL1UrZHM1M09YcmE4V2dpN0RHSTVa?=
 =?utf-8?B?WEZ0SmxhS3ExMk43cFpXWXBKRTZYRGNZdUtjTWNuSWRLVkNGOTlhL0RYUlhZ?=
 =?utf-8?B?YkJvTUt6NlVQM1lDbk1JbytubXdLQkNkRzVrempRZHBwdE91MllRV2s1RHpp?=
 =?utf-8?B?ZUlSdEp1SHJCZ2JKVFNBSnNxUHVSanROdFZLNGFxYkxjOVdIR2NUMFZLWm41?=
 =?utf-8?B?U2g4VDhqbVdJV2g1dEMvREpFajRWQWthdlBVTUpMeUo0UHJrTTFnMjBTZkRz?=
 =?utf-8?B?ODNCMjJKdVRBOEd3L2pBTFFrMlJmNjNUYVRpaEhDNlBNZkNJZis3Z2hGd2pX?=
 =?utf-8?B?c1h4dWVzYW56TzByNWQzTGdtWU4yQ1QvdVNldzZqZ3RXSlRqQ09iMWJsNkFv?=
 =?utf-8?B?SU9EbkVSRFZmMmNxbXA4VTNtSkpmVTZXd2lzUUVQQlhOQWpDb1hkRWV6NjlY?=
 =?utf-8?B?RENER05PNDBTU0JGNlJ1Tzg3YXNlTSt5eGZqNmJweEF1ZytUZFhBSVhSVVpE?=
 =?utf-8?B?TXFneDV5TzJwd2xkc1F6RERQREVvdU5IamVOZjRxaXhrTFdBVEcyZ09uVzFX?=
 =?utf-8?B?WGpyNVhtZmhNN0M2N3lPZzc1OXJGMlJzUVlhKzIweFpVQkpRUHZzUFJHQ0Zz?=
 =?utf-8?B?WE1BWC9BZG1MOVRUOHcwc0Z5NjdqTnRFSk5GMHg0NG5ZQVFyNU0waTh5eVlZ?=
 =?utf-8?B?WnZmck9lQWhLeUdFaVJnZytPeXozd2oySjJUTTBLcVRYV3hadmNnb09pUnlP?=
 =?utf-8?B?UEVFcTYzM1Q5OTJJQnhZWTJEOU5qOWpIYStMQllJL3J6VGljS3pBY1BNVkVi?=
 =?utf-8?Q?4hDp4VWNiNgfq0hg=3D?=
Content-ID: <9A4FF7FE15A88F45B093552DF4F70FE1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0867381-29c7-4cdb-53b7-08da2383b8ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 10:43:07.6505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qjFHVxtg/2tQaCNr8WiHnHxhP1w+PVDRmcu3LBB0OkmZ5MAjidBCCoy0Ywe1sBX2aTh6krAfwwcsojB5F3Nb1IJIWoukKiEDNWyWLnhkXd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4592
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_034310_216830_34AD560C 
X-CRM114-Status: GOOD (  29.92  )
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

On 4/21/22 12:40, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The page size check in s28hs512t fixup can be used for s25hs/hl-t as well.
> Move that to a newly created local function.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> Changes in v13:
>   - (no change)
> 
> Changes in v12:
>   - Rebase on top of Tudor's series
>     https://patchwork.ozlabs.org/project/linux-mtd/list/?series=295933
>   - Remove addr_width param. Use nor->addr_width instead.
> 
> Changes in v11:
>   - Rebase on top of Tudor's series
>     https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294490
>   - Add addr_width param
> 
>  drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++--------------
>  1 file changed, 32 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 65ae3ade0b95..952d4383f9da 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -172,6 +172,37 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>         return 0;
>  }
> 
> +/**
> + * cypress_nor_set_page_size() - Set page size which corresponds to the flash
> + *                               configuration.
> + * @nor:       pointer to a 'struct spi_nor'
> + *
> + * The BFPT table advertises a 512B or 256B page size depending on part but the
> + * page size is actually configurable (with the default being 256B). Read from
> + * CFR3V[4] and set the correct size.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int cypress_nor_set_page_size(struct spi_nor *nor)
> +{
> +       struct spi_mem_op op =
> +               CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width,
> +                                         SPINOR_REG_CYPRESS_CFR3V,
> +                                         nor->bouncebuf);
> +       int ret;
> +
> +       ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
> +       if (ret)
> +               return ret;
> +
> +       if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
> +               nor->params->page_size = 512;
> +       else
> +               nor->params->page_size = 256;
> +
> +       return 0;
> +}
> +
>  /**
>   * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:               pointer to a 'struct spi_nor'
> @@ -226,28 +257,7 @@ static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
>                                      const struct sfdp_parameter_header *bfpt_header,
>                                      const struct sfdp_bfpt *bfpt)
>  {
> -       /*
> -        * The BFPT table advertises a 512B page size but the page size is
> -        * actually configurable (with the default being 256B). Read from
> -        * CFR3V[4] and set the correct size.
> -        */
> -       struct spi_mem_op op =
> -               CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR3V,

here you substitute 3 with nor->addr_width behind the doors. It would have
worth to have a dedicated patch for this and then come with a patch for
the local function. Or at least add a comment in the commit's description.

> -                                         nor->bouncebuf);
> -       int ret;
> -
> -       spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> -
> -       ret = spi_mem_exec_op(nor->spimem, &op);
> -       if (ret)
> -               return ret;
> -
> -       if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
> -               nor->params->page_size = 512;
> -       else
> -               nor->params->page_size = 256;
> -
> -       return 0;
> +       return cypress_nor_set_page_size(nor);
>  }
> 
>  static const struct spi_nor_fixups s28hs512t_fixups = {
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
