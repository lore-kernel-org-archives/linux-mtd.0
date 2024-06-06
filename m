Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DADC25B75
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 12:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTobuqhZyv3+BTD7dCzr7w1yx87KPxdgtmXwtgHAknU=; b=HQDpPJs0x/TKzD
	ftOBH0cOkEW9Byjl7kKdPsIQaU7MHrL9t6FcBJkpCVNZuQkeimKkj5mQ64a2BJV8Ro1AflYUE8M56
	GDdEX8ITxMvvgDQnIT2B5nStbUE7w7RBaEXGch/PB8+VO+fvsW0RYTqS0phEGGSgeDUTVyAQGMmuo
	p2fjum8Nf9wseCsEJrUHXzaqrWKtNakb/NgR/CVSQtkqyd9YMZQn/I2R1IwwWCaAuocEXnPPV39Zu
	Z41xMU9mK+FPjabJMnEqAsogCm1bL9wWRbvOC4W2Z4Epo6Qcb9cx7Iozxn/kEG5Ecay9Oc5GEkitG
	gzcM2ht1V7imd0mLkGkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFBqI-00000009cWK-2Dnx;
	Thu, 06 Jun 2024 12:03:42 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFBqE-00000009cTu-1nN5
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 12:03:40 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a62ef52e837so109480966b.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2024 05:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717675414; x=1718280214; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+vPS4Wu3K1+SNHP7/UCC3zuql6I1R/Uod3WHUVV4Y/k=;
        b=kzor8IjlmpF6mJ193Hs4G8Cg+3ljZ55P9WZkNoD/b05ByPDzQgbn2/uNnyF5CFsKhi
         8fiUihlb2FV7Y5sOOADE/4Us6pUsdV/riRomI8lu/XSKCgqAoQVwHLEMbBRUpErHhNjq
         Os34fgLHf1jGCFOhmngCf2jTXJFMol6mSJM4wYqvbprQzbl98bqucSsks3XP4gYgzw0j
         a67wycOprCs9tbjvQYHns41GImwpOHMexeSQxzE5NZZea9sPwC4Rd6Ae8lmec1Btks2O
         D39ORUPoUuCG4uB0LFwfwea77Qyn3stlqoH/BK+Pb6E/Esam+BZX+vInkdMVLVCEKhRs
         gC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717675414; x=1718280214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vPS4Wu3K1+SNHP7/UCC3zuql6I1R/Uod3WHUVV4Y/k=;
        b=C5DKurjmHSoHeMHF4eMPU56h0p00KcJRvFCROORtYoFj8sMssCzGbKrawo8vRHv2nC
         gFDDp8M0OBBGq4ieu0gko1vlD7i1FWHBlKRdJks4X5LXZ7xeAvlRcP6bmjoJXUbiKW48
         WNfpKQ2+HlCNAKJI8pUVR/kFPav/ahJo/7aAMgfoGdQvxqGHj8fwOigDAkDfLu05BLPx
         RdSlAm5AEd21BB1apd6pCiapG7UySxgmwqak3OrusVXyGix8fGLbqX4YVinw6sqAv/oH
         RwX0UbHvzrEp3xqJ4uShpPxN2bOW8V621/3ppIgvPEUqThd2vixEdmQprCYFaoIGBbsf
         nZ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVG2EiFRf8JqGfmA38Eveyq5qvvlex4qrO2/zVMyfNppXv2sPoNDVQw7HNaPJEXILZmDR2UpOW/oF0qSDprXEyeSC8BVlLlTJqQJjqZjQ==
X-Gm-Message-State: AOJu0YwtPu6ErRwRI2T9EBcQb1LsthZXudgz2SGUJsJfGlI/HGuCCmSf
	cgzAiYOb35uuoDkIq9EK848D2iQrOd321RN7WmSDhIoF8VmMV0XK2qODZYEG+LI=
X-Google-Smtp-Source: AGHT+IFmMz1GmHTUvHk6s/qP+CRB/I1EcEnEfMew6pgb89m5yDF7bhdBICxRyQM/+EXeB1BQOKXDcQ==
X-Received: by 2002:a17:906:4915:b0:a66:d1a1:f92f with SMTP id a640c23a62f3a-a699f34da1emr363268166b.14.1717675414101;
        Thu, 06 Jun 2024 05:03:34 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c8070e839sm89223766b.176.2024.06.06.05.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 05:03:33 -0700 (PDT)
Message-ID: <0bb5cdc8-37fe-42c1-a18e-bb1494924095@linaro.org>
Date: Thu, 6 Jun 2024 13:03:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: deprecate Everspin MRAM
 devices
To: Conor Dooley <conor@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thorsten Scherer <t.scherer@eckelmann.de>, Marek Vasut <marex@denx.de>,
 Imre Kaloz <kaloz@openwrt.org>, Andrew Lunn <andrew@lunn.ch>,
 Flavio Suligoi <f.suligoi@asem.it>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, Bacem.Daassi@infineon.com
References: <20240604074231.1874972-1-mwalle@kernel.org>
 <20240604-ladylike-gout-6fd6ae992712@spud>
 <D1RF2GI60GXE.3A3W7Q3W19GPN@kernel.org>
 <20240605-cosmetics-upgrade-837934256ede@spud>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240605-cosmetics-upgrade-837934256ede@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_050338_650858_A133B323 
X-CRM114-Status: GOOD (  31.06  )
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

CgpPbiA2LzUvMjQgMTg6NDAsIENvbm9yIERvb2xleSB3cm90ZToKPiBPbiBUdWUsIEp1biAwNCwg
MjAyNCBhdCAwNzo0MjoxNlBNICswMjAwLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBPbiBUdWUg
SnVuIDQsIDIwMjQgYXQgNzowMSBQTSBDRVNULCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBPbiBU
dWUsIEp1biAwNCwgMjAyNCBhdCAwOTo0MjozMUFNICswMjAwLCBNaWNoYWVsIFdhbGxlIHdyb3Rl
Ogo+Pj4+IFRoZXNlIGRldmljZXMgYXJlIG1vcmUgbGlrZSBhbiBBVDI1IGNvbXBhdGlibGUgRUVQ
Uk9NIGluc3RlYWQgb2YKPj4+PiBmbGFzaGVzLiBMaWtlIGFuIEVFUFJPTSB0aGUgdXNlciBkb2Vz
bid0IG5lZWQgdG8gZXhwbGljaXRseSBlcmFzZSB0aGUKPj4+PiBtZW1vcnksIG5vciBhcmUgdGhl
cmUgc2VjdG9ycyBvciBwYWdlcy4gVGh1cywgaW5zdGVhZCBvZiB0aGUgU1BJLU5PUgo+Pj4+IChm
bGFzaCkgZHJpdmVyLCBvbmUgc2hvdWxkIGluc3RlYWQgdXNlIHRoZSBhdDI1IEVFUFJPTSBkcml2
ZXIuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFdhbGxlIDxtd2FsbGVAa2VybmVs
Lm9yZz4KPj4+PiBDYzogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRy
b25peC5kZT4KPj4+PiBDYzogVGhvcnN0ZW4gU2NoZXJlciA8dC5zY2hlcmVyQGVja2VsbWFubi5k
ZT4KPj4+PiBDYzogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4+Pj4gQ2M6IEltcmUgS2Fs
b3ogPGthbG96QG9wZW53cnQub3JnPgo+Pj4+IENjOiBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4u
Y2g+Cj4+Pj4gQ2M6IEZsYXZpbyBTdWxpZ29pIDxmLnN1bGlnb2lAYXNlbS5pdD4KPj4+PiAtLS0K
Pj4+PiBUaGUgcmVmZXJlbmNlZCBiaW5kaW5nIG9ubHkgc3VwcG9ydHMgdGhlIHRydWUgQVQyNSBj
b21wYXRpYmxlIEVFUFJPTXMKPj4+PiB3aGVyZSB5b3UgaGF2ZSB0byBzcGVjaWZ5IGFkZGl0aW9u
YWwgcHJvcGVydGllcyBsaWtlIHNpemUgYW5kIHBhZ2Ugc2l6ZQo+Pj4+IG9yIGN5cHJlc3MgRlJB
TSBkZXZpY2VzIHdoZXJlIGFsbCB0aGUgcHJvcGVydGllcyBhcmUgZGlzY292ZXJlZCBieSB0aGUK
Pj4+PiBkcml2ZXIuIEkgZG9uJ3QgaGF2ZSB0aGUgYWN0dWFsIGhhcmR3YXJlLCB0aGVyZWZvcmUg
SSBjYW4ndCB3b3JrIG9uIGEKPj4+PiBwcm9wZXIgZHJpdmVyIGFuZCBiaW5kaW5nLiBCdXQgSSBy
ZWFsbHkgd2FudCB0byBkZXByZWNhdGUgdGhlIHVzZSBvZgo+Pj4+IHRoZXNlIEVFUFJPTSBsaWtl
IGRldmljZXMgaW4gU1BJLU5PUi4gU28gYXMgYSBmaXJzdCBzdGVwLCBtYXJrIHRoZQo+Pj4+IGRl
dmljZXMgaW4gdGhlIERUIGJpbmRpbmdzIGFzIGRlcHJlY2F0ZWQuCj4+Pj4KPj4+PiBUaGVyZSBh
cmUgdGhyZWUgaW4tdHJlZSB1c2VycyBvZiB0aGlzLiBJIGhvcGUgSSd2ZSBDQ2VkIGFsbCB0aGUg
cmVsZXZhbnQKPj4+PiBwZW9wbGUuIFdpdGggdGhlIHN3aXRjaCB0byB0aGUgYXQyNSBkcml2ZXIg
YWxzbyBjb21lcyBhIHVzZXItc3BhY2UKPj4+PiBmYWNpbmcgY2hhbmdlOiB0aGVyZSBpcyBubyBt
b3JlIE1URCBkZXZpY2UuIEluc3RlYWQgdGhlcmUgaXMgYW4gImVlcHJvbSIKPj4+PiBmaWxlIGlu
IC9zeXMgbm93LCBqdXN0IGxpa2UgZm9yIGV2ZXJ5IG90aGVyIEVFUFJPTS4KPj4+Pgo+Pj4+IE1h
cmVrIGFscmVhZHkgZXhwcmVzc2VkLCB0aGF0IHRoZSBzcHMxIGR0cyBjYW4gbGlrZWx5IGJlIHJl
bW92ZWQKPj4+PiBhbHRvZ2V0aGVyLiBJJ2QgbGlrZSB0byBoZWFyIGZyb20gdGhlIG90aGVyIGJv
YXJkIERUUyBtYWludGFpbmVycyBpZgo+Pj4+IHRoZXkgc2VlbSBzb21lIHByb2JsZW1zIG1vdmlu
ZyB0byB0aGUgRUVQUk9NIGludGVyZmFjZSAtIG9yIG1heWJlIHRoYXQKPj4+PiBkZXZpY2UgaXNu
J3QgdXNlZCBhdCBhbGwgYW55d2F5LiBTbyBpbiB0aGUgZW5kLCB3ZSBjYW4gaG9wZWZ1bGx5IG1v
dmUKPj4+PiBhbGwgdGhlIHVzZXJzIG92ZXIgdG8gdGhlIGF0MjUgZHJpdmVyLgo+Pj4+IC0tLQo+
Pj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3Iu
eWFtbCB8IDkgKysrKysrKystCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1sCj4+Pj4gaW5kZXggNmUzYWZi
NDI5MjZlLi4yZGNjYjZiMDQ5ZWEgMTAwNjQ0Cj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwKPj4+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbAo+Pj4+IEBA
IC0yMSw3ICsyMSw2IEBAIHByb3BlcnRpZXM6Cj4+Pj4gICAgICAgICAgICAgICAgKG0yNXAoNDB8
ODB8MTZ8MzJ8NjR8MTI4KXxcCj4+Pj4gICAgICAgICAgICAgICAgbjI1cSgzMmJ8MDY0fDEyOGEx
MXwxMjhhMTN8MjU2YXw1MTJhfDE2NGspKSl8XAo+Pj4+ICAgICAgICAgICAgICAgIGF0bWVsLGF0
MjVkZigzMjFhfDY0MXwwODFhKXxcCj4+Pj4gLSAgICAgICAgICAgICAgZXZlcnNwaW4sbXIyNWgo
MTB8NDB8MTI4fDI1Nil8XAo+Pj4+ICAgICAgICAgICAgICAgIChteGljeXxtYWNyb25peCksbXgy
NWwoNDAwNWF8MTYwNmV8NjQwNWR8ODAwNXwxMjgwNWR8MjU2MzVlKXxcCj4+Pj4gICAgICAgICAg
ICAgICAgKG14aWN5fG1hY3Jvbml4KSxteDI1dSg0MDMzfDQwMzUpfFwKPj4+PiAgICAgICAgICAg
ICAgICAoc3BhbnNpb24sKT9zMjVmbCgxMjhzfDI1NnMxfDUxMnN8MDA4a3wwNjRrfDE2NGspfFwK
Pj4+PiBAQCAtNDIsNiArNDEsMTQgQEAgcHJvcGVydGllczoKPj4+PiAgICAgICAgICAgICAgICAt
IHNwYW5zaW9uLHMyNWZzNTEycwo+Pj4+ICAgICAgICAgICAgLSBjb25zdDogamVkZWMsc3BpLW5v
cgo+Pj4+ICAgICAgICAtIGNvbnN0OiBqZWRlYyxzcGktbm9yCj4+Pj4gKwo+Pj4+ICsgICAgICAj
IERlcHJlY2F0ZWQgYmluZGluZ3MKPj4+PiArICAgICAgLSBpdGVtczoKPj4+PiArICAgICAgICAg
IC0gcGF0dGVybjogIl5ldmVyc3BpbixtcjI1aCgxMHw0MHwxMjh8MjU2KSQiCj4+Pj4gKyAgICAg
ICAgICAtIGNvbnN0OiBqZWRlYyxzcGktbm9yCj4+Pj4gKyAgICAgICAgZGVzY3JpcHRpb246Cj4+
Pj4gKyAgICAgICAgICBEZXByZWNhdGVkIGJpbmRpbmcsIHVzZSBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZWVwcm9tL2F0MjUueWFtbC4KPj4+PiArICAgICAgICBkZXByZWNhdGVk
OiB0cnVlCj4+Pgo+Pj4gVGhlIGlkZWEgaGVyZSBzZWVtcyBva2F5LCBidXQgZGlyZWN0aW5nIHBl
b3BsZSB0byB1c2UgdGhlIGF0MjUgYmluZGluZywKPj4+IHdpdGhvdXQgYWN0dWFsbHkgZG9jdW1l
bnRpbmcgdGhlIHJlcGxhY2VtZW50IGNvbXBhdGlibGVzIGV0YyBpcyBmYXIgZnJvbQo+Pj4gaWRl
YWwuIEkgdGhpbmsgZXZlbiBhIHdvcmRpbmcgY2hhbmdlIHRoYXQgcG9pbnRzIG91dCB0aGF0IHRo
YXQgdGhlc2UKPj4+IGRldmljZXMgbmVlZCB0byBiZSBkb2N1bWVudGVkIGluIHRoYXQgZmlsZSB3
b3VsZCBiZSBhbiBpbXByb3ZlbWVudCwgdGhlCj4+PiBjdXJyZW50IHdvcmRpbmcgbWFrZXMgaXQg
c2VlbSBsaWtlIHRoZSB3b3JrcyBiZWVuIGRvbmUuCj4+PiBVbnRpbCB0aGVyZSdzIGEgcmVwbGFj
ZW1lbnQgZHJpdmVyLCBJIGRvbid0IHRoaW5rIHlvdSBjb3VsZCByZWFsbHkKPj4+IGV4cGVjdCBh
bnlvbmUgdG8gbW92ZSB0byBhIG5ldyBiaW5kaW5nIGFueXdheS4KPj4KPj4gRmFpciBlbm91Z2gu
IFRoZSBkcml2ZXIgaXMgYWxyZWFkeSB0aGVyZSBhbmQgaXQgYmFzaWNhbGx5IHdvcmtzIC0KPj4g
RmxhdmlvIGlzIGFscmVhZHkgdXNpbmcgaXQuIEl0IGlzIGp1c3QsIHRoYXQgYXQgdGhlIG1vbWVu
dCB5b3UgaGF2ZQo+PiB0byB1c2UgdGhlIChkZXByZWNhdGVkKSAiYXRtZWwsYXQyNSIgY29tcGF0
aWJsZSBhbmQgeW91J2xsIGhhdmUgdG8KPj4gc3BlY2lmeSBwYWdlc2l6ZSBldGMuIFRoYXQgaXMg
cmVhbGx5IGhhY2t5LCBiZWNhdXNlIEYvTVJBTSBkZXZpY2VzCj4+IGRvZXNuJ3QgaGF2ZSBhIHBh
Z2VzaXplLgo+Pgo+PiBBbnl3YXksIEkgd2FzIGFscmVhZHkgd29ya2luZyBvbiB0aGUgYXQyNSBi
aW5kaW5nIGJ1dCB0aGVuIEkndmUKPj4gbm90aWNlZCB0aGF0IHRoZSBjdXJyZW50IEZSQU0gYmlu
ZGluZyBpcyByZWFsbHkgaGFyZGNvZGVkIHRvIGN5cHJlc3MKPj4gZGV2aWNlcyBhbmQgYXMgbWVu
dGlvbmVkIGluIHRoZSBjb21taXQgbWVzc2FnZSwgSSBkb24ndCBoYXZlIGFueQoKVGFrYWhpcm8g
ZnJvbSBjYyBtYXkgaGVscCB3aXRoIHRoZSBjeXByZXNzIEZSQU0gdGVzdGluZy4KCj4+IGhhcmR3
YXJlIHRvIGFjdHVhbGx5IHdyaXRlIHRoZSBwcm9wZXIgZHJpdmVyIHN1cHBvcnQuIE1heWJlIHdl
Cj4+IHNob3VsZCBzZXR0bGUgb24gdGhlIGJpbmRpbmcgZmlyc3QsIGkuZS4KPj4KPj4gIGNvbXBh
dGlibGUgPSAiZXZlcnNwaW4sbXIyNSIsICJhdG1lbCxhdDI1IjsKPj4gIHNpemUgPSA8Tj47Cj4+
Cj4+IHZzCj4+Cj4+ICBjb21wYXRpYmxlID0gImV2ZXJzcGluLG1yMjVoMjU2IjsgIyBubyBzaXpl
IG5lZWRlZAo+IAo+IEkgZHVubm8sIEkgYW0gdXN1YWxseSBiaWFzZWQgdG8gaGF2aW5nIHRoZSBt
b3JlIHNwZWNpZmljIGNvbXBhdGlibGUKPiBhbmQgbm90IG5lZWRpbmcgdGhlIGV4dHJhIHByb3Bl
cnRpZXMuCgpJIGFncmVlIHdpdGggdGhlIG1vcmUgc3BlY2lmaWMgY29tcGF0aWJsZSBpZGVhLCBi
dXQgd2Ugc2hhbGwgYWltIHRoYXQKdGhlIHNwZWNpZmljIGNvbXBhdGlibGUgdG8gYmUgZ2VuZXJp
YzogInNwaS1mcmFtIiBhbmQgbWF5YmUgInNwaS1tcmFtIi4KQ2FuIGl0IGJlIGRvbmU/Cgo+IAo+
Pgo+PiBGb3IgcmVmZXJlbmNlLCB0aGUgYWxyZWFkeSBzdXBwb3J0ZWQgY3lwcmVzcyBmcmFtIGhh
cyB0aGUgZm9sbG93aW5nOgo+Pgo+PiAgY29tcGF0aWJsZSA9ICJjeXByZXNzLGZtMjUiLCAiYXRt
ZWwsYXQyNSI7Cj4+ICAjIG5vIHNpemUgbmVlZGVkLCBiZWNhdXNlIHRoZSBkcml2ZXIgd2lsbCBm
aWd1cmUgaXQgb3V0IGJ5IHJlYWRpbmcKPj4gICMgdGhlIElECj4+Cj4+IEJlc2lkZXMgdGhhdCwg
SSB3b3VsZCByZWFsbHkgZ2V0IHNvbWUgZmVlZGJhY2sgZnJvbSB0aGUgdGhyZWUKPj4gaW4tdHJl
ZSB1c2VycyBvbiBtaWdyYXRpbmcgdG8gdGhlIEVFUFJPTSBkcml2ZXIgYW5kIHRodXMgYXdheSBm
cm9tCj4+IE1URC4KPj4KPj4gLW1pY2hhZWwKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
