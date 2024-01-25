Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B965C47258
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jan 2024 22:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5YtA+f2TjdbpDcoLvNNKDVdRcHAUEPuNhtb9YlVl5E=; b=h+NKow8qjzOssp
	y0yIcCUzvsCMk2M7YRYiDfV66SifFrD1m5rhVqMie5bM28v5sPtjadnCdJUDQLA/0/eUIYCpBLr99
	wVC1c738J7rhO6KPAm7htypGtRQ8uhsVDZGZs5m22feVwNxu+HvJaJY24Q5/ljeBb7mwaGVxqhfG+
	EEd/6UHX0lQDkgjEl2afB8R+HbRc0JPMTs8iK0F9im0lV2IbgdXwjYNkPGqeg8JmWh1mQmnG94uq8
	72AhZw+fiRxKDrzBVG/6Q7zNwsX4nY/CQqet8chpRLcDWjX0cZ7bMsSCU1YbmMrvdHMw9sSQ7ZNlA
	ljM/OZEvc6O5X8nQiLRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT8BW-00000002CTz-1jJa;
	Thu, 25 Jan 2024 22:26:58 +0000
Received: from mail-sl2kor01on0627.outbound.protection.outlook.com ([2a01:111:f400:feac::627] helo=KOR01-SL2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT8BS-00000002CSf-3els
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jan 2024 22:26:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DiBo3mX8qZiZinpiifcz2vMK0COg3m8LMwxA6UxDUWZ8+vmNTlyc2D6qMxuaIBsNrHGHWEgbXy8BJhn1YyeHS3M1/vbdCoovd+pJCo+mVfK+UNoH2w8BcA3yviWfH8lARzpvPSBbEYLHA3V2BVwOS+MSCEw3aC9lkvdb4zJ6ZyOwCP9H3p1SFyLSwIs4YKv+F7J1HdSxBou4CdGExty235nfgSK9v6ugwTupRkELo7GGAfYbOWf24GnLIexryT5pUHFMNNBUhiE+i/djE2mdMYAamRyBd1UQgIVXW4/JE60iaDoK+hPGfmkvX6aNIGHKrONdffECEedsZKnTJGvowQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5HFVCn14MPKf3X6AqDW0azbaIRq6Y8IqYOi0ZBezBQ=;
 b=C92Q0ekmtXwkwpWmRdkfyubu3Qky1FimnZNbwMUoFcy8uo5xeRBmbdLOQhU1c86N+1zW0cNjhXcM0JZzFGAH1XYdDw86+cNQVHc1EToMPnCieSrkxcG2Vsrxg2N96uCTm0sK6VB6yypIf/sLyjN2wYpTjdtlF3LwDfQSGyJoa8TQSRbYuwcySDf0Dm8UFIRd93ujP9KZoxw+370qMbkD7nx71jNXrYClgmEQYogGxNyNKz8kRUT3yNmoa/nbsAW6o58DslPctNgF9CmqOSt718fCu0Da/GJbYeCo3tbuLwusjkccKz9VMgzy/rPaHVnR4EMBMHUJouki8fQLaU/3eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skyhighmemory.com; dmarc=pass action=none
 header.from=skyhighmemory.com; dkim=pass header.d=skyhighmemory.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skyhighmemory.onmicrosoft.com; s=selector1-skyhighmemory-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5HFVCn14MPKf3X6AqDW0azbaIRq6Y8IqYOi0ZBezBQ=;
 b=nErvfug49MkX2HHnzp/frWtRgQaNY9BTringtIBw7qoTUplmDcId+yNNfJIn7cAv7JZ7AnmxRVBf4hgkF3kjcUwaobtUscKD7C8JmdKaeCY7l5WEmTd4VnPZPjI622cx22GKlgE7ycnts8faJRZM37hPEgySTN6NKOHCLOpFsr9w9ml6NgnCb6OTY9uxlDOgpPr5iGyhzPYsVsKHe4hQaN69LQ/S2Tz0KOSgpkK0vypZXN10deQs6Bi3a2qPNadVGqq62VOuX3OOg6QyN/Yh1JqPn3FHLmCHvRefXJ7hLrSAFwh+qLME2klOz4VKotBrvm45GFF6K6bNk0vl7o0sEg==
Received: from PS2P216MB1185.KORP216.PROD.OUTLOOK.COM (2603:1096:301:56::10)
 by SL2P216MB2003.KORP216.PROD.OUTLOOK.COM (2603:1096:101:152::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Thu, 25 Jan
 2024 22:26:42 +0000
Received: from PS2P216MB1185.KORP216.PROD.OUTLOOK.COM
 ([fe80::29c3:e88e:a010:56de]) by PS2P216MB1185.KORP216.PROD.OUTLOOK.COM
 ([fe80::29c3:e88e:a010:56de%5]) with mapi id 15.20.7228.027; Thu, 25 Jan 2024
 22:26:41 +0000
From: Mohamed Sardi <moh.sardi@skyhighmemory.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Kyeongrho.Kim <kr.kim@skyhighmemory.com>, "tudor.ambarus@microchip.com"
	<tudor.ambarus@microchip.com>, "p.yadav@ti.com" <p.yadav@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"richard@nod.at" <richard@nod.at>, Mohammad Nada
	<Mohammad.nada@skyhighmemory.com>, Changsub.Shim
	<changsub.shim@skyhighmemory.com>
Subject: Re: [SkyHigh Memory SPI NAND Driver]
Thread-Topic: [SkyHigh Memory SPI NAND Driver]
Thread-Index: AQHaPzrkQfH71ygAnk28xsGw/vDWzLDP8++AgAPob9CAAGeNAIASKhEAgALjHgCAAaiFgA==
Date: Thu, 25 Jan 2024 22:26:41 +0000
Message-ID: <2852C8AE-8A86-4D92-B3CA-252BC0D5DD06@skyhighmemory.com>
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
x-ms-traffictypediagnostic: PS2P216MB1185:EE_|SL2P216MB2003:EE_
x-ms-office365-filtering-correlation-id: ca81d615-c3de-4610-fb55-08dc1df4b4a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /dt8oJT9TdX/POVcGodUOfyv6QWs6ewdMOhz3gYEEwuc1jUMCowp9PW7XwgVByB9771eShdPr5bw1ykkdzX87KDnYl/ioqDahq3f+4/9aSKo1wpaTg3Agu5jhmhsHy1KtX0xMP93a2Q9P3PxIp9wkS80RXRAKZD5FVPC9MdJheNMOwqxjMg/S+DS1Dd05AzVbqQFlo+wkbmEcXcME/Gu6nFe2EAl+cQcszJUkvKpqc6+bPU+MVOQkqJkvO1iKMFLIkjQx8WO53URLEX8Fm8H0RmG4cBHeOy7sPvs5EpoSmb6teF1SOlviSM65pbKg9wGrdpQHkn+DFWJUEb/xu8G0sF5J40PXXxKs5hY2A1AFr8Uq6PTcg0D1mCiB/9gLke8mdskSMdq3/dwKIm+Gqescg7HtzRWcLNDg9kbPh6ACr9a69fb8Mqmf6T8VHonX+ClhnKT9cpHxS5D4X97Np14pzaPadEdBPeg2Xv2pj7Tpr6qS6fIyP6jiKGF3Tgl1IfZJiCap4pvg+z2xd4TM7R+MC92/wGSxqi4H+FNjFvpqcZdm4BdbUTNLgWUNyvPHhqNbIJRAW1DbXHNqocxtueceERxQFf+iEyQbcnRTFSzjUoJBpibEr2OP3GqIzHi5nI9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1185.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(39850400004)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(38070700009)(66476007)(66946007)(316002)(66446008)(66556008)(76116006)(64756008)(6916009)(54906003)(91956017)(83380400001)(5660300002)(122000001)(2906002)(4326008)(8936002)(8676002)(71200400001)(2616005)(6506007)(6512007)(38100700002)(478600001)(966005)(6486002)(66574015)(107886003)(26005)(33656002)(36756003)(41300700001)(86362001)(82960400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aks2SmV6dlRUTVk4VjJTNW01eW9ua1AxdElQWWplOUJvWTBueG9TRERmMlkr?=
 =?utf-8?B?VGdUODg3cExCSVcxY1ZFTDVWb1NtM0FTeFIwUXZWU2EzVGdKak55aWFWQ0JT?=
 =?utf-8?B?WVRuUVUyUE5ZYWFsSTB0UEJIRjJIQWF6ckJxZFJzUjNXQVFMSy85ZjFyMjQw?=
 =?utf-8?B?VkdMbDZMWk5nOWtUVnppSTlaUHJjdExyZUtwNnA0NXZvejhqNWRhdDZVTHBZ?=
 =?utf-8?B?NWxqdDRFeCtPYWRveG5lOStLS0Q4RlAwaGszam1vVVVhcERXMmhpaVNlZGtS?=
 =?utf-8?B?S0o5QytpUnBDWmRFTTFsZGRzMnBoclVZbU9SbFY3VDk2bWtuRTZBSzdkZ3ll?=
 =?utf-8?B?Tm5JZ3o5ejlPVGRCcTNVbWM2WkVnNDRqOUZ5NW82MHZ2VW5IRVV2a2ZXRGhL?=
 =?utf-8?B?MVlmYnRWbEhJVlhwQkgzMitLWERlYzY5MFZkdmpHOUt1Vld0cXp2WlhpcFVq?=
 =?utf-8?B?SWFxdTRNRXFnbEFQeTcxYUZRQkhxRzJqOEdLMENoYWVaTDR1dkJvOXIyWXY5?=
 =?utf-8?B?S1N5L05Md2Z4aHMyL3dXSGwwcUthWkJaa21iOTk0WkN1NGpKZzIwZDFSRUto?=
 =?utf-8?B?a01MRUlucWRCOWw3NzBSQ0FpZ25wRU9hVVVIWDJod1RLQUxWODJ6YXl2Q2Y3?=
 =?utf-8?B?M1N0bUFHYVVtRWl4NXJMcm9KejFTSjdGZUhydFRiMnhWSWxMeHJ2K3hoZjRC?=
 =?utf-8?B?NDkzYXBuMUhUbGFoT25CTUcwWm5RN3QvdG56bHN3bFVLQmhESTgyb01iNzUr?=
 =?utf-8?B?V09rcXk1a3h6MS8rU3RIY3FDeGFKOWVPVHNqNlphMkc3VEUzRS9tQ240MFM5?=
 =?utf-8?B?N0tJRkZ0SUY4SDM4UkRmUlZWZDdIblQ0RnZ1SXpxWnBSYUQvRG9kTWs4aUdl?=
 =?utf-8?B?djgxd3k4QUFSdm9hK0M0MnF6bGQrb0NxR2NpVTNmbUNIN05wRTlORmlMd0Jx?=
 =?utf-8?B?NjJzMkk0UHZuUzBydFBya0VKa2RGMkM0ejg1TjhBR2F6V1oxQ3JndEtGVzVr?=
 =?utf-8?B?L2ZnZ1pYWEw2UmJjQmNPWTdqUE5GSE5EakNhaFNDNHJOL1ZMeFNXUFhuR2Fi?=
 =?utf-8?B?RW8xZE4xR2RNQjNEbHFnNHVGYm5mYS82NnJuTDlBMnNXL1A0WHpJVEhQUUMw?=
 =?utf-8?B?Tzk0aUpRK25FWkRsY0xyWUkxYW5YSVA2dTdpYVlEa0RvZTVEVUZLUExJc0c3?=
 =?utf-8?B?azFSdFJaV1grdW9TWnFyUzV2QWdTQWt2MmhYSWVLdksyR2xDS1pIRGpnK2xu?=
 =?utf-8?B?ZnFZV2NObnJOcFZHMGhDYi80bHNNSmUrWWVjTWxTTlgwNXJXN0RnRktzYzIr?=
 =?utf-8?B?cjhnUkREeFdUVkYvWnRkVExQNDhuNzl1UHFodEVJSzhuS2trVG5jd3NaUVN2?=
 =?utf-8?B?b0JsY2JpZVprenRBb2xRYVYwSnJONmxGc2JPZjhEWG5TTUFBTlBMZ25KUm8y?=
 =?utf-8?B?eUxtWFIxdzlvVUJxdDU2Z05RZzdSWmRQQktCV1FVS2U5YytRbjV5cGNkOXBF?=
 =?utf-8?B?cGhNWWVHMU16RUhJd1ZnRWZNaERuZ1E4dnNiNzM1YjNVTitxZ3FSRFkyM09G?=
 =?utf-8?B?c3VQKzRGdEY2dnhjVFRWdE8zS2JUQ2NUVVNCRHRtVFlMR1JFbVloZmVKOG1q?=
 =?utf-8?B?ektuZVYzKy9VSjVIdVNyeHZ6QzZ4ZWovSUowdm14TktBeGF2YkR4NnhsVFkw?=
 =?utf-8?B?K254SnBvV3Y1RkE3aFVTTFRIK21XWThiRWZIendiMUJGWWo0WW43MDZneDk1?=
 =?utf-8?B?TDNTNTBoaEZ2U1RBc21RcW9yUzlQNzd4T3QyOHhHdmMyWDdmMDg5T0JHdi93?=
 =?utf-8?B?aUd5ZGhoejFyQWhaWHhCazVFYU1OVkZTeFVMd2UxUjRheUd5Y3cwQWM5ak5s?=
 =?utf-8?B?NUZrWXFNek1oMWkzWkh4Ly9LTlU4bHlLK3AxZnNTL0VvTGUralFXVS9wbmRk?=
 =?utf-8?B?Q095NVZkTjhiNGRwTWROMVVSeHhlSytWaG82RitNS2ZWYVQzR2VHODNaUG9w?=
 =?utf-8?B?NCtXSEgxY0NxOC91VWlpL3BERlRZa3NEQldWVk91VXdzdllBUXR3VEdqY2Fv?=
 =?utf-8?B?Wjk1Z3lvOFBjSDk1STUyTU1jdWZSQ0VQZndnQVNIa203aEYxTldzazV4MEtv?=
 =?utf-8?B?YThlU0hpN2FCUnQ0MGl1YklOSFN0KzFpbFNQNWc5akkzVmZQSk5hdHMyNURV?=
 =?utf-8?B?c3c9PQ==?=
Content-ID: <724C4366D4096E419CB12F8C03393900@KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: skyhighmemory.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1185.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ca81d615-c3de-4610-fb55-08dc1df4b4a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 22:26:41.9101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 39b82b34-0966-49dc-81a7-5bcab7ea53c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /I3bXMH1hh4/sOtzl2I0li3xLT9fdtzRbh2K8TeSF0jDvkkLqNqoZSC9RDPJQXYfx2EXCwtFxCQq+2ZBH5eW4E7coU7K2zEAi32jw6RunHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_142654_947357_DEB137FA 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8gTWlxdWVsLA0KVGhhbmsgeW91IGZvciB5b3VyIHJlc3BvbnNlLiANCg0KT3VyIHVuZGVy
c3RhbmRpbmcgaXMgYWxpZ25lZCB3aXRoIHlvdXIgY29tbWVudC4NCg0KDQpUaGFua3MNCk1vaGFt
ZWQgDQoNCu+7v09uIDEvMjQvMjQsIDE6MDcgUE0sICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbSA8bWFpbHRvOm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+PiB3cm90
ZToNCg0KDQpIaSBNb2hhbWVkLA0KDQoNCm1vaC5zYXJkaUBza3loaWdobWVtb3J5LmNvbSA8bWFp
bHRvOm1vaC5zYXJkaUBza3loaWdobWVtb3J5LmNvbT4gd3JvdGUgb24gVHVlLCAyMyBKYW4gMjAy
NCAwMTowMTo1MyArMDAwMDoNCg0KDQo+IEhlbGxvIE1pcXVlbCwNCj4gDQo+IEkgaGF2ZSBhIHF1
ZXN0aW9uIGZvciBiYWQgYmxvY2sgbWFya2luZyBhbmQgY2hlY2tpbmcgb24gTGludXguLi4gYW5k
IEVDQy4NCj4gDQo+IERvIHlvdSBrbm93IGhvdyBiYWQgYmxvY2sgbWFya2luZyBpcyBkb25lPw0K
PiANCj4gMSkgQmFkIEJsb2NrIE1hcmtpbmc6IEFyZSB5b3VyIHdyaXRpbmcgbm9uIEZGIG9uIHRo
ZSBmaXJzdCAyIGJ5dGVzIG9mIHRoZSBPT0I/IERvIHlvdSBrZWVwIERldmljZSBFQ0MgT04gb3Ig
T0ZGPw0KPiAyKSBCYWQgYmxvY2sgQ2hlY2tpbmc6IERvIHlvdSByZWFkIHRoZSBmaXJzdCAyIGJ5
dGVzIG9mIHRoZSBPT0Igd2l0aCBFQ0MgT0ZGIG9yIGRvIHlvdSBrZWVwIEVDQyBPTj8NCg0KDQpJ
biB0aGUgcmF3IE5BTkQgd29ybGQsIGZvciBsZWdhY3kgcmVhc29ucyB0aGVzZSBjaGVja3MgYW5k
IHdyaXRlcyBhcmUNCmRvbmUgd2l0aCB0aGUgY29ycmVjdGlvbiBlbmdpbmUgZW5hYmxlZC4gQnV0
IEkgYmVsaWV2ZSB5b3UgYXJlDQppbnRlcmVzdGVkIGludG8gdGhlIFNQSS1OQU5EIHNpZGUgb25s
eSwgYW5kIGluIHRoaXMgY2FzZSB0aGUgRUNDIGlzDQphbHdheXMgZGlzYWJsZWQ6DQoNCg0KTWFy
a2luZzoNCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjgtcmMxL3NvdXJjZS9k
cml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMjTDc2OCA8aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvdjYuOC1yYzEvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyNMNzY4
Pg0KQ2hlY2tpbmc6DQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni44LXJjMS9z
b3VyY2UvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jI0w3MzMgPGh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L3Y2LjgtcmMxL3NvdXJjZS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3Jl
LmMjTDczMz4NCg0KDQpUaGFua3MsDQpNaXF1w6hsDQoNCg0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
