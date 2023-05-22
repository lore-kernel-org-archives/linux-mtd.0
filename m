Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02C9C7EE23
	for <linux-mtd@archiver.kernel.org>; Mon, 22 May 2023 15:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoNPjkfu3504vlOszUYcz7/NmT13LBeivvEiBa3A9uk=; b=DokZXerH8wfw9n
	DtOuvCq5jLMKjRE9oUV1Cxdca4lHG3S2iZzu5zmCMmX8Dz6A4eQIX6ivYWow+xPrdLBnbBuHGE78U
	3LVAzjQwcuy4lgELlI2Zj4yGSJCYJDBAiGAVQc8VPUGMau2rL27kd4ijhiweqH6eGBU42AcwgGmc2
	mD+quu02MJBeTRs4quu8v+opea7OPQo/pnnD26bgAMWu9l/whTPTobVEqrOAUVWTKheUzP1iw2OA1
	KebPzems15XvYlFa/AgfKQcGrHarpX7LO8xAVZTaLHvraFUDV3I74CzXOJwtWMTayEbNiR9s/mw+v
	R6skR7OpJr4MJT+pYOMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q17kF-00750z-0Q;
	Mon, 22 May 2023 15:46:47 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q17kC-0074zW-0Q
	for linux-mtd@lists.infradead.org;
	Mon, 22 May 2023 15:46:45 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 91999E0002;
	Mon, 22 May 2023 15:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684770398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pI3C+U+LkZPRCdvh2AIdDV8xoT+44ar4D3GHeccQWGE=;
	b=R0Y6n1ahYUWbNzKwBGmqnlzlF56R36DVZ3Tlr43VOrtBopOXtyLb73IAmRUhb33prQ2gCw
	zYffta3tMUR1YUC+zZFWOHrh0btAKAWSHQnodwcUiPgDro1Wb5jIcy//1yHNqVoj3pS6pJ
	2ev55puOO5JuQD6Ux/fcTp/xGflgYH2Ldg13KoQl6erk+QzIN+4FrusEpf38h/8OFdeOei
	0C5DDZwizqT9vw4nHtOFnBaiZNwLvTR/enE14oawhnpX68VqG27hPc5mOqaj6c6pWUFapT
	OTnGDopFLF5tU93o7gLn1Rxoi32Nnm/9aTVVDYaQvKiA4Ba0+HXpwNk7L3m25A==
Date: Mon, 22 May 2023 17:46:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?=
 <kernel@kempniu.pl>, Arnd Bergmann <arnd@arndb.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtdchar: mark bits of ioctl handler noinline
Message-ID: <20230522174635.7acfb42c@xps-13>
In-Reply-To: <20230417205654.1982368-1-arnd@kernel.org>
References: <20230417205654.1982368-1-arnd@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_084644_341252_C71CC71C 
X-CRM114-Status: GOOD (  19.35  )
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

SGkgQXJuZCwKCmFybmRAa2VybmVsLm9yZyB3cm90ZSBvbiBNb24sIDE3IEFwciAyMDIzIDIyOjU2
OjUwICswMjAwOgoKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IFRo
ZSBhZGRpdGlvbiBvZiB0aGUgbXRkY2hhcl9yZWFkX2lvY3RsKCkgZnVuY3Rpb24gY2F1c2VkIHRo
ZSBzdGFjayB1c2FnZQo+IG9mIG10ZGNoYXJfaW9jdGwoKSB0byBncm93IGJleW9uZCB0aGUgd2Fy
bmluZyBsaW1pdCBvbiAzMi1iaXQgYXJjaGl0ZWN0dXJlcwo+IHdpdGggZ2NjLTEzOgo+IAo+IGRy
aXZlcnMvbXRkL210ZGNoYXIuYzogSW4gZnVuY3Rpb24gJ210ZGNoYXJfaW9jdGwnOgo+IGRyaXZl
cnMvbXRkL210ZGNoYXIuYzoxMjI5OjE6IGVycm9yOiB0aGUgZnJhbWUgc2l6ZSBvZiAxNDg4IGJ5
dGVzIGlzIGxhcmdlciB0aGFuIDEwMjQgYnl0ZXMgWy1XZXJyb3I9ZnJhbWUtbGFyZ2VyLXRoYW49
XQo+IAo+IE1hcmsgYm90aCB0aGUgcmVhZCBhbmQgd3JpdGUgcG9ydGlvbnMgYXMgbm9pbmxpbmVf
Zm9yX3N0YWNrIHRvIGVuc3VyZQo+IHRoZXkgZG9uJ3QgZ2V0IGlubGluZWQgYW5kIHVzZSBzZXBh
cmF0ZSBzdGFjayBzbG90cyB0byByZWR1Y2UgdGhlCj4gbWF4aW11bSB1c2FnZSwgYm90aCBpbiB0
aGUgbXRkY2hhcl9pb2N0bCgpIGFuZCBjb21iaW5lZCB3aXRoIGFueQo+IG9mIGl0cyBjYWxsZWVz
Lgo+IAo+IEZpeGVzOiAwOTViYjZlNDRlYjEgKCJtdGRjaGFyOiBhZGQgTUVNUkVBRCBpb2N0bCIp
Cj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCkkgYW0gYWJv
dXQgdG8gdGFrZSB0aGlzIGFzIHBhcnQgb2YgbXkgbmV4dCBmaXhlcyBQUiwgc2hvdWxkIHdlIENj
OgpzdGFibGU/IFdoYXQgaXMgdGhlIGN1cnJlbnQgcG9saWN5IHdydCBnY2MgdmVyc2lvbiBpc3N1
ZXM/Cgo+IC0tLQo+ICBkcml2ZXJzL210ZC9tdGRjaGFyLmMgfCA4ICsrKystLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL210ZGNoYXIuYyBiL2RyaXZlcnMvbXRkL210ZGNoYXIuYwo+IGluZGV4
IDAxZjFjNjc5MmRmOS4uOGRjNGY1YzQ5M2ZjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210
ZGNoYXIuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZGNoYXIuYwo+IEBAIC01OTAsOCArNTkwLDgg
QEAgc3RhdGljIHZvaWQgYWRqdXN0X29vYl9sZW5ndGgoc3RydWN0IG10ZF9pbmZvICptdGQsIHVp
bnQ2NF90IHN0YXJ0LAo+ICAJCQkgICAgKGVuZF9wYWdlIC0gc3RhcnRfcGFnZSArIDEpICogb29i
X3Blcl9wYWdlKTsKPiAgfQo+ICAKPiAtc3RhdGljIGludCBtdGRjaGFyX3dyaXRlX2lvY3RsKHN0
cnVjdCBtdGRfaW5mbyAqbXRkLAo+IC0JCXN0cnVjdCBtdGRfd3JpdGVfcmVxIF9fdXNlciAqYXJn
cCkKPiArc3RhdGljIG5vaW5saW5lX2Zvcl9zdGFjayBpbnQKPiArbXRkY2hhcl93cml0ZV9pb2N0
bChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG10ZF93cml0ZV9yZXEgX191c2VyICphcmdw
KQo+ICB7Cj4gIAlzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciA9IG10ZF9nZXRfbWFzdGVyKG10ZCk7
Cj4gIAlzdHJ1Y3QgbXRkX3dyaXRlX3JlcSByZXE7Cj4gQEAgLTY4OCw4ICs2ODgsOCBAQCBzdGF0
aWMgaW50IG10ZGNoYXJfd3JpdGVfaW9jdGwoc3RydWN0IG10ZF9pbmZvICptdGQsCj4gIAlyZXR1
cm4gcmV0Owo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IG10ZGNoYXJfcmVhZF9pb2N0bChzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCwKPiAtCQlzdHJ1Y3QgbXRkX3JlYWRfcmVxIF9fdXNlciAqYXJncCkKPiAr
c3RhdGljIG5vaW5saW5lX2Zvcl9zdGFjayBpbnQKPiArbXRkY2hhcl9yZWFkX2lvY3RsKHN0cnVj
dCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbXRkX3JlYWRfcmVxIF9fdXNlciAqYXJncCkKPiAgewo+
ICAJc3RydWN0IG10ZF9pbmZvICptYXN0ZXIgPSBtdGRfZ2V0X21hc3RlcihtdGQpOwo+ICAJc3Ry
dWN0IG10ZF9yZWFkX3JlcSByZXE7CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
