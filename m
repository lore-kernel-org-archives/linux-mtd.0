Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991F0EB8FAD
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 02:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4QVdkOa1WT0pU82L6tmEjNqroaG1EmEKdvffIl/aso=; b=y2Mol/7OcHXxZnpScfELQXuWaI
	RusF/o+gXC8sycpoj9uIZlxq3sHVwsKge6LeK/rY0UbUFFkvfEhI8f85li7Md3RorBTdP87ahV7Nt
	GRCDgxSUckDKBd251TrGdoyaIswFtKhZGrS0NczAFkOWauuLu3CZ2s/sjSYoMPZj6wnlK+mktMAd+
	yjv9Rj9bVrI3Di3hS+iovUR0TrXRUPvAmyaPoE7SS3KTiIq9AUbVZy3TfQmXOZt2VULxYwSGbf6ke
	3M39QfwQRR4rJ8kHpi7Lt7kRWkFFpV3ZJ0801gSnIO4txWwDnOIznOJdmQ6obEanUk9NG0I0pdQ/2
	socMPt4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdicA-0076AD-2d;
	Wed, 06 Sep 2023 02:49:58 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdic7-00768f-0L
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 02:49:57 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RgRc03CdTzVkRP
	for <linux-mtd@lists.infradead.org>; Wed,  6 Sep 2023 10:47:12 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 6 Sep 2023 10:49:48 +0800
Subject: Re: Can't find correct configuration
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: Leon Pollak <leon.pollak@gmail.com>, <linux-mtd@lists.infradead.org>
References: <CAM===sRg0v6_1xDjv7BxRFLMQTsj3z8-C_uO5Jh3ZDdWk_mEsA@mail.gmail.com>
 <dd4b7c09-64cf-4041-4dad-cd3d43340f98@huawei.com>
Message-ID: <52ba4755-ade0-4b4a-f4a2-13160bb6129b@huawei.com>
Date: Wed, 6 Sep 2023 10:49:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <dd4b7c09-64cf-4041-4dad-cd3d43340f98@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_194955_486108_7108C95D 
X-CRM114-Status: GOOD (  15.79  )
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

5ZyoIDIwMjMvOS82IDEwOjQyLCBaaGloYW8gQ2hlbmcg5YaZ6YGTOgo+IOWcqCAyMDIzLzkvNSAy
Mjo0NSwgTGVvbiBQb2xsYWsg5YaZ6YGTOgo+IEhpCj4+IEhlbGxvLCBhbGwuCj4+IEkgd2lsbCBi
ZSB2ZXJ5IHZlcnkgdGhhbmtmdWwgZm9yIHRoZSBoZWxwIHRvIGZpbmQgdGhlIGNvcnJlY3QKPj4g
Y29uZmlndXJhdGlvbiBmb3IgbXkgTkFORC4KPj4gSSBwYXNzZWQgdGhyb3VnaCBhIGxvdCBvZiBt
YWlscyBpbiB0aGUgbGlzdHMgYW5kIGdvb2dsZSBhbmQgQ2hhdEdQVCAtCj4+IG5vIHN1Y2Nlc3Mu
Cj4+IEkgaGF2ZSAyNTZNQiBOQU5EIGFuZCAyNDhNQiBwYXJ0aXRpb24gZm9yIFVCSUZTLiBJIHJ1
bjoKPj4gbWtmcy51YmlmcyAtdiAtciByb290ZnMgLUYgLW0gMjA0OCAtZSAxMjY5NzYgLWMgMTk4
MSAtbyAuL3ViaWZzLmltZwo+PiB1YmluaXplIC12IC1vIHJvb3Rmcy5pbWcgLW0gMjA0OCAtcCAx
MjhLaUIgLXMgNTEyIC1PIDIwNDggdWJpbml6ZS5jZmcKPj4gLS0tLS0KPj4gYW5kIHViaW5pemUu
Y2ZnIGxvb2tzIGxpa2U6Cj4+IFt1Ymlmc10KPj4gbW9kZT11YmkKPj4gaW1hZ2U9Li91Ymlmcy5p
bWcKPj4gdm9sX2lkPTAKPj4gdm9sX3NpemU9MjQwTWlCCj4+IHZvbF90eXBlPWR5bmFtaWMKPj4g
dm9sX25hbWU9dWJpX3Jvb3Rmcwo+PiB2b2xfYWxpZ25tZW50PTEKPj4gdm9sX2ZsYWdzPWF1dG9y
ZXNpemUKPj4gLS0tLS0tCj4+IEtlcm5lbCBjb25maWd1cmF0aW9uwqAgd2FzIHdpdGggQ09ORklH
X01URF9VQklfQkVCX0xJTUlUPTIwLgo+PiBhbmQgaGVyZSBpcyB0aGUga2VybmVsIGxvZzoKPj4g
W8KgwqDCoCAyLjY5NTY1OV0gdWJpMDogYXR0YWNoaW5nIG10ZDQKPj4gW8KgwqDCoCAzLjM3MjM0
M10gdWJpMDogc2Nhbm5pbmcgaXMgZmluaXNoZWQKPj4gW8KgwqDCoCAzLjM4MzA2Nl0gdWJpMCB3
YXJuaW5nOiB1YmlfZWJhX2luaXQ6IGNhbm5vdCByZXNlcnZlIGVub3VnaCBQRUJzCj4+IGZvciBi
YWQgUEVCIGhhbmRsaW5nLCByZXNlcnZlZCA0LCBuZWVkIDQwCj4+IFvCoMKgwqAgMy40MDQzMjBd
IHViaTA6IHZvbHVtZSAwICgidWJpX3Jvb3RmcyIpIHJlLXNpemVkIGZyb20gMTk4MiB0byAKPj4g
MTk4MiBMRUJzCj4+IFvCoMKgwqAgMy40MTE2NjddIHViaTA6IGF0dGFjaGVkIG10ZDQgKG5hbWUg
IkZTIiwgc2l6ZSAyNDggTWlCKQo+PiBbwqDCoMKgIDMuNDE3MDk1XSB1YmkwOiBQRUIgc2l6ZTog
MTMxMDcyIGJ5dGVzICgxMjggS2lCKSwgTEVCIHNpemU6IAo+PiAxMjY5NzYgYnl0ZXMKPj4gW8Kg
wqDCoCAzLjQyNDAwNl0gdWJpMDogbWluLi9tYXguIEkvTyB1bml0IHNpemVzOiAyMDQ4LzIwNDgs
IHN1Yi1wYWdlIAo+PiBzaXplIDUxMgo+PiBbwqDCoMKgIDMuNDMwNzQwXSB1YmkwOiBWSUQgaGVh
ZGVyIG9mZnNldDogMjA0OCAoYWxpZ25lZCAyMDQ4KSwgZGF0YSAKPj4gb2Zmc2V0OiA0MDk2Cj4+
IFvCoMKgwqAgMy40Mzc3MzRdIHViaTA6IGdvb2QgUEVCczogMTk5MCwgYmFkIFBFQnM6IDAsIGNv
cnJ1cHRlZCBQRUJzOiAwCj4+IFvCoMKgwqAgMy40NDM4NjBdIHViaTA6IHVzZXIgdm9sdW1lOiAx
LCBpbnRlcm5hbCB2b2x1bWVzOiAxLCBtYXguIHZvbHVtZXMKPj4gY291bnQ6IDEyOAo+PiBbwqDC
oMKgIDMuNDUxMTE3XSB1YmkwOiBtYXgvbWVhbiBlcmFzZSBjb3VudGVyOiAxLzAsIFdMIHRocmVz
aG9sZDogNDA5NiwKPj4gaW1hZ2Ugc2VxdWVuY2UgbnVtYmVyOiAxNTkwNTcwMDczCj4+IFvCoMKg
wqAgMy40NjAyOTVdIHViaTA6IGF2YWlsYWJsZSBQRUJzOiAwLCB0b3RhbCByZXNlcnZlZCBQRUJz
OiAxOTkwLAo+PiBQRUJzIHJlc2VydmVkIGZvciBiYWQgUEVCIGhhbmRsaW5nOiA0Cj4+IFvCoMKg
wqAgMy40Njk1NzVdIHViaTA6IGJhY2tncm91bmQgdGhyZWFkICJ1YmlfYmd0MGQiIHN0YXJ0ZWQs
IFBJRCAxMzEKPj4gW8KgwqDCoCA0LjY0ODcxOF0gVUJJRlMgKHViaTA6MCk6IGJhY2tncm91bmQg
dGhyZWFkICJ1Ymlmc19iZ3QwXzAiIAo+PiBzdGFydGVkLCBQSUQgMTM2Cj4+IFvCoMKgwqAgNC42
NzY2NDBdIFVCSUZTICh1YmkwOjApOiBzdGFydCBmaXhpbmcgdXAgZnJlZSBzcGFjZQo+PiBbwqDC
oCAxMC4yNTAwOTldIFVCSUZTICh1YmkwOjApOiBmcmVlIHNwYWNlIGZpeHVwIGNvbXBsZXRlCj4+
IFvCoMKgIDEwLjI2OTA0Nl0gVUJJRlMgKHViaTA6MCk6IFVCSUZTOiBtb3VudGVkIFVCSSBkZXZp
Y2UgMCwgdm9sdW1lIDAsCj4+IG5hbWUgInViaV9yb290ZnMiCj4+IFvCoMKgIDEwLjI3NjgzMF0g
VUJJRlMgKHViaTA6MCk6IExFQiBzaXplOiAxMjY5NzYgYnl0ZXMgKDEyNCBLaUIpLAo+PiBtaW4u
L21heC4gSS9PIHVuaXQgc2l6ZXM6IDIwNDggYnl0ZXMvMjA0OCBieXRlcwo+PiBbwqDCoCAxMC4y
ODY3OTRdIFVCSUZTICh1YmkwOjApOiBGUyBzaXplOiAyNTAxNDI3MjAgYnl0ZXMgKDIzOCBNaUIs
IDE5NzAKPj4gTEVCcyksIGpvdXJuYWwgc2l6ZSA5MDIzNDg4IGJ5dGVzICg4IE1pQiwgNzIgTEVC
cykKPj4gW8KgwqAgMTAuMjk3NTQwXSBVQklGUyAodWJpMDowKTogcmVzZXJ2ZWQgZm9yIHJvb3Q6
IDAgYnl0ZXMgKDAgS2lCKQo+PiBbwqDCoCAxMC4zMDM0MDZdIFVCSUZTICh1YmkwOjApOiBtZWRp
YSBmb3JtYXQ6IHc0L3IwIChsYXRlc3QgaXMgdzUvcjApLAo+PiBVVUlEIEExNEQ1ODZBLTMyRTIt
NDVENy1BMDdFLUJEQzQ3MkZERjMxRCwgc21hbGwgTFBUIG1vZGVsCj4+Cj4+IE15IHF1ZXN0aW9u
IGlzOiB3aHkgZG9lcyB0aGlzIHdhcm5pbmcgYWJvdXQgcmVzZXJ2ZWQgNCwgbmVlZGVkIDQwCj4+
IGFwcGVhcj8gSG93IGNhbiBJIHNvbHZlIHRoaXM/Cj4+Cj4gCj4gU29sdXRpb246IE1vZGlmeSB1
YmluaXplLmNmZyzCoCB2b2xfc2l6ZT0yNDBNaUIgLT4gdm9sX3NpemU9MjM1TWlCCj4gCj4gV2h5
IGRvZXMgdGhpcyB3YXJuaW5nIGFib3V0IHJlc2VydmVkIDQsIG5lZWRlZCA0MCBhcHBlYXI/Cj4g
VGhlIGNvdW50IG9mIGJhZCBQRUJzIHJlc2VydmVkIGJ5IFVCSSBpczogdG90YWxfcGVicyhuYW5k
IGNoaXApICogCj4gQ09ORklHX01URF9VQklfQkVCX0xJTUlULzEwMjQgPSAyMDQ4ICrCoCAyMCAv
IDEwMjQgPSA0MAo+IFdoZW4gZmFzdG1hcCBpcyBub3QgZW5hYmxlZCwgdGhlIGNvdW50IG9mIGlu
dGVybmFsIFBFQnMgcmVzZXJ2ZWQgYnkgVUJJIAo+IGlzOiBVQklfTEFZT1VUX1ZPTFVNRV9FQlNb
Ml0gKyBXTF9SRVNFUlZFRF9QRUJTWzFdICsgCj4gRUJBX1JFU0VSVkVEX1BFQlNbMV0gPSA0Cj4g
Cj4gVG90YWwgUEVCcyBmb3IgVUJJIGlzIDE5OTAoZ29vZCBQRUJzOiAxOTkwKSwgdGhlIG1heCBj
b3VudCBvZiB1c2VyIAo+IHZvbHVtZSBQRUJzIGlzIDE5OTAgLSA0MCAtIDQgPSAxOTQ2Cj4gCj4g
SW4gdWJpbml6ZS5jZmcsIHZvbF9zaXplPTI0ME1pQiwgdGhlIGNvdW50IG9mIHVzZXIgdm9sdW1l
IFBFQnMgaXMoc2VlIAo+IHViaW5pemUuYyBpbiBtdGR1aXRscyk6IHZpX3NpemUgKyAobGViX3Np
emUgLSAxKSAvIGxlYl9zaXplCj4gdmlfc2l6ZSA9IDI0ME0gPSAyNDAgKiAxMDI0ICogMTAyNAo+
IGxlYl9zaXplID0gMTI4SyAtIDJLKGVjKSAtIDJLKHZpZCkgPSAxMjQgKiAxMDI0Cj4gcmVzdWx0
ID0gMTk4Mgo+IAo+IFNvIHRoZXJlIGFyZSAxOTkwIC0gMTk4MiAtIDQgPSA0IFBFQnMgcmVzZXJ2
ZWQgZm9yIGJhZCBQRUIgaGFuZGxpbmcsIAo+IHdoaWNoIGlzIGxlc3MgdGhhbiA0MC4KPiAKPiBX
aGVuIHdlIHNldMKgIHZvbF9zaXplPTIzNU1pQiwgdGhlIGNvdW50IG9mIHVzZXIgdm9sdW1lIFBF
QnMgaXM6ICgyMzUgKiAKPiAxMDI0ICogMTAyNCArIDEyNCAqIDEwMjQgLSAxKSAvICgxMjQgKiAx
MDI0KSA9IDE5NDEKPiAxOTkwIC0gNCAtIDQwID0gMTk0NiwgZmluYWxseSBtYXliZSB0aGVyZSBp
cyBtZXNzYWdlIGZyb20ga2VybmVsIGxpa2UgCj4gIigidWJpX3Jvb3RmcyIpIHJlLXNpemVkIGZy
b20gMTk0MSB0byAxOTQ2IExFQnMiLgoKQWN1dGFsbHksIHRoZSAndm9sX3NpemUnIGluIHViaW5p
emUuY2ZnIG1lYW5zIHRoZSBzaXplIG9mIGRhdGEgb24gCnZvbHVtZShleGNsdWRlIHZpZC9lYyks
IG5vdCB0aGUgc2l6ZSBvZiB2b2x1bWUoaW5jbHVkZSB2aWQvZWMpLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
