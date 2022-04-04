Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB14CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 06:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEtCJbCe60/hO4ynWDyaGXImTBNvv1UcKQBtclmV8xU=; b=23+ViBICUPD0Bi
	srNY7JbYiTeYOEOrzIwL4BS02e3NFKPf/F8ZPs5ojTvE4ATNWmw37JzvGjSxKeIrvh7U99hznTwQ/
	VYsAPmw4DvbqqQxt4TRd5KQoO9500m5hnWw82SWm4+JQeXpbUdZHFvsQ2lAqS5LMJMD3bjBS8z10R
	LdS6UMaoV1d9x72I8XHzyP1kRXeOcIWV2u0H1P3C++k/PpLtQ1Rv67HlES9tyXu7jPZRUFL8rWI76
	y4G/HkKGgVRa/ywi0u0lXdFRQh8DwZMy0g9sY2oL9YtTK5JhsXl4+BlQDmzPuZETAExgaoj708H80
	2q6W3z48NDjjmfKlq0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbG3o-00DPYI-ND; Mon, 04 Apr 2022 06:19:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbG3l-00DPWW-NB
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 06:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649053169; x=1680589169;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HmgsyUl/5T9mEVVYFHjbKFjRqNfJIVqBrPIYw8PPOpk=;
 b=qLEV6kcJcdv7fZE8xlPqCCy2mec8Ctwt+A8Tf8mvRnsHRRTUCqm1f8pa
 KD01XlhX9+2KtV2HYuqwFIJ+IV1DEFLUYpB31YCJyGptwk1AwhfT0gnzA
 NudWkmLeryqA0F69P+fYhyRBqiZ9EBY4uR5klbFZgLEudQoIzKzX/bifL
 Uu2rcQUae19uO/9svZ67QBF5n80Aq5xEAJvr4ktiFxooxP3/QhurBC35a
 piwNWhT7tt+rQVe63unkL3foxet/i5UQaSGvVeipnS9DBDr9Awz9PQYss
 IXqmMdI6OUyTVHu9DbibCUozkAZhNohYoE9UvOc7x+GvE0s8Z+oYdJOgM A==;
X-IronPort-AV: E=Sophos;i="5.90,233,1643698800"; d="scan'208";a="154248050"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Apr 2022 23:19:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 3 Apr 2022 23:19:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Sun, 3 Apr 2022 23:19:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffKlqUBbYlQslxmCcx25DYVjdiYkUKFjbVV4bDtcMm040VZJs0X4HhiF4afsi1G1aUAabAXhmUBvfAOoH3DWOi4yiJKUirgoI/LWFp9OfnhrVsxcSfw7rWVA8BkF95SgrEX3Wd2Slmi3dS+UMl6YW6MIgTWNhpxObi8gDX2KL6+ZzZQvmmfHYNcjUAtKnjeh9Zb8ahekk4jq9o0HP0RrRChdK3z+/W8vBVz00wIyXcc61+fWaf4XkEUrb6ZyWebg/LKrPUdeHp5bIXLMiWW3bKFAM4nG/p9xpVQDBZNvE7//3Uy32O6VSD010ku4E7BrHaehjE4uu5ItN62BJVJlAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmgsyUl/5T9mEVVYFHjbKFjRqNfJIVqBrPIYw8PPOpk=;
 b=IxHidf2BnYrWNVU1uqMik/CnJPMU8ZLCpWGxYytukLcqjmha60XdsKHTGZTt1iedLR6t5d3J4BFhlI6DASt0lqjUznU795ZicxLtgkZtLeSc8uHklRga8N94rHMQIfBXpIgeYm4lY/yrj5mduieYpCZTqBK+skVVM/Ngqy5GER2ckONBzzVCstjpnwv3gUtxWCAkEe9d+nxMTYUjyvmrnH4ooqDtbdjnUECjwmNazR0VruH9cqOwm7zqFhdpYuAkmjhnSiIswL3duRO3EoOPg9YjoYopBpXhCtHddDsfxPyBRgKvdyWkRRjfy1WDyRg18j991yJmRd/zE/6gimtdow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmgsyUl/5T9mEVVYFHjbKFjRqNfJIVqBrPIYw8PPOpk=;
 b=swUTz5Hu3UbhqVjswU7XQSRKqrTLgJn0sabwAiqZEc2+lHEhXyB3uk+clqZz9wYmCByiYFh3v5UoxlFKa0/4LpmHM9n8skHL4RmodWy+ABB0OecrRkPl6Ig5hfL11SUU0Qvk0P6fH+ugKRwzmKcAdgAyKgPzqy3CFLuTJhQQsSk=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BYAPR11MB3830.namprd11.prod.outlook.com (2603:10b6:a03:fc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 06:19:22 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7cb5:d2dd:7e5:c812]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7cb5:d2dd:7e5:c812%9]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 06:19:22 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v2 4/4] mtd: spi-nor: sfdp: Keep SFDP definitions private
Thread-Topic: [PATCH v2 4/4] mtd: spi-nor: sfdp: Keep SFDP definitions private
Thread-Index: AQHYR+vsffORZWT/aUyo+hhCPMlSjA==
Date: Mon, 4 Apr 2022 06:19:22 +0000
Message-ID: <ed093fa5-b514-b0a6-166f-ecf117582b0b@microchip.com>
References: <20220309144215.179449-1-tudor.ambarus@microchip.com>
 <20220309144215.179449-5-tudor.ambarus@microchip.com>
 <20220401200133.gyyvoe7xdbsww7cv@ti.com>
In-Reply-To: <20220401200133.gyyvoe7xdbsww7cv@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0735237d-f4e0-48e7-f36e-08da16030f48
x-ms-traffictypediagnostic: BYAPR11MB3830:EE_
x-microsoft-antispam-prvs: <BYAPR11MB38301118BC693B3BA5AEE90DF0E59@BYAPR11MB3830.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cykdfdHhSWKr4lPl8PYny6Wk9nnOgTjA0bbqdGW8jIKt+km41pTFZmgutLxG/VrA4stqBXF8Gh6fthaZcKDnGFUAjeaku4md8v5Ms0eFpjypIXjlRXZ7nPWrIzY8b5Q312CBV4g0NKoEwlxYE1aGHudnZrVAbzslzanJ1hxF7C/ALfSbd6iJxpcN84yRzwRyrF+BevY4/eKNPejEBR1JFAXG1u0Iu9C/sm6RlKamwKm55dhWlKzpjHIKE/AUsjNVwGw+ZqrnG1pFdJj/mcC2ktk7eQTC2nHnCUNMt5K3t2O2A802fhZOJNB4MeTPukEPWJSu0QMd8tS/7XW5BjLmMGh79lJftCMLvqNILkBP9JIB9h9QoLJs7+9GrTMChhyFRhX1YIkMTKTYXlVocunYYLKXAFzi3jOtzkbBzS0pBUEBVSHsaiARf8tQhYCsae9S926AwLzY8wA0UF1jmUVryErj6Zbd6iyI8/td/fAIbeeEkAtfWaOXT35aXgj7JiQ+Vf02yWg6bP6mw/zdCq/APT/foXW/bxREKhA4VmNBfaoYUoi9npZvhygEhGgPQk1uCZFG3ltrnYOnObX3gEPNYXpSXxrd6+ZtTktW/P1MKEH75NzS6aQtzW8IBM48S82uHDg0/FcgCzkf1qq6EVx6gue9wRGixFL0yRD7UqTvIL2Hlzw7ukW/DVOZ5gwW6kmrMUvI0V22IWO6TO/QZtcJQtqv/e74YHgj/lAfQJrAw25Yq/97fup+U/nuECJpS/iRIS2Jit+XSAah9MipENG9Lw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(86362001)(107886003)(6486002)(66946007)(31696002)(38100700002)(76116006)(71200400001)(508600001)(122000001)(2616005)(26005)(186003)(6512007)(66556008)(6916009)(54906003)(91956017)(66446008)(64756008)(66476007)(8676002)(316002)(4326008)(31686004)(6506007)(36756003)(8936002)(2906002)(53546011)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmpqaHBtUVJYWmpkV3ZQeUhRZDh6bG9QWTFIY29pZVVqbnJoamJjbmh2RmhN?=
 =?utf-8?B?Z0JldzcvOEovYUxkUmtqSGMxeHVYNk92SkJaSndyYVQ1V1VIRjdYckZnSFM4?=
 =?utf-8?B?dHhaRmdWTzV2SHQxNHpUbUVvUFV4UlVzQ2R3UDFTWThtalllM2dCVWRGWU9Q?=
 =?utf-8?B?MFYzNXZLTVZVSWFZMGZITGF4ZTNRZ3lrcmliRUdYNXdWYTdZV0cvZEtuMXRN?=
 =?utf-8?B?cXVheTBIV1BER2Nqek02MThXTGl6RkhsTVB5M0xLWTljZklQdnlqK3NBRXBJ?=
 =?utf-8?B?cVZhd1BlNTd5NE45cDBVWlI3NUZnb25hWHc0MG5ZcjBYbU81ME9vdmNMV0Nt?=
 =?utf-8?B?dkxlYysyOG1MT3VKTnRkNTdvS3F2ZXgxdkt0cm83OTdPYzNUWjBMRHNGRkc1?=
 =?utf-8?B?RHVpeDJLcEZKK1FhYnFldk43NW5MOFlXOFpsTTRnKzVhSHc1OG94WEVwaEJw?=
 =?utf-8?B?WEVoZytUNWk2eS9jdSt5eTBDaGRlR1VsOG1WSlQ4UlpIY1FGUWpGb2VNOGpB?=
 =?utf-8?B?UlZPb3h5TDV4M2JocG1NWGJub3NDdWliSjlBOGpjSytzanYwMXUybzlQRnMr?=
 =?utf-8?B?OC9YalpZY0h6SXdtNVZJdTJsSWlJTENyRjE0S2VlN1NPRUdBbTVFUEQraC9B?=
 =?utf-8?B?WldtWXQ1WTZtWmRla2VObkxPeXJNdnM0b2VEb2tnQXB2MkhIUFVLUnZIV3dH?=
 =?utf-8?B?c21MVnBvemhsMzZCUWIwYzhQTkFDY3R1MzkveEhwa3FReWF3UGwxZ3hZdjJS?=
 =?utf-8?B?Z0x0enNoRm9OZ24vd09VWWZkcVQvVGU5a2FhRnRycms1dW13M0h4SmFYNjhn?=
 =?utf-8?B?NTNHNVYyVWhzaUZObytueUU3S0s4bStEblF1bGJHcHVsVGtMSFcyTFVRSy9E?=
 =?utf-8?B?VWxLQnBYczNsSlcwMTVURUdETy9tT2ZxZWdkb0JHb3d1bG5xRG9DMDU0VlpS?=
 =?utf-8?B?dGRVL0RCZzBDUmcxdS9jYWZhK0s3V0hNaG4rQkl5MDBkenhqT08vczE3UmZt?=
 =?utf-8?B?NjRzZXhWbEN4azFKOHZpc0F3bTFOTDJLenh3NTdrSG5wSml5bk80bkhrUnll?=
 =?utf-8?B?RzYrSElEelE5aG80K0ZNNTgyejVjbU0wQXMrNjMrTE9rMmdJSy9BQXFPZmVN?=
 =?utf-8?B?Qy9pMVROUzRwRFl5TUlod1Bka2RROFhWRGlIVUxidGdaL3hWUzJJZ1c3Z2V2?=
 =?utf-8?B?MFQxdEE2bmJkdVRvSW5sUTByc1czcTNLZm5rbVBiWERNNW9veUpzZjZISytG?=
 =?utf-8?B?cE10T0NXWElXeHBndVlzN3ZSMmxoQTdabFpFMFJNNld3VFhoQWVXaEFSZWc0?=
 =?utf-8?B?R3FWeTNWZzVud25BYTZEZ2RHN1U0V1VJbWVsTkFPOTJUOWFCSlhlLzc1RnlU?=
 =?utf-8?B?MXFzbTEvMnFjMDRlMnIzWWpSWWdiVzRQeE1iUGFMYUpPRnUvUlZTdFcxc0o0?=
 =?utf-8?B?ODg4dVBVN1RyclJ6S3JMbTQ2cno0SERNYjRvWjBrR1N4azdHdERDdW11YS9M?=
 =?utf-8?B?cDh0Q1lDSysva211bzdzMy8wTisyd3VXQmJKd0R6S2JZOHZTbUNMVW13dWJj?=
 =?utf-8?B?NkYraXhBRGpuSVJFYmo4TmtoRzczTFNvZHdrdzM0NXF5bHFuY3NQNXJaRzdH?=
 =?utf-8?B?UFVEb3M5UDJtQmVFd2RIMkFQVjVUd0Z4b29pZHVGK0R1cDF1M3lhckxmblZr?=
 =?utf-8?B?WHhQUFlNb1hIWWFOUHFUTFVjSU4rdm40d0hrVHhaNXpHVmhiRVhGSi9Bd1cy?=
 =?utf-8?B?UE43ZFlTcHRZNlNKZGtRcW9vYmVNUE9GQzVMMGgxMG42MWc4Y1BnTSs4K2Nk?=
 =?utf-8?B?ajRxdXdoV25vdEVZZGtJdmFJRnZ1S2MvMFJDOFY3Z3h5ZXc4ZWV6R0JiZmpa?=
 =?utf-8?B?K2xxY014TjBYc2VUVVg4VmkybjJqUVJITWVNbmxodjd4UThiVzB4ZndZVkg5?=
 =?utf-8?B?eXNtbHNIenpDdHh6NTJyMENEQ2RXMWJ3Q0FlVFEwa25hOEFROGE2blB6OENR?=
 =?utf-8?B?elFIRzRyNmJBdUV0U2pzVFJJWHVwL2RxcTF1L1NoTWxVK1JEVTNWMktBK1Nl?=
 =?utf-8?B?eWRJNmwxVHF2MmV6UWpWWWlmNlpJSHlpcXNxQVI3dldyclFxS29QOTQrZzMz?=
 =?utf-8?B?S3huUDJDTWVHcUhNU2V2N0EwdjBDUCtTWE1yQWxYL3JTZ3MycHFzUE5kenRq?=
 =?utf-8?B?YmVxa1hhSDMweTJXNWhMOUxLQjdYY3ZENEVCdEVOYzM5eGJVQk5OWXBMWjJC?=
 =?utf-8?B?clZkdEphbjVWRlljbVJ5bWtYaHcvN292dE1rbzlibWkwYjI0dHB2SWo1dWhJ?=
 =?utf-8?B?bkxDU2dmeGt5THlmNlBsbTQwSlJSREE2MkUxbmdlWjFzcGxoMFJ3bktwbUVX?=
 =?utf-8?Q?G8phk4zN0Cqn2C4s=3D?=
Content-ID: <A1597F992BE1CC4E9205B3813CA73FD0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0735237d-f4e0-48e7-f36e-08da16030f48
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 06:19:22.2873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hDXHDi05QIW8NDE0Z5fqewbfEMsHF4TiZHKoa0jI/OIdI65uHhEiStmHFH7V5EhA7zaO6Z+m3DDZ/ol8iEPvqAnB2Y5kNMTBtrCmKzlzE6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_231930_098037_C504310F 
X-CRM114-Status: GOOD (  14.65  )
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

On 4/1/22 23:01, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 09/03/22 04:42PM, Tudor Ambarus wrote:
>> Keep the SFDP definitions private and expose just the definitions that are
>> required by the core and manufacturer drivers.
> 
> I am not so sure about this. Since the post_bfpt hook passes in the bfpt
> table to flash drivers, they might end up wanting to use these for some
> checks like issi.c does for DWORD 1. They would have to move them back
> to sfdp.h for that, which just causes extra churn, and also puts some
> BFPT related defines in sfdp.h and some in sfdp.c.
> 

That's correct, but I think exposing just the public defines in sfdp.h is
the path to follow. We should keep private all the definitions that we can
private in sfdp.c and expose publicly in sfdp.h just the ones that are shared.
Flash collisions, and implicitly the need of public SFDP definitions, should be
an exception, so I expect sfdp.h to be short in size.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
