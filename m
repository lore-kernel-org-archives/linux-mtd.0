Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF4BEEF31C
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aTPYwvj1Xs4LaaaMfxtJS5MU4E6Fi8TBxxXLovYZAzw=; b=w96JTxMNfzxODO4ELRAae2LZLs
	R6w+VqbYFfwJ+tL5tqozntA/i/b1XmIvlxiVWFo5bZzFLkVRX3h6aVfqUbwIz85uJj3mK3JmztSFh
	mjrOKsQ+OMoQIjE84089Ezc3i8zOSFn7QTwEq3ZQ6wjMgfBpulxWEVtE2zUbhQQUKiF5ZO/hxerZ9
	/rCrYeOHPLKIo5QNImAYPBXVm5dViUZwiQ/y6CsD0yEumUvKzgNq9XD8Shqr2e9WHhRQk5p+2fWRD
	gt2VIhUMpO+BVs5/+GfiLzLCs96xB2Qf8sLos8AVhbIwTivllyjMEeg1u0RYnxeHWTuP1hN05DFZt
	x/uQn6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4RR-00000001FVW-0gGW;
	Thu, 05 Mar 2026 08:52:21 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4RO-00000001FTp-3CMK
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 08:52:19 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6615c766e60so417024a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 05 Mar 2026 00:52:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772700737; cv=none;
        d=google.com; s=arc-20240605;
        b=J+LKdBfzo/jJ5Upn6lQAGTbo1vxT92AkM8aF9Fb1xa2/ccka2YvkPmNpY7D0yDWoyl
         ik5+x+ZoofZ1/1WzyNRhqyNjCXlnluyuaq1+AALRgAw1I7kWuTrk4Mxp2rkDZr7aurbd
         RhS/wHeCm/5K7Molza6w8blLDAyqaBMhVacnjSvjsRlyw4gS31ezI5TkijzRIMx47VKD
         5HkhDNNeOQzQRqiuQYj69u413rg+2v/Dw1BVXuWI94h3aC1SVo7x93gnX/nBtrxGFRCX
         HiXxojG+J0i7TK3lP1TKIvJqQjVT2No1CEYtrPZH+KmyKog0lJdWtz3tHqI9VOOFbICe
         0SKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=40a/3CPiG7qehOiiDE9oqYRGlJke2ucfupNz3X0xFrw=;
        fh=SHfnG7IHMKCZ5HIFQ0SM68BPHFcctN2gYYKauzAdwg0=;
        b=TmqoOKorj8d0c7bhchhRqsrcArOKowbehZeRtkEbW6EBGFXhXeC1P9P27RaBi/Bqlp
         Cenkdhq2mMOeXN3uacZLtQE35Dj0itc2j374xxKwj0Nj/N7YAiBd1ytrv0zbvmlFjkmX
         Jt0fnRVvU4VMqn1DE6x9iUmhMOiV9V0JImxewH0SR6Ul4KnhV8moAhFwxuV/SSjQbua9
         9F9a94mQhVel1bwk9y8cfzO5pylgnYBIzQMlYcwhTYxEKLYAPOf/QT+jfOZmZBjm2cHT
         KPV2g3YhLRexZbqmOP3fOIbJdBzWiqQ4UsA+HD+Za2TXgCRHclZnLnMfeTsv9kDom9Rj
         jv0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772700737; x=1773305537; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40a/3CPiG7qehOiiDE9oqYRGlJke2ucfupNz3X0xFrw=;
        b=NnCGhEH5p4fLlDYrrDxd+hrEcEbzuJPBy50QvNfKh2l8/GD5UgIpxKRBN5n1surdlD
         mreDSzTWGTXHseFHHaf5bcy5c9u7+B+wzXKHBRq5ti+ytnSgY+wjU2sN6ZUTX/1Hxo6y
         3v98p9pRoF/wR1qlqNtXV3dOGhzSog6ujJZL4XetVKigI3j8D74l3qtxmiTHYf4JepU4
         AhtI8a8b1izLaHs6gXFUSbh2yQW8hExkSjdjFzCvFtaXnF5UBX5k83Ry7Sbk3eTAt1g0
         KPQdW5qc5pOOMOhu1gec3ajBFbrDnY42aUgYydRGed7j77jN4igmi9UnVwKpTmTU9Eqd
         mT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700737; x=1773305537;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=40a/3CPiG7qehOiiDE9oqYRGlJke2ucfupNz3X0xFrw=;
        b=EEW0/0QEMEBKgU+0gftGzwdCp9OhmGPVM1EicBrk+T9aAJPYuoR4KiI9AwsJeZKyDv
         wR4h44oxvVk0oIqdFz/eb4CBudOjyVYIyiIwc/Mtp1tZ+1VD2onsodT0GDjWWwMw4sl/
         tBoFu7KkOVvq8hOItKkL1nADsuTAmy5WQUZOhsQ5t1imRF1p1+OWIWb1+L+o32yoryW/
         b5NJcJGgpOFyNR7C3Xn6KJVWI9SJ7FrcAa9bGZsEMrrcvboHG31gzf+I4GDiJK+OQYwU
         dOEiY5zKi+BlMqv4P9RcgDe5Bfb5Xe2M6R0A5IhzyoTySUrNC5+vEarV8xKpY2k8pZFF
         y4wA==
X-Forwarded-Encrypted: i=1; AJvYcCUElrByiIONkRY2S92VMdZvRb6PALnGeEzrLU7sT3C2F2MpbiMGUd2YPcCr1T/8Fc0ivKa6z+qaGxU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzRf2L+z6TKALpttAtYoIp8QgrZ04/LdLLfZWheaLz89ZNLfyQ
	F/NS+yWtOyWdcH52y7bjxqq1/fhTO4eVDHWfLYmfcTS6+Rvrt9lo4ulZgLkBvU0K7bpv/9VsVDz
	bLipr1XAFkQf+zV/ByXhh418TryfnGbI=
X-Gm-Gg: ATEYQzyLidQvBp4yXcc1ffC5n1NV97DV/hFu7zqQtt4msY5gJp8D4CKw3iAepjG4BFq
	NCzh5a9Ii7TY7Z80EVzMMv7EDcAYo9JN9b/kjKSakZxQZGeotavGWzJBaov2DgvJY4mluG/dmL+
	uX3R8JxKx36snavDsUH6X5SaF0JV0qVbP7AOToG///wKGJeuzgT2oe4zXIfmQm7pui8LKUGzlJm
	PzuC6tenNYs7m4TWFf6w7bS//NMfi/MDVPWRsE3lXSoT6gis0OjJTELq+lsL+9Eo8ODra2i5myy
	kgFJ54w/Myr5AbOlJWXVO7IQwMnuAO3FFa0hq6nPLluQW9QJHZ/fIoCwq+vBgH0bou6hMo2hCSB
	aeDgskw==
X-Received: by 2002:a17:907:3f1c:b0:b8f:9d12:2386 with SMTP id
 a640c23a62f3a-b93f14f0ce7mr293846766b.51.1772700736535; Thu, 05 Mar 2026
 00:52:16 -0800 (PST)
MIME-Version: 1.0
References: <20260304221530.15018-1-rosenp@gmail.com> <20260304221530.15018-2-rosenp@gmail.com>
 <aakr_hzORmNpme9Y@birdy.pmhahn.de>
In-Reply-To: <aakr_hzORmNpme9Y@birdy.pmhahn.de>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 5 Mar 2026 00:52:04 -0800
X-Gm-Features: AaiRm51ft6iqUq8bp34c33S5cVyGwg1PL3i6u05x7BmB6Pj6urenWKcFpxjnPOw
Message-ID: <CAKxU2N-wXRGC0YegCwNLOKowUKJ0GeOzQc1660cNtPMVwL=4Vw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: virt_concat: use single allocation for node
To: Rosen Penev <rosenp@gmail.com>, linux-mtd@lists.infradead.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_005218_812941_771D4D38 
X-CRM114-Status: GOOD (  12.28  )
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

T24gV2VkLCBNYXIgNCwgMjAyNiBhdCAxMTowOOKAr1BNIFBoaWxpcHAgTWF0dGhpYXMgSGFobiA8
cG1oYWhuQHBtaGFobi5kZT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IEFtIFdlZCwgTWFyIDA0LCAy
MDI2IGF0IDAyOjE1OjI5UE0gLTA4MDAgc2NocmllYiBSb3NlbiBQZW5ldjoKPiA+IEFsc28gYWRk
IF9fY291bnRlZF9ieSBhdHRyaWJ1dGUgZm9yIGV4dHJhIHJ1bnRpbWUgYW5hbHlzaXMuCj4g4oCm
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkX3ZpcnRfY29uY2F0LmMgYi9kcml2ZXJz
L210ZC9tdGRfdmlydF9jb25jYXQuYwo+ID4gaW5kZXggYWVhODhkMWM5YmM1Li44OWUyMjNlZGFj
NmEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRfdmlydF9jb25jYXQuYwo+ID4gKysr
IGIvZHJpdmVycy9tdGQvbXRkX3ZpcnRfY29uY2F0LmMKPiA+IEBAIC0zMSw4ICszMSw4IEBAIHN0
YXRpYyBMSVNUX0hFQUQoY29uY2F0X25vZGVfbGlzdCk7Cj4gPiAgc3RydWN0IG10ZF92aXJ0X2Nv
bmNhdF9ub2RlIHsKPiA+ICAgICAgIHN0cnVjdCBsaXN0X2hlYWQgaGVhZDsKPiA+ICAgICAgIHVu
c2lnbmVkIGludCBjb3VudDsKPiA+IC0gICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqKm5vZGVzOwo+
ID4gICAgICAgc3RydWN0IG10ZF9jb25jYXQgKmNvbmNhdDsKPiA+ICsgICAgIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbm9kZXNbXSBfX2NvdW50ZWRfYnkobm9kZXMpOwo+Cj4gTG9va3Mgd3JvbmcuIFlv
dXIgZm9sbG93LXVwIHBhdGNoIGRvZXMgdGhhdDoKPiAtICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbm9kZXNbXSBfX2NvdW50ZWRfYnkobm9kZXMpOwo+ICsgICAgICAgc3RydWN0IGRldmljZV9u
b2RlICpub2Rlc1tdIF9fY291bnRlZF9ieShjb3VudCk7CkQnb2guIEknbGwgcmVzZW5kIGluIGEg
ZGF5Lgo+Cj4gUGhpbGlwcAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
