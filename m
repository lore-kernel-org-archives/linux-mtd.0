Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63B4C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 10:46:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 930EF2071E
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 10:46:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ohgMsSg4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UskvNm3E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 930EF2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hUSp2YiyHtKDMdVim0/IDWgJI9anDOTjOE5qUOXwAas=; b=ohgMsSg4xiOdBoKe7oe9dC0gD
	ok/UVhJmEPggjs1GuUCqy7Dnwj+muJSsuDikt56i7UPqUCB/PH9+pStVIQk6fXZd8H8mIktTwntL2
	dN1xaUZ7iAakU81fNBDqTRb3lZZbYhkP6K7H/6NcjETrk+bZN4rupdZgMVzIIogMM/W5oq9r8t0FK
	mV1TXqWwTEV/BzaF3a+tv5DWAbG1MK9wN182RqS093fvce/b0MLKGnMeCxdwY6m85wbpF/OSSneIu
	YQ7KmePReLzeEbA5w8JHzEY4c7vHXPajLtlPIyWQpw1+S3/Ik/TsuMFmK26c7MFfJslNOJudLya+q
	TaZJEksoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA9z5-000446-GR; Mon, 24 Aug 2020 10:45:51 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA9z3-00043O-31; Mon, 24 Aug 2020 10:45:50 +0000
Received: by mail-ej1-x641.google.com with SMTP id oz20so6299875ejb.5;
 Mon, 24 Aug 2020 03:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f6wdlEKoq+5Slr+UsziPsdyk2CY1PCYDCcZCpyAdvwo=;
 b=UskvNm3ErsbR8Pp/wFDQea/LOjrsQ4lwIZJjMWNn1JqQJYresYEAPXPejRzFL60qex
 VE2PGxG3z8KRswRMmM0oKcJxH4wfLw5UvtX4JnyAUPoKWu9sxdm0qD/ddj2zaeo5vMgE
 KZeoYRVzeupKX/SneIEZ9AqQDO61XOR3UAzcYoPFcwipi1OS8bSVvAxM+lct67wWGrRQ
 WoFGfSl7GIm+5MgTB/3tGzC54KHwQhZaDXdU/hYA/29sWSYgsMo2Xqb3cBh5O/NmY5R9
 K9vbAnDlVC3IpZUgmny3LW/UUBYTGqa+eXFV+oY6U5DqQJs1C4JQPbuhL3NgHMj6ka9y
 dPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f6wdlEKoq+5Slr+UsziPsdyk2CY1PCYDCcZCpyAdvwo=;
 b=s6jeuXtsPLgO/Ph2fTXBB1xouZkGdQ3rlmAomCUv0zi5R/QI/sa4WfgGxT0lzrg4oP
 6EqUHZUVJhdy24Bc1F2kCB5S/I4i/IOKZ18wdNG258C+JKiwr8ABI17ku8ZDg2Bbd+TB
 uidSEZRemPjkX30+BtkUgZ5901ANsAyjEwzt9dYQYpGK9xjbPk6S8LSVDCb4RvoBW+2F
 1LoG4c9yetb/pB7XBcCqrY7phduiWbgORN+pccjk5sYvvhQ7s7GU3/AdTGmydAEGX+zw
 AjVTcHSFGpXHPnGkyk9RkFiceE0Scfrg91Gm6uHNbO22Hsz1PRXrnnliGoQZpfxCM1Bh
 NCwA==
X-Gm-Message-State: AOAM5312WOKbRDKWJbDcJhMtYowj+vT6+jM5opWOw/83UJYpoN6NJKXB
 ORQ1n2D5ZIrHHu53CXaiQwNzRkaGXXXA8OiQGcI=
X-Google-Smtp-Source: ABdhPJzEP44NtBFAfTFi6m+U0B8L72BF9hYGNpMJgnWY8VcgZq+4UR0vLLyZ7HOS1sZEFPyg+vJmWEtgQHp7weUp5fA=
X-Received: by 2002:a17:906:2a04:: with SMTP id
 j4mr5218133eje.440.1598265947869; 
 Mon, 24 Aug 2020 03:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200823161550.3981-1-krzk@kernel.org>
 <20200823161550.3981-21-krzk@kernel.org>
 <AM6PR04MB49668B0F67B02B2A33603B4880560@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <20200824091102.GA20819@kozik-lap>
 <CAA+hA=S=2SoF8egOq8h-eB9wZGDqrAw66VtW-bU9oBmzFSj9Bw@mail.gmail.com>
 <VI1PR04MB52949085DFA5D29C2858094290560@VI1PR04MB5294.eurprd04.prod.outlook.com>
 <20200824103237.GA26120@kozik-lap>
In-Reply-To: <20200824103237.GA26120@kozik-lap>
From: Dong Aisheng <dongas86@gmail.com>
Date: Mon, 24 Aug 2020 18:30:33 +0800
Message-ID: <CAA+hA=TD8bjmws7FXAP7zZR1dYgtLPzjFrhPg8XwZcpP2ef4ug@mail.gmail.com>
Subject: Re: [PATCH 21/22] arm64: dts: imx8qxp: Remove i.MX7 compatible from
 USDHC
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_064549_242799_9AA5DC69 
X-CRM114-Status: GOOD (  22.66  )
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
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Fabio Estevam <festevam@gmail.com>, Anson Huang <anson.huang@nxp.com>,
 Bough Chen <haibo.chen@nxp.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Aisheng Dong <aisheng.dong@nxp.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBdWcgMjQsIDIwMjAgYXQgNjozMiBQTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBBdWcgMjQsIDIwMjAgYXQgMTA6MzE6MzFB
TSArMDAwMCwgQm91Z2ggQ2hlbiB3cm90ZToKPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0KPiA+ID4gRnJvbTogRG9uZyBBaXNoZW5nIFttYWlsdG86ZG9uZ2FzODZAZ21haWwuY29tXQo+
ID4gPiBTZW50OiAyMDIw5bm0OOaciDI05pelIDE3OjQ1Cj4gPiA+IFRvOiBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gPiA+IENjOiBBaXNoZW5nIERvbmcgPGFpc2hlbmcu
ZG9uZ0BueHAuY29tPjsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7Cj4gPiA+IGxpbnV4LXNl
cmlhbEB2Z2VyLmtlcm5lbC5vcmc7IEFuc29uIEh1YW5nIDxhbnNvbi5odWFuZ0BueHAuY29tPjsK
PiA+ID4gbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFt
QGdtYWlsLmNvbT47IExpbnVzCj4gPiA+IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz47IGxpbnV4LXBtQHZnZXIua2VybmVsLm9yZzsKPiA+ID4gbGludXgtbW1jQHZnZXIua2VybmVs
Lm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsKPiA+ID4gbGludXgtcHdtQHZnZXIu
a2VybmVsLm9yZzsgQmFydG9zeiBHb2xhc3pld3NraQo+ID4gPiA8YmdvbGFzemV3c2tpQGJheWxp
YnJlLmNvbT47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Owo+ID4gPiBsaW51eC1t
dGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47
IFBlbmd1dHJvbml4Cj4gPiA+IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBU
aGllcnJ5IFJlZGluZwo+ID4gPiA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPjsgU2hhd24gR3Vv
IDxzaGF3bmd1b0BrZXJuZWwub3JnPjsgU2FzY2hhCj4gPiA+IEhhdWVyIDxzLmhhdWVyQHBlbmd1
dHJvbml4LmRlPjsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOwo+ID4gPiBs
aW51eC13YXRjaGRvZ0B2Z2VyLmtlcm5lbC5vcmc7IEJvdWdoIENoZW4gPGhhaWJvLmNoZW5Abnhw
LmNvbT4KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAyMS8yMl0gYXJtNjQ6IGR0czogaW14OHF4
cDogUmVtb3ZlIGkuTVg3IGNvbXBhdGlibGUKPiA+ID4gZnJvbSBVU0RIQwo+ID4gPgo+ID4gPiBP
biBNb24sIEF1ZyAyNCwgMjAyMCBhdCA1OjE1IFBNIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtA
a2VybmVsLm9yZz4KPiA+ID4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIEF1ZyAyNCwg
MjAyMCBhdCAwOTowMDoxOUFNICswMDAwLCBBaXNoZW5nIERvbmcgd3JvdGU6Cj4gPiA+ID4gPiA+
IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiA+ID4gPiA+ID4g
U2VudDogTW9uZGF5LCBBdWd1c3QgMjQsIDIwMjAgMTI6MTYgQU0KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gVGhlIFVTREhDIG9uIGkuTVggOFFYUCBoYXMgaXRzIG93biBjb21wYXRpYmxlIGRlc2Ny
aWJlZCBpbgo+ID4gPiA+ID4gPiBiaW5kaW5ncyBhbmQgdXNlZCBpbiB0aGUgZHJpdmVyICh3aXRo
IGl0cyBvd24gcXVpcmtzKS4gIFJlbW92ZQo+ID4gPiA+ID4gPiBhZGRpdGlvbmFsIGZzbCxpbXg3
ZC11c2RoYyBjb21wYXRpYmxlIHRvIGZpeCBkdGJzX2NoZWNrIHdhcm5pbmdzIGxpa2U6Cj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ICAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4
cC1haV9tbC5kdC55YW1sOgo+ID4gPiBtbWNANWIwMTAwMDA6Cj4gPiA+ID4gPiA+ICAgICBjb21w
YXRpYmxlOiBbJ2ZzbCxpbXg4cXhwLXVzZGhjJywgJ2ZzbCxpbXg3ZC11c2RoYyddIGlzIHRvbyBs
b25nCj4gPiA+ID4gPiA+ICAgICBGcm9tIHNjaGVtYToKPiA+ID4gPiA+ID4gL29jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9mc2wtaW14LWVzZGhjLnlhbWwKPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLWFpX21s
LmR0LnlhbWw6Cj4gPiA+IG1tY0A1YjAxMDAwMDoKPiA+ID4gPiA+ID4gICAgIGNvbXBhdGlibGU6
IEFkZGl0aW9uYWwgaXRlbXMgYXJlIG5vdCBhbGxvd2VkCj4gPiA+ID4gPiA+ICgnZnNsLGlteDdk
LXVzZGhjJyB3YXMKPiA+ID4gPiA+ID4gdW5leHBlY3RlZCkKPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgo+
ID4gPiA+ID4KPiA+ID4gPiA+IEZvciBQYXRjaCAxOS0yMiwgSSB0aGluayB3ZSBzaG91bGQgZml4
IGR0IGJpbmRpbmcgZG9jLgo+ID4gPiA+Cj4gPiA+ID4gQXJlIHlvdSBzdXJlIHRoYXQgdGhlc2Ug
VVNESEMgY29udHJvbGxlcnMgYXJlIGNvbXBhdGlibGUgd2l0aCBpLk1YIDdEPwo+ID4gPiA+IENv
dWxkIHRoZXkgcmVhbGx5IHJ1biB3aXRoIGZzbCxpbXg3ZC11c2RoYyBjb21wYXRpYmxlPwo+ID4g
Pgo+ID4gPiBBRkFJSyB1U0RIQyBvbiBRWFAgaXMgZGVyaXZlZCBmcm9tIHRoZSBmb3JtZXIgcGxh
dGZvcm1zIHdpdGggYWRkaW5nIGEgZmV3Cj4gPiA+IG1vcmUgbmV3IGZlYXR1cmVzLiBlLmcuIEhT
NDAwRVMvQ01EUS4KPiA+ID4gTGV0IG1lIGxvb3AgaW4gdVNESEMgZHJpdmVyIG93bmVyIEhhaWJv
IENoZW4gdG8gZG91YmxlIGNvbmZpcm0uCj4gPgo+ID4gWWVzLCB1c2RoYyBvZiBpbXg4cXhwIGNh
biB3b3JrIGJ5IHVzaW5nIHRoZSBjb21wYXRpYmxlICJmc2wsIGlteDdkLXVzZGhjIiwgYnV0IHdp
bGwgbm90IHN1cHBvcnQgSFM0MDBFUy9Db21tYW5kIFF1ZXVlIGFueSBtb3JlLiBBbHNvIGlteDhx
eHAgc3VwcG9ydCBBdXRvIENNRDIzLCBidXQgaW14N2Qgbm90Lgo+ID4gQW5kIGlteDhxeHAgbmVl
ZCB0byByZS1jb25maWcgdGhlIGNsb2NrIHJhdGUgYWZ0ZXIgc3lzdGVtIFBNLCBpbXg3ZCBkbyBu
b3QgbmVlZCB0byBkbyB0aGlzLgo+Cj4gVGhlbiB3ZSBjYW4gbGVhdmUgdGhlIGNvbXBhdGlibGUg
aW4gRFRTIGFuZCBJIHdpbGwgY29ycmVjdCB0aGUgZGV2aWNlCj4gdHJlZSBzY2hlbWEuCgpIYWli
bywKCkFzIEtyenlzenRvZiBpcyBoZWxwaW5nIGZpeCB1U0RIQyBiaW5kaW5nIGRvYyBpbiBQYXRj
aCAxMi8yMiwKcGxlYXNlIGRvdWJsZSBjaGVjayB3aXRoIElDIGZvciB0aGUgd2hvbGUgdVNESEMg
ZGVyaXZlIHJlbGF0aW9uc2hpcHMgb24gaS5NWAphbmQgZmVlZGJhY2sgdG8gS3J6eXN6dG9mIGlm
IGFueXRoaW5nIGlzIHdyb25nLgoKUmVnYXJkcwpBaXNoZW5nCgo+Cj4gQmVzdCByZWdhcmRzLAo+
IEtyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
