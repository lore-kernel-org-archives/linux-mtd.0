Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF6E606A322
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2026 10:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4laZgOuP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MdET1z4c9B23e5X1UFY56lp3Xz5+A8aNuTfrQ3RN1IQ=; b=4laZgOuPyCk76YCZELrriNusC8
	0tWr3QZvunlMdPirzfXMrHN+TK6qEi9toCjE3k+KHzCrItVDRmWhn/BxyOVqRmhsy6yUWkCWfP+Ky
	uDugmUZi2JijeUhw9GVQfOVzd/HxrUOnerEMfLB2MINfx7fiGZVcXN6OPhQ+2wYS7GevUD1RM/KlH
	yA5wmSi29n6F+gdqpuwoEP61GQpYZomalRJhhtBewqAcD5Zcjt1qDxlsIE56TLouVvmwPe0luvPPS
	yYiK/bpiq2fE4J2iD6Bezo5K4ozay5jbNi4jZVknfMHbVNDymojTFc7UlLYBdY9Qd6Wi6YHJLpl5b
	u5fEWFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCjm-0000000GBBZ-2d3z;
	Fri, 23 Oct 2026 10:43:02 +0000
Received: from mail-sh0chn02on2135.outbound.protection.partner.outlook.cn ([139.219.146.135] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCji-0000000GBAd-2SxN
	for linux-mtd@lists.infradead.org;
	Fri, 23 Oct 2026 10:43:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkjwQFEQTe5S9b2JLSxyhcsUSEPThXX7OWF6L8lx4OKKxy5nDTQTPYk2k5dXyctEQmZzW/1FDe6AnHvTKQj6WORcDbwGhOuyKowuUrOIwKy1kuxqa2bhZSa5x3aFFzSI8Ws5F91DzxT40sQJpWgRSguzQb4RE6MVgu2VJ/F4ezmz66T7QAWXnWn7Ax76GCjZB61WLy4Ay8mKx15ny6YJmCGX4wYQWfp7UzjKB7EReMxSH81VIIVg0Pwe5bIjvnQnMKcwkhF5KdeL58tQF2yTnG8v5pvi1XzPd75UwmtuEEc+MgTaLn/Sx/j0ot3ne/KOnLbg/SUb0NHrQrQDT3Na2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MimV4n8Sl8+4fuAU7ngqHrVLtCu88LROd7UIOI6J470=;
 b=G8n0xhSOWTAlU9yyq9M71k05s/Hdv8S9ALDZS9Am44nWD1WvDoq5/h1PNf1BM53pFimmLcgURoO0hPZrX/nS2cBnOQj/YC5xufkFXG1+Vqc6szumOAieuf0DUbh2LYdWh6tUXlCXCY4Rruc0Y9UcwsH/6UZeLJitpI4lUqZMvN0PBW7Drf0G+VA2u6LZdUYo5Ff4fAkhGGYxBO2NZXJA7f/4bQG1Dwdl+ELc/etsXsi/7vxBocU10koiEidmAfPHouPXMxNBl4Kh2f47YhQWzQjayH6q35/l/GjwjqgpzRAA8YOjjaRYM0XbofeqosvUTVqbqPBEmUzr1E3ZWDhDpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1172.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 10:42:23 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0546.017; Fri, 23 Oct 2026 10:42:22 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Mark Brown
	<broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v1 4/4] mtd: spi-nor: macronix: Add 1-4-4 DTR read support
 for MX66L1G45G
Thread-Topic: [PATCH v1 4/4] mtd: spi-nor: macronix: Add 1-4-4 DTR read
 support for MX66L1G45G
Thread-Index: AQHdYg/KVZfybvK8TEC2m9bQP1XDNbcJfCYAgAF2GCA=
Date: Fri, 23 Oct 2026 10:42:22 +0000
Message-ID: <ZQ4PR01MB1202579E830FC73D87BEC337F2642@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261022102614.75696-1-changhuang.liang@starfivetech.com>
 <20261022102614.75696-5-changhuang.liang@starfivetech.com>
 <DMBD4AK6UXKX.23K3797G1OUS0@kernel.org>
In-Reply-To: <DMBD4AK6UXKX.23K3797G1OUS0@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1172:EE_
x-ms-office365-filtering-correlation-id: 61ff48c8-f6be-475b-639b-08df30f25238
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|38070700021|4143699003|56012099006|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261021123027099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: zLM68qCoxyjN59UyO775kN1UkZw//41c4YusQ0X/tOZ4WQlbZh9+91JmnskxmmWxE6EY7K0qQ4/9+Ohd4fV9WpO8mah5Bh3etqZD9zg3VrnI79QwOf7WxHnCq2J9BcTIB3PyryWPNRt3W6Nsqh5v43inUtkVCTI9929ivtWcktXuPxooCjHPn0uX0L1nOg59Vsid9vS0izqLZD2oj7A6MlTOvsNEX1mohszcxYOoTwAUUNBRdcLL1FRIlFkGcciH1diegFI2MNYgdV1t8SnYK4ft+8yxX5/6qAnDGmNyF7V9f7nBnY2u5x86jTm+ZP4P9fHQbVlLYQT7UOMBms5aMRl/D9TKdpDuCG8A9gJPkGxKTGLzFGGAbuzwMj6bzeqIUBdE0LbkzrH/i7eJe0JDSMaHuQQsw6s80sF72rott7TNaBD0+nidcSsib1E3HjZlb/9urVv8Rl9OvVzS0O6ii2vbS3qypoFAH28ss2ypS1JBIMlKv+PvRrofQyxUWESs0WYBxV8TcHme9AIIwQDXj5mVoYqrXBWnzjVzxHRwl54=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(38070700021)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261021123027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVpBWTRoTXI1RHFsQXdMUER0R3FVeFhyb0RINk9WNHRJdE5CQlJaUmdtQXJm?=
 =?utf-8?B?NTFSUHJnU3k5VDBlWHpGRFlQWmU4NDFEQ1RFbWFtTjNtRjZKQ3hyY1dxZklQ?=
 =?utf-8?B?SnJ4Q3BaUG92NjAwRTF3WDF6a3B3bUkyaTdqNmpxQXBNT3VjRjJXdEJHdWRQ?=
 =?utf-8?B?Nm8zRTFoU3NjeGthaG1LcWY2NExpUldFd3RqNzlNalpUVVBDbkNmOThqOVJB?=
 =?utf-8?B?Tmg3bEN3TFJQNmhocURSbjNtYWlON3ZWejVUakZuZkdtTVVPZmhLNEQxMHpP?=
 =?utf-8?B?UEtsNVFyc0NlR1dtalpzSmNyTVFBZEd3QTdDWnJNeUk0dlR3N3gzNElPT3Z6?=
 =?utf-8?B?d1BKeldQbHNmZ0NmN2RpVGJaTEFob2V1NEdFNXp4M0xWc0d5cURmdjNkb1VO?=
 =?utf-8?B?blRaM2ZyQlJMZGo5RGVnNEtZa1pPUjRzc1RJVGc0VTl0Q0RjTHg1MVNZRHpP?=
 =?utf-8?B?V2tGcHVGRFF2QWIydmt6T0FFUkpUeHBLOXVkUHlJODAxMEExdWFkMUVIMytI?=
 =?utf-8?B?Nk8rUjIyUDRGcUd1K0JTUWZVSFRkeVJjQnh2RHpRTExxbEMwb0d1MVRKQTdN?=
 =?utf-8?B?Qk56UXhXWU9ES3M4SFhSMTcwck9mbXlITzI5V1BXa2FKNXhSOWtzYjRJMm11?=
 =?utf-8?B?a0ZIM3BrU09hMFlWNGZGMjYrQzVGZ2FnYXNQQVhPT3dpVjhIOWNhK2crbklm?=
 =?utf-8?B?OFVwYmdkNzJIQ0FSRFdlVUxvYmZ0a0lCYlcwanlCbDlnMDFpckZTZDJPdnFT?=
 =?utf-8?B?TlVOUU5YWUdlOXNqeEcwSjBPeGI2ZHhOUlZOWjY0WE1hMzlpMFdpSEVQRCta?=
 =?utf-8?B?WEZtRW8vNzBZeDJDcE44V3lFRUI5NHhNNm82ak91QjNFK2ZkU2xLc3pUeVNt?=
 =?utf-8?B?eit2aSthUXAyd1E4ZXROejFlejhzYVpNcmpkVkJseERhdTlBWU9rd3BTczdr?=
 =?utf-8?B?RXYyM0ZqcVhpQUhSVThOdWRQKzFObWxQMGp2N2VicUJBdGV0QmpTajRuWEQx?=
 =?utf-8?B?RUtuUVB3YUxsMzNvNzg3a1ZsY2Nvc09wQW5RYzNzSm1nNDF0RXNKTWQ1VWFu?=
 =?utf-8?B?bXR2Q2lrelR3cTF6dXVhL2xQSmtFb3lQUVBBZUVYanVTUTY4STV3K1NoVmtT?=
 =?utf-8?B?QjNETDVOaDZTT2NpQXg0Umh5endxQmgwSGUxMFJZM3ZTYmtuMWdrVjVCbHdL?=
 =?utf-8?B?UTllbDZteWxvMmlJd3NrQ09aZndnSDdPNmFwWVZlUVZoa2R0dXYrRDZjQ21R?=
 =?utf-8?B?dm5DaFdnNmQvblVBZDZseS9CbE16VlNzUEpLaUN6R3U1SkpKOWwvbk91K3hI?=
 =?utf-8?B?dGJ0MWc1VmU3SHZ0MEQ4QVhDVlpEeXNlbmZtVkloOFM1U21PUGZuZGM2YklK?=
 =?utf-8?B?R25wa20rbUlKRXowdEgydWJETzFBZmVKNkxvWHVmUFFnUjVFMEZGQzNRdkhI?=
 =?utf-8?B?WG1uNTRxMlBZL2REbk1sSVdvWWYyV1NzL3R5dTRMNFYrUHNuTzV3d2JXRkNX?=
 =?utf-8?B?NVZPMGZyaDVMUmdKaE1ReUtTbmQ2NnE5SUFMUW9mZXFmb3FiU0JTV25JRVlm?=
 =?utf-8?B?NlZEdkNrRS8xZ0FHTklnanVkMzV6RXJVNjMrWXgxRnBuZjM5eWZUcUpJU0dZ?=
 =?utf-8?B?YXNza3BMZlZsZ3hQS3RTYWwwYjRXOVFMa3d5TTNvcm5NU09jZ1dVSXF3MURY?=
 =?utf-8?B?Q1lxSm94T0xxdmMwSldkSzdiRjk3VEp2KzB0UC9pQTNEV3RDK1lrSkZGYlBD?=
 =?utf-8?B?Mm1RTlZWWmlRZjE1VXN6TnlBRGQ0OXBZV0JoRzVSZEJDQjljUHptckVLOEpq?=
 =?utf-8?B?SDZuOTVSeWhSUFlxWVFaaFVzVkVEQWgvZkFaWGlSZlQ2V05mL0NQRlp1RGJW?=
 =?utf-8?B?QUdySnVyb1FUWDNiMytDaUYwc21ud21ZV0NVWlZMMHVYZjFXN0pqeWdkVklY?=
 =?utf-8?B?UmVkYmlZOGdxRzN1NVRNV09xWmhGSjNTTUk1d2l5eWJWbEhGdmdKcStFaVpM?=
 =?utf-8?B?cEFjRWFrV0JQTVBmcDJNKzRsdkN3bFJpd1VoTVR2V0UzUHpUeEtlNGJKcm9G?=
 =?utf-8?B?emJ5MGZFTndNeEIvVXF2TSs5QkQxVHhQWXNyR0I3S2pWbWNrdEJSc0VmMmxl?=
 =?utf-8?B?MkFwRThOdEZxNm1HdHd3ZlhNNkFoR1NTSUMvK2ZFZ1NpY0I5NEp3Qm5YSmxw?=
 =?utf-8?B?ejlyQlJYQXVYN2dEVU1kTG5veTZVaVhKdnBwejNOdnJyZ1lpbG4vMmovZE1k?=
 =?utf-8?B?Kzc1eHJPenBoaDQ5Y2xNQnBRUmJiaHREOE5xeHRscnJWaXFWbE4veFpTQzJt?=
 =?utf-8?B?YmRUNnY4QkcxaTAwdUNwK1ZRYjZLRWpybEMvVzR2NHdOMTdIMmswUGc0c1pW?=
 =?utf-8?Q?SlxbgEYGpughU/vc=3D?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ff48c8-f6be-475b-639b-08df30f25238
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 10:42:22.9469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nnRZ6cC5740W0pYiiCzcTqeLlK6x3L1ooJTyWNUls93QdCW3A/SZ+j7DG32mI+dhezY9gKdJwspd39fI6VlME8lCD8tnlGjhYRwkau/KpStOFug/iMK8AFlNJw4POwaC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_034258_633234_E3AF012D 
X-CRM114-Status: GOOD (  15.29  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Michael

Thanks for the review.

> On Thu Oct 22, 2026 at 12:26 PM CEST, Changhuang Liang wrote:
> > The MX66L1G45G supports the 1-4-4 DTR read mode. This flash uses 6
> > dummy cycles by default in 1-4-4 DTR mode, but the kernel's SFDP
> > parser does not derive any SNOR_HWCAPS_READ_1_4_4_DTR capability
> from
> > the BFPT table
> 
> So why don't you fix that?

Perhaps my commit message description wasn't good. For 1S-4D-4D, its support 
bit is in the 21st DWORD of the BFPT table, while the dummy cycles are described
in the 23rd DWORD. Unfortunately, the current flash model's BFPT only supports 
16 DWORDs.

> 
> > , and 4BAIT only filters already-known capabilities.
> > The exact number of dummy cycles is also not directly given in the
> > SFDP tables.
> 
> What is BFPT 3rd DWORD bits 4:0 then?

If I'm not mistaken, this one is for 1S-4S-4S.

> Could you please dump the SFDP for this part? See [1].
> 

# hexdump -C /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
00000010  c2 00 01 04 10 01 00 ff  84 00 01 02 c0 00 00 ff  |................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
00000030  e5 20 fb ff ff ff ff 3f  44 eb 08 6b 08 3b 04 bb  |. .....?D..k.;..|
00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  |..........D.. .R|
00000050  10 d8 00 ff d6 49 c5 00  85 df 04 e3 44 03 67 38  |.....I......D.g8|
00000060  30 b0 30 b0 f7 bd d5 5c  4a 9e 29 ff f0 50 f9 85  |0.0....\J.)..P..|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
000000c0  7f ef ff ff 21 5c dc ff  ff ff ff ff ff ff ff ff  |....!\..........|
000000d0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
00000110  00 36 00 27 9d f9 c0 64  85 cb ff ff ff ff ff ff  |.6.'...d........|

> -michael
> 
> [1] https://docs.kernel.org/6.2/driver-api/mtd/spi-nor.html

Best Regards,
Changhuang
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
