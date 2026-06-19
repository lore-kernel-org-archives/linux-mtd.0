Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C20CD4F26
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jun 2026 17:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9uli0ys1pWsDROvAV3FPiUSUlDZu7wjinK/WZa+oXEc=; b=abDcyAi2fy493x
	b00GmkXcAyMagA3qxWXn4xaGkJeMemK49wRxUcueD5dQCHJVbDPMOjryyqqPCQz0IWDVAU3dPreaZ
	RLxL6j/3t7abgeCm0hX7z5rHElqYnO1plTrys169nczZSWnHoMU6/4Pjqs0dGSPU46NPI85C83PNI
	ITeOykysqruJo5M4SeH8uSOmzlyJzbDzCQ4kHQn0/O5NJZSui/poe79s93JaAUceu7nnhnIAf8n94
	HMKclM+DYoUkRoYjg/aJmmoRnNXuOwVFQRiTZZpVwKvhYKHujUPdTUPwVidh5OnSGDpqTXkKeRlJP
	GvZB4FLD6e01QCebdPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wadJd-00000002qW8-0Kj7;
	Fri, 19 Jun 2026 17:47:41 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wadJb-00000002qVS-0Pko
	for linux-mtd@lists.infradead.org;
	Fri, 19 Jun 2026 17:47:40 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c07fd4dc2c8so228307666b.1
        for <linux-mtd@lists.infradead.org>; Fri, 19 Jun 2026 10:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781891257; cv=none;
        d=google.com; s=arc-20240605;
        b=dD17fQ7qbvH8U7HdsXyxRh95aR+c3ebWSbtWaH0iPOtaR916+vP6Lht0aCTW7W2AQn
         8Y92JvIellxDAdEhEDop9BSonzbszk+BthHuTdQhhe/QxKF9LXJa13HMEm8mQ20G2Cmu
         la0FmUz/h/5icqLLhYuPFlyVILMUBh8hVAuBOm1CWUXN6IhyOqJqkBHgUVFyafslZLwG
         kBwL0oHURb7P61LHLxOUD8sOWhD0I8oYAE2IXj/F7/DLAmluuOJiOndoNwakZOu3gad0
         U+JexhoSvi0jrAbrILWIkp1LIrC58GZQ0tlC3GR3P/AT0RRE7sYbE4cOf2DRz78mp7TV
         34Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HgKFK2/bAzNHbask6kSEPwIbMIWqzM9ItL7Se+JyFGs=;
        fh=jlztjQe6V6GBtk+F7xKXHhv86H5ieSIhfvf3C+VtTR8=;
        b=GpKAQsRSVlnscvitLKZWdD1K6eUZiA8AWhiFphNwIwSzPZUk9+7ieblnwWtp5g6Rlb
         9RgncoFwcxq7nuZ9gWqs+hYW0m5aJN8cMgSIdZScNjz5MdSXKa7c9RUprgK80ffdJygi
         9TuykIBwFHW4CP9yZXG05kxRagPgYkOYVZxx1bxrf/7rDrDWrdKQ4P7ytiWFZgcHlMfZ
         IngKGKRu/mY/BWh8rqXokyNlrb3xsds7iJKO1eSS7d+7mza9KuuYOT8o97fyAzBjV3sO
         MeXkOHXoid8tvqJlMg/yWw0G4Vt8M2z4RaoJJq0+tdUXTHXqnqyHFUtOkyq1JV/9WKlG
         Z1wQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781891257; x=1782496057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgKFK2/bAzNHbask6kSEPwIbMIWqzM9ItL7Se+JyFGs=;
        b=gbKA/jarQj0nZfetihe/c1PP+qO5HI5AXq4XuYroMlGjvyTjcKqPUAWuGrapgNnMfk
         8NwIb9uP9wArcT9HnaIhsfFU6G/zfDODkbnI1H30gWxIGLunZfsLzV18Np6NxJUoN7SC
         R2dbdXksEhG0E/WhF1BAHp05Kat6Mt6NsTWCgKMiR0OoOihbSmulQgXq8ledPCOWnGSK
         zNB6xZCueSXCMYiL+AGBpK6Gc8JpPTQF6xYR8wbQRxsn6S5I5ZaF8Zaz2LUexF0bAtgw
         6lqRPrYcLLahYzO+fZkznJQDc47uuLXhi/DtikOZ6g++asALU7hsvn+wm1M5co+gWc3+
         lxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781891257; x=1782496057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HgKFK2/bAzNHbask6kSEPwIbMIWqzM9ItL7Se+JyFGs=;
        b=BNbv01oF+TsHeM7HaT2Wxt5j6b0B16m6dGJKOwNImY1dFxigeZ8SqZrAhpPxCJMxNU
         zureKO9DrQWx2jXhXKnD0EWgEiWJQAD3fZYdDicL3xfwglv6fd7C2mZn8rQy1gvf+I+f
         jvutYKU+GFzPyHuptSnbMwrOSSMOi2FqipJBrY17Fxhj3u+iZ5U8bgm146uJdV1Ku+l6
         ALamrWBaLeNUvpM46fqYdClPvEGbdaRCIUGdIs/eEgAPodib1W0U9o2shh0dh2Eb+hyr
         WaYsBR3MBNzf4R3K/5G+VyqxSt0ozAacv1AD6vRDamx9M99HroFwdKI+HUaJ/cwftUdz
         Xn1w==
X-Forwarded-Encrypted: i=1; AFNElJ+4aAIUX2IW2T5AyUIlC2/CUkWEn0Kcu1wQ3wh2WHCSfgLnSTWYVfIZivlV8dlCn6zjRiPtDNis4Do=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbbeWfHQzSbmak5NXug3FzVny54euZlSCwbl1wwHk0MnkpvbpB
	/gpuPdAZF7rVVv5ysFD/QU4YswbdM9jwXr32/rJfW5is1VtsCL2aEtvyKnTnozVydp/dc6v4Ivi
	TP5al7S6Ufi4FvA63iNq5YMsikNCx+2/Cei5Y
X-Gm-Gg: AfdE7cnWp3c2Pz8wTqzUj+PcJ6P2nQUEt7Iobo1cKmuY4wnjzPd86wdTemMHfeaV/uD
	+gqXxmQxHkydZCdUoIVAbZFNHkxDsBtYfc2lk86wuXUbWPThaGdtZY2wrFY7BpsyvAEQyuWvSU9
	G7laNzWZZVwbfC7K6rF5OZIYerQKnJwILY9O7gjhC5h6yI/uzJoQYOeCEiERstFF+MMVT9ywBK0
	3dj8L9iz4/3/aKMc8RQGSBkspg1tpYpfyRxyUtbQ1wosLe0nuKflYH4ZAUKK4NxSjobk+TimcOW
	tOHpDVvec9C3dkHNWFq7IKpKspocVzlZJ1J1yBf4la4BvGE+dFmdZN1XPWg5PhPx78bnPRGwN0P
	4TJmhwS+AG6Sl6j9BjhWmx6ZskZxaPqtzZSzWXqYVu6CoFlQ=
X-Received: by 2002:a17:907:7b91:b0:bf4:6aca:7010 with SMTP id
 a640c23a62f3a-c097ceba8cbmr272325366b.45.1781891257066; Fri, 19 Jun 2026
 10:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260618205835.1497952-1-arnd@kernel.org>
In-Reply-To: <20260618205835.1497952-1-arnd@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 19 Jun 2026 10:47:25 -0700
X-Gm-Features: AVVi8CdUmO327px2zkmaLafMvxacRiHRidFBADgyBfGM6Henqz-jyT2UIo90lYg
Message-ID: <CAKxU2N8cJnkGQod5KFjj7_z8OmhWo8q1YAnUJ2nCtjxLBNrgbQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: ndfc: add CONFIG_OF dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>, Chris Down <chris@chrisdown.name>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_104739_161141_E295A0F9 
X-CRM114-Status: GOOD (  19.10  )
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

T24gVGh1LCBKdW4gMTgsIDIwMjYgYXQgMTo1OOKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+
Cj4gV2hlbiBjb21waWxlLXRlc3Rpbmcgb24geDg2IHdpdGhvdXQgQ09ORklHX09GLCB0aGUgbmRm
YyBkcml2ZXIgcHJvZHVjZXMKPiBhIGhhcm1sZXNzIHdhcm5pbmc6Cj4KPiBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9uZGZjLmM6IEluIGZ1bmN0aW9uICduZGZjX3Byb2JlJzoKPiBpbmNsdWRlL2xpbnV4
L2Rldl9wcmludGsuaDoxNTQ6MzE6IGVycm9yOiAnbGVuJyBpcyB1c2VkIHVuaW5pdGlhbGl6ZWQg
Wy1XZXJyb3I9dW5pbml0aWFsaXplZF0KPiAgIDE1NCB8ICAgICAgICAgZGV2X3ByaW50a19pbmRl
eF93cmFwKF9kZXZfZXJyLCBLRVJOX0VSUiwgZGV2LCBkZXZfZm10KGZtdCksICMjX19WQV9BUkdT
X18pCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmRmYy5jOjE5NjoxNzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdk
ZXZfZXJyJwo+ICAgMTk2IHwgICAgICAgICAgICAgICAgIGRldl9lcnIoJm9mZGV2LT5kZXYsICJ1
bmFibGUgcmVhZCByZWcgcHJvcGVydHkgKCVkKVxuIiwgbGVuKTsKPgo+IExpbWl0IGNvbXBpbGUt
dGVzdGluZyB0byBjb25maWd1cmF0aW9ucyB3aXRoIENPTkZJR19PRiB0byB0cml2aWFsbHkKPiBh
dm9pZCB0aGlzLiBUaGUgZHJpdmVyIHdpbGwgc3RpbGwgYmUgYnVpbHQgaW4gYWxsbW9kY29uZmln
IGFuZCBtYW55Cj4gcmFuZGNvbmZpZyBidWlsZHMuCj4KPiBGaXhlczogNGYyNjkyYTUzODNlICgi
bXRkOiByYXduYW5kOiBuZGZjOiB1c2UgaW9yZWFkMzJiZS9pb3dyaXRlMzJiZSBhbmQgYWxsb3cg
Q09NUElMRV9URVNUIikKTWlnaHQgYWxzbyB3YW50IHRvIGFkZAoKSWYgeW91IGZpeCB0aGUgaXNz
dWUgaW4gYSBzZXBhcmF0ZSBwYXRjaC9jb21taXQgKGkuZS4gbm90IGp1c3QgYSBuZXcgdmVyc2lv
biBvZgp0aGUgc2FtZSBwYXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzCnwg
UmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgp8IENsb3Nlczog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI2MDYxNjAxNTMucHBlUmRF
TDAtbGtwQGludGVsLmNvbS8KCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBh
cm5kYi5kZT4KUmV2aWV3ZWQtYnk6IFJvc2VuIFBlbmV2IDxyb3NlbnBAZ21haWwuY29tPgo+IC0t
LQo+IFdlIG1heSBhbHNvIHdhbnQgdG8gY2hhbmdlIHRoZSBvZl9nZXRfcHJvcGVydHkoKSBzdHVi
IGZ1bmN0aW9uIHRvCj4gaW5pdGlhbGl6ZSAqbGVuLgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9LY29uZmlnIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9LY29uZmlnCj4gaW5kZXggNjRiOGI5OWEzYTY4Li4xZjQwNTNlNTMxZmQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L0tjb25maWcKPiBAQCAtNzIsNiArNzIsNyBAQCBjb25maWcgTVREX05BTkRfQVUx
NTUwCj4gIGNvbmZpZyBNVERfTkFORF9OREZDCj4gICAgICAgICB0cmlzdGF0ZSAiSUJNL01DQyA0
eHggTkFORCBjb250cm9sbGVyIgo+ICAgICAgICAgZGVwZW5kcyBvbiA0NHggfHwgQ09NUElMRV9U
RVNUCj4gKyAgICAgICBkZXBlbmRzIG9uIE9GCj4gICAgICAgICBzZWxlY3QgTVREX05BTkRfRUND
X1NXX0hBTU1JTkcKPiAgICAgICAgIHNlbGVjdCBNVERfTkFORF9FQ0NfU1dfSEFNTUlOR19TTUMK
PiAgICAgICAgIGhlbHAKPiAtLQo+IDIuMzkuNQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
