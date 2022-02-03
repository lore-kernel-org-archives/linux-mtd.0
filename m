Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D934C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Feb 2022 16:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cgQth6BWuLHp3tuCSXmmwhZ/4FleHFkmy8irzbDiP9s=; b=NQ4Nrc1gXVZ9d+
	cHMBBtrAVnxWX8Bz96eBJaDFK0IcHnkmD9eLO2AlQqWYrwQYXfMv4StIAl5nIwwfZt5jgqWmaq6Gb
	Kgjmav+N7QLjVRk2oJs5tdDbKh5Ewc6WDzDLG7oUwdvMTjvCXn6mQfRmYM3nXWeb9aVQuKO4CGyho
	BxK5tUzTw52Yz5R+pVGu4mA0Er3txMZzmJFHGxIXJP6nsE5mpdVHSxH1hanQtRK3k7yZAolfJ+KjD
	Hce3z/9s7x3Tq0xOt01N18r07BpYro+HTUDJjwurIuqmpZrTzGJ5+vQaiQU2eraEuFtKDkJJ5R9PS
	JsBBuyI7XKBJvHdbgpfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFfPJ-0023WE-JE; Thu, 03 Feb 2022 16:56:29 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFfPF-0023U7-IJ
 for linux-mtd@lists.infradead.org; Thu, 03 Feb 2022 16:56:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DFB55C0004;
 Thu,  3 Feb 2022 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643907379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W0jSBYJYNVVKk+rv6PFxNqt0J0d+Gm942h0iR17woVA=;
 b=NgKC8vmwilXSNLQ/4Q+vBS+ywB596sC4eiVr2h3VOOkc1u13TPr1JZzOLcwUOK0w8/ihSL
 XLp5e7XzXxQwgKwgCSUjoTCA2rZ3T0ssFSeFXQXfRW5pnp4VMzTOyOQUDTdjLtZCi7gVUV
 RX7FAU/nSGOcQ+7v6W0plDXMGXtCU2X5A+wAHwqhbQuB1iCclhUrm9g/clkm17Ag6pV0Jz
 dobw3W7CXiVXhxObkM8RlkA19lQ8duduJ1EKUwPcIsYNZgPGtfRhA6MWQ/uxjiOg7lV9an
 MTpRE8uOVpzlXzL8ZI7MucW/d2TcoDSiBUXdhjyNDSYSvgypZ7OOYBJqb+t/UA==
Date: Thu, 3 Feb 2022 17:56:16 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <git@xilinx.com>, David Oberhollenzer
 <david.oberhollenzer@sigma-star.at>
Subject: Re: [RFC PATCH] mtd: tests: Fix eraseblock read speed
 miscalculation for lower partition sizes
Message-ID: <20220203175616.14f85dc1@xps13>
In-Reply-To: <20220203132434.25769-1-amit.kumar-mahapatra@xilinx.com>
References: <20220203132434.25769-1-amit.kumar-mahapatra@xilinx.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_085625_964884_D5D87EC3 
X-CRM114-Status: GOOD (  29.89  )
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

SGkgQW1pdCwKCitDYzogRGF2aWQsIHdobydzIG1haW50YWluaW5nIHRoZSB0b29scy4gUGxlYXNl
IGtlZXAgaGltIGluIHRoZQpyZWNpcGllbnRzIGxpc3QhCgphbWl0Lmt1bWFyLW1haGFwYXRyYUB4
aWxpbnguY29tIHdyb3RlIG9uIFRodSwgMyBGZWIgMjAyMiAxODo1NDozNCArMDUzMDoKCj4gV2hp
bGUgY2FsY3VsYXRpbmcgc3BlZWQgZHVyaW5nICBtdGRfc3BlZWR0ZXN0LCB0aGUgdGltZSBpbnRl
cnZhbAo+IChpLmUuLCBzdGFydCAtIGZpbmlzaCkgaXMgcm91bmRlZCBvZmYgdG8gdGhlIG5lYXJl
c3QgbWlsbGlzZWNvbmRzIGJ5Cj4gaWdub3JpbmcgdGhlIGZyYWN0aW9uYWwgcGFydC4gVGhpcyBs
ZWFkcyB0byBtaXNjYWxjdWxhdGlvbiBvZiBzcGVlZC4KPiBUaGUgbWlzY2FsY3VsYXRpb24gaXMg
bW9yZSB2aXNpYmxlIHdoaWxlIHJ1bm5pbmcgc3BlZWQgdGVzdCBvbiBzbWFsbAo+IHBhcnRpdGlv
biBzaXplcyhpLmUuLCB3aGVuIHBhcnRpdGlvbiBzaXplIGlzIGVxdWFsIHRvIGVyYXNlYmxvY2sg
c2l6ZSBvcgo+IHR3aWNlIHRoZSBlcmFzZWJsb2NrIHNpemUpIGF0IGhpZ2hlciBzcGkgZnJlcXVl
bmNpZXMuCj4gCj4gRm9yIGUuZy4sIHdoaWxlIGNhbGN1bGF0aW5nIGVyYXNlYmxvY2sgcmVhZCBz
cGVlZCBmb3IgYSBtdGQgcGFydGl0aW9uIHdpdGgKPiBzaXplIGVxdWFsIHRvIHRoZSBlcmFzZWJs
b2NrIHNpemUoaS5lLiwgNjRLaUIpIHRoZSBlcmFzZWJsb2NrIHJlYWQgdGltZQo+IGludGVydmFs
IGNvbWVzIG91dCB0byBiZSA5NjY0OTAgbmFub3NlY29uZC4gVGhpcyBpcyB0aGVuIGNvbnZlcnRl
ZCB0bwo+IG1pbGxpc2Vjb25kKGkuZS4sIDAuOTY2IG1zZWMuKS4gVGhlIGludGVnZXIgcGFydCAo
aS5lLiwgMCBtc2VjKSBvZiB0aGUKPiB2YWx1ZSBpcyBjb25zaWRlcmVkIGFuZCB0aGUgZnJhY3Rp
b25hbCBwYXJ0IChpLmUuLCAwLjk2NikgaXMgaWdub3JlZCxmb3IKPiBjYWxjdWxhdGluZyB0aGUg
ZXJhc2VibG9jayByZWFkIHNwZWVkLiBTbyB0aGUgcmVwb3J0ZWQgZXJhc2VibG9jayByZWFkCj4g
c3BlZWQgaXMgMCBLaUIvcywgd2hpY2ggaXMgaW5jb3JyZWN0Lgo+IAo+IFRoZXJlIGFyZSB0d28g
YXBwcm9hY2hlcyB0byBmaXggdGhpcyBpc3N1ZS4KPiAKPiBGaXJzdCBhcHByb2FjaCB3aWxsIGJl
IHRvIGtlZXAgdGhlIHRpbWUgaW50ZXJ2YWwgaW4gbWlsbGlzZWNvbmQuIGFuZCByb3VuZAo+IHVw
IHRoZSBpbnRlZ2VyIHZhbHVlLCB3aXRoIHRoaXMgYXBwcm9hY2ggdGhlIDAuOTY2bXNlYyB0aW1l
IGludGVydmFsIGluIHRoZQo+IGFib3ZlIGV4YW1wbGUgd2lsbCBiZSByb3VuZGVkIHVwIHRvIDFt
c2VjIGFuZCB0aGlzIHZhbHVlIGlzIHVzZWQgZm9yCj4gY2FsY3VsYXRpbmcgdGhlIHNwZWVkLiBE
b3duc2lkZSBvZiB0aGlzIGFwcHJvYWNoIGlzIHRoYXQgdGhlIHJlcG9ydGVkIHNwZWVkCj4gaXMg
c3RpbGwgbm90IGFjY3VyYXRlLgo+IAo+IFNlY29uZCBhcHByb2FjaCB3aWxsIGJlIHRvIGNvbnZl
cnQgdGhlIHRpbWUgaW50ZXJ2YWwgdG8gbWljcm9zZWNvbmRzCj4gaW5zdGVhZCBvZiBtaWxsaXNl
Y29uZHMsIHdpdGggdGhpcyBhcHByb2FjaCB0aGUgOTY2NDkwIG5hbm9zZWNvbmQgdGltZQo+IGlu
dGVydmFsIGluIHRoZSBhYm92ZSBleGFtcGxlIHdpbGwgYmUgY29udmVydGVkIHQwIDk2Ni40OTB1
c2VjIGFuZCB0aGlzCj4gdmFsdWUgaXMgdXNlZCBmb3IgY2FsY3VsYXRpbmcgdGhlIHNwZWVkLiBB
cyBjb21wYXJlZCB0byB0aGUgY3VycmVudAo+IGltcGxlbWVudGF0aW9uIGFuZCB0aGUgc3VnZ2Vz
dGVkIEZpcnN0IGFwcHJvYWNoLCB0aGlzIGFwcHJvYWNoIHdpbGwgcmVwb3J0Cj4gYSBtb3JlIGFj
Y3VyYXRlIHNwZWVkLiBEb3duc2lkZSBvZiB0aGlzIGFwcHJvYWNoIGlzIHRoYXQsIGluIGZ1dHVy
ZSBpZiB0aGUKPiBtdGQgc2l6ZSBpcyB0b28gbGFyZ2UgdGhlbiB0aGUgdTY0IHZhcmlhYmxlLCB0
aGF0IGhvbGRzIHRoZSBudW1iZXIgb2YKPiBieXRlcywgbWlnaHQgb3ZlcmZsb3cuCj4gCj4gSW4g
dGhpcyBwYXRjaCB3ZSBoYXZlIGdvbmUgd2l0aCB0aGUgc2Vjb25kIGFwcHJvYWNoIGFzIHRoaXMg
cmVwb3J0cyBhIG1vcmUKPiBhY2N1cmF0ZSBzcGVlZC4gV2l0aCB0aGlzIGFwcHJvYWNoIHRoZSBl
cmFzZWJsb2NrIHJlYWQgc3BlZWQgaW4gdGhlIGFib3ZlCj4gZXhhbXBsZSBjb21lcyBvdXQgdG8g
YmUgMTMyNTA1IEtpQi9zIHdoZW4gdGhlIHNwaSBjbG9jayBpcyBjb25maWd1cmVkIGF0Cj4gMTUw
TWh6Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFtaXQgS3VtYXIgTWFoYXBhdHJhIDxhbWl0Lmt1bWFy
LW1haGFwYXRyYUB4aWxpbnguY29tPgo+IC0tLQo+IEJSQU5DSDogbXRkL25leHQKPiAtLS0KPiAg
ZHJpdmVycy9tdGQvdGVzdHMvc3BlZWR0ZXN0LmMgfCAxMCArKysrKy0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL3Rlc3RzL3NwZWVkdGVzdC5jIGIvZHJpdmVycy9tdGQvdGVzdHMvc3BlZWR0
ZXN0LmMKPiBpbmRleCA5M2U3NjY0OGY2NzYuLjJiNzZlNzc1MGM2OCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL210ZC90ZXN0cy9zcGVlZHRlc3QuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3Rlc3RzL3Nw
ZWVkdGVzdC5jCj4gQEAgLTE2MSwxMyArMTYxLDEzIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzdG9w
X3RpbWluZyh2b2lkKQo+ICBzdGF0aWMgbG9uZyBjYWxjX3NwZWVkKHZvaWQpCj4gIHsKPiAgCXVp
bnQ2NF90IGs7Cj4gLQlsb25nIG1zOwo+ICsJbG9uZyB1czsKClNob3VsZCB0aGlzIGJlIGFuIGV4
cGxpY2l0IDY0LWJpdCB2YWx1ZT8gQW5kIHVuc2lnbmVkPwp1bnNpZ25lZCBsb25nIGxvbmcgaW50
IG9yIHVpbnQ2NF90PyBJIGJlbGlldmUgd2UgYXJlIG5vdyAxMDAweCBjbG9zZXIKdG8gdGhlIDRH
aUIgbGltaXQgc28gd2UgbWlnaHQgbmVlZCB0byBlbmxhcmdlIHRoaXMgdmFyaWFibGUuCgo+ICAK
PiAtCW1zID0ga3RpbWVfbXNfZGVsdGEoZmluaXNoLCBzdGFydCk7Cj4gLQlpZiAobXMgPT0gMCkK
PiArCXVzID0ga3RpbWVfdXNfZGVsdGEoZmluaXNoLCBzdGFydCk7Cj4gKwlpZiAodXMgPT0gMCkK
PiAgCQlyZXR1cm4gMDsKPiAtCWsgPSAodWludDY0X3QpZ29vZGViY250ICogKG10ZC0+ZXJhc2Vz
aXplIC8gMTAyNCkgKiAxMDAwOwo+IC0JZG9fZGl2KGssIG1zKTsKPiArCWsgPSAodWludDY0X3Qp
Z29vZGViY250ICogKG10ZC0+ZXJhc2VzaXplIC8gMTAyNCkgKiAxMDAwMDAwOwo+ICsJZG9fZGl2
KGssIHVzKTsKPiAgCXJldHVybiBrOwo+ICB9Cj4gIAoKT3RoZXJ3aXNlIGxndG0hCgpSZXZpZXdl
ZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
