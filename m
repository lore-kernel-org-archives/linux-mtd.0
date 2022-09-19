Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF467C54EE9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Sep 2022 16:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSep04toDTzW50Ooxdc4lqkZzbSNsK+pJsSHsxkh4qM=; b=awStGkjO+uh/SJ
	et5tR3wN+Mq7VCbJuGOmdd2fPuZMuTPc/nl27ckE+CW0paRn1WhkdSqXtDl0Aer7SrQGqQfng95Yj
	jXEZ1RGXukYxsezqZlVInb96Z/uVehkMu59VzSdPvJOpGS6vwvhz93v0375G6J6zgdzHUekcrKgxM
	9Gy+B5aA7tDrSZ91STo6IjvYKMY0LOXfl86IOxgEKEhCsCHBv3PaujkreeT8CJBAJ7dmpoDXa7iWL
	i/2mgbhJ3rVx1WNVAxQdT0uLaP+LUEzRvjNUvHXEPJMKemKwVHPye4+4JzdMeK/enQhNsMP/keW0h
	/v9QSGr4hSQaWHM0xpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJCW-00CigM-0q; Mon, 19 Sep 2022 16:00:52 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJCB-00CiXI-3f; Mon, 19 Sep 2022 16:00:33 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EB70A24000E;
	Mon, 19 Sep 2022 16:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663603227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4w2H0/aVozaHmubnqFnPjiPTuYGSRzmbJ5Wwl6IDQwM=;
	b=Lcv42Ss9HGpIaCPVGZlsqSX3b4RETBixGo4uKB9QrhoufMMLiAxBu08X17z+G4slmrlwN9
	Z6WowHP6ZO5LMXhxmBydcyUHnj54Jq2E3Mj4uVzL1yZstEYPbO4zJNE5J4XnvQ0h7POLr8
	oSAVOOn21UXyjWZKkBGyiyp3sXrL7L8tfC7N5kWrIg/0GuF+sF8/rL/SPppLiv8tquBLre
	c5kwjH+1qwDO5GwgW93QEETcLp6ugYlLjWklnhej2XFyve0vxTaS2mL0BsR7l+LoEuJzLp
	76RsJ5bA3HANiTyTGPiCUSrFbvWdg3bkXLJdQgX7i4ZgC5a+FUR6nlXpiNXjqw==
Date: Mon, 19 Sep 2022 18:00:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jack Wang <jinpu.wang@ionos.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Christophe Kerello <christophe.kerello@foss.st.com>, Cai Huoqing
 <cai.huoqing@linux.dev>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: rawnand: stm32_fmc2: Fix dma_map_sg error
 check
Message-ID: <20220919180022.2c80e2b7@xps-13>
In-Reply-To: <20220825075338.35338-2-jinpu.wang@ionos.com>
References: <20220825075338.35338-1-jinpu.wang@ionos.com>
	<20220825075338.35338-2-jinpu.wang@ionos.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_090031_465571_959A9BC6 
X-CRM114-Status: GOOD (  16.44  )
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

SGkgSmFjaywKCmppbnB1LndhbmdAaW9ub3MuY29tIHdyb3RlIG9uIFRodSwgMjUgQXVnIDIwMjIg
MDk6NTM6MzcgKzAyMDA6Cgo+IGRtYV9tYXBfc2cgcmV0dXJuIDAgb24gZXJyb3IsIGluIGNhc2Ug
b2YgZXJyb3IgcmV0dXJuIC1FSU8uCj4gCj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+Cj4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+
Cj4gQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPiBDYzogTWF4aW1l
IENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+IENjOiBBbGV4YW5kcmUgVG9y
Z3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPgo+IENjOiBQaGlsaXBwIFphYmVsIDxw
LnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IENjOiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9w
aGUua2VyZWxsb0Bmb3NzLnN0LmNvbT4KPiBDYzogQ2FpIEh1b3FpbmcgPGNhaS5odW9xaW5nQGxp
bnV4LmRldj4KPiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IENjOiBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+
IEZpeGVzOiAyY2Q0NTdmMzI4YzEgKCJtdGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IGFkZCBTVE0z
MiBGTUMyIE5BTkQgZmxhc2ggY29udHJvbGxlciBkcml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6IEph
Y2sgV2FuZyA8amlucHUud2FuZ0Bpb25vcy5jb20+CgpJJ2xsIGFwcGx5IHRoaXMgc2VyaWVzIHNv
IEkgbmVlZCB0byByZS1hZGQgQ2hyaXN0b3BoZSdzIHRhZyBzZW50IG9uIHRoZQpwYXRjaCBhbG9u
ZSAod2hpY2ggaXMgaWRlbnRpY2FsIGFzIGZhciBhcyBJIHNlZSk6CgpSZXZpZXdlZC1ieTogQ2hy
aXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cgo+IC0tLQo+
ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyB8IDggKysrKystLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+IGluZGV4IDg3YzFjN2RkOTdlYi4uYTBj
ODI1YWYxOWZhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJf
bmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMKPiBA
QCAtODYyLDggKzg2Miw4IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9uZmNfeGZlcihzdHJ1Y3Qg
bmFuZF9jaGlwICpjaGlwLCBjb25zdCB1OCAqYnVmLAo+ICAKPiAgCXJldCA9IGRtYV9tYXBfc2co
bmZjLT5kZXYsIG5mYy0+ZG1hX2RhdGFfc2cuc2dsLAo+ICAJCQkgZWNjc3RlcHMsIGRtYV9kYXRh
X2Rpcik7Cj4gLQlpZiAocmV0IDwgMCkKPiAtCQlyZXR1cm4gcmV0Owo+ICsJaWYgKCFyZXQpCj4g
KwkJcmV0dXJuIC1FSU87Cj4gIAo+ICAJZGVzY19kYXRhID0gZG1hZW5naW5lX3ByZXBfc2xhdmVf
c2coZG1hX2NoLCBuZmMtPmRtYV9kYXRhX3NnLnNnbCwKPiAgCQkJCQkgICAgZWNjc3RlcHMsIGRt
YV90cmFuc2Zlcl9kaXIsCj4gQEAgLTg5Myw4ICs4OTMsMTAgQEAgc3RhdGljIGludCBzdG0zMl9m
bWMyX25mY194ZmVyKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHU4ICpidWYsCj4gIAo+
ICAJCXJldCA9IGRtYV9tYXBfc2cobmZjLT5kZXYsIG5mYy0+ZG1hX2VjY19zZy5zZ2wsCj4gIAkJ
CQkgZWNjc3RlcHMsIGRtYV9kYXRhX2Rpcik7Cj4gLQkJaWYgKHJldCA8IDApCj4gKwkJaWYgKCFy
ZXQpIHsKPiArCQkJcmV0ID0gLUVJTzsKPiAgCQkJZ290byBlcnJfdW5tYXBfZGF0YTsKPiArCQl9
Cj4gIAo+ICAJCWRlc2NfZWNjID0gZG1hZW5naW5lX3ByZXBfc2xhdmVfc2cobmZjLT5kbWFfZWNj
X2NoLAo+ICAJCQkJCQkgICBuZmMtPmRtYV9lY2Nfc2cuc2dsLAoKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
