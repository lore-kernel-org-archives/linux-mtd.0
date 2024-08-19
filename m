Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE7DC52D7C
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2024 02:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19t7ZHEXqhvvl6Tg0ydgNB9uBdVJmsnb70bS/VfC+SI=; b=cJOF8F6AY0dlVy
	Hq+owrhYya84FKtvSLSKz1OspcG/Yvxdi1wTRznN3kvSmG99It33oR37S9ycBIB57flIg8a0zOVg9
	MHeydekqj+q7ytVZgKaswb0Q26CtaAj7Jh0YY9rD9HmkRd/bDhqtMnjangdxzNMPmPuLO7qguzOny
	fed20AfmAiKESZfvWDlM7iunqcX9Ce9YT1PXJN6H8TN6FJ1b9IT8jpbcYS2qPcakzmUiVq/9NPDVO
	WOnRN6ncZ45jZhXGwQqWq1Hb8/fhVhxmoCYALuLKodVFFUgjiOqW9xgIssDzmO71M0hST8rCF7tGD
	1zK6QeZtCilmqZVCFBdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfsUr-00000000A6m-0lXr;
	Mon, 19 Aug 2024 02:51:53 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfsUm-00000000A4U-2yb0
	for linux-mtd@lists.infradead.org;
	Mon, 19 Aug 2024 02:51:50 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3717de33d58so2414659f8f.1
        for <linux-mtd@lists.infradead.org>; Sun, 18 Aug 2024 19:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724035906; x=1724640706; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOAky0YuVIdmBSLAN1+x9Uot0I0GbwCG6AuRV+YGhic=;
        b=kQaawgNVSSTzOxJ8YfjyYQxrVKglgr5brInoJwPfO3XL6XJu1ulRFXT2rj6jXDEf3t
         nEZTTBwU5wz96ORTQqioXC89Fw6Uhc/2vOB2fvg9q7Op3KSHuXobpZiMvvAzAw/AeTnE
         ww16x920uHXEObtRHQC3kyLekO4Dj2Mh87CrZFrg6ZLN8WxhUBQ8PWKtmwaYm2NvjYRj
         el+VaOcne8aEK3Uw/4wyNIUH0N6vI5CUiGgBNTtQBM/cKSbjk0E91+ypZVSJMM5uR8DI
         pNL58wCxxF1ahWtJfdOM3AC8wU0ZMdSVk4ZmjF0W+7d2EzwgpwTRigamv79QmkyLmaa7
         rTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724035906; x=1724640706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOAky0YuVIdmBSLAN1+x9Uot0I0GbwCG6AuRV+YGhic=;
        b=ByN15CN3YMl56Kn7bH87oryhvR9AQReczUIlNPsp3j9jVdorhurQe7P3+vIUgyHUdG
         LucOP7AkN3x3qCXCkn17fIrEB88j5DN5sQla0RRgTbUWQ73VVespY0Oo07cmxbBjmeRX
         E8tSkcihVdzxvFNjKlvI1wggBELcY4UJQ7WhAI3cvcaNCZPOF49rLsCfGgICzSHNRViG
         AUECy1ErqwohPDl8tygZZswtFHvkuOfsbbCuNstHD4w/p2swZBZ9uw0D+xRsRFELCm4t
         whu9kz3D2bOdD/VdR/viawvrbpv5nIdsSxZv/UtzyLXhE3/k2eRGvzrKREl0C3kX3CTd
         Mc+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbudgk0Ca9VhB/AyCcTHqFuyshfyyiZM5EF6msH/4xip9F0BXkiQwx8fO3QKLHcjoWudy3KJNO9TsTiBtcSr6GSgOmhLoFUcusH7ccZQ==
X-Gm-Message-State: AOJu0YyY233Sr0gyY4UKHRhQVSmkMeN4Bo2pUcqIfRs3m/vjhubaPQdJ
	L1M6A62DvU+kPq8lcWnvB4JwVyaKoQVPCeOzNvs8pDpXY4/P4DXabOu64kPp3TZl/xRFFUbWQF6
	MKLJ7q8abtuptddcpmqdEnBG33n6jEvJ57Oc=
X-Google-Smtp-Source: AGHT+IH619dt1C/HugVRab8KXzPRU/jfFMZu/ooXKNJwmcmoQBV7Gqj1VMZBI8HGX8T1g7AECYwMYGRs0fV589TfrJA=
X-Received: by 2002:a05:6000:186:b0:367:8ff0:e022 with SMTP id
 ffacd0b85a97d-371946b0ddcmr5515014f8f.63.1724035905695; Sun, 18 Aug 2024
 19:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
 <20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com> <20240808-backyard-unglue-3cf429ad8da5@spud>
 <CAJhJPsVOTAj9ePzeHkwDX049FKd=9Rs_NjQE2qwQL76GKSC66Q@mail.gmail.com>
 <20240809-smuggler-patrol-067003f0ba9b@spud> <20240814091231.1d9525be@xps-13>
In-Reply-To: <20240814091231.1d9525be@xps-13>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Mon, 19 Aug 2024 10:51:09 +0800
Message-ID: <CAJhJPsWBKNZmDQreigABVxLqUg_F+BGT7dUnO9C09pNDovbxMQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Conor Dooley <conor@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_195148_767776_5E263793 
X-CRM114-Status: GOOD (  25.12  )
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

T24gV2VkLCBBdWcgMTQsIDIwMjQgYXQgMzoxMuKAr1BNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiA+ID4gPiBXaGVuIEkgZmlyc3Qg
cmVhZCAibmZjIiBoZXJlIEkgdGhvdWdodCBpdCB3YXMgYSBjb3B5LXBhc3RlIG1pc3Rha2UsIGFz
Cj4gPiA+ID4gIm5mYyIgaXMgYSB0ZWNobm9sb2d5IG9mIGl0J3Mgb3duLiBJIHRoaW5rIGl0IHdv
dWxkIG1ha2Ugc2Vuc2UgdG8gcmVuYW1lCj4gPiA+ID4gdG8gImxvb25nc29uLGxzMWItbmFuZC1j
b250cm9sbGVyIiBldGMgdG8gcmVtb3ZlIHRoYXQgc29ydCBvZiBjb25mdXNpb24uCj4gPiA+ID4g
VGhlc2UgZGV2aWNlcyBtaWdodCBub3QgaW1wbGVtZW50IE5GQywgYnV0IHdoYXQncyB0byBzYXkg
dGhhdCBhIGZ1dHVyZQo+ID4gPiA+IGRldmljZSB3aWxsIG5vdD8KPgo+IEkgYmVsaWV2ZSB0aGUg
bmZjIChhbHNvLCBuYykgYWJicmV2aWF0aW9uIHByZS1kYXRlcyB0aGUgTkZDIHNwZWMuIEJ1dCBJ
Cj4gYWdyZWUsIGl0IG1heSBiZSBtaXNsZWFkaW5nLiBFdmVuIHRob3VnaCBJIGRvbid0IGZvcmVz
ZWUgYW55IE5BTkQKPiBjb250cm9sbGVyIHdpdGggTkZDIGNvbWluZywgaXQncyBwcm9iYWJseSBi
YWQgZm9yIG5ld2NvbWVycy9wZW9wbGUgd2hvCj4gYXJlIG5vdCBhbHJlYWR5IGRlZXBseSBpbnRv
IHRoZSBtdGQgZGV0YWlscyB0byB1c2UgdGhlc2UgY29uZnVzaW5nCj4gbGV0dGVycywgZXNwZWNp
YWxseSBpbiBhIGJpbmRpbmcuCj4KPiBTbywgQWNrLgo+Cj4gPiA+IFNvcnJ5IGZvciB0aGUgY29u
ZnVzaW9uLgo+ID4gPiBUaGUgc3RyaW5nICJsb29uZ3NvbixsczFiLW5hbmQtY29udHJvbGxlciIg
bWlnaHQgYmUgdG9vIGxvbmcuCj4gPgo+ID4gSXQgIm1pZ2h0Ij8gV2h5IGRvIHlvdSB0aGluayBp
dCBpcyB0b28gbG9uZz8KPgo+IFllYWgsIHdoeSB3b3VsZCBpdCBiZSB0b28gbG9uZz8gTGV0J3Mg
Y2FsbCBhIGNhdCBhIGNhdC4gVGhpcyBpcyBhCj4gY29tcGF0aWJsZSBmb3IgYSBOQU5EIGNvbnRy
b2xsZXIuIFNvIEkgZXhwZWN0IHRoZSBzdHJpbmcgdG8gbWVudGlvbgo+IGl0J3MgYSBOQU5EIGNv
bnRyb2xsZXIgYmVjYXVzZSBpdCdzIGNsZWFyZXIuIEZvciBxdWl0ZSBzb21lIHRpbWUgdGhlcmUK
PiBoYXMgYmVlbiBhIGNvbmZ1c2lvbiBiZXR3ZWVuIHRoZSBOQU5EIGNvbnRyb2xsZXIgYW5kIHRo
ZSBOQU5ECj4gZmxhc2gvY2hpcCwgYnV0IHRoZXNlIGFyZSB0d28gZGlmZmVyZW50IGhhcmR3YXJl
IGNvbXBvbmVudHMuCj4KPiA+ID4gTWF5IEkgcmVuYW1lIGl0IHRvICJsb29uZ3NvbixsczFiLW5h
bmQiPwo+Cj4gRm9yIHRoZSBhYm92ZSByZWFzb24sIG5vIDopCgpXaWxsIGNoYW5nZSBpdCB0byAi
bG9vbmdzb24sbHMxYi1uYW5kLWNvbnRyb2xsZXIiIGFuZCByZW5hbWUgdGhlCmZpbGVuYW1lIGFj
Y29yZGluZ2x5LgpUaGFua3MhCj4KPiBUaGFua3MsCj4gTWlxdcOobAoKCgotLSAKQmVzdCByZWdh
cmRzLAoKS2VndWFuZyBaaGFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
