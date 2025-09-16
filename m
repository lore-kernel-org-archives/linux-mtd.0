Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A567BCAC598
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Sep 2025 08:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4OSsALMFQGVW4dwvME0NLgztp5Hoexg0TyzLSNPI8tw=; b=B+OH4ffwQ99CCA
	hyO7Y74esxPxz6qikexKFoBkHOM0laOl5hfvJ2qdOENTj2X1JYUwsugl3iJW4+5uoXqDKah55/A+v
	I1m60F7EV/ez2KBB1IgftkTDX/ZjtDVEljWLdhQtrfuTrBML8RUdk3MjMgkR2imCcY+bEdhIZM0xv
	WLrr4Ke/TTgaIBkvcDZCcZ6MvoQjF9vBYWCwS9gCwcYJNHfKRhxSKwqTM27dPS68Pt8sjYU9Hzq/K
	NtmeyhfXeTaeHggw7bCDHz7QkuYLQi/ZR9a38cU4nXY6gC96LZNABudLQ3Z1CPr11CbKN1DZLDzQq
	6DFUmexY5WKeR8vWD2UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQpq-000000079Fa-0VSl;
	Tue, 16 Sep 2025 08:14:46 +0000
Received: from mail.inventec.com ([61.220.76.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQpl-000000079EU-0zxZ
	for linux-mtd@lists.infradead.org;
	Tue, 16 Sep 2025 08:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
    s=SEx04; d=inventec.com;
    h=from:to:cc:subject:date:message-id:in-reply-to:content-type:
      mime-version;
    bh=YUToHBqsJvnngrG90VgxL4ED7OrNo7Iyn0D6N+nQ+0c=;
    b=JspkZnLXEmA+60xExz4qWtHahZMO3Rdc5RVFKWQ3gRkl4eOJjkibVGk5P+XHJv
      f7XVlpJHtu4Rp7Jvynthgz7Q7dDoKppVS458YIXR5Mg7+zBIEcJeNcnkhQQael
      VLN+bMXXAFcneCkROo/feQuivHohpMbE5/N/MGAYG6t+wUF7+aPqmq59CUCJQw
      X7jD6bWABvX815H5EVj2mS0kRPpzB3SRPg2G2NBNTJk3bOXa8+Kbboi59Il4hN
      Myau3Xu52h6SbCOWTneK5VhXr9WkSfSnM40EIlNzceh9ZgToD8OSbAhvwkZw41
      ie0jJY+LwCiDOWorJR3/DK1vMUn1CPRw==
Received: from IEC1-EX2016-04.iec.inventec (10.1.254.222) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 16 Sep 2025 16:14:32 +0800
Received: from IEC1-MSE-FE2.inventec.com (10.1.254.204) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 16 Sep 2025 16:14:32 +0800
Received: from IEC1-EX2016-01.iec.inventec (IEC1-EX2016-01.iec.inventec [10.15.2.58])
	by IEC1-MSE-FE2.inventec.com with ESMTP id 58G8ES65030033;
	Tue, 16 Sep 2025 16:14:28 +0800 (GMT-8)
	(envelope-from Kang.Kerry@inventec.com)
Received: from IEC1-EX2016-02.iec.inventec (10.1.254.221) by
 IEC1-EX2016-01.iec.inventec (10.15.2.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 16 Sep 2025 16:14:28 +0800
Received: from IEC1-EX2016-02.iec.inventec ([fe80::25ef:f59e:6733:75ba]) by
 IEC1-EX2016-02.iec.inventec ([fe80::25ef:f59e:6733:75ba%3]) with mapi id
 15.01.2507.057; Tue, 16 Sep 2025 16:14:28 +0800
From: =?utf-8?B?S2FuZy5LZXJyeSDlurflrofoia8gVEFP?= <Kang.Kerry@inventec.com>
To: Pratyush Yadav <pratyush@kernel.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: mtd: spi-nor: Add Winbond w25q512jvdtr
Thread-Topic: mtd: spi-nor: Add Winbond w25q512jvdtr
Thread-Index: AQHcImo2pZrtT3WrcUCVoD1JFifbDLSTvwyA///qnoCAAdBzsA==
Date: Tue, 16 Sep 2025 08:14:28 +0000
Message-ID: <4645d0cbce50491c9a428b57d97e09e0@inventec.com>
References: <CAG2w3Fsj6q8buVE+cXSuoTZj9gEP29u+mh6Xm3ryBqAxxRsQyg@mail.gmail.com>
	<mafs0cy7yjon6.fsf@kernel.org>
	<31265f84726047ebb49b3ea2e7836830@inventec.com>
 <mafs0o6rbj4k2.fsf@kernel.org>
In-Reply-To: <mafs0o6rbj4k2.fsf@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.6.240.141]
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE2.inventec.com 58G8ES65030033
X-TM-SNTS-SMTP: D7D4696554AC63DE4F3D18FD10152126936328B5A7A7291679FA217BF42A3F532000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_011441_633144_0BA2F298 
X-CRM114-Status: GOOD (  12.46  )
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

PkhpLA0KPg0KPk9uIE1vbiwgU2VwIDE1IDIwMjUsIEthbmcuS2Vycnkg5bq35a6H6ImvIFRBTyB3
cm90ZToNCj4NCj5QbGVhc2UgZG9uJ3QgdG9wLXBvc3QuIGh0dHBzOi8vd3d3LmlkYWxsZW4uY29t
L3RvcHBvc3RpbmcuaHRtbA0KPg0KPj4gSGkgUHJhdHl1c2gsDQo+PiBJIGNvbmZpZ3VyZWQgdGhl
IERUUyB3aXRoICdjb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOycNCj4gYW5kIGVuYWJsZWQg
dGhlIGtlcm5lbCBvcHRpb25zOg0KPiBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUj15DQo+
IENPTkZJR19NVERfU1BJX05PUj15DQo+DQo+PiBIb3dldmVyLCB0aGUgZG1lc2cgb3V0cHV0IHNo
b3dzIHRoYXQgdGhlIGtlcm5lbCBpcyBmYWlsaW5nIHRvIHJlY29nbml6ZSB0aGUgZmxhc2gncyBK
RURFQyBJRC4gVGhpcyBzdWdnZXN0cyB0aGF0IHRoZSBnZW5lcmljIFNGRFAtYmFzZWQgZHJpdmVy
IGlzbid0IHdvcmtpbmcgYXMgZXhwZWN0ZWQuDQo+Pg0KPj4gWyAgMTM1LjI5NDYyNF0gc3BpLW5v
ciBzcGkxLjA6IHVucmVjb2duaXplZCBKRURFQyBpZCBieXRlczogZWYgNzAgMjAgDQo+PiAwMCAw
MCAwMCBbICAxMzUuMzAxNjAyXSBzcGktbm9yOiBwcm9iZSBvZiBzcGkxLjAgZmFpbGVkIHdpdGgg
ZXJyb3IgLTINCj4+DQo+PiBJIHRoaW5rIHdlIG5lZWQgdG8gYWRkIHRoaXMgdG8gdGFibGUgdG8g
bWFrZSBzdXJlIFcyNVE1MTJKVi1EVFIgaXMgcmVjb2duaXplZC4NCj4NCj5UaGlzIG1lYW5zIHNw
aV9ub3JfY2hlY2tfc2ZkcF9zaWduYXR1cmUoKSBmYWlscy4gQ2FuIHlvdSBjaGVjayB3aHk/IFRo
ZSBmbGFzaCBkYXRhc2hlZXQgc2F5cyBpdCBoYXMgYSBTRkRQIHRhYmxlIHNvIHRoaXMgc2hvdWxk
IHdvcmsuDQo+DQo+QlRXLCB3aGljaCBrZXJuZWwgdmVyc2lvbiBhcmUgeW91IHRlc3RpbmcgdGhp
cyBvbj8NCj4NCj5bLi4uXQ0KPg0KPi0tDQo+UmVnYXJkcywNCj5QcmF0eXVzaCBZYWRhdg0KDQpJ
IHVzZWQga2VybmVsIDUuMTUgZm9yIHRlc3RpbmcuDQpJdCBzZWVtcyB0aGUga2VybmVsIGlzIGZh
aWxpbmcgdG8gcmVjb2duaXplIEpFREVDIGlkIG9mIHRoZSBXaW5ib25kIGZsYXNoLCB3aGljaCBp
cyBjYXVzaW5nIHRoZSBlcnJvci4NCg0KV2hlbiBJIHRlc3Qgd2l0aCBOdXZvdG9uIGtlcm5lbCA2
LjYsIGl0IGlzIGFibGUgdG8gcmVjb2duaXplIHRoZSBmbGFzaCBhcyBhIGdlbmVyaWMgZGV2aWNl
Lg0KWyAgIDUwLjgwNDE2MF0gc3BpLW5vciBzcGkxLjA6IHNwaS1ub3ItZ2VuZXJpYyAoNjU1MzYg
S2J5dGVzKQ0KDQotLQ0KQlIsDQpLZXJyeQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
