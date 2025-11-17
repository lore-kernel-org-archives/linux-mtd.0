Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F3CCEACEF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 08:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SR5ienjiSiWA2AqiOM7cxQ3x61o9RUvbjRwPlecLXQ4=; b=k2YJAiTLmfCby3
	4gr4hp8hlij29cSXwOARgy5zHWNW/6SgK3IrtXLL7upr8qb6aoavAtuGBkw8bBVj4J4vKYBefNurp
	0m6guPaxqs+aVIQyFD35IvhYGFrAqCXJriZ+R0XclzvNbG2EFiT6S6h5ldxlnj2mxnY5WsFYc6c4k
	NPQE074rMxLsX1bygHfzMz2kWfoFK84ISYCHgqRikiHWq6nrvl9jOBYgtD62amKffyXQ5Qj5Fb/We
	ZbNanTVNXl6kob4BYQSofQ/YetoRvl3l0D20LUJkpk/kmuoDhlkDAm9wArC2yxUYDrVczhr+aB8Tb
	O33HjNyvXEkRpRcW2hvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuLp-0000000Ffiw-0lvG;
	Mon, 17 Nov 2025 08:12:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuLl-0000000Ffh3-40kE
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 08:12:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 508EE1A1B5E;
	Mon, 17 Nov 2025 08:12:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1800F606B9;
	Mon, 17 Nov 2025 08:12:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5980C10371CF0;
	Mon, 17 Nov 2025 09:12:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763367152; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ca1ws7C0a0JMPD5p+/mpJ8vbvGGYtVhejgkFgRsapx8=;
	b=n59LmIrmJV6jSm/KQRMwLY7GoB61jBei0u1ByftBStdTogkZoYbYsVfEFenN6EhnKQAeI5
	5KG+EZ/VXdLs48Dub2cU8TWTxtY2ITG+ulRiyhEbCywkCm7EvjJmaIMH2IXINtyI4tNHUW
	w9AoFm3kH0J7xxNY8DQ0gWDuDRi3D7OvHkO9i0pge/IqFAwmFqeFa0GP/RglgN3sp/RdNr
	MTHDL+GgqEOZi0wTE9da8FxyPzIxPgYHBVm7gO9HFIq/LYPB3MxtpmXePuFnJuPwQ5CPYZ
	euEihXUyVxlX7jRkc7bGKK1dLRRiUEuIPU8wc/quWF/BKCk/77TCr+ehvJnfkA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,  Robert Jarzmik <robert.jarzmik@free.fr>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: docg3: fix kernel-doc warnings
In-Reply-To: <20251116070944.84071-1-rdunlap@infradead.org> (Randy Dunlap's
	message of "Sat, 15 Nov 2025 23:09:44 -0800")
References: <20251116070944.84071-1-rdunlap@infradead.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 17 Nov 2025 09:12:29 +0100
Message-ID: <874iqtf576.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_001238_487987_87570499 
X-CRM114-Status: GOOD (  15.54  )
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

SGkgUmFuZHksCgpPbiAxNS8xMS8yMDI1IGF0IDIzOjA5OjQ0IC0wOCwgUmFuZHkgRHVubGFwIDxy
ZHVubGFwQGluZnJhZGVhZC5vcmc+IHdyb3RlOgoKPiBGaXgga2VybmVsLWRvYyB3YXJuaW5ncyBp
biBkb2NnMy5oIHRvIGF2b2lkIGJ1aWxkIHdhcm5pbmdzIGFuZCB0bwo+IGltcHJvdmUgYW5kIGRv
Y3VtZW50YXRpb246CgoidG8gaW1wcm92ZSBhbmQgZG9jdW1lbnRhdGlvbiIgaXMgaW5jb3JyZWN0
LCBjYW4geW91IHBsZWFzZSBmaXg/Cgo+IFdhcm5pbmc6IC4uL2RyaXZlcnMvbXRkL2RldmljZXMv
ZG9jZzMuaDoyNzYgYmFkIGxpbmU6Cj4gV2FybmluZzogZHJpdmVycy9tdGQvZGV2aWNlcy9kb2Nn
My5oOjI5OSBzdHJ1Y3QgbWVtYmVyICdtYXhfYmxvY2snIG5vdAo+ICBkZXNjcmliZWQgaW4gJ2Rv
Y2czJwo+Cj4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5v
cmc+Cj4gLS0tCj4gQ2M6IFJvYmVydCBKYXJ6bWlrIDxyb2JlcnQuamFyem1pa0BmcmVlLmZyPgo+
IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IENjOiBSaWNo
YXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IENjOiBWaWduZXNoIFJhZ2hhdmVuZHJh
IDx2aWduZXNockB0aS5jb20+Cj4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
LS0tCj4gIGRyaXZlcnMvbXRkL2RldmljZXMvZG9jZzMuaCB8ICAgIDMgKystCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IC0tLSBsaW51eC1uZXh0
LTIwMjUxMTE0Lm9yaWcvZHJpdmVycy9tdGQvZGV2aWNlcy9kb2NnMy5oCj4gKysrIGxpbnV4LW5l
eHQtMjAyNTExMTQvZHJpdmVycy9tdGQvZGV2aWNlcy9kb2NnMy5oCj4gQEAgLTI3NCwxMSArMjc0
LDEyIEBAIHN0cnVjdCBkb2NnM19jYXNjYWRlIHsKPiAgICogQGNhc2NhZGU6IHRoZSBjYXNjYWRl
IHRoaXMgZGV2aWNlIGJlbG9uZ3MgdG8KPiAgICogQGRldmljZV9pZDogbnVtYmVyIG9mIHRoZSBj
YXNjYWRlZCBEb0NHMyBkZXZpY2UgKDAsIDEsIDIgb3IgMykKPiAgICogQGlmX2NmZzogaWYgdHJ1
ZSwgcmVhZHMgYXJlIG9uIDE2Yml0cywgZWxzZSByZWFkcyBhcmUgb24gOGJpdHMKPiAtCj4gKyAq
CgpXcm9uZyBmaXggSSBiZWxpZXZlLiBXaGF0IG1ha2UgeW91IHRoaW5rIGEgc3BhY2UgaXMgcmVs
ZXZhbnQgaGVyZT8KCj4gICAqIEByZWxpYWJsZTogaWYgMCwgZG9jZzMgaW4gbm9ybWFsIG1vZGUs
IGlmIDEgZG9jZzMgaW4gZmFzdCBtb2RlLCBpZiAyIGluCj4gICAqICAgICAgICAgICAgcmVsaWFi
bGUgbW9kZQo+ICAgKiAgICAgICAgICAgIEZhc3QgbW9kZSBpbXBsaWVzIG1vcmUgZXJyb3JzIHRo
YW4gbm9ybWFsIG1vZGUuCj4gICAqICAgICAgICAgICAgUmVsaWFibGUgbW9kZSBpbXBsaWVzIHRo
YXQgcGFnZSAyKm4gYW5kIDIqbisxIGFyZSBjbG9uZXMuCj4gKyAqIEBtYXhfYmxvY2s6IG1heGlt
dW0gYmxvY2sgbnVtYmVyIGZvciB0aGlzIGRldmljZQo+ICAgKiBAYmJ0OiBiYWQgYmxvY2sgdGFi
bGUgY2FjaGUKPiAgICogQG9vYl93cml0ZV9vZnM6IG9mZnNldCBvZiB0aGUgTVREIHdoZXJlIHRo
aXMgT09CIHNob3VsZCBiZWxvbmcgKGllLiBpbiBuZXh0Cj4gICAqICAgICAgICAgICAgICAgICBw
YWdlX3dyaXRlKQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
