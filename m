Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D8EC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 12:25:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91F0764F2D
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 12:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91F0764F2D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6TC1coml7jElSuQRg5wRxqWRjC2GArcQ+UgynTKfgEU=; b=JX2JClxJSTLTjsXTynLH+zhFH
	KEgKdj3neZ6PSEyawUw5pIzT+DmQLK8bd/TptLj2ex0enR34C3E+UnkOkSlNisemP1u8YfaKT2I8I
	db8SJs+u+0D++nz9zzMaL/GOfzL2kk+gFfnEkU3oW2VCZwDN5tXoShvE6dj+hxrjTMGehjvG45iO8
	tqUK652mRa/GwQ1VBiu26P+Tn3GSDhT4TwusnSnHPjr4xKosa7QvAlqhE63zD3I23IPYvSkKw1t3R
	jHRR0eX8XpJBT2NcS+/Q87wl4XxsLj/br7URvJu7iREY+MFxruvRyIJBz0NRQqxt3g/jcTGxYqjPz
	XuCr7i3mA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKKNC-00959B-0o; Thu, 11 Mar 2021 12:25:02 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKKN7-00958P-RP
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 12:25:00 +0000
Received: by mail-ej1-x629.google.com with SMTP id r17so45784460ejy.13
 for <linux-mtd@lists.infradead.org>; Thu, 11 Mar 2021 04:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Bj1PrbXn3gHkHJv+RDFaf6IcgjKHh54NejPnGnfyo4k=;
 b=RvXOZn/rNiB27hC5Yi/2SxelMvtpDEApoDTQBbT+pglGgTi+JbxSpw8Pb/v4tDwKFh
 eFOenLKzhtM6DkkKvARdcWjqVLsPidqDmzpNUVvhYHcG14yPWQlr4/teEVU2Vp3MpuzF
 mDkhsiYs6XR+5eXyQI0t4YhAk4aQzXjLfFIIxVjlFaHnceLjyqMaylNXdZudxE0WfIK+
 aUMi8SQTo87wRk/4OS8uwbKm753wCngLvHyyAdYf/biGRUueVAr4VbofxzIWB4mo+8YG
 5juCLucR6ow+cKJuWhaneZOuFHsjQMtaYgHXNkDn9yGyDQhcexRJJ93fAocOchi8ff3h
 JKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Bj1PrbXn3gHkHJv+RDFaf6IcgjKHh54NejPnGnfyo4k=;
 b=aIiECAXaN8Nw3Hb3mdP1t/UI5PnUkuksYgSmhfkDN1GqCk/u+ygutNMGngLlIMxihd
 WZUllA0ngHKqN6j/2k6Jdz0Gir69e8ruXfsoHpXclkqxDbSZByaZEIlT+inKHxw2WYtm
 Et4r01XyUVT17dtHuIww+JE1C0S7KVIOQCARloCwq0TXuISUBEcYIHoUbz81hsTX8Mrx
 9yI1rDl/JgVWZL87vjCEnfcXjC3/6nqgqqV1LrojU9zaDbwiu8Bu/SvLf8LkU7DA7/nm
 fCrivueiQxQTcWlTTM0fvjRXp5W9efTgvxB1ay7OE8p5MaS/ZbQbEKoYrCYn5LxAUqBQ
 Gpww==
X-Gm-Message-State: AOAM5331TBNfgYNUZb6ld9q2kry/gYzfiAZbF5aTyrMNyRzlGPQWBSCo
 nUH/d56wWHgVrlnaC5yuvl8=
X-Google-Smtp-Source: ABdhPJxP/IiRrbAzwnECNCOgeXFdx6CfLzqL0rTIPUYKwIxQj73jl2cwZsPjGKEHkZVIPbEDcjeBiA==
X-Received: by 2002:a17:906:8583:: with SMTP id
 v3mr2867228ejx.361.1615465497291; 
 Thu, 11 Mar 2021 04:24:57 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.gmail.com with ESMTPSA id t16sm1238428edi.60.2021.03.11.04.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 04:24:56 -0800 (PST)
Date: Thu, 11 Mar 2021 06:18:34 +0100
From: Ansuel Smith <ansuelsmth@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: mtd: Document use of nvmem-cells
 compatible
Message-ID: <YEmoKuL9IyIrUW0N@Ansuel-xps.localdomain>
References: <20210310210812.8880-1-ansuelsmth@gmail.com>
 <20210310210812.8880-2-ansuelsmth@gmail.com>
 <5d798266-3a18-d50d-9c3e-f91bc2460fe5@gmail.com>
 <YElMjg/AspNSRe0A@Ansuel-xps.localdomain>
 <1d2ad735-ad15-be6a-ad90-9c33f5845a15@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d2ad735-ad15-be6a-ad90-9c33f5845a15@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_122458_183240_EAD44FB7 
X-CRM114-Status: GOOD (  32.44  )
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

T24gVGh1LCBNYXIgMTEsIDIwMjEgYXQgMDc6Mzc6MTNBTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IE9uIDEwLjAzLjIwMjEgMjM6NDcsIEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+IE9u
IFdlZCwgTWFyIDEwLCAyMDIxIGF0IDExOjQxOjI0UE0gKzAxMDAsIFJhZmHFgiBNacWCZWNraSB3
cm90ZToKPiA+ID4gU2VlIGlubGluZQo+ID4gPiAKPiA+ID4gT24gMTAuMDMuMjAyMSAyMjowOCwg
QW5zdWVsIFNtaXRoIHdyb3RlOgo+ID4gPiA+IERvY3VtZW50IG52bWVtLWNlbGxzIGNvbXBhdGli
bGUgdXNlZCB0byB0cmVhdCBtdGQgcGFydGl0aW9ucyBhcyBhCj4gPiA+ID4gbnZtZW0gcHJvdmlk
ZXIuCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5zdWVsIFNtaXRoIDxhbnN1ZWxz
bXRoQGdtYWlsLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgICAuLi4vYmluZGluZ3MvbXRkL3Bh
cnRpdGlvbnMvbnZtZW0tY2VsbHMueWFtbCAgfCA5NiArKysrKysrKysrKysrKysrKysrCj4gPiA+
ID4gICAgMSBmaWxlIGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKykKPiA+ID4gPiAgICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL252bWVtLWNlbGxzLnlhbWwKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL252bWVtLWNlbGxzLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvbnZt
ZW0tY2VsbHMueWFtbAo+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gaW5kZXgg
MDAwMDAwMDAwMDAwLi5mNzBkNzU5N2E2YjAKPiA+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL252
bWVtLWNlbGxzLnlhbWwKPiA+ID4gPiBAQCAtMCwwICsxLDk2IEBACj4gPiA+ID4gKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKPiA+ID4gPiAr
JVlBTUwgMS4yCj4gPiA+ID4gKy0tLQo+ID4gPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL210ZC9wYXJ0aXRpb25zL252bWVtLWNlbGxzLnlhbWwjCj4gPiA+ID4gKyRzY2hl
bWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gPiA+
ICsKPiA+ID4gPiArdGl0bGU6IE52bWVtIGNlbGxzCj4gPiA+ID4gKwo+ID4gPiA+ICtkZXNjcmlw
dGlvbjogfAo+ID4gPiA+ICsgIEFueSBwYXJ0aXRpb24gY29udGFpbmluZyB0aGUgY29tcGF0aWJs
ZSAibnZtZW0tY2VsbHMiIHdpbGwgcmVnaXN0ZXIgYXMgYQo+ID4gPiA+ICsgIG52bWVtIHByb3Zp
ZGVyLgo+ID4gPiA+ICsgIEVhY2ggZGlyZWN0IHN1Ym5vZGVzIHJlcHJlc2VudHMgYSBudm1lbSBj
ZWxsIGZvbGxvd2luZyB0aGUgbnZtZW0gYmluZGluZy4KPiA+ID4gPiArICBOdm1lbSBiaW5kaW5n
IHRvIGRlY2xhcmUgbnZtZW0tY2VsbHMgY2FuIGJlIGZvdW5kIGluOgo+ID4gPiA+ICsgIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9udm1lbS55YW1sCj4gPiA+ID4gKwo+
ID4gPiA+ICttYWludGFpbmVyczoKPiA+ID4gPiArICAtIEFuc3VlbCBTbWl0aCA8YW5zdWVsc210
aEBnbWFpbC5jb20+Cj4gPiA+IAo+ID4gPiBJIHRoaW5rIHRoYXQgd2hlbiBSb2Igd3JvdGU6Cj4g
PiA+IAo+ID4gPiBPbiAxMC4wMy4yMDIxIDAzOjU4LCBSb2IgSGVycmluZyB3cm90ZToKPiA+ID4g
PiBJIHRoaW5rIHRoaXMgc2hvdWxkIHJlZmVyZW5jZSBudm1lbS55YW1sLgo+ID4gPiAKPiA+ID4g
aGUgbWVhbnQgeW91IHVzaW5nOgo+ID4gPiAKPiA+ID4gYWxsT2Y6Cj4gPiA+ICAgIC0gJHJlZjog
Im52bWVtLnlhbWwjIgo+ID4gPiAKPiA+ID4gKHlvdSdsbCBuZWVkIHRvIGFkanVzdCBiaW5kaW5n
IHBhdGgpLgo+ID4gPiAKPiA+ID4gUGxlYXNlIGNoZWNrIGhvdyBpdCdzIGRvbmUgaW4gRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtLyoueWFtbCBmaWxlcwo+ID4gPiAKPiA+
ID4gCj4gPiAKPiA+IEFzaWRlIGZyb20gdGhhdCwgc2hvdWxkIEkgcmVhZGQgdGhlIG9sZCBwcm9w
ZXJ0aWVzIG9yIEkgY2FuIGtlZXAgdGhlCj4gPiBjb21wYXRpYmxlIGFzIHRoZSBvbmx5IG9uZSBy
ZXF1aXJlZD8KPiAKPiBXaGF0IG9sZCBwcm9wZXJ0aWVzIGRvIHlvdSBtZWFuPwo+IAo+IFlvdSBz
aG91bGRuJ3QgbmVlZCB0byBhZGQgYW55dGhpbmcgdG8gdGhlIGxpc3Qgb2YgInJlcXVpcmVkIiBJ
IHRoaW5rLgo+IAo+IFNvbWUgTlZNRU0gcHJvdmlkZXJzIGFkZCAiI2FkZHJlc3MtY2VsbHMiIGFu
ZCAiI3NpemUtY2VsbHMiLiBUaGF0IG1ha2VzCj4gc2Vuc2UgaWYgTlZNRU0gcHJvdmlkZXIgbXVz
dCBwcm92aWRlIGF0IGxlYXN0IDEgY2VsbC4gSSdtIG5vdCBzdXJlIGlmIHdlCj4gbmVlZCB0aGF0
IGZvciBNVEQuCj4gCj4gRXZlbiAiY29tcGF0aWJsZSIgaXMgYWN0dWFsbHkgcmVkdW5kYW50IGJ1
dCBtb3N0IFlBTUwgZmlsZXMgbGlzdCBpdCBmb3IKPiBjb252ZW5pZW5jZS4gU291cmNlOgo+CgpU
aGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLCBJIHNlbnQgdGhlIG5ldyB2ZXJzaW9uIGhvcGlu
ZyB0aGUgeWFtbApkb2N1bWVudGF0aW9uIGlzIG5vdyBjb3JyZWN0LgoKPiBPbiAxMC4xMi4yMDIw
IDAzOjQ4LCBSb2IgSGVycmluZyB3cm90ZToKPiA+IEFuZCBkcm9wICdjb21wYXRpYmxlJyBhcyBy
ZXF1aXJlZC4gSXQncyByZWR1bmRhbnQgYW55d2F5cyBiZWNhdXNlIHRoZQo+ID4gc2NoZW1hIHdp
bGwgb25seSBiZSBhcHBsaWVkIGlmIGNvbXBhdGlibGUgbWF0Y2hlcy4KPiAKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtbXRkLzIwMjAtRGVjZW1iZXIvMDg0NTc0
Lmh0bWwKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL2NvbW1lbnQvMjU5NzMyNi8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
