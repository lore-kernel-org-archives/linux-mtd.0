Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA2CEB64D9
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jun 2023 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Y/tF+gEKpO6J2rzVAt7g+f2NIeXC0552NkmE74Hu/o=; b=rmMpLV0AjdEhOM
	mlYCUsxQ1EI09ei0mrN3HZ/x+Fyd+r1MsKsQf8LE1zT6nQ/QbOqCz5dw0x/E8LIi/oCsu8B/7csuo
	HnBWiTGEO1aMcasqINqYjhicVDb9glmnHdXxg0rZOSdTwc+iQvb2UXgpxUJRxfhfRKc28S4pQ7HpD
	MzMfJsyLHINQ4UWo0csvsyQjVcjoEApOnJwDLX2gT4xEH5cW5nponOurm4FdM4uPPTZftipj9Es18
	VQBNJUubud/IRuMbi0xBE+HpdwAGGCnvclC0UeoMKZfFuvNJzpJ7hmHQGACKYqRQRmiBIPnPnBBzI
	3SZCU2j/K4vUxsKt6mGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE66G-00CusJ-2s;
	Tue, 27 Jun 2023 10:39:08 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE66D-00CuoZ-1d
	for linux-mtd@lists.infradead.org;
	Tue, 27 Jun 2023 10:39:06 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3a1c162cdfeso2503537b6e.2
        for <linux-mtd@lists.infradead.org>; Tue, 27 Jun 2023 03:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687862341; x=1690454341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCgvLgi3BLx22tE+6LcdRjHHTXAUCqzO3DhXE5/At3c=;
        b=j4V/TgPYZOOMjOgLDAi/Fq1Y8RqRGFE7b4qGJRTHhPIZyNGDGr5yqNQrewztFtf4+H
         ad9pajr2f7m4EQWCIIZ7UZtZio4GJYgTjDdtTPHRGE4J1sMKSakHqDbNf898iQmg84X0
         oZdd9dQqPDhhXjPDGdGXik6nfCbkAaHgghtffDg3ccxxkGJQf524luAiz9KkLkiLd579
         lMYpgQWhUnJhY6/kXmGgYvSBMyPZsdHMrkRhn0njqEixyf3AQPrdjzrW8+zSLjuVEOu1
         FIRpBegrkGSWtArlAliOUuhNUyJLd7Q/kZI1AwHQBoLKNwl9o8TL/uhfCE7FAt29AuY3
         GNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687862341; x=1690454341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCgvLgi3BLx22tE+6LcdRjHHTXAUCqzO3DhXE5/At3c=;
        b=idSCb8fefWSypISbWv23HaH9wYIpSNYZmTiij5DAIvyBweF7xW7A8yqZ8+XDPgMelM
         TzvKpFHNTjaKH8rYOikvuwkfUY1tyMvMbZCcXQfKO2vt5PlsfHg1AFqeJdu0KvHu/3GQ
         7MjDnH9LNIRiaYa5do21A/yO7H2Nf7Iv29wXcisjz23lJDziRSt5FCUWBcdvBwK3VJ6h
         rew0P5pZ55q+Npsdt6MuwGgUeHOFt7d/sfZitOWXoesNVNxQjw0FF3C/z1zUMoFrvgiQ
         PXuazc48A80rrOvCIS2emsoy+7PKY7b1tZqzAW8GNnUnGmyeElOvpkEx9UgBLG9MoJfD
         FjTQ==
X-Gm-Message-State: AC+VfDxxLL5x9aFZHK0CanVs4Kr4l164uxlYTrDo+CKwjHyn0yBVfHO8
	60ypH41aJni7YytFapSt1xa9c7SvqAyJBbLrpXk=
X-Google-Smtp-Source: ACHHUZ5H3GRoBym0b9/SiurE+jEIsHMp41/GcQAaG06YOaSsX0tGI2WlPTg+w61l4Kgc2zfz1Xr4qbgyrRqgP6044mA=
X-Received: by 2002:a05:6808:424d:b0:38e:a824:27d3 with SMTP id
 dp13-20020a056808424d00b0038ea82427d3mr30392455oib.27.1687862341491; Tue, 27
 Jun 2023 03:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230531125535.676098-1-hch@lst.de> <20230531125535.676098-9-hch@lst.de>
 <c1391658-d785-4b2f-ba7e-01e4668685d7@roeck-us.net> <20230626075325.GA26851@lst.de>
 <7e708dfa-4019-fe28-afbd-91ad847fada0@roeck-us.net>
In-Reply-To: <7e708dfa-4019-fe28-afbd-91ad847fada0@roeck-us.net>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 27 Jun 2023 03:38:50 -0700
Message-ID: <CAMo8BfLtEw2jdRC-pK4kYuqmgEy-0QgXDodiF+gZEMygNQQBbA@mail.gmail.com>
Subject: Re: [PATCH 08/24] init: pass root_device_name explicitly
To: Guenter Roeck <linux@roeck-us.net>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Mike Snitzer <snitzer@kernel.org>, Joern Engel <joern@lazybastard.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>, Loic Poulain <loic.poulain@linaro.org>, 
	dm-devel@redhat.com, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_033905_547972_46529887 
X-CRM114-Status: GOOD (  24.04  )
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

T24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgODoxMOKAr0FNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJv
ZWNrLXVzLm5ldD4gd3JvdGU6Cj4KPiBPbiA2LzI2LzIzIDAwOjUzLCBDaHJpc3RvcGggSGVsbHdp
ZyB3cm90ZToKPiA+IE9uIEZyaSwgSnVuIDIzLCAyMDIzIGF0IDA1OjA4OjU5UE0gLTA3MDAsIEd1
ZW50ZXIgUm9lY2sgd3JvdGU6Cj4gPj4gSGksCj4gPj4KPiA+PiBPbiBXZWQsIE1heSAzMSwgMjAy
MyBhdCAwMjo1NToxOVBNICswMjAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+Pj4gSW5z
dGVhZCBvZiBkZWNsYXJpbmcgcm9vdF9kZXZpY2VfbmFtZSBhcyBhIGdsb2JhbCB2YXJpYWJsZSBw
YXNzIGl0IGFzIGFuCj4gPj4+IGFyZ3VtZW50IHRvIHRoZSBmdW5jdGlvbnMgdXNpbmcgaXQuCj4g
Pj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+
ID4+Cj4gPj4gVGhpcyBwYXRjaCByZXN1bHRzIGluIHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3Ig
d2hlbiB0cnlpbmcgdG8gYnVpbGQKPiA+PiB4dGVuc2E6dGlueWNvbmZpZy4KPiA+Pgo+ID4+IFdB
Uk5JTkc6IG1vZHBvc3Q6IHZtbGludXg6IHNlY3Rpb24gbWlzbWF0Y2ggaW4gcmVmZXJlbmNlOiBz
dHJjcHkuaXNyYS4wKzB4MTQgKHNlY3Rpb246IC50ZXh0LnVubGlrZWx5KSAtPiBpbml0Y2FsbF9s
ZXZlbF9uYW1lcyAoc2VjdGlvbjogLmluaXQuZGF0YSkKPiA+PiBFUlJPUjogbW9kcG9zdDogU2Vj
dGlvbiBtaXNtYXRjaGVzIGRldGVjdGVkLgo+ID4KPiA+IEkgY2FuIHJlcHJvZHVjZSB0aGVzZSB3
aXRoIGdjYyAxMy4xIG9uIHh0ZW5zYSwgYnV0IHRoZSByZXBvcnQgbWFrZXMKPiA+IG5vIHNlbnNl
IHRvIG1lLiAgSWYgSSBkaXNhYmxlIENPTkZJR19DQ19PUFRJTUlaRV9GT1JfU0laRSBpdCBub3cg
cmVwb3J0cwo+ID4gYSBzaW1pbGFyIHdhcm5pbmcgZm9yIHB1dF9wYWdlIGludGVhZCBvZiBzdHJj
cHkgd2hpY2ggc2VlbXMganVzdCBhcwo+ID4gYXJjYW5jZS4KPiA+Cj4KPiBJIGRvbid0IHNlZSB0
aGF0IChJIHRyaWVkIDExLjMsIDExLjQsIDEyLjMsIGFuZCAxMy4xKSwgYnV0IHRoZW4gSSBhbSBu
b3Qgc3VyZQo+IGlmIHRoaXMgaXMgd29ydGggdHJhY2tpbmcgZG93bi4gSSBqdXN0IGZvcmNlIENP
TkZJR19TRUNUSU9OX01JU01BVENIX1dBUk5fT05MWT15Cj4gZm9yIHh0ZW5zYSBidWlsZHMgaW5z
dGVhZC4KCkkgYmVsaWV2ZSBpdCdzIHlldCBhbm90aGVyIG1hbmlmZXN0YXRpb24gb2YgdGhlIGZv
bGxvd2luZyBpc3N1ZToKaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/
aWQ9OTI5MzgKCkh1bnRpbmcgaXMgc3RpbGwgb24gbXkgdG9kbyBsaXN0LCBidXQgaXQncyBxdWl0
ZSBsb3csIHNvIEkgZ3Vlc3MKZm9yY2luZyBDT05GSUdfU0VDVElPTl9NSVNNQVRDSF9XQVJOX09O
TFk9eSBmb3IgeHRlbnNhCmlzIHRoZSByaWdodCB0aGluZyB0byBkbyBmb3Igbm93LgoKLS0gClRo
YW5rcy4KLS0gTWF4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
