Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A087EEB64D9
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLDbCvA7+R43lHs6C6TV+/kTYxtlIGc6zjv/9E5vrYs=; b=gGE8sPXGxA+X42
	hQ1orQ20EqBNqEqi8wWBuuXdqe84fglaxqHF0EzFUO5YgJHFhvrRATDq3jj2vodJMfXjwdEV2Jqi7
	8CaS2bYsXhfVjKftiGWSDwOS7uZx3/spUKsnvy5QHD1uKzBKEehkucdY0y9pKIt80Kz6ml1ePPfRi
	uZxXvs7hv8ub39+0bsejBdtFW27uoAwVoHXYNz3kg9Y4FKPWdgk0EwI4qRzbf0F4u9ieoAKu7zUr4
	5kJXWltXW5SJ7o0eBUrifSz2hTMKg3WGdpE4IyUH1m9o9j0s4oxdbVyQt/BZPPZfmHdedUR7MfVS3
	cZUXezzOoqCWVZ8bYOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbZY-00Cb5I-1I;
	Tue, 04 Jul 2023 08:39:44 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbZV-00Cb4W-00
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jul 2023 08:39:42 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688459975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yaA2+rSddJ2SEevn9A1wiLJ1xORl7llOV03jKS0VjRE=;
	b=U4IfMU3QiwiyTGIrHnsCUGK4Kjof+fXG1onUZFU6JTj9hRU3+5CwmlaE3sd8Fj4qVh5x5M
	sjUrf9sxymKT4RimABOjSs4WItlNJGaBGki+NHXDtorhGeIo6V6lysGxUgcNjTWjbpLblb
	Y9hdGHjPbxk/cyQDYrO/n2A/CubUyKCohMVWVpyvpq3fKlH/tyG8iN4dFAgOFbLzbTNar8
	9WlGjwjPf9KvhylmSb8xB6ccnqJRQibpoyNxp3gszl0Pa6ESrB8zTiCz2r6X/zdRoCKJPv
	Py+77dW00oTwVzkAWsvsC8Ek8BfLnKHuOIhHHcGNeo6OddEr+5jNXA0UuX0o6w==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCE7EE0005;
	Tue,  4 Jul 2023 08:39:33 +0000 (UTC)
Date: Tue, 4 Jul 2023 10:39:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle
 <michael@walle.cc>, linux-mtd@lists.infradead.org, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: clarify the need for spi-nor
 compatibles
Message-ID: <20230704103932.748679d1@xps-13>
In-Reply-To: <cba4c06c-65ed-141a-80e4-3731c3560ae9@linaro.org>
References: <20230616140054.2788684-1-miquel.raynal@bootlin.com>
	<cba4c06c-65ed-141a-80e4-3731c3560ae9@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_013941_350787_2B5624EC 
X-CRM114-Status: GOOD (  22.93  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gRnJpLCAzMCBKdW4g
MjAyMyAwOTozNjoxMCArMDEwMDoKCj4gSGksIE1pcXVlbCwKPiAKPiBPbiA2LzE2LzIzIDE1OjAw
LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gTW9zdCBTUEkgTk9SIGRldmljZXMgZG8gbm90IHJl
cXVpcmUgYSBzcGVjaWZpYyBjb21wYXRpYmxlLCB0aGVpciBJRCBjYW4KPiA+IGluIGdlbmVyYWwg
YmUgZGlzY292ZXJlZCB3aXRoIHRoZSBKRURFQyBSRUFEIElEIG9wY29kZS4gSW4gdGhpcyBjYXNl
LAo+ID4gb25seSB0aGUgImplZGVjLHNwaS1ub3IiIGdlbmVyaWMgY29tcGF0aWJsZSBpcyBleHBl
Y3RlZC4gQ2xhcmlmeSB0aGlzCj4gPiBpbmZvcm1hdGlvbiBpbiB0aGUgY29tcGF0aWJsZSBkZXNj
cmlwdGlvbiB0byAoaSkgaGVscCBkZXZpY2UtdHJlZQo+ID4gd3JpdGVycyBhbmQgKGlpKSBwcmV2
ZW50IGZ1cnRoZXIgYXR0ZW1wdHMgdG8gZXh0ZW5kIHRoaXMgbGlzdCB3aXRoCj4gPiB1c2VsZXNz
IGluZm9ybWF0aW9uLiAgCj4gCj4gU291bmRzIGdvb2QuIElmIHlvdSBkb24ndCBtaW5kIEknbGwg
cmV3b3JkIHRoZSBkZXNjcmlwdGlvbiBmcm9tIGJlbG93Cj4gd2hlbiBhcHBseWluZy4KCk9mIGNv
dXJzZS4gSSB0aGluayB5b3UncmUgcmlnaHQgdG8gZnVydGhlciBzcGVjaWZ5IHRoZSBleGFjdApz
cGVjaWZpY2F0aW9uIG5hbWUuCgo+IAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwgfCA2ICsrKystLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2pl
ZGVjLHNwaS1ub3IueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
amVkZWMsc3BpLW5vci55YW1sCj4gPiBpbmRleCA3MTQ5Nzg0YTM2YWMuLmJlZjA3MTE2M2UzOCAx
MDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVk
ZWMsc3BpLW5vci55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbAo+ID4gQEAgLTQzLDggKzQzLDEwIEBAIHByb3BlcnRp
ZXM6Cj4gPiAgICAgICAgICAgIC0gY29uc3Q6IGplZGVjLHNwaS1ub3IKPiA+ICAgICAgICAtIGNv
bnN0OiBqZWRlYyxzcGktbm9yCj4gPiAgICAgIGRlc2NyaXB0aW9uOgo+ID4gLSAgICAgIE11c3Qg
YWxzbyBpbmNsdWRlICJqZWRlYyxzcGktbm9yIiBmb3IgYW55IFNQSSBOT1IgZmxhc2ggdGhhdCBj
YW4gYmUKPiA+IC0gICAgICBpZGVudGlmaWVkIGJ5IHRoZSBKRURFQyBSRUFEIElEIG9wY29kZSAo
MHg5RikuCj4gPiArICAgICAgU1BJIE5PUiBmbGFzaGVzIGNvbXBhdGlibGUgd2l0aCB0aGUgSkVE
RUMgc3RhbmRhcmQgb3Igd2hpY2ggbWF5IGJlICAKPiAKPiBzL0pFREVDL0pFREVDMjE2LCBzL21h
eS9jYW4KPiAKPiA+ICsgICAgICBpZGVudGlmaWVkIHdpdGggdGhlIEpFREVDIFJFQUQgSUQgb3Bj
b2RlICgweDlGKSBkbyBub3QgZGVzZXJ2ZSBhICAKPiAKPiAiZGVzZXJ2ZSIgaXMgYSBsaXR0bGUg
aGFyc2guIEhvdyBhYm91dCAibXVzdCBiZSBtYXRjaGVkIGFnYWluc3QKPiB0aGUgZ2VuZXJpYyAu
Li4iLgo+IAo+IEZvciBmdXR1cmUgbWU6IDB4OWYgaXMgbm90IGEgSkVERUMyMTYgb3Bjb2RlLCBp
dCBqdXN0IGhhcHBlbmVkCj4gdGhhdCB0aGUgaW5kdXN0cnkgYWdyZWVkIG9uIGEgc3BlY2lmaWMg
b3Bjb2RlIGZvciByZWFkaW5nIHRoZQo+IElEIG9mIHRoZSBmbGFzaC4gSkVERUMyMTYgZG9lc24n
dCBjYXJlIGFib3V0IHRoZSBmbGFzaCdzIElELgo+IFdlIGNhcmUgYmVjYXVzZSBvZiB0aGUgZml4
dXAgaG9va3MuCj4gCj4gQ2hlZXJzLAo+IHRhCj4gPiArICAgICAgc3BlY2lmaWMgY29tcGF0aWJs
ZS4gVGhleSBzaG91bGQgaW5zdGVhZCBvbmx5IGJlIG1hdGNoZWQgYWdhaW5zdAo+ID4gKyAgICAg
IHRoZSBnZW5lcmljICJqZWRlYyxzcGktbm9yIiBjb21wYXRpYmxlLgo+ID4gIAo+ID4gICAgcmVn
Ogo+ID4gICAgICBtaW5JdGVtczogMSAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
