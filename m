Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BA3CAC58C
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Sep 2025 17:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gYa/jVSyKY2KFeVFCsMLz0geDdvGahFCX02uOwsNiS8=; b=EZifyrcp8UZLRy
	Ots19NRu9hUwy9BCc+K8BtpJxKOH1sjpYfHv37JblHCtUfAGlYg28KhS/qXbk3tJeP6rlDZ9DP5z3
	4jbL8ZKis3QhzUGsSLhYX7y7WhX+1miiPn4l9TChjw+fcw2eVelmV/PzxossXustEMdPuXkae0R/i
	Y+XLoV8Noo74fGLFAuQX2J9Hz96zAO257UFwSIQvFFuGYDlauKHbnFkinkw7OENCrFyQP5ADIQXrV
	6Rv9FnH/IvjV6WywzV85tkg6S0NqiDFiXYj231CDFU4EX1fupyBoQhEZpnmL+pDqzokRM7/PEa1VX
	8wW28m/tG7EDsfVIkWwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw247-000000090tb-3VUp;
	Tue, 09 Sep 2025 17:23:35 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0IC-000000084Sm-2uO0
	for linux-mtd@lists.infradead.org;
	Tue, 09 Sep 2025 15:30:01 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 060527A0159;
	Tue,  9 Sep 2025 11:29:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 09 Sep 2025 11:29:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	yadavpratyush.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1757431798; x=1757518198; bh=OaBtB8Gbph
	dr+zgvtG/bXuSD88ZqLqoEFKHVMYkElbg=; b=R6+2HH7P+gge7IpSG5JV4HavNR
	qY5TF5wFWiX2zQnt3Xd7ieqeTyPhQ8T+Pt4ceAkhOkCx+vGXFSQjG8LVkClx7hTa
	wYNhCvGxigNHbkuBdfdgNNrgnRkbFKZFtMujZ9SNo4TwjxYuuH9rK+49gQWE7LcD
	QW1V0rm269zJuPvlLWTFZDRbIBfJn+4YrF8X6BPT7EjtZ2B7xQauXPIiFESIX1CT
	V+LG1OEUavtyPTmL5R2YkT0fV05EhzakcmIWkcOj7T6nyyxgkBJqTO/msxkgOLPA
	LbQw89nd8oactaWrJgHJS0eo7ZfUFUEwxt2Kt9CY+Jhlos8/q6J7RkgCz76A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757431798; x=
	1757518198; bh=OaBtB8Gbphdr+zgvtG/bXuSD88ZqLqoEFKHVMYkElbg=; b=C
	onGIMzH68M79TDjeUDyxOWu00dpqdplY3aWa09tGRP450rWObVY9z+8nhsEYn91y
	M+E6hQdD8fwu2M0ACRDaM2rs0HCUyuqmeAJYMJtvVwFD4/0k7AVCsm0heLA+GuSr
	q9Ocd+DEJZs4y10EN2LmXPlchV6vSkMEFHDAE20GsIT141Isxjcch2QJsjatDN41
	8YnHOVbV4ZEiVX3wJ4wR1QJKiltIIlJFH1nmxlNJUEzwRvWuFhkUs6mUMmUuurLQ
	0kBF1d6wOOwC/k/H6p+AHzrkNV9wywedkhjoMAFsnWgcwBW+q/mP5YdOuANADA1U
	VE6FuwDwWSA39FwczxN9g==
X-ME-Sender: <xms:9kfAaNaXRmL4-8Zs5rTgdNfWuIXlhjAQkGMaDW273GB_ICyhkReOCQ>
    <xme:9kfAaO_3qj-PLT8X80bgsnLdAZ16Khn_6uqm-N_eB3XqVXoawUyepiJJCYAzpy3L4
    VGaas5U0cuW8wMmG2g>
X-ME-Received: <xmr:9kfAaMhYAGJ57NXy2as-c3EpwiXKEzG14-NPyNAN1R8vaP-ObbY-90QMhf45WbU19Al3DMX6XYxLg5YZVNXv1BYtC29-sqpEbyQb7Dc07qg750H-tnUX_owWgUuRueGPLTfqj_dW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufgjfhffkfgfgggtgfesthhqredttderjeenucfhrhhomheprfhrrghthihu
    shhhucgjrggurghvuceomhgvseihrggurghvphhrrghthihushhhrdgtohhmqeenucggtf
    frrghtthgvrhhnpedvhfdvhedtueethefhkeetgedttdeuhefgueehgeduhfejtdfhvdev
    gedvjedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmvgeshigruggrvhhprhgrthihuhhshhdrtghomhdpnhgspghrtghpthhtohepgedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtsh
    drihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhs
    sehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepphhrrghthihushhhsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnseiirghnuggvrhhsrdgsvg
X-ME-Proxy: <xmx:9kfAaOeyiv9qxCmgYGFyVREDnhd1xHEPyDo9jGnd-559jw82GnO6aQ>
    <xmx:9kfAaDoEVPhi3fSLE85lDShmlq1_0_7kKs4jtnasHn-n3elTci9P8g>
    <xmx:9kfAaDD89PCI2bwQQaA1goWgi-w-I6K47YtVOugdRhLLUtjxVQQiUg>
    <xmx:9kfAaAZnT-oUh3VfAm14yybp0sUed44wIPedyN2CFiemAH7QYInJTg>
    <xmx:9kfAaBUHciPwFwQN-yaOL3ITjX4J4gSizWp38cInsXt-sQsg8ddeI6f1>
Feedback-ID: i93f149c1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Sep 2025 11:29:57 -0400 (EDT)
From: Pratyush Yadav <me@yadavpratyush.com>
To: Maarten Zanders <maarten@zanders.be>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@microchip.com>,  linux-mtd@lists.infradead.org
Subject: Re: [spi-nor] Macronix MX25L requires CR read opcode 0x15 (not 0x35)
In-Reply-To: <CAPB_pEK=rSg77V7jrzx7mfrc3n0EwWZL7Ew=uNnocg6A+jN5Zw@mail.gmail.com>
References: <CAPB_pELpdie+=VB3h3tqZCkdTd9cKyhnYNmXjeP1vYODDricLw@mail.gmail.com>
	<mafs0plcaw7rp.fsf@kernel.org>
	<CAPB_pEK=rSg77V7jrzx7mfrc3n0EwWZL7Ew=uNnocg6A+jN5Zw@mail.gmail.com>
Date: Tue, 09 Sep 2025 17:29:56 +0200
Message-ID: <mafs0plbzk5jf.fsf@yadavpratyush.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_083000_790749_76A123A0 
X-CRM114-Status: GOOD (  27.56  )
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

T24gVHVlLCBTZXAgMDIgMjAyNSwgTWFhcnRlbiBaYW5kZXJzIHdyb3RlOgoKPiBIaSwKPgo+IE9u
IE1vbiwgU2VwIDEsIDIwMjUgYXQgNDo0NuKAr1BNIFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBr
ZXJuZWwub3JnPiB3cm90ZToKPj4gPiBPbiB0aGUgTWFjcm9uaXggTVgyNUwxMjgzM0YgKElEIDB4
QzIyMDE4KSAmIG90aGVycyBvZiB0aGlzIGZhbWlseS9tZmcsCj4+ID4gdGhlIENSIChjb25kaXRp
b24gcmVnaXN0ZXIpIG11c3QgYmUgcmVhZCB3aXRoIG9wY29kZSAweDE1LiBUaGUgZHJpdmVyCj4+
ID4gY3VycmVudGx5IHVzZXMgMHgzNSwgd2hpY2ggdGhlIGNoaXAgZG9lcyBub3QgcmVjb2duaXpl
Lgo+Pgo+PiBJcyBpdCBvbmUgb2YgdGhvc2UgZGV2aWNlcyBmb3Igd2hpY2ggTWFjcm9uaXggaGFz
IHJlLXVzZWQgdGhlIGZsYXNoIElEcz8KPj4gSSB2YWd1ZWx5IHJlY2FsbCByZWFkaW5nIHRoYXQg
c29tZXdoZXJlLiBJZiBzbywgdGhlbiB3ZSBhbHNvIG5lZWQgdG8gYmUKPj4gY2FyZWZ1bCBvZiBi
cmVha2luZyB0aGUgb2xkZXIgdmFyaWFudHMgb2YgdGhlIGZsYXNoLgo+Cj4gWWVzLCB0aGVyZSBp
cyBxdWl0ZSBzb21lIGZsYXNoIElEIHJldXNlLiBUaGlzIGlzIGluZGVlZCBvbmUgb2YgdGhlbS4K
PiBJIGp1c3Qgd2VudCB0aHJvdWdoIGEgbG90IG9mIGRhdGFzaGVldHMgZnJvbSBNYWNyb25peCBh
bmQgZm9yIHRob3NlCj4gc3VwcG9ydGluZyBSRENSLCB0aGV5IGFyZSBhbHdheXMgdXNpbmcgb3Bj
b2RlIDB4MTUuCj4gQWxzbywgd2hlbiBpbnNwZWN0aW5nIHBhdGNoZXMgKGZvciBvbGRlciBrZXJu
ZWwsIHVib290LC4uKSB3aGljaCBhZGQKPiBNWCBzcGktbm9yIHN1cHBvcnQgZnJvbSB0aGUgTWFj
cm9uaXggd2Vic2l0ZSwgdGhleSBkbyBzb21ldGhpbmcgbGlrZQo+IHRoaXM6Cj4KPiAjZGVmaW5l
IFNQSU5PUl9PUF9SRENSX01YIDB4MTUgLyogUmVhZCBjb25maWd1cmF0aW9uIHJlZ2lzdGVyIGZv
ciBNYWNyb25peCovCj4gLi4uCj4gb3Bjb2RlID0gKG5vci0+amVkZWNfaWQgPT0gQ0ZJX01GUl9N
QUNST05JWCkgPyBTUElOT1JfT1BfUkRDUl9NWCA6Cj4gU1BJTk9SX09QX1JEQ1I7CgpIb3cgZG8g
YW55IG9mIHRoZSBmbGFzaGVzIGV2ZW4gd29yayBvbiBtYWlubGluZSB0aGVuPyBXb24ndCB0aGV5
IGFsbApoYXZlIHRoZSBzYW1lIHByb2JsZW0/IERvZXMgaXQgb25seSBlbmQgdXAgdG91Y2hpbmcg
dGhlIE9UUCBiaXRzLCBhbmQKdGhvc2UgZG9uJ3QgZ2V0IG5vdGljZWQ/Cgo+Cj4gQSBjbGVhbmVy
L21vZGVybiBhcHByb2FjaCB3b3VsZCBiZSB0byBhZGQgYSBwYXJhbWV0ZXIgaW4gc3RydWN0Cj4g
c3BpX25vcl9mbGFzaF9wYXJhbWV0ZXIgd2hpY2ggZ2V0cyBkZWZhdWx0ZWQgdG8gU1BJTk9SX09Q
X1JEQ1IgKDB4MzUpCj4gYW5kIGZpeGVkIHVwIHVzaW5nIG1hbnVmYWN0dXJlciBsYXRlX2luaXQo
KSBmb3IgTWFjcm9uaXg/CgpZZWFoLCBvciBtYXliZSBhIGNhbGxiYWNrIGxpa2UgZm9yIHJlYWR5
PwoKPgo+PiBJcyBpdCBhdCBhbGwgcG9zc2libGUgdG8gZGlzY292ZXIgdGhlIG9wY29kZSBmcm9t
IHRoZSBmbGFzaCBTRkRQIHRhYmxlCj4+IChTQ0NSIG1hcCBwZXJoYXBzKT8gSWYgc28sIEkgdGhp
bmsgdGhhdCB3b3VsZCBiZSB0aGUgYmVzdCB3YXkgZm9yd2FyZAo+PiBzaW5jZSBpdCB3b3VsZCBi
ZSBnZW5lcmljLgo+Cj4gVW5mb3J0dW5hdGVseSwgbm8uIEkgcmVjZWl2ZWQgdGhlIFNGRFAgZGF0
YSBmb3IgdGhpcyBwYXJ0IGFuZCB0aGVyZSdzCj4gbm8gU0NDUiBtYXAgb3Igb3RoZXIgbWVhbnMg
dG8gZGlzdGluZ3Vpc2ggb3Bjb2Rlcy4gSSBiZWxpZXZlIG9ubHkgdGhlCj4gbW9yZSByZWNlbnQg
cGFydHMgaW5jbHVkZSB0aGlzIChTQ0NSIHdhcyBkZWZpbmVkIGluIDIwMTkpLgo+Cj4+IFRoZXJl
IGlzIHRoZSBTTk9SX0ZfTk9fUkVBRF9DUiBmbGFnIHRoYXQgc2VlbXMgdG8gZG8gd2hhdCB5b3Ug
d2FudC4gSW4KPj4gc3BpX25vcl93cml0ZV8xNmJpdF9zcl9hbmRfY2hlY2soKSwgaWYgdGhlIGZs
YWcgaXMgc2V0IGl0IGRvZXMgbm90IGlzc3VlCj4+IHRoZSByZWFkIENSIGNvbW1hbmQgYW5kIGVp
dGhlciBzZXRzIHRoZSBzZWNvbmQgYnl0ZSB0byAwIG9yIHRvCj4+IFNSMl9RVUFEX0VOX0JJVDEu
IFRoZSBmbGFnIGNhbiBiZSBkaXNjb3ZlcmVkIHZpYSBCRlBUIChzZWUKPj4gc3BpX25vcl9wYXJz
ZV9iZnB0KCkpLiBJcyB0aGUgQkZQVCB0YWJsZSBvbiB0aGUgZmxhc2ggaW5jb3JyZWN0PyBJbiB0
aGF0Cj4+IGNhc2UsIHBlcmhhcHMgd2Ugc2hvdWxkIGFkZCBhIHBvc3QtQkZQVCBmaXh1cD8KPgo+
IFRoYXQgZmxhZyB3aWxsIGhhdmUgc2ltaWxhciByZXN1bHRzIGFzIHJlYWRpbmcgZ2FyYmFnZSB0
b2RheS4gSXQgd2lsbAo+IGlnbm9yZSB0aGUgYWN0dWFsIGNvbnRlbnRzIG9mIENSIHdoZW4gd2Un
cmUgYWN0dWFsbHkgdHJ5aW5nIHRvIGRvIGEKPiByZWFkLWRvbid0LW1vZGlmeS13cml0ZS4gSW4g
dGhlIGNhc2Ugb2YgdGhpcyBwYXJ0LCBpdCB3aWxsIGNsZWFyIHNvbWUKPiBiaXRzIHdoaWNoIHdl
cmUgMSBieSBkZWZhdWx0LCBjaGFuZ2luZyBvdXRwdXQgZHJpdmVyIHN0cmVuZ3RoLgoKSG1tLCBt
YWtlcyBzZW5zZS4gSSB3YXMgaG9waW5nIHRoZSBiaXRzIHdvdWxkIGFsc28gZGVmYXVsdCB0byAw
IHNvIHRoZXJlCndvbid0IGJlIGEgcHJvYmxlbS4KCi0tIApSZWdhcmRzLApQcmF0eXVzaCBZYWRh
dgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
