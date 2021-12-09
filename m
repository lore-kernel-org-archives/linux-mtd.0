Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A349C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 17:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbH30WF+7YeRzZdrr6NhSBoKgrq5v4W9Tm+kgGCUJ/k=; b=jbYQ4i3Im9Qej/
	nmN23qazaXFEzhD8e/1WGJZ2yxtNhuVyCW/W14QwA+OTUnzUV5gmZkngTkMzH7Qwtim1XyYwKAaXv
	r/Q0CzrEzHc6Uv4HaOuXpS9zMBOKkdzCTbHYvWygSYccSvKcH3gXUWp9/Ort8o2ncxl7UdNOYF61L
	+TtUhGB9/je6mYvWPdKvvN3nMxEb1I0sPfMkyh+UEpe4hwE/LHU1E3vxbmyE+Li1HDjzmK20wvj3+
	NgsLGG9Y+DSHdFCWpj2YG4yoBxbuRb3ojuigXJ+n7gNhMt4TuWttBUJmmV23upRiYI8BbcAkyiMKR
	HRJqR16HXFmhYKbeOo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvN8k-00Gwr7-NI; Thu, 09 Dec 2021 17:23:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvN8i-00GwqM-8E
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 17:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639070609; x=1670606609;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gNZa87o9rt6Utrom/1zcPgk4urShTYve+oXXjQ+156c=;
 b=scwsQ4JKysN0itlCp5B/+yVHRmb6/X85xii3dEKf5GYfgjnN+bs81dra
 cJi6msEFTVAXEoDXmO8smQLk0Qz6dzuLjlKPuqSXTusiErrFtLdFYcyK9
 YDhParRkciGMc64aL86EiyH8LfWx94cNsfSMtBWXOZY1g/Z/PWgSse1Jw
 ou0NdTasVmQSnf6nV/oIaX+hzS7aePH6LkXjSwR+DqwVsWaI48oByI7xn
 bW7yZrRy4r98U4cLA+m7c6+t8jOMva/sCDilUzttN3/7P2MCw/mrVQdtU
 OWVdKNtVCUABJu9fbKxh468aqAhdGJJ8IT8TiIlVNC20bjal2mKcUeARI w==;
IronPort-SDR: Yqs5Up/EoxJJb3sb0SK4KaPImt3Sxi9GSVHJgFHkwZBNe7sZYTp77jELsV0vSQemqAcZEl2UWZ
 TQkAMwB3mJTtYawAd/2/NbwYtr3yXPJz7R3QN3NiMBzD+ZyASB0bWO9H2bBdH5oebar0Kp2VzL
 De7FSteTH6J8POaodTt7hOkO8RgCHJVMk/XQnx6YwhU5I0DeVfjiiNyX3RpWCw0lNfUPHcFJyO
 LyD34jzx2Jh4Kkrg8pjSuOJKEmwTTsb1weFpadJ/PI77ylofxzw1VrsCQeiGQdQoRnaWVe5I7T
 E6Abs/UU7wvrbq1QxeFfwInV
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="146122570"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Dec 2021 10:23:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 9 Dec 2021 10:23:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 9 Dec 2021 10:23:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCHNU5oVSnSCTR0/q7pv8+opYMWN8RMPloBrd+qQHuhlrwcTqp2jmfqE8qRaTDOb+AAq4aQlwrBsFKCq68RE+rzSI+S7CriHBx9FpS28jEDgTL0doEkBJ8ar5Ofydrq2mqhUdDjbb1B8fbl21BJ5f24hEQJ6Ruol+jYcgUM0fYTlQOSMcVcn7XCr7QD63uN6YCplnNkDkEkKdse2gGtMVJoJ50U9kknKIFcgSYYnB10a/J7zrvRM7c83xqwINuP14a71mQzxl8lbFaQdr4X1Aleuja8rDvFwMvTG3iAr6Du6CZLwL9ZW4JkEqzHp7j/0xbUeJq76oib6CqesODdqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNZa87o9rt6Utrom/1zcPgk4urShTYve+oXXjQ+156c=;
 b=RL/VqxkH8BX/zyb0zXGDGAMxU48knJKJsSVuBxWhfGcvxz8VBv7jqcGV1ZE3W7ta3ov4NYn6TfBceHfloGHgn0klnn+pNDsq1Eu2WrFAmIg/Pjzm5xjXqjIpXRoZP0X41NHCIEhe/La5lOUFTmqW8Q7wbu8+Bkx1hxmVviBQ1NQuZiKBHxopYNLZCnHATcxr6dCOyf5wZrzPd/BKxuJ3wUVzHbepjUU7oThhllZtyJNxvjSRUl/LrdPB12xLDLsBc33r9TlmZ+l4aaDNcr1s7FluIF05yZNape9DAErJ54mgyTgWs4xSKP7XxgronykNhopi5/+tF157b97VjcfxEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNZa87o9rt6Utrom/1zcPgk4urShTYve+oXXjQ+156c=;
 b=umt7PATjDB/gzaANI7lAgsTlSQf3LwLy5at63iBQOSRN9O+aeI2yJ25x9Nzj2fxI1JzPfuPTlEO2nGdCC/A13sHIg2+91o/Iy/V7T3uOXgQZ2kWa4n2xANk/G3iKuG5nw6WBKtE5mZWskg69KlfdFDDZMwN+PlmHed9LxjIVXKo=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4638.namprd11.prod.outlook.com (2603:10b6:806:73::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 17:23:15 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 17:23:15 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Nicolas.Ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Add support for mx66lm1g45g
Thread-Topic: [PATCH 2/2] mtd: spi-nor: macronix: Add support for mx66lm1g45g
Thread-Index: AQHX7SFzW/jHuePPdUyxMpBUZMO4Yw==
Date: Thu, 9 Dec 2021 17:23:15 +0000
Message-ID: <3c848db7-dc76-5d7b-3131-b6b857230d7f@microchip.com>
References: <20211209172109.398258-1-tudor.ambarus@microchip.com>
 <20211209172109.398258-2-tudor.ambarus@microchip.com>
In-Reply-To: <20211209172109.398258-2-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f200881-17b0-4f4a-f911-08d9bb3895f8
x-ms-traffictypediagnostic: SA0PR11MB4638:EE_
x-microsoft-antispam-prvs: <SA0PR11MB4638F5740928EBB6B851C67EF0709@SA0PR11MB4638.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rfjYSLWcFhBGSUqlKqov5ZvgUZOwUPIvky/8s6JeRxnhAeKJcHnSZtPUwDLCmjSNLoTwoCrTGck5AI3EP/KnhR2enYD2+12K/+KJ4+l37FmVWtQCrZ0TxWS704AUbPj/Fy+lvP1FTFbW0IP3pySr7TqVhtYm5HdTobFyHDFnXyE5RNYNaELfpU2OAH+ZS2YNMEIN+/jhfZsrJQvSf2/uXGiTr3QhLxYgp9jzgW02iCnuTg3LSk8l6liDL+ucOHViQdI0vhw+PdTgdDU8xlHhar+4viZbfAxwwvT86Ni0WOu4YoI9ewI06k6nPDbSoktb67L/pdSVrDSD3YEf8e+wzM7bABAbJ343rIIy4vIGk9qCYpkkMjKOKBFDq9xNV7f4nxRXpM2hcZCqOMB2FMPZWC3RsJj6M/nWgg6j0G8bdfkQmsuwZX9k3AD22KaWpsmLRyk9KLPrLrZtXc8g4W5V3Y6B8a7cybrdE/ODlkQeKtoiPFjKMqIDotVPGMIhGWpixBBLpuXHDrriVvOfzedoTI3KnqfroCb7LyCoqQIld72Q2mpJkMEqzlO489jmQQOMllB5J53Fo6eZEgo8VEzmtYD3p+mGBzr72uSj73wPgq7023DpZRf4Jry/39/rqsMSLxprWPzCsM37Adp9qPcypCtYW0ZR1bslrB9ZHLUAlPW6szXmoztV5OE7xAUQdoleuaztDYYjTa3ZCadsM/5q2ZRheGGUuZxjh9Dfq6Pn8gNe0kyOgd7TnTTKiCF664F+7z3WwsUjfoyBfkXzShSRB8Dc2yGuPcO/p2qfujUSXUb0z70/MKWrNokf7hD8uaE9USJNejiqB7w4nSbjPBrzHw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(36756003)(4326008)(316002)(38100700002)(26005)(54906003)(5660300002)(186003)(2616005)(38070700005)(6506007)(122000001)(53546011)(6512007)(86362001)(66446008)(76116006)(6486002)(2906002)(508600001)(31696002)(64756008)(31686004)(66556008)(8676002)(71200400001)(66946007)(66476007)(91956017)(110136005)(138113003)(98903001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2lGT1loYzA2Si9GR2t6UmRRS0c2Z1c0T2ZIVjhPOSthMVNrcGRyZGdyQWJE?=
 =?utf-8?B?WGdEWFN0L0FvWjJ1ZUZBZDJHa2dRSzlWYUNXazdranJlZzhPV2FubVRtRFVV?=
 =?utf-8?B?MnB5KzBRSTFwRXM2cHNNaVduNW0xTDdaYkx3OWthSENwUzNVbVJMelQydjVN?=
 =?utf-8?B?V0NpRVAzUW5UNmRNa1hpNENQeHJkM2hEemx4R0ptWFhHRzkrdjhiMEJaZ3hl?=
 =?utf-8?B?R3E2VjgzQkVSWTJqR01YbGg5R2ZuSENXeDZJd1U3YWpXdDFTaUxxM3JhV1NK?=
 =?utf-8?B?NkU1VHo1T2tXL0hueUE3bVZTWmIzQkJlTFd5SzViSlBpODllZW52YTRHSmc2?=
 =?utf-8?B?aHhWWm1GRHNZemFqTDhzeVlCMU4vZmtHNFlUc0I0dU1rRDJpY0ZwRVViTVpz?=
 =?utf-8?B?VVZsd2hodHFxVjJoOUJiSzRaN2I2N2ZWdHRZRTBzbjdUNFNHU1I3eTNxbWtw?=
 =?utf-8?B?WE1QREFNWmJZTm9GRlpnMXZ4TnNxbnZzdkJHemp1MGtkRWwySWpHUHV2Z3Bv?=
 =?utf-8?B?bE9LVmlzMS9aZ1lHQkpLbXF6Rkh3UkJtL1c5RWM0UDY3ODc0OVBCSWI4VkRo?=
 =?utf-8?B?SEoxM1RLQXFrUkIwQVVWQ1NUR0JuaWJJNTZSdVJ5RE9zZ0ZSYXVlQW5qYlYw?=
 =?utf-8?B?OTRuWUxwaFZvUUI3Y29yMFNJcDBKVFFqdzZBM0tGUHZEengrUnBqYnAyVFd5?=
 =?utf-8?B?bmlIeUwxMENTNHZTRThGeVBaTWlyd2IyQ2VtSHlTbkl0aUFabXZBbk8zNm9W?=
 =?utf-8?B?V0RZcGxaYWRERjZwdXZ0NU5mZWE0VFJ6dkhjU1JCSS9kaTVjMm1HYmp0WkxN?=
 =?utf-8?B?SzZyM2Vlb1hlbDlDdFlaRmZyY1FERis0elpyekpNSzF0QngwS2NjQ0t5ZUxE?=
 =?utf-8?B?RytSOWd4bVJ3alhmYjR1aTFFLzVyT3lITnd5dFZTZE9TNnp3OWZiNkhPd1ZV?=
 =?utf-8?B?QTZkSHEwSS85MWdIS1lhbWNlREdEQmRaTW9TQVJUak5QNDhNNUV5dzdUNGtN?=
 =?utf-8?B?RXRGclJwenljZ2RFK3J4dDNxUmNRK21wS05TVE1VYkxncDFmUFZGdCtQN3BR?=
 =?utf-8?B?R1RXbkZWYmRia0V2ejhjaDNZaC9JMDNmdWloL2o4Y2U0WEp4N1hNbExZQnBG?=
 =?utf-8?B?SXQ1cHFJUFBYRE40UkFiNXJubzJIeS9tMW1GVVdUM3BYOC8rN1dVbjJ6MHVs?=
 =?utf-8?B?TFRuZHM2MHF4N3E2ZXNONUxjOW1wVDlmY0p2TUFJUXlqY1lkMDVoRE9kdFBy?=
 =?utf-8?B?eGh0ajZVTUNFZmllcUxyY0d2WS9DOTRxbFgzRi9NUUVITmxzN0d1SFdkY0Zx?=
 =?utf-8?B?K0NLVUJ0UTlkVEk5UVBEM2ludmhFYVZaMjZJN1liVDlaa2ZqVnpwNmtmNVgw?=
 =?utf-8?B?ek9kS0Z1OFd3bWJjcnZESk0vRlhrUk1sd3NjVjJFdm5HZWtwTUg4S25EQUxi?=
 =?utf-8?B?ZEhtZVZFRVFpM2lpd2I2NS9Ydm1QS1k3UEo1RUMxeDF1SW1Uc0ROMWpBRmxX?=
 =?utf-8?B?WCtheW41djZGcXdYcDRPTlVaYjRBRlluRlhjTS9vZG93THpoOUtNUWJRclZ2?=
 =?utf-8?B?UHlKdFEvcHdDZjNxWVBjK3hrM29uZFJqZks0YnhCWWtrSXEyZU5MR2FaVUZK?=
 =?utf-8?B?bThOR3pDNGNuMXJGeHZXMHA3Q2F0dlhhT3J5YzV5eFZOVXJhUGhRSHNkZGJl?=
 =?utf-8?B?WFh2bFZuU2ZJSTZLZm90SXQ3NnhNQjNEUVh0OFl6RjM0T2ljNkVZT2ljVmtt?=
 =?utf-8?B?VytMc0c1M1lMNDhhN2FSVnIyZG5xR1N2UkJCa2FZMUJnNTNZUEI0eGpINXV6?=
 =?utf-8?B?MkFQMnVjSy9XQitnN2dLeExIRStRUWZjQXUwK25SRTM3R1RORXk0bmhVL2xm?=
 =?utf-8?B?bnFLQ3VITTRra0NaSzlLbGROR3BGZ2ZWNWczejZUQkMrMFNWZjhmZHg2MzBh?=
 =?utf-8?B?N0hRSlZSdVFoR1J3ZUlVN0tOZEdhcGYrRXJ3bWo5NE0zRm10UHBCYUJPb2Q3?=
 =?utf-8?B?dmN1V0Fva3BPa3RxWmowNkNIdE5JK2tvYjA3U2RkWHBjbVUvcWR3OGpESFdh?=
 =?utf-8?B?eEwySHJhZlRQVTJuVGdQNEt4SkwwM0VvYmlRMlphanBVQVVyZkFsVXhGNjh6?=
 =?utf-8?B?RmM3Q3dwMFcvSnlSMzFHV2QvMUVlbHBxT0FzbXlPN2dwYjJ6ZjYxOHhiZjJv?=
 =?utf-8?B?MHB4UW5vak9VQkJRYTdnQVJNMm5ldjZKSjN3cVF1UVE4aGtnbTZJL3dQczRk?=
 =?utf-8?B?Ym9tS0JLV0NWZDBsNVpyTlFJbW1nPT0=?=
Content-ID: <F7415D2FF4CACA4EB9B2C449D3893EFC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f200881-17b0-4f4a-f911-08d9bb3895f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 17:23:15.7523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3HWBVGlWnFzuFJtV3rnVke3uxRmcSSFOdK0J8tR7jgnhraMLOzBPpdzTjEDb+RZJGUS1DaXOPsXC5sALE01gk3ODNwJwstZBnIp9bV23IyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4638
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_092328_329276_B14E822D 
X-CRM114-Status: GOOD (  12.36  )
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

On 12/9/21 7:21 PM, Tudor Ambarus wrote:
> mx66lm1g45g supports just 1-1-1, 8-8-8 and 8d-8d-8d modes. There are
> versions of mx66lm1g45g which do not support SFDP, thus use
> SPI_NOR_SKIP_SFDP. The RDID command issued through the octal peripheral
> interface outputs data always in STR mode for whatever reason. Since
> 8d-8d-8s is not common, avoid reading the ID when enabling the octal dtr
> mode. Instead, read back the CR2 to check if the switch was successful.
> Tested in 1-1-1 and 8d-8d-8d modes using sama7g5 QSPI IP.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>

# cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
c2853b
# cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
macronix
# cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/partname
mx66lm1g45g
# cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp
cat: can't open '/sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp': No such file or directory

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
