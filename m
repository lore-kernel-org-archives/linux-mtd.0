Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04032C48286
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 19:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eeMh58KwEjDP63zCrxAwfy7+g25yhajhzT66jEWoQzQ=; b=oYSP4sF+jXB1z2
	7T/jozuf8aHEg5NYHZlzwwlI/oVg/EYXDT/Ph3QyanFMn2x7zKrdirAkueyVjQ7b02sr//5eRoFhv
	+gekEoM5wa1PvKm+dJFg3XT+M84GIZHpai+TAHuohW7bvL8Iw0ca/hoJ8cxW/9YLzni+SqXlHyBMC
	4PmxQdpfBbq3ibPr8TG2UO2e5hBoTWq7Xpk2lyF8B2SeuZrLPHXGSdAMIvgaAqPFsd+MGMGPkaJe4
	SrhTqgU8Q/wwTSDxc2LD99YwRqSMr97eIO+kExYMniF0qNqHKOcxlRVLSBPh7WVDgL8zkLhtskTNg
	q6KNOcbxanDNdy8gKRzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVcvm-00000009BX4-0kXH;
	Thu, 01 Feb 2024 19:41:02 +0000
Received: from mail-sl2kor01on0625.outbound.protection.outlook.com ([2a01:111:f400:feac::625] helo=KOR01-SL2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVcvj-00000009BVh-2ILE
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 19:41:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kV4MADIG+hgQ1VsttM/KAMXppa7qtGU3Nt6Y/bOEaXClvR6X+6DCS+rhb8w1U1mNDMWq0xPq7O9ydQXN0m23N/oj3JxMLdFG6jaPObUPXHwyyRH1cUWks4zG7Ivnzj51UMEuRL7RPuRsOm/aADWwC6tFpAPeyMz6Dz0G+C8cDLRfrv7jJ049XBsV+3DNE2B+ullxEAPKhxonLf/S+qLSzHuBXac4HUojuvYkVbQcX1l2pidVLfoQUTaGibsjLkZqjad4tWOXBYd2JgJI83KBXrtR450WWqWHoHCN1NVpWNIA714iOzDuVJa8e+eIqQaM7cXHYkaziRZQLDTRom7r2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LXKf5TCOT+2VyJiq7UnTB5B7kWqNdZ7MvWB6fAp/hg=;
 b=Qe3QgpVLkLA1DQ9NbvDcO5hrZxa2faWDpJOORwtaay8M3wmKMdKcJsrcIL6CvBer4p+Bqlk3dfFP4e6KNns83sYLWTh4Sp7s7HP84PhdlmpTjcgFnCt7I1GmRiS3hXgqHqOXxJ5p39+1n28oUi7Z21LCbgot/IMj7BccZThAZeSyXQVuvxbXNayX3/BAVSNykAuSjEh4On/kQcfx+L+IZRgi9FFz5/8ccvtrEZ6QcVqFYVgY3Lstze0YEOS+TKspdjV7ed4wnBKXP3h/T/rbbty7PWBomZ9ZxvogIp+rPPaWbmWZjM/XOrPlYVeeNmUyCp+Qp145pXjj6d2JautyGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skyhighmemory.com; dmarc=pass action=none
 header.from=skyhighmemory.com; dkim=pass header.d=skyhighmemory.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skyhighmemory.onmicrosoft.com; s=selector1-skyhighmemory-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LXKf5TCOT+2VyJiq7UnTB5B7kWqNdZ7MvWB6fAp/hg=;
 b=FNqFNGpj8Rlgc44/Vwon/ROY5XjbThayIZaBcCzwrbRI0OVVudRpoFetIuyO6GvQ83JYtpHxcJWYnfC4PjHB6XWUM+0gVw9mBRHxJzmbq4lX0mTPSgpAN3A/K62ehBKIGkmHZ6+R5QxxSCuxl0BicG34dzjI3z9bM82ehpC+RbEXflpDJjKtWort9EVk0NNt4iHeNWA4K8U7g1FSxAIGbjp9gm2hDsodin2UHgzRf94D216PuK02apDPYGY54LtbivlP9YQ8qadHidHaZT2s1Xa7H0HRlC5DZXLBVrnOsL6Wm6YYkEjbKKsrbrB4WCjs0MRxFpQ7wipBn1VntjdORA==
Received: from PS2P216MB1185.KORP216.PROD.OUTLOOK.COM (2603:1096:301:56::10)
 by SE1P216MB1495.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.26; Thu, 1 Feb
 2024 19:40:51 +0000
Received: from PS2P216MB1185.KORP216.PROD.OUTLOOK.COM
 ([fe80::29c3:e88e:a010:56de]) by PS2P216MB1185.KORP216.PROD.OUTLOOK.COM
 ([fe80::29c3:e88e:a010:56de%5]) with mapi id 15.20.7249.027; Thu, 1 Feb 2024
 19:40:51 +0000
From: Mohamed Sardi <moh.sardi@skyhighmemory.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Changsub.Shim <changsub.shim@skyhighmemory.com>,
	"tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>, "p.yadav@ti.com"
	<p.yadav@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "richard@nod.at" <richard@nod.at>, Mohammad
 Nada <Mohammad.nada@skyhighmemory.com>, Mohamed Sardi
	<moh.sardi@skyhighmemory.com>, Changsub.Shim
	<changsub.shim@skyhighmemory.com>
Subject: Re: [SkyHigh Memory SPI NAND Driver]
Thread-Topic: [SkyHigh Memory SPI NAND Driver]
Thread-Index: AQHaPzrkQfH71ygAnk28xsGw/vDWzLDP8++AgAPob9CAAGeNAIASKhEAgALjHgCADHqAAA==
Importance: high
X-Priority: 1
Date: Thu, 1 Feb 2024 19:40:51 +0000
Message-ID: <D726EA9A-1C18-4720-A87C-0340D675B514@skyhighmemory.com>
References: <7C13C29F-DBE0-494F-8BA6-99BB68FD08AF@skyhighmemory.com>
 <20240108144719.3198373e@xps-13>
 <SE2P216MB2102316F0F2D8134C755C37283682@SE2P216MB2102.KORP216.PROD.OUTLOOK.COM>
 <20240111083838.7f215daf@xps-13>
 <880CF70D-DC61-4E18-9A31-48A82A45CA3E@skyhighmemory.com>
 <20240124180716.71e26b8c@xps-13>
In-Reply-To: <20240124180716.71e26b8c@xps-13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.81.24011420
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skyhighmemory.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS2P216MB1185:EE_|SE1P216MB1495:EE_
x-ms-office365-filtering-correlation-id: e07091df-4ef7-4c38-e215-08dc235db28c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eRsDSO21lXgaTugo1XGmgPTihUMO5KMw1WOCHDF/W8NzXmKqCNyVIPQBjxdDt+vCT9QhhHMm1TyAQP8+dRCbo4V3J19LD50qxmnUPwSuQV3B4zxIW/deTvSenTLiMYqsZE+TMrkdyphU3LuDmYDnCtcLMmHXFVwdvhMyn1FPGPwkzYMDc23NiGe8e4FgqPqj9bNE1amoZ/46xI4U3xoV3j4Kpprrk+hprDwBZ69WWV9Am6DPY5cJ5NJrEKssfyPmQ6FqNnYL4k/peWMDVufk5OCbTFL5qjbPJ4gXnw9Yk0zjvRNvz2Zl7Ph1v9dgdL1Jf6RFKEqrHY1RHAYqhfr8BGgpC7y8ONrrsIxHCfkV7rMRamDESEIs9MKmIGcpCY1X9TmEE61oMu4jpNHtBx7BF4Q9XVpWLmHpo7jQS21W2eNqdYvgdbDzACcHAWLXD9hjSJqkr3yKHtj7sbELhaRcMiDXLGBdyvBc87Hm4/tMUj4S+jchJdiQt2A8uSvowFyoXrMC4ON0tufYZIPRxd365J3Sg/tXNj5/Aw+OTkeuCiFFJV4Rgt0JzTZhCvP/UcmDVsCCXQs9HpwgPTQTtZWFfkMbqA80cVwB37QSCYvkWPOovHyINhdC3kly7cvAgQKTbtH+qrbjMqYKiIdlUCvhsg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1185.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(366004)(346002)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66574015)(41300700001)(83380400001)(71200400001)(2616005)(107886003)(6506007)(6512007)(478600001)(6486002)(966005)(26005)(76116006)(54906003)(64756008)(66556008)(66946007)(66476007)(66446008)(91956017)(6916009)(316002)(2906002)(4326008)(86362001)(8936002)(82960400001)(5660300002)(38100700002)(122000001)(36756003)(33656002)(8676002)(38070700009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnJEancyZWZvQjcwdTRPMmx6a2FZZnlYR1E2a0tGWm9hUHh4V09hM1VQWHpY?=
 =?utf-8?B?bG1xdlFTUStlTjZGTVdBZytnOVlQa3dHWHZSaU1NWVREM0JST2s0K2RLUDlG?=
 =?utf-8?B?YklHOWNCaWtOamtEclVYOEdvMW9LVzYvODBNc2NaTGErMnFFU08xYUtkNkdw?=
 =?utf-8?B?Qk1MT2pnTjUra3F4LzFFWEw2QTk5bFJlVmlhQjdEellBZWdxa3ZxaUgrSVdG?=
 =?utf-8?B?MjJxNlo1bzRmUmMwd1lvT1puNFV4N01mV0R0cFZHZ3VlYVBubXVWNEZqdnFQ?=
 =?utf-8?B?VjVKWlRUSkJkbmwxMnVpTTAvaHF4eTdhL2hmZC9VclhIdUViVVZYRjlwM2dV?=
 =?utf-8?B?WTdoaDYwZVdPV2ZURnh1c1IyK21DVE9wWXdtZk1uQVhrWGtFclRkQTc2bmpi?=
 =?utf-8?B?NXMvRXRpbUthcDRBbHdIenJrdlRkcitjSm83R2F6UWFqRE9vem5wOVp2VDRG?=
 =?utf-8?B?cDhSRkJQQS91R2hqOTFFcHV3MFQxckJYQ0UwcDBzdjRXeWptWTRnM3I5NnhU?=
 =?utf-8?B?WkVSbWpUeW9EZUQ3N3dibFpjR3BCUFBTdWZTRmN5OTFRQ2o4WHRadnBrY1Bl?=
 =?utf-8?B?NzZKNGdjZGtKN1AyWXhxUnpKM2ZlMFkzVWpTZzcrczNQK0dGOUJPVUhYSktt?=
 =?utf-8?B?MDdRMjdaU05KaEgwTEY0MG42WUd6WkorQ0xwWFBZWVQyc2RMYmFXUlM5Nm53?=
 =?utf-8?B?elhiMjB6VmNyUWNoZ1ZBeHl2UmY2Ymtpc2JlYkp1K2VsallGSlViNXd2L3NL?=
 =?utf-8?B?b1hlajJEMzN5dUE1QnF3QWZobllaZS9jUW1DSU5rVmxucjA1S0dCY2pueUxI?=
 =?utf-8?B?NDh2cFlPUUV5Vk1rdjJrOFZxUHA0eWFObzNwbEtXMmd0OXJzQjBiZ0swWFZD?=
 =?utf-8?B?R2pCNmRzN2FzajNtWDJENmkrRXRtWTNOL0x0V09UQ1BMU0NocVE0ZUt4YmdP?=
 =?utf-8?B?UVpZNXhrUDVJS2crdUU1N2NJSXJYOUZMUjBVbWNqQUFWK0o4aEsvQmxyb3Zk?=
 =?utf-8?B?TWRqNUlZd1c1c3VpNVpKKzdlck1HemZHNHN6eDVpcm9BRCs3MmlwdE9xano1?=
 =?utf-8?B?NzVWQ0x4akliOW5uTzhobmtYYmJ2ekNIMG85cDNHOXJHSkdmYWVSWEYzWEFF?=
 =?utf-8?B?K0pSZXJDR2hwUVBKQUJyM0dabFIvczQrK0FKeG96VU9pUzhRM1MzRHh2STVz?=
 =?utf-8?B?RHdQcUVsaDFZZFI0QUxBNU93c1JmSStRYUsySGFaZG5kbGF5N3hZQk5oN25B?=
 =?utf-8?B?cFlld25ybU91aDRKWGhaWW0zVHI5cXl3NUhPaXRhWkg3M3Y1ZzgwemxXWlB5?=
 =?utf-8?B?eHB0RzI4cmxQcUMreUgzYm5QQWhkRnJ5ODkwdVMzandGMEoyR1hpSnh2V2Fl?=
 =?utf-8?B?eVRyTDNDVXZDTGFEakNvN0NSOVpyM2wxMlM1b3JydFpqeWd5NTloYUp4bkxE?=
 =?utf-8?B?TnlKSlJqZ3JDMExPenJjTTRlV3IwU2JIWVpPQzdORzBlenpKOTlNYVNrRGdZ?=
 =?utf-8?B?ZXhSY0Z5L0J3eThXOWNKWXpvc1BwUUR6MHJRTWNBWUh1VDYyS3RIOVVGNXRn?=
 =?utf-8?B?clViQjR1blllSUY5WjJpTlI5djJ6aGd0cmR4M2VnZ3hiQWhQaFlsdGxIQnN6?=
 =?utf-8?B?aUROSmRRMXZkU1d6bEQrY3BSQjdOOTRYdCtFRHQ0dmRkVEJiSXNmL2prSFJm?=
 =?utf-8?B?R3hFQzJ5RDNFUkVQN0w1ZjgzNEpMMFRwRHhMN29DR3lraWI0KzBRLzl5TXJW?=
 =?utf-8?B?UnUvL1Q2RHQwQjhhaUk0RkU4OG9XWE4zaXFFRFUvcTBwcW5vdWdIT1Q4Wnlv?=
 =?utf-8?B?aFF1WDFOQUZlUkI5WmdlbnI3OHd3U054QWJueVNrMGNDNWlhWkFiV2xKM0Y3?=
 =?utf-8?B?WUo3VE5DeGhDd0MwK1ZWMnZ4MFVyRld6eGd4c1FBVFJTUVovdGd4cUVUbTE3?=
 =?utf-8?B?MXZ2TkxIMVpqZ2NlT3J4ZnY2Mi84bTZRSDhnT2JWa2Q5TSsvZmxvRzZmVU11?=
 =?utf-8?B?YlFmTmp1RGNFYXljQlVOT01rbHdkaUxjZUJIc0ZJeVkvVlpQWElRYlBJMjNM?=
 =?utf-8?B?Wjg1T1RidTd0Z0tEREVWOXJFUnV4YmxTQnQ2UXBSdmphSzBYSEVxYklER21s?=
 =?utf-8?B?Sk5mR2ovVXFCYTdseHBlRHV5M2YvQ3VabHJsUlhsb1F5UC9mZHM5Vjg3RGxR?=
 =?utf-8?Q?NM8I3sPKWxAGBPtJeK4Y5RQ=3D?=
Content-ID: <95D9EF2F5BB3794195EBE5D626917474@KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: skyhighmemory.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1185.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e07091df-4ef7-4c38-e215-08dc235db28c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 19:40:51.3754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 39b82b34-0966-49dc-81a7-5bcab7ea53c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: moXcUFGzNdEvsYiudTfhxMD9xnYqDS2Z54eupm4gXIrRAlurN3ZT0LysKINgfCDAkJoSAALY5riWjUNTXzdXlOm9rMrb0aqvuGH7K6Zym5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_114059_626849_DFF4334D 
X-CRM114-Status: GOOD (  11.61  )
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

RGVhciBNaXF1ZWwsDQpXZSB1bmRlcnN0YW5kIHRoYXQgeW91ciBwbGFuIHRvIHR1cm4gb2ZmIHRo
ZSBFQ0MgZm9yIEJhZCBCbG9jayBtYXJraW5nIGFuZCBjaGVja2luZy4uLiBmb3IgTGludXggVjYu
Li4NCg0KV2UgYWxzbyB1bmRlcnN0YW5kIHRoYXQgaW4gTGludXg1LjQgdGhlIGRyaXZlciBkaWQg
bm90IGhhdmUgRUNDIGNvbnRyb2wuLi4NCg0KTXkgcXVlc3Rpb24gaXMgYXMgZm9sbG93Og0KMSkg
RnJvbSB3aGljaCB2ZXJzaW9uIG9mIExpbnV4ICx0aGUgRUNDIGNvbnRyb2wgd2FzIGFkZGVkIGlu
IHRoZSBkcml2ZXI/IFdhcyBpdCBpbXBsZW1lbnRlZCBpbiBMaW51eCA1Lnh4Pw0KMikgV2hhdCB3
YXMgdGhlIGxlYWRpbmcgcmVhc29uL2N1c3RvbWVyIGxlYWRpbmcgdG8gdHVybiBvZmYgdGhlIEVD
QyBmb3IgYmFkIGJsb2NrIG1hcmtpbmcvY2hlY2tpbmc/DQpOb3RlOiBXZSBzYXcgdGhhdCBNVEsg
d2FzIHR1cm5pbmcgb2ZmIHRoZSBFQ0MgZm9yIEJhZCBibG9jayBtYXJraW5nIG9uIExpbnV4IDUu
NC4uLg0KDQozKSBXZSB0aGluayB0aGF0IHRoZSBFQ0Mgc2hvdWxkIGJlIHR1cm5lZCBvZmYgZm9y
IGJhZCBibG9jayBtYXJraW5nIGFuZCBjaGVja2luZywgaXMgaXQgcG9zc2libGUgZm9yIHVzIHRv
IHByb3ZpZGUgYSBwYXRjaC9kcml2ZXIgKFNITV9jb3JlLmMpIGZvciBMaW51eCB2ZXJzaW9uIHZl
cnNpb24gNi4uLiAgd2hlcmUgU0hNIGRldmljZXMga2VlcCB0aGUgRUNDIG9uLi4uDQogDQoNClRo
YW5rcw0KTW9oYW1lZCANCg0K77u/T24gMS8yNC8yNCwgMTowNyBQTSwgIk1pcXVlbCBSYXluYWwi
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIDxtYWlsdG86bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4+IHdyb3RlOg0KDQoNCkhpIE1vaGFtZWQsDQoNCg0KbW9oLnNhcmRpQHNreWhpZ2htZW1v
cnkuY29tIDxtYWlsdG86bW9oLnNhcmRpQHNreWhpZ2htZW1vcnkuY29tPiB3cm90ZSBvbiBUdWUs
IDIzIEphbiAyMDI0IDAxOjAxOjUzICswMDAwOg0KDQoNCj4gSGVsbG8gTWlxdWVsLA0KPiANCj4g
SSBoYXZlIGEgcXVlc3Rpb24gZm9yIGJhZCBibG9jayBtYXJraW5nIGFuZCBjaGVja2luZyBvbiBM
aW51eC4uLiBhbmQgRUNDLg0KPiANCj4gRG8geW91IGtub3cgaG93IGJhZCBibG9jayBtYXJraW5n
IGlzIGRvbmU/DQo+IA0KPiAxKSBCYWQgQmxvY2sgTWFya2luZzogQXJlIHlvdXIgd3JpdGluZyBu
b24gRkYgb24gdGhlIGZpcnN0IDIgYnl0ZXMgb2YgdGhlIE9PQj8gRG8geW91IGtlZXAgRGV2aWNl
IEVDQyBPTiBvciBPRkY/DQo+IDIpIEJhZCBibG9jayBDaGVja2luZzogRG8geW91IHJlYWQgdGhl
IGZpcnN0IDIgYnl0ZXMgb2YgdGhlIE9PQiB3aXRoIEVDQyBPRkYgb3IgZG8geW91IGtlZXAgRUND
IE9OPw0KDQoNCkluIHRoZSByYXcgTkFORCB3b3JsZCwgZm9yIGxlZ2FjeSByZWFzb25zIHRoZXNl
IGNoZWNrcyBhbmQgd3JpdGVzIGFyZQ0KZG9uZSB3aXRoIHRoZSBjb3JyZWN0aW9uIGVuZ2luZSBl
bmFibGVkLiBCdXQgSSBiZWxpZXZlIHlvdSBhcmUNCmludGVyZXN0ZWQgaW50byB0aGUgU1BJLU5B
TkQgc2lkZSBvbmx5LCBhbmQgaW4gdGhpcyBjYXNlIHRoZSBFQ0MgaXMNCmFsd2F5cyBkaXNhYmxl
ZDoNCg0KDQpNYXJraW5nOg0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuOC1y
YzEvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyNMNzY4IDxodHRwczovL2VsaXhp
ci5ib290bGluLmNvbS9saW51eC92Ni44LXJjMS9zb3VyY2UvZHJpdmVycy9tdGQvbmFuZC9zcGkv
Y29yZS5jI0w3Njg+DQpDaGVja2luZzoNCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L3Y2LjgtcmMxL3NvdXJjZS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMjTDczMyA8aHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuOC1yYzEvc291cmNlL2RyaXZlcnMvbXRkL25h
bmQvc3BpL2NvcmUuYyNMNzMzPg0KDQoNClRoYW5rcywNCk1pcXXDqGwNCg0KDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
