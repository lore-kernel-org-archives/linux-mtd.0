Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B792EB64D9
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jul 2023 17:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/L4Oc6Nx+YoHi6s0ZlzYEZ/8IroYI7xkozvOw3caBI=; b=JvweeOwqGOJ8g/
	muR+gDV10glVkaqziB9Y7rCtwT8+zXzfnCBySrUMhfIZcvx92klJD3xYydnbXftbPi54zCtJ/a6Et
	R4+W5JGfr9PvrP2c85DwSo5+UJq/d2YmX8et5H/5BpWk+goRNMGR+Gz7JU/ZQhMThYFqO/icb+ueZ
	s6OJbpss6r8sLr2dTWWpEcFu83lO+oIkq4urjnXuJtdflXSXwlnc04cfegLvMSwvyj3rn25mwZZw2
	6uqH/eKKSxGWjtrMOAESyBMmpxARWgjePZyF1tVyPtPVaq17R3oHffGPVhBEp+1KOBrugD15DZAhf
	3zo6girCDP70jOup6vbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHpLx-005Juh-1M;
	Fri, 07 Jul 2023 17:34:45 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHpLu-005JtX-0k
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jul 2023 17:34:43 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-bad0c4f6f50so3180310276.1
        for <linux-mtd@lists.infradead.org>; Fri, 07 Jul 2023 10:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688751280; x=1691343280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4T7IMxN0TP5UXWRADoHIlZLwq+oACmj5uQt2K3uBHp8=;
        b=ua0N9EikGOR3PcFTrAJY6G11Vfgf3l/sbCakQgDc6n8aUXs9GX/k0AcJXtPvSLKw2L
         wU72VhSqIXgNsPwPmw9cgMA8yzYOf3k7fWn+18GbY47N5ivDXR9CfEHnxAJ7Fd4IUQI+
         EP1A+9Eti1IsdimXcmT7+7S1sbS528fTnZlNe12g6AfETIkY8d2JSdgNmAxrrJTLOeJo
         QL0123RRJBW8qC/xQAaRShDQabXW4dfYtU5zUa6wDK3TPjrLj+sydSZJSa4sTBMqdrY7
         Y8WBQ1EW+aBIyulIV3s4YGmjT2FnXyjtjcISV6h3l4EZiMMFsKguqla3YNxEQBOs3ldx
         iVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688751280; x=1691343280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4T7IMxN0TP5UXWRADoHIlZLwq+oACmj5uQt2K3uBHp8=;
        b=BvCYHi22HdP2eLI5pHkSEeR/FcJbQZX2BuEm3fXWVZyvloIEOiQ7ubJprujLpl+yE0
         gYMJXBhF4aqgPeVjk3qToNf3qo4Wd7o6oniyYtzRqXXjG5tVDOlr76G4h2nVp9+Pu0pK
         X9EdWXC96EGMeuXByb2etjFSyS5bJi6i6n7MIQOyoEw+MgtddSSNtFsYEM1kIS39u5SY
         JACyaMVedYarLihX3Dj06arzptMjb+iR20DXFPm+oEUeQA7DSKkhZG7+WU3wN3xq7u4F
         yvYyT/7F8OmA9Bq4IiHbxf1O+Q19TG5WqESovSEaDrzLBLsW22TuCbtXt+rKNwHyrFdp
         rBdA==
X-Gm-Message-State: ABy/qLbVQcmYrxGioya6Cdg/YfTGww3RfjQ8yZ6QvORoFo1i+aLIB+Yy
	8fQ/tEHZdLIM8ognVXhtmSEGgucxKAZ3mRlUiyj5qw==
X-Google-Smtp-Source: APBJJlF6NiXDPI9P8bH5HuRqAOnEAHZSiuJMz7y6h3P1N9fjLRuXkXl3vrm1y7HqnhUUPw2k5JPsRuq1E4Z7cYeqVxo=
X-Received: by 2002:a25:aea6:0:b0:bd7:6e9d:656 with SMTP id
 b38-20020a25aea6000000b00bd76e9d0656mr6339219ybj.17.1688751278764; Fri, 07
 Jul 2023 10:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230705-seama-partitions-v2-0-9d349f0d5ab7@linaro.org>
 <20230705-seama-partitions-v2-1-9d349f0d5ab7@linaro.org> <20230705195154.GA1702900-robh@kernel.org>
In-Reply-To: <20230705195154.GA1702900-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Jul 2023 19:34:27 +0200
Message-ID: <CACRpkdbwCYknVbyNdPivTsdbc+R3ndCkkgMTsryoautimpQguA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: Add SEAMA partition bindings
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_103442_282260_A9C753EB 
X-CRM114-Status: GOOD (  16.95  )
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

T24gV2VkLCBKdWwgNSwgMjAyMyBhdCA5OjUx4oCvUE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gT24gV2VkLCBKdWwgMDUsIDIwMjMgYXQgMTI6MTc6NDZQTSArMDIwMCwg
TGludXMgV2FsbGVpaiB3cm90ZToKCj4gPiAgICAtICRyZWY6IHJlZGJvb3QtZmlzLnlhbWwKPiA+
ICsgIC0gJHJlZjogc2VhbWEueWFtbAo+Cj4gSSB0aGluayB0aGlzIGlzIGluIHRoZSB3cm9uZyBw
bGFjZS4gVGhlc2Ugc2hvdWxkIGJlIGRldmljZSBsZXZlbAo+IHBhcnRpdGlvbmluZyBzY2hlbWFz
LCBub3QgYW4gaW5kaXZpZHVhbCBwYXJ0aXRpb24gdHlwZS4gKFRob3VnaCBuZXN0aW5nCj4gaXMg
cG9zc2libGUpCgpPSyBpdCB3YXNuJ3QgdGhlcmUgaW4gdjEsIHRoZW4gS3J6eXN6dG9mIHNhaWQg
aXQgc2hvdWxkIGJlIHRoZXJlCihpZiBJIHVuZGVyc3Rvb2QgY29ycmVjdGx5KSBhbmQgSSB3aWxs
IHJlbW92ZSBpdCBhZ2FpbiB0aGVuLgoKPiA+ICtzZWxlY3Q6IGZhbHNlCj4KPiBSZW1vdmUgdGhp
cyBhbmQgeW91ciBleGFtcGxlIHdpbGwgZmFpbC4gWW91IG5lZWQgdW5ldmFsdWF0ZWRQcm9wZXJ0
aWVzLgoKT0sKCj4gVGhlcmUncyBhIHByb2JsZW0gaW4gcGFydGl0aW9ucy55YW1sLiBJdCBuZXZl
ciBnZXRzIGFwcGxpZWQsIHNvIHRoaXMKPiBzY2hlbWEgbmV2ZXIgZ2V0cyBhcHBsaWVkLiBUaGUg
ZGVmYXVsdCAnc2VsZWN0JyBpcyBnZW5lcmF0ZWQgYmFzZWQgb24KPiAkbm9kZW5hbWUgb3IgY29t
cGF0aWJsZSwgYnV0IGl0IGhhcyBuZWl0aGVyLiBUaGlzIG5lZWRzIHNvbWUgbW9yZQo+IHRob3Vn
aHQgb24gaG93IHRvIGZpeCBnaXZlbiB0aGUgdmFyaWFibGUgd2F5IHBhcnRpdGlvbnMgY2FuIGJl
IGNvbWJpbmVkLgo+IFByb2JhYmx5IGF0IGEgbWluaW11bSwgYWxsIHRoZSAnc2VsZWN0OiBmYWxz
ZScgbmVlZCB0byBiZSByZW1vdmVkLgoKSSBkb24ndCB0aGluayBJIGNhbiBmaXggdGhpcyBwcm9i
bGVtLCBJJ20gbm90IHRoYXQgZ29vZCB3aXRoIHNjaGVtYS4KSSBkb24ndCBldmVuIHVuZGVyc3Rh
bmQgdGhlIHRoaW5raW5nIGFyb3VuZCB0aGUgZXhpc3RpbmcgcGFydGl0aW9ucy55YW1sLgoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
