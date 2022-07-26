Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983CCC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jul 2022 08:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8yHMDFwCyc0TvfAVukXVSYnrlJ91Raw2tNTdGXYAFx4=; b=3v9P6xVCxsHkbV
	KpPQLhSn9+n3j1hvfLafGHMLeBwcW7jl7oYIp22YNBhSxPVxG5sYsKuA+bSZn1OjMRUeaoaB95xy3
	ToL7SLAzuYZLM3oI6xJ/JBq6fCFZWKk0hZYe9HQ6Sq+MqJpe6q3TKs5VgwdtDeSXF+rKl3w/X7NDp
	wsAH6uFbZy8AKaCFdkAKvnQh0dJYt0CZjYUlLMHREfV6suYY1QQ4xjSrcxvjv1sVGn7hXzDsM951P
	3+8cazMsFsf0evHvL6rtx9MPJPBBVd7EBuyNl6rqTW8zlN12uwHtZbsp2yOjuochR63iSThpZzASM
	lhuy6RTH7KfSAAJlW0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFYm-009qdj-Cl; Tue, 26 Jul 2022 08:04:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFYi-009qZ0-M9
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2022 08:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658822692; x=1690358692;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZLUa8pqua6Ruq6OxRmQQbwky7kPNvYveucsu3WrUPbg=;
  b=MnVA/w0XrS03/rtNV6NxUap/oxucGkCVOyD5mV0HbmKqTSpUZoGMVDRR
   oDITHlvDMU5LHhK0LH4jMNMg94dOWw3unMrtDfXCtV+9q2hENuh02Qbh0
   2qKJYlQ8tKWZG7kxE+lUsEuu2Axz+74vadlcpUdRGO3Lxy+VVvmvWnPS2
   utNf3FIbkgePQCLljzaokypADs3CM51qyqIak0OU8urHu12CiSxOnXg3g
   adw6C4FZMgoZds7EKj80vHO4LOoInr7GopikBq2s+wOTtJR/hL4j9ShEs
   lROv5h+9FkIi1gmEdISrTBdrSSVciqlMtsl8T/oUbQRCgvBSydlkj7P+o
   A==;
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="106134010"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jul 2022 01:04:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 26 Jul 2022 01:04:48 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 26 Jul 2022 01:04:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bm8qDERF22vbomiRDbbxnthC+gV6ko1BIub8F1b9tgOHfUNn9XPejCw42ClCsD5OMgk8FMwNudUdNnEo8YEb+28GX/lbCIMvLYmRLpzBB+g265B3540HUPrrjYxVSGkT1zLlcNvFPsUV79TmtSbwdLKDH+WqdlFMHYB9gNPtLo/Jw6OIvTZMnGrYi6C7Uz8SIp7s8kyhcfYZeOYJxH24q5L84uVlLfy4ZPl8fvBEM+LzzXRZc6SS8c2x/jFst4t55yTVkUg1INBDkopmmaEazQT7SnL+kigfhM9ZCv7QHKbUkzZ7U/h/sHlfoLmalS9mCiu3VQS+yTJ7h71u+WoYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLUa8pqua6Ruq6OxRmQQbwky7kPNvYveucsu3WrUPbg=;
 b=KqlIa0vsnQ8omkoofwXi2vxoJ6RJnMfpPZXqoBHJkGYbLhdAxQrJaRmmCe9fQlC02Ky2D+XNpT59o/Z84o5Oml2mmuwOxV73PfTvwWS+qciRziVMpR2kYwGUA4hfLVpZjywSyFsj3qsc0PcFz35ENCEVkMfbEpdnI2wWu1/VZthvmEuNeDfptbLAX/ddiE6h5jcYucfKHN56HSLxTcOWT5iTdCZ/H1LI+g3j6YELwWMUciDAdeqM2p8dYLmyY5xHgMLlgPYoDAJhMUIbA53BsM17wWWHEXxSyuFw/36W0WT87uhZCq3rY0nED9t1Lj5h7kOkzvApdgS8gGCkqYv91g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLUa8pqua6Ruq6OxRmQQbwky7kPNvYveucsu3WrUPbg=;
 b=SlBqU65ZH/FtZZVlLen+JysulcmJ8TupE8J628iA2UkCSix9KmMJwB9+YCho+DBav3IW6PW737L5ZsU2HZnVtzitfn5fZ18kqa8J2YCMgSSiJKhswvb/rueps7/uFfePb7vv6uO3HnuhCeUKMgpexCsztJvIXm8vHLnIL7QGGRE=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 MWHPR11MB1551.namprd11.prod.outlook.com (2603:10b6:301:d::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.21; Tue, 26 Jul 2022 08:04:42 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35%5]) with mapi id 15.20.5458.023; Tue, 26 Jul 2022
 08:04:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <tkuw584924@gmail.com>,
	<Takahiro.Kuwano@infineon.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Bacem.Daassi@infineon.com>
Subject: Re: [PATCH v17 5/7] mtd: spi-nor: core: Track flash's internal
 address mode
Thread-Topic: [PATCH v17 5/7] mtd: spi-nor: core: Track flash's internal
 address mode
Thread-Index: AQHYoMZchEMgxNZBv0GiJv2cBxOeJw==
Date: Tue, 26 Jul 2022 08:04:41 +0000
Message-ID: <8e8cff77-bb06-fdea-fb0e-60e1a2639026@microchip.com>
References: <20220725092505.446315-1-tudor.ambarus@microchip.com>
 <20220725092505.446315-6-tudor.ambarus@microchip.com>
In-Reply-To: <20220725092505.446315-6-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a582e9d-171c-444c-c5ff-08da6edd7ec7
x-ms-traffictypediagnostic: MWHPR11MB1551:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RXyEAqNVqsYKpSXQuUWYgsFiCPaLOhErFAHlLUi8afYdfXoTzo/ytUv4XB9Tw3BBYYZgSYyn90VgPD15TGKAnvdhDFHRPRl8qRcvWRcpixInCQtqCXEv9i6eCn/PwjrP/g7Ed74GQaxTBIQOmMTMDxaQvkKyfn+U3yp/KQkaVTtcS4Hmi0MNxenLHCrMwoz85Hs9HqsO+CDNLr2FTM18n2/T6C4PjEigT5qfbIotRYAfnnkrHy7Bjco3ucGTSFRCRricG4CctfM3UYsjz+L3xEH9/a2sI4YnZ575K6aqHec5z9Op16JT+/FL6Pgygpj/Xwkk63nUfKOUDZjh7+h/6f4bptQxWRBF6oj3r6vBiQO7SUk1WClsjrcMIl/oAVMBBdkhzPsKgqyxGqri66qTdOcVLr6nIFA2Cl7Uf83DVGWwikH3RLyz+TqgOXIg3y8yppf4vYX7sVn77i7+tqAQUmRJFp6BcXzfDaLaA/6RwvXPV50J+RW4L5PzoZw38zV6eNibyo0q54RZaALANcYCIODRhA/Bagh49xzn5oqH4kxB/kH0MzRqNqwISdOX8bGCYQfQibxtIMK1ail6IlZEoTdIn5Gctk/bQyYKsE3xi1dO4GP757acKRruWK7iEFsrLqNGvQJSSISlQjHcxqeBQjoZtNNOOY9N1XqNowU8ccLmzoha/rsR1HDhksr0gA48uAaKzQqR+4cb4c2YXylOsMOwO8QBdZCVbYRRLm33DjDM4Yx4HB4etVKCA8eJ242xuLxJ4zm4npWbK8DX0n12+TYGTrFaWmrS53Idh1+/l1Jh+naewBAYia4q63yCtU7LnG4sa0VdolBqbIVffO3zoBt4Yjm1zKSRMUb960J6JHYLuMa3RG1mxGjg37hjsGHO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(376002)(366004)(136003)(346002)(8676002)(66446008)(122000001)(110136005)(66556008)(4326008)(54906003)(66946007)(64756008)(66476007)(53546011)(6486002)(478600001)(2906002)(26005)(76116006)(316002)(2616005)(91956017)(6512007)(6506007)(38070700005)(8936002)(5660300002)(86362001)(41300700001)(36756003)(186003)(31696002)(71200400001)(38100700002)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzRaYzlPS2NxaHFxT1JqUjVJMXR1b0tkWjU1cnUrRSt5dDZNU1R6SGlOQTBU?=
 =?utf-8?B?TFhaeXVpWVJXYldSNU1kQzAvUFVDM2FoZG1Yd0p3QWFqTWRKVDhENThsVCtG?=
 =?utf-8?B?Z25hUUhNUEV6YXBlNHhWY3ludFoxZFVzOXZzanpqV3dpRTVhOUFFL1kyQXZy?=
 =?utf-8?B?czFJYW9GWDcxalNXSTY2QjlxSER4SUpFSjg3NWJqWFRvTFNWekdJL3FxYThl?=
 =?utf-8?B?cFozWUwycm13a2llQTBlRklkTVNLeThCUDdYMXJHZ0lON29NZ3ZEc080Y1gy?=
 =?utf-8?B?V1JJall6NUU5RjV2V2NZZElHWE40UUZMZHoyYnNZS01NN1JHclRROEFCMmxh?=
 =?utf-8?B?bGpYbE5uN1h5Q0xqZHRrYXBBV1FpcmJ0YkIwME1zVVBEbUZhbytaY2VlRGcr?=
 =?utf-8?B?T25aMndodjhpNVZ1ZGpidFlxL2ZtdEh4eU1SSHE4OFJlNklZbGtPWFR1SkE3?=
 =?utf-8?B?RmV4S0NTM3o2Wk5lVjFuWFJQdUpFSjdLN0Z2STNwelY0UU01VTZGOUo0VEQ2?=
 =?utf-8?B?c0ZhMTRDcWVZYkhZWVdKVFVtTUpydERoV21FbVdYS1JwcE5rd1hmU2huc3Fz?=
 =?utf-8?B?c3lDWERYN1dwOWwvZHlqNFRXb0lPb1UrTjZDSFIrUy9Da1lwNDhqQ1A2SGsr?=
 =?utf-8?B?TE9sM2R1ZDlxZjZxdGxWdm54RFlKVlpkNkU1NXk0YzduZWllNGhOcHZEc2N5?=
 =?utf-8?B?OFRVbC9CWWFUK1FaMllBOWYzOSthYzRXbFA1bUxoOTlwcElPSWZXWEpXb01l?=
 =?utf-8?B?WDUwQStPZGhDM1J2c3B0ZmgvQ2FGVEVrMm1DVE5HZUR1N2pyTE9RQVJpZ3JG?=
 =?utf-8?B?a25yNVBOTHBqYnNtM051MndXa21JT3VDRjZWT2YvajluM01yZXBEK3Yvei9J?=
 =?utf-8?B?WVltUDladXo4WGtRNlJ2QkdIcm5iQTQ5SWZmMFI0bk8welFReVJSTVMzZlNP?=
 =?utf-8?B?NU9ZWVFHdkVNS1YzaUtETGQ4QzFzdmNEVnl6anRuaSt5QlMrNTMvanY4a1dm?=
 =?utf-8?B?eFQ4cDFaVGtxVWRWUTZjR2xFa1k5VVhhd01mdmpqeHB3eE5FaFY0cDdCZHhH?=
 =?utf-8?B?WmhiTHpaTkg5VlE4bWZ5RkxKbUtjZ0pMVjRxU2I5cG14aHppTXVERFM0b0lF?=
 =?utf-8?B?dWh0WWpxZ25TYlkzaGpTaXkraG1FL25VakpnRVpwbDJLZzdTUS81KytRTDE3?=
 =?utf-8?B?Q243UWtZWkhUMnQ0dTY1eUpwak4wT1AyVHpqektIYTFNa0FRQTNUUGdudGsr?=
 =?utf-8?B?RjdkaC94TWRobG04SkNFVVkyUmh2QjBNQlJ1OFNUOUFMN1hsamFpUS9laEdX?=
 =?utf-8?B?dFUrK09OU1Z3eGt2eGh5ZjR2aGF2WUhQM3hrWDZUSTdEM1orQmM2V1UzRjBi?=
 =?utf-8?B?M3NtTlpaTXM1OFdRNlhjU1U3SS9JZVBUdlVtdHpQeFJGWDg3blVnTU92dWxE?=
 =?utf-8?B?dWZ1V2FUNDZMRGtvTWsrL04reGcvM29hRmk0NGVlbVdSVklzNmFQaHFUaEtN?=
 =?utf-8?B?THFmVHMvcEJUWjlNWExHUzJHYk1EVXNqc25OUEw0VWoxeEVvN3hwTVJEeVRX?=
 =?utf-8?B?TW1hN0ZuMlJZTWgwNWtOYndpbGpJZWx5Q2tYVEszcEt5WkxDcDNoWmhOK1F3?=
 =?utf-8?B?eEFiVzZwNEVzdUVpaXAra1Mvb3cvWis0a1RGc2Y3K29Qd1Btb0FvcG1paGd6?=
 =?utf-8?B?ZUxvTGo5NzZwUnB0cHBBaHhEKzBFL0oyQzBiWEQxRnZKY0RXMXhmNFllV2pE?=
 =?utf-8?B?N3FiUWthVEVFTUdlUVJYaGZJb3JlMVFSTHozWU1hK3JEQ2wvd2RibGJDWkFa?=
 =?utf-8?B?WkJwMUx3QUxEeGJMbWFtOTRqamZxb3dGUGJGb05HZ1RMNlZvK3djSHd6aXFl?=
 =?utf-8?B?Wk9ZblpMR0pRY0p4aVNFM0tiN09PUzF1T3BaWlhVUlVrb0FWUm50WHpHckVk?=
 =?utf-8?B?Y1ZHcnV3Q1J2M1pieDlEZ284YzZsWGZJYjZCTkJNa0w4Z0lJUXlNOFd0WG02?=
 =?utf-8?B?RXEvWm5RM3F3TEREOVNJTE1YY1hNcWxWRFovQitpZDRPNFlhU2NsWkRVZ1VG?=
 =?utf-8?B?QUh1Y0FuYjVTY2dwcXJ1V2JRZXZDcWVxcTUxV2hRZGl0NXRmMjhlWXhFTmJP?=
 =?utf-8?B?eVlpUE05K3lKVXB4NXE3RFhQazBmRmdjVFFXeFpudTRZTXFXWTlidDVKUm05?=
 =?utf-8?B?WXc9PQ==?=
Content-ID: <917ACBE1A7CE414194E6192A497526D7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a582e9d-171c-444c-c5ff-08da6edd7ec7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 08:04:41.9557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a4bT0MaNH7NE3wBKwgoJmEFDk846DWpmEz1oJ1PwdXG3mjX53VH3LxR5p3E6mkI7ioNb1MAIzvVXAyBIwcX80ANZ+H2uxPOwTMI2ouwVuCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_010452_800916_4F415BCF 
X-CRM114-Status: GOOD (  32.29  )
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

Hi, Takahiro,

Can I have your R-b tag on this patch, please?

Thanks,
ta

On 7/25/22 12:25, Tudor Ambarus wrote:
> We need to track the flash's internal address mode as there are flashes
> that can operate with 4B opcodes but unfortunately do not have a 4B opcode
> correspondent for all the 3B opcodes. Such an example is the Infineon
> Semper chips which provide 4B opcodes for read/program/erase but do not
> provide 4B opcodes for Read/Write Any Register. These registers are
> indexed by address and require the internal address mode of the flash
> before Read/Write Any Register opcodes are issued.
> 4B opcodes are preferred over changing the flash's address mode to 4byte,
> as set_4byte_addr_mode could be done in a non-volatile way and could break
> the boot sequence. Thus we need to track the flash's internal address mode
> so that we can use 4B opcodes together with opcodes that don't have a 4B
> opcode correspondent. Track flash's internal address mode.
> 
> addr_mode_nbytes is discovered when parsing BFPT. For the
> BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 case, one could introduce a method that
> queries the flash's internal address mode at run-time (works for Winbond).
> If a run-time querying can not be accomplished or if SFDP is not defined
> at all, but the address mode is volatile and resets to a default known
> value at boot, one can change the default addr_mode_nbytes value of 3 by
> introducing a flash_info flag. If the address mode can not be queried,
> discovered and it is configured via a non-volatile register, we may
> introduce a dt property, but it will harm the generic approach of the
> jedec,spi-nor compatible. All this complexity is not needed now, so let it
> for future development.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.h | 5 +++++
>  drivers/mtd/spi-nor/sfdp.c | 6 +++---
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 7dc4cda41db3..85b0cf254e97 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -341,6 +341,10 @@ struct spi_nor_otp {
>   *			ECC unit size for ECC-ed flashes.
>   * @page_size:		the page size of the SPI NOR flash memory.
>   * @addr_nbytes:	number of address bytes to send.
> + * @addr_mode_nbytes:	number of address bytes of current address mode. Useful
> + *			when the flash operates with 4B opcodes but needs the
> + *			internal address mode for opcodes that don't have a 4B
> + *			opcode correspondent.
>   * @rdsr_dummy:		dummy cycles needed for Read Status Register command
>   *			in octal DTR mode.
>   * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
> @@ -374,6 +378,7 @@ struct spi_nor_flash_parameter {
>  	u32				writesize;
>  	u32				page_size;
>  	u8				addr_nbytes;
> +	u8				addr_mode_nbytes;
>  	u8				rdsr_dummy;
>  	u8				rdsr_addr_nbytes;
>  
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 3a48173a2d78..c7973368f5dc 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -462,11 +462,11 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
>  	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
>  	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
> -		params->addr_nbytes = 3;
> +		params->addr_mode_nbytes = params->addr_nbytes = 3;
>  		break;
>  
>  	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
> -		params->addr_nbytes = 4;
> +		params->addr_mode_nbytes = params->addr_nbytes = 4;
>  		break;
>  
>  	default:
> @@ -653,7 +653,7 @@ static u8 spi_nor_smpt_addr_nbytes(const struct spi_nor *nor, const u32 settings
>  		return 4;
>  	case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
>  	default:
> -		return nor->params->addr_nbytes;
> +		return nor->params->addr_mode_nbytes;
>  	}
>  }
>  


-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
