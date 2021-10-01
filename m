Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB04FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 09:39:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A954361A81
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 09:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A954361A81
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KeKNh9/iRRwR1b+y+dJlkTL1/5JypVR6BtCAkGZ8Gs=; b=lZwNdw4pjW1zPG
	f09RuGquFfzUOnISnseNcpKOOPljooBvdyXEYvtbOeXJMEcHjMILV30VL9Mp+JFN6RHat3PjazC11
	on9zowx7c2UcMai85BvNlhJiwu/RSjgfPfkwuB35EXgSC7Ko6SNaMg5U2y3gJXWI+fJf+67jBWCBX
	pJRlQI/cGLw1eqnk2HaI/mVMFAj60LvnreIrRzC/KKwfPeOsovEoCVZTZEeaqaPyYFPkSzmZ0Vr4U
	J8My7Kch1vZQXkrOD8i3/exTEWR9PbNJZYkRum/7olsMY0BHefXJAmxOJyJ6Y1BucHABs2wCmxTzh
	QvrRpmpl14QiqBi5IgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWEzw-00HGtd-80; Fri, 01 Oct 2021 09:38:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWEzs-00HGsC-BR; Fri, 01 Oct 2021 09:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633081108; x=1664617108;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xXB+BlUUt//XGOtmXifFSU6oYD78WMkWDxGNpmjcxMM=;
 b=z08Z/X1UbVc29W9fo6zb6th11frrUDg6riBQvHYqxhRrew6C2XrHV+3j
 Vh9oY1SXtuxHq/S9ttL5QScNJqPpPgfpL4GL10vpURpp/j7/rCymtBsxn
 wvJhzCVDVrfKb+S3mfR3Fz0whDEplg/Nxc7DF3kniLavusSU+1p7V5UIw
 CtOFmDTxm+2+9imqgUxYLjWv1cJNgDC/kYrsMC+4lpSnfl4bvi7wIrFoS
 a9GOU1cqqlT8YnSTdXF7RIyakUcaJq01HJuKHg1zpSCT85yignJnKstkb
 KjNfSoqwYdwrp2hterks8PU9DSEyeiSt3UYjQYJvyAwt6htnPZEvXSMEq A==;
IronPort-SDR: EezgWz6rTOXwVzXz4SI/uAwrjYwGl30ilkffwhgfp9lXsIo5ohEzXbh//MUtvDpQ6WJAe5Wniy
 T0bkY27S9hy16ZeBsWahaM5qAfDA+K4AChhmR2BLad0/fCoSZXpDtmvKgWoeMn4r4AKf/BOZtv
 TTjFlJvu5fBOwIuhGADtuj1pMVTyZWT+gYyKHgWsPlncgxUqMgwMICAAnKoPJ+jSLw2fr4wZjs
 4pRNBWc4K6OXo3sA1XkGYvWHxYY8EgzSa9A1QGpx1XGIyIMXJvqbR1yL2Vt1aNbsVTd2C2HcGQ
 0wpwd9Z+Ci7uMcwF2lMn9y/4
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="71351826"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2021 02:38:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 1 Oct 2021 02:38:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 1 Oct 2021 02:38:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJep9REMlaAEM01NGCIPIEgl/cffm1d9QIN3xu5wl7Q4E3Q1/rVuV+bnBoV5AO/AckV90AMjCPsVZC4dg8xuUqfgUSAdnkDZlk0DpEjs2fbU015fWf6oH/V85kra0W5AECUqZecwyDlfxIqBzJeb+JrIAJ9XsbMFsA+zlfWoFAV6XBhuuJq2uGUdHxF/ofC5Eyb83Bst0semu7Jt4+2HnoXtwsh04M5ixXLYRBC5gGjzJGIcARbmXLkHjJAd+2wDPWtx22V3/3+dMKMujtl/5wxgHGk6xpu2rvydUOl9Cg9iMjbnN6lRnrMa1Q0p09PDLV0koR584ecb4CU9yuPFFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXB+BlUUt//XGOtmXifFSU6oYD78WMkWDxGNpmjcxMM=;
 b=nQU5SdCncKvQV3i/oJq4tSqr0MJRwmigRg7Zq2sk3R8Mb9VvjTIhUcSEPQjeMlI4qrPNf+tn7WrpHxI3wQgFSkP7i9NyI6S15xF9TlCrGtWTkkRliCZEU/Dn/Aua2iq1nXkzBZ3CLtIY6/vBEQ8mBFFD0PkAts/m6wqMahresGPnVJV3N43bHJ4y+pOum4PKxmI2oaJQBm4HFxOOusg80uE6H2Lbz09glizjxfe/pPtRu2RHaJ4KneEiGdtNtDQn+shV2JT/sRfkMJb+lhp18qJgp/g+z6PXR3qI6CfddHUf6fhA1kHlKxI1uRrI5QHnNVM7odop2d+SThBaGrwMtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXB+BlUUt//XGOtmXifFSU6oYD78WMkWDxGNpmjcxMM=;
 b=cfVfp97MtVroUSn0oEIDEIAvB+LzZm1NP3HotUCZszw5j6ErESpGb+DUMSGuTT6L8+5gqFaTquUFubvBcqZ77q5KmsJs09ir1U3HT9JhYAuxwwVknJsPDPd8mSQEyCTvnL7ASb0+DqcCjqZ6yALlhwy4BOpSqMzQuPuwj9W3OyM=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3485.namprd11.prod.outlook.com (2603:10b6:805:b7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Fri, 1 Oct
 2021 09:38:25 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 09:38:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v2 08/35] mtd: spi-nor: core: Introduce the ate_init() hook
Thread-Topic: [PATCH v2 08/35] mtd: spi-nor: core: Introduce the ate_init()
 hook
Thread-Index: AQHXtqgULFn+s3h+z0OtnwZmbVbTvw==
Date: Fri, 1 Oct 2021 09:38:25 +0000
Message-ID: <a8690ed4-589a-1c45-2ba7-84b2e4fdd83f@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-9-tudor.ambarus@microchip.com>
 <20210816185446.topxrgwmvpt6n4ct@ti.com>
In-Reply-To: <20210816185446.topxrgwmvpt6n4ct@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2a91046-830b-4a15-c99f-08d984bf3785
x-ms-traffictypediagnostic: SN6PR11MB3485:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3485CC4DFC07C0B23C112F41F0AB9@SN6PR11MB3485.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H/F/pzeJFN0SME/Y6we3B17DHJUZrkvsFt+cjl3oGuOZyJ7PTe+uVxjgsVxHGPCQgmbULYEb6nBdJg0OgPmR0AjnJVcsiKyHP0V7ZTVdVZYPBnnT7HZXoMiP9tjelYaBqi4aj4zYoj/xmtajT7CqOf2SStueWe2k3B9aMyQS4ovZgCAMSXH4/bGmydpvVcwpZYH4W0iPTGAe0HEGL9ROjejxUfNPiFWUdrJZx4lZV8Q//8pMvpp8miGBCcsB+4ARCv5NZJz1b+7tXYXFeV89/VyYUlqqLQspnas7NrmxZr3TGwGWIy85wypX33p1/lUn5eWu2FmZRq+d+3vJwV0mYGhht2mIsI7jDIeL1jRNtfg+P4Lc2ljKYs8dYXukVizcLVbvRv4bO4mzqcnUnsEUTAzTvEDdAl9krNkCH4FpTqsMqmFoPv/yptMkCZqKI+TJh2MG29m2B3kbauDFS6FhxVsO82CZoFDD7I46EtnAefQcJc7oVA93u0E71qVMFCUlPAtxq1qO6K6B0EUCkQBem3KAHLE7LvWE38T3omLFruwf4LUTkkCYaGIwmEJeoqgAY9Tc1NebXvDW0wQjagzNgiItUxHdla9vlFvBr0crZd0+/cWyEt6z1ADfNSSYLrgeHx+XxPdnhaBgRRkZ8GKfxpvuyMbvexl22RNT04TGlGnFu7D/WlBbYF74/zuwzvZ3d2HZa00E3eqsC9LAwVn2uLEkQzoAspbg47buXNkcTSWyXVb+tpkCm2yTfLXFDBnyneIXsrTD09GTAJcDnCRR8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(122000001)(53546011)(66446008)(66556008)(66476007)(91956017)(6506007)(76116006)(54906003)(316002)(107886003)(38100700002)(64756008)(186003)(2616005)(26005)(4326008)(6916009)(6486002)(31686004)(66946007)(38070700005)(86362001)(6512007)(8936002)(7416002)(31696002)(71200400001)(5660300002)(2906002)(508600001)(36756003)(8676002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDdIYUwvNVUySDE4SGQ3RjF0YldGSExZMU8yaEQ1dnRwbHdMcW5Ydm1ZVGJq?=
 =?utf-8?B?ZkwxS2xtUWhWMWJkQjQzYVlDdDBCZTA5MmhoYWJhT2JKSTBKWEl2bVVMeGlJ?=
 =?utf-8?B?c3p2OE1XcnNTa3dhK0ZrU2xWTURtU0FoVmdIYzM4UXN2dS96WFJxK1VDY0Ey?=
 =?utf-8?B?ejE1RjhuYWNiMVhFUm9vRkd1aUVlUmlESjJOMG1BM1pCYlVueFlnZEl6bWFo?=
 =?utf-8?B?ak9KSEJoaEt4MWt6NFdFYSsrZlBuQmhnQXdJWnhiUlBrYnFobndpVUltbUF2?=
 =?utf-8?B?aEJsL0h2L1E1SzhjcXArSTAwWE50MUZPZGd1NkNOZ2NRSnZkUy9Ea3hKTjFy?=
 =?utf-8?B?Q3hET2JuTEV5UUlYMkJuYlZvOVBNSFZ1VHRNd0k4MW4ybmFscGNPekFkMEFk?=
 =?utf-8?B?N3ZSa2twbXBCSUtFaUNTcStYRTZHVnlMcjRzOEtUZ2xDTE1YbFY0Z2tiVmVI?=
 =?utf-8?B?eHU5RXFMNnlJQStVL1gzdUU5eFlubzBFSVYwNlRxTnNUc3VQN3BsSWlRMjBN?=
 =?utf-8?B?THExWHc3ZEdlNWZPdFYzZWI1bjVSbm8ydjM2MmRqbnQrZWhFOVhRdTBFQjJn?=
 =?utf-8?B?S2s0SWhsMTNCSkt5UStaZy9GNmkxK3VmUWtTZjVTQUF2Z3ZFeXhVNitqTUMx?=
 =?utf-8?B?eGlKMTd4dytlcGI3RVlNKy91NlJtdnJ0b1psWDdidXoxak50dmkvZnFOeFZ3?=
 =?utf-8?B?dXN2aHBMeUpnMkpaLy9PMlU4eng2b1BERmxlRVhudVlmSGV5Rkxrd0NtNmRY?=
 =?utf-8?B?RDdrK0Ztd1YwYUxLSzJjQTdmc2pYcDUyWHoxLy9FaDNDSkRtcVN5eGh6eCs5?=
 =?utf-8?B?UW5wMmxGUjZvbHhrNiswSlBiWHpWQWVOTXA5cDlVZEpDdW5DaXo1VFo1ZnlM?=
 =?utf-8?B?SmUzKzRqNk9ScUdsZ2VyUjR2dmZtSDJkeitMQXhXb0NKcEpiVGtQSDdkZFpE?=
 =?utf-8?B?WEtFZEhKSWEwd0lDc3BVakZNM2x6K1poNFh1NitITzdCQnBUS2lnRFRDSExW?=
 =?utf-8?B?cyt6SkxrcWVKS3g3a0lkLy9YeUxTSm9YSERZblRFQUtPS1ZVNkN6ZkROSlZL?=
 =?utf-8?B?NURxc0wwOTV1QWw4MW53SU45K1FaSEhhZ0pBM2czV2tjR0RMejA1Wi8wSlph?=
 =?utf-8?B?S29YQi9Ja09qWXQ0WVFvMXZ1U3M2R0Y1UE1TcldreXFpR05reElTaUNhbW4w?=
 =?utf-8?B?SkVRQXNvOStYWmRMS3hrNytYejBidk9BTjRNTGpGa3JHWmE5OGF3amhpdTUv?=
 =?utf-8?B?RUIwS0tJRUpJc0RaL0NFR1YrZFh6VFRWTWZVNnNlcEZmSEgzL1p0V2JBc3M3?=
 =?utf-8?B?Q1ROaHcwbjRtcjUyNFlvaTNmVk1zUXhxVVI4UGV0SFBYTTNBWkhHWkk4TjFu?=
 =?utf-8?B?dHVwbVgxNCtiOWZCK1lKd3E5WFFwclNHUE8xVjh0RGxVOEMrWTc5czJ6TjN3?=
 =?utf-8?B?aEF2Ump5akc1VVdicStHVXA5SEJMVDFRdmhlakZuSld4QU96TURxWjNPV1Bm?=
 =?utf-8?B?REpjcFFWUko1WWdqaDJzelB4UDN3K2MweUFYa1l6ZmpkWEZwYzUrb3ZYRGFH?=
 =?utf-8?B?ZkdvajRPcmFNTlM2eXhzTTloYmNRL1pPZWR6VzdXR0dweU1zb2JsQXg5ZlE0?=
 =?utf-8?B?S205cWRNZ1hWU0xPUHg5bGMwRGU1cnZqQ1Y3a01ZZG1SbUN3UWx4NUxZQ0Jp?=
 =?utf-8?B?MW00SDlNcHN4cHRJVUNHWDdRNW5FWkRWOC9vUno1b2NNS3VNTCtucUdQY1JP?=
 =?utf-8?Q?5BKy+rXYQDchLNI9aQ=3D?=
Content-ID: <EF73E0D1BBE31B4C9067D084CD8A8FFC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a91046-830b-4a15-c99f-08d984bf3785
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 09:38:25.3536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QDuFMEuVwWD/7Yl49cVIEzsQ6he1oRU5DP+OffYZ5jJUVGDBJfd9Co8Ib+RRf67m0pvpodL35YGmzQk/LfkuBeW6mqLP7vDRU9KmXAMzQ7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3485
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_023828_528387_5C4805AE 
X-CRM114-Status: GOOD (  28.00  )
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

On 8/16/21 9:54 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,
> 
>> Subject: [PATCH v2 08/35] mtd: spi-nor: core: Introduce the ate_init() hook
>                                                               ^^^^^^^^
> You ate the 'l' ;-)

right, thanks!

> 
> On 27/07/21 07:51AM, Tudor Ambarus wrote:
>> The goal is to get rid of the spaghetti way of initializing the flash
>> parameters and settings. late_init() hook will be used to tweak various
>> parameters that are not defined by the SFDP standard. Can be used by
>> non SFDP compliant flashes in order to tweak flash parameters that
>> are not/shouldn't be handled by the flash_info flags. Will replace the
>> default_init() hook.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 15 +++++++++++----
>>  drivers/mtd/spi-nor/core.h |  8 ++++++++
>>  2 files changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index d30c8f350dc1..15ccc9994215 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2667,11 +2667,18 @@ static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
>>   * spi_nor_late_init_params() - Late initialization of default flash parameters.
>>   * @nor:     pointer to a 'struct spi_nor'
>>   *
>> - * Used to set default flash parameters and settings when the ->default_init()
>> - * hook or the SFDP parser let voids.
>> + * Used to tweak various flash parameters that are not defined by the SFDP
>> + * standard. Can be used by non SFDP compliant flashes in order to tweek flash
>> + * parameters that are not handled by the flash_info flags.
> 
> What about flashes that do have the SFDP table, but not all of them? For
> example, the Micron MT35XU512ABA flash currently uses the post_sfdp()
> hook to populate 8D-8D-8D fast read settings, command extension type,
> etc. These are supposed to be obtained from the xSPI Profile 1.0 table
> (like we do for Spansion/Cypress S28HS512T). But the flash does not
> populate this table. Should these go into the late_init() hook or the
> post_sfdp() hook?
> 
> FWIW, I think it should go into late_init(). post_sfdp() should only be
> used for correcting info obtained from the SFDP table. For populating
> the info not present in SFDP at all, late_init() should be used.

That's correct. Missing parameter tables are more suited for late_init(),
whereas post_sfdp is to tweak parameters that are wrongly defined in the tables.
spi_nor_post_sfdp_fixups() will be called only when SFDP tables are populated:
patch 15/35

Cheers,
ta
> 
> Thoughts?
> 
>>   */
>>  static void spi_nor_late_init_params(struct spi_nor *nor)
>>  {
>> +     if (nor->manufacturer && nor->manufacturer->late_init)
>> +             nor->manufacturer->late_init(nor);
>> +
>> +     if (nor->info->late_init)
>> +             nor->info->late_init(nor);
> 
> Manufacturer late_init goes before flash late_init. Makes sense.
> 
>> +
>>       /*
>>        * NOR protection support. When locking_ops are not provided, we pick
>>        * the default ones.
>> @@ -2713,8 +2720,8 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
>>   *    wrong).
>>   *           spi_nor_post_sfdp_fixups()
>>   *
>> - * 5/ Late default flash parameters initialization, used when the
>> - * ->default_init() hook or the SFDP parser do not set specific params.
>> + * 5/ Late flash parameters initialization, used to initialize flash
>> + * parameters that are not declared in the JESD216 SFDP standard.
>>   *           spi_nor_late_init_params()
>>   */
>>  static int spi_nor_init_params(struct spi_nor *nor)
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index e9896cd60695..13d5c5edfd27 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -391,6 +391,11 @@ struct flash_info {
>>
>>       /* Part specific fixup hooks. */
>>       const struct spi_nor_fixups *fixups;
>> +     /*
>> +      * Init flash parameters that are not declared in the JESD216 SFDP
>> +      * standard.
>> +      */
>> +     void (* const late_init)(struct spi_nor *nor);
>>  };
>>
>>  /* Used when the "_ext_id" is two bytes at most */
>> @@ -457,12 +462,15 @@ struct flash_info {
>>   * @parts: array of parts supported by this manufacturer
>>   * @nparts: number of entries in the parts array
>>   * @fixups: hooks called at various points in time during spi_nor_scan()
>> + * @late_init: used to init flash parameters that are not declared in the
>> + *             JESD216 SFDP standard.
>>   */
>>  struct spi_nor_manufacturer {
>>       const char *name;
>>       const struct flash_info *parts;
>>       unsigned int nparts;
>>       const struct spi_nor_fixups *fixups;
>> +     void (* const late_init)(struct spi_nor *nor);
> 
> The patch looks good to me other than the comments above.
> 
>>  };
>>
>>  /**
>> --
>> 2.25.1
>>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
