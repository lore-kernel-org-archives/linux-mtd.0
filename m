Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E170D2E9C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayjrI7Vlf7iSW2ba4fbvv66qi8eABSR6ezkt+v2cehA=; b=bp1Ytpglyln0gKwSB2J/333XTY
	tfczWFj5ZRzyUouVaI63H+zIkEqdPDVgCjjYhBC90A18AEOjnHX4/xmmHxRYaYFjsscElrnC1aWVZ
	nm31Uw27mPZyRuM5vC0e8RseA+AyO6IM42GYRgHIOJAbMh7KPFqEKwsA5sd/7HcoKV+l7Cfkly9xY
	jf1zZU+GWzcrhbrAhmX0k6ZqT9t5A8YfbHc1MGm58kEcEui118Lx2Eea+FCUHv7BOnE8YBBRYGC9p
	VfMn6OFS+CM9j+oVy/ew0l4TYyt10FCkoX9/QdgYIzCoktty/8pRt3asW6cVc0gaHeYLWKdUTRWmM
	neVZFXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQN8-0000000Gzry-3Gor;
	Mon, 11 Nov 2024 09:06:10 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQN5-0000000GzrU-3XRn
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:06:09 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xn3Vj54t9z10R00;
	Mon, 11 Nov 2024 17:03:25 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 61C62180AEB;
	Mon, 11 Nov 2024 17:05:52 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 11 Nov 2024 17:05:51 +0800
Subject: Re: [PATCH mtd-utils v2 RESEND 040/102] ubifs-utils: Adapt master.c
 in libubifs
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
References: <20241111085741.2066378-1-chengzhihao1@huawei.com>
Message-ID: <e6b04cec-5c4b-c57d-81a5-131f078b23d5@huawei.com>
Date: Mon, 11 Nov 2024 17:05:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241111085741.2066378-1-chengzhihao1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_010608_082851_F1CAAADB 
X-CRM114-Status: GOOD (  16.54  )
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

1NogMjAyNC8xMS8xMSAxNjo1NywgWmhpaGFvIENoZW5nINC0tcA6CgpTb3JyeSBmb3IgdGhlIG5v
aXN5LCBwbGVhc2UgaWdub3JlIHRoaXMgc2VyaWVzLgo+IEFkYXB0IG1hc3Rlci5jIGluIGxpYnVi
aWZzLCBjb21wYXJlZCB3aXRoIGxpbnV4IGtlcm5lbCBpbXBsZW1lbnRhdGlvbnM6Cj4gICAxLiBS
ZW1vdmUgYXV0aGVudGljYXRpb24gcmVsYXRlZCBpbXBsZW1lbnRhdGlvbnMKPiAgICAgIChlZy4g
bXN0X25vZGVfY2hlY2tfaGFzaCksIGF1dGhlbnRpY2F0aW9uIGlzIG5vdCBzdXBwb3J0ZWQgaW4g
ZnNjawo+ICAgICAgZm9yIG5vdy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBaaGloYW8gQ2hlbmcgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IC0tLQo+ICAgdWJpZnMtdXRpbHMvbGlidWJpZnMvbWFz
dGVyLmMgfCAyMyArKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3ViaWZzLXV0
aWxzL2xpYnViaWZzL21hc3Rlci5jIGIvdWJpZnMtdXRpbHMvbGlidWJpZnMvbWFzdGVyLmMKPiBp
bmRleCA3YWRjMzdjMS4uY2NlMWE0MTUgMTAwNjQ0Cj4gLS0tIGEvdWJpZnMtdXRpbHMvbGlidWJp
ZnMvbWFzdGVyLmMKPiArKysgYi91Ymlmcy11dGlscy9saWJ1Ymlmcy9tYXN0ZXIuYwo+IEBAIC0x
MCw3ICsxMCwxMSBAQAo+ICAgCj4gICAvKiBUaGlzIGZpbGUgaW1wbGVtZW50cyByZWFkaW5nIGFu
ZCB3cml0aW5nIHRoZSBtYXN0ZXIgbm9kZSAqLwo+ICAgCj4gKyNpbmNsdWRlICJsaW51eF9lcnIu
aCIKPiArI2luY2x1ZGUgImttZW0uaCIKPiAgICNpbmNsdWRlICJ1Ymlmcy5oIgo+ICsjaW5jbHVk
ZSAiZGVmcy5oIgo+ICsjaW5jbHVkZSAiZGVidWcuaCIKPiAgIAo+ICAgLyoqCj4gICAgKiB1Ymlm
c19jb21wYXJlX21hc3Rlcl9ub2RlIC0gY29tcGFyZSB0d28gVUJJRlMgbWFzdGVyIG5vZGVzCj4g
QEAgLTIxLDcgKzI1LDcgQEAKPiAgICAqIFRoaXMgZnVuY3Rpb24gY29tcGFyZXMgdHdvIFVCSUZT
IG1hc3RlciBub2Rlcy4gUmV0dXJucyAwIGlmIHRoZXkgYXJlIGVxdWFsCj4gICAgKiBhbmQgbm9u
emVybyBpZiBub3QuCj4gICAgKi8KPiAtaW50IHViaWZzX2NvbXBhcmVfbWFzdGVyX25vZGUoc3Ry
dWN0IHViaWZzX2luZm8gKmMsIHZvaWQgKm0xLCB2b2lkICptMikKPiAraW50IHViaWZzX2NvbXBh
cmVfbWFzdGVyX25vZGUoX191bnVzZWQgc3RydWN0IHViaWZzX2luZm8gKmMsIHZvaWQgKm0xLCB2
b2lkICptMikKPiAgIHsKPiAgIAlpbnQgcmV0Owo+ICAgCWludCBiZWhpbmQ7Cj4gQEAgLTYxLDIw
ICs2NSwxMSBAQCBpbnQgdWJpZnNfY29tcGFyZV9tYXN0ZXJfbm9kZShzdHJ1Y3QgdWJpZnNfaW5m
byAqYywgdm9pZCAqbTEsIHZvaWQgKm0yKQo+ICAgICoKPiAgICAqIFJldHVybnMgMCBpZiB0aGUg
aGFzaGVzIGFyZSBlcXVhbCwgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG90aGVyd2lzZS4KPiAgICAq
Lwo+IC1zdGF0aWMgaW50IG1zdF9ub2RlX2NoZWNrX2hhc2goY29uc3Qgc3RydWN0IHViaWZzX2lu
Zm8gKmMsCj4gLQkJCSAgICAgICBjb25zdCBzdHJ1Y3QgdWJpZnNfbXN0X25vZGUgKm1zdCwKPiAt
CQkJICAgICAgIGNvbnN0IHU4ICpleHBlY3RlZCkKPiArc3RhdGljIGludCBtc3Rfbm9kZV9jaGVj
a19oYXNoKF9fdW51c2VkIGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLAo+ICsJCQkgICAgICAg
X191bnVzZWQgY29uc3Qgc3RydWN0IHViaWZzX21zdF9ub2RlICptc3QsCj4gKwkJCSAgICAgICBf
X3VudXNlZCBjb25zdCB1OCAqZXhwZWN0ZWQpCj4gICB7Cj4gLQl1OCBjYWxjW1VCSUZTX01BWF9I
QVNIX0xFTl07Cj4gLQljb25zdCB2b2lkICpub2RlID0gbXN0Owo+IC0KPiAtCWNyeXB0b19zaGFz
aF90Zm1fZGlnZXN0KGMtPmhhc2hfdGZtLCBub2RlICsgc2l6ZW9mKHN0cnVjdCB1Ymlmc19jaCks
Cj4gLQkJCQlVQklGU19NU1RfTk9ERV9TWiAtIHNpemVvZihzdHJ1Y3QgdWJpZnNfY2gpLAo+IC0J
CQkJY2FsYyk7Cj4gLQo+IC0JaWYgKHViaWZzX2NoZWNrX2hhc2goYywgZXhwZWN0ZWQsIGNhbGMp
KQo+IC0JCXJldHVybiAtRVBFUk07Cj4gLQo+ICsJLy8gVG8gYmUgaW1wbGVtZW50ZWQKPiAgIAly
ZXR1cm4gMDsKPiAgIH0KPiAgIAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
