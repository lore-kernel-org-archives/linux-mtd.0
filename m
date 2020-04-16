Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA93C2D0EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 07:19:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD260206D5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 07:19:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NU1/fYja";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x+7x1SRD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD260206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlLqF/aAaQJcolN7mR0M093xsCUbR8f+Hlc3Ry1g5yo=; b=NU1/fYjasR0Yei
	SC2fEvTcXiv5Kqug9WtBCsGvve5OnCkkpuxGjucuCWNJLZxfm0wn/tBhtVS8WfW0bcp030XKxRnW4
	54GMzuCCHlHU2QOeX3HIAoFUsR9uAo12sw7v9hM5RYJe64Ch+hyayoIHJOp+udxPlyae4l5c+CMgQ
	j4jikIRPz+va1vgcxHlljF1sxujRQnt4LehFS3eaHSnG7w+zyRI2ID9IYDG4YCA+YI+WPgDeuU3Ep
	VIHPR4TTgfrVZAWQGXnTU/pyJpYQI7gms4cQfT0bMmBawHw4hy8fqt6+80KzB7BJiX6TKOM3h26op
	H53NDCS0Sd9X6yAABFnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOynz-0004Tr-Ug; Thu, 16 Apr 2020 07:19:23 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOynw-0004RZ-3P
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 07:19:22 +0000
Received: by mail-wr1-x442.google.com with SMTP id j2so3528551wrs.9
 for <linux-mtd@lists.infradead.org>; Thu, 16 Apr 2020 00:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3AEaWn5XeJ7hcX74F4NzwZbogUqZr77xLF5d73BlBfw=;
 b=x+7x1SRD1y/LTZJxHdO7NBoPBhyXEErUVgwIai9Txb2aqME7MbBYVN8PkA7MmFMlG/
 +PTNeDQuJeOieuyql513BpDrE+TR0fX/mGtYOkCA4N6z7VRTvWgnydlKHHjdN1pHbDi6
 FcrLT7q9Xm6W6XF2DKy+sVxRvrx2e8zXuCLbQfQ8d2nPd/iJ34SsziQVe8hgIZhAVDz1
 X39oeCEgZoTyWJybNtbP4u4Ik4a22WiM6sS1Gf+7ektT/jxfmy4EaiaU+raISKCA976c
 DL5uziLMISTg53DG/aGMYXA9DS9lwHatzi8LUvPjSHKrnZk+uf82Nr0GKjoaC8YAX62l
 Ovyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3AEaWn5XeJ7hcX74F4NzwZbogUqZr77xLF5d73BlBfw=;
 b=Gay34nFWZyUaAuiDuvVl4IgSjbKB7uRd5googHlQZtBBahb0rxIY/bGyl6DTiww7l2
 hhzOoPc/SZNcSEQhie/J3RkdbasfzI4liItcrXTZylDeHrrBbsx+Vq3PEKgDDHBmKkyA
 ulB4kWAXv+g4tc4SNh/RosnT9zTgxcNNU5xGW6IsquwbesnnbWQ+cJzyg8q1yF1Mlezn
 eNIDpNEnTVHwZnGNHXMeo9UBnWRoDVQNiNZjNZVCdaB1cQblsC1C5pZn7S6I8WdMyvl6
 3fl0LARvkNEeweG4aaOC8YMmdVowWIEFjJdYWMjcp7mB7IbJi3fnVy7dj+qbJraDi7YO
 EAZA==
X-Gm-Message-State: AGi0PuZ82TEmx2JwYmTOo1JQrf6TFkHP39JsXer7K4BGcJ2JnIGFI2OF
 04ehpVzLguBADO8pkoy3juujjg==
X-Google-Smtp-Source: APiQypLCNVZBL4RMlNf7UZFX5oU2xDT6SF7MjxuD7BsWZie9pUbnFA9tcL+f+7W6lePE+UdiJ1fBjg==
X-Received: by 2002:adf:e4cc:: with SMTP id v12mr8967305wrm.106.1587021558557; 
 Thu, 16 Apr 2020 00:19:18 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id p16sm19943946wro.21.2020.04.16.00.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 00:19:17 -0700 (PDT)
Date: Thu, 16 Apr 2020 08:20:18 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Clean-up schema indentation formatting
Message-ID: <20200416072018.GS2167633@dell>
References: <20200416005549.9683-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416005549.9683-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_001920_662159_1CBB1BCF 
X-CRM114-Status: GOOD (  13.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 Maxime Ripard <mripard@kernel.org>, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxNSBBcHIgMjAyMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IEZpeCB2YXJpb3VzIGlu
Y29uc2lzdGVuY2llcyBpbiBzY2hlbWEgaW5kZW50YXRpb24uIE1vc3Qgb2YgdGhlc2UgYXJlCj4g
bGlzdCBpbmRlbnRhdGlvbiB3aGljaCBzaG91bGQgYmUgMiBzcGFjZXMgbW9yZSB0aGFuIHRoZSBz
dGFydCBvZiB0aGUKPiBlbmNsb3Npbmcga2V5d29yZC4gVGhpcyBkb2Vzbid0IG1hdHRlciBmdW5j
dGlvbmFsbHksIGJ1dCBhZmZlY3RzIHJ1bm5pbmcKPiBzY3JpcHRzIHdoaWNoIGRvIHRyYW5zZm9y
bXMgb24gdGhlIHNjaGVtYSBmaWxlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYWx0
ZXJhLnlhbWwgICAgICAgfCAgNiArLQo+ICAuLi4vYW1sb2dpYy9hbWxvZ2ljLG1lc29uLWd4LWFv
LXNlY3VyZS55YW1sICAgfCAgMiArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYml0
bWFpbi55YW1sICAgICAgfCAgMiArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbnhw
L2xwYzMyeHgueWFtbCAgfCAgOSArKy0KPiAgLi4uL2JpbmRpbmdzL2FybS9zb2Npb25leHQvdW5p
cGhpZXIueWFtbCAgICAgIHwgMjYgKysrKy0tLS0KPiAgLi4uL2JpbmRpbmdzL2FybS9zdG0zMi9z
dCxtbGFoYi55YW1sICAgICAgICAgIHwgIDIgKy0KPiAgLi4uL2JpbmRpbmdzL2FybS9zdG0zMi9z
dCxzdG0zMi1zeXNjb24ueWFtbCAgIHwgIDYgKy0KPiAgLi4uL2JpbmRpbmdzL2F0YS9mYXJhZGF5
LGZ0aWRlMDEwLnlhbWwgICAgICAgIHwgIDQgKy0KPiAgLi4uL2JpbmRpbmdzL2J1cy9hbGx3aW5u
ZXIsc3VuOGktYTIzLXJzYi55YW1sIHwgIDQgKy0KPiAgLi4uL2Nsb2NrL2FsbHdpbm5lcixzdW40
aS1hMTAtZ2F0ZXMtY2xrLnlhbWwgIHwgIDggKy0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Nsb2NrL2ZzbCxwbGxkaWcueWFtbCB8IDE3ICsrKy0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Nsb2NrL3Fjb20sbW1jYy55YW1sICB8IDE2ICsrLS0tCj4gIC4uLi9iaW5kaW5ncy9jb25u
ZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sICAgICB8ICA2ICstCj4gIC4uLi9jcnlwdG8vYWxsd2lu
bmVyLHN1bjRpLWExMC1jcnlwdG8ueWFtbCAgICB8IDE0ICsrLS0KPiAgLi4uL2JpbmRpbmdzL2Ny
eXB0by9hbGx3aW5uZXIsc3VuOGktY2UueWFtbCAgIHwgMTYgKystLS0KPiAgLi4uL2JpbmRpbmdz
L2NyeXB0by9hbWxvZ2ljLGd4bC1jcnlwdG8ueWFtbCAgIHwgIDIgKy0KPiAgLi4uL2Rpc3BsYXkv
YWxsd2lubmVyLHN1bjRpLWExMC1oZG1pLnlhbWwgICAgIHwgNDAgKysrKysrLS0tLS0tCj4gIC4u
Li9kaXNwbGF5L2FsbHdpbm5lcixzdW40aS1hMTAtdGNvbi55YW1sICAgICB8IDU4ICsrKysrKysr
LS0tLS0tLS0tCj4gIC4uLi9kaXNwbGF5L2FsbHdpbm5lcixzdW42aS1hMzEtbWlwaS1kc2kueWFt
bCB8IDI4ICsrKystLS0tCj4gIC4uLi9kaXNwbGF5L2FsbHdpbm5lcixzdW44aS1hODN0LWR3LWhk
bWkueWFtbCB8IDEwICstLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy1jb2Rl
Yy55YW1sICAgfCAxOCArKystLS0KPiAgLi4uL2Rpc3BsYXkvcGFuZWwvc29ueSxhY3g0MjRha3Au
eWFtbCAgICAgICAgIHwgIDIgKy0KPiAgLi4uL2Rpc3BsYXkvcGFuZWwveGlucGVuZyx4cHAwNTVj
MjcyLnlhbWwgICAgIHwgIDQgKy0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxjbW0u
eWFtbCAgICAgICAgIHwgMTYgKystLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL3Rp
L2szLXVkbWEueWFtbCAgIHwgIDggKy0tCj4gIC4uLi9iaW5kaW5ncy9ncGlvL2JyY20seGdzLWlw
cm9jLWdwaW8ueWFtbCAgICB8ICAyICstCj4gIC4uLi9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlk
Z2FyZC55YW1sICAgICAgICB8IDE4ICsrKy0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9n
cHUvdml2YW50ZSxnYy55YW1sICAgfCAgMiArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9p
MmMvaTJjLXJrM3gueWFtbCAgICAgfCAxMCArLS0KPiAgLi4uL2JpbmRpbmdzL2lpby9hZGMvYWRp
LGFkNzEyNC55YW1sICAgICAgICAgIHwgIDQgKy0KPiAgLi4uL2JpbmRpbmdzL2lpby9hZGMvbGx0
YyxsdGMyNDk2LnlhbWwgICAgICAgIHwgIDYgKy0KPiAgLi4uL2lucHV0L2FsbHdpbm5lcixzdW40
aS1hMTAtbHJhZGMta2V5cy55YW1sIHwgIDQgKy0KPiAgLi4uL2JpbmRpbmdzL2lucHV0L3RvdWNo
c2NyZWVuL2dvb2RpeC55YW1sICAgIHwgIDIgKy0KPiAgLi4uL2JpbmRpbmdzL2ludGVyY29ubmVj
dC9xY29tLG1zbTg5MTYueWFtbCAgIHwgIDQgKy0KPiAgLi4uL2JpbmRpbmdzL2ludGVyY29ubmVj
dC9xY29tLG1zbTg5NzQueWFtbCAgIHwgIDQgKy0KPiAgLi4uL2JpbmRpbmdzL2ludGVyY29ubmVj
dC9xY29tLHFjczQwNC55YW1sICAgIHwgIDQgKy0KPiAgLi4uL2FsbHdpbm5lcixzdW43aS1hMjAt
c2Mtbm1pLnlhbWwgICAgICAgICAgIHwgMTIgKystLQo+ICAuLi4vaW50ZWwsaXhwNHh4LWludGVy
cnVwdC55YW1sICAgICAgICAgICAgICAgfCAgOCArLS0KPiAgLi4uL2ludGVycnVwdC1jb250cm9s
bGVyL3N0LHN0bTMyLWV4dGkueWFtbCAgIHwgMTIgKystLQo+ICAuLi4vYmluZGluZ3MvaW9tbXUv
c2Ftc3VuZyxzeXNtbXUueWFtbCAgICAgICAgfCAxMCArLS0KPiAgLi4uL2JpbmRpbmdzL21haWxi
b3gvc3Qsc3RtMzItaXBjYy55YW1sICAgICAgIHwgIDIgKy0KPiAgLi4uL21lZGlhL2FsbHdpbm5l
cixzdW40aS1hMTAtY3NpLnlhbWwgICAgICAgIHwgMjggKysrKy0tLS0KPiAgLi4uL2JpbmRpbmdz
L21lZGlhL2FtbG9naWMsZ3gtdmRlYy55YW1sICAgICAgIHwgMTQgKystLQo+ICAuLi4vYmluZGlu
Z3MvbWVkaWEvcmVuZXNhcyxjZXUueWFtbCAgICAgICAgICAgfCAyOCArKysrLS0tLQo+ICAuLi4v
YmluZGluZ3MvbWVkaWEvcmVuZXNhcyx2aW4ueWFtbCAgICAgICAgICAgfCAgOCArLS0KPiAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdGksdnBlLnlhbWwgICAgIHwgIDIgKy0KPiAgLi4u
L21lbW9yeS1jb250cm9sbGVycy9mc2wvaW14OG0tZGRyYy55YW1sICAgIHwgIDYgKy0KCj4gIC4u
Li9iaW5kaW5ncy9tZmQvc3Qsc3RtMzItbHB0aW1lci55YW1sICAgICAgICB8ICA0ICstCj4gIC4u
Li9iaW5kaW5ncy9tZmQvc3Qsc3RtMzItdGltZXJzLnlhbWwgICAgICAgICB8ICA0ICstCj4gIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zeXNjb24ueWFtbCAgICAgICB8IDEyICsrLS0KCkFj
a2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvbW1jL2NkbnMsc2RoY2kueWFtbCAgIHwgIDIgKy0KPiAgLi4uL2JpbmRpbmdz
L21tYy9yb2NrY2hpcC1kdy1tc2hjLnlhbWwgICAgICAgIHwgMTYgKystLS0KPiAgLi4uL2JpbmRp
bmdzL21tYy9zb2Npb25leHQsdW5pcGhpZXItc2QueWFtbCAgIHwgMTQgKystLQo+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvZGVuYWxpLG5hbmQueWFtbCAgfCAgNCArLQo+ICAuLi4vbmV0
L2FsbHdpbm5lcixzdW44aS1hODN0LWVtYWMueWFtbCAgICAgICAgfCAgNCArLQo+ICAuLi4vYmlu
ZGluZ3MvbmV0L2Nhbi9ib3NjaCxtX2Nhbi55YW1sICAgICAgICAgfCA1MiArKysrKysrLS0tLS0t
LS0KPiAgLi4uL2JpbmRpbmdzL25ldC9yZW5lc2FzLGV0aGVyLnlhbWwgICAgICAgICAgIHwgIDQg
Ky0KPiAgLi4uL2JpbmRpbmdzL25ldC90aSxjcHN3LXN3aXRjaC55YW1sICAgICAgICAgIHwgMTIg
KystLQo+ICAuLi4vYmluZGluZ3MvbmV0L3RpLGRhdmluY2ktbWRpby55YW1sICAgICAgICAgfCAy
NyArKysrLS0tLQo+ICAuLi4vYmluZGluZ3MvcGh5L2ludGVsLGxnbS1lbW1jLXBoeS55YW1sICAg
ICAgfCAgMiArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLXNhbXN1bmcueWFt
bCAgfCAxNiArKy0tLQo+ICAuLi4vYmluZGluZ3MvcmVtb3RlcHJvYy9zdCxzdG0zMi1ycHJvYy55
YW1sICAgfCAgMiArLQo+ICAuLi4vcmVzZXQvYnJjbSxiY203MjE2LXBjaWUtc2F0YS1yZXNjYWwu
eWFtbCAgfCAgNCArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvc3Qsc3RtMzItcnRj
LnlhbWwgfCAzOCArKysrKy0tLS0tLQo+ICAuLi4vYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVz
b24tdWFydC55YW1sICAgfCAxNiArKy0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJp
YWwvcnM0ODUueWFtbCAgICAgfCAxNyArKy0tLQo+ICAuLi4vYmluZGluZ3Mvc29jL2FtbG9naWMv
YW1sb2dpYyxjYW52YXMueWFtbCAgfCAxMCArLS0KPiAgLi4uL2JpbmRpbmdzL3NvdW5kL3JlbmVz
YXMsZnNpLnlhbWwgICAgICAgICAgIHwgMTYgKystLS0KPiAgLi4uL2JpbmRpbmdzL3NwaS9xY29t
LHNwaS1xY29tLXFzcGkueWFtbCAgICAgIHwgMTAgKy0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NwaS9yZW5lc2FzLGhzcGkueWFtbCB8ICA0ICstCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NwaS9zcGktcGwwMjIueWFtbCAgICB8ICAyICstCj4gIC4uLi9iaW5kaW5ncy9zcGkvc3Qs
c3RtMzItcXNwaS55YW1sICAgICAgICAgICB8ICA0ICstCj4gIC4uLi9hbGx3aW5uZXIsc3VuNGkt
YTEwLXN5c3RlbS1jb250cm9sLnlhbWwgICB8IDY0ICsrKysrKysrKy0tLS0tLS0tLS0KPiAgLi4u
L2JpbmRpbmdzL3RoZXJtYWwvYW1sb2dpYyx0aGVybWFsLnlhbWwgICAgIHwgMTAgKy0tCj4gIC4u
Li9iaW5kaW5ncy90aW1lci9hcm0sYXJjaF90aW1lci55YW1sICAgICAgICB8ICA0ICstCj4gIC4u
Li9iaW5kaW5ncy90aW1lci9hcm0sYXJjaF90aW1lcl9tbWlvLnlhbWwgICB8ICA0ICstCj4gIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9kd2MyLnlhbWwgICAgICAgICB8ICA4ICstLQo+ICA3
NyBmaWxlcyBjaGFuZ2VkLCA0NTAgaW5zZXJ0aW9ucygrKSwgNDUwIGRlbGV0aW9ucygtKQoKLS0g
CkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGlu
YXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5h
cm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
