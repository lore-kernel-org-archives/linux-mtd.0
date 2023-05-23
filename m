Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76C4C7EE26
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 18:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4ocNCDxxzZkzvOCnmiYeHz+A36UQBd211fVsyGk69c=; b=zXo4s2OlvVWOv/
	P/QiFWNuMd4QG52cjz1ZmJtTITgEefhvgBKKCstpBTXuQqXdHNrRZ0v29zmOEqf7SbkEN12KUCIou
	kjfej5Lv1p40SDg+g/0zmcSF3shhp6hE9BEopbgFpBbQOPoCNmDXP2P5mw8+4TQudSsXYOMzcJ2HH
	A+zPeyZ/EZiK+PkRWshsUNIqMzEFL2qjSqPF7CSjhJ4KkUrJ8bD9WfD7iiFsrroHWFRo97ZZawz+1
	ywmrVRWmQ1rQp8A7Wm87vcTKLVKzP6t0TfGY1yhaunEycz6zguDKCyPGGCn9KmYd+2QlKu0jKAM1b
	DYbdxAfwWeZuMraG0Gtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Wse-00B8Zj-2r;
	Tue, 23 May 2023 18:37:08 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Wsc-00B8Xt-0X
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 18:37:07 +0000
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-94f9cd65b1aso108858566b.0
        for <linux-mtd@lists.infradead.org>; Tue, 23 May 2023 11:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684867022; x=1687459022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOckud4CsGpi42vHzY/iN1xEHfyZzu8tYLlnQmf3XXU=;
        b=NMpeQMMaUGXvV9fAq2g9Solafw9TAjrKd6Bv5kVCgh1GBiV5z5va6Zx5kw7hEZIChY
         cvQTARTsUftS4arSvpLASptRTuu7OkeizpDYozNstyB6cRoMGhv+fceeD97JySpN6ySH
         VIIxZX0Ijc4NOTFzFM0i7DdMqfls6S7yQEHWKRo2LS33sEw/AL/NA28fXMAFXx/ZYkAA
         HlNFEDMWW6G0kvf5vgdUSl+HiqESPqG6HunEX3Ekz+fcOFf0Uj90c8Hq2k6PyTd6CK3p
         t8ku6P1s0Ii3BFCECW+oMCB/NRJQFPtudqZ2TxnmbiaWWppal3QVx1yNzJa4pW5oK6Kg
         368w==
X-Gm-Message-State: AC+VfDyNlCbdzjbfwyrZgirkgL4+f8apTQ0UKSo2nBSxMCNBE+zQ9JLK
	mUJBWej5cF1v9SXOVXGK7HnhF23ttYuQ0XR1J2Y=
X-Google-Smtp-Source: ACHHUZ6nbFDPqkJycDJLopbKTUzhoYKAgpRsCSCy+ygpw6i+jItGXHdrxW/6BlRArGGvUIQ7qUgo8pqVVYhtrNaQv8U=
X-Received: by 2002:a17:906:6495:b0:966:2210:4065 with SMTP id
 e21-20020a170906649500b0096622104065mr14890560ejm.4.1684867022285; Tue, 23
 May 2023 11:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230523074535.249802-1-hch@lst.de> <20230523074535.249802-22-hch@lst.de>
In-Reply-To: <20230523074535.249802-22-hch@lst.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 23 May 2023 20:36:51 +0200
Message-ID: <CAJZ5v0grAY02dx__4=ezxT=HuPU=2gD6bErV2fYTQiv5mRL1yg@mail.gmail.com>
Subject: Re: [PATCH 21/24] PM: hibernate: don't use early_lookup_bdev in resume_store
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Mike Snitzer <snitzer@kernel.org>, 
	Joern Engel <joern@lazybastard.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>, dm-devel@redhat.com, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_113706_201203_9DFCC4EA 
X-CRM114-Status: GOOD (  24.57  )
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

T24gVHVlLCBNYXkgMjMsIDIwMjMgYXQgOTo0NuKAr0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToKPgo+IHJlc3VtZV9zdG9yZSBpcyBhIHN5c2ZzIGF0dHJpYnV0ZSB3cml0
dGVuIGR1cmluZyBub3JtYWwga2VybmVsIHJ1bnRpbWUsCj4gYW5kIGl0IHNob3VsZCBub3QgdXNl
IHRoZSBlYXJseV9sb29rdXBfYmRldiBBUEkgdGhhdCBieXBhc3NlcyBhbGwgbm9ybWFsCj4gcGF0
aCBiYXNlZCBwZXJtaXNzaW9uIGNoZWNraW5nLCBhbmQgbWlnaHQgY2F1c2UgcHJvYmxlbXMgd2l0
aCBjZXJ0YWluCj4gY29udGFpbmVyIGVudmlyb25tZW50cyByZW5hbWluZyBkZXZpY2VzLgo+Cj4g
U3dpdGNoIHRvIGxvb2t1cF9iZGV2LCB3aGljaCBkb2VzIGEgbm9ybWFsIHBhdGggbG9va3VwIGlu
c3RlYWQsIGFuZCBmYWxsCj4gYmFjayB0byB0cnlpbmcgdG8gcGFyc2UgYSBudW1lcmljIGRldl90
IGp1c3QgbGlrZSBlYXJseV9sb29rdXBfYmRldiBkaWQuCj4KPiBOb3RlIHRoYXQgdGhpcyBzdHJp
Y3RseSBzcGVha2luZyBjaGFuZ2VzIHRoZSBrZXJuZWwgQUJJIGFzIHRoZSBQQVJUVVVJRD0KPiBh
bmQgUEFSVExBQkVMPSBzdHlsZSBzeW50YXggaXMgbm93IG5vdCBhdmFpbGFibGUgZHVyaW5nIGEg
cnVubmluZwo+IHN5c3RlbXMuICBUaGV5IG5ldmVyIHdlcmUgaW50ZW5kZWQgZm9yIHRoYXQsIGJ1
dCB0aGlzIGJyZWFrcyB0aGluZ3MKPiB3ZSdsbCBoYXZlIHRvIGZpZ3VyZSBvdXQgYSB3YXkgdG8g
bWFrZSB0aGVtIGF2YWlsYWJsZSBhZ2Fpbi4gIEJ1dCBpZgo+IGF2b2lkYWJsZSBpbiBhbnkgd2F5
IEknZCByYXRoZXIgYXZvaWQgdGhhdC4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxs
d2lnIDxoY2hAbHN0LmRlPgo+IEZpeGVzOiA0MjFhNWZhMWE2Y2YgKCJQTSAvIGhpYmVybmF0ZTog
dXNlIG5hbWVfdG9fZGV2X3QgdG8gcGFyc2UgcmVzdW1lIikKCkFja2VkLWJ5OiBSYWZhZWwgSi4g
V3lzb2NraSA8cmFmYWVsQGtlcm5lbC5vcmc+Cgo+IC0tLQo+ICBrZXJuZWwvcG93ZXIvaGliZXJu
YXRlLmMgfCAxOCArKysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9rZXJuZWwvcG93ZXIvaGli
ZXJuYXRlLmMgYi9rZXJuZWwvcG93ZXIvaGliZXJuYXRlLmMKPiBpbmRleCBjNTJkZWRiOWY3Yzhl
OC4uN2FlOTVlYzcyZjk5MDIgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL3Bvd2VyL2hpYmVybmF0ZS5j
Cj4gKysrIGIva2VybmVsL3Bvd2VyL2hpYmVybmF0ZS5jCj4gQEAgLTExNzgsNyArMTE3OCwyMyBA
QCBzdGF0aWMgc3NpemVfdCByZXN1bWVfc3RvcmUoc3RydWN0IGtvYmplY3QgKmtvYmosIHN0cnVj
dCBrb2JqX2F0dHJpYnV0ZSAqYXR0ciwKPiAgICAgICAgIGlmICghbmFtZSkKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FTk9NRU07Cj4KPiAtICAgICAgIGVycm9yID0gZWFybHlfbG9va3VwX2Jk
ZXYobmFtZSwgJmRldik7Cj4gKyAgICAgICBlcnJvciA9IGxvb2t1cF9iZGV2KG5hbWUsICZkZXYp
Owo+ICsgICAgICAgaWYgKGVycm9yKSB7Cj4gKyAgICAgICAgICAgICAgIHVuc2lnbmVkIG1haiwg
bWluLCBvZmZzZXQ7Cj4gKyAgICAgICAgICAgICAgIGNoYXIgKnAsIGR1bW15Owo+ICsKPiArICAg
ICAgICAgICAgICAgaWYgKHNzY2FuZihuYW1lLCAiJXU6JXUlYyIsICZtYWosICZtaW4sICZkdW1t
eSkgPT0gMiB8fAo+ICsgICAgICAgICAgICAgICAgICAgc3NjYW5mKG5hbWUsICIldToldToldTol
YyIsICZtYWosICZtaW4sICZvZmZzZXQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmZHVtbXkpID09IDMpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBkZXYgPSBNS0RFViht
YWosIG1pbik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKG1haiAhPSBNQUpPUihkZXYp
IHx8IG1pbiAhPSBNSU5PUihkZXYpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZXJyb3IgPSAtRUlOVkFMOwo+ICsgICAgICAgICAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGRldiA9IG5ld19kZWNvZGVfZGV2KHNpbXBsZV9zdHJ0b3VsKG5hbWUsICZw
LCAxNikpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICgqcCkKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGVycm9yID0gLUVJTlZBTDsKPiArICAgICAgICAgICAgICAgfQo+
ICsgICAgICAgfQo+ICAgICAgICAga2ZyZWUobmFtZSk7Cj4gICAgICAgICBpZiAoZXJyb3IpCj4g
ICAgICAgICAgICAgICAgIHJldHVybiBlcnJvcjsKPiAtLQo+IDIuMzkuMgo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
