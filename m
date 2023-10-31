Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950D3C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Oct 2023 04:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFayxNgGYONYQ3Q7AzlRtXrzTaKHhNgRZY2sXuqqbL0=; b=bbP4vjptkiLihWSwgRmq5g6+yf
	Lui4EOs7fjOgNZcklju+UVZEfdXkCZXEHv9AK6vrU00ZzwHz3slantkxaA5kdVWDvVfwY1YCCtrj3
	nLu7gjqnGugy6iY/LCPmRYuOj8qlOhCjXUVEalGedJg12+p1F6QevB5reM1FkEA7fEtzHBBwcvnVa
	50SW0Gcqey8lPsIOlvc+UzoDsMTRrqgvQZybAdFHLiCMjSk+IOeiKu682aPlGsepn5wBrXzVEycNO
	KQfhbOmBifT7B41xCj8eBF4RgeRNNIZxF+R/v9eZ8IvswVvxMVBXGYeiG/R7Sf8UwNWomRdEqAayU
	P1TkZP6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxg7F-004VLt-0D;
	Tue, 31 Oct 2023 04:12:33 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxg7A-004VLI-2d
	for linux-mtd@lists.infradead.org;
	Tue, 31 Oct 2023 04:12:31 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4SKGq31cZRz1P7cB;
	Tue, 31 Oct 2023 12:09:03 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 31 Oct 2023 12:12:02 +0800
Subject: Re: [PATCH] ubifs: use crypto_shash_tfm_digest() in ubifs_hmac_wkm()
To: Eric Biggers <ebiggers@kernel.org>, Richard Weinberger <richard@nod.at>,
	<linux-mtd@lists.infradead.org>
CC: <linux-crypto@vger.kernel.org>
References: <20231029050355.154989-1-ebiggers@kernel.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <1811bc93-cf3f-460f-cadf-3cca7537bd53@huawei.com>
Date: Tue, 31 Oct 2023 12:11:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231029050355.154989-1-ebiggers@kernel.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_211229_036579_99CA1E87 
X-CRM114-Status: GOOD (  18.51  )
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

1NogMjAyMy8xMC8yOSAxMzowMywgRXJpYyBCaWdnZXJzINC0tcA6Cj4gRnJvbTogRXJpYyBCaWdn
ZXJzIDxlYmlnZ2Vyc0Bnb29nbGUuY29tPgo+Cj4gU2ltcGxpZnkgdWJpZnNfaG1hY193a20oKSBi
eSB1c2luZyBjcnlwdG9fc2hhc2hfdGZtX2RpZ2VzdCgpIGluc3RlYWQgb2YKPiBhbiBhbGxvYytp
bml0K3VwZGF0ZStmaW5hbCBzZXF1ZW5jZS4gIFRoaXMgc2hvdWxkIGFsc28gaW1wcm92ZQo+IHBl
cmZvcm1hbmNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0Bnb29n
bGUuY29tPgo+IC0tLQo+ICAgZnMvdWJpZnMvYXV0aC5jIHwgMTkgKystLS0tLS0tLS0tLS0tLS0t
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpU
ZXN0ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+CgpUaW1lIGNv
c3Qgb2YgdWJpZnNfaG1hY193a20odW5pdDogdXMpOgoKQmVmb3JlOiAzODF+MTYzNAoKQWZ0ZXI6
Mjc4fjE1MzkKCj4KPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvYXV0aC5jIGIvZnMvdWJpZnMvYXV0
aC5jCj4gaW5kZXggZTU2NGQ1ZmY4NzgxLi40YWRkNGE0ZjA3MjAgMTAwNjQ0Cj4gLS0tIGEvZnMv
dWJpZnMvYXV0aC5jCj4gKysrIGIvZnMvdWJpZnMvYXV0aC5jCj4gQEAgLTUwMSw0MiArNTAxLDI3
IEBAIGludCBfX3ViaWZzX3NoYXNoX2NvcHlfc3RhdGUoY29uc3Qgc3RydWN0IHViaWZzX2luZm8g
KmMsIHN0cnVjdCBzaGFzaF9kZXNjICpzcmMsCj4gICAgKgo+ICAgICogVGhpcyBmdW5jdGlvbiBj
cmVhdGVzIGEgSE1BQyBvZiBhIHdlbGwga25vd24gbWVzc2FnZS4gVGhpcyBpcyB1c2VkCj4gICAg
KiB0byBjaGVjayBpZiB0aGUgcHJvdmlkZWQga2V5IGlzIHN1aXRhYmxlIHRvIGF1dGhlbnRpY2F0
ZSBhIFVCSUZTCj4gICAgKiBpbWFnZS4gVGhpcyBpcyBvbmx5IGEgY29udmVuaWVuY2UgdG8gdGhl
IHVzZXIgdG8gcHJvdmlkZSBhIGJldHRlcgo+ICAgICogZXJyb3IgbWVzc2FnZSB3aGVuIHRoZSB3
cm9uZyBrZXkgaXMgcHJvdmlkZWQuCj4gICAgKgo+ICAgICogVGhpcyBmdW5jdGlvbiByZXR1cm5z
IDAgZm9yIHN1Y2Nlc3Mgb3IgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG90aGVyd2lzZS4KPiAgICAq
Lwo+ICAgaW50IHViaWZzX2htYWNfd2ttKHN0cnVjdCB1Ymlmc19pbmZvICpjLCB1OCAqaG1hYykK
PiAgIHsKPiAtCVNIQVNIX0RFU0NfT05fU1RBQ0soc2hhc2gsIGMtPmhtYWNfdGZtKTsKPiAtCWlu
dCBlcnI7Cj4gICAJY29uc3QgY2hhciB3ZWxsX2tub3duX21lc3NhZ2VbXSA9ICJVQklGUyI7Cj4g
ICAKPiAgIAlpZiAoIXViaWZzX2F1dGhlbnRpY2F0ZWQoYykpCj4gICAJCXJldHVybiAwOwo+ICAg
Cj4gLQlzaGFzaC0+dGZtID0gYy0+aG1hY190Zm07Cj4gLQo+IC0JZXJyID0gY3J5cHRvX3NoYXNo
X2luaXQoc2hhc2gpOwo+IC0JaWYgKGVycikKPiAtCQlyZXR1cm4gZXJyOwo+IC0KPiAtCWVyciA9
IGNyeXB0b19zaGFzaF91cGRhdGUoc2hhc2gsIHdlbGxfa25vd25fbWVzc2FnZSwKPiAtCQkJCSAg
c2l6ZW9mKHdlbGxfa25vd25fbWVzc2FnZSkgLSAxKTsKPiAtCWlmIChlcnIgPCAwKQo+IC0JCXJl
dHVybiBlcnI7Cj4gLQo+IC0JZXJyID0gY3J5cHRvX3NoYXNoX2ZpbmFsKHNoYXNoLCBobWFjKTsK
PiAtCWlmIChlcnIpCj4gLQkJcmV0dXJuIGVycjsKPiAtCXJldHVybiAwOwo+ICsJcmV0dXJuIGNy
eXB0b19zaGFzaF90Zm1fZGlnZXN0KGMtPmhtYWNfdGZtLCB3ZWxsX2tub3duX21lc3NhZ2UsCj4g
KwkJCQkgICAgICAgc2l6ZW9mKHdlbGxfa25vd25fbWVzc2FnZSkgLSAxLCBobWFjKTsKPiAgIH0K
PiAgIAo+ICAgLyoKPiAgICAqIHViaWZzX2htYWNfemVybyAtIHRlc3QgaWYgYSBITUFDIGlzIHpl
cm8KPiAgICAqIEBjOiBVQklGUyBmaWxlLXN5c3RlbSBkZXNjcmlwdGlvbiBvYmplY3QKPiAgICAq
IEBobWFjOiB0aGUgSE1BQyB0byB0ZXN0Cj4gICAgKgo+ICAgICogVGhpcyBmdW5jdGlvbiB0ZXN0
cyBpZiBhIEhNQUMgaXMgemVybyBhbmQgcmV0dXJucyB0cnVlIGlmIGl0IGlzCj4gICAgKiBhbmQg
ZmFsc2Ugb3RoZXJ3aXNlLgo+ICAgICovCj4KPiBiYXNlLWNvbW1pdDogMmFmOWIyMGRiYjM5ZjZl
YmY5YjliNmMwOTAyNzE1OTQ2MjdkODE4ZQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
