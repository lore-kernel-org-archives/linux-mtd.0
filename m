Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A327CA5FA5
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2026 09:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvXIors5stTZz0VJTgHIupcjil2VeeXA4/SqRXInqv8=; b=W+HV+eJcNjsqUM
	257w5qAnFhEcNpbfYvgRm52MaCilahtMM5ALKsDiAVUO9wFg8pTaruae859iK7/KrzhAjR2Ib6FKI
	4maF00fXw+cqMgdGO+5qqJS2b7asq9lJzpP+pp7lJfqdwJ9R5V9L70BB5X7rAOv+BKB1wJZDaXWuF
	XrbUVOPtXfCfZodbHLfC4Um1nQ+Cjo6xMBg1da+v1/361VW/4IvvV8RkNH4B96QO4DAw5WBw1/NuO
	Dc9W+t5/73s4iCZg6+/3ive3vWnvLThdxtA44LDhifTsvK0ZKO1HBsuLdDD6dhQJ7hpYs0J+fUzfk
	U/qKCPsbRO90yoakSmzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTrL-00000002w6F-2N4M;
	Tue, 29 Sep 2026 09:10:47 +0000
Received: from mail-francecentralazon11013041.outbound.protection.outlook.com ([40.107.162.41] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTrI-00000002w5U-1vdY
	for linux-mtd@lists.infradead.org;
	Tue, 29 Sep 2026 09:10:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igV7s1QYG04Ge7HVTE1HlaBWvP1K+Dcm8ZSwmgFfZqzAa9lntIHnOwcdtyX/X8TGpSzKisudcGncYwNak9+6HoFiT/5C15QAyVw41mgSU/xrjZiuAHxwHlrD4tpJRHHaHXofwqvUa5ql96ALq23LgGlnABJJTp6kL5RVlF0LKS0j//yT+stPYOGtUh7tYtI30zEn8Bw81hzD42OhhMvUHwcThhJd9bjKpXlkFw9BcCb6mRmxTfyumOg2oqmQgfZ3KRvpHt6WT1fUaU+ciJgZQW9RG/8Bo2G7F+NrOvTb0YaAF1NqEpSYn1nHkT0wIdWpLTGoh77ZRqCGvmZPs81GPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJv9qNoIlZpE8hrU2WTLxQDSjs+dfX8GQKqR8/9KBFo=;
 b=yPM9FHvAdEzgHY7aWrIwiM73fCgs6NWeHlS/5TjgkJ5dHrqelq6vwg1PLh9bJ7V5S8uC0tLi0/I+9FBkiXJ6IKKTK1WcFH2dy2MvEX5oIfx7zNcqswRRmckseQUFNvIZKIeT4OXh+nDYp2nKhAfNn0nFYNHYQ/3n7oFyL0sHQPixbBweutgf1hBZnX4tGg7H55JNXJ17sZ5hSDgDc5YY5BpHXcdfN8Hpl6k9CP5tEvObgKWFiXEQKc8vjUOE1HUXSNUR4mL4ZZpNlzIa+5YadWhNjVHMGvqduI5ovEnwJstdcsl/CBNWbXeoQEDE+bNS0LQRoVioBl46wQVc2+j8nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJv9qNoIlZpE8hrU2WTLxQDSjs+dfX8GQKqR8/9KBFo=;
 b=ChLeeK4mPtlRUz50nwcIE+ASBax7+lQmadMxZhIgYlnTVQfVnhzvjKGHTAXbJfHtyRKQCfTO59KQ3XFKGDoW0DLU93QrikJ09qC1q2kIjuf4eLBLouD/WjZsw+A+nQwHuf5ldDj9vIPmq5hJryNUvW6BhCFeWZ02r/UiQbE7YWkvFEhLJSwftwLc1cXn4ij9kwsArRTu4mKUyl8xaZ8Bg8h1HKh344Japk/McARJA91JR+5MRwG8K75KUZWayk+V6lsHzLcM74JwEAiabFlQcExflO0bmChOGFXxWABBRKHfV3GGN3+3jGi9G5wAHylH/WMtwcVUSKcfbMRkBP7GMg==
Received: from AS8PR04MB8820.eurprd04.prod.outlook.com (2603:10a6:20b:42f::13)
 by GV4PR04MB11306.eurprd04.prod.outlook.com (2603:10a6:150:297::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 09:10:38 +0000
Received: from AS8PR04MB8820.eurprd04.prod.outlook.com
 ([fe80::35d2:bfbc:a06e:fcb]) by AS8PR04MB8820.eurprd04.prod.outlook.com
 ([fe80::35d2:bfbc:a06e:fcb%7]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 09:10:38 +0000
From: "Bough Chen (OSS)" <haibo.chen@oss.nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, "Bough Chen (OSS)"
	<haibo.chen@oss.nxp.com>
CC: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"michael@walle.cc" <michael@walle.cc>, Bough Chen <haibo.chen@nxp.com>, "open
 list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER" <imx@lists.linux.dev>
Subject: RE: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
 entering Octal DTR
Thread-Topic: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
 entering Octal DTR
Thread-Index: AQHdT96gIxnJXzgNWkOSQILnkqCuiLblN9M/gAANNbA=
Date: Tue, 29 Sep 2026 09:10:37 +0000
Message-ID: <AS8PR04MB8820E136E7257FC5A02F1A3E908C2@AS8PR04MB8820.eurprd04.prod.outlook.com>
References: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
 <87zex05uvn.fsf@bootlin.com>
In-Reply-To: <87zex05uvn.fsf@bootlin.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8820:EE_|GV4PR04MB11306:EE_
x-ms-office365-filtering-correlation-id: 7aebdc4a-253b-482f-de58-08df1e09871b
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|23010399003|376014|19092799006|38070700021|4143699003|6133799003|10067099003|5023799004|11063799006|56012099006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: U2kL/56cknxeywJ39HwQZJw+CYGJIEdHoGd6P+iin5SKiImZ/UqxNIHkqVBORLJxf6+kfIpZ19xg6gopIt7ddxJNQcjiWkR+XEkbL2H6AI8Fa4vh+awhrhmmHTE4zs7EQWkJSfqIqmfm8A3foMW7AwNy+rLha/yhKxRD/lMDQ4Nv0kzbkZbRJVcjBwHZeeCfA5do5FqPRsF4mB/EUb6zd5MeKSnOOxJcZ0fwPJoJyhTlDWKOfMURGtdHBhcg+vbj037WKG+LDGCwfjrWMETiXkyL5nIr1Tv70QH1GcQrkXHIXCT7MkW3Br0qCZ6SVpkI+pFi0R9I9QXnrA8UHMV6B18oirdXA8Ir1fBLwAY8bwsVW1VU9q+b/gHfmUGnucoo+r3wRFIo8+anjly7Sm47lkFe+GDd6AEKWMSkHSsx7dKjxVTrhAsYToEuUujw47qjxnUd8BM2WMEECquvLvNFNAWWZes9M+iiRNpyAM4DiG70GS+2yMRbAkxFSrUrJxLz2PdCgkCF1zq+mbMzVM72i/7nV3Knu5Th+iWZhffvbnE1Vd5GJPBdlgLYaO1qztLkaB9HH56MbnyuaZf2EQ9QD/QD2H/+DAHI6l1JfxZxM/dJHC47wDr/dAQst6/WtaB0Eahx60/3WZwGJhouBPYmUMZPwGEToRfbVCVntJeEIxbnoC0LsXSoQQSg7AE1h2Moe6i9dlMix2ff2wRCmJFKrIcsVcqb1zXL2gIYhw5BkpY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8820.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(23010399003)(376014)(19092799006)(38070700021)(4143699003)(6133799003)(10067099003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3orQVRDM0c4ay85d0QyeHJnZzhhdENGS09yUFYrZFhqeWRGZEkzZDBNTGph?=
 =?utf-8?B?aWdRcndxQzlab2xnR1A5Y3JPalhKT3F5SmplWjUvaDdVT3dxN1FoaGtrNlJS?=
 =?utf-8?B?S2VrdkcxU0dkUlZUc2hmakswWndGSmpVUERJdlN2bmdlNEtUZjZnck1XcWZk?=
 =?utf-8?B?ZDAxT0lid3NrVlFBTWlNYm5vMjg0UFBlcDZ1bzNMMGtzTCtXV0wrcXRIOUxn?=
 =?utf-8?B?RDRoRUo5ajIrSmlRdjBsbUtzQzA5aDRWQlc1TmE0TzBQVGg4UFhwbUxGeUpy?=
 =?utf-8?B?SEtQM0tncEFIYnQvTlNaNHNsblhnME93eTBHR1FtOHhWTmppQzFVQUpBRU9H?=
 =?utf-8?B?dVkvamNEdHk4RERFYmtFaTRDYXZQOGlrZS9va056dGpHL1ZRbzFWdmM0TC80?=
 =?utf-8?B?NlBoYnQ1ZmZNZDlHdnlNeVZqQ01oL2llL1lUdzRsZjM2b0lnZFgzcUErdHVO?=
 =?utf-8?B?Z2g2Q1hMZmdRbDU0QVZ2MzBYUTAzMDRFcHZIYlM2R3R6dWxqeEg1WHB3ZWpw?=
 =?utf-8?B?QlY2Wms4Si9vMDVCS0lWenh0NDNJUmJPVlVLbG55Wmo2aEZLZDJnelFXYUEy?=
 =?utf-8?B?b0N0aVlKaThkUHpocndteHViSndDL2orQ1dFY3RsS1dmTjNLYVJMQ05XMjJ4?=
 =?utf-8?B?T09kSlJ6QVVqQVZnZEd3MHF6RDJ4NkdtOUZobU82TVFtYWFEdXd3R1BsdFZI?=
 =?utf-8?B?TEpIVlhOZDRnejMxdWtOc1pYVkxiUHZ4bFluZEQzMHF0anQ4MU9Wbk01TVpP?=
 =?utf-8?B?U1ZUOS8rVjlmOVB5aGd0RGxjaksyNjNxbmExSFg4dFdjaTdWMDN6d0wxS2dU?=
 =?utf-8?B?anFQcmtrenRHMHdRZnpvSjE5cnVLWVZ2Y2xDRUNuekVYSnNoK01TVkdVRWVi?=
 =?utf-8?B?bVZNeVplekVmTnJYeXI0eElkK3FEbFBNWlAzbklBZUlzVm1ZNUlLN3BlenRS?=
 =?utf-8?B?OWZ0N3p0UkdILzhXTG82M2N0NXpGcUVvKzJpSXY2MUVaaWN4emdqci9PMkFQ?=
 =?utf-8?B?MzY1Ni9QdUdpbkNSWWJkVUVwL2VrN2xUditsck11V2ticWNNaFNUNzlOVW5q?=
 =?utf-8?B?NnY5QVdCMUxWanE3dHpjbTJXdk5mVmNyL21yclFaNUJ5MDNHay90dStTTkZh?=
 =?utf-8?B?eUpMakhxT1MzbVI3T3M1cmVjbnZISGhGb3VLWlo0ZE05MjdpQ1pQVXBPdEU3?=
 =?utf-8?B?aW9iejdGQmdtbzUwNW8wdVhpNjl2TG9DRGh5Z0hsVjEveEdGWHo4R1I4Q3BM?=
 =?utf-8?B?OVNnc2hzWW9UUHNXOXFzdjlTQzhxNElQWHUrVnozdlVGTFgzQUFlenkvZlBH?=
 =?utf-8?B?R3MzZlJ1WUorNitVU2J2ZjZFeXhHQS8vV1RyOW5RcVZjb05qMWlCVnlGS05t?=
 =?utf-8?B?YWNidVJHMUJlb21TWFk2L1ZGQ3FSYkJ1RGtRTk0vMUkzTzFucCtKTjFVYVlr?=
 =?utf-8?B?aHNxem55aHlzOTlGWUl5UU5lV1lXY2ZiUEEyQ08wa3NoUGQwYmRKajVMQjZN?=
 =?utf-8?B?ZzJVZFY4cWdUMkNKOFBIaUZlSU9oVXp2VzQxMXoyTHJJNmNOZFl1aWxua1lO?=
 =?utf-8?B?MFczZjRvdTUxY1dQRWdpSVc4RzdKb0ZWRVg1ZWo1dkYzSy9jTnBFZHdFcUw3?=
 =?utf-8?B?dktvNjQ1WnYxMzNoUEZIaEQ3dHJ1QmF1ZUdNSVlBMHRjcExiZnR5dDFNVWIr?=
 =?utf-8?B?eCs1b0k4czhYaUpWdDd2NzUxVUNXdHpVSW5UalZXckNYcGtVeHo1QngySEtL?=
 =?utf-8?B?Y1BPT1J1UTlDaXBMdkFSYUNlb1dUMnZuWlZoTWpjUmtwZWNXdDR3YnlkOHlR?=
 =?utf-8?B?eXY5TGtDYTFlMG51RlFsbkpiK09QWWJYMmlKenFGWStwOXpmdWZWdldJMHhC?=
 =?utf-8?B?czFsNTI1SFVxY0RHM0ppaDliUlZGd1E1WTM0OWRydmMydUF4QXhEaGVpMzdZ?=
 =?utf-8?B?a0RHRVlBQnJZc1poMjA1aFk4ZmFMKzZxMFJEY3VRYjhtM3V6LzZkekRwbFRn?=
 =?utf-8?B?cjNMdFFvaDFFYzltNnZnUUIyYnVMMzkva1Q4ZHpzTGlua3A5OXJGTG05SWdJ?=
 =?utf-8?B?Mk9jL1VZc20rR3RaK1oxV2VPMWozVGJTRFZkK0xQdnVJbTRUR21wazA5NjBZ?=
 =?utf-8?B?NXVZU3RZQkQ1ZnlIQkpwT1VweUVXdk5SaDFzdEdZTklCSG92MVRONWFXN3NQ?=
 =?utf-8?B?Q0ZmTlVsZlVJblpQNUJtaGhQTGdiRWZFbGZaSHRCcC91c0JVUkl1M3B4MjJE?=
 =?utf-8?B?OTZVOGVVQWUyOXBUUndpTEtPWkhBcGtXZHRwUWdzTlpCc1hmZEZIZ0lwb0JY?=
 =?utf-8?Q?RXznXIge/n99/oIVDK?=
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8820.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aebdc4a-253b-482f-de58-08df1e09871b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 09:10:37.9724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3UHkUqrgZa3ZmTEnlc3hq6tZu1BWBj1a3g8GPRdqahTFQ/1npvkrcI8Nx7xSRofs9j1UDNljSL/61NJclWNWaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11306
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_021044_658476_30AF9A9C 
X-CRM114-Status: GOOD (  31.57  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPg0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMjksIDIw
MjYgNDoyMyBQTQ0KPiBUbzogQm91Z2ggQ2hlbiAoT1NTKSA8aGFpYm8uY2hlbkBvc3MubnhwLmNv
bT4NCj4gQ2M6IFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBrZXJuZWwub3JnPjsgTWljaGFlbCBX
YWxsZQ0KPiA8bXdhbGxlQGtlcm5lbC5vcmc+OyBUYWthaGlybyBLdXdhbm8gPHRha2FoaXJvLmt1
d2Fub0BpbmZpbmVvbi5jb20+Ow0KPiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0
PjsgVmlnbmVzaCBSYWdoYXZlbmRyYQ0KPiA8dmlnbmVzaHJAdGkuY29tPjsgbGludXgtbXRkQGxp
c3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBtaWNo
YWVsQHdhbGxlLmNjOyBCb3VnaCBDaGVuDQo+IDxoYWliby5jaGVuQG54cC5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjJdIG10ZDogc3BpLW5vcjogY2xlYXIgdGhlIGRlZmF1bHQgUkRDUiBv
cGNvZGUgd2hlbg0KPiBlbnRlcmluZyBPY3RhbCBEVFINCj4gDQo+IE9uIDI5LzA5LzIwMjYgYXQg
MTQ6NTM6MDcgKzA4LCBoYWliby5jaGVuQG9zcy5ueHAuY29tIHdyb3RlOg0KPiANCj4gPiBGcm9t
OiBIYWlibyBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+DQo+ID4NCj4gPiBUaGUgY29yZSBkZWZh
dWx0cyBvcGNvZGVzLnJlYWRfc3IyIHRvIHRoZSBsZWdhY3kgUkRDUiBvcGNvZGUgKDB4MzUpLg0K
PiA+IEluIDhELThELThEIG1vZGUgdGhlIG9wY29kZSBpcyBleHRlbmRlZCB0byB0d28gYnl0ZXMg
cGVyIGNtZF9leHRfdHlwZSwNCj4gPiBidXQgdGhlIHJlc3VsdGluZyBjb21tYW5kIGlzIG5vdCBh
IHZhbGlkIFNSMiByZWFkIGZvciB0aGVzZSBmbGFzaGVzLA0KPiA+IHdoaWNoIGFjY2VzcyB0aGVp
ciBzdGF0dXMvY29uZmlnIHJlZ2lzdGVycyB0aHJvdWdoIGEgdmVuZG9yLXNwZWNpZmljDQo+ID4g
aW5kaXJlY3QgcmVnaXN0ZXIgc3BhY2UuIFNpbmNlIHNwaV9ub3JfY2FjaGVfc3JfbG9ja19iaXRz
KCkgbm93IHJlYWRzDQo+ID4gU1IyIGR1cmluZyBpbml0LCBpLmUuIGFmdGVyIHRoZSBzd2l0Y2gg
dG8gT2N0YWwgRFRSLCB0aGUgZXh0ZW5kZWQgUkRDUg0KPiA+IGdldHMgbm8gZGF0YSBiYWNrIGFu
ZCB0aGUgcmVhZCB0aW1lcyBvdXQgKG9uIGkuTVggRmxleFNQSTogLUVUSU1FRE9VVA0KPiA+IGFu
ZCBhIGNvbnRyb2xsZXINCj4gPiBXQVJOKCkgZHVyaW5nIHByb2JlIHdpdGggTWljcm9uIE1UMzV4
VSBhbmQgTWFjcm9uaXggb2N0YWwgcGFydHMpLg0KPiA+DQo+ID4gQ2xlYXIgcmVhZF9zcjIgd2hl
biB0aGUgc3dpdGNoIHRvIE9jdGFsIERUUiBhY3R1YWxseSBzdWNjZWVkcywgc28gdGhlDQo+ID4g
U1IyIHJlYWQgaXMgc2tpcHBlZCAoYSBjbGVhcmVkIG9wY29kZSBhbHJlYWR5IG1lYW5zICJ1bnN1
cHBvcnRlZCIpLg0KPiA+IERvaW5nIGl0IGluIHNwaV9ub3Jfc2V0X29jdGFsX2R0cigpIGtleXMg
b2ZmIHRoZSByZWFsIHJ1bnRpbWUNCj4gPiBwcm90b2NvbDogYSBmbGFzaCB0aGF0IGFkdmVydGlz
ZXMgT2N0YWwgRFRSIGJ1dCBydW5zIGluICh4KVNUUiBiZWNhdXNlDQo+ID4gdGhlIGhvc3QgbGFj
a3Mgc3VwcG9ydCBrZWVwcyBpdHMgdXNhYmxlIFJEQ1IuDQo+ID4NCj4gPiBBc3Npc3RlZC1ieTog
TExNDQo+ID4gRml4ZXM6IGI3YjYzNDc1OTAzYyAoIm10ZDogc3BpLW5vcjogQ3JlYXRlIGEgbG9j
YWwgU1IgY2FjaGUiKQ0KPiA+IEZpeGVzOiA2MzQ4OTAwMmQzOTcgKCJtdGQ6IHNwaS1ub3I6IFJl
ZmFjdG9yIFJlYWQgU3RhdHVzL1dyaXRlIFN0YXR1cw0KPiA+IHN1cHBvcnQiKQ0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiBD
aGFuZ2VzIGluIHYyOg0KPiA+IC0gUmV3b3JrIHRoZSBmaXggZm9sbG93aW5nIHJldmlldzogaW5z
dGVhZCBvZiBndWFyZGluZyB0aGUgcmVhZCBhdCBydW50aW1lDQo+ID4gICBpbiBzcGlfbm9yX3Jl
YWRfc3IyKCksIGNsZWFyIHRoZSBkZWZhdWx0IFJEQ1Igb3Bjb2RlLnJlYWRfc3IyIG9uY2UsIGF0
IHRoZQ0KPiA+ICAgcG9pbnQgdGhlIHN3aXRjaCB0byBPY3RhbCBEVFIgc3VjY2VlZHMgKHNwaV9u
b3Jfc2V0X29jdGFsX2R0cigpKS4NCj4gDQo+IEkgZG9uJ3QgZ2V0IHRoYXQgY2hvaWNlLiBXaHkg
c3dpdGNoaW5nIHdoZW4gT2N0YWwgRFRSIHN1Y2NlZWRzIG9ubHk/IFNSMiBpcw0KPiBlaXRoZXIg
c3VwcG9ydGVkIG9yIG5vdCBzdXBwb3J0ZWQsIEkgZG9uJ3QgdGhpbmsgaXQgaXMgYW55d2F5IGRp
ZmZlcmVudCB3aGVuDQo+IGVudGVyaW5nIG9jdGFsIERUUiBtb2RlLCBpcyBpdD8gU28gSSB3b3Vs
ZCBleHBlY3QgU1IyIHRvIGJlIGNsZWFyZWQgZWFybGllciB0aGFuDQo+IHRoYXQsIG9uY2Ugd2Ug
a25vdyB0aGUgY2hpcCBpcyBvY3RhbCBEVFIgY2FwYWJsZS4gQW5kIHRoaXMgbXVzdCBiZSBlYXJs
eQ0KPiBlbm91Z2ggc28gdGhhdCBtYW51ZmFjdHVyZXIgZHJpdmVycyBjYW4gc3RpbGwgc2V0IHRo
ZWlyIG93biB2YWx1ZS4NCj4gDQo+IEkgYW0gd29uZGVyaW5nIHdoZXRoZXIgd2Ugc2hvdWxkIHNp
bXBseSBkcm9wIHNyMiBvcGNvZGUgaW4gdGhlIFFFUiBTRkRQDQo+IHBhcnNpbmcgZW50aXJlbHkg
Zm9yIG9jdGFsIERUUiBkZXZpY2VzIChNaWNoYWVsPykuDQoNClRoZSByZWFzb24gSSBjbGVhciBp
dCBhdCB0aGUgcG9pbnQgT2N0YWwgRFRSIGFjdHVhbGx5IHN1Y2NlZWRzIHJhdGhlciB0aGFuDQog
Im9uY2UgdGhlIGNoaXAgaXMgb2N0YWwtRFRSLWNhcGFibGUiIGlzIHRoYXQgY2FwYWJpbGl0eSAh
PSBydW5uaW5nIG1vZGU6IA0KYSBjaGlwIGNhbiBhZHZlcnRpc2UgT2N0YWwgRFRSIHdoaWxlIHN0
aWxsIHJ1bm5pbmcgaW4gKHgpU1RSIGJlY2F1c2UgdGhlIGhvc3QgDQpjb250cm9sbGVyIGRvZXMg
bm90IHN1cHBvcnQgOEQgKHNlZSByZXBseSBiZWxvdykuIEluIHRoYXQgKHgpU1RSIGNhc2UgUkRD
UiBpcw0KIHZhbGlkIGFuZCBuZWVkZWQsIHNvIGtleWluZyBvZmYgY2FwYWJpbGl0eSBhbG9uZSB3
b3VsZCB3cm9uZ2x5IGRyb3AgYSB1c2FibGUNCiBTUjIgcmVhZC4NCg0KVGhhdCBzYWlkLCBJIGFn
cmVlIHRoZSBjdXJyZW50IHNwb3QgaXMgYXdrd2FyZCBhbmQgZG9lcyBub3QgbGV0IG1hbnVmYWN0
dXJlciANCmRyaXZlcnMgb3ZlcnJpZGUgdGhlIHZhbHVlLiBJJ20gaGFwcHkgdG8gbW92ZSBpdCBl
YXJsaWVyLiBUd28gb3B0aW9uczoNCjEsIENsZWFyIGl0IGR1cmluZyBTRkRQIFFFUiBwYXJzaW5n
IChhcyB5b3Ugc3VnZ2VzdCkgZm9yIG9jdGFsLURUUi1jYXBhYmxlIGRldmljZXMuDQogICAgIFRo
aXMgaXMgdGhlIG5hdHVyYWwgcGxhY2UgbmV4dCB0byB0aGUgZXhpc3RpbmcgcmVhZF9zcjIgPSAw
IFFFUiBjYXNlcywgYW5kIGl0IHJ1bnMgDQogICAgICBiZWZvcmUgdGhlIG1hbnVmYWN0dXJlciBs
YXRlX2luaXQvZml4dXBzLCBzbyBhIGRyaXZlciBjYW4gc3RpbGwgaW5zdGFsbCBpdHMgb3duIFNS
Mg0KICAgICAgb3Bjb2RlIGFmdGVyd2FyZHMuIA0KICAgICBNeSBvbmx5IGNvbmNlcm4gaXMgdGhl
IGNhcGFiaWxpdHktdnMtcnVubmluZy1tb2RlIHBvaW50IGFib3ZlIOKAlCB3ZSdkIGJlIA0KICAg
ICBjbGVhcmluZyBiYXNlZCBvbiBhZHZlcnRpc2VkIDhEIGNhcGFiaWxpdHksIG5vdCBvbiB3aGV0
aGVyIDhEIGlzIGFjdHVhbGx5IGVudGVyZWQuDQoNCjIsIENsZWFyIGl0IGluIHNwaV9ub3JfbGF0
ZV9pbml0X3BhcmFtcygpIGFmdGVyIHRoZSBtYW51ZmFjdHVyZXIgaG9va3MsIGdhdGVkIG9uIA0K
ICAgICBvY3RhbC1EVFIgY2FwYWJpbGl0eSwgc28gdmVuZG9yIHZhbHVlcyBzZXQgaW4gdGhlaXIg
bGF0ZV9pbml0IGFyZSBwcmVzZXJ2ZWQuDQoNCklmIHRoZSBjYXBhYmlsaXR5LWJhc2VkIGFwcHJv
YWNoIGlzIGFjY2VwdGFibGUgKGkuZS4gd2UgYWNjZXB0IHRoYXQgYSBjaGlwIGFkdmVydGlzaW5n
DQogOEQgYnV0IGZvcmNlZCB0byBTVFIgYnkgdGhlIGhvc3QgbG9zZXMgaXRzIFJEQ1IpLCBJJ2xs
IGdvIHdpdGggZHJvcHBpbmcgaXQgaW4gdGhlIFFFUiBTRkRQDQogcGFyc2luZy4gTWljaGFlbCwg
ZG8geW91IGhhdmUgYSBwcmVmZXJlbmNlPw0KPiANCj4gDQo+ID4gLSBLZXkgdGhlIGNsZWFyIG9m
ZiB0aGUgcmVhbCBydW50aW1lIHByb3RvY29sIHNvIGEgZmxhc2ggdGhhdCBhZHZlcnRpc2VzDQo+
ID4gICBPY3RhbCBEVFIgYnV0IHJ1bnMgaW4gKHgpU1RSIChob3N0IHdpdGhvdXQgOEQgc3VwcG9y
dCkga2VlcHMgaXRzDQo+ID4gICBSRENSLg0KPiANCj4gQXJlIHlvdSBzdXJlIHRoaXMgaXMgYSB2
YWxpZCBjYXNlPw0KDQpZZXMuIHNwaV9ub3Jfc2V0dXAoKSBjb21wdXRlcyBzaGFyZWRfbWFzayA9
IGh3Y2Fwcy0+bWFzayAmIHBhcmFtcy0+aHdjYXBzLm1hc2ssIA0KaS5lLiB0aGUgaW50ZXJzZWN0
aW9uIG9mIGZsYXNoIGFuZCBjb250cm9sbGVyIGNhcGFiaWxpdGllcy4gSWYgdGhlIGhvc3QgZG9l
cyBub3Qgc3VwcG9ydCA4RCwgDQpTTk9SX0hXQ0FQU19SRUFEXzhfOF84X0RUUiBpcyBub3QgaW4g
c2hhcmVkX21hc2ssIHNwaV9ub3Jfc2VsZWN0X3JlYWQoKSBwaWNrcyBhIA0Kbm9uLThEIHJlYWRf
cHJvdG8vd3JpdGVfcHJvdG8sIGFuZCBzcGlfbm9yX3NldF9vY3RhbF9kdHIoKSBiYWlscyBvdXQg
ZWFybHkgYXQ6DQoNCmlmICghKG5vci0+cmVhZF9wcm90byA9PSBTTk9SX1BST1RPXzhfOF84X0RU
UiAmJg0KICAgICAgbm9yLT53cml0ZV9wcm90byA9PSBTTk9SX1BST1RPXzhfOF84X0RUUikpDQoJ
cmV0dXJuIDA7DQoNClNvIHRoZSBjaGlwIHN0YXlzIGluICh4KVNUUiB3aXRoIHJlZ19wcm90byA9
PSBTTk9SX1BST1RPXzFfMV8xLCBhbmQgUkRDUiBpcyBzdGlsbCBhIHZhbGlkIA0Kc2luZ2xlLWJ5
dGUgU1IyIHJlYWQgdGhlcmUuIFRoYXQgaXMgdGhlIGNhc2UgSSB3YW50ZWQgdG8gYXZvaWQgYnJl
YWtpbmcgYnkga2V5aW5nIHRoZSBjbGVhcg0KIG9mZiB0aGUgbmVnb3RpYXRlZCBydW50aW1lIHBy
b3RvY29sIHJhdGhlciB0aGFuIHRoZSBhZHZlcnRpc2VkIGNhcGFiaWxpdHkuIElmIHdlIG1vdmUg
dGhlIA0KY2xlYXIgdG8gY2FwYWJpbGl0eS1iYXNlZCBTRkRQL2xhdGVfaW5pdCBhcyBkaXNjdXNz
ZWQsIHRoaXMgaXMgZXhhY3RseSB0aGUgc2NlbmFyaW8gd2UgbmVlZCB0byANCmJlIGNvbWZvcnRh
YmxlIHJlZ3Jlc3NpbmcgKGFuIDhELWNhcGFibGUgcGFydCBvbiBhIG5vbi04RCBob3N0IHdvdWxk
IGxvc2UgaXRzIFJEQ1IgcmVhZCBvZiBTUjIpLg0KDQpSZWdhcmRzDQpIYWlibyBDaGVuDQoNCj4g
DQo+IFRoYW5rcywNCj4gTWlxdcOobA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
