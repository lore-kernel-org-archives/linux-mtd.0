Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2A3CC6B3A
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 15:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9eHVXtAesFPVBBZb++8yYqAC+6gYs6pn0aGta/HBRY=; b=bYUs4m5Y1tfTZ+
	8TWNP5Yijgaz4O/lYO7gDucs9M1NvA7YY4QKc8J6SnfLhzHtm26OpDOap8sbGj1Ogseq/sHhBvWuZ
	w9W7Si80Jfxxf8e0YXPZM/4MUcpLabJSm2vDEItyGjs8cbfsu3fbDBL6u4u+KpLh4KecbBz3mPw5J
	oSCK0LWs8YbrdolBFW6eZlyXWAH9l2BQfG5uCpdCaqVbx25X7qY/tO3QvxLpL2GeaC9mQ5m0q9DCf
	Ktc8QpxpH/M5Ohax3FQAFAN2qic1jsUibjQpZcoQAvzVYbTprhoviy28cyVpCdbpXxXJUcAQWgnug
	V2aygzRwIWyqa7cVs8Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHN5E-00000000WV7-0w6d;
	Thu, 15 Oct 2026 15:09:28 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHN59-00000000WSw-0PdW
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 15:09:26 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-7c54da3be61so31943137.3
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 08:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792076962; cv=none;
        d=google.com; s=arc-20260327;
        b=RDeB2dMmEBG3PUsS7PzCkBX1hodB7S/4pIBZ9D52KSOoSwMaCyShJrgAKbzv4Rp6cj
         fAd87VmGDKba8vOQIidUe+ONt7iY0wt6uSQCbCbx8xHsD7gVfMJbdW3yyRoctQ2RaVD/
         nYBS7rVNcROpGVOjwpIjeU4awK2ocL6CFKhENAb7hIu+SaXL4n4w/62tC3S79hroS7Jr
         yW0bLtOKN/gYwl4vJETPeKNYJkM+GJTea3g8+B6hk587dPn2YgmgETVwEZjwYUFxdnTy
         xo+WSI3VO73t3K8+kb1Rt+6klRSbTF26VPXOlXrOsD2mI4EojNljESObbFn8dOqTjsng
         abHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g+la5oRry/ejNEDlylEClTFnvYZE1MGV2kYV0bWmL7E=;
        fh=TuwS7dybFq+msxmqD15cGcnenwAlVwG05fZuroh2BQo=;
        b=iNOWgzIPXSm/lRfPDoD1ZBST4MZ22LvNqUl0WowkbLeSpzNeth0c3mWPUf1Qt765Nn
         IApu/YyiCEelIlBe4MBvwFCFBcTSvXYtXGUeoeeKd2IdFgfRt/xaOLEkcbiX8JkQjVG2
         Wk0LYyyrso0i/yKjfxH1SdduYUwYlgrJdDZt5uhALMFGO93xE2ZhAcSSo0jMR4nnJr5/
         xdsh/V91PPNWGA+1VTURue2yaTcaiBmh35zDBJq7G9nmKhldmyAry2PVIDauiUZpPQ0W
         4pZ88TRn9oCPM0BjKgh5KqmHghR3MTYlpWAqWyUt9CsS7oJXhmrpoyw7q1ABuByZs2jt
         htLA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792076962; x=1792681762; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g+la5oRry/ejNEDlylEClTFnvYZE1MGV2kYV0bWmL7E=;
        b=fRmX2i7+Fy1JcIEWBDvXaNJMocYdaY9QZ/hHVe1Cr9dlFm97OwBgIGBn8rxQhyfz1k
         k9SWu1AzNMrd2EsXUa69lUKIUe0SDAHyVLHh5vV3d0BPIXKJaX19cm7kXMLmvxOqUi9D
         sBJmBtgtQHkybo/LWBaLkzW5BTN7yYGuE9+drBJwx6SJwz2Eoh1OCNlTrWQMkfEovqyn
         QsdaFBxk7fO2SAEL83Lnv0VzkIPZ6z6nKtedpueDsB+PQ0jrUhJMOH6dKahak7Ibnatx
         u17KjZDblHuEnOxtQsFeFpqXTAM6KSNgt+N1uZyYYUuoA/zwRFl7KIE+m2WtwNLKBptr
         6y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076962; x=1792681762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+la5oRry/ejNEDlylEClTFnvYZE1MGV2kYV0bWmL7E=;
        b=KY7a7YL0UJAfeEee+ohE111Rufh8dfeAnKh/nwQG+FoZZLUFa8ooBrHccuMHWzNwxX
         kgrJBWort2jCZDoD4RHitufdbADZYOT0s3xJb/udxDLcyDDJIgq7pJw5Y4WvlqSrTyPJ
         vlUKj+GPZ2TZuZ+KZLD8nBEdwnu5rwGOfnhLvjOl6lQwQQri80pbSAnDEk7P9IUdfKJn
         35fM+hf6fMVTItEXSOHZ7SL3DyKfrWYGktELvWFbfh2MHIvQA6J0MtOzfKMSjgyDmOzr
         9Ttn7CDrGTbfLuhhIFZIL1NL3nMHZ4xOwe1AyzIM4sXLKUJx0DTmORQvcjZL7I+IYh0I
         D4Yw==
X-Forwarded-Encrypted: i=1; AKwUvBzXWSc3Katq0+ATYv5KCB1tMZzVoj9hEFj3nwrihPgZU7eseCXntSERcVQdbmeNuwf2x+JAAkyF7zc=@lists.infradead.org
X-Gm-Message-State: AFq9FYLl/tzL+7TQjM3XWuQj7iHWLRkA+yAFJYtDbPGNK6O1wazKMQJE
	gsTr4u0/5QsY8UGvGX3fmK/NBjoLzptNk9iXB5VYk15Z0c7tCws2e03MvaBpPeoBNlEYtY5Kakq
	ONHQs8sQnmrk3DdJUm5T5vk0JFAsb+t8=
X-Gm-Gg: AYBFou0lFg1/Yh6UQstifSiVzKZrhgRBDNJDA6zJP+6rkiTaEYa7NDCUq3Mn55u0Cf2
	iICFiYDuyxyy0owqgDAImHTLSe9waGX6uRWH1NgSvAyujKAPG92qkfxMh9TOFE6ccl+kQW9H/FC
	3hoQ+IRyCBvFHddMHGf/3F6/4rbqSB6ryOnKKNW3vBXjCpLm1gmXMko+I3YvJQwoBRTUAx3pzLq
	CQXDnkbYPq2XvP6MOR2OWLEi/W6IKtTFQbThBaxzfLM524Xwr0uFeLxJzDs5CYuIxbE/EJJV3rd
	b8JgTfPOXqcsxLvi3FPV0oIA9wNFc3693c9Y/KM+VcpeNE41JYDW1Kjs9vGJjvf3fCwGX97zO+Q
	a4sqVCOmC4TK9X5ieNQlQA8flg7ffeqBCST6aCpO9Frf9e2KLHsppYnxOgo2b3U9fHdKd6EnoO5
	AVxrlIFZzapLbIMhfKYeHf/5G3E+cYZobr1AsQ+XaeaZSZ
X-Received: by 2002:a67:e713:0:b0:7b4:bdf5:9307 with SMTP id
 ada2fe7eead31-7cb3a17c668mr4997492137.30.1792076961441; Thu, 15 Oct 2026
 08:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
 <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-4-5d3fc6ad2da1@gmail.com> <20261015071943.7OihPadq@linutronix.de>
In-Reply-To: <20261015071943.7OihPadq@linutronix.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 09:09:08 -0600
X-Gm-Features: AclHuK-qAIJ8Ws5pW7BZAdTu8Nckn4yY6BNzqqth23CDA7sDTjbDwYfiY-Jvt6s
Message-ID: <CADvTj4q9cqLY5fB=u+ZdS4K18V3T-AuQ=_6aMNOgcMyXC8yYeg@mail.gmail.com>
Subject: Re: [PATCH v7 04/16] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_080923_541431_FB95249F 
X-CRM114-Status: GOOD (  22.09  )
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

T24gVGh1LCBPY3QgMTUsIDIwMjYgYXQgMToxOeKAr0FNIFNlYmFzdGlhbiBBbmRyemVqIFNpZXdp
b3IKPGJpZ2Vhc3lAbGludXRyb25peC5kZT4gd3JvdGU6Cj4KPiBPbiAyMDI2LTEwLTE0IDE5OjMz
OjUxIFstMDYwMF0sIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+ID4gLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvc3VueGlfbmFuZC5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54
aV9uYW5kLmMKPiA+IEBAIC00NTQsMTYgKzQ1NywxOSBAQCBzdGF0aWMgaW50IHN1bnhpX25mY193
YWl0X2V2ZW50cyhzdHJ1Y3Qgc3VueGlfbmZjICpuZmMsIHUzMiBldmVudHMsCj4gPiAgICAgICAg
ICAgICAgIHRpbWVvdXRfbXMgPSBORkNfREVGQVVMVF9USU1FT1VUX01TOwo+ID4KPiA+ICAgICAg
IGlmICghdXNlX3BvbGxpbmcpIHsKPiA+IC0gICAgICAgICAgICAgaW5pdF9jb21wbGV0aW9uKCZu
ZmMtPmNvbXBsZXRlKTsKPiA+ICsgICAgICAgICAgICAgcmVpbml0X2NvbXBsZXRpb24oJm5mYy0+
Y29tcGxldGUpOwo+ID4KPiA+ICAgICAgICAgICAgICAgd3JpdGVsKGV2ZW50cywgbmZjLT5yZWdz
ICsgTkZDX1JFR19JTlQpOwo+ID4KPiA+ICAgICAgICAgICAgICAgcmV0ID0gd2FpdF9mb3JfY29t
cGxldGlvbl90aW1lb3V0KCZuZmMtPmNvbXBsZXRlLAo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG1zZWNzX3RvX2ppZmZpZXModGltZW91dF9tcykpOwo+
ID4gLSAgICAgICAgICAgICBpZiAoIXJldCkKPiA+ICsgICAgICAgICAgICAgaWYgKCFyZXQpIHsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAvKiBEcmFpbiB0aGUgaGFuZGxlciBiZWZvcmUgaXQg
Y2FuIHJlc3RvcmUgYW4gb2xkIElSUSBtYXNrLiAqLwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IGRpc2FibGVfaXJxKG5mYy0+aXJxKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAt
RVRJTUVET1VUOwo+ID4gLSAgICAgICAgICAgICBlbHNlCj4gPiArICAgICAgICAgICAgIH0gZWxz
ZSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gMDsKPiA+ICsgICAgICAgICAgICAg
fQo+ID4KPiA+ICAgICAgICAgICAgICAgd3JpdGVsKDAsIG5mYy0+cmVncyArIE5GQ19SRUdfSU5U
KTsKPiA+ICAgICAgIH0gZWxzZSB7Cj4gPiBAQCAtNDc2LDYgKzQ4MiwxMiBAQCBzdGF0aWMgaW50
IHN1bnhpX25mY193YWl0X2V2ZW50cyhzdHJ1Y3Qgc3VueGlfbmZjICpuZmMsIHUzMiBldmVudHMs
Cj4gPgo+ID4gICAgICAgd3JpdGVsKGV2ZW50cyAmIE5GQ19JTlRfTUFTSywgbmZjLT5yZWdzICsg
TkZDX1JFR19TVCk7Cj4gPgo+ID4gKyAgICAgaWYgKCF1c2VfcG9sbGluZyAmJiByZXQpIHsKPiA+
ICsgICAgICAgICAgICAgLyogRmx1c2ggdGhlIG1hc2sgYW5kIGFja25vd2xlZGdtZW50IGJlZm9y
ZSByZS1lbmFibGluZyB0aGUgSVJRLiAqLwo+ID4gKyAgICAgICAgICAgICByZWFkbChuZmMtPnJl
Z3MgKyBORkNfUkVHX0lOVCk7Cj4gPiArICAgICAgICAgICAgIGVuYWJsZV9pcnEobmZjLT5pcnEp
Owo+Cj4gU2hvdWxkbid0IHlvdSByZS1yZWFkIE5GQ19SRUdfU1QsIGNoZWNraW5nIGlmIHRoZSBl
dmVudCBiZWNhbWUgdHJ1ZSBldmVuCj4gaW4gdGhlIGNhc2Ugb2YgYSB0aW1lb3V0Pwo+IFNheSB0
aGUgaW50ZXJydXB0IHdha2UgdGhlIHRocmVhZCBidXQgdGhlIHRocmVhZCBuZXZlciBoYWQgYSBj
aGFuY2UKPiB0byBydW4uIFRoZSB0aW1lciAob24gYW5vdGhlciBDUFUpIGhhZCBhIGNoYW5jZSB0
byBydW4gYW5kIGRpZCB3YWtlIHRoaXMKPiB0aHJlYWQuIENoZWNraW5nIHRoZSBldmVudCBpbiB0
aGUgdGltZW91dCBjYXNlIHdvdWxkIGhlbHAgdG8gcHJldmVudAo+IHRoYXQuCgpZZXMuIEkndmUg
Zm9sZGVkIGEgcmVjaGVjayBpbnRvIHRoZSBJUlEgZml4IGZvciB2OCwgYWZ0ZXIgZHJhaW5pbmcg
dGhlCmhhbmRsZXIgYnV0IGJlZm9yZSBtYXNraW5nIGFuZCBhY2tub3dsZWRnaW5nIHRoZSBjb250
cm9sbGVyIGV2ZW50cy4KCk9uZSBkZXRhaWwgaXMgdGhhdCB0aGUgaGFuZGxlciBhY2tub3dsZWRn
ZXMgZWFjaCBldmVudCBhbmQgcmVtb3ZlcyBpdApmcm9tIE5GQ19SRUdfSU5ULiBGb3IgdHJhbnNm
ZXJzIHdhaXRpbmcgZm9yIGJvdGggY29tbWFuZCBhbmQgRE1BCmNvbXBsZXRpb24sIG9uZSBldmVu
dCBtYXkgdGhlcmVmb3JlIGhhdmUgYmVlbiBjb25zdW1lZCBhbHJlYWR5LgpDaGVja2luZyBzdGF0
dXMgYWdhaW5zdCB0aGUgb3JpZ2luYWwgZXZlbnQgbWFzayB3b3VsZCBtaXNzIHRoYXQgY2FzZS4K
ClRoZSB0aW1lb3V0IHBhdGggbm93IGNoZWNrcyBvbmx5IHRoZSByZW1haW5pbmcgZW5hYmxlZCBl
dmVudHM6CgogICAgICBpZiAoIXJldCkgewogICAgICAgICAgICAgIHUzMiBwZW5kaW5nLCBzdGF0
dXM7CgogICAgICAgICAgICAgIGRpc2FibGVfaXJxKG5mYy0+aXJxKTsKICAgICAgICAgICAgICBp
cnFfZGlzYWJsZWQgPSB0cnVlOwoKICAgICAgICAgICAgICBwZW5kaW5nID0gcmVhZGwobmZjLT5y
ZWdzICsgTkZDX1JFR19JTlQpICYgZXZlbnRzOwogICAgICAgICAgICAgIHN0YXR1cyA9IHJlYWRs
KG5mYy0+cmVncyArIE5GQ19SRUdfU1QpOwogICAgICAgICAgICAgIHJldCA9IChzdGF0dXMgJiBw
ZW5kaW5nKSA9PSBwZW5kaW5nID8gMCA6IC1FVElNRURPVVQ7CiAgICAgIH0gZWxzZSB7CiAgICAg
ICAgICAgICAgcmV0ID0gMDsKICAgICAgfQoKQW4gZW1wdHkgcmVtYWluaW5nIG1hc2sgYWxzbyBj
b3VudHMgYXMgc3VjY2VzczogaXQgbWVhbnMgdGhlIGhhbmRsZXIKcHJvY2Vzc2VkIGFsbCByZXF1
ZXN0ZWQgZXZlbnRzIHdoaWxlIHRoZSB0aW1lb3V0IHBhdGggd2FzIGRyYWluaW5nIGl0LgoKaXJx
X2Rpc2FibGVkIGlzIGluaXRpYWxpemVkIHRvIGZhbHNlIGF0IGZ1bmN0aW9uIGVudHJ5LiBBZnRl
ciBtYXNraW5nCmFuZCBhY2tub3dsZWRnaW5nIHRoZSBldmVudHMsIGNsZWFudXAgdXNlcyB0aGF0
IGZsYWcgcmF0aGVyIHRoYW4gcmV0OgoKICAgICAgaWYgKGlycV9kaXNhYmxlZCkgewogICAgICAg
ICAgICAgIHJlYWRsKG5mYy0+cmVncyArIE5GQ19SRUdfSU5UKTsKICAgICAgICAgICAgICBlbmFi
bGVfaXJxKG5mYy0+aXJxKTsKICAgICAgfQoKVGhhdCBwcmVzZXJ2ZXMgdGhlIHdyaXRlIGZsdXNo
IGFuZCBlbnN1cmVzIHRoZSBJUlEgaXMgcmUtZW5hYmxlZCBldmVuCndoZW4gdGhlIHJlY2hlY2sg
Y2hhbmdlcyB0aGUgdGltZW91dCByZXN1bHQgdG8gc3VjY2Vzcy4gU3VjY2Vzc2Z1bAp3YWl0cyBh
bmQgcG9sbGluZyBhcmUgb3RoZXJ3aXNlIHVuY2hhbmdlZC4KCj4KPiA+ICsgICAgIH0KPiA+ICsK
PiA+ICAgICAgIGlmIChyZXQpCj4gPiAgICAgICAgICAgICAgIGRldl9lcnIobmZjLT5kZXYsICJ3
YWl0IGludGVycnVwdCB0aW1lZG91dFxuIik7Cj4gPgo+Cj4gU2ViYXN0aWFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
