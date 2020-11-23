Return-Path: <SRS0=aMQG=E5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF21C2D0E4
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 08:35:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EED620727
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 08:35:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ksQGAF//"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EED620727
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZLYLtY9xLdxJil4asteQCF+IclvNkjlr8vtF9katci8=; b=ksQGAF//6EDSS/zAZr2hRTVxF
	lXcHiwgSID4R8A7pAvcIcaxn41avENrClmO4YBM7rKtQQluXkJRmFYMroAIv2u2owMery36BFrn5v
	dsGQw2ihy/NNcA/lBJ/F1hkcXBc498hFYxWTC0ztHr04fLFXN54rxBk1wgXUksWliKRjgAUDfE5mE
	GakouxkfiSfQVuNwraxzjtbpJniyHhD8xkMPqC3uH8HNrBrie2vUajqgxSxhFc2iRPeOms2LDlAx/
	9+xsu4qiOzeQF69H/5B7W3pN50u8ieRJ+xw//zzc31YDG+JA54Ia/lGkzCKBh2xyZX14COT0Iwb1J
	Zwa8EaXLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh7IO-00084m-MO; Mon, 23 Nov 2020 08:34:00 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh7IJ-00083y-N8; Mon, 23 Nov 2020 08:33:56 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 98158240006;
 Mon, 23 Nov 2020 08:33:48 +0000 (UTC)
Date: Mon, 23 Nov 2020 09:33:47 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH 104/141] mtd: rawnand: stm32_fmc2: Fix fall-through
 warnings for Clang
Message-ID: <20201123093347.719a77cf@xps13>
In-Reply-To: <299d044a69b59eff2c733543b927aa608282a9a8.1605896060.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <299d044a69b59eff2c733543b927aa608282a9a8.1605896060.git.gustavoars@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_033355_879561_374D207B 
X-CRM114-Status: GOOD (  14.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3VzdGF2bywKCiJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b2Fyc0BrZXJuZWwub3Jn
PiB3cm90ZSBvbiBGcmksIDIwIE5vdiAyMDIwCjEyOjM3OjQ4IC0wNjAwOgoKPiBJbiBwcmVwYXJh
dGlvbiB0byBlbmFibGUgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCBmb3IgQ2xhbmcsIGZpeCBhIGNv
dXBsZQo+IG9mIHdhcm5pbmdzIGJ5IGV4cGxpY2l0bHkgYWRkaW5nIGEgY291cGxlIG9mIGZhbGx0
aHJvdWdoIHBzZXVkby1rZXl3b3Jkcwo+IGluc3RlYWQgb2YgbGV0dGluZyB0aGUgY29kZSBmYWxs
IHRocm91Z2ggdG8gdGhlIG5leHQgY2FzZS4KPiAKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20v
S1NQUC9saW51eC9pc3N1ZXMvMTE1Cj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2
YSA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9z
dG0zMl9mbWMyX25hbmQuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQu
YyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gaW5kZXggNTUwYmRh
NGQxNDE1Li4wMDJmYTUyMTAzNmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3RtMzJfZm1jMl9uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMy
X25hbmQuYwo+IEBAIC01MzEsNiArNTMxLDcgQEAgc3RhdGljIGludCBzdG0zMl9mbWMyX25mY19o
YW1fY29ycmVjdChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1OCAqZGF0LAo+ICAJCXN3aXRjaCAo
YiAlIDQpIHsKPiAgCQljYXNlIDI6Cj4gIAkJCWJpdF9wb3NpdGlvbiArPSBzaGlmdGluZzsKPiAr
CQkJZmFsbHRocm91Z2g7CgpJbiBwYXRjaCAxMDAsIDEwMSwgMTAyLCAxMDMgeW91ICdicmVhaycg
aW4gdGhpcyBjYXNlICh3aGVuIHRoZQpzdGF0ZW1lbnQgZmFsbHMgaW50byB0aGUgZW1wdHkgZm9s
bG93aW5nIHN0YXRlbWVudCB3aGljaCBpdHNlbGYKYnJlYWtzKS4gUGxlYXNlIG1ha2UgaXQgY29u
c2lzdGVudCBhbmQgdXNlIGJyZWFrIGhlcmUsIGJlbG93LCBhbmQgaW4KcGF0Y2ggMTMyLgoKTEdU
TSBvdGhlcndpc2UuCgo+ICAJCWNhc2UgMToKPiAgCQkJYnJlYWs7Cj4gIAkJZGVmYXVsdDoKPiBA
QCAtNTQ2LDYgKzU0Nyw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9uZmNfaGFtX2NvcnJlY3Qo
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdTggKmRhdCwKPiAgCQlzd2l0Y2ggKGIgJSA0KSB7Cj4g
IAkJY2FzZSAyOgo+ICAJCQlieXRlX2FkZHIgKz0gc2hpZnRpbmc7Cj4gKwkJCWZhbGx0aHJvdWdo
Owo+ICAJCWNhc2UgMToKPiAgCQkJYnJlYWs7Cj4gIAkJZGVmYXVsdDoKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
