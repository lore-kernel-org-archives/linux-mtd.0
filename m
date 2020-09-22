Return-Path: <SRS0=loyI=C7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7ACC4346E
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 03:20:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 465AD21548
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 03:20:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bo2suy8b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xi5CVdRB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 465AD21548
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZEjAF04CQmyOPszv9KNtYl3BsNkknCl9gNRNGahksNU=; b=bo2suy8bofbYUVL5WsZ+pzHsK
	Q/jYYM5X9+A+IAZQ5+cn6JAjdvt7IB7Fm2r8YxC60GzEE7a0oc8ioZd8VpT0ablSJh23CVsbfj/6M
	EREvG4UxYzA88bJ6RX8p22H8EWydwHqH5hSKYtkjWzFBFf6ogGd0GTzOp7rbcEvv4D20wmS3tlgTd
	ZdwnYzHRyeTkhjjz76FotcJeOMV/oOTTIinYnHpyT33DPUMCfa5sVCvIvmVZyOH4711dYOdeLLYH9
	TYt5wiUxKdQqvtiQcwlArzSSUP4mI3nGZSE1/38h8wWsbUDFSpai2m6YvCPM/uUI3Wn63uZzcvO7R
	uGJGew+mQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKYpQ-0006xV-UR; Tue, 22 Sep 2020 03:18:52 +0000
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKYpN-0006wG-1K
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2020 03:18:50 +0000
Received: by mail-vk1-xa44.google.com with SMTP id b4so3913529vkh.9
 for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2020 20:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a399iMwad77Pjy4LzbXkCDo8iyJ1PbYFH+ke+Rxn7Uk=;
 b=Xi5CVdRBDwfUKjomm9GdawzAxb2XCK50F3VmBba6sFTowJpj1kg5sr6jMdCAkrreKx
 tYJZLP8yRu60u5UqSBBwD5zLI3RbelyV3qU61jwX1hbL+AbWBBXHP6ZUFhLUS3jFcYzI
 kBC3qP1woDhGEXSYfDOmU0SxQy2CNSIsks7ag2iz89GxaMXvg60Q20CMwxLRZ7gw+6Al
 HCfM/ffysfoBMTaDH2JzS5xcv0JVnn7CDYmdD15kerq94H2k853s5oyaiCfecLJcgNuc
 inHVCS120DGZGy68+nORlSUKZdJjgYrDI7jw8k/9Lh0fKFy2ceRB+PSnwNo+omicCP+O
 slWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a399iMwad77Pjy4LzbXkCDo8iyJ1PbYFH+ke+Rxn7Uk=;
 b=qnxG5bEtUg5JTYxDBG5pbLzcJx3qrGVQ7CoAfoLtaIu/vP32ovpFXBnng8p1NSS+qr
 7XBuHe31AccOYuF5Led4ypcZFGDxYAFtO73BZS943s0hZ8RE80rBvdmBJ6iIVm7TPAt9
 kJ01rCKK0A5nKrju2TSLJl4t74/MGRy8CaLbbRKoDfmha2WSLNocmYi6WXnrvZmXbcEk
 Yy6cAdLK2Juk1LmIZ810Yy/S0Cbj/6Py0qOPvLlWQmnEUUeWEdln8KYH+RTkyiq2LoF/
 pLmqzLvvIg7P0UrYOY5uSF7RlZwGX/JsH5oHezr94ug1v2fCUIRAh4P1qqbb5kd6oFvj
 q+Cw==
X-Gm-Message-State: AOAM530PaDLbf7dOMCjbQStrl6ehnluedcs1F+/LnQ3JjjaqYl9Qu+Ys
 jb3c9X0HfDDAyZPbJASwoYwgRHlklfUfl4wqv9/tSA==
X-Google-Smtp-Source: ABdhPJyxBLzdXdTesnpHTplStB5Xn7/rADNj/6HmT1maoy3kyBYH52XP9XDJfcMA2cA3I131efLv9swvLxvGLmjFEs8=
X-Received: by 2002:a1f:fec9:: with SMTP id l192mr2121611vki.21.1600744726839; 
 Mon, 21 Sep 2020 20:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200612073549.1658336-1-noltari@gmail.com>
 <20200615091740.2958303-1-noltari@gmail.com>
 <20200814085617.GA129183@roeck-us.net>
In-Reply-To: <20200814085617.GA129183@roeck-us.net>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 22 Sep 2020 08:48:35 +0530
Message-ID: <CA+G9fYvGkowdQmi1eBfoq2dhzBfgkFh9+7tgdNw75LydxkAEPw@mail.gmail.com>
Subject: Re: [PATCH v4] mtd: parsers: bcm63xx: simplify CFE detection
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
 linux-mips@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_231849_401818_E0F125FD 
X-CRM114-Status: GOOD (  23.63  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linus Walleij <linus.walleij@linaro.org>, jonas.gorski@gmail.com,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 tsbogend@alpha.franken.de, bcm-kernel-feedback-list@broadcom.com,
 Guenter Roeck <linux@roeck-us.net>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNCBBdWcgMjAyMCBhdCAxNDoyNiwgR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2st
dXMubmV0PiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDE1LCAyMDIwIGF0IDExOjE3OjQwQU0gKzAy
MDAsIMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyB3cm90ZToKPiA+IEluc3RlYWQgb2YgdHJ5aW5n
IHRvIHBhcnNlIENGRSB2ZXJzaW9uIHN0cmluZywgd2hpY2ggaXMgY3VzdG9taXplZCBieSBzb21l
Cj4gPiB2ZW5kb3JzLCBsZXQncyBqdXN0IGNoZWNrIHRoYXQgIkNGRTEiIHdhcyBwYXNzZWQgb24g
YXJndW1lbnQgMy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9q
YXMgPG5vbHRhcmlAZ21haWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogSm9uYXMgR29yc2tpIDxq
b25hcy5nb3Jza2lAZ21haWwuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEZsb3JpYW4gRmFpbmVsbGkg
PGYuZmFpbmVsbGlAZ21haWwuY29tPgo+CgpXZSBzdGlsbCBzZWUgbWlwczogYWxsbW9kY29uZmln
IGJ1aWxkIGZhaWx1cmUgb24gTGludXMgdHJlZQoKbWFrZSAtc2sgS0JVSUxEX0JVSUxEX1VTRVI9
VHV4QnVpbGQgLUMvbGludXggQVJDSD1taXBzCkNST1NTX0NPTVBJTEU9bWlwcy1saW51eC1nbnUt
IEhPU1RDQz1nY2MgQ0M9InNjY2FjaGUKbWlwcy1saW51eC1nbnUtZ2NjIiBPPWJ1aWxkIGFsbG1v
ZGNvbmZpZwoKbWFrZSAtc2sgS0JVSUxEX0JVSUxEX1VTRVI9VHV4QnVpbGQgLUMvbGludXggLWox
NiBBUkNIPW1pcHMKQ1JPU1NfQ09NUElMRT1taXBzLWxpbnV4LWdudS0gSE9TVENDPWdjYyBDQz0i
c2NjYWNoZQptaXBzLWxpbnV4LWdudS1nY2MiIE89YnVpbGQKCgo+IG1pcHM6YWxsbW9kY29uZmln
Ogo+Cj4gRVJST1I6IG1vZHBvc3Q6ICJmd19hcmczIiBbZHJpdmVycy9tdGQvcGFyc2Vycy9iY202
M3h4cGFydC5rb10gdW5kZWZpbmVkIQoKRVJST1I6IG1vZHBvc3Q6ICJmd19hcmczIiBbZHJpdmVy
cy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5rb10gdW5kZWZpbmVkIQoKUmVwb3J0ZWQtYnk6IE5h
cmVzaCBLYW1ib2p1IDxuYXJlc2gua2FtYm9qdUBsaW5hcm8ub3JnPgoKRnVsbCBidWlsZCBsaW5r
LApodHRwczovL2J1aWxkcy50dXhidWlsZC5jb20vU201OV85dGpGTXBJdlQyN3FmNWtOQS9idWls
ZC5sb2cKCj4KPiBUaGlzIGlzIG5vdCBzdXJwcmlzaW5nLCBzaW5jZSBmd19hcmczIGlzIG5vdCBl
eHBvcnRlZC4KPgo+IEd1ZW50ZXIKPgo+ID4gLS0tCj4gPiAgdjQ6IHNob3J0ZW4gY29uZGl0aW9u
YWwgY29tcGlsYXRpb24gcGFydCBhcyBzdWdnZXN0ZWQgYnkgTWlxdcOobC4KPiA+ICB2Mzoga2Vl
cCBDT01QSUxFX1RFU1QgY29tcGF0aWJpbGl0eSBieSBhZGRpbmcgYSBuZXcgZnVuY3Rpb24gdGhh
dCBvbmx5IGNoZWNrcwo+ID4gICAgICBmd19hcmczIHdoZW4gQ09ORklHX01JUFMgaXMgZGVmaW5l
ZC4KPiA+ICB2MjogdXNlIENGRV9FUFRTRUFMIGRlZmluaXRpb24gYW5kIGF2b2lkIHVzaW5nIGFu
IGFkZGl0aW9uYWwgZnVuY3Rpb24uCj4gPgo+ID4gIGRyaXZlcnMvbXRkL3BhcnNlcnMvYmNtNjN4
eHBhcnQuYyB8IDMyICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvYmNtNjN4eHBhcnQuYyBiL2RyaXZlcnMvbXRkL3Bh
cnNlcnMvYmNtNjN4eHBhcnQuYwo+ID4gaW5kZXggNzhmOTBjNmMxOGZkLi5iMTViZGFkYWVkYjUg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9wYXJzZXJzL2JjbTYzeHhwYXJ0LmMKPiA+ICsr
KyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMvYmNtNjN4eHBhcnQuYwo+ID4gQEAgLTIyLDYgKzIyLDEx
IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L210ZC9wYXJ0aXRpb25zLmg+Cj4gPiAgI2luY2x1ZGUg
PGxpbnV4L29mLmg+Cj4gPgo+ID4gKyNpZmRlZiBDT05GSUdfTUlQUwo+ID4gKyNpbmNsdWRlIDxh
c20vYm9vdGluZm8uaD4KPiA+ICsjaW5jbHVkZSA8YXNtL2Z3L2NmZS9jZmVfYXBpLmg+Cj4gPiAr
I2VuZGlmIC8qIENPTkZJR19NSVBTICovCj4gPiArCj4gPiAgI2RlZmluZSBCQ005NjNYWF9DRkVf
QkxPQ0tfU0laRSAgICAgICAgICAgICAgU1pfNjRLICAvKiBhbHdheXMgYXQgbGVhc3QgNjRLaUIg
Ki8KPiA+Cj4gPiAgI2RlZmluZSBCQ005NjNYWF9DRkVfTUFHSUNfT0ZGU0VUICAgIDB4NGUwCj4g
PiBAQCAtMzIsMjggKzM3LDE1IEBACj4gPiAgI2RlZmluZSBTVFJfTlVMTF9URVJNSU5BVEUoeCkg
XAo+ID4gICAgICAgZG8geyBjaGFyICpfc3RyID0gKHgpOyBfc3RyW3NpemVvZih4KSAtIDFdID0g
MDsgfSB3aGlsZSAoMCkKPiA+Cj4gPiAtc3RhdGljIGludCBiY202M3h4X2RldGVjdF9jZmUoc3Ry
dWN0IG10ZF9pbmZvICptYXN0ZXIpCj4gPiArc3RhdGljIGlubGluZSBpbnQgYmNtNjN4eF9kZXRl
Y3RfY2ZlKHZvaWQpCj4gPiAgewo+ID4gLSAgICAgY2hhciBidWZbOV07Cj4gPiAtICAgICBpbnQg
cmV0Owo+ID4gLSAgICAgc2l6ZV90IHJldGxlbjsKPiA+ICsgICAgIGludCByZXQgPSAwOwo+ID4K
PiA+IC0gICAgIHJldCA9IG10ZF9yZWFkKG1hc3RlciwgQkNNOTYzWFhfQ0ZFX1ZFUlNJT05fT0ZG
U0VULCA1LCAmcmV0bGVuLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgKHZvaWQgKilidWYpOwo+
ID4gLSAgICAgYnVmW3JldGxlbl0gPSAwOwo+ID4gKyNpZmRlZiBDT05GSUdfTUlQUwo+ID4gKyAg
ICAgcmV0ID0gKGZ3X2FyZzMgPT0gQ0ZFX0VQVFNFQUwpOwo+ID4gKyNlbmRpZiAvKiBDT05GSUdf
TUlQUyAqLwo+ID4KPiA+IC0gICAgIGlmIChyZXQpCj4gPiAtICAgICAgICAgICAgIHJldHVybiBy
ZXQ7Cj4gPiAtCj4gPiAtICAgICBpZiAoc3RybmNtcCgiY2ZlLXYiLCBidWYsIDUpID09IDApCj4g
PiAtICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gLQo+ID4gLSAgICAgLyogdmVyeSBvbGQgQ0ZF
J3MgZG8gbm90IGhhdmUgdGhlIGNmZS12IHN0cmluZywgc28gY2hlY2sgZm9yIG1hZ2ljICovCj4g
PiAtICAgICByZXQgPSBtdGRfcmVhZChtYXN0ZXIsIEJDTTk2M1hYX0NGRV9NQUdJQ19PRkZTRVQs
IDgsICZyZXRsZW4sCj4gPiAtICAgICAgICAgICAgICAgICAgICAodm9pZCAqKWJ1Zik7Cj4gPiAt
ICAgICBidWZbcmV0bGVuXSA9IDA7Cj4gPiAtCj4gPiAtICAgICByZXR1cm4gc3RybmNtcCgiQ0ZF
MUNGRTEiLCBidWYsIDgpOwo+ID4gKyAgICAgcmV0dXJuIHJldDsKPiA+ICB9Cj4gPgo+ID4gIHN0
YXRpYyBpbnQgYmNtNjN4eF9yZWFkX252cmFtKHN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyLAo+ID4g
QEAgLTEzOCw3ICsxMzAsNyBAQCBzdGF0aWMgaW50IGJjbTYzeHhfcGFyc2VfY2ZlX3BhcnRpdGlv
bnMoc3RydWN0IG10ZF9pbmZvICptYXN0ZXIsCj4gPiAgICAgICBzdHJ1Y3QgYmNtOTYzeHhfbnZy
YW0gKm52cmFtID0gTlVMTDsKPiA+ICAgICAgIGludCByZXQ7Cj4gPgo+ID4gLSAgICAgaWYgKGJj
bTYzeHhfZGV0ZWN0X2NmZShtYXN0ZXIpKQo+ID4gKyAgICAgaWYgKCFiY202M3h4X2RldGVjdF9j
ZmUoKSkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPgo+ID4gICAgICAgbnZy
YW0gPSB2emFsbG9jKHNpemVvZigqbnZyYW0pKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
