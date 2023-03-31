Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D88AC6FD18
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 08:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TNLc1ChDeeBnzWm+Z96jwpOQvsK0nqNQy/sD/a/73Vk=; b=SSyyfqdFuF4tQh
	pXKZQF2/nl6FEukXuBS3IBf/RfYiPXRHkfTqPC52Y3RVjjhbcz0T9xoYepn6xG2O0cGoNV7zKxKy3
	vWQMvNt1YCXTMqXovy+aQmgF7hGJEO1WoAC6Okoov0v/vZec1tFE8bZs+17PmIi0YYNDB2rUnL4H0
	Sh1wNRjkfybzzfbfPF5pNqKnz1Zrrfd6mfNeGze3ndVxLY6SbyNZeQTw+RrbLy5l3s3RA9J6oplBl
	73wD62ibJYjbIugb5Mc/hB8z0AH3z61k6tSEPmr65Y09HUDbsn36CYjiLsiIOfdzKxzVuOGUTy6RY
	4/fvxu1nV44MldJ2y/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piATx-006WdW-0J;
	Fri, 31 Mar 2023 08:51:37 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piATu-006Wbt-2V
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 08:51:36 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-54184571389so402926637b3.4
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 01:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680252691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cd/ibuQb3vn5g/cRqzfQk5lg+1/+bjO2UJjaxJoegBM=;
        b=LNzF1nUPzml+JIWoLM4lEKblSafQMhII427hBVE2fYE/IMt5PPojSCas5egWKg+KRc
         ygy0xOK7R4RMFkD7vxSF97RyeOmkq6giu97/zXrN5oKidigfgjHuuAX1t0IMgLo4oZBX
         edyYaG7ch29g3YuQziHv5Jft/d/9abqbc5SVvOGiFX9RiIq31R+jCgvgX/wevIDuGtDP
         lVYFMvg52OandlxR7J/XbiWCqOgv9i0qUzdZ50A6ItgiyqRbKtSt7NsOXjKBZco8abZe
         r8h5pQWUotUJdENoR3OCLdyJleXrOQqAExqWGqNIo/gAEedNYR8Bys3HYgJETvQ50stz
         vW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680252691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cd/ibuQb3vn5g/cRqzfQk5lg+1/+bjO2UJjaxJoegBM=;
        b=uUKB//K/KJWCKwPkS1n0Nd1QR/ElE6O9T9qxXHOD6SR3xxlVjwooeBCbhWDFAz0iFL
         gVPhaAmpbGxzLSR3I3IWHBFT3aTCQ1vrEwYkJMKR4IFXmHC1loIi8esd0WW9X34qK3Tv
         y9bHdsUHrtrFYeI+Zp0vo4YMny9UtvVrPNvID2me/s92YJja1Xv06PBcZR0DjnR+9e0T
         HALmhVAvolgW3IqcFlqVB4Ej+h9q2c8nJ4xFuaGinppnUghAVtevKGjMqya4yXckOujK
         K7I31E4tj/lvk2QzxpdqFUH00P1R6wmm7eLKVZOVgktq9TW6ZfEqKfbS5w1RraSijzOP
         bz7Q==
X-Gm-Message-State: AAQBX9d2cSqv4ggQZFqrHuOovlQbFduwBJsR/bJ0Vq6mL1n+hvW+ETxx
	q+rbhnubhLiWRpAPcsw96eJ7dhasnoEm7oUJajhvHA==
X-Google-Smtp-Source: AKy350a6johu/GITQvnR+QBZGVCy3Nh12i/zifBxULJFlWKoDA9ufP4RPovIeYwuYMYc7B3Q1GKWJeXUD/WzDxFgGl8=
X-Received: by 2002:a81:9993:0:b0:544:bbd2:74be with SMTP id
 q141-20020a819993000000b00544bbd274bemr5121733ywg.4.1680252691054; Fri, 31
 Mar 2023 01:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 31 Mar 2023 10:51:19 +0200
Message-ID: <CACRpkdY4GAzE5DbE4yOZ8sFspZoJWWZk+DYTHsKRmm1bpX7WGQ@mail.gmail.com>
Subject: Re: [PATCH RFC 00/20] ARM: oxnas support removal
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Sebastian Reichel <sre@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_015134_812805_94C8D5CD 
X-CRM114-Status: GOOD (  23.67  )
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

T24gRnJpLCBNYXIgMzEsIDIwMjMgYXQgMTA6MzTigK9BTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFdpdGggWzFdIHJlbW92aW5nIE1QQ29yZSBT
TVAgc3VwcG9ydCwgdGhpcyBtYWtlcyB0aGUgT1g4MjAgYmFyZWx5IHVzYWJsZSwKPiBhc3NvY2lh
dGVkIHdpdGggYSBjbGVhciBsYWNrIG9mIG1haW50YWluYW5jZSwgZGV2ZWxvcG1lbnQgYW5kIG1p
Z3JhdGlvbiB0bwo+IGR0LXNjaGVtYSBpdCdzIGNsZWFyIHRoYXQgTGludXggc3VwcG9ydCBmb3Ig
T1g4MTAgYW5kIE9YODIwIHNob3VsZCBiZSByZW1vdmVkLgo+Cj4gSW4gYWRkaXRpb24sIHRoZSBP
WDgxMCBoYXNuJ3QgYmVlbiBib290ZWQgZm9yIHllYXJzIGFuZCBpc24ndCBldmVuIHByZXNlbnQK
PiBpbiBhbiBBUk0gY29uZmlnIGZpbGUuCj4KPiBGb3IgdGhlIE9YODIwLCBsYWNrIG9mIFVTQiBh
bmQgU0FUQSBzdXBwb3J0IG1ha2VzIHRoZSBwbGF0Zm9ybSBub3QgdXNhYmxlCj4gaW4gdGhlIGN1
cnJlbnQgTGludXggc3VwcG9ydCBhbmQgcmVsaWVzIG9uIG9mZi10cmVlIGRyaXZlcnMgaGFja2Vk
IGZyb20gdGhlCj4gdmVuZG9yIChkZWZ1bmN0IGZvciB5ZWFycykgc291cmNlcy4KPgo+IFRoZSBs
YXN0IHVzZXJzIGFyZSBpbiB0aGUgT3BlbldSVCBkaXN0cmlidXRpb24sIGFuZCB0b2RheSdzIHJl
bW92YWwgbWVhbnMKPiBzdXBwb3J0IHdpbGwgc3RpbGwgYmUgaW4gc3RhYmxlIDYuMSBMVFMga2Vy
bmVsIHVudGlsIGVuZCBvZiAyMDI2Lgo+Cj4gSWYgc29tZW9uZSB3YW50cyB0byB0YWtlIG92ZXIg
dGhlIGRldmVsb3BtZW50IGV2ZW4gd2l0aCBsYWNrIG9mIFNNUCwgSSdsbAo+IGJlIGhhcHB5IHRv
IGhhbmQgb2ZmIG1haW50YWluYW5jZS4KPgo+IFRoZSBwbGFuIGlzIHRvIGFwcGx5IHRoZSBmaXJz
dCA0IHBhdGNoZXMgZmlyc3QsIHRoZW4gdGhlIGRyaXZlcnMKPiBmb2xsb3dlZCBieSBiaW5kaW5n
cy4gRmluYWxseSB0aGUgTUFJTlRBSU5BTkNFIGVudHJ5IGNhbiBiZSByZW1vdmVkLgo+Cj4gSSdt
IG5vdCBzdXJlIGFib3V0IHRoZSBwcm9jZXNzIG9mIGJpbmRpbmdzIHJlbW92YWwsIGJ1dCBwZXJo
YXBzIHRoZSBiaW5kaW5ncwo+IHNob3VsZCBiZSBtYXJrZWQgYXMgZGVwcmVjYXRlZCBmaXJzdCB0
aGVuIHJlbW92ZWQgbGF0ZXIgb24gPwo+Cj4gSXQgaGFzIGJlZW4gYSBmdW4gdGltZSBhZGRpbmcg
c3VwcG9ydCBmb3IgdGhpcyBhcmNoaXRlY3R1cmUsIGJ1dCBpdCdzIHRpbWUKPiB0byBnZXQgb3Zl
ciEKPgo+IFBhdGNoIDIgb2J2aW91c2x5IGRlcGVuZHMgb24gWzFdLgo+Cj4gWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDMyNzEyMTMxNy40MDgxODE2LTEtYXJuZEBrZXJuZWwu
b3JnLwo+Cj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxp
bmFyby5vcmc+CgpBY2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
