Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A43C54EE9
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Sep 2022 09:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnM8lDA3aU9fGteq9IFqq4+PSIZ8d4JKDmVHPMo9n3U=; b=MvMFytRm9gSxs5
	FIJo32WGp5AvleltjP6OL/tHmO13MW19PPQeuypLeR5/TSFcj5Gb/8sezW3d4m1dPQVr6dO8J2YPQ
	JWgE6aJmbOY5dgpEArbbEH3uX19u2xOiZWKySVYaCHgZ13w1Ggv3kN9MheoRkJe+yy9pN9Pt4dFNb
	ThAaINXvG7DzZuyYtCR4zr4UeqqBD2hkA4apxagvlw7upTbv+giP5GlgXvmgCKfHG8jSOB6zCOfma
	ujCvTYWrPMg7NWiWAYMsLW/GAB0x7oGXtK6SqZ116afK55HbazuzFvVQn1wh9M6YSQ8XQThQcoEM+
	xKbKI8BpcBIPDDMWxN6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVr83-004jNL-C5; Wed, 07 Sep 2022 09:13:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVr1I-004emh-5B; Wed, 07 Sep 2022 09:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662541612; x=1694077612;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YM4C0UJi9PQPGV4RYrSE1o3h8r20Qs/aQ7g3GvrA94U=;
  b=zdp+Ai7a4IpY6Hj5yBIZ/KTvGOnJ+9kR8iedKz+W8cljsgtZS0NUOX6k
   c4LNPS3v5SJf6fTeBCo4pMCUDoRKhpl+6/vxeCAj2g/S9qAT0Nhgr8hVK
   7Lrx1bb+kf4U8RNKiPL4Ah/6MifZFmhZP5KQ7PZshB3bcskIqZ/yQu0bb
   I9da4UECX+arMNYlmaeGyO0xlXzjLMIBMFgXaaY0g9FLdoaawEt6rXFcp
   xJNqMUrj9ryNywo5eCFcwWvb+Md5W9QNmjNSf/6Yg4O4Z1lmirfxsIlaQ
   gIg3V1wmU2OSWuUKG7sbXh5mFZ0jJ/2gh6ipeQvKjkRx5ZVeI0Z9cA5lB
   w==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="172731095"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 02:06:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 02:06:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 7 Sep 2022 02:06:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=In5u17k6d5H9e/NfEWB+gzqex5zA8LuGcn5ayr27qfivF03TYrJ3wkvyC5QsKRgqP27RnwoecrWJ88I2zHMms0ySozdhyiir+OowSVDWrnp+zJ+0Rz4V7X7A2tBL7ALcD9yrJ1lt7JEj0KqlJtgBmPW4gXw0A34k2hAoj8CjNzeLyAbnD6zVAF6kzIvANbX3nWeZyyNxjC3uQF6buuww1A9Xzjis2d5mjB9A4+dwbXq7cPlPEjENFOvZhh4td2uJR2gSN8STeUuD6h6gMjoUkFX7xt96HAm3x76aCDmQs0gcu2Xieef0hofkwVRoB5p1XyW/QA6duWfWL5rNts121Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YM4C0UJi9PQPGV4RYrSE1o3h8r20Qs/aQ7g3GvrA94U=;
 b=CxiAf6QwZ/wpo8JJeApCz6QYd/M9Vsgm0gOw7M1yxhDr8WH3c7l87Q7pWGyIgVCcRPAsA4LRRvgh0HhTpM8Qmrptnz2dlAn4ueFoannULHdux1uBzFBCzA8zwOepCciVwVnfN91bz/4JTnKe96fQCzZj+716TdYq42GdvM8F3WURYSXvRxrPGC/tWWCyYBUz8t2e9nWs4gMNIh3mbbV5H0EZ1pmI8mjZMPUL4qGnfKns3fQVBFo+dQdDDBPwJgvcFHrDm2yhvG195hVTlsXbJeY/9AfFN8hZk9LK0ykdNT3ViQdKQbyDfoGPsV9XVuRF3XMdOjJdGrg/LM/pjt5/UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YM4C0UJi9PQPGV4RYrSE1o3h8r20Qs/aQ7g3GvrA94U=;
 b=tWh1xUY2oSXoR+eqbMG1V0JlA7xAvt75QoAAfJ7wrfe8b75HgYBXhL80SmCqOEFgytn3pzK2Rd273zPl0yLkZ6yxOugq4Z+9EogFzuXOKPeNu7H1EilOnjpiAnQxYjBSXoKCreLUq0HBD34rvowMq2sEWdyNZCnr5U0B0Ck+NAQ=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 DM6PR11MB2874.namprd11.prod.outlook.com (2603:10b6:5:c9::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.15; Wed, 7 Sep 2022 09:06:40 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::ca1:6392:bc2:8338]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::ca1:6392:bc2:8338%5]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 09:06:39 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<peda@axentia.se>
CC: <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<Claudiu.Beznea@microchip.com>, <bbrezillon@kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: atmel: Unmap streaming DMA mappings
Thread-Topic: [PATCH] mtd: rawnand: atmel: Unmap streaming DMA mappings
Thread-Index: AQHYwpkoL5Ep9vCWYUG2OKyYBcNYJg==
Date: Wed, 7 Sep 2022 09:06:39 +0000
Message-ID: <86158844-b314-bee8-c5b8-0b757c6b6ab0@microchip.com>
References: <20220728074014.145406-1-tudor.ambarus@microchip.com>
In-Reply-To: <20220728074014.145406-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46707ffc-3e71-44ff-3818-08da90b0463e
x-ms-traffictypediagnostic: DM6PR11MB2874:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0phJXeCXwa/XhwVgqOnrZGk7wL4nlryhAWRV/zZ/D+9CjYmQl4aZfBhvIJKBgRsmlXa59cipTW566D2bdIq4/z02DLsEcBwHOkZmwkI24XSnOtcOPirh1+erYoPpn1BkpXw/gZ1zIP0faNLw0EdyHHzsNw+4FlTyTG4didMYIBUb6RFFgPZSsAhPe1jRVjGfHIUS6RCXYANvFO9Zn+gqgFMxo2D0FzGqC830tWmW2UYAURQljDqPgqOBNxUDJa2KX6fOTZiSBxwnkXs3++TaJ69Vz4ZH7gHK4Hd9w4XaP/jqREWYvfGdyfGrakI+aWJp01DdzWARTLftvmNZm9M6idxHsDNPJzPGlVbTtjttC0KOEsn3Wjc9cD2a+BHuD1bnZayJCX1Bgb8NC+uW/VpfOO4Gr+bnQtZYwxAI6fZWOgJ/Q/al1WZBjKN3VZrg3cuYaKbz+fNY78EoLq9LephgrPPkhGP0TFg8qpkfsouIaIxdFxBk0X/VajOyZxYZAyHNADzPU7eKpQTLqjDDgMpLtEx+m7gL0KS2xVbCPJXqG9JnILiekdbDpoSxsIdMUlG2kIGV8Gv+rgZQRX4Op6Lh1jTiP0/o2fkZcIUfqO1pVMTXYLmzoRwxe4UOZwmIyL28d/nNBJnWUUITQeNZ3ahU5/BBSH+il/tOjiWvG5rQPGwQ08p7zRgKbxXHxv76ht0ufbwDECeGr+Wk1E93bL+d2IeMBRScI3IVJ+aBeDrIhik0BjOuwZTRmZ0wTBl9rcyZPczVmr+vT9d3vlo1+QScI0IF2DlwfFJOZ7p+LxE+a3eOqFdu8ZWwu/BqJDWqwzkOovS4mi4g6vnCRMqS7jbp6JDQ6XOQ1/Sj2Qp8gs63DxQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(396003)(366004)(39860400002)(136003)(31686004)(122000001)(316002)(31696002)(86362001)(38070700005)(6486002)(71200400001)(966005)(91956017)(110136005)(54906003)(36756003)(38100700002)(26005)(6512007)(6506007)(53546011)(41300700001)(64756008)(7416002)(2906002)(66556008)(2616005)(478600001)(186003)(66476007)(76116006)(66946007)(8676002)(4326008)(66446008)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czYrdTdnbE5HSC9xRmNIb0k1ZlY1MVAzK2k0bW1mMEpOZ2JLdllpbTY0VG41?=
 =?utf-8?B?UEtNVE1xUHRmVXVXQUdaSmNoZTZvNHZJZ2NPV3hhNTN1SnlXUkoySStXSHlW?=
 =?utf-8?B?QmVtZHloczg2ZVR3ckd5K0RPYlFocTkzQUpJUEdoOG1ZenVsY1FnNCs2MEJl?=
 =?utf-8?B?SVMzS3ZqNnFGR3VoNUhjSmhvY3ZnUEU2U0pJNGlEc2pYbjM3MExCaEFqNkd2?=
 =?utf-8?B?ZG12dzZ0ZmFDK0UyQVdZZ1I5ejBxSlM0Z1owQUE3TnpGM1oweVYwTDMxbkZY?=
 =?utf-8?B?bFZadENDTVFhSUsrVnRuSlpkam9OTmUzZEs5cFhIdUlSWE5kbXRYd2M1MWY5?=
 =?utf-8?B?STBRMERtY1QweEN0cFRmamxseXpoeVdGZkVFYno0V0h1VkR0T3k4Y2d6aDk2?=
 =?utf-8?B?SnBaY1cyaXFQRGpMM0pmLzRUZDVRWG1zRXo3WmQrUzFQMUd1VTYxSUZBRGw1?=
 =?utf-8?B?T1VzNGIrRnVSZXhJMWxsQ0tndmM4eFY4R1IxYjY0QXpVSTR2TCtZQ0YyWFk2?=
 =?utf-8?B?cGUzSkY5L2JZYnVKdEh4ajJTV1NsYi9VeEF3dWx3UkFWRFFvdkFtVGpXRUxH?=
 =?utf-8?B?VS96NndKQTQxcWpDQjRLbGZxampKTG1VTWI2MGllNWtkSjBvRjFmOFloTFJs?=
 =?utf-8?B?cjhKODA3b3grOTVvTFRqR2cram5CeTU1emFQY3RGZ3IzQzNjT2swNUNTOEkx?=
 =?utf-8?B?Mzl2UXBkQlJab25WYzU3anpJaXZqTmI2K3BJMWVqWnBjRWF3cGVDSkJNN2hT?=
 =?utf-8?B?dmF2ZlRQWEVJUW1tTzQ5VkFybWNkdXRlcXZrYk9sZ1JYR3R4SGFkdFJ4akQv?=
 =?utf-8?B?NjU4YVJQdWVaWll1eU9BQnVVSDhMSzh6NjVGbUNiaUNKTklVU01TZEx5UUhw?=
 =?utf-8?B?ZEhqRkVzTUNGa3ljcFdvcFJ5RG5KL3dwdGd1WUYwbDlLN094NTRMQnVlQ3RQ?=
 =?utf-8?B?Y1YyR25IdURQc0dZeG1LU3FEdnVrZ2dDN1hHNVMwbnZZNFJYbUE5S3RlS3dP?=
 =?utf-8?B?S04vWXFyTkoxVlZhMzV1OTVaMEtCaFlPcFZCVWlwaWtoVmtWNHFDc24zcVVT?=
 =?utf-8?B?aW5vbVVBVXpwL2FzZHFhNEFFL0pKcVJIT0hoSGtRbnp4bzhnZ1RKRW5Tak5i?=
 =?utf-8?B?aEQ4bjNxRVpJa3F4SWlQNkNEVWtoU0NzdGQzWXBaMkJib0V4cG42V09NSVc3?=
 =?utf-8?B?S09CS3EwM3U3akhyK3hWbitOMUpHWW5CWTU3UWNMeVhZMjFLZ0ZleUtzZFgw?=
 =?utf-8?B?ZXREaUZ4dFlnRXl2Ry9zWW53c084eXFPZ2c3a3pVRXRXNTVRaTlDVjhJanNP?=
 =?utf-8?B?MDlkNFdvQ3JnR2tmSW5DR1BMRmpNcmxITVRwTUNTa0lyL3k2QmdKRHRMOW9B?=
 =?utf-8?B?MWRxRHNYbzZpYmppYU5VMnBEVUhQcFhwL081amYwb2JwWGxoczlPeW14MnZx?=
 =?utf-8?B?bklIRU95LzVHMG1QOG0wUjhob3M4UDJqNXprWEM2eU14REl6c0hoR0ZyeC9C?=
 =?utf-8?B?TU5IWmpNbDloTkFXUDdUSWtOajJFNVhhUnl0YTNvMExkRE5XREl2N21HZzIz?=
 =?utf-8?B?V1pYNHVYTC9CLy9NcUtrR2hmQ3E1emwrbFhsYVJuS2tBeDVmRzFGK3pHR3JJ?=
 =?utf-8?B?cllJWjR1S0JkcHVuMlhvc0ZaYmd0YUNyUnNjaWlQUXZERXNvdHFXbUFPSE5z?=
 =?utf-8?B?emxaUVIwanNYLzBJNDdhaURwemtWd0pseTFWTUNMQ0lheXE0d0tXVzlVYkNH?=
 =?utf-8?B?MGQ1OGc0V1RJZlJLSVFvMXV1L2dPT29BWSt3Nk5SeU1HOFNFbzRWL2NLSXdS?=
 =?utf-8?B?SHUxa20yS1Y1K0t0dUlIZDh3Z3NvbmRMOFRsYXp0V1hEemRENkNnZHM0ZmVH?=
 =?utf-8?B?d2M3bTRwU05zV2piR3BXeFM4REY1L05KbmozK1MzRG5QQ3dtKzJMQ3JYNi9n?=
 =?utf-8?B?VUo2ZytjeGQxRjNsRWVmOGpVWEc2dTRaOEJvTk5td0wvc2kweHFId3p3bHhk?=
 =?utf-8?B?SVNkNmV2WDBvaWN4T3YvWXVVUjgrUENOQ3ZlZ1VCR1UvQS9ldGhYcGY4empr?=
 =?utf-8?B?NjQ1UGtiWlM3WnRNVUlNWHpqZzZEVXBOaGs0dGViT0tibXo4QUVLSVg5WW1q?=
 =?utf-8?B?WW5rMkpJamp0R1VwaVBuUkcwZGFzS3Z4N3ZVR1k1Z2hjMU5VSDhYNExwNXBw?=
 =?utf-8?B?Vnc9PQ==?=
Content-ID: <B1A3D7C819AA0D4498C8D7EFB48EEF88@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46707ffc-3e71-44ff-3818-08da90b0463e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 09:06:39.3160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LA6EFL+Z5Ke3C7i7koLkKYrT1T51/YQw9LAkXeS/NbOicypIyKBGyTGNQlFqw0mKolMszY4BVWWX2WBV+IMtSuIpXf+Qh8OgTyXXvqAHKSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2874
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_020652_546209_652A88A5 
X-CRM114-Status: GOOD (  16.97  )
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

On 7/28/22 10:40, Tudor Ambarus wrote:
> Every dma_map_single() call should have its dma_unmap_single() counterpart,
> because the DMA address space is a shared resource and one could render the
> machine unusable by consuming all DMA addresses.
> 
> Cc: stable@vger.kernel.org
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index 6ef14442c71a..330d2dafdd2d 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -405,6 +405,7 @@ static int atmel_nand_dma_transfer(struct atmel_nand_controller *nc,
>  
>  	dma_async_issue_pending(nc->dmac);
>  	wait_for_completion(&finished);
> +	dma_unmap_single(nc->dev, buf_dma, len, dir);
>  
>  	return 0;
>  

Hi, Richard, Miquel,

Would you please consider to include this patch in your queue?
If yes, please add the following tag, it solves a regression:

Link: https://lore.kernel.org/lkml/13c6c9a2-6db5-c3bf-349b-4c127ad3496a@axentia.se/

-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
