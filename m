Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02C6C25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 12:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7MnUZw6pzRfO/CTyo9ZNVAeZ+9oqCTZyvx6X8x8grM=; b=r2cxwdsHKG1uxi
	bWwhdG+rZd+HjQkQUoMwtF6wuA1kRQjso2eVhoHiFY8/OKMVFD1KMrb8XnkGkT7GyRv5tG3vPoZnu
	1UUshdTCJUpwDRE7CiLldO34jUFGcFnfnt4tVhoB8yARkhU5CUCkssvG0pJi8cVs80L/vfLW6vRC3
	LvW6GGR574EM0eI20iJlwcKvaqhTFVcThTeSnto6q3nIkj+H7EOkW8gimFhSiplQk4D5fH6vGfSP2
	zdYvhz8CGXbXam4/mW40uw+PZCI2qf8DkmE3uH9f7yXQAFOh+buaTU4P/Op/e+kyVc3Ev7qVfGWjY
	N/e+KZ+M+dyR23isa/yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7aMy-00000004qQU-1sBp;
	Thu, 16 May 2024 12:38:00 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7aMu-00000004qPB-1ioA
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 12:37:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC60B24000E;
	Thu, 16 May 2024 12:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715863071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2IJp/lOWwL7BaonI5QmnyhkYo/GQ2MhT9mFOjFAyKo=;
	b=Y8vovFk3HOSEwSLHAci+g/leO4eYGpTKlxO3HSM0Bc4rI4WhmVHdF1xjJ7BVx5vFJZqCnG
	TMMC3gi3cOZj3yN92T9Ho5Ub8cxzO5G8AaeTxv755Ih4s8uipRi78fKXzbkJMm0D1M3ure
	RDxdyw9NUbPlWUabLN9VJQilSj0J1i3gDRtvWBmuo5w62qtuqrsLm8JvKiucWc8IClHve5
	B88JH/AX5p7YWuIv2OcnU9nZYrp1zWmlc2MEL8Y60dEV9f25b9+DGFHWF9BlV3RGjgLI6j
	A2queElZnkS3uUKXom5FI7PgMpGfhCgvTIeosHsRrYPhzs+5HUNadmSNxSeAvA==
Date: Thu, 16 May 2024 14:37:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 richard@nod.at, vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, quic_srichara@quicinc.com,
 quic_varada@quicinc.com, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [PATCH v5 4/7] drivers: mtd: nand: Add qpic_common API file
Message-ID: <20240516143748.2aa6de80@xps-13>
In-Reply-To: <20240508083637.3744003-5-quic_mdalam@quicinc.com>
References: <20240508083637.3744003-1-quic_mdalam@quicinc.com>
	<20240508083637.3744003-5-quic_mdalam@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_053756_757539_67448652 
X-CRM114-Status: GOOD (  14.98  )
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

SGVsbG8sCgo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMv
bXRkL25hbmQvS2NvbmZpZwo+IEBAIC02MSw2ICs2MSwxNCBAQCBjb25maWcgTVREX05BTkRfRUND
X01FRElBVEVLCj4gIAloZWxwCj4gIAkgIFRoaXMgZW5hYmxlcyBzdXBwb3J0IGZvciB0aGUgaGFy
ZHdhcmUgRUNDIGVuZ2luZSBmcm9tIE1lZGlhdGVrLgo+ICAKPiArY29uZmlnIFFQSUNfQ09NTU9O
Cj4gKwl0cmlzdGF0ZSAiUVBJQyBjb21tb24gYXBpIGZpbGUiCj4gKwlkZXBlbmRzIG9uIEFSQ0hf
UUNPTSB8fCBDT01QSUxFX1RFU1QKPiArCWhlbHAKPiArCSAgVGhpcyBlbmFibGVzIHN1cHBvcnQg
Zm9yIGNvbW1vbiBhcGkgZm9yIHFwaWMgbmFuZCBjb250cm9sbGVyLgo+ICsJICBjb21tb24gYXBp
cyB3aWxsIGJlIHVzZWQgYnkgYm90aCByYXcgbmFuZCBkcml2ZXIgYW5kIHNlcmlhbCBuYW5kCj4g
KwkgIGRyaXZlci4KClRoaXMgc2hvdWxkIHByb2JhYmx5IG5vdCBiZSBhIHN0YW5kYWxvbmUgc2Vs
ZWN0YWJsZSBpdGVtLiBNYWtlIGl0CmF1dG9tYXRpY2FsbHkgc2VsZWN0ZWQgYnkgdGhlIHVzZXJz
IGluY2x1ZGluZyB0aGUgY29tbW9uIGhlYWRlci4KCj4gKwo+ICBlbmRtZW51Cj4gIAo+ICBlbmRt
ZW51Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvTWFrZWZpbGUgYi9kcml2ZXJzL210
ZC9uYW5kL01ha2VmaWxlCj4gaW5kZXggMTllMTI5MWFjNGQ1Li5jMGMxZjhiZDAyMjAgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvTWFrZWZpbGUKPiBAQCAtMyw2ICszLDcgQEAKPiAgbmFuZGNvcmUtb2JqcyA6PSBjb3JlLm8g
YmJ0Lm8KPiAgb2JqLSQoQ09ORklHX01URF9OQU5EX0NPUkUpICs9IG5hbmRjb3JlLm8KPiAgb2Jq
LSQoQ09ORklHX01URF9OQU5EX0VDQ19NRURJQVRFSykgKz0gZWNjLW10ay5vCj4gK29iai0kKENP
TkZJR19RUElDX0NPTU1PTikgKz0gcXBpY19jb21tb24ubwo+ICAKPiAgb2JqLXkJKz0gb25lbmFu
ZC8KPiAgb2JqLXkJKz0gcmF3Lwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3FwaWNf
Y29tbW9uLmMgYi9kcml2ZXJzL210ZC9uYW5kL3FwaWNfY29tbW9uLmMKPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZDQ4ODkyMTQxMzY1Cj4gLS0tIC9kZXYvbnVs
bAo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcXBpY19jb21tb24uYwo+IEBAIC0wLDAgKzEsNzQx
IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiArLyoKPiAr
ICogQ29weXJpZ2h0IChjKSAyMDE2LCBUaGUgTGludXggRm91bmRhdGlvbi4gQWxsIHJpZ2h0cyBy
ZXNlcnZlZC4KPiArICovCj4gKyNpbmNsdWRlIDxsaW51eC9iaXRvcHMuaD4KPiArI2luY2x1ZGUg
PGxpbnV4L2Nsay5oPgo+ICsjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KPiArI2luY2x1ZGUgPGxp
bnV4L2RtYWVuZ2luZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KPiArI2lu
Y2x1ZGUgPGxpbnV4L2RtYS9xY29tX2FkbS5oPgo+ICsjaW5jbHVkZSA8bGludXgvZG1hL3Fjb21f
YmFtX2RtYS5oPgo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gKyNpbmNsdWRlIDxsaW51
eC9tdGQvcGFydGl0aW9ucy5oPgo+ICsjaW5jbHVkZSA8bGludXgvbXRkL3Jhd25hbmQuaD4KCk5v
IHJhdyBOQU5EIGluY2x1ZGUgaW4gdGhlIGNvbW1vbiBmaWxlLiBJZiB0aGVyZSBpcyBzb21ldGhp
bmcgcmF3IE5BTkQKc3BlY2lmaWMsIGl0IHNob3VsZCBub3QgYmUgaGVyZS4KCj4gKyNpbmNsdWRl
IDxsaW51eC9vZi5oPgo+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gKyNp
bmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tdGQvbmFuZC1xcGljLWNv
bW1vbi5oPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
