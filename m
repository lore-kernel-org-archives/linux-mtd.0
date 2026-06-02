Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365A5CD6E4A
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2026 12:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUBg36TlxIcPtgas6EDTulY5FDg20zQ49TxaGcgNhNM=; b=boVdAHCRj8Ew9o
	4OdIkaUCSTg6ey4JX7kHngzUJE44AIq7fxjkJKAckZBIMlIu+qn/wFWjyGlDE5GaDsaXb/ZClSmau
	52HGcTBKHcUVfwWPYUhAvpB4ToRiQDIAiglqrP4MEUOQcyA4KLoPA9KklPQcHOshEdX4LnBqdLVhw
	LGGMpj8N/O+00MXvm9/ToE4O+/Kk1QAV8/CrBRWNR7xZMHVPstjZh3zIOGkjTYNsq19QCOq95vcLS
	Hwc4cgCRezTUjbcIXkqnX6y+R0rYJdmLZqJIryv1/1o2phjbARq1CA2HreP6UmVphOzsjqP9AMzkH
	DV6fSVVnLI6JujKO0CNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUO2C-0000000CxLN-3FYF;
	Tue, 02 Jun 2026 12:15:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUO29-0000000CxKH-3DdP
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jun 2026 12:15:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 93B934E42DC0;
	Tue,  2 Jun 2026 12:15:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59A10603BC;
	Tue,  2 Jun 2026 12:15:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1CE18108883E7;
	Tue,  2 Jun 2026 14:15:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780402545; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p03ztj6XSIMc7U28VJy2jGNEbLmsRiEcsPXWwsoNno0=;
	b=zPImwJiEpyRoEUx8ORaIHzQQ70oK9xBRu+e+8Voz+bIj3qh9kKCet36pw+ptqHSD/yuio+
	ankAlAIZHatk1GDUxy41rcvREjNFWsKlEuBqmG7eBeMQbc44MWy+Rk2sROFzuC3xTVpsEF
	0C6jJwhbQ2nxv1xjj7h3AiF0gJj/hCUEBJfdmqhc5o1Yrpy05UaZk1Eq01rtaFM32qZ2Js
	pk1e9Sr7ikQAhL51zhwMLSXb3Wlu6keOk+AHv90bv7od8wJUDIzXYzJm6iA3G7pJVPyMXJ
	LrpQnCp86wMxqu1AXkyzQvbsE9ByR6PNGHlJMf1426IZFcGIihMj+mRoYCIBuw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v3 10/13] spi: cadence-quadspi: enable PHY for direct
 reads and indirect writes
In-Reply-To: <e2a354fe-ef25-401a-b8a9-4d51ad12f429@ti.com> (Santhosh Kumar
	K.'s message of "Mon, 1 Jun 2026 14:09:58 +0530")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-11-s-k6@ti.com> <87se7bgasn.fsf@bootlin.com>
	<e2a354fe-ef25-401a-b8a9-4d51ad12f429@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 02 Jun 2026 14:15:41 +0200
Message-ID: <874ijl2l5e.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_051549_993031_A5935EB4 
X-CRM114-Status: UNSURE (   6.04  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8sCgo+Pj4gK3N0YXRpYyBib29sIGNxc3BpX3VzZV9waHkoc3RydWN0IGNxc3BpX2ZsYXNo
X3BkYXRhICpmX3BkYXRhLAo+Pj4gKwkJCSAgY29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKm9wKQo+
Pj4gK3sKPj4+ICsJcmV0dXJuIGZfcGRhdGEtPnVzZV9waHkgJiYgb3AtPmRhdGEubmJ5dGVzID4g
MTYgJiYKPj4gV2h5IGlzIHRoZSBjaGVjayBsb29raW5nIGZvciAxNiBoZXJlLCBhbmQgMWtpQiBh
Ym92ZT8KPgo+IERpcmVjdCByZWFkcyBoYXZlIHZlcnkgbGl0dGxlIHBlci1vcCBvdmVyaGVhZCwg
c28gZW5hYmxpbmcgUEhZIGlzCj4gYmVuZWZpY2lhbCBldmVuIGZvciByZWxhdGl2ZWx5IHNtYWxs
IHRyYW5zZmVycy4gKD4gMTYpCj4KPiBJbmRpcmVjdCB3cml0ZXMsIG9uIHRoZSBvdGhlciBoYW5k
LCBpbmN1ciBzaWduaWZpY2FudGx5IGhpZ2hlciBzZXR1cAo+IGNvc3QsIHJlc3VsdGluZyBpbiBt
dWNoIGxhcmdlciBicmVhayBwb2ludC4gKD4gMWtpQikKCk9rLCB0aGlzIHByb2JhYmx5IGRlc2Vy
dmVzIHRvIGJlIGRlZmluZWQsIGVnLgoKI2RlZmluZSBNSU5fRElSX1JFQUQvSU5ESVJfV1JJVEVf
TEVOX0ZPUl9QSFkKCkFuZCBhIGNvbW1lbnQgd291bGQgYmUgdmVyeSB3ZWxjb21lIHRvIGV4cGxh
aW4gdGhlc2UgYXJiaXRyYXJ5IGNob2ljZXMuCgpUaGV5IGNhbiBwcm9iYWJseSBiZSBpbXByb3Zl
ZCBmdXJ0aGVyIGxhdGVyLgoKPj4+ICAgCWRkZXYgPSBjcXNwaS0+cnhfY2hhbi0+ZGV2aWNlLT5k
ZXY7Cj4+PiAgIAlkbWFfZHN0ID0gZG1hX21hcF9zaW5nbGUoZGRldiwgYnVmLCBsZW4sIERNQV9G
Uk9NX0RFVklDRSk7Cj4+PiAgIAlpZiAoZG1hX21hcHBpbmdfZXJyb3IoZGRldiwgZG1hX2RzdCkp
IHsKPj4+ICAgCQlkZXZfZXJyKGRldiwgImRtYSBtYXBwaW5nIGZhaWxlZFxuIik7Cj4+PiAgIAkJ
cmV0dXJuIC1FTk9NRU07Cj4+PiAgIAl9Cj4+PiAtCXR4ID0gZG1hZW5naW5lX3ByZXBfZG1hX21l
bWNweShjcXNwaS0+cnhfY2hhbiwgZG1hX2RzdCwgZG1hX3NyYywKPj4+IC0JCQkJICAgICAgIGxl
biwgZmxhZ3MpOwo+Pj4gKwl0eCA9IGRtYWVuZ2luZV9wcmVwX2RtYV9tZW1jcHkoY3FzcGktPnJ4
X2NoYW4sIGRtYV9kc3QsIGRtYV9zcmMsIGxlbiwKPj4+ICsJCQkJICAgICAgIGZsYWdzKTsKPj4g
Tm90IHJlbGF0ZWQgdG8gdGhlIGNoYW5nZSwgaXNuJ3QgaXQ/Cj4KPiBZZWFoLCBub3QgcmVsYXRl
ZCBJJ2xsIGxlYXZlIHRoaXMgdW50b3VjaGVkLiBIb3dldmVyLCB0aGUgY2hhbmdlcyBhYm92ZQo+
IGFuZCBiZWxvdyBhcmUgcmVsYXRlZCBhbmQgYmVsb25nIHRvZ2V0aGVyIGluIHRoZSBzYW1lIHBh
dGNoLgoKVGhleSBzaG91bGQgbGlrZWx5IGJlIGRvbmUgaW4gYSBwcmVwYXJhdGlvbiBwYXRjaC4K
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
