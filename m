Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADA7CA9EC7
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Oct 2026 06:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xqd+8/fxuceHQmGIF/GPqaD1XQYx/5Ph4H4JWuR0iow=; b=4SPmcpGTsW+laG
	5RRG/b2CTqWiDXzgTcWQGzn9meqH8kb8r7iS0dGo6oxTC4T14AN3erEotKH5uODRqcBMewrDIWwAJ
	/UWxonv9Dj+vdh15Smdm5JCDaPTi1jwlT+N5k2Xij/5fUjt41Ay5sk+9XYDKEae49UFTzCRwXmg5u
	fRXnCBsiWDsuucotnPgLDcEJ/8xxWzOSEawRBvv+GbVZESqZkXVQ4bXwJcef3eJ20Df58yC4zdYjr
	qWkDrtoQF3r6njvLwf6tb1dq4X8XJGNyG5NfS2rEFfFi3APUagLUUtCXv7tWqL3jj/YuxJOwQEtG8
	ZCfM1jHuhqOI7ntsI60w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFnDp-00000008mEW-0brP;
	Sun, 11 Oct 2026 06:39:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFnDm-00000008mEP-3mMr
	for linux-mtd@lists.infradead.org;
	Sun, 11 Oct 2026 06:39:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5290F42A91;
	Sun, 11 Oct 2026 06:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B601F0089B;
	Sun, 11 Oct 2026 06:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791700786;
	bh=JeEJOoAQZinF5jq024suht+rQLWI0JuvVje59ye2Z2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VD4cxtcp2VHzq/DBwXdVnu5D5j5jn5CglTljQvtMyrb1dqq+SQFvM645n8iCbAzcF
	 dXKqNLD+sKGIByrnQFRnyWibE2Kj4MCOFmCjWWtpHwsGwFltqXjdWoIOLLAhvwCwQn
	 EOWrANlTKFLOJ7AyYVZ1Pv7FEF6ltg2qTohkYd74hvnELAVNXiV5uHshM6wS3zFlvz
	 xy8R2xjwsBnz/DGEERXErbv1ZfMAbbpAO/I8Anhx/kCnq/9pTZSQusePEERtWyQ4DM
	 PR8WAn/hrggKSn86zA45KJtLqfDQpwdXVEqRkYrzK+4r9XZN5/gZNnjX36adO0oWTv
	 K5aDZmlRDdxQw==
Message-ID: <sashiko-outbox-167073@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] MIPS: Octeon: flash: use the simple map
 accessors without a shared eMMC
To: tsbogend@alpha.franken.de, "Orgad Shaneh" <orgads@gmail.com>, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mips@vger.kernel.org, nico@fluxnic.net, corbet@lwn.net, linux-doc@vger.kernel.org, john@phrozen.org, kaloz@openwrt.org, ulli.kroll@googlemail.com, linusw@kernel.org, linux-kernel@vger.kernel.org, dwmw2@infradead.org, linux-mtd@lists.infradead.org
In-Reply-To: <20261011062908.2365879-4-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261011062908.2365879-1-orgads@gmail.com>
 <20261011062908.2365879-4-orgads@gmail.com>
Date: Sun, 11 Oct 2026 06:39:45 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogY2F2aXVtOiBn
bG9iYWwgc3RhdGUgY29ycnVwdGlvbiBvZiBmbGFzaF9tYXAgb24gbXVsdGlwbGUgcHJvYmVzCi0t
Cgpjb21taXQgYzMyY2Y2Yzg1N2UzMzU2NzMyNDUyMTc4YTUyYTRlNzM5ZmNhZjI3MwpBdXRob3I6
IE9yZ2FkIFNoYW5laCA8b3JnYWRzQGdtYWlsLmNvbT4KCk1JUFM6IE9jdGVvbjogZmxhc2g6IHVz
ZSB0aGUgc2ltcGxlIG1hcCBhY2Nlc3NvcnMgd2l0aG91dCBhIHNoYXJlZCBlTU1DCgpUaGlzIGNv
bW1pdCBtb2RpZmllcyB0aGUgT2N0ZW9uIGZsYXNoIGRyaXZlciB0byBjb25kaXRpb25hbGx5IHVz
ZSBzaW1wbGUgbWFwCmFjY2Vzc29ycyB3aGVuIHRoZSBib290YnVzIGlzIG5vdCBzaGFyZWQgd2l0
aCBhbiBlTU1DIGhvc3QuIERvaW5nIHNvIGF2b2lkcwp1bm5lY2Vzc2FyeSBzZW1hcGhvcmUgdXNh
Z2UgYW5kIGVuYWJsZXMgTVREIHRvIHVzZSB0aGUgcG9pbnQoKSBtZXRob2QKZm9yIGZhc3RlciBq
ZmZzMiBtb3VudHMuIEl0IGFsc28gYWRkcyBlYXJseSBiYW5rIHdpZHRoIHZhbGlkYXRpb24gYmVm
b3JlCm1hcHBpbmcgbWVtb3J5LgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2Nhdml1bS1vY3Rl
b24vZmxhc2hfc2V0dXAuYyBiL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL2ZsYXNoX3NldHVwLmMK
PiBpbmRleCAzMzk1YWNkZTRkNjBhLi41NDQ4ZDUxMzljNjQwIDEwMDY0NAo+IC0tLSBhL2FyY2gv
bWlwcy9jYXZpdW0tb2N0ZW9uL2ZsYXNoX3NldHVwLmMKPiArKysgYi9hcmNoL21pcHMvY2F2aXVt
LW9jdGVvbi9mbGFzaF9zZXR1cC5jCgpbIC4uLiBdCgo+IEBAIC0xMDIsMTEgKzExOSwyMCBAQCBz
dGF0aWMgaW50IG9jdGVvbl9mbGFzaF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+ICAJCWZsYXNoX21hcC52aXJ0ID0gaW9yZW1hcChmbGFzaF9tYXAucGh5cywgZmxhc2hfbWFw
LnNpemUpOwo+ICAJCXByX25vdGljZSgiQm9vdGJ1cyBmbGFzaDogU2V0dGluZyBmbGFzaCBmb3Ig
JWx1TUIgZmxhc2ggYXQgIgo+ICAJCQkgICIweCUwOGxseFxuIiwgZmxhc2hfbWFwLnNpemUgPj4g
MjAsIGZsYXNoX21hcC5waHlzKTsKPiAtCQlXQVJOX09OKCFtYXBfYmFua3dpZHRoX3N1cHBvcnRl
ZChmbGFzaF9tYXAuYmFua3dpZHRoKSk7Cj4gLQkJZmxhc2hfbWFwLnJlYWQgPSBvY3Rlb25fZmxh
c2hfbWFwX3JlYWQ7Cj4gLQkJZmxhc2hfbWFwLndyaXRlID0gb2N0ZW9uX2ZsYXNoX21hcF93cml0
ZTsKPiAtCQlmbGFzaF9tYXAuY29weV9mcm9tID0gb2N0ZW9uX2ZsYXNoX21hcF9jb3B5X2Zyb207
Cj4gLQkJZmxhc2hfbWFwLmNvcHlfdG8gPSBvY3Rlb25fZmxhc2hfbWFwX2NvcHlfdG87Cj4gKwkJ
LyoKPiArCQkgKiBUaGUgYm9vdCBidXMgc2VtYXBob3JlIG9ubHkgc2VyaWFsaXplcyB0aGUgZmxh
c2ggYWdhaW5zdAo+ICsJCSAqIGFuIGVNTUMgaG9zdCB0aGF0IHNoYXJlcyB0aGUgYnVzICh0aGUg
Q0lVMyBwYXJ0cyBoYXZlCj4gKwkJICogdGhlaXIgb3duKS4gV2l0aG91dCBvbmUsIHVzZSB0aGUg
c2ltcGxlIGFjY2Vzc29yczogdGhleQo+ICsJCSAqIGxldCBNVEQgcG9pbnQgYXQgdGhlIGZsYXNo
LCBzbyBqZmZzMiBzY2FucyBpdCBpbiBwbGFjZS4KPiArCQkgKi8KPiArCQlpZiAob2N0ZW9uX2Zs
YXNoX2J1c19zaGFyZWQoKSkgewo+ICsJCQlmbGFzaF9tYXAucmVhZCA9IG9jdGVvbl9mbGFzaF9t
YXBfcmVhZDsKPiArCQkJZmxhc2hfbWFwLndyaXRlID0gb2N0ZW9uX2ZsYXNoX21hcF93cml0ZTsK
PiArCQkJZmxhc2hfbWFwLmNvcHlfZnJvbSA9IG9jdGVvbl9mbGFzaF9tYXBfY29weV9mcm9tOwo+
ICsJCQlmbGFzaF9tYXAuY29weV90byA9IG9jdGVvbl9mbGFzaF9tYXBfY29weV90bzsKPiArCQl9
IGVsc2Ugewo+ICsJCQlzaW1wbGVfbWFwX2luaXQoJmZsYXNoX21hcCk7Cj4gKwkJfQo+ICAJCW15
bXRkID0gZG9fbWFwX3Byb2JlKCJjZmlfcHJvYmUiLCAmZmxhc2hfbWFwKTsKCltTZXZlcml0eTog
SGlnaF0KQ2FuIHRoaXMgY2F1c2UgZ2xvYmFsIHN0YXRlIGNvcnJ1cHRpb24gaWYgbXVsdGlwbGUg
Zmxhc2ggZGV2aWNlcyBhcmUgcHJvYmVkPwoKTG9va2luZyBhdCBhcmNoL21pcHMvY2F2aXVtLW9j
dGVvbi9mbGFzaF9zZXR1cC5jLCBmbGFzaF9tYXAgaXMgZGVmaW5lZCBhcyBhCnNpbmdsZSBzdGF0
aWMgc3RydWN0IG1hcF9pbmZvIGluc3RhbmNlOgoKc3RhdGljIHN0cnVjdCBtYXBfaW5mbyBmbGFz
aF9tYXA7CgpJZiBtdWx0aXBsZSBjZmktZmxhc2ggZGV2aWNlcyBhcmUgcHJlc2VudCBvbiB0aGUg
cGxhdGZvcm0gYnVzLApvY3Rlb25fZmxhc2hfcHJvYmUoKSB3aWxsIGJlIGNhbGxlZCBmb3IgZWFj
aCBvZiB0aGVtLiBBIHNlY29uZCBwcm9iZSB3aWxsCm92ZXJ3cml0ZSB0aGUgcGh5cywgdmlydCwg
c2l6ZSwgYW5kIGJhbmt3aWR0aCBmaWVsZHMgb2YgdGhlIHNoYXJlZCBmbGFzaF9tYXAKaW5zdGFu
Y2UuCgpTaW5jZSBkb19tYXBfcHJvYmUoKSBwYXNzZXMgYSBwb2ludGVyIHRvIGZsYXNoX21hcCB0
byB0aGUgQ0ZJIGxheWVyLCBib3RoCm10ZF9pbmZvIGluc3RhbmNlcyB3aWxsIHJldGFpbiBhIHJl
ZmVyZW5jZSB0byB0aGlzIHNpbmdsZSBtYXAgdmlhIG10ZC0+cHJpdi4gQW55CkkvTyBvbiB0aGUg
Zmlyc3QgZmxhc2ggZGV2aWNlIHdvdWxkIHRoZW4gdXNlIHRoZSBtYXBwZWQgbWVtb3J5LCBzaXpl
LCBhbmQgQ0ZJCnN0YXRlIG9mIHRoZSBzZWNvbmQgZGV2aWNlLCB3aGljaCBjb3VsZCBsZWFkIHRv
IGRhdGEgY29ycnVwdGlvbi4KCkRvZXMgaXQgbWFrZSBzZW5zZSB0byBhbGxvY2F0ZSBzdHJ1Y3Qg
bWFwX2luZm8gZHluYW1pY2FsbHkgcGVyIGRldmljZSBpbnN0ZWFkPwoKPiAgCQlpZiAobXltdGQp
IHsKPiAgCQkJbXltdGQtPm93bmVyID0gVEhJU19NT0RVTEU7CgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDExMDYyOTA4LjIzNjU4
NzktMS1vcmdhZHNAZ21haWwuY29tP3BhcnQ9MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
