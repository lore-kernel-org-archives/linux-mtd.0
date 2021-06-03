Return-Path: <SRS0=SghU=K5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86ABC47096
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 05:31:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7694D613DA
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 05:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7694D613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHDsq8Zc/vZSXB0bL5XgDIiaJ5PezwNZ1an4UMy6+Kk=; b=S/VOYfQW52oSDn
	4+qjdXWasmV8apPu63dqEk0MZsyxMjlyskxR8SmYnw8wxdwZUC4omMAHKFBSwUXFrMikLdR8d7ObL
	dytVkr/e4y3x5FrezxIR6rZ/XrZJNujFN+0kuoSZLV0+mb81D/u9vC0L4Kdv04hqThEQ6Ai1u5E5c
	wph6E0BrVAZx7MmDSMllqix4W93z58CveYG2uciWck9oaxik+tF1kk4KuHw9pU2d2Ut8JyRUfz4Gr
	kpc4Ws4a59oYY91PH/G7PV1p9CiyW0kOhnay9brfXPfy/9o3MSvmpC4TUbb2hTtLaK5HRjM9qTfDb
	BJH2Lq/M5FquK9KrClbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lofwJ-007CPm-Ru; Thu, 03 Jun 2021 05:30:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lofwG-007COY-Fp
 for linux-mtd@lists.infradead.org; Thu, 03 Jun 2021 05:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1622698240; x=1654234240;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nVrtn1R75F708/f2S7ZgCzsjjDzxoBrdMyow8oiZ30Q=;
 b=z7dCHXE2XQWYNTfB31B3BwJx3AxdORTL0t2VMtdZB11z0za/woqYA2f4
 2WAgfLZVpZ0CTV6D89ZB51pFegYc+l7YhOecWo7nPqC3bVczemgg3BbqD
 k2e6yBLSjvqwGF0mCYC8pz0SsBVgAJr39x+6oiV53pl6CLnY7on0uUXm9
 12ZKPikvP3RxaseXt2h9KKQom+u2jIPSEnh5D1EBBt53DoLRdkpFr7G+P
 zFH3ycPKqtC6V389oxL75lficrwAVP2sgzlPpZB60tc4PuxVkZabr5xm/
 P92e3Pv4iZ8l7slgGyxPHyMahd6q2Fd9E9SzfMYQ8FU05hjXeNEpFZtjJ A==;
IronPort-SDR: Ecp1R+wUu4lojVbiX9x5TsaFwhvdKaiLIQXxvOdGVR5Usi9fb0xugYUXNMJRaE/8we/YZcT0qs
 8KP/e6bgXxi2ZjebwaMuG0L+4309gy5JuhQIeT7tL4fkVtx2I+MpJPiL8aHbkOlHJHq7XvDmtr
 RF+F+Sk1hlKMO8gs0brxJ8QuL1qkd//cpcvu7PhY8rqSJK68ux0tYR9unCGEgnDWkL5ZCie2H/
 RyIHSRzoXHfV1tRm6FLOvoEoaVmu9qXn1D+nnMNTUZeNVo3pbgnqrkFWSpsnNGtXeMYJemx3CI
 grk=
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="117488826"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Jun 2021 22:30:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 22:30:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Wed, 2 Jun 2021 22:30:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epCFOMcx3jn7Tf/dexQbERfF1rPVS2hdN0InRA6NCcnbVQYPlXJ1P7ebyofecrho5TuzJFRn+0OhVMoYAcmh/q1cCHnezRGUNDyOxE1gX+b09JtPLvJeGNwo/zNasEVmpF1Zmx1EdHTSPK/uMrgjYhlO2iIm5pGteYK7R0sJcV5TwE8DNRwajr8xikZt4MsZpaLQICSF7MTL8qkjLe3mJJmBx6ODShXGPrZonD7jiUYhU8JVIaRQaZJ/ZvxylbsHmC/KsllxOpGol8QcsBxg77yBE+x/AzQg9tEZeu6+OG1U1espd3ZtPSS0/XPqrIm6l2HPoQBeZrlx5WmtQOu4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVrtn1R75F708/f2S7ZgCzsjjDzxoBrdMyow8oiZ30Q=;
 b=mzbg5CwS+Db9ViDTHHf59qOiStdCOi7CGRUmXmLz7PcYIWNQFA/SvnsVKrk6QO5hLuK4HFGS48THbjp17KbDllG3tjDfopmaaSoN6yb06JT6AK5HtQYV88uDCJPgDbq+brI88fFg6OLAvl9otqsKHOApnDzfiHnoNXwoZmzANUjibhWPwHnRrZhUgFswRDPP5KPpXvHkAAJYAsUVA3Pl1OH8G8BuuY2vfwMfO0FAvPxQwwFxYZfH3Mmpg3JnQ1Gz7txZpecMkXpFtWg6XIz6PUyISiCZuaQHuw6vRrQVxgRnp1K/hyX8UoXP08/nSUgBH0JMYAmZ/wihTxOI9jZWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVrtn1R75F708/f2S7ZgCzsjjDzxoBrdMyow8oiZ30Q=;
 b=TB4kbUhtsBYq5QA127zxHZaBq+X/1FC5GpFBLR8H7uQsI9s0jcZaBlbjWadrCVW88EU2PRGrzJEzs3kOwTtxUW03Jm3yT6YCvXl4baMjSIU7njT+diwwrXe4n4vN/gdqX4BKr2JFX0Av1St5E1NYp/pL5mrC6pnbW4aUgvK7oIA=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MWHPR11MB1935.namprd11.prod.outlook.com (2603:10b6:300:10c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 3 Jun
 2021 05:30:37 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370%4]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 05:30:37 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v4 4/4] mtd: spi-nor: otp: implement erase for Winbond and
 similar flashes
Thread-Topic: [PATCH v4 4/4] mtd: spi-nor: otp: implement erase for Winbond
 and similar flashes
Thread-Index: AQHXWDmU5CE4GzTJPUCkLlU8wI3quw==
Date: Thu, 3 Jun 2021 05:30:37 +0000
Message-ID: <05a0b543-9069-b8d6-c337-bd33409155f5@microchip.com>
References: <20210521194034.15249-1-michael@walle.cc>
 <20210521194034.15249-5-michael@walle.cc>
In-Reply-To: <20210521194034.15249-5-michael@walle.cc>
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
x-ms-office365-filtering-correlation-id: 9fca6dda-00e9-415e-3c37-08d92650b809
x-ms-traffictypediagnostic: MWHPR11MB1935:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1935CBFD645A53AA03A9BE83F03C9@MWHPR11MB1935.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ub0QPmwfiLIHRgX4cpXkE4fFZIRcXiQdMwB75PE3BHWNhZfMlluorNw+SNE3nvG312TUUCLobRNa8AkC/tvJnkNdywLrphymp2Q2XmGVbsjDe10O57woQyd80E88qU3/7xAviZA4VsM8/zDjxAkfYy/Zf3zbryFnXr09qx/QMr8HFcD4pXFzZIUZrQZu2+S6JbQcsHWGbo52m2/Yfm4RLuf0pr702KJkGWkxVtbO//2S13peUU5xOuNL02KbSd8+OQ6Nk6HCCJ3z6IP/jMb4iILgGd3s8UdYysVYVkg0F6Cez0JduMLVJvlwZzBKavNmWTp2RfMq+tYs3NmHdzAf25QoOSWk/p5utVp0+owW7DK5KbKeLtQ4zlpOIuUFB3UPrRtfU4yIqQYXmLcacttMBhRMtSLgEOSZ1sCQERF9DjQgtCJOuddtanIRbgb6zlG3wSuJzOg8CAMK0vqFJqnIpIqxIjKD7s31zM825sHPfVEROrANiSC/f7wylhJh+R52znnLfZpS3dK8EG8O2gxPdDCVC8CwvHyoUV6VmHLi7Y5qmRnirUg51UGAQjOVaonmyOfiDPF4aCwpjDcLAKnDzRJpgCisBQOIinU5FQrdggGBLEWKX9zY1IILcuv/aCZys7FoFbEZnqmyl5Ds+0GTPyLfSk0sAuh4ZnfAf1ZqNbUWwKvP8ohUG5zPC8RdAmKX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(366004)(136003)(346002)(396003)(2616005)(122000001)(31686004)(6506007)(26005)(5660300002)(64756008)(478600001)(4326008)(186003)(53546011)(66556008)(66446008)(83380400001)(38100700002)(66476007)(66946007)(6486002)(91956017)(316002)(110136005)(54906003)(76116006)(8676002)(8936002)(2906002)(86362001)(71200400001)(36756003)(31696002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OG0yaElPN2o0a1NRWnRtYVgrU1BjMlpzbHR1bXQyK3ViYm12WEpKN0JnSFlt?=
 =?utf-8?B?S2lDcm0vU1dydXhXckVsM1JuaU1heDI2NG0xYm9FZUwzY3hvQmw0QmtGa1dr?=
 =?utf-8?B?MTl2UE4wc1hPcy9keWtNTjBhUUNSU2ZaSjJSRDZCaWJFUlM2SW9WNm5kQTNu?=
 =?utf-8?B?K3RsQVlJOFRZaVdtUFdVdmh5b2Q2NjlwVmdmYkUxYjlNQUJaNEVqbE54dTMv?=
 =?utf-8?B?ZjJjYnFuSDB0UmdnN0ppMmp2K0RkbEwwSGJtOGF0QVRsUFFaUXBHdVNkM1Zu?=
 =?utf-8?B?LzJnNnNXVFE1VWorUWpSakJhT1V0WWtkeHhySXdnMUs3OGdScjNpYmxyNEpJ?=
 =?utf-8?B?NXJheFZCL0lTOFlXalc5clRXTjY4b2NSMDh2a2ZpZmpPWFRGS2RlQTVvYXpH?=
 =?utf-8?B?ZUZwMldMNFVXM2xsRU1nTld6ajhtcnNMa3FlOVk0ZjFDM3NXK3cyekZpbk8y?=
 =?utf-8?B?Y2ZHU0VpeldOY2NQc1owYlFOcTQ5QUp5S1lTM2VJN3FuMVNab013SCtZZW81?=
 =?utf-8?B?YnE5SjJ3dnNmTnpnbVc5V1BXQWpLbW9VTGhvQit6Uk8rb1lRbm94VTVTVlFs?=
 =?utf-8?B?Yy81WmVnMFY5MFdIMlJKWGsrS1h2d3RhelJvTFVjVk05VGNWWUdhRG1va09J?=
 =?utf-8?B?YzRsT09lRVBreENyQnZ4SzJZdExBMkkzTlcrakVZdk9pOVNtcHBudU9XdDBV?=
 =?utf-8?B?YXJPcjJrOEtKR2RzdlkrVHJmeWc3NjdKK1hzaE91RnFWNGJoTklkYlFkVHlm?=
 =?utf-8?B?a1RwbWVtdnEwemNndTRQZm5uOHRwQVhRR2NiSDFtbkZKK1UvdWM1UGxWZGRT?=
 =?utf-8?B?UStqMkN4ZThLb1FvQ2dHeFliUjdMS3lvc3BkZVprWExIcUtlT21sTGhUbnVO?=
 =?utf-8?B?emYreVNnSUpSNU51clpKUS91cER1T2JQei8vTWs2amtwVHZmVVQ1S3pwNE44?=
 =?utf-8?B?eUs0UDhRd0tCNTYxZ0w5VkJHaUFBVDBzMnJGYzhmaG5EYlNQV3hwN21URzho?=
 =?utf-8?B?NzR6QW1OUHZraC91Zi9abG13SXY2VWErYTRlT1V0ZmNuZnNjdEJlU2hNbTVl?=
 =?utf-8?B?aVFNdTN3MURHV1lNYTNZODhmeXVIOC9rUXNXUGpoai9MNDFjdGNrN0YxRXZU?=
 =?utf-8?B?NmU4U1gzZjRneXdORUcyVisyQUtKVHVtTG9lemJQaDVGdUt5Q2pwUTZuSisw?=
 =?utf-8?B?Y3BITWVPNWNRN0RGQjV4Z2t4MVNkYnhIMU1SREpOTGhyakR1ZXQxZ05VK2Ji?=
 =?utf-8?B?MU0zemhFbEw0VGZIMXNhSlRBeXh6LzZnWFJrREZzTU9LQlFGSlFvQTFBWDN2?=
 =?utf-8?B?WUhvUVM2dTVhRkZPMkd4eVBNZ2t3UGZJZThsdzRTRjMrMEw4bWlHSUk1VU8x?=
 =?utf-8?B?UU9sMG9MRW5XUUZwb2cwRFJOZUd0dnVsa2ZKa3AzUEFSNGprVzBaZ1U0Slph?=
 =?utf-8?B?YnVBVmMzZWhQZUFaM1p4QWdpU3MyTVF1Zi91cVVYeTQyZXNCTUVlZ1BDNmZo?=
 =?utf-8?B?QjRqaGdKTDdhOUhBOGZxcmU1cWo1NlF1L2hrUHJERmJ2TExLMlFuOXBMbEV0?=
 =?utf-8?B?aS9ER2Q5YjVENGhGMUVrdjBJOHBrNm0wdDZiNHlIUXFCcWR5ckoyajFrZ2lp?=
 =?utf-8?B?MFZha1VXb0lMTG84ZURFK1lrdTRGQ1RXMlAzamZsWHhpQ2RaY2NWUmhtL2U1?=
 =?utf-8?B?Wm4xeVliSTF1OGtsNVR1L1RaVitMVTJIbnJNcGU5Y1dIUUI4Y0xYWDJ3aXNQ?=
 =?utf-8?Q?wzEuVN7MrRgcFpfZhI=3D?=
Content-ID: <12E5AFB1AB3B6D469738C70EB7275F8D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fca6dda-00e9-415e-3c37-08d92650b809
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 05:30:37.5572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oei+UHHHaaBUx0IfO6I+MPKBk2sn+636WihXumF6Gutj+6aCfzkR/NKLamAxZ5+3WP8KgzZv3PT+EkZdC8D+4j8uGRJqI/mwSpJMlRDzXbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1935
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_223040_650329_83870F00 
X-CRM114-Status: GOOD (  27.32  )
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
> Winbond flashes with OTP support provide a command to erase the OTP
> data. This might come in handy during development.
> 
> This was tested with a Winbond W25Q32JW on a LS1028A SoC with the
> NXP FSPI controller.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c    |  2 +-
>  drivers/mtd/spi-nor/core.h    |  4 ++
>  drivers/mtd/spi-nor/otp.c     | 83 +++++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/winbond.c |  1 +
>  4 files changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index bd2c7717eb10..9551effb6a44 100644
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
> index b87f96593c13..afa348a3af70 100644
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
> @@ -360,6 +392,56 @@ static int spi_nor_mtd_otp_write(struct mtd_info *mtd, loff_t to, size_t len,
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

if (!len)
	return 0;

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
> @@ -418,4 +500,5 @@ void spi_nor_otp_init(struct spi_nor *nor)
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
