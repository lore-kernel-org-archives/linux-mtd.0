Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E8F606A31F
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 04:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pRd8XUbm;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=5zhKz4Of
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CHK/co7LfDlPP+WqnrCexNDhnB12+LWxW0K5vuP38vE=; b=pRd8XUbm05NeOEUcBvi+1Qnn1E
	IQmmAZyERIRHVm4ZX00ovQ4e31rGEv83am3onNIPqA9NQHVoUSOXvKmGt8ye90MsNX2wlsvAN7+3t
	GKcp9FIzPdf+jU1MpvV+tl8rGSitn1LCVN3Bj0+obPuTDiDfumptNM+pemNssXrXrUx2N2YyWuqsG
	sN+zZb7IzkH6ts9OP6WboktQlRSdjprV3Et9c8UbYuv2WHGmvTzak9U4UEpwrGXXxTqEMKismWWDY
	Ex9FyWOuU+IYu8aAW6CKu0DfN5/+4o4GrCo7EeOf2IR9hJ+ltoR9sXTF4ggDNLFPuc1gN/R689Kqi
	OJJIaPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMeTz-0000000Ap20-0ljJ;
	Fri, 30 Oct 2026 04:44:51 +0000
Received: from [113.46.200.217] (helo=canpmsgout02.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMeTv-0000000Ap1H-1e2R
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 04:44:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GbNaL4M3tcHsdzF76BY+M5ZcMEBVt6cRuMm5Kwdf22Y=;
	b=5zhKz4OfT43LZvYaHIoNTFAf1MPjJg+7tR4HWVY8EHoVhzmOlFMVq4+yP7+FEWzYxHcJCHrDm
	ZqgFF3exSdDyWhAWwWRT4nHtKAIgATCNdDhveHYvvrQxHtHl3gNjxgxXiRkQ8wjYwPlu+BvAaa9
	XGz2jvH+yjQbyQwoF+EtwNk=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jG7mF3N6JzcZyh;
	Fri, 30 Oct 2026 12:44:13 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 9F5B740579;
	Fri, 30 Oct 2026 12:44:30 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 30 Oct 2026 12:44:29 +0800
Subject: Re: [PATCH] ubifs: propagate ubifs_shash_copy_state() errors
To: <shao.mingyin@zte.com.cn>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20261030114406371EZw_orIqSRlCTxnz_L39Z@zte.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <4bdb09dd-bbaf-111f-adb6-4d9970ebedcc@huawei.com>
Date: Fri, 30 Oct 2026 12:44:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261030114406371EZw_orIqSRlCTxnz_L39Z@zte.com.cn>
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_214448_421168_E93D5332 
X-CRM114-Status: GOOD (  20.01  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYvMTAvMzAgMTE6NDQsIHNoYW8ubWluZ3lpbkB6dGUuY29tLmNuIOWGmemBkzoKPiBG
cm9tOiBTaGFvIE1pbmd5aW4gPHNoYW8ubWluZ3lpbkB6dGUuY29tLmNuPgo+IAo+IHViaWZzX3No
YXNoX2NvcHlfc3RhdGUoKSBkdXBsaWNhdGVzIHRoZSByb2xsaW5nIGhhc2ggc3RhdGUgd2l0aAo+
IGNyeXB0b19zaGFzaF9leHBvcnQoKSBhbmQgY3J5cHRvX3NoYXNoX2ltcG9ydCgpLiAgVGhlIGV4
cG9ydCBidWZmZXIgaXMKPiBhbGxvY2F0ZWQgd2l0aCBrbWFsbG9jKCksIHNvIHRoZSBmdW5jdGlv
biBjYW4gZmFpbCB3aXRoIC1FTk9NRU0sIGFuZAo+IGNyeXB0b19zaGFzaF9pbXBvcnQoKSBjYW4g
ZmFpbCBhcyB3ZWxsLgo+IAo+IEZpdmUgY2FsbGVycyBpZ25vcmUgdGhlIHJldHVybiB2YWx1ZS4g
IFRoZSB0YXJnZXQgZGVzY3JpcHRvciB0aGVuIGhhcyBubwo+IHZhbGlkIHN0YXRlLCBhbmQgdGhl
IGNyeXB0b19zaGFzaF9maW5hbCgpIHRoYXQgZm9sbG93cyBjb21wdXRlcyBhIGRpZ2VzdAo+IGZy
b20gdW5pbml0aWFsaXplZCBkYXRhLiAgV2hlbiBwcmVwYXJpbmcgYW4gYXV0aCBub2RlIHRoaXMg
c3RvcmVzIGEKPiB3cm9uZyBITUFDIG9uIHRoZSBtZWRpYSwgc28gdGhlIGFmZmVjdGVkIGpvdXJu
YWwgaGVhZCBubyBsb25nZXIKPiBhdXRoZW50aWNhdGVzIGFmdGVyIGEgcmVtb3VudC4gIER1cmlu
ZyByZXBsYXkgaXQgbWFrZXMgdGhlIHZlcmlmaWNhdGlvbgo+IG9mIGEgdmFsaWQgaW1hZ2UgZmFp
bCB3aXRoIC1FUEVSTSwgYW5kIGluIHJlcGxheV9idWQoKSBhbmQKPiBhZGRfcmVwbGF5X2J1ZCgp
IGl0IGxlYXZlcyB0aGUgcmVwbGF5IGhhc2ggc3RhdGUgaW5jb25zaXN0ZW50IHdpdGggdGhlCj4g
bWVkaWEsIHdoaWNoIGNvcnJ1cHRzIHRoZSBhdXRoIG5vZGVzIHdyaXR0ZW4gYnkgbGF0ZXIgY29t
bWl0cy4KPiAKPiBDaGVjayB0aGUgZXJyb3IgYXQgYWxsIGZpdmUgY2FsbCBzaXRlcyBhbmQgcHJv
cGFnYXRlIGl0LiAgSW4KPiBhZGRfcmVwbGF5X2J1ZCgpIHRoZSBkZXNjcmlwdG9yIGJlbG9uZ3Mg
dG8gdGhlIG5ldyBidWQsIHNvIGZyZWUgaXQgb24KPiB0aGUgYWRkZWQgZXJyb3IgcGF0aC4KPiAK
PiBGaXhlczogNmE5OGJjNDYxNGRlICgidWJpZnM6IEFkZCBhdXRoZW50aWNhdGlvbiBub2RlcyB0
byBqb3VybmFsIikKPiBGaXhlczogZGE4ZWY2NWY5NTczICgidWJpZnM6IEF1dGhlbnRpY2F0ZSBy
ZXBsYXllZCBqb3VybmFsIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1v
ZmYtYnk6IFNoYW8gTWluZ3lpbiA8c2hhby5taW5neWluQHp0ZS5jb20uY24+Cj4gLS0tCgpSZXZp
ZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBkaWZmIC0t
Z2l0IGEvZnMvdWJpZnMvYXV0aC5jIGIvZnMvdWJpZnMvYXV0aC5jCj4gaW5kZXggMWY3NzA3OTVl
ZTcwLi42MmRmYWNmYjZkNmIgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvYXV0aC5jCj4gKysrIGIv
ZnMvdWJpZnMvYXV0aC5jCj4gQEAgLTcwLDcgKzcwLDEwIEBAIGludCB1Ymlmc19wcmVwYXJlX2F1
dGhfbm9kZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgdm9pZCAqbm9kZSwKPiAgIAkJU0hBU0hfREVT
Q19PTl9TVEFDSyhoYXNoX2Rlc2MsIGMtPmhhc2hfdGZtKTsKPiAKPiAgIAkJaGFzaF9kZXNjLT50
Zm0gPSBjLT5oYXNoX3RmbTsKPiAtCQl1Ymlmc19zaGFzaF9jb3B5X3N0YXRlKGMsIGluaGFzaCwg
aGFzaF9kZXNjKTsKPiArCj4gKwkJZXJyID0gdWJpZnNfc2hhc2hfY29weV9zdGF0ZShjLCBpbmhh
c2gsIGhhc2hfZGVzYyk7Cj4gKwkJaWYgKGVycikKPiArCQkJcmV0dXJuIGVycjsKPiAKPiAgIAkJ
ZXJyID0gY3J5cHRvX3NoYXNoX2ZpbmFsKGhhc2hfZGVzYywgaGFzaCk7Cj4gICAJCWlmIChlcnIp
Cj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL2xvZy5jIGIvZnMvdWJpZnMvbG9nLmMKPiBpbmRleCBj
NmVkY2JmMzVlYmMuLjQyY2FkZjU1OGE0ZiAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9sb2cuYwo+
ICsrKyBiL2ZzL3ViaWZzL2xvZy5jCj4gQEAgLTQxMiw3ICs0MTIsMTEgQEAgaW50IHViaWZzX2xv
Z19zdGFydF9jb21taXQoc3RydWN0IHViaWZzX2luZm8gKmMsIGludCAqbHRhaWxfbG51bSkKPiAg
IAkJCQkJIFVCSUZTX1JFRl9OT0RFX1NaKTsKPiAgIAkJaWYgKGVycikKPiAgIAkJCWdvdG8gb3V0
Owo+IC0JCXViaWZzX3NoYXNoX2NvcHlfc3RhdGUoYywgYy0+bG9nX2hhc2gsIGMtPmpoZWFkc1tp
XS5sb2dfaGFzaCk7Cj4gKwo+ICsJCWVyciA9IHViaWZzX3NoYXNoX2NvcHlfc3RhdGUoYywgYy0+
bG9nX2hhc2gsCj4gKwkJCQkJICAgICBjLT5qaGVhZHNbaV0ubG9nX2hhc2gpOwo+ICsJCWlmIChl
cnIpCj4gKwkJCWdvdG8gb3V0Owo+ICAgCX0KPiAKPiAgIAl1Ymlmc19wYWQoYywgYnVmICsgbGVu
LCBBTElHTihsZW4sIGMtPm1pbl9pb19zaXplKSAtIGxlbik7Cj4gZGlmZiAtLWdpdCBhL2ZzL3Vi
aWZzL3JlcGxheS5jIGIvZnMvdWJpZnMvcmVwbGF5LmMKPiBpbmRleCAyNjMwNDVlMDVjZjEuLjBi
ODJjNjdhMmRjYyAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9yZXBsYXkuYwo+ICsrKyBiL2ZzL3Vi
aWZzL3JlcGxheS5jCj4gQEAgLTU2NiwxMCArNTY2LDE0IEBAIGF1dGhlbnRpY2F0ZV9zbGViX2hh
c2goc3RydWN0IHViaWZzX2luZm8gKmMsCj4gICAJCSAgICAgICBzdHJ1Y3Qgc2hhc2hfZGVzYyAq
bG9nX2hhc2gsIHU4ICpoYXNoKQo+ICAgewo+ICAgCVNIQVNIX0RFU0NfT05fU1RBQ0soaGFzaF9k
ZXNjLCBjLT5oYXNoX3RmbSk7Cj4gKwlpbnQgZXJyOwo+IAo+ICAgCWhhc2hfZGVzYy0+dGZtID0g
Yy0+aGFzaF90Zm07Cj4gCj4gLQl1Ymlmc19zaGFzaF9jb3B5X3N0YXRlKGMsIGxvZ19oYXNoLCBo
YXNoX2Rlc2MpOwo+ICsJZXJyID0gdWJpZnNfc2hhc2hfY29weV9zdGF0ZShjLCBsb2dfaGFzaCwg
aGFzaF9kZXNjKTsKPiArCWlmIChlcnIpCj4gKwkJcmV0dXJuIGVycjsKPiArCj4gICAJcmV0dXJu
IGNyeXB0b19zaGFzaF9maW5hbChoYXNoX2Rlc2MsIGhhc2gpOwo+ICAgfQo+IAo+IEBAIC02OTQs
OCArNjk4LDEwIEBAIHN0YXRpYyBpbnQgcmVwbGF5X2J1ZChzdHJ1Y3QgdWJpZnNfaW5mbyAqYywg
c3RydWN0IGJ1ZF9lbnRyeSAqYikKPiAgIAkJZ290byBvdXQ7Cj4gICAJfQo+IAo+IC0JdWJpZnNf
c2hhc2hfY29weV9zdGF0ZShjLCBiLT5idWQtPmxvZ19oYXNoLAo+IC0JCQkgICAgICAgYy0+amhl
YWRzW2ItPmJ1ZC0+amhlYWRdLmxvZ19oYXNoKTsKPiArCWVyciA9IHViaWZzX3NoYXNoX2NvcHlf
c3RhdGUoYywgYi0+YnVkLT5sb2dfaGFzaCwKPiArCQkJCSAgICAgYy0+amhlYWRzW2ItPmJ1ZC0+
amhlYWRdLmxvZ19oYXNoKTsKPiArCWlmIChlcnIpCj4gKwkJZ290byBvdXQ7Cj4gCj4gICAJLyoK
PiAgIAkgKiBUaGUgYnVkIGRvZXMgbm90IGhhdmUgdG8gc3RhcnQgZnJvbSBvZmZzZXQgemVybyAt
IHRoZSBiZWdpbm5pbmcgb2YKPiBAQCAtOTE1LDcgKzkyMSw5IEBAIHN0YXRpYyBpbnQgYWRkX3Jl
cGxheV9idWQoc3RydWN0IHViaWZzX2luZm8gKmMsIGludCBsbnVtLCBpbnQgb2ZmcywgaW50IGpo
ZWFkLAo+ICAgCQlnb3RvIG91dDsKPiAgIAl9Cj4gCj4gLQl1Ymlmc19zaGFzaF9jb3B5X3N0YXRl
KGMsIGMtPmxvZ19oYXNoLCBidWQtPmxvZ19oYXNoKTsKPiArCWVyciA9IHViaWZzX3NoYXNoX2Nv
cHlfc3RhdGUoYywgYy0+bG9nX2hhc2gsIGJ1ZC0+bG9nX2hhc2gpOwo+ICsJaWYgKGVycikKPiAr
CQlnb3RvIG91dF9mcmVlX2xvZ19oYXNoOwo+IAo+ICAgCXViaWZzX2FkZF9idWQoYywgYnVkKTsK
PiAKPiBAQCAtOTI0LDYgKzkzMiw4IEBAIHN0YXRpYyBpbnQgYWRkX3JlcGxheV9idWQoc3RydWN0
IHViaWZzX2luZm8gKmMsIGludCBsbnVtLCBpbnQgb2ZmcywgaW50IGpoZWFkLAo+ICAgCWxpc3Rf
YWRkX3RhaWwoJmItPmxpc3QsICZjLT5yZXBsYXlfYnVkcyk7Cj4gCj4gICAJcmV0dXJuIDA7Cj4g
K291dF9mcmVlX2xvZ19oYXNoOgo+ICsJa2ZyZWUoYnVkLT5sb2dfaGFzaCk7Cj4gICBvdXQ6Cj4g
ICAJa2ZyZWUoYnVkKTsKPiAgIAlrZnJlZShiKTsKPiAuCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
