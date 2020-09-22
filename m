Return-Path: <SRS0=loyI=C7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5433FC4346E
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 03:27:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1F6723A32
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 03:27:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dc8ji6+3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pi5SMY8g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1F6723A32
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YqSnRzLizUDWdDMEHxF+WDsEmosO6VkP1jLR2P9j0z0=; b=dc8ji6+34/R1EJ0vfK1x8TXDl
	WEtn+0Dh3kzSWzznJlvWQ2tqTR+UMggIUZjCotBEKSSum6cvDBArpHFnZG0O/V4DaYqq5JxgxzLqR
	OQmCrtzJByuHIr/uBw5JnQ2Nzjz5d4c69c2z/LsIsfXPnr3aBLaBpSRiR+MyEQNLzDazUm0Cd1o5w
	UinNNagpNpRDaU9n6mZ7USHIASV89DqY0v0FAiOsqkXUSEAlqT1GgXpHsQE6m3jthoEqqSi7kV/KH
	1ZrMBuxTThVJ3QT0w6LiDXrardeDhOYdMfcyi8l/iMn3fLtucaDD5Li8qCLh+mKc93BCHHw7rziSc
	xXgv5jwQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKYwp-0007uV-Jx; Tue, 22 Sep 2020 03:26:31 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKYwm-0007tT-Am; Tue, 22 Sep 2020 03:26:29 +0000
Received: by mail-oi1-x244.google.com with SMTP id w16so19486203oia.2;
 Mon, 21 Sep 2020 20:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NsLOhgLyrsC3y4elp6O/jQnxUTulJL0+nvpYvr5hkXA=;
 b=Pi5SMY8gahJjPqjL51bEyytPDq7zuskWxXDF570j/BfidkyWEphGd/Bdx8395JCwF2
 ejCU6LO+u0Cock2W6kKaJZZC53VdCKzK5FY1QYpdW4A5lPPulIZrA0JQpCmw6X9I7Gms
 s69V3lZ6qWLdNbjh3ph8unhyW3lrvGXiCU/TIRZbp8RCjfA6qPbYaoVb9uwhIV1P4i4l
 o4cHrcp3WTdGaCFidYT8jB2T/NcuLn7tb46hwBVVcosVV628shLNnS7o6zZdbUAvTqgR
 g2mSGGFciH3Cs3qVKx+M7qQeCONJlGbZMVb58/k0yRpPCjwZ+4n54aS84+cNfyoCYWWo
 ebbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NsLOhgLyrsC3y4elp6O/jQnxUTulJL0+nvpYvr5hkXA=;
 b=G87+LhZlPTveV5C4l7UZ0LvxdiMvsS5iObbEXd9DH15TqxgfdzQREMQ91nG49Tb+jI
 cNF6U9Bts43uIs/9S1Y5uw7JYLQGoFVeehwEHaKGoYwN7Bd/ECkQ1xLCMncrSQVzhGeW
 TO9misEUNUrPyZXZO2J3MAstEdaxbX2BwbStw5phBey8ZYBjlqVgZk/BXeV0WOdqJCMU
 pKNxTZ0xgApxyXSvnoCd1o3CnvPQLQekIbzpmoAsBv8S+3F3FIkzYDgaMIx/KBO+pqgA
 w+ixnE157vUOavrNTmQVjSCn0ncxIMyis8FHRlqnWl1sjrSVlm+eHq0NtqzAze45CZ32
 ENcQ==
X-Gm-Message-State: AOAM532FKWVICnQIjwww1KYmrBobgtFqtqZYO4Gvf5MOT/YNQANcsGHY
 KCYjnF1VkbW6QpPyxmXZPac=
X-Google-Smtp-Source: ABdhPJxJp9NZva5ckfrNyr+MbsHwrsAfPiEmY/nGAsQs2M3vqvGID0GwmBFQ2+MhdJrnucU7moK2JQ==
X-Received: by 2002:aca:ef56:: with SMTP id n83mr1378523oih.89.1600745182535; 
 Mon, 21 Sep 2020 20:26:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v5sm7929510oon.32.2020.09.21.20.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 20:26:21 -0700 (PDT)
Subject: Re: [PATCH v4] mtd: parsers: bcm63xx: simplify CFE detection
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 linux-mips@vger.kernel.org
References: <20200612073549.1658336-1-noltari@gmail.com>
 <20200615091740.2958303-1-noltari@gmail.com>
 <20200814085617.GA129183@roeck-us.net>
 <CA+G9fYvGkowdQmi1eBfoq2dhzBfgkFh9+7tgdNw75LydxkAEPw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <bff67b4c-4fa0-2441-ddbe-15366c8601d1@roeck-us.net>
Date: Mon, 21 Sep 2020 20:26:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYvGkowdQmi1eBfoq2dhzBfgkFh9+7tgdNw75LydxkAEPw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_232628_392193_1C323083 
X-CRM114-Status: GOOD (  20.84  )
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
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gOS8yMS8yMCA4OjE4IFBNLCBOYXJlc2ggS2FtYm9qdSB3cm90ZToKPiBPbiBGcmksIDE0IEF1
ZyAyMDIwIGF0IDE0OjI2LCBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3Rl
Ogo+Pgo+PiBPbiBNb24sIEp1biAxNSwgMjAyMCBhdCAxMToxNzo0MEFNICswMjAwLCDDgWx2YXJv
IEZlcm7DoW5kZXogUm9qYXMgd3JvdGU6Cj4+PiBJbnN0ZWFkIG9mIHRyeWluZyB0byBwYXJzZSBD
RkUgdmVyc2lvbiBzdHJpbmcsIHdoaWNoIGlzIGN1c3RvbWl6ZWQgYnkgc29tZQo+Pj4gdmVuZG9y
cywgbGV0J3MganVzdCBjaGVjayB0aGF0ICJDRkUxIiB3YXMgcGFzc2VkIG9uIGFyZ3VtZW50IDMu
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJp
QGdtYWlsLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEpvbmFzIEdvcnNraSA8am9uYXMuZ29yc2tp
QGdtYWlsLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxp
QGdtYWlsLmNvbT4KPj4KPiAKPiBXZSBzdGlsbCBzZWUgbWlwczogYWxsbW9kY29uZmlnIGJ1aWxk
IGZhaWx1cmUgb24gTGludXMgdHJlZQo+IAoKWWVzLCBzYW1lIGhlcmUuCgpHdWVudGVyCgo+IG1h
a2UgLXNrIEtCVUlMRF9CVUlMRF9VU0VSPVR1eEJ1aWxkIC1DL2xpbnV4IEFSQ0g9bWlwcwo+IENS
T1NTX0NPTVBJTEU9bWlwcy1saW51eC1nbnUtIEhPU1RDQz1nY2MgQ0M9InNjY2FjaGUKPiBtaXBz
LWxpbnV4LWdudS1nY2MiIE89YnVpbGQgYWxsbW9kY29uZmlnCj4gCj4gbWFrZSAtc2sgS0JVSUxE
X0JVSUxEX1VTRVI9VHV4QnVpbGQgLUMvbGludXggLWoxNiBBUkNIPW1pcHMKPiBDUk9TU19DT01Q
SUxFPW1pcHMtbGludXgtZ251LSBIT1NUQ0M9Z2NjIENDPSJzY2NhY2hlCj4gbWlwcy1saW51eC1n
bnUtZ2NjIiBPPWJ1aWxkCj4gCj4gCj4+IG1pcHM6YWxsbW9kY29uZmlnOgo+Pgo+PiBFUlJPUjog
bW9kcG9zdDogImZ3X2FyZzMiIFtkcml2ZXJzL210ZC9wYXJzZXJzL2JjbTYzeHhwYXJ0LmtvXSB1
bmRlZmluZWQhCj4gCj4gRVJST1I6IG1vZHBvc3Q6ICJmd19hcmczIiBbZHJpdmVycy9tdGQvcGFy
c2Vycy9iY202M3h4cGFydC5rb10gdW5kZWZpbmVkIQo+IAo+IFJlcG9ydGVkLWJ5OiBOYXJlc2gg
S2FtYm9qdSA8bmFyZXNoLmthbWJvanVAbGluYXJvLm9yZz4KPiAKPiBGdWxsIGJ1aWxkIGxpbmss
Cj4gaHR0cHM6Ly9idWlsZHMudHV4YnVpbGQuY29tL1NtNTlfOXRqRk1wSXZUMjdxZjVrTkEvYnVp
bGQubG9nCj4gCj4+Cj4+IFRoaXMgaXMgbm90IHN1cnByaXNpbmcsIHNpbmNlIGZ3X2FyZzMgaXMg
bm90IGV4cG9ydGVkLgo+Pgo+PiBHdWVudGVyCj4+Cj4+PiAtLS0KPj4+ICB2NDogc2hvcnRlbiBj
b25kaXRpb25hbCBjb21waWxhdGlvbiBwYXJ0IGFzIHN1Z2dlc3RlZCBieSBNaXF1w6hsLgo+Pj4g
IHYzOiBrZWVwIENPTVBJTEVfVEVTVCBjb21wYXRpYmlsaXR5IGJ5IGFkZGluZyBhIG5ldyBmdW5j
dGlvbiB0aGF0IG9ubHkgY2hlY2tzCj4+PiAgICAgIGZ3X2FyZzMgd2hlbiBDT05GSUdfTUlQUyBp
cyBkZWZpbmVkLgo+Pj4gIHYyOiB1c2UgQ0ZFX0VQVFNFQUwgZGVmaW5pdGlvbiBhbmQgYXZvaWQg
dXNpbmcgYW4gYWRkaXRpb25hbCBmdW5jdGlvbi4KPj4+Cj4+PiAgZHJpdmVycy9tdGQvcGFyc2Vy
cy9iY202M3h4cGFydC5jIHwgMzIgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4g
IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jIGIvZHJpdmVy
cy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jCj4+PiBpbmRleCA3OGY5MGM2YzE4ZmQuLmIxNWJk
YWRhZWRiNSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvYmNtNjN4eHBhcnQu
Ywo+Pj4gKysrIGIvZHJpdmVycy9tdGQvcGFyc2Vycy9iY202M3h4cGFydC5jCj4+PiBAQCAtMjIs
NiArMjIsMTEgQEAKPj4+ICAjaW5jbHVkZSA8bGludXgvbXRkL3BhcnRpdGlvbnMuaD4KPj4+ICAj
aW5jbHVkZSA8bGludXgvb2YuaD4KPj4+Cj4+PiArI2lmZGVmIENPTkZJR19NSVBTCj4+PiArI2lu
Y2x1ZGUgPGFzbS9ib290aW5mby5oPgo+Pj4gKyNpbmNsdWRlIDxhc20vZncvY2ZlL2NmZV9hcGku
aD4KPj4+ICsjZW5kaWYgLyogQ09ORklHX01JUFMgKi8KPj4+ICsKPj4+ICAjZGVmaW5lIEJDTTk2
M1hYX0NGRV9CTE9DS19TSVpFICAgICAgICAgICAgICBTWl82NEsgIC8qIGFsd2F5cyBhdCBsZWFz
dCA2NEtpQiAqLwo+Pj4KPj4+ICAjZGVmaW5lIEJDTTk2M1hYX0NGRV9NQUdJQ19PRkZTRVQgICAg
MHg0ZTAKPj4+IEBAIC0zMiwyOCArMzcsMTUgQEAKPj4+ICAjZGVmaW5lIFNUUl9OVUxMX1RFUk1J
TkFURSh4KSBcCj4+PiAgICAgICBkbyB7IGNoYXIgKl9zdHIgPSAoeCk7IF9zdHJbc2l6ZW9mKHgp
IC0gMV0gPSAwOyB9IHdoaWxlICgwKQo+Pj4KPj4+IC1zdGF0aWMgaW50IGJjbTYzeHhfZGV0ZWN0
X2NmZShzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlcikKPj4+ICtzdGF0aWMgaW5saW5lIGludCBiY202
M3h4X2RldGVjdF9jZmUodm9pZCkKPj4+ICB7Cj4+PiAtICAgICBjaGFyIGJ1Zls5XTsKPj4+IC0g
ICAgIGludCByZXQ7Cj4+PiAtICAgICBzaXplX3QgcmV0bGVuOwo+Pj4gKyAgICAgaW50IHJldCA9
IDA7Cj4+Pgo+Pj4gLSAgICAgcmV0ID0gbXRkX3JlYWQobWFzdGVyLCBCQ005NjNYWF9DRkVfVkVS
U0lPTl9PRkZTRVQsIDUsICZyZXRsZW4sCj4+PiAtICAgICAgICAgICAgICAgICAgICAodm9pZCAq
KWJ1Zik7Cj4+PiAtICAgICBidWZbcmV0bGVuXSA9IDA7Cj4+PiArI2lmZGVmIENPTkZJR19NSVBT
Cj4+PiArICAgICByZXQgPSAoZndfYXJnMyA9PSBDRkVfRVBUU0VBTCk7Cj4+PiArI2VuZGlmIC8q
IENPTkZJR19NSVBTICovCj4+Pgo+Pj4gLSAgICAgaWYgKHJldCkKPj4+IC0gICAgICAgICAgICAg
cmV0dXJuIHJldDsKPj4+IC0KPj4+IC0gICAgIGlmIChzdHJuY21wKCJjZmUtdiIsIGJ1ZiwgNSkg
PT0gMCkKPj4+IC0gICAgICAgICAgICAgcmV0dXJuIDA7Cj4+PiAtCj4+PiAtICAgICAvKiB2ZXJ5
IG9sZCBDRkUncyBkbyBub3QgaGF2ZSB0aGUgY2ZlLXYgc3RyaW5nLCBzbyBjaGVjayBmb3IgbWFn
aWMgKi8KPj4+IC0gICAgIHJldCA9IG10ZF9yZWFkKG1hc3RlciwgQkNNOTYzWFhfQ0ZFX01BR0lD
X09GRlNFVCwgOCwgJnJldGxlbiwKPj4+IC0gICAgICAgICAgICAgICAgICAgICh2b2lkICopYnVm
KTsKPj4+IC0gICAgIGJ1ZltyZXRsZW5dID0gMDsKPj4+IC0KPj4+IC0gICAgIHJldHVybiBzdHJu
Y21wKCJDRkUxQ0ZFMSIsIGJ1ZiwgOCk7Cj4+PiArICAgICByZXR1cm4gcmV0Owo+Pj4gIH0KPj4+
Cj4+PiAgc3RhdGljIGludCBiY202M3h4X3JlYWRfbnZyYW0oc3RydWN0IG10ZF9pbmZvICptYXN0
ZXIsCj4+PiBAQCAtMTM4LDcgKzEzMCw3IEBAIHN0YXRpYyBpbnQgYmNtNjN4eF9wYXJzZV9jZmVf
cGFydGl0aW9ucyhzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciwKPj4+ICAgICAgIHN0cnVjdCBiY205
NjN4eF9udnJhbSAqbnZyYW0gPSBOVUxMOwo+Pj4gICAgICAgaW50IHJldDsKPj4+Cj4+PiAtICAg
ICBpZiAoYmNtNjN4eF9kZXRlY3RfY2ZlKG1hc3RlcikpCj4+PiArICAgICBpZiAoIWJjbTYzeHhf
ZGV0ZWN0X2NmZSgpKQo+Pj4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+Cj4+PiAg
ICAgICBudnJhbSA9IHZ6YWxsb2Moc2l6ZW9mKCpudnJhbSkpOwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
