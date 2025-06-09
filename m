Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AE6C5AD49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jun 2025 03:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJCb1C5hXcC3nMAFy/mjsGH/Fm+bQom2X0EEWQOXZZk=; b=Rp4CQ4uLyPh4yQbHOW7DjIxmzI
	dscKGbnRilvNTcXn3A4SIWXEapbvIMPbfL/ISe7jH8ZSBMjbo+z8Jc9hatkYDkMH1sXpghjuSNJ/l
	5yzZzZQy7hrs9OIXSd7+ymz4q67f8kray7TAejNk0m6IjG2IXQmVCHXl1nvkAF1nImlWHRgjgjJ4W
	JbNOMcNbhYO3QLthKWiWM46kX5HnmjuWWX6nDSbwV9uQYjpS4w+JWPC31EwK5Qo/xDRR5B14hW25w
	H+vRdPl/x4Cln9phxFo2Iqa5iDHYnBfuad8Q3K0xlyL3s2CiF1gPw7RXjFAcBDavjOjsUDD2AZKDj
	MHPdzFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOTLS-00000003LvQ-2GSx;
	Mon, 09 Jun 2025 03:38:46 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOTE6-00000003LT6-2wOm
	for linux-mtd@lists.infradead.org;
	Mon, 09 Jun 2025 03:31:12 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bFy5P3sBMzRk3G;
	Mon,  9 Jun 2025 11:26:49 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id AE5E2140132;
	Mon,  9 Jun 2025 11:31:01 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Jun 2025 11:31:00 +0800
Subject: Re: [PATCH] ubifs: Remove uncallable debug code
To: <linux@treblig.org>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250608230846.166822-1-linux@treblig.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a3db4a26-fc36-f3fe-6d75-3fe1e6263a6d@huawei.com>
Date: Mon, 9 Jun 2025 11:31:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20250608230846.166822-1-linux@treblig.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_203111_062589_116DF6EC 
X-CRM114-Status: GOOD (  15.20  )
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

1NogMjAyNS82LzkgNzowOCwgbGludXhAdHJlYmxpZy5vcmcg0LS1wDoKPiBGcm9tOiAiRHIuIERh
dmlkIEFsYW4gR2lsYmVydCIgPGxpbnV4QHRyZWJsaWcub3JnPgo+IAo+IHViaWZzX2R1bXBfYnVk
Z2V0X3JlcSgpIGFuZCB1Ymlmc19kdW1wX2luZGV4KCkgaGF2ZSBiZWVuIHVudXNlZAo+IHNpbmNl
IHRoZXkgd2VyZSBvcmlnaW5hbGx5IGFkZGVkIGJhY2sgaW4gMjAwOCdzCj4gY29tbWl0IDFlNTE3
NjRhM2MyYSAoIlVCSUZTOiBhZGQgbmV3IGZsYXNoIGZpbGUgc3lzdGVtIikKPiAKPiBUaGV5IHdl
cmUgcmVuYW1lZCBmcm9tIGRiZ19kdW1wX2J1ZGdldF9yZXEoKSBhbmQgZGJnX2R1bXBfaW5kZXgo
KSBpbgo+IDIwMTIuCj4gCj4gUmVtb3ZlIHRoZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogRHIuIERh
dmlkIEFsYW4gR2lsYmVydCA8bGludXhAdHJlYmxpZy5vcmc+Cj4gLS0tCj4gICBmcy91Ymlmcy9k
ZWJ1Zy5jIHwgMzYgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICBmcy91
Ymlmcy9kZWJ1Zy5oIHwgIDIgLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMzggZGVsZXRpb25zKC0p
CgpJIGd1ZXNzIHRoZXNlIGZ1bmN0aW9ucyBhcmUgdXNlZCB0byBkZWJ1ZyBpbiBlYXJseSBkZXZl
bG9wbWVudC4gSSB1c2UgCnRoZW0gc29tdGltZXMgZm9yIGRlYnVnZ2luZy9kZXZlbG9waW5nLiBJ
TU8sIG5vIG5lZWQgdG8gZHJvcCB0aGVtLgo+IAo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9kZWJ1
Zy5jIGIvZnMvdWJpZnMvZGVidWcuYwo+IGluZGV4IGIwMWYzODJjZThkYi4uMDUxMjQzOTJkMWQ5
IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2RlYnVnLmMKPiArKysgYi9mcy91Ymlmcy9kZWJ1Zy5j
Cj4gQEAgLTU4MCwyMyArNTgwLDYgQEAgdm9pZCB1Ymlmc19kdW1wX25vZGUoY29uc3Qgc3RydWN0
IHViaWZzX2luZm8gKmMsIGNvbnN0IHZvaWQgKm5vZGUsIGludCBub2RlX2xlbikKPiAgIAlzcGlu
X3VubG9jaygmZGJnX2xvY2spOwo+ICAgfQo+ICAgCj4gLXZvaWQgdWJpZnNfZHVtcF9idWRnZXRf
cmVxKGNvbnN0IHN0cnVjdCB1Ymlmc19idWRnZXRfcmVxICpyZXEpCj4gLXsKPiAtCXNwaW5fbG9j
aygmZGJnX2xvY2spOwo+IC0JcHJfZXJyKCJCdWRnZXRpbmcgcmVxdWVzdDogbmV3X2lubyAlZCwg
ZGlydGllZF9pbm8gJWRcbiIsCj4gLQkgICAgICAgcmVxLT5uZXdfaW5vLCByZXEtPmRpcnRpZWRf
aW5vKTsKPiAtCXByX2VycigiXHRuZXdfaW5vX2QgICAlZCwgZGlydGllZF9pbm9fZCAlZFxuIiwK
PiAtCSAgICAgICByZXEtPm5ld19pbm9fZCwgcmVxLT5kaXJ0aWVkX2lub19kKTsKPiAtCXByX2Vy
cigiXHRuZXdfcGFnZSAgICAlZCwgZGlydGllZF9wYWdlICVkXG4iLAo+IC0JICAgICAgIHJlcS0+
bmV3X3BhZ2UsIHJlcS0+ZGlydGllZF9wYWdlKTsKPiAtCXByX2VycigiXHRuZXdfZGVudCAgICAl
ZCwgbW9kX2RlbnQgICAgICVkXG4iLAo+IC0JICAgICAgIHJlcS0+bmV3X2RlbnQsIHJlcS0+bW9k
X2RlbnQpOwo+IC0JcHJfZXJyKCJcdGlkeF9ncm93dGggICVkXG4iLCByZXEtPmlkeF9ncm93dGgp
Owo+IC0JcHJfZXJyKCJcdGRhdGFfZ3Jvd3RoICVkIGRkX2dyb3d0aCAgICAgJWRcbiIsCj4gLQkg
ICAgICAgcmVxLT5kYXRhX2dyb3d0aCwgcmVxLT5kZF9ncm93dGgpOwo+IC0Jc3Bpbl91bmxvY2so
JmRiZ19sb2NrKTsKPiAtfQo+IC0KPiAgIHZvaWQgdWJpZnNfZHVtcF9sc3RhdHMoY29uc3Qgc3Ry
dWN0IHViaWZzX2xwX3N0YXRzICpsc3QpCj4gICB7Cj4gICAJc3Bpbl9sb2NrKCZkYmdfbG9jayk7
Cj4gQEAgLTk2MywyNSArOTQ2LDYgQEAgdm9pZCB1Ymlmc19kdW1wX3RuYyhzdHJ1Y3QgdWJpZnNf
aW5mbyAqYykKPiAgIAlwcl9lcnIoIihwaWQgJWQpIGZpbmlzaCBkdW1waW5nIFROQyB0cmVlXG4i
LCBjdXJyZW50LT5waWQpOwo+ICAgfQo+ICAgCj4gLXN0YXRpYyBpbnQgZHVtcF96bm9kZShzdHJ1
Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IHViaWZzX3pub2RlICp6bm9kZSwKPiAtCQkgICAgICB2
b2lkICpwcml2KQo+IC17Cj4gLQl1Ymlmc19kdW1wX3pub2RlKGMsIHpub2RlKTsKPiAtCXJldHVy
biAwOwo+IC19Cj4gLQo+IC0vKioKPiAtICogdWJpZnNfZHVtcF9pbmRleCAtIGR1bXAgdGhlIG9u
LWZsYXNoIGluZGV4Lgo+IC0gKiBAYzogVUJJRlMgZmlsZS1zeXN0ZW0gZGVzY3JpcHRpb24gb2Jq
ZWN0Cj4gLSAqCj4gLSAqIFRoaXMgZnVuY3Rpb24gZHVtcHMgd2hvbGUgVUJJRlMgaW5kZXhpbmcg
Qi10cmVlLCB1bmxpa2UgJ3ViaWZzX2R1bXBfdG5jKCknCj4gLSAqIHdoaWNoIGR1bXBzIG9ubHkg
aW4tbWVtb3J5IHpub2RlcyBhbmQgZG9lcyBub3QgcmVhZCB6bm9kZXMgd2hpY2ggZnJvbSBmbGFz
aC4KPiAtICovCj4gLXZvaWQgdWJpZnNfZHVtcF9pbmRleChzdHJ1Y3QgdWJpZnNfaW5mbyAqYykK
PiAtewo+IC0JZGJnX3dhbGtfaW5kZXgoYywgTlVMTCwgZHVtcF96bm9kZSwgTlVMTCk7Cj4gLX0K
PiAtCj4gICAvKioKPiAgICAqIGRiZ19zYXZlX3NwYWNlX2luZm8gLSBzYXZlIGluZm9ybWF0aW9u
IGFib3V0IGZsYXNoIHNwYWNlLgo+ICAgICogQGM6IFVCSUZTIGZpbGUtc3lzdGVtIGRlc2NyaXB0
aW9uIG9iamVjdAo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9kZWJ1Zy5oIGIvZnMvdWJpZnMvZGVi
dWcuaAo+IGluZGV4IGQ0MjU4NjFlNmI4Mi4uMWQ1YzhlZThiNjRhIDEwMDY0NAo+IC0tLSBhL2Zz
L3ViaWZzL2RlYnVnLmgKPiArKysgYi9mcy91Ymlmcy9kZWJ1Zy5oCj4gQEAgLTI0NSw3ICsyNDUs
NiBAQCBjb25zdCBjaGFyICpkYmdfc25wcmludGZfa2V5KGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZv
ICpjLAo+ICAgdm9pZCB1Ymlmc19kdW1wX2lub2RlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBjb25z
dCBzdHJ1Y3QgaW5vZGUgKmlub2RlKTsKPiAgIHZvaWQgdWJpZnNfZHVtcF9ub2RlKGNvbnN0IHN0
cnVjdCB1Ymlmc19pbmZvICpjLCBjb25zdCB2b2lkICpub2RlLAo+ICAgCQkgICAgIGludCBub2Rl
X2xlbik7Cj4gLXZvaWQgdWJpZnNfZHVtcF9idWRnZXRfcmVxKGNvbnN0IHN0cnVjdCB1Ymlmc19i
dWRnZXRfcmVxICpyZXEpOwo+ICAgdm9pZCB1Ymlmc19kdW1wX2xzdGF0cyhjb25zdCBzdHJ1Y3Qg
dWJpZnNfbHBfc3RhdHMgKmxzdCk7Cj4gICB2b2lkIHViaWZzX2R1bXBfYnVkZyhzdHJ1Y3QgdWJp
ZnNfaW5mbyAqYywgY29uc3Qgc3RydWN0IHViaWZzX2J1ZGdfaW5mbyAqYmkpOwo+ICAgdm9pZCB1
Ymlmc19kdW1wX2xwcm9wKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLAo+IEBAIC0yNjAsNyAr
MjU5LDYgQEAgdm9pZCB1Ymlmc19kdW1wX2hlYXAoc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVj
dCB1Ymlmc19scHRfaGVhcCAqaGVhcCwKPiAgIHZvaWQgdWJpZnNfZHVtcF9wbm9kZShzdHJ1Y3Qg
dWJpZnNfaW5mbyAqYywgc3RydWN0IHViaWZzX3Bub2RlICpwbm9kZSwKPiAgIAkJICAgICAgc3Ry
dWN0IHViaWZzX25ub2RlICpwYXJlbnQsIGludCBpaXApOwo+ICAgdm9pZCB1Ymlmc19kdW1wX3Ru
YyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYyk7Cj4gLXZvaWQgdWJpZnNfZHVtcF9pbmRleChzdHJ1Y3Qg
dWJpZnNfaW5mbyAqYyk7Cj4gICB2b2lkIHViaWZzX2R1bXBfbHB0X2xlYnMoY29uc3Qgc3RydWN0
IHViaWZzX2luZm8gKmMpOwo+ICAgCj4gICBpbnQgZGJnX3dhbGtfaW5kZXgoc3RydWN0IHViaWZz
X2luZm8gKmMsIGRiZ19sZWFmX2NhbGxiYWNrIGxlYWZfY2IsCj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
