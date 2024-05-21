Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551C3C25B74
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2024 12:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpGPT/HwIiMj0NdfAV8YxjEkaTIH0cKxYWdRsvP819c=; b=0SkzaEfv9J9ltN
	VOKxyJMfEqiYCWKcRFI4DzZZLwKu/+vPHNpojX6aCvMqPCUnmqSy4ZJURDRk/T7gGXxCvt82XYoD0
	wQwWJMvUQb12h/DqH8Cqgi9XMbzbUXWYs4acrh2RJmLrFTTKa+90TMA7XsHwizZ4fvbrTpXQ3lLzU
	/+fmgXqo+dXXLDpnM1Mz6TrBS6DFFng3LgeGPvCOtEY8k8yo2KSbOIcy6uWf+R1MpGk68ekab/pOS
	6SYOSq3ASePVnU9+bwpaXZn9+POV8+Wjhh+vNOt/Ppd9OrEhAvKjcDqzODV+uRVvZ8vrBk5oO0B2D
	ALLnXVT10XDO+Y4FaTsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9OyC-0000000HUee-3SQS;
	Tue, 21 May 2024 12:51:56 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Oy8-0000000HUdy-29KY
	for linux-mtd@lists.infradead.org;
	Tue, 21 May 2024 12:51:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 755B4C0003;
	Tue, 21 May 2024 12:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716295906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Omcb3hmFzLM0PKq5FT4qc5DXx74BroUN9lLWyMAGIEY=;
	b=Fn7TJR7Jra9ZpK15bDB3o7qBNfTwpcPl6DSumQgmazugCe/z6ztB/P2qDSdecb5kXB7nKL
	G1yy4xnzlpow7F1p7Rpot/bSF1ozu0Ke+Wmn6plg6tUO9Y4W7b9+lxm+qXWE8GMlYNfgh6
	XJjyG85wHN8TsOucgowOWTvjT4Li7audLDxSPZP9Nq3jA6ztOVxo+H1i6wDGQeQeh42vBy
	Uvtjt9SQbm8pSD1dsZgNVQeRF1rd/TNTkXvlvbp4UFfn21HeyJTGLJVY2fXOgEqUXp8387
	oMjC2bM0amVfzhfXLVJqB/cefM0SqvskRRUr2rLzOpwZv3uSZZS2yxYxqH+/Nw==
Date: Tue, 21 May 2024 14:51:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 richard@nod.at, vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, quic_srichara@quicinc.com,
 quic_varada@quicinc.com
Subject: Re: [PATCH v6 4/8] drivers: mtd: nand: Add qpic_common API file
Message-ID: <20240521145140.5cb49946@xps-13>
In-Reply-To: <20240521105532.1537845-5-quic_mdalam@quicinc.com>
References: <20240521105532.1537845-1-quic_mdalam@quicinc.com>
	<20240521105532.1537845-5-quic_mdalam@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_055152_804963_3E4D5FF1 
X-CRM114-Status: GOOD (  11.91  )
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

SGksCgo+ICBkcml2ZXJzL210ZC9uYW5kL01ha2VmaWxlICAgICAgICAgICAgfCAgICA0ICstCj4g
IGRyaXZlcnMvbXRkL25hbmQvcXBpY19jb21tb24uYyAgICAgICB8ICA3NDAgKysrKysrKysrKysr
KysrKysKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jICAgIHwgMTA5MCArLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L210ZC9uYW5kLXFwaWMtY29t
bW9uLmggfCAgNDY3ICsrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTIyMiBpbnNlcnRp
b25zKCspLCAxMDc5IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9t
dGQvbmFuZC9xcGljX2NvbW1vbi5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4
L210ZC9uYW5kLXFwaWMtY29tbW9uLmgKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFu
ZC9NYWtlZmlsZSBiL2RyaXZlcnMvbXRkL25hbmQvTWFrZWZpbGUKPiBpbmRleCAxOWUxMjkxYWM0
ZDUuLmU1OTEwNmUwYTNhZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL01ha2VmaWxl
Cj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9NYWtlZmlsZQo+IEBAIC0zLDcgKzMsOSBAQAo+ICBu
YW5kY29yZS1vYmpzIDo9IGNvcmUubyBiYnQubwo+ICBvYmotJChDT05GSUdfTVREX05BTkRfQ09S
RSkgKz0gbmFuZGNvcmUubwo+ICBvYmotJChDT05GSUdfTVREX05BTkRfRUNDX01FRElBVEVLKSAr
PSBlY2MtbXRrLm8KPiAtCj4gK2lmZXEgKCQoQ09ORklHX01URF9OQU5EX1FDT00pLHkpCj4gK29i
ai15CSs9IHFwaWNfY29tbW9uLm8KPiArZW5kaWYKCkJyZWFrcyBpZiB5b3Ugc2V0IENPTkZJR19N
VERfTkFORF9RQ09NID0gbQoKPiAgb2JqLXkJKz0gb25lbmFuZC8KPiAgb2JqLXkJKz0gcmF3Lwo+
ICBvYmoteQkrPSBzcGkvCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcXBpY19jb21t
b24uYyBiL2RyaXZlcnMvbXRkL25hbmQvcXBpY19jb21tb24uYwo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5kZmJiYjVmNjI2YjYKPiAtLS0gL2Rldi9udWxsCj4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9xcGljX2NvbW1vbi5jCj4gQEAgLTAsMCArMSw3NDAgQEAK
PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ICsvKgo+ICsgKiBD
b3B5cmlnaHQgKGMpIDIwMTYsIFRoZSBMaW51eCBGb3VuZGF0aW9uLiBBbGwgcmlnaHRzIHJlc2Vy
dmVkLgo+ICsgKi8KPiArI2luY2x1ZGUgPGxpbnV4L2JpdG9wcy5oPgo+ICsjaW5jbHVkZSA8bGlu
dXgvY2xrLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ICsjaW5jbHVkZSA8bGludXgv
ZG1hZW5naW5lLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgo+ICsjaW5jbHVk
ZSA8bGludXgvZG1hL3Fjb21fYWRtLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9kbWEvcWNvbV9iYW1f
ZG1hLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiArI2luY2x1ZGUgPGxpbnV4L210
ZC9wYXJ0aXRpb25zLmg+CgpEaWRuJ3QgeW91IHNheSB5b3Ugd291bGQgcmVtb3ZlIHRoYXQgaW5j
bHVkZT8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
