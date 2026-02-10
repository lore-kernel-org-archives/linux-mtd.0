Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE28EA8118
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Feb 2026 13:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6gs/nfYCMhZ4ABQVim++5zN6kpDQoZ6q+OtoBxhA1ws=; b=Ejnwwa0XmXhplP
	qrEBUuth/phcRx4KFw2OWe3u3l6y/EgDOA92IKZwqIWAvsbb+cCmnANc8g/9DjwsgpB14KigQ0Fgt
	l0VUFjUxBw9tlYH6I7ZuMcADyVec8RvQV5WtTQeQ9ZyvXqVGoHDbodt4dnZb/J3ldyOGEbQmrlv35
	PrucgGAwsWxv6mU7ldtWBmFsTmqFYT71GLUz6ZX5Cipl/2JiwEH7gFJQnggyKY2bC9C4zulNEU594
	xXSjRBLRhHdqATU4KekqnIswcPGd/3qdj2x+QzunoeF4MO7CvFO99IhLl2SSoJPN3WB4Qhd8OU5mT
	6fOKj6W9lxhlMzmFgmeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpo66-0000000H0nG-1gAW;
	Tue, 10 Feb 2026 13:48:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpo64-0000000H0ms-1ojR
	for linux-mtd@lists.infradead.org;
	Tue, 10 Feb 2026 13:48:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 14E5943748
	for <linux-mtd@lists.infradead.org>; Tue, 10 Feb 2026 13:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8324C16AAE
	for <linux-mtd@lists.infradead.org>; Tue, 10 Feb 2026 13:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770731287;
	bh=LmTxtKmCP+MxuknULWOn/5V7LbPqudyZbQ+Sx9xXVso=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RUeXRF2QWMxpn668kj5QsJ99lYkwXz+GkL3jGpmBW7XQfAIU9XfJHi/PgGih1PXd7
	 n6rF2/tFfdVilrStVWymtyehG3pe/8IJvXAq6UScAeBDkzlCmeo1j3f/As0JS8VYSb
	 vT19OkE7soD1L8eTijwW3agyxHDqsusX1+4D4iArLgY+fyj1lfiktXUhoz0tozw2ak
	 YbJuTakw8uKJDkAH8e+oddTJGMNzrEOaknFzm4Ba3XRg+bj0/L68g7yRCMjiqI1po+
	 C24rL+vwqhgTQUmnwE7yZ+SO09mIVxKYS4HnLL60r2l9LF5XXANMlDHzVlghghoj4X
	 uzJ3DIuKZwzEw==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6580dbdb41eso1175773a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 10 Feb 2026 05:48:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeFlrLwD93jYVz3gM1peU6np8C7XKlEHkVKHdVzYZo+UNOS3IF2qJ3y+JwBn5OunWZtOHet3p4M2U=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOt6G3FJmCoc1JgaWJ0F9VrwycX+G7vXe0Lqg7NljiJCQnMIzs
	P1mSV40jTN1Grf5v9AkB0FmZr0L583sFnt4V+FVok488IIGTOoKtevHSRIP50aMn+G7TqyoG8td
	EM19ong0g+neqaKttanhqGQ2sH7Nbgw==
X-Received: by 2002:a05:6402:34c2:b0:64b:5f4e:9e6d with SMTP id
 4fb4d7f45d1cf-6598416c3dbmr8257225a12.18.1770731286484; Tue, 10 Feb 2026
 05:48:06 -0800 (PST)
MIME-Version: 1.0
References: <20260122-spear-v1-1-fd44bc79695b@gmail.com>
In-Reply-To: <20260122-spear-v1-1-fd44bc79695b@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Feb 2026 07:47:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJhnuWzPxUWywZkjt=zc0nSFKP7hM_ekmKKr7p_jXaaag@mail.gmail.com>
X-Gm-Features: AZwV_QhIFz36bxFd9be2-_8um1iPQH6w35jojRXwkeKdwVtXGhkeLtoijsXwqTY
Message-ID: <CAL_JsqJhnuWzPxUWywZkjt=zc0nSFKP7hM_ekmKKr7p_jXaaag@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: st,spear600-smi: convert to DT schema
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_054808_513490_41E90ABA 
X-CRM114-Status: GOOD (  21.03  )
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

T24gVGh1LCBKYW4gMjIsIDIwMjYgYXQgMTA6MjPigK9BTSBBa2hpbGEgWVMgPGFraGlsYXlhbG1h
dGlAZ21haWwuY29tPiB3cm90ZToKPgo+IENvbnZlcnQgU1RNaWNyb2VsZWN0cm9uaWNzIFNQRUFy
NjAwIFNlcmlhbCBNZW1vcnkgSW50ZXJmYWNlIChTTUkpCj4gQ29udHJvbGxlciBiaW5kaW5nIHRv
IFlBTUwgZm9ybWF0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQWtoaWxhIFlTIDxha2hpbGF5YWxtYXRp
QGdtYWlsLmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NwZWFyX3Nt
aS50eHQgICAgICAgICAgfCAyOSAtLS0tLS0tLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3N0LHNwZWFyNjAwLXNtaS55YW1sICAgfCA3MiArKysrKysrKysrKysrKysrKysrKysrCj4g
IDIgZmlsZXMgY2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGVhcl9z
bWkudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGVhcl9zbWku
dHh0Cj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggYzQxODczZTkyZDI2Li4wMDAw
MDAwMDAwMDAKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Nw
ZWFyX3NtaS50eHQKPiArKysgL2Rldi9udWxsCj4gQEAgLTEsMjkgKzAsMCBAQAo+IC0qIFNQRUFy
IFNNSQo+IC0KPiAtUmVxdWlyZWQgcHJvcGVydGllczoKPiAtLSBjb21wYXRpYmxlIDogInN0LHNw
ZWFyNjAwLXNtaSIKPiAtLSByZWcgOiBBZGRyZXNzIHJhbmdlIG9mIHRoZSBtdGQgY2hpcAo+IC0t
ICNhZGRyZXNzLWNlbGxzLCAjc2l6ZS1jZWxscyA6IE11c3QgYmUgcHJlc2VudCBpZiB0aGUgZGV2
aWNlIGhhcyBzdWItbm9kZXMKPiAtICByZXByZXNlbnRpbmcgcGFydGl0aW9ucy4KPiAtLSBpbnRl
cnJ1cHRzOiBTaG91bGQgY29udGFpbiB0aGUgU1RNTUFDIGludGVycnVwdHMKPiAtLSBjbG9jay1y
YXRlIDogRnVuY3Rpb25hbCBjbG9jayByYXRlIG9mIFNNSSBpbiBIego+IC0KPiAtT3B0aW9uYWwg
cHJvcGVydGllczoKPiAtLSBzdCxzbWktZmFzdC1tb2RlIDogRmxhc2ggc3VwcG9ydHMgcmVhZCBp
biBmYXN0IG1vZGUKPiAtCj4gLUV4YW1wbGU6Cj4gLQo+IC0gICAgICAgc21pOiBmbGFzaEBmYzAw
MDAwMCB7Cj4gLSAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3BlYXI2MDAtc21pIjsK
PiAtICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gLSAgICAgICAgICAgICAg
ICNzaXplLWNlbGxzID0gPDE+Owo+IC0gICAgICAgICAgICAgICByZWcgPSA8MHhmYzAwMDAwMCAw
eDEwMDA+Owo+IC0gICAgICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZ2aWMxPjsKPiAt
ICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwxMj47Cj4gLSAgICAgICAgICAgICAgIGNsb2Nr
LXJhdGUgPSA8NTAwMDAwMDA+OyAgICAgICAgLyogNTBNSHogKi8KPiAtCj4gLSAgICAgICAgICAg
ICAgIGZsYXNoQGY4MDAwMDAwIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBzdCxzbWktZmFz
dC1tb2RlOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIC4uLgo+IC0gICAgICAgICAgICAgICB9
Owo+IC0gICAgICAgfTsKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9zdCxzcGVhcjYwMC1zbWkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvc3Qsc3BlYXI2MDAtc21pLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uOGZlMjdhYWU3NTI3Cj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3Qsc3BlYXI2MDAtc21p
LnlhbWwKPiBAQCAtMCwwICsxLDcyIEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChH
UEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9zdCxzcGVhcjYwMC1zbWkueWFtbCMKPiArJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+
ICt0aXRsZTogU1RNaWNyb2VsZWN0cm9uaWNzIFNQRUFyNjAwIFNlcmlhbCBNZW1vcnkgSW50ZXJm
YWNlIChTTUkpIENvbnRyb2xsZXIKPiArCj4gK21haW50YWluZXJzOgo+ICsgIC0gUmljaGFyZCBX
ZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPiArCj4gK2Rlc2NyaXB0aW9uOgo+ICsgIFRoZSBT
UEVBcjYwMCBTZXJpYWwgTWVtb3J5IEludGVyZmFjZSAoU01JKSBpcyBhIGRlZGljYXRlZCBzZXJp
YWwgZmxhc2gKPiArICBjb250cm9sbGVyIHN1cHBvcnRpbmcgdXAgdG8gZm91ciBjaGlwIHNlbGVj
dHMgZm9yIHNlcmlhbCBOT1IgZmxhc2hlcwo+ICsgIGNvbm5lY3RlZCBpbiBwYXJhbGxlbC4gVGhl
IGNvbnRyb2xsZXIgaXMgbWVtb3J5LW1hcHBlZCBhbmQgdGhlIGF0dGFjaGVkCj4gKyAgZmxhc2gg
ZGV2aWNlcyBhcHBlYXIgaW4gdGhlIENQVSBhZGRyZXNzIHNwYWNlLlRoZSBkcml2ZXIKPiArICAo
ZHJpdmVycy9tdGQvZGV2aWNlcy9zcGVhcl9zbWkuYykgcHJvYmVzIHRoZSBhdHRhY2hlZCBmbGFz
aGVzCj4gKyAgZHluYW1pY2FsbHkgYnkgc2VuZGluZyBjb21tYW5kcyAoZS5nLiwgUkRJRCkgdG8g
ZWFjaCBiYW5rLgo+ICsgIEZsYXNoIHN1YiBub2RlcyBkZXNjcmliZSB0aGUgbWVtb3J5IHJhbmdl
IGFuZCBvcHRpb25hbCBwZXItZmxhc2gKPiArICBwcm9wZXJ0aWVzLgo+ICsKPiArYWxsT2Y6Cj4g
KyAgLSAkcmVmOiBtdGQueWFtbCMKPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0aWJsZToK
PiArICAgIGNvbnN0OiBzdCxzcGVhcjYwMC1zbWkKPiArCj4gKyAgcmVnOgo+ICsgICAgbWF4SXRl
bXM6IDEKPiArCj4gKyAgaW50ZXJydXB0czoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgICIj
YWRkcmVzcy1jZWxscyI6Cj4gKyAgICBjb25zdDogMQo+ICsKPiArICAiI3NpemUtY2VsbHMiOgo+
ICsgICAgY29uc3Q6IDEKPiArCj4gKyAgY2xvY2stcmF0ZToKPiArICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ICsgICAgZGVzY3JpcHRpb246IEZ1bmN0
aW9uYWwgY2xvY2sgcmF0ZSBvZiB0aGUgU01JIGNvbnRyb2xsZXIgaW4gSHouCj4gKwo+ICsgIHN0
LHNtaS1mYXN0LW1vZGU6Cj4gKyAgICB0eXBlOiBib29sZWFuCj4gKyAgICBkZXNjcmlwdGlvbjog
SW5kaWNhdGVzIHRoYXQgdGhlIGF0dGFjaGVkIGZsYXNoIHN1cHBvcnRzIGZhc3QgcmVhZCBtb2Rl
Lgo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSBjb21wYXRpYmxlCj4gKyAgLSByZWcKPiArICAtIGNs
b2NrLXJhdGUKPiArCj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiArCj4gK2V4YW1w
bGVzOgo+ICsgIC0gfAo+ICsgICAgZmxhc2hAZmMwMDAwMDAgewo+ICsgICAgICAgIGNvbXBhdGli
bGUgPSAic3Qsc3BlYXI2MDAtc21pIjsKPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsK
PiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKPiArICAgICAgICByZWcgPSA8MHhmYzAwMDAw
MCAweDEwMDA+Owo+ICsgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JnZpYzE+Owo+ICsgICAg
ICAgIGludGVycnVwdHMgPSA8MTI+Owo+ICsgICAgICAgIGNsb2NrLXJhdGUgPSA8NTAwMDAwMDA+
OyAgLyogNTAgTUh6ICovCj4gKwo+ICsgICAgICAgIGZsYXNoQGY4MDAwMDAwIHsKClRoaXMgaXMg
bm93IGEgd2FybmluZyBpbiBsaW51eC1uZXh0OgoKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9zdCxzcGVhcjYwMC1zbWkuZXhhbXBsZS5kdGI6CmZsYXNoQGZjMDAwMDAwIChz
dCxzcGVhcjYwMC1zbWkpOiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QKYWxsb3dlZCAo
J2ZsYXNoQGY4MDAwMDAwJyB3YXMgdW5leHBlY3RlZCkKICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9zdCxzcGVhcjYwMC1zbWkueWFtbAoK
UGxlYXNlIHNlbmQgYSBmaXggKGFuZCB0ZXN0IHlvdXIgc2NoZW1hcyBiZWZvcmUgc2VuZGluZyku
CgpSb2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
