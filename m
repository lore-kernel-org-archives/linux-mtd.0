Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBAEC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Mar 2022 15:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFJOgjWH6xmY1VS7/0b4HAjPYinvDyf0Md3Saqtbzs0=; b=WrMmo6Ov8cEfj8
	u/fi763NyNGtqsRNTwx8imzh2bhCjY4S0SzHS6/D32KmBWyYleeXAH/YwC6IVW0+U/4SvrX1OJOQB
	a5/Yz7xWW6GK4ys7oYsExK8fR8CxX2KIVKTS5PLy+7joRz5bl6D26QlN1MTsGYKSzN6ps4q/0J1Wn
	6uQ86fnNt1bI5u1D6FvEEchEKwKy7tEqXvQ7tzHzE3eE9Ny6EiOC1o+TaW06Asgm6X9AkZJa2H3dM
	HHACJWA82sVtkoaU/AMdXOjRgouoscs2f087CCNB+1pUi+SgZjNaB4KB2sRhlRJe0LLx5WLHyK4s2
	otdP1vTw1ScTX3bihi9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPnKm-006o6i-Hw; Thu, 03 Mar 2022 15:25:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPnKj-006o5q-K0; Thu, 03 Mar 2022 15:25:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646321137; x=1677857137;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=81wi9hTJKSS32ailWwbN6LEtfnYS2+6DuXg/jZfYBZ0=;
 b=2eZ/YB6v72W1BLyjm5DcRCGoQidwrv09SrvY2arUGK+mLLIHuqCIjv9z
 p7cYnmt0kD9UPDtMgcY5U1bZKAQnggJ2LgS49zy44BOQPvmp+bUFre2ZJ
 vyEbPixQw7uH0hyMH2Kh7KunEIN/o6TK54okjdjmOarpFp1TtbH2F2VT5
 YCWjYExULMSJa5gxUv+uMrInQ247exIjVPBY+v4vKxQAikCC7cqRLGbHP
 JLo3cWHhMQ8PvYOHF31TcKcMtxPG4FIW+lbuVkb+KPsDg3J3U/n8bNpDI
 QNCCCg/xf3vXFXM9OAKkqwZyppueH1eIhcHV0Ya40QHfsDISV1rTXIZrb Q==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643698800"; d="scan'208";a="155594148"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Mar 2022 08:25:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 3 Mar 2022 08:25:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 3 Mar 2022 08:25:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDPQnj++q1Z4ba8HMMuKjw1e4EO7N0mOaL3XKOmCzhpJvhFDo5c4dWEsrK5bbTlb1vIgXIPqF1Jw6xZokBXMGb7jcnymkYeWO+WR85hxVoQDpHz8B18RJyAiZf0+pmgDCISYIRA3rgN+eyxAfZFIqyVDOyRhb1JXW49oEoSnrWBObjMl8mMQ9JVywdrf3eTZWMspwMfFj98z39UC3ed13lRPAeiv0n97Ukki8QsX7SBa2HWtjXKCdrrHI6x4U0USM/qitZ3nfcQijv8Cq6pkSdRv8GV6fWYGmtHyh2GhGHPbWSsqiV0AHH7KiamIoyM0MwVwajNA5tQFN2KFj7LHaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81wi9hTJKSS32ailWwbN6LEtfnYS2+6DuXg/jZfYBZ0=;
 b=i9MhmsiKl2NkBPIbuLpT5217QGWnID1iGlq3ia1o8gQ1dVALI9nKorkLTRlr0SAfco09UbKzu3JMapcwgZvyw5EpEYhGYP4679pJK2WMNFIE8DZIzVSX65eXn4P00xoPLi2KoQ4FDSZvqpXLNWFaLfQ6pJrxvFzkjr/5hoYbPCAGrHEcjezmsMfE/i9FwBNFQJ0IKXGdMpTRGPcLlqmPKKI0/q+dOGB5/xjyaMdW6+n/yKtrpu5XhI41R32TL1lv8ItDQwhRWxqgeRDJPwbV+RCoB1U5QXUIB8phJbVvTcuU79Y+HQeU5JG6QGjqqo3Rl+SneiAGKnR/enCJKBQ6HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81wi9hTJKSS32ailWwbN6LEtfnYS2+6DuXg/jZfYBZ0=;
 b=KL+RHQxs8gxqBhZOer16TeJNuQcB59f/UnsVqzUuCls8lXCZq9atDZ3vl/dKRy20WTYua9Poj1cI23a0tj3qyMVl6Om4AH5/FOzF78Mv1zpQX4/uGzp7XRsDX8xu1MiBt/7e8/1jkmVP/4l983Jc+enbhdsRI5wlXrwuFeCUPk0=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN8PR11MB3715.namprd11.prod.outlook.com (2603:10b6:408:85::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 15:25:33 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%6]) with mapi id 15.20.5038.015; Thu, 3 Mar 2022
 15:25:33 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v4 2/6] mtd: spi-nor: core: Handle ID collisions between
 SFDP & non-SFDP flashes
Thread-Topic: [PATCH v4 2/6] mtd: spi-nor: core: Handle ID collisions between
 SFDP & non-SFDP flashes
Thread-Index: AQHYLwzDoxYnBZmIwk+F+eeBkmeouA==
Date: Thu, 3 Mar 2022 15:25:33 +0000
Message-ID: <8c1b9274-ea45-6a79-b7a0-7674ef60ab80@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-3-tudor.ambarus@microchip.com>
 <328762851786f1158505f9159ba3e5bc@walle.cc>
 <72679fc7-42e4-d7b8-1fb9-463f225217fc@microchip.com>
 <9ef79f480651777e0da4309a039070d0@walle.cc>
In-Reply-To: <9ef79f480651777e0da4309a039070d0@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b4068ad-4014-47e7-dbfc-08d9fd2a0f6a
x-ms-traffictypediagnostic: BN8PR11MB3715:EE_
x-microsoft-antispam-prvs: <BN8PR11MB37153AFBE0995E6647C126B1F0049@BN8PR11MB3715.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M6zerPnFhv0ajX3rX+nqDropk3XxQkmf5kP4C0XMrHvTxrEIDBrsXg9BtQEKkD+hBRThT9mjwoJtE9OG8W5TAfFaIcbTNjc2ZmpX4fWlcRcsJGMIHlPCKuPIUeppeQEhTDferBe8VxOMQ0caFIx0SaYhVmxMCUTTWMB7P93eVThiaeLl20vRp3snYKA6nwWkm3+G1ba7eVQTdjA+NuAO27Z8gtLKeExALYXU6fqkLjTGAmff+JAVQiVR392B1GAi/ZR8U5wRf2gXYB5LWeX9cb1mq6jffhbCBD9CKDqu9Nx8B6tH8cyYxEYsJCvpKVQgnwItDkee5/tdUvGvrYRT5GWg9iuGHx64RqWrWT45oT6WOCSiJBfnixo4jDcNpz7b0PwFr7o3CoaURZjn9gV/V4nyDB80q0PIG8ZGptBxgzYLPwKPjbpDw8uaQZpQvlYDnMxo2LJbGhzeNsSPrOpKHYB0PX/HYrK6E+Vf1ZqF25OpJxNr0hvOQQkG7tb5oG5MLwuAtupqhHOGxEt9wV0tUp6VF2k5MtfBwkLELaTZZr28lJ8ahfzO0FNQSdE0HZ++PicEvzLZpuPyiOkI/pEKhfUrx7xEWAu7J11TqqnUy1XUP9afsUw0Cbj4H6zyjVkpRjIQm+CkDaix1wUvDlRtRyc3N7LUqzZO3B8K1IyZsOxGxMS/GQdgbi7s6jVupkx9iVAQHYzWDkLL+65vXulI/bPlBz61ECShIRltJQYa8d1CaLKNY89EbMP2wNVwmVT0J6rVXQZv7ceknpEcA7K2kg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(86362001)(36756003)(66556008)(64756008)(4326008)(8936002)(66446008)(8676002)(66476007)(66946007)(71200400001)(76116006)(6506007)(2906002)(508600001)(6486002)(5660300002)(7416002)(6916009)(91956017)(38070700005)(31696002)(316002)(38100700002)(53546011)(122000001)(83380400001)(6512007)(54906003)(2616005)(26005)(186003)(107886003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmdzS2lremZaaWpKejBEemgxSVRQSTlnVnA1dmFIN2JRcC9Sei9DYmtkWUxy?=
 =?utf-8?B?VjhBVGZsOVFVejZFRkM4Qk1QK3NKWGFDQndRWGZzNEE0MjlpSmRmVHUrM0p1?=
 =?utf-8?B?RWxZOThvUkJhQUJxbEdnTkRxY0ZTcXlweE5nNEVob1g3S3I3K1UraXpMTEVm?=
 =?utf-8?B?RnVabWQ1aEJKTWpWeUNRZjlVK0NoWS9sWVNmUkptdFZCUGV1Unp5MUtsbG5B?=
 =?utf-8?B?RTNRQkwxTTdVMXR2SDJ5aS8zczEyckJ0UTFLenZiU3dlaklxQ0o1TGtGMzJ3?=
 =?utf-8?B?ZDJvRWRuMHdxbllRaWEvZXEyUGxCaDJsdUdFVG1RSDM2bnIzT0pqWUtMUXkz?=
 =?utf-8?B?bEEwdTdtdk5YWDBYUUEvc1BJZWNCTGJ3di9WaUVKTExJc0kyRVJvaEdMTy9r?=
 =?utf-8?B?cTZyRzkwMVhYYyt4dGR5WFpuaGt4ZGlKeXFaUzc4Z3ZLU2R0dmZveG9YcG50?=
 =?utf-8?B?WURMdElaKzQ1dmgrM3dXb1VUYUhTQkxRT2FrcHlZV0JsWnQxeFJCVTBKTkNN?=
 =?utf-8?B?RW9qK3o4aUlSdmVka3FvZ0JDVnpDbnFmRllaOFVCOWQ2bEpaQ1I2eHFOb2xx?=
 =?utf-8?B?Z2JuVnNFMlNSaGNvYmU2ZFY0K08yYUN1TGExRzNjZ2U5OGxWZGFma0hJYkhC?=
 =?utf-8?B?TGI0NjFjOVpqK0p5S0QzMWI2eHljWWV4VFMyeDFYalYyY3RzcnBoNHMzY2Fy?=
 =?utf-8?B?MEp6VStWS0YvY3h2Tkc5WHRYRklvR3pZam0xSmVxbVhuQWdKUkdQcWVQc2Nx?=
 =?utf-8?B?MGlUdlIxQVladnhzV3BHcWNMMlY2eWp4RVVZNVpVS09XSU15bUtobERQYndU?=
 =?utf-8?B?VjNiY0JNTXJlM0IvaDZrY01FNHpMK1NLME5pTk1yRkt5NTlPcStKbW80NWth?=
 =?utf-8?B?RUEvUDZrUS93bkF6YXVxcEVhTjVsaDNYaExDeHU4MHkyZi85SFJRNVg4QXcv?=
 =?utf-8?B?S29ob0x4aG5KWkZaRDJERTVqbkxXdXdBaWFLTmQ3MXA4VVErSUJEcW5DMlFi?=
 =?utf-8?B?QjJGWEdWNkRBZlVQNzBTM3pIcVRKWjVnN1hGNVlRRzYzamZkRnExVFIyNDlQ?=
 =?utf-8?B?RnNXMUtYMEkzdkZZeGRRd2ZFOVRMZWdmbFNWNll2a2QwQUVxTmIrdzk1VGhk?=
 =?utf-8?B?Vm93cGI1QWdKdmV5cGhtbTVzYVJtU3Y2Rnl1MXVBdUprK1ZOUUdUM3UzNkFJ?=
 =?utf-8?B?djNCMWlMbCszWTdFVW1QbnNBN0tpR051NnQxTmJiOE9zZU14TURHR2E5RWsw?=
 =?utf-8?B?T0RZcEwwcFJucXNtaDhhaytoQitLc2tHNEEyUGVGcjZIZnFLWTNxMmV3ZWky?=
 =?utf-8?B?UEN4My9jRDhxYUw1WlIyUkl5K3pFbmZtbzdvc2prUE9Sd25KVlZOdzBoSm9h?=
 =?utf-8?B?VGVWNXRGbU5GTW1TRjAwTU10VkpKYlRwa0xmUnFmNXNCOU1pcnR6QllLZ0FB?=
 =?utf-8?B?TGZneDYzaWFLSkNaWHNkMFZRTFR1OUJudGZtSVMweG44WkxRS0d5eDdwbVAw?=
 =?utf-8?B?MFNwLytwWkhHeU5QVzJ4Wm1XTGRnNmIwcUVaWm1nU0JMT1Mzbys0a2U4c0VS?=
 =?utf-8?B?dkNUSHoxbWVjREl3WW5GRHpaV2JOVVpyT3N6Z0F4cFFVeG4vZGNyMDJwK1JN?=
 =?utf-8?B?VHUxOVJLczQvREZ2MGoxVE82aTVIVUQrYzhyclBoaEhWdFZrM2dKbGNjM1Zz?=
 =?utf-8?B?M2VubVBTaDFqTnZnTjNSV29ObWJXSUpJRFA2NVBwT1M3VGhtZVAwNFJvaEVl?=
 =?utf-8?B?VjVQSFVrdmUrTkxqMHVBbU9JQ2tzWi9GNkwxS25aY0gyNUZtcUVHekZHN3Fj?=
 =?utf-8?B?NTBoaEpGaDhYcXBEWUpyZUZoOGh3YVRZUEFSNnlGalVSWk1BRHlkbnZjNzZ6?=
 =?utf-8?B?SzBBeE8vczVHVTM3NlhPcENJako3YXVpM2tQdnFyUzloajlVMkVkTjYvdzhB?=
 =?utf-8?B?UDBLOXphclkrYld5Z1NicGtieUpCWnpwVEFmdXJxTUxkQkR5VXpFdVUrRHBS?=
 =?utf-8?B?bDc4NWZDMFFNYjJmOHFXYXVXdzVmVlg4V2g1QUk0WCtLak10TWh4SHNyTzNt?=
 =?utf-8?B?MXFobnpTNllBV0RUdDJ5YVp1SU5PUzRWZjZRUHVNVmNUMWxNVzB2U1JrWHFH?=
 =?utf-8?B?SzZYWk9neXVjbmVFM1RGUTdtK2ZabVpqb3dsaGtOeFRLZ1NQRm1HSkNVU3lI?=
 =?utf-8?B?WUl3TGdnK3ZCSzY4Snd6aGpuVitoemlYbnVYV1d4b3I4RXhEYzRodDFQZHNs?=
 =?utf-8?B?U0Y3MDRGblZIbzRkN1NtWDkvUFpBPT0=?=
Content-ID: <F97D2CF4CE5E464C8DC8F532B0EA5947@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4068ad-4014-47e7-dbfc-08d9fd2a0f6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 15:25:33.7188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1geIvhA6Pm8NzKGN7lZLAINxvModHQzsx2Vjd/a+NEt+0UCuRjNmF8kxB6sQuEWBcE9uNayGPB4bGnmJbIGWXjA1ONJkFGq47ZTByjUbN2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3715
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_072537_742356_B4821543 
X-CRM114-Status: GOOD (  23.58  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw,
 p.yadav@ti.com, mail@david-bauer.net, code@reto-schneider.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMy8zLzIyIDE2OjUxLCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDog
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRo
ZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEFtIDIwMjItMDMtMDMgMTU6NDEsIHNjaHJpZWIgVHVk
b3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tOg0KPj4gT24gMy8xLzIyIDIzOjUyLCBNaWNoYWVsIFdh
bGxlIHdyb3RlOg0KPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cNCj4+PiB0aGUgY29udGVudCBpcyBzYWZlDQo+
Pj4NCj4+PiBBbSAyMDIyLTAyLTI4IDE0OjQ1LCBzY2hyaWViIFR1ZG9yIEFtYmFydXM6DQo+Pj4+
IEEgdHlwaWNhbCBkaWZmZXJlbnRpYXRvciBiZXR3ZWVuIGZsYXNoZXMgd2hvc2UgSUQgY29sbGlk
ZSBpcyB3aGV0aGVyDQo+Pj4+IHRoZXkNCj4+Pj4gc3VwcG9ydCBTRkRQIG9yIG5vdC4gRm9yIHN1
Y2ggYSBjb2xsaXNpb24gdGhlcmUgd2lsbCBiZSBhIHNpbmdsZQ0KPj4+PiBmbGFzaF9pbmZvIGVu
dHJ5IHdoZXJlIHRoZSBkZXZlbG9wZXIgc2hvdWxkIHNwZWNpZnk6DQo+Pj4+IDEvIFBBUlNFX1NG
RFAgLSBzbyB0aGF0IHRoZSBmbGFzaCB0aGF0IHN1cHBvcnRzIFNGRFAgdG8gaW5pdGlhbGl6ZQ0K
Pj4+PiBpdHMNCj4+Pj4gwqDCoCBwYXJhbWV0ZXJzIGJ5IHBhcnNpbmcgdGhlIFNGRFAgdGFibGVz
DQo+Pj4+IDIvIGFueSBvZiB0aGUgbm9fc2ZkcF9mbGFncyBsZXNzIFNQSV9OT1JfU0tJUF9TRkRQ
LCB0byBpbml0aWFsaXplIHRoZQ0KPj4+PiDCoMKgIGZsYXNoIHBhcmFtZXRlcnMgdmlhIHRoZSBz
dGF0aWMgbm9fc2ZkcF9mbGFncyBmb3IgdGhlIGZsYXNoIHRoYXQNCj4+Pj4gwqDCoCBkb2Vzbid0
IHN1cHBvcnQgU0ZEUC4NCj4+Pj4gVXNlIHRoZSBsb2dpYyB0aGUgYWJvdmUgdG8gaGFuZGxlIElE
IGNvbGxpc2lvbnMgYmV0d2VlbiBTRkRQICYNCj4+Pj4gbm9uLVNGRFANCj4+Pj4gZmxhc2hlcy4N
Cj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0Bt
aWNyb2NoaXAuY29tPg0KPj4+PiAtLS0NCj4+Pj4gwqBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUu
YyB8IDEzICsrKysrKysrKysrLS0NCj4+Pj4gwqAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMNCj4+Pj4gaW5kZXgg
ZmJmMzI3OGJhMjlhLi5hZWYwMDE1MWMxMTYgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvbXRk
L3NwaS1ub3IvY29yZS5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jDQo+
Pj4+IEBAIC0yNjM5LDggKzI2MzksMTcgQEAgc3RhdGljIGludCBzcGlfbm9yX2luaXRfcGFyYW1z
KHN0cnVjdCBzcGlfbm9yDQo+Pj4+ICpub3IpDQo+Pj4+IMKgwqDCoMKgwqAgaWYgKG5vci0+aW5m
by0+cGFyc2Vfc2ZkcCkgew0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBz
cGlfbm9yX3BhcnNlX3NmZHAobm9yKTsNCj4+Pg0KPj4+IENhbiB3ZSByZXR1cm4gLUVOT0VOVCBo
ZXJlIGlmIHNmZHAgaXNuJ3Qgc3VwcG9ydGVkLCBzbyB3ZQ0KPj4+IGNhbiBkaWZmZXJlbnRpYXRl
IGJldHdlZW4gIm5vIHNmZHAgcHJlc2VudCIgYW5kIG90aGVyIGVycm9ycz8NCj4+DQo+PiBJJ2xs
IHRha2UgYSBsb29rLg0KPj4NCj4+Pg0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAocmV0KSB7DQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGRldl9lcnIobm9yLT5kZXYsICJCRlBUIHBhcnNpbmcgZmFpbGVkLiBQbGVhc2UNCj4+Pj4gY29u
c2lkZXIgdXNpbmcNCj4+Pj4gU1BJX05PUl9TS0lQX1NGRFAgd2hlbiBkZWNsYXJpbmcgdGhlIGZs
YXNoXG4iKTsNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIHJldDsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLyoNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IEhhbmRsZSBJRCBjb2xsaXNpb25zIGJldHdlZW4gZmxhc2hlcyB0aGF0DQo+Pj4+IHN1cHBvcnQN
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFNGRFAg
YW5kIGZsYXNoZXMgdGhhdCBkb24ndC4gSW5pdGlhbGl6ZQ0KPj4+PiBwYXJhbWV0ZXJzDQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBmb3IgdGhlIGZs
YXNoIHRoYXQgZG9lc24ndCBzdXBwb3J0IFNGRFAuDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgKG5vci0+aW5mby0+bm9fc2ZkcF9mbGFncyAmDQo+Pj4+IH5T
UElfTk9SX1NLSVBfU0ZEUCkgew0KPj4+DQo+Pj4gU2hvdWxkbid0IHRoaXMgYmUNCj4+PiBpZiAo
IShub3ItPmluZm8tPm5vX3NmZHBfZmxhZ3MgJiBTUElfTk9SX1NLSVBfU0ZEUCkpDQo+IA0KPiBB
aGggSSBtaXNyZWFkIHRoYXQgZm9yIHRoZSAic2tpcCBubyBzZnRwIGhhbmRsaW5nIi4gQnV0IGRv
ZXNuJ3QgcmVuZGVyDQo+IG15IHBvaW50IGJlbG93IGludmFsaWQuDQo+IA0KPj4gTm8sIGJlY2F1
c2UgdGhpcyB3aWxsIGJlIHRydWUgd2hlbiBub19zZmRwX2ZsYWdzIGlzIHplcm8sIGFuZCB0aGUN
Cj4+IG1ldGhvZA0KPj4gZnJvbSBiZWxvdyB3aWxsIGJlIGNhbGxlZC4gSSB3b3VsZCBsaWtlIHRv
IGNhbGwgaXQgd2hlbiBhbnkgb2YgdGhlDQo+PiBub19zZmRwX2ZsYWdzIGFyZSBkZWZpbmVkLCBs
ZXNzIHRoZSBTUElfTk9SX1NLSVBfU0ZEUCBmbGFnLg0KPiANCj4gWW91IHNob3VsZCBhZGQgYSBj
b21tZW50IHRoZW4uDQo+IA0KPj4gU28gd2hlbiBvbmUNCj4+IGRlY2xhcmVzIGEgZmxhc2ggbGlr
ZToNCj4+ICvCoMKgwqDCoMKgIHsgIm14MjVsMzIwNWQiLMKgIElORk8oMHhjMjIwMTYsIDAsIDY0
ICogMTAyNCzCoCA2NCkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogSUQgY29sbGlz
aW9uIHdpdGggbXgyNWwzMjMzZi4gKi8NCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUEFS
U0VfU0ZEUA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOT19TRkRQX0ZMQUdTKFNFQ1Rf
NEspDQo+IA0KPiBCdXQgd2hhdCBhYm91dA0KPiArwqDCoMKgwqDCoCB7ICJkaWZmZXJlbnRmbGFz
aCIswqAgSU5GTygweGMyMjAxNiwgMCwgNjQgKiAxMDI0LMKgIDY0KQ0KPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC8qIElEIGNvbGxpc2lvbiB3aXRoIG14MjVsMzIzM2YuICovDQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgUEFSU0VfU0ZEUA0KPiANCj4gVGhhdHMgYWxzbyB2YWxpZCwg
bm8/IFdoeSBpcyBoYXZpbmcgNGsgc2VjdG9ycyBzcGVjaWFsPyBGV0lXLCB0aGUNCg0Kbm8sIGJl
Y2F1c2UganVzdCB0aGUgZmlyc3QgZW50cnkgd2l0aCB0aGUgMHhjMjIwMTYgSUQgd2lsbCBiZSBo
aXQsIHRoZQ0Kc2Vjb25kIG9uZSB3aWxsIGJlIGlnbm9yZWQuIFdlIHVzZSBhIHNpbmdsZSBmbGFz
aCBlbnRyeSBmb3IgYWxsIHRoZQ0KZmxhc2hlcyB0aGF0IGNvbGxpZGUuDQoNClBBUlNFX1NGRFAg
dG9nZXRoZXIgd2l0aCBhbnkgb2YgdGhlOg0KI2RlZmluZSBTRUNUXzRLICAgICAgICAgICAgICAg
ICAgICAgICAgIEJJVCgxKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiNkZWZp
bmUgU0VDVF80S19QTUMgICAgICAgICAgICAgICAgICAgICBCSVQoMikgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgDQojZGVmaW5lIFNQSV9OT1JfRFVBTF9SRUFEICAgICAgICAgICAg
ICAgQklUKDMpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KI2RlZmluZSBTUElf
Tk9SX1FVQURfUkVBRCAgICAgICAgICAgICAgIEJJVCg0KSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICANCiNkZWZpbmUgU1BJX05PUl9PQ1RBTF9SRUFEICAgICAgICAgICAgICBCSVQo
NSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQojZGVmaW5lIFNQSV9OT1JfT0NU
QUxfRFRSX1JFQUQgICAgICAgICAgQklUKDYpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIA0KI2RlZmluZSBTUElfTk9SX09DVEFMX0RUUl9QUCAgICAgICAgICAgIEJJVCg3KSAgIA0K
DQpzdWdnZXN0cyB0aGF0IHdlJ2QgbGlrZSB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gYSBmbGFz
aCB0aGF0IHN1cHBvcnRzDQpTRkRQIGFuZCBjYW4gZGlzY292ZXIgaXRzIHBhcmFtcyB2aWEgU0ZE
UCAobm9fc2ZkcF9mbGFncyB3aWxsIGJlIGlnbm9yZWQpLA0KYW5kIGEgZmxhc2ggdGhhdCBkb2Vz
bid0IHN1cHBvcnQgU0ZEUCBhbmQgaXQncyBmb3JjZWQgdG8gaW5pdGlhbGl6ZSB0aGUNCnBhcmFt
cyB2aWEgdGhlIG5vX3NmZHBfZmxhZ3MuDQoNCj4gZnVuY3Rpb24gbm90IG9ubHkgaGFuZGxlcyBu
b19zZmRwX2ZsYWdzIGJ1dCBhbHNvIGVyYXNlIHJlbGF0ZWQNCj4gdGhpbmdzLg0KPiANCj4gU28g
aW4gc3VtbWFyeSwgdGhlIG5vc2ZkcCBoYW5kbGluZyBpcyBhbHdheXMgY2FsbGVkIHdoZW4gcGFy
c2luZw0KPiBmYWlscyAodGhhdCBpcyB3aGVuIHRoZXJlIGlzIG5vIFNGRFAsIG5vdCBkdWUgdG8g
cmVhZCBlcnJvcnMgb3INCj4gc2ltaWxhcikuIEkgZG9uJ3Qgc2VlIHdoeSB0aGF0IHNob3VsZG4n
dCBiZSB0aGUgY2FzZS4NCj4gDQo+IC1taWNoYWVsDQo+IA0KPj4gRmlyc3Qgd2Ugd2lsbCB0cnkg
dG8gcmV0cmlldmUgdGhlIGZsYXNoIHBhcmFtcyBmcm9tIFNGRFAuIElmIFNGRFANCj4+IGZhaWxz
LA0KPj4gdGhlbiB3ZSdsbCBpbml0IHRoZSBmbGFzaCBiYXNlZCBvbiB0aGUgbm9fc2ZkcF9mbGFn
cy4gSWYgU0ZEUCBzdWNjZWVkcw0KPj4gdGhlIG5vX3NmZHBfZmxhZ3MgaXMgaWdub3JlZC4NCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
