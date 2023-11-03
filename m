Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5314C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 11:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylUVS87GzPxzjiAcbJHVJ7H2QAZ68W7AnKLKkdr7+0k=; b=QJwXu+vOSlkyuwyQ9rOKbPELmn
	hcIx6hShEvBqKcqZmjEN/RLs39xdF5LwEUsSlY2/FgQ5JlqJLkPUKPTMTeVT6kY/FVsD7V8h89mGV
	0YcjuJztOWAGOKkt7zPtTxXepfjwuHMmxKDsRaSwZmpMUUAO4M+0ohndiHor9Fn7/X8pEkKJBNABe
	KqX7sXtFHZ/gofI5FhlBhQJC/lGti638Y5ypUwpzxyGCruvqoJtupbYFmvD/viUH2B/jdeZ4EWy4+
	Opv7lmKnwtOVEH+epJIY23abGhIXj6mruvEwOh7bxxhnnVwylnXrhByfNp8YT1Z/gj9xg5sXe45xV
	f7cw/65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qysRR-00BL25-1x;
	Fri, 03 Nov 2023 11:34:21 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qysRN-00BL1C-2p
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 11:34:19 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SMJTV467CzrTYC;
	Fri,  3 Nov 2023 19:30:54 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 3 Nov 2023 19:33:58 +0800
Subject: Re: [PATCH v4 1/5] ubi: Use the fault injection framework to enhance
 the fault injection capability
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20231103065536.3778940-1-wangzhaolong1@huawei.com>
 <20231103065536.3778940-2-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <1662c6dd-699c-1fae-a10f-037f6ab26ce0@huawei.com>
Date: Fri, 3 Nov 2023 19:33:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231103065536.3778940-2-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_043418_123965_4FD2E7A1 
X-CRM114-Status: GOOD (  11.84  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyMy8xMS8zIDE0OjU1LCBaaGFvTG9uZyBXYW5nINC0tcA6Cj4gVG8gbWFrZSBkZWJ1ZyBw
YXJhbWV0ZXJzIGNvbmZpZ3VyYWJsZSBhdCBydW4gdGltZSwgdXNlIHRoZQo+IGZhdWx0IGluamVj
dGlvbiBmcmFtZXdvcmsgdG8gcmVjb25zdHJ1Y3QgdGhlIGRlYnVnZnMgaW50ZXJmYWNlLAo+IGFu
ZCByZXRhaW4gdGhlIGxlZ2FjeSBmYXVsdCBpbmplY3Rpb24gaW50ZXJmYWNlLgo+Cj4gTm93LCB0
aGUgZmlsZSBlbXVsYXRlX2ZhaWx1cmVzIGFuZCBmYXVsdF9hdHRyIGZpbGVzIGNvbnRyb2wgd2hl
dGhlcgo+IHRvIGVuYWJsZSBmYXVsdCBlbW11bGF0aW9uLgo+Cj4gVGhlIGZpbGUgZW11bGF0ZV9m
YWlsdXJlcyByZWNlaXZlcyBhIG1hc2sgdGhhdCBjb250cm9scyB0eXBlIGFuZAo+IHByb2Nlc3Mg
b2YgZmF1bHQgaW5qZWN0aW9uLiBHZW5lcmFsbHksIGZvciBlYXNlIG9mIHVzZSwgeW91IGNhbgo+
IGRpcmVjdGx5IGVudGVyIGEgbWFzayB3aXRoIGFsbCAxcy4KPgo+IGVjaG8gMHhmZmZmID4gL3N5
cy9rZXJuZWwvZGVidWcvdWJpL3ViaTAvZW11bGF0ZV9mYWlsdXJlcwo+Cj4gQW5kIHlvdSBuZWVk
IHRvIGNvbmZpZ3VyZSBvdGhlciBmYXVsdC1pbmplY3Rpb24gY2FwYWJpbGl0aWVzIGZvcgo+IHRl
c3RpbmcgcHVycG9zZToKPgo+IGVjaG8gMTAwID4gL3N5cy9rZXJuZWwvZGVidWcvdWJpL2ZhdWx0
X2luamVjdC9lbXVsYXRlX3Bvd2VyX2N1dC9wcm9iYWJpbGl0eQo+IGVjaG8gMTUgPiAvc3lzL2tl
cm5lbC9kZWJ1Zy91YmkvZmF1bHRfaW5qZWN0L2VtdWxhdGVfcG93ZXJfY3V0L3NwYWNlCj4gZWNo
byAyID4gL3N5cy9rZXJuZWwvZGVidWcvdWJpL2ZhdWx0X2luamVjdC9lbXVsYXRlX3Bvd2VyX2N1
dC92ZXJib3NlCj4gZWNobyAtMSA+IC9zeXMva2VybmVsL2RlYnVnL3ViaS9mYXVsdF9pbmplY3Qv
ZW11bGF0ZV9wb3dlcl9jdXQvdGltZXMKPgo+IFRoZSBDT05GSUdfTVREX1VCSV9GQVVMVF9JTkpF
Q1RJT04gdG8gZW5hYmxlIHRoZSBGYXVsdCBJbmplY3Rpb24gaXMKPiBhZGRlZCB0byBrY29uZmln
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogWmhhb0xvbmcgV2FuZyA8d2FuZ3poYW9sb25nMUBodWF3ZWku
Y29tPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvdWJpL0tjb25maWcgfCAgIDkgKysrCj4gICBkcml2
ZXJzL210ZC91YmkvZGVidWcuYyB8ICA2OCArKysrKysrKysrKysrKysrKy0tCj4gICBkcml2ZXJz
L210ZC91YmkvZGVidWcuaCB8IDE0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tCj4gICBkcml2ZXJzL210ZC91YmkvaW8uYyAgICB8ICAxMCArKy0KPiAgIGRyaXZlcnMv
bXRkL3ViaS91YmkuaCAgIHwgIDE1ICsrLS0tCj4gICA1IGZpbGVzIGNoYW5nZWQsIDIwMiBpbnNl
cnRpb25zKCspLCA0MiBkZWxldGlvbnMoLSkKPgo+ClJldmlld2VkLWJ5OiBaaGloYW8gQ2hlbmcg
PGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
