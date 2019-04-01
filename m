Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0E5C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 09:27:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8C5A206BA
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 09:27:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nL5wyorp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8C5A206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fuwSS5/qrevGD/dvixTyxIZW3dh8riwNqtGHK7zA/E=; b=nL5wyorp0MERq8
	sLvKlayLzDnmLLvuPdi4K8FspvpBtePKTfNzRHyIgWbRlmqt53drCvzAKD+GSXRnD/Fkl65JUl/gv
	Fa8xrVnBllhxKqtONTRdS2vLs5mBMBkz0fxg0adwSScfNaxS1Qj792APsxqX3g1fR+8Sjbhh5WuQI
	emXbC2m7R3Iw1v8joA0JYiL7o6M7XwVN/MU+KO70I3ZNppXk0WYo64gTpfnZT1xWzQjn5toiRgdU2
	4TrfodD1kwJlLOyFPYE/6+IbqgeNVLqAFytMeT2BKTUqKtW5Wcuqe9hsNqaa9z/LCZf6lMfT/KYJn
	FG5wL27argqlRrAvdjew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAtES-0007Bm-Ft; Mon, 01 Apr 2019 09:27:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAtEP-0007Al-36
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 09:27:54 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 376C22808DA;
 Mon,  1 Apr 2019 10:27:51 +0100 (BST)
Date: Mon, 1 Apr 2019 11:27:48 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Zhuohao Lee <zhuohao@chromium.org>
Subject: Re: [PATCH v1] mtd: core: add sysfs nodes for querying the flash
 name and id
Message-ID: <20190401112748.4a3d5539@collabora.com>
In-Reply-To: <20190328045910.98250-1-zhuohao@chromium.org>
References: <20190328045910.98250-1-zhuohao@chromium.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_022753_394733_B530C05A 
X-CRM114-Status: GOOD (  21.76  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: drinkcat@chromium.org, bbrezillon@kernel.org, richard@nod.at,
 briannorris@chromium.org, marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyOCBNYXIgMjAxOSAxMjo1OToxMCArMDgwMApaaHVvaGFvIExlZSA8emh1b2hhb0Bj
aHJvbWl1bS5vcmc+IHdyb3RlOgoKPiBDdXJyZW50bHksIHdlIGRvbid0IGhhdmUgc3lzZnMgbm9k
ZXMgZm9yIHF1ZXJ5aW5nIHRoZSB1bmRlcmx5aW5nIGZsYXNoCj4gbmFtZSBhbmQgZmxhc2ggaWQu
IFRoaXMgaW5mb3JtYXRpb24gaXMgaW1wb3J0YW50IGVzcGVjaWFsbHkgd2hlbiB3ZQo+IHdhbnQg
dG8ga25vdyB0aGUgZmxhc2ggZGV0YWlsIG9mIHRoZSBkZWZlY3RpdmUgc3lzdGVtLiBJbiBvcmRl
ciB0bwo+IHN1cHBvcnQgdGhlIHF1ZXJ5LCB3ZSBhZGQgdHdvIHBvaW50ZXJzICgqZmxhc2huYW1l
LCAqaWQpIGludG8gdGhlCj4gbXRkX2luZm8gc3RydWN0dXJlIGFuZCBjcmVhdGUgdHdvIHN5c2Zz
IG5vZGVzIChmbGFzaG5hbWUsIGlkKS4gVGhpcwo+IHBhdGNoIGlzIG1vZGlmaWVkIGJhc2VkIG9u
IHRoZSBTUEktTk9SIGZsYXNoIHN5c3RlbSBhcyB3ZSBvbmx5IGhhdmUKPiB0aGF0IHN5c3RlbSBu
b3cuIEJ1dCB0aGUgaWRlYSBzaG91bGQgYmUgYXBwbGllZCB0byB0aGUgb3RoZXIgZmxhc2gKPiBk
cml2ZXIgbGlrZSBOQU5EIGZsYXNoLgo+IAo+IFRoZSBvdXRwdXQgb2YgbmV3IHN5c2ZzIG5vZGVz
IG9uIG15IGRldmljZSBhcmU6Cj4gY2F0IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvMTEwMTAw
MDAuc3BpL3NwaV9tYXN0ZXIvc3BpMS9zcGkxLjAvbXRkL210ZDAvZmxhc2huYW1lCj4gdzI1cTY0
ZHcKPiBjYXQgL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy8xMTAxMDAwMC5zcGkvc3BpX21hc3Rl
ci9zcGkxL3NwaTEuMC9tdGQvbXRkMC9pZAo+IGVmNjAxNwoKSSdtIG5vdCBzdXJlIEkgbGlrZSB0
aGUgaWRlYSBvZiBleHBvc2luZyB0aGlzIGtpbmQgb2YgaW5mbyB0aHJvdWdoCnN5c2ZzIGFzIGl0
IHRoZW4gbWFrZXMgcGFydCBvZiB0aGUgQUJJLiBEaWQgeW91IGNvbnNpZGVyIGV4cG9zaW5nIHRo
YXQKdGhyb3VnaCBkZWJ1Z2ZzPwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBaaHVvaGFvIExlZSA8emh1
b2hhb0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL210ZGNvcmUuYyAgICAgICAg
IHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3Bp
LW5vci5jIHwgIDMgKysrCj4gIGluY2x1ZGUvbGludXgvbXRkL210ZC5oICAgICAgIHwgIDMgKysr
Cj4gIDMgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiBpbmRleCAzZWYw
MWJhZWY5YjYuLmRjYmU2NzE5YWQ2NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRjb3Jl
LmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiBAQCAtMjQxLDYgKzI0MSwyOCBAQCBz
dGF0aWMgc3NpemVfdCBtdGRfbmFtZV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgfQo+ICBz
dGF0aWMgREVWSUNFX0FUVFIobmFtZSwgU19JUlVHTywgbXRkX25hbWVfc2hvdywgTlVMTCk7Cj4g
IAo+ICtzdGF0aWMgc3NpemVfdCBtdGRfZmxhc2huYW1lX3Nob3coc3RydWN0IGRldmljZSAqZGV2
LAo+ICsJCXN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpCj4gK3sKPiAr
CXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gKwo+ICsJaWYg
KCFtdGQtPmZsYXNobmFtZSkKPiArCQlyZXR1cm4gMDsKPiArCXJldHVybiBzbnByaW50ZihidWYs
IFBBR0VfU0laRSwgIiVzXG4iLCBtdGQtPmZsYXNobmFtZSk7Cj4gK30KPiArc3RhdGljIERFVklD
RV9BVFRSKGZsYXNobmFtZSwgU19JUlVHTywgbXRkX2ZsYXNobmFtZV9zaG93LCBOVUxMKTsKCk1U
RCBhbHNvIGRlYWxzIHdpdGggdGhpbmdzIHRoYXQgYXJlIG5vdCBmbGFzaGVzIChTUkFNcywgUk9N
LCAuLi4pLiBIb3cKYWJvdXQgcGFydG5hbWU/Cgo+ICsKPiArc3RhdGljIHNzaXplX3QgbXRkX2lk
X3Nob3coc3RydWN0IGRldmljZSAqZGV2LAo+ICsJCXN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICph
dHRyLCBjaGFyICpidWYpCj4gK3sKPiArCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gZGV2X2dldF9k
cnZkYXRhKGRldik7Cj4gKwo+ICsJaWYgKCFtdGQtPmlkKQo+ICsJCXJldHVybiAwOwo+ICsJcmV0
dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJSpwaE5cbiIsIG10ZC0+aWRfc2l6ZSwgbXRk
LT5pZCk7CgpJJ2QgcmVjb21tZW5kIG1ha2luZyBtdGQtPmlkIGEgc3RyaW5nIHNvIHRoYXQgZWFj
aCBmbGFzaCB0eXBlIGNhbgpkZWNpZGUgb2YgdGhlIGZvcm1hdHRpbmcsIGFuZCBtYXliZSBoYXZl
IGEgcHJlZml4IHRoYXQgdGVsbHMgd2hpY2gga2luZApvZiBJRCB0aGlzIGlzOiAic3BpLW5vcjp4
eHh4eCIsICJuYW5kOnh4eHgiLCAic3BpLW5hbmQ6eHh4eCIuCgo+ICt9Cj4gK3N0YXRpYyBERVZJ
Q0VfQVRUUihpZCwgU19JUlVHTywgbXRkX2lkX3Nob3csIE5VTEwpOwoKaWQgaXMgYml0IHZhZ3Vl
LCBob3cgYWJvdXQgcGFydGlkLgoKPiArCj4gIHN0YXRpYyBzc2l6ZV90IG10ZF9lY2Nfc3RyZW5n
dGhfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gIAkJCQkgICAgIHN0cnVjdCBkZXZpY2VfYXR0
cmlidXRlICphdHRyLCBjaGFyICpidWYpCj4gIHsKPiBAQCAtMzQwLDYgKzM2Miw4IEBAIHN0YXRp
YyBzdHJ1Y3QgYXR0cmlidXRlICptdGRfYXR0cnNbXSA9IHsKPiAgCSZkZXZfYXR0cl9vb2JhdmFp
bC5hdHRyLAo+ICAJJmRldl9hdHRyX251bWVyYXNlcmVnaW9ucy5hdHRyLAo+ICAJJmRldl9hdHRy
X25hbWUuYXR0ciwKPiArCSZkZXZfYXR0cl9mbGFzaG5hbWUuYXR0ciwKPiArCSZkZXZfYXR0cl9p
ZC5hdHRyLAo+ICAJJmRldl9hdHRyX2VjY19zdHJlbmd0aC5hdHRyLAo+ICAJJmRldl9hdHRyX2Vj
Y19zdGVwX3NpemUuYXR0ciwKPiAgCSZkZXZfYXR0cl9jb3JyZWN0ZWRfYml0cy5hdHRyLAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyBiL2RyaXZlcnMvbXRkL3Nw
aS1ub3Ivc3BpLW5vci5jCj4gaW5kZXggNmUxM2JiZDFhYWE1Li4wZTEwODU4ZTUzMmMgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMKPiArKysgYi9kcml2ZXJzL210
ZC9zcGktbm9yL3NwaS1ub3IuYwo+IEBAIC00MDI3LDYgKzQwMjcsOSBAQCBpbnQgc3BpX25vcl9z
Y2FuKHN0cnVjdCBzcGlfbm9yICpub3IsIGNvbnN0IGNoYXIgKm5hbWUsCj4gIAo+ICAJaWYgKCFt
dGQtPm5hbWUpCj4gIAkJbXRkLT5uYW1lID0gZGV2X25hbWUoZGV2KTsKPiArCW10ZC0+Zmxhc2hu
YW1lID0gaW5mby0+bmFtZTsKPiArCW10ZC0+aWQgPSBpbmZvLT5pZDsKPiArCW10ZC0+aWRfc2l6
ZSA9IGluZm8tPmlkX2xlbjsKPiAgCW10ZC0+cHJpdiA9IG5vcjsKPiAgCW10ZC0+dHlwZSA9IE1U
RF9OT1JGTEFTSDsKPiAgCW10ZC0+d3JpdGVzaXplID0gMTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9tdGQvbXRkLmggYi9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaAo+IGluZGV4IDY3Nzc2
OGIyMWExZC4uMGE4MTU2OWZhNGY2IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbXRkL210
ZC5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvbXRkLmgKPiBAQCAtMjEwLDYgKzIxMCw5IEBA
IHN0cnVjdCBtdGRfaW5mbyB7Cj4gIAl1aW50MzJfdCBmbGFnczsKPiAgCXVpbnQzMl90IG9yaWdf
ZmxhZ3M7IC8qIEZsYWdzIGFzIGJlZm9yZSBydW5uaW5nIG10ZCBjaGVja3MgKi8KPiAgCXVpbnQ2
NF90IHNpemU7CSAvLyBUb3RhbCBzaXplIG9mIHRoZSBNVEQKPiArCWNvbnN0IGNoYXIgKmZsYXNo
bmFtZTsgLyogVGhlIHVuZGVybHlpbmcgZmxhc2ggbmFtZSAqLwo+ICsJY29uc3QgY2hhciAqaWQ7
IC8qIFRoZSBJRCBvZiB0aGUgZmxhc2ggKi8KPiArCWludCBpZF9zaXplOyAvKiBOdW1iZXIgb2Yg
Ynl0ZXMgb2YgaWQgYXJyYXkgKi8KPiAgCj4gIAkvKiAiTWFqb3IiIGVyYXNlIHNpemUgZm9yIHRo
ZSBkZXZpY2UuIE5hw692ZSB1c2VycyBtYXkgdGFrZSB0aGlzCj4gIAkgKiB0byBiZSB0aGUgb25s
eSBlcmFzZSBzaXplIGF2YWlsYWJsZSwgb3IgbWF5IHVzZSB0aGUgbW9yZSBkZXRhaWxlZAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
