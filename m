Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13828C77B76
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Apr 2023 03:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4iZ2vQS8wDUAMDw7uSF/JWi4S4CdfDn66/sTfzv6DY=; b=krZjbtCWa34qkqFusYWi0F78cT
	iKA1RKZg6cVGvnmTQkH60ISFwSiMPMc7HxvH6QEtrUY3fV+BbU5QhyvlGtoMsZIOsE8v4JQ4f3B8p
	/7A/E1PQbZMZpuZqBqnXCm3DW+LsfHtjRzv73GSvpx3hwZHYGPxPtqK+bmQibGvP5pB9f8LBye39h
	7NBtbYLNDHIiMG3RaayziheOwFaz+gRpyDNPfZREnaG+9J+GQI+Ph3VFQYILYi163EeUgT3zI5mr+
	9xMrWRRNdKEZJwwo+WXNIC4hrmtDl4M7BcloEOHFb+Pkf3g55c8YaQ3iMOIYucRBm/+igiIWZ2Ytl
	wsYOJXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poy7V-003pb7-0m;
	Wed, 19 Apr 2023 03:04:33 +0000
Received: from mail-psaapc01on2071d.outbound.protection.outlook.com ([2a01:111:f400:feae::71d] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poy7Q-003pZv-29;
	Wed, 19 Apr 2023 03:04:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rd4C5sbo9yMquwyVubnE5qoRcwEVV0uppJnAIpdTgh527RR0HPkhcHU31Nq1b7bnyixg73kPUN9bgkk8NSagckYvS4vlm7BEls7K4snISSM61I3veEJao7e3ieI3lW2tffEfNAtElUpHdEUGH2gTrWJ8cvMs90O+mL0OgFhQiJgqFL2LrURjxYV4vmv4oVU9zbRzLXZbG/9OH1ujAnr7k7zQfLfMp3DB8d89hLJpqEUv7MrlSUORHvXBzJBHi7msTF6MGiSCfRYZ0sIXPtHYrSG2gMXczZ1DeuDR/+TbDeasr4m7sa6jXmA7eGDm8AkfnXT+IJEShOiHL0HSMSiWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0vTH6rb0EB9zrHR4zVFG2bV5NIrfXaLnRVg6+PvjkI=;
 b=lsHGaCOXoXgH08IQ6uG2IvvpgQW08Hkv78md2QXA4K+t56yA6NYToXc6EKoq49mvt/BM7g/T2qMjHPc3Qv/SflOCxbnrGWpTNDm9mRqglATejV8waX/FZ1QBKNfcsVE/fa7RI79yQnw2hMd97TOTowjNgX4IP3oh0c0TlWEn3zGjwiXq/cA/Qm68BegUDTCClQNfLilLd6vDsxQj0aozyKYjaPghgS3UxOAQty4oI3wBzhlHwu3U6v1TiHEbYrK0c7sEbBRoD5IpAzSpBsELskayYJK1b5rXHhxPmb09/OGwOQ/wC4+9Je/qvwskgwzodl0TrgG3LgxOp07C/IAJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PS1PR03MB5034.apcprd03.prod.outlook.com (2603:1096:300:7b::17)
 by PUZPR03MB6019.apcprd03.prod.outlook.com (2603:1096:301:b6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 03:04:17 +0000
Received: from PS1PR03MB5034.apcprd03.prod.outlook.com
 ([fe80::c56f:c862:ff8e:909]) by PS1PR03MB5034.apcprd03.prod.outlook.com
 ([fe80::c56f:c862:ff8e:909%6]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 03:04:17 +0000
Message-ID: <ee10bdeb-416c-70f0-d323-7107fe0746e8@amlogic.com>
Date: Wed, 19 Apr 2023 11:05:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, "yonghui.yu" <yonghui.yu@amlogic.com>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
 <20230412113654.183350d0@xps-13>
 <4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
 <20230412141824.755b2bca@xps-13>
 <eedaaed9-0a41-2c18-9eb2-792613566986@sberdevices.ru>
 <20230412145715.58c2be4a@xps-13>
 <7c996832-258f-001c-56bd-87bbdf23eeaa@amlogic.com>
 <20230412163214.0c764bb3@xps-13>
 <0c61eaae-053e-5768-a533-70b2ff0cc95d@amlogic.com>
 <fbb8cb2b-0996-3029-b368-f67087d73487@amlogic.com>
 <7520e512-8a19-ff04-364c-b5be0a579ef0@sberdevices.ru>
 <20230413102200.309fbe9c@xps-13>
 <b3279de4-e89d-db03-a515-a6aa52ab90d3@sberdevices.ru>
 <20230413122252.0a8efcd8@xps-13>
 <569a948e-654a-b21f-8a4f-55dc4b295387@sberdevices.ru>
 <60fa656e-bda1-1de6-a79e-3e3041cd69a8@sberdevices.ru>
 <780c0cae-18b6-2652-1c2c-6d398ea60451@amlogic.com>
 <e7c49f2d-b3c1-8d9b-76fe-c8759b37c7c7@sberdevices.ru>
 <20230418152505.72fc16da@xps-13>
 <15a6e415-1489-a81f-fc8f-2372678ad2cb@sberdevices.ru>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <15a6e415-1489-a81f-fc8f-2372678ad2cb@sberdevices.ru>
X-ClientProxiedBy: TYCP301CA0011.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::14) To PS1PR03MB5034.apcprd03.prod.outlook.com
 (2603:1096:300:7b::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PR03MB5034:EE_|PUZPR03MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 880b3c79-6fab-401f-0521-08db4082c2cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	IjQ8H9pDV318RyK6UiQYXS90mz4dNAa3ohiWmGgBfy5+XbCUMce8gXMzIyh2zgIvBneaLazIaxjcK6bxlmkADCU6rHmgcDhaKwxh3Izv3x1Xk2K9m3cNRJM4aN+83saXYDH3BHb5siUQvdvdyBbmlw0JwXdgFt7oaEhfmBHVOS4/m6XCyCGtvuz3JexMZ2Nv6I0zllffQOrv5nPt0Oqq8IaI1iuzqSoT2oNsd1OytcxnKTqcxySn5v8PZ7kdrOoLEoB0eAphhDDooMjGOUHt2O+T873c++Bd3gkKq54poGSF50HHsirarug91UN+IDkQNdQ/aAMCP+251th6wMuTCbGf3v/bRHpuonywyDZEPPP1ztAhb4UbeE4Ve2uiaC5bw1/2w+/MmOQR1ygP9GMFQfAho+4r8/jTvKjnzcIpWQ+YY0785NT2fAcvnDXAWfYMTDPwobhfYaF/deJNFGJ9eV0bsyN+QiZzjUg0AorXrut+SBYdzWrk+CvWRKRcArjp65RKzTXe0axzKQtu6E4mG8+MvB2tVPf/xNslJ9khacztvpeS2woRIfNETi9FrzLrxl6Q5wTVlAS+OiF99j7HNUGTacRImIFvd9Z8+Vm6EovS6lR/DAbH7xxw+AzBOnm0pGN0ITDsqGwQ6Mml+8y7D1xSeypjktPtzRKc7VXU97a5a8yKdFNYe/GrX6YBxqlEQqKfMcNL58CAyXAtPrHSg9nDZtWNd0JZA45BiDuSWx4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PR03MB5034.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(346002)(39850400004)(366004)(451199021)(36756003)(4326008)(54906003)(110136005)(316002)(66946007)(66556008)(66476007)(53546011)(52116002)(6486002)(41300700001)(478600001)(6666004)(5660300002)(8936002)(8676002)(2906002)(7416002)(44832011)(86362001)(31696002)(38100700002)(2616005)(38350700002)(107886003)(6506007)(26005)(66574015)(83380400001)(186003)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bUlWOUViVnZxRDFZSytnT3loZEZESWRtMUlOUms2SnJBOUpGZ09OQ0h6SmJo?=
 =?utf-8?B?YmswL09FZkhxaWJzK1RKSHhiY3VzOGpVaU1BMVQ2U3d5d1g1STc0RXdnZDZr?=
 =?utf-8?B?MENQR05hWnFxRGhhWHJOVUpjVkpPK3JBWlNQaFpheExKVnZrUnIvbCttT2NE?=
 =?utf-8?B?aXRDV1hFMW0veVpIM1poaU9lZUxCM2pyRy8zSlZndzRYTzBXMWRxdzVBc0Qw?=
 =?utf-8?B?LytRcHpOYkljYmxJcnVKSzZoeFBVN3FiNDh5cWFOaDhUclJ5Q2tDV1JIeWQw?=
 =?utf-8?B?UEVUYkJuR2cvR0RxUDNnZFpVeUw1M1Q5QXBjTUMyMEZ6eDRtNEtiMzNLZVNt?=
 =?utf-8?B?MEduYWxPZUFTV2VUYXVhZXFGTVRKQytVTVVnR1QwaS9UZElIbklXMUY3dEdz?=
 =?utf-8?B?MXV4dlFWVmpKQlU5cVUrdVNmRHY0TGl1TEpGdkpJWE9OQlBTajM1VUo5WHAx?=
 =?utf-8?B?d2xxVy9YaU1tRlk1eUtNSDFCcWJzcW5PUjFSUnI2K2hwa0F3OUlaR2lWaHhV?=
 =?utf-8?B?MU8xak5qZUFQODlycUdQaGtTcEFSM01MRzRrdFRESkNGSlhiR1RZNUx0aTVL?=
 =?utf-8?B?TEtDZURzWUkyVlBETmNncWtHSWhYVUhZNU1zWVkrUE9BNVRNZlJkR0xUUDg5?=
 =?utf-8?B?Tk9kR2c1ellDYUo1MlhCTWxodmdXeHRsc2txUFRabk5hMGp4MXg0YVdra0cz?=
 =?utf-8?B?SEVJTDhSU2w4ZnRUQXJPM2grZldIQnN4b0szMGtZZXhqcG53WHZZMVE4ZElr?=
 =?utf-8?B?enQrd2dOWXBzaTh3TVpJNG5wK2hKMnM2d2szbCtNVGU0aGFSNkFZTUpVc0cy?=
 =?utf-8?B?TDA5OE92TjE3RjVGZzVEby96bXNaS1pmUGsvaFZ5cnJnOCtDMU5IY01DblFX?=
 =?utf-8?B?YXl1dFZmRDZLa1BNcUdvSFFXTi81TnQ2NWpoRFRBSDE0MnNjai9mQThzUCt0?=
 =?utf-8?B?akxBWDMvTG0zRndkaWozWCtVelRLc3ZNaFludUJHMkpIY0tSRnVmdG1ZSHhr?=
 =?utf-8?B?SFBnR1U5bEhZTHNqbnJWcHVKRE1qTzJmYytRNEVzWlFrUndFYThQTjVMUEx5?=
 =?utf-8?B?R05hK2xWaEVLQ0FXSTk4ME8rUnFzcytHZGFBR1llcUcrR2pxSlFXVHFGS3VC?=
 =?utf-8?B?aEFjQXJLdUxxZkFLVmJtazBMWDFGRmNvR2Zvb1RxNk1Fdlo5a01JZEtmOUZk?=
 =?utf-8?B?TDhQWW9ZZ0xZdEpzMDJJYTZJQmowWUhFY29Ia2kwWk9GZXFCbTlENHJONnU5?=
 =?utf-8?B?VFFybmk4VWhnN2hCbW5ZUmlQaGZldGxjSXJPMjA1RkZSTkR2OTY1MkNYV1Zm?=
 =?utf-8?B?ZUZoOUtIWk5CSDZBdlQyS1FXZXFXQ2R6alZjZERwUHV3ajlFQ2lndnIrVDV3?=
 =?utf-8?B?K2FSV0V3MCtlZ2gyZjMxb1JMYlplaHFsQTMwenlBdVJ6eE9JMkUrb21rbTJ2?=
 =?utf-8?B?N3FYZWJpcStMLzFoYUEwYXFwNXZQZVB3VFZCS0g2N2VjRnhmeTY5Z3drREY4?=
 =?utf-8?B?Nm5KaHpjWmREMHNjc1d4bXV6Y1dqWnd5Q21DR2lZZFd3R1VGOUYvZUlqOFF0?=
 =?utf-8?B?WnNmOVFZY3d1VUR1bWZZdHgyOGNBYzlSNHV5V2RuMmlkOWdtdVlCMjYwSi9J?=
 =?utf-8?B?VmxTclQwK2JuOFVhR2VjRUVtL3IrSlpUUEs3NFlSOWpxdlU2bXZOQy96MUNG?=
 =?utf-8?B?SjN6czdwWjZKcVAzQkZROGFmR1RadG0xUktPMnVmNU10NnlRUXpsamx1K2Fy?=
 =?utf-8?B?Tnh5S21PelB3aXlyMytSODROU2xManhnbVRUVzlva2VzVEtjUnNtQnYwNGFv?=
 =?utf-8?B?dHlxdUIwRGJhcGxpdzQvU1BOSmZ6Sjl0bGNaa1lCVlZZWWxGVGphc1VnQ3BS?=
 =?utf-8?B?K2hrb0lvV29ISFRlT1JDeU9XYUkvT3ljSkdCS21hdk5ZeC9WMXBLTUxkSlJk?=
 =?utf-8?B?RGh0bVFIZ0ZSSDhvbTRUcmlBeTRtVERpNGNmWXNMNHVmOFFmTUZzTFRFV2FO?=
 =?utf-8?B?a1MwYWFLd2g0UUdnNlNlWlhhRnFxWlBFenZxV0tBY2tYZTJyY3U0Y244czl2?=
 =?utf-8?B?dENiaE0yZlRETHlRYlJxbVVWZi9XNVVJNVliaWFOU0xGVDc0RTJMYTFVRWVE?=
 =?utf-8?B?UXhWZHdPL0UxRm5xd3VHTFNYYklKQTBvMlMzMlNhczNuNk9WUUxaVGtGNVlz?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880b3c79-6fab-401f-0521-08db4082c2cc
X-MS-Exchange-CrossTenant-AuthSource: PS1PR03MB5034.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 03:04:16.4083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWgRy43WRLiokw1RYrSbkC0vEAeXRs8cWBxWMVWZ8r2Va3cL6bFlsZ5XTV6E5UkN/PKOG4y7Rk3/dbxH4mwXXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_200428_848517_ED4FCC6E 
X-CRM114-Status: GOOD (  30.45  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQXJzZW5peSwKCk9uIDIwMjMvNC8xOCAyMjo1NywgQXJzZW5peSBLcmFzbm92IHdyb3RlOgo+
IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IAo+IAo+IE9uIDE4LjA0LjIwMjMgMTY6MjUsIE1pcXVl
bCBSYXluYWwgd3JvdGU6Cj4+IEhpIEFyc2VuaXksCj4+Cj4+Pj4+IEhlbGxvIGFnYWluIEBMaWFu
ZyBATWlxdWVsIQo+Pj4+Pgo+Pj4+PiBPbmUgbW9yZSBxdWVzdGlvbiBhYm91dCBPT0IgYWNjZXNz
LCBhcyBJIGNhbiBzZWUgY3VycmVudCBkcml2ZXIgdXNlcyB0aGUgZm9sbG93aW5nCj4+Pj4+IGNh
bGxiYWNrczoKPj4+Pj4KPj4+Pj4gIMKgwqDCoMKgbmFuZC0+ZWNjLndyaXRlX29vYl9yYXcgPSBu
YW5kX3dyaXRlX29vYl9zdGQ7Cj4+Pj4+ICDCoMKgwqDCoG5hbmQtPmVjYy53cml0ZV9vb2IgPSBu
YW5kX3dyaXRlX29vYl9zdGQ7Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IEZ1bmN0aW9uICduYW5kX3dyaXRl
X29vYl9zdGQoKScgd3JpdGVzIGRhdGEgdG8gdGhlIGVuZCBvZiB0aGUgcGFnZS4gQnV0IGFzIEkK
Pj4+Pj4gY2FuIHNlZSBieSBkdW1waW5nICdkYXRhX2J1ZicgZHVyaW5nIHJlYWQsIHBoeXNpY2Fs
IGxheW91dCBvZiBlYWNoIHBhZ2UgaXMgdGhlCj4+Pj4+IGZvbGxvd2luZyAoMUtCIEVDQyk6Cj4+
Pj4+Cj4+Pj4+IDB4MDAwOiBbwqDCoMKgwqDCoMKgwqDCoCAxIEtCIG9mIGRhdGHCoMKgwqDCoMKg
wqDCoCBdCj4+Pj4+IDB4NDAwOiBbIDJCIHVzZXIgZGF0YV0gWyAxNEIgRUNDIGNvZGVdCj4+Pj4+
IDB4NDEwOiBbwqDCoMKgwqDCoMKgwqDCoCAxIEtCIG9mIGRhdGHCoMKgwqDCoMKgwqDCoCBdwqDC
oMKgIChBKQo+Pj4+PiAweDgxMDogWyAyQiB1c2VyIGRhdGFdIFsgMTRCIEVDQyBjb2RlXQo+Pj4+
PiAweDgyMDogW8KgwqDCoMKgwqDCoMKgIDMyQiB1bnVzZWTCoMKgwqDCoMKgwqDCoMKgwqDCoCBd
Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IFNvLCBhZnRlciAnbmFuZF93cml0ZV9vb2Jfc3RkKCkn
IChsZXQgZGF0YSBiZSBzZXF1ZW5jZSBmcm9tIFsweDAgLi4uIDB4M2ZdKSwKPj4+Pj4gcGFnZSB3
aWxsIGxvb2sgbGlrZSB0aGlzOgo+Pj4+Pgo+Pj4+PiAweDAwMDogW8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAweEZGwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBdCj4+Pj4+IDB4NDAwOiBbwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLi4uLi4uLi7CoMKgwqDCoMKgwqDCoMKgwqAgXQo+Pj4+PiAweDdmMDog
W8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweEZGwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBdCj4+
Pj4+IDB4ODAwOiBbIDAwIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uwqAgXQo+Pj4+PiAweDgzMDog
WyAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4gM2YgXQo+Pj4+Pgo+Pj4+PiBIZXJlIHdlIGhhdmUg
dHdvIHByb2JsZW1zOgo+Pj4+PiAxKSBBdHRlbXB0IHRvIGRpc3BsYXkgcmF3IGRhdGEgYnkgJ25h
bmRkdW1wJyB1dGlsaXR5IHByb2R1Y2VzIGEgbGl0dGxlIGJpdAo+Pj4+PiAgwqDCoMKgIGludmFs
aWQgb3V0cHV0LCBhcyBkcml2ZXIgcmVsaWVzIG9uIGxheW91dCAoQSkgZnJvbSBhYm92ZS4gRS5n
LiBPT0IgZGF0YQo+Pj4+PiAgwqDCoMKgIGlzIGF0IDB4NDAwIGFuZCAweDgxMC4gSGVyZSBpcyBh
biBleGFtcGxlIChhdHRlbXB0IHRvIHdyaXRlIDB4MTEgMHgyMiAweDMzIDB4NDQpOgo+Pj4+Pgo+
Pj4+PiAweDAwMDAwN2YwOiAxMSAyMiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZsKgIHwuIi4uLi4uLi4uLi4uLi4ufAo+Pj4+PiAgwqDCoCBPT0IgRGF0YTogZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmbCoCB8Li4uLi4uLi4uLi4u
Li4uLnwKPj4+Pj4gIMKgwqAgT09CIERhdGE6IDMzIDQ0IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmwqAgfDNELi4uLi4uLi4uLi4uLi58Cj4+Pj4+ICDCoMKgIE9PQiBE
YXRhOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZsKgIHwu
Li4uLi4uLi4uLi4uLi4ufAo+Pj4+PiAgwqDCoCBPT0IgRGF0YTogZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmbCoCB8Li4uLi4uLi4uLi4uLi4uLnwKPj4+Pj4g
ICAKPj4+PiBIaSBBcnNlbml5LAo+Pj4+Cj4+Pj4gSSByZWFsaXplZCB0aGUgd3JpdGVfb29iX3Jh
dygpIGFuZCB3cml0ZV9vb2IoKSBhcmUgd3JvbmcgaW4gbWVzb25fbmFuZC5jLiBJIHN1Z2dlc3Qg
Ym90aCBvZiB0aGVtIHNob3VsZCBiZSByZXdvcmtlZCBhbmQgZm9sbG93IHRoZSBmb3JtYXQgb2Yg
bWVzb24gbmFuZCBjb250cm9sbGVyLiBpLmUuIGZpcnN0bHkgZm9ybWF0IHRoZSBkYXRhIGluIExh
eW91dCAoQSkgYW5kIHRoZW4gd3JpdGUuIHJlYWRpbmcgaXMgZmlyc3RseSByZWFkaW5nIHRoZSBk
YXRhIG9mIGxheW91dCAoQSkgYW5kIHRoZW4gY29tcG9zdCB0aGUgbGF5b3V0IChCKS4KPj4+Cj4+
PiBJSVVDIGFmdGVyIHN1Y2ggd3JpdGluZyBvbmx5IE9PQiAoZS5nLiB1c2VyIGJ5dGVzKSBhY2Nv
cmRpbmcgbGF5b3V0IChBKSwgaHcgd2lsbCBhbHNvIHdyaXRlIEVDQyBjb2Rlcywgc28KPj4+IGl0
IHdpbGwgYmUgaW1wb3NzaWJsZSB0byB3cml0ZSBkYXRhIHRvIHRoaXMgcGFnZSBsYXRlciwgYmVj
YXVzZSB3ZSBjYW5ub3QgdXBkYXRlIEVDQyBjb2RlcyBwcm9wZXJseSBmb3IgdGhlIG5ld2x5Cj4+
PiB3cml0dGVuIGRhdGEgKHdlIGNhbid0IHVwZGF0ZSBiaXRzIGZyb20gMCB0byAxKS4KPj4+Cj4+
Pj4KPj4+PiAgICAKPj4+Pj4KPj4+Pj4gMikgQXR0ZW1wdCB0byByZWFkIGRhdGEgaW4gRUNDIG1v
ZGUgd2lsbCBmYWlsLCBiZWNhdXNlIElJVUMgcGFnZSBpcyBpbiBkaXJ0eQo+Pj4+PiAgwqDCoMKg
IHN0YXRlIChJIG1lYW4gd2FzIHdyaXR0ZW4gYXQgbGVhc3Qgb25jZSkgYW5kIE5BTkQgY29udHJv
bGxlciB0cmllcyB0byB1c2UKPj4+Pj4gIMKgwqDCoCBFQ0MgY29kZXMgYXQgMHg0MDAgYW5kIDB4
ODEwLCB3aGljaCBhcmUgb2J2aW91c2x5IGJyb2tlbiBpbiB0aGlzIGNhc2UuIFRodXMKPj4+Pgo+
Pj4+IEFzIGkgc2FpZCBhYm92ZSwgd3JpdGVfb29iX3JhdygpIGFuZCB3cml0ZV9vb2IoKSBzaG91
bGQgYmUgcmV3b3JrZWQuCj4+Pj4gaSBkb24ndCBrbm93IHdoYXQgZG8geW91IG1lYW4gcGFnZSB3
YXMgd3JpdHRlbiBhdCBsZWFzdCBvbmNlLiBhbnl3YXkgdGhlIHBhZ2Ugc2hvdWxkIGJlIHdyaXR0
ZW4gb25jZSwgZXZlbiBqdXN0IHdyaXRlX29vYl9yYXcoKS4KPj4+Cj4+PiBTb3JyeSwgWW91IG1l
YW4gdGhhdCBhZnRlciBPT0Igd3JpdGUsIHdlIGNhbm5vdCB3cml0ZSB0byB0aGUgZGF0YSBhcmVh
IChlLmcuIDB4MCAuLiAweDgxMCkgdW50aWwgcGFnZSB3aWxsIGJlIGVyYXNlZD8gRm9yIGV4YW1w
bGUKPj4+IEpGRlMyIHdyaXRlcyB0byBPT0Igb3duIG1hcmtlcnMsIHRoZW4gaXQgdHJpZXMgdG8g
d3JpdGUgdG8gdGhlIGRhdGEgYXJlYSBvZiBzdWNoIHBhZ2UuCj4gCj4gQExpYW5nLCBJJ2xsIGRl
c2NyaWJlIGN1cnJlbnQgdGVzdCBjYXNlIGluIGRldGFpbHM6Cj4gMSkgSSBoYXZlIGVyYXNlZCBw
YWdlLCBJIGNhbiByZWFkIGl0IGluICBib3RoIHJhdyBhbmQgZWNjIG1vZGVzIC0gbm8gcHJvYmxl
bSAoaXQgaXMgZnVsbCBvZiAweEZGKS4KPiAyKSBJIChKRkZTMiBmb3IgZXhhbXBsZSkgd2FudCB0
byB3cml0ZSBvbmx5IE9PQiAtIGxldCBpdCBiZSBjbGVhbiBtYXJrZXJzLgo+IDMpIEkgdXNlIHJh
dyB3cml0ZSB0byB0aGUgbmVlZGVkIHBhZ2UgKHBsZWFzZSBjb3JyZWN0IG1lIGlmIGknbSB3cm9u
ZykuIEZvdXIgYnl0ZXMKPiAgICAgYXQgMHg0MDAgYW5kIDB4ODEwIGFyZSB1cGRhdGVkLiBBbGwg
b3RoZXIgYnl0ZXMgc3RpbGwgMHhmZi4KPiA0KSBOb3csIHdoZW4gaSdtIHRyeWluZyB0byByZWFk
IHRoaXMgcGFnZSBpbiBFQ0MgbW9kZSwgSSBnZXQgRUNDIGVycm9yczogSUlVQyB0aGlzCj4gICAg
IGhhcHBlbnMgYmVjYXVzZSBmcm9tIGNvbnRyb2xsZXIgcG9pbnQgb2YgdmlldyBFQ0MgY29kZXMg
YXJlIGludmFsaWQgZm9yIGN1cnJlbnQKPiAgICAgZGF0YSAoYWxsIEVDQ3MgYXJlIDB4ZmYpLiBJ
cyB0aGlzIGJlaGF2aW91ciBpcyBvaz8KClllcywgaXQgaXMgZXhhY3RseSByZXBvcnRlZCBFQ0Mg
ZXJyb3JzLgoKPiA1KSBPaywgZG9uJ3QgY2FyZSBvbiB0aGVzZSBFQ0MgZXJyb3JzLCBsZXQncyBn
byBmdXJ0aGVyLgo+IDYpIEknbSBnb2luZyB0byB3cml0ZSBzYW1lIHBhZ2UgaW4gRUNDIG1vZGUg
LSBob3cgdG8gZG8gaXQgY29ycmVjdGx5PyBUaGVyZSBpcyBhbHJlYWR5Cj4gICAgIDQgT09CIGJ5
dGVzLCBjb25zaWRlcmVkIHRvIGJlIGNvdmVyZWQgYnkgRUNDIChidXQgaW4gZmFjdCBub3cgLSBF
Q0MgYXJlYSBpcyBGRmVkKS4KCklmIHN0ZXAgNCBoYXMgZXhjdXRlZCAicHJvZ3JhbSIgY29tbWFu
ZCBhdCB0aGUgcGFnZSAKKG5hbmRfd3JpdGVfb29iX3N0ZCgpIGRvZXMpLCBpdCBjYW4ndCBiZSB3
cml0dGVuIGFnYWluIGJlZm9yZSBlcmFzaW5nIAp0aGUgcGFnZShibG9jaykuIHNvIHdlIGhhdmUg
dG8gcmVhZCB0aGUgd2hvbGUgcGFnZSBpbiB0aGUgZGRyIGFuZCBjaGFuZ2UgCnRoZSBjb250ZW50
LCBlcmFzZSBibG9jaywgd3JpdGUgaXQgYWdhaW4uCgpJIGRvbid0IHRoaW5rIEpmZnMyIGhhcyB0
aGUgc2FtZSBzdGVwcyAoMS02KSBhcyB5b3Ugc2FpZCBhYm92ZS4gYXJlIHlvdSAKc3VyZSB0aGF0
IGhhcHBlcyBvbiBKZmZzMiBvciBqdXN0IGFuIGV4YW1wbGU/Cgo+IAo+IFRoYXQncyB3aHkgSSBh
c2tlZCBZb3VyIG9waW5pb24gYWJvdXQgbW92aW5nIE9PQiBkYXRhIHRvIG5vbnByb3RlY3RlZCBi
eSBFQ0MgYXJlYSAoYW5kCj4gbGVhdmUgdXNlcidzIGJ5dGVzIHVudG91Y2hlZCkuIEluIHRoaXMg
Y2FzZSBPT0IgYWNjZXNzIGlzIGZyZWUgYW5kIG5vdCBsaW5rZWQgd2l0aCBFQ0MKPiBjb2RlcyB3
aGljaCBhbHNvIGNvdmVycyBkYXRhLgo+IAo+IFRoYW5rcywgQXJzZW5peQo+ICAgICAKPiAKPj4K
Pj4gQSBwYWdlIGlzIHdyaXR0ZW4gYWZ0ZXIgdHdvIHN0ZXBzOgo+PiAtIGxvYWRpbmcgdGhlIGRh
dGEgaW50byB0aGUgTkFORCBjaGlwIGNhY2hlICh0aGF0J3Mgd2hlbiB5b3UgdXNlIHRoZQo+PiAg
ICBidXMpCj4+IC0gcHJvZ3JhbW1pbmcgdGhlIE5BTkQgYXJyYXkgd2l0aCB0aGUgZGF0YSBsb2Fk
ZWQgaW4gY2FjaGUgKHRoYXQncyB3aGVuCj4+ICAgIHlvdSB3YWl0KQo+Pgo+PiBJbiB0aGVvcnkg
aXQgZG9lcyBub3QgbWF0dGVyIHdoZXJlIHlvdSB3cml0ZSBpbiB0aGUgY2FjaGUsIGl0J3MgcmVn
dWxhcgo+PiBEUkFNLCB5b3UgY2FuIG1ha2UgcmFuZG9tIHdyaXRlcyB0aGVyZSB3aXRoIHRoZSBh
cHByb3ByaWF0ZSBOQU5ECj4+IGNvbW1hbmRzLiBPZiBjb3Vyc2Ugd2hlbiB1c2luZyBlbWJlZGRl
ZCBoYXJkd2FyZSBFQ0MgZW5naW5lcywgdGhlCj4+IGNvbnRyb2xsZXJzIHVzdWFsbHkgZXhwZWN0
IHRvIGJlIGZlZCBpbiBhIGNlcnRhaW4gd2F5IGluIG9yZGVyIHRvCj4+IHByb2R1Y2UgdGhlIEVD
QyBieXRlcyBhbmQgcHV0IHRoZW0gYXQgdGhlIHJpZ2h0IGxvY2F0aW9uIGluIGNhY2hlLgo+Pgo+
PiBBbmQgdGhlbiwgd2hlbiB5b3UgYWN0dWFsbHkgc2VuZCB0aGUgInByb2dyYW0iIGNvbW1hbmQs
IHRoZSBOQU5EIGNlbGxzCj4+IGFjdHVhbGx5IGdldCBwcm9ncmFtbWVkIGJhc2VkIG9uIHdoYXQg
aGFzIGJlZW4gbG9hZGVkIGluIGNhY2hlLgo+IAo+IFRoYW5rcyBmb3IgdGhpcyBkZXRhaWxzISBW
ZXJ5IGludGVyZXN0aW5nIQo+IAo+IAo+Pgo+PiBUaGFua3MsCj4+IE1pcXXDqGwKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
