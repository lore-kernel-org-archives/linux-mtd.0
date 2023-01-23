Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F6AC25B50
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jan 2023 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fq1jpylnyaaWhc5xhn9CnaAb042uKBxpHjlC0oC9L4E=; b=CZVffE9E93x4N1
	3rwPV96eM1mZNbytb9D6nZLRxVKVgZPo51QZ2sCij9zBNVCQu4U0p9y5GR4/jJhVrulgcfSrdblSB
	n7VqzdqbVVso+aNqGRgLkPNawPIrkUy3+H3vkyUgOmp42fM68L2KmHegF04PqWxBO5efujSD25lCi
	OB/rKdrX3/cpdNakcF5wxq9r6W4RcQe2NHszjuFvyOMp6mz0NIaMqCccAuB0UE4Bxtu6CP4ReBLNf
	tOVs3eq3QtMCDdy4eNT72XAbzHhgODkh/UZWujxL2YLkYNVAdKW1BLAwucEj0jptG6VHK05MuEzc5
	RXPn9mnBUeUkD0o20U9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJu5A-00Gpez-O0; Mon, 23 Jan 2023 10:29:45 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJu3m-00Gp3i-Ei
	for linux-mtd@lists.infradead.org; Mon, 23 Jan 2023 10:28:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7610BC000E;
	Mon, 23 Jan 2023 10:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674469691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+2SYEdhJpTh34wfL2UZHxOj46QVjvkgYp58I1hg+RFk=;
	b=cGzHkIPQW0c3KQzcFMf1UtrMmId+gdcj+KXvfzVYSKmK+bdFgnt3TfMZOtmSWmd4ycizYi
	CkpaAyUrlybmySjtlOQVG/rcQ0sNALm46clF9j6DUtKzTUJ5100JwHP4oGO7Mryhq6WjGs
	TA/rsd9SPXwl4jKUlnQh7tDiL8ozbNJS+X+Gh/xXFvImOFTmu+92wACvEi1GOZ0pR2ljN5
	S9qqg5aE5jsTV8pkzexOKuS1lX2lgCD+ie//oErDJv/Aq70qJqdTOwfb4kIVw1HenWukhV
	K53415sC9KJDqMtDsUFNpfW5eXp/k2PpaFAFkZKpm8KReKN054kPvM3Gmt2i7w==
Date: Mon, 23 Jan 2023 11:28:08 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, Marek Vasut
 <marex@denx.de>, Francesco Dolcini <francesco.dolcini@toradex.com>,
 u-boot@lists.denx.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] mtd: parsers: ofpart: add workaround for #size-cells
 0
Message-ID: <20230123112808.6340a016@xps-13>
In-Reply-To: <20230113184556.487405-1-francesco@dolcini.it>
References: <20230113184556.487405-1-francesco@dolcini.it>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_022818_837031_A5401A37 
X-CRM114-Status: GOOD (  25.51  )
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

SGkgRnJhbmNlc2NvLAoKZnJhbmNlc2NvQGRvbGNpbmkuaXQgd3JvdGUgb24gRnJpLCAxMyBKYW4g
MjAyMyAxOTo0NTo1NiArMDEwMDoKCj4gRnJvbTogRnJhbmNlc2NvIERvbGNpbmkgPGZyYW5jZXNj
by5kb2xjaW5pQHRvcmFkZXguY29tPgo+IAo+IEFkZCBhIG1lY2hhbmlzbSB0byBoYW5kbGUgdGhl
IGNhc2UgaW4gd2hpY2ggcGFydGl0aW9ucyBhcmUgcHJlc2VudCBhcwo+IGRpcmVjdCBjaGlsZCBv
ZiB0aGUgbmFuZCBjb250cm9sbGVyIG5vZGUgYW5kICNzaXplLWNlbGxzIGlzIHNldCB0byA8MD4u
Cj4gCj4gVGhpcyBjb3VsZCBoYXBwZW4gaWYgdGhlIG5hbmQtY29udHJvbGxlciBub2RlIGluIHRo
ZSBEVFMgaXMgc3VwcG9zZWQgdG8KPiBoYXZlICNzaXplLWNlbGxzIHNldCB0byAwLCBidXQgZm9y
IHNvbWUgaGlzdG9yaWNhbCByZWFzb24vYnVnIGl0IHdhcyBzZXQKPiB0byAxIGluIHRoZSBwYXN0
LCBhbmQgdGhlIGZpcm13YXJlIChlLmcuIFUtQm9vdCkgaXMgYWRkaW5nIHRoZSBwYXJ0aXRpb24K
PiBhcyBkaXJlY3QgY2hpbGRyZW4gb2YgdGhlIG5hbmQtY29udHJvbGxlciBkZWZhdWx0aW5nIHRv
ICNzaXplLWNlbGxzCj4gYmVpbmcgdG8gMS4KPiAKPiBUaGlzIHByZXZlbnRzIGEgcmVhbCBib290
IGZhaWx1cmUgb24gY29saWJyaS1pbXg3IHRoYXQgaGFwcGVuZWQgZHVyaW5nIHY2LjEKPiBkZXZl
bG9wbWVudCBjeWNsZXMuCj4gCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1k0
ZGdCVEdOV3BNNlNRWElAZnJhbmNlc2NvLW5iLmludC50b3JhZGV4LmNvbS8KPiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjEyMDIwNzE5MDAuMTE0Mzk1MC0xLWZyYW5jZXNj
b0Bkb2xjaW5pLml0Lwo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jZXNjbyBEb2xjaW5pIDxmcmFuY2Vz
Y28uZG9sY2luaUB0b3JhZGV4LmNvbT4KPiBSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFu
IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiAtLS0KPiAKPiBNaXF1ZWwsIE1hcmVrOiBJ
IGRvIG5vdCBleHBlY3QgdGhpcyBwYXRjaCB0byBiZSBiYWNrcG9ydGVkIHRvIHN0YWJsZSwgaG93
ZXZlcgo+IEkgd291bGQgZXhwZWN0IHRoYXQgd2UgZG8gbm90IGJhY2twb3J0IG5hbmQtY29udHJv
bGxlciBkdHMgY2xlYW51cHMgbmVpdGhlci4KCk9rYXkuCgo+IAo+IHYyOgo+ICBmaXh1cCBzaXpl
LWNlbGxzIG9ubHkgd2hlbiBwYXJ0aXRpb25zIGFyZSBkaXJlY3QgY2hpbGRyZW4gb2YgdGhlIG5h
bmQtY29udHJvbGxlcgo+ICBjb21wbGV0ZWx5IHJldmlzZWQgY29tbWl0IG1lc3NhZ2UsIGNvbW1l
bnRzIGFuZCB3YXJuaW5nIHByaW50Cj4gIHVzZSBwcl93YXJuIGluc3RlYWQgb2YgcHJfd2Fybl9v
bmNlCj4gIGFkZGVkIFJldmlld2VkLWJ5IEdyZWcKPiAgcmVtb3ZlZCBjYzpzdGFibGVAIGFuZCBm
aXhlcyB0YWcsIHNpbmNlIHRoZSBwcm9ibGVtYXRpYyBjb21taXQgd2FzIHJldmVydGVkCj4gLS0t
Cj4gIGRyaXZlcnMvbXRkL3BhcnNlcnMvb2ZwYXJ0X2NvcmUuYyB8IDIwICsrKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvb2ZwYXJ0X2NvcmUuYyBiL2RyaXZlcnMvbXRkL3BhcnNl
cnMvb2ZwYXJ0X2NvcmUuYwo+IGluZGV4IDE5MjE5MGM0MmZjOC4uNDY1NTlhOTI0OGU2IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvb2ZwYXJ0X2NvcmUuYwo+ICsrKyBiL2RyaXZl
cnMvbXRkL3BhcnNlcnMvb2ZwYXJ0X2NvcmUuYwo+IEBAIC0xMjIsNiArMTIyLDI2IEBAIHN0YXRp
YyBpbnQgcGFyc2VfZml4ZWRfcGFydGl0aW9ucyhzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciwKPiAg
Cj4gIAkJYV9jZWxscyA9IG9mX25fYWRkcl9jZWxscyhwcCk7Cj4gIAkJc19jZWxscyA9IG9mX25f
c2l6ZV9jZWxscyhwcCk7Cj4gKwkJaWYgKCFkZWRpY2F0ZWQgJiYgc19jZWxscyA9PSAwKSB7Cj4g
KwkJCS8qCj4gKwkJCSAqIFRoaXMgaXMgYSBodWdseSB3b3JrYXJvdW5kIHRvIG5vdCBjcmVhdGUK
PiArCQkJICogcmVncmVzc2lvbiBvbiBkZXZpY2VzIHRoYXQgYXJlIHN0aWxsIGNyZWF0aW5nCj4g
KwkJCSAqIHBhcnRpdGlvbnMgYXMgZGlyZWN0IGNoaWxkIG9mIHRoZSBuYW5kIGNvbnRyb2xsZXIu
Cj4gKwkJCSAqIFRoaXMgY2FuIGhhcHBlbiBpbiBjYXNlIHRoZSBuYW5kIGNvbnRyb2xsZXIgbm9k
ZSBoYXMKPiArCQkJICogI3NpemUtY2VsbHMgZXF1YWwgdG8gMCBhbmQgdGhlIGZpcm13YXJlIChl
LmcuCj4gKwkJCSAqIFUtQm9vdCkganVzdCBhZGQgdGhlIHBhcnRpdGlvbnMgdGhlcmUgYXNzdW1p
bmcKPiArCQkJICogMzItYml0IGFkZHJlc3NpbmcuCj4gKwkJCSAqCj4gKwkJCSAqIElmIHlvdSBn
ZXQgdGhpcyB3YXJuaW5nIHlvdXIgZmlybXdhcmUgYW5kL29yIERUUwo+ICsJCQkgKiBzaG91bGQg
YmUgcmVhbGx5IGZpeGVkLgo+ICsJCQkgKgo+ICsJCQkgKiBUaGlzIGlzIHdvcmtpbmcgb25seSBm
b3IgZGV2aWNlcyBzbWFsbGVyIHRoYW4gNEdpQi4KPiArCQkJICovCj4gKwkJCXByX3dhcm4oIiVz
OiBvZnBhcnQgcGFydGl0aW9uICVwT0YgKCVwT0YpICNzaXplLWNlbGxzIGlzIHdyb25nbHkgc2V0
IHRvIDwwPiwgYXNzdW1pbmcgPDE+IGZvciBwYXJzaW5nIHBhcnRpdGlvbnMuXG4iLAo+ICsJCQkJ
IG1hc3Rlci0+bmFtZSwgcHAsCj4gKwkJCQkgbXRkX25vZGUpOwoKV2h5IG10ZF9ub2RlIG9uIGEg
bmV3IGxpbmU/CgpPdGhlcndpc2UgbG9va3MgZ29vZCB0byBtZS4KCj4gKwkJCXNfY2VsbHMgPSAx
Owo+ICsJCX0KPiAgCQlpZiAobGVuIC8gNCAhPSBhX2NlbGxzICsgc19jZWxscykgewo+ICAJCQlw
cl9kZWJ1ZygiJXM6IG9mcGFydCBwYXJ0aXRpb24gJXBPRiAoJXBPRikgZXJyb3IgcGFyc2luZyBy
ZWcgcHJvcGVydHkuXG4iLAo+ICAJCQkJIG1hc3Rlci0+bmFtZSwgcHAsCgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
