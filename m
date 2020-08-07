Return-Path: <SRS0=O0jx=BR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B326C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2020 02:20:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E774320855
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2020 02:20:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZIiygqXQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E774320855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W1sHVpqNyxzDnF83ar4UJZXAbQ8FpCXDK5EYOImtxaE=; b=ZIiygqXQ4ZhaIrit43lJVPGYF
	j2ejp+PxztzlmtFxUjTQ4eOVjXr3LNQ97sQlgDjLWPBv/1QZuPApd+QdsJT0EXuXbKaX4MejoyeJy
	aHqMk7YQdW48cYQT/hPXBJUxmItqiJVxyBatfHveGA+siSfGmnVBpTAmZo4WpzzOfcQBj+CSrCqzh
	blvLU/NKhpvDZ4myKYLhh8ANYBPUCZfPhpWpNyHkW7oWu6o2mRSbmg4rLxVzuw2ENHUrWWtTSkUfs
	8yuMMYfPuoiRs+VlMWSsR7cuCQbHuL4Xtus6jYUqpUVNT3d44088oTfH1zIinOFCDeoY7847aLbfZ
	O83Y+/KZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3ryK-0007GK-Sk; Fri, 07 Aug 2020 02:19:04 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3ryD-0007Ee-QS
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2020 02:18:59 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7215DAEE717C6995C4D6;
 Fri,  7 Aug 2020 10:18:45 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.214) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0;
 Fri, 7 Aug 2020 10:18:38 +0800
Subject: Re: [PATCH] ubi: check kthread_should_stop() after the setting of
 task state
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <20200601091231.3794350-1-chengzhihao1@huawei.com>
 <CAFLxGvwLSvYsQ+OPi85VS8aQ2uge_JqQRD2C8h=XMORvCej3Sw@mail.gmail.com>
 <211afcd0-d5b3-5ac0-1fd1-dc789634a858@huawei.com>
 <CAFLxGvwRDfB4mqxJhOLwWvoZ3yzpVY-kuAiovYLf8T7WwJqaTg@mail.gmail.com>
 <9caa4860-975c-70bb-c8b9-737d1db9ead4@huawei.com>
 <CAFLxGvycs7DNu5o5QY1WwTPfS6cTTykTh-91n9TQZ7yP_ADr4A@mail.gmail.com>
 <2086f822-e67a-43e4-76d8-5339eaccd3ac@huawei.com>
 <CAFLxGvzwoC1GcjJOfwpc8V5LD79=8XiJaNV2HjOm8EdQcCbp+w@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5f7ae548-350b-cedf-3c8e-25fea06a8377@huawei.com>
Date: Fri, 7 Aug 2020 10:18:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvzwoC1GcjJOfwpc8V5LD79=8XiJaNV2HjOm8EdQcCbp+w@mail.gmail.com>
X-Originating-IP: [10.174.179.214]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_221858_116760_7D37A661 
X-CRM114-Status: GOOD (  24.05  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjAvOC83IDQ6MTUsIFJpY2hhcmQgV2VpbmJlcmdlciDlhpnpgZM6Cj4gT24gV2VkLCBB
dWcgNSwgMjAyMCBhdCA0OjIzIEFNIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5j
b20+IHdyb3RlOgo+PiBFciwgSSBjYW4ndCBnZXQgdGhlIHBvaW50LiBJIGNhbiBsaXN0IHR3byBw
b3NzaWJsZSBzaXR1YXRpb25zLCBkaWQgSQo+PiBtaXNzIG90aGVyIHNpdHVhdGlvbnM/Cj4gWWVz
LiBZb3Uga2VlcCBpZ25vcmluZyB0aGUgY2FzZSBJIGJyb3VnaHQgdXAuCj4KPiBMZXQncyBzdGFy
dCBmcm9tIHNjcmF0Y2gsIG1heWJlIEkgbWlzcyBzb21ldGhpbmcuCj4gU28gSSdtIHNvcnJ5IGZv
ciBiZWluZyBwZXJzaXN0ZW50LgpOZXZlciBtaW5kLCB3ZSdyZSBhbGwgdHJ5aW5nIHRvIGZpZ3Vy
ZSBpdCBvdXQuwqAgOi0pIC4gQmVzaWRlcywgSSdtIG5vdCAKZ29vZCBhdCBleHByZXNzaW5nIHF1
ZXN0aW9uIGluIEVuZ2xpc2guIChJbiBQcmFjdGljaW5nLi4uKQo+IFRoZSB1YmkgdGhyZWFkIGNh
biBiZSByZWR1Y2VkIHRvIGEgbG9vcCBsaWtlIHRoaXMgb25lOgo+IDEuIGZvciAoOzspIHsKPiAy
LiAgICAgIGlmIChrdGhyZWFkX3Nob3VsZF9zdG9wKCkpCj4gMy4gICAgICAgICAgICAgIGJyZWFr
Owo+IDQuCj4gNS4gICAgICBpZiAoIC8qIG5vIHdvcmsgcGVuZGluZyovICl7Cj4gNi4gICAgICAg
ICAgICAgIHNldF9jdXJyZW50X3N0YXRlKFRBU0tfSU5URVJSVVBUSUJMRSk7Cj4gNy4gICAgICAg
ICAgICAgIHNjaGVkdWxlKCk7Cj4gOC4gICAgICAgICAgICAgIGNvbnRpbnVlOwo+IDkuICAgICAg
fQo+IDEwLgo+IDExLiAgICAgZG9fd29yaygpOwo+IDEyLiB9Cj4KPiBzeXpjYWxsZXIgZm91bmQg
YSBjYXNlIHdoZXJlIHN0b3BwaW5nIHRoZSB0aHJlYWQgZGlkIG5vdCB3b3JrLgo+IElmIGFub3Ro
ZXIgdGFzayB0cmllcyB0byBzdG9wIHRoZSB0aHJlYWQgd2hpbGUgbm8gd29yayBpcyBwZW5kaW5n
IGFuZAo+IHRoZSBwcm9ncmFtIGNvdW50ZXIgaW4gdGhlIHRocmVhZAo+IGlzIGJldHdlZW4gbGlu
ZXMgNSBhbmQgNiwgdGhlIGt0aHJlYWRfc3RvcCgpIGluc3RydWN0aW9uIGhhcyBubyBlZmZlY3Qu
Cj4gSXQgaGFzIG5vIGVmZmVjdCBiZWNhdXNlIHRoZSB0aHJlYWQgc2V0cyB0aGUgdGhyZWFkIHN0
YXRlIHRvCj4gaW50ZXJydXB0aWJsZSBzbGVlcCBhbmQgdGhlbiBzY2hlZHVsZXMgYXdheS4KPgo+
IFRoaXMgaXMgYSBjb21tb24gYW50aS1wYXR0ZXJuIGluIHRoZSBMaW51eCBrZXJuZWwsIHNhZGx5
LgoKWWVzLCBidXQgVUJJRlMgaXMgdGhlIGV4Y2VwdGlvbiwgbXkgc29sdXRpb24gbG9va3MgbGlr
ZSBVQklGUy4KCmludCB1Ymlmc19iZ190aHJlYWQodm9pZCAqaW5mbykKewogwqDCoMKgIHdoaWxl
KDEpIHsKIMKgwqDCoCDCoMKgwqAgaWYgKGt0aHJlYWRfc2hvdWxkX3N0b3AoKSkKIMKgwqDCoCDC
oMKgwqAgwqDCoMKgIGJyZWFrOwoKIMKgwqDCoCDCoMKgwqAgc2V0X2N1cnJlbnRfc3RhdGUoVEFT
S19JTlRFUlJVUFRJQkxFKTsKIMKgwqDCoCDCoMKgwqAgaWYgKCFjLT5uZWVkX2JndCkgewogwqDC
oMKgIMKgwqDCoCDCoMKgwqAgLyoKIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgKiBOb3RoaW5nIHBy
ZXZlbnRzIHVzIGZyb20gZ29pbmcgc2xlZXAgbm93IGFuZAogwqDCoMKgIMKgwqDCoCDCoMKgwqAg
wqAqIGJlIG5ldmVyIHdva2VuIHVwIGFuZCBibG9jayB0aGUgdGFzayB3aGljaAogwqDCoMKgIMKg
wqDCoCDCoMKgwqAgwqAqIGNvdWxkIHdhaXQgaW4gJ2t0aHJlYWRfc3RvcCgpJyBmb3JldmVyLgog
wqDCoMKgIMKgwqDCoCDCoMKgwqAgwqAqLwogwqDCoMKgIMKgwqDCoCDCoMKgwqAgaWYgKGt0aHJl
YWRfc2hvdWxkX3N0b3AoKSkKIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCBicmVhazsKIMKg
wqDCoCDCoMKgwqAgwqDCoMKgIHNjaGVkdWxlKCk7CiDCoMKgwqAgwqDCoMKgIMKgwqDCoCBjb250
aW51ZTsKIMKgwqDCoCDCoMKgwqAgfQogwqDCoMKgIH0KfQoKCj4KPiBEbyB5b3UgYWdyZWUgd2l0
aCBtZSBzbyBmYXIgb3IgZG8geW91IHRoaW5rIHN5emNhbGxlciBmb3VuZCBhIGRpZmZlcmVudCBp
c3N1ZT8KWWVzLCBJIGFncmVlLgo+Cj4gWW91ciBwYXRjaCBjaGFuZ2VzIHRoZSBsb29wIGFzIGZv
bGxvd3M6Cj4gMS4gZm9yICg7Oykgewo+IDIuICAgICAgaWYgKGt0aHJlYWRfc2hvdWxkX3N0b3Ao
KSkKPiAzLiAgICAgICAgICAgICAgYnJlYWs7Cj4gNC4KPiA1LiAgICAgIGlmICggLyogbm8gd29y
ayBwZW5kaW5nKi8gKXsKPiA2LiAgICAgICAgICAgICAgc2V0X2N1cnJlbnRfc3RhdGUoVEFTS19J
TlRFUlJVUFRJQkxFKTsKPiA3Lgo+IDguICAgICAgICAgICAgICBpZiAoa3RocmVhZF9zaG91bGRf
c3RvcCgpKSB7Cj4gOS4gICAgICAgICAgICAgICAgICAgICAgc2V0X2N1cnJlbnRfc3RhdGUoVEFT
S19SVU5OSU5HKTsKPiAxMC4gICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAxMS4gICAgICAg
ICAgICAgfQo+IDEyLgo+IDEzLiAgICAgICAgICAgICBzY2hlZHVsZSgpOwo+IDE0LiAgICAgICAg
ICAgICBjb250aW51ZTsKPiAxNS4gICAgIH0KPiAxNi4KPiAxNy4gICAgIGRvX3dvcmsoKTsKPiAx
OC4gfQo+Cj4gVGhhdCB3YXkgdGhlcmUgaXMgYSBoaWdoZXIgY2hhbmNlIHRoYXQgdGhlIHRocmVh
ZCBzZWVzIHRoZSBzdG9wIGZsYWcKPiBhbmQgZ3JhY2VmdWxseSB0ZXJtaW5hdGVzLCBJIGZ1bGx5
IGFncmVlIG9uIHRoYXQuClRoZXJlJ3Mgbm8gZGlzYWdyZWVtZW50IHNvIGZhci4KPiBCdXQgaXQg
ZG9lcyBub3QgY29tcGxldGVseSBzb2x2ZSB0aGUgcHJvYmxlbS4KPiBJZiBrdGhyZWFkX3N0b3Ao
KSBoYXBwZW5zIHdoaWxlIHRoZSBwcm9ncmFtIGNvdW50ZXIgb2YgdGhlIHViaSB0aHJlYWQKPiBp
cyBhdCBsaW5lIDEyLCB0aGUgc3RvcCBmbGFnIGlzIHN0aWxsIG1pc3NlZAo+IGFuZCB3ZSBlbmQg
dXAgaW4gaW50ZXJydXB0aWJsZSBzbGVlcCBqdXN0IGxpa2UgYmVmb3JlLgoKVGhhdCdzIHdoZXJl
IHdlIGhvbGQgZGlmZmVyZW50IHZpZXdzLiBJIGhhdmUgMyB2aWV3cG9pbnRz77yIWW91IGNhbiBw
b2ludCAKb3V0IHdoaWNoIG9uZSB5b3UgZGlzYWdyZWUu77yJOgoKMS4gSWYga3RocmVhZF9zdG9w
KCkgaGFwcGVucyBhdCBsaW5lIDEyLCB1YmkgdGhyZWFkIGlzICptYXJrZWQqIHdpdGggCnN0b3Ag
ZmxhZywgaXQgd2lsbCBzdG9wIGF0IGt0aHJlYWRfc2hvdWxkX3N0b3AoKSBhcyBsb25nIGFzIGl0
IGNhbiByZWFjaCAKdGhlIG5leHQgaXRlcmF0aW9uLgoKMi4gSWYgdGFzayBBIGlzIG9uIHJ1bnF1
ZXVlIGFuZCBpdHMgc3RhdGUgaXMgVEFTS19SVU5OSU5HLCB0YXNrIEEgd2lsbCAKYmUgc2NoZWR1
bGVkIHRvIGV4ZWN1dGUuCgozLiBJZiBrdGhyZWFkX3N0b3AoKSBoYXBwZW5zIGF0IGxpbmUgMTIs
IGFmdGVyIHByb2dyYW0gY291bnRlciBnb2luZyB0byAKbGluZSAxNCwgdWJpIHRoZWFkIGlzIG9u
IHJ1bnF1ZXVlIGFuZCBpdHMgc3RhdGUgaXMgVEFTS19SVU5OSU5HLiBJIGhhdmUgCmV4cGxhaW5l
ZCB0aGlzIGluIHNpdHVhdGlvbiAxIGluIGxhc3Qgc2Vzc2lvbi4KCgpJIG1lYW4gdWJpIHRocmVh
ZCBpcyBvbiBydW5xdWV1ZSB3aXRoIFRBU0tfUlVOTklORyBzdGF0ZSAmIHN0b3AgZmxhZyAKYWZ0
ZXIgdGhlIHByb2Nlc3MgeW91IGRlc2NyaWJlZC4KCkxpbmUgMTLCoMKgIGt0aHJlYWRfc3RvcCgp
CgogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X2JpdChtYXJrIHN0b3AgZmxh
ZykgJiYgd2FrZV91cF9wcm9jZXNzKGVucXVldWUgJiYgCnNldCBUQVNLX1JVTk5JTkcgKSDCoMKg
ID0+IFRBU0tfUlVOTklORyAmIHN0b3AgZmxhZyAmIG9uIHJ1bnF1ZXVlCgpMaW5lIDEzwqAgc2No
ZWR1bGUoKQoKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERvIG5vdGhpbmcgYnV0
IHBpY2sgbmV4dCB0YXNrIHRvIGV4ZWN1dGUKCj4KPiBTbywgdG8gc29sdmUgdGhlIHByb2JsZW0g
ZW50aXJlbHkgSSBzdWdnZXN0IGNoYW5naW5nIHNjaGVkdWxlKCkgdG8KPiBzY2hlZHVsZV90aW1l
b3V0KCkgYW5kIGxldCB0aGUgdGhyZWFkIHdha2UgdXAKPiBwZXJpb2RpY2FsbHkuCj4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
