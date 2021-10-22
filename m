Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15365C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:43:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C69DB610A1
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C69DB610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RGWrbu5StJKBiJiUxsMJHUByde5eMNQhaIR72fxMr8=; b=JIYsmBQmses1SR
	EptVRo+r9wuZtdgyjz/1/xvgmQsNDu2Kos4dGCDxFDru2E8yPL3kR+iiL4yfSDberDUF1px+jkqLz
	aXNMy9+q7gaChNtmAIPTKd4yKKTcRWYURPIVnCstYppckeIJoOE2tJKTHCyPDO3eq4hhxjmQxvsBY
	j4ZaKYe2cxgLssu4bz74w6ZqIIDLRMhE5mc7Owyq1KHHd4QPAEdtcOfuJzLYgNyMhwBRYwRqMuBoG
	gB5a3Nn13TlZxYGxhDYJuFqYYzFAG3BH5vIqDCiePeBywhM9x0NFuqyq60RuBXjDjecL4bAq8s03O
	XxsAkG3N+99qOnTX2RyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtsV-00AvEz-VI; Fri, 22 Oct 2021 12:42:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtsQ-00AvCO-Hk; Fri, 22 Oct 2021 12:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1634906547; x=1666442547;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1d4fS8c/sujOujF6x/ksplo5r4BF/tJ6a3bCS5L7rIU=;
 b=vmOstmYeVaXl4yGQkAuTcMYMr4hCdhIxtaiMnjHbAes2UJ5LinFlXwSL
 t7M5fdeE+razSVIPRwhZY96sgN8VIN6LcM/g9ZbftkYArpYQIzYZRGlOJ
 R7rGagz1R+WqfS3eN2fdFK21VE/iHtCPaXbUuSXL1+Yf+lG9YwcMF5gjZ
 yG2S+VtyDIG2jbzBnXiBW5GSy87VouJ3fMHN4LbJBAqbmAVAf61bFDcBn
 fLhU10dn4dT3epmzXTpX/MXYe/J7K6myulmvQSjkzyfSwk1t3Qh6lqvCH
 bAOt/F7wjKvr+/kpi4WCILwse/xaLy8hlWlsOl/7u0FimyH5fpA0bhuzR w==;
IronPort-SDR: CtI2MMtqpJenk7IiJ5UWkiSJykSbu+dMANxxCWblOV/YqaoAXeYRuSgl9YSLiZyMyt85ZwF6vm
 Ipgt/vJypQ3BRo0uaKbPKfp+omhw0chQU4pp91C3vo7k3VM7WwW+wzFrgB5xrmIA7CC2XlHpaV
 5cm7yKhMaepPn69M5ivebsABD3oFGkk6FOtBiSrnmK84kLttQaFcHbr1fvVoGFbJqOV+GIpEAf
 v1huyTTYfKoOdBOIrCdBLl4OwOKdNwH1WMugueI4LsyRiAaXui0WNjSvPlG9ZfmbPu3ni+Cw/7
 wSxm50KQJqmO4JaOBtW8pamr
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="140744351"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Oct 2021 05:42:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 05:42:24 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 22 Oct 2021 05:42:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MobM6NZM1+3Q9/8AXErFSO1cNz2DjQAQ1dAOvy1hiutMvfjx7Ms5gyINdRewi6MTpbzOKu9ZJSB1DKCe5sTYFX4mroX9PHnI1sJkCr8ZVg/W+cnwcJmzgtnBc+s8l/Wa43QIV6zJhKvWpFDWABydJQuUW6J4OK0zdliWXvSv4acBZjaLeBMQFYhwJ27kV1ozo8juqTTAhwvMnPQfkVlBa6zG5zbnvMfgqKP3WXy7VvVoLZztfywEkAwtXabUFHREHCqJhaYCGkQ+JSIuAuLC9zkxtJ7Rvm2YG0Nr8nDiaueUEYSCSHrW9z3XM5DLfj0dbNWEeZNB96OvSaKCFAiAKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1d4fS8c/sujOujF6x/ksplo5r4BF/tJ6a3bCS5L7rIU=;
 b=AX5k3QNtnrQFtDq+lvVG0Aq2ZyRCTwsm+L1H/I9+DL4EmcwihbkBLG6+s0h1vpVyegloR9BESCf6+LiMZ/RtXpQRZW1EuQTDblPLd4THF5OpYLem3R94u1CBuzFFqDZb64PO6jzWARMmFr7j+p0ewfPUDArSEPgAnETTGQ2sfhAD29iOYWY2MXF2JGAvhjbxy3TtsUSegUlrXKedKZdqEYx6JP+01bIRlHU7s0+v6iDYF/+bOH1XpQluMfW9i2lm4G8+4RTuVNyKsAza7LkF96k6ssFFiYxwthqSRZc7Tzyac5A6wUHCSvFygfmkBWk4T52AgBxzvkvsb/24b9U8UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1d4fS8c/sujOujF6x/ksplo5r4BF/tJ6a3bCS5L7rIU=;
 b=urUd7ZAb9miW6Ml3eQJlWyViLDmMjMVK6VpX496hvqB5pHSWa2RAuNhJK4XMEzJlfc6Bz+sCdynF8HZ8PPRxRclH/Xai6bvxClxL5YvHDjP2hjUl4IwNdDuNlNNwN/wO7Im+SUwJzoBUfzqVTuRI3tcwPmWIJVn/9AS21QjsdRg=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3391.namprd11.prod.outlook.com (2603:10b6:805:bc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 12:42:18 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%6]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 12:42:18 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
Subject: Re: [PATCH v2 17/35] mtd: spi-nor: Introduce
 spi_nor_nonsfdp_flags_init()
Thread-Topic: [PATCH v2 17/35] mtd: spi-nor: Introduce
 spi_nor_nonsfdp_flags_init()
Thread-Index: AQHXx0I6UHICDZIL9kqtt57ceHbdbw==
Date: Fri, 22 Oct 2021 12:42:18 +0000
Message-ID: <eed6741d-cbb2-4f67-2780-6ba107eec0f8@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-18-tudor.ambarus@microchip.com>
 <20210817102429.kmhuef5hxumllxjj@ti.com>
 <4af8b3edebbe398dff1f8ef0bb98f2bc@walle.cc>
 <20211022121010.mzul7qsxi6s4ru2w@ti.com>
In-Reply-To: <20211022121010.mzul7qsxi6s4ru2w@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23562886-26f8-4dd6-880c-08d995596261
x-ms-traffictypediagnostic: SN6PR11MB3391:
x-microsoft-antispam-prvs: <SN6PR11MB33918ECCA5BD7638AED9C883F0809@SN6PR11MB3391.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i3ar0Zkk3CFcekXUtZsDy/uOqmMRrK2rnTAiYbtxac/Vt+qTjBCydUljkd6C/O74JNZbmJyNUTKZiSRdeXuVwIvDdctmaZbXXTJsXYjfXewtLVNDWKdl5NIiW7lg5s9YpdeOwT20VlJykTlnHT2pKnVHUYfchpU8iAM7LenSIiRZsGxabgSHKBVtPuJ9Zu0u7oa504eZcpJ97aj9I/xKGSkU2g8KJT23/39QQHXD42MSGSV3PjYWzYGhxIwDLuDqKezIZPwqB73nHEaBd3XC8/aodUyUvizS+JR3+dAht1imPTajSZezjVjgEf0jiRLM4YEYxgMb66jqHBOm2LaPdna3ZC/bvseJGIbENrj32RQh/KQZONsBJEjv+Uv9abBNeus1Bk+vtC7KSr7xWQ9qot2ldI7nzAPY5c22yu5EBlZhojPjNwQKXZbHr9D+tnXHod05CEGd/S7nhRMaFc+ALxovNdwVM/OKzjlL+2zbtKz99HILCRen+SK/y+zlk2pvVmMkYFGID8E/9uiZimh+OLDR7q//oziXWcJPQ4r/iCJ6Rb6YI/xLjFICF1HGmOeMwOQlenRoUo/euoXk3E4S/d4bpccSU5w9mAGP+OvQ2xb+e9i6AynhodY3F/zpWIa5WjzP5Z7q2feXxnY1JC3//PGpVTjuenn9DadHBybLfsscvHUJz17jlRGX3O0ktShxHXITUO5KtqdUJG0e/X9HLzNx+Ph/X3owv5O95TNScLmRfEjMTpaO5ECpWXrqxmneXhkZ+dtWPDGb8HKKQnXBNQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(110136005)(2906002)(107886003)(36756003)(76116006)(4326008)(186003)(508600001)(83380400001)(2616005)(31686004)(54906003)(71200400001)(8936002)(6512007)(6486002)(316002)(53546011)(66556008)(26005)(38070700005)(5660300002)(66476007)(7416002)(8676002)(66446008)(122000001)(64756008)(91956017)(38100700002)(6506007)(66946007)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3N1S2dYMEJBS0VZK1FiVkN1QXFiRWNhbENkNmpQaGFoa3pONkUrcUFmTlNn?=
 =?utf-8?B?ZXl4aVlZWlBBUXRTNjNQd1hPSmR3Z0IxS1ovZFFnL1ZEeTlpOEVZMHBvUXRR?=
 =?utf-8?B?VW4zVW5VM0RnSmJrVDZYSVdsUjNyaDRGM2c1VHJGalV4eTQ2Ynd5bkxYSTNp?=
 =?utf-8?B?aURHOU1DNlF5TFFIekFOZnlEOHV6a1NTdnFEekRLRnhJdFZoYmczbGFCYmVQ?=
 =?utf-8?B?MjhyL2VjMytNeENnQlNxQldCc3Nab3pMUjBlMDJpZnI4S1ZsNWxWejJVWE1T?=
 =?utf-8?B?d1ZzL05FMmh4TGFIUTZzdEd2cTNQeHdIbDdSTkxKRUNoMmRaRmtrcFp1bFBJ?=
 =?utf-8?B?RXBDU1hLWDE2ZDJSTlZOQlhqWVlSeDBZZmRicytPVFR2dXhFYjJNZUJtVXNk?=
 =?utf-8?B?Z1FteXozU045ZEN3VmZ6QkIwbFNDLzN3RUdZVWRkL1dwUXlNYlhPVVZOQjJD?=
 =?utf-8?B?T09wZytMY1lXTXBZSE43TGVqOW0rZ2U0Rk43T0dHS2JMRDJuaXFFS3lvc0pj?=
 =?utf-8?B?Z1lJYkx5OU8zemlCZm81UDFLVnNpTk5ZeitxQUd1TVBMOXhaNisveVRJLzVz?=
 =?utf-8?B?ZDRKQVhRYXNjTEJIc2NuS2N6dmJ6SjcxMGllYmMxRlUxdzgvc1VPSys0Zm45?=
 =?utf-8?B?Q0k0RWU2a2U5NGM3QTVIajJWUkdVV2ltcHpJbnBSWDd1R2d4TEZyUXllWllx?=
 =?utf-8?B?a3VJRldYK0lRYzEvMUZla3JPN2gzelBMMlQvcmp5NHJDbzM2UDcvK2lPYm1U?=
 =?utf-8?B?VXZaYTNVcUIzV1lkYm9uUHN2aGNEcXQ4enFPN0g5RlF5eGRRWnFLWE1hZEtX?=
 =?utf-8?B?dEp6YjQ5ZmFqOGF0bVMzZEUxWjVramM5cmYrd1pHNXljckUyNG9HcjNJMEp6?=
 =?utf-8?B?QUdvRnB1NXI0ZnV3TFhqQmVJRDVwQ0hUNDNBcHNsQlR3TmNDQWJ6NGJ0b1pQ?=
 =?utf-8?B?N0J6enNRUW9uZEdCbHFZQWFsNm1rY09yNDRUOGlFMlRlMGR2K3FLRnpIT244?=
 =?utf-8?B?NHU2NC8vZ3VyT0NvRUFtdE5XTWZKR0ZIVUZtNlJiOTkzY2dmT2ZHNmdNeTQw?=
 =?utf-8?B?NnRrTzM3L3lyOEVTampwTXdQWGZZNDJyZjFnUCtlSldYd21UUVJjckUxa010?=
 =?utf-8?B?QzlCU0NwWXlyUE9kNHN1bDhBMHd0cHZPUDJQUS9YZ01GQWVxTUM1MncxdEo2?=
 =?utf-8?B?R2tPQzZuQjZEUmVJS04wcjg2WXZKaFlrYUgyZmQxVnVoSFhyNkNYK0NMWHZB?=
 =?utf-8?B?c1BiRTFHUFBuNlRiN2VyK2RieUx6WFhCL0ZPRzhTb20vSDREd1BxWTRNbThs?=
 =?utf-8?B?SFMwK1lpNWdhNS9PeEc5ZC9XZWNpOHhLQ2hqQ1A5Q1RDZmFDRitOWjA4azdr?=
 =?utf-8?B?a1luTlVqZWRkOURPMldYTE1EbE1SU01WLzdPL3d6dEpqUnQvZUtEQWhFOVdt?=
 =?utf-8?B?b2lmOEpTQXFjc0x5bEZMaDIvYys4TWdiNkZNREY0bnZ6N3d1NkZ6ZEFwOTNv?=
 =?utf-8?B?V0xuamNvZTFDUmZIWjYwMXBVTnM4b2VRaGFNSnJPMlRpR0d0UEI1cU1WYjM3?=
 =?utf-8?B?cHZyNmZUVlJzaUhGcHBPQmt3TlB5M0pFclBseldmVFJrZmhVL0JoazUraUY2?=
 =?utf-8?B?c0xSZzdBZXZ5bGFyVEZjUHdDenhHVWN1Rnp6ZHdjbVBSays1a0dvalozNXFs?=
 =?utf-8?B?SXJFN2VrbnhzTUZlSUJyZm9SelpHWGNuc0xFV2E1SksyYlNpMEpyN0ltZ2lH?=
 =?utf-8?B?VGpqZExEYlBuV1B3UWlhWHc2QStkbjdXNjlhd0p4T2RpelFNaXNkSlh1SFIw?=
 =?utf-8?B?NDJkMThxRnlMNzJjSlZhaVRvWXRCM3ZRQXVlYk5FTGk5WW5vVnlHWlEwUmQx?=
 =?utf-8?B?ZFlQQkhqVGF5Wmt0cWZhZDFVa0t4UHduc1FEVWowd1VENkd3NEw3Z0FPVUhn?=
 =?utf-8?Q?TD6upyDZp0CiKBexDW9vrerGUw47aJlv?=
Content-ID: <203712CAD950DE488944820FD28B8E6E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23562886-26f8-4dd6-880c-08d995596261
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 12:42:18.3647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3391
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_054226_638211_DCDC2E63 
X-CRM114-Status: GOOD (  16.95  )
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
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/22/21 3:10 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 22/10/21 01:21PM, Michael Walle wrote:
>> Am 2021-08-17 12:24, schrieb Pratyush Yadav:
>>> On 27/07/21 07:52AM, Tudor Ambarus wrote:
>>>> Used to initialize the NOR flags for settings that are not defined
>>>> in the JESD216 SFDP standard, thus can not be retrieved when parsing
>>>> SFDP. No functional change.
>>>
>>> I am worried if the order in which these flags are set can cause some
>>> subtle bugs.
>>>
>>> I can see one instance of it with SNOR_F_HAS_LOCK.
>>> spi_nor_late_init_params() checks for SNOR_F_HAS_LOCK and if there are
>>> no locking ops specified, it sets the default locking ops. This works
>>> fine before this patch because the flag is set before the function is
>>> called. But now, the flag will be set _after_ the function is called,
>>> and so you will never be able to set the default flags.
>>
>> Maybe we should just forbid to look at the SNOR_F_ flags in these
>> functions. Instead the information could also be deduced by looking at
>> the SPI_NOR_ flags.

not true.

> 
> TBH I never quite understood why we have two sets of flags in the first
> place, when the SNOR_F* flags pretty much mirror what SPI_NOR* flags
> mean. Dunno...
> 
struct spi_nor { 
cut
        const struct flash_info *info;  
cut
}

const, which is the way it should be. Every flag that is discovered at SFDP
time will fill the SNOR_F correspondent, and only SNOR_F will be used across
the core driver.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
