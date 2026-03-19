Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7798D108E1F3
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Mar 2026 11:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=69+ZAn9A8Z0dREwPPGqlg1X6ulWI9DE1tm4Cv+jPVjk=; b=B/4cysUzsQsQ1s
	7mJgDrmtm2Hia2B4qLOHccUVN22lOdq10E2WcTvfN9eH/SPWv5wjhjX2xVa/2032rTxnHf+jgKjX6
	b/kGG9xpbpD0+bzHz3ABlUqcrizWO81d05VOFx2ztmXO4H/lVdRLST7OrapJ17C+g4ZZpCptEvXMh
	5ncSNK1U85uBQeq6no+nrfBs9FdTa07gYMbiSyBkC8fUAcicjqtt8TP8Sc05c5Fyw9NkaG9FjV9HA
	3YvvF0GpIsJ1Q18Hbz+zSolq3tEAaNudJlpZyO6CrTtX6p8+nak0I2py9ZN2s4AyvMHEf7bCvMNOB
	C7SNszkJQoqhuRE2llMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BfB-0000000AXtb-3Gn3;
	Thu, 19 Mar 2026 11:35:41 +0000
Received: from mail-italynorthazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c215::1] helo=MI1P293CU004.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Bf7-0000000AXsi-2m0m
	for linux-mtd@lists.infradead.org;
	Thu, 19 Mar 2026 11:35:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrB2ha9JqpaR57Cyijuv+Nq36ff5ykiHIn6zVQH3bDGmU8gISOUMtlW4h4yiPTImDt1ceecR2vmOKR6ReKen5T39xXWwGj8yaQnrdOuJ5D5vo7/PRj15d1F2vteLg9sRtnUbJ0FBMgdXuBHztXcL2PDCTbgHNlPNytsdAE/PExGpsV0hLscdlg1BwafcgkdbVQvbH6jHaRzVA3fHPVRSQvofVgjKEtO/d5ipo12xt8XHdeHAXTugZm+l8LJogy/3eg7bPVS1REoAmpwQ438r8YBTlWfwuwKM7IktUW13nP9DpBA4fNy/i7l7w5EW7bn7m5nUKYBqUsHFzR91SzIZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53AiirzawLhviTlq0FYv67ImWlwsaEWYarkr+WCoaQQ=;
 b=mNzllDqyKLrWc1AcjJfVQs+iaYCesay7Q0RjK7VOlJ52OUbVCmEk/RyBEnP/ckxI9hPtdoQIMCn6dgHLXI4RBd84aIGmentlwQNMDI7pLcHsa+Re8ionoQ2aU0aDJ4oos9o6lrILNjgLsDHETtB7vrq2lkY3pSGeZfI1mN2/AYQ7ipyXSs8lePuQDop1XRdSGgF4zFPr+u8419m5zgb47SiI7RgiLma5kYQnNbfan9PH7jLI8UvtgwuYZkAkLsfaXtfi0vn/hAqE6Dnzuw/SREULKJgbBjJ11PrrdpvKC2RMDpD93FqOm7YNKrvTag9AxJIbV2yAgOXFGQ8GDzpl5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dave.eu; dmarc=pass action=none header.from=dave.eu; dkim=pass
 header.d=dave.eu; arc=none
Received: from MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:50::6) by
 MI1P293MB0160.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Thu, 19 Mar 2026 11:35:29 +0000
Received: from MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM
 ([fe80::5fc8:9a15:2d20:a015]) by MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM
 ([fe80::5fc8:9a15:2d20:a015%4]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 11:35:28 +0000
From: Andrea Scian <andrea.scian@dave.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Olivier Sobrie
	<olivier@sobrie.be>
CC: Michal Simek <michal.simek@amd.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mtd: rawnand: pl353: make sure optimal timings are
 applied
Thread-Topic: [PATCH] mtd: rawnand: pl353: make sure optimal timings are
 applied
Thread-Index: AQHctSFsRztTSkKi+0OSZy0NDxL3YrW1vM5Q
Date: Thu, 19 Mar 2026 11:35:28 +0000
Message-ID: <MI2P293MB0264169E2D7E0528FA4989C9974FA@MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM>
References: <20260304211823.569972-1-olivier@sobrie.be>
 <87bjgogo0g.fsf@bootlin.com>
In-Reply-To: <87bjgogo0g.fsf@bootlin.com>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dave.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MI2P293MB0264:EE_|MI1P293MB0160:EE_
x-ms-office365-filtering-correlation-id: 2a75ad46-27c5-41fc-1dd8-08de85ab9f20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: eYPzkJZwwEBoCPiR4RmEG3q0WLdTUBs3uBJDnQpfBXUi8PJmDPp4AesV8dtw8HRrDAr9iu7ZlVo0hWTTLwqoIolo70MmhPh6vySiZHhi9FT9y3OPxRno4VjW1HFIfDdhPzy/ggzyZJ2P6nHBYzpWvxE4Fl+pdc9L/Q/Q3L44uRXA88wgF0peFWhQ56KJ8hd4hoYVVa2kM9hfzfEx3P8ZRGwg+05bwofy7ULYM7Se1PEmvGZUF8p4H0BNzuIiLoiiW7Z9VVykFCKquNH5B8xVP/5Tmod/9OXcslVzDrQlIP+KFwUWtqEzPSbDniFMVhBEnzJG0cPFbUoFjFAt9avJhrWr4g+5lyislcObNjJwBA+fjzqZ/3jeAsRYstzF3utNMKk1QJcqogZMIJqmfagmQVLwFvuzq6ft1de/N2j57VIE7tfhDO4onrKTVXmqdNcd/x8qv6ElJrzjRNP5dmQQh1cFeGQxPLz2CTFEYUOntX9M4WPFNoqh/mJzS4WNLv5rpR0ZEtwPt+mWZ+DHdL1uNOeHZp3VCq7haxl5XohBoxvkg9HC6j4Te9tP/xiBeUSN25/NZybiGGCZ6UG7HlivSonKy3ZBKFMw4cPVmvqWmR2DmGwWYcPj1xuQ8rO1LKZOz41j7WQxjKEAtG8HtMwXutyPMTTwUi9QYnlc7QVJQIeY53TTxkPTsReLy75WGbicl0FG5zzwH73WhRzN7BHYe1+3Owi3WiPqjnO0alY0mJcelLA4TC9J5sYZRk55kpgH1iW8rM87mlWTXd3KgAZ85bLEsq0pVyk0vZhtzIJsJ18=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVJCdktZa1JxS0lZMU9VYXhKNU5vdk16VHVIS0lGeFRDMmdhRjJPek9ONXV1?=
 =?utf-8?B?WTk1TW9BUDRXRGozQXZWSFBRMzhJZUcrUW5pYkUvWmswRWRDMjB0RFdReUE2?=
 =?utf-8?B?dEduZkdzQk1JLy9SZmdMVmNQRGxvdTR1OHpJSFVTbml6VjBveXlYRGNuVWt6?=
 =?utf-8?B?aTlzSGUzWDMxVTlGSjNrS1FXU0NrYUhCQTdQZWwrdlhscGZVOWVkNVNoTHRK?=
 =?utf-8?B?UHVJdkd0MG5QeEZrQTA1ZVhmYUZ4WDdLaTNGRkszQVc5dWlIaUdUcWxLVDE0?=
 =?utf-8?B?d1JGRzlZZmxTTG9MUXlJUm1sREVBemZid1ZDZElmT2VHbjc3K0dvU1NWZmd0?=
 =?utf-8?B?VW8wMnZjTHoweE10bWZFd01leGhkZ1lzZWpUOS9nQndnaEdMck5Rd3lQVmVS?=
 =?utf-8?B?enhnRkY4dXFBYXlZdUc4MFhlYXg5YVNEeHQveklIeVAxbmJYVmYwVVBtUzBH?=
 =?utf-8?B?ZWVoNk1HUVlnUmlQOFp2LzNGNU5TMTVCR1Z6bm1VV3ZvZHJuYVV6MjkxVW94?=
 =?utf-8?B?V24xejE1RUw3NzByVk92d3lrczYvcVJkUjVmeXJKN1ZOcklhTTRpNXU0aHhU?=
 =?utf-8?B?RUpURGhCOFQyWkJFaEtXS1lhdVlzdThvTHNlcmlRaFkxd2dDdVNEWEE3aVdz?=
 =?utf-8?B?K0YxaVZFR3d2RFEwaHhmTncxN2lEWmJvTm0wcWhRSm03Tkg0S0lReEtTRE1u?=
 =?utf-8?B?TnowYWNXZS9lM2lKOHNub01WRHJYT1RUN3ZVbzNTRUszRTNOdTZLNng5d3Qx?=
 =?utf-8?B?Q1hTVGFwWkw3bVJuWFBnaWx2V25zQUc3WVhvcGowWUVIU1J3aytlZ1A3dlU4?=
 =?utf-8?B?bFF6RUNyalUyTGRzZU9sVU9lY2FCUTFRaXU4Nm1jdlY5dzZDTFZ0OW9GYVVZ?=
 =?utf-8?B?M2NndkVWdUJxN0V6aVZwMzhCTFJmNFNqZVIyY1YxbkN0TlN6S2RWQkQycnRp?=
 =?utf-8?B?Q2xKdlJKTk9pR3dCemRsc28rb1pROVlCNTVCQ2s1SUtjc3VVS29DV2o2ZzVh?=
 =?utf-8?B?MFhGcW1LWGNHbUl1cVBZeG5JSzZwU3Z6ZWRza2FnNXhMUWcxYjZOeVRDTzIw?=
 =?utf-8?B?ZTNXeXV6YjNuMkpYRGlxMVkwTG03RUFXVU81cEVMY1pLSDMvNnR2YWdGcXVN?=
 =?utf-8?B?N2VSNk5Zb29EUXViSThqTjhnNEVVdVE5dnpPdnAvWnQxakxFdk96NFBNckFD?=
 =?utf-8?B?QVFnYVBlVzVSSjljZk5lTmlzMlJ3NWVldm41ZmhDQmg1N0ZWZlhlTk5Ud3JJ?=
 =?utf-8?B?dnYrNlJCSndTdGkrVmRuNkRRaU1qSmNBM3dLSlBhYU9ucDkvbWxVOTlDKzho?=
 =?utf-8?B?aEMzWnoyclRpQjN0TVlCc01Rb3JFZkRFenFxVldmMVplVjRtVld3S2dXdTFv?=
 =?utf-8?B?aXp4ZjJZUEduU2k0cTFjZ21nS1RQUWtiRVhHckFhU2NWd3VKdjkwQTJ1aXNZ?=
 =?utf-8?B?UkJPMDI4TzNQNURQS0hZY0JKWFhKQ1VEVzNET0phZGk5ME5iU1JEM3gzVS85?=
 =?utf-8?B?dWthNkZ5M05adWFobGtSd2NYUWFiSzJ5RXVSQm9mN0NTSVNZa2lmekxwSnNq?=
 =?utf-8?B?dmtFZFJaQVl6YTJBbnBaNUxUTURSM3ZaTVpEZjRoNVhIcE53UXA4SHJVNy9j?=
 =?utf-8?B?amYyTnltcmFBQzRJeWRmMW9reDBYcUhNZllJVW1TUTA5K1pyT01pZEpvdi9H?=
 =?utf-8?B?MFJQSzU0akRXZVlnQU5ybjdhYzk5Vk9zaHc5RS9zRjlSc3ZjcUxpRCtmR1BX?=
 =?utf-8?B?ck1PV3ArQVB4U3BLT0xKcXV0bEJKQmxqbGVoTTBoNFdDOEF1SXY4NEZxMDkv?=
 =?utf-8?B?Q1AvWDg4V3NOZko3OHJDa1VqWEVCRkhpZ0hVQ3Z2QWlDZjVxZnZ6MXRjekxt?=
 =?utf-8?B?K0RpUGwzQmdpRzU1RXl2LzhoVitPS3ZwT3owN3hibGpPZkVEaFpFamRadHZ1?=
 =?utf-8?B?S2NvWVVXK3ZIdHc4OEZtSVByYnlQdzVoa3hHMlhWd3pEck9EelhFMG1KY1Q3?=
 =?utf-8?B?azlDY3N0S0dkdk03NGZQMWRXalVVQXNTL29ZcENicmttWnYyVEpkVklBOHVa?=
 =?utf-8?B?ZmIvOWZWUEw3eExMd1lUeTlHdkRvTkNkc1Y4RmcySk9uY0JHbXQ2OHExK1JB?=
 =?utf-8?B?V0ZHaFhrc0FKS05sTlF5TFFrY2ZPNWxsVDF2RXYwcytlY3RyRHMzcWRzbVNy?=
 =?utf-8?B?M3Z4ekJQWWJKRklBcFRlRkUwZEtjNUZRL0x0dnFVbzAzT3pvTXdkMzAwN2Fj?=
 =?utf-8?B?UFJHNmF6R0EwYTNKTFlzc3JFcWNwS0RNVmxGeG1mNGxkbnhac21jMjNCUVZz?=
 =?utf-8?Q?nJzhuakohikQLIe0In?=
MIME-Version: 1.0
X-OriginatorOrg: dave.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a75ad46-27c5-41fc-1dd8-08de85ab9f20
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 11:35:28.8282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c85ddbc-ed10-48cc-8f28-5d7f9561238a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: deo3TRB+87tuM7a4swFIjf1yBZ0OF1rKk+dpTlhxcpMZuYvWDqSjlXauOorxMUvL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI1P293MB0160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_043537_699696_506054E2 
X-CRM114-Status: GOOD (  16.09  )
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

DQpEZWFyIE1pcXVlbCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPg0KPiBTZW50OiBsdW5lZMOs
IDE2IG1hcnpvIDIwMjYgMDk6NDcNCj4gW3NuaXBdIA0KPiBBbmRyZWEsIHRoaXMgbWlnaHQgYmUg
dGhlIHJlYXNvbiB3aHkgeW91ciBOQU5EIGNoaXAgbWlzYmVoYXZlcyBhZnRlciBhDQo+IHNldF9m
ZWF0dXJlLiBXb3VsZCB5b3UgbWluZCB0ZXN0aW5nIGl0Pw0KDQpUaGFua3MgZm9yIHBvaW50aW5n
IG1lIHRvIHRoaXMgcGF0Y2guDQpJIGdvdCBhIHNpbWlsYXIgb25lIGluIG15IHRyZWUgKHNvcnJ5
IGZvciBub3QgcHVibGlzaGluZyBpdCBiZWZvcmUsIGJ1dCBFQ0Mgd2FzIGEgYmlnZ2VyIHByb2Js
ZW0gOy0pICksIHRoYXQgYXBwbGllcyBuZXcgdGltaW5nIGxpa2Ugb24gT2xpdmllciBwYXRjaCBi
dXQgb25seSB3aGVuIHRoZXkgY2hhbmdlDQoNCg0KY29tbWl0IDM1YmEzNzQzM2ViZWY3N2FiMWYw
ZTQ3ZTc5ZTY5YmJjMGQyMWNmOTANCkF1dGhvcjogQW5kcmVhIFNjaWFuIDxhbmRyZWEuc2NpYW5A
ZGF2ZS5ldT4NCkRhdGU6ICAgTW9uIEphbiAxMiAxNzo0OTozNyAyMDI2ICswMTAwDQoNCiAgICBt
dGQ6IHJhd25hbmQ6IHBsMzUzOiB1cGRhdGUgdGltaW5ncyBvbiBjaGFuZ2VzDQogICAgDQogICAg
SXQncyBub3QgZW5vdWdoIHRvIHdhaXQgZm9yIHNlbGVjdGluZyBhbm90aGVyIGNoaXAgdG8NCiAg
ICB1cGRhdGUgdGhlIHRpbWluZ3MsIGJlY2F1c2UgdGhpcyBhbHNvIGhhcHBlbnMgd2l0aG91dA0K
ICAgIGNoYW5naW5nIENTIChlLmcuIHdoZW4gc3dpdGNoaW5nIGJldHdlZW4gZGlmZmVyZW50IFNE
UiBtb2RlcykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3BsMzV4LW5hbmQt
Y29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcGwzNXgtbmFuZC1jb250cm9sbGVy
LmMNCmluZGV4IDc0Y2MzN2U3YjdkYS4uNzI0NjM2MzgxNDhkIDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvcGwzNXgtbmFuZC1jb250cm9sbGVyLmMNCisrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3BsMzV4LW5hbmQtY29udHJvbGxlci5jDQpAQCAtNzkwLDYgKzc5MCw3IEBAIHN0
YXRpYyBpbnQgcGwzNXhfbmZjX3NldHVwX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlw
LCBpbnQgY3MsDQogCWNvbnN0IHN0cnVjdCBuYW5kX3Nkcl90aW1pbmdzICpzZHI7DQogCXVuc2ln
bmVkIGludCBwZXJpb2RfbnMsIHZhbDsNCiAJc3RydWN0IGNsayAqbWNsazsNCisJdTMyIG5ld190
aW1pbmdzOw0KIA0KIAlzZHIgPSBuYW5kX2dldF9zZHJfdGltaW5ncyhjb25mKTsNCiAJaWYgKElT
X0VSUihzZHIpKQ0KQEAgLTg1NywxMyArODU4LDE4IEBAIHN0YXRpYyBpbnQgcGwzNXhfbmZjX3Nl
dHVwX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY3MsDQogCWlmIChjcyA9
PSBOQU5EX0RBVEFfSUZBQ0VfQ0hFQ0tfT05MWSkNCiAJCXJldHVybiAwOw0KIA0KLQlwbG5hbmQt
PnRpbWluZ3MgPSBQTDM1WF9TTUNfTkFORF9UUkNfQ1lDTEVTKHRtZ3MudF9yYykgfA0KKwluZXdf
dGltaW5ncyA9ICBQTDM1WF9TTUNfTkFORF9UUkNfQ1lDTEVTKHRtZ3MudF9yYykgfA0KIAkJCSAg
UEwzNVhfU01DX05BTkRfVFdDX0NZQ0xFUyh0bWdzLnRfd2MpIHwNCiAJCQkgIFBMMzVYX1NNQ19O
QU5EX1RSRUFfQ1lDTEVTKHRtZ3MudF9yZWEpIHwNCiAJCQkgIFBMMzVYX1NNQ19OQU5EX1RXUF9D
WUNMRVModG1ncy50X3dwKSB8DQogCQkJICBQTDM1WF9TTUNfTkFORF9UQ0xSX0NZQ0xFUyh0bWdz
LnRfY2xyKSB8DQogCQkJICBQTDM1WF9TTUNfTkFORF9UQVJfQ1lDTEVTKHRtZ3MudF9hcikgfA0K
IAkJCSAgUEwzNVhfU01DX05BTkRfVFJSX0NZQ0xFUyh0bWdzLnRfcnIpOw0KKwlpZiAocGxuYW5k
LT50aW1pbmdzICE9IG5ld190aW1pbmdzKSB7DQorCQlwbG5hbmQtPnRpbWluZ3MgPSBuZXdfdGlt
aW5nczsNCisJCXdyaXRlbChwbG5hbmQtPnRpbWluZ3MsIG5mYy0+Y29uZl9yZWdzICsgUEwzNVhf
U01DX0NZQ0xFUyk7DQorCQlwbDM1eF9zbWNfdXBkYXRlX3JlZ3MobmZjKTsNCisJfQ0KIA0KIAlk
ZXZfaW5mbyhuZmMtPmRldiwNCiAJCSAiTkFORCB0aW1pbmdzOiB0UkM9JXUsIHRXQz0ldSwgdFJF
QT0ldSwgdFdQPSV1LCB0Q0xSPSV1LCB0QVI9JXUsIHRSUj0ldSAoaW4gY3ljbGVzKSAocmVnIDB4
JTA4eClcbiIsDQoNCg0KVGhpcyB3b3JrcyBvbiBteSBzZXR1cCAoTkFORCBub3cgcnVuIGEgbG90
IGZhc3RlcikgYnV0IGl0IGRvZXNuJ3Qgc29sdmUgdGhlIHNldF9mZWF0dXJlIHByb2JsZW0uDQpI
b3dldmVyLCBsZXQgbWUgdHJ5IHRoaXMgYWdhaW4gd2l0aCBhIGNsZWFuZXIgc2V0dXANCg0KS2lu
ZCBSZWdhcmRzLA0KDQpBbmRyZWEgU2NpYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
