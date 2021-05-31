Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D094C47094
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 08:28:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AE4D611EE
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 08:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AE4D611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eSPRJd8j8jmN+0ZvrDhSydNsOcrFgKS3pUYP7IbyxxE=; b=HLWkqTEh507k54
	YxBtfipXq16gxrHtvDy2tsO84Tc5beK5xij4Hchx6scoNQmPuXFcfazKm495Zu9pHGm4qxnKEL6fL
	mwFR4EG+5Pm1fSzoEXy53YDo22XgnkzzrhuJr7lP+HNbYM6ZrkM3Wyrue0mToobEnZcxC466c29+f
	Kg4MQLuAepq9sHPtoGoRj/ZnAf5ZdVEDh5xPRTwLu/wWVpAtKqF5ToUSOB3e8H4cFn3uc3osAp1sM
	HUAKpbSWvJ7uxGJe7L43w21223rFMXpFC+WAIZGbWSuurzrBbEnRtD+s9oCilcIbJPz9KxS8EYNkC
	XWmPzDsZBFXHAlnoSlXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lndGd-00BRMm-Uu; Mon, 31 May 2021 08:27:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lndGZ-00BRKr-5Q
 for linux-mtd@lists.infradead.org; Mon, 31 May 2021 08:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1622449638; x=1653985638;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VqHs4GSFTlVYa5ivbMgrKwxz983QYY1pIiKLjevueI4=;
 b=AzqKOQZnqYhjFPQ8BofZ8InNx8HdV1MikVzjYzVHA2w+6edcouxb0n4Q
 dPcK7Qwx1PS5tskCIbCNKZVu8yQlYPuYP1VXmTkgazWkrxibThVM/5qR7
 iEAEfnAeaTdo+t846Zq/F/n9hfP0GUtvzrKjKL8B7DF7b6K+4WA58T7jP
 cu4LuttkJbvR2Nht4ugwEW8LXp+UddSlg/lfote912dX5NdFDfhpEk0su
 pv9thkkJMKIlJdzdLx+MdywtPoMRQibgXsA6A8JtjMYhKPruwd4zFr0OG
 kkaeKIvn0SEvwxwkiK+Oi+4baCE8IaSmwGb+s9xcqLl5pvbGyoxYNZUNW g==;
IronPort-SDR: xgX5/yHOdjTjaTS/+UiQzsxg/z3Ta5vOEaw0ClgZTE0l6POls1IdX4r06gnKJ1l0HVnFkF3u64
 e09rBNzGLNJX6W/fXkE+8r4h9Muyjc8wSxLoVx7W2coSZjb4Yda5O0HATZ2OZHyDGxN+cubFoP
 F+n42MsqEZubXTXDcv9d3pPg+OtH2B429+ZOFMgy83Mrya15k9ryQBQ7x5wm+yQ4hLcGUPJRsm
 FgIR4XFG2F79I5vT+5WdYKu6PQGcnsHF/rOzsB8lSJMHe1OBQexAhbdiiau5/49OhAV9w62zLe
 FSM=
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; d="scan'208";a="117125931"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 May 2021 01:27:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 01:27:18 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 31 May 2021 01:27:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOAO17bGyQE5ET3bMleg/0sJgGudqWqoehA9Dktbhe7l8TVFP35ukVOC5gQoIVJVrV6Mj4sm07CKS93i3Vk0jWKpJrB+T4O5bwAn3L4Joyl32t2t/17Jozu2c/EdWij2lLxlF0p4Qmhl4NRpo+YB4z9YY3CM0CDMZZGE1XtKRuLhcvmaO5r5vZVHW9nK9QbqJ1+Cbeo5vGVxsyMMhXuHvJYyO6siLKBd70Qv6sYmyDN/xhWUpro9RdVPFCLbcM0KJtOvxoBcgpFrbbpXsW6VVaHILyapzL3MkE3nrU68cJ4hY84apJbeUKO6GJrI0qCNwk0aKrb0XgBnGjhvpoKzYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqHs4GSFTlVYa5ivbMgrKwxz983QYY1pIiKLjevueI4=;
 b=dKYY4ZAACLttmUBgwsst/L+xOng1EL5dtDLgwf1Os4I9Sis/OQ5z6J1n2kA4YU0uDvXG4er4s4Wl98b504PhUU+rUmDas94tjc2LRCRWRdR8YBmihNpigVvdrWfJc5yqZ0xrsb/qkMivmNKwABUweIjPwlFYHbzqVRCHUNaiSNFEZh29o3YyhDaB5uUATCU6uqXs4sMyaTu4OfrXCRimxjMCdG8Dp3/vipefWB6Tuo6UUwbJs6RKv56LHxDVppkIqaE2HDL0k4SD52KHjLdtzT42k90lpSdylAI86CXR4UibTXgH3J4RLqdm5JsQybO4d78ioZl/5G0JjUHNhUd8ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqHs4GSFTlVYa5ivbMgrKwxz983QYY1pIiKLjevueI4=;
 b=Bz8K63GQ9VmnCN7OHyI/Ma0/TKdQJV0cgYtOvCLmXX282L6eN+3BIdHge1lwc3whHvM8UOdumy7mwkDn7m5nR8nlWupxTSr/xMv/2vlLGwBImdkLUWKJI4vbTCmFVjNtONPnYQ5KnT3uHS2YeG379+QM59bXCg5jA1folpnLrFk=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 08:27:15 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370%4]) with mapi id 15.20.4173.029; Mon, 31 May 2021
 08:27:15 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: otp: fix access to security
 registers in 4 byte mode
Thread-Topic: [PATCH v4 1/4] mtd: spi-nor: otp: fix access to security
 registers in 4 byte mode
Thread-Index: AQHXVfbCLa22TCLAAk20AqtTmXFiQg==
Date: Mon, 31 May 2021 08:27:15 +0000
Message-ID: <49f5172a-be2a-607e-16a7-0ea30f8a0fe7@microchip.com>
References: <20210521194034.15249-1-michael@walle.cc>
 <20210521194034.15249-2-michael@walle.cc>
In-Reply-To: <20210521194034.15249-2-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa75d189-04b2-4e54-5454-08d9240de57c
x-ms-traffictypediagnostic: MW3PR11MB4571:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR11MB4571057F87E54D024C1F1D8BF03F9@MW3PR11MB4571.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: djdRjDEHDoEserM2UKDdecf7NO/BPZNZhRJefvG4lzttTqnK6dbqOCqWwEADwAzjDFbhiJPWACZhnv+hzKun0+hV7tMTTLSLOtUytsZevM2OjJlVLgoIm8CHsI4RzW44r0VJ3e423JnIxA/VQroAubXi5mPXSb17dQ5/zgJEYNjGcO3/0houSSkT6v0j6Skr36ZSYa9bXoPO9gGf6sAIDAO7qsUC0ksdiUiuQjuufBmujAv6nJevyKyoVEq0kx6opiGLhdJsAA5rFdO2edp9b83udceZ5mudC+2dOlS/Bi8cg3PsHRfTqqFbMA8DN10Jt5fZLjbn8mXx1ZhCtczisHNn8Z+5PYDdcpl4ZXV22TVKpWKXy4CQL19a32nQzRedSuZdl241QfAZyL2uRmIdvhTAwSiNqAZ0omK9oU0NbI1XdYy+5RHQKKlHKx/huCPOA0ho5W7tapviXS9AzeC7bjN3++NPFIusQG7YwvvMp4d1oRc+e8LE46GP0Y/KwfEJrLJvnzhmiOCDX/Ve2s5INgNwdO2KJMGWz/VbxMKf5tXlyq1HTZGJw/KrweMUqiu1QYMr+uUL2xDNbm0m1ZbwmhnMQG7mCxY1OrdDxlWcgvM56rr6dTRXgeJOf3yg6w5HByzndobTx/s7cvx7jvyUucv81Ej4W2w31O8AbCqS8Y3nF0NknABY1x2h5gCa7y7u
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(366004)(136003)(39860400002)(2906002)(6506007)(6486002)(478600001)(316002)(38100700002)(83380400001)(71200400001)(110136005)(54906003)(122000001)(15650500001)(26005)(86362001)(36756003)(53546011)(186003)(8676002)(5660300002)(64756008)(66446008)(66476007)(66556008)(66946007)(8936002)(4326008)(31686004)(2616005)(91956017)(6512007)(76116006)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bHJZcFdySkdJd0g3R1M5YUY2YlBZSmErdk1lL2VBdkhyd2JnL0RjSFJFL1NE?=
 =?utf-8?B?aEtFaEt1cFRIMitZQnpSUHY0S1ZjRjFPaEhNNmFCUVM5T0ZydUlRWkNsUnox?=
 =?utf-8?B?UnVyMUdGcG9RMmgxOXhPMUxmM2Z1YlRVTHJsYVhteUJ2UUFzdGxMbDQzS1dG?=
 =?utf-8?B?OUhFdmk5RDM1eVFpUmN5aHVESms3MlE3cHNDNEhmZ1RZdXMyK1Y2TFpXSjVt?=
 =?utf-8?B?UEdPL1NxT0ZFcUs5RVJIaS90S3libmNZa1RyQmZDMStBUlBwcEVkbldpeFAx?=
 =?utf-8?B?czJDTlpvWm5XK1ZidkE5eTdmN3ZlWGxveGt6QUF4Nzh1WG90MzAvSk00Y3FF?=
 =?utf-8?B?YzQ1TVBnSEN1RzY5VVJaekxJMFJTaExzSHlvaml2MkpyRkFEWUR5SGFSR2VI?=
 =?utf-8?B?a09EbWI1Ri9FRGJGUGxaSlM0NkI0UkdHMDdrOFpBOVh3SXM4djFvOUJZWURV?=
 =?utf-8?B?ME96eWRUWEt0MGNNVTJmVEh3T1Q5UmgwZXBOV0JwMmpkMUVtVlZxQktINmRT?=
 =?utf-8?B?Mm9OWjVyekxOUmdTY1p5aHNSV2dkdXBFaTFKRlo5RWtEOW84eTFoeURISmdm?=
 =?utf-8?B?bG9TKzNsbXhMNXV2QzJrWVpFQzR0YkNXaWR5eVp5bkVDemlPNUtjczFteVNk?=
 =?utf-8?B?cW51OFlWYjBmNWtpR1pzTWt2VStORzZvazVwR1hWM29LMXljdDZQa3BkWDhJ?=
 =?utf-8?B?UzI3NWhBaVNPZ1BsMWdCVnhEaDhiVzhnWVptQ01rTjB1cTI5QlBIbGJSOHZX?=
 =?utf-8?B?YWpuMTdWUll1d01pQ3RHd2UyS0s1K0x6Mk1jMnl2bjJkc3Z4eGxnei9oZTlX?=
 =?utf-8?B?TzdsZE01VUUyMld1LytPQTdWV2ZzVS9SMjlHSnJLQitsSnh6NUFiYjVlcGFz?=
 =?utf-8?B?RmxQMllIVlgwc0Eyb1E0UnhqMVJRd3FHT3BzaUFLb1craGMzRzQ4LzlLOXE0?=
 =?utf-8?B?RzBqanNicCt4bWl6OFlDdllISDc2cFBseUtGcnF1VnJTSnE3d3VUMThMTERE?=
 =?utf-8?B?YVozODZRaGFTNFR2RmlEL0JmNm4vMXliZHhMcStSaFVCRVd2NHk2QUNyL3Zr?=
 =?utf-8?B?bGRqWGlLQWVOMkwwSHBUSHpaT0ZWOVFlRTcxamJhK0EzeDNZVEt0eTRlNXJy?=
 =?utf-8?B?Z3liMGpta3JiaS94SWVkZWh2RWZ1cW50cndVa1YzaGwxbkhoeGxjT1p6Z21k?=
 =?utf-8?B?QUhvaWpPRDJpMDZsZnk0bDlPMC9xTlBETktXV2V1cS9FQURkU3RueHEwQTF2?=
 =?utf-8?B?OTE4UTBzQzM1bE9xUHlOd0VZVHFjbHAvVWd2aWhnemFKeVdsRWNKM0FKTU1s?=
 =?utf-8?B?QmwyYnFkS2ZMOEJLUnM2eFVkOVNCYVR4SU9SZjJUTk9RUHdIOUYrUFNsRExj?=
 =?utf-8?B?c2Z1aU9FVUpZb2labXNzeXNyc3M1MjNPemJNNjFDcWZYYnZsaFYwQXYxVVA5?=
 =?utf-8?B?Ym95ZDQ3RDhiTEdaK0M4YmZHVFYrSXF5ZFV4SkxseG1wanNieXhIYTlNaFNC?=
 =?utf-8?B?TGg5Uzh6eXcrWURYb2JQdzRFT0dURmxad2JzZ1RsL0hNZ1ZoUlFtRFRZM0ph?=
 =?utf-8?B?ZmJTbmdtSE9zaHBhYTFISXZzQ3RTcFVHNkhwNGNkclUySURLTnB0SnNSb3pU?=
 =?utf-8?B?bm9OTnhMbFM4aUltSFVFdFc4REQ5R1N3Qnl5YlBGUXJieGZpSytFdUxXK3Bu?=
 =?utf-8?B?NDF6c2E2ZmNEd1RmSldkOGpHZFNBdWdPSkZlTmYwbU9lWDl0aEJMbmVGdW94?=
 =?utf-8?Q?p4zOIEOO2gSaFofJp8=3D?=
Content-ID: <87CA27B3748049499DC75C924B029FB8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa75d189-04b2-4e54-5454-08d9240de57c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 08:27:15.2353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZLJVaanTJu3Lbvakf1W9ZheBYhtBFNyOONzYmgZPzQ/VhzUOz8k2oBo42i/UJYPA1g37rYOtdqNSwqWrXa2jgrLLy1qxEsEGVNyhHGa/mXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_012719_304798_A2D27AA4 
X-CRM114-Status: GOOD (  15.78  )
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

On 5/21/21 10:40 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The security registers either take a 3 byte or a 4 byte address offset,
> depending on the address mode of the flash. Thus just leave the
> nor->addr_width as is.
> 
> Fixes: cad3193fe9d1 ("mtd: spi-nor: implement OTP support for Winbond and similar flashes")
> Signed-off-by: Michael Walle <michael@walle.cc>
> Acked-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/otp.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index 61036c716abb..91a4c510ed51 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -40,7 +40,6 @@ int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
>         rdesc = nor->dirmap.rdesc;
> 
>         nor->read_opcode = SPINOR_OP_RSECR;
> -       nor->addr_width = 3;
>         nor->read_dummy = 8;
>         nor->read_proto = SNOR_PROTO_1_1_1;
>         nor->dirmap.rdesc = NULL;
> @@ -84,7 +83,6 @@ int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
>         wdesc = nor->dirmap.wdesc;
> 
>         nor->program_opcode = SPINOR_OP_PSECR;
> -       nor->addr_width = 3;
>         nor->write_proto = SNOR_PROTO_1_1_1;
>         nor->dirmap.wdesc = NULL;
> 
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
