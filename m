Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FDDC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  4 May 2022 07:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbHprZ5UQPXquKz8ef0pz6sUvk5ohy0nDWwkn7OppUk=; b=wlyepBlM85kIcw
	JVgd7WCwP2Yx6p9FJCJTKwwfZoYDGr0TibUahpveUZYodCdkNwN11o0BsrS0T1uMGlmTywX+rvKCT
	AiZeI3o1mhgCoq98NYrwcYKZy16SfsczKwp+AzvmoxrAB42CQ2MHlw0jJm1lbBAgCRPCeFwmOLtk4
	E5OBC5wZHt1Jss+b8Q46lYt/6VBi3h92ZtO6LyeMEj4DQwWos3bG37eR4bvHsrubSGH4Wkng9mLeS
	l3tnMX7p56anl6HVqNTje/bbhh8miq/eSxaz0JXJ++IJnwrs5fYvAEo03FGdlv9mB7oj98KtbK4qb
	dMok5qm6B5PTKLGlUXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm9jw-009Jb3-PB; Wed, 04 May 2022 07:48:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm9js-009JYY-BE
 for linux-mtd@lists.infradead.org; Wed, 04 May 2022 07:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651650481; x=1683186481;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7nt672jdH4o5hMoVk+OqER1sdCnqz8DcmK6yBXkPyEA=;
 b=ETLthfzXymU0NVLHwShcwNvKxvAQdSVf0TUqRzhayrtuRmrZwfWDuG2l
 dxcooTUf+fmfGpm4vGF8noUfUgrzwMF3GRgbdMtqhrevjaFGhmLAYDj9V
 eFkLbwVvjkXsnODZnPvlm22fw6+JJXWtVm0o5orqOyCrtW5wExz6dts9m
 Kje9k84W+euadM0wWD9GQrUmYONqdhYjtyl+NvARvvafl66JjaaG2eXqo
 3SOLX4aQJ0jd1KMLEvHLA84kmdb96wNedqV4rq1F9r7qn40vosxzFLGQu
 knnqmwBPiVircyPQOnSQmjDOCdyJefAMVu6wTe4IN1NigThaGnPZhMVTi A==;
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="162264280"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 May 2022 00:47:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 4 May 2022 00:47:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 4 May 2022 00:47:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpQCHFBAqfIFHI2Ev2YMGIQLW6v04hz7MzntSRlFG1+JqdW2429DsF0b1U7tkyNjIHyb8R27ulILrUIUjl2ttIvmhlDQOpAEC14JhM3ELkkA56DNjEM/zb2hMQ49ebyzjOVrW9CbuattmZiin8NXfBZyWIdm7Z/NYAk/OWDMd9vv1ahi6nbfizFecDIlMDoRqAbtbyhKpxikodQOo6ZlLliTXgqInOT5muVcNoSHil6qX16yp+/IEYefIjIJY8QhAMCM0LU+1WWyJA+0rMJbY7CTS5217Rb8aoq5I+e/q9hYQiQz3KGZPgDub29a5K8GBDUsVPflws+LE/Ls6fdYKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nt672jdH4o5hMoVk+OqER1sdCnqz8DcmK6yBXkPyEA=;
 b=eXhL60mbXl8QvgI97lhaWs2pccsVi4fjkK7piLY7xBPV81879HburAJtXZRiPRQ9UIvsxlsPL6+8vYaJNBTIcoA6K9NszKXNywJlVTI+wHawDBrKnXMn06/D4JrNhgSHbEVljHVYFosRHoQ5pgp4s9JQdoNwXhpA4BW8HFmY0HBIHmC+WdSApvq5/SKMO9MzbzDdj+L1D7tre69pWwgi9nQycRk2pqAIhDmt90aTVDB0V/v2WowhN/JhVNyIKnWFHALUh4dONRtkdyecV4U8+Hvi9Apylg2AIBhwbtnvg4nh36Z0zpMUD8PH9KKkSsKDJeja3HTMcaEu9T/I/XsbvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nt672jdH4o5hMoVk+OqER1sdCnqz8DcmK6yBXkPyEA=;
 b=Z/picAwW2yia1ikByPLLbxupgBcaYwtAsdoJ6ESBEqyRYq6pWeU6edDBR886UlFNb0xhPjSUkn3ILUi1a/Nalnm4ioHDtgfLlEJ00/as+vg00ioVg6bNsVetEOxuxElZJsb/Y1tdg8dB9Buv9CFLyZFaHBbJyXG0k+ysZ/YyPHM=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MN2PR11MB4240.namprd11.prod.outlook.com (2603:10b6:208:179::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 07:47:54 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::2447:4025:79e6:7c08]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::2447:4025:79e6:7c08%6]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 07:47:53 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v14 8/8] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Topic: [PATCH v14 8/8] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Index: AQHYX4tD9hez0w1h3kemGYn2+6gAjQ==
Date: Wed, 4 May 2022 07:47:53 +0000
Message-ID: <39161526-fc95-63fc-8b43-83c2e539ae36@microchip.com>
References: <20220503081627.341870-1-tudor.ambarus@microchip.com>
 <20220503081627.341870-9-tudor.ambarus@microchip.com>
 <6b343fd7-96f9-b2de-8eb3-196ddf91b93c@gmail.com>
In-Reply-To: <6b343fd7-96f9-b2de-8eb3-196ddf91b93c@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 301bf661-0719-45da-6b53-08da2da265a2
x-ms-traffictypediagnostic: MN2PR11MB4240:EE_
x-microsoft-antispam-prvs: <MN2PR11MB42409200C1580D4151E942CAF0C39@MN2PR11MB4240.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ywvpk1T3TC5p7MpKqHmE4XoWXrwZgAcEEBaV17vsqZ2uxguj8RbIuqnwHiU+mCGHgCkBIOpv9gGhGdevVu/pw/3iP1qSOrFIUOC2smXlGemBkG7aXdRdY6aH8JvZyfuuPKfrZGnw/hSHRBT3k38Fa056hCrHtkZ8ZrunVJ84u62SRyCXJ126DbhtsIkOi1jhrorSl5LY4zwoLeBccuPOx4biPZSJ5+H7qPX4fuPDKJxaFtlJDUJs8i/62BPN1NrK52nFJ8Z2jO3ZEIyYdFLAaDS6uxLRwmkM9MTqhbcJdFF63ICjrBd4gNxvX6/xJm/D23qs7FmXsclRuPeyWAO8ShlkbI2Ccpv6DebXe6rhqbyskLM3feKfYDt6hTvXmoKbYA9vQ6zvkYnYr74hd4JA5S7EnGg7S5c4814suU6DfrGZOLdF9VSViqo04R3WdHeAp8SqF1CQy+xBp/wwucjTpo5GxRHZcVzfXB31dbKevGj/vbW3w4iMJ+8EqK4bsU8MlzqGbM996FX6rb4jnhDPcoCfafyOOkPE3bAxobKwZ7AKFh75I5FooqOb3q+oeWD2nLsL/9sRMDlfYa1JnWEXi2CdcSjj6f4O5LGv6NqMTkd1rzxSWVN95+CR2O8+oMGMOCOZJfBAYBzRXWb+XL7pQ+p+bHmHVtb09uGg9nzpoYYHlYVRu5N+jA/KSK6bcqloa/Ec4BvmC/AFrd+rj8eoomo9C+dz95CMYJW1iV8AN64ODBeCorQCkMiFuQhp0dF8qDE6SU/Oa6eJ75MSJA8a+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(38070700005)(5660300002)(38100700002)(122000001)(4326008)(8676002)(31686004)(186003)(31696002)(71200400001)(6512007)(6506007)(53546011)(2616005)(26005)(508600001)(110136005)(6486002)(64756008)(76116006)(66556008)(66446008)(66476007)(66946007)(91956017)(36756003)(316002)(86362001)(2906002)(54906003)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWxqRDdmSHlSV2EyWWRnaUZOa1BzbTBpVi9ZS3A3RjNCNUFoZldDOWhLb3lM?=
 =?utf-8?B?RWtCODFLdXN1Z1JabmpNU2hnSklXZm93R1N3cGx2bXdOTkJzaWtvcjRpYTE2?=
 =?utf-8?B?NnJGdkN6S04yY20xVWNGU0Fad2hqcGpjWWU4MXFaMnZmZTd5SC93SEQzK2lk?=
 =?utf-8?B?d0s1am50SGlXTGp3Tk1qN3N5OHlmNkNSazV5RGdRTU9aWmMrVFFSQUwrZEFV?=
 =?utf-8?B?enh1aDlrU1R1RnZSbDZtNjdRcm5JT3dPYVBpd3lnV243eUFMTUxZZ0p3Z2RY?=
 =?utf-8?B?WGUvU3hCSjFXZUJLL0t5MytXRVZjRE5QK2Y2VnNUd0xYemNSQ3RBLzZCeUt2?=
 =?utf-8?B?d1U4djBtOU0yc2Vzbk9DdGpKcGJkK0dwZUNMeW15a0JuTStIVTV5d1R3Nmg3?=
 =?utf-8?B?RWtiYzZ6cFpQVS95SGRmWDBGQU9rOUVkRzhWeVRqRWNsRU5MR1FvdXFSbzRM?=
 =?utf-8?B?NHZDcXZBWjlSVnRaSFNUdkpJbFdEa3BWQks0dFQwa1FwUE5HdVE0TzZ1TVN3?=
 =?utf-8?B?ZXBsYWhQd1pXanhHV0d6NEY4Q1ZKTVN1WUExeThLazE3eU1FUXZ1ejJsbDBn?=
 =?utf-8?B?ZXFkVWJNUzdERjdVRGgrQzZjaHQ5SE5sR09Wd1J2djM0ZVhJSTdWZ0tBOCtQ?=
 =?utf-8?B?dHUyQnY3Rkd6bkNSTjUyQVlPVFJYamNWclA3OHNrWkRhczY1czZaVTlRWWlu?=
 =?utf-8?B?QThIRHlFWmQ3eGpNSTg0b1lYcnhvYW1XSy85N0RDSTJEQ1J3RFJzeTVTS3I2?=
 =?utf-8?B?TzA2dWVzVFpzcnh1bWdmVmtlNlh2UUt2RnZpUm1UWGNIWUxicFhwVk5LK0tw?=
 =?utf-8?B?N1BUQTFjaEhVRHk3RytVNzBRalByM0dwUGtpUzFZZ1EyS2JtMkNWaXZ4UUFV?=
 =?utf-8?B?b1AzNWRkNi85Sko4VTg2TmpKQ3dNMVYvQk9NRUJYVmEzNjlqdndLUnVGblBx?=
 =?utf-8?B?dUFKNGNWMFZlOENhSEZUbFQydDkzZzhVdDJEb2VVWEhGV2tDZ0sxTFZUc1VL?=
 =?utf-8?B?b3plaUk2UVVYTEFhWHgxQ3RNWUp6WGdDSUtXUDFLbFJPZHV1b1BPVEZkR0ZI?=
 =?utf-8?B?dEhZRk1xWHBCL3p2Si9CSE84OW1YRHVRUkxMVFRCamE4OGVIR2EwSjBmUldU?=
 =?utf-8?B?VEpvUmY3eDJTV2ZSU2V0aWMwcTJURlMvL3FyVE1MWGlTUjFQQlduazlkdHlN?=
 =?utf-8?B?SURwc0RzRk0yTFMxWTBCaG9QK3BSZlR5dlJNSExDS0N2NVpqT3gvaDZDZ1c4?=
 =?utf-8?B?Yzd0QUJhMXBXNS85bzl1ditHQ1Y1eW11WlJ6cG9kNk1sbVh3S1lXVDNnUnli?=
 =?utf-8?B?R1hadVg3ZG1uSnhFQStOTVluRm9HejhGT2RxamRSeWFaU3JsOGNBZytyaVhM?=
 =?utf-8?B?OVJIbHNTTHM5Uk02b2FYS2ZPUkYxZnhscXVsak9hSzIva1Q2OCtCTkhVZUNt?=
 =?utf-8?B?ZFg3L2puYlprZ3IwTTRlQmdFZGF6L3pYTGNINUFxcGU4VzRTL01rYXNKcktP?=
 =?utf-8?B?VE5LMGwyR0FzSVFudEZnZW5nL21UNnQzRkpNUjhOeUt0M2dDMS9wbk9OWWtr?=
 =?utf-8?B?dXJsSjFtTDVPbGdMWGxoVFBDdXlhRTNYeEYvUXRtUzd4UXkwYjNFQ0NFSXBO?=
 =?utf-8?B?UUFmbEJURXdyblpRMEdNZFc1MlY1NW5RcngraXNhRlFCY0p6cm9aVGZ1cHpU?=
 =?utf-8?B?aHdsZDRPQkJJTnhuYk9YekNNalVMNVNXNnFVdGc1ZlkyRnpDMFBya0lFcVZr?=
 =?utf-8?B?aXZsUXNRWjBwcW01dmpPRGtONDZQbEVvanhRMXhOWW91a3MzSUg0QkNjYmI1?=
 =?utf-8?B?MlA0dHZPTEs4NkphN3BWcEllZ1h6Y1pIR3Mxak9qbk4xbFZ2VzRZbDV0SE9v?=
 =?utf-8?B?aXk5b0FvZG85OG42WmxPMk9YekdjbWxlUHNFNDhyY1haL3JDZ3RPS2l2VU1V?=
 =?utf-8?B?Y1M5NU0vMVFFK0o3VGdzT2J0L3ZwVU12RkVKT1lCejc5cXE2QlZ0ZjV4Zkcr?=
 =?utf-8?B?L29YZjhQaExVekloam9wNUJmeXVIS09yWGFrT2pvZmxCbFQvelE2emFTZ0g4?=
 =?utf-8?B?OWhwMExBb2J6RjdYMWNUV0I2WDVhVFBDSExocHFiK2lmK0ZacWdkcXNCWGE5?=
 =?utf-8?B?NmwvVHN2Kzdxc2dHeGxEbEE2aEJqYXRLRXpCbjY3V1cyV1NmZFIvckJxL0FX?=
 =?utf-8?B?dTZzdGtPMDVReEpGZUxIU2hRaklndFpJUHlNemZ3T0JvRm8yVkE3VDVIYmVh?=
 =?utf-8?B?VXpZOENmUmVGZEJVemJ6eXdrNzZyeG0raWdrNkFaMTM1R0NucjltUXRVRDVO?=
 =?utf-8?B?UXpPK1loOU5vUlRzWFB0Ukp4NzRKOHNPVU54NGkvQjEwUTljS3QrdDdGa28y?=
 =?utf-8?Q?5E73Vh0iTFlWyGbo=3D?=
Content-ID: <76A67B6CCEF58142B2804D0830BA8553@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301bf661-0719-45da-6b53-08da2da265a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 07:47:53.8972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KmjG0vKL5f54IPu1rZ5Y9c3GeTxZsM14k/4ddAQPuNR1pKJIM1KdyIEDljdId/B/mVbRH+M2uFXN3C4PE3FBxhrXsjhmYT0BoapDUMVbb/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4240
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_004800_679172_50D0CE8D 
X-CRM114-Status: GOOD (  24.28  )
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

On 5/4/22 10:38, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,

Hi!

> 
> On 5/3/2022 5:16 PM, Tudor Ambarus wrote:
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
>>
>> These Infineon chips support volatile version of configuration registers
>> and it is recommended to update volatile registers in the field application
>> due to a risk of the non-volatile registers corruption by power interrupt.
>> Add support for volatile QE bit.
>>
>> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
>> uniform sector sizes are supported. This is due to missing or incorrect
>> entries in SMPT. Fixup for other sector sizes configurations will be
>> followed up as needed.
>>
>> Tested on Xilinx Zynq-7000 FPGA board.
>>
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/spansion.c | 125 +++++++++++++++++++++++++++++++++
>>  1 file changed, 125 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index e130f5398763..f78a15b985ea 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -14,6 +14,8 @@
>>  #define SPINOR_OP_CLSR               0x30    /* Clear status register 1 */
>>  #define SPINOR_OP_RD_ANY_REG                 0x65    /* Read any register */
>>  #define SPINOR_OP_WR_ANY_REG                 0x71    /* Write any register */
>> +#define SPINOR_REG_CYPRESS_CFR1V             0x00800002
>> +#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN     BIT(1)  /* Quad Enable */
>>  #define SPINOR_REG_CYPRESS_CFR2V             0x00800003
>>  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24        0xb
>>  #define SPINOR_REG_CYPRESS_CFR3V             0x00800004
>> @@ -113,6 +115,63 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
>>       return 0;
>>  }
>>
>> +/**
>> + * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
>> + *                                      register.
>> + * @nor:     pointer to a 'struct spi_nor'
>> + *
>> + * It is recommended to update volatile registers in the field application due
>> + * to a risk of the non-volatile registers corruption by power interrupt. This
>> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
>> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
>> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
>> + * also set during Flash power-up.
>> + *
>> + * Return: 0 on success, -errno otherwise.
>> + */
>> +static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>> +{
>> +     struct spi_mem_op op;
>> +     u8 cfr1v_written;
>> +     int ret;
>> +
>> +     op = (struct spi_mem_op)
>> +             CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_nbytes,
>> +                                       SPINOR_REG_CYPRESS_CFR1V,
>> +                                       nor->bouncebuf);
>> +
> The following lines are missing.
> 
>         ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
>         if (ret)
>                 return ret;

Sorry, I'll add them in the next version, seems that I handled the conflicts
badly :). Does it work with the read? Have you tested the patch set?

> 
>> +     if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
>> +             return 0;
>> +
>> +     /* Update the Quad Enable bit. */
>> +     nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
>> +     op = (struct spi_mem_op)
>> +             CYPRESS_NOR_WR_ANY_REG_OP(nor->params->addr_nbytes,
>> +                                       SPINOR_REG_CYPRESS_CFR1V, 1,
>> +                                       nor->bouncebuf);
>> +     ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
>> +     if (ret)
>> +             return ret;
>> +
>> +     cfr1v_written = nor->bouncebuf[0];
>> +
>> +     /* Read back and check it. */
>> +     op = (struct spi_mem_op)
>> +             CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_nbytes,
>> +                                       SPINOR_REG_CYPRESS_CFR1V,
>> +                                       nor->bouncebuf);
>> +     ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
>> +     if (ret)
>> +             return ret;
>> +
>> +     if (nor->bouncebuf[0] != cfr1v_written) {
>> +             dev_err(nor->dev, "CFR1: Read back test failed\n");
>> +             return -EIO;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
> Thanks,
> Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
