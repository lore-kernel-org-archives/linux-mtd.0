Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801BFC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Dec 2022 21:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwKFsiqOdF23J4aBf/Vq266nb/liS3pQ/ebabiOgibE=; b=NTC8Z1MjCq6GHE
	BmHWdhJGjoOg/mP3B8qVBu5PtB64gbP5Z7YVy+NYXftAbt2UgXqUfPX8FI0NQIdhd1MsXCSM0ZK3y
	gVct1rOFtbHsvMS7mPxt7ReHKK7VxWXPqAqVa21FthieiwExcS9DofRMwWooANFsLtKs3hbp+TZX3
	4Mg+eUvPFwuGURHpH9Lx0Bfgq0WDJQsnAVCDsA7xzHLJ56SAWiHLfXbEaNIE5IbUPENafF3+XNd4S
	PlVpUWnP2ZYkvdqaUbyKohrS2si4xULHSNHeykSJtLvQYsg6aVT2wSy1gGjSF595pNfFj/rf5AE3k
	2l8zadWfjrYupSC0t2RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Zi2-003OEz-WD; Wed, 14 Dec 2022 21:54:39 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Zhz-003O8H-Jm
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2022 21:54:37 +0000
Received: by mail-pf1-x436.google.com with SMTP id 65so5423058pfx.9
        for <linux-mtd@lists.infradead.org>; Wed, 14 Dec 2022 13:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMrsHGbncWvcvky0W6fDrcXQMvYyJN1VLgz7RGTGBvY=;
        b=PPRl6dvH4rAct3htjZO49pHAiRYlC8H61FTQo3T2+Yhqk7SPQXhwmZUsasD2JO71wX
         ZuAyTk5mMTTjSNJL8Oyl1B84GJuvOwFG/mjCGKCg8A9d5FEY277kYRN4JR2Dlt3YEhJZ
         wuD0JL2L0zYBGzzxFGGzpw7R5rLFjelktl9YvMmrtW0c6s4N4T42gydqlP2PZjVSjTvx
         vsYfBj/UTHjTIKnf4LS9XOToPyjYaV85r9KNDrx+aoSeGnMNU6jwXvCQ10+MbhcxfPAi
         TvjVwr7UNGqWXxJjJge2OKaAavBawtRqmMc45jdrC1YI1EUT8eLSfCfmgaLgSm90YQRe
         SPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMrsHGbncWvcvky0W6fDrcXQMvYyJN1VLgz7RGTGBvY=;
        b=MiAiS9yJ9SSe/ktyAifsDajAeJgFzhNhJjUUyBUJs+b5tc7UUnYXcamOM2osJuois0
         tyhpBVYXTpBwdrk/p0c3F8CsCWqeyHqCQ45bxIHidnoWK1smS0icUxx0PVeyTOnNQMem
         MhZL8QYWHjsemF+AShZl8Kdi2h70d4B6tkp1bZH6n2ALeYEu59T6NRsCWyNpjfm/qIQx
         jIZw7/b8FlC6t0mwCMppl64kmjJWjMd2D8j1+HeGDH5qNwA5t6N65Juml57SK6BFDJGS
         3579G94obj4kdEQELzTIHLAM+eFtHkrD9cqYOc4WYwIq6EXLk6DZT/cFy77x/Y23S688
         GQ4A==
X-Gm-Message-State: ANoB5pmzw50ApEbL2Wz2pD94ca3SVazrOioYjFfsALjwXViG/3mp4iL6
	8tmR/g9bgYJ7jjQcFgXbYH3Ka96lkFRLMlMt9ulQjw==
X-Google-Smtp-Source: AA0mqf6geNaq+Is9rdFqOZOexpPNOtcqGF+8xgJ/FFFDlfUVgsIXnBPUssQ9kn+veRkAA5ORYfR+T7Ok7uX4JzuMZBI=
X-Received: by 2002:a05:6a00:290f:b0:56b:e15a:7215 with SMTP id
 cg15-20020a056a00290f00b0056be15a7215mr78413380pfb.27.1671054870586; Wed, 14
 Dec 2022 13:54:30 -0800 (PST)
MIME-Version: 1.0
References: <CALHCpMgSZOZdOGpLwTYf0sFD5EMNL7CuqHuFJV_6w5VPSWZnUw@mail.gmail.com>
 <CALHCpMgEZjnR39upkR6iozSk-b5A_GHRo9rcDSPXzzQi6x_qCw@mail.gmail.com>
 <b1b7935d-0785-2e57-bad9-ab2476f0acf2@leemhuis.info> <CALHCpMhsM2j=bSXEDC9BWYpOAyvCccgJpJmqXfiRTHvp6=y3tA@mail.gmail.com>
 <20221212101449.4e465181@xps-13> <CALHCpMimCqZB0bnHaOdCzucey+92NcRRZXCHXYYH5c9vj0nZaQ@mail.gmail.com>
 <20221212173730.64224599@xps-13> <b75a8769-0cc8-beb3-931a-6755aede3af0@inbox.ru>
 <20221213104643.052d4a06@xps-13> <CALHCpMhOku2b+1y5Z=N5RJ6SvCvNakD2rSyRAqp6Gz3JWVvXGg@mail.gmail.com>
 <20221213175424.79895b63@xps-13>
In-Reply-To: <20221213175424.79895b63@xps-13>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 14 Dec 2022 13:53:54 -0800
Message-ID: <CAGETcx8YvD5JABuJhah_6oOAUe=QgnOG5gWNL7Hcfxbvq0C2YQ@mail.gmail.com>
Subject: Re: nvmem-cells regression after adding 'call of_platform_populate()
 for MTD partitions'
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Maxim Kiselev <bigunclemax@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, 
	Richard Weinberger <richard@nod.at>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_135435_838980_5A02A6D1 
X-CRM114-Status: GOOD (  42.21  )
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

T24gVHVlLCBEZWMgMTMsIDIwMjIgYXQgODo1NCBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIE1heGltLAo+Cj4gYmlndW5jbGVtYXhAZ21h
aWwuY29tIHdyb3RlIG9uIFR1ZSwgMTMgRGVjIDIwMjIgMTQ6MDI6MzQgKzAzMDA6Cj4KPiA+IEkg
bG9va2VkIGNsb3NlciBhdCBjb21taXQgNjU4YzQ0NDhiYmJmIGFuZCBiY2RmMDMxNWE2MWEsIDVk
YjFjMmRiYzA0YzE2IGNvbW1pdHMuCj4gPiBMb29rcyBsaWtlIHdlIGhhdmUgdHdvIGRpZmZlcmVu
dCBmZWF0dXJlcyBiaW5kZWQgdG8gb25lIHByb3BlcnR5IC0gImNvbXBhdGlibGUiLgo+ID4KPiA+
IEZyb20gb25lIHNpZGUgaXQgaXMgdGhlIGFiaWxpdHkgdG8gZm9yd2FyZCB0aGUgc3Vibm9kZSBv
ZiB0aGUgbXRkCj4gPiBwYXJ0aXRpb24gdG8gdGhlIG52bWVtIHN1YnN5c3RlbSAoNjU4YzQ0NDhi
YmJmIGFuZCBhYzQyYzQ2Zjk4M2UpLgo+ID4gQW5kIGZyb20gYW5vdGhlciBzaWRlIGlzIHRoZSBh
YmlsaXR5IHRvIHVzZSBjdXN0b20gaW5pdGlhbGl6YXRpb24gb2YKPiA+IHRoZSBtdGQgcGFydGl0
aW9uIChiY2RmMDMxNWE2MWEgYW5kIDVkYjFjMmRiYzA0YzE2KS4KPiA+Cj4gPiBXaGF0IEkgbWVh
bjoKPiA+IEFjY29yZGluZyB0byBhYzQyYzQ2Zjk4M2UgSSBjYW4gY3JlYXRlIERUIGxpa2UgdGhp
czoKPiA+ICAtIHwKPiA+ICAgICBwYXJ0aXRpb25zIHsKPiA+ICAgICAgICAgY29tcGF0aWJsZSA9
ICJmaXhlZC1wYXJ0aXRpb25zIjsKPiA+ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4g
PiAgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+ID4KPiA+ICAgICAgICAgcGFydGl0aW9uQDAg
ewo+ID4gICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJudm1lbS1jZWxscyI7Cj4gPiAgICAgICAg
ICAgICByZWcgPSA8MHg0MDAwMCAweDEwMDAwPjsKPiA+ICAgICAgICAgICAgICNhZGRyZXNzLWNl
bGxzID0gPDE+Owo+ID4gICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47Cj4gPiAgICAgICAg
ICAgICBtYWNhZGRyX2dtYWMxOiBtYWNhZGRyX2dtYWMxQDAgewo+ID4gICAgICAgICAgICAgICAg
IHJlZyA9IDwweDAgMHg2PjsKPiA+ICAgICAgICAgICAgIH07Cj4gPiAgICAgICAgIH07Cj4gPiAg
ICAgfTsKPiA+Cj4gPgo+ID4gQW5kIGFjY29yZGluZyB0byA1ZGIxYzJkYmMwNGMxNiBJIGNhbiBj
cmVhdGUgRFQgbGlrZSB0aGlzOgo+ID4gIC0gfAo+ID4gICAgIHBhcnRpdGlvbnMgewo+ID4gICAg
ICAgICBjb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+ID4gICAgICAgICAjYWRkcmVz
cy1jZWxscyA9IDwxPjsKPiA+ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47Cj4gPgo+ID4gICAg
ICAgICBwYXJ0aXRpb25AMCB7Cj4gPiAgICAgICAgICAgICBjb21wYXRpYmxlID0gInUtYm9vdCxl
bnYiOwo+ID4gICAgICAgICAgICAgcmVnID0gPDB4NDAwMDAgMHgxMDAwMD47Cj4gPiAgICAgICAg
IH07Cj4gPiAgICAgfTsKPiA+Cj4gPiBCdXQgSSBjYW4gbm90IHVzZSB0aGVtIGJvdGgsIGJlY2F1
c2Ugb25seSBvbmUgImNvbXBhdGlibGUiIHByb3BlcnR5IGFsbG93ZWQuCj4gPiBUaGlzIHdpbGwg
YmUgaW5jb3JyZWN0Ogo+ID4gIC0gfAo+ID4gICAgIHBhcnRpdGlvbnMgewo+ID4gICAgICAgICBj
b21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+ID4gICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKPiA+ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47Cj4gPgo+ID4gICAgICAgICBw
YXJ0aXRpb25AMCB7Cj4gPiAgICAgICAgICAgICBjb21wYXRpYmxlID0gInUtYm9vdCxlbnYiOyAg
IyBmcm9tIGFjNDJjNDZmOTgzZQo+ID4gICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJudm1lbS1j
ZWxscyI7ICMgZnJvbSA1ZGIxYzJkYmMwNGMKPgo+IFdoYXQgYWJvdXQ6Cj4KPiAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAidS1ib290LGVudiIsICJudm1lbS1jZWxscyI7Cj4KPiBpbnN0ZWFk
PyB0aGF0IHNob3VsZCBhY3R1YWxseSB3b3JrLgo+Cj4gPiAgICAgICAgICAgICByZWcgPSA8MHg0
MDAwMCAweDEwMDAwPjsKPiA+ICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4g
ICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47Cj4gPiAgICAgICAgICAgICBtYWNhZGRyX2dt
YWMxOiBtYWNhZGRyX2dtYWMxQDAgewo+ID4gICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg2
PjsKPiA+ICAgICAgICAgICAgIH07Cj4gPiAgICAgICAgIH07Cj4gPiAgICAgfTsKPiA+Cj4gPiA+
IGNvbXBhdGlibGU6IER1cGxpY2F0ZSBwcm9wZXJ0eSBuYW1lCj4gPgo+ID4g0LLRgiwgMTMg0LTQ
tdC6LiAyMDIyINCzLiDQsiAxMjo0NiwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT46Cj4gPiA+Cj4gPiA+IEhpIE1heGltLAo+ID4gPgo+ID4gPiBmaWRvX21heEBpbmJv
eC5ydSB3cm90ZSBvbiBNb24sIDEyIERlYyAyMDIyIDIwOjU3OjQ5ICswMzAwOgo+ID4gPgo+ID4g
PiA+IEhpLCBNaXF1ZWwhCj4gPiA+ID4KPiA+ID4gPiBPbiAxMi4xMi4yMDIyIDE5OjM3LCBNaXF1
ZWwgUmF5bmFsIHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gPiBMZXQgbWUgdHJ5IHRvIHJlY2FwIHRo
ZSBzaXR1YXRpb24gZm9yIGFsbCB0aGUgcGVvcGxlIEkganVzdCBpbnZvbHZlZDoKPiA+ID4gPiA+
Cj4gPiA+ID4gPiAqIEFuIEV0aGVybmV0IGRyaXZlciBnZXRzIGl0cyBtYWMgYWRkcmVzcyBmcm9t
IGFuIG52bWVtIGNlbGwuIFRoZQo+ID4gPiA+ID4gICAgRXRoZXJuZXQgY29udHJvbGxlciBEVCBu
b2RlIHRoZW4gaGFzIGFuICJudm1lbS1jZWxscyIgcHJvcGVydHkKPiA+ID4gPiA+ICAgIHBvaW50
aW5nIHRvd2FyZHMgYW4gbnZtZW0gY2VsbC4KPiA+ID4gPiA+ICogVGhlIG52bWVtIGNlbGwgY29t
ZXMgZnJvbSBhbiBtdGQgcGFydGl0aW9uLgo+ID4gPiA+ID4gKiBUaGUgbXRkIHBhcnRpdGlvbiBp
cyBmbGFnZ2VkIHdpdGggYSBwYXJ0aWN1bGFyIGNvbXBhdGlibGUKPiA+ID4gPiA+ICAgICh3aGlj
aCBpcyBhbHNvIG5hbWVkICJudm1lbS1jZWxscyIpIHRvIHRlbGwgdGhlIGtlcm5lbCB0aGF0IHRo
ZSBub2RlCj4gPiA+ID4gPiAgICBwcm9kdWNlcyBudm1lbSBjZWxscy4KPiA+ID4gPiA+ICogVGhl
IG10ZCBwYXJ0aXRpb24gaXRzZWxmIGhhcyBubyBkcml2ZXIsIGJ1dCBpcyB0aGUgY2hpbGQgbm9k
ZSBvZiBhCj4gPiA+ID4gPiAgICAicGFydGl0aW9ucyIgY29udGFpbmVyIHdoaWNoIGhhcyBvbmUg
KGluIHRoaXMgY2FzZSwKPiA+ID4gPiA+ICAgICJmaXhlZC1wYXJ0aXRpb25zIiwgc2VlIHRoZSBz
bmlwcGV0IGJlbG93KS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBCZWNhdXNlIHRoZSAibnZtZW0tY2Vs
bHMiIHByb3BlcnR5IG9mIHRoZSBFdGhlcm5ldCBub2RlIHBvaW50cyBhdCB0aGUKPiA+ID4gPiA+
IG52bWVtLWNlbGwgbm9kZSwgdGhlIGNvcmUgY3JlYXRlIGEgZGV2aWNlIGxpbmsgYmV0d2VlbiB0
aGUgRXRoZXJuZXQKPiA+ID4gPiA+IGNvbnRyb2xsZXIgKGNvbnN1bWVyKSBhbmQgdGhlIG10ZCBw
YXJ0aXRpb24gKHByb2R1Y2VyKS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGUgZGV2aWNlIGxpbmsg
aW4gdGhpcyBjYXNlIHdpbGwgbmV2ZXIgYmUgc2F0aXNmaWVkIGJlY2F1c2Ugbm8gZHJpdmVyCj4g
PiA+ID4gPiBtYXRjaGVzIHRoZSAibnZtZW0tY2VsbHMiIGNvbXBhdGlibGUgb2YgdGhlIHBhcnRp
dGlvbiBub2RlLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFJldmVydGluZyBjb21taXQgYmNkZjAzMTVh
NjFhICgibXRkOiBjYWxsIG9mX3BsYXRmb3JtX3BvcHVsYXRlKCkgZm9yIE1URAo+ID4gPiA+ID4g
cGFydGl0aW9ucyIpIHdvdWxkIElNSE8gbm90IG1ha2UgbXVjaCBzZW5zZSwgdGhlIHByb2JsZW0g
Y29tZXMgZnJvbSB0aGUKPiA+ID4gPiA+IGRldmljZSBsaW5rIHNpZGUgYW5kIGV2ZW4gdGhlcmUs
IHRoZXJlIGlzIG5vdGhpbmcgcmVhbGx5ICJ3cm9uZyIsCj4gPiA+ID4gPiBiZWNhdXNlIEkgcmVh
bGx5IGV4cGVjdCB0aGUgbXRkIGRldmljZSB0byBiZSByZWFkeSBiZWZvcmUgdGhlCj4gPiA+ID4g
PiBFdGhlcm5ldCBjb250cm9sbGVyIHByb2JlLCB0aGUgZGV2aWNlIGxpbmsgaXMgbGVnaXRpbWF0
ZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTbyBJIHdvdWxkIGxpa2UgdG8gZXhwbG9yZSBvdGhlciBh
bHRlcm5hdGl2ZXMuIEhlcmUgYXJlIGEgYnVuY2ggb2YKPiA+ID4gPiA+IGlkZWFzLCBidXQgSSdt
IG9wZW46Cj4gPiA+ID4KPiA+ID4gPiBIb3cgYWJvdXQgdG8gY3JlYXRlIHNpbXBsZSBkcml2ZXIg
d2l0aCBjb21wYXRpYmxlPSJudm1lbS1jZWxsIiBhbmQgdG8gbW92ZSBhbGwgdGhlIHN1ZmYgZnJv
bSBtYWluIG10ZCBkcml2ZXIgd2hpY2ggc2VydmVzIG52bWVtLWNlbGwgdG8gdGhlIHByb2JlIGZ1
bmN0aW9uPwo+ID4gPgo+ID4gPiBUaGlzIGlzIHByb2JhYmx5IHdvcnRoIHRoZSB0cnkgYnV0IEkg
ZG91YnQgeW91IGNhbiBtYWtlIGl0IHdvcmsgd2l0aG91dAo+ID4gPiByZWdyZXNzaW9ucyBiZWNh
dXNlIElJUkMgdGhlIG52bWVtIHJlZ2lzdHJhdGlvbiBoYXBwZW5zIG5vIG1hdHRlciB0aGUKPiA+
ID4gY29tcGF0aWJsZSAobm90IG1lbnRpb25pbmcgdGhlIHVzZXItb3RwIGFuZCBmYWN0b3J5LW90
cCBjYXNlcykuIFlvdSBjYW4KPiA+ID4gZGVmaW5pdGVseSB0cnkgdGhpcyBvdXQgaWYgeW91IHRo
aW5rIHlvdSBjYW4gY29tZSB1cCB3aXRoIHNvbWV0aGluZwo+ID4gPiB0aG91Z2guCj4gPiA+Cj4g
PiA+IEJ1dCBJIHdvdWxkIGxpa2UgdG8gaGVhciBmcm9tIHRoZSBkZXZpY2UtbGluayBndXJ1cyA6
KSBiZWNhdXNlIGV2ZW4gaWYKPiA+ID4gd2UgZml4IG10ZCB3aXRoIGEgInRyaWNrIiBsaWtlIGFi
b3ZlLCBJIGd1ZXNzIHdlJ2xsIHZlcnkgbGlrZWx5IGZpbmQKPiA+ID4gb3RoZXIgY29ybmVyIGNh
c2VzIGxpa2UgdGhhdCBhbmQgSSBhbSBpbnRlcmVzdGVkIGluIHVuZGVyc3RhbmRpbmcgdGhlCj4g
PiA+IHJhdGlvbmFsZSBvZiB3aGF0IGNvdWxkIGJlIGEgcHJvcGVyIGZpeC4KPiA+ID4KClJlc3Bv
bmRpbmcgdG8gdGhlIHdob2xlIHRocmVhZC4KCkknbSBnb2luZyBieSBNaXF1ZWwncyBmaXJzdCBl
bWFpbCBpbiB3aGljaCBoZSBjYydlZCBtZSBhbmQgaGF2ZW4ndAphY3R1YWxseSBsb29rZWQgYXQg
dGhlIG10ZCBjb2RlLiBDb3VwbGUgb2YgY29tbWVudHM6CgpJbmRlcGVuZGVudCBvZiBtdGQvbnZt
ZW0tY2VsbCwgSSBnZW5lcmFsbHkgZnJvd24gb24gaGF2aW5nIGEKY29tcGF0aWJsZSBzdHJpbmcg
Zm9yIGEgY2hpbGQgbm9kZSB0aGF0IHlvdSBkb24ndCB0cmVhdCBhcyBhIGRldmljZS4KRXZlbiBt
b3JlIHNvIGlmIHlvdSBhY3R1YWxseSBjcmVhdGUgYSBzdHJ1Y3QgZGV2aWNlIGZvciBpdCBhbmQg
dGhlbgpkb24ndCBkbyBhbnl0aGluZyBlbHNlIHdpdGggaXQuIFRoYXQncyBqdXN0IGEgd2FzdGUg
b2YgbWVtb3J5LiBTbywgaW4KZ2VuZXJhbCB0cnkgdG8gYXZvaWQgdGhhdCBpbiB0aGUgZnV0dXJl
IGlmIHlvdSBjYW4uCgpBbHNvLCB0aGVyZSBhcmUgZmxhZ3MgdGhlIHBhcmVudCBkZXZpY2UncyBk
cml2ZXIgY2FuIHNldCB0aGF0J2xsIHRlbGwKZndfZGV2bGluayBub3QgdG8gdHJlYXQgYSBzcGVj
aWZpYyBEVCBub2RlIGFzIGEgcmVhbCBkZXZpY2UuIFNvLCBpZiB3ZQpyZWFsbHkgbmVlZCB0aGF0
IEknbGwgZGlnIHVwIGFuZCBzdWdnZXN0IGEgZml4LgoKTGFzdGx5IGFuZCBtb3JlIGltcG9ydGFu
dGx5LCBJJ3ZlIGEgc2VyaWVzWzFdIHRoYXQgc3RvcHMgZGVwZW5kaW5nIG9uCnRoZSBjb21wYXRp
YmxlIHByb3BlcnR5IGZvciBmd19kZXZsaW5rIHRvIHdvcmsuIFNvIGl0IHNob3VsZCBiZQpzbWFy
dGVyIHRoYW4gaXQgaXMgdG9kYXkuIEJ1dCB0aGF0IHNlcmllcyBoYXMga25vd24gYnVncyBmb3Ig
d2hpY2ggSQpnYXZlIHRlc3QgZml4ZXMgaW4gdGhhdCB0aHJlYWQuIEkgcGxhbiB0byBtYWtlIGEg
djIgb2YgdGhhdCBzZXJpZXMKd2l0aCB0aGF0IGZpeCBhbmQgSSdtIGV4cGVjdGluZyBpdCdsbCBm
aXggYSBidW5jaCBvZiBmd19kZXZsaW5rCmlzc3Vlcy4KCkZlZWwgZnJlZSB0byBnaXZlIHYxICsg
c3F1YXNoaW5nIHRoZSBmaXhlcyBhIHNob3QgaWYgeW91IGFyZSBleGNpdGVkCnRvIHRyeSBpdC4g
T3RoZXJ3aXNlLCBJJ2xsIHRyeSBteSBiZXN0IHRvIGdldCBhcm91bmQgdG8gaXQgdGhpcyB3ZWVr
CihraW5kYSBzd2FtcGVkIHRob3VnaCArIGhvbGlkYXlzIGNvbWluZyB1cCwgc28gbm8gcHJvbWlz
ZXMpLgoKWzFdIC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIyMDgxMDA2MDA0MC4z
MjE2OTctMS1zYXJhdmFuYWtAZ29vZ2xlLmNvbS8KClRoYW5rcywKU2FyYXZhbmEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
