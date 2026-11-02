Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA28606A324
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2026 10:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GTK7U6mc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=selector1 header.b=QgePegkD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JLaKqK8YFuHqHZ+c3dtDmdGCylM84y2wcB9GqhCEzKE=; b=GTK7U6mcd0Ofo0UU3ceqRM4TXk
	q0Ei41yxcj3Psw/lB5KYkEBr/5wQNzrIGxCqJS+8Ex/37Phm8Jlcj0JKX2LtxgYxmuQaGK3CLUJth
	vFfecWcEeRgqOTZpW1vNSHFEav35ZDRBdcwTpUjughuXRAOGdp0ov54cmDghkkvUI/prRQO+xex7M
	5xsNMv3LyLxqh0eGgsgmFhOGbqLIMWTHuQlf+iCjisWku9apNiFOyPuJmtWW8VqZ9GoERfpWLacto
	67OZ0L0XLJHQxk0nS+CKIsN+UtFT28rVkTr6VYxFap8plLcYC3dg6TxzYcplVFxCiU7LCAL0dUMhs
	D8ZDFTwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpds-0000000GDvV-3vPV;
	Mon, 02 Nov 2026 10:51:56 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpdp-0000000GDuP-1UBQ
	for linux-mtd@lists.infradead.org;
	Mon, 02 Nov 2026 10:51:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vg/tXLn1ZFjitqAmrzyxIoBYXA4STWQPvIAVMOHdNEe0qXsfQXDI7gAsHtBZfbb/BbFURiTRWaWtPFBhwQHgG3krA3/5vLz3DiTYLZfptjFyZjZvz8NwDmgr+wsf6ewq9+KB+utlIVc1jo5F8fIXLrM87bBNjaixVfCbFf1IpiQY8dQXSlA7TSlnMaQ1VJDjPLoRh7hj3mPrtvdsWQvxP+fyde6Kp4n5R527wTH3hK034zlFNihfQfFZ5rYvKmuk9egVAmgq6oV9ireMknMejlbjIzgJQajQpELFrLEfTJsA5ZpmAngxvj+PrMdFiVOkke8/j9vvRzUX1sJgigPkuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfIRXtiamPvyk/g4mWkTtGgE8cnuldH/j478MLukakw=;
 b=UrC98J1IzUjHpEL58H8lS7Z+/imJYNsFDsMv+Oow+S94ogWGPKgvQq7KJ0uRoYUgmQoTBabD0wqywcRlOQjy3K+GFnja6+wi9Fy7UAuxYZ+Qxvnb48XlZ9By9aFlUU6wF85krTqbkm/t3bILT3E5Pb7vssAoJs1lUS4YMmAXevQ0Ej/TxyPzH5NzQhAQFwHQVGIithpLlb+jcMuZGy6OW4ezFXj0z6fwqGt6E3pzoTVmrwg9tedfLYBEP3pNGH/NVbC236wShTC4ueBfMt3JIXz0g967qJNwwg+HhUJz6RbL9A653tgofQsk1m3JNeK1EFZ8f4bTdL4cR9owOCH6VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfIRXtiamPvyk/g4mWkTtGgE8cnuldH/j478MLukakw=;
 b=QgePegkDBvAf6Ptrtq3sRs+ujkPJfdESM6F15VNh5O7IYmEqHPV34QiRP6XFpFEWK/wAQuiMPNnVsybv8woykda2WyRC4OCjfSvuDDiIiWdbo2ss9NbUheq9LfYGK7dvTvtdBTdW1VbiIrfGSGZ6GHTjrz30voYPU0ait1ZgnBjElkDzBUZMzh1GtnTh4E7Xlb1pypqj2luzABqKUn87PJj4HI5XGtnH79zjfwYxupgma/gY47uLdGECgN0gMJMEgljqMsHQfHUOPiILeR8X6CH6Jb6ReqFBFf317IH+qxmuSkFD8defERqNxfoNoI7rGgFC1G06A68M3321D2EjdA==
Received: from DS6PR11MB523643.namprd11.prod.outlook.com (2603:10b6:8:468::12)
 by PH0PR11MB7614.namprd11.prod.outlook.com (2603:10b6:510:28f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:51:46 +0000
Received: from DS6PR11MB523643.namprd11.prod.outlook.com
 ([fe80::1cc0:e019:a70b:f954]) by DS6PR11MB523643.namprd11.prod.outlook.com
 ([fe80::1cc0:e019:a70b:f954%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 10:51:45 +0000
From: <Manikandan.M@microchip.com>
To: <mwalle@kernel.org>, <sashiko-reviews@lists.linux.dev>,
	<pratyush@kernel.org>, <takahiro.kuwano@infineon.com>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<srini@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
	<arnd@arndb.de>, <pengpeng@iscas.ac.cn>, <gregkh@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v9 4/8] mtd: spi-nor: sfdp: expose the SFDP as a read-only
 NVMEM device
Thread-Topic: [PATCH v9 4/8] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
Thread-Index: AQHdXVql4Kqh32JHyEicX8VyYnR6M7cBjRuAgBjHJYCAADAMgIAAMUeA
Date: Mon, 2 Nov 2026 10:51:45 +0000
Message-ID: <bb688ade-338c-43f4-adbc-205d7ad3c0e9@microchip.com>
References: <cover.1792145382.git.manikandan.m@microchip.com>
 <889d6d5b7c608fd6553f38e4a34b050dcf70317f.1792145382.git.manikandan.m@microchip.com>
 <sashiko-outbox-175470@kernel.org>
 <ba131ca0-c659-419e-9ff7-26c7c6de1028@microchip.com>
 <DMKKB0CXCHFC.365E5XOS5BSE4@kernel.org>
In-Reply-To: <DMKKB0CXCHFC.365E5XOS5BSE4@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS6PR11MB523643:EE_|PH0PR11MB7614:EE_
x-ms-office365-filtering-correlation-id: 98f5220e-f966-408d-33cd-08df38cf49ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|921020|38070700021|11063799006|4143699003|56012099006|261009223027099003|261028144727099003|261021121427099003|261026140227099003|261022105027099003|261026121527099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: MbW/U2NcAPYsL73rMIoCLcYir5lDH1fVYO45Wx3KZEuBsgvY4SiW3YhIt+Q7vqVpLmlLIGaTTc8F+4HxtkJ30o2xZZ8lRCh19PH95Owc/CtkZuyw652GfxMcv8d8aBYKj8I/rjCI/p/47zYHOUch41EtH6zELmmKg3c3qBduApRnaiG20+O6CKcYTCpCEzH4b1pFO0F+W0GlIvvwv3LiNvagMT5sA449BO3Rs+YTyTSyQDDLumKAFzwhdvjoO7h2AmJMeCdU04RBD9Us+CZteIU9iAKCsel0YoejzacrQyGZmLOryt/CIRp0bRyG8973V/i7mtSCPMdlr6US8nXXbyPO64QL2aMJ1PFRl10hx13XYaYLstaYCk8UichX0JgZnzc0ki0KXO32zRbOOMMxRcT1GtMiYpmUEilePoNMziZpmRMmCZcLTcrcT2kdJnMd3vEWO331Vsn90ZsKlPDTYsL3fOFw80C7Zhr223DRAC0D+OQ1xwfSGOgQTXesw602RcK4O0DLoUua34BkmDd7LUCJePKiYrZnmBjRNdEfZk9/LLRm/R7fGQcdd0oZ03rc/t9CLjjYGldJKV7dFtoeFycIgk48LUItgzuEk1EpC9oq2Mb1bg5wdPlunabkzsfFr071OIiEFooEow92iC6muyVY3T1yLG/J615WQqfY445GfEyDOpDb7EWEhiWY502iLiNzF2a0hDwkOvnQqYzj58DhHpgaVDOsvz9dXz+qHBvcI0WdbCQnKwwanVVS8EvN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB523643.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(921020)(38070700021)(11063799006)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261026140227099003)(261022105027099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajhURHFTSXdOVlQ4OVIyRUcvWTNPQUpnYXBIU0VQQjhpb01Idi9vNm5MbnRU?=
 =?utf-8?B?UHpOdVJPMTByMncxNHpLOFZLZ0Qrc09yOW13MW1SZ2NWU3A3dVd6QTJWRWFP?=
 =?utf-8?B?N0xyTDBhTUtHRVdGY3d2OXdOa1c1VXZqeEpVMjJ3aEFsdDdvWTJXOUl4TUUz?=
 =?utf-8?B?d3FxWXpzaDBKL3A1bms5Qk85bXEySjlwZ2EvUXdTSTM4Ymc1Z3IzMlR1cXNj?=
 =?utf-8?B?dlRSNUpkblkyUlpTQmJDRmNWWi8rdEJ2OHIrakFSRnZqY04zb0FQZGdoV2FM?=
 =?utf-8?B?VllBWlZXcERhODdaN1N0U2FHd0ZITWw2WE5lNVQxRnFQQlIycS9wWURFbDVx?=
 =?utf-8?B?UWU2RERTOXJMSG5xM3ZHVVByQ1ZHVkk1SXdjLzBUYkhvemtUMEhWeFU4cGNL?=
 =?utf-8?B?SzVqOTdJN0FnTHVkOGQvaUJmbHBVajNkcWt4WHJvS0ZFNVRTNC9iL2RRT1lJ?=
 =?utf-8?B?ek5LZllKUkhncnN5L2dxOXI2VGQzWlRNdWZoOWZVbHQyWnlUWmRvbUkrZFZ4?=
 =?utf-8?B?QmJqVlpUWmtnUmxLWWdsU3lsZEJnYklLdTFHN0oranc3STljczI5MzF0THZJ?=
 =?utf-8?B?a0VTa21tSGxDOXB5a3BHVnk5L0wwNmpSSG5Kd2FyS0xBVnk4Nm90TWIyeEVZ?=
 =?utf-8?B?ZDh6NEFiOUNxNkxUWk1XbFFFV1FacmNmRGc5N3FhVmx0NmNSam1pZEFjQUI1?=
 =?utf-8?B?NDI1R3pDR0k1RGVaUWZZMklvMUhESEhydTVJL3NXVWdWUWJ0SWgyQ3d3eUI4?=
 =?utf-8?B?YjFVK3NRd0tzYVljd3Q4NTVyNzVzbHYvMFR5bTBIejRQUU13VnQrL0NPcG5B?=
 =?utf-8?B?L0trNDUvQ2xxN3Z2cVdoWVh5QXRoN0JvZUcreDExZEkybmVLM2JSd21GRXND?=
 =?utf-8?B?Qyt0UFlMVnFRQ081RGZnOTMyZlVKVjNNVkI4TmNpdVN3TEVjOVMvL2ZOSGhi?=
 =?utf-8?B?dkZobnpOaTMrQTNBZjJUb0RML1dScENoa3kzMUFabU5tM2NQQ0ovbVowNHZn?=
 =?utf-8?B?UVZYcjhhWXRVNkN6RmxkSDNCUlVZYnJZTUFZUlpVT05Lc1Rwc2EzbTFsQXJh?=
 =?utf-8?B?MjdWVVJDY0NNSG4wRG5SMlQxYk14VGVza0tIcVBybVpyL1k5RSt0T0JIQWEy?=
 =?utf-8?B?VzB0UWUvUGE4bHFyUWVEOE9rUUVXY1dzTUJaL2ZIbTRKZ1Z6ejZIZEtmbElL?=
 =?utf-8?B?QmNOcklNTG9BaGNQdmZrSlVqRFljMERVWCs0OHl4ZWZKMDZyNDZ6NUJHaklm?=
 =?utf-8?B?WnAwZHAwMkdoY2FiczdmdU1NVHVwRjBEUXJEckF6UXJUOUdXZ1dPWWZ6VkFF?=
 =?utf-8?B?SFVsTFdYVWtpWE02clB2ckpvY2xsTW1FMHNQaSt5a1FKRFVVQXUzNDMwZzQy?=
 =?utf-8?B?bVpBNlM1aGNzck1mWk1XZEJ5SWFJWDBmRzZYc2xPN0NnZnRtVUsxdmttUkdO?=
 =?utf-8?B?NU5FL0FFVVNpWlJpNHVyUHEvaU1ndXE3ZmxCRlVVSENYcDVlZ0pqR2tYQmYv?=
 =?utf-8?B?S1l1TktCd09CT2tKWit2RlJjVUhQanp3bmxZMFVNY3FVVy90STI5Q1lrZEsw?=
 =?utf-8?B?WkNHNzRLbTI3OWhSNkJ1bnlFdGlKVzFwQUVTam52Y2VZalhrdHN2dngzeEZT?=
 =?utf-8?B?TWYrNU1QOUlySzdZQUZyTm9aVXFoK2p1aUhtcjR2Wm01ZjQyTU1WaTFPOUhM?=
 =?utf-8?B?ekQralNES1ZudU9SdjkvM0o4K1JEOE5aNm12dTRZQjdVMTRWSWtHQ3dOU1JB?=
 =?utf-8?B?dzZQSzEwYk92RTN5K3BPT1ZST2N4aXpRRjlIQUpoS0JlSXBLcjNxWG0yaCtS?=
 =?utf-8?B?MFFSaXNSNTZvdTZDSHpKWlgzcitVMldoUllFZ2JiRlZhb1NwcUpYaDRnaXE4?=
 =?utf-8?B?aTdINW94cm5Cc2oxZUo2V3ExTjNOSVRlYXNFVHlEbXozVVo3RVUrTUpKWVNI?=
 =?utf-8?B?OTdwd2lDM09SMmszR3hMWTZkdC9aVzlKbW0vcHRzWER2TnRJKzU3WmxFWlRB?=
 =?utf-8?B?VjQ3RnpzYUExVGhFZDVZa3FpbVlrSkQrNmJHOHhWZ3dkNWoyekVVQkI1djdt?=
 =?utf-8?B?WXp5MTAxdmFXUGVnZnZVQjV1bjBydEd1NnhibFI1eWtjRW43YVVEbVpKK3RE?=
 =?utf-8?B?Q3Q3aEl2LzJZYWtZNlhRd1JOZDNVQ2p2akpucXpjczVkd1NHakN3YXJ0dG8w?=
 =?utf-8?B?S1E4dEZEM3Y4QU1sOHNMZGV0Nms1NjVpU3RPb3FPYkR5SkRwQldIemJObDNE?=
 =?utf-8?B?UWdzejJSMERiNjJCcDhQSEZJTVVWYjZuM3RQcFlYQ2QvdjJReUREc2czUkg4?=
 =?utf-8?B?d2plYllPczdabEVlSjBnQkZERmRabWRHeGFGWitZa3UvQ3RHcjBidz09?=
Content-ID: <6CD3A355A305404E9A1D23A4E75ED7DF@namprd11.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB523643.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f5220e-f966-408d-33cd-08df38cf49ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 10:51:45.4238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G2EA80n0kQq6ELZ6I/ADjGyzS8h9EdNuLsEMsbib3dVmEsFfhwcfbwJ97Vc3WxscdlOVRz51Em//Oc6VJgPk8jwp1at0N2XPyN6iTZQsih0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7614
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_025153_620641_3047B2BE 
X-CRM114-Status: GOOD (  22.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michael,

On 11/2/26 1:25 PM, Michael Walle wrote:
> On Mon Nov 2, 2026 at 6:03 AM CET, Manikandan.M wrote:
>>>> +static int spi_nor_register_sfdp_nvmem(struct spi_nor *nor)
>>>> +{
>>>> +     struct device *dev = nor->dev;
>>>> +     struct nvmem_config config = { };
>>>> +     struct nvmem_device *nvmem;
>>>> +     struct device_node *np;
>>>> +
>>>> +     if (!nor->sfdp)
>>>> +             return 0;
>>>> +
>>>> +     np = of_get_compatible_child(dev_of_node(dev), "jedec,sfdp");
>>>> +
>>>> +     config.dev = dev;
>>>> +     config.of_node = np;
>>>
>>> [Severity: High]
>>> If the jedec,sfdp child node is missing from the device tree, np will
>>> be NULL and assigned to config.of_node. Does this inadvertently trigger the
>>> NVMEM core's fallback behavior?
>>>
>>> Looking at nvmem_register() in drivers/nvmem/core.c, there is a fallback
>>> mechanism for missing nodes:
>>>
>>>       if (config->of_node)
>>>               nvmem->dev.of_node = of_node_get(config->of_node);
>>>       else
>>>               nvmem->dev.of_node = of_node_get(config->dev->of_node);
>>>
>>> If config.of_node is NULL, the SFDP NVMEM device will incorrectly inherit
>>> the SPI NOR flash's main device node.
>>>
>>> The NVMEM core then searches for an nvmem-layout child node and will
>>> find the layout intended for the main flash memory, attaching all NVMEM
>>> cells to the small SFDP NVMEM device and marking the layout node populated.
>>>
>>> Later, when the MTD subsystem registers the primary NVMEM device for the
>>> actual flash contents, it will skip the layout node because it is already
>>> marked populated.
>>>
>>> Could any consumer attempting to read an NVMEM cell then be misdirected
>>> to the small SFDP NVMEM device's read callback instead of the main flash,
>>> resulting in -EINVAL bounds check errors or corrupted data?
>>
>> Yes, this is a valid issue. With no "jedec,sfdp" node, nvmem_register()
>> falls back to the flash's own node, so the SFDP NVMEM device would claim
>> an "nvmem-layout" meant for the whole flash.
>>
>> Michael,
>> this comes from dropping the "if (!np) return 0;" check in v9. I'll
>> bring it back in v10: without a "jedec,sfdp" node there is nowhere to
>> describe SFDP cells, so the SFDP NVMEM device would have no consumers,
> 
> There is no DT user, yes. But there is then a "sfdpN" file in sysfs
> which can be used from user space. And that's what my first remark
> was about. Why would that only exist if there is a "jedec,sfdp"
> child in the device tree.
Agreed, I missed the sysfs user, I'll keep registering the device 
without a "jedec,sfdp" node in v10, as in v9.

The case Sashiko reported comes from the of_node fallback in 
nvmem_register() rather than from this patch, a flag(new field) in 
struct nvmem_config to skip that fallback would fix, I'll leave it out 
of this series.
> 
>> while registering it can take over the flash's layout.
>> Do you have any other suggestions?
> 
> Probably tell nvmem to not attach it to any of_node?
> 
> -michael


-- 
Thanks and Regards,
Manikandan M.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
