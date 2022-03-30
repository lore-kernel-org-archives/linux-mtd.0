Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7415C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Mar 2022 06:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+OLQQRvW3/7WOYDFKdEsb4cLrLam72Hh/X24ONIsgEI=; b=AitNcKF9IdoDh9
	dvvwZJx8RayI50cNgJj6HNaOxa2zogpg9r3ei+g6GHkX9mqh+MB8ufwEIHsF1um6xNMDUYtawgViD
	al3VT/YjvnZNfaZgiVEaoyNJJLMNNe977yjbaqu9U1CuzqdZEeACyX7Es+PInZfUvDZZ1QsOrD+oU
	4M9xJHfVPo1VL9mRtGGocJeSI8vZIbXcz0yLWMcn6lgIpl2LfXOBP1Jzw1swl01v9VAVk6nnwTs7j
	RE0Odbz2P4jCoovs0Ko+Q4ZkrLheDaJAtAov+3wj/2EfD8aNibjtEmrRzGOKdRORwAT3nK3ZLl2TS
	qCL3qQ+PDm3BD6u568fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZSDS-00ETQj-KO; Wed, 30 Mar 2022 06:54:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZSDO-00ETPF-Vw
 for linux-mtd@lists.infradead.org; Wed, 30 Mar 2022 06:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1648623239; x=1680159239;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pG3NJ3xDc4oXyXWcVKVQ1JjTzch/pynKedHM54GVVPc=;
 b=Us93Fv5uVb7PjsmnG8KLgcAVHe/U0I1X7l5bStVmsy2cXAVquczGx8jf
 7h7ff5dhL2x2bKkAXEkCKz5Qz/zYtKZu5XAZkGoyKhp/yMl+ZRmj/L4TN
 7HICOJUyS35TDIVsUDLyLpmd/nhGolTDKGaPbFb1etpLrtWdkZyza167I
 uXiWrUv42+rlvoI0t775Yiz+DxfxChlaMEFkqvxT0pTtf/vCtNFBUoZB7
 9DK1JiTztaO/LdnmyGJWmoUndSnnJE5UXY9OOpwEjZcb8DHwwpQ0WFWDw
 PXG1iEFC9zWFfmCQqdkpYxQRha+QkW56fIOVkdrV+QCBTPeXjgdW1/MBy w==;
X-IronPort-AV: E=Sophos;i="5.90,222,1643698800"; d="scan'208";a="150866936"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Mar 2022 23:53:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 29 Mar 2022 23:53:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 29 Mar 2022 23:53:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrkC3ZnOOdqxnyMbikFBFbi7cDjj5PWWzouaYQZ0zRzKXjBul38u7NJj0Z78Q89ttVDK2jVuYy1M7b1r8WygX8ngfJ9ebZPvQrEPCyZjKwa2zL6eXeY+huvLsIRPHxgSDnItws7cV/rSn+o521Noa54ctQwBVDgIYRtEJARIEZt+ut/wOfmMyqzaqnJR6f2OkyGaO7u7Li8eogqHkfJXzNs2IaoihTl6pBlVyzd2qNuWy3yJ4EXEOJUuwIbnx+8+0OHYe6z9iW+qn4oJGC/didvbTN/jhRuGIywSA/TQqr0yszTeBW7zE5acMeF4F8AnUnwkANEs6kuDCHWbvvbTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pG3NJ3xDc4oXyXWcVKVQ1JjTzch/pynKedHM54GVVPc=;
 b=MWVffeSzfNH8REZF8KxdUqu/M9ILmMmp7Ot5ImNbgBrfxLZGSe0C7NgWCBCZQzwM9RO63E6oLrxioRKrcZGr+p47pUSYLCveWWIROGTEJfYEVUpk482W2WNvFHKWF2JMHprSIFYGeP6RE2Kgy5XvwGIjDaHYNyPZKSp06nquWYsZDtYtylTpXlWl0M7B4hmMl3CnuA+CbrUlw3clzMcuKW0FrFWzVF74RHq8UewGKfr29wmYWB+8EpcJnbwEXDY9TNguoUo5VnybaXeNNXheNkD5GCJwY2ZS0D2qktj93XLAflq97+sH8GPTcVeBA+Juw7c7EI8BEBeNaSjaYvLfqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pG3NJ3xDc4oXyXWcVKVQ1JjTzch/pynKedHM54GVVPc=;
 b=dE2t19MhGNkVTiCxLxe2wPJVkE+5rtc4OrRjRxZXqtcYmkY73X0X9Q+UZokT/LEF6f5vV2zWxbzCrI4SWmtutwgBFQHzUvPz1B0L/JXyv1bQ1bo+inB4xpJAbvhBR28NfxBqIXfq3BxbZHCooqHDhn/PSFDxuOP7Kn67ZOGubSo=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN8PR11MB3682.namprd11.prod.outlook.com (2603:10b6:408:88::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 30 Mar
 2022 06:53:45 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7cb5:d2dd:7e5:c812]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7cb5:d2dd:7e5:c812%9]) with mapi id 15.20.5123.020; Wed, 30 Mar 2022
 06:53:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v2 4/8] mtd: spi-nor: core: Introduce method for RDID op
Thread-Topic: [PATCH v2 4/8] mtd: spi-nor: core: Introduce method for RDID op
Thread-Index: AQHYPSYy5Uot3kf5wUC4x8ym1emt7w==
Date: Wed, 30 Mar 2022 06:53:45 +0000
Message-ID: <b739a03f-fe3f-7a2d-95fc-00122ca34c39@microchip.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
 <20220228111712.111737-5-tudor.ambarus@microchip.com>
 <20220321122149.dvqyml4riqkr3gqi@ti.com>
 <32b3449a-66db-3ed1-da96-47e124800500@microchip.com>
 <20220321173908.tcqx3ygo6qd62ukg@ti.com>
In-Reply-To: <20220321173908.tcqx3ygo6qd62ukg@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 527a433c-ffe5-49d4-a8fa-08da121a08ea
x-ms-traffictypediagnostic: BN8PR11MB3682:EE_
x-microsoft-antispam-prvs: <BN8PR11MB3682FD99FCCEC4E34CF8F374F01F9@BN8PR11MB3682.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n+sjzYLz/ASsKvTnsSt3SI7vX2RmFMAZODII0Zyn5eFM0V6SPfvMw+xT1KU79IRkQHK0VT1ky0iK0pz+TzUC/DsPAUJewSBrvYwwDgOj7vqB+p643aeh1yNz6nEJwr1uUzBWLPX5dNRtFHmmjjWBfQb9XsgwfJQuiEL9g7ZZ8FAq4NUhi1qDTyCquUVMHWI+tW/CSrJdVFBUDyt8tUbW/Piy/suh+xcFVPSQMnpwW/GdaJu85um/SU49K25L7cApURAtwdnWRM3UxCjtFW0Nr1yzzttMoa3tPc4bT/hl2WFdgdA+QnpreBwDoV9wgLFzUr5nesEMgkjvGailggZWFfXfF2fGbXQDh5zkZlDoaBLYRVr5427S6HaXBCq34L2TnpnDxfkX6cgLoBM4Ey79CsEkPw/jjWRsWsrq3IutemyiV0SuSI144vJIjWdmxDo7YmJIcPZoCxeHMCyzSy/vA5tM3j/GcSqnvlkSODaLjMgDNwh+iXXk0Ru88csVGnFN1AmOiLAxCMkWh3x/2IJfXCigwh+shW7cVJpOvRCJYBKjDJ3qFYVKkMayiEZJq/6Fhby+QWGDRmfWwMFKDz8itPKeXNSoaCAnsfcb9ktwn/wm8sB+exzgdU5prKsHmWppokysiHePLgiG4DYv1saYwEm17H9CPu0fNCvzalWZBI0FLeqJhyIVQo7nALY6uNsdPlpZf3Hx8ldLsK8740ApKFZ76zHqdavx8rV49L1emBECE7jDkWQloBWf5b6uF4Q4KLHj1e9dswAwmnCNoahzUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(86362001)(64756008)(66556008)(6916009)(66946007)(6506007)(6512007)(66446008)(122000001)(31696002)(8676002)(91956017)(66476007)(38070700005)(54906003)(4326008)(38100700002)(76116006)(5660300002)(2906002)(26005)(8936002)(107886003)(53546011)(186003)(83380400001)(508600001)(31686004)(71200400001)(6486002)(36756003)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amhFY09QbEQ1QlF1SDlUTDFyVWVYa3dvNXpFc1ZEaTZrYUdkeFYzY1hVbTZ6?=
 =?utf-8?B?YmZPa3l0TThMbVF5TUN1cWZnMXpCMzNkNUFlREUwWVRIY1NJcENjRUlqYUtK?=
 =?utf-8?B?TWJUZnZwMzNPWGt0S0lMakN5cU1vaG96REthaFVocklHR0Izc2RpZUtXcEh1?=
 =?utf-8?B?YWRkOFFZelh2dVVYZzJhQmZoL2I3Y2htSGdLZTJieEcvbGVlVTRySy9VNitX?=
 =?utf-8?B?aFpGUmpGUU1QbDYwUFQ2TW1mR0ZYWkwwSUJic3FRdXVQUlg1dkdtWjJ4UjFm?=
 =?utf-8?B?SjRrNGRFaTc3MjJicTc0RDNLc3FpWVZRZ0ljTjNLc0x4dU9QaEVSeStPelZv?=
 =?utf-8?B?TU1vTFpOaXJ2bnRwWGdvZnoxVWpCNDljTEszWExLZ2NEbC9OUUlLUi9nK2x3?=
 =?utf-8?B?bENGZHF3VWJlODFmREJHNjVEemJTOE50WjBsSk5oRFhJV2RuZFJLMFVUME9E?=
 =?utf-8?B?aHczV1J1NmJWZkRmWEJablRjVU9uU2xhN1AvbjFPTlFBd2Znd29jOUdMZERF?=
 =?utf-8?B?NVAwRlE5M0JmZmdrSGRRdjV2RVpkNHZCUThOcS9rK2psZXlUMGVpc09ES3pN?=
 =?utf-8?B?ZUhiYTJOeTUweks1dmt0N3d0enZHbDFuMk14U1M5L3FvWG5nb3hvUXRQWVYr?=
 =?utf-8?B?cFJqMVp1amk3bDV4czdnMS81bDVXU2NtU3VWNjFiaVRZMnRPbVZ2bkwyS2Vo?=
 =?utf-8?B?UHJVSGtONEZXMGsvUXRpQWhZRkVobGE3RGp3NllzckJtYkpOZUkvZEY5dWNv?=
 =?utf-8?B?Wm40b05qaVlvSGlKOVhjRlYxYStkd1NPaEI1Q3lsWmtEMHNNRGhxaTVGM1Jt?=
 =?utf-8?B?UzVkb1JDd0F4Q1dsQmx3QVgwZzlweS9DS0JkcFJhazdnOEJwYjVhQXVlODd2?=
 =?utf-8?B?TzR0MkdhdVl5U1AwVWk5c3hqUFhJc0RXR0JCYnJhVDAzTEJEaFpJemt5SFlj?=
 =?utf-8?B?NXMzVFRTQkZ2UWJzdUh4OWNtbzhOemdhSk5aNEs2a1IrdnBnWnRTTTFDYXdM?=
 =?utf-8?B?M3pyMkZ1MnphYzNVaHhwUlYxd25ZOVordU4rNWxYUDVFZDZGU3hzMHhWZWFH?=
 =?utf-8?B?UmdzYldnUGxVeFMvUy9COHFjemFIZFpST2N1TTdoL3dZZE8vMzlFaXlhdVB4?=
 =?utf-8?B?Z1RPbTc1bkwwTG1LZHBHK1c3cW9nb1VuS2ZyL29hQlcwNDVwU2FxaFR0WVRE?=
 =?utf-8?B?S2szb1B4cG9EcHZjQkFmOW1XM2lKUS8rSmJTRHppTExlTXdpdml6UDhyWWZ4?=
 =?utf-8?B?ZVFzYzZydk5ZdnpGdUdWQVUyQlkwYUVWY3VRZHlqdzQ5NDEwaUdBUGlBUjJX?=
 =?utf-8?B?WVN5MUEzTnlJTWdSWmc2a1Y2RUUyWlRSVXIxZW0xTFVVMmJyWkpYaGZ6VmFz?=
 =?utf-8?B?ckFFLzlNeVpHWXBwalovOEt6K0hKUldhdDcrWWtXZ0FjenZGUGR2S1gxbW5T?=
 =?utf-8?B?cnJpc2d0d1l0TTY4bkwweVZETTltMXAxUlp3L3V4WmVLMUdXODQ0L2VKUm15?=
 =?utf-8?B?SzBKKytSZ25yRFI4TEg1VmpsbWxIS2lhK0s0VlRwK1gyVnU1Mk1nQkRGc1pp?=
 =?utf-8?B?TEQ2V2w3elZSbzVkK1pWWWVsTGdKOGtHSmFxdFh0L3JxTXE0NFkzdnFzNHFK?=
 =?utf-8?B?ZDV4UmRHOGFnRXpMaHg5bGI5MUtsQ1B4OGlOTmY1UG50L09rNDNHYlFDaVlB?=
 =?utf-8?B?bTBlVElOYmZtSW1iZE12S0FtUGhYeU1nZU1jNEZTWFovR2RKSXZtdmh0ZjIr?=
 =?utf-8?B?ZlI1ZHdnU3dYbzM1VjZKSVN2eDNUTDV6OVhubU04WXdOelBYeVBhcHNkYWM4?=
 =?utf-8?B?ODRwSUg5bG1vQ0pqN1JLTTdNdGpuOGZBUHVuVnQ4bmZIQ1FIRzZjRmorOTlo?=
 =?utf-8?B?N2lDdEpkR3NUQlNMWmhleGhtUXNOSitwbXZCNm5wMSsvNDAySEJMVlZnZEVx?=
 =?utf-8?B?cko0c3VWeHFxOHRhMVFtUlRYeUptRUcrM0ExbmdNQ0hTK1FQVk9KaTdja0Y1?=
 =?utf-8?B?U3grVWlQYVFLdDVXdWsvaXUvTjVFbFhEanhOVFJkbEtSN1BFWmQ5N2UyNUQv?=
 =?utf-8?B?bjZPMXpsVFBhZUpOWTB5SWZjWkVQc1kxcUFkWWtrNFYzT0cvL1Q1U2FSV1Nr?=
 =?utf-8?B?TDJ1VW9RY3BSdWdtOVprVStNL2lvOWh4MkNtTlBSd0kzU2M3UzNKa043d2pG?=
 =?utf-8?B?YlpxNGNCU3NFbm9hektPQjkwbmw5RE5Lc2poUGZYME9nZTFQaHFGTk5YZW95?=
 =?utf-8?B?V2t6Z1dXamowVm1jNlE3WFJ0Lzlwb1dzVlVPYVVUUXhSQzF6RTRIeUlVV050?=
 =?utf-8?B?NTJaMW4zaE1BbEk2ZlZZbVdaN2lYWXBxZURaMGpHbm9lVXA2REZkaFBHWlU3?=
 =?utf-8?Q?N63v8lqV/BYw+Z7E=3D?=
Content-ID: <A0DF4BE89C1B0E479C0BCABA5FE1FC20@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 527a433c-ffe5-49d4-a8fa-08da121a08ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 06:53:45.3767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xIq1SVZuN8ByxKzuLR1ixLAtl98Wxs2Htk2SepNxyWAGMCBwsbiudCHcknbP0ciUb5juEJ9V2E35ai6R5koDY4SW3nGgUEiomkcaC+QLqNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_235359_251886_B6A9FE20 
X-CRM114-Status: GOOD (  25.68  )
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

On 3/21/22 19:39, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 21/03/22 01:18PM, Tudor.Ambarus@microchip.com wrote:
>> On 3/21/22 14:21, Pratyush Yadav wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 28/02/22 01:17PM, Tudor Ambarus wrote:
>>>> RDID is used in the core to auto detect the flash, but also by some
>>>> manufacturer drivers that contain flashes that support Octal DTR mode,
>>>> so that they can read the flash ID after the switch to Octal DTR was made
>>>> to test if the switch was successful. Introduce a core method for RDID op
>>>> to avoid code duplication.
>>>>
>>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>>> ---
>>>>  drivers/mtd/spi-nor/core.c | 58 ++++++++++++++++++++++++++------------
>>>>  drivers/mtd/spi-nor/core.h |  9 ++++++
>>>>  2 files changed, 49 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>> index b1d6fa65417d..281e3d25f74c 100644
>>>> --- a/drivers/mtd/spi-nor/core.c
>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>> @@ -369,6 +369,41 @@ int spi_nor_write_disable(struct spi_nor *nor)
>>>>       return ret;
>>>>  }
>>>>
>>>> +/**
>>>> + * spi_nor_read_id() - Read the JEDEC ID.
>>>> + * @nor:     pointer to 'struct spi_nor'.
>>>> + * @naddr:   number of address bytes to send. Can be zero if the operation
>>>> + *           does not need to send an address.
>>>> + * @ndummy:  number of dummy bytes to send after an opcode or address. Can
>>>> + *           be zero if the operation does not require dummy bytes.
>>>> + * @id:              pointer to a DMA-able buffer where the value of the JEDEC ID
>>>> + *           will be written.
>>>> + * @reg_proto:       the SPI protocol for register operation.
>>>> + *
>>>> + * Return: 0 on success, -errno otherwise.
>>>> + */
>>>> +int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
>>>> +                 enum spi_nor_protocol reg_proto)
>>>
>>> Nitpick: Could just call it 'proto'.
>>
>> sure, will update
>>
>>>
>>>> +{
>>>> +     int ret;
>>>> +
>>>> +     if (nor->spimem) {
>>>> +             struct spi_mem_op op =
>>>> +                     SPI_NOR_READID_OP(naddr, ndummy, id, SPI_NOR_MAX_ID_LEN);
>>>> +
>>>> +             spi_nor_spimem_setup_op(nor, &op, reg_proto);
>>>> +             ret = spi_mem_exec_op(nor->spimem, &op);
>>>> +     } else {
>>>> +             ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDID, id,
>>>> +                                                 SPI_NOR_MAX_ID_LEN);
>>>> +     }
>>>> +
>>>> +     if (ret)
>>>> +             dev_dbg(nor->dev, "error %d reading JEDEC ID\n", ret);
>>>
>>> I think this message should be in spi_nor_detect(). Let octal DTR enable
>>
>> As of now every SPI NOR operation that return an error also prints a dbg
>> message. I like this because it offers a smaller granularity on the error
>> cause.
> 
> Yes, but I think this message would be misleading. If someone sees
> "error reading JEDEC ID", they would think flash detection itself has
> failed, not that we failed to switch to Octal DTR mode.
> 
>>
>>> methods print their own, more specific error messages.
>>
>> How about duplicating the error in the octal dtr enable methods if you
>> feel it is worth it?
> 
> They should at the very least explain that reading ID failed _after_
> attempting to switch to Octal DTR. But I think it would just be simpler
> if this is not printed here and the caller has the flexibility to
> explain the error.

If the first readID fails, the one that identifies the flash, then the
octal dtr will not be run, thus a single error message. When octal dtr
fails, 2 errors can be printed, one specifying what failed (the read ID
command) and the second where it failed (at the octal dtr enable method).
But I don't care too much, I'll follow your suggestion.

> 
>>
>>>
>>>> +
>>>> +     return ret;
>>>> +}
>>>> +
>>>>  /**
>>>>   * spi_nor_read_sr() - Read the Status Register.
>>>>   * @nor:     pointer to 'struct spi_nor'.
>>>> @@ -1649,28 +1684,15 @@ static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
>>>>       return NULL;
>>>>  }
>>>>
>>>> -static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
>>>> +static const struct flash_info *spi_nor_detect(struct spi_nor *nor)
>>>>  {
>>>>       const struct flash_info *info;
>>>>       u8 *id = nor->bouncebuf;
>>>>       int ret;
>>>>
>>>> -     if (nor->spimem) {
>>>> -             struct spi_mem_op op =
>>>> -                     SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
>>>> -                                SPI_MEM_OP_NO_ADDR,
>>>> -                                SPI_MEM_OP_NO_DUMMY,
>>>> -                                SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, id, 1));
>>>> -
>>>> -             ret = spi_mem_exec_op(nor->spimem, &op);
>>>> -     } else {
>>>> -             ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDID, id,
>>>> -                                                 SPI_NOR_MAX_ID_LEN);
>>>> -     }
>>>> -     if (ret) {
>>>> -             dev_dbg(nor->dev, "error %d reading JEDEC ID\n", ret);
>>>> +     ret = spi_nor_read_id(nor, 0, 0, id, nor->reg_proto);
>>>
>>> Hmm, I wonder if it is better to explicitly use SNOR_PROTO_1_1_1 so
>>> clearly signify that this is intended to use 1S-1S-1S only. What do you
>>> think?
>>
>> I would keep it as it is for now, because it offers flexibility.
>> If we ever gonna determine the protocol at runtime this will come in handy
>> because it will work without touching the code. JESD216 suggests an algorithm
>> that tries to determine the mode depending on the SFDP signature.
> 
> I was thinking exactly this but came to the opposite conclusion ;-). I
> think this would imply that other protocols can be used to detect the
> flash which is not true.

It can become true. As you already specified 8d-8d-8d is supported by some flashes
and we can implement hooks for their specific 8d-8d-8d readID command. The logic
will complicate a bit as one has to adjust the hwcaps before issuing the 8d-8d-8d
readID, but it's doable. Otherwise, if the bootloaders pass you the flash in octal
dtr mode, you'll have to disable it, issue readID is 1-1-1 and then re-enable it.

> 
> But I have no strong preferences here. Either is fine by me.

I don't have strong preferences either, but it seems that there's room for discussion
on this, so I would keep it for later. Is that fine?
I can add a comment if you prefer, specifying that at this point nor->reg_proto is in
1-1-1 mode.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
