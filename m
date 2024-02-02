Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19AFC4828F
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Feb 2024 16:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9JpLFZsUrYfKUHLS2p4qgP4dM/qqbW9Hr3i7J1YovQ=; b=zmGhuvB6RAgTiq
	fDWt9L9nv9J9BGgTUEMuN6tmnYpIt2zxzqZmzQ5B80gS8SeWmQlVKX1KZg9DFrUrU+/CITV8pJiTs
	jCzulVtqiDs47oqbhbgWpG3MbVOZUhmYWIZQp4FutrD97C0isT4GE4naB4owf86fVBPwnfqRzy+8b
	81QBNXxNNN/q/ktgTgPCCvkWQ241C5jimX4DPjeU1ly2z+dMXMSMGYQSsITeP0GBzINgPs/oq4wtB
	FoRfpyfPCWZzZEsT8EMRDSi++YOvtxSzltFzEmPXwRe0EmCQvaU7oReOZwkatwOEaMwq70eOQgacW
	oduMbz2Mgkb10bOhM8wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwEj-0000000CG8s-323E;
	Fri, 02 Feb 2024 16:17:53 +0000
Received: from mail-sl2kor01on062d.outbound.protection.outlook.com ([2a01:111:f400:feac::62d] helo=KOR01-SL2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwEg-0000000CG74-37hx
	for linux-mtd@lists.infradead.org;
	Fri, 02 Feb 2024 16:17:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUzVh5ylVZflMJy4ILyEx3eKUFKBzq/IVkXAt/8/B6OgErMAJFhBGCtTm93Py3jrthgqjCfnbAueIkgooheuieal8TDgH/bdz9sCrN2NHLwJ9QXIISDTo8CRayfzOucwfOFZfCYHaLGmmNZ7CO8u7XXYWXeZblv3H7EDCgZkil02phtNOJPoZF7XlvyrFBXrz4qe3aBqYmq35bMvY3FPu3V+JbWoMXOVjddyDiKjS+1J0wfnG77FyE/A8Nlr+3eamUwpb6MSPADmrNLhSiyCBBL+kpE30TYSYy+Dx7TTuxzVjmQJnyMSUzhDR0IDbPK/waW3CvVNEX5Vd0YWvJNoSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmQShY9AMa5m9GFJV0424gfkrvsTnmHtUvO+RaVx/yw=;
 b=bW7c4daeT3jnXur6js1lmDllEwBuXFdgYcS2F85f2IPk4K/dyjWQjHWipQwnXAXx/7mOA7ERqA6X7BD8uFHBpIm5SSHfTs9qEGLoYkbyeXzn1XgIBhfwKfY3hEeZgE29DPpiRGH4MPf2tz+nTD95xmBcim3Sc3+Ze2litle3I1l2zpV7SqZgx9lW4AknCcSdzyjjnJhsRm/cnpv8duRstc82r31axl5yLXfCS2VvC1ttYrPoFuv2/fjgtrkt9LuJteHjc2AUfPxKsO9v2UpcMi92n2YRO9cKAaAXNUqy9eDgK8EyfFlOtrRXZYoK5iBsLhcvbs7hSvRl0PLkpap8+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skyhighmemory.com; dmarc=pass action=none
 header.from=skyhighmemory.com; dkim=pass header.d=skyhighmemory.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skyhighmemory.onmicrosoft.com; s=selector1-skyhighmemory-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmQShY9AMa5m9GFJV0424gfkrvsTnmHtUvO+RaVx/yw=;
 b=tUOyOKveRlsLxL70id72L9cUR/U8PSH5FaJRsNroL8/bvgtoiny3ubPajUp+QL1Ya5bTzKWRGC73cEUfGYIoEAZ1hZZwnlm37BY9U5FizMbr3elOtTN3kw2jk3UoMSS8My0XyO0uV0muYCSh/DGKi0ij4QLh5T6GzyBYBfi9Y7uR31OHJHSqEdZWXBQVg1poXrtROjy7oTz7XcfbYUW5oK63Ml0IEj60gn0bfUuR6arXjTivHpQSnJOuxydd76C1ws0foSReRjod9pgfgaWlrGwC6M/X3LkxJmvislnhFNSjMLMFYMinQ74PLm0FeIA3/o1ymOKq01Uw1748FVrYUA==
Received: from PS2P216MB1185.KORP216.PROD.OUTLOOK.COM (2603:1096:301:56::10)
 by SL2P216MB1497.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31; Fri, 2 Feb
 2024 16:17:43 +0000
Received: from PS2P216MB1185.KORP216.PROD.OUTLOOK.COM
 ([fe80::29c3:e88e:a010:56de]) by PS2P216MB1185.KORP216.PROD.OUTLOOK.COM
 ([fe80::29c3:e88e:a010:56de%5]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 16:17:43 +0000
From: Mohamed Sardi <moh.sardi@skyhighmemory.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Changsub.Shim <changsub.shim@skyhighmemory.com>,
	"tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>, "p.yadav@ti.com"
	<p.yadav@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "richard@nod.at" <richard@nod.at>, Mohammad
 Nada <Mohammad.nada@skyhighmemory.com>
Subject: Re: [SkyHigh Memory SPI NAND Driver]
Thread-Topic: [SkyHigh Memory SPI NAND Driver]
Thread-Index: AQHaPzrkQfH71ygAnk28xsGw/vDWzLDP8++AgAPob9CAAGeNAIASKhEAgALjHgCADHqAAIABmu0A//++qIA=
Date: Fri, 2 Feb 2024 16:17:43 +0000
Message-ID: <5BBDC99B-BD4B-44C3-8371-B1B12A303A58@skyhighmemory.com>
References: <7C13C29F-DBE0-494F-8BA6-99BB68FD08AF@skyhighmemory.com>
 <20240108144719.3198373e@xps-13>
 <SE2P216MB2102316F0F2D8134C755C37283682@SE2P216MB2102.KORP216.PROD.OUTLOOK.COM>
 <20240111083838.7f215daf@xps-13>
 <880CF70D-DC61-4E18-9A31-48A82A45CA3E@skyhighmemory.com>
 <20240124180716.71e26b8c@xps-13>
 <D726EA9A-1C18-4720-A87C-0340D675B514@skyhighmemory.com>
 <20240202171136.41699985@xps-13>
In-Reply-To: <20240202171136.41699985@xps-13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.81.24011420
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skyhighmemory.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS2P216MB1185:EE_|SL2P216MB1497:EE_
x-ms-office365-filtering-correlation-id: f44b3d5c-494e-4f2b-9b00-08dc240a7c9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jFoXOC1fnGMlG25iQDifv/tiX9kpm0MDOb+OffZrXSwIczmApAd80VB+Z9Iv3qBJWtJp2XkIGqs9CRL88Z4Q3a9NZT4ObIv70wJtCIg9kEZRF+aNi11CCc0iVNFzNzd4fQOjUN30ebqEQpd3Hp8FlrlrgtZgY0uFCmgxstaiUHK8iY4BmcRi+EoMEp7cCz2nGkPE2rDBY6P3TKe602eDeFra4dl0zS92t4spDBLKi+d+v8fbblNZjawGs5JLfToG6Z8bAGm94QsDNR4Bcmn1lBUpgYluHlZyfkKZweezs6Osowqkwzx8WNgr+cSb0ug+b0c0SHgm1sZC3U+hxOcwVZgbHXRB5iyVP1lte9ED54DdyMT1gLCEIB0mQjNlB1G8bM5AXd50Mk68YGJFBjyCzdzUJm9LrFWvllhID/Z5MmWDidelSsFtljG9EjRnkP0ASpx8mcJ9gshSzSASOUxFuOQQTQ+Vs8YSXdXPG+fV05J2w1DdLy9JqA3XkesGUXpekANxdML3lhBsg8nYBhfGJka5yuQW4qWz8e+Gr+kwZH+pScKNeDxkaTRRUY/nqxq66rreRWs+PZQoDZiOZfSWytKX/pQL6Mcc3OT/t/UZEJ8JeGCgT1V5zunwbRsJsL2KabSMfy+b4u6UraDH9Ocjvg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1185.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39850400004)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(38100700002)(6506007)(83380400001)(82960400001)(122000001)(2616005)(66574015)(4326008)(6512007)(2906002)(33656002)(38070700009)(54906003)(71200400001)(86362001)(5660300002)(316002)(6916009)(36756003)(8676002)(8936002)(91956017)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(107886003)(6486002)(26005)(478600001)(41300700001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEF4RUw5dHZSTXU5VUxJYjJvVmhUREl1N0YrOENtaVJVSVpMT1dyZkZoU1U0?=
 =?utf-8?B?d1pPNjhKMDRTSjNUdWdxakM5YlNNZ0pLWkh6ZlJkaGttK2pPU3psRUs5WHNF?=
 =?utf-8?B?SkV1L2xFa0wzV3NMTzJWRmplMVNBWGZwb3drYVJBM2dseVpPcnFJRUNBUFMr?=
 =?utf-8?B?MXpuQzNlZm41cFpPeXBzZTlJTXU1NlNwdjNMeFpWVXVtaDQ3dXA0eGRUaXVQ?=
 =?utf-8?B?MWJBdi9VYUNPMHZYa3BtV3JET3FPWlBMR2pxMHpGZkxNMkp6TTJlWjkrQVdW?=
 =?utf-8?B?aWhrRk9UMGVhcGNLT0t3VW5aZk5hMTZhRlN4WVRWT0M0Vjc2QVRnUVY1Tk10?=
 =?utf-8?B?SlJyRm1NcEhxTEI0dGI1OEdYc0xVaENDMUtxcG1lYVNKZFpWUHl3WVFwUjNh?=
 =?utf-8?B?VHhVbmNML1U0TE1JOFFIVVdQNzdkSmk3OW04VTE4UXp4UXB5TXpCcDNBUStT?=
 =?utf-8?B?My9hYjFjcXh2MEE3TExFcDlzRWNKVWRYellCKzRJbDhhYmFtbTlvdWw5ZGRx?=
 =?utf-8?B?SVgxQW5zZUQ0eXVGTFlIUlRWSXFLaVl6ejU3MXh5OWVQK3JXT0MrbEd3TGVr?=
 =?utf-8?B?UG9ROHRUSG11azFXZU9xU2V6R1ZKNEdRVXA2Nm5OZmxqcmVpc3RSaXgrcWxW?=
 =?utf-8?B?dEJBaXc1dTVJN1Jmd3VWVWQrWHFOWG5qelBxRjZkbDYvNDYvdGlSYkUxbzZ4?=
 =?utf-8?B?TEM0N05KamVJNThSNXI1TE0vb052V2d0djV0dzdOQ1JBNzVUb3VwbFNyQllv?=
 =?utf-8?B?MnBpTmpoYm5jU1BGTktUQXlOT0RJTDhDMUpDSjdyNmVJbmxpeWhpaFpzUzI0?=
 =?utf-8?B?czNURmFOM1FsNU5BNHQ0MWJxelZNNDJSL3ExRFMwTHFSbnNKZFl6ZTNIbFFi?=
 =?utf-8?B?SU8vcFpZWENxZEZvejV3SlNzdXNrQUI1SjMwNnVyajEvajRqbnBjcVRLTGZo?=
 =?utf-8?B?c3l6R21COVRRNTBvM0VHM3NWaUZIbWdDYlplUFhwbVJwQXNxUnV6c1ZNbVlO?=
 =?utf-8?B?eUpWNkFIL3NUaXI0Y2lyK29FMG1UZjlYNXpjc0hzN1E1Yzd6VXFJMEJrUzFk?=
 =?utf-8?B?VVQ0azBBSjF4djJIRk1icTZlek1NeGRCK0wyanJMQVhTNzQ1U3NKRmRRUGJM?=
 =?utf-8?B?aW1sYndBcWJEaXZWR3RXeDJ1SGhWNVlML0t0eFZzL0JadDFVMzJxRUZFTGlB?=
 =?utf-8?B?QjVLR1ZWa2JGZGZYLzhQYW92UVhsYkxOZkRUVXlaaFMxVEU0dkVpaW5iTWY0?=
 =?utf-8?B?NFVmSG1BNU5sMGxkbTJ0b25wdUgxZk4xOXRHTkp6MHZHbmFadStTV0tnSE5K?=
 =?utf-8?B?VElaZHhCcjdSWW8zVnhXYy9RSWdmWmlyNStCVm5oaXBMVnM5c056bXlXNVJU?=
 =?utf-8?B?VE1kb291SzE5ZEVucmZVN3l1WDJiSVlpYWcxTTlxN0lGOEVaY0dMbXdMdTJH?=
 =?utf-8?B?eXRWdTh4b0NlZGJRUUpmRWNnYWV0WVg3UWNqR0lXNGM2VVp2bC9uZ3R3djZO?=
 =?utf-8?B?LzBobkF2WmluenFJd1g0UGhnTm9yTUZhdGx2L3dlVEQ1R052OVFnNEpiTjNy?=
 =?utf-8?B?OFNDRE1udzlpdFNDbHRZcHY2cDRIbjI2Q3NKNUcrck1VeUdhZ2FhS295V2JV?=
 =?utf-8?B?M2x5U040Q1NpKzBvY2VRSjVOUkV2UzVNeUlZWmJ2aHZKR3BEeHFhTy9YWXlZ?=
 =?utf-8?B?d0RSRzRrOWgwd05KVXBwN1dXZ251bGJkNmVQcGtrY0s3bFVNajZVbHpIZkdn?=
 =?utf-8?B?V3VVZFN3WHdXUERDZFE0VlMwYkFmOFZWbmRFM1pGa0p3TkpudG5yQllwQkxw?=
 =?utf-8?B?bVdHUzQrUGs3bGRQWUV1SytsWnYzNmlLQW1nd1ZqQmhFS2ZlbW5mWTN6c0JJ?=
 =?utf-8?B?eDY2Kzlza0pRNTMrUC9xZ3ZoaStVajNPc1ZUVWZvcTQ3bm5kWkRvUVlGaXNy?=
 =?utf-8?B?Y3FjZkJBRmVHd1hVNXVBdjl3elhSRk83K2t5NG9rU2FoY3k0bUxzWlh2eURH?=
 =?utf-8?B?MWRCbDNsL283Mmt0U2RJSmp4d2Jwc0t2b2kzT3pOMU5VVERsZTN0RXJXemZn?=
 =?utf-8?B?Mm05eVJrdW1jQTMzZysyRlM5azBEU2hGSDJUcHVwcVNVZ0lOb3gxa0NoNzdX?=
 =?utf-8?B?YXM3cFRqcEcwYXF1Y3hwRHpTWDJqOG5HVGlEZHBTUGM0RFdUVG83UzBocGpJ?=
 =?utf-8?Q?sTxaP+neVtzRIws4OMzgrtI=3D?=
Content-ID: <0FFA2CE33E049B468A9F463B8DA4E128@KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: skyhighmemory.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1185.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f44b3d5c-494e-4f2b-9b00-08dc240a7c9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2024 16:17:43.8645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 39b82b34-0966-49dc-81a7-5bcab7ea53c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y07Ne0Qf7Wjr1Rueqe9XZ1VNgXoaksPgTCeDYzAC4AbSrytpvAHFATDB4ypqE4XUIyu2JIl5GEfpTu/2ZHTr0vgJCl9seZ2UML8bYTRfSO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1497
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_081750_822917_667DA518 
X-CRM114-Status: GOOD (  13.34  )
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

SGVsbG8gTWlxdWVsDQpNYXliZSBteSBxdWVzdGlvbiBpcyBub3QgY2xlYXIuIElzIHRpIHBvc3Np
YmxlIHRvIHNldHVwIGEgdGltZSB0byBkaXNjdXNzIGZ1cnRoZXIgbmV4dCB3ZWVrLiANCg0KSSBh
bSBsb2NhdGVkIGluIFBhY2lmaWMgVGltZS4gSSBjYW4gc2V0dXAgYSBjb25mZXJlbmNlIGNhbGwu
Li4gQ2FuIHlvdSBsZXQgbWUga25vdyB3aGF0IGRheSBhbmQgdGltZSB3b3JrIGZvciB5b3Ugc28g
SSBjYW4gc2VuZCB0aGUgWk9PTSBjYWxsPw0KDQoNClRoYW5rcw0KTW9oYW1lZCANCu+7v09uIDIv
Mi8yNCwgMTI6MTEgUE0sICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNv
bSA8bWFpbHRvOm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+PiB3cm90ZToNCg0KDQpIaSBNb2hh
bWVkLA0KDQoNCm1vaC5zYXJkaUBza3loaWdobWVtb3J5LmNvbSA8bWFpbHRvOm1vaC5zYXJkaUBz
a3loaWdobWVtb3J5LmNvbT4gd3JvdGUgb24gVGh1LCAxIEZlYiAyMDI0IDE5OjQwOjUxICswMDAw
Og0KDQoNCj4gRGVhciBNaXF1ZWwsDQo+IFdlIHVuZGVyc3RhbmQgdGhhdCB5b3VyIHBsYW4gdG8g
dHVybiBvZmYgdGhlIEVDQyBmb3IgQmFkIEJsb2NrIG1hcmtpbmcgYW5kIGNoZWNraW5nLi4uIGZv
ciBMaW51eCBWNi4uLg0KDQoNCk5vLCBpdCdzIGFsd2F5cyBiZWVuIGxpa2UgdGhpcywgSSBkb24n
dCB0aGluayB3ZSBldmVyIGNoYW5nZWQgdGhhdC4NClR1cm5pbmcgRUNDIG9uIGluIHRoZSByYXcg
TkFORCB3b3JsZCB3YXMgbWF5YmUgYSBtaXN0YWtlIGFuZCB3YXMgcHJvdmVuDQpub3QgdXNlZnVs
IHRvIFNQSS1OQU5EcyBzbywgaXQgd2FzIGRpc2FibGVkIGluIHRoZSBTUEktTkFORCB3b3JsZCBm
cm9tDQpkYXkgMSwgQUZBSVIuDQoNCg0KPiBXZSBhbHNvIHVuZGVyc3RhbmQgdGhhdCBpbiBMaW51
eDUuNCB0aGUgZHJpdmVyIGRpZCBub3QgaGF2ZSBFQ0MgY29udHJvbC4uLg0KDQoNCk5vdCBzdXJl
IHdoYXQgImRyaXZlciIgbWVhbnMgaGVyZS4NCg0KDQo+IE15IHF1ZXN0aW9uIGlzIGFzIGZvbGxv
dzoNCj4gMSkgRnJvbSB3aGljaCB2ZXJzaW9uIG9mIExpbnV4ICx0aGUgRUNDIGNvbnRyb2wgd2Fz
IGFkZGVkIGluIHRoZSBkcml2ZXI/IFdhcyBpdCBpbXBsZW1lbnRlZCBpbiBMaW51eCA1Lnh4Pw0K
DQoNCkFnYWluLCB3aGF0IGlzICJkcml2ZXIiPyBFQ0MgY29ycmVjdGlvbiBpcyBtYW5kYXRvcnkg
Zm9yIHBhZ2UgYWNjZXNzZXMsDQppdCdzIGFsd2F5cyBiZWVuIHRoZXJlLg0KDQoNCj4gMikgV2hh
dCB3YXMgdGhlIGxlYWRpbmcgcmVhc29uL2N1c3RvbWVyIGxlYWRpbmcgdG8gdHVybiBvZmYgdGhl
IEVDQyBmb3IgYmFkIGJsb2NrIG1hcmtpbmcvY2hlY2tpbmc/DQo+IE5vdGU6IFdlIHNhdyB0aGF0
IE1USyB3YXMgdHVybmluZyBvZmYgdGhlIEVDQyBmb3IgQmFkIGJsb2NrIG1hcmtpbmcgb24gTGlu
dXggNS40Li4uDQoNCg0KSXQncyBub3QgYmVlbiB0dXJuZWQgb2ZmIG9yIG9uLCBhcyBJIHRvbGQg
eW91IGluIG15IHByZXZpb3VzIG1haWwuDQoNCg0KPiAzKSBXZSB0aGluayB0aGF0IHRoZSBFQ0Mg
c2hvdWxkIGJlIHR1cm5lZCBvZmYgZm9yIGJhZCBibG9jayBtYXJraW5nIGFuZCBjaGVja2luZywg
aXMgaXQgcG9zc2libGUgZm9yIHVzIHRvIHByb3ZpZGUgYSBwYXRjaC9kcml2ZXIgKFNITV9jb3Jl
LmMpIGZvciBMaW51eCB2ZXJzaW9uIHZlcnNpb24gNi4uLiB3aGVyZSBTSE0gZGV2aWNlcyBrZWVw
IHRoZSBFQ0Mgb24uLi4NCg0KDQpJdCBpcyBhbHJlYWR5IG9mZiBpbiB0aGUgU1BJLU5BTkQgd29y
bGQuIFNvcnJ5IGlmIEkgYW0gbm90DQp1bmRlcnN0YW5kaW5nIHdoYXQgeW91IHNheSBjb3JyZWN0
bHksIGJ1dCBJJ2xsIG5lZWQgbW9yZSBwcmVjaXNlDQppbmZvcm1hdGlvbiB0byBhbnN3ZXIgY29y
cmVjdGx5Lg0KDQoNClRoYW5rcywNCk1pcXXDqGwNCg0KDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
