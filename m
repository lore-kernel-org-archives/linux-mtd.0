Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED949C4321E
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 07:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHVNH4ntldAMaKWVp9u7MUM3b1x81Giwpp1PGLo6v74=; b=efMVMdXk7qru1z3V+xflpqs0nk
	pEQ4kv8SXAWpP3jjRLJuX/Au8PATSKRDHyv20Eg8REoBCjR7kqlqmc8VSJ7nKfm4ennf2PaYmGS0N
	jwwrfPZHr/wvv/8U4y9rj09/70x9hSTX1vH0Uy0+5pxM6vm2upUkH2K7NyazVQoY7VPgGsTTO5fo0
	HR1/i6Btc8Ssms2fGRZ3xgc2KeHuCKkSMqXd6BuXSURD0b8Bp+KWm32agjzfuai6bUMBIRZ8Zq40v
	g1ixlN8BqWh6/keYu8lPWlTtBCOgFRoVPWzKCXG5LeAnFaM7N+cl6mMedwoWS7Q5a6IPwKNz75VCP
	W8eisxlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozYg2-00HLT2-Ta; Mon, 28 Nov 2022 07:35:42 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozYfq-00HLKX-Fv; Mon, 28 Nov 2022 07:35:32 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 4B31AB8B;
	Mon, 28 Nov 2022 08:35:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1669620924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ocIpEc4oly3ThjoyxNnqhXwhEE8f24PzAQ3YyFZsq0E=;
	b=GG/4fi2urRgj9huQRUua/FNJIWwhv3B1hDN4Ym4/Dg6HVd2bYkzqO/bV7gKuN3+PeT7bzD
	r3alQ09y1EwPrSx+apphusNdMyd2h+dlr9wqj0NHi9Vkb/lJKkzvPbTKB78JSPAwhVF2UM
	n/u3HAOZHS8en0x58QdmAxdrqkg0ZbB2vPyzyQ0SRucTbVB25pXWPJKTxYQliQCDpc5chQ
	jvRMqnOgC7z2QHR+BNyrie2pSqjGPLMHvuAlIyg6rp9hbvmCcD/86K3HjBlaX+5b+Ns4ym
	A6ObmnZVdq5BdB31knwrJypx8FsXg0FSeXVYgMIqNGrRoHfmN4kBYIDSohKEjQ==
MIME-Version: 1.0
Date: Mon, 28 Nov 2022 08:35:24 +0100
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, u-boot@lists.denx.de, =?UTF-8?Q?Rafa?=
 =?UTF-8?Q?=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 1/2] nvmem: core: refactor .cell_post_process() CB
 arguments
In-Reply-To: <20221128065923.1180-1-zajec5@gmail.com>
References: <20221128065923.1180-1-zajec5@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <f2bb569404903bc937fbe3840582f3c4@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_233530_715866_C7AC6B18 
X-CRM114-Status: GOOD (  13.52  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMi0xMS0yOCAwNzo1OSwgc2NocmllYiBSYWZhxYIgTWnFgmVja2k6Cj4gRnJvbTogUmFm
YcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IAo+IFBhc3Mgd2hvbGUgTlZNRU0gY2Vs
bCBzdHJ1Y3QgYW5kIGxlbmd0aCBwb2ludGVyIGFzIGFyZ3VtZW50cyB0byAKPiBjYWxsYmFjawo+
IGZ1bmN0aW9ucy4KPiAKPiBUaGlzIGFsbG93czoKPiAKPiAxLiBDZWxscyBjb250ZW50IHRvIGJl
IG1vZGlmaWVkIGJhc2VkIG9uIG1vcmUgaW5mbwo+ICAgIFNvbWUgY2VsbHMgKGlkZW50aWZpZWQg
YnkgdGhlaXIgbmFtZXMpIGNvbnRhaW4gc3BlY2lmaWMgZGF0YSB0aGF0Cj4gICAgbmVlZHMgZnVy
dGhlciBwcm9jZXNzaW5nLiBUaGlzIGNhbiBiZSBlLmcuIE1BQyBhZGRyZXNzIHN0b3JlZCBpbiBh
bgo+ICAgIEFTQ0lJIGZvcm1hdC4gTlZNRU0gY29uc3VtZXJzIGV4cGVjdCBNQUMgdG8gYmUgcmVh
ZCBpbiBhIGJpbmFyeSAKPiBmb3JtLgo+ICAgIE1vcmUgY29tcGxleCBjZWxscyBtYXkgYmUgYWRk
aXRpb25hbGx5IGRlc2NyaWJlZCBpbiBEVC4gVGhpcyBjaGFuZ2UKPiAgICBhbGxvd3MgYWxzbyBh
Y2Nlc3NpbmcgcmVsZXZhbnQgRFQgbm9kZXMgYW5kIHJlYWRpbmcgZXh0cmEgaW5mby4KPiAKPiAy
LiBBZGp1c3RpbmcgZGF0YSBsZW5ndGgKPiAgICBJZiBjZWxsIHByb2Nlc3NpbmcgcmVzdWx0cyBp
biByZWZvcm1hdHRpbmcgaXQsIGl0J3MgcmVxdWlyZWQgdG8KPiAgICBhZGp1c3QgbGVuZ3RoLiBU
aGlzIGFnYWluIGFwcGxpZXMgZS5nLiB0byB0aGUgTUFDIGZvcm1hdCBjaGFuZ2UgZnJvbQo+ICAg
IEFTQ0lJIHRvIHRoZSBieXRlLWJhc2VkLgo+IAo+IExhdGVyIG9uIHdlIG1heSBjb25zaWRlciBt
b3JlIGNsZWFudXBzICYgZmVhdHVyZXMgbGlrZToKPiAxLiBEcm9wcGluZyAiY29uc3QgY2hhciAq
aWQiIGFuZCBqdXN0IHVzaW5nIE5WTUVNIGNlbGwgbmFtZQo+IDIuIEFkZGluZyBleHRyYSBhcmd1
bWVudCBmb3IgY2VsbHMgcHJvdmlkaW5nIG11bHRpcGxlIHZhbHVlcwo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAtLS0KPiBUaGlzIHNvbHV0
aW9uIGNvbmZsaWN0cyB3aXRoIDEgcGFydCBvZiBNaWNoYWVsJ3Mgd29yazoKPiBbUEFUQ0ggdjIg
MDAvMjBdIG52bWVtOiBjb3JlOiBpbnRyb2R1Y2UgTlZNRU0gbGF5b3V0cwo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMjA5MDEyMjE4NTcuMjYwMDM0MC0xLW1p
Y2hhZWxAd2FsbGUuY2MvCj4gCj4gSW5zdGVhZCBvZjoKPiAxLiBBZGRpbmcgTlZNRU0gY2VsbC1s
ZXZlbCBwb3N0X3Byb2Nlc3MgY2FsbGJhY2sKPiAyLiBBZGRpbmcgY2FsbGJhY2sgKC5maXh1cF9j
ZWxsX2luZm8oKSkgZm9yIHNldHRpbmcgY2FsbGJhY2tzCj4gMy4gRHJvcHBpbmcgTlZNRU0gZGV2
aWNlLWxldmVsIHBvc3RfcHJvY2VzcyBjYWxsYmFjawo+IEkgZGVjaWRlZCB0byByZWZhY3RvciBl
eGlzdGluZyBjYWxsYmFjay4KPiAKPiBNaWNoYWVsJ3Mgd29yayBvbiBhZGRpbmcgI252bWVtLWNl
bGwtY2VsbHMgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGVhc2lseQo+IHJlYmFzZSBvbiB0b3Agb2Yg
dGhvc2UgY2hhbmdlcy4KCkFzIHlvdXJzIHNob3VsZCBiZSBlYXNpbHkgYWRkZWQgb24gdG9wIG9m
IG15IHNlcmllcy4gSSd2ZSBzaG93ZWQgdGhhdApwcm92aWRpbmcgYSBnbG9iYWwgcG9zdCBwcm9j
ZXNzIGhvb2sgaXMgYmFkIGJlY2F1c2UgdGhhdCB3YXkgeW91IG5lZWQKdG8gaGF2ZSAqYWxsKiBj
ZWxscyBvZiB5b3VyIGRldmljZSByZWFkLW9ubHkuCgotbWljaGFlbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
