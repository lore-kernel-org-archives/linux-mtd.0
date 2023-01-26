Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C225C05027
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Jan 2023 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjdDk8t0vPWXdwqNvwn6N/8ZkILFzoDd7BHSyK8WuGM=; b=mmp8XGtNGo3hBh
	g0d55EkjMPcnqGSep+y14QerbAelYE8fFH9i0K+UsHaAiJrPmyXiAdK7ZYxudZ8IXgJYLoAk1wlTv
	Vf9u6+zhvqxSA8tgcwjHfSAG8OLTL33xhkAWhJNIB+m6AC+I5GSCDURzfMhAiSv+fHfvsgEgnxBP4
	i/1mW0MEKEdt2kVxI8nx8XAatv8pWASyrJx0IYlljr7Atjgr+V7EPqcYnhNMukaBYL/eCVFhpcW8A
	zXB+Nx6N1XxGPEfAk+brpI46Pr2NYH6lSMG+B3yvG2Xa9jR+zpnV/mwj4+9Tz+7Y3M38tB55lf28s
	+Wttle8FfzfD+KKxmDmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKyIq-00AFPr-U8; Thu, 26 Jan 2023 09:12:16 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKyIn-00AFPG-2x
	for linux-mtd@lists.infradead.org; Thu, 26 Jan 2023 09:12:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 96DECFF828;
	Thu, 26 Jan 2023 09:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674724328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O6M+9iO9GQLAqrOwv6VSwR8P+TmV+pio0jFxZ4zH/ZI=;
	b=cgnegpcA6H6yPT0jPy3c0Lvrv6g+SieCEH2r+UXqsJMUnRvnBjIlsm0RjkL3xDyyo2wvja
	rcay566oIrKBNfQmSuSwVZkHanwp1VIF/2ax5M1mrK4Kv0Qcb95oNzQiTatys5VSchItJu
	+V0XVPsmK+ClDMSdWwj6z+4pTczq30VLXCm8w/vBsCwcy2JZUjMf7S9La53PPSJWK7VZI9
	WQp2Eags/sEx7U6DfG6Ousx9c3WaLJTCGmgMM3oKTdAhtaK/4CqvrkX4FThI3UW+96b4vY
	duh0NrLL5sE4O2B5fd8YjQJ8DCjqYYC6cLdqIvb5BsDZEpf6UpxmfZhwVVk8EA==
Date: Thu, 26 Jan 2023 10:12:04 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Marek Vasut <marex@denx.de>, Francesco Dolcini
 <francesco.dolcini@toradex.com>, u-boot@lists.denx.de
Subject: Re: [PATCH v4] mtd: parsers: ofpart: add workaround for #size-cells
 0
Message-ID: <20230126101204.245ace0d@xps-13>
In-Reply-To: <Y9JBTgmA8WX03QzK@kroah.com>
References: <20230124104444.330913-1-francesco@dolcini.it>
	<Y8/7k1HHjJbHvWDB@kroah.com>
	<Y9GZ8c9VDXC582IA@francesco-nb.int.toradex.com>
	<Y9JBTgmA8WX03QzK@kroah.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_011213_416176_C75C974C 
X-CRM114-Status: GOOD (  39.77  )
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

SGkgR3JlZywKCmdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnIHdyb3RlIG9uIFRodSwgMjYgSmFu
IDIwMjMgMTA6MDE6MDIgKzAxMDA6Cgo+IE9uIFdlZCwgSmFuIDI1LCAyMDIzIGF0IDEwOjA2OjU3
UE0gKzAxMDAsIEZyYW5jZXNjbyBEb2xjaW5pIHdyb3RlOgo+ID4gSGVsbG8gTWlxdWVsLCBHcmVn
IGFuZCBhbGwKPiA+IAo+ID4gT24gVHVlLCBKYW4gMjQsIDIwMjMgYXQgMDQ6Mzg6NTlQTSArMDEw
MCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOiAgCj4gPiA+IE9uIFR1ZSwgSmFuIDI0LCAyMDIz
IGF0IDExOjQ0OjQ0QU0gKzAxMDAsIEZyYW5jZXNjbyBEb2xjaW5pIHdyb3RlOiAgCj4gPiA+ID4g
RnJvbTogRnJhbmNlc2NvIERvbGNpbmkgPGZyYW5jZXNjby5kb2xjaW5pQHRvcmFkZXguY29tPgo+
ID4gPiA+IAo+ID4gPiA+IEFkZCBhIG1lY2hhbmlzbSB0byBoYW5kbGUgdGhlIGNhc2UgaW4gd2hp
Y2ggcGFydGl0aW9ucyBhcmUgcHJlc2VudCBhcwo+ID4gPiA+IGRpcmVjdCBjaGlsZCBvZiB0aGUg
bmFuZCBjb250cm9sbGVyIG5vZGUgYW5kICNzaXplLWNlbGxzIGlzIHNldCB0byA8MD4uCj4gPiA+
ID4gCj4gPiA+ID4gVGhpcyBjb3VsZCBoYXBwZW4gaWYgdGhlIG5hbmQtY29udHJvbGxlciBub2Rl
IGluIHRoZSBEVFMgaXMgc3VwcG9zZWQgdG8KPiA+ID4gPiBoYXZlICNzaXplLWNlbGxzIHNldCB0
byAwLCBidXQgZm9yIHNvbWUgaGlzdG9yaWNhbCByZWFzb24vYnVnIGl0IHdhcyBzZXQKPiA+ID4g
PiB0byAxIGluIHRoZSBwYXN0LCBhbmQgdGhlIGZpcm13YXJlIChlLmcuIFUtQm9vdCkgaXMgYWRk
aW5nIHRoZSBwYXJ0aXRpb24KPiA+ID4gPiBhcyBkaXJlY3QgY2hpbGRyZW4gb2YgdGhlIG5hbmQt
Y29udHJvbGxlciBkZWZhdWx0aW5nIHRvICNzaXplLWNlbGxzCj4gPiA+ID4gYmVpbmcgdG8gMS4K
PiA+ID4gPiAKPiA+ID4gPiBUaGlzIHByZXZlbnRzIGEgcmVhbCBib290IGZhaWx1cmUgb24gY29s
aWJyaS1pbXg3IHRoYXQgaGFwcGVuZWQgZHVyaW5nIHY2LjEKPiA+ID4gPiBkZXZlbG9wbWVudCBj
eWNsZXMuCj4gPiA+ID4gCj4gPiA+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
L1k0ZGdCVEdOV3BNNlNRWElAZnJhbmNlc2NvLW5iLmludC50b3JhZGV4LmNvbS8KPiA+ID4gPiBM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjEyMDIwNzE5MDAuMTE0Mzk1MC0x
LWZyYW5jZXNjb0Bkb2xjaW5pLml0Lwo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5jZXNjbyBE
b2xjaW5pIDxmcmFuY2VzY28uZG9sY2luaUB0b3JhZGV4LmNvbT4KPiA+ID4gPiBSZXZpZXdlZC1i
eTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiA+ID4g
PiAtLS0KPiA+ID4gPiBJIGRvIG5vdCBleHBlY3QgdGhpcyBwYXRjaCB0byBiZSBiYWNrcG9ydGVk
IHRvIHN0YWJsZSwgaG93ZXZlciBJIHdvdWxkIGV4cGVjdAo+ID4gPiA+IHRoYXQgd2UgZG8gbm90
IGJhY2twb3J0IG5hbmQtY29udHJvbGxlciBkdHMgY2xlYW51cHMgbmVpdGhlci4KPiA+ID4gPiAK
PiA+ID4gPiB2NDoKPiA+ID4gPiAgZml4ZWQgd3JvbmcgRW5nbGlzaCBzcGVsbGluZyBpbiB0aGUg
Y29tbWVudAo+ID4gPiA+IAo+ID4gPiA+IHYzOgo+ID4gPiA+ICBtaW5vciBmb3JtYXR0aW5nIGNo
YW5nZSwgcmVtb3ZlZCBub3QgbmVlZGVkIG5ldy1saW5lIGFuZCBzcGFjZS4gCj4gPiA+ID4gCj4g
PiA+ID4gdjI6Cj4gPiA+ID4gIGZpeHVwIHNpemUtY2VsbHMgb25seSB3aGVuIHBhcnRpdGlvbnMg
YXJlIGRpcmVjdCBjaGlsZHJlbiBvZiB0aGUgbmFuZC1jb250cm9sbGVyCj4gPiA+ID4gIGNvbXBs
ZXRlbHkgcmV2aXNlZCBjb21taXQgbWVzc2FnZSwgY29tbWVudHMgYW5kIHdhcm5pbmcgcHJpbnQK
PiA+ID4gPiAgdXNlIHByX3dhcm4gaW5zdGVhZCBvZiBwcl93YXJuX29uY2UKPiA+ID4gPiAgYWRk
ZWQgUmV2aWV3ZWQtYnkgR3JlZwo+ID4gPiA+ICByZW1vdmVkIGNjOnN0YWJsZUAgYW5kIGZpeGVz
IHRhZywgc2luY2UgdGhlIHByb2JsZW1hdGljIGNvbW1pdCB3YXMgcmV2ZXJ0ZWQKPiA+ID4gPiAt
LS0KPiA+ID4gPiAgZHJpdmVycy9tdGQvcGFyc2Vycy9vZnBhcnRfY29yZS5jIHwgMTkgKysrKysr
KysrKysrKysrKysrKwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQo+
ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9wYXJzZXJzL29mcGFydF9j
b3JlLmMgYi9kcml2ZXJzL210ZC9wYXJzZXJzL29mcGFydF9jb3JlLmMKPiA+ID4gPiBpbmRleCAx
OTIxOTBjNDJmYzguLmU3YjhlOWQwYTkxMCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL210
ZC9wYXJzZXJzL29mcGFydF9jb3JlLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL210ZC9wYXJzZXJz
L29mcGFydF9jb3JlLmMKPiA+ID4gPiBAQCAtMTIyLDYgKzEyMiwyNSBAQCBzdGF0aWMgaW50IHBh
cnNlX2ZpeGVkX3BhcnRpdGlvbnMoc3RydWN0IG10ZF9pbmZvICptYXN0ZXIsCj4gPiA+ID4gIAo+
ID4gPiA+ICAJCWFfY2VsbHMgPSBvZl9uX2FkZHJfY2VsbHMocHApOwo+ID4gPiA+ICAJCXNfY2Vs
bHMgPSBvZl9uX3NpemVfY2VsbHMocHApOwo+ID4gPiA+ICsJCWlmICghZGVkaWNhdGVkICYmIHNf
Y2VsbHMgPT0gMCkgewo+ID4gPiA+ICsJCQkvKgo+ID4gPiA+ICsJCQkgKiBUaGlzIGlzIGEgdWds
eSB3b3JrYXJvdW5kIHRvIG5vdCBjcmVhdGUKPiA+ID4gPiArCQkJICogcmVncmVzc2lvbiBvbiBk
ZXZpY2VzIHRoYXQgYXJlIHN0aWxsIGNyZWF0aW5nCj4gPiA+ID4gKwkJCSAqIHBhcnRpdGlvbnMg
YXMgZGlyZWN0IGNoaWxkcmVuIG9mIHRoZSBuYW5kIGNvbnRyb2xsZXIuCj4gPiA+ID4gKwkJCSAq
IFRoaXMgY2FuIGhhcHBlbiBpbiBjYXNlIHRoZSBuYW5kIGNvbnRyb2xsZXIgbm9kZSBoYXMKPiA+
ID4gPiArCQkJICogI3NpemUtY2VsbHMgZXF1YWwgdG8gMCBhbmQgdGhlIGZpcm13YXJlIChlLmcu
Cj4gPiA+ID4gKwkJCSAqIFUtQm9vdCkganVzdCBhZGQgdGhlIHBhcnRpdGlvbnMgdGhlcmUgYXNz
dW1pbmcKPiA+ID4gPiArCQkJICogMzItYml0IGFkZHJlc3NpbmcuCj4gPiA+ID4gKwkJCSAqCj4g
PiA+ID4gKwkJCSAqIElmIHlvdSBnZXQgdGhpcyB3YXJuaW5nIHlvdXIgZmlybXdhcmUgYW5kL29y
IERUUwo+ID4gPiA+ICsJCQkgKiBzaG91bGQgYmUgcmVhbGx5IGZpeGVkLgo+ID4gPiA+ICsJCQkg
Kgo+ID4gPiA+ICsJCQkgKiBUaGlzIGlzIHdvcmtpbmcgb25seSBmb3IgZGV2aWNlcyBzbWFsbGVy
IHRoYW4gNEdpQi4KPiA+ID4gPiArCQkJICovCj4gPiA+ID4gKwkJCXByX3dhcm4oIiVzOiBvZnBh
cnQgcGFydGl0aW9uICVwT0YgKCVwT0YpICNzaXplLWNlbGxzIGlzIHdyb25nbHkgc2V0IHRvIDww
PiwgYXNzdW1pbmcgPDE+IGZvciBwYXJzaW5nIHBhcnRpdGlvbnMuXG4iLAo+ID4gPiA+ICsJCQkJ
bWFzdGVyLT5uYW1lLCBwcCwgbXRkX25vZGUpOyAgCj4gPiA+IAo+ID4gPiBUaGlzIGlzIGEgZHJp
dmVyLCBhbHdheXMgdXNlIGRldl8qKCkgY2FsbHMsIG5vdCBwcl8qKCkgY2FsbHMgc28gdGhhdCB3
ZQo+ID4gPiBrbm93IHdoYXQgaXMgYmVpbmcgcmVmZXJyZWQgdG8gZXhhY3RseS4gIAo+ID4gCj4g
PiBJcyB0aGlzIHJlYXNvbmFibGUgaGVyZT8gV2hlcmUgY2FuIEkgZ2V0IHRoZSBzdHJ1Y3QgZGV2
aWNlPyAgCj4gCj4gV2FsayBiYWNrIHVwIHRoZSBjYWxsIGNoYWluLCB0aGVyZSBoYXMgdG8gYmUg
YSBkZXZpY2Ugc29tZXdoZXJlCj4gY29udHJvbGxpbmcgdGhpcywgcmlnaHQ/Cj4gCj4gPiBJbiBn
ZW5lcmFsIHRoaXMgZmlsZSB1c2VzIG9ubHkgcHJfKiBkZWJ1ZyBBUEkgYW5kIG1lc3NhZ2VzIGFy
ZSBhYm91dCBPRgo+ID4gbm9kZXMvcHJvcGVydGllcywgbm90IGFib3V0IGEgZGV2aWNlLiAgCj4g
Cj4gT0Ygbm9kZXMgYW5kIHByb3BlcnRpZXMgYXJlIHBhcnQgb2YgYSBkZXZpY2UncyBwcm9wZXJ0
aWVzIDopCgpZZXMgYnV0IHRoZSB3YXJuaW5nIGNvbWVzIGZyb20gYSB3cm9uZyBEVCBkZXNjcmlw
dGlvbiwgaGVuY2UgaXQgZmVsdApiZXR0ZXIgc3VpdGVkIHRvIHdhcm4gYWdhaW5zdCB0aGUgbm9k
ZSBuYW1lIHdoaWNoIGlzIGVhc2lseSBpZGVudGlmaWFibGUKaW4gYSB0ZXh0IGZpbGUgYW5kIG11
c3QgYmUgZml4ZWQgcmF0aGVyIHRoYW4gdGhlIGRldmljZSB3aGljaCBpcyBhIHB1cmUKc29mdHdh
cmUgY29tcG9uZW50LgoKQW55d2F5LCBGcmFuY2VzY28sIHBsZWFzZSBzaG93IHVzIHRoZSByZXN1
bHRhbnQgbGluZSBhbmQgaWYgaXQgZmVlbHMKbWVhbmluZ2Z1bCBlbm91Z2ggd2UnbGwgdGFrZSB0
aGUgZGV2X3dhcm4gYXBwcm9hY2guCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
