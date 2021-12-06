Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761C9C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 13:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93KZaK9d4DHFKTA0b1WuTf81ko/tIEqGsrY5UaJ+YeI=; b=osAu3A5+klj8aF
	JYOeXBeUlFc/GXGPuJVj63BNC5RSvDImniWV99tzY3+Y/2th+g1TtsUy1X/1cWM8M5NStkPYooMyE
	FCEebsauVCTqhK4rK1ugiscYjlnlQTx8fES2eNDkLdag2LiY8vF6eYFd8WwSvfOMk3HfOCuUGG0fM
	xTtzS9HA28Kw+41rUZHsg+v4Qdci7F7q+5Pm+z3L4DzuLk9CGGD5pO0+tMY1hEkenY2ONjTO/UKEk
	FS1CCpJgQ3CB4Yc6v1hHvaEIBUPkJ/+Qtq4ge+QtAQeJKMiopPZMSAQ6Ds3aBw9Ql+TQrVtXvs+8o
	AI7GW+JLocmEaBsCw6UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muEQj-0045yN-NC; Mon, 06 Dec 2021 13:53:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muEQa-0045vH-1y; Mon, 06 Dec 2021 13:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638798791; x=1670334791;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Fe/EZxnstYTdMQy71kK7YxXkxOw4dzd4G1xJzWCSDdU=;
 b=h87qWHw47gPzm43lrkw5A1djn9Nj6xbaW9hnUd9HBTCRm2WETtm0xxOc
 PXvESSckotVv/iHcebrC7B+GFRmplle0X28A6lkV0Xfj3wuPTd/tQgK/e
 VedvsG5knkVBdgjMibte0kH68cDrhYkWeNJUEuuCWczqZ6dc5RbdWbntE
 WESe/NjPMVSRq6zsyfEkjrS1eVGjzWLwjWW+Kmb/ASBIfVlFxRJqb0PwQ
 qC4s86rij52K6yZWNnzCGQhkKzV5c/lUQ5mwmPx5XzNPM23gKJAcARA/S
 vnRiY6ap2ijnswYUpJ9Z50sDk23C8ZMVQ/vn+JjN0O169XCZrnV1vi9hm w==;
IronPort-SDR: Pa3nOeunHZa3fg/MDLtArfj5zYqoPGu38KjCW3EZ3B8HnIjW2UwcIU1Iyt/EzPw2NGxLwKDZCZ
 /RmRTJqqmol0JcGtouyqHD70TMJa3ZEiKX5PsOQ85HNZq09TbGzRu/LpG0qdpXzsLHvI4C/SDr
 o9mC4a5svirckjicJ73CP2r08A3aLIsVAWW79X56YLky0YmTZrGJrUCay2g8G36P42M3mpnJRG
 hI2Y89avDAQBXEjBRCKdCkgEXwZVoXzFUNz0pFVu+OSZ4CgDR4a35zPKgLlrMuaOd1hhNdOLqJ
 ipnCIVll/oietPhsgSH00kbt
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; d="scan'208";a="78622840"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Dec 2021 06:53:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 6 Dec 2021 06:53:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Mon, 6 Dec 2021 06:53:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDut5BTn1jWDyfc0qv9MrRlj4xQKUkYNl1JEpzaLZT333z8T1hX2n0qwu2tGksFZ9TSKiUji5P2CeUlX1AX5wuj/TsXNrmVYPvkzr6pltxpCup1NSyXGYb5EqZV1v5f2REbYKimdou9ztq88PBX8BVaUipzagtyRanLzZR0us6jStu1nAcX9v/dDWMfJAOZFpUr1oCuPyCymYwc+iAZ3cpjy2uTjq9xi0OyI21O9ZTeJGFUQ58KTyv7URbsL06f8i6axFItTKaFxuPrvEut8S7SXYmPEFzg/FGtAVLO8A3PfxmXyoolIP8WxAv6VuuVstf3emRBfU8hc6RVRiu8cBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fe/EZxnstYTdMQy71kK7YxXkxOw4dzd4G1xJzWCSDdU=;
 b=KRnGJxcR4aEkRZXcL+67Mwwu44JqF/lLxUmlQP/Uum900Nu61AuiXDJVn7T0C4mGoxhAuWsmMzXWQjcKe+rOZcTOnTaaz1CCIWM1E9g3Le+JI18jwKoPwYP78sVVTJiZm9woStT1iENTGPxM21otCXIdKQzDQ9uGoPo9HqcG8suFYH1GZrrfMZ5siEv5UBhllYYVNswco+x2oW3W6aHqpU1g64KpaSbFfptaw6KEAEaPIZ6allvRixEypX4yKelhAAlGSPhVKA0hZWvP6HuaaVQkcxBhTz3gbDGeJtZOIRK4L6gKnGoSO2O8FY7h094z8JHtNvzHQD136ElS8s8JDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fe/EZxnstYTdMQy71kK7YxXkxOw4dzd4G1xJzWCSDdU=;
 b=XLBJc9u2c+RahMS1jVFYRzUP98kgnC38rsQdPpzrU/klIy1SHLzjxQEI21utMEHEfDhDCftQPUzNVNd+qARaQ0ytGAVU6Db19/wKfv44p0qPnZHwFdRYCqOo8SkbP7aQ5F45s8XrrOGdhvoJ/Y3RqiFrjgIwlu9l4Jd4a7dMq5U=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2879.namprd11.prod.outlook.com (2603:10b6:805:5c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 13:53:04 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:53:03 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v5 00/14] mtd: spi-nor: Clean params init
Thread-Topic: [PATCH v5 00/14] mtd: spi-nor: Clean params init
Thread-Index: AQHX6qiWM1Isd6H1DUidA2NZJ+SMCQ==
Date: Mon, 6 Dec 2021 13:53:03 +0000
Message-ID: <08e8064c-2802-3433-0bb1-01eacca663aa@microchip.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
 <20211206122532.5mhojts3ne55ppp6@ti.com>
In-Reply-To: <20211206122532.5mhojts3ne55ppp6@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33ebcd03-3d68-4938-f4f4-08d9b8bfb97d
x-ms-traffictypediagnostic: SN6PR11MB2879:EE_
x-microsoft-antispam-prvs: <SN6PR11MB2879A695ACDA2DDD0163301FF06D9@SN6PR11MB2879.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jRcDUmqHYYPRVcWoLOm8X6TzytZuClog5PuYh74A723wylaWSO6rr9xpTfaxQf9rpIUCnpfiTD8ngqRwwfeXbdcBDg7UrU8qt1XfgopBuey79LKxsIQwN+UOD/b6YY+Q/a3geFoDQfkWP54bdXxK55zhqiH22B/+dkqxeOVUIjpO9yF7h/gEkKRsR3lr46Uc3kC26abQEeww13R8TWVxGgqCj8ZrbWeDgbi5ix955WSbCe5R/eWbwMlq4y18QLW2xQ980nQE6NHKtRhU2H2vvjd+LZubF+qRJRANAdQvwDBpHrPBQwM0RP8BL6D2MG/AZ0Fk6rg0O5Cu5ZT/nwMvgclAKqumTyNezZ/QrCbnkc9YbyCRF6Q88hz2i8PwYsbPzsDyMcmvbUAPH4gclqBL3nQtweeGuswdYcApJoOozdBaJJZigvL8xg7mJ34lJuA3eEEX1o4B269V2/5ymys2buI1eoCgPpFqR7sXVKI9cOoImBObjBOHEmduu6Q+2j6aDIWjFCsMzydVG9d327D22bf8gf8sIbQyV1UTiC4YFXnJDZ1z1RoNrPuAF9nqShomaSgYy4pDXNg/UV0ORd+x8+i/3/HKFShDPjWUhJX/30N69YJXvFjQ80hjdnwHY5io60W9oXlVOdd3wKO1JOPm1AeGNi8eXr6B/W1Dqw8tCzeyaKJ9knkM3FJQxZtVKKD+aHbh4FMHLVXzGn8SVDXp654dEstf0QpeoGzx/11my8vmvDxlcxN8EqFC1WaR7mfrjpORAGDAGZ0guhTj9ghRKA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(122000001)(6506007)(4326008)(6486002)(71200400001)(5660300002)(26005)(4744005)(186003)(36756003)(6916009)(7416002)(31696002)(2616005)(53546011)(83380400001)(8676002)(31686004)(91956017)(66946007)(316002)(6512007)(66446008)(54906003)(66476007)(8936002)(64756008)(38070700005)(66556008)(86362001)(107886003)(508600001)(2906002)(76116006)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWhycXNHbGhvNW0ySFlzNW9UUnhoMW5kNjg2YUhwSWlOaFNXVkdKOWNZdytm?=
 =?utf-8?B?SFk4c3lxTDdmWjhUQlpjL3RWdml6alFlam9zZHVIT0g1bXlRYkwzc1dyTnIw?=
 =?utf-8?B?T0syYzU1eGVoaThKZWNET2pRZEQxclBQVktYa0d5RWRhYkRXdWxSQ0pVWkxI?=
 =?utf-8?B?NDVYN21vK0lTeExzbG54YXdrbUNNTjZoU24wdHlxOGF2eDBEd3k1cGVCTWtN?=
 =?utf-8?B?S0RYZ094anZWTXorMXUwand0NWZLdE1CMEZyaUpGUmFNRnRNRWY2cjE2Uzkr?=
 =?utf-8?B?ZzNKOG4zakxhVlFJTlluU3lpdHRPbHQ3bmVlYnVJVzZsNk9xTUdXUzNONFpK?=
 =?utf-8?B?NnZ5SHJwcUN4TCtSQ3BVeTRpTlJIWWJ2dSswVGFmaE9HVUZFUnQyeHZzRWJx?=
 =?utf-8?B?WDNHZ2VLb0dCdnZxbG40eVFKNThUa2h4WE9yR1QxQ1hlZ0o1MWhFZXIxeWZT?=
 =?utf-8?B?ZkFYYTZ0YkFTUzRJUnZiT2VmWTJVYlRQQmFxQXlhcG5CZjczN3JVZ1pRbjF0?=
 =?utf-8?B?bXBuTENEM09CMWN1RGhIaUFDbG96N2xZS2JXbXdUdXhMQTlkcHdiaXJWSmUw?=
 =?utf-8?B?ZCtTZGxuNjFTSWFlTU83MHFETEUwUngycFBkRkhEeGkvTTcxY3Zwd0dRQk5Q?=
 =?utf-8?B?UXdTNzl1b0grZGIzOWZFaGdYSFprRmZPTzVUSmtOSWx3QmxNRVB6Y2xHYXdv?=
 =?utf-8?B?OVZlclFEdFhIdVhwNDlLb2k5RVpqSzl1NHM1Q2dxZm1nSzJKVW9qTDJYRUpD?=
 =?utf-8?B?ekZUY3kyU2F0NXRoVnlhMkdNQVliTFRmTHBSZ3N2NTlsdEF5VVpzUDVJaG56?=
 =?utf-8?B?OGEva01BejUzRXZLVWZmU01FOHlRSjRiYzlaZVFMM2Y5YUdPSEhXcG1YeDBN?=
 =?utf-8?B?RFZtNVZsU2h2M2pLM05aUzArOVBmMWpkSDNaY1NRL1prakZsZHhMZUpDaEJa?=
 =?utf-8?B?NStDczF3RVlhcnVXRDN4ZlhwWjBVbkxYYWJtdzJYcmozNUVNTk1aQldVb3NI?=
 =?utf-8?B?VDRlQ1RxSUZkbDNvSHI3OG1UblU5dGtWajAxWWtvcXVzTGJnbUd5RGhzalpo?=
 =?utf-8?B?b3BDL1BOUGFRYmpYQVNtV29ndXBKMjkyVHhFL0JOd3dGN2xSN3l4RkcxellT?=
 =?utf-8?B?TFZoSWxXNkVTLzFGNzJoMzZvQjZzb0NSNDQrMEFlWHZEY2ZyVGhqU2ZnS2Rw?=
 =?utf-8?B?RWpTSjJSNGxQUWxha09LSzQ0bzBaNzJyb0xtVS94TCt2K0hDdENhVGl4Ky9t?=
 =?utf-8?B?TlRIKytvZnhoMk5aYTVobXFITHJEL3A2dzRvbmQ0c2JsVDk0M1dFcVRHR2FC?=
 =?utf-8?B?V3RKOGhvQUVRaGdWWDZzUmV4b3UzWVRLSHVhSzZtQ3NCejB6ZWZtVGN5MVBW?=
 =?utf-8?B?Wms2bUQyalVxbVZ3anp1cmpvVytqKzF5OGJrN1h2NFdud29UeVhDTWpqK0FR?=
 =?utf-8?B?K2wzc2F2dnNjLzNHOHBIa0VHSU4yMlRTeUFKSzR4SU94c2JSbGpXajliMjN5?=
 =?utf-8?B?UkM0UHF6d1NacWVWVjE0dy9BNUhFS1NDRVZ3NVBrTUhCSFhyNHRyYXZhNjVE?=
 =?utf-8?B?RUplamFlV1JobHdKKy9lakJ4aC90bVZ5d2dKR0ZNQ29SMnYvNUY5aEQ0V2I0?=
 =?utf-8?B?WjFnay9yM255bDJkd2U1QnkyL2t3M3J3UHFQdytjbis5ZlRMZTBBVU4vZHpR?=
 =?utf-8?B?VnhucDFSVGh2SHlsL0hVUU13TEFLQUFEaVhLZ3E1c09SdTV6MFVsZjRDNW1G?=
 =?utf-8?B?c0Y1RGxoN1Fwd3ZyUlNyRGc5cmthMk50ZHI4aVErQkVDNlpBbTQ1Qkt2NzhY?=
 =?utf-8?B?eEdpUjFYUmd5TjYvNmZRaDdBTGJZMVIzaVM3Y3I2TTNGRWFKc2UyMFhMVlZV?=
 =?utf-8?B?WEhsZlhrUzVZMHNWdEhyM1ViK3VEYlNzZythRTgvdWVYMzZCOG1IUmcvOGdD?=
 =?utf-8?B?UlJneklUWUEyMzhzbm5uUy9DbE9LVXYyRGdSK1E5YmlLOVh5TDB4S2J3WUpo?=
 =?utf-8?B?TlgyOVRKU3BWY0tQdUZVQ2g2MFk0TDBaUWZwZUdMYU1LVTNxZXdpZ3lHN3N6?=
 =?utf-8?B?Rmp3Tlp1RzJPQUxSdWNBVUF2eHZmZk0wMTJWcGpFSWNhZ1RXQmFuM05uQTVn?=
 =?utf-8?B?eDg5YjV5UFRidlJERmw2U0FQQWxqMEdPcENhTVl5OHVSTnF3N3pIaGxCR0tG?=
 =?utf-8?B?cDVrd1dDSkxJTC9Pc003NCtNS1dEYVJBWUdaOHpKckhHUU5sQmRmODJxWUx2?=
 =?utf-8?B?NTVyV1dhcU55b3FnZUlHNHE0M1J3PT0=?=
Content-ID: <51E194B41B56D241AB725692F50457B1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ebcd03-3d68-4938-f4f4-08d9b8bfb97d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 13:53:03.8595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4oq7NVm1Gh27su0Nax1eWYfEpKITsgSVB9pise+1IK1VgffYlUKizl1rLiUy/nVeLP4o5tX9gkQD764PYUUTnYVvV/m6xplEX1bISjl6YKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2879
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_055312_210063_88CA507F 
X-CRM114-Status: GOOD (  14.03  )
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

On 12/6/21 2:25 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,
> 
> On 03/12/21 04:22PM, Tudor Ambarus wrote:
>> Clean spi_nor_scan() and the flash parameters initialization code.
>> Reworked how the flags are handled for the flash_info entries.
>> Tested all the flashes from patch set.
>>
>> Changes in v5:
>> - new patch 0001-mtd-spi-nor-Fix-mtd-size-for-s3an-flashes.patch
>> - update comment from
>>   '[PATCH v4 02/13] mtd: spi-nor: Introduce spi_nor_set_mtd_info()',
>>   s/'No mtd_info fields are used up to this point.'/
>>     'No mtd_info fields should be used up to this point.'
>> - collect R-b tags
> 
> I only have a small nitpick with patch 9. The rest of the series looks
> good to me. Let's apply this soon so it can get a chance to cook in next
> for a few rc cycles.
> 

Will update patch 9. Thanks Pratyush!
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
