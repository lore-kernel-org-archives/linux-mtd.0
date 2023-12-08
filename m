Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D1BC4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 22:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3jn7Wr5j/0//8jek97JiUNeY+alWfdtMhwn/a5qh1o=; b=hY6csb1I8BBanO
	gRW+gjuQUgPw8IyxJo7rAYd+4AfqK1gvxn7fwwbwoTseTPzVm8t941rgSriYSo22yFsbS7cN5QtK9
	w3T4KIAxSC7FSAp6kntLPrH6UPUOmBwxP4TJP9oIwZtOKF2b/xlnf+iYt/CY5wkDNKf1ZNcYjEEva
	XgpDFmnpmMXQMe+q2SX5lagW7BVnhH/LLqxTtbbIxVdGOTtKh4VcPnnf3CEqY8suDBWL90gJus3ZB
	4TDNRlxIwEXZt4qLzaG9lKfpNUrStJgwyWZn5QSx9npeShnSz8/7eb3kj4NN5sMQ8oo9oqzjCw4N/
	jzGwKzl+HZ1k0oRZdp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBjnp-00Gjw4-2Y;
	Fri, 08 Dec 2023 22:58:37 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBjnn-00Gjud-02
	for linux-mtd@lists.infradead.org;
	Fri, 08 Dec 2023 22:58:36 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-54c77e0835bso3646068a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 08 Dec 2023 14:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702076307; x=1702681107; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMpCWLXMXRBTKeWVwSpx26nw2WRYoXe/hUgsW8+MXwY=;
        b=kkUpAljRqf5OzonubfAEaLspDBGYREMo3WC2+PoWwvWodTl/U+QGhCy3W+Qf5RdXQD
         +B993cX1ENyCi14oThZmfY0nwR5Y7idRoEXcQyx1VPisbCortk9B2icvbBrY7TGxfyut
         PFaF1djbDEaiU0LTyv66+dHkueXS57p33cWY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702076307; x=1702681107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMpCWLXMXRBTKeWVwSpx26nw2WRYoXe/hUgsW8+MXwY=;
        b=VORM/9bRs9E7QDPT5WZj9nKlqo2Q+D1x7xaWInCri+AffyZwZKkuTkUJtHi33Nllt3
         WWsZqiYJTzKl1vhEMQh+lIOTCpOySUdM2Nx6bB+Epkbt0J8WWTS/NyQWtNJGjpjk1tb+
         xj4l2ToBCr0cvvQEHLoPnWCxSosqgFW9boBmUQvNQLP+/xuKPLvFRqyj2lF/FFD3fTkz
         TJjfARpDHgIF0RhrrwbkMPks3Z53xrdS5WWGvdlimwP/OcumkdazMzikYQuSd5eA9qTV
         tItw6Ow2wThmnV28D1GCoHAsX+SAjp0A3oQIA2FiqE+VgZgvHvXJjAGAdH2XmWc4V6bx
         2DYA==
X-Gm-Message-State: AOJu0YxvJj7CKwCKTSYNwaAEvU9mixGPPmY6ig+FrcvMknSIsl6H0lEX
	9JG+F2D3fip+765+VBuWO4PtUjC/maEYDBoPyfM34Q==
X-Google-Smtp-Source: AGHT+IEC8IAkzhTxZXuXzT95S1oMy3pZuNhKwqQHQUOi0m7PW3dUxcRvZffwon3Pu+gLtvShq4pNOM+wjcjn7p2b8d8=
X-Received: by 2002:a17:906:2b53:b0:a19:a19b:78c2 with SMTP id
 b19-20020a1709062b5300b00a19a19b78c2mr408985ejg.133.1702076307046; Fri, 08
 Dec 2023 14:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20231116172859.393744-1-sjg@chromium.org> <20231208150042.GA1278773-robh@kernel.org>
 <CAPnjgZ2i4gvgiUeHPOfHuOdBooV4e=QQEq6iMo0JbDwOS6dCwA@mail.gmail.com> <CAL_Jsq+xMZ8yz4H9D59uCSyX4h5W+4ruGF++=wVA=msXz+Y01A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+xMZ8yz4H9D59uCSyX4h5W+4ruGF++=wVA=msXz+Y01A@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 8 Dec 2023 15:58:10 -0700
Message-ID: <CAPnjgZ1uW8T6woXSqFUNm301=W3zBYOrADREkrz=DuwSW87qZg@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: partitions: Add binman compatible
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	Michael Walle <mwalle@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_145835_055709_1D0C5E46 
X-CRM114-Status: GOOD (  35.80  )
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

SGkgUm9iLAoKT24gRnJpLCA4IERlYyAyMDIzIGF0IDE0OjU2LCBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgRGVjIDgsIDIwMjMgYXQgMTE6NDfigK9BTSBT
aW1vbiBHbGFzcyA8c2pnQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGkgUm9iLAo+ID4K
PiA+IE9uIEZyaSwgOCBEZWMgMjAyMyBhdCAwODowMCwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgTm92IDE2LCAyMDIzIGF0IDEwOjI4OjUw
QU0gLTA3MDAsIFNpbW9uIEdsYXNzIHdyb3RlOgo+ID4gPiA+IEFkZCBhIGNvbXBhdGlibGUgc3Ry
aW5nIGZvciBiaW5tYW4sIHNvIHdlIGNhbiBleHRlbmQgZml4ZWQtcGFydGl0aW9ucwo+ID4gPiA+
IGluIHZhcmlvdXMgd2F5cy4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIEds
YXNzIDxzamdAY2hyb21pdW0ub3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+Cj4gPiA+ID4gKG5vIGNo
YW5nZXMgc2luY2UgdjUpCj4gPiA+ID4KPiA+ID4gPiBDaGFuZ2VzIGluIHY1Ogo+ID4gPiA+IC0g
QWRkICNhZGRyZXNzL3NpemUtY2VsbHMgYW5kIHBhcnRlcm5Qcm9wZXJ0aWVzCj4gPiA+ID4gLSBE
cm9wICRyZWYgdG8gZml4ZWQtcGFydGl0aW9ucy55YW1sCj4gPiA+ID4gLSBEcm9wICdzZWxlY3Q6
IGZhbHNlJwo+ID4gPiA+Cj4gPiA+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+ID4gPiAtIENoYW5nZSBz
dWJqZWN0IGxpbmUKPiA+ID4gPgo+ID4gPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiA+ID4gLSBEcm9w
IGZpeGVkLXBhcnRpdGlvbiBhZGRpdGlvbmFsIGNvbXBhdGlibGUgc3RyaW5nCj4gPiA+ID4gLSBE
cm9wIGZpeGVkLXBhcnRpdGlvbnMgZnJvbSB0aGUgZXhhbXBsZQo+ID4gPiA+IC0gTWVudGlvbiB1
c2Ugb2YgY29tcGF0aWJsZSBpbnN0ZWFkIG9mIGxhYmVsCj4gPiA+ID4KPiA+ID4gPiBDaGFuZ2Vz
IGluIHYyOgo+ID4gPiA+IC0gRHJvcCBtZW50aW9uIG9mICdlbmhhbmNlZCBmZWF0dXJlcycgaW4g
Zml4ZWQtcGFydGl0aW9ucy55YW1sCj4gPiA+ID4gLSBNZW50aW9uIEJpbm1hbiBpbnB1dCBhbmQg
b3V0cHV0IHByb3BlcnRpZXMKPiA+ID4gPiAtIFVzZSBwbGFpbiBwYXJ0aXRpb25AeHh4IGZvciB0
aGUgbm9kZSBuYW1lCj4gPiA+ID4KPiA+ID4gPiAgLi4uL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25z
L2Jpbm1hbi55YW1sICAgICAgIHwgNjggKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ICAuLi4v
YmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9ucy55YW1sICAgfCAgMSArCj4gPiA+ID4g
IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrCj4g
PiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL2Jpbm1hbi55YW1sCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2Jpbm1hbi55YW1sCj4g
PiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjMy
OTIxNzU1MGE5OAo+ID4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlhbWwKPiA+ID4g
PiBAQCAtMCwwICsxLDY4IEBACj4gPiA+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChH
UEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKPiA+ID4gPiArIyBDb3B5cmlnaHQgMjAyMyBHb29nbGUg
TExDCj4gPiA+ID4gKwo+ID4gPiA+ICslWUFNTCAxLjIKPiA+ID4gPiArLS0tCj4gPiA+ID4gKyRp
ZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRkL3BhcnRpdGlvbnMvYmlubWFuLnlh
bWwjCj4gPiA+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMv
Y29yZS55YW1sIwo+ID4gPiA+ICsKPiA+ID4gPiArdGl0bGU6IEJpbm1hbiBmaXJtd2FyZSBsYXlv
dXQKPiA+ID4gPiArCj4gPiA+ID4gK21haW50YWluZXJzOgo+ID4gPiA+ICsgIC0gU2ltb24gR2xh
c3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4gPiA+ID4gKwo+ID4gPiA+ICtkZXNjcmlwdGlvbjogfAo+
ID4gPiA+ICsgIFRoZSBiaW5tYW4gbm9kZSBwcm92aWRlcyBhIGxheW91dCBmb3IgZmlybXdhcmUs
IHVzZWQgd2hlbiBwYWNrYWdpbmcgZmlybXdhcmUKPiA+ID4gPiArICBmcm9tIG11bHRpcGxlIHBy
b2plY3RzLiBJdCBpcyBiYXNlZCBvbiBmaXhlZC1wYXJ0aXRpb25zLCB3aXRoIHNvbWUKPiA+ID4g
PiArICBleHRlbnNpb25zLCBidXQgdXNlcyAnY29tcGF0aWJsZScgdG8gaW5kaWNhdGUgdGhlIGNv
bnRlbnRzIG9mIHRoZSBub2RlLCB0bwo+ID4gPiA+ICsgIGF2b2lkIHBlcnR1cmJpbmcgb3IgY29u
ZnVzaW5nIGV4aXN0aW5nIGluc3RhbGxhdGlvbnMgd2hpY2ggdXNlICdsYWJlbCcgZm9yIGEKPiA+
ID4gPiArICBwYXJ0aWN1bGFyIHB1cnBvc2UuCj4gPiA+ID4gKwo+ID4gPiA+ICsgIEJpbm1hbiBz
dXBwb3J0cyBwcm9wZXJ0aWVzIHVzZWQgYXMgaW5wdXRzIHRvIHRoZSBmaXJtd2FyZS1wYWNrYWdp
bmcgcHJvY2VzcywKPiA+ID4gPiArICBzdWNoIGFzIHRob3NlIHdoaWNoIGNvbnRyb2wgYWxpZ25t
ZW50IG9mIHBhcnRpdGlvbnMuIFRoaXMgYmluZGluZyBhZGRyZXNzZXMKPiA+ID4gPiArICB0aGVz
ZSAnaW5wdXQnIHByb3BlcnRpZXMuIEZvciBleGFtcGxlLCBpdCBpcyBjb21tb24gZm9yIHRoZSAn
cmVnJyBwcm9wZXJ0eQo+ID4gPiA+ICsgIChhbiAnb3V0cHV0JyBwcm9wZXJ0eSkgdG8gYmUgc2V0
IGJ5IEJpbm1hbiwgYmFzZWQgb24gdGhlIGFsaWdubWVudCByZXF1ZXN0ZWQKPiA+ID4gPiArICBp
biB0aGUgaW5wdXQuCj4gPiA+ID4gKwo+ID4gPiA+ICsgIE9uY2UgcHJvY2Vzc2luZyBpcyBjb21w
bGV0ZSwgaW5wdXQgcHJvcGVydGllcyBoYXZlIG1vc3RseSBzZXJ2ZWQgdGhlaXIKPiA+ID4gPiAr
ICBwdXJwb3NlLCBhdCBsZWFzdCB1bnRpbCB0aGUgZmlybXdhcmUgaXMgcmVwYWNrZWQgbGF0ZXIs
IGUuZy4gZHVlIHRvIGEKPiA+ID4gPiArICBmaXJtd2FyZSB1cGRhdGUuIFRoZSAnZml4ZWQtcGFy
dGl0aW9ucycgYmluZGluZyBzaG91bGQgcHJvdmlkZSBlbm91Z2gKPiA+ID4gPiArICBpbmZvcm1h
dGlvbiB0byByZWFkIHRoZSBmaXJtd2FyZSBhdCBydW50aW1lLCBpbmNsdWRpbmcgZGVjb21wcmVz
c2lvbiBpZgo+ID4gPiA+ICsgIG5lZWRlZC4KPiA+ID4KPiA+ID4gSG93IGlzIHRoaXMgZ29pbmcg
dG8gd29yayBleGFjdGx5PyBiaW5tYW4gcmVhZHMgdGhlc2Ugbm9kZXMgYW5kIHRoZW4KPiA+ID4g
d3JpdGVzIG91dCAnZml4ZWQtcGFydGl0aW9ucycgbm9kZXMuIEJ1dCB0aGVuIHlvdSd2ZSBsb3N0
IHRoZSBiaW5tYW4KPiA+ID4gc3BlY2lmYyBwYXJ0cyBuZWVkZWQgZm9yIHJlcGFja2luZy4KPiA+
Cj4gPiBObywgdGhleSBhcmUgdGhlIHNhbWUgbm9kZS4gSSBkbyB3YW50IHRoZSBleHRyYSBpbmZv
cm1hdGlvbiB0byBzdGljawo+ID4gYXJvdW5kLiBTbyBsb25nIGFzIGl0IGlzIGNvbXBhdGlibGUg
d2l0aCBmaXhlZC1wYXJ0aXRpb24gYXMgd2VsbCwgdGhpcwo+ID4gc2hvdWxkIHdvcmsgT0suCj4K
PiBIb3cgY2FuIGl0IGJlIGJvdGg/IFRoZSBwYXJ0aXRpb25zIG5vZGUgY29tcGF0aWJsZSBjYW4g
YmUgZWl0aGVyCj4gJ2ZpeGVkLXBhcnRpdGlvbnMnIG9yICdiaW5tYW4nLgoKQ2FuIHdlIG5vdCBh
bGxvdyBpdCB0byBiZSBib3RoPyBJIGhhdmUgdHJpZWQgdG8gYWRqdXN0IHRoaW5ncyBpbgpyZXNw
b25zZSB0byBmZWVkYmFjayBidXQgcGVyaGFwcyB0aGUgZmVlZGJhY2sgd2FzIGxlYWRpbmcgbWUg
ZG93biB0aGUKd3JvbmcgcGF0aD8KCkJ1dCBpZiBub3QsIHRoZW4gd2hhdGV2ZXIgd29ya3MgaXMg
ZmluZSBmb3Igbm93LiBJIGp1c3Qgd2FudCB0byBtYWtlCnNvbWUgcHJvZ3Jlc3Mgb24gdGhpcyB2
ZXJ5LCB2ZXJ5IG9sZCBzZXJpZXMuCgo+Cj4gSW4gdGhlIHBhcnRpdGlvbiBub2RlcywgJ2FsaWdu
JyBmb3IgZXhhbXBsZSBpcyBhbGxvd2VkIGZvciBhIGJpbm1hbgo+IHBhcnRpdGlvbiBidXQgbm90
IGEgZml4ZWQtcGFydGl0aW9uLgo+Cj4gTm90ZSB0aGF0IHRoZSBzY2hlbWEgbWF5IG5vdCBhY3R1
YWxseSB3YXJuIG9uIGV4dHJhIHByb3BlcnRpZXMgQVRNCj4gYmVjYXVzZSB0aGVyZSBhcmUgc29t
ZSBpc3N1ZXMgd2l0aCB0aGUgc2NoZW1hIHN0cnVjdHVyZS4gU2luY2UgdGhlcmUKPiBjYW4gYmUg
bmVzdGVkIHBhcnRpdHRpb25zLCB0aGF0IGNvbXBsaWNhdGVzIG1hdHRlcnMuIEl0J3MgYmVlbiBv
biBteQo+IHRvZG8gbGlzdCB0byBmaXguCgpPSy4KClJlZ2FyZHMsClNpbW9uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
