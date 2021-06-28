Return-Path: <SRS0=3VFJ=LW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BF9C2B9F4
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 05:49:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 023E2619B0
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 05:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 023E2619B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WSUi20v/oEXDTGG3wg/h1ot5KjqkYhzLucWSlfRjflI=; b=RZLJduf8QOq5jS
	P182jRRs02JwxKaZNN3nIn/BVOmxanLn2N6jcOpyYPSqIFAuV0l46+sf3aiZYuck/u5YDBCNUw5Y5
	lSWjcQbNZYQ1hYO6s+tnhGyHuefbCh+K5LIkTEW0IsN9ZTOUJZ2aQC2qdsGu3oSKBzVKj8T3ZEcTy
	IRguGPvyhAds+HCQJeLpcnkTJSfaK8XWjIVDRNqU4FoJjlZ/pEmYuIFWvt8zIKvvYWZhpOYu8hwU7
	W1nxYqwyc0Aq5mWF7rsy9DEtDYy9rwoOrI5OkEefMrigfJ9l9stl5EmOLL49Il9tWA5t1RZXJeIac
	kMAn3P9ZRsd9nnISM6ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxk84-006thJ-Kp; Mon, 28 Jun 2021 05:48:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxk80-006tgk-J5
 for linux-mtd@lists.infradead.org; Mon, 28 Jun 2021 05:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624859296; x=1656395296;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mYdJiB3R7YLNpasCwLIqv//6i8tVZE4Zjr3uZ4lfnd4=;
 b=1PI3es0DGGjGTHlhMf2CPr2UeqUcPaerTREcfJJu8UggLPxiZCD32iuh
 3tMXqwKp5IcEmf8HlR9FsgA3nio709yw28vWBwobdBBRPAPiw7i87NjZl
 tpT78zAkOK/8FiSHnNxu5ow/KsgqHlJJhQvc5X6qThodyvSVDNSE3sBPa
 JoA/ljyCaHcRUcf/URhQRfC/6fhuyJNwRfv2hJsYxmU0DDd1gNZa7tBlE
 Yc/qb0uqlZpSL9OOkcvTqdunMb44U5dV6ctkQS6HVsop/lNlfZ+ZsOPLs
 82e4uxEV6BB1JTYNJOaWCcmbnReq2E0935Sz52L6imJ+lCG8z2wUwMhwY A==;
IronPort-SDR: KbaoeqRpBcgbZyoKH4Yvv9FL7rvxMEeepAPOWceZRb1NfvGOOCPqMfFI2Soj7bIJuvhZUiugMF
 ClCi9yqSZiv0Ob5EnRp3OE6LH1JFXs6gcGKJgLAWTTAPYxAA1yAfQWZmR5Q5He3EzFtZ3wR7zw
 snQYIjxDZ3oYgpxvBnf3bKTc80R26Gj+mzAllE6qZxmAt0Zo25rQnfBvBhgS6bOGrg1ndVCSBR
 kFZlqMZeyRunH59NG/1TVT7KHp1EAFJu4gWnl+K085/nT33edg4QFv8W4dNvxxKBDs/sH1qAUZ
 1tw=
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="122753584"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jun 2021 22:48:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 27 Jun 2021 22:48:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Sun, 27 Jun 2021 22:48:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMuepPoVNPZffx7rHq9BAU24q+gG5rcRaXq3+GJPlMmIcsIoatBWCo1ps71UBxSUyLir7r62QvcBoZMjpPfjVA0M2qS/1zA2C/B4xaLqZcTLRQuvJ7Jvwa/KMIkTXun1H51OBvC614kyUJTHl4rE+4ytwEzJRv3ezGr5vjtStoiLj5wDf+mqflY1aiQDBtJwgRa/DMDnr1o85h9ie9hEdMSZmyTJF8cj1HXWHbaaoftkwcRL9joJWXTfJ6Ms7Y+fCdUFZOu20ut+xjxczP66VFdcouohqPr43Z4QAkr4Vgy5iYco5usHe/6f1jeDZ5kF9KV3Qv0zgRvsY4RPW6NVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYdJiB3R7YLNpasCwLIqv//6i8tVZE4Zjr3uZ4lfnd4=;
 b=fYQszNEoh1891HDIYfKN8zQcPBidYqOkabQSGxAVH0muge6QcNY/1AOCEYdoHULYGh40Dk8GQ9litjkBdVhuahPfUfXEUN72tstyIbHmPAFp5B+ZmjQVvwVdEGTg58+nyC5YhSerdfFhYmkLAP6HwcbeyOFmF6tznNVrj1JvIUGBjSGcSXj6EfEi7ndvernI8N2fCdXG0he6a+znGNvjur8y+EphvEkAO74m/otfziRhxun1IKo5ACvUrf5SK5M1Oam1AdB8CMmFGIjA9jgyFLBcPNnK1a39I66sNPtbKZnKyFwZNyVBxAreGbVvMaDLoue3AUCJB2SFA5whsHr85g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYdJiB3R7YLNpasCwLIqv//6i8tVZE4Zjr3uZ4lfnd4=;
 b=IwYiT+eW7khJBl2FANkAaISV42yKbHB+pP/BaUaWX8ksztc2Dbmrp/HTMXog9u++yCSK4CO0rpm3FGaiOSM7c1OB33W00z1/EMQx0jk8QcGJzSpaFvlHju9sOIaAzQx7jL1kn53TgOtRLsgN8CgIXwRHS6V0Yzw9anSCUK+8kOk=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by PH0PR11MB5078.namprd11.prod.outlook.com (2603:10b6:510:3e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Mon, 28 Jun
 2021 05:48:12 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4%9]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 05:48:12 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mail@david-bauer.net>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
Thread-Topic: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
Thread-Index: AQHXa+EuiIQT9G152ESjtz/PC67ACw==
Date: Mon, 28 Jun 2021 05:48:12 +0000
Message-ID: <88451011-067b-ffd0-fd21-985a08a5aee0@microchip.com>
References: <20210509144716.431650-1-mail@david-bauer.net>
 <752e8869acebdeeaf5dc775a5af35ffc@walle.cc>
 <796a15bd-66d9-b1a5-2258-b692f23364fe@david-bauer.net>
 <ef20e03c43d2eacff7133f74a118ea43@walle.cc>
 <0b8be4c9-4528-8cac-2067-4ad2b180df79@david-bauer.net>
 <ee4c8e3ebbe0b4cf762bbcb3a4b0e6dc@walle.cc>
 <f79a55f2-3f89-55a9-5cee-ae50d1fc0a47@david-bauer.net>
 <bccdfd0008c0f5482ae9f1b78dba3624@walle.cc>
 <b650bf50-0a66-e772-5ebb-5336fa818e02@david-bauer.net>
In-Reply-To: <b650bf50-0a66-e772-5ebb-5336fa818e02@david-bauer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: david-bauer.net; dkim=none (message not signed)
 header.d=none;david-bauer.net; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [79.115.63.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab32258b-4b74-482e-ef25-08d939f85118
x-ms-traffictypediagnostic: PH0PR11MB5078:
x-microsoft-antispam-prvs: <PH0PR11MB5078F511C8602F3686CDA0C3F0039@PH0PR11MB5078.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zrE4agqo4JkmiGOFwbWVAFyFZOQR6xBv0k15eLKuyr9wGa7YrJUo+Z36eTohVJfzYUXwUD153d3oCwVD/unqv/Ibkb2iAeBT0BhxTWwac6K0rqkzLOxdjqruQpF6+bsiwDGg+gOgyRsj0+cUUUE3RX4P1pdwlmj1hcS1dX9xoimhM/5RB6rbNnCdWdwdcfpLSNgwlmuZv/cG+e9EB4Vc4IPwauH/CBzFOxj0P0cuwuIb3xVx+8WL1gAYXDBy8RHWVAYLOGDLGmV82GPKJank6sJ5PHxCAJj/uDtvui5uZ0lGO2+aesbS1fA1njWeM9XVHk00QrlBZE7OxuUwvHSpM77V2+CnrBKF5KR927JqxbV1iERI38srF4XMObMDRyWbfgZo2+gMzo5+f6EZOSRDxID34px3Pj1tVe1Pe604o5ATukkNCA7zmbeDkwKB5ol9rAX6QhXPgFtwPcpG26AmwjbDcNKJsYeB2WIpMGLjdgc/c5RqNduDbwgoJ5VAwGNBsm5Op0dattmRmXiDkkOfwnR/koIx4SMo08+68IkLJ73LIB6P+fHFtmhtXp0a4C+spLK2jA6xKqKvSM5e0E8B9WBbqVsG6b3SmqBxUtpQtmiM8YHb/FDHXYZvc/xzashJaYzok3t9gLQV/9gvYb1b81L3TvpLVI7RtMYMKGyVygkqFs2PKYAsSoqARP/7gJ/a
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(39860400002)(376002)(366004)(396003)(136003)(346002)(316002)(86362001)(186003)(31696002)(6506007)(36756003)(122000001)(38100700002)(26005)(53546011)(2906002)(6486002)(31686004)(54906003)(110136005)(478600001)(2616005)(4326008)(83380400001)(6512007)(66476007)(91956017)(66946007)(71200400001)(5660300002)(8936002)(66556008)(8676002)(64756008)(76116006)(66446008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1k2M3dMNDQ4YVRlSERSTXAvd04zZkNNNC9Bemt0S2RmdnZaNWVGbmJCbi9W?=
 =?utf-8?B?NkRkS3hsV2F4TEduQ2ZyZ1NRQW9oUXkvdE9jbjJyOTFtNzliSGdpdzRZMDQx?=
 =?utf-8?B?cGorNmhwWGxTS2NUK2haTlhtRktRY2dTMEUyR05nQStxQkcwSit6ZjRXQmEr?=
 =?utf-8?B?cU5nTUd2T052UmJSU0ZneTRWeEszTklGRUhlSGcvNDZTQVpDaEJRVUp6VUpJ?=
 =?utf-8?B?dVFXbU44cnRFQzhLL2RONG5LeFFMazYwL1BhZE1aelQwRjlobmx5Vkl3MHph?=
 =?utf-8?B?U3VFT2ZaNWFUQ25Ld3c5amxaU052MDV6TXp4RDlaaEdWNHNjL0pVTzB2Rk9Q?=
 =?utf-8?B?dGt2bUN3WFFzOS9HdzBGalpDNDFVUjlVay9WVWYzMC9Zc1J5dzN4L0RHQnB6?=
 =?utf-8?B?SGdkcXVURldzQnVSNDcvNWwrdFA1YUVJTFMrZzZWU3kzWXNoWmx5ckhxTGxS?=
 =?utf-8?B?NDcvNGFwQ3Vwd1EvNlI3ejExTWhsL1NDenZKTElCQkNobDNoQlZvYXdoV0Jj?=
 =?utf-8?B?emZqcGNUSytpaU1uc01sNm5sUjVnanVXQjFvMnk5S01DQldNZFNYc1hZU3B6?=
 =?utf-8?B?RCszM3creUVyWW1CYVJIbGxiaE9NakU4alNVRXdSYS93cm1lZTJsL3VRempi?=
 =?utf-8?B?WVBsMTJsVERlZGs4ZFl1L1NaK0pKdnNQS3lCVUVDY0pVZWNtbDl6R1ludXNP?=
 =?utf-8?B?WlRBVGZFVHdrYUI3WHZnTWZsTnFjU1JnaGpPbmdhSnYyaXVzd0tpU1UzT2dF?=
 =?utf-8?B?cksweVdBVzdQWlgzZmo0cUxxaXp2QkI1NnJvM2xiOTVhQ2sxNStOUlBic3VR?=
 =?utf-8?B?VjMyUWdMWXh3eSt1akxaeERhKzdWb0NhdUZLQlcwbnZRVXBLOGJVR3N0RVZ4?=
 =?utf-8?B?OWdDOWJCNVFZMmNISys4bnI3d09OWS9UUUF5cWZkNW5BRGQrakdOb3BEejhh?=
 =?utf-8?B?dFlyVkdZT0pYdW55UXNhLzZxRUt4MWdHR21XSHR2Nnc0VUx3cm5JdHpVZkxz?=
 =?utf-8?B?QnlENGltS01qZmdudzRibE9qdFg5allZWU1zQktzWkZmWkJpWG90U2F6QzRm?=
 =?utf-8?B?YzU3VHUvUmZrNDNCV1VXVitrL1JDZUVlSGpkTjZEb0lUV0xUK1VCVVVMWitF?=
 =?utf-8?B?QUFqOUp5SE15RTNIRlJOUmRQK3pyNWp2aGE2dHJuSzBud1RZUXlMa1REek1B?=
 =?utf-8?B?aWJSYzVWQWxGaHpRRE5NVGxiLzF2QTQvbzN5K1ZIK05IN2xlUzdpVWxpSUxM?=
 =?utf-8?B?Wk9IZ1NQc0UwejVNZEtNSTVNdUZneUVWRnFIWWlxeEgzaU5DTmlSU3c3THdG?=
 =?utf-8?B?OEQ3WGNXbUlFdVBJSFE2NzNQKzZQcHI3TVgyVkh4NzBpanlBY0ExeWI1U2pi?=
 =?utf-8?B?TU45R01hamRaS2lWR3BVcktzQ2kwcjRNWXgrWFEybXdZS3hxUDIyU0QvaEJS?=
 =?utf-8?B?Z0tEQ1hobHVseVZlRjJ6Nys5eXh5OU9OZkNNUGt2KzNPQ0grbklZYU5UTkNw?=
 =?utf-8?B?a3FSeU1aQzhEMHNodmFacERmZzVJdE9pRmNWeFFCSHBGR0pYa0xRQjdKQXZP?=
 =?utf-8?B?SlphanltSzZick1aOEgxaUhmUnZBRFVhT3RjOGV5QXJYYWE5RFNuOFE0VFlI?=
 =?utf-8?B?bklTSm9SWjN5dUlHTzV0NWdPUUtvU2ROakZsbDJBeUxRTjdFbTMzNnovd3Ew?=
 =?utf-8?B?QmZwN3hValFVTlJPeCtabFJTczhuVDFGVXVZVkhITkN5cVYyMWRHcE1wMjBh?=
 =?utf-8?Q?c+Omso9fsiT9wcEtdo=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <3E324F40A1AE8F46A0502951B7B314C1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab32258b-4b74-482e-ef25-08d939f85118
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2021 05:48:12.2039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZNDiTGgYFbeXLJyBrnN3e3ecdFFgNc+an/RMFqFbvfwwRJ3I5NMdxk/nG7xqicQUDd5s5/ysmkqFHuZsFt5WBXhz5yFK0Sv3nJEOKLTrzvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_224816_766106_9D4157BC 
X-CRM114-Status: GOOD (  30.79  )
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

On 5/18/21 10:39 PM, David Bauer wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Michael,
> 
> Sorry for the late reply, was not feeling well past week.
> 
> On 5/10/21 1:22 PM, Michael Walle wrote:
>> Hi David,
>>
>> Am 2021-05-10 13:04, schrieb David Bauer:
>>> On 5/10/21 12:56 PM, Michael Walle wrote:
>>>> Am 2021-05-10 12:27, schrieb David Bauer:
>>>>> On 5/10/21 11:35 AM, Michael Walle wrote:
>>>>>> Am 2021-05-10 11:28, schrieb David Bauer:
>>>>>>> On 5/10/21 10:00 AM, Michael Walle wrote
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>>> +static const struct flash_info bohong_parts[] = {
>>>>>>>>> +    /* BoHong Microelectronics */
>>>>>>>>> +    { "bh25q128as", INFO(0x684018, 0, 64 * 1024, 256,
>>>>>>>>
>>>>>>>> I couldn't find "BoHong" in JEP106BC. 0x68 (without continuation codes)
>>>>>>>> is "Convex Computer". So this is wrong. OTOH I'm not sure, how many
>>>>>>>> SPI flashes "convex computer" have, if any ;) This company was brought
>>>>>>>> by HP in the end.
>>>>>>>>
>>>>>>>> In any case, this patch depends on how we handle continuation codes or
>>>>>>>> if we can handle them at all. Or if this flash just lie about its
>>>>>>>> manufacturer id and don't and CC.
>>>>>>>
>>>>>>> First of all, BoHong and Boya microelectronics seems to be the same
>>>>>>> company, as their datasheets seem to copy each other. There's not much
>>>>>>> information about either of both, so I'd say that's a fair assumption.
>>>>>>>
>>>>>>> Regarding the continuation codes, Boya is listed in bank nine, however
>>>>>>> in this case I should currently read an all 0x7f ID shouldn't I?
>>>>>>
>>>>>> I'd guess so, yes.
>>>>>>
>>>>>>> The datasheet also only specifies 3 bytes as a return value for
>>>>>>> register 0x9fh :(
>>>>>>
>>>>>> Yeah. So, this flash falls into the same category "simply hijacks
>>>>>> a manuf id" as all the other flashes.
>>>>>
>>>>> From a quick check, this is also be the case for GigaDevices and XMC.
>>>>>
>>>>> My spontaneous idea would be to extend support for JEDEC IDs to read
>>>>> the up to 9 banks of the vendor ID and fix up the existing offenders.
>>>>
>>>> you mean gigadevices and xmc? I'd presume they are also lacking the
>>>> continuation bytes.
>>>
>>> Correct, same story with them.
>>>
>>>>
>>>>> To not break existing boards, we could either skip the continuation
>>>>> bytes of the kernel ID definitions for all flash chips or flag the
>>>>> already existing ones and only perform this on such flagged chips.
>>>>>
>>>>> Personally, I'd say that only performing this on existing chips would
>>>>> be better, as new vendors with this violation scheme might probably
>>>>> appear and cause conflicts.
>>>>>
>>>>> As we still lack auto detection for new chips with that, configuring
>>>>> the flash chip used with the chip name via DT would allow to set the
>>>>> exact chip used and also validate if the manufacturer / product after
>>>>> the continuation bits matches the one read from the chip.
>>>>>
>>>>> What do you think?
>>>>
>>>> If you'd ask me, unless there is a real world conflict, I'd just go
>>>> ahead and add them as is. If there is a conflict we'd need to find
>>>> a per device resolution for it.
>>>
>>> Okay, I'll resend a v2 with the removed copyright then.
>>
>> Could you also apply my SFDP patch [1] and send the dump (if there
>> is any)? Unfortunately, I can't think of a good way to do that along
>> with the patch and if this in some way regarded as copyrighted material.
>> So feel free to send it to me privately. I'm starting to build a
>> database.
> 
> Bad news, I'm not able to get a SFDP with your patches, as the SFDP extraction
> fails at the version check.
> 
> Is there anything else I can try?
> 

So no SFDP data?
Have you tried to read more of ID bytes, maybe there's an extended ID? Please
dump 15 bytes of ID.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
