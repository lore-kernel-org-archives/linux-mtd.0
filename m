Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C048DC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 11:37:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93AEE60F6C
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 11:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93AEE60F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmDRd3Dl9UHakntKyAYf3tDONEPVaSzm9ZjnFNo1tHI=; b=eQWvSL+0SYEgva
	EpSvz/frSoJ1P/teYjD1XXuOpTklFIZyBb381f774ZQdDLT2IqYefZ0MmaRdAysFGbhVGhofwwT4u
	7kK50e4G5SqInyXm0r0k5Qsts9ce2qIL/PGR+SZAXPREKp/IuJlH70wQwLpq1XY1ky2cAjzUrqcle
	kbQWRVOOxZPm9vngcDa6+qFj67e90F5oyZRdFZpEuKfJPjF7Xpo4lzKRr5fYymIQfN9l/zWeVgxJH
	hWOw1dFDNqGNAJBR4RedJ2LjfEHegcwwHHeTMmJ60r3oL50XvA6pOghmJ4i9rcY+ZsqA8nWATXwUP
	7BsdoKNB3B4AqmzbIi2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXMH8-006EA3-6y; Mon, 04 Oct 2021 11:36:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXMGU-006DyU-Tv; Mon, 04 Oct 2021 11:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633347375; x=1664883375;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=B2s3YClEGQ4NhoyiyH6tQ6W3d+rUAgK7rEIs+JfYIPM=;
 b=WL/ABxLMFeKiK1jpNXTnBepmBUAe2ldDK5kdNaDcCwNu4dM/j0axyXam
 4iwLuDpM8pR10d3o//wS+JOMul8s0YFRvj3CeUe5ux9vH5M7DmQht6fuK
 St82MAo4a+tHFIPxG4t0hvFaG+5D23WZEe6qf418QVN9jDI75ZAxwvtaK
 aRSxvhSMB6xz6gzN5ilIbuPI4t6MiSEySRQTfrXDAxqR+ZGAfo9q7kfve
 RlbcTGHupVKpzXzIV+Fha+iYydwyPBYf+mjbYlU7pxFglrUbyQhdubKlg
 f87g1eMcLknWJF3EFpsTmRRV9vxtIbAn0mkyTV7HZAsUC2WfKLMZDvsYT w==;
IronPort-SDR: Ws+8dobwQQmGOJXL5f43gWT5L1yc9ZrmmOfNBsnaz62JnEmFD76pkKjJLfqYgXRuLhTUc5CCwM
 V4lHzdVszuQeXLrMwkVdMJeDQ19BIg26gKuutGI6Mw+cRV0k30t03Ib2pGq1Ngupsgfn6IF94u
 EOSAlHrwYEWuToBMsTouZzwx05gP7tWIncbYw9TyLpfuQdy6QIpLp04lEbCma6/QPHdggqSECE
 6+f5NGzbqz8a7rxVxefeARI1d8k71V8oWylb71YZcQba27br63Gjv/2XzdePHhJ6vqWO6ZeJus
 q6kljM5iZaQwIXBq3QLXEV4d
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="134166907"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Oct 2021 04:36:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 4 Oct 2021 04:36:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Mon, 4 Oct 2021 04:36:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mC/uepJRQ7jnSC5vSC+xjOhtTXtRCEVyV/n6dVCG0l7tyNrmfk8y7hMW3zHo3w7KGfMJDzKPvoNV45s9bI3aVnzZeXUkaeRnqG0irYfRscuaIfcCNBoCqAbN80YTUM7cM67VOgM4NMN+3YGAjEffMKZxAS9/G8f2Y8mORfdTJcgBd1E9nPnlFUHii4zeuIVhzTD4QdBGNE3Fu6LaRlhlL06pYG3mhhfQZy32ZW+rC6+vyBs9aL5L1632oqUrS8mcDV9Fc2CnLD0h+u0p1kJw8RVtPh4SDUJ72lRwxzsLNVqbrLxE86X2a8MtQsLyscv1J0uKfd+oNRT3DK9EveUEUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2s3YClEGQ4NhoyiyH6tQ6W3d+rUAgK7rEIs+JfYIPM=;
 b=jqqTsYGHsvQ647wQPQy9DB188qrKelJ0gA5uk21mHnvB59aKHoYQbgUTwNmaa877ATB9BW/+QPderGne/DqYfyFw9fA4swS132lC9QFzliJRPWhf0Q0RRiddq67nWDpXtNxFCmnrHAH3mRKt3RArnVOZucDoWKdncje+jkl8XQqwHvs2iiYxAboL9kzzZ43jpIOenbGk9g9BLQSZcfKVVEZULhawZ7cLBs/4HUSGL2j9WhZe4Zm8aGRKPBifQc5CJX9V8Uw9Pdkl6xotsOsch5ic6nUxP38+AjIA/lfFtqQPO/H7GzLOXuPrvL1tUf6Y6/LZUqTlbC6V1KCp0Enr4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2s3YClEGQ4NhoyiyH6tQ6W3d+rUAgK7rEIs+JfYIPM=;
 b=g+csH0CU4D+gQS0x8QamBRTpiXroG9HLclkbzVXe0eRxl4OdrjGOhqhclhQDYIKn+dWnTESh0s3amNeOWwtLuFwqH0R3YsD2yn4a8I/ctg6xIphVcJ8xrt+nobTJPXZKguRF2lRDPhUHQtjikct6cG0BZoARNJJfnml3s6zawBk=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4718.namprd11.prod.outlook.com (2603:10b6:806:98::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Mon, 4 Oct
 2021 11:36:11 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 11:36:11 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v2 27/35] mtd: spi-nor: core: Init flash params based on
 SFDP first for new flash additions
Thread-Topic: [PATCH v2 27/35] mtd: spi-nor: core: Init flash params based on
 SFDP first for new flash additions
Thread-Index: AQHXuNzqavvXGXQpeUW+ITKmACoLmavCtlQA
Date: Mon, 4 Oct 2021 11:36:11 +0000
Message-ID: <0d5fa73b-1a1b-bb62-56da-91472e94a392@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-28-tudor.ambarus@microchip.com>
 <20210824175138.vggtefa5xoomcjto@ti.com>
 <ca0df88f-2d62-a27a-624b-6640d437e535@microchip.com>
In-Reply-To: <ca0df88f-2d62-a27a-624b-6640d437e535@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b905967-8dd3-409b-d1c0-08d9872b2a4c
x-ms-traffictypediagnostic: SA0PR11MB4718:
x-microsoft-antispam-prvs: <SA0PR11MB4718D89A485F64D0F80F1DA4F0AE9@SA0PR11MB4718.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zt7za+L4QevMXrHrPbqo/Sv7nPigK7YWhp2NrKw4oBjcdbmOBmRvV0UQV1o1pTgKpOI/rwqnQz+f49fPLgey3MTX/Xrbeo5AIjI0EF7OXoUwio+v97sWQubPfhjmk47tmtoAo0iE7YkbesxhiLkUfgz1OP1XhjNWmR81wmj08XFDRN8G6IYgymOnzplduIw85nAY4AKe3UYqSVFjcX1dVQEy3zMSNp/ZxDRUmaPbNHGJnaiP2K1y3SdamakdiZFRz3a1GFFxyneUu1dhGHyJzlDstrJFXS2ZGoFNxuw2gby4xPp0w9lL0hilnkJTNheXdcPpPvFKpK8Xu8VZM6mC3aiFF2a1XW4S3abaCWMQ5zWuCfKkmuI5RYy0DjC96JVzPfuGoTkrSHj1MSidh7EePN7ZIQNgMPQ9AK/MAAFoBt4Jm7zJkDmRojerhvTDCwLiLPj1T1SKQa3YqSsqhWQroDIN2vR/rflQo+yOk3+1/PN5zW0sMeYG97BeQrWxvJoMKYT57OzoO55GsHGUj7gkWhRp99YheYgOHYba7g7jX6puw+v3F2jwYmB/6kOOvg3qyM56JCrz71u4aNtxQeHG2UVJfaIKY9s2DC3g3aBUQyCkGXE2vWGn0AoN9g93KURDZQrkmF/EbT7P8H6HUa3zWsUGp0JvuFeY6HTG6bRf2JQ2MPDb+/Jb5JADgWpxP0sCrTj6GTiW1EuS9YHtFfKEElaCUxSSvFcaeZofwLwhD/bP0NdD26HmJOYPcNtpr20HTGOlfnAKRn5QVabrFHPFdQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(31686004)(38100700002)(7416002)(186003)(8936002)(2906002)(4326008)(31696002)(86362001)(6916009)(316002)(54906003)(4744005)(5660300002)(91956017)(66946007)(66476007)(6512007)(64756008)(66446008)(66556008)(122000001)(508600001)(38070700005)(71200400001)(26005)(36756003)(6506007)(2616005)(8676002)(76116006)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGZ5Sm9JMWNYdmRLdkRjclFib2Q0akpPOVpkQjdaTExOcjYxQmN1V3JtWXpD?=
 =?utf-8?B?ZVFicG5RTzNRTGdlczJjNG8rQ0RRUXdkUmQrejYyRFZEUWZUUUNHRmpkcTFs?=
 =?utf-8?B?dXY0NkR2YWVQakV3U29uN2V1Y0gxZXNzakFtVXNRdkdpa0pqMEVnNW5HNytz?=
 =?utf-8?B?UnB2NnFhV2FScVdXMWlsNHpMNGFzN2hlRTh4S2xzb0N3REdsK2RlbG9yWUNE?=
 =?utf-8?B?Um4rMlllaGw2VFpTdkxOQ3hMSnVjZnVjcVUycTZ0aXpBSTR1blRmVVZqVXE5?=
 =?utf-8?B?TTZoNzEzNVFIb2hmMW1iVW1WZTlkU21BTSt6TnBkd1RZRnFpOHM3a25KWk41?=
 =?utf-8?B?QkJCVWhpSkg3dFUxT1BVcGNEdFNaelV6Q0psMGovNjJLeGJFOUFJVWRPUXlt?=
 =?utf-8?B?S2xwenh4QTA1QS9zZnp4SlhqYlRmd1hmaDF1U0xwNElGa2c1WG5ESXVFNTRV?=
 =?utf-8?B?dVp1ZnpsTVQ1Rm9YNUU5Ri8vYWlRQkszWHRIZ2YvdFJSQmJWbmRBbUkrYlZx?=
 =?utf-8?B?aHJuU3lHekIzTStvTWROVkZZc0tEamJ4ZUZaMmFFTTlicGVzN2RUclhXRzhD?=
 =?utf-8?B?SlNVd0lkSkdyQmZzVjNYMEVleHVuVmtQb0ovOE1malZBdjRoZkJUQmp3VThr?=
 =?utf-8?B?NHFhaFY2M2liSmlKaE5hSnM5YkFlby82V3ZMZUtLK28zZkMwVGovM0o3Tkcz?=
 =?utf-8?B?a0l0cUF2ZEhpOWwxK3hJZGI2UUlNOUtuekt3MEZWK3cvcitrWWRPK29RY3Zw?=
 =?utf-8?B?WmNHMFpSa0xTYWluTVFtRlFBQmorT3gySlJWazc1dXZncTdRZW1PMTdEWjdt?=
 =?utf-8?B?dnowak1lcEZmeTdXbkc0Zk9QL3lVN0RSVGFNT243MXJNb0h0UWtYU01ZQk14?=
 =?utf-8?B?dEhGN2RDYjMvOWJraGhnZ0g1OTEwVytuUVVFUWIxZG9oQ0xWUlplY1crNTEx?=
 =?utf-8?B?RDBEVjlpTVRIRXdUaDArWDI0b0lsZFlBd0ZhdG5VbklWd0h3c1dHVW5rbHNU?=
 =?utf-8?B?cDJ3OCtnaTZUTjZnNkRIWWRZM1ZOTU5aUDh6UWFIaHJCTWdYelFkZ1p4R0Vn?=
 =?utf-8?B?c2dURU84OW01b2FlQTlscmxXVVI4ZEtrN1oyNGk1R2s3MVdHakNlVE42MUNT?=
 =?utf-8?B?Nm1zWDRtLzhuRlpyWmFvbkh1UUdOdDYzcm8xanM5NmxyT1JqQ1lYbkJlV2pC?=
 =?utf-8?B?NFg0TkRsYjh3TGllUWUwbyt4ZlIzTGZld01pL29yN2xYczRNV2cyZkJJLyt0?=
 =?utf-8?B?ZDBocE1zMnYweWdvQVNUYTZFTEQzNGZTZDdvQzdpTzRxUGljWUZIMXZZcnFl?=
 =?utf-8?B?UExLdnAzYkY1QmRCclRJWHhNc0JGNkpTQ2JSaElrMUl6cVAxOFZPTC82dlNs?=
 =?utf-8?B?aWREVE1RSU5RR0lkcEV6TFJJRkRaaGJINWg3OFpTSmFLT2s1MDFBQklzLzVG?=
 =?utf-8?B?TXQ3VmhLSHVoMjk0YXkyVnkxMXRtUk9TNEJ3N3NScWdOdXFXTUcwbUlZODQx?=
 =?utf-8?B?UDRwTDI4ZDZqckdSRlI0TzhKblZJUEo3M3NLdHF0dURZNkZDSkFBSkpTUGRO?=
 =?utf-8?B?NGdJelNEdVFubjRaZDZpN1VVSEFKanZpWW8vc3NZT1cxSGV0UFdaU21wcVIr?=
 =?utf-8?B?Tm81dFF6NTlYWlg4RThDOHJQQi9LSElmTjliNkdLWkN0WWMwV2RvbWw4SlJu?=
 =?utf-8?B?ZDllelRMdG51aGRjaUN1bTM3S0dDQUExRFcyVVBoeUwyVGNXNlVoaEczekNT?=
 =?utf-8?Q?7+Tdn9Lil/AhyA0h/s=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <024C924A0B15B74298BFD12AFF989C78@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b905967-8dd3-409b-d1c0-08d9872b2a4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 11:36:11.1392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pT+YbbtEjcUAb6MuZnxmPe7ni/TN/h8/lQW3T1845IPDdrsOQGOceBKHZb7rAj3BpUUJsDYUHuwA7PFeYA4MAf2jYb2NfnJzYmnUqsAxmII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4718
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_043615_059115_965D671B 
X-CRM114-Status: GOOD (  10.80  )
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
Cc: code@reto-schneider.ch, vigneshr@ti.com, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, michael@walle.cc,
 zhengxunli@mxic.com.tw, linux-mtd@lists.infradead.org, mail@david-bauer.net,
 macromorgan@hotmail.com, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, linux-arm-kernel@lists.infradead.org, jaimeliao@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/4/21 8:01 AM, Tudor.Ambarus@microchip.com wrote:

cut

>>> +     if (!treat_id_collisions)
>>> +             return;
>>
>> No, this doesn't seem quite right. Why would you not want to treat ID
>> collisions for flashes that use spi_nor_init_params_deprecated()? What
>> makes this not possible for them?
> 
> I think I wanted to motivate people to switch to the parse SFDP first idea.
> Why would we care for those flashes that use deprecated methods?
> 

No, no, I'm wrong.

cut

>>> +     if (nor->info->flags & SPI_NOR_PARSE_SFDP)
>>> +             spi_nor_sfdp_init_params(nor, true);
>>> +     else
>>> +             spi_nor_init_params_deprecated(nor);

deprecated maybe it's not the best name, because here falls also the
non-SFDP compliant flashes, which are not mandatory seen as deprecated.

I'll rework this and resubmit.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
