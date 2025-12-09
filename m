Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760B2D1CDC6
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Dec 2025 08:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=diwkqyC8eoLzl6paMlx0MIN5SU2YXqG48yK5UfQkCP0=; b=uXrHeEFbNWNzfE
	UCz31Bn8qn1sFuOtV4L5Vau7BxXn04tv1V9s6Lp7PM4stVxuUfzAmT9Hh9DOXgKTmmUOS699Eus5M
	J/e/qEIvXYLZ4qPhO+hXT64gVt9x5yn5i2/LhWE6ZPJAXoFpaktLTSBegaqCOR40E3xLPUhWCgoB2
	9O6bLTsMfAIRl7ihYiNUfOMMmYlVHIbApoHj1iQqDcXmhRbmGRen/Rq88kL6mCLVe7JyoNV1wb/tH
	LFx5C16fj/7EYZJEJ7AeKUoHryqZtBOinvDzJpCCJlla2+ET36PJKlJMmShPuZe2Lj16FHT3lODXI
	UznswnUy7A0M6m1Rw05Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vStWC-0000000E12e-1Czg;
	Tue, 09 Dec 2025 08:56:24 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vStW9-0000000E124-2uBG
	for linux-mtd@lists.infradead.org;
	Tue, 09 Dec 2025 08:56:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 518901A205F;
	Tue,  9 Dec 2025 08:56:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1FC43606E2;
	Tue,  9 Dec 2025 08:56:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 140EB11930273;
	Tue,  9 Dec 2025 09:56:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765270576; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7XAYIy5m4XDHHW42ASw9l4KsGWeIaRiPQXxJHdadqck=;
	b=aLgBTntcpF+oi1ylbi3o8ina5pzhuWz4nZ7Y+xYF8Ia2Dc8c8g5/oVE3FIC0ePRGB/V8kz
	6V6uD5NFsNF48VIQQo39zVK0Va3+CO6irXwg3QWFkaNxZWd0uLsVFXbGu2xa2eX6IwlSYo
	DqNF643cXw095SK7bthJrmOgW5ebekLcuZfy8yW8yLqhi8ORrv8blPIzkgMCbVcu0epkf2
	Gvqbr6rf2KozUO1tU+sjhbLvHPy5gYN0X+W0Y3OaMzWmCjvon2dQLafMJQKmEzYuS71/G0
	zvlLjAqjOIuSeiZzMzD/xiKj5rYBV5EFe9RnbWXYrF2e7MXBFhi1pcAYFGKK4w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: spinand: add support for Dosilicon
 DS35Q1GA/DS35M1GA
In-Reply-To: <20251209071604.36482-1-naseefkm@gmail.com> (Ahmed Naseef's
	message of "Tue, 9 Dec 2025 11:16:02 +0400")
References: <20251209071604.36482-1-naseefkm@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 09 Dec 2025 09:56:14 +0100
Message-ID: <87o6o8yqxd.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_005621_872021_6628B2A6 
X-CRM114-Status: GOOD (  11.22  )
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

SGVsbG8gQWhtZWQsCgpPbiAwOS8xMi8yMDI1IGF0IDExOjE2OjAyICswNCwgQWhtZWQgTmFzZWVm
IDxuYXNlZWZrbUBnbWFpbC5jb20+IHdyb3RlOgoKPiBBZGQgc3VwcG9ydCBmb3IgRG9zaWxpY29u
IERTMzVRMUdBICgzLjNWKSBhbmQgRFMzNU0xR0EgKDEuOFYpIFNQSSBOQU5ELgo+Cj4gVGhlc2Ug
YXJlIDFHYml0ICgxMjhNQikgZGV2aWNlcyB3aXRoOgo+ICAgLSAyMDQ4IGJ5dGUgcGFnZXMgKyA2
NCBieXRlIE9PQgo+ICAgLSA2NCBwYWdlcyBwZXIgYmxvY2ssIDEwMjQgYmxvY2tzCj4gICAtIE9u
LWRpZSA0LWJpdCBFQ0MgcGVyIDUxMiBieXRlIHNlY3Rvcgo+Cj4gVGhlIDY0LWJ5dGUgT09CIGFy
ZWEgaXMgZGl2aWRlZCBpbnRvIDQgc2VnbWVudHMgb2YgMTYgYnl0ZXMsIHdpdGggZWFjaAo+IHNl
Z21lbnQgY29udGFpbmluZyA4IGJ5dGVzIG9mIHVzZXIgZGF0YSAoTTIrTTEpIGFuZCA4IGJ5dGVz
IG9mIEVDQwo+IHBhcml0eSAoUjEpLiBUaGlzIHByb3ZpZGVzIDMwIGJ5dGVzIG9mIHVzYWJsZSBP
T0Igc3BhY2UgYWZ0ZXIgcmVzZXJ2aW5nCj4gMiBieXRlcyBmb3IgdGhlIGJhZCBibG9jayBtYXJr
ZXIuCj4KPiBUZXN0ZWQgb24gR2VuZXhpcyBQbGF0aW51bSA0NDEwIChFY29OZXQgRU43NTEyMjEp
IGJ5IHdyaXRpbmcga25vd24KPiBwYXR0ZXJucyB0byBPT0IgYW5kIHZlcmlmeWluZyBFQ0MgcGFy
aXR5IHBsYWNlbWVudCBpbiBSMSByZWdpb25zLgo+Cj4gRGF0YXNoZWV0Ogo+ICAgaHR0cHM6Ly93
d3cuZG9zaWxpY29uLmNvbS9yZXNvdXJjZXMvU1BJJTIwTkFORC9EUzM1WDFHQVhYWF9yZXYwOC5w
ZGYKPgo+IFNpZ25lZC1vZmYtYnk6IEFobWVkIE5hc2VlZiA8bmFzZWVma21AZ21haWwuY29tPgo+
IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gICAtIFJlYmFzZWQgb24gcmMxICh1cGRhdGVkIFNQSU5B
TkRfT1BfVkFSSUFOVFMgbWFjcm9zKQoKVGhhbmtzIGZvciB0aGlzIHYyLiBJdCBvdmVyYWxsIGxv
b2tzIGdvb2QgdG8gbWUgYnV0IHdlIGFyZSBpbiB0aGUgbWlkZGxlCm9mIHRoZSBtZXJnZSB3aW5k
b3csIHNvIHdoZW4gSSB3YXMgc2F5aW5nICJhdCAtcmMxIiBJIG1lYW50ICJ0aGUgbmV4dApvbmUi
IHdoaWNoIHdpbGwgYmUgdGFnZ2VkIG5leHQgU3VuZGF5LiBJdCBpcyBwcm9iYWJseSBmaW5lIGFz
LWlzIHRob3VnaCwKc28gSSdsbCB0cnkgdG8gYXBwbHkgdGhlIHBhdGNoIGFuZCB3aWxsIHRlbGwg
eW91IGlmIHRoZXJlIGFyZSBhbnkKY29uZmxpY3RzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
