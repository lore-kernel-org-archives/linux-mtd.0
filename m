Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0291C282CD
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Mar 2025 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkOyQa/Z1YKPsxPn8fVoxukPtfS2qD6rZ0QlZy6vKIc=; b=XBB6d425EnJtm0akQF+wJB7IhK
	hHhiikwYGaswSvKb6JpGYz+nFnsdeHqOMiNFqtXrYXn4a01nvRpYFVf/n7T0BgUY6XpcGON0/9Ge4
	Jdzge5a+qtdCfQZTdCHE8QV+EZA6W5JbftlYak1yJCDO6iV8mkPpZNA8t9HUY0qi6pF9rK4h/fTkC
	0x3uVqYgX3p5YXxDtLudKU5SRnP6oO0+NH1eBTOt+xJ3tAuLwrnX1hSA1x7TvxHPquCR5VH06rsLL
	ox3Fy8NYwzxNfc6R49cbtpgDuKoGqWZz/8lUSiZClFYwKW8oG0w7UjSOT6sOmfMAhfqwsUgNuI0bc
	idt632uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6WG-000000012S6-32de;
	Mon, 03 Mar 2025 14:11:44 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6Ao-00000000ypw-0U9S
	for linux-mtd@lists.infradead.org;
	Mon, 03 Mar 2025 13:49:36 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Z60St47YKzCs7q;
	Mon,  3 Mar 2025 21:45:50 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 77DF11401F0;
	Mon,  3 Mar 2025 21:49:19 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 3 Mar 2025 21:49:18 +0800
Subject: Re: [PATCH v2 06/11] ubifs: reorder capability check last
To: <cgzones@googlemail.com>
CC: Serge Hallyn <serge@hallyn.com>, Jan Kara <jack@suse.com>, Julia Lawall
	<Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
	<linux-kernel@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
	<cocci@inria.fr>, Richard Weinberger <richard@nod.at>,
	<linux-mtd@lists.infradead.org>
References: <20250302160657.127253-1-cgoettsche@seltendoof.de>
 <20250302160657.127253-5-cgoettsche@seltendoof.de>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a9257803-c5cd-bb83-21b6-a8b152c943e6@huawei.com>
Date: Mon, 3 Mar 2025 21:49:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250302160657.127253-5-cgoettsche@seltendoof.de>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_054934_382621_9E9799C9 
X-CRM114-Status: GOOD (  19.84  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjUvMy8zIDA6MDYsIENocmlzdGlhbiBHw7Z0dHNjaGUg5YaZ6YGTOgo+IEZyb206IENo
cmlzdGlhbiBHw7Z0dHNjaGUgPGNnem9uZXNAZ29vZ2xlbWFpbC5jb20+Cj4gCj4gY2FwYWJsZSgp
IGNhbGxzIHJlZmVyIHRvIGVuYWJsZWQgTFNNcyB3aGV0aGVyIHRvIHBlcm1pdCBvciBkZW55IHRo
ZQo+IHJlcXVlc3QuICBUaGlzIGlzIHJlbGV2YW50IGluIGNvbm5lY3Rpb24gd2l0aCBTRUxpbnV4
LCB3aGVyZSBhCj4gY2FwYWJpbGl0eSBjaGVjayByZXN1bHRzIGluIGEgcG9saWN5IGRlY2lzaW9u
IGFuZCBieSBkZWZhdWx0IGEgZGVuaWFsCj4gbWVzc2FnZSBvbiBpbnN1ZmZpY2llbnQgcGVybWlz
c2lvbiBpcyBpc3N1ZWQuCj4gSXQgY2FuIGxlYWQgdG8gdGhyZWUgdW5kZXNpcmVkIGNhc2VzOgo+
ICAgIDEuIEEgZGVuaWFsIG1lc3NhZ2UgaXMgZ2VuZXJhdGVkLCBldmVuIGluIGNhc2UgdGhlIG9w
ZXJhdGlvbiB3YXMgYW4KPiAgICAgICB1bnByaXZpbGVnZWQgb25lIGFuZCB0aHVzIHRoZSBzeXNj
YWxsIHN1Y2NlZWRlZCwgY3JlYXRpbmcgbm9pc2UuCj4gICAgMi4gVG8gYXZvaWQgdGhlIG5vaXNl
IGZyb20gMS4gdGhlIHBvbGljeSB3cml0ZXIgYWRkcyBhIHJ1bGUgdG8gaWdub3JlCj4gICAgICAg
dGhvc2UgZGVuaWFsIG1lc3NhZ2VzLCBoaWRpbmcgZnV0dXJlIHN5c2NhbGxzLCB3aGVyZSB0aGUg
dGFzawo+ICAgICAgIHBlcmZvcm1zIGFuIGFjdHVhbCBwcml2aWxlZ2VkIG9wZXJhdGlvbiwgbGVh
ZGluZyB0byBoaWRkZW4gbGltaXRlZAo+ICAgICAgIGZ1bmN0aW9uYWxpdHkgb2YgdGhhdCB0YXNr
Lgo+ICAgIDMuIFRvIGF2b2lkIHRoZSBub2lzZSBmcm9tIDEuIHRoZSBwb2xpY3kgd3JpdGVyIGFk
ZHMgYSBydWxlIHRvIHBlcm1pdAo+ICAgICAgIHRoZSB0YXNrIHRoZSByZXF1ZXN0ZWQgY2FwYWJp
bGl0eSwgd2hpbGUgaXQgZG9lcyBub3QgbmVlZCBpdCwKPiAgICAgICB2aW9sYXRpbmcgdGhlIHBy
aW5jaXBsZSBvZiBsZWFzdCBwcml2aWxlZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IEfDtnR0c2NoZSA8Y2d6b25lc0Bnb29nbGVtYWlsLmNvbT4KPiBSZXZpZXdlZC1ieTogU2VyZ2Ug
SGFsbHluIDxzZXJnZUBoYWxseW4uY29tPgo+IEFja2VkLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIg
PHJpY2hhcmRAbm9kLmF0Pgo+IC0tLQo+IHYyOiBzcGxpdCBpbnRvIHR3byBwYXRjaGVzIGZvciBl
YWNoIHN1YnN5c3RlbQo+IC0tLQo+ICAgZnMvdWJpZnMvYnVkZ2V0LmMgfCA1ICsrKy0tCj4gICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQt
Ynk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gCj4gZGlmZiAtLWdp
dCBhL2ZzL3ViaWZzL2J1ZGdldC5jIGIvZnMvdWJpZnMvYnVkZ2V0LmMKPiBpbmRleCBkNzZlYjdi
MzlmNTYuLjYxMzdhZWFkZWMzZiAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9idWRnZXQuYwo+ICsr
KyBiL2ZzL3ViaWZzL2J1ZGdldC5jCj4gQEAgLTI1Niw4ICsyNTYsOSBAQCBsb25nIGxvbmcgdWJp
ZnNfY2FsY19hdmFpbGFibGUoY29uc3Qgc3RydWN0IHViaWZzX2luZm8gKmMsIGludCBtaW5faWR4
X2xlYnMpCj4gICAgKi8KPiAgIHN0YXRpYyBpbnQgY2FuX3VzZV9ycChzdHJ1Y3QgdWJpZnNfaW5m
byAqYykKPiAgIHsKPiAtCWlmICh1aWRfZXEoY3VycmVudF9mc3VpZCgpLCBjLT5ycF91aWQpIHx8
IGNhcGFibGUoQ0FQX1NZU19SRVNPVVJDRSkgfHwKPiAtCSAgICAoIWdpZF9lcShjLT5ycF9naWQs
IEdMT0JBTF9ST09UX0dJRCkgJiYgaW5fZ3JvdXBfcChjLT5ycF9naWQpKSkKPiArCWlmICh1aWRf
ZXEoY3VycmVudF9mc3VpZCgpLCBjLT5ycF91aWQpIHx8Cj4gKwkgICAgKCFnaWRfZXEoYy0+cnBf
Z2lkLCBHTE9CQUxfUk9PVF9HSUQpICYmIGluX2dyb3VwX3AoYy0+cnBfZ2lkKSkgfHwKPiArCSAg
ICBjYXBhYmxlKENBUF9TWVNfUkVTT1VSQ0UpKQo+ICAgCQlyZXR1cm4gMTsKPiAgIAlyZXR1cm4g
MDsKPiAgIH0KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
