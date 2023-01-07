Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC31C46467
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Jan 2023 14:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cWtz1UStxk988fI6NIQfSfQ1M8bRIioJ57fD3QLIRGc=; b=g3VPIUpQbpSwje
	Gc5oFAUlqWuYNmm9bQgr9RfqqO3+ua0f73CKtngLDu/6dVDGLnTvor5zaHW1ALlKM+jgsP6mIcMbt
	CkeXCjLxTx/P5xmLqZ60XQ96ADDbrJwMAnvFQooAaxXfIbRqCRUf/ocVhf1ovbNqjqMRQ4KR2qUDh
	IE9y0xRhuuXRhD8MTzNMjtk3F2Tq87sa4elY8gQcMoqh5OUyWa7uPO3oDWx5jCRkcqzKkdRqSJpMU
	0eZQR9lPp5LILMwdcNpGYG/4IcUNZQ2KMETFSAah6otZcscjnnEjMZGDwoL/Qdq1mVKhv3QrFCS+H
	MzgzVWU0cuJDEp5r0gDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEA1A-006Uf2-1S; Sat, 07 Jan 2023 14:17:52 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEA0u-006U0L-BD; Sat, 07 Jan 2023 14:17:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C534E1C0003;
	Sat,  7 Jan 2023 14:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673101050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3vSlD9vjCmzG/8rJElMrfdFbS1XrvDaONmQUsaXCWKY=;
	b=Kf2+8JwqCfDZofc4LQX/Nss0zvoyIjOfD4HtDOPTgIkrMThTREIpUk7EN8Xp1JApjr7Gf6
	yg30je3wDF8CzQkbv0xu3KTrN7GMvtgt3LZKzLCEW/QbJvq/BJ5ZD+y8fF1PiVsNWczFgv
	XWNKbjySPTftTVh/fs9k/h1HYKZbMSR9o39T5dbgky4rw2Zg1Trkhu7RkTfhmQ6x8zvYmG
	Rcpx9Mo0F1gTrFO3CKN1JoKocyu/bzOR25dAwj55Wv/SSP5YbmBmAJIgP5NtzyieHR7ool
	r/CgQLx3iyNPAP1+fH2m9+VxzXaJnzXo7+7BEvS4nrrZj+/RQmW2YWqYoJ+y8w==
Date: Sat, 7 Jan 2023 15:17:22 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, <arnd@arndb.de>, <richard@nod.at>,
 <krzysztof.kozlowski+dt@linaro.org>, <herbert@gondor.apana.org.au>,
 <robh+dt@kernel.org>, <claudiu.beznea@microchip.com>, <broonie@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <pratyush@kernel.org>, <michael@walle.cc>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] MAINTAINERS: Update email of Tudor Ambarus
Message-ID: <20230107151722.743401bf@xps-13>
In-Reply-To: <20230106164751.7ddaf5c54e0a764344806848@linux-foundation.org>
References: <20221226144043.367706-1-tudor.ambarus@linaro.org>
	<feb09bac-0ea4-9154-362b-6d81cba352a8@linaro.org>
	<678ad800-7a3b-e2bf-6428-f06d696d8edb@linaro.org>
	<20230106165506.0a34fa78@xps-13>
	<f653b23f-cf25-61ec-60d4-91dd7823edd2@microchip.com>
	<20230106164751.7ddaf5c54e0a764344806848@linux-foundation.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_061738_532468_A6A97612 
X-CRM114-Status: GOOD (  12.72  )
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

SGkgTmljb2xhcyAmIEFuZHJldywKCmFrcG1AbGludXgtZm91bmRhdGlvbi5vcmcgd3JvdGUgb24g
RnJpLCA2IEphbiAyMDIzIDE2OjQ3OjUxIC0wODAwOgoKPiBPbiBGcmksIDYgSmFuIDIwMjMgMTY6
NTk6NTIgKzAxMDAgTmljb2xhcyBGZXJyZSA8bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tPiB3
cm90ZToKPiAKPiA+ID4gQXJlIE1BSU5UQUlORVJTIGNoYW5nZXMgYWNjZXB0ZWQgdGhyb3VnaCBm
aXhlcyBQUj8gSSBzZWUgYSBudW1iZXIgb2YKPiA+ID4gZXhwZXJpZW5jZWQgcGVvcGxlIGluIENj
OiwgSSB3b3VsZCBsaWtlIHRvIGhlYXIgZnJvbSB5b3UgZm9sa3MsIGJlY2F1c2UKPiA+ID4gSSBu
ZXZlciBoYWQgdG8gZG8gdGhhdCBiZWZvcmUuIElmIHllcywgdGhlbiBJJ2xsIGRvIGl0IHJpZ2h0
IGF3YXksCj4gPiA+IG90aGVyd2lzZSBJJ2xsIGFwcGx5IHRvIG10ZC9uZXh0LiBJJ20gYWxsIGVh
cnMgOikgIAo+ID4gCj4gPiBJIHJlbWVtYmVyIGEgY29udmVyc2F0aW9uIHRoYXQgc3RhdGVkIHRo
YXQgTUFJTlRBSU5FUlMgY2hhbmdlcyBtdXN0IGxhbmQgCj4gPiBpbiBMaW51cycgdHJlZSB0aGUg
cXVpY2tlc3QsIGJlY2F1c2UgaXQnbGwganVzdCBhdm9pZCBjb25mdXNpb24gYW5kIAo+ID4gYm91
bmNpbmcgZW1haWxzLiAgCj4gCj4gWWVzLCBJIGFsd2F5cyBtZXJnZSBNQUlOVEFJTkVSUyBmaXhl
cyBhc2FwLgo+IAo+IFByb2JhYmx5IHRoZXNlIGZpeGVzIHNob3VsZCBiZSBiYWNrcG9ydGVkIGlu
dG8gLXN0YWJsZSBrZXJuZWxzIGFsc28gLQo+IHdlIGRvbid0IHdhbnQgaW5jb3JyZWN0IGVtYWls
IGFkZHJlc3NlcyBpbiAqYW55KiBrZXJuZWwuICBCdXQgSSBkb24ndAo+IGRvIHRoYXQuCgpUaGFu
a3MgYSBsb3QgZm9yIHlvdXIgZmVlZGJhY2ssIEknbGwgdGFrZSBjYXJlIG9mIGl0LgoKQ2hlZXJz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
