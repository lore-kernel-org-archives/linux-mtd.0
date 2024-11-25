Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45201D58063
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 11:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnqjxGJHvCQ3d77sUICejh0OS0I7/VL1UVBeqttO7ww=; b=YU/AznVTDQChIs
	VfNK59buZtynkPperscEVu6QQxmMi8xuMGIdaQk9hr0H+MxCkfK3mPvezXpcJ6FAdtb9iK2O6rM8f
	DZi71oXWwrSucUK2OIecDMij4L5WveZ+4lVLJCNbmW5ZTgHKlYsGO/korNhaTcwsz1Q2oX00GU8Ff
	cy2eMtfU1uRE+MLUTxPfyXbHVvL//aY+npRY5wkCPzvxu/UI9o1QtoXroDIa8spMaPREfW0/sKukV
	dZIQXsD2MF8qcLweWGgiGnPWgC6W0eoGG0v98cyg+a/7YdROLQmXkeVCSCrQMuw/xnuHQhNAnSJTt
	hRKqjTjQZhfoR4JWZ02A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWzt-00000007rAD-37Lr;
	Mon, 25 Nov 2024 11:11:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWzr-00000007r9L-15kA
	for linux-mtd@lists.infradead.org;
	Mon, 25 Nov 2024 11:11:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DED01692
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2024 03:11:42 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4B93C3F66E
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2024 03:11:12 -0800 (PST)
Date: Mon, 25 Nov 2024 11:10:51 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: cgzones@googlemail.com
Cc: linux-security-module@vger.kernel.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Serge Hallyn <serge@hallyn.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
	cocci@inria.fr
Subject: Re: [PATCH 06/11] ubifs: reorder capability check last
Message-ID: <Z0RbO1lSXoUnAtxj@e110455-lin.cambridge.arm.com>
References: <20241125104011.36552-1-cgoettsche@seltendoof.de>
 <20241125104011.36552-5-cgoettsche@seltendoof.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241125104011.36552-5-cgoettsche@seltendoof.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_031115_385984_BC7039AD 
X-CRM114-Status: GOOD (  25.23  )
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

SGkgQ2hyaXN0aWFuLAoKT24gTW9uLCBOb3YgMjUsIDIwMjQgYXQgMTE6Mzk6NThBTSArMDEwMCwg
Q2hyaXN0aWFuIEfDtnR0c2NoZSB3cm90ZToKPiBGcm9tOiBDaHJpc3RpYW4gR8O2dHRzY2hlIDxj
Z3pvbmVzQGdvb2dsZW1haWwuY29tPgo+IAo+IGNhcGFibGUoKSBjYWxscyByZWZlciB0byBlbmFi
bGVkIExTTXMgd2hldGhlciB0byBwZXJtaXQgb3IgZGVueSB0aGUKPiByZXF1ZXN0LiAgVGhpcyBp
cyByZWxldmFudCBpbiBjb25uZWN0aW9uIHdpdGggU0VMaW51eCwgd2hlcmUgYQo+IGNhcGFiaWxp
dHkgY2hlY2sgcmVzdWx0cyBpbiBhIHBvbGljeSBkZWNpc2lvbiBhbmQgYnkgZGVmYXVsdCBhIGRl
bmlhbAo+IG1lc3NhZ2Ugb24gaW5zdWZmaWNpZW50IHBlcm1pc3Npb24gaXMgaXNzdWVkLgo+IEl0
IGNhbiBsZWFkIHRvIHRocmVlIHVuZGVzaXJlZCBjYXNlczoKPiAgIDEuIEEgZGVuaWFsIG1lc3Nh
Z2UgaXMgZ2VuZXJhdGVkLCBldmVuIGluIGNhc2UgdGhlIG9wZXJhdGlvbiB3YXMgYW4KPiAgICAg
IHVucHJpdmlsZWdlZCBvbmUgYW5kIHRodXMgdGhlIHN5c2NhbGwgc3VjY2VlZGVkLCBjcmVhdGlu
ZyBub2lzZS4KPiAgIDIuIFRvIGF2b2lkIHRoZSBub2lzZSBmcm9tIDEuIHRoZSBwb2xpY3kgd3Jp
dGVyIGFkZHMgYSBydWxlIHRvIGlnbm9yZQo+ICAgICAgdGhvc2UgZGVuaWFsIG1lc3NhZ2VzLCBo
aWRpbmcgZnV0dXJlIHN5c2NhbGxzLCB3aGVyZSB0aGUgdGFzawo+ICAgICAgcGVyZm9ybXMgYW4g
YWN0dWFsIHByaXZpbGVnZWQgb3BlcmF0aW9uLCBsZWFkaW5nIHRvIGhpZGRlbiBsaW1pdGVkCj4g
ICAgICBmdW5jdGlvbmFsaXR5IG9mIHRoYXQgdGFzay4KPiAgIDMuIFRvIGF2b2lkIHRoZSBub2lz
ZSBmcm9tIDEuIHRoZSBwb2xpY3kgd3JpdGVyIGFkZHMgYSBydWxlIHRvIHBlcm1pdAo+ICAgICAg
dGhlIHRhc2sgdGhlIHJlcXVlc3RlZCBjYXBhYmlsaXR5LCB3aGlsZSBpdCBkb2VzIG5vdCBuZWVk
IGl0LAo+ICAgICAgdmlvbGF0aW5nIHRoZSBwcmluY2lwbGUgb2YgbGVhc3QgcHJpdmlsZWdlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBHw7Z0dHNjaGUgPGNnem9uZXNAZ29vZ2xlbWFp
bC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW50aG9yL3BhbnRob3JfZHJ2LmMgfCAy
ICstCj4gIGZzL3ViaWZzL2J1ZGdldC5jICAgICAgICAgICAgICAgICAgICAgfCA1ICsrKy0tCj4g
IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFudGhvci9wYW50aG9yX2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbnRob3IvcGFudGhvcl9kcnYuYwo+IGluZGV4IGFjN2U1M2Y2ZTNmMC4uMmRl
MGMzNjI3ZmJmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW50aG9yL3BhbnRob3Jf
ZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFudGhvci9wYW50aG9yX2Rydi5jCj4gQEAg
LTc5MSw3ICs3OTEsNyBAQCBzdGF0aWMgaW50IGdyb3VwX3ByaW9yaXR5X3Blcm1pdChzdHJ1Y3Qg
ZHJtX2ZpbGUgKmZpbGUsCj4gIAkJcmV0dXJuIDA7Cj4gIAo+ICAJLyogSGlnaGVyIHByaW9yaXRp
ZXMgcmVxdWlyZSBDQVBfU1lTX05JQ0Ugb3IgRFJNX01BU1RFUiAqLwo+IC0JaWYgKGNhcGFibGUo
Q0FQX1NZU19OSUNFKSB8fCBkcm1faXNfY3VycmVudF9tYXN0ZXIoZmlsZSkpCj4gKwlpZiAoZHJt
X2lzX2N1cnJlbnRfbWFzdGVyKGZpbGUpIHx8IGNhcGFibGUoQ0FQX1NZU19OSUNFKSkKPiAgCQly
ZXR1cm4gMDsKPiAgCj4gIAlyZXR1cm4gLUVBQ0NFUzsKCkNhbiB0aGUgcGF0Y2ggYWJvdmUgYmUg
c3BsaXQgaW50byBhIHNlcGFyYXRlIG9uZT8gSXQncyBmb3IgYSBkaWZmZXJlbnQgc3Vic3lzdGVt
IHRoYW4gdWJpZnMuCgpPdGhlcndpc2UsIGl0IGxvb2tzIGdvb2QgdG8gbWUsIHNvIHlvdSBjYW4g
YWRkIG15IFJldmlld2VkLWJ5IHRvIHRoZSBuZXcgcGF0Y2guCgpCZXN0IHJlZ2FyZHMsCkxpdml1
Cgo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9idWRnZXQuYyBiL2ZzL3ViaWZzL2J1ZGdldC5jCj4g
aW5kZXggZDc2ZWI3YjM5ZjU2Li42MTM3YWVhZGVjM2YgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMv
YnVkZ2V0LmMKPiArKysgYi9mcy91Ymlmcy9idWRnZXQuYwo+IEBAIC0yNTYsOCArMjU2LDkgQEAg
bG9uZyBsb25nIHViaWZzX2NhbGNfYXZhaWxhYmxlKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpj
LCBpbnQgbWluX2lkeF9sZWJzKQo+ICAgKi8KPiAgc3RhdGljIGludCBjYW5fdXNlX3JwKHN0cnVj
dCB1Ymlmc19pbmZvICpjKQo+ICB7Cj4gLQlpZiAodWlkX2VxKGN1cnJlbnRfZnN1aWQoKSwgYy0+
cnBfdWlkKSB8fCBjYXBhYmxlKENBUF9TWVNfUkVTT1VSQ0UpIHx8Cj4gLQkgICAgKCFnaWRfZXEo
Yy0+cnBfZ2lkLCBHTE9CQUxfUk9PVF9HSUQpICYmIGluX2dyb3VwX3AoYy0+cnBfZ2lkKSkpCj4g
KwlpZiAodWlkX2VxKGN1cnJlbnRfZnN1aWQoKSwgYy0+cnBfdWlkKSB8fAo+ICsJICAgICghZ2lk
X2VxKGMtPnJwX2dpZCwgR0xPQkFMX1JPT1RfR0lEKSAmJiBpbl9ncm91cF9wKGMtPnJwX2dpZCkp
IHx8Cj4gKwkgICAgY2FwYWJsZShDQVBfU1lTX1JFU09VUkNFKSkKPiAgCQlyZXR1cm4gMTsKPiAg
CXJldHVybiAwOwo+ICB9Cj4gLS0gCj4gMi40NS4yCj4gCgotLSAKPT09PT09PT09PT09PT09PT09
PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUgd29ybGQsICB8CnwgYnV0IHRoZXkncmUg
bm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3VyY2UgY29kZSEgIC8KICAtLS0tLS0tLS0t
LS0tLS0KICAgIMKvXF8o44OEKV8vwq8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
