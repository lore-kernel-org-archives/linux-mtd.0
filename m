Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C246C43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 13:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Op6QSeyYt5jwxXKyYvm8Bt+/Ek2ClJt28q30IhkQN6g=; b=zJ3TSv/KB8lwy+
	/hOw24C0pfQP4Zt/agHvH4QfeYcf+zn7GdAbewM8xiyne0fvi7jIZjPDZ/0xFE1onuH5bjcbOh4NY
	Yuq+KfcFsN7TIVxm/xf820YXfP9hm9/1quJoySC9B82rwvrs2rY8UeXwW446n0GNUQGTw/k+Wl55l
	KtTWGc82JSaTOM8xzcx+/NGEepxlleglGjuTTpBwcuVlsEpKBNlAHZErHpqp0/dAT332eLL+tuBjA
	nSq2bVBObHmouj3wElsUqXubg4TtDO4IZonfHAmcKaJicvyXLQ6nlGCLOvlRz4/KxgMgiBB4PeB2G
	9HaETU0mAXzedj7kxyXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjdb-0000000CeIP-1zGs;
	Mon, 06 Jul 2026 13:45:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjdW-0000000CeAZ-2oTz
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 13:45:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8E8924E40CB2;
	Mon,  6 Jul 2026 13:45:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D91F601A2;
	Mon,  6 Jul 2026 13:45:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E84D11BB96B6;
	Mon,  6 Jul 2026 15:45:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783345521; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MOT9NILUsJfEsKS9HNrbXmBhyVr3vywo7d2Dyi6BPHE=;
	b=NMHrrFunwGIV3DI6HTWpfRLYEm2k39hTTb9xiBvNkha6VmePhBWCPIGtUcvSEhqZ9uVt+v
	GhmsCbGJoXG1wckFjQ54dNa1An5m9bReDstio7kBPlIdRTXYt9cxAt8lzG9VmljO35YW06
	bV9i/SB28/emS34Fsbpwtump0Ls0xyT5nS4R8rYcwmppypKdYoDj2RSvLdXuX9Wohteg/9
	MnYkdojMQswOHH0ARMu6u8IocYg7FyM5k7BbNtndwv7fJo/TbMcqR5i+9pJMINgSZrDVIB
	i3/zAufO6t4axAzqebhByzns/dRB7LETHzVhP5sif7Qu7q2TGIurqTSgOzzeAQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Tudor Ambarus"
 <tudor.ambarus@linaro.org>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/3] mtd: spi-nor: Rework flash parameter
 initialization
In-Reply-To: <DJRBBKVZJCK1.31E3LISI9XG5L@kernel.org> (Michael Walle's message
	of "Mon, 06 Jul 2026 09:33:38 +0200")
References: <20260601125438.3481722-1-mwalle@kernel.org>
	<178331904816.868671.4599503585231715805.b4-ty@bootlin.com>
	<DJRBBKVZJCK1.31E3LISI9XG5L@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 06 Jul 2026 15:45:19 +0200
Message-ID: <87zf04kz9s.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_064526_855944_5ADE6AA7 
X-CRM114-Status: GOOD (  14.83  )
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

SGVsbG8sCgpPbiAwNi8wNy8yMDI2IGF0IDA5OjMzOjM4ICswMiwgIk1pY2hhZWwgV2FsbGUiIDxt
d2FsbGVAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IE9uIE1vbiBKdWwgNiwgMjAyNiBhdCA4OjI0IEFN
IENFU1QsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IE9uIE1vbiwgMDEgSnVuIDIwMjYgMTQ6NTI6
NDIgKzAyMDAsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+PiBUcnkgdG8gc2ltcGxpZnkgdGhlIGZs
YXNoIGluaXRpYWxpemF0aW9uIGFuZCBnZXQgcmlkIG9mIHRoZSBsZWdhY3kKPj4+IGhhbmRsaW5n
LiBBcyBkZWZhdWx0LCBhbGwgdGhlIGZsYWdzIG9mIHRoZSBpbi1rZXJuZWwgZGF0YWJhc2UgYXJl
Cj4+PiB0YWtlbiBhbmQgYW1lbmRlZCB3aXRoIHRoZSBTRkRQIGRhdGEuCj4+PiAKPj4+IFRoaXMg
bWlnaHQgaGF2ZSB0aGUgY29uc2VxdWVuY2UgdGhhdCBhbGwgdGhlIGZsYXNoZXMgbm93IGdldCBh
Cj4+PiBSRFNGUEQgb3Bjb2RlIHdoaWNoIG1pZ2h0IGJlIGFuIHVua25vd24gb3Bjb2RlLiBCdXQg
dGhhdCB3YXMgYWxyZWFkeQo+Pj4gdGhlIGNhc2UgZm9yIGFueSBmbGFzaGVzIHdoaWNoIHdlcmUg
dW5rbm93biB0byB0aGUgbGludXgga2VybmVsLiBTbwo+Pj4gZmFyLCB0aGVyZSB3YXMgbm90IGEg
c2luZ2xlIGNvbXBsYWludC4KPj4+IAo+Pj4gWy4uLl0KPj4KPj4gQXBwbGllZCB0byBtdGQvZml4
ZXMsIHRoYW5rcyEKPj4KPj4gWzEvM10gbXRkOiBzcGktbm9yOiBzcGFuc2lvbjogczI1ZmwyNTZz
MDogcmVtb3ZlIFNLSVBfU0ZEUCBmbGFnCj4+ICAgICAgIChubyBjb21taXQgaW5mbykKPj4gWzIv
M10gbXRkOiBzcGktbm9yOiBkb24ndCBjbGVhciB0aGUgU05PUl9GXzRCX09QQ09ERVMgZmxhZyBv
biBmYWlsdXJlCj4+ICAgICAgIChubyBjb21taXQgaW5mbykKPj4gWzMvM10gbXRkOiBzcGktbm9y
OiByZXdvcmsgZmxhc2ggcGFyYW1ldGVyIGluaXRpYWxpemF0aW9uCj4+ICAgICAgIChubyBjb21t
aXQgaW5mbykKPj4KPj4gUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4
LmdpdCBhbmQgd2lsbCBiZQo+PiBwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5v
IHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KPgo+IERpZCB5b3Ugc2VlLCB0aGF0IHRoZXJlIHdh
cyBhIHYxIG9mIHRoaXMgc2VyaWVzPyBUaGVyZSB3YXNuJ3QgbWFueQo+IGNoYW5nZXMgZm9yIHRo
ZXNlIHRocmVlIHBhdGNoZXMuIEp1c3Qgd2hhdCBUdWRvciBtZW50aW9uZWQgdGhhdCB0aGUKPiB1
bnN1cHBvcnRlZCBSRFNGRFAgb3Bjb2RlIHNob3VsZCBiZSBtZW50aW9uZWQgaW4gdGhlIGNvbW1p
dCBtZXNzYWdlLAo+IHRvby4KPgo+IEFwYXJ0IGZyb20gdGhhdCwgdGhlIHNlcmllcyBub3cgaW5j
bHVkZXMgZml4ZXMgdGhhdCBTYXNoaWtvIGZvdW5kLAo+IHRoYXQgaXMsIHRoZSByb2xsYmFjayBp
biBjYXNlIG9mIGEgZmFpbGVkIFNGRFAgcGFyc2luZyBpcyBicm9rZW4uIEkKPiBjYW4gYWxzbyBy
ZWJhc2UgdGhhdCBvbiB0b3Agb2YgdGhlc2UgdGhyZWUgcGF0Y2hlcy4KClNvcnJ5LCBJIGFjdHVh
bGx5IGFwcGxpZWQgaXQgbGFzdCBGcmlkYXkgYW5kIHB1c2hlZCBvbmx5IHRoaXMgbW9ybmluZy4g
SQp3aWxsIGRyb3AgdGhlIHBhdGNoZXMgYW5kIGFwcGx5IHYxLgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
