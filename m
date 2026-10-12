Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C33ACC6B12
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 17:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0wsMwjWiWiapcuWsi1VQxQMDt+tJhyKSnWopKIJvE8=; b=3xUlU131Zy4n28
	wtVTRgKyMKCjQQDTpH+0YGiQ0qTX1MQq716RiwKAwrJxU1Wi0fl0KGyyQiAR+otboJIFZUG5GoaHE
	DVqB0JIqmmK9pgGm7ZrpLhAXs0yQzCszVtACrcPcqD4635XRg3j2sYSkAPIjGyM5/TscArpFnHxno
	QQ6obUaKaAH/Vk0gWCWDQuebZrjS3WmuHqQ0G5KGrAEQi9wujqA/cxR3ttL/iF07owEfTARBY/gxe
	wsGnZGb1JG4UPiSDF+ZBtYIzDSImV7WlLOJ+IuJSSznhr+vUPo7AgbCmqUVNx9KZ1nPp8Gr5DrjgB
	pxq9Dxet/RFcfmzbDjIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGghZ-0000000DlqT-2Ene;
	Tue, 13 Oct 2026 17:54:13 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGghX-0000000DloQ-0xu1
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 17:54:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 85ADD4E41210
	for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 17:54:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 535DB60362
	for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 17:54:09 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 7175C11D718B2; Tue, 13 Oct 2026 19:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914048; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bw7bv2pnfae4cMWiRM1MW1DbGUPZqrWolE0VMUTTkds=;
	b=wp/Z4+k8UmsDHQVf2MFJ2FjKZXSbGKrzdfkrdz5hH5nJjQL8rF9+zwBBt9gNXQe47YKZxM
	WdcP9SfDm0L3dH1KiFV/1GlmaWqxSwWHqIO9L8TF7Hl7RpjFIOigl7jpO0VSpjwMpPNPab
	fFjz21niE5rKhxwvpMO3SHfgOX7vua8MozIqCIUvuryAOA229+mfbjEjWnveR4T5LVAmpe
	g7coKlQfRScZEYOL07I5pXORn7sS4ypZG35uti4HxuThUB8CvRbvYjcJcC4/XZ2kKiih2T
	C7pZQHoR1jfQrDmzTTj7UdoAgp98Ca53naEXxqEltQKAd8EczzbEoRFhS1QkHg==
Authentication-Results: mail.galae.net;
	none
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Masahiro Yamada
 <yamada.masahiro@socionext.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  Brian Norris <computersforpeace@gmail.com>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
In-Reply-To: <CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
	(James Hilliard's message of "Mon, 12 Oct 2026 12:26:00 -0600")
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
	<20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
	<8733ua23xs.fsf@bootlin.com>
	<CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 21:06:28 +0200
Message-ID: <877bjmzqkr.fsf@bootlin.com>
MIME-Version: 1.0
X-TUID: +aYWktH/6v0I
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 7175C11D718B2
X-Spamd-Result: default: False [1.31 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.09)[59.59%];
	MIME_TRACE(0.00)[0:+];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	URIBL_BLOCKED(0.00)[bootlin.com:mid,bootlin.com:email,localhost:rdns,localhost:helo];
	FREEMAIL_TO(0.00)[gmail.com];
	BCC(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nod.at,ti.com,kernel.org,gmail.com,sholland.org,bootlin.com,socionext.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_ZERO(0.00)[0];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	TO_DN_SOME(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105411_548523_A4C71EBC 
X-CRM114-Status: GOOD (  38.34  )
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

T24gMTIvMTAvMjAyNiBhdCAxMjoyNjowMCAtMDYsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKCj4gT24gTW9uLCBPY3QgMTIsIDIwMjYgYXQgMTI6MDLi
gK9QTSBNaXF1ZWwgUmF5bmFsCj4gPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+
Pgo+PiBIaSBKYW1lcywKPj4KPj4gT24gMTQvMDkvMjAyNiBhdCAxNTowOTo0NyAtMDYsIEphbWVz
IEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPj4KPj4gPiBBIHRp
bWVkLW91dCB3YWl0IGNhbiByZXR1cm4gd2hpbGUgdGhlIGludGVycnVwdCBoYW5kbGVyIGlzIHN0
aWxsIHVzaW5nCj4+ID4gdGhlIHByZXZpb3VzIG9wZXJhdGlvbidzIGludGVycnVwdCBzdGF0dXMg
YW5kIGVuYWJsZSBtYXNrLiBTdGFydGluZyB0aGUKPj4gPiBuZXh0IHdhaXQgY2FsbHMgaW5pdF9j
b21wbGV0aW9uKCkgb24gdGhlIHNhbWUgb2JqZWN0LCB3aGljaCBjYW4gcmVzZXQgaXRzCj4+ID4g
d2FpdHF1ZXVlIGxvY2sgd2hpbGUgdGhlIG9sZCBoYW5kbGVyIGNhbGxzIGNvbXBsZXRlKCkuIFRo
ZSBvbGQgaGFuZGxlcgo+PiA+IGNhbiBhbHNvIGNvbXBsZXRlIHRoZSBuZXcgd2FpdCBvciByZXN0
b3JlIGFuIG9ic29sZXRlIGludGVycnVwdCBtYXNrLgo+PiA+Cj4+ID4gSW5pdGlhbGl6ZSB0aGUg
Y29tcGxldGlvbiBvbmNlIGluIHByb2JlIGFuZCB1c2UgcmVpbml0X2NvbXBsZXRpb24oKSBmb3IK
Pj4gPiBlYWNoIGludGVycnVwdC1kcml2ZW4gd2FpdC4gT24gdGltZW91dCwgZGlzYWJsZSBhbmQg
c3luY2hyb25pemUgdGhlIElSUQo+PiA+IGJlZm9yZSBtYXNraW5nIGNvbnRyb2xsZXIgaW50ZXJy
dXB0cyBhbmQgYWNrbm93bGVkZ2luZyB0aGUgd2FpdGVkLWZvcgo+PiA+IGV2ZW50cy4gRHJhaW5p
bmcgdGhlIGhhbmRsZXIgZmlyc3QgYWxzbyBwcmV2ZW50cyBhIHBhcnRpYWwtZXZlbnQgaGFuZGxl
cgo+PiA+IGZyb20gcmV3cml0aW5nIHRoZSBlbmFibGUgbWFzayBhZnRlciBpdCBoYXMgYmVlbiBj
bGVhcmVkLiBGbHVzaCB0aGVzZQo+PiA+IHJlZ2lzdGVyIHdyaXRlcyBiZWZvcmUgcmUtZW5hYmxp
bmcgdGhlIElSUSBsaW5lLCBsZWF2aW5nIHRoZSBjb250cm9sbGVyJ3MKPj4gPiBpbnRlcnJ1cHQg
c291cmNlcyBtYXNrZWQuCj4+ID4KPj4gPiBGb3Igc3VjY2Vzc2Z1bCB3YWl0cywgbW92ZSBjb21w
bGV0ZSgpIGFmdGVyIHRoZSBoYW5kbGVyJ3MgcmVnaXN0ZXIgdXBkYXRlcwo+PiA+IHNvIHRoYXQg
dGhlIG5leHQgb3BlcmF0aW9uIGNhbm5vdCByYWNlIHdpdGggdGhvc2UgdXBkYXRlcy4gS2VlcCBw
b2xsaW5nCj4+ID4gdW5jaGFuZ2VkIGFuZCBsZWF2ZSBjb250cm9sbGVyIGFuZCBETUEgYWJvcnQg
aGFuZGxpbmcgdG8gdGhlIGV4aXN0aW5nCj4+ID4gY2FsbGVycy4KPj4gPgo+PiA+IEZpeGVzOiAx
ZmVmNjJjMTQyM2IgKCJtdGQ6IG5hbmQ6IGFkZCBzdW54aSBOQU5EIGZsYXNoIGNvbnRyb2xsZXIg
c3VwcG9ydCIpCj4+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4gPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPj4gPiAtLS0K
Pj4KPj4gU28gZnJvbSB0aGUgY29tbWl0IGxvZyBJIHVuZGVyc3RhbmQgdGhhdCB5b3UgYXJlIGZp
eGluZyBhIHJhY2UuIFRoZQo+PiBwcm9ibGVtIHNlZW1zIGxlZ2l0aW1hdGUuCj4+Cj4+ID4gIGRy
aXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysr
LS0tLS0tCj4+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQo+PiA+Cj4+Cj4+IC4uLgo+Pgo+PiA+IEBAIC00MTQsMTIgKzQxNiwxMyBAQCBzdGF0aWMg
aXJxcmV0dXJuX3Qgc3VueGlfbmZjX2ludGVycnVwdChpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4+
ID4gICAgICAgaWYgKCEoaWVuICYgc3QpKQo+PiA+ICAgICAgICAgICAgICAgcmV0dXJuIElSUV9O
T05FOwo+PiA+Cj4+ID4gLSAgICAgaWYgKChpZW4gJiBzdCkgPT0gaWVuKQo+PiA+IC0gICAgICAg
ICAgICAgY29tcGxldGUoJm5mYy0+Y29tcGxldGUpOwo+PiA+IC0KPj4gPiArICAgICAvKiBGaW5p
c2ggdXBkYXRpbmcgdGhlIGludGVycnVwdCBzdGF0ZSBiZWZvcmUgd2FraW5nIHRoZSBuZXh0IG9w
ZXJhdGlvbi4gKi8KPj4gPiAgICAgICB3cml0ZWwoc3QgJiBORkNfSU5UX01BU0ssIG5mYy0+cmVn
cyArIE5GQ19SRUdfU1QpOwo+PiA+ICAgICAgIHdyaXRlbCh+c3QgJiBpZW4gJiBORkNfSU5UX01B
U0ssIG5mYy0+cmVncyArIE5GQ19SRUdfSU5UKTsKPj4gPgo+PiA+ICsgICAgIGlmICgoaWVuICYg
c3QpID09IGllbikKPj4gPiArICAgICAgICAgICAgIGNvbXBsZXRlKCZuZmMtPmNvbXBsZXRlKTsK
Pj4gPiArCj4+ID4gICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOwo+PiA+ICB9Cj4+ID4KPj4gPiBA
QCAtNDM1LDE2ICs0MzgsMTkgQEAgc3RhdGljIGludCBzdW54aV9uZmNfd2FpdF9ldmVudHMoc3Ry
dWN0IHN1bnhpX25mYyAqbmZjLCB1MzIgZXZlbnRzLAo+PiA+ICAgICAgICAgICAgICAgdGltZW91
dF9tcyA9IE5GQ19ERUZBVUxUX1RJTUVPVVRfTVM7Cj4+ID4KPj4gPiAgICAgICBpZiAoIXVzZV9w
b2xsaW5nKSB7Cj4+ID4gLSAgICAgICAgICAgICBpbml0X2NvbXBsZXRpb24oJm5mYy0+Y29tcGxl
dGUpOwo+PiA+ICsgICAgICAgICAgICAgcmVpbml0X2NvbXBsZXRpb24oJm5mYy0+Y29tcGxldGUp
Owo+Pgo+PiBUaGUgd2hvbGUgY2hhbmdlIGFyb3VuZCAocmUpaW5pdF9jb21wbGV0aW9uIGxvb2tz
IHJlbGV2YW50IChoZXJlIGFuZCBpbiB0aGUgaGFuZGxlcikuCj4+Cj4+ID4KPj4gPiAgICAgICAg
ICAgICAgIHdyaXRlbChldmVudHMsIG5mYy0+cmVncyArIE5GQ19SRUdfSU5UKTsKPj4gPiAgICAg
ICAgICAgICAgIHJldCA9IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmbmZjLT5jb21wbGV0
ZSwKPj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXNl
Y3NfdG9famlmZmllcyh0aW1lb3V0X21zKSk7Cj4+ID4gLSAgICAgICAgICAgICBpZiAoIXJldCkK
Pj4gPiArICAgICAgICAgICAgIGlmICghcmV0KSB7Cj4+ID4gKyAgICAgICAgICAgICAgICAgICAg
IC8qIERyYWluIHRoZSBoYW5kbGVyIGJlZm9yZSBpdCBjYW4gcmVzdG9yZSBhbiBvbGQgSVJRIG1h
c2suICovCj4+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRpc2FibGVfaXJxKG5mYy0+aXJxKTsK
Pj4KPj4gZGlzYWJsZV9pcnEoKSBmb3Igc2VyaWFsaXppbmcgYWNjZXNzZXMgdG8gYSBzaW5nbGUg
cmVnaXN0ZXI/Cj4KPiBUaGUgaW50ZW50aW9uIHdhcyB0byBkcmFpbiBhbiBpbi1mbGlnaHQgaGFu
ZGxlciBiZWZvcmUgY2xlYW5pbmcgdXAgdGhlCj4gdGltZWQtb3V0IHdhaXQsIHJhdGhlciB0aGFu
IGp1c3Qgc2VyaWFsaXplIHRoZSByZWdpc3RlciB3cml0ZS4KCkkgZ3Vlc3MgaGVyZSB5b3UgcmVs
YXRlIHRvIHRoZSByYWNlIGV4cGxhaW5lZCBiZWxvdy4KCj4gZGlzYWJsZV9pcnEoKSBwcm92aWRl
cyB0aGF0IHN5bmNocm9uaXphdGlvbiBhcyB3ZWxsIGFzIG1hc2tpbmcgdGhlIGxpbmUuCj4gSXQg
aXMgb25seSB1c2VkIG9uIHRpbWVvdXQsIGFuZCB0aGlzIElSUSBpcyByZXF1ZXN0ZWQgd2l0aG91
dAo+IElSUUZfU0hBUkVELgoKVGhpcyBpcyBjbGVhcmx5IGRlYmF0YWJsZSwgc2luY2Ugd2UgY2Fu
IGlkZW50aWZ5IHRoZSBJUlEsIHRoYXQgZmxhZwpjb3VsZCAoc2hvdWxkLCBtYXliZSkgaGF2ZSBi
ZWVuIHNldC4gV2l0aCB5b3VyIGFwcHJvYWNoIGl0IHdvdWxkIGhhdmUKYmVlbiBldmVuIG1vcmUg
aW1wYWN0aW5nLiBCdXQgdGhhdCdzIG5vdCB0aGUgcG9pbnQuCgo+IEEgc3BpbmxvY2sgY291bGQg
YWxzbyBhZGRyZXNzIHRoaXMsIHByb3ZpZGVkIGl0IGNvdmVycyB0aGUgaGFuZGxlcidzCj4gc3Rh
dHVzL2VuYWJsZSByZWFkcyB0aHJvdWdoIGNvbXBsZXRlKCksIHRvZ2V0aGVyIHdpdGggdGhlIHdh
aXRlcidzCj4gY2xlYW51cCBhbmQgcmVhcm1pbmcuIFByb3RlY3Rpbmcgb25seSB0aGUgcmVnaXN0
ZXIgd3JpdGVzIHdvdWxkIGxlYXZlCj4gdGhlIGhhbmRsZXIgYWJsZSB0byBhY3Qgb24gYW4gb2xk
IHNuYXBzaG90LgoKSSdtIG5vdCBzdXJlIHdoYXQgeW91IGNhbGwgIm9ubHkgdGhlIHJlZ2lzdGVy
IHdyaXRlcyIsIHlvdSBjYW4gY2FsbApjb21wbGV0ZSgpIGZyb20gd2l0aGluIHRoZSBsb2NrIGlm
IHRoYXQgbWFrZXMgc2Vuc2UgZm9yIHRoaXMgY2FzZSwKeWVzLiBjb21wbGV0ZSgpIGRvZXMgbm90
IGJsb2NrIHNvIGl0IGlzIGZpbmUuCgouLi4KCj4+IGNvbW1pdCBsb2csIEkgbm93IGRpc2FncmVl
IHdpdGggdGhlIGZpcnN0IHBhcnQgb2Y6Cj4+Cj4+ID5UaGUgb2xkIGhhbmRsZXIgY2FuIGFsc28g
Y29tcGxldGUgdGhlIG5ldyB3YWl0IG9yIHJlc3RvcmUgYW4gb2Jzb2xldGUgaW50ZXJydXB0IG1h
c2suCj4+Cj4+ICJjb21wbGV0ZSB0aGUgbmV3IHdhaXQiPyBJIGRvbid0IHNlZSBob3cgYSBzdGFs
ZSBoYW5kbGVyIGNvbXBsZXRlcyB0aGUKPj4gbmV4dCB3YWl0IGdpdmVuIHRoZSBoYW5kbGVyIGlz
IGEgaGFyZCBJUlEgYW5kIHRoZSBpbnRlcnJ1cHQgZW5hYmxlCj4+IHJlZ2lzdGVyIGlzIGNsZWFy
ZWQgb24gdGltZW91dC4KPgo+IFRoZSBjYXNlIEkgaGFkIGluIG1pbmQgaXMgYW4gYWxyZWFkeS1y
dW5uaW5nIGhhbmRsZXIgb24gYW5vdGhlciBDUFU6Cj4KPiBDUFUgMDogUmVhZCBzdCBhbmQgaWVu
IGZvciBvcGVyYXRpb24gQS4KPiBDUFUgMTogVGltZSBvdXQgb3BlcmF0aW9uIEEsIG1hc2svYWNr
bm93bGVkZ2UgaXRzIGludGVycnVwdHMsCj4gICAgICAgIHRoZW4gZXZlbnR1YWxseSByZWluaXRp
YWxpemUgdGhlIGNvbXBsZXRpb24gZm9yIG9wZXJhdGlvbiBCLgo+IENQVSAwOiBDYWxsIGNvbXBs
ZXRlKCkgYmFzZWQgb24gdGhlIHNhdmVkIHN0IGFuZCBpZW4gZnJvbSBvcGVyYXRpb24gQS4KCkZv
ciB0aGlzIHRvIGZpcmUsIHRoZSBoYXJkIElSUSBoYW5kbGVyIG9uIENQVTAgd291bGQgaGF2ZSB0
byBiZSBzdG9wcGVkCmJldHdlZW4gcmVhZGluZyBzdC9pZW4gYW5kIGNhbGxpbmcgY29tcGxldGUo
KSBsb25nIGVub3VnaCB0byBzcGFuOgotIEEncyB0aW1lb3V0Ci0gQSdzIGNsZWFudXAKLSBCJ3Mg
d2FpdCBiZWluZyByZWFybWVkCk9uIHRoaXMgaGFyZHdhcmUsIGhvdyBpcyB0aGlzIHJlYWNoYWJs
ZT8KCj4gQ2xlYXJpbmcgdGhlIGRldmljZSdzIGVuYWJsZSByZWdpc3RlciBkb2VzIG5vdCBpbnZh
bGlkYXRlIHRob3NlIGxvY2FsCj4gdmFsdWVzIG9yIHdhaXQgZm9yIHRoZSBydW5uaW5nIGhhbmRs
ZXIgdG8gZmluaXNoLiBIYXJkLUlSUSBjb250ZXh0Cj4gcHJldmVudHMgdGhpcyBvdmVybGFwIG9u
IHRoZSBzYW1lIENQVSwgYnV0IG5vdCBhY3Jvc3MgQ1BVcy4KPgo+IFRoYXQgZGlzdGluY3Rpb24g
d2FzIG5vdCBleHBsaWNpdCBlbm91Z2ggaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBJJ20KPiBvcGVu
IHRvIGEgZGlmZmVyZW50IGltcGxlbWVudGF0aW9uOyB0aGUgcmVxdWlyZW1lbnQgSSB3YW50ZWQg
dG8gcHJlc2VydmUKPiBpcyB0aGF0IHRoZSBvbGQgaGFuZGxlciBjYW5ub3QgdXBkYXRlIHRoZSBt
YXNrIG9yIHNpZ25hbCB0aGUgY29tcGxldGlvbgo+IGFmdGVyIHRoZSB3YWl0ZXIgaGFzIGNsZWFu
ZWQgdXAgYW5kIHJldXNlZCBpdC4KCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
