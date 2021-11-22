Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBC7C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 08:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+HNmVGg+fiOLWBcYLnvGDu/DvyFMl6GEv//kJyx0c9E=; b=AKy/Hxp58DkTMz
	x9xvW2nmDvelM0c/UZrBXBEnmilpl8sG4zFvjBwCqA+EPFBsQvEhdbN7XT2oIcjZll+s/pPgDaULO
	T6qHeIwQUbW7DTV61liq35p/hISFFzySTvHnrGtEjEXRE6ZMtGyjRyATNoR4seVxRibHkwUu4ILzU
	/iM3limqF30mro+xPsYlvWZ8utqVWsDxqk0X6sTK9qkS6u/t8tXPPFHVVrC/rpKimDQF7PkEf9CxR
	t6GvcsXOZkw3LFqbl3X1fIRGY8u7OtnO9IfX5/CE3xXSKGDLjCIb6JYuuPdW+CeNANnM2HwuJJZIn
	ooQn7I71JQdacdPeaJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp4r6-00FJt6-J3; Mon, 22 Nov 2021 08:39:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp4r2-00FJs6-NG; Mon, 22 Nov 2021 08:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637570352; x=1669106352;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=603kz+YJcoan2GGUEMaaWBLCuINZqo4yh9EkJ5fwbCw=;
 b=J54dViBSBoj1UcKCnoH4iuTmiEV6gHVpYyUuQFuWbQsxkZ1CxwsrD8T2
 HAbiY0puuhjqyjXsyzwYzcF1cce9zPmQ7tiwLaJkfX2NPHNzMvGDOiDid
 sGx8r0uL1fv84xJQONCJ5m0oJhq+eSwPD0YgY/aHo7iNzT8jNVa9xidhQ
 DwB6G/qfzooHBjWaKkwXh/oAnzi12M/dfO+WJovDq1lD0SG992l2OyC/w
 HCswQ7J+MLvnfLGKSopQkp7jONldkXyYAkU1v+4dkKbA8+suWoUNOngwX
 O4JS4E7IWVr7Q8MgXtzDLtCcVl9iCCJLPzLTjqlJN+ATkzBZsz/q6MwUS Q==;
IronPort-SDR: gRVCSLmSS6yATKF0R9HE6SjJbEZVm9iYysf4WXdz+h+b9IVotzZnJeibn/+1ykDynFwkjywAYe
 nlTvVNjZ1n/mi02QnQseznIFqTzK/5qNAFbHx/sDxtAD9nwn0J+VFEqTvWkH4OwqjXb/XfwAe8
 9beHv/8Raj2/SUFg9rkKL0guRReOpHQs4yb+JMrX3kTQKkv5dN+SJjCCBDxE02ldQ/B8AGcOln
 6blO2ZA+fA1amQxsxMVphJAMlf3p6CObAZ0KPz+nEI+meA5hWzLpf+H9RZZniCaDI4lw08eBQk
 7QNZudwcZrgzAUqTfYItFNWZ
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="137305875"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Nov 2021 01:39:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 01:39:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Mon, 22 Nov 2021 01:39:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fA1vbREZMWzvzmk4PVZp9dquZA2bB+4JwhSjO5f/7dTiZtQL6aopsDwQBF9BPfwH7s9HbyirJxdb3qjxwHcWugcFJNQFGeDjETO7QpbK/4ZjKmdJRCcJA5S23TP+xwVdSsQGqrCBsyPUoiQuIX3cmZn46hlR8EQSgDTmYy/YaIe9IPDmHbiTWp0T4cl3MHRgD7suglFZLesRQk30/xAxAaaTSdQ+8l23qX9P/qc7szKvf4SD3BoK2ofbVQmGd58vlCZz+6VQoogCHeWOAADbmw8NbjlsL8Qj8Qxi0nmFMUWSwb5Mo0FmOHE3uOgItHSzaDHXwTWJkPnqRzRBMSxMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=603kz+YJcoan2GGUEMaaWBLCuINZqo4yh9EkJ5fwbCw=;
 b=i/VZhdguQIEExDi2kdRPAt5LLhx65xdi/AKxoN972PPg9Efgx1GZjC/oiEtaH6r1/x8mcuFs9byZUeXm8o0kLqVXEOENQh7GUwcKt2tuu1JHHdJ2ENAZfGi1vq5AkHVWkPk6nf3mVzPHoFb56Gb3teY/+MSLDhYsqIIxva/zdiLjcLcB+0RN6gC0xlOC165bzrvOqGc3twfMlRJTdIKFo8yMW7eioSPF1mmtb2vZUXIuxvrubn9hrLmppeep8ON6pzAqogxlqYODDn1g7Ti5XaS6mlSARC6PgbKqf3QEXyDHc9hEX3P8zWZMbp3IZ/INPp88NzuFRg5Nq2rkxZjCyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=603kz+YJcoan2GGUEMaaWBLCuINZqo4yh9EkJ5fwbCw=;
 b=HG84gBB1TycyxSxtyLlviEeR57y9QiPHaD29oL1eoJHReDopNkbiMjgUZnNBPBisYS3PrsHyTc1PnvzW6JIJcJMLF434zUPI9TzQsG1nPCWw1e2bEQ27UFW9GjFatHqnQz6rtFIdDH72Xp/dcxJkgraNCxqo2Czc/Fsp6ix9U1k=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5083.namprd11.prod.outlook.com (2603:10b6:806:11b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 08:38:56 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4713.022; Mon, 22 Nov 2021
 08:38:56 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v3 03/25] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Thread-Topic: [PATCH v3 03/25] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Thread-Index: AQHX2vXYBbs1KEiK4kmqIPtsuumDOg==
Date: Mon, 22 Nov 2021 08:38:56 +0000
Message-ID: <7949e1c0-6756-8bed-75e5-29c76b4a61aa@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-4-tudor.ambarus@microchip.com>
 <20211115185227.4b4gjnf5zi5bdw56@ti.com>
 <f55d2c76-0265-b616-93fe-9b3db8f714bc@microchip.com>
 <20211116181137.ddo4tw3cafb4ozep@ti.com>
 <6a1d942c-f020-52c1-859f-39d1d84e93bd@microchip.com>
 <20211119182316.vkzjpkrkssmoftlo@ti.com>
In-Reply-To: <20211119182316.vkzjpkrkssmoftlo@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf014b9e-66aa-47fc-eded-08d9ad9385ae
x-ms-traffictypediagnostic: SA2PR11MB5083:
x-microsoft-antispam-prvs: <SA2PR11MB50831543E967FC53E479E407F09F9@SA2PR11MB5083.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ryKGrCM7tbMpf7oT5qk2LX2UD0Wlu84lHmggTkNA85e1nudBEQrwXA1OjAA/bAlVknQwBFOf3sKgA6Ri1zILXguyIPj2L9gwGtupA2DwsnDBTkHxvwwyDLrkZC7GFa6oWVjfkQnWTjp8rWQVESmM1j6Kt//Z91JomRYoEZw+5wRXd1GYenhed1F3MfgwDXJaIzROfSMRXvw+vL27rvdDmTWdH9LrEe/1/EW5U9hko2bO4CB0z3uYQVIlouyo3O5WLfypsTi5l6C83vSfsiizh/rQ38im4IciisND8TLvmAnGz6jo3uGHcr+xb+F9QZ5S4KqbQa1q1oxOw3lZr9k3fR0NFsvnAM7/h1eag9NlHp9ygo+bVnq3sWpBK4sxbAKMEAF1nMzSXIw1LoF9yWXWP/4MmRLy9roppIONV7OAaZ483YEeBM2OPpCQGxFrXTr8/QsJIlQIskkstWbNKfVzojWl08h1gzc5mwOcfzjaGn2AAtr1zZ//zYuS1M/giUfWnNUkGQp847EmxgSs5JMV1hkINLJB6rDJnSMBhV0SBSVPFolZ5MMOqvN/RUIccFgN95MAzQSD5wIGY9MBjl+uAz/avxTIPt8BdavHeC+oNOAcrqFKSdJdxqJEZf6yN8RiF2htmFYUoe4B92egVCtaWcLwNhr+lYkWQEbNol7umsC0jCVTWQAhTB7NHvln0wyiEKYfGdTbVKGl7VpYDkEoDrjtcQvTMNBFv2H4P7ewHoeYI4yiAodnvnZdY2LlUlGcHYSVBfbrG0/0duTX0h3//A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(8676002)(6506007)(6486002)(31686004)(2616005)(83380400001)(186003)(86362001)(53546011)(38070700005)(508600001)(31696002)(26005)(6916009)(5660300002)(38100700002)(66476007)(66946007)(4326008)(7416002)(36756003)(91956017)(76116006)(122000001)(66556008)(64756008)(66446008)(6512007)(54906003)(2906002)(8936002)(316002)(107886003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzRhekJFK1ozRSsreU5NNVAxYWk5Z3hwQ3hhaFhiaEw5VG9vbmJNVlB2YzVy?=
 =?utf-8?B?L0M0ZmVlZFRkMUQ1Rmkxd2QzYk9kY21yaHh1R2pJNGVXWlRZT2dGUno0YUZD?=
 =?utf-8?B?WU5LbkM0SGdTbDNkMkltL2tMWHdjTE12bDJDSk1zS2VEbklMMERDZml2MTN4?=
 =?utf-8?B?cExwelhxN0hMMjlDdXdGT0dkbEdENmV3ZXZ5di82RzFvV0drOHArcytHdi9s?=
 =?utf-8?B?QW1wa3MrTFFFYmkvblJSOGZNTi9tSTFYdW53QWVqZmthcUhNVGxTRWJaSUt2?=
 =?utf-8?B?Wm9wcDNBVkFDL2tUdy9rbVRXemtGNTRYOVJCM0ZsR1orOFV2V0N2VzZHMGto?=
 =?utf-8?B?aGNZTk5wWjBMemZ4WmM5c2hUVHdlTTJ6WmduTld5dHRHM3lsNkpSMnMxSEk1?=
 =?utf-8?B?eS9qbktUcFVySGRQSElSc2tPZWJPeVF6VEdheG5JWkFaODRLU2U0VDhlRXdD?=
 =?utf-8?B?dWpOb1EyMmJmRXpNN2ZwUGNxSlMraVBEaTVSVUgrdCszOHBmYTBoYVpzSEc5?=
 =?utf-8?B?eXpPRGVVTjlZUGEwQXJZTThqYmZoRmZuNWxtNWdJdVFsZzNDa2Z0cGVGUm1o?=
 =?utf-8?B?S2V0WE9oSHB5dTNOY3RBVXh0ZFNVZzJrZG5zdy93RVlja25yZVpLRHA4cHFN?=
 =?utf-8?B?dm9nUHNURlZpV0U1cU10T0ZINjZYWlAwQXhtZGl5dTJrSmJBVmYyUkhIOEhy?=
 =?utf-8?B?cE9xYWxsMHVwc0ZpeXZqL2U2YlE3dDV0Z285UTRvVTk2d3ByK284OFRyTlNT?=
 =?utf-8?B?ZXVKemRyUyt6dGdrcUpwK1FYSWpzOEhuOFFuRHlHejlYd2NwajlhZ0ttWGc2?=
 =?utf-8?B?WmpPM2thVk5XMEVhaGFwUERXd0xneWN2c2Z2cC9QZ0psVk5zcmhvNGw3bnpE?=
 =?utf-8?B?cWxmT1VYVks2b3dxWkg5bk8rKzZQZUNpWWs5dzF3VUpXNnFnc3NLSVpIM1J5?=
 =?utf-8?B?MGNGeE81WGhVakpVR3hMb1dCS1VXM3lYSitLa0R4NThBZU1POWp2SzIxK2Yr?=
 =?utf-8?B?SlJKZWlKc0NZejJYbUdQZ0RJbDFuaDdhQjJNMlJWQ28weVhva0hZQmZJcXJh?=
 =?utf-8?B?UVZGb0RGRUUzaFBabGN6L2ZZWk5jRldLeUFSaENjdElRK05GYjliRlJpWGZG?=
 =?utf-8?B?Unk2NEZLZExubkJRUklQUXlQYkl5d1NwNExmZUU5eG5Eakh3WHN6YVM5ZFk0?=
 =?utf-8?B?b2c2cDRiVjYxSEU0cDI4SDI1dVFQS3gwRUtrMzh5OHNzcm4rL0hLeCt0MmFC?=
 =?utf-8?B?K3AvMGhzWnkxZFRJMTRaNllNa0hqMHBRTHdnTGFsRDc3MVdRdm0rUmd0cnM4?=
 =?utf-8?B?cnVzR0lRQ3IzUVMzNG1BbEZWa2lzUnVmRGpNNFVNcjVrcGQ0bVFzZVBzY3Fm?=
 =?utf-8?B?elhyRkRDa1BwU0lwb0EvM1pGOGNScXpBeUhkQ1hiOTNmL3J1ZWora2M1Qmpn?=
 =?utf-8?B?N1RpQ3VuSkY5MnQyb0VEUWJPVEJPWHl6UnVOU1BycDNvTmJKYXlpQUt4eVlo?=
 =?utf-8?B?b1FBbkJZYitabG1lVCtSOHNXWXZDK3ZjV1dIVDhLd1VHcmd1SjB3REhGUHNI?=
 =?utf-8?B?SG5JWFhFeEthYzFXd1d2dXhlRk9VTC9DNWxwNjJxVzllamhkeEdEb0FUY213?=
 =?utf-8?B?THJ6QlMzN3NhVFd1S0VQQ1l6VW1ZbXpvbkgvMUg3MW56Z1JYMEZXSGxqVG5E?=
 =?utf-8?B?YXJOcHJYK25mUW1iWk42bUw0L2MzTHhYR0p5enM0bTJxS3NqQ2thbE5vVU9M?=
 =?utf-8?B?bFV1RTdVOTVobzkraExwK2YrZ0lNWWFINzVUYUV3N3M2ZnVRa09MdGhoakRF?=
 =?utf-8?B?V05XdXNwNmkxeW8yZDFQZmNINndhZDltMVM3NDlicXJCTmN1akRTRlBOeGt4?=
 =?utf-8?B?L1BmN0V0N2VrbGRlVEtkdGdWcGVvcmtkL1RNeGVSejY2azFPQlFWd0dJV2oz?=
 =?utf-8?B?ZmVBbGdhUlgxd0Faalh3Q29FTW9Ob0drWjR2Wk8rT1ZQenQvUDI0VUkzMlRL?=
 =?utf-8?B?UXRRaWlTOWpvbnNYZTVYL0Fra1p0T3dWd1Q2ZVo5aGhXL3RpZXhVc1k0NHhF?=
 =?utf-8?B?dzk1ZGdzWndNb01CQnFNRFZOb0lsem5oRlFrOHdFUXhyY3BZVzZhbmhJWGtz?=
 =?utf-8?B?bVZkLzlRRThRbmErMWFHR1R3TzBVV1Z5T3Bkb2F0WmpCVkhsK1hsMVFOS3J0?=
 =?utf-8?B?cVJiYmxsc2hTcVhRUkxNOWlDNk5VV1drdDErZGxEeXNlQ1V6a3hEVGh2bW5w?=
 =?utf-8?B?RFJRSzNIUS9WQXZHOXNaUFIvZjdnPT0=?=
Content-ID: <87F2A6DDA408984A9FCBB17B2942DEED@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf014b9e-66aa-47fc-eded-08d9ad9385ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2021 08:38:56.3490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TxxD1ZU15ZwWDPCQKJtILIxqlxN+x1bCc4nIL7hIE155Odgc5uqRyc59Ba7UjbbKD6cw6kvxww0n4sP+Z8uX0j2kaMVeDRe9UwOah6bPyxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_003912_933619_71CA1ECB 
X-CRM114-Status: GOOD (  28.01  )
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

Hi, Pratyush,

On 11/19/21 8:23 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 17/11/21 02:36PM, Tudor.Ambarus@microchip.com wrote:
>> On 11/16/21 8:11 PM, Pratyush Yadav wrote:
>>
>>>>
>>>>> - spi_nor_try_unlock_all(), which is called by spi_nor_init(). I don't
>>>>>   think it actually uses any values you initialize here but still worth
>>>>>   pointing out.
>>>>
>>>> we are safe here, the pointer to mtd is used just to get the pointer to
>>>> nor.
>>>
>>> Yeah, but who knows if that might change some time later. I would prefer
>>> we don't use a member we haven't initialized yet.
>>
>> If it weren't for the SPI NOR controller drivers that use
>> spi_nor_scan(), I would put the spi_nor_set_mtd_info() just
>> above the mtd_device_register(). It will indicate that no mtd_info
>> field is used up to that point, less things to worry about.
>> spi_nor_try_unlock_all() calls
>>       spi_nor_unlock(&nor->mtd, 0, nor->params->size);
>> I can't see for now if we will ever need some specific mtd_info
>> parameter. I would say that we won't, we're just unlocking the full
>> flash, every info we would need we can obtain from NOR. The discussion
>> would be different if it were about mtd partitions, but it isn't, we're
>> dealing with the entire flash.
>>
>> Would you accept the place where I put spi_nor_set_mtd_info() if I add
>> a comment before calling it? Something like:
>> /* No mtd_info fields are used up to this point. */
>> spi_nor_set_mtd_info();
> 
> I see that everything that spi_nor_set_mtd_info() needs is set by the
> time spi_nor_init_params() is finished. Everything after that is
> concerned about selecting the protocol and sending the init commands to
> the flash. So why can't you call it right after spi_nor_init_params()?

Because I would like to move it just above mtd_device_register() in the future.
If unlock_all() will need some mtd fields in the future, we can introduce a
spi_nor_prepare_mtd_for_unlock_all(). I don't want the mtd fields init to be
scattered through the SPI NOR core. They shouldn't be used in the NOR's
probe sequence of calls anyway, keeping them closer to mtd_device_register()
makes the code easier to grasp I think.

I will respin the series soon and wanted to let you know why I kept
spi_nor_set_mtd_info() where it is in this patch set.

Cheers,
ta

> That and updating spi_nor_spimem_check_op() and spi_nor_set_addr_width()
> to use nor->params->size instead of nor->mtd.size should do the trick.
> 
> I think that it is implied that mtd_info fields are not being used until
> they are initialized so I don't think the comment itself is of much use,
> but I don't care much about it either way.
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
