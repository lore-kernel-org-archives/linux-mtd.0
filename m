Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70E8606A324
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2026 05:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bqtb/kuL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=selector1 header.b=gQY31u/p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HNlxNNlm0Yb0pkcj/fXbrhXgF+Ou8om5eS6JZFoS9Co=; b=Bqtb/kuL+W7A3ypLtb44XxZRwL
	S39j7sWvDNjHEl+5E6pYlgtObrYev5pN5r0degjwIdiDESOLeeVujyL7aEbq3wDFDQo43qY10mRNp
	YpXNC+adQ1M4VRIfCCt7AbBUYk1UaYTW6FDNYUGvujsP5AuWVtGcGFCaD2xinHST5gX8kpjj/D0ya
	wSBZwnund/9hhVx30A5vhcE8WN0D5lO8JLrEHmgbAgNasgYB9y58062MCNiF5lF/o5OID/0Rt1fQf
	iS1Xb9B7Y3/HCd91sgaHsF4p/qjwsI9hZD5e7kVJsZw6+Yx21i1MZ18nByIrmme/udnV3ZI0bejso
	JAV084fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkCj-0000000FXXr-2A0N;
	Mon, 02 Nov 2026 05:03:33 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkCe-0000000FXXT-2GJe
	for linux-mtd@lists.infradead.org;
	Mon, 02 Nov 2026 05:03:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvhqJ7Uoj5MtEJEUMmwbfTdtRUZy3AWFWix7t2fTfXehifPzL/xws3weDgKur+FpZKD1S/AlWjqvlRXsVOFCOBMzwIvdRr4kKSPr+JS+POGjcQRSYpap93CkrLfZGi6tRp0luus8QDGV4uAK+xWEVhtWY75O7Zg+SUk8kz4T+TM/TJw80yKk21huZ0VaIW76stkNQYsq41Cm1QRluQagQ/T4YRalFf7MIrluoMt0x/RRjbdwrUb+kEJwKJkF9PSiUv2jZqyqxreV5tlkTO1jfhbQnWGLbKdj86gEz02l1UcpxErRo3qmO6HiAahwNdzv9ByDMFAz+1y71Hw5PD609Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYBKdNqyDAZZF47WXVb8lmAeXlZrbvPomd6LuzErdEM=;
 b=dS0N4y5fROexh0w+ODZZnqrZJBf1KwmXFKDhtbKk5DrGjpowNq7QV2zTB+uijisKZZ5en7UsSMx3a3ormTWCxsh8gpHZMbVkyffqGwclX5LX9T+mL/g2fHEw7pEdJlc31Y08IigYNO4tR8nmTs0U4ctL0jD6HepYbq/mZuy3jfoUz4B67yg3NpaRlqxeSPfnLB6Bm4F8NzJHoIWuzoJX9OwMCwDW2h1eS8ISeISynj7cFbgWR7iLF5WqIRKqvWszYH/j144OQ//otO5b3yz92n9/RaAXYWGab8u3gWsE2xl0rtVzGP2mJ1Pd02mSi/IZU8OTXYE2tvCFxL9K+bsx+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYBKdNqyDAZZF47WXVb8lmAeXlZrbvPomd6LuzErdEM=;
 b=gQY31u/pVagkamEqtS0y/WIJVIzqF30mNffSsdXcj4GWApZjbzb3bkdbpiwycVU8d4rxIUgbzl4RAcfZhlY4Qs8FYJsR9NhUoPRkM5+9hbZT8IEsYuO1ntHudqqIdiT5wuws1DT/f+mK0PFSrPVqpzSm8QWiIPGt1oOcSKlSSUan7pMJO5XqL88hrqpMBlsri7ja8Hrk5ojvEv+nDocyoBYhRMz/88hOHlh45Ajwk/s9v+tnT5+OahsfvQiPEh6qWfl9Eex3cyqlqVM9K75EwrjZNjiJUKsUdWbG91ibMuxsWxA1weQxIXMXkwDfiJIqJ7JyIJqiDoDX7lmjg9MQeg==
Received: from DS6PR11MB523643.namprd11.prod.outlook.com (2603:10b6:8:468::12)
 by EAYPR11MB115281.namprd11.prod.outlook.com (2603:10b6:303:2fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 05:03:22 +0000
Received: from DS6PR11MB523643.namprd11.prod.outlook.com
 ([fe80::1cc0:e019:a70b:f954]) by DS6PR11MB523643.namprd11.prod.outlook.com
 ([fe80::1cc0:e019:a70b:f954%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 05:03:22 +0000
From: <Manikandan.M@microchip.com>
To: <sashiko-reviews@lists.linux.dev>, <pratyush@kernel.org>,
	<mwalle@kernel.org>, <takahiro.kuwano@infineon.com>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<srini@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
	<arnd@arndb.de>, <pengpeng@iscas.ac.cn>, <gregkh@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v9 4/8] mtd: spi-nor: sfdp: expose the SFDP as a read-only
 NVMEM device
Thread-Topic: [PATCH v9 4/8] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
Thread-Index: AQHdXVql4Kqh32JHyEicX8VyYnR6M7cBjRuAgBjHJYA=
Date: Mon, 2 Nov 2026 05:03:21 +0000
Message-ID: <ba131ca0-c659-419e-9ff7-26c7c6de1028@microchip.com>
References: <cover.1792145382.git.manikandan.m@microchip.com>
 <889d6d5b7c608fd6553f38e4a34b050dcf70317f.1792145382.git.manikandan.m@microchip.com>
 <sashiko-outbox-175470@kernel.org>
In-Reply-To: <sashiko-outbox-175470@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS6PR11MB523643:EE_|EAYPR11MB115281:EE_
x-ms-office365-filtering-correlation-id: 99af80ff-1052-484f-b177-08df389e9e3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|921020|38070700021|260925022911599003|260925021311599003|260925021911599003|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: vuD+IGdZzCqW5sRukdQo6xKtwAx+cDu20PuMBziPcHGyMO0OWrSTz458dpi0CaSIhkqSTtIbFOcXg3EZLF52ThwOsRVv2l5lngI921rD7yP4ZqKScVRu/uJy+un+arHA4Z0eFAl7Zjbmd5c+nU/0vLV2SSzRZudXMsuAPYz72dNZmhyDLKDu68w3psjJ9T/8ev6bl556w+xWFO6TJmRsQr8zWerd91wshX5eiK8B8NZEXogHxUQKjbidZy/f+wbHXWp+JBhK5oH79Iw5qDe0Xmqrz7XCwRV9X9URe4S1cONzjFY8M1RUC0BU6IB7fLLv/ygxXf68ZMhPiK/xkLhQ6C0Aqk5nmgKx90VtiO4dGGLGtXfHwpsfTMuPyy/P8RKboKfVORGXkJTFvw5UsyukTBSyepVMZQUT8kggNsHrmBOUgZv0THUOG+E/XYnwFQbhMFv8R7Fd27FZkL1MRg1GMJ0VnluzCQe5stQfeDzKxu7tJ406gOfSjsed+HhRAMQNTJlv9Kwm/nclTY4Rv2Uc0amE84KAotQaU9dH/pwlkzLJOAchygwkrCmlExp/P3p2JOtuNS4MyDYYk6BXH2Ike5PrbXf/NBW0oukBq4Jn43a9ujwgxeXnuSVj3vgFZs6rXbuOyehf3uqkUpIry0e7wBnGdCrClbSloaRwfMN771TyI8ad6Bn2cAPUkahtK+Uv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB523643.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(921020)(38070700021)(260925022911599003)(260925021311599003)(260925021911599003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SExiN285RWYwZ21LR1NxS0Q3cmdZUDNoZVBEekx6bURzOG1ZMmphS1h4TVYy?=
 =?utf-8?B?ZUd5dHV6bC9EeWxFdjBnbHNnZW1MODFWeDU2OVNueng0TVl3NkE1RTFOK2ha?=
 =?utf-8?B?enR0eDI5RDBpUG1OYzFHZ3pBVkhOWXdsYm01SVM0dXVEazF0MHNxZDNpR2dn?=
 =?utf-8?B?QmdvS0M2WUhBQjhKWmNrTTdkOFZva3g1S3VKa0E2NlYrTVZJb29LRnhYNjla?=
 =?utf-8?B?eCs3NXZ1Y0lwNXRTZzcrVS9MczV1OS8wS09rUXgxTFNRbkZaUXVPQnk2dTN4?=
 =?utf-8?B?ZHExREV4RkdTRGl1UDdYYS9aeXNJM1VkSnk5N2VYM2tHbnJoa0RUMXNXMGJl?=
 =?utf-8?B?Y1VhZG11QVNMcldjclhtbU9Xekt4YWwrOGhqU0dEODBySXdtRndDUkx4SEt3?=
 =?utf-8?B?TEF5WlFFRGN4TU1qRGtHNG1JQVVpS09OekJBNjBwcXErTkNucFJUZzNQYzlE?=
 =?utf-8?B?b2x3VVJjaTZ5OVdiWkI3UmpWbVpBZExHaVhMdlVuRTUyZ0NpamdHd1RuQS9V?=
 =?utf-8?B?T0t2VjBUcnFmUWRYUHNFM0YrQytlU3NuZWhyR2R5L2hvTk9JK0NmalFhVStE?=
 =?utf-8?B?UXdrOEVWdGpsSVVEcDRTOUNMKzliNExFZUNic1luV0tmay9rT2lLR1VkREg3?=
 =?utf-8?B?OGFBSlNsL0NlamJRU0tFZ2l3dGkyeFpMc3NxR2c4MnV6MzFSK2Vta3RRSnAx?=
 =?utf-8?B?K1prd2FJdmFoZWdZUWR4UStmbUhzZ3NhNk1seGtUWUVkNW9CUFVJR2hLZGp1?=
 =?utf-8?B?VVRmaS9oTWRnMjNPMm42em53WEl3NkhiTVRpNzZ3UlNXZVpjWmZuZ1VqSGZa?=
 =?utf-8?B?Wk1HUzVremRtQ2FQb1FoU3Rtb0JhTVU5Yk1scndhUEFhL3djNXM3OURMVWwx?=
 =?utf-8?B?SGk4cVNLQVJVQUtOV1lDaG9UWTdHTWI3WjZlRlhKK2d6cnV6Sm43T0NZTVVK?=
 =?utf-8?B?bmRpYjE2RGkveWdLeUFuYk5qUHcwQklmY3JtenRidGtpdEd1Tnhqc1drOG9Z?=
 =?utf-8?B?b20zTTR4em5xNGRxK3Zlam0reGJPdUNEZi95ZlRGSmZsMXIrOVk2SUM0TlJT?=
 =?utf-8?B?VjlkL3ZKdXFuR3VMbjFyYjczSjhoYnZFa0d5QVd5Y2ZBM1RsR1d1L1QrcFU3?=
 =?utf-8?B?V3E1cGVXMmNOblN5bmkzNEtTazg1SC9OaktTUnZJVmpRZCsreko5ODZkSjhO?=
 =?utf-8?B?R3h6VVF1OXNnc1hJc2FiUEpwQzZrRTVWeGtXaHh2L1FzN1Q4TS9rYzgySWox?=
 =?utf-8?B?Vmt2eGFMV3RiNm1EVisrZHdhLzFCcjVUN21HRndibHQ4ZmI3Zm1wNzFQK1A4?=
 =?utf-8?B?ejVTdGxZTk8wVzE1S2lReGlGbTc4N1RzVURPRGxxczB3Z2pGanVaVExxVmpa?=
 =?utf-8?B?bENnVzh3YVRac1Q1V3A2WWU3M3BlK3AyeWJ6M2lHdGlMeWZJUnZLS0pyU2Mr?=
 =?utf-8?B?UW15c2poeGlta2lQUVIxL0tETGwzSHhTTjdwWXdNNmZaWS9BYTlDblp3RnJk?=
 =?utf-8?B?TDYrWGQ0T3UvU0RrZHZJRzdzeDRxT1N4NTgvaUpqcURqOG84ajBMLzVKb01H?=
 =?utf-8?B?ZUdGSGxnWHBnSUE0NG9ReFZIcnk2dFgzK2ZNYUp1b1NZWEE1a2ljekw0YjVy?=
 =?utf-8?B?L3RlN3VUdUp5RUxOZlFIb0FQNk1wVU1KRTcvU1dqYndnTFVhQmFhSHdMajhv?=
 =?utf-8?B?ZU96SDVYSWovTGxDVGlGbkFsekVTRVg0MWVKbzVOWHgrVmN6VThOZFlLWGR2?=
 =?utf-8?B?dmxQaU5tY0pUd290MzJQdnNYWDN3WkdsSCsrTEVnQlpWVmFzMG00QlBzVjlx?=
 =?utf-8?B?bmpQcUZ4VXV4Y0JqTWdQb2tSTy95a2g4NDYwaTlOUmhtNld6czU1VHpwMUh2?=
 =?utf-8?B?MnhxdmFUb3ltM3FYeEJWSWwzUTlZN0RsVkNqYk1mOWw3SExvdkZIR2NBc3dQ?=
 =?utf-8?B?a1dVb1BVa3pxS25qM21JdUFrd29XR24rZG11SjgzTEFXc2dBTHdyQVkvMytJ?=
 =?utf-8?B?SkhLWlo2b1dveWpzRm5lU3QyazJnZG5rYm5vZERiamtmamkzYnN1UU5TQldO?=
 =?utf-8?B?bVF1ckc1eFFCM2QxNjROQjNmU1FPRWVhZmFyazQyQ2ROY2x5MUtYN084MHZ4?=
 =?utf-8?B?R1plaWNjMkJjdVZubnZ5dnp3OUVzbTB2N25MeEt0RUtLRVcyRTVQcElOcFlo?=
 =?utf-8?B?OXcrVWt4RFJERDBuQWNVNEh2b2dDOWgyN0hNTW1raFo0LzNYanNjTzBMdWVK?=
 =?utf-8?B?ZFAyVXA4UExqOVZHc3JuMS9NNFZoNmJoT2tuZXg2bjg4cy8xMlhXVGp1eUY5?=
 =?utf-8?B?VmhYVEQ5OWNKMTk3OUlhSCt2bVlySGRlbkh1WmtCUWRhaEpRcmJMZz09?=
Content-ID: <905D9321EAB0234BBF5268ECBD32F61A@namprd11.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB523643.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99af80ff-1052-484f-b177-08df389e9e3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 05:03:21.9931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HzzVBXV7elwDHVoVbRyhrGnmevSi+gP2i6mqr4WfcyH0aiECNEsX1MTWtTdwdXjxwwgjuN1sOeIoSz+QCJL1YcMVFdxDybWGcyHC223J1Rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB115281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_210328_832389_95FA87D5 
X-CRM114-Status: GOOD (  25.96  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMTcvMjYgNDoxMCBQTSwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4gRVhU
RVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVz
cyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIg
Y29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShz
KSB0byBjb25zaWRlcjoNCj4gLSBbSGlnaF0gbXRkOiBzcGktbm9yOiBzZmRwOiBzdGVhbHMgcGFy
ZW50J3MgbnZtZW0tbGF5b3V0IHdoZW4gJ2plZGVjLHNmZHAnIG5vZGUgaXMgbWlzc2luZw0KPiAt
LQ0KPiANCj4gY29tbWl0IGU0MTExZmVhN2EzYzcwYjBiYjFmNWNkMTUzYTI1OWU0ZmRiNjJjOTMN
Cj4gQXV0aG9yOiBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hp
cC5jb20+DQo+IA0KPiBtdGQ6IHNwaS1ub3I6IHNmZHA6IGV4cG9zZSB0aGUgU0ZEUCBhcyBhIHJl
YWQtb25seSBOVk1FTSBkZXZpY2UNCj4gDQo+IFRoaXMgY29tbWl0IGV4cG9zZXMgdGhlIGNhY2hl
ZCBTRkRQIHRhYmxlIGFzIGEgcmVhZC1vbmx5IE5WTUVNIGRldmljZSwNCj4gcm9vdGVkIGF0IHRo
ZSBmbGFzaCdzIFNGRFAgY2hpbGQgbm9kZSBpZiBhdmFpbGFibGUuIFRoaXMgYWxsb3dzIGdlbmVy
aWMNCj4gYW5kIHZlbmRvciBOVk1FTSBjZWxscyB0byByZWZlcmVuY2UgU0ZEUCBkYXRhLg0KPiAN
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3IvY29yZS5jDQo+PiBpbmRleCA4YmMxMTdiNDZlMDI4Li5lZDQ3OGU0OGNhMTE2IDEw
MDY0NA0KPj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMNCj4+ICsrKyBiL2RyaXZl
cnMvbXRkL3NwaS1ub3IvY29yZS5jDQo+IA0KPiBbIC4uLiBdDQo+IA0KPj4gQEAgLTMwMDEsNiAr
MzAwMiw3MiBAQCBzdGF0aWMgdm9pZCBzcGlfbm9yX2luaXRfZml4dXBfZmxhZ3Moc3RydWN0IHNw
aV9ub3IgKm5vcikNCj4gDQo+IFsgLi4uIF0NCj4gDQo+PiArc3RhdGljIGludCBzcGlfbm9yX3Jl
Z2lzdGVyX3NmZHBfbnZtZW0oc3RydWN0IHNwaV9ub3IgKm5vcikNCj4+ICt7DQo+PiArICAgICBz
dHJ1Y3QgZGV2aWNlICpkZXYgPSBub3ItPmRldjsNCj4+ICsgICAgIHN0cnVjdCBudm1lbV9jb25m
aWcgY29uZmlnID0geyB9Ow0KPj4gKyAgICAgc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW07DQo+
PiArICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wOw0KPj4gKw0KPj4gKyAgICAgaWYgKCFub3It
PnNmZHApDQo+PiArICAgICAgICAgICAgIHJldHVybiAwOw0KPj4gKw0KPj4gKyAgICAgbnAgPSBv
Zl9nZXRfY29tcGF0aWJsZV9jaGlsZChkZXZfb2Zfbm9kZShkZXYpLCAiamVkZWMsc2ZkcCIpOw0K
Pj4gKw0KPj4gKyAgICAgY29uZmlnLmRldiA9IGRldjsNCj4+ICsgICAgIGNvbmZpZy5vZl9ub2Rl
ID0gbnA7DQo+IA0KPiBbU2V2ZXJpdHk6IEhpZ2hdDQo+IElmIHRoZSBqZWRlYyxzZmRwIGNoaWxk
IG5vZGUgaXMgbWlzc2luZyBmcm9tIHRoZSBkZXZpY2UgdHJlZSwgbnAgd2lsbA0KPiBiZSBOVUxM
IGFuZCBhc3NpZ25lZCB0byBjb25maWcub2Zfbm9kZS4gRG9lcyB0aGlzIGluYWR2ZXJ0ZW50bHkg
dHJpZ2dlciB0aGUNCj4gTlZNRU0gY29yZSdzIGZhbGxiYWNrIGJlaGF2aW9yPw0KPiANCj4gTG9v
a2luZyBhdCBudm1lbV9yZWdpc3RlcigpIGluIGRyaXZlcnMvbnZtZW0vY29yZS5jLCB0aGVyZSBp
cyBhIGZhbGxiYWNrDQo+IG1lY2hhbmlzbSBmb3IgbWlzc2luZyBub2RlczoNCj4gDQo+ICAgICAg
aWYgKGNvbmZpZy0+b2Zfbm9kZSkNCj4gICAgICAgICAgICAgIG52bWVtLT5kZXYub2Zfbm9kZSA9
IG9mX25vZGVfZ2V0KGNvbmZpZy0+b2Zfbm9kZSk7DQo+ICAgICAgZWxzZQ0KPiAgICAgICAgICAg
ICAgbnZtZW0tPmRldi5vZl9ub2RlID0gb2Zfbm9kZV9nZXQoY29uZmlnLT5kZXYtPm9mX25vZGUp
Ow0KPiANCj4gSWYgY29uZmlnLm9mX25vZGUgaXMgTlVMTCwgdGhlIFNGRFAgTlZNRU0gZGV2aWNl
IHdpbGwgaW5jb3JyZWN0bHkgaW5oZXJpdA0KPiB0aGUgU1BJIE5PUiBmbGFzaCdzIG1haW4gZGV2
aWNlIG5vZGUuDQo+IA0KPiBUaGUgTlZNRU0gY29yZSB0aGVuIHNlYXJjaGVzIGZvciBhbiBudm1l
bS1sYXlvdXQgY2hpbGQgbm9kZSBhbmQgd2lsbA0KPiBmaW5kIHRoZSBsYXlvdXQgaW50ZW5kZWQg
Zm9yIHRoZSBtYWluIGZsYXNoIG1lbW9yeSwgYXR0YWNoaW5nIGFsbCBOVk1FTQ0KPiBjZWxscyB0
byB0aGUgc21hbGwgU0ZEUCBOVk1FTSBkZXZpY2UgYW5kIG1hcmtpbmcgdGhlIGxheW91dCBub2Rl
IHBvcHVsYXRlZC4NCj4gDQo+IExhdGVyLCB3aGVuIHRoZSBNVEQgc3Vic3lzdGVtIHJlZ2lzdGVy
cyB0aGUgcHJpbWFyeSBOVk1FTSBkZXZpY2UgZm9yIHRoZQ0KPiBhY3R1YWwgZmxhc2ggY29udGVu
dHMsIGl0IHdpbGwgc2tpcCB0aGUgbGF5b3V0IG5vZGUgYmVjYXVzZSBpdCBpcyBhbHJlYWR5DQo+
IG1hcmtlZCBwb3B1bGF0ZWQuDQo+IA0KPiBDb3VsZCBhbnkgY29uc3VtZXIgYXR0ZW1wdGluZyB0
byByZWFkIGFuIE5WTUVNIGNlbGwgdGhlbiBiZSBtaXNkaXJlY3RlZA0KPiB0byB0aGUgc21hbGwg
U0ZEUCBOVk1FTSBkZXZpY2UncyByZWFkIGNhbGxiYWNrIGluc3RlYWQgb2YgdGhlIG1haW4gZmxh
c2gsDQo+IHJlc3VsdGluZyBpbiAtRUlOVkFMIGJvdW5kcyBjaGVjayBlcnJvcnMgb3IgY29ycnVw
dGVkIGRhdGE/DQoNClllcywgdGhpcyBpcyBhIHZhbGlkIGlzc3VlLiBXaXRoIG5vICJqZWRlYyxz
ZmRwIiBub2RlLCBudm1lbV9yZWdpc3RlcigpIA0KZmFsbHMgYmFjayB0byB0aGUgZmxhc2gncyBv
d24gbm9kZSwgc28gdGhlIFNGRFAgTlZNRU0gZGV2aWNlIHdvdWxkIGNsYWltIA0KYW4gIm52bWVt
LWxheW91dCIgbWVhbnQgZm9yIHRoZSB3aG9sZSBmbGFzaC4NCg0KTWljaGFlbCwNCnRoaXMgY29t
ZXMgZnJvbSBkcm9wcGluZyB0aGUgImlmICghbnApIHJldHVybiAwOyIgY2hlY2sgaW4gdjkuIEkn
bGwgDQpicmluZyBpdCBiYWNrIGluIHYxMDogd2l0aG91dCBhICJqZWRlYyxzZmRwIiBub2RlIHRo
ZXJlIGlzIG5vd2hlcmUgdG8gDQpkZXNjcmliZSBTRkRQIGNlbGxzLCBzbyB0aGUgU0ZEUCBOVk1F
TSBkZXZpY2Ugd291bGQgaGF2ZSBubyBjb25zdW1lcnMsIA0Kd2hpbGUgcmVnaXN0ZXJpbmcgaXQg
Y2FuIHRha2Ugb3ZlciB0aGUgZmxhc2gncyBsYXlvdXQuDQpEbyB5b3UgaGF2ZSBhbnkgb3RoZXIg
c3VnZ2VzdGlvbnM/DQoNCj4gDQo+PiArICAgICBjb25maWcubmFtZSA9ICJzZmRwIjsNCj4+ICsg
ICAgIGNvbmZpZy5pZCA9IE5WTUVNX0RFVklEX0FVVE87DQo+PiArICAgICBjb25maWcub3duZXIg
PSBUSElTX01PRFVMRTsNCj4gDQo+IFsgLi4uIF0NCj4gDQo+IC0tDQo+IFNhc2hpa28gQUkgcmV2
aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC9jb3Zlci4xNzkyMTQ1MzgyLmdp
dC5tYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT9wYXJ0PTQNCg0KDQotLSANClRoYW5rcyBhbmQg
UmVnYXJkcywNCk1hbmlrYW5kYW4gTS4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
