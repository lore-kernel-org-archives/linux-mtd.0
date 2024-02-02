Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2DFC4828F
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Feb 2024 17:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHaU4ZzzYlc9aw1mdXFykl+dC+Dgvr3RYQz/v6BoYF8=; b=U8NIGlLmXZaeOP
	uL90JN8kv98LEGKD2yD+iutAArJD2PDBmoHG3e2st7hQCJPZvS2k5x612HTz+OgJZ2MvXSRQti/L7
	tEYQBjHvrkVneA+4cWVXSTY65i3N4NsOqDsrwH4sVVMEfJ/o3KsASxeRHm7t63L/NAWU1lZbPCYF5
	yEtaQx7muhC2QI40Lx1uT1oCdXgUojvSezjlmP1hOCSfv1bBL459N+3wOv0SpgFhAK58JzUT6uNBg
	lFZAum2xDqT+f+79q/SjHe/uSsCtQ67JNPLf6fDuniK6Dc+LuPGoIahyLazxA0oW1WFIDxNTKhmbC
	0bzBSFIA6DF27keRbidg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxUu-0000000Cdc5-07S1;
	Fri, 02 Feb 2024 17:38:40 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxUq-0000000CdaL-05zX
	for linux-mtd@lists.infradead.org;
	Fri, 02 Feb 2024 17:38:37 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6e12b917df2so1401206a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 02 Feb 2024 09:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706895513; x=1707500313; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=125qZY7mbLGPBHcNyXp+a5vrMM3WFpV/QF8Lkc7h738=;
        b=MtydkvR+T1hH0kq7bbIHoCMvXZlJ/goeNbhClC4v5dTkxTH1jTqEkN259LHPCfnPtj
         IoK1iBEOFBb1OxOxkdhwZnj8IL5FkxT/wy2bq6wSlz+fDYJVADeZ9NMKvA7X42j97P40
         lipWwK6pW+El0ol7vHY1MPJwZW1bUub3S9Ia8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706895513; x=1707500313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=125qZY7mbLGPBHcNyXp+a5vrMM3WFpV/QF8Lkc7h738=;
        b=mUcGu7P6ijnl3WoHMrACyy7lQQd7gN1FeT1VTvTdO72soIG5B63jYQ9gF2Uc2QpGvq
         uIS83o4uFSeDnH6fP0e+eBoNrmvfbSPWdN7puc6SOqSij1VFrA5dOzzh1hkY00oTN3C0
         ZtjxzHJBTQj8O3fyjM/dazj0ucnreBoqSEzhALIZDkC4LrcSkknmwWayqinwmDLcN51O
         iAokptqRmt4urXDQlryt+m39+j62A3SJgREIFsuM88lcPCo8E8FoMmfjckb5cyhr1cdP
         0BeqCIXpFpAyOw1V8+bzjquIfJtmAPgCZO1EzN2sKjsSOCeemuR1D0Zdab6kgZ9Eyw5O
         xQJA==
X-Gm-Message-State: AOJu0YwxhMys2cgWBARRdg8oDw1jOSQs6XQHeG1BCGkXfLg7mwm+hKMM
	AHgqZh+Kh2w83G8Y3Q9zb0684TtvV8qrl9kjU6kgcNMC9/xYn37zzJEygD/5YQTWhtjW0eSs7WI
	GdpZMNIOVOCOCQb8AHP1nOeVmD0mMGOvmSLhd
X-Google-Smtp-Source: AGHT+IFniiMmH77EyZiBHuEXf2cZWEQZFRYaIyi8fG4PrGFygt00mq7TaxqEzdxTBCEidE5sBJMD0NwhS1a+m73QRHo=
X-Received: by 2002:a05:6830:d8:b0:6e1:11be:2221 with SMTP id
 x24-20020a05683000d800b006e111be2221mr8322590oto.3.1706895513159; Fri, 02 Feb
 2024 09:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20240124030458.98408-1-dregan@broadcom.com> <20240124030458.98408-11-dregan@broadcom.com>
 <20240124184027.712b1e47@xps-13> <CAA_RMS42FaiN+Za1iY12o0YUANH9rJarBTBa=9jNn8x6_g-Fng@mail.gmail.com>
 <20240126071913.699c3795@xps-13> <CAA_RMS5gX88v_Qt1csgSL_ffMNsqo2G8B164EB_Hg=hXd620eg@mail.gmail.com>
 <20240129115228.06dc2292@xps-13> <2a3edcf5-7afc-410c-a402-3d8cd3feb1da@broadcom.com>
 <20240130120155.3cb6feed@xps-13> <CAA_RMS577vw=QWN9_NHfmWqt+_cDG22tA01aU019CPNjAgHqJQ@mail.gmail.com>
 <20240130195504.506fb446@xps-13> <bcd9f8a5-7dab-42e6-b860-8a56ebb51cb6@broadcom.com>
 <20240201092558.5499ee6a@xps-13>
In-Reply-To: <20240201092558.5499ee6a@xps-13>
From: David Regan <dregan@broadcom.com>
Date: Fri, 2 Feb 2024 09:38:22 -0800
Message-ID: <CAA_RMS4V=RBzQCxSDbKgqNbnZz+ca-XThyoowMHuFga3jRyUSw@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] mtd: rawnand: brcmnand: allow for on-die ecc
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: William Zhang <william.zhang@broadcom.com>, David Regan <dregan@broadcom.com>, dregan@mail.com, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	computersforpeace@gmail.com, kdasu.kdev@gmail.com, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joel Peshkin <joel.peshkin@broadcom.com>, 
	Tomer Yacoby <tomer.yacoby@broadcom.com>, Dan Beygelman <dan.beygelman@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, rafal@milecki.pl, 
	bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com, 
	baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_093836_116394_E04EDF14 
X-CRM114-Status: GOOD (  44.02  )
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

SGkgTWlxdcOobCwKCk9uIFRodSwgRmViIDEsIDIwMjQgYXQgMTI6MjbigK9BTSBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIFdpbGxpYW0sCj4K
PiA+ID4+Pj4+Pj4+IFRoaXMgaXMgYSBkb3VibGUgY2hlY2sgdG8gdHVybiBvbi9vZmYgb3VyIGhh
cmR3YXJlIEVDQy4KPiA+ID4+Pj4+Pj4KPiA+ID4+Pj4+Pj4gSSBleHBlY3QgdGhlIGVuZ2luZSB0
byBiZSBhbHdheXMgZGlzYWJsZWQuIEVuYWJsZSBpdCBvbmx5IHdoZW4geW91Cj4gPiA+Pj4+Pj4+
IG5lZWQgKG1heSByZXF1aXJlIGFuIGFkZGl0aW9uYWwgcGF0Y2ggYmVmb3JlIHRoaXMgb25lKS4K
PiA+ID4+Pj4+Pgo+ID4gPj4+Pj4+IFdlIGFyZSBhbHJlYWR5IHR1cm5pbmcgb24gdGhlIEVDQyBl
bmFibGUgYXQgdGhpcyBwb2ludCwKPiA+ID4+Pj4+PiB0aGlzIGlzIGp1c3QgYWRkaW5nIHRoZSBv
cHRpb24gdG8gdHVybiBpdCBvZmYgaWYgdGhlIE5BTkQgY2hpcAo+ID4gPj4+Pj4+IGl0c2VsZiB3
aWxsIGJlIGRvaW5nIHRoZSBFQ0MgaW5zdGVhZCBvZiBvdXIgY29udHJvbGxlci4KPiA+ID4+Pj4+
Cj4gPiA+Pj4+PiBTb3JyeSBpZiBJIGhhdmUgbm90IGJlZW4gY2xlYXIuCj4gPiA+Pj4+Pgo+ID4g
Pj4+Pj4gVGhpcyBzZXF1ZW5jZToKPiA+ID4+Pj4+IC0gaW5pdAo+ID4gPj4+Pj4gLSBlbmFibGUg
aHcgRUNDIGVuZ2luZQo+ID4gPj4+Pj4gSXMgYnJva2VuLgo+ID4gPj4+Pj4gICA+Pj4+IEVDQyBl
bmdpbmUgaXMgbm90IGVuYWJsZWQgZm9yIGFsbCB0aGUgY2FzZXMuIEhlcmUgd2Ugb25seSBpbnRl
bmRlZCB0byBlbmFibGUgaXQgZm9yIHRoZSBuYW5kIGNoaXAgdGhhdCBpcyBzZXQgdG8gdXNlIE5B
TkRfRUNDX0VOR0lORV9UWVBFX09OX0hPU1QuIFRoZSBsb2dpYyBoZXJlIHNob3VsZCBiZXR0ZXIg
Y2hhbmdlIHRvOgo+ID4gPj4+PiBpZiAoY2hpcC0+ZWNjLmVuZ2luZV90eXBlID09IE5BTkRfRUND
X0VOR0lORV9UWVBFX09OX0hPU1QpCj4gPiA+Pj4+ICAgICAgIGJyY21uYW5kX3NldF9lY2NfZW5h
YmxlZChob3N0LCAxKTsKPiA+ID4+Pj4gZWxzZQo+ID4gPj4+PiAgICAgICBicmNtbmFuZF9zZXRf
ZWNjX2VuYWJsZWQoaG9zdCwgMCk7Cj4gPiA+Pj4+ICAgPj4+Pj4gSXQgKmNhbm5vdCogd29yayBh
cyBhbnkgb3BlcmF0aW9uIGdvaW5nIHRocm91Z2ggZXhlY19vcCBub3cgbWF5Cj4gPiA+Pj4+PiBw
ZXJmb3JtIHBhZ2UgcmVhZHMgd2hpY2ggc2hvdWxkIGJlIHVubW9kaWZpZWQgYnkgdGhlIEVDQyBl
bmdpbmUuIFlvdSA+IGRyaXZlciAqbXVzdCogZm9sbG93IHRoZSBmb2xsb3dpbmcgc2VxdWVuY2U6
Cj4gPiA+Pj4+PiAtIGluaXQgYW5kIGRpc2FibGUgKG9yIGtlZXAgZGlzYWJsZWQpIHRoZSBodyBF
Q0MgZW5naW5lCj4gPiA+Pj4+PiAtIHdoZW4geW91IHBlcmZvcm0gYSBwYWdlIG9wZXJhdGlvbiB3
aXRoIGNvcnJlY3Rpb24geW91IG5lZWQgdG8KPiA+ID4+Pj4+ICAgICAgLSBlbmFibGUgdGhlIGVu
Z2luZQo+ID4gPj4+Pj4gICAgICAtIHBlcmZvcm0gdGhlIG9wZXJhdGlvbgo+ID4gPj4+Pj4gICAg
ICAtIGRpc2FibGUgdGhlIGVuZ2luZQo+ID4gPj4+Pj4gTWF5YmUgSSBhbSBtaXNzaW5nIHNvbWV0
aGluZyBoZXJlIGJ1dCBhcmUgeW91IHNheWluZyB0aGUgZXhlY19vcCBjYW4gaGF2ZSBkaWZmZXJl
bnQgZWNjIHR5cGUgZm9yIHBhZ2UgcmVhZC93cml0ZSBhdCBydW4gdGltZSBvbiB0aGUgc2FtZSBu
YW5kIGNoaXA/IEkgZG9uJ3Qgc2VlIHRoZSBvcCBpbnN0ciBzdHJ1Y3R1cmUgaGFzIHRoZSBlY2Mg
dHlwZSBmaWVsZCBhbmQgdGhvdWdodCBpdCBpcyBvbmx5IGJpbmQgdG8gdGhlIG5hbmQgY2hpcCBh
bmQgd29uJ3QgY2hhbmdlIGF0IHJ1biB0aW1lLiBTbyBsb29rcyB0byBtZSB0aGUgaW5pdCB0aW1l
IHNldHRpbmcgdG8gdGhlIGVuZ2luZSBiYXNlZCBvbiBlY2MuZW5naW5lX3R5cGUgc2hvdWxkIGJl
IHN1ZmZpY2llbnQuCj4gPiA+Pj4+Cj4gPiA+Pj4+IFdoYXQgeW91IGRlc2NyaWJlZCBoZXJlIGNh
biB3b3JrIGZvciB0aGUgaHcuZWNjIHJlYWQgcGF0aCAoZWNjLnJlYWRfcGFnZSA9IGJyY21uYW5k
X3JlYWRfcGFnZSkgd2hpY2ggYWx3YXlzIGFzc3VtZXMgZWNjIGlzIGVuYWJsZWQuIEFsdGhvdWdo
IGl0IGlzIHByb2JhYmx5IG5vdCB0b28gYmFkIHdpdGggdGhlc2UgdHdvIGV4dHJhIG9wZXJhdGlv
biwgaXQgd291bGQgYmUgYmV0dGVyIGlmIHdlIGRvbid0IGhhdmUgdG8gYWRkIGFueXRoaW5nIGFz
IG91ciBjdXJyZW50IGNvZGUgZG9lcy4gRm9yIHRoZSBicmNtbmFuZF9yZWFkX3BhZ2VfcmF3LCAg
d2UgY3VycmVudGx5IGRpc2FibGUgdGhlIGVuZ2luZSBhbmQgdGhlbiByZS1lbmFibGUgaXQoYnV0
IHdlIG5lZWQgdG8gZml4IGl0IHRvIG9ubHkgZW5hYmxlIGl0IHdpdGggaHcgZWNjIGVuZ2luZSB0
eXBlKS4gIFNvIGl0IGlzIGp1c3Qgb3Bwb3NpdGUgb2YgeW91IGxvZ2ljIGJ1dCB3b3JrcyB0aGUg
c2FtZSB3aXRoIG5vIGltcGFjdCBvbiB0aGUgbW9zdCBwZXJmb3JtYW5jZSBjcml0aWNhbCBwYXRo
Lgo+ID4gPj4+Cj4gPiA+Pj4gVGhpcyBpcyBub3QgIm15IiBsb2dpYywgdGhpcyBpcyB0aGUgImNv
cmUncyIgbG9naWMuIEkgYW0gc2F5aW5nOiB5b3VyCj4gPiA+Pj4gYXBwcm9hY2ggaXMgYnJva2Vu
IGJlY2F1c2UgdGhhdCBpcyBub3QgaG93IHRoZSBBUEkgaXMgc3VwcG9zZWQgdG8gd29yaywKPiA+
ID4+PiBidXQgaXQgbW9zdGx5IHdvcmtzIGluIHRoZSBzdGFuZGFyZCBjYXNlLgo+ID4gPj4KPiA+
ID4+IEluIHRoZSBpbnRlcmVzdCBvZiBtaW5pbWl6aW5nIHJlZ2lzdGVyIHdyaXRlcywgd291bGQg
aXQgYmUgYWNjZXB0YWJsZSB0bwo+ID4gPj4gZW5hYmxlL2Rpc2FibGUgRUNDIGF0IHRoZSBiZWdp
bm5pbmcgb2YgYSBzdGFuZGFyZAo+ID4gPj4gcGF0aCB0cmFuc2ZlciBidXQgbm90LCBhZnRlciB0
aGUgdHJhbnNmZXIsIHR1cm4gb2ZmIHRoZSBFQ0M/IFRoaXMgc2hvdWxkIG5vdAo+ID4gPj4gYWZm
ZWN0IG90aGVyIHN0YW5kYXJkIHBhdGggb3BlcmF0aW9ucyBub3IgYWZmZWN0IHRoZSBleGVjX29w
IHBhdGggYXMgdGhvc2UKPiA+ID4+IGFyZSBsb3cgbGV2ZWwgdHJhbnNmZXJzIHdoaWNoIG91ciBF
Q0MgZW5naW5lIHdvdWxkIG5vdCB0b3VjaCBhbmQgdGhlIE5BTkQKPiA+ID4+IGRldmljZSBkcml2
ZXIgc2hvdWxkIGJlIHJlc3BvbnNpYmxlIGZvciB0dXJuaW5nIG9uL29mZiBpdHMgb3duIEVDQy4K
PiA+ID4KPiA+ID4gRG8geW91IGhhdmUgbGVnaXRpbWF0ZSBjb25jZXJucyBhYm91dCB0aGlzIHJl
Z2lzdGVyIHdyaXRlIHRha2luZyB3YXkKPiA+ID4gbW9yZSB0aW1lIHRoYW4gSSBjb3VsZCBleHBl
Y3Q/IEJlY2F1c2UgY29tcGFyZWQgdG8gdGhlIHRyYW5zZmVyIG9mIGEKPiA+ID4gTkFORCBwYWdl
ICsgdFIvdFBST0cgaXQgc2hvdWxkIG5vdCBiZSBub3RpY2VhYmxlLiBJIGRvbid0IHNlZSBob3cg
eW91Cj4gPiA+IGNvdWxkIGV2ZW4gbWVhc3VyZSBzdWNoIGltcGFjdCBhY3R1YWxseSwgdW5sZXNz
IHRoZSByZWdpc3RlciB3cml0ZSBkb2VzCj4gPiA+IHdheSBtb3JlIHRoYW4gdXN1YWwuIEknbSBm
aW5lIHdpdGggdGhlIGFib3ZlIGlkZWEgaWYgeW91IHNob3cgbWUgaXQgaGFzCj4gPiA+IGFuIGlu
dGVyZXN0Lgo+ID4gPgo+ID4gRGF2ZSBkaWQgdGhlIG10ZF9zcGVlZCB0ZXN0IGFuZCB3ZSBjYW4g
c2VlIHdlIGdldCBjb25zaXN0ZW50bHkgfjM1S0IvcyBzbG93ZXIgd2l0aCB0aGUgZXh0cmEgZW5h
YmxlIGFuZCBkaXNhYmxlIGVjYyBlbmdpbmUgY2FsbHMgaW4gZWNjIHJlYWQgcGFnZSBwYXRoLgo+
ID4KPiA+IFdpdGggdGhlIGNoYW5nZToKPiA+IFsgICAyOC4xNDgzNTVdIG10ZF9zcGVlZHRlc3Q6
ICAgcGFnZSByZWFkIHNwZWVkIGlzIDk4NTcgS2lCL3MKPiA+IFsgICAzMS43NTQyNThdIG10ZF9z
cGVlZHRlc3Q6IDIgcGFnZSByZWFkIHNwZWVkIGlzIDk4NjUgS2lCL3MKPiA+IFdpdGhvdXQgdGhl
IGNoYW5nZQo+ID4gWyAgIDU2LjQ0NDczNV0gbXRkX3NwZWVkdGVzdDogICBwYWdlIHJlYWQgc3Bl
ZWQgaXMgOTg5MiBLaUIvcwo+ID4gWyAgIDYwLjA0MjI2Ml0gbXRkX3NwZWVkdGVzdDogMiBwYWdl
IHJlYWQgc3BlZWQgaXMgOTg5NyBLaUIvcwo+Cj4gSSBiZWxpZXZlIGlmIHlvdSByZXBlYXQgdGhp
cyAxMCB0aW1lcyB5b3UnbGwgZ2V0IHRvdGFsbHkgZGlmZmVyZW50Cj4gcmVzdWx0cy4gSSBkb24n
dCB0aGluayB0aGlzIHRlc3Qgb24gYSBub24gUlQgbWFjaGluZSBpcyBwcmVjaXNlIGVub3VnaAo+
IHNvIHRoYXQgYSB1bmlxdWUgMzVraUIgZGlmZmVyZW5jZSBjYW4gYmUgaW50ZXJwcmV0ZWQgYXMg
YmVpbmcKPiBzaWduaWZpY2FudC4KPgo+ID4gQWx0aG91Z2ggaXQgaXMgb25seSBsZXNzIHRoYW4g
MSUgZHJvcCwgaXQgaXMgc3RpbGwgc29tZXRoaW5nLiBJIHVuZGVyc3RhbmQgdGhlIHByb2NlZHVy
ZSB5b3UgbGFpZCBvdXQgYWJvdmUgaXMgdGhlIHByZWZlcnJlZCB3YXkgYnV0IHdpdGggb3VyIGRy
aXZlciBmdWxseSBjb250cm9sIHRoZSBjaGlwIGVjYyByZWFkL3dyaXRlIHBhZ2UsIGVjYyByZWFk
X3Jhdy93cml0ZV9yYXcgcGFnZSBmdW5jdGlvbiBhbmQgZXhlY19vcCBwYXRoLCBJIGRvbid0IHNl
ZSB3aGVyZSBpdCBtYXkgbm90IHdvcmsuCj4KPiBJIGp1c3QgdG9sZCB5b3UsIHRoZSBleGVjX29w
IHBhdGggcnVucyB3aXRoIEVDQyBlbmFibGVkLiBJIGRvbid0IGtub3cKPiBob3cgdGhpcyBjb250
cm9sbGVyIHdvcmtzLiBOb3cgaWYgeW91IGRvbid0IGNhcmUgYW5kIGFyZSAxMDAlIHN1cmUgdGhp
cwo+IGlzIHdvcmtpbmcgYW5kIGZ1dHVyZSBwcm9vZiwganVzdCBrZWVwIGl0IGxpa2UgdGhpcy4K
ClRoYW5rIHlvdSBmb3IgYWxsIHlvdXIgaGVscCwgaXQgYXBwZWFycyB0aGlzIHdpbGwgbmVlZCBm
dXJ0aGVyIHJld29yawphbmQgdGVzdGluZy4gU2luY2UgaXQncyBub3QgY3JpdGljYWwgdG8gdGhp
cyBzZXJpZXMgSSB3aWxsIG1vc3QgbGlrZWx5CnB1bGwgdGhpcyBwYXRjaCBhbmQgdGFrZSBhbGwg
eW91ciBnb29kIGluZm9ybWF0aW9uIHRvIHByZXBhcmUgZm9yCmEgZnV0dXJlIHVwZGF0ZS4KCj4K
PiBDaGVlcnMsCj4gTWlxdcOobAoKVGhhbmtzIQoKLURhdmUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
