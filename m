Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1415C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Dec 2022 11:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGQReTaD1D5HW11lsS9M+EG2m6tIdXp0k0FKla/LvmI=; b=ABnlJnoCFgl2ad
	GAH/6tDuUyiPEwdn+3Y7PuHUzWBl9kCXgppDWE90Dd9sPbU/KQKuOC4M0680SlEhbbe2siDmWeJpq
	63EEzuDVpkwp9m2BUYvZbXx62LEoggMbUCLtsizKdJuN+LObht0/7V9vke32ErWEqgyUje/HqUj9/
	+jbCtu9NianJzBQ7n+f7AerbUi6bHHgDqevM/DvqclAvC7BN0kywLgD78+/Qb6J+L5EjVT7yemb6k
	BqzYNFltT98Es8DUy5vOWJWYUh7RlXYakgrDf2Q01Pq3i9RpIM/Dp42+uaUy0C0exNjP06Sfz4YpR
	TG9TBtFZ2T9FUoFtsPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p533i-00G74L-8L; Tue, 13 Dec 2022 11:02:50 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p533f-00G73I-PK
	for linux-mtd@lists.infradead.org; Tue, 13 Dec 2022 11:02:49 +0000
Received: by mail-ej1-x636.google.com with SMTP id gh17so35587215ejb.6
        for <linux-mtd@lists.infradead.org>; Tue, 13 Dec 2022 03:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ1cU6HaRiZd2oaHJNwIBTgfx+qQipJfi6liPtZV9A8=;
        b=LhaEzW475ydrk+K+WcZDtR1DW46YBskNG+u1Hq5urOdDmTVyMKmeSMYZuiXGCG5/QY
         DweSEcRxM0ZjXiFzwQanSoDzPpddScoQPVxXGracyBbTlOWC8ySqOhpqgkmla4wMFm9+
         uPAQ3nvPG5hsv7AK8MIjhsmhskv2KGLeWb2c3WViZS2Hr63wczTcVNXo5o19TyeSU2hX
         MkJyazyb0l6+035FgVjDLohtaT2drXWGPAszT5G6DJb5svkL+hDYCI+64jYK8MDP8tIw
         iJ6trgwupISP30xVSlO3cwYaf/2/KvIHCY8YqGHYHZcTUofiekbPbuC7LYH67GPm6tzL
         O9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ1cU6HaRiZd2oaHJNwIBTgfx+qQipJfi6liPtZV9A8=;
        b=TdjDFfJFhjBYZj9ogcCdzPT40mjCuJ/1dVx+8LIEnqYfQYiHvER7GjQ3yWIc5w7Ng6
         nkxauWrTyi3UvrO4dkxkkdw9uBnhEUjwnIqFDKABBEKbX8DGrMoselTBdx13uUaQVI1r
         HuQPJ+d3/qVJ4lBbla4NRlEujuez/eAc2aEBRZGZJejd9xOeJu9A8EKEIQlSunBg5fy7
         MHzQGlJ5IwrQC7ETot0ORnWjCzq1A4d4C1CEGKrA8ZmRy5fVB1goaTEU5AXA8MBJHbcH
         aSljJw+zbz6u24+iZo8Bl+fSZzv/GeDbBEpCsd5/W/NfqeZka1bpg/Ho4cwFzcJ1WTeH
         M2LQ==
X-Gm-Message-State: ANoB5pniWX/lYB66W5C1mKnZKPqBJCBYUzpIhMyB8lHil9Cb1h/RAo41
	V3zQoYgPPHI8FsS0REqPB9hZMSwrIGQi25CGcuA=
X-Google-Smtp-Source: AA0mqf7amJrs0pLWsSO3ihGM3wzALu7QIKv9vyrIllw3wDUYt0tKgh9ups0gafqXCr+n9j2BzcSr5n3foaqXX7f9ZRM=
X-Received: by 2002:a17:907:728c:b0:7c1:10cf:b81c with SMTP id
 dt12-20020a170907728c00b007c110cfb81cmr8911388ejc.315.1670929366153; Tue, 13
 Dec 2022 03:02:46 -0800 (PST)
MIME-Version: 1.0
References: <CALHCpMgSZOZdOGpLwTYf0sFD5EMNL7CuqHuFJV_6w5VPSWZnUw@mail.gmail.com>
 <CALHCpMgEZjnR39upkR6iozSk-b5A_GHRo9rcDSPXzzQi6x_qCw@mail.gmail.com>
 <b1b7935d-0785-2e57-bad9-ab2476f0acf2@leemhuis.info> <CALHCpMhsM2j=bSXEDC9BWYpOAyvCccgJpJmqXfiRTHvp6=y3tA@mail.gmail.com>
 <20221212101449.4e465181@xps-13> <CALHCpMimCqZB0bnHaOdCzucey+92NcRRZXCHXYYH5c9vj0nZaQ@mail.gmail.com>
 <20221212173730.64224599@xps-13> <b75a8769-0cc8-beb3-931a-6755aede3af0@inbox.ru>
 <20221213104643.052d4a06@xps-13>
In-Reply-To: <20221213104643.052d4a06@xps-13>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Tue, 13 Dec 2022 14:02:34 +0300
Message-ID: <CALHCpMhOku2b+1y5Z=N5RJ6SvCvNakD2rSyRAqp6Gz3JWVvXGg@mail.gmail.com>
Subject: Re: nvmem-cells regression after adding 'call of_platform_populate()
 for MTD partitions'
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Saravana Kannan <saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_030247_875627_D04AAA78 
X-CRM114-Status: GOOD (  26.64  )
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

SSBsb29rZWQgY2xvc2VyIGF0IGNvbW1pdCA2NThjNDQ0OGJiYmYgYW5kIGJjZGYwMzE1YTYxYSwg
NWRiMWMyZGJjMDRjMTYgY29tbWl0cy4KTG9va3MgbGlrZSB3ZSBoYXZlIHR3byBkaWZmZXJlbnQg
ZmVhdHVyZXMgYmluZGVkIHRvIG9uZSBwcm9wZXJ0eSAtICJjb21wYXRpYmxlIi4KCkZyb20gb25l
IHNpZGUgaXQgaXMgdGhlIGFiaWxpdHkgdG8gZm9yd2FyZCB0aGUgc3Vibm9kZSBvZiB0aGUgbXRk
CnBhcnRpdGlvbiB0byB0aGUgbnZtZW0gc3Vic3lzdGVtICg2NThjNDQ0OGJiYmYgYW5kIGFjNDJj
NDZmOTgzZSkuCkFuZCBmcm9tIGFub3RoZXIgc2lkZSBpcyB0aGUgYWJpbGl0eSB0byB1c2UgY3Vz
dG9tIGluaXRpYWxpemF0aW9uIG9mCnRoZSBtdGQgcGFydGl0aW9uIChiY2RmMDMxNWE2MWEgYW5k
IDVkYjFjMmRiYzA0YzE2KS4KCldoYXQgSSBtZWFuOgpBY2NvcmRpbmcgdG8gYWM0MmM0NmY5ODNl
IEkgY2FuIGNyZWF0ZSBEVCBsaWtlIHRoaXM6CiAtIHwKICAgIHBhcnRpdGlvbnMgewogICAgICAg
IGNvbXBhdGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7CiAgICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8MT47CiAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47CgogICAgICAgIHBhcnRpdGlvbkAwIHsK
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJudm1lbS1jZWxscyI7CiAgICAgICAgICAgIHJlZyA9
IDwweDQwMDAwIDB4MTAwMDA+OwogICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKICAg
ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47CiAgICAgICAgICAgIG1hY2FkZHJfZ21hYzE6IG1h
Y2FkZHJfZ21hYzFAMCB7CiAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4Nj47CiAgICAgICAg
ICAgIH07CiAgICAgICAgfTsKICAgIH07CgoKQW5kIGFjY29yZGluZyB0byA1ZGIxYzJkYmMwNGMx
NiBJIGNhbiBjcmVhdGUgRFQgbGlrZSB0aGlzOgogLSB8CiAgICBwYXJ0aXRpb25zIHsKICAgICAg
ICBjb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwogICAgICAgICNhZGRyZXNzLWNlbGxz
ID0gPDE+OwogICAgICAgICNzaXplLWNlbGxzID0gPDE+OwoKICAgICAgICBwYXJ0aXRpb25AMCB7
CiAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidS1ib290LGVudiI7CiAgICAgICAgICAgIHJlZyA9
IDwweDQwMDAwIDB4MTAwMDA+OwogICAgICAgIH07CiAgICB9OwoKQnV0IEkgY2FuIG5vdCB1c2Ug
dGhlbSBib3RoLCBiZWNhdXNlIG9ubHkgb25lICJjb21wYXRpYmxlIiBwcm9wZXJ0eSBhbGxvd2Vk
LgpUaGlzIHdpbGwgYmUgaW5jb3JyZWN0OgogLSB8CiAgICBwYXJ0aXRpb25zIHsKICAgICAgICBj
b21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwogICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDE+OwogICAgICAgICNzaXplLWNlbGxzID0gPDE+OwoKICAgICAgICBwYXJ0aXRpb25AMCB7CiAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAidS1ib290LGVudiI7ICAjIGZyb20gYWM0MmM0NmY5ODNl
CiAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibnZtZW0tY2VsbHMiOyAjIGZyb20gNWRiMWMyZGJj
MDRjCiAgICAgICAgICAgIHJlZyA9IDwweDQwMDAwIDB4MTAwMDA+OwogICAgICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwxPjsKICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47CiAgICAgICAg
ICAgIG1hY2FkZHJfZ21hYzE6IG1hY2FkZHJfZ21hYzFAMCB7CiAgICAgICAgICAgICAgICByZWcg
PSA8MHgwIDB4Nj47CiAgICAgICAgICAgIH07CiAgICAgICAgfTsKICAgIH07Cgo+IGNvbXBhdGli
bGU6IER1cGxpY2F0ZSBwcm9wZXJ0eSBuYW1lCgrQstGCLCAxMyDQtNC10LouIDIwMjIg0LMuINCy
IDEyOjQ2LCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjoKPgo+IEhp
IE1heGltLAo+Cj4gZmlkb19tYXhAaW5ib3gucnUgd3JvdGUgb24gTW9uLCAxMiBEZWMgMjAyMiAy
MDo1Nzo0OSArMDMwMDoKPgo+ID4gSGksIE1pcXVlbCEKPiA+Cj4gPiBPbiAxMi4xMi4yMDIyIDE5
OjM3LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4KPiA+ID4gTGV0IG1lIHRyeSB0byByZWNhcCB0
aGUgc2l0dWF0aW9uIGZvciBhbGwgdGhlIHBlb3BsZSBJIGp1c3QgaW52b2x2ZWQ6Cj4gPiA+Cj4g
PiA+ICogQW4gRXRoZXJuZXQgZHJpdmVyIGdldHMgaXRzIG1hYyBhZGRyZXNzIGZyb20gYW4gbnZt
ZW0gY2VsbC4gVGhlCj4gPiA+ICAgIEV0aGVybmV0IGNvbnRyb2xsZXIgRFQgbm9kZSB0aGVuIGhh
cyBhbiAibnZtZW0tY2VsbHMiIHByb3BlcnR5Cj4gPiA+ICAgIHBvaW50aW5nIHRvd2FyZHMgYW4g
bnZtZW0gY2VsbC4KPiA+ID4gKiBUaGUgbnZtZW0gY2VsbCBjb21lcyBmcm9tIGFuIG10ZCBwYXJ0
aXRpb24uCj4gPiA+ICogVGhlIG10ZCBwYXJ0aXRpb24gaXMgZmxhZ2dlZCB3aXRoIGEgcGFydGlj
dWxhciBjb21wYXRpYmxlCj4gPiA+ICAgICh3aGljaCBpcyBhbHNvIG5hbWVkICJudm1lbS1jZWxs
cyIpIHRvIHRlbGwgdGhlIGtlcm5lbCB0aGF0IHRoZSBub2RlCj4gPiA+ICAgIHByb2R1Y2VzIG52
bWVtIGNlbGxzLgo+ID4gPiAqIFRoZSBtdGQgcGFydGl0aW9uIGl0c2VsZiBoYXMgbm8gZHJpdmVy
LCBidXQgaXMgdGhlIGNoaWxkIG5vZGUgb2YgYQo+ID4gPiAgICAicGFydGl0aW9ucyIgY29udGFp
bmVyIHdoaWNoIGhhcyBvbmUgKGluIHRoaXMgY2FzZSwKPiA+ID4gICAgImZpeGVkLXBhcnRpdGlv
bnMiLCBzZWUgdGhlIHNuaXBwZXQgYmVsb3cpLgo+ID4gPgo+ID4gPiBCZWNhdXNlIHRoZSAibnZt
ZW0tY2VsbHMiIHByb3BlcnR5IG9mIHRoZSBFdGhlcm5ldCBub2RlIHBvaW50cyBhdCB0aGUKPiA+
ID4gbnZtZW0tY2VsbCBub2RlLCB0aGUgY29yZSBjcmVhdGUgYSBkZXZpY2UgbGluayBiZXR3ZWVu
IHRoZSBFdGhlcm5ldAo+ID4gPiBjb250cm9sbGVyIChjb25zdW1lcikgYW5kIHRoZSBtdGQgcGFy
dGl0aW9uIChwcm9kdWNlcikuCj4gPiA+Cj4gPiA+IFRoZSBkZXZpY2UgbGluayBpbiB0aGlzIGNh
c2Ugd2lsbCBuZXZlciBiZSBzYXRpc2ZpZWQgYmVjYXVzZSBubyBkcml2ZXIKPiA+ID4gbWF0Y2hl
cyB0aGUgIm52bWVtLWNlbGxzIiBjb21wYXRpYmxlIG9mIHRoZSBwYXJ0aXRpb24gbm9kZS4KPiA+
ID4KPiA+ID4gUmV2ZXJ0aW5nIGNvbW1pdCBiY2RmMDMxNWE2MWEgKCJtdGQ6IGNhbGwgb2ZfcGxh
dGZvcm1fcG9wdWxhdGUoKSBmb3IgTVRECj4gPiA+IHBhcnRpdGlvbnMiKSB3b3VsZCBJTUhPIG5v
dCBtYWtlIG11Y2ggc2Vuc2UsIHRoZSBwcm9ibGVtIGNvbWVzIGZyb20gdGhlCj4gPiA+IGRldmlj
ZSBsaW5rIHNpZGUgYW5kIGV2ZW4gdGhlcmUsIHRoZXJlIGlzIG5vdGhpbmcgcmVhbGx5ICJ3cm9u
ZyIsCj4gPiA+IGJlY2F1c2UgSSByZWFsbHkgZXhwZWN0IHRoZSBtdGQgZGV2aWNlIHRvIGJlIHJl
YWR5IGJlZm9yZSB0aGUKPiA+ID4gRXRoZXJuZXQgY29udHJvbGxlciBwcm9iZSwgdGhlIGRldmlj
ZSBsaW5rIGlzIGxlZ2l0aW1hdGUuCj4gPiA+Cj4gPiA+IFNvIEkgd291bGQgbGlrZSB0byBleHBs
b3JlIG90aGVyIGFsdGVybmF0aXZlcy4gSGVyZSBhcmUgYSBidW5jaCBvZgo+ID4gPiBpZGVhcywg
YnV0IEknbSBvcGVuOgo+ID4KPiA+IEhvdyBhYm91dCB0byBjcmVhdGUgc2ltcGxlIGRyaXZlciB3
aXRoIGNvbXBhdGlibGU9Im52bWVtLWNlbGwiIGFuZCB0byBtb3ZlIGFsbCB0aGUgc3VmZiBmcm9t
IG1haW4gbXRkIGRyaXZlciB3aGljaCBzZXJ2ZXMgbnZtZW0tY2VsbCB0byB0aGUgcHJvYmUgZnVu
Y3Rpb24/Cj4KPiBUaGlzIGlzIHByb2JhYmx5IHdvcnRoIHRoZSB0cnkgYnV0IEkgZG91YnQgeW91
IGNhbiBtYWtlIGl0IHdvcmsgd2l0aG91dAo+IHJlZ3Jlc3Npb25zIGJlY2F1c2UgSUlSQyB0aGUg
bnZtZW0gcmVnaXN0cmF0aW9uIGhhcHBlbnMgbm8gbWF0dGVyIHRoZQo+IGNvbXBhdGlibGUgKG5v
dCBtZW50aW9uaW5nIHRoZSB1c2VyLW90cCBhbmQgZmFjdG9yeS1vdHAgY2FzZXMpLiBZb3UgY2Fu
Cj4gZGVmaW5pdGVseSB0cnkgdGhpcyBvdXQgaWYgeW91IHRoaW5rIHlvdSBjYW4gY29tZSB1cCB3
aXRoIHNvbWV0aGluZwo+IHRob3VnaC4KPgo+IEJ1dCBJIHdvdWxkIGxpa2UgdG8gaGVhciBmcm9t
IHRoZSBkZXZpY2UtbGluayBndXJ1cyA6KSBiZWNhdXNlIGV2ZW4gaWYKPiB3ZSBmaXggbXRkIHdp
dGggYSAidHJpY2siIGxpa2UgYWJvdmUsIEkgZ3Vlc3Mgd2UnbGwgdmVyeSBsaWtlbHkgZmluZAo+
IG90aGVyIGNvcm5lciBjYXNlcyBsaWtlIHRoYXQgYW5kIEkgYW0gaW50ZXJlc3RlZCBpbiB1bmRl
cnN0YW5kaW5nIHRoZQo+IHJhdGlvbmFsZSBvZiB3aGF0IGNvdWxkIGJlIGEgcHJvcGVyIGZpeC4K
Pgo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
