Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5687C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Apr 2022 11:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VaGo5S4KdOld8bH7b4b5HXE2vE1nHIE4m+YaCgm/Trs=; b=OUaShmeKYzNp0X
	w+HCqA89KiDy35T+2YpBXBS3eZlXeLLV0WsQZ0IkqH+qsnkshPGOxFGb36AwubFX+hz+Ca3YX7V2V
	Y5K+7AMAEH1hvPuYBG+XhSQ97TDBsp7R9nfwD8bZsLSoFLMlz1UEAF5H2qoULlXtopBlC61uCDKXZ
	t+jHZRwPUINkd8wwpYiEiC1VPRc9ZP1I7ysa5FSViHPTnAOvBtfnV4h0veTN5lALwRvpO/h9HtWo2
	I6IUJ1tR5gxF5Y5EvI48J0SiGcWCztTzrpSs6rDiZqmK4XzYa/AMCOZiDt5lKi+sV+EQh3a5HGFm+
	aV/EQFbKJMlXCjrVsehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nia3P-006SHE-4O; Sun, 24 Apr 2022 11:05:23 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nia3H-006SGv-4p
 for linux-mtd@lists.infradead.org; Sun, 24 Apr 2022 11:05:18 +0000
Received: by mail-ed1-x52a.google.com with SMTP id a21so3166670edb.1
 for <linux-mtd@lists.infradead.org>; Sun, 24 Apr 2022 04:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=i3bzLXI1nPc6qnp+fJ/Y8JQuZOmz2WnQ50REGcifuQE=;
 b=fktCNBHVwOkQtKwUpgNr7U7sdXzn/1WHjy7Pb1IbWPjWPMg6cK6ZSaalolnJqphKCM
 TQ+xXzWwvzTWco7YPuTRty3w/aU5E1DrrOK8zVCvniWHnjA6eRkpl3BoAeIB+EL/uwOt
 sTNk9mFGhbO/WaOFBJ3od6uKmeiyozLj5qPjqoqrDt3LIDqwKr3aktW6/jm5TEx7TDnP
 tOOiX8Ppeei348Vm3DtH0vtZx+SDOyzEsx2rEc2o57n3mwlOe+qMKMiLUjgNCwDBvB3P
 KqpwRWthCZTtWaYBNVB5DGmECMxCZhfkUOvZt6txWxj8JiLdictYmJOPd9NUSMs492Hd
 sedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i3bzLXI1nPc6qnp+fJ/Y8JQuZOmz2WnQ50REGcifuQE=;
 b=ty2MKZGDgjAl0NtdPowesrBNeS5BpDAw17yN8B7Z0E0DwaeEVKf7IjKjHiOxC3jE7U
 3HwZmasnWGT7Hz9PyLqGZV7eW9kEt6wOZPIMZar5RkZ/1sJkJzdObTDXv14U0MJVwuwj
 kbloArQTltwJzh8l48MRioO3jRkPNrGSLwzvhmAHrva9mabhBlV7b4VY2hnOgoCTD0xz
 yFPp1rIc3H/ZoY0l4T1O36q0IVMwnYIDrRC90uOT0mA2ZLiUq7AlF/lPntn93YHA/Hp/
 Sx10QH+DsIkMy/WbU3pThDaRPUeBnVDXLdDspu88AE4KFDFJ2ayWLf+382oEbR77RMDc
 BOlA==
X-Gm-Message-State: AOAM532uzGi1hMNu3x+C/mcbxFSInACdDKsofwwrDurx5kmc2RhjDxj8
 SOd/mNPORtzFiDP2oGtqcuvPbw==
X-Google-Smtp-Source: ABdhPJzTPP2YKCLb4GDm/DMwStVfH7hElz7rAfr0+p1PaloFrGNvze8BVtmRrAqyLpXYWqw5GKcCuw==
X-Received: by 2002:a05:6402:3551:b0:423:f55d:46ab with SMTP id
 f17-20020a056402355100b00423f55d46abmr13965288edd.384.1650798312764; 
 Sun, 24 Apr 2022 04:05:12 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 hf3-20020a1709072c4300b006f392c2bf71sm189778ejc.175.2022.04.24.04.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 04:05:12 -0700 (PDT)
Message-ID: <b6109c94-d4c4-6694-90bd-54f5c4fb9383@linaro.org>
Date: Sun, 24 Apr 2022 13:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/5] mtd: onenand: samsung: Unify resource order for
 controller variants
Content-Language: en-US
To: Jonathan Bakker <xc-racer2@live.ca>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
References: <20220423034524.366612-1-xc-racer2@live.ca>
 <20220423034622.366696-1-xc-racer2@live.ca>
 <CY4PR04MB05679F5FFE8317D557933CB3CBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CY4PR04MB05679F5FFE8317D557933CB3CBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_040515_231791_DE546C0C 
X-CRM114-Status: GOOD (  23.58  )
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

T24gMjMvMDQvMjAyMiAwNTo0NiwgSm9uYXRoYW4gQmFra2VyIHdyb3RlOgo+IEZyb206IFRvbWFz
eiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+Cj4gCj4gQmVmb3JlIHRoaXMgcGF0Y2gsIHRo
ZSBvcmRlciBvZiBtZW1vcnkgcmVzb3VyY2VzIHJlcXVlc3RlZCBieSB0aGUgZHJpdmVyCj4gd2Fz
IGNvbnRyb2xsZXIgYmFzZSBhcyBmaXJzdCBhbmQgT25lTkFORCBjaGlwIGJhc2UgYXMgc2Vjb25k
IGZvcgo+IFMzQzY0eHgvUzVQQzEwMCB2YXJpYW50IGFuZCB0aGUgb3Bwb3NpdGUgZm9yIFM1UEMx
MTAvUzVQVjIxMCB2YXJpYW50Lgo+IAo+IFRvIG1ha2UgdGhpcyBtb3JlIGNvbnNpc3RlbnQsIHRo
aXMgcGF0Y2ggc3dhcHMgdGhlIG9yZGVyIG9mIHJlc291cmNlcwo+IGZvciB0aGUgbGF0dGVyIGFu
ZCB1cGRhdGVzIHBsYXRmb3JtIGNvZGUgYWNjb3JkaW5nbHkuIEFzIGEgbmljZSBzaWRlCj4gZWZm
ZWN0IHRoZXJlIGlzIGEgc2xpZ2h0IHJlZHVjdGlvbiBpbiBsaW5lIGNvdW50IG9mIHByb2JlIGZ1
bmN0aW9uLgo+IAo+IFRoaXMgd2lsbCBtYWtlIHRoZSB0cmFuc2l0aW9uIHRvIERULWJhc2VkIHBy
b2JpbmcgbXVjaCBlYXNpZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogVG9tYXN6IEZpZ2EgPHRvbWFz
ei5maWdhQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBQYXdlxYIgQ2htaWVsIDxwYXdlbC5t
aWtvbGFqLmNobWllbEBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gQmFra2Vy
IDx4Yy1yYWNlcjJAbGl2ZS5jYT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29u
ZW5hbmRfc2Ftc3VuZy5jIHwgNDggKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX3NhbXN1bmcuYyBiL2RyaXZlcnMvbXRk
L25hbmQvb25lbmFuZC9vbmVuYW5kX3NhbXN1bmcuYwo+IGluZGV4IDkyNGY1ZGRjOTUwNS4uYTNl
ZjRhZGQ4NjVhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5k
X3NhbXN1bmcuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX3NhbXN1
bmcuYwo+IEBAIC0xMjMsMTQgKzEyMywxMyBAQCBzdHJ1Y3QgczNjX29uZW5hbmQgewo+ICAJc3Ry
dWN0IG10ZF9pbmZvCSptdGQ7Cj4gIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlCSpwZGV2Owo+ICAJ
ZW51bSBzb2NfdHlwZQl0eXBlOwo+IC0Jdm9pZCBfX2lvbWVtCSpiYXNlOwo+IC0Jdm9pZCBfX2lv
bWVtCSphaGJfYWRkcjsKPiArCXZvaWQgX19pb21lbQkqY3RybF9iYXNlOwo+ICsJdm9pZCBfX2lv
bWVtCSpjaGlwX2Jhc2U7Cj4gIAlpbnQJCWJvb3RyYW1fY29tbWFuZDsKPiAgCXZvaWQJCSpwYWdl
X2J1ZjsKPiAgCXZvaWQJCSpvb2JfYnVmOwo+ICAJdW5zaWduZWQgaW50CSgqbWVtX2FkZHIpKGlu
dCBmYmEsIGludCBmcGEsIGludCBmc2EpOwo+ICAJdW5zaWduZWQgaW50CSgqY21kX21hcCkodW5z
aWduZWQgaW50IHR5cGUsIHVuc2lnbmVkIGludCB2YWwpOwo+IC0Jdm9pZCBfX2lvbWVtCSpkbWFf
YWRkcjsKPiAgCXVuc2lnbmVkIGxvbmcJcGh5c19iYXNlOwo+ICAJc3RydWN0IGNvbXBsZXRpb24J
Y29tcGxldGU7Cj4gIH07Cj4gQEAgLTE0NCwyMiArMTQzLDIyIEBAIHN0YXRpYyBzdHJ1Y3QgczNj
X29uZW5hbmQgKm9uZW5hbmQ7Cj4gIAo+ICBzdGF0aWMgaW5saW5lIGludCBzM2NfcmVhZF9yZWco
aW50IG9mZnNldCkKPiAgewo+IC0JcmV0dXJuIHJlYWRsKG9uZW5hbmQtPmJhc2UgKyBvZmZzZXQp
Owo+ICsJcmV0dXJuIHJlYWRsKG9uZW5hbmQtPmN0cmxfYmFzZSArIG9mZnNldCk7Cj4gIH0KPiAg
Cj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBzM2Nfd3JpdGVfcmVnKGludCB2YWx1ZSwgaW50IG9mZnNl
dCkKPiAgewo+IC0Jd3JpdGVsKHZhbHVlLCBvbmVuYW5kLT5iYXNlICsgb2Zmc2V0KTsKPiArCXdy
aXRlbCh2YWx1ZSwgb25lbmFuZC0+Y3RybF9iYXNlICsgb2Zmc2V0KTsKPiAgfQo+ICAKPiAgc3Rh
dGljIGlubGluZSBpbnQgczNjX3JlYWRfY21kKHVuc2lnbmVkIGludCBjbWQpCj4gIHsKPiAtCXJl
dHVybiByZWFkbChvbmVuYW5kLT5haGJfYWRkciArIGNtZCk7Cj4gKwlyZXR1cm4gcmVhZGwob25l
bmFuZC0+Y2hpcF9iYXNlICsgY21kKTsKPiAgfQo+ICAKPiAgc3RhdGljIGlubGluZSB2b2lkIHMz
Y193cml0ZV9jbWQoaW50IHZhbHVlLCB1bnNpZ25lZCBpbnQgY21kKQo+ICB7Cj4gLQl3cml0ZWwo
dmFsdWUsIG9uZW5hbmQtPmFoYl9hZGRyICsgY21kKTsKPiArCXdyaXRlbCh2YWx1ZSwgb25lbmFu
ZC0+Y2hpcF9iYXNlICsgY21kKTsKPiAgfQo+ICAKPiAgI2lmZGVmIFNBTVNVTkdfREVCVUcKPiBA
QCAtNTE3LDcgKzUxNiw3IEBAIHN0YXRpYyBpbnQgKCpzNXBjMTEwX2RtYV9vcHMpKGRtYV9hZGRy
X3QgZHN0LCBkbWFfYWRkcl90IHNyYywgc2l6ZV90IGNvdW50LCBpbnQKPiAgCj4gIHN0YXRpYyBp
bnQgczVwYzExMF9kbWFfcG9sbChkbWFfYWRkcl90IGRzdCwgZG1hX2FkZHJfdCBzcmMsIHNpemVf
dCBjb3VudCwgaW50IGRpcmVjdGlvbikKPiAgewo+IC0Jdm9pZCBfX2lvbWVtICpiYXNlID0gb25l
bmFuZC0+ZG1hX2FkZHI7Cj4gKwl2b2lkIF9faW9tZW0gKmJhc2UgPSBvbmVuYW5kLT5jdHJsX2Jh
c2U7Cj4gIAlpbnQgc3RhdHVzOwo+ICAJdW5zaWduZWQgbG9uZyB0aW1lb3V0Owo+ICAKPiBAQCAt
NTYxLDcgKzU2MCw3IEBAIHN0YXRpYyBpbnQgczVwYzExMF9kbWFfcG9sbChkbWFfYWRkcl90IGRz
dCwgZG1hX2FkZHJfdCBzcmMsIHNpemVfdCBjb3VudCwgaW50IGRpCj4gIAo+ICBzdGF0aWMgaXJx
cmV0dXJuX3QgczVwYzExMF9vbmVuYW5kX2lycShpbnQgaXJxLCB2b2lkICpkYXRhKQo+ICB7Cj4g
LQl2b2lkIF9faW9tZW0gKmJhc2UgPSBvbmVuYW5kLT5kbWFfYWRkcjsKPiArCXZvaWQgX19pb21l
bSAqYmFzZSA9IG9uZW5hbmQtPmN0cmxfYmFzZTsKClRoaXMgaXMgY29uZnVzaW5nIGEgYml0LiBC
ZWZvcmUgZG1hX2FkZHIgd2FzIElPUkVTT1VSQ0VfTUVNIG5vLiAxLCBub3cKaXQgaXMgbm8uIDAs
IHNvIGl0J3MgcmV2ZXJzZWQgZm9yIFM1UC4gSG93ZXZlciBEVFMgaXMgbm90IHVwZGF0ZWQsIHNv
CndoYXQncyB0aGVyZT8gV2hhdCBkb2VzIHRoZSBEVFMgZm9sbG93IGhlcmU/CgpCZXN0IHJlZ2Fy
ZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
