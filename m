Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822D5C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 13:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=llBvTHBUdx+Wx1s+z+rmJSO+IlOyHTYuT+YozfzurUg=; b=q7yJO1a2rOVd48
	fs2p1VjFAcaNSpArxCVqq4hZRu0YV+bZSRWxFq0nw7TeTPFaDxPBlvFUOKHLgRUFF6KYP9bI8X8B7
	vZBmf7pH0KnXAXqkMogjZaXOrDAGAAoaytKQ53vFmn2lG7M8Sy6RJMYWI1/CA5zn8aYLQ1FDaBlVK
	2zrYvZfzv7IGCikra9ebbe6QK3hsrSoYtYRCCd1ebhgb2X7RaTPRzpox031NvaxfOMAJvjUxlvH1V
	8ZvdkDteYKIJVnmOkyZs4RbDFDAxzzaPWaof/m3gsqP9vcdYS4OvQGmlsCv7NRmDXNo1yJ1fUuj0E
	95fQ8h244aEfZ/ozzd6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhWdI-00DVvZ-4l; Thu, 21 Apr 2022 13:14:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhWdE-00DVuI-8H
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 13:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650546840; x=1682082840;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6lFhy6O0RdWODg81D2/CYHvNfmNhhmMqXYyeblq8Qv0=;
 b=RZGzon/OREoXBuXfw5/u2JU5+FAhMZUF4RKkGF/hHNVWC+8zfFCztJ6b
 JeDF9ZBrfEZPk8m856+6W3kcIk8lYGFhGWTTtkOPA+xAAK/AJdjosX4o4
 oaC75SKHGbK/ezlMekmsKQQPwNReIR1K7OA+1UkckHNuX+bgo089/LVL5
 /a8/GfHyMPeUuJAXduZqNShL6dCsu9Qkq1AKTZPFiRcwVRr5836oEif8z
 lF7p0Gau5bGOkTKVSmw8qaoXFjli9jTIDiP15c/pGFJh6g6314ooZ+ra+
 VgEyMWt+Pn06EDvmXWNXhXDMQAySEdm2neScI5L2a/RuYy/ry05kzrXOe A==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="161257910"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 06:13:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 06:13:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 21 Apr 2022 06:13:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBgqvP84fytbM9TEUBInw6wvV7Rx4H7YVZ6L5ZptsU9FAqK+weHtjB0mOO976qaWk9DjFoWe9AFVkpfxvkixO9gjjflJRwP9MLl/now/oBt8Ol+NE0Kx7w12Zv6zXf5HikOx2R70YUnZuVzIBKANDwV9Kr5bd8oAW7MTt4tOCkAXOBo/XYwcjuiZjCRYyMvlXLX4CeVauXUcRw+ezpyP28cYc4mt3GN3sBhyuY5vX6JjnMW5qfq0mnbrc6SJnRzZLlsaB+2e0YW2FRyjZaVDCeXbZx2JbO997MfECqHmddJQJ4jBai/0vMU4HQyn3bsYnMRVqQTQXimotlPZyhHSwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lFhy6O0RdWODg81D2/CYHvNfmNhhmMqXYyeblq8Qv0=;
 b=liivV9Z1vkxeE0r4QiHqbrO4/3qcPF5/9sEVueu3V15VJj6v0HpUveojVz4vvi6tR9LVDJE02/dVcgbHYccJcGRieSIWeF6fXK22JKcHRCjqJl0DsNRT7sBN0pThbyW0kR4qJIM89jrQvtcH7pOUVREWr6/DoDjevqvzkImZAfLPJxapPe9q56lvvBOScZLwYSsQbh8mUfMUksCx/tRVZ41+DxwkodYkXp3TAg5JBd3fGRCzLXcn8GYX76fFfHd4mrMOykfPBuBQ6eZYBK1ps7m1CDTE3je8oXKyDSss3u9OWtv0CfiAhMRcnlepJtOlWzKATKkxUsQs/GinA1FMIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lFhy6O0RdWODg81D2/CYHvNfmNhhmMqXYyeblq8Qv0=;
 b=p7+sZbyEeldOrB4VINdkpeOktFg52rMactjM5VUhyphbj4eTsNKKvJ7P81uDWxytR/MpukKf1eETmAaU7CswQzyQ+aNtSfYLR9/5iWxfkc5PHCi1SkUDO8z8izQlfT4XtMXdVQedz+YCwChfJe3r3CafjqNPICP53a2mghfLrzc=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2896.namprd11.prod.outlook.com (2603:10b6:805:d9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 13:13:54 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:13:54 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
CC: <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <p.yadav@ti.com>, <richard@nod.at>, <tkuw584924@gmail.com>, <vigneshr@ti.com>
Subject: Re: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Topic: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Index: AQHYVWvv68wo3t3IT0asmq5tmkva9A==
Date: Thu, 21 Apr 2022 13:13:53 +0000
Message-ID: <af0fd418-7097-c2d4-dbbf-8cde0c62f765@microchip.com>
References: <4420110b-356f-a738-b5e2-233200e0637f@microchip.com>
 <20220421112956.292089-1-michael@walle.cc>
 <6f72bda7-4447-7f8c-eaa5-fa2c21c7bfe1@microchip.com>
 <9495fb0f56e187ade9b428fd69d84aec@walle.cc>
In-Reply-To: <9495fb0f56e187ade9b428fd69d84aec@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9dff5ecd-8364-484e-1c3a-08da2398c8ff
x-ms-traffictypediagnostic: SN6PR11MB2896:EE_
x-microsoft-antispam-prvs: <SN6PR11MB2896CDA4AADF1F1BAE431A0AF0F49@SN6PR11MB2896.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7vnnsLtJ1p6pxI/+sqtC92HLsa8cSZH7SX7pXtk65Anwj4uh3+PqTIQptuT6Q7n5vnGXIksbjPZTqv7vFypUWHd9CbeCJbDNXmQfF57NGfWxNqNQiszBlELoCpx78MbbNSp96q0U1JEhY1g2qbDblhwFUqEhBn2JaijdTZhyhW+gaTZx/FaJ6iIPt9NH/DtSuv7HQRfaLAl8vzBUF2goICnf8gA7KdCNCx3XXiB6g7/u/JhS+g1tSm/MK5k8tYkTlb85t793VaJG4HSc2FEybou75ayAbqDWeR3WDMusqtx2SrzHZL7OW+jzcTP602GG9WhiurUupPcilrgd1bnYk1YoS0lOSLfVuLW+sl4ZuKm+RzW6C0D9DhAjJDgbxlgS7Fk3Kw7RDGBtVUJOBuGxpw+uZPP5ur3wuaX35t3yODJygLMB5LWMKdKGpy+2/ZWVdqgysGukg3PaD8Cj7rqUTN79ZzSxDxNebipTZNUlR6c/Sktm8RtjejiDNgR7LFBWdku6LHrlQ81+hTw/Ja02dGT2bnftKrGcoSB87vHXuTg8Ep1nhaoalgDv4fFfeWN9AGBwa0g9r9nPebA2VUx/06IDT7OzTEoNO4UX93rTXrKxWDiY2KgIk2N1RukQUJjPKhoAdUACR9BtWHPlw2B/PIHjBU97Zj3oeGC1DQxDq9WpoGMsYrGpWYXgk6IWWVypHu33KGgiS4kM/tm44BE6LDstjVe2y5WQiesHwyUqjyedsT61eCn2YAk8Ab2dqw692umTOJptHydhZRnpEurtlA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(5660300002)(122000001)(53546011)(38070700005)(2906002)(8936002)(54906003)(8676002)(4326008)(2616005)(6506007)(6486002)(66446008)(186003)(508600001)(66476007)(6512007)(71200400001)(26005)(91956017)(64756008)(76116006)(66946007)(66556008)(36756003)(83380400001)(6916009)(31686004)(316002)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MElxNW9QMjU0NEJMZlhxdjJDWTVlcndDbTVDaG00MjF5SWpiUXpyTlJCZ0FC?=
 =?utf-8?B?SjRKb2RybUpydDYyeDEyK21FT2VNQzM4SlZveW55WHJ1bW4xdHVGTjRnRS92?=
 =?utf-8?B?QkcvdEU5KzVIbEVmOXNudXg5L0ZBMjZPaG5ZaGxuNEhnai9TRkc4OWRuSDh0?=
 =?utf-8?B?TXp4aWFuUFluMEhSOFNsRkRMVTlOZGJYUk9HbE5venNoSCtPbjJMRkJBbmI4?=
 =?utf-8?B?ZFk5SG4zamYvdGhqeDFucTRZQkJ0KzZyd2cxbGhhUk5pemErWU5ld1F3b1o2?=
 =?utf-8?B?Wjh5anpia1VrTng4U1RIYnpIbGQvZmxuakxGK1JpUDMydGJjOHp5dG90dGNR?=
 =?utf-8?B?WGRGN3cwM0lYcmxvNFFRWkhaREplMmhhd2E1UXVMY0pZNnpJaHp6R0RqbWh5?=
 =?utf-8?B?ZkNWenFxckJZdWNBcm9sUi9YRnhrUVJmYm5PSTVmQnp3OGdxczZ2aUxVTXdy?=
 =?utf-8?B?SjNTWFl0bFZWR2hITDB0SThJSFpJdnRJMDlRck5uWjRxbEhTZDFkSGgrWWpx?=
 =?utf-8?B?YkY0TXNaY1ZNZmNZd20xRXlTM2JsaFQ2THl1V21zUmhST1FmV1poekpkdG8w?=
 =?utf-8?B?T2FmMWdSSWwzWlY2dmR3SDFQR2NaMzBjckdPMzcyUGhzeFl1OVVXSi9ycDNm?=
 =?utf-8?B?aTlqdlZYK0VlY0Y5ZEVCRjg5ZVVDeFYrcWxFWis2REZTVllqMlJZYnFtbWgr?=
 =?utf-8?B?ZzNqOXQzTXI0NTJ2YVhLV0srV00xTHFhOGtRZ1VOZHZzT3QrNitjVjBBc3V5?=
 =?utf-8?B?UEp0cDlVWGNDbjJyZ0VsVllreWJWdTF0MCtzS1cyNmV6MXZaSjUwZkRXNHlS?=
 =?utf-8?B?M1owNk1jQys4UXcwR2UvcTZyQ2R5UmdwUnNVeSt6anFmTHVPYVFTUXZNRDJi?=
 =?utf-8?B?M2FnUFVrUzFQTy81dmFOVEJWSUpiVHpKUmhRTkRuYTJ4WlIrT1JmdHk1Z2Jq?=
 =?utf-8?B?bU5CRnI5aE82MFAyOWVRMUNIY0pCbUZtcFdrczI1eFZJWGwyaTh3cFFtUXhY?=
 =?utf-8?B?M3NxeHAyVkJMN3JjaXoxbmFQSkxhUHlJUkZIaUczU0NGanQ4N0hLWUhrRlpQ?=
 =?utf-8?B?dERkd1VRUTRwM1dabzFLaE5wemVweU03azhFaW8wc29tOEQ5SVNpeDhRbVRt?=
 =?utf-8?B?bTJ0dnVuVENwZ1Y2aGNJNk1jaUpVNFJnb2IvT2J6OU5ibXhTQnBhenlkRzQw?=
 =?utf-8?B?WnBiMVVscmdoNWhPNVFIYmtCZVhvSkJQaGRVYTVZZ3JqaGNHV1BwSSsyM0U0?=
 =?utf-8?B?ajFrVWk4Z0QybVBzZTBodTAwcmU4TG16QWlaZ2tsYXJ3SnRtWVNQMWZEdHNx?=
 =?utf-8?B?UWhkK0hwSG4wZ0RIODRCaUFwZUdkQXJCUHB0d3RQU3l6Znk5b05VMW83NkVw?=
 =?utf-8?B?RzB6K2dXUWh2cGIzRmlDVi8xNUx5dzZSMHovdkt1b2J6QURPdlNOWE96Qkdw?=
 =?utf-8?B?ZHc4a3pKc09oUGFBYjUzTHQ2L0RZL3ZmaU9SMFdZRXl2enBHR3J4dTlab0hk?=
 =?utf-8?B?R1NVZm5PQXVBVFEzOHI3WDJCdHRMbGRuK1ZpQmR2UnVYcHNnWE0rV29tWUNP?=
 =?utf-8?B?Zkhzbk1vOVh5OEhMRHZveXBZY2d1NWIyMUFsTUFJMnU0MCt6NnhYcEdSY1RT?=
 =?utf-8?B?UXV2R3JyOHJPWXRzdS9WcDN6algxVktQYUJ6TFdGaGs2U013dXRVTDRYQ1hw?=
 =?utf-8?B?WUhObjREeHFxWk9Cd0dyOXV1S0MrdVBDNkUvQ0JIRkV4aVhaWjdtQ2dYYllv?=
 =?utf-8?B?cENSRS91eFM3TU83RG5pTUxUQzNhZ2VvaXc5VHpBVzludTc0ZFVsMHBVOFg1?=
 =?utf-8?B?TVBEV0phcld4UURsMVZQajJhN1RVaGU1UmczK2Z3V0RsbnE2RnhLRXFNMHkx?=
 =?utf-8?B?SXRmYzMyZ01zOWE1c2p1OHBkUHRrNXgxbjFINVRzNDRRbC9VZ3l1S2F6WDQv?=
 =?utf-8?B?NFNUWnBWSkk0NHZ0b0F4cG5jRFdXRThOWkRHRWZXbnpqdG5jQXBXbCszQXA3?=
 =?utf-8?B?U1JSWDNnVWoyZ0l5ekplMWJsSnlYeUZBbjNmajl2aTA3Z0lGUEs0U0xiaDBT?=
 =?utf-8?B?UW5MT1RHVHJDYlV0V2NOMFpiZTQ1QXFxRitLbGwwZ001RVNMbFRuUnMwbzZp?=
 =?utf-8?B?VmVtK1ZTRVdCNk1PenUvQ3FESVc3RlV3MnJRMkJoQnN5L1ZMVGFZNEZYWVl0?=
 =?utf-8?B?RmplQzMyZlpTaGtIR2gxQVUvRHBsYXNWWTZlNWt3TUxLRUN5dU05ZzNQYmZL?=
 =?utf-8?B?d0VCeEJMcE5SZ202K3hMb3NiTDBhblh5NWJjb20reHpFMmlFTlVYa250VWd3?=
 =?utf-8?B?UDJWbVRWR00zWlhlNjV1eGRML0l3dFU0cGowcTBGMlpWSE5tL2Q1Y0tLVXRQ?=
 =?utf-8?Q?jPueIH28o4O8ZgM4=3D?=
Content-ID: <E0530D7B0FEC264EBE625EE6A99EA546@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dff5ecd-8364-484e-1c3a-08da2398c8ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 13:13:54.0041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: phTA488ukO9+HzUVEAaq34KeWdTFNGr9zJyZVHvJACnMLluxO+AY86FB7r8LcBZ3g7P7LRa6LaoKMiKOM9JAgV6SvIuz5fy5ePxButW2zaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2896
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_061400_537038_9F81963C 
X-CRM114-Status: GOOD (  24.56  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNC8yMS8yMiAxNjowMSwgTWljaGFlbCBXYWxsZSB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0
aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBBbSAyMDIyLTA0LTIxIDE0OjA2LCBzY2hyaWViIFR1
ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbToNCj4+IE9uIDQvMjEvMjIgMTQ6MjksIE1pY2hhZWwg
V2FsbGUgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdw0KPj4+IHRoZSBjb250ZW50IGlzIHNhZmUN
Cj4+Pg0KPj4+PiBPbiA0LzIxLzIyIDEyOjQwLCB0a3V3NTg0OTI0QGdtYWlsLmNvbSB3cm90ZToN
Cj4+Pj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bmxlc3MgeW91DQo+Pj4+PiBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pj4+DQo+
Pj4+PiBGcm9tOiBUYWthaGlybyBLdXdhbm8gPFRha2FoaXJvLkt1d2Fub0BpbmZpbmVvbi5jb20+
DQo+Pj4+Pg0KPj4+Pj4gSW4gNEJBSVQgcGFyc2UsIGtlZXAgbm9yLT5hZGRyX3dpZHRoIGJlY2F1
c2UgaXQgbWF5IGJlIHVzZWQgYXMNCj4+Pj4+IGN1cnJlbnQgYWRkcmVzcyBtb2RlIGluIFNNUFQg
cGFyc2UgbGF0ZXIgb24uDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogVGFrYWhpcm8gS3V3
YW5vIDxUYWthaGlyby5LdXdhbm9AaW5maW5lb24uY29tPg0KPj4+Pj4gLS0tDQo+Pj4+PiDCoGRy
aXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIHwgNyArKysrKystDQo+Pj4+PiDCoGRyaXZlcnMvbXRk
L3NwaS1ub3Ivc2ZkcC5jIHwgMSAtDQo+Pj4+PiDCoDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jDQo+Pj4+PiBp
bmRleCA0MGJhNDUzMjg5NzUuLjg3NjAzYTk5OTM4ZiAxMDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZl
cnMvbXRkL3NwaS1ub3IvY29yZS5jDQo+Pj4+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2Nv
cmUuYw0KPj4+Pj4gQEAgLTIyMTAsNyArMjIxMCwxMiBAQCBzdGF0aWMgaW50IHNwaV9ub3JfZGVm
YXVsdF9zZXR1cChzdHJ1Y3QNCj4+Pj4+IHNwaV9ub3IgKm5vciwNCj4+Pj4+IMKgc3RhdGljIGlu
dCBzcGlfbm9yX3NldF9hZGRyX3dpZHRoKHN0cnVjdCBzcGlfbm9yICpub3IpDQo+Pj4+PiDCoHsN
Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGlmIChub3ItPmFkZHJfd2lkdGgpIHsNCj4+Pj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGFscmVhZHkgY29uZmlndXJlZCBmcm9tIFNGRFAg
Ki8NCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qDQo+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogQWxyZWFkeSBjb25maWd1cmVkIGZyb20gU0ZEUC4g
VXNlIGFuIGFkZHJlc3MNCj4+Pj4+IHdpZHRoIG9mIDQgaW4NCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKiBjYXNlIHRoZSBkZXZpY2UgaGFzIDRieXRlIG9wY29kZXMuDQo+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovDQo+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAobm9yLT5hZGRyX3dpZHRoID09IDMgJiYgbm9yLT5mbGFn
cyAmDQo+Pj4+PiBTTk9SX0ZfSEFTXzRCQUlUKQ0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vci0+YWRkcl93aWR0aCA9IDQ7DQo+Pj4+PiDCoMKg
wqDCoMKgwqDCoCB9IGVsc2UgaWYgKG5vci0+cmVhZF9wcm90byA9PSBTTk9SX1BST1RPXzhfOF84
X0RUUikgew0KPj4+Pg0KPj4+PiBDYW4gd2UgaGF2ZSB0aGlzIGluc3RlYWQ/DQo+Pj4+DQo+Pj4+
IGNvbW1pdCA2MWQ3M2RlYTdlNjNkYjRjN2EzZmZhYTdmMmI1MDY4ZmI3MWMyZDhiDQo+Pj4+IEF1
dGhvcjogVGFrYWhpcm8gS3V3YW5vIDxUYWthaGlyby5LdXdhbm9AaW5maW5lb24uY29tPg0KPj4+
PiBEYXRlOsKgwqAgVGh1IEFwciAyMSAxODo0MDoyMSAyMDIyICswOTAwDQo+Pj4+DQo+Pj4+IMKg
wqDCoCBtdGQ6IHNwaS1ub3I6IFJldGFpbiBub3ItPmFkZHJfd2lkdGggYXQgNEJBSVQgcGFyc2UN
Cj4+Pj4NCj4+Pj4gwqDCoMKgIEluIDRCQUlUIHBhcnNlLCBrZWVwIG5vci0+YWRkcl93aWR0aCBi
ZWNhdXNlIGl0IG1heSBiZSB1c2VkIGFzDQo+Pj4+IMKgwqDCoCBjdXJyZW50IGFkZHJlc3MgbW9k
ZSBpbiBTTVBUIHBhcnNlIGxhdGVyIG9uLg0KPj4+DQo+Pj4gTWgsIEkgZG9uJ3Qga25vdyBpdCB0
aGF0IGlzIGFueSBiZXR0ZXIsIHRoZXJlIGFyZSBwbGFjZXMgd2hlcmUNCj4+PiBhZGRyX3dpZHRo
IGlzIHNldCBpbiBwYXJzZV9iZnB0LiBXaHkgY2FuJ3Qgd2UgZml4IHRoZSByZWFsIHByb2JsZW0N
Cj4+DQo+PiB3aGljaCBJIGZpbmQgaXQgY29ycmVjdC4gVGhlIG9ubHkgdGhpbmcgdGhhdCB3b3J0
aCBhdHRlbnRpb24gaXMgYXQNCj4+IEJGUFRfRFdPUkQxX0FERFJFU1NfQllURVNfM19PUl80LCB3
aGljaCB3ZSdyZSBhbHJlYWR5IHRha2VuIGNhcmUgb2YuIFdlDQo+PiBkb24ndCBjaGFuZ2UgdGhl
IGFkZHIgbW9kZSBhdCBwYXJzZSB0aW1lIGFuZCB1c2UgU05PUl9GX0hBU180QkFJVCB0bw0KPj4g
Y2hhbmdlDQo+PiB0aGUgbnVtYmVyIG9mIGJ5dGVzIGluIHRoZSBhZm9yZW1lbnRpb25lZCBjYXNl
Lg0KPiANCj4gSXQncyBub3QgYWJvdXQgdGhlIGNvcnJlY3RuZXNzIGJ1dCB0aGF0IHdlIGhhdmUg
YSBjbGVhciBzeW5jIHBvaW50DQo+IGFuZCBjb2RlIGZsb3cuDQo+IA0KPiBXaGljaCBwYXJhbWV0
ZXJzIGNhbiB5b3UgY2hhbmdlIGluIHRoZSBwYXJzZV9zZmRwKCkgd2hpY2ggY2FuJ3QgeW91DQo+
IGNoYW5nZSwgeW91J2xsIGhhdmUgdG8gZG9jdW1lbnQgdGhhdCBhbmQgZXZlbiB0aGVuIGl0IGlz
IHJlYWxseSBoYXJkDQo+IHRvIGZvbGxvdy4gVG8gbWFrZSB0aGluZyB3b3JzZSwgaXQgdHVybnMg
b3V0LCB5b3UgY2FuIHNvbWV0aW1lcw0KPiBjaGFuZ2UgYWRkcl93aWR0aCBhbmQgc29tZXRpbWVz
IGl0IGRvZXNuJ3QgbWF0dGVyPw0KDQpubywgaXQgbWF0dGVycyBhbGwgdGhlIHRpbWUuIG5vci0+
YWRkcl93aWR0aCAod2hpY2ggSSdsbCByZW5hbWUgdG8NCm5vci0+YWRkcl9uYnl0ZXMgYnR3KSBp
cyBhIHBhcnRpY3VsYXIgY2FzZSBhbmQgd2Ugc2hvdWxkbid0DQpnZW5lcmFsaXplIGl0LCBJIHRo
aW5rLg0KDQpub3ItPmFkZHJfd2lkdGggaXMgaW5pdGlhbGl6ZWQgb25seSBpbiBzZmRwIGluOg0K
ICAgICAgICAvKiBOdW1iZXIgb2YgYWRkcmVzcyBieXRlcy4gKi8gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICANCiAgICAgICAgc3dpdGNoIChiZnB0LmR3b3Jkc1tCRlBU
X0RXT1JEKDEpXSAmIEJGUFRfRFdPUkQxX0FERFJFU1NfQllURVNfTUFTSykgeyAgDQogICAgICAg
IGNhc2UgQkZQVF9EV09SRDFfQUREUkVTU19CWVRFU18zX09OTFk6ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIA0KICAgICAgICBjYXNlIEJGUFRfRFdPUkQxX0FERFJFU1NfQllURVNf
M19PUl80OiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICAgICAgICAgICAg
ICBub3ItPmFkZHJfd2lkdGggPSAzOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgDQogICAgICAgICAgICAgICAgYnJlYWs7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICANCiAgICAgICAgY2FzZSBCRlBUX0RXT1JEMV9BRERSRVNTX0JZVEVTXzNfT05MWTogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICAgICAgICAgICAgICAgbm9yLT5hZGRyX3dp
ZHRoID0gNDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAg
ICAgICAgICAgICAgIGJyZWFrOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICANCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQogICAgICAgIGRl
ZmF1bHQ6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIA0KICAgICAgICAgICAgICAgIGJyZWFrOyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCiAgICAgICAgfQ0KDQpCRlBU
X0RXT1JEMV9BRERSRVNTX0JZVEVTXzNfT05MWSBhbmQgQkZQVF9EV09SRDFfQUREUkVTU19CWVRF
U180X09OTFkNCmFyZSBjbGVhciBhbmQgd2UgY2FuIGFsd2F5cyBzZXQgbm9yLT5hZGRyX3dpZHRo
IHdpdGggdGhlbS4NCg0KRm9yIEJGUFRfRFdPUkQxX0FERFJFU1NfQllURVNfM19PUl80IHdlIGhh
dmUgdGhlIGZvbGxvd2luZyBub3RlIGluIEJGUFQ6DQoiMDFiOiAzLSBvciA0LUJ5dGUgYWRkcmVz
c2luZyAoZS5nLiwgZGVmYXVsdHMgdG8gMy1CeXRlIG1vZGU7IGVudGVycyA0LUJ5dGUNCm1vZGUg
b24gY29tbWFuZCkiDQoNCkVudGVyaW5nIGluIDQtYnl0ZSBtb2RlIGFuZCBkZWNpZGluZyB0aGUg
bnVtYmVyIG9mIGFkZHIgbmJ5dGVzIGlzIGRvbmUgYWZ0ZXINCnRoZSBTRkRQIHBhcnNpbmcsIHdo
aWNoIHdlIGN1cnJlbnRseSBkb25lLCBzbyB3ZSdyZSBzYWZlLg0KDQo+IElmIHRoZSBwYXJzaW5n
IHdvdWxkbid0IGNoYW5nZSBhbnkgcnVudGltZSBwYXJhbWV0ZXJzIHdlIHdvdWxkbid0DQo+IGhh
dmUgdGhpcyBwcm9ibGVtIGF0IGFsbC4gbm8/DQoNCkl0IGRvZXNuJ3QgY2hhbmdlLCBfYnV0XyBp
dCBzZXRzIHRoZSBjb3JyZWN0IG51bWJlciBvZiBhZGRyZXNzIG5ieXRlcy4NCj4gDQo+IFRoZSBw
YXJzZV9zZmRwKCkgc2hvdWxkIG9ubHkgY2hhbmdlIG1lbWJlcnMgb2Ygc3RydWN0DQo+IHNwaV9u
b3JfZmxhc2hfcGFyYW1ldGVycywgdGhlIGNhbGxlciB3aWxsIHRoZW4gZGVjaWRlIGlmIHRoZXkN
Cj4gc2hvdWxkIGJlIHVzZWQgYW5kIG1vcmUgaW1wb3JhbnRseSAqd2hlbiogdGhleSBzaG91bGQg
YmUgdXNlZC4NCg0KdGhpcyB3b3VsZCBtZWFuIGludHJvZHVjaW5nIGEgbm9yLT5wYXJhbXMtPmFk
ZHJfbmJ5dGVzLCB3aGljaA0KaXMgcmVkdW5kYW50IHdpdGggU05PUl9GX0hBU180QkFJVC4NCj4g
DQo+IFRoZW4geW91IGNhbiBkbyB0aGUgc2FuZSB0aGluZyBpbiBzcGlfbm9yX3NldF9hZGRyX3dp
ZHRoKCk6DQo+IHNldHRpbmcgdGhlIGFkZHJfd2lkdGguDQo+IA0KPiBSaWdodCBub3cgaXQnczoN
Cj4gDQo+ICtzdGF0aWMgaW50IHNwaV9ub3Jfc2V0X2FkZHJfd2lkdGgoc3RydWN0IHNwaV9ub3Ig
Km5vcikNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoCBpZiAobm9yLT5mbGFncyAmIFNOT1JfRl9IQVNf
NEJBSVQpDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vci0+YWRkcl93aWR0aCA9
IDQ7DQo+ICsNCj4gK8KgwqDCoMKgwqDCoCBpZiAobm9yLT5hZGRyX3dpZHRoKSB7DQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGFscmVhZHkgY29uZmlndXJlZCBmcm9tIFNGRFAg
Ki8NCj4gLi4NCj4gDQo+IFNvbWV0aW1lcyBpdCB3aWxsIHNldCBhZGRyX3dpZHRoLCBzb21ldGlt
ZXMgaXQgd2lsbCBub3QgYmUgc2V0DQo+IGFuZCBldmVyeSBvbmNlIGluIGEgd2hpbGUgNGJ5dGUg
bW9kZSBpcyBkZXRlcm1pbmVkIGJ5IFNGRFAgYnV0DQo+IGl0IGlzIG5vdCBjb25maWd1cmVkIChT
Tk9SX0ZfSEFTXzRCQUlUKS4NCg0Kd2hpY2ggaXMgZ29vZCEgd2UgcHJlZmVyIHVzaW5nIDRiIG9w
Y29kZXMgdGhhbiBlbnRlcmluZyA0Ynl0ZSBhZGRyZXNzDQptb2RlLg0KDQo+IA0KPiAtbWljaGFl
bA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
