Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EE4D277C1
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Jan 2026 00:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pxVLnGverd1EdpEYC56rfij7bnduhaNfzL05Z2RF0w=; b=lYSZABlWgEt/Hb
	UUd2mPHlTAQ/sAwhOMV2/wKQUD/YR/GlsGnPxoOR5K0TyEo2xwCMUb9L2z+DzuzPMkrDdE/717ZSl
	IxIMRTqLTUq47TwB/OsN777PJbvCMEmU/H4SqUAM3VjQtyyHVDkJ0Q8J9GBIx3I1+m8BqkxX2ywp0
	g9cZVoxu2OU1K+qWcOm8rCLGAZlAheiodnCbNchFfm1C8vD/sm9MdRpBsZiu/G94BE2F3uKwWdn6F
	E/BcI8uEK2GWt8ZTdDnhF6ifGdu6UUFohvYOuMGbRXhQ+6CW/aFdhHH+ewUTXkS1D6KOF0HTtstbZ
	IIFn2xR/Imbs9nmCqWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veMnc-0000000380W-3zjO;
	Sat, 10 Jan 2026 00:25:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veMnb-0000000380P-0MVI
	for linux-mtd@lists.infradead.org;
	Sat, 10 Jan 2026 00:25:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E29FD60160
	for <linux-mtd@lists.infradead.org>; Sat, 10 Jan 2026 00:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98410C19423
	for <linux-mtd@lists.infradead.org>; Sat, 10 Jan 2026 00:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768004745;
	bh=xCsdq2/YpqNCz0nEsnCCHEidLPsRpz/Me7ujRVjz1Yo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jL8FoZiUxBsDffXxxhvI0Toz5694fbx3yllTIPb8VjtO9aVhWiRpRLV3Wvr+XKZxK
	 aRe/kUasV5MaJImSoVBW8LgK60JsfPUCJ1fou4eOIdH5en6XmAX9cQjYngV5wh96jj
	 g7RdQjLnq9gqEm0QoWs+3DuuObs09oXGtAygE0kfMbl4hZinsX3uiRKA+U2Pg0JKuQ
	 dzUyci+OEVoIvGC+KTUIvOyaFITUZPkrCiCq6QQTwW6rxMLf+RdIev1rGV5dWyWC2R
	 CBI7y54ffgQ7wA/90U8GMzoYRbLafusbZFv6XK8FgyN1Tu7S/Gun/9K36spYRPzv4j
	 ScCAPScfluBUg==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6503b561daeso7315007a12.1
        for <linux-mtd@lists.infradead.org>; Fri, 09 Jan 2026 16:25:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKtk8tvTqcD2CDDtUnyUTUaYM0GwNHzccRVMEff5XPEwLe7xqFxzvuthPZinCd98pDSyXMfwmUQsc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj3avQlhJtF8tYzPBZx4g7CyYJjfOy0+mD78LOqWBlKFkXvwIM
	fWCJ2O4ms4CUaaKKPBtn6yToUJMwyRz+y18ZYHZFxJuR+vBO9mkJF7ttHd8BNwaEfXpAhzTxafr
	TuYLE7zWPXH5TaCwZsqOoXx8pzdIt8w==
X-Google-Smtp-Source: AGHT+IH2kcyT28zPJ6scp6ebqDGJc2zumrCICLwucitli+zofZLqRYPfOa2gqyx1ueknJkxerSM9/WLfKBC2uSAi/LM=
X-Received: by 2002:a17:907:8693:b0:b7a:1be1:822 with SMTP id
 a640c23a62f3a-b84451a1f3cmr1192133566b.63.1768004744112; Fri, 09 Jan 2026
 16:25:44 -0800 (PST)
MIME-Version: 1.0
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
 <20260108-dt-mtd-partitions-v1-7-124a53ce6279@kernel.org> <20260109-affable-poetic-albatross-ff7fcf@quoll>
In-Reply-To: <20260109-affable-poetic-albatross-ff7fcf@quoll>
From: Rob Herring <robh@kernel.org>
Date: Fri, 9 Jan 2026 18:25:32 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLcVUMJqTKnYpP_r4Z16Sw1pVcQ=HCFJG0bY_O=q3psVQ@mail.gmail.com>
X-Gm-Features: AZwV_Qh7LipR_5wdGhuBSgVEhZFQa5ZRYILCErh5TeL0Qy91vSKljpYk4n02SgY
Message-ID: <CAL_JsqLcVUMJqTKnYpP_r4Z16Sw1pVcQ=HCFJG0bY_O=q3psVQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] dt-bindings: mtd: Ensure partition node properties
 are documented
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marcus Folkesson <marcus.folkesson@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
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

T24gRnJpLCBKYW4gOSwgMjAyNiBhdCAzOjM24oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgSmFuIDA4LCAyMDI2IGF0IDExOjUzOjE2
QU0gLTA2MDAsIFJvYiBIZXJyaW5nIChBcm0pIHdyb3RlOgo+ID4gUGFydGl0aW9uIG5vZGVzIHdp
dGhvdXQgYSBjb21wYXRpYmxlIGhhdmUgbm8gcmVzdHJpY3Rpb25zIG9uIGFkZGl0aW9uYWwKPiA+
IHByb3BlcnRpZXMuIEZpeCB0aGlzIGJ5IGVuc3VyaW5nICd1bmV2YWx1YXRlZFByb3BlcnRpZXMn
IGlzIHNldCB3aGVuCj4gPiB0aGVyZSdzIG5vIGNvbXBhdGlibGUgcHJvcGVydHkuIElmIHRoZXJl
IGlzIGEgY29tcGF0aWJsZSBwcm9wZXJ0eSwgdGhlbgo+ID4gdGhlcmUgc2hvdWxkIGJlIGEgc3Bl
Y2lmaWMgc2NoZW1hIGZvciBpdCB3aGljaCB3aWxsIGVuZm9yY2UKPiA+ICd1bmV2YWx1YXRlZFBy
b3BlcnRpZXMnLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2Jo
QGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL210ZC55YW1sICAgICAgICAgICAgICAgfCAgOCArKy0tLS0tLQo+ID4gIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlvbnMueWFtbCB8ICAy
ICstCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9u
LnlhbWwgICAgICAgIHwgMTIgKysrKysrKysrKysrCj4gPiAgLi4uL210ZC9wYXJ0aXRpb25zL3Rw
bGluayxzYWZlbG9hZGVyLXBhcnRpdGlvbnMueWFtbCAgICAgICAgIHwgIDIgKy0KPiA+ICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdS1ib290LnlhbWwg
fCAgMiArLQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvdGksZ3Bt
Yy1vbmVuYW5kLnlhbWwgICB8ICAyICstCj4gPiAgNiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tdGQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvbXRkLnlhbWwKPiA+IGluZGV4IGU1NmRiYTgzZjAwYS4uNWEyZDA2
Yzk2YzBkIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9tdGQueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9tdGQueWFtbAo+ID4gQEAgLTM2LDEyICszNiw4IEBAIHByb3BlcnRpZXM6Cj4gPiAgICAg
ICAgLSBjb21wYXRpYmxlCj4gPgo+ID4gIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ID4gLSAgIkBbMC05
YS1mXSskIjoKPiA+IC0gICAgJHJlZjogcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbAo+ID4gLSAg
ICBkZXByZWNhdGVkOiB0cnVlCj4gPiAtCj4gPiAtICAiXnBhcnRpdGlvbkBbMC05YS1mXSsiOgo+
ID4gLSAgICAkcmVmOiBwYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sCj4gPiArICAiKF5wYXJ0aXRp
b24pP0BbMC05YS1mXSskIjoKPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvbXRkL3BhcnRpdGlvbnMv
cGFydGl0aW9uLnlhbWwjLyRkZWZzL3BhcnRpdGlvbi1ub2RlCj4gPiAgICAgIGRlcHJlY2F0ZWQ6
IHRydWUKPgo+IFRoaXMgbWFrZXMgcGFydGl0aW9uQCBkZXByZWNhdGVkLiBMb29rcyB1bmludGVu
ZGVkIG9yIG5lZWRkcyBjb21taXQgbXNnCj4gZXhwbGFuYXRpb24uCgpObywgdGhlIG9ubHkgY2hh
bmdlIGhlcmUgaXMgSSBjb21iaW5lZCB0aGUgZW50cmllcy4gInBhcnRpdGlvbkAiIGlzCmRlcHJl
Y2F0ZWQgd2hlbiBub3QgdW5kZXIgInBhcnRpdGlvbnMiIG5vZGUuCgpSb2IKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
