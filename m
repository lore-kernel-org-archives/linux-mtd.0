Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D81FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 14:19:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F9061A50
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 14:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05F9061A50
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xogrzvFsAzJum+r9F2bc+IdF+jecTam3VUMNAi8LJUQ=; b=KXUPsrGYR0qyEi
	ZpQVfD7ugsyZwd8hbLb5c0c0zK/E3g2OGJetuw3xTdK8N8bPsiHnbECg6+WnHBOAmkZte9EN2euJ9
	4DR1bqdvozYdqwyL7hbfjbUVzjKjXamFPtziL2S8EkmtJWCPIX6SMeQL5mcsR0AwaEy+SlijsUXQT
	N+jghzma3CxgLxixx/prOEeewsmeG93lxYGJTEANOoyI4tRE53uCEkfGR5BnQzhxIFeuHTQKHjQ3E
	9x2bDN/RQgLxNME3GtJHlblzNL3eGS9y6o4agq1SWbU/eT987o1Uaif7FGeYQzHXv1D8ZPvF2GD+6
	63osQZlUJuIi8HRP96Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWJMg-000Vaw-1R; Fri, 01 Oct 2021 14:18:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWJMd-000VZZ-2N; Fri, 01 Oct 2021 14:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633097895; x=1664633895;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AqZ5ngjbSd5B7s1KS9J3u2SvWROvbd9GnQOG16OO02s=;
 b=rpW0LwUMK06v20iH3CVbRHkWVEg4ey12CJr8Zy3rAPElpDFdMHEigTNe
 6hp6pKaVWvENHoPAPmnf3+MrKD9gBAV7ts+KE6wkWwv3DDmz48M1JVwBi
 A3FSPdvS49KuMDPqh0XypQUJe1pHkk0ofTDEwlj5mLRrVkmUcNl3OXMQp
 r7rzqxzMyAhZ/9IoGnLRJ6aYS+VvuAxwD8/WYMnNVUbrPoeDQtfH8ch7Z
 i6hO58W9db/MO7nI9cPaxW+MblRKOEEzPbUQPS4eEQxXQRBhIOPrlxkZe
 VKu+kU+t0KiRcmBwBsApP5C2HktDBATy5/p7oJM6m5c+cdAVMYE69YWEO A==;
IronPort-SDR: TkTg10V4wjvZ4KoEWt5l5XeNxg1lwg8nA85ti7iFaL7xWFELsciG/8/41wrVseWw8F5bvdsOzL
 93islUsxVxNJfeXYPDg28sepWCSF33VfojroYDsJwJpg6Refmb2u069uAFhlcidj87OELOuanW
 xmYYv27kzh4WGxP/7zpVGE/7XRkxjyLMPFsWNX7sM/ca6XoXq63wI4NktQk2+G9hP+bUbagITx
 +6UIgwpyz9mlGdYfofHcP7UHQsEfP4X9kIYagEbgFQe9L79rKtCWZ34DbQ8nergURfcy+s4LpM
 ehe6dFo/2QWQmYpggEP6eiXl
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="71376983"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2021 07:18:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 1 Oct 2021 07:18:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 1 Oct 2021 07:18:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOZ9UgG4dzj29XiaiNQDPlfpiO7aw8fc/3kulL84BxEJpQ3+11nNSdrpc7O0Iwqt1tSO/N8x19MGTyld4zKU6pGQ/t56QrkLSi+sJyiYetD5ZN997Wg/qW1z10UlRIamgiaIVsyzHdRYXGKvwxv1r7CjeCVqbiGDnxV6liyGXcpFrb01tr/yFazCdwXhGAXwablNA2FXNAazQ73Zd9y3kQiIBvKncla0vaTdXMzf1+i7+RNlUN+4YxoXEvt0LOJqc7Te+l6Fu1UpJreOqKpSR97r6Y0bbiDY6RndHvvAgY8YL1yFn3l7t8WBZUQVjavBMueIe9+7VNNp6bO322Cb9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqZ5ngjbSd5B7s1KS9J3u2SvWROvbd9GnQOG16OO02s=;
 b=VP0BGJtFosftxFkMdTOiP3QNSkT5Ggq+9YZBfL1579/ICumtz7xtkkGnOrqy/BspKcGkejE8cpz6RjtVjCjTyu5a7SV7/QaD+5hX1zjjR16uBBwOp/qkHlIKh0vWme4NXjhaLz1EwNhBeaAxO9hKq6+kUz/NPA/qmWt0fJdsK3UPjOAWjz8LH8bzwFaSr70yuLouoVpO9wqnigGgwvcy+A9OKMj1OVrGQjDgFuHEujXSjDIoXQq9fyEftnw26Hvvs1VCdjnJGtFsNEvG0pWJZA5ioX4fVFCqRveVLDKpGwhGGCeJ5E0A+NRZw+AAVBcuShV88YZdtAo7YdxXZlK9NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqZ5ngjbSd5B7s1KS9J3u2SvWROvbd9GnQOG16OO02s=;
 b=Og4iibQjvF/MyDBUsC5JiyYrB/EalUSIr4/LssJ3QYPlNkmLr3RbODAwwzGELP/wbBfhqrV9PR6z2t2TGcbAxowT/z4ORd8xAQURCroJuoLOG8+AmseSl9CBwdh7tc55SqgjFoiKMnBGx/PSHPvgzxE/YGMbZxvCLAm08zF1kpw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Fri, 1 Oct
 2021 14:18:11 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 14:18:11 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v2 16/35] mtd: spi-nor: core: Mark default_init() as
 deprecated
Thread-Topic: [PATCH v2 16/35] mtd: spi-nor: core: Mark default_init() as
 deprecated
Thread-Index: AQHXts8pUIKsM359AUqqPe36ic5oTA==
Date: Fri, 1 Oct 2021 14:18:11 +0000
Message-ID: <33dad358-b6f7-292b-2f02-7b5c9f9c8b2a@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-17-tudor.ambarus@microchip.com>
 <20210816193602.ze2w6qczvtgpwwdi@ti.com>
In-Reply-To: <20210816193602.ze2w6qczvtgpwwdi@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8246a36e-9ae7-444d-b146-08d984e64cac
x-ms-traffictypediagnostic: SA2PR11MB4874:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB4874BFDC29C5046CCCD0EC2FF0AB9@SA2PR11MB4874.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sAg79vEenKnFINGFy1Iuhp0edpvtcTax4E8Yqt1ZypQZIBWNZsXc5qOAUJb9/WLDi3J3vXnvC1HVzJNKwkEEQ1z7MzupeAtyAqP/3YWvvgD2WvmqlTQkTR+ewDOXin8nYFnf1gyyIGdTrkYTh8wnLa5oAq1TyGKnzjDi1CttJKkW60KFnsLVJ73DeounLrnc7Eh5GgQyjUfuceMkXTPIX79SJd4nov6qf068ZyOzV4JusqGBqOLTaK8xN9t4Hi/ti5JKFECn5JruR3W++81h84cmhB48jtKh5Zs4sJe34CDRUG5gFSvWjwZrGbPDbENjtUCsXeGRZ30jx3rDjYt62f/QJ037w2Z5Ozd9HL+H00zQW13jkLTxGcHEXNT1wjn8ElYd/4OQcshGyU4N8gTgrz3fr2hB1se1KbnpX28F/qCSzlprhPxwobLpUMoJE5082caMvPmWAJro3gsHud7sBQpO9KxzVBfei0jeiSxy1su8tCxn/smRjr1rBNTo1/CUbmlr1O5ErrJp/LQjsa7VWasZrHEX530T67Qs1N97h7iZ8sNuBTSwAWwsACRGURBb0VFuPxfgqpUO1TchcXBiwtSjL3YitC5eb7oqZsybj8RDLH1VhZ0v6N3IiQENI1I9+xXKxdw5kmvgGKX4Rym6KaVyporQy7upO8TGgdy4RMrAA3dPjsa4GAFypGKop3tAxICBdXld86S8RUi0oSI7rMt48OTTchw4o08jX2L7aVYDyFR1hlvTWPHt1uF2K6IweC1e7auAKbBdfmJa/8r+Vg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66446008)(2906002)(122000001)(38100700002)(6916009)(64756008)(31696002)(54906003)(86362001)(83380400001)(508600001)(186003)(316002)(26005)(7416002)(38070700005)(107886003)(4326008)(76116006)(31686004)(91956017)(36756003)(6486002)(71200400001)(5660300002)(6506007)(2616005)(8676002)(53546011)(66476007)(66946007)(6512007)(8936002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVo1bWNkaDVEKzh1RG1TZFJTVXRleFlwZzg5WDdTSTBqSEZ0Z2xFRXRVR1Vj?=
 =?utf-8?B?VmZzR1pZaXVIWFNEc3ZndHhVbmdjQUFsV1FwVkc5RDJqYTlXVVRMWUlXcDkz?=
 =?utf-8?B?ZXZPamZNUDBDRitMQkxZT3h0eVg0a09jQ2F4bDN4aWl4Tk1wWTVRT05zOGw0?=
 =?utf-8?B?NnlJZ3V0ankwR3NaTzdhbmduSVMvUWxxNmZBRUtiM0NYL1JDei9CQU1JWDM0?=
 =?utf-8?B?L0ZYYldYTHk2YitCclBIa0RVNUFSd1dveGdoY3prZ2RpcWI5aGtQaEJXOXhx?=
 =?utf-8?B?ZFZmMFRRRFVvb3V3Z0Z5ZE1wQ3BNQ3ZvekgwTnN1MXBvY2FPOHI2VGZ1Tlky?=
 =?utf-8?B?aWxvNFFDMkdveHo4alNRQjZCV05LL1MxUXhSdEZxZTNqUExlWExhVW42b1FQ?=
 =?utf-8?B?N2pkL3puN3dNY0hGSDZjTzk3ZlNQMmdKYmNyK3pJTVFQTHdCM3BzVzc4STBJ?=
 =?utf-8?B?TUc0TVFaa0xpamRMM3l6b0F0YlJ6eEE1Q2o2ck9XdDhOcTRMNEhjRTY4VHJS?=
 =?utf-8?B?RW02VjAxSDBwRlp2Y011RFFZSWZadzdPWHMweDhjWDhzSTJtMWpERDhYVkFp?=
 =?utf-8?B?eExFZURRMVdFWkF6czlzYmZleHROZ0s4MU55eExueVZ4anFjZnJOa1ptQWc2?=
 =?utf-8?B?SnZDeFV0U3hNaWVmV3dPK2xIbk1oUUFrMkE5aTdLVk8rTG1LeHc1aXpyTW1h?=
 =?utf-8?B?ZXVEd2FJdGg0R3BRWVQ1cjhYYXZGcHcrcVdaalRYT3ZueTdBblBXZ3gzUkVY?=
 =?utf-8?B?RXJUOFlPZWc3T3EyYitVdnA4NVp6Q0oxdWc5MGdDcVBSbHdPZGNFYWo0dUMy?=
 =?utf-8?B?TEwrU1pPVmpqOFc1MGxZbGIwRzUwNE9DN2Jlem5SWjRqZ01saXFHbmNpK2hr?=
 =?utf-8?B?b2hJQzB0czlzaThVYzBzM0RjcGowK2k5MjNBdFlCVHhONy96ZmRLc0hYNFhK?=
 =?utf-8?B?TkRBaW9SOGVtQmJYMy9RTzRjNERFV09yelZPREkwMi9Wa0kvL1pQK29iQkRL?=
 =?utf-8?B?RE5kYUMxTnFkVHcvUG9HUnN3Sks3bjlkTEMxdGFwaXRmM0tIdytjS0p6OGw0?=
 =?utf-8?B?YVhYMHBQRzEvTVFob1VDSzRyaGRLdFdtcUIwVTdCNHBmUnpIbzQ4L1NUZGRR?=
 =?utf-8?B?ZHV1bXBvejlCd0NtSlRWbkc2U1ZmUVF4dk1aYkp3Wkdid050SENpNE42bEQ4?=
 =?utf-8?B?OVVsMnFXL2tlTU5QVW5OdWc5cHlFMjF1ZEhUemNZdHpna3pzVitiUWY2c1dj?=
 =?utf-8?B?ZGVXSzJUNVk4bndHZkkyWm1PTUw4czNTcVp5RmpkdmtFMStha01YdEUzaStX?=
 =?utf-8?B?dnZCR0Nxd1pZLzk0aW4zU3FiVEVuU0ltVytBWTFOejliUFQxRFVuNmZlMXVp?=
 =?utf-8?B?R1NKMGJwenpqenFGVzI2NTNqZkJvUVBaeGh0VERKWkVtZS9CU0F1VXlHU051?=
 =?utf-8?B?NGRCYldvNm5yU05ESVAzZ0wxZThWN3k3U2VPV0tBcTJnZzJPWEM4L29ETnBa?=
 =?utf-8?B?MFM3WnhlOFllbzEwdHVJWmJLZE9KR2RJL3JuVUYyS004ZGZ2Wk9iWHRFLzhI?=
 =?utf-8?B?VjZGMHJzMENGMG5FTjBoMDh2UERLREpLOTFYU1N4YjBuWGlNSlFZclNzSHh2?=
 =?utf-8?B?UEljRE9jN1BqVlNRU1JUR0tzU09ic0NpMm95S2hqNHlZSHNlVG5GdUFqWitR?=
 =?utf-8?B?eDZZciswUHZHdmVXQjFiNjVBQzRKakttdEs1Y1hrMmZKRnBHTXlUQ0NaVUJ2?=
 =?utf-8?Q?8AfgQndaPYercY/RvNdWh5T6mHRF9l06ATmRA2i?=
Content-ID: <BD8E75C0F14B884E85F749860BD32ECA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8246a36e-9ae7-444d-b146-08d984e64cac
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 14:18:11.2589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RQkL6tCnUPm3zCDVDXEsn7AAZLRA26GWoNxtDF5WzK/e/N88nyG0vXzLTFsfQVVNcYqm8Cz4O6sx1v48khp4F/Cxulny/wBSJkeBKHfqQ7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4874
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_071815_326098_4D403031 
X-CRM114-Status: GOOD (  25.80  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 8/16/21 10:36 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/07/21 07:52AM, Tudor Ambarus wrote:
>> The goal is to remove the spagetti init of params. The flash should
>> be initialized by the SFDP data, and when SFDP tables are not defined,
>> by the flash_info flags. SFDP data can be corrected by the
>> post_{bfpt, sfdp} when wrong, and in case of flash_info flags init,
>> we'll use the late_init() hook, where checking for the
>> SPI_NOR_SKIP_SFDP flag.
> 
> Why depreciate it? It is not like we have external callers that we need
> to notify. We know and control all the users of this function. Just move
> all users to late_init() and delete this. You have already done a large
> part of that work in the previous patches. Why not convert all other
> callers as well? Is there some complicated piece of code that stops you
> from touching it for now?

Nothing complicated, but I don't have flashes to test. Let's take them one by one:

drivers/mtd/spi-nor/gigadevice.c:static void gd25q256_default_init(struct spi_nor *nor)
sets nor->params->quad_enable method. Quad enable is SFDP discoverable, if I replace
the default_init() with late_init() I'll risk to overwrite the method discovered by SFDP.

drivers/mtd/spi-nor/issi.c:     .default_init = issi_default_init,
same for ISSI. Here it is a manufacturer default init, which is worse. All flashes
have to be checked. This is another reason why I strongly prefer late_init() calls
to set flags per flash and not at manufacturer level.

drivers/mtd/spi-nor/micron-st.c:static void mt35xu512aba_default_init(struct spi_nor *nor)
you have this flash. If the octal_dtr_enable method is not SFDP discoverable, I can
move if to late_init(). I'm waiting for your call. I'll need a tested-by after I'll
make the patch.

drivers/mtd/spi-nor/micron-st.c:        .default_init = micron_st_default_init,
This one is hard to get rid of. I won't be surprised if these fields are overwritten
when parsing SFDP. Moving them in late_init() will nullify SFDP parsing.

drivers/mtd/spi-nor/spansion.c:static void s28hs512t_default_init(struct spi_nor *nor)
you have this flash. I'll move it to late init if octal_dtr_enable method is not SFDP
discoverable. I'll need a tested-by.

drivers/mtd/spi-nor/winbond.c:static void winbond_default_init(struct spi_nor *nor)
4byte addr mode is SFDP discoverable, if I move it in late_init() I'll overwrite what
I get from SFDP.

So just mark the hook as deprecated should be enough for now (at least for this release).
We'll probably never have all these flashes at hand, so maybe we'll agree for a time limit
after which we'll switch to late_init() or post_bfpt/sfpd() solely based on datasheet info.
If the datasheets will be wrong, we'll have bugs and people will scream, but nothing that
we can't handle/fix.

Cheers,
ta

> 
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.h | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index 13d5c5edfd27..625f4eed75f1 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -289,9 +289,8 @@ struct spi_nor_flash_parameter {
>>
>>  /**
>>   * struct spi_nor_fixups - SPI NOR fixup hooks
>> - * @default_init: called after default flash parameters init. Used to tweak
>> - *                flash parameters when information provided by the flash_info
>> - *                table is incomplete or wrong.
>> + * @default_init: Deprecated. Use the post_{bfpt, sfdp}, or the late_init()
>> + *                hooks instead.
>>   * @post_bfpt: called after the BFPT table has been parsed
>>   * @post_sfdp: called after SFDP has been parsed (is also called for SPI NORs
>>   *             that do not support RDSFDP). Typically used to tweak various
>> --
>> 2.25.1
>>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
