Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57621C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 15:05:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B3B60462
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 15:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27B3B60462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MqGFhrCN7y/dMM30XIadi9raj2Zwe91IYVjsW/qxIX4=; b=Ru250Jhn+mCwVxdphugL4d38V7
	uHyoIFypWhOGcYH7hGrE7d+ojx7kMZxmLZ5Zv/x1OLsBI2PS/8dGi4mj34ImQ5p7kdnFDCDmNhNqA
	pnbWvMLNMPtPGXQsIbULvqTNqKm+aciFx9ldQVI6RoH/Yggepg/yGIAYbwQEeZEpK2+hFrYpKLmj9
	v7Xi3MqH1iwggg2rNjxLuaiz2gnBnEG8LkIzL+NoQN3jkcR9qCpeq6U0HEL1PXy88PtTIb9PgUQ/u
	S0v2csZbBQHQlbzL1qWugXYd04PfSVI13vRWgqMhGFwx9oHmdv2F8LiAHGAhH0E8gsu2OZFJmYEJC
	rwhUptCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGN83-005yr4-Bi; Wed, 18 Aug 2021 15:05:19 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGN7z-005ypT-B2
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 15:05:16 +0000
Received: by mail-lf1-x12c.google.com with SMTP id p38so5410993lfa.0
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 08:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EQRno5vnhRrA4KOIe4lh21xpnTcUCE7c8mZkK4K3e/s=;
 b=bctcyrsCVgDi+5GWndAxItidHxjnjBsVRd2v4YKwpkUHVQsHKnjigYdInqM2sgY1jW
 LU4Jh4S1KHwJCYIkKwBJjhzwLsETLbQkJYV1xEK2qpiOA9qIvjGJ85a1PWeULSrkn7ia
 r4YL+HceQmir1Ln3MEYBETrNrkGE0PBwh8aiSMQBVsqOxRDV4MqEJVC2Fc1LaStgvxPt
 W3s2UizOnemCr1DOdNPZ7ESGcn979rYje4A7UuCWFTbZSEZZ9derc8SEFxG1dwb3evmY
 p5hMm0n+7AZq9124uwrFB026HSrZdidoIm/IsypAkwON8b5y75L7iYAKeoihIJ13XqMQ
 VQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EQRno5vnhRrA4KOIe4lh21xpnTcUCE7c8mZkK4K3e/s=;
 b=GV8CRUoNWcTMXAgiledqnRRPkDoKpcqU8WPD4/f6tc1YX9Y3wDx5Kv1oI7jTT36GX8
 l+HENtV5OgO6fEiw56CUL2x1KPFxuBO5Nx8hmVB/rJTgpoqFHT74w7rIPBvi+CNeEjz9
 /T5JhfSsjLG9gHjnjrfqmphDYYz8GEa4+oyfNoxlMt9Cd3PUUs54J3LruRpbWmnOpNmO
 4L1pxkyKE4WM5Fc23d6ZIuLILBJBltFUJCB9RwH2SkusODfIOfu9OtRbD8SCGOg9+xiu
 kcM7Cu9dnHN5kfFRCMU3FghyUcYPcMClhtMGLQIvuDMvMeXMCkfxQoyogGuXYrDv0EVM
 pX/g==
X-Gm-Message-State: AOAM533v8H2N8tp7oMCmmmNNmY0mlq89OWXAPcEk68HlzmJkM/KvgTp3
 C75D2JBvw2bwmbVZnuCNjqE=
X-Google-Smtp-Source: ABdhPJyr5YxrN+b1RGtkQEvSYdwTBm71o8Ulw3lRJisRIIBg/FeSpE62xIZBaNIXj4QafSUTN0OIhA==
X-Received: by 2002:a19:430a:: with SMTP id q10mr6797932lfa.378.1629299113790; 
 Wed, 18 Aug 2021 08:05:13 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id bn16sm12055ljb.74.2021.08.18.08.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 08:05:12 -0700 (PDT)
Subject: Re: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-7-digetx@gmail.com> <YR0SSz7KMh7TwaFW@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <eff5ef47-e6e0-3e03-cf1a-d931b0f2dc2a@gmail.com>
Date: Wed, 18 Aug 2021 18:05:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR0SSz7KMh7TwaFW@orome.fritz.box>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_080515_433962_FCA926C9 
X-CRM114-Status: GOOD (  31.38  )
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

MTguMDguMjAyMSAxNjo1OSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBUdWUsIEF1
ZyAxNywgMjAyMSBhdCAwNDoyNzoyNkFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IERvY3VtZW50IHRlZ3JhLWNsb2NrcyBzdWItbm9kZSB3aGljaCBkZXNjcmliZXMgVGVncmEgU29D
IGNsb2NrcyB0aGF0Cj4+IHJlcXVpcmUgYSBoaWdoZXIgdm9sdGFnZSBvZiB0aGUgY29yZSBwb3dl
ciBkb21haW4gaW4gb3JkZXIgdG8gb3BlcmF0ZQo+PiBwcm9wZXJseSBvbiBhIGhpZ2hlciBjbG9j
ayByYXRlcy4gIEVhY2ggbm9kZSBjb250YWlucyBhIHBoYW5kbGUgdG8gT1BQCj4+IHRhYmxlIGFu
ZCBwb3dlciBkb21haW4uCj4+Cj4+IFRoZSByb290IFBMTHMgYW5kIHN5c3RlbSBjbG9ja3MgZG9u
J3QgaGF2ZSBhbnkgc3BlY2lmaWMgZGV2aWNlIGRlZGljYXRlZAo+PiB0byB0aGVtLCBjbG9jayBj
b250cm9sbGVyIGlzIGluIGNoYXJnZSBvZiBtYW5hZ2luZyBwb3dlciBmb3IgdGhlbS4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+PiAtLS0K
Pj4gIC4uLi9iaW5kaW5ncy9jbG9jay9udmlkaWEsdGVncmEyMC1jYXIueWFtbCAgICB8IDUxICsr
KysrKysrKysrKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspCj4+
Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2sv
bnZpZGlhLHRlZ3JhMjAtY2FyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvY2xvY2svbnZpZGlhLHRlZ3JhMjAtY2FyLnlhbWwKPj4gaW5kZXggNDU5ZDJhNTI1MzkzLi43
ZjVjZDI3ZTRjZTAgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9jbG9jay9udmlkaWEsdGVncmEyMC1jYXIueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svbnZpZGlhLHRlZ3JhMjAtY2FyLnlhbWwKPj4gQEAg
LTQyLDYgKzQyLDQ4IEBAIHByb3BlcnRpZXM6Cj4+ICAgICIjcmVzZXQtY2VsbHMiOgo+PiAgICAg
IGNvbnN0OiAxCj4+ICAKPj4gKyAgdGVncmEtY2xvY2tzOgo+PiArICAgIGRlc2NyaXB0aW9uOiBj
aGlsZCBub2RlcyBhcmUgdGhlIG91dHB1dCBjbG9ja3MgZnJvbSB0aGUgQ0FSCj4+ICsgICAgdHlw
ZTogb2JqZWN0Cj4+ICsKPj4gKyAgICBwYXR0ZXJuUHJvcGVydGllczoKPj4gKyAgICAgICJeW2Et
el0rWzAtOV0rJCI6Cj4+ICsgICAgICAgIHR5cGU6IG9iamVjdAo+PiArICAgICAgICBwcm9wZXJ0
aWVzOgo+PiArICAgICAgICAgIGNvbXBhdGlibGU6Cj4+ICsgICAgICAgICAgICBhbGxPZjoKPj4g
KyAgICAgICAgICAgICAgLSBpdGVtczoKPj4gKyAgICAgICAgICAgICAgICAgIC0gZW51bToKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAtIG52aWRpYSx0ZWdyYTIwLXNjbGsKPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAtIG52aWRpYSx0ZWdyYTMwLXNjbGsKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAtIG52aWRpYSx0ZWdyYTMwLXBsbGMKPj4gKyAgICAgICAgICAgICAgICAgICAgICAtIG52
aWRpYSx0ZWdyYTMwLXBsbGUKPj4gKyAgICAgICAgICAgICAgICAgICAgICAtIG52aWRpYSx0ZWdy
YTMwLXBsbG0KPj4gKyAgICAgICAgICAgICAgLSBjb25zdDogbnZpZGlhLHRlZ3JhLWNsb2NrCj4+
ICsKPj4gKyAgICAgICAgICBvcGVyYXRpbmctcG9pbnRzLXYyOgo+PiArICAgICAgICAgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+PiArICAgICAgICAg
ICAgZGVzY3JpcHRpb246Cj4+ICsgICAgICAgICAgICAgIFBoYW5kbGUgdG8gT1BQIHRhYmxlIHRo
YXQgY29udGFpbnMgZnJlcXVlbmNpZXMsIHZvbHRhZ2VzIGFuZAo+PiArICAgICAgICAgICAgICBv
cHAtc3VwcG9ydGVkLWh3IHByb3BlcnR5LCB3aGljaCBpcyBhIGJpdGZpZWxkIGluZGljYXRpbmcK
Pj4gKyAgICAgICAgICAgICAgU29DIHByb2Nlc3Mgb3Igc3BlZWRvIElEIG1hc2suCj4+ICsKPj4g
KyAgICAgICAgICBjbG9ja3M6Cj4+ICsgICAgICAgICAgICBpdGVtczoKPj4gKyAgICAgICAgICAg
ICAgLSBkZXNjcmlwdGlvbjogbm9kZSdzIGNsb2NrCj4+ICsKPj4gKyAgICAgICAgICBwb3dlci1k
b21haW5zOgo+PiArICAgICAgICAgICAgbWF4SXRlbXM6IDEKPj4gKyAgICAgICAgICAgIGRlc2Ny
aXB0aW9uOiBwaGFuZGxlIHRvIHRoZSBjb3JlIFNvQyBwb3dlciBkb21haW4KPj4gKwo+PiArICAg
ICAgICByZXF1aXJlZDoKPj4gKyAgICAgICAgICAtIGNvbXBhdGlibGUKPj4gKyAgICAgICAgICAt
IG9wZXJhdGluZy1wb2ludHMtdjIKPj4gKyAgICAgICAgICAtIGNsb2Nrcwo+PiArICAgICAgICAg
IC0gcG93ZXItZG9tYWlucwo+PiArCj4+ICsgICAgICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQo+PiArCj4+ICByZXF1aXJlZDoKPj4gICAgLSBjb21wYXRpYmxlCj4+ICAgIC0gcmVnCj4+
IEBAIC01OSw2ICsxMDEsMTUgQEAgZXhhbXBsZXM6Cj4+ICAgICAgICAgIHJlZyA9IDwweDYwMDA2
MDAwIDB4MTAwMD47Cj4+ICAgICAgICAgICNjbG9jay1jZWxscyA9IDwxPjsKPj4gICAgICAgICAg
I3Jlc2V0LWNlbGxzID0gPDE+Owo+PiArCj4+ICsgICAgICAgIHRlZ3JhLWNsb2NrcyB7Cj4+ICsg
ICAgICAgICAgICBzY2xrIHsKPj4gKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm52aWRp
YSx0ZWdyYTIwLXNjbGsiLCAibnZpZGlhLHRlZ3JhLWNsb2NrIjsKPj4gKyAgICAgICAgICAgICAg
ICBvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZvcHBfdGFibGU+Owo+PiArICAgICAgICAgICAgICAg
IGNsb2NrcyA9IDwmdGVncmFfY2FyIFRFR1JBMjBfQ0xLX1NDTEs+Owo+PiArICAgICAgICAgICAg
ICAgIHBvd2VyLWRvbWFpbnMgPSA8JmRvbWFpbj47Cj4+ICsgICAgICAgICAgICB9Owo+PiArICAg
ICAgICB9Owo+IAo+IEkgd29uZGVyIGlmIGl0J2QgYmUgYmV0dGVyIHRvIG1hdGNoIG9uIHRoZSBu
YW1lIG9mIHRoZSBub2RlIHJhdGhlciB0aGFuCj4gYWRkIGFuIGFydGlmaWNpYWwgY29tcGF0aWJs
ZSBzdHJpbmcuIFdlIHVzdWFsbHkgdXNlIHRoZSBjb21wYXRpYmxlCj4gc3RyaW5nIHRvIG1hdGNo
IGEgZGV2aWNlLCBidXQgaGVyZSB5b3UncmUgcmVhbGx5IHRyeWluZyB0byBhZGQKPiBpbmZvcm1h
dGlvbiBhYm91dCBhIHJlc291cmNlIHByb3ZpZGVkIGJ5IHRoZSBDQVIgY29udHJvbGxlci4KPiAK
PiBXZSBkbyBzaW1pbGFyIHRoaW5ncyBmb3IgZXhhbXBsZSBpbiBQTUlDIGJpbmRpbmdzIHdoZXJl
IHRoZSBpbmRpdmlkdWFsCj4gcmVndWxhdG9ycyBhcmUgcmVwcmVzZW50ZWQgaW4gdGhlIGRldmlj
ZSB0cmVlIHZpYSBub2RlcyBuYW1lZCBhZnRlciB0aGUKPiByZWd1bGF0b3IuCj4gCj4gWW91IGNv
dWxkIHRoZW4gYWxzbyBsZWF2ZSBvdXQgdGhlIGNsb2NrcyBwcm9wZXJ0eSwgd2hpY2ggaXMgd2Vp
cmQgYXMgaXQKPiBpcyBiZWNhdXNlIGl0J3MgYmFzaWNhbGx5IGEgc2VsZi1yZWZlcmVuY2UuIEJ1
dCB5b3UgZG9uJ3QgcmVhbGx5IG5lZWQKPiB0aGUgcmVmZXJlbmNlIGhlcmUgaW4gdGhlIGZpcnN0
IHBsYWNlIGJlY2F1c2UgdGhlIENBUiBpcyBhbHJlYWR5IHRoZQo+IHBhcmVudCBvZiBTQ0xLLgoK
V2UgZG9uJ3QgaGF2ZSBhIHBsYXRmb3JtIGRldmljZSBmb3IgQ2FSLiBJIGRvbid0IHNlZSBob3cg
aXQncyBnb2luZyB0bwp3b3JrLiBXZSBuZWVkIHRvIGNyZWF0ZSBhIHBsYXRmb3JtIGRldmljZSBm
b3IgZWFjaCBSUE0tY2FwYWJsZSBjbG9jawpiZWNhdXNlIHRoYXQncyBob3cgUlBNIHdvcmtzLiBU
aGUgY29tcGF0aWJsZSBzdHJpbmcgaXMgcmVxdWlyZWQgZm9yCmluc3RhbnRpYXRpbmcgT0YtZGV2
aWNlcyBmcm9tIGEgbm9kZSwgb3RoZXJ3aXNlIHdlIHdpbGwgaGF2ZSB0bwpyZS1pbnZlbnQgdGhl
IE9GIGNvcmUuCgo+IEFsc28sIEkgZG9uJ3QgdGhpbmsgdGhlIHRlZ3JhLSBwcmVmaXggaXMgbmVj
ZXNzYXJ5IGhlcmUuIFRoZSBwYXJlbnQgbm9kZQo+IGlzIGFscmVhZHkgaWRlbnRpZmllZCBhcyBU
ZWdyYSB2aWEgdGhlIGNvbXBhdGlibGUgc3RyaW5nLgo+IAo+IEluIHRoZSBjYXNlIG9mIENBUiwg
SSdkIGltYWdpbmUgc29tZXRoaW5nIGxpa2U6Cj4gCj4gCWNsb2NrcyB7Cj4gCQlzY2xrIHsKPiAJ
CQlvcGVyYXRpbmctcG9pbnRzLXYyID0gPCZvcHBfdGFibGU+Owo+IAkJCXBvd2VyLWRvbWFpbnMg
PSA8JmRvbWFpbj47Cj4gCQl9Owo+IAl9Owo+IAo+IE5vdyB5b3UndmUgb25seSBnb3QgdGhlIGJh
cmUgbWluaW11bSBpbiBoZXJlIHRoYXQgeW91IGFjdHVhbGx5IGFkZC4gQWxsCj4gdGhlIG90aGVy
IGRhdGEgdGhhdCB5b3UgdXNlZCB0byBoYXZlIGlzIHNpbXBseSBkZXJpdmVkIGZyb20gdGhlIHBh
cmVudC4KCidjbG9ja3MnIGlzIGFscmVhZHkgYSBnZW5lcmljIGtleXdvcmQgaW4gRFQuIEl0J3Mg
cHJvYmFibHkgbm90IG9rYXkgdG8KcmVkZWZpbmUgaXQuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
