Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D607E7717F
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Dec 2024 03:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUILHgD6Ml9z0pP5sjIE1zgv7wT6DmlE7pSct0Gri5Y=; b=MOv4YgtimtK+DJJrae5YZOpcPc
	W1tFxr6Fin8/aI3NHGQ7AD+wYeRNb7vZs7cXPyJ6V3lSWxkcfYoqu0ay5YrKsBwMn5OHjbeI6ZLm/
	bxKsCRtkiUO9tAKuK6EMbgqCbi/FqEWNxfAu0oU0ikoBGFfqbxdUS/CHxli3NGcS8KzR9G5wqx865
	fsvP0e7hIBU5HzDq+b6/UBkQ5IvH6cXhRH8yBsNaVhRfAkv/hbdwdnjWAu9fVTphuBhWjp4XleuP2
	hxWnq9PmdSU39/rOh8gFJCTmTC6C/J8f7QTDUNvE2Y+qd00BmJfw/ZY970i0OzVxQI8/dffIHKuoF
	g0e8kLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLvwA-00000002Ye3-3BzV;
	Fri, 13 Dec 2024 03:01:54 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLvvt-00000002YcK-11vd
	for linux-mtd@lists.infradead.org;
	Fri, 13 Dec 2024 03:01:38 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Y8Ytj3yQCz11Lxb
	for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2024 10:58:21 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A101E140154
	for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2024 11:01:29 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 13 Dec 2024 11:01:29 +0800
Subject: Re: [PATCH mtd-utils] lib: Fix integer overflow in libiniparser.c
To: Anton Moryakov <ant.v.moryakov@gmail.com>, <linux-mtd@lists.infradead.org>
References: <20241212191228.84504-1-ant.v.moryakov@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7df76973-46ed-d47c-79c6-36bd8cf627e8@huawei.com>
Date: Fri, 13 Dec 2024 11:01:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241212191228.84504-1-ant.v.moryakov@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_190137_459105_B6B49E2D 
X-CRM114-Status: GOOD (  17.19  )
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

1NogMjAyNC8xMi8xMyAzOjEyLCBBbnRvbiBNb3J5YWtvdiDQtLXAOgo+IFJlcG9ydCBvZiB0aGUg
c3RhdGljIGFuYWx5emVyOgo+IFBvc3NpYmxlIGludGVnZXIgdW5kZXJmbG93OiBsZWZ0IG9wZXJh
bmQgaXMgdGFpbnRlZC4KPiBBbiBpbnRlZ2VyIHVuZGVyZmxvdyBtYXkgb2NjdXIgZHVlIHRvIGFy
aXRobWV0aWMgb3BlcmF0aW9uIChzdWJ0cmFjdGlvbikgYmV0d2VlbiB2YWx1ZXMKPiB7IFstMjE0
NzQ4MzY0OCwgMjE0NzQ4MzY0N10gfSBhbmQgJzEnLCB3aGVyZSB0aGUgZmlyc3QgdmFsdWUgY29t
ZXMgZnJvbSB0aGUgZXhwcmVzc2lvbiAnKGludClzdHJsZW4obGluZSknCj4gCj4gQ29ycmVjdGlv
bnMgZXhwbGFpbmVkOgo+IDEuIEFkZGVkIGEgY2hlY2sgdG8gaGFuZGxlIGVtcHR5IHN0cmluZ3Mg
YmVmb3JlIGRlY3JlbWVudGluZyB0aGUgbGVuZ3RoIG9mIHRoZSBsaW5lIChgbGVuID0gc3RybGVu
KGxpbmUpIC0gMWApIHRvIHByZXZlbnQgaW50ZWdlciB1bmRlcmZsb3cuCj4gMi4gTW9kaWZpZWQg
bG9naWMgdG9za2lwIGVtcHR5IGxpbmVzIGltbWVkaWF0ZWx5LCByZWR1Y2luZyB1bm5lY2Vzc2Fy
eSBwcm9jZXNzaW5nLi0gRW5zdXJlZCBzYWZldHkgYnkgdmFsaWRhdGluZyBsZW4gPj0gMCBiZWZv
cmUgYWNjZXNzaW5nIGxpbmVbbGVuXSB0byBhdm9pZCBvdXQtb2YtYm91bmRzIGFjY2Vzcy4KPiAz
LiBJbXByb3ZlZCByb2J1c3RuZXNzIHdoZW4gaGFuZGxpbmcgbXVsdGlsaW5lIHZhbHVlcyBieSBl
bnN1cmluZyB2YWxpZCBpbmRpY2VzIGZvciBsZW4uLSBBZGRlZCByZWxldmFudCBjb21tZW50cyB0
byBjbGFyaWZ5IGNoYW5nZXMgYW5kIHRoZWlyIHB1cnBvc2UuCj4gCj4gVHJpZ2dlcnMgZm91bmQg
Ynkgc3RhdGljIGFuYWx5emVyIFN2YWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFudG9uIE1vcnlh
a292IDxhbnQudi5tb3J5YWtvdkBnbWFpbC5jb20+Cj4gCj4gLS0tCj4gICBsaWIvbGliaW5pcGFy
c2VyLmMgfCAxMiArKysrKysrKystLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9saWJpbmlwYXJzZXIuYyBi
L2xpYi9saWJpbmlwYXJzZXIuYwo+IGluZGV4IGE2ZGRjYzcuLmRhOTgwYzAgMTAwNjQ0Cj4gLS0t
IGEvbGliL2xpYmluaXBhcnNlci5jCj4gKysrIGIvbGliL2xpYmluaXBhcnNlci5jCj4gQEAgLTUy
Miw5ICs1MjIsMTUgQEAgZGljdGlvbmFyeSAqIGluaXBhcnNlcl9sb2FkKGNvbnN0IGNoYXIgKiBp
bmluYW1lKQo+ICAgCj4gICAgICAgd2hpbGUgKGZnZXRzKGxpbmUrbGFzdCwgQVNDSUlMSU5FU1ot
bGFzdCwgaW4pIT1OVUxMKSB7Cj4gICAgICAgICAgIGxpbmVubysrIDsKPiAtICAgICAgICBsZW4g
PSAoaW50KXN0cmxlbihsaW5lKS0xOwo+ICsgICAgICAgIGxlbiA9IChpbnQpc3RybGVuKGxpbmUp
OwoKSGksIEFudG9uLgpUaGUgJ2xlbicgbXVzdCBiZSBncmVhdGVyIHRoYW4gMCBpZiBmZ2V0cygp
IHJldHVybnMgbm90IE5VTEwsIHRoZSAnbGluZScgCmNvbnRhaW5zIGF0IGxlYXN0IG9uZSBsZXR0
ZXIgJ1xuJy4KPiArICAgICAgICBpZihsZW4gPT0gMCl7Cj4gKyAgICAgICAgICAgIG1lbXNldChs
aW5lLCAwLCBBU0NJSUxJTkVTWik7Cj4gKyAgICAgICAgICAgIGxhc3QgPSAwOwo+ICsgICAgICAg
ICAgICBjb250aW51ZTsKPiArICAgICAgICB9Cj4gKyAgICAgICAgbGVuLS07Cj4gICAgICAgICAg
IC8qIFNhZmV0eSBjaGVjayBhZ2FpbnN0IGJ1ZmZlciBvdmVyZmxvd3MgKi8KPiAtICAgICAgICBp
ZiAobGluZVtsZW5dIT0nXG4nKSB7Cj4gKyAgICAgICAgaWYgKGxlbiA8IDAgfHwgbGluZVtsZW5d
IT0nXG4nKSB7Cj4gICAgICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwKPiAgICAgICAgICAgICAg
ICAgICAgICAgImluaXBhcnNlcjogaW5wdXQgbGluZSB0b28gbG9uZyBpbiAlcyAoJWQpXG4iLAo+
ICAgICAgICAgICAgICAgICAgICAgICBpbmluYW1lLAo+IEBAIC01NDAsNyArNTQ2LDcgQEAgZGlj
dGlvbmFyeSAqIGluaXBhcnNlcl9sb2FkKGNvbnN0IGNoYXIgKiBpbmluYW1lKQo+ICAgICAgICAg
ICAgICAgbGVuLS0gOwo+ICAgICAgICAgICB9CgpIZXJlLCAnbGVuJyBjb3VsZCBiZSBsZXNzIHRo
YW4gemVyby4gSSdtIGZpbmUgd2l0aCB0aGUgbW9kaWZpY2F0aW9uIGhlcmUuCj4gICAgICAgICAg
IC8qIERldGVjdCBtdWx0aS1saW5lICovCj4gLSAgICAgICAgaWYgKGxpbmVbbGVuXT09J1xcJykg
ewo+ICsgICAgICAgIGlmIChsZW4gPj0gMCAmJiBsaW5lW2xlbl09PSdcXCcpIHsKPiAgICAgICAg
ICAgICAgIC8qIE11bHRpLWxpbmUgdmFsdWUgKi8KPiAgICAgICAgICAgICAgIGxhc3Q9bGVuIDsK
PiAgICAgICAgICAgICAgIGNvbnRpbnVlIDsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
