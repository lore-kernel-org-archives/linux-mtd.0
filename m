Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405B3C7619A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 07:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PelKavs9DRD1vAp1zS4bQIYUOD/weXM+OlYW14wyMA=; b=DyYCrv4/gpCK5S
	m3VYzFrFd3gbjcpu4JZ55jdf218TWS1dECix8hiUKlnAevggxUmMdAlw4f2IlHaAuAH6GLW1U9u6v
	uZeOlfMVJhEcmr3rED/cwGdjWuinebg5cLlbwW7kcT7l2CteJYZYFSh+UaMqHcXWHhLNkWd0Ajoul
	ZXQ+bFm95RwXwl2NuQ+ez03qBobBuxx+bCAgkwEDd1hzibOgi0qk8qEbSwplaLFSGJQFr+7t14e94
	Li/cb6PrbF0mvmJmg9JY31B/iAxxD1oGfGAawW/ek9Shu4eRPGNQGg8JIvnYyB7STMIPpILYPx1SE
	XptHlqFz5ApGUsvh90uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmV4z-0027Ia-0E;
	Wed, 12 Apr 2023 07:39:45 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmV4u-0027FL-1e;
	Wed, 12 Apr 2023 07:39:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C7053100018;
	Wed, 12 Apr 2023 07:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681285168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=17BPQPrbGfoG/9Y+BnpABrCjBoUgqhojyRjXMZSD+8c=;
	b=PfRltgJ1Ic+5NX5hMrhg2PjLHxVBR8qIDRKeEQUmT9+oRHTMJXbAourYqKl0z5uG6K6TuD
	DcbxHoMVNnY3Jaol01OwcUCkcakHD+Glp6SQ22R2TPCE/9hINgQfScuE3msXJb6Oh7Xp4P
	owEbhQEurMr67d639FR00rh9BlpPievAzMuoB08vtA3/wG/Fzy4Cs3uW1hTpo0kSe5Jyw7
	s5zTNYiRtFxhVC9GlMqR0idX7pLB09VCPy9d06roQ5swBkAHoUb2jJARoVWH4n8elGKeFh
	WT7MW9yG9I2DFhK9bjqwgwms9dnr1Zx+Y1XIcGWbqYGXb+jR7fC+eIl9mO/n6g==
Date: Wed, 12 Apr 2023 09:39:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yixun Lan <yixun.lan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 3/5] mtd: rawnand: meson: check buffer length
Message-ID: <20230412093925.4718ac6f@xps-13>
In-Reply-To: <20230412061700.1492474-4-AVKrasnov@sberdevices.ru>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <20230412061700.1492474-4-AVKrasnov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_003940_831232_B5999EA7 
X-CRM114-Status: GOOD (  14.81  )
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

SGkgQXJzZW5peSwKCkFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDEyIEFw
ciAyMDIzIDA5OjE2OjU3ICswMzAwOgoKPiBXaXRoIHRoaXMgY2hpcCwgYnVmZmVyIGxlbmd0aCBp
cyBsaW1pdGVkIGJ5IGhhcmR3YXJlLCBzbyBjaGVjayBpdCBiZWZvcmUKPiBjb21tYW5kIGV4ZWN1
dGlvbiB0byBhdm9pZCBsZW5ndGggdHJpbS4KCldoYXQgaXMgInRoaXMgY2hpcCI/IEFyZSB5b3Ug
dGFsa2luZyBhYm91dCB0aGUgY29udHJvbGxlciBpdHNlbGY/IElzCnRoZXJlIGFueSBzcGVjaWZp
YyBTb0MgdmVyc2lvbiB0YXJnZXRlZD8KCj4gCj4gU2lnbmVkLW9mZi1ieTogQXJzZW5peSBLcmFz
bm92IDxBVktyYXNub3ZAc2JlcmRldmljZXMucnU+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQv
cmF3L21lc29uX25hbmQuYyB8IDE0ICsrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
NCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21l
c29uX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+IGluZGV4IDQ1
YjUzZDQyMGFlZC4uZjg0YTEwMjM4ZTRkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L21lc29uX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQu
Ywo+IEBAIC01NDMsNiArNTQzLDkgQEAgc3RhdGljIGludCBtZXNvbl9uZmNfcmVhZF9idWYoc3Ry
dWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKmJ1ZiwgaW50IGxlbikKPiAgCXUzMiBjbWQ7Cj4gIAl1
OCAqaW5mbzsKPiAgCj4gKwlpZiAobGVuID4gTkZDX0NNRF9SQVdfTEVOKQo+ICsJCXJldHVybiAt
RUlOVkFMOwo+ICsKPiAgCWluZm8gPSBremFsbG9jKFBFUl9JTkZPX0JZVEUsIEdGUF9LRVJORUwp
Owo+ICAJaWYgKCFpbmZvKQo+ICAJCXJldHVybiAtRU5PTUVNOwo+IEBAIC01NzEsNiArNTc0LDkg
QEAgc3RhdGljIGludCBtZXNvbl9uZmNfd3JpdGVfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQs
IHU4ICpidWYsIGludCBsZW4pCj4gIAlpbnQgcmV0ID0gMDsKPiAgCXUzMiBjbWQ7Cj4gIAo+ICsJ
aWYgKGxlbiA+IE5GQ19DTURfUkFXX0xFTikKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCj4gIAly
ZXQgPSBtZXNvbl9uZmNfZG1hX2J1ZmZlcl9zZXR1cChuYW5kLCBidWYsIGxlbiwgTlVMTCwKPiAg
CQkJCQkgMCwgRE1BX1RPX0RFVklDRSk7Cj4gIAlpZiAocmV0KQo+IEBAIC0xMjY5LDYgKzEyNzUs
NyBAQCBzdGF0aWMgaW50IG1lc29uX25hbmRfYXR0YWNoX2NoaXAoc3RydWN0IG5hbmRfY2hpcCAq
bmFuZCkKPiAgCXN0cnVjdCBtZXNvbl9uZmNfbmFuZF9jaGlwICptZXNvbl9jaGlwID0gdG9fbWVz
b25fbmFuZChuYW5kKTsKPiAgCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQobmFu
ZCk7Cj4gIAlpbnQgbnNlY3RvcnMgPSBtdGQtPndyaXRlc2l6ZSAvIDEwMjQ7Cj4gKwlpbnQgcmF3
X3dyaXRlc2l6ZTsKPiAgCWludCByZXQ7Cj4gIAo+ICAJaWYgKCFtdGQtPm5hbWUpIHsKPiBAQCAt
MTI4MCw2ICsxMjg3LDEzIEBAIHN0YXRpYyBpbnQgbWVzb25fbmFuZF9hdHRhY2hfY2hpcChzdHJ1
Y3QgbmFuZF9jaGlwICpuYW5kKQo+ICAJCQlyZXR1cm4gLUVOT01FTTsKPiAgCX0KPiAgCj4gKwly
YXdfd3JpdGVzaXplID0gbXRkLT53cml0ZXNpemUgKyBtdGQtPm9vYnNpemU7Cj4gKwlpZiAocmF3
X3dyaXRlc2l6ZSA+IE5GQ19DTURfUkFXX0xFTikgewo+ICsJCWRldl9lcnIobmZjLT5kZXYsICJ0
b28gYmlnIHdyaXRlIHNpemUgaW4gcmF3IG1vZGU6ICVkID4gJWxkXG4iLAo+ICsJCQlyYXdfd3Jp
dGVzaXplLCBORkNfQ01EX1JBV19MRU4pOwo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsJfQo+ICsK
PiAgCWlmIChuYW5kLT5iYnRfb3B0aW9ucyAmIE5BTkRfQkJUX1VTRV9GTEFTSCkKPiAgCQluYW5k
LT5iYnRfb3B0aW9ucyB8PSBOQU5EX0JCVF9OT19PT0I7Cj4gIAoKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
