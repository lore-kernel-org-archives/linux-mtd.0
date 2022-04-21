Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9ECC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 13:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfpeltJa2RL+R6W0UCwPVtWAueIKslpSjHvr+6Vh8dA=; b=fPKdVnjBD9TRpq
	wc2ASK1yuq7tQVr95dkLUcJwGONMvcorAvbDMIjgST4ySV4W7RoYmF0UkM7tPOGJsX+Dn1SUZY7CI
	B178yXDpY5NmOUgHbE0aGqmzzCp5wmVaH5NXosC8LS5mdb/FjWkhJmsjSm12KeGJB10ugzf/xxvy8
	FZUn/i5KwtCs8n+HD/rPECDLK+VmsoL5++AKBg/zFgQ92xqVrgPsWtw18pXFVJyvAmt72pDGIy8AP
	sOQcq3wZ33rHV/LXmNAwYpGDMGfLWQ2U+xnkWLyqoXZJWTaSfsGON0sCRGgHHxDR3YE4KNo8TOZ0L
	+mdKH+X33iYcBxrWVtXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhX4V-00Db0D-IT; Thu, 21 Apr 2022 13:42:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhX4Q-00Dayu-AS
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 13:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650548526; x=1682084526;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=msU8I4lUqFnjx2XNFYtFwoJJgXlOq73vKdPCOO8Gblg=;
 b=iUkoapBKyK4racZ41vxpwvWD48lMo7UnM+3l89C3EneuQyu62KYa5j3i
 TQytHJzkAos7fnYm+SPwtUC32IbN+uINvWKYTNJCtLhBHRX56AIZ8Cw4N
 nvtEPn3CK7yrqMMB43zSPRUJeVrJYCkZwvh8MSI5kdF79b0aFC0j5ovVn
 um3jUBkply5wcGJFtXiAunjXAmlh89qyGhgenOIAfC7rfyrcEHHvFrW8P
 Fv5FHQ36O7zoXG8vklUG6c/0N0VWje2V8MU9KJHbLPfkI3qJurfYP4Ppa
 2vczl7nMh/RiZiUeTITn0mPFrbQMp31k3hBinJG4HxGJiNhoxkyPDUQJY Q==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="153368190"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 06:42:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 06:42:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Apr 2022 06:42:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4UJpYn1FJDxK8DK8+8JjLCP0oRP/GdViRCAgVdyWHUrvmYPdYThkgry3fsw59DxmmdDzbggQSYEhYgGwbzT9vsi95ApmBiz/XUJpG/F08wZSDz2hslvUoWY43lLPx3zGbDA7BYFg2QsvhWKnWIyyKVOu+LQWMd6iCVE1CP5uHJSV3igpVQERHwTUPVdwUBun82VIfXERzyyUQDmUQSQd4GL+ihZbvJweLhvPbgUFwUO5MpJ2WffU1DS/+ka0ZwIgUxf0ICLY8rfsLk1LT7q4S5Ri4NnoIWrDtBmzdkubVRtoMFQlm8zTF/wY9z/Nem7NxEFbSrYbJdV93lERWR2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msU8I4lUqFnjx2XNFYtFwoJJgXlOq73vKdPCOO8Gblg=;
 b=RGlJ6P6U5IAgLVSqY4D9EsCbt7snRqqqm6ttNEWB+4O+r7yIQfqm+kENfU863Lp8aLU+yHcvZT490un1LNO/tO+S61iqfUl7hzz3LphoP6ZgGjz4+X52aR7KYBwH6D3psXLtJ4pJhKoOSu4JAF/0twroefWTmk8CHhqMZIg7cQFeHy1XdStewdz+p3sDKDxYITDSjBRphW1pF3k1TKGQw/r7mtDCeBv9k3AklINK998hnvUzBhUFR8tX0q0W7bn4TWry99E0bM5eB6VYk41tcAeRq8ZIvR07CDNQANcjeJ+uqaEU807U5UtywNkAnQ+NLLaJAJY0j+gUP06Y2XqEsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msU8I4lUqFnjx2XNFYtFwoJJgXlOq73vKdPCOO8Gblg=;
 b=cUSAXFQp9mLPLeqlIhJ7mlMgSlosc2eNhePCi1t4YOiiPYbfP/eiQ9Cz51aQiDdxDYDwWw1acUfVuIn/qSaG12oI4qMEgy4wtnE5Q3p9JudHsJPEUo6fmm+qxqJcLZzdiASqMxPCDyV8uHeFBv7YKkaTXZ/QzBbF0AC5toQUi+U=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MN2PR11MB3726.namprd11.prod.outlook.com (2603:10b6:208:ef::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 21 Apr
 2022 13:41:57 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:41:57 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v4 03/11] mtd: spi-nor: core: Use auto-detection only once
Thread-Topic: [PATCH v4 03/11] mtd: spi-nor: core: Use auto-detection only once
Thread-Index: AQHYVU/7/NTsfvb/Zk+xiSXQh0nwdg==
Date: Thu, 21 Apr 2022 13:41:57 +0000
Message-ID: <6f81d38b-5e4b-eaf7-0466-3c6fe5e84996@microchip.com>
References: <20220420103427.47867-1-tudor.ambarus@microchip.com>
 <20220420103427.47867-4-tudor.ambarus@microchip.com>
 <7f570c32-d0be-97ba-0a1b-9aca93cfbbf1@microchip.com>
 <20220421131657.d6hm7rltyxcb24wo@ti.com>
In-Reply-To: <20220421131657.d6hm7rltyxcb24wo@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54a7fe03-daa4-48b7-6731-08da239cb477
x-ms-traffictypediagnostic: MN2PR11MB3726:EE_
x-microsoft-antispam-prvs: <MN2PR11MB3726F02E0B65F7A3973201EEF0F49@MN2PR11MB3726.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4SYXkXY1nfptLLKP+11cHMR+yxdwFNmv0TvwZPHW9u/fOut6D0oiL5EOKcY4PvHtIXbgwqBbJLwg3TkYyhhDeGplBgSlZKo4tM4IE12oG77Qqccdi78m78j/3FIWq1XEcxfHxsX32t4Du+D9XEDogt+91t+z+iW/EE5hsM01vSOYGPW1bmm4qGVHpPqU96WXEa4TueqvGDXq1+E/HUqktz95bbbqZufn+j6hGR++QThqDWhMT59VAhJUDGgqs3TswoIZh9s9jWhCvZJghX4bLrePtNtYpdEVQhTH/ZKawTKnnPxG6Bo314KEwcEmkHNqDWbaqHnoCVRBhWcQHsUasyFmmDziC+eHp6HzFzjh3yh8V3NHDKa3OJRoLDzMhLUZZUv1+pchMcu0J7KTVfiFa8AqykWXkSBIbSQIPtptB8/cW2Ff4+bxIAMs7HWM3/7/m6eR/uxFQavSTyhs10xJBMveWdxC0MU9PVuZV4ZBjbqgHeyubey69HNwaWv00jsRVC5Flg/3TA/YmUrq+1u7QO/RaEwyCKIks8AXMEXjsZjtS5lsWLxja8HOSqJz5vWmN90GE5gN/Ba3yzfSLDhsCBRUQCiVAEXApinmRXBrPyrzyce85tI34QQBy647vgYKWTKU8pPQYBeHpBDL12mz2NmauNm7GYwnhgbilyYhPaSu8z0I7DwdCu4mn/vRTFCmhEJxvB5M8il2a80OsEbX+jR0AKbYIjrQaiGdT3OlKuQtjlb06WyFi/hXesSaxFaRH7C0wxE+c0awqVCgAexLJjtknSJf/KssH855phF6GhpXpsTj6Lmm1At14P/PCELrr4GweLTFav4cqX3z5DotQzArM3oDBK405MS84zCm79Y/TF2+GteeNy/fOtG/A9A77u6M2U9nUHiBKav8UaFdDA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(31686004)(2906002)(36756003)(8936002)(2616005)(53546011)(5660300002)(186003)(122000001)(6506007)(26005)(6512007)(38070700005)(38100700002)(71200400001)(91956017)(8676002)(76116006)(64756008)(4326008)(66946007)(508600001)(86362001)(66556008)(31696002)(66476007)(316002)(6916009)(966005)(6486002)(54906003)(66446008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzZZUDZzL2pOV2h1ZmpIZjJFWDg1WW9TUm5RK3ZpYXNGcHZDVS9NMEludVJx?=
 =?utf-8?B?ZWlTMlVtczRXZkZVcHAwTnNGRjBaSjJXNS9lVWV5cWswNUt5Y1l2OFNSSkdO?=
 =?utf-8?B?VnIvU1kvUEhnZUhJZDFRTlQ0MkJUeTUrSWNta1RnckNQbUV6STNrSVA2VXEz?=
 =?utf-8?B?Q2xUbDRENXlpai9FNzlUTEJVVWp2cUpwT0NET0ZCVm1nT1h3OXZ2WWtOWVlE?=
 =?utf-8?B?d1hrR2xLakRoMmtTTXdvbU9wYTF4ZXB6OStGV215MjdDN2orQ05MTmxDRTI1?=
 =?utf-8?B?RXZBano3blA4cjBWcDFldVk4ZnhUMTRMd05oaHk3VjRXZms0UFJHWVR0NGlK?=
 =?utf-8?B?WlRXcmtBcThaSnltVHJ5U0I5cEFPc2FzL0ZjbGZhVmtyWFdILzAzUzNLaU02?=
 =?utf-8?B?NEJONHZZVUg2TWZGMk9lNFJtRDAzdE5xQWh2d3BwZVVQamFmQThSdXR2SENJ?=
 =?utf-8?B?U3dkUHZZZVdYVU8wV2xvSjkyVnNmMGpjOWRpMUkxeFpMUWNRRGtvWkJFRlB4?=
 =?utf-8?B?WXQ4aW9NT1VYRWJHNStOMWMxRHZPaFhqL0FRRU10d3NQa0JtVTg5dWxvbEta?=
 =?utf-8?B?cU43RS9mc25hdXdwK05TSjl2czNzRUM3M01iYk1OUTQrZFpmUjZXMW9ySGJr?=
 =?utf-8?B?TFN2M2d4SVFwb2JwdXN3OHR5ckdtY0R5Z2pVVnNJcGtHR3R3RDNEOVV1UDFw?=
 =?utf-8?B?TU9VMDMxZlQ0QUdCRWtTMkR0MFpXanBBUWhrYjFJaHc2YXFESmVnc0R5QjRC?=
 =?utf-8?B?YWRWczNOTXRoVFJGV001c1MrVXJOVGgxM0NVTWl1V3pHRlhZYTkybnhVemZr?=
 =?utf-8?B?ZHA1c3F4dWd4NnBmV2daUE9lUnh3MUlpa1l6eEFZVUJlaDBKUWI5RVdXazNl?=
 =?utf-8?B?dThFaEFsY25JWWZOc0ZxYkFiQU9zOVlXRG5xYVdOam8xa2dLK0d1K0dxTU5t?=
 =?utf-8?B?SzhXM3RqWGQxakZKUGNhM0pkN09NaUVhNC9FMTJ3Ty9ibTV4dmg5QitMaFk3?=
 =?utf-8?B?UzdpRmpEejZ6QXcvUi9rWllLOVJtT2xGdnpjbzZkbjA1OWIyR0dHNGtYK0Z4?=
 =?utf-8?B?V1U5RjVXaWpDQ2VGM25jWVIyQ0V3V1lzRGxkYUVQWEZTSWFKTTREY2tSQXZm?=
 =?utf-8?B?TVpmQmNIUkZOajRuTXhWVHpLRUpLZ2o4QXZ6RDYyc1lUYVhLeVFac0IySGVs?=
 =?utf-8?B?cjc4RlJQUWpFOFBvdnRjblNHMjhETlFVdTk4anI5ZXFMV1Z5c3ZRUm8xTFJG?=
 =?utf-8?B?MlJZVVB1aXhabW4xWnNpbnZZZzdadWxqdkV0eEZYMVRJV1VHY3dVazMyNXVs?=
 =?utf-8?B?RmJaaFNpOXduNVluVU1teHBlTEtNUzNvOFJpcXNEOEN2S2hCOG50eFMzaTFa?=
 =?utf-8?B?S0xmTk1QNlA2djhGZENiYldtUWMwYW43K3p4OEFBUEVHQmd6QjVjTVB2QkNi?=
 =?utf-8?B?L0VDbmllZE1NbzM5VUZ0a2tDaDZwcVpqTDVzNDVIbVJyOTNha0MrSG85T3Zv?=
 =?utf-8?B?WFFHNmEzMWhqMWdubndwU0pDVWdOMGp0Z1Z2VmNFazdwYjBRL0xBZ2FHbmdQ?=
 =?utf-8?B?ckw2VERZUkRaanBtNTgxVUIxVUhBbDFkYWZaaHVwYmlTbEtMMWN4TWlaVnE5?=
 =?utf-8?B?Ynh3em1YZm9RdVMzN002T1ZyWDhCdisvTW1NNWFzY2prazZMRHl3MkRsYXlB?=
 =?utf-8?B?dzVMWUNLMm1Odm15aE9Gb0tweDM5RnRiMzZDSnNGSGM0U0x0azRvREh6WkZB?=
 =?utf-8?B?Unc1YTRXY2NXZWtTVGtCNUMzTHdkZ1VvMTdleG9NQ2tZYkM1VWE4dGNMT2Jm?=
 =?utf-8?B?Y3ZjS0xuNFl6TnBwc2hRSkVzUWx3ZFB2OXdlSHdTYWVxZXJsN0RYWUE0TFk1?=
 =?utf-8?B?UkZEbVdRNVc4LzBIc044SHArS2MzSXR2enk2a0owVU0vUEdSZEhiZTJlNWdq?=
 =?utf-8?B?a3haQU00VjZZQzRZN0lXelhUUnhVYkZRQ0c5UklQRkhvYnlHVkRZc3VWTVJ0?=
 =?utf-8?B?TmFwQjJ3dllWSW5PVGVwYWNENUkvQ2RKNG9tcm5RYnNtR2p6YjhPQ2xKWTBj?=
 =?utf-8?B?a1NBbGhCVkloNDd0U1l3Vmx0SGh1bmtYcUV3cFNJYlpzV2dPZ2IxYit0ZWZO?=
 =?utf-8?B?aUZycmh3ekNwZ3JsWGd6bHZEWVlKb0xKUWpJWjN5SVcwZUx4d1FYV3NyckxT?=
 =?utf-8?B?V3FMM00zemxYWjZUeGZOUzRjYzFVNjFNeGF1eVQxOU5BZndsWFJFOFhGaHBR?=
 =?utf-8?B?YlNJMUlhU1p1WnVXaDlrTjhqNmFPVkwwTm1XSnkzMXNuTzNMVG5kY3I0NDE1?=
 =?utf-8?B?VGcvM3p5dU9tSmg5dGRudzNuaCtjS0k5N0c5SUpmaElLRmplVW1XOE9WUXVm?=
 =?utf-8?Q?ZqdrzozYIsVO1sMY=3D?=
Content-ID: <28FB53B0FAD2F7419F729B4762FE514F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a7fe03-daa4-48b7-6731-08da239cb477
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 13:41:57.5784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cmlQhKFia6Yp3Q6ZPNGY+Nk/2J6+hn/OTpBVhMLKr998CcFS2Mx+bltnEFXaSkzgG/FWQzVLar+iFjFqMbzXdsgIQ7AEpMy/io4lZdm8tDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3726
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_064206_498524_EEBCFC94 
X-CRM114-Status: GOOD (  24.73  )
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

On 4/21/22 16:16, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 21/04/22 07:18AM, Tudor.Ambarus@microchip.com wrote:
>> Hi, Pratyush,
>>
>> I forgot to remove few checks, would you please remove them when applying?
>> See below.
>>
>> On 4/20/22 13:34, Tudor Ambarus wrote:
>>> In case spi_nor_match_name() returned NULL, the auto detection was
>>> issued twice. There's no reason to try to detect the same chip twice,
>>> do the auto detection only once.
>>>
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>> Reviewed-by: Michael Walle <michael@walle.cc>
>>> ---
>>>  drivers/mtd/spi-nor/core.c | 13 ++++++++-----
>>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index b9cc8bbf1f62..b55d922d46dd 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>> @@ -2896,13 +2896,14 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>>>  {
>>>     const struct flash_info *info = NULL;
>>>
>>> -   if (name)
>>> +   if (name) {
>>>             info = spi_nor_match_name(nor, name);
>>> +           if (IS_ERR(info))
>>> +                   return info;
>>
>> As Michael suggested spi_nor_match_name() returns NULL or valid entry, so this
>> check is not necessary, let's remove them.
>>
>>> +   }
>>>     /* Try to auto-detect if chip name wasn't specified or not found */
>>>     if (!info)
>>> -           info = spi_nor_read_id(nor);
>>> -   if (IS_ERR_OR_NULL(info))
>>> -           return ERR_PTR(-ENOENT);
>>> +           return spi_nor_read_id(nor);
>>>
>>>     /*
>>>      * If caller has specified name of flash model that can normally be
>>> @@ -2994,7 +2995,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>>             return -ENOMEM;
>>>
>>>     info = spi_nor_get_flash_info(nor, name);
>>> -   if (IS_ERR(info))
>>> +   if (!info)
>>> +           return -ENOENT;
>>
>> also according to Michael, this change is not needed as spi_nor_get_flash_info() can't
>> return NULL. Here we can keep the code as it was. Let me know if you want me to respin.
> 
> TBH I don't think a NULL check here hurts much since the behaviour might
> change later, and error paths don't get exercised as often. But I have

I agree, but at the same time we're introducing checks gratuitously. Since
Michael cared about it, it's fine that we removed it. I don't care too much
about it.

> made both changes when applying. You can double-check at [0] if you
> want.> 
> [0] https://github.com/prati0100/linux-0day/commit/67d913746833ee54bf4c661040f3ef13657dffd8

looks good.

btw: I think this patch
https://github.com/prati0100/linux-0day/commit/b45bbff85d49529f8daff83c341a292f6c6492ca
may introduce a regression on some atmel chips. Let me try it please.
> 
>>
>>> +   else if (IS_ERR(info))
>>>             return PTR_ERR(info);
>>>
>>>     nor->info = info;
>>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
