Return-Path: <SRS0=HmSd=G7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209BDC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 11:18:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 940BC64DE5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jan 2021 11:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 940BC64DE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infinera.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8DSgg2fdutrsUYAnV3P195i6cZ0s+mOr4UV4NlJwvV0=; b=x8nGUBSnacSQiSgzHnF7megG1
	Xs8uhTZ+9Bkzn56wMvzs1oO6X3P+dxAY12Ccfx6CM74bUvIrFfdPxvmF5OvX9pKiAaWf66Zg4JJ+i
	YAm10RPv3vAjF3HqxTc0V6giGhhN58Bki1ZlN0Q9jz/xPUJBRKqDTWpb6WzZ4nVLQvX3qiVlEjqim
	UUvHWVKcTqR9QFCTAIHe+OvSWjzSNV2S8uqlFmn1OoI8ZrNCF41gS1cHdKGwJL8fGJ54OdZaTZXlW
	11WigWRxNk6Y85DK10udK/83rSbNVjtxdwM8tw2CanKLZXBmDa1USj/m0ZjipFpbtbeBggJxvaA1E
	UX//hFrNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l55J2-000823-Ri; Thu, 28 Jan 2021 11:17:44 +0000
Received: from mail-mw2nam12on20603.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::603]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l55Iy-00080Z-5S
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2021 11:17:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjpbr/iBWt+SBmC+EH7RFFpmU3BYg53qizSYVfaHDQZ/GAZD8RvYfDeTqMDSrE4WoonlVLZ8SLAEbQVgxiFNSPteSsERtV2v8QjF77Z7fvQvLjJ6rhznqLTrqmykqvJrMcS7TnZPBhkpLj8I81XQazjL23LVpACbKCrrHTg+5pQjU8GOeBTkoTDqnN9LYfpdtNnfq5CfBVPQSeC2t+AJJ/KQNOe9YVCwPDzw2fQlSwWRUvLN/4kbroAsG0anzttbejlvtLUIxSzX+vwbdRxhO3in6QPUg9bRHoxFLXcJlsf2REATjuNAu+xejwMtn2H0xp6NxFN1OOUf6h5GE48Q4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pYZjzpPW/8SYihOhN9bs/phNmnYqaztp9ovH1KSRMg=;
 b=a6KoEHpVGUjVZ3mODRU1MbiofYlihaekGGcJvzE0PplzS9epgRnNTYYTGnoQMO3LfDjwu8uOFc/xFRQzH2s5I+aAgWCmGxJBPFVNZEeXfnnS5Xy4PK90AqV9iyayV1GmAtShWP16WSba8fUml2JOjt1R6TrgyhdIR4b1MF88WnsA6ZEge52aBpWWNKaCU16KHjDYAPfWrxB9MGs4ZvYqXUrLGVMYkQAG+7oOVvafqJURmc3y3Du6LIlUbyHNX4cfRwl5KEiAiBh8x91n4oT2t7JDP7IOeFAdPlVixGOs9CCUHS/6c4ItLu5NvYuyYo/UZWBsw81WbjPKQZgPTuFxGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pYZjzpPW/8SYihOhN9bs/phNmnYqaztp9ovH1KSRMg=;
 b=QF7eBPcpTjY60y0OggFynWVLNlJT9gzg3pgedw+tIdE32WvGWNHDEetQkUo0CIhUSTcYnrcGxyX6vItdePA9zsyCRkKwAkxZrCbsntfh+hlOE7oXihz7tyV0SE61+4BqBfVLVegtNi34yHW6xZjB7uuT2YraTRFgA2P4UA9NQuE=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR1001MB2231.namprd10.prod.outlook.com
 (2603:10b6:910:44::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.19; Thu, 28 Jan
 2021 11:17:34 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::fcfe:f4e4:1d73:6d79]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::fcfe:f4e4:1d73:6d79%5]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 11:17:34 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "menglong8.dong@gmail.com" <menglong8.dong@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH] jffs2: check the validity of dstlen in
 jffs2_zlib_compress()
Thread-Topic: [PATCH] jffs2: check the validity of dstlen in
 jffs2_zlib_compress()
Thread-Index: AQHW9WSdcQjTUgG4ZEOlNPQW4whXrao844+A
Date: Thu, 28 Jan 2021 11:17:34 +0000
Message-ID: <b7d9d9db42d639aa143f6e6b98ca7b9f4dcfd46e.camel@infinera.com>
References: <20210128105535.49479-1-yang.yang29@zte.com.cn>
In-Reply-To: <20210128105535.49479-1-yang.yang29@zte.com.cn>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b40952e-7632-4dea-c8a3-08d8c37e4fc3
x-ms-traffictypediagnostic: CY4PR1001MB2231:
x-microsoft-antispam-prvs: <CY4PR1001MB2231B6507A9DCB4DE56D6D7CF4BA9@CY4PR1001MB2231.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cDNT/G5T29a8erOXHNDlTOp9yxWNlqULH1MW47rusjxOjLC8p4NbGGMGec4LsfrWk8+5oIWRX4JMZ268MAPo2XXC6ZQGLSrRfp6zOMmQHaaKfQk/ORoRPhmPaJvT9vLmLvdD6toGVg0e+C83utHkOHQXZ88OWFGx7r4qzR9BKXhfPuuM8+hVgWhOBs6/3beijN3y6WaXlWL5KrckRVLWt/d/s9VQc9L5GpcJNwc9cc9lqC3yZEFDSsJpn6MRvr8cK+85dRHVvTpjA3lw+LO0gm85wJU8pw7Bzg8mARMol7hS0lyPQWm2tKc7n+zgesbQQSJl2hBJIVg6maqm23bhxdW84M7fX1dDWsV4An+OjAyfVaeCWcE4om4LesQLFrmSojJp/0SFNzpIZ17NMlBbvl0+UYC5KtgVeKe1Px1kXkAw/r8Pb4aXjaykD4vU3Xz7e9j37WHQREjD5uxNr4OotjnIPB3zNfHogsHmWCfLiwu8EMEtkIv8TTJWa6BvCc/fmv4OcaQIQGuoMpmZYnZZvg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2389.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(64756008)(8676002)(66556008)(91956017)(76116006)(66446008)(66946007)(2616005)(8936002)(54906003)(71200400001)(66476007)(4326008)(83380400001)(5660300002)(186003)(316002)(6486002)(2906002)(6512007)(86362001)(26005)(6506007)(36756003)(110136005)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aGZuMjZnOW04RlhOc1lhUHZsNlpsZkRQWEtaTE40WjdFM0lQWjJsR3A4VzJP?=
 =?utf-8?B?bVVlaW5rVmNoZTB3Ny8yaEFTYXVjYldyNUJFc2Z1ejhhN0NVTHh2STRrTm0r?=
 =?utf-8?B?bEY2WUxaVFprYloyeG5WdVJLckxzRXBaV1ozMGNVY0tmMjlYMFBrN3hFU3RR?=
 =?utf-8?B?MTh2b1NGMHNodVRkbyttM3VJTFZBUzRBNE9JeFl3U0gzVlZFWG1PYTk0bjd0?=
 =?utf-8?B?QTZBT0E1TXJEckR1VFNPYVFvcmZCOWFOWUJyWWh4cWI5aXlrak90R1NialdK?=
 =?utf-8?B?ajV4OHdPbnd4WXR2UDExQmIzZGQ4eWE4UndXSTl6VjNHaDl6NGZQZmJ4WEYx?=
 =?utf-8?B?QmcxK01vR3NhMStqRDRXRU5hdkVHQkNNMWl5RC9YOWNiWWIyZk5kcjFwSVNQ?=
 =?utf-8?B?NTQxUk16aTRZYjdrcFROdTJNdTM0eXlKdWxZK1VmSVhSZ0hZV2FsQVNpdGlM?=
 =?utf-8?B?alduK1UrbkNsbUtkci9XRVpkQjUxOGFqc2xPVkQ3L2h1eVI1R0t4RGI4QUVL?=
 =?utf-8?B?Z01zNXNwSG9tQy9ZNldHeFE1TDRrRVI4WS84cE9QMUk2dlpxU0RVbEZvRDhk?=
 =?utf-8?B?d2xoYmRJaWxId2dvZUJ4K01VSGtjL1JnbGp2WlBzdEhZSVVZVGJicTBDSU5w?=
 =?utf-8?B?OWpQbWdoRUhVRUNVVXplTHFIUGRKS0J0WDBCUytUTWxaZVlsQ21KY2xaSGVL?=
 =?utf-8?B?WG83V2IvSEZXVHpFUjFlU1gxL3NJVHliTzU5eklUcmFXdFZ6dm5zbi9uYTIr?=
 =?utf-8?B?TFE2Y0poams2UjdXWHBmRE55TFBTUVk1ZFpocnB0RlJNWFFiOUdiVmVDZzdB?=
 =?utf-8?B?MFpYZjhNTURDTmg0Wk91RW01NktUUzJjNmhFUlB5M0Zjcy9TQUlWR1dUTGxE?=
 =?utf-8?B?SzZmeTJVaU9FQ0k2UklHMjlpYkQ4Z3Y1dU1BUVcrMk0wcTlRL3FRQVhHWElX?=
 =?utf-8?B?S29tRXRnOEpWLzB2YStRMzdPajBueHk2NllUaHlhMm5FWWU0Tk9IRC94Ri9N?=
 =?utf-8?B?T2oyZUgvb2NOWWt6OGtqeG12SHA5NmN4N0ROSTg0bUVzbnltcnBKRzdYTXYr?=
 =?utf-8?B?K20wN2NhaFRDMWZUOTZDamI3Nlc0alNtbGk1UlkvY21MMU1hdFZKNkREODYv?=
 =?utf-8?B?TWZ0TE5DZVpTTzR2SUVYNk5DdFB1Q2NLYVJwTWxvejhGQVU5aThpbittczhZ?=
 =?utf-8?B?dVdOS2FYNnFkNnJJTlZqaCs4clpxaDNqVHlYNnN6bGVvTnNSQi9RWlc0TDZO?=
 =?utf-8?B?TmxxTnl5QmRXVy9ucDEzc0hWZUFwNitObStWNmIwQkxuWFo3QU9Gbm1rM01q?=
 =?utf-8?B?cjhrOXpmSDN2Y3o3SndGeVgycjFSQXVzMEdnR2xQWnVKU3NtQi9vb3RFOUdR?=
 =?utf-8?B?b2hjRHU1ZTZyNzBiOVh3WFZCaktYVFhGVzhzTkZReFhKd1k1RUdvRDJSS2c2?=
 =?utf-8?B?eTNJODlSd2pHS3hzcEZSZm4vZk94NTI5K3hmYWp3PT0=?=
x-ms-exchange-transport-forked: True
Content-ID: <D5F599B8F7BF8D4B9CBC2669D8059D7E@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b40952e-7632-4dea-c8a3-08d8c37e4fc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2021 11:17:34.3572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: atSMWl0mPzK2UMSLFQ1zLleROyW1kQcTwkvo2hbPBoGkesoX5dIx+L5sCzgkfiWQFd5jZI20253L47KqCajhqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_061740_803203_66DE4A02 
X-CRM114-Status: GOOD (  20.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "yang.yang29@zte.com.cn" <yang.yang29@zte.com.cn>,
 "richard@nod.at" <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDIxLTAxLTI4IGF0IDAyOjU1IC0wODAwLCBtZW5nbG9uZzguZG9uZ0BnbWFpbC5j
b20gd3JvdGU6DQo+IEZyb206IFlhbmcgWWFuZyA8eWFuZy55YW5nMjlAenRlLmNvbS5jbj4NCj4g
DQo+IEtBU0FOIHJlcG9ydHMgYSBCVUcgd2hlbiBkb3dubG9hZCBmaWxlIGluIGpmZnMyIGZpbGVz
eXN0ZW0uSXQgaXMNCj4gYmVjYXVzZSB3aGVuIGRzdGxlbiA9PSAxLCBjcGFnZV9vdXQgd2lsbCB3
cml0ZSBhcnJheSBvdXQgb2YgYm91bmRzLg0KPiBBY3R1YWxseSwgZGF0YSB3aWxsIG5vdCBiZSBj
b21wcmVzc2VkIGluIGpmZnMyX3psaWJfY29tcHJlc3MoKSBpZg0KPiBkYXRhJ3MgbGVuZ3RoIGxl
c3MgdGhhbiA0Lg0KDQpPdWNoLCBkYXRhIGNvcnJ1cHRpb24gd2lsbCBlbnN1ZS4gR29vZCBmaW5k
IQ0KSSB0aGluayB0aGlzIG5lZWRzIHRvIGdvIHRvIHN0YWJsZSBhcyB3ZWxsLg0KDQogSm9ja2UN
Cg0KPiANCj4gWyAgMzkzLjc5OTc3OF0gQlVHOiBLQVNBTjogc2xhYi1vdXQtb2YtYm91bmRzIGlu
IGpmZnMyX3J0aW1lX2NvbXByZXNzKzB4MjE0LzB4MmYwIGF0IGFkZHIgZmZmZjgwMDA2MmUzYjI4
MQ0KPiBbICAzOTMuODA5MTY2XSBXcml0ZSBvZiBzaXplIDEgYnkgdGFzayB0ZnRwLzI5MTgNCj4g
WyAgMzkzLjgxMzUyNl0gQ1BVOiAzIFBJRDogMjkxOCBDb21tOiB0ZnRwIFRhaW50ZWQ6IEcgICAg
QiAgICAgICAgICAgNC45LjExNS1ydDkzLUVNQlNZUy1DR0VMLTYuMS5SNi1kaXJ0eSAjMQ0KPiBb
ICAzOTMuODIzMTczXSBIYXJkd2FyZSBuYW1lOiBMUzEwNDNBIFJEQiBCb2FyZCAoRFQpDQo+IFsg
IDM5My44Mjc4NzBdIENhbGwgdHJhY2U6DQo+IFsgIDM5My44MzAzMjJdIFs8ZmZmZjIwMDAwODA4
YzcwMD5dIGR1bXBfYmFja3RyYWNlKzB4MC8weDJmMA0KPiBbICAzOTMuODM1NzIxXSBbPGZmZmYy
MDAwMDgwOGNhMDQ+XSBzaG93X3N0YWNrKzB4MTQvMHgyMA0KPiBbICAzOTMuODQwNzc0XSBbPGZm
ZmYyMDAwMDg2ZWY3MDA+XSBkdW1wX3N0YWNrKzB4OTAvMHhiMA0KPiBbICAzOTMuODQ1ODI5XSBb
PGZmZmYyMDAwMDgyN2IxOWM+XSBrYXNhbl9vYmplY3RfZXJyKzB4MjQvMHg4MA0KPiBbICAzOTMu
ODUxNDAyXSBbPGZmZmYyMDAwMDgyN2I0MDQ+XSBrYXNhbl9yZXBvcnRfZXJyb3IrMHgxYjQvMHg0
ZDgNCj4gWyAgMzkzLjg1NzMyM10gWzxmZmZmMjAwMDA4MjdiYWU4Pl0ga2FzYW5fcmVwb3J0KzB4
MzgvMHg0MA0KPiBbICAzOTMuODYyNTQ4XSBbPGZmZmYyMDAwMDgyNzlkNDQ+XSBfX2FzYW5fc3Rv
cmUxKzB4NGMvMHg1OA0KPiBbICAzOTMuODY3ODU5XSBbPGZmZmYyMDAwMDg0Y2UyZWM+XSBqZmZz
Ml9ydGltZV9jb21wcmVzcysweDIxNC8weDJmMA0KPiBbICAzOTMuODczOTU1XSBbPGZmZmYyMDAw
MDg0YmIzYjA+XSBqZmZzMl9zZWxlY3RlZF9jb21wcmVzcysweDE3OC8weDJhMA0KPiBbICAzOTMu
ODgwMzA4XSBbPGZmZmYyMDAwMDg0YmI1MzA+XSBqZmZzMl9jb21wcmVzcysweDU4LzB4NDc4DQo+
IFsgIDM5My44ODU3OTZdIFs8ZmZmZjIwMDAwODRjNWIzND5dIGpmZnMyX3dyaXRlX2lub2RlX3Jh
bmdlKzB4MTNjLzB4NDUwDQo+IFsgIDM5My44OTIxNTBdIFs8ZmZmZjIwMDAwODRiZTBiOD5dIGpm
ZnMyX3dyaXRlX2VuZCsweDJhOC8weDRhMA0KPiBbICAzOTMuODk3ODExXSBbPGZmZmYyMDAwMDgx
ZjMwMDg+XSBnZW5lcmljX3BlcmZvcm1fd3JpdGUrMHgxYzAvMHgyODANCj4gWyAgMzkzLjkwMzk5
MF0gWzxmZmZmMjAwMDA4MWY1MDc0Pl0gX19nZW5lcmljX2ZpbGVfd3JpdGVfaXRlcisweDFjNC8w
eDIyOA0KPiBbICAzOTMuOTEwNTE3XSBbPGZmZmYyMDAwMDgxZjUyMTA+XSBnZW5lcmljX2ZpbGVf
d3JpdGVfaXRlcisweDEzOC8weDI4OA0KPiBbICAzOTMuOTE2ODcwXSBbPGZmZmYyMDAwMDgyOWVj
MWM+XSBfX3Zmc193cml0ZSsweDFiNC8weDIzOA0KPiBbICAzOTMuOTIyMTgxXSBbPGZmZmYyMDAw
MDgyOWZmMDA+XSB2ZnNfd3JpdGUrMHhkMC8weDIzOA0KPiBbICAzOTMuOTI3MjMyXSBbPGZmZmYy
MDAwMDgyYTFiYTg+XSBTeVNfd3JpdGUrMHhhMC8weDExMA0KPiBbICAzOTMuOTMyMjgzXSBbPGZm
ZmYyMDAwMDgwODQyOWM+XSBfX3N5c190cmFjZV9yZXR1cm4rMHgwLzB4NA0KPiBbICAzOTMuOTM3
ODUxXSBPYmplY3QgYXQgZmZmZjgwMDA2MmUzYjI4MCwgaW4gY2FjaGUga21hbGxvYy02NCBzaXpl
OiA2NA0KPiBbICAzOTMuOTQ0MTk3XSBBbGxvY2F0ZWQ6DQo+IFsgIDM5My45NDY1NTJdIFBJRCA9
IDI5MTgNCj4gWyAgMzkzLjk0ODkxM10gIHNhdmVfc3RhY2tfdHJhY2VfdHNrKzB4MC8weDIyMA0K
PiBbICAzOTMuOTUzMDk2XSAgc2F2ZV9zdGFja190cmFjZSsweDE4LzB4MjANCj4gWyAgMzkzLjk1
NjkzMl0gIGthc2FuX2ttYWxsb2MrMHhkOC8weDE4OA0KPiBbICAzOTMuOTYwNTk0XSAgX19rbWFs
bG9jKzB4MTQ0LzB4MjM4DQo+IFsgIDM5My45NjM5OTRdICBqZmZzMl9zZWxlY3RlZF9jb21wcmVz
cysweDQ4LzB4MmEwDQo+IFsgIDM5My45Njg1MjRdICBqZmZzMl9jb21wcmVzcysweDU4LzB4NDc4
DQo+IFsgIDM5My45NzIyNzNdICBqZmZzMl93cml0ZV9pbm9kZV9yYW5nZSsweDEzYy8weDQ1MA0K
PiBbICAzOTMuOTc2ODg5XSAgamZmczJfd3JpdGVfZW5kKzB4MmE4LzB4NGEwDQo+IFsgIDM5My45
ODA4MTBdICBnZW5lcmljX3BlcmZvcm1fd3JpdGUrMHgxYzAvMHgyODANCj4gWyAgMzkzLjk4NTI1
MV0gIF9fZ2VuZXJpY19maWxlX3dyaXRlX2l0ZXIrMHgxYzQvMHgyMjgNCj4gWyAgMzkzLjk5MDA0
MF0gIGdlbmVyaWNfZmlsZV93cml0ZV9pdGVyKzB4MTM4LzB4Mjg4DQo+IFsgIDM5My45OTQ2NTVd
ICBfX3Zmc193cml0ZSsweDFiNC8weDIzOA0KPiBbICAzOTMuOTk4MjI4XSAgdmZzX3dyaXRlKzB4
ZDAvMHgyMzgNCj4gWyAgMzk0LjAwMTU0M10gIFN5U193cml0ZSsweGEwLzB4MTEwDQo+IFsgIDM5
NC4wMDQ4NTZdICBfX3N5c190cmFjZV9yZXR1cm4rMHgwLzB4NA0KPiBbICAzOTQuMDA4Njg0XSBG
cmVlZDoNCj4gWyAgMzk0LjAxMDY5MV0gUElEID0gMjkxOA0KPiBbICAzOTQuMDEzMDUxXSAgc2F2
ZV9zdGFja190cmFjZV90c2srMHgwLzB4MjIwDQo+IFsgIDM5NC4wMTcyMzNdICBzYXZlX3N0YWNr
X3RyYWNlKzB4MTgvMHgyMA0KPiBbICAzOTQuMDIxMDY5XSAga2FzYW5fc2xhYl9mcmVlKzB4ODgv
MHgxODgNCj4gWyAgMzk0LjAyNDkwMl0gIGtmcmVlKzB4NmMvMHgxZDgNCj4gWyAgMzk0LjAyNzg2
OF0gIGpmZnMyX3N1bV93cml0ZV9zdW1ub2RlKzB4MmM0LzB4ODgwDQo+IFsgIDM5NC4wMzI0ODZd
ICBqZmZzMl9kb19yZXNlcnZlX3NwYWNlKzB4MTk4LzB4NTk4DQo+IFsgIDM5NC4wMzcwMTZdICBq
ZmZzMl9yZXNlcnZlX3NwYWNlKzB4M2Y4LzB4NGQ4DQo+IFsgIDM5NC4wNDEyODZdICBqZmZzMl93
cml0ZV9pbm9kZV9yYW5nZSsweGYwLzB4NDUwDQo+IFsgIDM5NC4wNDU4MTZdICBqZmZzMl93cml0
ZV9lbmQrMHgyYTgvMHg0YTANCj4gWyAgMzk0LjA0OTczN10gIGdlbmVyaWNfcGVyZm9ybV93cml0
ZSsweDFjMC8weDI4MA0KPiBbICAzOTQuMDU0MTc5XSAgX19nZW5lcmljX2ZpbGVfd3JpdGVfaXRl
cisweDFjNC8weDIyOA0KPiBbICAzOTQuMDU4OTY4XSAgZ2VuZXJpY19maWxlX3dyaXRlX2l0ZXIr
MHgxMzgvMHgyODgNCj4gWyAgMzk0LjA2MzU4M10gIF9fdmZzX3dyaXRlKzB4MWI0LzB4MjM4DQo+
IFsgIDM5NC4wNjcxNTddICB2ZnNfd3JpdGUrMHhkMC8weDIzOA0KPiBbICAzOTQuMDcwNDcwXSAg
U3lTX3dyaXRlKzB4YTAvMHgxMTANCj4gWyAgMzk0LjA3Mzc4M10gIF9fc3lzX3RyYWNlX3JldHVy
bisweDAvMHg0DQo+IFsgIDM5NC4wNzc2MTJdIE1lbW9yeSBzdGF0ZSBhcm91bmQgdGhlIGJ1Z2d5
IGFkZHJlc3M6DQo+IFsgIDM5NC4wODI0MDRdICBmZmZmODAwMDYyZTNiMTgwOiAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCBmYyBmYyBmYyBmYyBmYyBmYyBmYyBmYw0KPiBbICAzOTQuMDg5NjIzXSAg
ZmZmZjgwMDA2MmUzYjIwMDogMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgZmMgZmMgZmMgZmMgZmMg
ZmMgZmMgZmMNCj4gWyAgMzk0LjA5Njg0Ml0gPmZmZmY4MDAwNjJlM2IyODA6IDAxIGZjIGZjIGZj
IGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjIGZjDQo+IFsgIDM5NC4xMDQwNTZdICAg
ICAgICAgICAgICAgICAgICBeDQo+IFsgIDM5NC4xMDcyODNdICBmZmZmODAwMDYyZTNiMzAwOiBm
YiBmYiBmYiBmYiBmYiBmYiBmYiBmYiBmYyBmYyBmYyBmYyBmYyBmYyBmYyBmYw0KPiBbICAzOTQu
MTE0NTAyXSAgZmZmZjgwMDA2MmUzYjM4MDogZmIgZmIgZmIgZmIgZmIgZmIgZmIgZmIgZmMgZmMg
ZmMgZmMgZmMgZmMgZmMgZmMNCj4gWyAgMzk0LjEyMTcxOF0gPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBZYW5nIFlhbmcgPHlhbmcueWFuZzI5QHp0ZS5jb20uY24+DQo+IC0tLQ0KPiDC
oGZzL2pmZnMyL2NvbXByX3J0aW1lLmMgfCAzICsrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9mcy9qZmZzMi9jb21wcl9ydGltZS5jIGIv
ZnMvamZmczIvY29tcHJfcnRpbWUuYw0KPiBpbmRleCA0MDZkOWNjODRiYTguLjc5ZTc3MWFiNjI0
ZiAxMDA2NDQNCj4gLS0tIGEvZnMvamZmczIvY29tcHJfcnRpbWUuYw0KPiArKysgYi9mcy9qZmZz
Mi9jb21wcl9ydGltZS5jDQo+IEBAIC0zNyw2ICszNyw5IEBAIHN0YXRpYyBpbnQgamZmczJfcnRp
bWVfY29tcHJlc3ModW5zaWduZWQgY2hhciAqZGF0YV9pbiwNCj4gwqAJaW50IG91dHBvcyA9IDA7
DQo+IMKgCWludCBwb3M9MDsNCj4gwqANCj4gDQo+IA0KPiANCj4gKwlpZiAoKmRzdGxlbiA8PSAz
KQ0KPiArCQlyZXR1cm4gLTE7DQo+ICsNCj4gwqAJbWVtc2V0KHBvc2l0aW9ucywwLHNpemVvZihw
b3NpdGlvbnMpKTsNCj4gwqANCj4gDQo+IA0KPiANCj4gwqAJd2hpbGUgKHBvcyA8ICgqc291cmNl
bGVuKSAmJiBvdXRwb3MgPD0gKCpkc3RsZW4pLTIpIHsNCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
