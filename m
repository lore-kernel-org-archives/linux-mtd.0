Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51389C05027
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Feb 2023 16:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9tg12vhMDCasRl+Oj1anxAlsYtTGY6/oz5eSfT+Jx7g=; b=4qPUiAKGajp4Gf
	Sg3f8+LOSr+paDtOHa62HKbE5EaS/DfYNQTrunRuuullxeFx0/T6ZN0Lif2D7VilwnV3gcNGbjuZd
	3R6tthZzIyIH+UUTWni2LdeLRa8ZaEnS6Ect/w1h4kZvewJbW9EULlCgW0YN6xFozXpf0RiSl+eVi
	5YN5f5VK6xmG1XnGN9bdB1WVKH/IZgRWUEt2fS75CcQnNoowRDtLEDl45ifqJeFlwrC1ihQDF+pyE
	CN9AUUcyWSu3a0gj5voMlpH2xkZiDwlVcW/3s48rbcut7cXtZ/wGHbTefoYJr2my6d5eceEUJi9RQ
	a2/4dEpxECm31qozrgbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcdm-00GglC-Cx; Thu, 02 Feb 2023 16:40:50 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcdh-00Ggiu-4V; Thu, 02 Feb 2023 16:40:46 +0000
Received: by mail-ej1-x629.google.com with SMTP id ml19so7791631ejb.0;
        Thu, 02 Feb 2023 08:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JxadcUmstQQisxG5SMmC/yE89rXvA6AYxcU2YUnVDQ=;
        b=F0H3B8NAgseBrYAc9OhvFrrJcHUs5RxsmEgusiWeYI4oHZkbOFHj9Ncu15Uvbi4tCO
         GCoGClEA/o94QYw0U1UfeOAEL80uwq+5tCfPJWGsWnHH8HpmO1lWGzeCrAsIdF4Fu6zR
         kNR+WhBg1xqNyaBWvq3l+bklN9GSWeF5rkZflnjP5JjP6Pm7phnd2Ab56G7cA8boFLp0
         xzt+aopsRq/bEYAtjRCwCMmTji3jBwX9xCOCD4tzAC2fkbovQWodfYFH0SLzujYlkR2S
         3SeXJQSQvZdrRrWbPhPWjXi7p2pGkVjdnp+X80CVTlvacpypSO18F0i1MgCSG84IgzXR
         jpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JxadcUmstQQisxG5SMmC/yE89rXvA6AYxcU2YUnVDQ=;
        b=1gDFr5xPxO6RUuFBZf1UQKp3vlCvMzV7z11KOVLQkDZujKDRikr1ikD5B7A8h/R7H5
         Dt9u/G82NZbhpBWDRURI+KOZHVzA2xm1IgqwIxftz8HHwWkm4wQPep62C/0y+NRFYW83
         FQc2kkgKI/nZOGCWPs4Z24vMZsygbMwkz5ticXnz7rkxpYPklKwCVgTXyu5tJMtbcNkd
         sgQ1IxM4a/asmLEfda6O8dgcRVY94h4dfSolax8WyXD9eiwlCbPcfuGSEEdWRFukUQIr
         WJUBpjnkT9/vOLBHg14MTRoNZSu2sueRWeBQdkL1fzGIWvxh6ux5Yit4kcZp5H0IMj97
         vSGA==
X-Gm-Message-State: AO0yUKWgJpfk/QxyPRgCV4KtKMqTk4GQgBrLqJeYPHAe8tbfjpbbJz9F
	NZ+EjVjkljU20DKQm8OmP8I=
X-Google-Smtp-Source: AK7set8DElzpOFybgSqmpPkVSDP76pQ9uMXg+BggB0EZ9TIGd1XdSGpOOvGTm4L9iJVvil59yp3mTw==
X-Received: by 2002:a17:906:c156:b0:88d:ba89:1835 with SMTP id dp22-20020a170906c15600b0088dba891835mr2844484ejc.6.1675356040636;
        Thu, 02 Feb 2023 08:40:40 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id by13-20020a0564021b0d00b004a277d55a6csm3387108edb.1.2023.02.02.08.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 08:40:40 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: broonie@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, jic23@kernel.org, tudor.ambarus@microchip.com,
 pratyush@kernel.org, sanju.mehta@amd.com, chin-ting_kuo@aspeedtech.com,
 clg@kaod.org, kdasu.kdev@gmail.com, f.fainelli@gmail.com, rjui@broadcom.com,
 sbranden@broadcom.com, eajames@linux.ibm.com, olteanv@gmail.com,
 han.xu@nxp.com, john.garry@huawei.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, narmstrong@baylibre.com, khilman@baylibre.com,
 matthias.bgg@gmail.com, haibo.chen@nxp.com, linus.walleij@linaro.org,
 daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
 agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de,
 krzysztof.kozlowski@linaro.org, andi@etezian.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, samuel@sholland.org,
 masahisa.kojima@linaro.org, jaswinder.singh@linaro.org, rostedt@goodmis.org,
 mingo@redhat.com, l.stelmach@samsung.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 alex.aring@gmail.com, stefan@datenfreihafen.org, kvalo@kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, palmer@dabbelt.com
Cc: git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com,
 fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org,
 alim.akhtar@samsung.com, ldewangan@nvidia.com, thierry.reding@gmail.com,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 netdev@vger.kernel.org, linux-wpan@vger.kernel.org,
 libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject:  Re: [PATCH v3 01/13] spi: Replace all spi->chip_select and spi->cs_gpiod
 references with function call
Date: Thu, 02 Feb 2023 17:40:35 +0100
Message-ID: <4802797.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230202152258.512973-2-amit.kumar-mahapatra@amd.com>
References:  <20230202152258.512973-1-amit.kumar-mahapatra@amd.com>
 <20230202152258.512973-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_084045_228293_E2F3FA10 
X-CRM114-Status: GOOD (  14.38  )
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

SGkhCgpEbmUgxI1ldHJ0ZWssIDAyLiBmZWJydWFyIDIwMjMgb2IgMTY6MjI6NDYgQ0VUIGplIEFt
aXQgS3VtYXIgTWFoYXBhdHJhIApuYXBpc2FsKGEpOgo+IFN1cHBvcnRpbmcgbXVsdGktY3MgaW4g
c3BpIGRyaXZlcnMgd291bGQgcmVxdWlyZSB0aGUgY2hpcF9zZWxlY3QgJiBjc19ncGlvZAo+IG1l
bWJlcnMgb2Ygc3RydWN0IHNwaV9kZXZpY2UgdG8gYmUgYW4gYXJyYXkuIEJ1dCBjaGFuZ2luZyB0
aGUgdHlwZSBvZiB0aGVzZQo+IG1lbWJlcnMgdG8gYXJyYXkgd291bGQgYnJlYWsgdGhlIHNwaSBk
cml2ZXIgZnVuY3Rpb25hbGl0eS4gVG8gbWFrZSB0aGUKPiB0cmFuc2l0aW9uIHNtb290aGVyIGlu
dHJvZHVjZWQgZm91ciBuZXcgQVBJcyB0byBnZXQvc2V0IHRoZQo+IHNwaS0+Y2hpcF9zZWxlY3Qg
JiBzcGktPmNzX2dwaW9kIGFuZCByZXBsYWNlZCBhbGwgc3BpLT5jaGlwX3NlbGVjdCBhbmQKPiBz
cGktPmNzX2dwaW9kIHJlZmVyZW5jZXMgd2l0aCBnZXQgb3Igc2V0IEFQSSBjYWxscy4KPiBXaGls
ZSBhZGRpbmcgbXVsdGktY3Mgc3VwcG9ydCBpbiBmdXJ0aGVyIHBhdGNoZXMgdGhlIGNoaXBfc2Vs
ZWN0ICYgY3NfZ3Bpb2QKPiBtZW1iZXJzIG9mIHRoZSBzcGlfZGV2aWNlIHN0cnVjdHVyZSB3b3Vs
ZCBiZSBjb252ZXJ0ZWQgdG8gYXJyYXlzICYgdGhlCj4gImlkeCIgcGFyYW1ldGVyIG9mIHRoZSBB
UElzIHdvdWxkIGJlIHVzZWQgYXMgYXJyYXkgaW5kZXggaS5lLiwKPiBzcGktPmNoaXBfc2VsZWN0
W2lkeF0gJiBzcGktPmNzX2dwaW9kW2lkeF0gcmVzcGVjdGl2ZWx5Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFtaXQgS3VtYXIgTWFoYXBhdHJhIDxhbWl0Lmt1bWFyLW1haGFwYXRyYUBhbWQuY29tPgo+
IEFja2VkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPiAjIFJvY2tjaGlwIGRy
aXZlcnMKPiBSZXZpZXdlZC1ieTogTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT4K
PiBSZXZpZXdlZC1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4gIyBBc3BlZWQg
ZHJpdmVyCj4gUmV2aWV3ZWQtYnk6IERocnV2YSBHb2xlIDxkLWdvbGVAdGkuY29tPiAjIFNQSSBD
YWRlbmNlIFFTUEkKPiBSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3Rh
cmRAZm9zcy5zdC5jb20+ICMgc3BpLXN0bTMyLXFzcGkKPiBBY2tlZC1ieTogV2lsbGlhbSBaaGFu
ZyA8d2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20+ICMgYmNtNjN4eC1oc3NwaSBkcml2ZXIKPiAt
LS0KPiAgZHJpdmVycy9zcGkvc3BpLWFsdGVyYS1jb3JlLmMgICAgIHwgIDIgKy0KPiAgZHJpdmVy
cy9zcGkvc3BpLWFtZC5jICAgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3NwaS9zcGkt
YXI5MzR4LmMgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3NwaS9zcGktYXJtYWRhLTM3MDAu
YyAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMgICAgICB8IDEz
ICsrKysrKystLS0tLS0KPiAgZHJpdmVycy9zcGkvc3BpLWF0OTEtdXNhcnQuYyAgICAgIHwgIDIg
Ky0KPiAgZHJpdmVycy9zcGkvc3BpLWF0aDc5LmMgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2
ZXJzL3NwaS9zcGktYXRtZWwuYyAgICAgICAgICAgfCAyNiArKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLQo+ICBkcml2ZXJzL3NwaS9zcGktYXUxNTUwLmMgICAgICAgICAgfCAgNCArKy0tCj4gIGRy
aXZlcnMvc3BpL3NwaS1heGktc3BpLWVuZ2luZS5jICB8ICAyICstCj4gIGRyaXZlcnMvc3BpL3Nw
aS1iY20tcXNwaS5jICAgICAgICB8IDEwICsrKysrLS0tLS0KPiAgZHJpdmVycy9zcGkvc3BpLWJj
bTI4MzUuYyAgICAgICAgIHwgMTkgKysrKysrKysrKy0tLS0tLS0tLQo+ICBkcml2ZXJzL3NwaS9z
cGktYmNtMjgzNWF1eC5jICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvc3BpL3NwaS1iY202M3h4
LWhzc3BpLmMgICB8IDIyICsrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9zcGkvc3Bp
LWJjbTYzeHguYyAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVh
ZHNwaS5jIHwgIDUgKysrLS0KPiAgZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UteHNwaS5jICAgIHwg
IDQgKystLQo+ICBkcml2ZXJzL3NwaS9zcGktY2FkZW5jZS5jICAgICAgICAgfCAgNCArKy0tCj4g
IGRyaXZlcnMvc3BpL3NwaS1jYXZpdW0uYyAgICAgICAgICB8ICA4ICsrKystLS0tCj4gIGRyaXZl
cnMvc3BpL3NwaS1jb2xkZmlyZS1xc3BpLmMgICB8ICA4ICsrKystLS0tCj4gIGRyaXZlcnMvc3Bp
L3NwaS1kYXZpbmNpLmMgICAgICAgICB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQo+ICBkcml2ZXJz
L3NwaS9zcGktZGxuMi5jICAgICAgICAgICAgfCAgNiArKystLS0KPiAgZHJpdmVycy9zcGkvc3Bp
LWR3LWNvcmUuYyAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9zcGkvc3BpLWR3LW1taW8uYyAg
ICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3NwaS9zcGktZmFsY29uLmMgICAgICAgICAgfCAg
MiArLQo+ICBkcml2ZXJzL3NwaS9zcGktZnNpLmMgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2
ZXJzL3NwaS9zcGktZnNsLWRzcGkuYyAgICAgICAgfCAxNiArKysrKysrKy0tLS0tLS0tCj4gIGRy
aXZlcnMvc3BpL3NwaS1mc2wtZXNwaS5jICAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL3Nw
aS9zcGktZnNsLWxwc3BpLmMgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3NwaS9zcGktZnNsLXFz
cGkuYyAgICAgICAgfCAgNiArKystLS0KPiAgZHJpdmVycy9zcGkvc3BpLWZzbC1zcGkuYyAgICAg
ICAgIHwgIDIgKy0KPiAgZHJpdmVycy9zcGkvc3BpLWdlbmktcWNvbS5jICAgICAgIHwgIDYgKysr
LS0tCj4gIGRyaXZlcnMvc3BpL3NwaS1ncGlvLmMgICAgICAgICAgICB8ICA0ICsrLS0KPiAgZHJp
dmVycy9zcGkvc3BpLWd4cC5jICAgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3NwaS9z
cGktaGlzaS1zZmMtdjN4eC5jICAgfCAgMiArLQo+ICBkcml2ZXJzL3NwaS9zcGktaW1nLXNwZmku
YyAgICAgICAgfCAxNCArKysrKysrLS0tLS0tLQo+ICBkcml2ZXJzL3NwaS9zcGktaW14LmMgICAg
ICAgICAgICAgfCAzMCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9z
cGkvc3BpLWluZ2VuaWMuYyAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3NwaS9zcGktaW50
ZWwuYyAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3NwaS9zcGktamNvcmUuYyAgICAgICAg
ICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvc3BpL3NwaS1sYW50aXEtc3NjLmMgICAgICB8ICA2ICsr
Ky0tLQo+ICBkcml2ZXJzL3NwaS9zcGktbWVtLmMgICAgICAgICAgICAgfCAgNCArKy0tCj4gIGRy
aXZlcnMvc3BpL3NwaS1tZXNvbi1zcGljYy5jICAgICB8ICAyICstCj4gIGRyaXZlcnMvc3BpL3Nw
aS1taWNyb2NoaXAtY29yZS5jICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL3NwaS9zcGktbXBjNTEy
eC1wc2MuYyAgICAgfCAgOCArKysrLS0tLQo+ICBkcml2ZXJzL3NwaS9zcGktbXBjNTJ4eC5jICAg
ICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3NwaS9zcGktbXQ2NXh4LmMgICAgICAgICAgfCAgNiAr
KystLS0KPiAgZHJpdmVycy9zcGkvc3BpLW10NzYyMS5jICAgICAgICAgIHwgIDIgKy0KPiAgZHJp
dmVycy9zcGkvc3BpLW11eC5jICAgICAgICAgICAgIHwgIDggKysrKy0tLS0KPiAgZHJpdmVycy9z
cGkvc3BpLW14aWMuYyAgICAgICAgICAgIHwgMTAgKysrKystLS0tLQo+ICBkcml2ZXJzL3NwaS9z
cGktbXhzLmMgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3NwaS9zcGktbnBjbS1maXUu
YyAgICAgICAgfCAyMCArKysrKysrKysrLS0tLS0tLS0tLQo+ICBkcml2ZXJzL3NwaS9zcGktbnhw
LWZzcGkuYyAgICAgICAgfCAxMCArKysrKy0tLS0tCj4gIGRyaXZlcnMvc3BpL3NwaS1vbWFwLTEw
MGsuYyAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvc3BpL3NwaS1vbWFwLXV3aXJlLmMgICAgICB8
ICA4ICsrKystLS0tCj4gIGRyaXZlcnMvc3BpL3NwaS1vbWFwMi1tY3NwaS5jICAgICB8IDI0ICsr
KysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL3NwaS9zcGktb3Jpb24uYyAgICAgICAg
ICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvc3BpL3NwaS1wY2kxeHh4eC5jICAgICAgICB8ICA0ICsr
LS0KPiAgZHJpdmVycy9zcGkvc3BpLXBpYzMyLXNxaS5jICAgICAgIHwgIDIgKy0KPiAgZHJpdmVy
cy9zcGkvc3BpLXBpYzMyLmMgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3NwaS9zcGkt
cGwwMjIuYyAgICAgICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvc3BpL3NwaS1weGEyeHguYyAg
ICAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL3NwaS9zcGktcWNvbS1xc3BpLmMgICAgICAg
fCAgMiArLQo+ICBkcml2ZXJzL3NwaS9zcGktcmI0eHguYyAgICAgICAgICAgfCAgMiArLQo+ICBk
cml2ZXJzL3NwaS9zcGktcm9ja2NoaXAtc2ZjLmMgICAgfCAgMiArLQo+ICBkcml2ZXJzL3NwaS9z
cGktcm9ja2NoaXAuYyAgICAgICAgfCAyNiArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICBk
cml2ZXJzL3NwaS9zcGktcnNwaS5jICAgICAgICAgICAgfCAxMCArKysrKy0tLS0tCj4gIGRyaXZl
cnMvc3BpL3NwaS1zM2M2NHh4LmMgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvc3BpL3NwaS1z
YzE4aXM2MDIuYyAgICAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9zcGkvc3BpLXNoLW1zaW9mLmMg
ICAgICAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvc3BpL3NwaS1zaC1zY2kuYyAgICAgICAgICB8
ICAyICstCj4gIGRyaXZlcnMvc3BpL3NwaS1zaWZpdmUuYyAgICAgICAgICB8ICA2ICsrKy0tLQo+
ICBkcml2ZXJzL3NwaS9zcGktc24tZi1vc3BpLmMgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3Nw
aS9zcGktc3Qtc3NjNC5jICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3NwaS9zcGktc3RtMzIt
cXNwaS5jICAgICAgfCAxMiArKysrKystLS0tLS0KPiAgZHJpdmVycy9zcGkvc3BpLXN1bjRpLmMg
ICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9zcGkvc3BpLXN1bjZpLmMgICAgICAgICAgIHwg
IDIgKy0KCkZvciBzdW40aSwgc3VuNmk6CkFja2VkLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVq
LnNrcmFiZWNAZ21haWwuY29tPgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCj4gIGRyaXZlcnMvc3Bp
L3NwaS1zeW5xdWFjZXIuYyAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL3NwaS9zcGktdGVn
cmExMTQuYyAgICAgICAgfCAyOCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gIGRyaXZl
cnMvc3BpL3NwaS10ZWdyYTIwLXNmbGFzaC5jICB8ICAyICstCj4gIGRyaXZlcnMvc3BpL3NwaS10
ZWdyYTIwLXNsaW5rLmMgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL3NwaS9zcGktdGVncmEyMTAt
cXVhZC5jICAgfCAgOCArKysrLS0tLQo+ICBkcml2ZXJzL3NwaS9zcGktdGktcXNwaS5jICAgICAg
ICAgfCAxNiArKysrKysrKy0tLS0tLS0tCj4gIGRyaXZlcnMvc3BpL3NwaS10b3BjbGlmZi1wY2gu
YyAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9zcGkvc3BpLXdwY20tZml1LmMgICAgICAgIHwgMTIg
KysrKysrLS0tLS0tCj4gIGRyaXZlcnMvc3BpL3NwaS14Y29tbS5jICAgICAgICAgICB8ICAyICst
Cj4gIGRyaXZlcnMvc3BpL3NwaS14aWxpbnguYyAgICAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2
ZXJzL3NwaS9zcGkteGxwLmMgICAgICAgICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvc3BpL3Nw
aS16eW5xLXFzcGkuYyAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvc3BpL3NwaS16eW5xbXAtZ3Fz
cGkuYyAgICB8ICAyICstCj4gIGRyaXZlcnMvc3BpL3NwaWRldi5jICAgICAgICAgICAgICB8ICA2
ICsrKy0tLQo+ICBpbmNsdWRlL3RyYWNlL2V2ZW50cy9zcGkuaCAgICAgICAgfCAxMCArKysrKy0t
LS0tCj4gIDkyIGZpbGVzIGNoYW5nZWQsIDMxNSBpbnNlcnRpb25zKCspLCAzMTAgZGVsZXRpb25z
KC0pCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
