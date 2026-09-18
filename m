Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C632AC982DA
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2026 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ephh4pFNbo86A7cQB2ToI0p7pZo8TiFl6IOBrcqiHFE=; b=zWCcGB9Ka8AMRk
	WGj36Q/popK2BxCBKfIn1ByoKQjJK1A/lGiQAEs5iWOhArcSbqyTXxpTFk1JWiqaMACmf8z5SZYGn
	/gnKiM52bv+UV/Ba2l07ZJxpmFiBB6SZIWVbO91J+c92otUbjb2v29k6a8buHCzqhOSdVn4MwjU/q
	7iAL1BHneXnPJkpd9IWGZH818GcnPovVwJP7lhILkXTZ8EzmG/6dp0y08L5Rz6uz9XJy+FbXQSHkI
	FknvtNG8IML7NF3vTMcw0nFFxj3w4mY+f7JPYb78AplZ0ssxOoL7YCJei/xihUV/XnM2Gm/np6SMB
	tvOvmvehs0IJcaR5lh8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aWf-0000000Et1y-2HsM;
	Fri, 18 Sep 2026 15:29:21 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aWc-0000000Et1M-1tVn
	for linux-mtd@lists.infradead.org;
	Fri, 18 Sep 2026 15:29:19 +0000
Received: by mail-yx2-x11.google.com with SMTP id 956f58d0204a3-66d20c35ffcso148746d50.3
        for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2026 08:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789745357; cv=none;
        d=google.com; s=arc-20260327;
        b=LAkOgGTlxb9GejJaUaZdOZ/yTcrLIwN158IHOzS0+UwziQU7uxFgh57ujtg42IdWZD
         Wz4zjrNFUV2fn1GZNq6Z1LPdGI4twarDis9BQR0ars03aUZkI8RFljBoUpPthNrq8tSq
         rBwC/Mt55XfnTkUbbf3+r0xwQX0v5ap9ve8TnIwaboNr0seHxK1gLeJ8ukOuKAWKcJMo
         /oMDirOvLtv9JFB0feRHVtE1bsMYf0ovFYUIx/Dofasvz0dkb2XHlzIgpzOWaWV9ZXX5
         ys/nTQpT3/a9xKsCLvfGs5vC2lnbksGlx+cYN+dQfbVC5zrn3XSSKFw9NQjRMkX+RwMt
         fm0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8XqNRBXt/qlgUXB2hfT5CeqtG8EouGcWeggFZCzuyw8=;
        fh=DnLiAYPTkJr+uLBbUjZUcVn3nVLQmiB4NkyM2gZ5KME=;
        b=cGeQYOWtDXXNE+wNYRoCNT4sDEYPI+EizUJFO2DW51r7ne29C0YzAVY2Ye578Xn3/A
         /mAzgXqE42F6Pnl4LslW2yTk77zo/bog0jOrYOhIaUZp1Wno6KJ8P9PbIDT+GekHe+iZ
         xEYF9n8O1NoxRAakNfekZnCbBQyh7nQqaGBik/132ymLysuegYM1KjXA+y1rymMFpkeN
         UH3NzJ+BBYkHeWWFhCavw+x7mHE6+ch/0ZXXtKpvZNR21BS7dvAf8vDFz/XWX2M294BI
         IL2l2NlfYEuO43wrJuwKA1ybw4TXOLRu0F2pT0djT/VzB7+QkuKLqepRDWSEXRXId694
         m9lA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789745357; x=1790350157; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8XqNRBXt/qlgUXB2hfT5CeqtG8EouGcWeggFZCzuyw8=;
        b=mw2XhpIxu7UbZYlHYlN6G7kl/yVfjuDeDesb3q5PxUmoaJGRQtHFK85Gwsy3I8kOBM
         rIMr+vmUk0fnOXT09FJDQgTcgUXk2LY8j6yz6Ps7MKdnZXToxdJA1qlKI0KSar0ncJpV
         6KhsXBb72F7IuhGhAdW3JuEXKb22xNBlogLepwNPyOg3uQQHoHm74lYBQumNQp+xGORq
         IJpTpNU0+dnoQPOwUfzYCm19qTnba3/UAUGmVwry6N4/b52YgTskuyLzVmzqi3IUlk5y
         23ZHvgZpF09HZn8xjfoIovQkSrdEbwpi+jfFW/nyq+FC7CB29GEJggauTmfEXpTrzIi5
         i6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745357; x=1790350157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XqNRBXt/qlgUXB2hfT5CeqtG8EouGcWeggFZCzuyw8=;
        b=RFa2CUB1h/pvjgx3LRm+uTyQ3VS/Sag4CmEG4FePr30nzPt2xIVZ5t8yBxPHOUzu5t
         ivcqXnNlKohRpf0dSi3KjpL/JSo7UqimQETaMsB76KakY9Hsod1Hd7cSqgiSEmgTsffx
         M1a1jX2S1jmGEJphQmM10k99ZS9w+W+Rs8NVL46cIGXRPdm6kPZyME1E3iAptTpqmcEp
         01iKimZJ8GwxZRaRLDOWNX7RfbuJbJfhVpJhL0aojstPoecQ0blKUMH1kWpL5L3FG+ov
         +Q3Sz4dflgjuqlvgM054PmAce9nwQMHRKkYqh22DZOYY8/F42V2HwQ+/54WSabVDymF4
         2GfA==
X-Forwarded-Encrypted: i=1; AKwUvBylIQnI7DuhABg/q6BOWGQb1oLKYSByEcjgH8oDDFG+KCRos0014jTB1Xf3Q/Lg4au2sjc5vGA1NBs=@lists.infradead.org
X-Gm-Message-State: AFuF++m6jD1zodZwfOvtv/hADJfxtNivwHP9R+63YGaAb/MSzjpUfyd2
	SqIBcJRh9oVnPBlSUjWB5N2fqXos6XbNTuI5ZHB/5qyR8vUT21r8NS16dQIieHe2n3GkqWW5SdI
	BwvP65eg2QbGrsdKsB1DOJNS/A9JhyA8=
X-Gm-Gg: AYBFou0Vv8DLGL0IxXNzwXzH2fpHJPXtTDRj+ns9o/DNXqpMDW6pUGWhkMw02Sc+RiF
	uaTaBGkV4hXCFOIly8FsJ4Iz0GS/GanAnh7sHx/z6YdBvnj+I3G9NjxcMQMiijU2J9X3qUL/itX
	YFzWyNUeLnd0S4UnilPKPshUdmD4GVKolnEYBqGv4YmST5URyD83plk2Bm1jyzdlz1xH5ccc8RT
	ICg5wq9mM4ZFdPZ6CLMWooHW4xi5XcE1NkeAcHXf11+682Kf0Va9ODHltO8bzMdIwskWxLn0vTl
	lzlyfuEkwzfxQlhIcsnSy+K+VquGH1GWGPx78qLNYS31AHpUiGGy4kN/ao9sJMNtTQ==
X-Received: by 2002:a53:b10b:0:b0:668:9402:9938 with SMTP id
 956f58d0204a3-6717fe09e2bmr1135076d50.4.1789745356692; Fri, 18 Sep 2026
 08:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260915113811.2429311-1-itai.handler@gmail.com>
 <20260915115206.CCEE41F000FF@smtp.kernel.org> <DLIC8P2V43E6.34ICV316K7HUK@kernel.org>
In-Reply-To: <DLIC8P2V43E6.34ICV316K7HUK@kernel.org>
From: Itai Handler <itai.handler@gmail.com>
Date: Fri, 18 Sep 2026 18:29:04 +0300
X-Gm-Features: AcwNN1XbHeUXrVqj5J_uyPI-friMh8cd1XJAXk3bkpBhx8iPzqwr-5cZFOaN8P4
Message-ID: <CAFpOueRGN2TSNo+m3319qn00p-BYn8w7OQ6OPt4XTcVG63-uUA@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: spi-nor: take the flash lock around spi_nor_restore()
To: Michael Walle <mwalle@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, pratyush@kernel.org, 
	linux-kernel@vger.kernel.org, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	takahiro.kuwano@infineon.com, richard@nod.at, stable@vger.kernel.org, 
	miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_082918_518811_5D806659 
X-CRM114-Status: GOOD (  14.37  )
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

T24gRnJpLCBTZXAgMTgsIDIwMjYgYXQgMTI6MzTigK9QTSBNaWNoYWVsIFdhbGxlIDxtd2FsbGVA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUgU2VwIDE1LCAyMDI2IGF0IDE6NTIgUE0gQ0VT
VCwgc2FzaGlrby1ib3Qgd3JvdGU6Cj4gPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9u
ISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAyIHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRl
cjoKPiA+IC0gW0hpZ2hdIG10ZDogc3BpLW5vcjogc2tpcHBlZCBmbGFzaCByZXN0b3JlIG9uIGZh
dGFsIHNpZ25hbCBicmVha3MgYm9vdAo+ID4gLSBbSGlnaF0gbXRkOiBzcGktbm9yOiBzaHV0ZG93
biBoYW5nIGR1ZSB0byBvbmdvaW5nIGVyYXNlIG9wZXJhdGlvbgo+Cj4gRG9lcyBTYXNoaWtvIGhh
dmUgc29tZSB2YWxpZCBwb2ludHMgaGVyZT8KCkhlcmUgaXMgbXkgcGVyc3BlY3RpdmUgb24gdGhl
IHR3byBwb2ludHMgcmFpc2VkIGJ5IFNhc2hpa286CgpTaWduYWwgSW50ZXJydXB0aW9uIGR1cmlu
ZyBMb2NrIEFjcXVpc2l0aW9uIChJc3N1ZSAxKToKU2FzaGlrbydzIHBvaW50IGlzIHZhbGlkLCB0
aG91Z2ggdGhpcyBzY2VuYXJpbyBvbmx5IGFwcGxpZXMgdG8gUldXIGNoaXBzCndoZXJlIHNwaV9u
b3JfcHJlcF9hbmRfbG9jaygpIHVzZXMgd2FpdF9ldmVudF9raWxsYWJsZSgpLiBUaGUgd2luZG93
CmZvciB0aGlzIHRvIG9jY3VyIGlzIHF1aXRlIG5hcnJvdyAoZS5nLiwgc2VuZGluZyBTSUdLSUxM
IHRvIHJtbW9kIHdoaWxlCmFuIG9wZXJhdGlvbiBpcyBpbiBwcm9ncmVzcykuCklmIGxvY2sgYWNx
dWlzaXRpb24gaXMgaW50ZXJydXB0ZWQsIGNhbGxpbmcgc3BpX25vcl9yZXN0b3JlKCkgd2l0aG91
dAp0aGUgbG9jayBhcyBhIGZhbGxiYWNrIHJpc2tzIGhhdmluZyB0aGUgY29tbWFuZCBzaWxlbnRs
eSBpZ25vcmVkIGJ5CmEgYnVzeSBmbGFzaC4gSG93ZXZlciwgaXQgbWF5IHN0aWxsIGJlIHdvcnRo
IGF0dGVtcHRpbmcgYXMgYQpiZXN0LWVmZm9ydCBmYWxsYmFjayBhbG9uZ3NpZGUgYSBrZXJuZWwg
d2FybmluZyBsb2cgdG8gbm90aWZ5IHRoZSB1c2VyLgoKRXJhc2UgRHVyYXRpb24gZHVyaW5nIFNo
dXRkb3duIChJc3N1ZSAyKToKV2FpdGluZyBmb3IgYWN0aXZlIG9wZXJhdGlvbnMgdG8gY29tcGxl
dGUgYmVmb3JlIHJlc3RvcmluZyAzLWJ5dGUKbW9kZSBpcyBpbnRlbnRpb25hbC4gSW50ZXJydXB0
aW5nIGFuIG9uZ29pbmcgZXJhc2Ugb3Igd3JpdGUgY3ljbGUKcmlza3MgY29ycnVwdGluZyB0aGUg
Zmxhc2ggb3IgbGVhdmluZyB0aGUgY2hpcCBpbiBhbiB1bmRlZmluZWQgc3RhdGUuCkFsbG93aW5n
IGFjdGl2ZSBvcGVyYXRpb25zIHRvIGZpbmlzaCBiZWZvcmUgdGVhcmRvd24gaXMgc3RhbmRhcmQK
YmVoYXZpb3IgdG8gZ3VhcmFudGVlIGRhdGEgaW50ZWdyaXR5LgoKSWYgdGhpcyByYXRpb25hbGUg
bWFrZXMgc2Vuc2UsIEkgY2FuIHNlbmQgYSB2NCB0aGF0IGFkZHMgYSBiZXN0LWVmZm9ydApzcGlf
bm9yX3Jlc3RvcmUoKSBjYWxsIGFuZCBhIGtlcm5lbCB3YXJuaW5nIG9uIGxvY2sgYWNxdWlzaXRp
b24gZmFpbHVyZS4KCkl0YWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
