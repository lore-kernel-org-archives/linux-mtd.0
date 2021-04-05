Return-Path: <SRS0=p7/t=JC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE873C433ED
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Apr 2021 09:55:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC1D061387
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Apr 2021 09:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC1D061387
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YZqHf7HKwmSDJ7NQlhKG29qI8ogcWGw7t+nlpkSg8bY=; b=gjRMUPaVg64mXu1hB6LL2mX40
	ZxH+m7bwbfNFwr99ISsEKzXC1ytd+S+9y9OoVk356huO+FrQeKiCeX3Mi7CxzLKn8EkXexeOZWmox
	Q07fanvr9VH9yH/wThKUqdbsn9e3pgvovQiHfJDbK1gCn7PxWRlWF2/o2VeC0y/mXQHK1dOWNsE/q
	EQMkw21bH/FIPdWqsjibd0ZfDEWQPsduKk0ZVCBdyjQ8DqfBVKj7ljbO/4/e1mLo4JFFiXdXw/ryp
	HnSnuuWXvpDngRr3K+e9f6GhukT/ZQJgbsJx4SLRjv2SbsmibaKhF6GIjry+f3N9gi9EukuMym2T0
	BVV11lmsw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTLvk-00H4ha-NM; Mon, 05 Apr 2021 09:54:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTLvd-00H4gq-7b
 for linux-mtd@lists.infradead.org; Mon, 05 Apr 2021 09:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617616433; x=1649152433;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Y0MGt0hdnLOg2gGat9yKVYQtqOGqoephd4utqbc3Cpk=;
 b=XynFar1wguWyEs1+EZ8ZV2O26DG8jkVzywBX8+LAN+j5fdEYtQt6uD10
 FeINJQx1xxbbgG1q5ebnEfnWJOmIXv8Yw5FiK4n45vd7rANhAJE9U1ukY
 D+FuoD3WMsrFQhjRmOoOnEdX22hFywqUNsqwN0nbYOWxtGEA5SqyCOXEu
 cjcizJ8efHm5v4K+caubUwbRniufwsv55Kl1andDsdZ30+VZ55pD4c80E
 FEE59vnkcYpEXD37SYp/22wGsTyyTkwmlgIh4j5WSl4mxkqg8sKGldjmZ
 m7pvWAWkUMvlDxg+zYF1hAxxe/blWsjiSXck2YhCVFsPNyUVw9TO5UxwZ A==;
IronPort-SDR: 050Adw034t5UkF3EwNWnmAdf02Y4oGzREkLQ3zV0k2VKtpHPaSNDcXy5f+P3p/VwKdfjzXszuK
 1EmqTNz+UGZLvQbYPdbUL9X5OVUsw21bEh8+VhMjEiJHJJOCNhnKbB8cQ1L2IR2M43PfutbIfx
 0JjaYMiD2TWEBsmQELT73QMS2citBqk06twmFLtlk7VCeEu8xYXhxvcVnJqOffSl/GiQxNgAEq
 JI0bE0lydg0ffCrphBgm3csfPJ+UZoWgzHUBnFfd+UeQ+bVeAzx9QT/4Mbr7CIcjnfLrl9sQDJ
 qAQ=
X-IronPort-AV: E=Sophos;i="5.81,306,1610434800"; d="scan'208";a="49994309"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Apr 2021 02:53:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 02:53:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 5 Apr 2021 02:53:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Suv7SYZLMYQrTe8NWBVOYCNYvHij6OfVh1mtQoPh0/LdDT8RGMxiGG7oJ5oDAJXVs4bdsuafFy95ix9FGEff5ARsLewr8JXc0cGsvZ5c/GW5t9wwDRdjWmZ3y1yAmqOas2dLtXC61yFIGWUGXvFa8m24xQ7b++7bJ1Tu3m6M/20irmqAn56/iPl10lq5nOz0Aqj1amKj3eI4YOip87PSDjAyOpuvC8NNP7by3rjHTQpex1Y0twnA22H6JyADxYM9W+UTPKOmjTRDsnFmLDG7joN677JsgaM49oY8qXatkLcXJHQtladxhP4Q27miKNUJSqy3ytpJsikvTI9ExHtlPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0MGt0hdnLOg2gGat9yKVYQtqOGqoephd4utqbc3Cpk=;
 b=ZTbG5JeAUKvLCyCq3/0cryzJq5+xd0DGJn371AdUOQ6zqGvR4VLZ4USCOs/cqLvHns3T0OKFHUyHF/P5gnv/gzHmKUK4MRNm+TQMr7gn3Ozs7gGUXKcDrQQYWPOgxsHCkuwCB1Nq7akWemQhJjqnJNUeUmamZDhPYVB3qz5h15JMxksI2Bmk44mn6DExzRrAvgLRiHPmuxe18UrVSU7pIr9795KjHyR7v4glYNfN/UXbq98n9dLS6UXmX4NP1pgiCgmfyq9gaPPnYnWjeuL3U9GPltTqdNxzIkozotgApAeyqdbvt/pmQDCSQzkYDsg4yp7HA2rDUBGS5jrPAmjyJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0MGt0hdnLOg2gGat9yKVYQtqOGqoephd4utqbc3Cpk=;
 b=qzlXZvHU7kvYTSUcOCPfarPGkpIPsAWUr2Ea0kIWElXcCKto0wmdx0dCUjYy5LtlLheKj6nDytaeZUyIDs46D4COYCCQjjf/Kfen5GNfx339M4x3Gakz/8KJ1HBlH2kClRHf8dUcT43rZyFkLteJTRVyn+2rInZrO8i9J+DHWzw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2734.namprd11.prod.outlook.com (2603:10b6:805:59::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Mon, 5 Apr
 2021 09:53:47 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9%4]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 09:53:46 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <yaliang.wang@windriver.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <tkuw584924@gmail.com>
Subject: Re: [PATCH 1/3] mtd: spi-nor: core: Add manuafacturer/chip specific
 operations
Thread-Topic: [PATCH 1/3] mtd: spi-nor: core: Add manuafacturer/chip specific
 operations
Thread-Index: AQHXKgGRg3fk4n7pPEKaFBL/NT1mgQ==
Date: Mon, 5 Apr 2021 09:53:46 +0000
Message-ID: <143f49e3-a030-afd6-d440-9417aff7c694@microchip.com>
References: <20210401195012.4009166-1-yaliang.wang@windriver.com>
 <20210405085419.vgrncepyds3uagbv@ti.com>
In-Reply-To: <20210405085419.vgrncepyds3uagbv@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 057862d0-726a-4690-8b07-08d8f818b4d5
x-ms-traffictypediagnostic: SN6PR11MB2734:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2734560178CA3A0649354DADF0779@SN6PR11MB2734.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uIfipYzQ47lzb8SAlzEEZnAgTqTjU8lsNO8f/sKXZOWoB36AcB5PemddNg9vZ1ZJCfzLnXxRNjKHvmPlkp2cHTk/Jz6myKFfRkTUqTaMW8SARI79Eui84+nq0LorFxKdiDtPxdpg1/hIuiZj9LVF9ChglaIa3JmwHryWV/FenWg4VHO/dGiK28beT0vCvNqQA7blv5avPX4SJ3PIVarvgzNB7dGN8gqo/7YD9wqpuYPraPNtU1XOWgsXs2JrTTWM9OXDoBOzernzQVFdyv8ZsSjwuxQz+JOavJzdIhgFXqZQMGCasQQgVFaFiLlaunCn8XgEuu60e7rxQLbqvU/fpnZgofONqoGTseDrJN1fLiOA7CRlIlWPmxvg62YOCSZzQmnvd92/GVw/09W0zoSDyc38pbpo+HWPbqSVkI8rpViNCmqsvBIiNE9tFrBE4rtjpyOQjkOMkk12T69zkf2f1v+fHarVPGI9nH4sric5P+97a2YmVWgg663g1cnxyLzmAACHpwMvgatB4vyuSq+OsLIpjZGPGSz7J66t+9L+cp3n3GwqqrIvutL71IlRTiaQlQwhB619Ax2T/UxAi2xz7sQWIjZYi3pkkeT9d7PF0eiS5oRnHELAXxhl+GpQSfyqNJwA27R3bZHw/9pqEr6s2h0aQJ4pJ8IlDw0RPREj/+Hn6BHS0YclvYViIwgA74MGycd0i0iqeUJcpZe1OvamHeb4YIvryXin739d4G293wTU3u4AEiCniiReOUqQ+eqv1oUmJgJZJ2QPmQDgw5UTGzs3ZLz2xwGdjD91p4ELDN0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(346002)(376002)(136003)(366004)(6512007)(4326008)(6486002)(76116006)(5660300002)(26005)(64756008)(66446008)(91956017)(478600001)(31696002)(186003)(2616005)(71200400001)(110136005)(54906003)(53546011)(6506007)(2906002)(31686004)(316002)(8936002)(8676002)(66946007)(86362001)(38100700001)(66556008)(66476007)(83380400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SHFwams0Qno3TTUvUmVLSzBvZHB5bmZCN0RjY3B6UHhOREN5UnRNSHVsYy90?=
 =?utf-8?B?WnJic1ZIbzJ0ankyOEYyOVF4a0tmMEhVQllMS1hyUHptZjluRDk4Z1ZRYTVM?=
 =?utf-8?B?anVkN0ZRR2dKZFZlUjJjWE9WcHB2WGxhZ1VQL28rRUpBdVV3VGt2Sit5UFBD?=
 =?utf-8?B?ZzUraUtLU2QyVjkxUFV4TTZrb0x3U0NNaGMvQytQeXpFdkFISXZ5eFlJOHox?=
 =?utf-8?B?cXFwWVdPWkpQMzRFL1pDYi9kQmV0MFhGeWU0YmRtOVVNZm0vdGF5NTh0VzVW?=
 =?utf-8?B?N0I4L0JXcy9UeUVHajZKcC9McUJvdC92WTZZTUN0YW9qQ2EybUViSVduQzM2?=
 =?utf-8?B?bTVIekJMRXJjQ2xVUmkxQUdMRVJoTHpZMjBmK3BoU3RkVEhWM1I2a3dFYUl6?=
 =?utf-8?B?a2FEc1VoUGo0eGttcTN2ZTB0T1JGZ1Vac1lKZ1IybmplaFl1T3J3blViejVx?=
 =?utf-8?B?enQrbnBsVy85bWh1dWM3aWJtTElQWDV3WlBvaWIrK1E0UWJpVXlyQ3hycVgz?=
 =?utf-8?B?Z2Y5djBqZUxUZmJkRG1LaFhUL01GdlNka2ZGWCtlM0pLamU4a2NsczNHZkxr?=
 =?utf-8?B?UkRRbytsV3RsY3hOTnRZL1dScEl4dWpHVUFqbHpkOUIyL1FQUmcycnFjbDhx?=
 =?utf-8?B?NnRZRmp1ekNydk9IMDFnNTNVV1lFNlZ3MXloWDFmRjFzdWgrOGV2RkVTYU5K?=
 =?utf-8?B?YlZjTEVtd2FFd2t0RDlqMkdNbmNPRXFRTlZiWWNvV1ZHU0wwRzhxTW5adWxP?=
 =?utf-8?B?V1RjQ2RPTHlxdjc1Qjc5dUJhZnFNMjRjcUYxZlgyaWFCSTUrWndOYmRhdjYr?=
 =?utf-8?B?bzNvRVNFMS9NQktJb3ZpNHJxSmQ0RDVZbkNNTHdlL1lTZnZSQVFJeURqRUJm?=
 =?utf-8?B?VHh0WVJzS0tnWUZhUVlJallkb0RrVElBVXdWcFU1MHY3d2c1UVIrdVY4WElC?=
 =?utf-8?B?OTBtb0N3WTVDcldNZ1ZzNjh3a1Bnd3JIQjBPdlpuZGUzWGxaY2VZdDBHczh5?=
 =?utf-8?B?d0tDY3JodmZHZXJPYkJyUmF3UnNBbHlhSlB2SEg2ZEZEbjduVkRJVVF6M2VR?=
 =?utf-8?B?SkpSTGFMMTZLdmZYaDRFdWdoR0xBY3RwWG82OGh4N3pvOEFPQWRpekF5N2xv?=
 =?utf-8?B?dUdGS1FmeWtab2VwOUM2aXZIb0NBUk9oMndiZXBqUE1QUFJwYWU1MGE5blh1?=
 =?utf-8?B?QlVVWjhZMHpWajVieGNIU1FRdnpjcjEzVHE4aDZ1NjlaRjB5YW9KZVZSZnox?=
 =?utf-8?B?T20vZGdZckRzd3FBajdydmZoUzgrd09lTFl5QkY0Zk0rVnp2c0RPOFk0VTVO?=
 =?utf-8?B?UklHVG9LMUNWbjh1M0htd0d2di81WFgwa0VaRkptY2tFZEZSL293bzM4ek5H?=
 =?utf-8?B?MlpKdEk5WFFGV0taRHdJMlJhVzRmRUdHM2krbFgwNE1CUWlhYVIzNFZjSm9h?=
 =?utf-8?B?ZkRDNlNZMHVHeklHajFuUG5FelZxMHNXblM0cjVrNnlKYklYTDVHempYNmhh?=
 =?utf-8?B?Y1kzc1hXV01GVFZ4TGJJb3pZSHFNNGg1NktWRlhjdGxVSnFvbnA2aTVaRVVo?=
 =?utf-8?B?aWNURnY2cklVNkNMM1NrQ0Z0KzhjRVlHRXN2MEROQ1N3STNJb3JCL3c3Uklx?=
 =?utf-8?B?MmtHUWw4MHBNOWZaTUhhQWtIOG5nNzJJVDU5cnZJRWlxL0hVU0tsbWkvQy9W?=
 =?utf-8?B?R3ZjZFcrT0ZTU1JsUHBXWmdxVFhVVjZIK2cyTXp0SGtVNEl0Q0VzdHFxUVIz?=
 =?utf-8?Q?t1vk8PnQcd/NeUgJ80=3D?=
Content-ID: <D9E001A92189624F9B3247CC3F1ADD11@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057862d0-726a-4690-8b07-08d8f818b4d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2021 09:53:46.8557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: stRgwUEK2GMd2/i4tA6ucfgMjYSMQniw9moZYSc0xfr/DGkjbsDEP4ArpqVuEPtWrWh2WnQsKUYkOtlSGgo1NyaN0ZJVZguaZcDDCblFrog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2734
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_105355_394879_54382096 
X-CRM114-Status: GOOD (  29.12  )
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

On 4/5/21 11:54 AM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you 
> know the content is safe
> 
> On 02/04/21 03:50AM, yaliang.wang@windriver.com wrote:
>> From: Yaliang Wang <Yaliang.Wang@windriver.com>
>> 
>> This is quite similar to the patch made by Takahiro Kuwano[1], 
>> except replacing the bare ->ready() hook with a structure 
>> spi_nor_ops.
> 
> I don't think this belongs in the commit message. The commit message
>  should describe the change in isolation. All the "metadata" like 
> "depends on patch X", or "rework of patch Y", etc. should go below 
> the 3 dashes [2].
> 
>> 
>> The purpose of this introduction is to provide a more flexible 
>> method, so that we can expand it when needed. Also Basing on this, 
>> the manufacturer specific checking ready codes can be shifted into 
>> their own file.
>> 
>> [1]http://lists.infradead.org/pipermail/linux-mtd/2021-March/085741.html
>>
>>
>>
>> 
Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
>> ---
> 
> [2] Here.
> 
>> drivers/mtd/spi-nor/core.c | 8 +++++--- drivers/mtd/spi-nor/core.h 
>> | 9 +++++++++ 2 files changed, 14 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/core.c 
>> b/drivers/mtd/spi-nor/core.c index 0522304f52fa..6dc8bd0a6bd4 
>> 100644 --- a/drivers/mtd/spi-nor/core.c +++ 
>> b/drivers/mtd/spi-nor/core.c @@ -785,12 +785,13 @@ static int 
>> spi_nor_fsr_ready(struct spi_nor *nor) }
>> 
>> /** - * spi_nor_ready() - Query the flash to see if it is ready
>> for new commands. + * spi_nor_default_ready() - Query the flash to
>> see if it is ready for new + * commands. * @nor:     pointer to
>> 'struct spi_nor'. * * Return: 1 if ready, 0 if not ready, -errno
>> on errors. */ -static int spi_nor_ready(struct spi_nor *nor)
>> +static int spi_nor_default_ready(struct spi_nor *nor) { int sr,
>> fsr;
>> 
>> @@ -826,7 +827,7 @@ static int 
>> spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor, if 
>> (time_after_eq(jiffies, deadline)) timeout = 1;
>> 
>> -             ret = spi_nor_ready(nor); +             ret = 
>> nor->params->ops.ready(nor); if (ret < 0) return ret; if (ret) @@ 
>> -2920,6 +2921,7 @@ static void spi_nor_info_init_params(struct 
>> spi_nor *nor) params->quad_enable = spi_nor_sr2_bit1_quad_enable; 
>> params->set_4byte_addr_mode = spansion_set_4byte_addr_mode; 
>> params->setup = spi_nor_default_setup; +     params->ops.ready = 
>> spi_nor_default_ready; /* Default to 16-bit Write Status (01h) 
>> Command */ nor->flags |= SNOR_F_HAS_16BIT_SR;
>> 
>> diff --git a/drivers/mtd/spi-nor/core.h 
>> b/drivers/mtd/spi-nor/core.h index 4a3f7f150b5d..bc042a0ef94e 
>> 100644 --- a/drivers/mtd/spi-nor/core.h +++ 
>> b/drivers/mtd/spi-nor/core.h @@ -187,6 +187,14 @@ struct 
>> spi_nor_locking_ops { int (*is_locked)(struct spi_nor *nor, loff_t 
>> ofs, uint64_t len); };
>> 
>> +/** + * struct spi_nor_ops - SPI manuafacturer/chip specific 
>> operations + * @ready:   query if a chip is ready. + */ +struct 
>> spi_nor_ops { +     int (*ready)(struct spi_nor *nor);
> 
> I don't understand how this is more flexible than just having the 
> ready() hook in spi_nor_flash_parameter like Takahiro's patch did. 
> I'm not completely opposed to the idea but I'd like to understand 
> your thought process first.
> 

When I proposed the introduction of spi_nor_ops I thought about having one
place for storing different register operations or command opcodes. For example,
macronix uses for SPINOR_OP_RDCR a 0x15 value instead of 0x35. But maybe we'll
find a better place for these when parsing SCCR SFDP table. I'm ok with dropping
spi_nor_ops.

> Also...
> 
>> +}; + /** * struct spi_nor_flash_parameter - SPI NOR flash 
>> parameters and settings. * Includes legacy flash parameters and 
>> settings that can be overwritten @@ -232,6 +240,7 @@ struct 
>> spi_nor_flash_parameter { struct spi_nor_pp_command 
>> page_programs[SNOR_CMD_PP_MAX];
>> 
>> struct spi_nor_erase_map        erase_map; +     struct
>> spi_nor_ops ops;
>> 
>> int (*octal_dtr_enable)(struct spi_nor *nor, bool enable); int 
>> (*quad_enable)(struct spi_nor *nor);
> 
> ... shouldn't octal_dtr_enable(), quad_enable(), 
> set_4byte_addr_mode(), convert_addr(), and setup() hooks also be 
> moved into spi_nor_ops? Why is the ready() hook different from these 
> hooks?
> 

Right, maybe ready() resembles more the ones that you indicated. As the
spi_nor_flash_parameter is not yet big, we can keep all scattered for now.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
