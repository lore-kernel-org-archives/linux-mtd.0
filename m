Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76904FD8756
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 12:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNkWismptFmITUADo9LN6Po9HN770nkVOKXDKnfZOWQ=; b=XxcG9pefjlIltb
	3+KHeH664wZp0FJDgr9kl+jW1cQUeGFqRpSAxzuVrqkz9vcb1C2EAIIhoC5KSFBo1nSfw2SoOIv7H
	y1AyotzlKORjV4+oUcQ1Bd42C/Hv7mSPZpzbS9UeoWTmV2E1GR0yRn2bmGwH4DKEOaFnw8hBPI4mz
	3eK2kNipf++sWphILlllj84D6wj4c2GpCLGdfhj0t3nStlXrtCU0VzKB1ZDMP48xhtfLnWgjxmsIz
	16CwBiOCFQy/XIpKUMtGkAnWAGpCBzz/BEs+DAUcHPFpy3Qiq/cuQGfji/4kdEMZHj1xwg+ttO//U
	4xPfwJdvm23bpuOgBkrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tb4-00000006In5-2UtT;
	Tue, 17 Mar 2026 12:32:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tb3-00000006ImF-0cL6
	for linux-mtd@bombadil.infradead.org;
	Tue, 17 Mar 2026 12:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=khh7GPjJ3y6yrkZvajwZLcEiPn144UhSqF1UmlKQ5e0=; b=XJlRvpq3yRQwMuQ5ZpWOK6F7ln
	/uLJSm5032wuQfKJeEE7ZH/1Uqjcpt1oH2Mnb6EGbXseFntmK6KcHz5YGtSl9KZMqz1UGh2HBWoZn
	JZpTfEGTZad5YQQLhp2WdEneZgr2FMkCCoUr3LpqFuZzcHwgDUSOT9fli4J8NLLAU0feuBpLlROpl
	xz4ZCvVbZYx3gg1lC7PM29vlOI42PBJPpcq+czFsGXWAVKbGi8X/7okU+qBvInM4iZF60fOULRCmE
	hjtq9DtZFUJFZnFFOVSMB6MctlWuRS2uUQ89BI61t6xBcpRcc9TUJoroSbux9cqGoJIvUnstTc94f
	d4Gr68eA==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tb0-00000008yPe-06zm
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 12:32:27 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-35a04d6aeb0so3473074a91.0
        for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2026 05:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773750743; x=1774355543; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=khh7GPjJ3y6yrkZvajwZLcEiPn144UhSqF1UmlKQ5e0=;
        b=LEGv0ebYboOYl7OBH7H1X+HbHCeS/gr8/bt5+Ew6U3Id79K2hYVuDGkrCu6c5WtEOX
         QFYX66M+BE7wAyfsvhuADrZI684i7z0f7lxs6hmyNriqA/BiXztNBYcGgczOS39xSFF0
         W9lnQqpye4BS8RVLG+Ze456prl+X9mPZ0JqzybBkj69JrxdLzs8ckvjQa0koKhVOBbvp
         kmFV6bvzfzx8POOw8pvDeYfCg4U3UbhiVn1E3KPC/bkoPSTlE5nPXFXfNddxZv/lPsl3
         O5tINyLCJmc9fz6vtFac4kfWlv3Qax2Nq6O1XpBtmoLuQf3FGG8w7qJEsJtjqKEgly1c
         7opA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750743; x=1774355543;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khh7GPjJ3y6yrkZvajwZLcEiPn144UhSqF1UmlKQ5e0=;
        b=PXYLIFilpIcVWr/rcaCTvve5jmfu0rbP9BwqkJdzn2Ei5j+UmX0JMPyaU1Olq7OSS6
         yMH2pkJWULfGwX9fnWAI+lalKhXjlC0er5QhBfKYcPXvhOsmTCBNymOEcjm9zeGCd8i3
         TeyjmY9Iu/4Ezma62sAREUA53/VW+vEhISW11xlBys8gYU0Yyc8m8eIBR6lFD+IsY6lp
         T05iv8riOL/eTzbr8h7CLFLoX2GaYFajiRX2IwJt70RH0u8Ovv+w7bATciV6FowkOLY0
         CAd+o6hf66uERY48maIDMNBOqjfF0Exl2SJoy2ZKff2uBjNTeHojL8FsWcB9+dROBQqH
         T+lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt81VlDFKajfhaaKgJUnNtmMEK8zkG1QoqIHAYk0FSQlSCksSKJ6N9YK0ljKqv+e0UTexwVuNAIqc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhG8rH/WvYmUILW1S32Bm0fNQG+FpQ07Pw74z5VmyCLVFUPyue
	Eyym/ejfEn/MDVzJAjCNCsWE6R7XJFHpIyc2Bu/LzabRL/d9ce2TOmv9
X-Gm-Gg: ATEYQzyRZB6qXIqJx6NCl/1EsQdicUif3EYu9l1SwfAaM8Ale6rDyiV3SAZKCbRyxEs
	jBTdEeZgRaAY8e3vYXbauk+TVR1eQmoiiU4ks+XHIo0JQnpzGrd8dSwOWbPmfm6sY37raj/YkYP
	uLXmIC/jwLA8Mx1BjS6Bb88t+94esdftJScDqAuJCMXNFD8WiHNVuk3r0R5N7Bl1btgN7S28W74
	9jU5aMWlRrPDkpDyaPmqokhSCmUaSfj7gAezORfnDA7qrKMPiL+jSxqeWFYoj8S8qzSq9vGzpKR
	43BY6/L+Mb4JaoPmTP97H5bSBW5JsJmQl9bWwXfuzrlpuVeeW0YZpy54+wYyyQnZj2PPRC6TGVL
	LRVOx/tkdBP2m0nZV+NfQBCCTpVDc12lYkti68TyMGeffbZdjGNRPnI5i1VLg5caIcDIGesqcai
	x6UK/C3wHRKhiIJxMqwX7ePstf9lYw6Oc7egI=
X-Received: by 2002:a17:90b:1a8c:b0:35b:9ab6:1d65 with SMTP id 98e67ed59e1d1-35b9ab61fb4mr6960509a91.25.1773750742946;
        Tue, 17 Mar 2026 05:32:22 -0700 (PDT)
Received: from google.com ([2402:7500:a44:85b:7148:e9a6:4d84:7769])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a245b3e97sm4842851a91.10.2026.03.17.05.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:32:22 -0700 (PDT)
Date: Tue, 17 Mar 2026 20:32:18 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: richard@nod.at, akpm@linux-foundation.org, jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com, marscheng@google.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/list_sort: introduce list_sort_nonatomic() and
 remove dummy cmp() calls
Message-ID: <ablJ0pe55s1-AkSh@google.com>
References: <20260315193900.218737-1-visitorckw@gmail.com>
 <7bb23ce1-a0f3-b576-ad79-c9fa746f11ed@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7bb23ce1-a0f3-b576-ad79-c9fa746f11ed@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_123226_190058_32E4FA14 
X-CRM114-Status: GOOD (  36.20  )
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

SGkgWmhpaGFvLAoKT24gVHVlLCBNYXIgMTcsIDIwMjYgYXQgMTI6MDU6NTRQTSArMDgwMCwgWmhp
aGFvIENoZW5nIHdyb3RlOgo+IOWcqCAyMDI2LzMvMTYgMzozOSwgS3Vhbi1XZWkgQ2hpdSDlhpnp
gZM6Cj4gPiBIaXN0b3JpY2FsbHksIGxpc3Rfc29ydCgpIGltcGxlbWVudGVkIGEgaGFjayBpbiBt
ZXJnZV9maW5hbCgpOgo+ID4gICAgICBpZiAodW5saWtlbHkoISsrY291bnQpKQo+ID4gICAgICAg
ICAgY21wKHByaXYsIGIsIGIpOwo+ID4gCj4gPiBUaGlzIHdhcyBkZXNpZ25lZCBzcGVjaWZpY2Fs
bHkgc28gdGhhdCBjYWxsZXJzIGNvdWxkIHBlcmlvZGljYWxseQo+ID4gaW52b2tlIGNvbmRfcmVz
Y2hlZCgpIHdpdGhpbiB0aGVpciBjb21wYXJpc29uIGZ1bmN0aW9ucyB3aGVuIG1lcmdpbmcKPiA+
IGhpZ2hseSB1bmJhbGFuY2VkIGxpc3RzLgo+ID4gCj4gPiBIb3dldmVyLCBhbiBhdWRpdCBvZiB0
aGUga2VybmVsIHRyZWUgcmV2ZWFscyB0aGF0IG9ubHkgZnMvdWJpZnMvIHJlbGllcwo+ID4gb24g
dGhpcyBtZWNoYW5pc20uIEZvciB0aGUgdmFzdCBtYWpvcml0eSBvZiBsaXN0X3NvcnQoKSB1c2Vy
cyAoc3VjaCBhcwo+ID4gYmxvY2sgbGF5ZXIgSU8gc2NoZWR1bGVycyBhbmQgZmlsZSBzeXN0ZW1z
KSwgdGhpcyByZXN1bHRzIGluIGNvbXBsZXRlbHkKPiA+IHdhc3RlZCBmdW5jdGlvbiBjYWxscy4g
SW4gdGhlIHdvcnN0LWNhc2Ugc2NlbmFyaW8gKG1lcmdpbmcgYW4gYWxyZWFkeQo+ID4gc29ydGVk
IGxpc3Qgd2hlcmUgJ2EnIGlzIGV4aGF1c3RlZCBxdWlja2x5KSwgdGhpcyByZXN1bHRzIGluCj4g
PiBhcHByb3hpbWF0ZWx5IChOLzIpLzI1NiB1bm5lY2Vzc2FyeSBjbXAoKSBjYWxscy4KPiA+IAo+
ID4gVG8gY2xlYW4gdXAgdGhpcyBBUEkgd2hpbGUgZW5zdXJpbmcgYmVoYXZpb3IgY29tcGF0aWJp
bGl0eToKPiA+IDEuIEludHJvZHVjZSBsaXN0X3NvcnRfbm9uYXRvbWljKCksIHdoaWNoIGV4cGxp
Y2l0bHkgY2FsbHMKPiA+ICAgICBjb25kX3Jlc2NoZWQoKSBpbnRlcm5hbGx5IHdoZW4gY291bnQg
b3ZlcmZsb3dzLgo+ID4gMi4gUmVtb3ZlIHRoZSBkdW1teSBjbXAocHJpdiwgYiwgYikgZmFsbGJh
Y2sgZm9yIHN0YW5kYXJkIGxpc3Rfc29ydCgpLAo+ID4gICAgIHNhdmluZyB1bm5lY2Vzc2FyeSBm
dW5jdGlvbiBjYWxscyBhbmQgaW1wcm92aW5nIGRldGVybWluaXNtLgo+ID4gMy4gQ29udmVydCB0
aGUgc29sZSB1c2VyIChmcy91Ymlmcy8pIHRvIHRoZSBuZXcgQVBJLgo+ID4gCj4gPiBOb3RlIHRo
YXQgdWJpZnMgc3RpbGwgbWFpbnRhaW5zIGNvbmRfcmVzY2hlZCgpIGluc2lkZSBpdHMgb3duCj4g
PiBjb21wYXJpc29uIGZ1bmN0aW9ucy4gVGhpcyBwYXRjaCBkb2VzIG5vdCBhbHRlciB0aGUgZnJl
cXVlbmN5IG9yIHRpbWluZwo+ID4gb2YgdGhvc2Ugc2NoZWR1bGluZyBwb2ludHMsIGd1YXJhbnRl
ZWluZyBubyByZWdyZXNzaW9ucyBmb3IgdWJpZnMsCj4gPiB3aGlsZSBiZW5lZml0aW5nIGFsbCBv
dGhlciBrZXJuZWwgdXNlcnMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEt1YW4tV2VpIENoaXUg
PHZpc2l0b3Jja3dAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgIGZzL3ViaWZzL2djLmMgICAgICAg
ICAgICAgfCAgIDQgKy0KPiA+ICAgZnMvdWJpZnMvcmVwbGF5LmMgICAgICAgICB8ICAgMiArLQo+
ID4gICBpbmNsdWRlL2xpbnV4L2xpc3Rfc29ydC5oIHwgICAzICsKPiA+ICAgbGliL2xpc3Rfc29y
dC5jICAgICAgICAgICB8IDE2NiArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LQo+ID4gICA0IGZpbGVzIGNoYW5nZWQsIDEwMCBpbnNlcnRpb25zKCspLCA3NSBkZWxldGlvbnMo
LSkKPiAKPiBsZ3RtIGZvciBVQklGUy4KPiAKPiBSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxj
aGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KClRoYW5rcyBmb3IgeW91ciByZXZpZXchCgo+IAo+IG9u
ZSBzbWFsbCBuaXQgYmVsb3cuCj4gCj4gPiAKPiBbLi4uXQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvbGlzdF9zb3J0LmggYi9pbmNsdWRlL2xpbnV4L2xpc3Rfc29ydC5oCj4gPiBpbmRl
eCA0NTMxMDVmNzRlMDUuLmY3YWYyOTA3M2Q0OCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvbGlzdF9zb3J0LmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvbGlzdF9zb3J0LmgKPiA+IEBA
IC0xMSw0ICsxMSw3IEBAIHR5cGVkZWYgaW50IF9fYXR0cmlidXRlX18oKG5vbm51bGwoMiwzKSkp
ICgqbGlzdF9jbXBfZnVuY190KSh2b2lkICosCj4gPiAgIF9fYXR0cmlidXRlX18oKG5vbm51bGwo
MiwzKSkpCj4gPiAgIHZvaWQgbGlzdF9zb3J0KHZvaWQgKnByaXYsIHN0cnVjdCBsaXN0X2hlYWQg
KmhlYWQsIGxpc3RfY21wX2Z1bmNfdCBjbXApOwo+ID4gKwo+ID4gK19fYXR0cmlidXRlX18oKG5v
bm51bGwoMiwgMykpKQo+ID4gK3ZvaWQgbGlzdF9zb3J0X25vbmF0b21pYyh2b2lkICpwcml2LCBz
dHJ1Y3QgbGlzdF9oZWFkICpoZWFkLCBsaXN0X2NtcF9mdW5jX3QgY21wKTsKPiA+ICAgI2VuZGlm
Cj4gPiBkaWZmIC0tZ2l0IGEvbGliL2xpc3Rfc29ydC5jIGIvbGliL2xpc3Rfc29ydC5jCj4gPiBp
bmRleCBhMzEwZWNiN2NjYzAuLjc4OGJmYzI2Y2Y3YiAxMDA2NDQKPiA+IC0tLSBhL2xpYi9saXN0
X3NvcnQuYwo+ID4gKysrIGIvbGliL2xpc3Rfc29ydC5jCj4gPiBAQCAtMyw2ICszLDcgQEAKPiA+
ICAgI2luY2x1ZGUgPGxpbnV4L2V4cG9ydC5oPgo+ID4gICAjaW5jbHVkZSA8bGludXgvbGlzdF9z
b3J0Lmg+Cj4gPiAgICNpbmNsdWRlIDxsaW51eC9saXN0Lmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4
L3NjaGVkLmg+Cj4gPiAgIC8qCj4gPiAgICAqIFJldHVybnMgYSBsaXN0IG9yZ2FuaXplZCBpbiBh
biBpbnRlcm1lZGlhdGUgZm9ybWF0IHN1aXRlZAo+ID4gQEAgLTQ3LDcgKzQ4LDcgQEAgc3RhdGlj
IHN0cnVjdCBsaXN0X2hlYWQgKm1lcmdlKHZvaWQgKnByaXYsIGxpc3RfY21wX2Z1bmNfdCBjbXAs
Cj4gPiAgICAqLwo+ID4gICBfX2F0dHJpYnV0ZV9fKChub25udWxsKDIsMyw0LDUpKSkKPiA+ICAg
c3RhdGljIHZvaWQgbWVyZ2VfZmluYWwodm9pZCAqcHJpdiwgbGlzdF9jbXBfZnVuY190IGNtcCwg
c3RydWN0IGxpc3RfaGVhZCAqaGVhZCwKPiA+IC0JCQlzdHJ1Y3QgbGlzdF9oZWFkICphLCBzdHJ1
Y3QgbGlzdF9oZWFkICpiKQo+ID4gKwkJCXN0cnVjdCBsaXN0X2hlYWQgKmEsIHN0cnVjdCBsaXN0
X2hlYWQgKmIsIGJvb2wgbWF5X3NjaGVkdWxlKQo+ID4gICB7Cj4gPiAgIAlzdHJ1Y3QgbGlzdF9o
ZWFkICp0YWlsID0gaGVhZDsKPiA+ICAgCXU4IGNvdW50ID0gMDsKPiA+IEBAIC03OSwxMiArODAs
MTEgQEAgc3RhdGljIHZvaWQgbWVyZ2VfZmluYWwodm9pZCAqcHJpdiwgbGlzdF9jbXBfZnVuY190
IGNtcCwgc3RydWN0IGxpc3RfaGVhZCAqaGVhZCwKPiA+ICAgCQkvKgo+ID4gICAJCSAqIElmIHRo
ZSBtZXJnZSBpcyBoaWdobHkgdW5iYWxhbmNlZCAoZS5nLiB0aGUgaW5wdXQgaXMKPiA+ICAgCQkg
KiBhbHJlYWR5IHNvcnRlZCksIHRoaXMgbG9vcCBtYXkgcnVuIG1hbnkgaXRlcmF0aW9ucy4KPiA+
IC0JCSAqIENvbnRpbnVlIGNhbGxiYWNrcyB0byB0aGUgY2xpZW50IGV2ZW4gdGhvdWdoIG5vCj4g
PiAtCQkgKiBlbGVtZW50IGNvbXBhcmlzb24gaXMgbmVlZGVkLCBzbyB0aGUgY2xpZW50J3MgY21w
KCkKPiA+IC0JCSAqIHJvdXRpbmUgY2FuIGludm9rZSBjb25kX3Jlc2NoZWQoKSBwZXJpb2RpY2Fs
bHkuCj4gPiArCQkgKiBJZiBtYXlfc2NoZWR1bGUgaXMgdHJ1ZSwgcGVyaW9kaWNhbGx5IGludm9r
ZSBjb25kX3Jlc2NoZWQoKQo+ID4gKwkJICogdG8gYXZvaWQgc29mdCBsb2NrdXBzLgo+ID4gICAJ
CSAqLwo+ID4gLQkJaWYgKHVubGlrZWx5KCErK2NvdW50KSkKPiA+IC0JCQljbXAocHJpdiwgYiwg
Yik7Cj4gPiArCQlpZiAobWF5X3NjaGVkdWxlICYmIHVubGlrZWx5KCErK2NvdW50KSkKPiA+ICsJ
CQljb25kX3Jlc2NoZWQoKTsKPiBUaGUgY29uZF9yZXNjaGVkKCkgYWxyZWFkeSBoYXMgYSBqdWRn
bWVudCBvbiB3aGV0aGVyIHRvIHNjaGVkdWxlIG91dCwgc28gdGhlCj4gJ2NvdW50JyBjb3VsZCBi
ZSByZW1vdmVkPwoKSG93ZXZlciwgSSB0aGluayBrZWVwaW5nIHRoZSB1OCBjb3VudCByYXRlLWxp
bWl0ZXIgbWFrZXMgbW9yZSBzZW5zZQpoZXJlIGR1ZSB0byB0aGUgb3ZlcmhlYWQgZGlmZmVyZW5j
ZS4KCkV2YWx1YXRpbmcgdW5saWtlbHkoISsrY291bnQpIGlzIGVzc2VudGlhbGx5IGEgc2luZ2xl
IEFMVSBpbnN0cnVjdGlvbgoocmVnaXN0ZXIgaW5jcmVtZW50KSBhbmQgYSB6ZXJvLWZsYWcgY2hl
Y2ssIHdoaWNoIGhhcyB2aXJ0dWFsbHkgemVybwpjb3N0LiBPbiB0aGUgb3RoZXIgaGFuZCwgY29u
ZF9yZXNjaGVkKCkgaXMgYSBtYWNybyB0aGF0IGRvZXMgbXVjaCBtb3JlCnRoYW4gYSBzaW1wbGUg
ZmxhZyBjaGVjay4gRGVwZW5kaW5nIG9uIHRoZSBrZXJuZWwgY29uZmlnLCBpdCBvZnRlbgppbnZv
a2VzIF9fbWlnaHRfcmVzY2hlZCgpICh3aGljaCByZWFkcyBjdXJyZW50IHRvIGNoZWNrIHRhc2tf
c3RydWN0CnN0YXRlcywgaXJxIGZsYWdzLCBldGMuKSBhbmQgbWFrZXMgYSBjYWxsIHRvIF9fY29u
ZF9yZXNjaGVkKCkuCkV2YWx1YXRpbmcgYWxsIG9mIHRoaXMgaGVhdnkgbWFjaGluZXJ5IG9uIGV2
ZXJ5IHNpbmdsZSBpdGVyYXRpb24gb2YKc3VjaCBhIHRpZ2h0IGxvb3Agd291bGQgcHJvYmFibHkg
aW50cm9kdWNlIG5vdGljZWFibGUgb3ZlcmhlYWQuCgpBY3R1YWxseSwgeW91ciBjb21tZW50IGJy
aW5ncyB1cCBhbm90aGVyIHRob3VnaHQgSSB3YW50ZWQgdG8gZGlzY3Vzcy4KClNpbmNlIHdlIGFy
ZSBpbnRyb2R1Y2luZyBsaXN0X3NvcnRfbm9uYXRvbWljKCksIEkgd29uZGVyIGlmIHdlIHNob3Vs
ZApldmVudHVhbGx5IG1vdmUgdGhlIGNvbmRfcmVzY2hlZCgpIG91dCBvZiBVQklGUydzIGNtcCgp
IGZ1bmN0aW9ucwplbnRpcmVseSBhbmQgaGFuZGxlIGl0IGluc2lkZSBsaXN0X3NvcnRfbm9uYXRv
bWljKCkuCgpSaWdodCBub3csIGJlY2F1c2UgdGhlIGNtcCgpIGNhbGxiYWNrIGlzIGluaGVyZW50
bHkgaW52b2tlZCBhdCBldmVyeQpzdGVwIG9mIHRoZSBtZXJnZSBwcm9jZXNzLCBVQklGUyBlbmRz
IHVwIGV2YWx1YXRpbmcgdGhlIGNvbmRfcmVzY2hlZCgpCm1hY3JvIGV2ZXJ5IDMgb3IgNCBwb2lu
dGVyIGFzc2lnbm1lbnRzIGR1cmluZyB0aGUgbWFpbiBzb3J0LiBXaGlsZQpVQklGUyBuZWVkcyB0
byBwcmV2ZW50IHNvZnQgbG9ja3VwcyBvbiBodWdlIGxpc3RzLCBjaGVja2luZyBmb3IgcmVzY2hl
ZAphdCBzdWNoIGEgbWljcm8tZ3JhbnVsYXJpdHkgc3RpbGwgZmVlbHMgZXhjZXNzaXZlIGFuZCBs
aWtlbHkgbGVhdmVzCnBlcmZvcm1hbmNlIG9uIHRoZSB0YWJsZS4KCkkgZGlkbid0IG1ha2UgdGhp
cyBjaGFuZ2UgaW4gdGhlIGN1cnJlbnQgcGF0Y2ggYmVjYXVzZSBJIGRvbid0IGhhdmUgdGhlCnBy
b3BlciBVQklGUyBoYXJkd2FyZS9zZXR1cCB0byBiZW5jaG1hcmsgdGhlIHBlcmZvcm1hbmNlIGRp
ZmZlcmVuY2UsCmFuZCBJIHdhbnRlZCB0byBrZWVwIHRoZSBjdXJyZW50IHNjaGVkdWxpbmcgZnJl
cXVlbmN5IGV4YWN0bHkgdGhlIHNhbWUKdG8gZ3VhcmFudGVlIG5vIHJlZ3Jlc3Npb25zLiBCdXQg
SSdkIGxvdmUgdG8gaGVhciB5b3VyIHRob3VnaHRzIG9uCndoZXRoZXIgcmVkdWNpbmcgdGhlIGZy
ZXF1ZW5jeSBhbmQgbW92aW5nIGl0IG91dCBvZiBVQklGUydzIGNtcCgpIGlzCnNvbWV0aGluZyB3
b3J0aCBkb2luZyBpbiB0aGUgZnV0dXJlLgoKUmVnYXJkcywKS3Vhbi1XZWkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
