Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21A2C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 08:33:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A96864E98
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 08:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A96864E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ti56B3YFRoIDI6ab2sZboC6MmGALyaBc3teYYZhHpas=; b=rfVIqRAzPcyfozC5x9ALLKl/j
	vHlBMhd6bwHMtcKgo+Jtb9SBuLD/t2CtLk+Y6g0sd6Hp6nZNWmY5SX/H72bgZU3RvnXBRm6yg89oD
	0OTZqEaOrHbYhUxrW5fnpVcBLMHVP51O/8ACDHhx7WtWmeqzIPzoccTtEuhUa6Bl4D8HZ1IIEdqtx
	1Ovxlf3hp5Z+9crwu52Au4WZAidG2fB+fsmN8cAFJz5wL4fEC9q04In7lH0iIhUX9LM1XxprCYSLo
	Cbu+C+qIXg5McrNPqw3o6HnHg+jI7+tDFq4MXmOeB079qPT8c/zmARqnGZfbJsNZ8Us/wyFEw55U1
	e7o7Kew0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLieM-00FEQq-MZ; Mon, 15 Mar 2021 08:32:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLidV-00FEKN-Js
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 08:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615797097; x=1647333097;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/mz+MtbvC3uVDY9WHdl/2+aYWrsrdz1hGtLi3sNkn8w=;
 b=izjw+GczqCdwXhWjhITKcWQruYr+rQR1Y2lNMeh6tqN9LnFxWOajOBjx
 dEcR/dRK/6vznuI3dZEa7Ih3jJCwiVpd2VGbgEgHZbwj8bcOti6OJ+rD5
 7eVF2n23GtMzwINeLdBgX4F35P0b/7tLXSsbJpN6OIR2/cj5Nx4TuUCiS
 lUlFgPR/jcYxrp+oAAcM1T3TGy399Y9uDQv0BZXyXan7fFEgnfMi9CTgC
 BLpUHcOKHz8vlpoMkjzFnJkqEtrtILSDaerWqtNINekaT6vbLpVTGv1Xt
 v/6nMglm0xxk97XvO4+AOSvYKbvtVUVvueixA4/HzAoMwdngsGD/AkRH7 A==;
IronPort-SDR: b+IvBjhAZ2gEFvZi49UVo6RCLVYB03Hh5tkiCjAtrp0NHvtzVQGmw+Z4vyLibobGO16rr8mfVT
 YIu5DK1eNjlfY80Dp5+MCbCjCTDEkYBdxBcXWCr0Rdqznzqx0tZZWgsHgh9ZB8PrbwhinrnedL
 HOlqyXus/JIIeRC3DjcDPUtYpi2M1HI+/JuXTEuzdq5QaVvfbGdGJXVNbt+ImqjJcQ3tF5mCfH
 oJEmB5tRk6hp+TPNp5KuZJnak0Y+xAkN8dAj5U2WSAqhVLtwBdivHk8AkA3NCdYUNLTH5TtQvZ
 +a4=
X-IronPort-AV: E=Sophos;i="5.81,249,1610434800"; d="scan'208";a="47524426"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Mar 2021 01:31:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 15 Mar 2021 01:31:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 15 Mar 2021 01:31:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S30c7wNBi5fheZF65iWhJgoux3CRa7CHG43HdrxQvZpeT8e9dnIL2EZU3lz8TFqf6K69w7Ujq0N8GJkMcWhMg9cIgOPBFPRyPRNxrCnqmJXpO8/Lo79jis0UPTamBChaqeEMKdpl9dtf4bxIwgn/OX/FUtSx46xaBoqP2klzmqkUnut4W/v1lD9AYPu+6+iDiAuVIFapOyKl2o3eihOFKO3yrX/Q0Fsws77j1TFz7oLrVNKAjEI6Ybcuu5jHu7LmGQCJEgqpNzmx0Sn1oeURrJFcBHNu+YoWmz7zqh+SZ2rGCNU0ajKFkNbz7lVSsybYeogFRYDb+ylp5iaYtM3Mdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mz+MtbvC3uVDY9WHdl/2+aYWrsrdz1hGtLi3sNkn8w=;
 b=kuViughvVP3/vNMRMuYoj6If2W8vaMyrSRwf0xO9u7NE8Kw3siXMKKu6OU2QZj6qnwf2JU6BQWjN4+9Qtd6qxxjdX2K6/uSeLsTt50q9NUymb0l2HJp/uU/pfJ3l1ycQ1E3zYr0lk6VIv4rgdzjC8XLNiF+yZbqTn3SRTFLES0XkLiKPLo3DqccFApq/yfp+lTyyTGx6yY1IZ8KsblLISwKeTAA2Iz9Fqayvvm+VKOhEh8y5oDpLhJb/5QGHMlIL/4jbeYL8eW5LH2+vLpASXwR+nLy0a20CUbhy6sftkLB/X1PZByXlwrm7xYHurvMre+AOz3rj3ynRj0lth0WVpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mz+MtbvC3uVDY9WHdl/2+aYWrsrdz1hGtLi3sNkn8w=;
 b=sq9tr/XbhXtDE87fDMBtcObSNdB7sY34J9uU4lXpii4nqLg+zsVCToz1s/LLPeVbPMlgKC2OUSieyqMv5fU9m+4UyovqnxGFW54X8cvx4u8/HZZrCRd3Hyreswd4TgCth7BEPEEwZvO8FKse8iuqjTRhg5082yhQHKXLRjPcM6Q=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4638.namprd11.prod.outlook.com (2603:10b6:806:73::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 08:31:32 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 08:31:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH v4 2/4] mtd: spi-nor: implement OTP support for Winbond
 and similar flashes
Thread-Topic: [PATCH v4 2/4] mtd: spi-nor: implement OTP support for Winbond
 and similar flashes
Thread-Index: AQHXGXWZjGgv6AWSAkquJAUSVZICiw==
Date: Mon, 15 Mar 2021 08:31:32 +0000
Message-ID: <5f820284-8c48-e111-c46d-f53bb5ed17cb@microchip.com>
References: <20210306000535.9890-1-michael@walle.cc>
 <20210306000535.9890-3-michael@walle.cc>
In-Reply-To: <20210306000535.9890-3-michael@walle.cc>
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
x-ms-office365-filtering-correlation-id: 4868e579-6baa-4d9c-9ad3-08d8e78cbcea
x-ms-traffictypediagnostic: SA0PR11MB4638:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4638F3B5C896AA3001DBAB85F06C9@SA0PR11MB4638.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:628;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mwYP+jjg5LROysg+MBuc2HHLSmuNXmdBhKf84xHUxUJs6qZp5OZhwkmTyl9yIAGyY1rUplBYtCfCnedo8jOMCmNeJ3BWmGAXbCPM++PNdQ9wU7em4uQiupl5WynMDV8IxnqHwRfNYvpe2nnxzi34TpCABbZJP8fedYrC+DMVJ157SEZpIxSQcQHxaFfEReueRqNUKiGuC5nWjmaZ/r5kv6FrgSouh3o4eeAgG/b/RBLzXBJ5qBgO+5ArpQZ40Sj+fOr33smZ1yVJcku9wg/WIyr62T7X70KELINq8N1/hMHS2uX0V2BMGGk2lhLlVaza1/7hxVueITW1qDBX7OmhQjIljC+KfH2aNwDamX3/jp1l+r8aXD2XmZbyvFMJIKMS1fRroI+47fxE3WgtyRgGNRP60vrlr3wW6rzgHq6zvaYQbXaf6wZtulq+x2kVokOx1w0HsEKHATlkHGGd/oj4I34QO3m+Vung87e2ZE8KLKjOVmA/CrLqNXQPafBnOtayM6OwJen1TEV6H1zTNgZMehKbt/XrRFWqbp9Dn9HbZHbfEBtu60k83eoD1r3lJVxaTZlvtHTHibxaz5Meu7wrnKHOKw0cN9pxankV4enW43Yf5qkBhiwUgHFIDbYd5TnAtKHOMgPxImqP8QwgSncA+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(396003)(376002)(366004)(136003)(186003)(2906002)(558084003)(76116006)(91956017)(8676002)(71200400001)(66946007)(64756008)(8936002)(86362001)(316002)(26005)(53546011)(36756003)(6486002)(31696002)(54906003)(4326008)(110136005)(478600001)(2616005)(5660300002)(66556008)(31686004)(6506007)(66446008)(66476007)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?endkZ0tyUVhDKzRUeVFPcFZ4bFVyQjJVUmlZUVllM1Z1MUIrRGpnNENLZGdx?=
 =?utf-8?B?eG4yRmRzSlFyMXh4NHg2Z0lwM0FVU2JXSzJRUk1UQUlKUGRMbnRiTjQvNzBi?=
 =?utf-8?B?SmRxdlVhZEYxenh3elFySlFZSmhsL3lTdnVQMXVyT2VTS2VzL2pYQzZhL0dx?=
 =?utf-8?B?a1NIaXNnZzlSNXN6S3dIQXdxOVRQV1JIQmlxMkRxelNxUjBKVFZvbVRUZHV6?=
 =?utf-8?B?amYvVEJieG9uaUVmemNXeWM0ZnRzb09yNjAyeE1GTldjN0hxSXRaNklqaDFB?=
 =?utf-8?B?NXlLUUwrSjQrWnVjeUEwV3h6M0tnSXZXMytmMkVUNjVnRUE3cisxbnJJSWly?=
 =?utf-8?B?ZE5xRGFrZGlaT2ErNk84WXNCeE5QUEdsL24yOVRDTDdIMzVMS3lpWmFVcDN6?=
 =?utf-8?B?M3l0TzVMZWFidDBybVEzQkIrd01UY3JwNzBmbGd3dDQzanAzOWdyU1RYbEor?=
 =?utf-8?B?emQxWUh1ZTFoNkxZN01lbXBueStLM3ZCSkVaWlQyeVhOZDBOdGdWa1BKOG1a?=
 =?utf-8?B?Ukd4Q0RXVExkTUl4ck94M2hockVEeTFRV0VWQmo3c2dsMkRGekhkVThaNFZq?=
 =?utf-8?B?ZnYyb0U2cVgzbnZXMDc0bnBBRVExSTR1NkJhNk9EQmRYWmYwNTkxekdVUzBH?=
 =?utf-8?B?MDdtUUo5bm9TZGdBM0EzU2tiMlhHSE1lM1ZtLzYrbWRRRFBncWtTYzJTRFEw?=
 =?utf-8?B?c1JVaURJbTBCUmZKM0xNUWlZcjJNelN6VXVJc2l4bnNZT2lWT0RoN1VqSS9o?=
 =?utf-8?B?TXM2ekZtYjFvOGJpUVA3UUpWT1FCMnJacW5VZHhJamI0c1V6ZEhHVHRuekls?=
 =?utf-8?B?aVUwbjVHQi9Uc2FmTm4xY0JZNVVWNldoOUVZbE9LbUJuYnpoZXBjOFptY3dS?=
 =?utf-8?B?a0syaHpnY0xTNEpRSnYvNE9NUGhxZG81cHZKYlhFZmJwam95cWVRNWZmVnpE?=
 =?utf-8?B?UGxwY0xOQkxlbEdoamdLUHU0eDBWU2QydFJGY1R5UHV6U2swdk1Tak00V2xT?=
 =?utf-8?B?cWpxaDV2L3g0V3pTVG9VeFNnWTFYQWNQWC85enZaaEZia3p0VVUwN1Y4cTY4?=
 =?utf-8?B?eGFrN3I5ajZhbzh3MU5DZ1FGQVl4SGtIMW03RC9kZ2lTMVhwNnBOYnhDM0xq?=
 =?utf-8?B?SkNFM004WHZkNVlOcy84eVVucTVVcG9aakxWN29LMGo2RzNYNDN3cGlLVGlO?=
 =?utf-8?B?a081eUZDVEZmcVFpVXdOUXk1bE5mZGZTQ3hiMEZDVzN6YUFJcTBhM2dma2NS?=
 =?utf-8?B?WmFjS000MFdBM3NPZUMrTUJmSEtad2hmNTluU0FhM3p2QTBENlMwSEs2NlQ1?=
 =?utf-8?B?aHlXUjJ4WkJiUXY5QTN4bUtuMTA0MGlrbC9tbitqQnJ4VjNrMnNwbmlZRjNv?=
 =?utf-8?B?b3ZFbU8rME5GUFFWeWZlVEFMZWNPb1VzMElJVW5UMXZyK25TcFZReUNjWUlm?=
 =?utf-8?B?NVlndzhoalpRK1pzQS9HZUk1WVFjLzFDV1paQTVxVjNYNnd2MG45Wi85bFRa?=
 =?utf-8?B?M0JoLytjUDQxN2NYeFpZTkh1ZE5TQXcxSVdwQk5TOHNqY1hmU1d1S01uYlcz?=
 =?utf-8?B?MndyRVdoM0tpWmI0UlBuTnE4eHppMDJwTVN4eWZ2UWRrSWpVckFja0VCb0lX?=
 =?utf-8?B?VzY5M3JtVEF2ckoySzdxVXJ0L2Q0Mk1WSitJWm9JV2thNmJjekxQZWFrbTNp?=
 =?utf-8?B?RHkxRGJ2VWFieEJLNnpFc1lRVkRwUE9jeUU0TXFtZFMxQ01yQjRzbnlMd1pj?=
 =?utf-8?Q?t0Skzi5CQbhYTi/1vw=3D?=
Content-ID: <465F48AAC5AE1242AEF2CA77DF6A48D6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4868e579-6baa-4d9c-9ad3-08d8e78cbcea
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 08:31:32.2739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 263V6sUJcvlrMUoWSF6rbntNPVmsCCte26dremXhFDLBetK5CajJquE4mgVfOT7opwBlXw1FO8AkTczpSTOM2p7HRqUePD0ZvCy5XRb/830=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4638
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_083139_317538_42A3183B 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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
> +       nor->dirmap.rdesc = NULL;

why can't we use dirmap?

> +
> +       ret = spi_nor_read_data(nor, addr, len, buf);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
