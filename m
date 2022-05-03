Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E5FC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 08:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dgNUT5fiBbq0RDQzaxrBiBD3qDULtwHQYkh3d7utPZg=; b=ZlANj0cPmHbhWf
	ySXxzvarPxIhMU9apZNfBbb/Z9vO/NwQlhOk0cZUON2hoZrdZk1wZJh4ZOtNuZ50ZQ+stYGTsbHc0
	KqUQfexNeILIVPClxK8inbceXOKCXRaX8VY8b6q8HewcwujjEF8SDCupqD4l735y7X1oI6NUh9Nww
	dbgsTOuFpYMlLu0g7874PZJfk2cU8suHMuzdGsgAc3YFuvtVgfH5lJDl0BBojr/CbN8TynAPtBFjO
	lnqXKcQ3g9eFqAli+7VMHhSUKjzE1yWGOPwMhZ15aszEgr+6tpOgneypo6UMxEfo83jUzuvcyjGi2
	5g6c6ij2bUb/PFN2YKdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlo0V-004e49-1E; Tue, 03 May 2022 08:35:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlo0R-004e3M-Ki
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 08:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651566939; x=1683102939;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NBCGB2f74rXC7twoGSOfqKHK1y+iAi04KwxY4ceTMdw=;
 b=sYvvEB5LdA3KYIuMkhl+Cmak0iAf9iVf0qbfsP94/w2OYDJOgdyOoWy9
 NcFnuk0gmL05LjyiKI1lMq2FT+x8vUEbNmHBv0hfzD7F59pyDJRKUB8ug
 L6++SGBdKlVdbmrdX/qnXTTFIpg2DD/PSslWc9oL7sMaMa/QNF8Jc55xK
 ZYmrH7lscSIycPz1xKIqZ+M9tsgB2Q4vFys2qO/FujGpFQl1nLHFAD87/
 9G2ZAAsedWKNuq7AG23u7ZA6/86/xioeqecBGN3as/RhMPWPX4kYYEmUT
 AOyFGcgJNZiczlIed0sVurKjH/1Nn390S+dPKg06hwCTZkGfNHly1kFJo Q==;
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="94357332"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 May 2022 01:35:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 3 May 2022 01:35:38 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 3 May 2022 01:35:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=facdG9ORbnW6GfBet4PW5DHBUo4kiVRrMU/Vks1ekRBc01MH4459nrUycCR0h0iz2B4LDactdLHMfiPOAIdop0Ffcw9FK5Nf9lBfQ7detjp7rNomfCsuzjMQpYMzc/lGg4TKG+asgMS+xJUqOEMuQ3RhsBCuZO/PaC2OhlzaRyx8MOqgKkEofvibVfPwNhh3jUEe6qxqMNa3k/j58xmw/cZ4G7FIELral1UbrLvqP1VJSYG/05ymhuTymloSnftw1Yss2KCONOSHo+99aBPd6XOJ9cBpPvDiCju7g9JIWgahRBaczeux4oSYJQTw1KvY1Omq4M/TaIYVwdblLRPbIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBCGB2f74rXC7twoGSOfqKHK1y+iAi04KwxY4ceTMdw=;
 b=HqzCui81ahGOQD0+Hr+Wao94V00ufNiGlhmMr3vB/yXbAN+L7cCa1pDMV5L+QJTLkjZ2vcRdShf3hZieTg3SqgdZpAEh0AcGDHs6/EiSTPLT7NMV/V4a28rnS0CFmjWBfraWa4jTeAu3weg8wdKvR4ErhNzRXHi/QlWTqFfS4REYV/G+RVnVM7NKVm/HW7aziXiDsj2nBx356urcd2XSRA27rbPfafQUZPENai2HZ1RFj/FUt9Tn0TWeShnMPhVkGdoKgwVpek+tESv12sILTpSnLsHu4GuzWXt6iZdPz9xNzup0vvRWK81wuOfBjjO3QulnPvEt47rkXPWV5phOqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBCGB2f74rXC7twoGSOfqKHK1y+iAi04KwxY4ceTMdw=;
 b=U0uHCyqXGY/xtL//TgMlLpfE+xjhQI3VE+gQvbPjxxOP9dzV3C4wZiwLfUByxAjYndWm9N5A7ikjuhWWcJGOgjb1gg2LbwTLVmaTIyzel/Cff56XL6038Pq+X2+onNjsoL97AjepwWhJHx+emot80/5e0pbybmbWU4vN4JUr9k0=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SJ0PR11MB5024.namprd11.prod.outlook.com (2603:10b6:a03:2dd::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 08:35:33 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::2447:4025:79e6:7c08]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::2447:4025:79e6:7c08%6]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 08:35:33 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v14 2/8] mtd: spi-nor: core: Shrink the storage size of
 the flash_info's addr_nbytes
Thread-Topic: [PATCH v14 2/8] mtd: spi-nor: core: Shrink the storage size of
 the flash_info's addr_nbytes
Thread-Index: AQHYXseuq3YSHHTCj06vQeNRyC7f8K0M0/KA
Date: Tue, 3 May 2022 08:35:33 +0000
Message-ID: <7fda96cc-1e81-4e1f-599c-b7979883d36e@microchip.com>
References: <20220503081627.341870-1-tudor.ambarus@microchip.com>
 <20220503081627.341870-3-tudor.ambarus@microchip.com>
 <b45a7071-ebe8-d910-32ad-bb5148a683ff@microchip.com>
In-Reply-To: <b45a7071-ebe8-d910-32ad-bb5148a683ff@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c3ccdd9-383e-4bb5-0fc4-08da2cdfe3a8
x-ms-traffictypediagnostic: SJ0PR11MB5024:EE_
x-microsoft-antispam-prvs: <SJ0PR11MB5024083E68B5574B0C0BC679F0C09@SJ0PR11MB5024.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fjIYCo+HapvRM0H6ES1ozFSE8tMWClBX+Cu7qBVIIKRcAbeQciia+O94RDHmeH9O5Yd2iGvCeZvaDLRMaRucKqi1lOM2I7xPRFDbsOPAxbY3+5nIVU+XH1GtE5S8A68AUkG7TISeASJSbIGRCgFKA2rQYaZ7yLP0orOHnqcqMGa+M8qKvMe2jMIhIcSH9h82E32QqlRsdmSCBTKfipyK+UGOolC2vIqkJmttxE6X7YBgfhqXLxrqKpKwrPfvuj/m3EXxC9fw7rFceLC2R3G50WpWVcLWCMo38fT+iKqa7dH2PBUkk95HPc6DHsouc6Vga4q6sjgwEe8+Iu2gBCRd9A/tXNOHYUlZkC4x0b65dlMfzbzXwYtEx/C5lTiK1RiCBKn+/v+QuMh5pPRoQZPZVhL8cz4n+mgbHD1lj/5pdwwfYsSFtUKVddg0mY3IOqR5ISW8XOWIPthhys2jz5adDXzH8gEG5F7CuxRw56dJDisavCrgMz3jVjiDlScAhVOiw20oZ4zSwl7MxBTFDgqJadMdYqvhcRDNl65/U1Y7biyd8IkwdoDFt1XDf3ygrR6P7S+3apMoJSEn/T4JmbEoA0w0je9VSF+c89weXTTRx/XD5k6wsV77YQk7Y6h8NbFOefvgXakh2lozSYPPNvZ+U4mMyx/TFCGd5zHouzeeWKURrtcmtkQb4+7mjI/0GjTO5wXWthamI9BCTarlb2xMviOPXFKXuqhKi+nb00OEcZMTRnmlukkNz14yiHa6K34ZNDSgkXgTH1n52OTAdH4mP+vTGiqZVMZeVd9itseGhj8y3RsAM3nto222DoDGzIHK9tLwLzi9Jnz19KXWMLRPIDooacXgealdEHZ5psZhIa4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(64756008)(66476007)(66446008)(66556008)(8676002)(6506007)(91956017)(76116006)(4326008)(2616005)(66946007)(122000001)(110136005)(316002)(31686004)(53546011)(54906003)(5660300002)(8936002)(2906002)(31696002)(508600001)(83380400001)(71200400001)(36756003)(186003)(26005)(6512007)(966005)(38100700002)(86362001)(38070700005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NE9BYUdVVjQ3TXRPUUZHSWJqMzR4UEpLWitmcnBjdlFLYm9TMUxHdm1DWXNC?=
 =?utf-8?B?MzI0TDVGU3EwTitIN0ZlR1VVM1gvcnpiL1Z2OWFxbENvSExtNm5XYjNHZjJ6?=
 =?utf-8?B?c1BiQW82RG9aL1VzSkVSejhYQkZ1WVYwaXdQb1M3VmFRL09sMWVwd1dtM2RG?=
 =?utf-8?B?K2RWcTVyamNidE9GcGw4VlFNWXAxQVR5ZmI0THBRM1dTS1VhcW1WNFM1MXdx?=
 =?utf-8?B?YVprSFFBblpjdmw2c1ZCUGlYYmpiYnRoZDhNb1cyRktvTUpQR1k5NGpRU1pZ?=
 =?utf-8?B?NUZ4Wlk5aWpnSHV6OTJHYUhNdGlvZDZ6VnY3NUV1Zm5iMStOVmtHSy9Fb25k?=
 =?utf-8?B?cGxTY3d1Z2ZtQkI2WVUvNks4Q0JsVVVPT1JXdFpCc1dLbjBhVmx1SHRiUWpp?=
 =?utf-8?B?Rkc5MCtVRUcvc2NDOCthaXR0UE5QUmJmMjJEbFJzSElxMWR1Z1pkMGdaSkRY?=
 =?utf-8?B?MHh4L3BUY1dYaC9rbXZUazFQUkwyL1c1OXM5YUFXcWF1ZEdKZmhqYWdWbzQz?=
 =?utf-8?B?QTk4Qk5GZTlNMkJJS1lZbGhENEc0Rmt3R0JGMXNKd0llNEliSTNwdW56ZGhG?=
 =?utf-8?B?RUVibHRJZktHYzVQL3RqdUFmcGFjVDhFL29Ib3RWYXBtR0VQR1VLS0NKNUdm?=
 =?utf-8?B?WElZYXJsSnoxMEJsa0Y5Q3lkSnlySEt5M1djM0lrd3JoNi9zaDZCa0lPUFU2?=
 =?utf-8?B?VnVRbGhCdzdMWGlGMDdyZXRPNzIzL2FFc0NsQ1R0L1BzSUZidU0xMFVqeUJZ?=
 =?utf-8?B?bHlkQ2lIdzR0ZWNCV1FudFNERk50NjE4VGJPTmtzUGVQU1N0eFcycmRqalZt?=
 =?utf-8?B?MllaTHVrZ0UwZDFwZHFjbjQ0RW1naHFlK1hQTVhUMVFDWStYWmxVeXU3M2hl?=
 =?utf-8?B?c1ZlaU9EblF1R3V6YTZwRFhONVNIUy82RUZPMmZZUHRJYUprUEhMYktjRDZ2?=
 =?utf-8?B?RU8yWElLaGJ0aUM4WVlld1k1K0ZGd1MwSUVBclBReU1aV1RUQzg0a2lzK0Yx?=
 =?utf-8?B?STAvTFNxckFSSWVveHJ3UlFobGw3Z0xNSi9tbStjVmJDOGNMZ0dWT3ExYXN5?=
 =?utf-8?B?L2xLYkpOa0RsSG5CeWw5bUR1d2hmV2JnUjRWZjMyZVNQT3ErWmRmelB6ZGh0?=
 =?utf-8?B?Qk1ldER4dFhoKzkzd3NLOTlSMFN0S2hQNDhBWEs5a3pqYThBRnR5V1NoRnBB?=
 =?utf-8?B?TGc1MVZjU1AzckV5QUR4dFZMKzJhRDlHdGliKytISXZhM0E1SVlTRFNBTDM5?=
 =?utf-8?B?UkJ2TDQrSDZ6S2RSVVYzV0NiT1NwbW9lV1hER0hWVmxSbGZENHlmRzl1dngz?=
 =?utf-8?B?L2VpaDU3YzZYRzRWbVRjV3BPS0dkWWZxZjNGSUZreTBxWXMzUE9ldXFaZVpD?=
 =?utf-8?B?QThGa2ZiV3B1U1p0WUxLSzZGUnlMTUlIY0tvSDBDNTR0WVZRdzBiWVdRK1dr?=
 =?utf-8?B?REJEVExob24rM3pNdkN1RU1DRVdNTTk2MG1sS3kwdGlsRC9qQ3p5NGcyYmI1?=
 =?utf-8?B?MWFQOFRmdlpPUkZWaDdlTjlPRHd1Z2F4OUprK2NvS2VOWHpqWjIxY21tQVpB?=
 =?utf-8?B?d2YzOVR1V1ZFcERoK3Nsb0RNazRFaUgrT1M1OTFDVGxEcW92VUZEL2hxQTM1?=
 =?utf-8?B?L1dIS2hXa0cxRmtTNXhJdlNiRWNNZTFhak1DcENYZEl6ai9FbW9odi9GQkRS?=
 =?utf-8?B?QkswQmlFWTF5dGsvNnNBcUQvdmNlbkFsODdaTWl0YURhVm9pc1RVTWNqcFo3?=
 =?utf-8?B?M0taV29jVUQ2aGQ0RDc4aHIrTjA2cFRLTVV2eGFDNVE3TEd5d2xGTnFXV3Ay?=
 =?utf-8?B?ZGR2Wkw3VkdyNFNXY1NQYUJzbHlta0Y3VzVYdjF1Vm41VDRqeVlzQThtUHF3?=
 =?utf-8?B?cHNFQlAySXlySzRBR3BrbU9WOU5UMHVvK21nN3BObzk4Z01PbExtK1kzdGhr?=
 =?utf-8?B?S0k0disyVEtTdXZGOUlvWWJVK3BFRWtIZTdRN2c2dW80WGYvYW0xZUtrTjdQ?=
 =?utf-8?B?N3FuMFdUMFV5VzVRa2hFV3NHSnRSaTR5b3U3S2huQ0FoV05UdkZYbFQ2YWFW?=
 =?utf-8?B?aGJPQjVNU2FydDFXZmVCZnhOZm9kSjN2cTRnZnBrVVU1YmhxK3k3Q2lWeDdt?=
 =?utf-8?B?bktidmdNMzczdUJOQndCZ2FPZDZrRXdUcHlYQ2pIRkREWk50Y2Jud3BUUk51?=
 =?utf-8?B?NC9MWUFFbzdVd0JyM05rbm1RVlJhQ0hrSkl6VXhGMEtOQ0dRWFdReGExQmc0?=
 =?utf-8?B?eWRuQUZUemZUMW5UNTJYVW9XZkNmT0had2krdWZRNThtK0xDNFE0dDFUWGVl?=
 =?utf-8?B?VWZnelVDaHI3UkwzUDVXNHVqRldNWXZwcVhqNmQ1QjhJYjZvU0pzVlQ5RFk2?=
 =?utf-8?Q?4qclchpnJQSeADno=3D?=
Content-ID: <BC5F48F5DC2038478B413761C93DCF22@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3ccdd9-383e-4bb5-0fc4-08da2cdfe3a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2022 08:35:33.4492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RRNp4McW4Pexe0ve+5ztxNdGFg2t8Nz2u+LNVqmE9MDKedgIhXPJJaPmB4BjiaV/TE1ebhDlAmWJZauzMzWae3VxLxiCqKusWB7QJ5vvg/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_013539_785962_655C078B 
X-CRM114-Status: GOOD (  19.28  )
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

On 5/3/22 11:27, Tudor.Ambarus@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 5/3/22 11:16, Tudor Ambarus wrote:
>> The maximum number of address bytes in SPI NOR is 4. Shrink the storage
>> size of the flash_info's addr_nbytes.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index 5fc3d4a8add1..fe7683fe1b4d 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -493,7 +493,7 @@ struct flash_info {
>>       unsigned sector_size;
>>       u16 n_sectors;
>>       u16 page_size;
>> -     u16 addr_nbytes;
>> +     u8 addr_nbytes;
> 
> I think we can remove the nor->info->addr_nbytes entirely if we choose
> to add late_init hooks instead for those couple of flashes that use it.
> This will shrink the size for the big array of patches that we have.

a/patches/flashes :) Also we should consider struct padding sooner or later.
> Opinions?
> 
> Thanks,
> ta
>>
>>       bool parse_sfdp;
>>       u16 flags;
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
