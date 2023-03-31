Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7DBC761A6
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 14:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8D6NbRBngtsyJIY21Js2765R6EPoSVMdpflhYRbPiKA=; b=IS62hOfOay8pte
	Ps+EOC3moe2dJ5Yzt35bsf+4dK7/tDb7+r0tkXJj+Uh9oNz0rqrCbTLOxEFdxMEZobMsDm1bOcT26
	n+pIaeDajcDfPqXGb2iXemRo7ltM03FwB/wFzJk5qIb3jhiFvF/bvI4BjQsym3gKfr6hPLbb1nQNg
	Lqip3RaOGAlBg93XSoY7D1hqjf1KvZRx0PRsHzyGYudvq6iR/cekK6lWI6E/cWcbvuzfZRQJffKM0
	c93GREChWyH6DNvAkLfBCJ+t+YgFCS1JGGh7kQ7HGGtEMGd3+keQZ0N46dVJtBcQbJl8zKGGMQm9N
	pt1qk8ZrhZeQiHN9Hx+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piFTd-007e4e-0R;
	Fri, 31 Mar 2023 14:11:37 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piFTY-007e2E-2o
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 14:11:35 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id d18so19240572vsv.11
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680271889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lG/WYsq29l19IPVJ1k1HveeXpXEw8n6whXP0RBXQsVE=;
        b=EvtZrKsNbHzwyuTtRqHQROrrofpQ/sG01uOiuhmiI8aPts7n7Ee5Ir4NvfrBMC9uI+
         rP59rZDcNbSrbcJgAHZuzWOVqM440qSkPSsXQam8gLhm6JrqARMEWp7hP37azlVW4org
         fBACV9jHeMc/fcIgXarc7w17iylr7tNHGmieksiQNlIzpXJ80+yWU+CJGHU8lpI3k2C8
         ICYW0V27W/2DBLWul+Ja7q7aEtfylH/JCpUFcy+E+zrhYwff5tk/+w+43pgclTvoUdaY
         JKB3eTBzT085pwnm7cEdG1xRDF3HVWkUIWkzjjSc40AzCnbk/tZvpSB9Tq3T3RIS9CKy
         06FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680271889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lG/WYsq29l19IPVJ1k1HveeXpXEw8n6whXP0RBXQsVE=;
        b=H1f/UEet/8C5H525NSKwFwMDITK9LtA4JZ3JODiU3Pp4F1YhXxa3YNl4JkGjjg0rf5
         3xGqR9e2dIHcU65sf41pgDrAdSVVnsrXusXcCZugr9f9OTPfCZAPw+RWr6xSr7sKVQbb
         KdMCSkUUFh+11YqpZdCVhlbF17b7105H4DVt8ZN52ovgjE/Hn2XDsI7SoYSfhhmH7yBv
         sbrSr7jsLaibp9B1D+zjl0ww461LckeN+j0d0oxMdPb3j/dIx5RaV5Ah10RQUFO5yJ5H
         A9TIhUWr1vsqhO0yEtqnOW9TdqaOL+aaKLYBSqMlPlkmb4fyD3lETLeDjNJ94yN8Tq/+
         sXhg==
X-Gm-Message-State: AAQBX9cwB+UIhYLwQWQW7gWfPgUmi9/Np1NO5NSp/SKKYpFwyGru7892
	c+h8vdm9q65/9FkeSDu/knH7NmYc4GWpco4UIjxZaA==
X-Google-Smtp-Source: AKy350Ya9O0j2IJ/iXVAszn5aY9fHDH1jV5pYhAfg5ER4OEHtZmmlP21NIaPy6SQjGvX406cL1yK9LBdk5p7JcyHINc=
X-Received: by 2002:a67:e095:0:b0:426:b051:1c4 with SMTP id
 f21-20020a67e095000000b00426b05101c4mr9141092vsl.0.1680271889495; Fri, 31 Mar
 2023 07:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <20230331-topic-oxnas-upstream-remove-v1-15-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-15-5bd58fd1dd1f@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 31 Mar 2023 16:11:18 +0200
Message-ID: <CAMRc=Mdp48+DitzSV5gq3arPL75TJXQLoBxTujsWSH4UVpd2ww@mail.gmail.com>
Subject: Re: [PATCH RFC 15/20] dt-bindings: gpio: gpio_oxnas: remove obsolete bindings
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
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Sebastian Reichel <sre@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_071132_912018_3B88BCEF 
X-CRM114-Status: GOOD (  21.27  )
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

T24gRnJpLCBNYXIgMzEsIDIwMjMgYXQgMTA6MzXigK9BTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBEdWUgdG8gbGFjayBvZiBtYWludGFpbmFu
Y2UgYW5kIHN0YWxsIG9mIGRldmVsb3BtZW50IGZvciBhIGZldyB5ZWFycyBub3csCj4gYW5kIHNp
bmNlIG5vIG5ldyBmZWF0dXJlcyB3aWxsIGV2ZXIgYmUgYWRkZWQgdXBzdHJlYW0sIHJlbW92ZSB0
aGUKPiBPWDgxMCBhbmQgT1g4MjAgZ3BpbyBiaW5kaW5ncy4KPgo+IFNpZ25lZC1vZmYtYnk6IE5l
aWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+IC0tLQo+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW9fb3huYXMudHh0ICAgICAgICB8IDQ3IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ3IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW9fb3hu
YXMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vZ3Bpb19veG5h
cy50eHQKPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCA5NjY1MTQ3NDRkZjQuLjAw
MDAwMDAwMDAwMAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlv
L2dwaW9fb3huYXMudHh0Cj4gKysrIC9kZXYvbnVsbAo+IEBAIC0xLDQ3ICswLDAgQEAKPiAtKiBP
eGZvcmQgU2VtaWNvbmR1Y3RvciBPWE5BUyBTb0MgR1BJTyBDb250cm9sbGVyCj4gLQo+IC1QbGVh
c2UgcmVmZXIgdG8gZ3Bpby50eHQgZm9yIGdlbmVyaWMgaW5mb3JtYXRpb24gcmVnYXJkaW5nIEdQ
SU8gYmluZGluZ3MuCj4gLQo+IC1SZXF1aXJlZCBwcm9wZXJ0aWVzOgo+IC0gLSBjb21wYXRpYmxl
OiAib3hzZW1pLG94ODEwc2UtZ3BpbyIgb3IgIm94c2VtaSxveDgyMC1ncGlvIgo+IC0gLSByZWc6
IEJhc2UgYWRkcmVzcyBhbmQgbGVuZ3RoIGZvciB0aGUgZGV2aWNlLgo+IC0gLSBpbnRlcnJ1cHRz
OiBUaGUgcG9ydCBpbnRlcnJ1cHQgc2hhcmVkIGJ5IGFsbCBwaW5zLgo+IC0gLSBncGlvLWNvbnRy
b2xsZXI6IE1hcmtzIHRoZSBwb3J0IGFzIEdQSU8gY29udHJvbGxlci4KPiAtIC0gI2dwaW8tY2Vs
bHM6IFR3by4gVGhlIGZpcnN0IGNlbGwgaXMgdGhlIHBpbiBudW1iZXIgYW5kCj4gLSAgIHRoZSBz
ZWNvbmQgY2VsbCBpcyB1c2VkIHRvIHNwZWNpZnkgdGhlIGdwaW8gcG9sYXJpdHkgYXMgZGVmaW5l
ZCBpbgo+IC0gICBkZWZpbmVkIGluIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD46Cj4gLSAgICAg
IDAgPSBHUElPX0FDVElWRV9ISUdICj4gLSAgICAgIDEgPSBHUElPX0FDVElWRV9MT1cKPiAtIC0g
aW50ZXJydXB0LWNvbnRyb2xsZXI6IE1hcmtzIHRoZSBkZXZpY2Ugbm9kZSBhcyBhbiBpbnRlcnJ1
cHQgY29udHJvbGxlci4KPiAtIC0gI2ludGVycnVwdC1jZWxsczogVHdvLiBUaGUgZmlyc3QgY2Vs
bCBpcyB0aGUgR1BJTyBudW1iZXIgYW5kIHNlY29uZCBjZWxsCj4gLSAgIGlzIHVzZWQgdG8gc3Bl
Y2lmeSB0aGUgdHJpZ2dlciB0eXBlIGFzIGRlZmluZWQgaW4KPiAtICAgPGR0LWJpbmRpbmdzL2lu
dGVycnVwdC1jb250cm9sbGVyL2lycS5oPjoKPiAtICAgICAgSVJRX1RZUEVfRURHRV9SSVNJTkcK
PiAtICAgICAgSVJRX1RZUEVfRURHRV9GQUxMSU5HCj4gLSAgICAgIElSUV9UWVBFX0VER0VfQk9U
SAo+IC0gLSBncGlvLXJhbmdlczogSW50ZXJhY3Rpb24gd2l0aCB0aGUgUElOQ1RSTCBzdWJzeXN0
ZW0sIGl0IGFsc28gc3BlY2lmaWVzIHRoZQo+IC0gICBncGlvIGJhc2UgYW5kIGNvdW50LCBzaG91
bGQgYmUgaW4gdGhlIGZvcm1hdCBvZiBudW1lcmljLWdwaW8tcmFuZ2UgYXMKPiAtICAgc3BlY2lm
aWVkIGluIHRoZSBncGlvLnR4dCBmaWxlLgo+IC0KPiAtRXhhbXBsZToKPiAtCj4gLWdwaW8wOiBn
cGlvQDAgewo+IC0gICAgICAgY29tcGF0aWJsZSA9ICJveHNlbWksb3g4MTBzZS1ncGlvIjsKPiAt
ICAgICAgIHJlZyA9IDwweDAwMDAwMCAweDEwMDAwMD47Cj4gLSAgICAgICBpbnRlcnJ1cHRzID0g
PDIxPjsKPiAtICAgICAgICNncGlvLWNlbGxzID0gPDI+Owo+IC0gICAgICAgZ3Bpby1jb250cm9s
bGVyOwo+IC0gICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4gLSAgICAgICAjaW50ZXJydXB0
LWNlbGxzID0gPDI+Owo+IC0gICAgICAgZ3Bpby1yYW5nZXMgPSA8JnBpbmN0cmwgMCAwIDMyPjsK
PiAtfTsKPiAtCj4gLWtleXMgewo+IC0gICAgICAgLi4uCj4gLQo+IC0gICAgICAgYnV0dG9uLWVz
YyB7Cj4gLSAgICAgICAgICAgICAgIGxhYmVsID0gIkVTQyI7Cj4gLSAgICAgICAgICAgICAgIGxp
bnV4LGNvZGUgPSA8MT47Cj4gLSAgICAgICAgICAgICAgIGdwaW9zID0gPCZncGlvMCAxMiAwPjsK
PiAtICAgICAgIH07Cj4gLX07Cj4KPiAtLQo+IDIuMzQuMQo+CgpBY2tlZC1ieTogQmFydG9zeiBH
b2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
