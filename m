Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13975C433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Dec 2021 01:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ON/8zZHolOcadJ0CRyOuuPywDiafck8TvJrz32mfXBc=; b=xJRPe8XCIT4Osq
	8KMww4PSRQyV94aj/fdSgufwNLWa6IMI0iescPLReUdk5AA8XwP9GXqzZd+5HiLrf2beWyxQHedIp
	z7ODPJJ9//QmAe4lUjhgzlsMQ8azE6yXyUmETJwgeMtZzO4iQdi3Y5e9q4Ru1wh0kqZ0rZjS9aZe0
	bsc+S9FRtszCn2Fu5SZNiQEqOLNuaSWrg0PfcjFH7f7O5y7XsnKKvSY2t2wMzVXwaySTZLZfYZJUh
	w4E+smjmuirSIcRP9D8wPrfPjjj8zkYVEBwkSD1vODto+HHRrkmTv+mMOxB0ngpgHHieS1wHN+e7H
	YtA7x60dpNbqbClMqi7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myOZQ-00Copj-MW; Sat, 18 Dec 2021 01:31:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myOZL-00Coow-G7
 for linux-mtd@lists.infradead.org; Sat, 18 Dec 2021 01:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639791088; x=1671327088;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wggVBZPndJwL3wpuF76fjqTUVVIppnY5YbRwVqgaM7E=;
 b=hEF5UZuR1OsnNOC8lDk+KxZ279d1ALj+03TR7MDrqYehPTGe/7wHdpmB
 X7LvljUsALbF6t7aCizphCdD1Ip4bDDoKUZvh6/GVVmnXYpvVTRZZ83aW
 l+TwByNNIuEqfPPJDI+f1tfp08J0UkVZ4UUhDJWAJaQpYneol5BvyZ91G
 QzevnbM4g25uLnDxwSnPq6Eh9KsCdbJpD4yK66i2txAdZ1rnR16hBQ4wy
 Ucq0fYo9pC4nx6Ga/SW1ezO3/4280jXz2Djk1icAmU37EcjnY0KvfgHY7
 YvO/T4Gx4aehfkT6cAAhMfcbFhLXFlgY06Qi+t/zu4gI/zdoU3DgKp9fw Q==;
IronPort-SDR: qKOBw4vyrfifFP2PA5Wj6IerDXDE9s5H8DlTnCokPwiAhX0cid6+Qb9Qm6N7gP1Ecz5alXuogt
 GdGc9tWAv0zrYtvBr3oIN5KGnLiMLwJit4G6/zVLoJAMe7PBWc8XdOM3a/iYBnewk5Y3PF83i1
 f3PYfQP+2MniVs+/E5WgdWu4N64yWIG2uKGQX0ItK286PnmqeFaZwQ8HZoBmGsHupPmP7lZHoT
 1euL2qd6IoE7klVbyE1TAuUUWNfpx1dwugEZbdDB+yba0NCGZvC8oMUlq+HSyTYUKrLOjhZjRy
 BvnqoBnu6vlZK1v/YW6IuAJr
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; d="scan'208";a="147084900"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 18:31:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 18:31:22 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 17 Dec 2021 18:31:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCllmc5bV8vexKuDDvhdAe9j2C7G0PpyH9Pz6lHwy2owPD+Y5K1pQGnSA2FEVivabKgN2WZi6nA8vwHJ+ROIqxKO51DUch/Rvy//jwqYWnWFNihJ5Ulx7HnuRVJt61ygW2ZiSKKvS37x4z1nYxYalriiY3WfMQ2wpVj4scypFDXugRPRF32In7Hl41T3o8+HQgF2fYBlpZ9VPFpAFj97zNPgJjxBCUGBXEfe3ocHdggM+JmFTt98YEnaMFiQhe0O/vZ+OCI/l21Z3MVHyXy3I4OfEj323KYt4k/WWhTHFNGpTdRQ8jPF8oeCfYtUCFcK8NkbzOGPfHOVXAsmXGtWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wggVBZPndJwL3wpuF76fjqTUVVIppnY5YbRwVqgaM7E=;
 b=DnRsrULNdYuMoexUuMRK1nbP4Fcye89zkVhPXmC6sKJIOmA/PSpZg/qq6H5i4YPwvbWVWATve3X71ZQirEC7YjELVkmVOlaEKMK/+3b6/yu6kDXQdR5UjereNTsCnK0mCuLHnRwNLwkwrTUhQH1Yfa/gHb9eNj/V/72zqc3W+AeXeaYgrcCVpjDDNQL4X3zBY8y7dw93gOjzxI5O7AA0xeYrkoTzu5IgzeQVv4WhPAGwF3C46IqVcaTxIaWpDkeNNceqUEPxAvTMrDVz5moHXxKIBDn2sl6LHjGYehcu2yoAd7WgxA6VcGo8R69NDf0E94VN81oDB7fg1cQoRT1/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wggVBZPndJwL3wpuF76fjqTUVVIppnY5YbRwVqgaM7E=;
 b=LEl/ugj2rWQ+aH3uJn1CYMoz05cQwssPIs3pf6n4SridKFjaMESixjPFs7qd+7WFPMcItLnDvFawOYxyQvgE34uCNg8Q/i76qakok2RiDYsBtXgSq4+pHb4Uzn8vzo32e5pMqZFY9LpqfnJZOJ2rzRCHY1b+r/EfrI/KhhSB+h0=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3056.namprd11.prod.outlook.com (2603:10b6:805:d4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Sat, 18 Dec
 2021 01:31:17 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4778.018; Sat, 18 Dec 2021
 01:31:17 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <linux-mtd@lists.infradead.org>
CC: <p.yadav@ti.com>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Check for zero erase size in
 spi_nor_find_best_erase_type()
Thread-Topic: [PATCH v2] mtd: spi-nor: Check for zero erase size in
 spi_nor_find_best_erase_type()
Thread-Index: AQHX867zGrsgvJvvRkumR0zAW0g6cQ==
Date: Sat, 18 Dec 2021 01:31:17 +0000
Message-ID: <0cabce03-bc22-eb3d-fa77-a1f5f787784d@microchip.com>
References: <20211119081412.29732-1-alexander.sverdlin@nokia.com>
In-Reply-To: <20211119081412.29732-1-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f56ed9b0-d40e-48b5-7509-08d9c1c616ab
x-ms-traffictypediagnostic: SN6PR11MB3056:EE_
x-microsoft-antispam-prvs: <SN6PR11MB3056E1CBC56CEBD29DD11D87F0799@SN6PR11MB3056.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AkMpa0MjxAqVwXS15kHeH+8+EmRNJ3eXoKdX58hAzCTp6K05eO3XMwDX7zdtpmVUHGEU03BIpIZv3diw1p9n11FThp36WZEBJOtTZVmNNgnXzBbIt6MibCv+3hivBl3WkLQJSXoPNy3vKOit+1Pvq9U6eX5cQNYLVG6hD/HE8tcIvnrHETZe9FCuFHgGRbWnEgLqOWIHNDCqd44x2wljszdzD/Rx7rAn46wyLVzkY8PKUxwnvDoCFAczHOGAU/NjDAYMA0/mcIyF9lLZHX3mDUCMFjMHI4WVsVA6urn8O0KaLBiTT3pjBFghM5wIHBlAJi3vxadk/lQRG9BvCBwyYE99GlfHwxoId46tb8QyT1Xu3oI4iNxKESFOUKOrdiNUA0JR/6W2tva16YIoembjOXtRrazKrZnubCqyC7U1C2sIh/s9Tl3KH8D4N9wg8Y5LSZd6FVW/Rmgsu8BP0nmgTOypCMEnLfeynusOHUoETLk6+BeaXDZ/NtKOQdRq3zkWP6R+bSwjx1Uc7ML34yKMufmQY132tEMn/Ye3SZE4wBXe5CfzL4TM2OYNJGKbPrz7d5MKAjbDlgl96+/xz5Kx1J7pUUo/YOv6ZGMy7o8UQU2BqwHUr6mEu177e1SM42KwO9kAxbBhOo4rbwayvYSedfyLvy4v3FcqXdY86lAyZXsH8ZzIWb0vQA83sresVAgWAsr7vQp4J0N4N9x1rKKIn207SYUBGNVf1HikJ7QbU3/uQ1qOxAoj7JLYZawCVtXXgUGMzCDrpOI1m/49GRdQvg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(26005)(31686004)(91956017)(83380400001)(186003)(86362001)(38100700002)(508600001)(53546011)(76116006)(66476007)(64756008)(6506007)(2906002)(66446008)(31696002)(66946007)(296002)(316002)(66556008)(54906003)(4326008)(8676002)(110136005)(6486002)(122000001)(8936002)(6512007)(38070700005)(36756003)(2616005)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekIyY0dhb1lTUkZXMnI0cUtCUk9xa1hHTUI5M0JxdnNqVjdvSktmVlc0N0Fo?=
 =?utf-8?B?L0lmdFRXMGVUWkV3Ni9YNktLalducys5ckJHYnhtNnhIT1F1SUcrT1NyRFJs?=
 =?utf-8?B?ZzNIUW1XZkErOXNIZ1R6dDBBN2xaQVl0YVlOMzR6ZnNSeUwvY0VyNWh5NVM5?=
 =?utf-8?B?Wkw2RnJtU1hTZU1DdUhwVjZaMWcwTWhHd2dDUE9oZ0NLa2pUQkE1cHJnUWRG?=
 =?utf-8?B?alRjbThJMk1sTTRUZUI0anpDcDcxMWRISnJOdnlsdHZLU1E5WXhKSk1yZ2tT?=
 =?utf-8?B?bmlRd3k2QXNMbTNrS3lHcFJSNEhkYy94QytUUDFNS0lUMi9mRHozR01TdU9y?=
 =?utf-8?B?Y1dLamJQRHUrd2ZFa3oyenpnUWg3QUlCM1RidFE5YVhrTmVFRVV2N09oNUJi?=
 =?utf-8?B?MnFMRlhUSnkvUTFZVXhnMVpyMTlFWFFlb3dRMThRNWN6Z01oSXBheWJEam5N?=
 =?utf-8?B?YWxzMEdxSVZQTndEOUQyNzl5TzRERys2RWljeTdBWFo2d3krOEJEc0NsV3d6?=
 =?utf-8?B?Qm9EWGwyTzZ0VVdvdXplR0VHbmN3VDZ2djV6bkdIcEYvYVlBdHUwNlRIZS81?=
 =?utf-8?B?MTFhREhIb2t6clRMMEdsSzlHSCt0VFZoMkluL2p3VUw0Nnkwc1RCMmNKcEFl?=
 =?utf-8?B?c0ZlVkJwdkt3Y1hQREQ1L0tVcUMyTkpRYUxNa1JLS3NmeklJLzBtU1BzaUJL?=
 =?utf-8?B?TnlabkxyQU1TeUZwZ0FlaGRZNTAvYldBaTBvWnVlSTlGeitKaHg2VnMvajdX?=
 =?utf-8?B?cVZSNDNuTTlYS3B3ZUNCTElNZUVRNk1Jd0tJZGplUmd5UUJHQlZkOC9TQTVj?=
 =?utf-8?B?bXFxK1MrekpoL0NCc2lmUmhWK0s3dGxOQlpPeHdBMlRxdkJScTZGS0VmRnRT?=
 =?utf-8?B?UXdVWXlRY3BpczV5Z0IvRDY2TGgvVlJOL1IzVTJMcVB2WVREcWlDUlNVN2lI?=
 =?utf-8?B?ZklvWkl4TEtwQWxKUFZ3MEY1dVJQUWJUNXM4UVQvNktuR1NEMWlBdEswQzB5?=
 =?utf-8?B?TmM4S0NwR01JdWlNL3VXakRyVm8wMjIzbi9xQWpKbTVBS0FSRDF0c2J5SWlV?=
 =?utf-8?B?dDlKQis1NHduZEh0dVlBMVI4aTFzejdiQXpDN0tHeDNVWnRMdXZOYkkzaWZJ?=
 =?utf-8?B?Tlg0d0dabVF6d2VOVUFmYmhQajJKaE9PbW9yVGFUMXJ2QjRQUW1ETHZXcHhN?=
 =?utf-8?B?S0M2a2I3dVlJQ1M2d3ByMkVVSWM5cEd3MG12a1UzM1FrRVM1Tkh2M1RhcWRN?=
 =?utf-8?B?WU1lbHp4RUtMUmV3UW1OOG4vQ1c2UW5aMVQ4eEJhaWRIWXdWRm9menZjTG9N?=
 =?utf-8?B?VjZLdWNCcUZsN3E4djNwMUh3MTJBQllKeEYyZEp2SHVVaDRzQ2ZkSmo3UnAw?=
 =?utf-8?B?OUhrNFBGWnpDWUZhQnJRRnVNR1Zpb29EaXVvbXRPZU9sa2x3MWxPaTRvdk5M?=
 =?utf-8?B?OENabmNIdG9OZkEvQ3hsRzBTRm1ZNzYxZVpRcW1haVpxZndYeDJYL0VnV0M0?=
 =?utf-8?B?dlhPKzlVVGNNTVA3UHpFLzhYVTZOc1BkM1lpYmtlTU05T2Z5YVpZUklhMksy?=
 =?utf-8?B?akR5RG9idk9xTzJjK3FNVVlGY0Z1dElocXZVamMrcFBWVEhHRXN4Q1MvV2hs?=
 =?utf-8?B?UmJqV0I3WXBEMmZDOHZTQURSYis4TzgrM0FlVy94UVNILzdwakZFT25MQWVk?=
 =?utf-8?B?QmxqTUVQZUNxQlZEYStEaXpwamxLdTlpVTVYZk10YjJwMStaclVoMERBK3da?=
 =?utf-8?B?elhySUpzWmZrNG1yNDBqYVJjMnlFc3lFaEhKLzRyZ3V0OXFTNk13MlRndlk5?=
 =?utf-8?B?ek9GWXgwNGxmMlZFNWJ6K3dFSnR2WSs2eklYQlJPM29xNi9sYU5wa3RXOEI0?=
 =?utf-8?B?aC9tVlgvTmlWWUg3eHZ5UGtKVS9rL2pXK1h6cm5QZW1lWTd6OU14bFhZZVdv?=
 =?utf-8?B?azhYZ0dCRDFFajJPY1BlV1VnRVYrTng2ckpya2J4K1FxR1Vqd0xhWjJHT1JL?=
 =?utf-8?B?ckNEQ0l3cDUrY2pPQWtsdFZKOW9EQjFKU1JYeEV3VFZob1VsK0cyYjlHS0M3?=
 =?utf-8?B?c2kvekZGeFhHTzJnWjViMGlkZ3g5OW1QWmdOdGxmZWcrRCtNeG9mRGlpT3Q2?=
 =?utf-8?B?TmVlSmp4ZUZZSmVBajVPNmxaRlZ3ZlAxNHYzdXkzY0F0TzE4WTlrMFQ5eko0?=
 =?utf-8?B?OEVmbHJnOGo4N3JRWnZhWHZ6YVFabkdMZndBNThjU2xLeXRpcTQ2WVFLRWZQ?=
 =?utf-8?B?alpUOTdBWUlhN1NMQ1lvdStzNm53PT0=?=
Content-ID: <85975FFD84A3C24C9A5E8057735780C9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f56ed9b0-d40e-48b5-7509-08d9c1c616ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2021 01:31:17.6431 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ikPKwHFhPn/Hw5hOdJKZlGaAKBc6pdU5d4e1bUZw/UGhUDawzENS83av8eck1dch3nDECURYN+/zOwThuW2TlO7VyAzS8cwgnV9zgd5u9Rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_173127_697054_CB2387BF 
X-CRM114-Status: GOOD (  21.95  )
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

On 11/19/21 10:14 AM, Alexander A Sverdlin wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Hi, nice to hear from you again!

> 
> Erase can be zeroed in spi_nor_parse_4bait() or
> spi_nor_init_non_uniform_erase_map(). In practice it happened with
> mt25qu256a, which supports 4K, 32K, 64K erases with 3b address commands,
> but only 4K and 64K erase with 4b address commands.

:D

> 
> Fixes: dc92843159a7 ("mtd: spi-nor: fix erase_type array to indicate current map conf")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
> Changes in v2:
> erase->opcode -> erase->size
> 
>  drivers/mtd/spi-nor/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 88dd090..183ea9d 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1400,6 +1400,8 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
>                         continue;
> 
>                 erase = &map->erase_type[i];
> +               if (!erase->size)
> +                       continue;

I need a bit of context here. Does mt25qu256a has a uniform erase layout?
i.e. Does your flash has sectors of more than one size or does not allow
the 4K and 64K erase types to be applied on all sectors in the 4B case?
If no, you should have been in the spi_nor_has_uniform_erase() case, and
if this case does not suit you, maybe we should update the code for this
specific case instead.

On a short look I see that this flash defines just BFPT and 4BAIT table,
so no SMPT. It looks like you're forcing the flash to behave as it had defined
SMPT. Am I wrong?

Also, should we update the region's erase mask instead and mask out the
unsupported erase type? I would love to hear more about your use case.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
