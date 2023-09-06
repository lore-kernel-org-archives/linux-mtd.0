Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D99AEB8FAE
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 02:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzFmNIlCgRFdbdxI3s2y9HQbRCvMMjWa8it2bPSSvzM=; b=qMVXxyDgtJG6PZJ6n5HJQgu5lG
	j3Z2+KSenOWrbswbgHJZO/tBMm84MyfmErw2hXtZ3Z1l1bijORZ/TC7BZVaQ/mvY0ZXC83H40Txqa
	pkJwF6QV7Lny4NYED2Ro492u17azpnY/g0FIVHmlL/6XYs5Pv5sOMg8IxKIL8vj4olq7/BuzyPs8I
	HtemR9xD4puh3fHAw2lS5x8dhrGDcpOYQD6/XL6kxnm1Ba7dXxnXQ9Qr57AVLU2FyQ6ASpwnHjbmG
	fTiD/LrgpJcaXHG6O0V+jEyTH8DoZPV0k2ovZQHb1Rf61yjGEFRJvsp+Z5Q56ZK23DuQnsyn4PKLJ
	F75Zaxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdiUn-0075Xv-1l;
	Wed, 06 Sep 2023 02:42:21 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdiUj-0075WL-2o
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 02:42:20 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RgRPc3PmczhZFw
	for <linux-mtd@lists.infradead.org>; Wed,  6 Sep 2023 10:38:12 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 6 Sep 2023 10:42:10 +0800
Subject: Re: Can't find correct configuration
To: Leon Pollak <leon.pollak@gmail.com>, <linux-mtd@lists.infradead.org>
References: <CAM===sRg0v6_1xDjv7BxRFLMQTsj3z8-C_uO5Jh3ZDdWk_mEsA@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <dd4b7c09-64cf-4041-4dad-cd3d43340f98@huawei.com>
Date: Wed, 6 Sep 2023 10:42:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAM===sRg0v6_1xDjv7BxRFLMQTsj3z8-C_uO5Jh3ZDdWk_mEsA@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_194218_252532_F1B70FA2 
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

1NogMjAyMy85LzUgMjI6NDUsIExlb24gUG9sbGFrINC0tcA6CkhpCj4gSGVsbG8sIGFsbC4KPiBJ
IHdpbGwgYmUgdmVyeSB2ZXJ5IHRoYW5rZnVsIGZvciB0aGUgaGVscCB0byBmaW5kIHRoZSBjb3Jy
ZWN0Cj4gY29uZmlndXJhdGlvbiBmb3IgbXkgTkFORC4KPiBJIHBhc3NlZCB0aHJvdWdoIGEgbG90
IG9mIG1haWxzIGluIHRoZSBsaXN0cyBhbmQgZ29vZ2xlIGFuZCBDaGF0R1BUIC0KPiBubyBzdWNj
ZXNzLgo+IEkgaGF2ZSAyNTZNQiBOQU5EIGFuZCAyNDhNQiBwYXJ0aXRpb24gZm9yIFVCSUZTLiBJ
IHJ1bjoKPiBta2ZzLnViaWZzIC12IC1yIHJvb3RmcyAtRiAtbSAyMDQ4IC1lIDEyNjk3NiAtYyAx
OTgxIC1vIC4vdWJpZnMuaW1nCj4gdWJpbml6ZSAtdiAtbyByb290ZnMuaW1nIC1tIDIwNDggLXAg
MTI4S2lCIC1zIDUxMiAtTyAyMDQ4IHViaW5pemUuY2ZnCj4gLS0tLS0KPiBhbmQgdWJpbml6ZS5j
ZmcgbG9va3MgbGlrZToKPiBbdWJpZnNdCj4gbW9kZT11YmkKPiBpbWFnZT0uL3ViaWZzLmltZwo+
IHZvbF9pZD0wCj4gdm9sX3NpemU9MjQwTWlCCj4gdm9sX3R5cGU9ZHluYW1pYwo+IHZvbF9uYW1l
PXViaV9yb290ZnMKPiB2b2xfYWxpZ25tZW50PTEKPiB2b2xfZmxhZ3M9YXV0b3Jlc2l6ZQo+IC0t
LS0tLQo+IEtlcm5lbCBjb25maWd1cmF0aW9uICB3YXMgd2l0aCBDT05GSUdfTVREX1VCSV9CRUJf
TElNSVQ9MjAuCj4gYW5kIGhlcmUgaXMgdGhlIGtlcm5lbCBsb2c6Cj4gWyAgICAyLjY5NTY1OV0g
dWJpMDogYXR0YWNoaW5nIG10ZDQKPiBbICAgIDMuMzcyMzQzXSB1YmkwOiBzY2FubmluZyBpcyBm
aW5pc2hlZAo+IFsgICAgMy4zODMwNjZdIHViaTAgd2FybmluZzogdWJpX2ViYV9pbml0OiBjYW5u
b3QgcmVzZXJ2ZSBlbm91Z2ggUEVCcwo+IGZvciBiYWQgUEVCIGhhbmRsaW5nLCByZXNlcnZlZCA0
LCBuZWVkIDQwCj4gWyAgICAzLjQwNDMyMF0gdWJpMDogdm9sdW1lIDAgKCJ1Ymlfcm9vdGZzIikg
cmUtc2l6ZWQgZnJvbSAxOTgyIHRvIDE5ODIgTEVCcwo+IFsgICAgMy40MTE2NjddIHViaTA6IGF0
dGFjaGVkIG10ZDQgKG5hbWUgIkZTIiwgc2l6ZSAyNDggTWlCKQo+IFsgICAgMy40MTcwOTVdIHVi
aTA6IFBFQiBzaXplOiAxMzEwNzIgYnl0ZXMgKDEyOCBLaUIpLCBMRUIgc2l6ZTogMTI2OTc2IGJ5
dGVzCj4gWyAgICAzLjQyNDAwNl0gdWJpMDogbWluLi9tYXguIEkvTyB1bml0IHNpemVzOiAyMDQ4
LzIwNDgsIHN1Yi1wYWdlIHNpemUgNTEyCj4gWyAgICAzLjQzMDc0MF0gdWJpMDogVklEIGhlYWRl
ciBvZmZzZXQ6IDIwNDggKGFsaWduZWQgMjA0OCksIGRhdGEgb2Zmc2V0OiA0MDk2Cj4gWyAgICAz
LjQzNzczNF0gdWJpMDogZ29vZCBQRUJzOiAxOTkwLCBiYWQgUEVCczogMCwgY29ycnVwdGVkIFBF
QnM6IDAKPiBbICAgIDMuNDQzODYwXSB1YmkwOiB1c2VyIHZvbHVtZTogMSwgaW50ZXJuYWwgdm9s
dW1lczogMSwgbWF4LiB2b2x1bWVzCj4gY291bnQ6IDEyOAo+IFsgICAgMy40NTExMTddIHViaTA6
IG1heC9tZWFuIGVyYXNlIGNvdW50ZXI6IDEvMCwgV0wgdGhyZXNob2xkOiA0MDk2LAo+IGltYWdl
IHNlcXVlbmNlIG51bWJlcjogMTU5MDU3MDA3Mwo+IFsgICAgMy40NjAyOTVdIHViaTA6IGF2YWls
YWJsZSBQRUJzOiAwLCB0b3RhbCByZXNlcnZlZCBQRUJzOiAxOTkwLAo+IFBFQnMgcmVzZXJ2ZWQg
Zm9yIGJhZCBQRUIgaGFuZGxpbmc6IDQKPiBbICAgIDMuNDY5NTc1XSB1YmkwOiBiYWNrZ3JvdW5k
IHRocmVhZCAidWJpX2JndDBkIiBzdGFydGVkLCBQSUQgMTMxCj4gWyAgICA0LjY0ODcxOF0gVUJJ
RlMgKHViaTA6MCk6IGJhY2tncm91bmQgdGhyZWFkICJ1Ymlmc19iZ3QwXzAiIHN0YXJ0ZWQsIFBJ
RCAxMzYKPiBbICAgIDQuNjc2NjQwXSBVQklGUyAodWJpMDowKTogc3RhcnQgZml4aW5nIHVwIGZy
ZWUgc3BhY2UKPiBbICAgMTAuMjUwMDk5XSBVQklGUyAodWJpMDowKTogZnJlZSBzcGFjZSBmaXh1
cCBjb21wbGV0ZQo+IFsgICAxMC4yNjkwNDZdIFVCSUZTICh1YmkwOjApOiBVQklGUzogbW91bnRl
ZCBVQkkgZGV2aWNlIDAsIHZvbHVtZSAwLAo+IG5hbWUgInViaV9yb290ZnMiCj4gWyAgIDEwLjI3
NjgzMF0gVUJJRlMgKHViaTA6MCk6IExFQiBzaXplOiAxMjY5NzYgYnl0ZXMgKDEyNCBLaUIpLAo+
IG1pbi4vbWF4LiBJL08gdW5pdCBzaXplczogMjA0OCBieXRlcy8yMDQ4IGJ5dGVzCj4gWyAgIDEw
LjI4Njc5NF0gVUJJRlMgKHViaTA6MCk6IEZTIHNpemU6IDI1MDE0MjcyMCBieXRlcyAoMjM4IE1p
QiwgMTk3MAo+IExFQnMpLCBqb3VybmFsIHNpemUgOTAyMzQ4OCBieXRlcyAoOCBNaUIsIDcyIExF
QnMpCj4gWyAgIDEwLjI5NzU0MF0gVUJJRlMgKHViaTA6MCk6IHJlc2VydmVkIGZvciByb290OiAw
IGJ5dGVzICgwIEtpQikKPiBbICAgMTAuMzAzNDA2XSBVQklGUyAodWJpMDowKTogbWVkaWEgZm9y
bWF0OiB3NC9yMCAobGF0ZXN0IGlzIHc1L3IwKSwKPiBVVUlEIEExNEQ1ODZBLTMyRTItNDVENy1B
MDdFLUJEQzQ3MkZERjMxRCwgc21hbGwgTFBUIG1vZGVsCj4gCj4gTXkgcXVlc3Rpb24gaXM6IHdo
eSBkb2VzIHRoaXMgd2FybmluZyBhYm91dCByZXNlcnZlZCA0LCBuZWVkZWQgNDAKPiBhcHBlYXI/
IEhvdyBjYW4gSSBzb2x2ZSB0aGlzPwo+IAoKU29sdXRpb246IE1vZGlmeSB1YmluaXplLmNmZywg
IHZvbF9zaXplPTI0ME1pQiAtPiB2b2xfc2l6ZT0yMzVNaUIKCldoeSBkb2VzIHRoaXMgd2Fybmlu
ZyBhYm91dCByZXNlcnZlZCA0LCBuZWVkZWQgNDAgYXBwZWFyPwpUaGUgY291bnQgb2YgYmFkIFBF
QnMgcmVzZXJ2ZWQgYnkgVUJJIGlzOiB0b3RhbF9wZWJzKG5hbmQgY2hpcCkgKiAKQ09ORklHX01U
RF9VQklfQkVCX0xJTUlULzEwMjQgPSAyMDQ4ICogIDIwIC8gMTAyNCA9IDQwCldoZW4gZmFzdG1h
cCBpcyBub3QgZW5hYmxlZCwgdGhlIGNvdW50IG9mIGludGVybmFsIFBFQnMgcmVzZXJ2ZWQgYnkg
VUJJIAppczogVUJJX0xBWU9VVF9WT0xVTUVfRUJTWzJdICsgV0xfUkVTRVJWRURfUEVCU1sxXSAr
IApFQkFfUkVTRVJWRURfUEVCU1sxXSA9IDQKClRvdGFsIFBFQnMgZm9yIFVCSSBpcyAxOTkwKGdv
b2QgUEVCczogMTk5MCksIHRoZSBtYXggY291bnQgb2YgdXNlciAKdm9sdW1lIFBFQnMgaXMgMTk5
MCAtIDQwIC0gNCA9IDE5NDYKCkluIHViaW5pemUuY2ZnLCB2b2xfc2l6ZT0yNDBNaUIsIHRoZSBj
b3VudCBvZiB1c2VyIHZvbHVtZSBQRUJzIGlzKHNlZSAKdWJpbml6ZS5jIGluIG10ZHVpdGxzKTog
dmlfc2l6ZSArIChsZWJfc2l6ZSAtIDEpIC8gbGViX3NpemUKdmlfc2l6ZSA9IDI0ME0gPSAyNDAg
KiAxMDI0ICogMTAyNApsZWJfc2l6ZSA9IDEyOEsgLSAySyhlYykgLSAySyh2aWQpID0gMTI0ICog
MTAyNApyZXN1bHQgPSAxOTgyCgpTbyB0aGVyZSBhcmUgMTk5MCAtIDE5ODIgLSA0ID0gNCBQRUJz
IHJlc2VydmVkIGZvciBiYWQgUEVCIGhhbmRsaW5nLCAKd2hpY2ggaXMgbGVzcyB0aGFuIDQwLgoK
V2hlbiB3ZSBzZXQgIHZvbF9zaXplPTIzNU1pQiwgdGhlIGNvdW50IG9mIHVzZXIgdm9sdW1lIFBF
QnMgaXM6ICgyMzUgKiAKMTAyNCAqIDEwMjQgKyAxMjQgKiAxMDI0IC0gMSkgLyAoMTI0ICogMTAy
NCkgPSAxOTQxCjE5OTAgLSA0IC0gNDAgPSAxOTQ2LCBmaW5hbGx5IG1heWJlIHRoZXJlIGlzIG1l
c3NhZ2UgZnJvbSBrZXJuZWwgbGlrZSAKIigidWJpX3Jvb3RmcyIpIHJlLXNpemVkIGZyb20gMTk0
MSB0byAxOTQ2IExFQnMiLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
