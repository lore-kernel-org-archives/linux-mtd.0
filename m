Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D5AD16816
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 11:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmHBo3VF7ToGJ19oSUBC+5JFNpDv0Tg0MaliVTjzGxs=; b=xVQIu/B4e8GEdb
	lK5TjZmbqjIINZe8wky+BG52Sm9bRyYevzb7VmsT9BNFNys7YRqs+CaLU98vEzfTAy3FHWW2Ljthc
	4ilBjheTUiwHGUx0gAPS2acZDVOAFQnRBo/K9kxz8+om5IzvH7sLYCdbBQVg3EYGD4eYrp9DIYPex
	l646j0rid8PPQVci2O/3Gb4gsZedXrufWoZx9Lw2u5dVphNZFZBOdYuIkCaa+bV7+l8RTY1b7FKED
	AeF0AxXmbhsKFgjgoVhfJT3LuWcYFiCePXWmC+qKKHzM082tsbozniw/xYSEdxb2/xO4hvzMTfChj
	6K+lFH6ZcGWF6ZU9Ps8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAiV-00000002Ds8-2xTM;
	Fri, 09 Jan 2026 11:31:43 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAiT-00000002DrK-1afP
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 11:31:42 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b79e7112398so681427966b.3
        for <linux-mtd@lists.infradead.org>; Fri, 09 Jan 2026 03:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767958299; x=1768563099; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSCRQjzqMxlthpyK0S39/a+ZFZYJpJPm7XHV1APkAxI=;
        b=CymkZ6RchSm2gnua1ZEj1+wbqtCZlL9CWgkgrcOGts3bVEmps6ussvKo2eWXIR9j/p
         +vIUb8qMPpMjNUUg7QeCER1owhcU08A9qzwC6TTcO1FrvwO150gr4tsEr02+eEoUuEtn
         iQDIXYRmDI/ApKlZO0QaMc998vqusuK/O4pWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767958299; x=1768563099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BSCRQjzqMxlthpyK0S39/a+ZFZYJpJPm7XHV1APkAxI=;
        b=OCLi4HFj5r/j29/2VqCpawxk9ZtI/V+jnqsmWElSV4MYG7/wEr7UxmbiJIEnfhBq3B
         gpKxRsCRq5TnNzmvHW8fNl++NEReEiE3gfodJy0Rb2j04JQl5v+IP21bIj3euZ375GuP
         OqoufqnZ/vCyJyX4ppsHkCwF5hYB3lHTL9gtqWq/8r/Wjv556yJIUr0E3BYaEnbSCaQK
         +DG3/PV2ARL9xom43qrau3/NWtxLSzYsvLTH6s0gr+kUoG6D+9I1yu49ghwNf1oAayYi
         vCDFyApCQoTzZ+FMIxtKK0NKknR4nGz6VMdZFRdpyM2QmrOECCKSfJWgalZPG/76RKwl
         arLg==
X-Forwarded-Encrypted: i=1; AJvYcCUA+A3fqAAakbXEa1rv893OyPbvye8YYHznMdEWxk5fbL8JyVA66a1dMVg9UULINZeiKmRZ9gLlNq4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCkAHqxO7ZHbexEnj+k2swZ94gjLTPEBsglyiN7iJCRTfFoDph
	FxR1siUPaVhOwnN9JWvDvnvBNnDwQ+YAU16aRc8StILXCq+pjWLDJqWN0wnlYco2tPDICMF2OIV
	0bCZRQPGhPIlJ7usHYs5Y/fN+4N1un38aE+4t+ZBn
X-Gm-Gg: AY/fxX40CasQwGxW8gJOYzyiYeFxM4dGMcwOk4uEoldsEK4edt0e+tEHAxPFJDvSOhU
	9Rx92Pf33nw2GJyXZIX2nssPijQzChEw6fGSZUo+dosQTnQNPPu/ahboi58coExR6kM1ZVrtu0e
	8cJtG0YVHFNtWRKxf/hNSiSsLvTEXrFFREMh7avmaGcU5Vjo4d+zlw0rlUa946LvQRe7TMCTcZ3
	MJrZNObKa9TJhyAsRXCKJct9FsbeqZRp6nYhyTESPO32Zjfps2HSEREn0Wzq795rEVh2w==
X-Google-Smtp-Source: AGHT+IHumhVv8KY3Bg6JqD87gTvWI3jsSjLoKc+3DEfmoml5eVr0Pj1g8bymo8Pdbt3rhglv42hKSAoAOoLafZYaLB8=
X-Received: by 2002:a17:907:960a:b0:b7f:e703:fd77 with SMTP id
 a640c23a62f3a-b8445179dadmr816433766b.11.1767958298734; Fri, 09 Jan 2026
 03:31:38 -0800 (PST)
MIME-Version: 1.0
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org> <20260108-dt-mtd-partitions-v1-2-124a53ce6279@kernel.org>
In-Reply-To: <20260108-dt-mtd-partitions-v1-2-124a53ce6279@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 9 Jan 2026 04:31:26 -0700
X-Gm-Features: AZwV_Qi5Uf9IK7jzzaMO9Hhv7qu9_klerMUU60soC_dP-R-35zHLoPW9f0oY_TU
Message-ID: <CAFLszTj+L02si4C6TUymVQdx5fcvP_o-nMeYBAkKw_GvZhdt=g@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: mtd: fixed-partitions: Move
 "compression" to partition node
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_033141_478914_7E087F8E 
X-CRM114-Status: GOOD (  17.71  )
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

T24gVGh1LCA4IEphbiAyMDI2IGF0IDEwOjUzLCBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IFRoZSAiY29tcHJlc3Npb24iIHByb3BlcnR5IGlzIGRlZmluZWQg
aW4gdGhlIHdyb25nIHBsYWNlIGFzIGl0IGFwcGxpZXMKPiB0byBpbmRpdmlkdWFsIHBhcnRpdGlv
bnMgbm9kZXMsIG5vdCBhbGwgbm9kZXMuCj4KPiBGaXhlczogOGJhYmE4ZDUyZmY1ICgiZHQtYmlu
ZGluZ3M6IG10ZDogZml4ZWQtcGFydGl0aW9uczogQWRkIGNvbXByZXNzaW9uIHByb3BlcnR5IikK
PiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgo+IC0t
LQo+ICAuLi4vYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0aW9ucy55YW1sICAg
ICAgfCAxOCAtLS0tLS0tLS0tLS0tLS0tLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwgIHwgMTggKysrKysrKysrKysrKysrKysrCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4KClJldmll
d2VkLWJ5OiBTaW1vbiBHbGFzcyA8c2ltb24uZ2xhc3NAY2Fub25pY2FsLmNvbT4KCgo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMv
Zml4ZWQtcGFydGl0aW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlvbnMueWFtbAo+IGluZGV4IDYyMDg2MzY2ODM3
Yy4uNzNkNzRjMGY1Y2I3IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwKPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0
aW9ucy55YW1sCj4gQEAgLTI5LDI0ICsyOSw2IEBAIHByb3BlcnRpZXM6Cj4KPiAgICAiI3NpemUt
Y2VsbHMiOiB0cnVlCj4KPiAtICBjb21wcmVzc2lvbjoKPiAtICAgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL3N0cmluZwo+IC0gICAgZGVzY3JpcHRpb246IHwKPiAtICAg
ICAgQ29tcHJlc3Npb24gYWxnb3JpdGhtIHVzZWQgdG8gc3RvcmUgdGhlIGRhdGEgaW4gdGhpcyBw
YXJ0aXRpb24sIGNob3Nlbgo+IC0gICAgICBmcm9tIGEgbGlzdCBvZiB3ZWxsLWtub3duIGFsZ29y
aXRobXMuCj4gLQo+IC0gICAgICBUaGUgY29udGVudHMgYXJlIGNvbXByZXNzZWQgdXNpbmcgdGhp
cyBhbGdvcml0aG0uCj4gLQo+IC0gICAgZW51bToKPiAtICAgICAgLSBub25lCj4gLSAgICAgIC0g
YnppcDIKPiAtICAgICAgLSBnemlwCj4gLSAgICAgIC0gbHpvcAo+IC0gICAgICAtIGx6NAo+IC0g
ICAgICAtIGx6bWEKPiAtICAgICAgLSB4ego+IC0gICAgICAtIHpzdGQKPiAtCj4gIHBhdHRlcm5Q
cm9wZXJ0aWVzOgo+ICAgICJAWzAtOWEtZl0rJCI6Cj4gICAgICAkcmVmOiBwYXJ0aXRpb24ueWFt
bCMKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9w
YXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sCj4gaW5kZXggODBkMDQ1MmEyYTMzLi4w
Yjk4OTAzN2EwMDUgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sCj4gQEAgLTEw
OCw2ICsxMDgsMjQgQEAgcHJvcGVydGllczoKPiAgICAgICAgd2l0aCB0aGUgcGFkZGluZyBieXRl
cywgc28gbWF5IGdyb3cuIElmIOKAmGFsaWduLWVuZOKAmSBpcyBub3QgcHJvdmlkZWQsCj4gICAg
ICAgIG5vIGFsaWdubWVudCBpcyBwZXJmb3JtZWQuCj4KPiArICBjb21wcmVzc2lvbjoKPiArICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3N0cmluZwo+ICsgICAgZGVz
Y3JpcHRpb246IHwKPiArICAgICAgQ29tcHJlc3Npb24gYWxnb3JpdGhtIHVzZWQgdG8gc3RvcmUg
dGhlIGRhdGEgaW4gdGhpcyBwYXJ0aXRpb24sIGNob3Nlbgo+ICsgICAgICBmcm9tIGEgbGlzdCBv
ZiB3ZWxsLWtub3duIGFsZ29yaXRobXMuCj4gKwo+ICsgICAgICBUaGUgY29udGVudHMgYXJlIGNv
bXByZXNzZWQgdXNpbmcgdGhpcyBhbGdvcml0aG0uCj4gKwo+ICsgICAgZW51bToKPiArICAgICAg
LSBub25lCj4gKyAgICAgIC0gYnppcDIKPiArICAgICAgLSBnemlwCj4gKyAgICAgIC0gbHpvcAo+
ICsgICAgICAtIGx6NAo+ICsgICAgICAtIGx6bWEKPiArICAgICAgLSB4ego+ICsgICAgICAtIHpz
dGQKPiArCj4gIGlmOgo+ICAgIG5vdDoKPiAgICAgIHJlcXVpcmVkOiBbIHJlZyBdCj4KPiAtLQo+
IDIuNTEuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
