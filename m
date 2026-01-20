Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A1FCA5FD7
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 18:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4VvGuM2aBvSrsrRmgRMGetyjF4immrXdpbYyUH2uADY=; b=q67J9VOnzkTxv5
	qfy6LHj+aOlyX2N+Mq+COoYuvXmwvcB+mEGaB36teF+8yiS6EcDnkuZ4zlEIGLPLWDW+ckyERhAAc
	C0GMaO8jr61fQoiJCvqv2w3oNlo/L3fBy5vdajUFXvtFOYzhXwasQYtwJ+ryOqREmb6D+lhKHODOc
	Vh0HrrOg6dBCc9LkObgLVyi3RlE6S7ADRrzMrxLprdTnesaC4tSPF2qGOfcbsEgpRDsXYi/yDvyRY
	QLv2aQC03lX0o/4T0tncSy85Fho4Ktjtcu9DWkrbsB9J8yqleRAaqCyegjHMwBx+EZAWT0G+AbwNW
	oceXZiZ9R5oectNjOYOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGLC-00000004IoC-45yx;
	Tue, 20 Jan 2026 18:20:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGL9-00000004Inq-0aW3
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 18:20:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 645D2441FD
	for <linux-mtd@lists.infradead.org>; Tue, 20 Jan 2026 18:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C77CC2BCB6
	for <linux-mtd@lists.infradead.org>; Tue, 20 Jan 2026 18:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768933230;
	bh=8iO9X24WNf+b/ZqILypVRhAtLKW2GNEsE317PhISvII=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OqG2B3WU+Z4fD0gfU8cJI6c/Z52wM0jvStPnU76E2b2gx+LA4c9y9EiBIp91puWNr
	 H59O8NLGNSoydAPEnj+D7QCWNK3BTjxBssD/OGJnNjqeKNyFbBJuKTiRQkrLG0BP+s
	 GLjjYIScfmz+fzUAgZFrTJqKYwou4K3cvv537LlOSvpcAw9gUFVKC1Q+iImxI4CB0j
	 EpiT/xTNVFs1tx3/To4RhH2Nr7Ir5JsSepNjp4wAwAePM50X+OltrjyuSM1jgWqGOs
	 2XKJCf25J7N4VjOyjuoP1RJ8eCxNJrzT195CD6ora7w0XdBQYXO14bOeWq5sJC2kDW
	 EQVDakJM837iA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b86f81d8051so16915666b.1
        for <linux-mtd@lists.infradead.org>; Tue, 20 Jan 2026 10:20:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqTYhseLL8cnf2uuDLTigEpZFixWoR/eOIyQLoL1pJQ3vfbLb18CWUcmQVw+YqavMCij8rZH3/dSI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4ffEnehrCLXFXcXQYHwcbunPJqvhH/5eeWXDKSuavwT3w0AGP
	MsFA4d3hB5T1smV0wYuZy6hEox3uztqdqT3vaTpW2ylsQWeQ4OWnKX6cQ6sGVfOutOLR3Jmjs0g
	tXNvLVNORFTm6Tg4On+8ZQl/LCL17FQ==
X-Received: by 2002:a17:907:971e:b0:b7c:cc8d:14f4 with SMTP id
 a640c23a62f3a-b8777a09915mr1649298166b.4.1768933228493; Tue, 20 Jan 2026
 10:20:28 -0800 (PST)
MIME-Version: 1.0
References: <20260119-dt-mtd-partitions-v2-0-77ebb958a312@kernel.org>
 <20260119-dt-mtd-partitions-v2-10-77ebb958a312@kernel.org> <20260120-origami-lori-of-genius-8fd944@quoll>
In-Reply-To: <20260120-origami-lori-of-genius-8fd944@quoll>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Jan 2026 12:20:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL+pO7fQp7gYe4AvX9G-cOykreU3xTieUw2Q2PAZf4NUQ@mail.gmail.com>
X-Gm-Features: AZwV_QhKFpVtz-Uqzq0wFapMdB8t9l7NvlfaSwcJmbkHLKd8OZ8fsyVii9Phizo
Message-ID: <CAL_JsqL+pO7fQp7gYe4AvX9G-cOykreU3xTieUw2Q2PAZf4NUQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] dt-bindings: mtd: partitions: Combine simple
 partition bindings
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_102031_240157_315E9C6B 
X-CRM114-Status: GOOD (  18.94  )
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

T24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgMzowNOKAr0FNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEphbiAxOSwgMjAyNiBhdCAwNzo0ODoz
MVBNIC0wNjAwLCBSb2IgSGVycmluZyAoQXJtKSB3cm90ZToKPiA+IFNldmVyYWwgcGFydGl0aW9u
IG5vZGUgYmluZGluZ3MgYXJlIGp1c3QgYSBjb21wYXRpYmxlIHBsdXMgcHJvcGVydGllcwo+ID4g
ZGVmaW5lZCBpbiBwYXJ0aXRpb24ueWFtbC4gTW92ZSBhbGwgb2YgdGhlc2UgYmluZGluZ3MgdG8g
YSBzaW5nbGUgc2NoZW1hCj4gPiBmaWxlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJy
aW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiAtICAgICAgICBwYXJ0aXRpb25AMjAwMDAw
IHsKPiA+IC0gICAgICAgICAgICBjb21wYXRpYmxlID0gInRmYS1ibDMxIjsKPiA+IC0gICAgICAg
ICAgICByZWcgPSA8MHgyMDAwMDAgMHgxMDAwMDA+Owo+ID4gLSAgICAgICAgICAgIGFsaWduID0g
PDB4NDAwMD47Cj4gPiAtICAgICAgICB9Owo+ID4gLSAgICB9Owo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9icmNtLGJjbTQ5
MDgtcGFydGl0aW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9wYXJ0aXRpb25zL2JyY20sYmNtNDkwOC1wYXJ0aXRpb25zLnlhbWwKPiA+IGluZGV4IDE1OWIz
MmQxMjgwMy4uYTZlZGYxNDVkZjU3IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2JyY20sYmNtNDkwOC1wYXJ0aXRpb25zLnlh
bWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0
aW9ucy9icmNtLGJjbTQ5MDgtcGFydGl0aW9ucy55YW1sCj4gPiBAQCAtMjksMTEgKzI5LDcgQEAg
cHJvcGVydGllczoKPiA+Cj4gPiAgcGF0dGVyblByb3BlcnRpZXM6Cj4gPiAgICAiXnBhcnRpdGlv
bkBbMC05YS1mXSskIjoKPiA+IC0gICAgJHJlZjogcGFydGl0aW9uLnlhbWwjCj4gPiAtICAgIHBy
b3BlcnRpZXM6Cj4gPiAtICAgICAgY29tcGF0aWJsZToKPiA+IC0gICAgICAgIGNvbnN0OiBicmNt
LGJjbTQ5MDgtZmlybXdhcmUKPiA+IC0gICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+
ID4gKyAgICB0eXBlOiBvYmplY3QKPgo+IEkgdGhpbmsgdGhpcyBpcyBub3Qgc3BlY2lmaWMgZW5v
dWdoIG5vdyBhbmQgeW91IHNob3VsZCBoYXZlIGhlcmUgJHJlZgo+IChlLmcuIHRvIHNpbXBsZS1w
YXJ0aXRpb24ueWFtbCkgd2l0aCB1bmV2YWx1YXRlZFByb3BlcnRpZXMuIE90aGVyd2lzZQo+IHNj
aGVtYSBkb2VzIG5vdCByZXBvcnQ6Cj4gMS4gYm9ndXMgcHJvcGVydGllcyBpbiBwYXJ0aXRpb25A
IG5vZGVzIHdpdGhvdXQgY29tcGF0aWJsZXMgKGxpa2UgdGhlCj4gICAgZmlyc3Qgb25lIGluIHRo
ZSBleGFtcGxlKSwKClllcywgaXQgc2hvdWxkIGJlICIkcmVmOiBwYXJ0aXRpb24ueWFtbCMvJGRl
ZnMvcGFydGl0aW9uLW5vZGUiIHJhdGhlcgp0aGFuIHNpbXBsZS1wYXJ0aXRpb24ueWFtbCBJTU8u
Cgo+IDIuIHBhcnRpdGlvbkAgbm9kZXMgd2l0aCBzb21lIG90aGVyIGNvbXBhdGlibGVzIChub24t
cGFydGl0aW9uIGxpa2UsCj4gICAgZS5nLiB3aGF0ZXZlciBJMkMgZGV2aWNlIHN0dWZmZWQgdGhl
cmUgZm9yIHdoaWNoIHRoZXJlIGlzIGEgc2NoZW1hIG9mCj4gICAgY291cnNlKQoKV2UgZG9uJ3Qg
cmVhbGx5IGVuZm9yY2Ugc29tZXRoaW5nIGxpa2UgdGhhdCBhbnl3aGVyZSBlbHNlIGV4Y2VwdCB3
aGVuCnRoZSBjaGlsZCBub2RlcyBhcmUgZml4ZWQgYW5kIHRoZXJlJ3Mgb25seSAxIHBvc3NpYmxl
IG9wdGlvbi4gSSBkb24ndAp0aGluayB0aGUgc2NoZW1hcyBuZWVkIHRvIGNoZWNrIGZvciBvYnZp
b3VzbHkgbm9uc2Vuc2ljYWwgRFRzLiBXZSBjYW4KcHV0IEkyQyBkZXZpY2Ugb24gc2ltcGxlLWJ1
cyBvciB2ZW5kb3JBIGRldmljZSBpbiB2ZW5kb3JCIFNvQy4gVHJ5aW5nCnRvIGNvbWJpbmUgYWxs
IHBvc3NpYmlsaXRpZXMgaXMgd2hhdCB3YXMgdHJpZWQgaW4gcGFydGl0aW9ucy55YW1sLCBidXQK
dGhhdCBkb2Vzbid0IHJlYWxseSB3b3JrIHdlbGwgd2hlbiB0aGVyZSBhcmUgbXVsdGlwbGUgY29t
YmluYXRpb25zIGFuZApuZXN0aW5nIGlzIHBvc3NpYmxlLiBNYXliZSAiYnJjbSxiY200OTA4LWZp
cm13YXJlIiBpcyB0aGUgb25seSBvbmUKdXNlZCwgYnV0IHRoZXJlJ3Mgbm90IHJlYWxseSBhbnkg
cmVhc29uIG90aGVycyBjYW4ndCBiZSB1c2VkLiBUaGUKb3RoZXIgd2F5IGFyb3VuZCBhbHJlYWR5
IGhhcHBlbmVkLiAiYnJjbSxiY200OTA4LWZpcm13YXJlIiBpcyB1c2VkCnVuZGVyIGEgImZpeGVk
LXBhcnRpdGlvbnMiIG5vZGUgKGluIGJjbTQ5MDYtbmV0Z2Vhci1yODAwMHAuZHRzKSB3aGljaAp3
YXNuJ3QgYWxsb3dlZCBiZWZvcmUgdGhpcyBzZXJpZXMuCgpSb2IKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
