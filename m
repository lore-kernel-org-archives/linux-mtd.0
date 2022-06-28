Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C720C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 14:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2qF0rzZZtgYkB6amv0w7j3oc3mJiETfWWjYZ2MgP4w=; b=JnCz2gSCTv80Rn
	8ud9pmccXlihIRBBSx+mjHH8S2+gwAjT9atMqiAFveo2u/nUfk/b3HG2uvW7nhCWVEnkiQxU/+ICB
	hk8c6OrWrBNzl3SrDUWfYu8JvxwXSbqrMH3my7VUBiezh9YKdpMIigRdUnWdj3cRxIuFDJqhRFByd
	8W9r4vbyU8pgORqX2oTUQcqUKIrCiEDeJp0TEhjkZwzSjIMq3dfq6zlNgsw+8v2A7OC1kw4cNn0/y
	XRhuRB7MDsvv03kZEXqcloBIE+VnGmh8KcQpxr5oC7LaFt6tuRxUtN9aHkjzJB2YSoO+5l7dmDyRu
	ojBrDpyz71tDVBHaq8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6CMp-006kY5-Gz; Tue, 28 Jun 2022 14:39:03 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6CMl-006kVE-Gl
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 14:39:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7626510000E;
	Tue, 28 Jun 2022 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656427132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WsNOELfNmIxzQ7L2JBSj8agbCQSyUjW6SfWZR6bYZWA=;
	b=mGygbv+Beb+GbEw5LbZy//jxGsgoZZ9PrMfy6SH6QiLzOpVhEf1cCZbYpcj7lRU4ftC1QY
	qe25Dqe754qKebRkedmmxMqFxiiWV/Vcp1+KDif21GKvgtsr9h7WgtK9Qpf0Dkp/YdwqUq
	8KhOm/c9ljtLFqAHfHZz9qu/vH/ICLODzjnqCxkaK1qsRwIgsH1foh35qAXdIuWmVpwyYI
	SctsafuGYgLaZfFKjzi8yr+stqR6Ma/mwt7yTtqQFszxBQDTP76gdYKpw500xCXG/2MZV9
	OSDUiBaEI1bou1zGrOBYw/y1KvcdB+sP+6oJLQEGehErmvx6p65lKDHa1UKjCw==
Date: Tue, 28 Jun 2022 16:38:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tlanger@maxlinear.com, rtanwar@maxlinear.com,
 richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH RFC v1 0/8] intel-nand-controller: Fixes, cleanups and
 questions
Message-ID: <20220628163850.17c56935@xps-13>
In-Reply-To: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
References: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_073859_858908_490E0E81 
X-CRM114-Status: GOOD (  30.44  )
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

SGkgTWFydGluLAoKbWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbSB3cm90ZSBvbiBU
dWUsIDI4IEp1biAyMDIyIDEzOjI3OjIzCiswMjAwOgoKPiBIZWxsbywKPiAKPiBJIGFtIHRyeWlu
ZyB0byByZXBsYWNlIHRoZSB4d2F5X25hbmQgZHJpdmVyICh3aGljaCBpcyBzdGlsbCB1c2luZyB0
aGUKPiBsZWdhY3kgTkFORCBBUEkpIHdpdGggdGhlIGludGVsLW5hbmQtY29udHJvbGxlciBkcml2
ZXIuIFRoZSBJbnRlbCBMR00KPiBJUCAoZm9yIHdoaWNoIGludGVsLW5hbmQtY29udHJvbGxlciB3
YXMgaW1wbGVtZW50ZWQpIHVzZXMgYSBuZXdlcgo+IHZlcnNpb24gb2YgdGhlIEVCVSBOQU5EIGFu
ZCBIU05BTkQgSVAgZm91bmQgaW4gTGFudGlxIFhXQVkgU29Dcy4gVGhlCj4gbW9zdCBub3RhYmxl
IGNoYW5nZSBpcyB0aGUgYWRkaXRpb24gb2YgSFNOQU5EIEludGVsIExHTSBTb0NzIChpdCdzIG5v
dAo+IGNsZWFyIHRvIG1lIGlmL3doaWNoIExhbnRpcSBTb0NzIGFsc28gaGF2ZSB0aGlzIERNQSBl
bmdpbmUpLgo+IAo+IFdoaWxlIHRlc3RpbmcgbXkgY2hhbmdlcyBvbiBhIExhbnRpcSB4UlgyMDAg
U29DIEkgY2FtZSBhY3Jvc3Mgc29tZQo+IGlzc3VlcyB3aXRoIHRoZSBpbnRlbC1uYW5kLWNvbnRy
b2xsZXIgZHJpdmVyLiBUaGUgcHJvYmxlbXMgSSBmb3VuZCBhcmU6Cj4gMSkgTWlzbWF0Y2ggYmV0
d2VlbiBkdC1iaW5kaW5ncyBhbmQgZHJpdmVyIGltcGxlbWVudGF0aW9uIChjb21wYXRpYmxlCj4g
ICAgc3RyaW5nLCBwYXRjaCAjMSBhbmQgcGF0Y2ggIzQpIGFuZCBoYXJkd2FyZSBjYXBhYmlsaXRp
ZXMgKG51bWJlciBvZgo+ICAgIENTIGxpbmVzLCBwYXRjaCAjMSkuCj4gMikgVGhlIGRyaXZlciBy
ZWFkcyB0aGUgQ1MgKGNoaXAgc2VsZWN0KSBsaW5lIGZyb20gdGhlIE5BTkQgY29udHJvbGxlcidz
Cj4gICAgcmVnIHByb3BlcnR5LiBJbiB0aGUgZHQtYmluZGluZ3MgZXhhbXBsZSB0aGlzIGlzIDB4
ZTBmMDAwMDAuIEkgZG9uJ3QKPiAgICB1bmRlcnN0YW5kIGhvdyB0aGlzIGNhbiBldmVuIHdvcmsg
b24gSW50ZWwgU29Dcy4gTXkgdW5kZXJzdGFuZGluZyBpcwo+ICAgIHRoYXQgaXQgbXVzdCBiZSBy
ZWFkIGZyb20gdGhlIE5BTkQgY2hpcCAoY2hpbGQgbm9kZSkuCgpZZXMKCj4gMykgQSBmZXcgc21h
bGxlciBjb2RlIGNsZWFudXBzIHRvIG1ha2UgdGhlIGRyaXZlciBlYXNpZXIgdG8gdW5kZXJzdGFu
ZAo+ICAgIChwYXRjaGVzICM1IHRvICM4KQo+IDQpIEkgdHJpZWQgdG8gdW5kZXJzdGFuZCB0aGUg
dGltaW5nIHBhcmFtZXRlciBjYWxjdWxhdGlvbiBjb2RlIGJ1dCBmb3VuZAo+ICAgIHRoYXQgaXQg
cHJvYmFibHkgZG9lc24ndCB3b3JrIG9uIHRoZSBJbnRlbCBMR00gU29DcyBlaXRoZXIuIFRoZQo+
ICAgIGR0LWJpbmRpbmdzIGV4YW1wbGUgdXNlIGNsb2NrIElEIDEyNSB3aGljaCBpcyBMR01fR0NM
S19FQlUuIFNvIGZhcgo+ICAgIHRoaXMgaXMgZmluZSBiZWNhdXNlIEVCVSBpcyB0aGUgYWN0dWFs
IElQIGJsb2NrIGZvciB0aGUgTkFORAo+ICAgIGludGVyZmFjZS4gSG93ZXZlciwgZHJpdmVycy9j
bGsveDg2L2Nsay1sZ20uYyBkZWZpbmVzIHRoaXMgY2xvY2sgYXMKPiAgICBhIGdhdGUgd2l0aG91
dCBhIHBhcmVudCwgc28gaXQncyByYXRlIChhcyByZWFkIGJ5IExpbnV4KSBpcyBhbHdheXMgMC4K
PiAgICBUaGUgaW50ZWwtbmFuZC1jb250cm9sbGVyIGRyaXZlciB0aGVuIHRyaWVzIHRvIGNhbGN1
bGF0ZToKPiAgICAgIHJhdGUgPSBjbGtfZ2V0X3JhdGUoY3RybC0+Y2xrKSAvIEhaX1BFUl9NSFoK
PiAgICAocmF0ZSB3aWxsIGJlIDAgYmVjYXVzZSBjbGtfZ2V0X3JhdGUoKSByZXR1cm5zIDApIGFu
ZCB0aGVuOgo+ICAgICAgRElWX1JPVU5EX1VQKFVTRUNfUEVSX1NFQywgcmF0ZSkKPiAgICAodGhp
cyB0aGVuIHRyaWVzIHRvIGRpdmlkZSBieSB6ZXJvKQo+IAo+IEJlZm9yZSB0aGlzIHNlcmllcyBp
cyBhcHBsaWVkIGl0IHdvdWxkIGJlIGdyZWF0IHRvIGhhdmUgdGhlc2UgcXVlc3Rpb25zCj4gYW5z
d2VyZWQ6Cj4gLSBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhlIGNoaXAgc2VsZWN0IGxpbmUg
KHJlZyBwcm9wZXJ0eSBvZiB0aGUKPiAgIE5BTkQgY29udHJvbGxlcidzIGNoaWxkIG5vZGUpIHJl
ZmVycyB0byB0aGUgY2hpcCBzZWxlY3QgbGluZSBvZiB0aGUKPiAgIGNvbnRyb2xsZXIuIExldCdz
IHNheSB3ZSBoYXZlIGEgY29udHJvbGxlciB3aXRoIHR3byBDUyBsaW5lcy4gQSBOQU5ECj4gICBm
bGFzaCBjaGlwICh3aGljaCBhIHNpbmdsZSBjaGlwIHNlbGVjdCBsaW5lKSBpcyBjb25uZWN0ZWQg
dG8gdGhlCj4gICBzZWNvbmQgQ1MgbGluZSBvZiB0aGUgY29udHJvbGxlci4gSXMgbXkgdW5kZXJz
dGFuZGluZyBjb3JyZWN0IHRoYXQKPiAgIHRoZSBOQU5EIGNoaXAgZGV2aWNlLXRyZWUgbm9kZSBz
aG91bGQgZ2V0IHJlZyA9IDwxPiBpbiB0aGlzIGNhc2U/CgpZZXMKCj4gLSBXaG8gZnJvbSBNYXhs
aW5lYXIgKHdobyB0b29rIG92ZXIgSW50ZWwncyBBbnlXQU4gZGl2aXNpb24sIHdoaWNoCj4gICBw
cmV2aW91c2x5IHdvcmtlZCBvbiB0aGUgZHJpdmVycyBmb3IgdGhlIEludGVsIExHTSBTb0NzKSBj
YW4gc2VuZCBhCj4gICBwYXRjaCB0byBjb3JyZWN0IHRoZSBMR01fR0NMS19FQlUgY2xvY2sgcmF0
ZSBpbgo+ICAgZHJpdmVycy9jbGsveDg2L2Nsay1sZ20uYz8gT3IgaXMgTEdNIGRlYWQgYW5kIHRo
ZSB2YXJpb3VzIGRyaXZlcnMKPiAgIHNob3VsZCBiZSByZW1vdmVkIGluc3RlYWQ/Cj4gLSBXaG8g
ZnJvbSBNYXhsaW5lYXIgY2FuIHByb3ZpZGUgaW5zaWdodHMgaW50byB3aGljaCBjbG9jayBpcyBj
b25uZWN0ZWQKPiAgIHRvIHRoZSBFQlUgTkFORCBjb250cm9sbGVyIG9uIExhbnRpcSBYV0FZIChE
YW51YmUsIHhSWDEwMCwgeFJYMjAwLAo+ICAgeFJYMzAwKSBTb0NzIGFzIHdlbGwgYXMgbmV3ZXIg
R1JYMzUwL0dSWDU1MCBTb0NzIHNvIHRoYXQgSSBjYW4gbWFrZQo+ICAgdGhlIGludGVsLW5hbmQt
Y29udHJvbGxlciB3b3JrIHdpdGhvdXQgaGFyZGNvZGVkIHRpbWluZyBzZXR0aW5ncyBvbgo+ICAg
dGhlIFhXQVkgU29Dcz8KPiAKPiBEdWUgdG8gdGhlIHNldmVyaXR5IG9mIGlzc3VlcyAyKSBhbmQg
NCkgYWJvdmUgSSBhbSB0YXJnZXRpbmcgbGludXgtbmV4dAo+IHdpdGggdGhpcyBzZXJpZXMuIElu
IG15IG9waW5pb24gdGhlcmUncyBubyBwb2ludCBpbiBiYWNrcG9ydGluZyB0aGVzZQo+IGZpeGVz
IHRvIGEgZHJpdmVyIHdoaWNoIGhhcyBiZWVuIGJyb2tlbiBzaW5jZSBpdCB3YXMgdXBzdHJlYW1l
ZC4KClRoZSBjaGFuZ2VzIGxvb2sgZ29vZCB0byBtZSwgcGxlYXNlIHJlc2VuZCB3aXRoIHRoZSBi
aW5kaW5ncyBmaWxlIG5hbWUKZml4ZWQgYW5kIHdlIHNob3VsZCBiZSBnb29kLgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
