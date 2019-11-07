Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548FDC5DF60
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 09:10:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2606E2178F
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 09:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dwm5HomT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BIYWknQg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2606E2178F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wam4RXLwAH2eAnsNDpRXSkuSkaWjfnca6nQZtPFUhcQ=; b=Dwm5HomT1HJCYI
	HpynlaxuVbHtEz4UY6ExkLF0VKuwl7Sld32acrkSVhnsKA68weeNKQCCuu2fLjhzKumwTRyz6LM4I
	kCqMNASlF4XSv2nSrcMIr9fgqdKtzrm3uzh5bm1q5uX7LzdspC6IuYSlmO3uC3PdxtQXyHLJz/R86
	cx9PGQC7UlPp/OUJ1nUEZ8H7QgfLUvm9RjEHu9JfsxOy25MW6QLuWSmwlBSD3vFS+/CwHeDfQ96o9
	43oWBSn8pCyHCubljjwb/TLtfeFTPZ2LSLb9CoOg6dlf+JR/CrjhHZhL+vYcjjH/510cryvweDXWx
	KArbKjwUzFs7JT3Z9rPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSdo9-0007ZP-CF; Thu, 07 Nov 2019 09:10:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSdo8-0007ZD-S4
 for linux-mtd@bombadil.infradead.org; Thu, 07 Nov 2019 09:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9IsEX6zNiefHajUYaHEZMXAPCeSE+9wzhq/J1vPXy54=; b=BIYWknQgqzrPLnf6CRnkIsTEhn
 zcP2fbYdq4AjYsX2S6SkuTHGxcvENe3TsQB9nWknC0OCu5GswUZymCrIXSvQrdhgjRk5U0cUKLY4i
 N8t1qrkEOnyYo4oyee72Okok9jerX54ee1EUMvVb777n4OpthSHLP/FI/XkYO5YxUNJIzFj+rQTSK
 t76U3LONHuxqPF0McDyhMzVmRlXgTXGb4suS5pIZaI1FNrmQiQJKK6gzUU35yrs4WYInWUPyf2k/g
 GsLnGOfBQWWJp79ABbdeXMQuJxubErkdfhPX7t4//OlnaLL9PpgaiIQkvyYzXcN89XFAHuoekFpXI
 xw/0cVYg==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSdob-0007Kl-Gc
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2019 09:10:55 +0000
Received: from xps13 (lfbn-tou-1-421-123.w86-206.abo.wanadoo.fr
 [86.206.246.123]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 77750240009;
 Thu,  7 Nov 2019 09:09:45 +0000 (UTC)
Date: Thu, 7 Nov 2019 10:09:44 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] mtd: no need to check return value of debugfs_create
 functions
Message-ID: <20191107100923.7c94820e@xps13>
In-Reply-To: <20191107085111.GA1274176@kroah.com>
References: <20191107085111.GA1274176@kroah.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_091053_836707_2BC8D584 
X-CRM114-Status: GOOD (  17.37  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3JlZywKCkdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
IHdyb3RlIG9uIFRodSwgNyBOb3YKMjAxOSAwOTo1MToxMSArMDEwMDoKCj4gV2hlbiBjYWxsaW5n
IGRlYnVnZnMgZnVuY3Rpb25zLCB0aGVyZSBpcyBubyBuZWVkIHRvIGV2ZXIgY2hlY2sgdGhlCj4g
cmV0dXJuIHZhbHVlLiAgVGhlIGZ1bmN0aW9uIGNhbiB3b3JrIG9yIG5vdCwgYnV0IHRoZSBjb2Rl
IGxvZ2ljIHNob3VsZAo+IG5ldmVyIGRvIHNvbWV0aGluZyBkaWZmZXJlbnQgYmFzZWQgb24gdGhp
cy4KCkkgZGlkbid0IGtub3cgYWJvdXQgdGhpcy4gSXMgdGhpcyBzb21ldGhpbmcgbmV3IG9yIGhh
cyBpdCBiZWVuIHRoZSBydWxlCnNpbmNlIHRoZSBiZWdpbm5pbmc/IEluIHRoZSAgY2FzZSwgZG9u
J3Qgd2UgbmVlZCBhIEZpeGVzIHRhZyBoZXJlPwoKPiBDYzogRGF2aWQgV29vZGhvdXNlIDxkd213
MkBpbmZyYWRlYWQub3JnPgo+IENjOiBCcmlhbiBOb3JyaXMgPGNvbXB1dGVyc2ZvcnBlYWNlQGdt
YWlsLmNvbT4KPiBDYzogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0QGdtYWlsLmNvbT4KPiBDYzog
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiBDYzogUmljaGFyZCBX
ZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPiBDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmln
bmVzaHJAdGkuY29tPgo+IENjOiBBcnRlbSBCaXR5dXRza2l5IDxkZWRla2luZDFAZ21haWwuY29t
Pgo+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4KClsuLi5dCgo+ICsKPiArCWQtPmRmc19lbXVsYXRlX2lv
X2ZhaWx1cmVzID0gZGVidWdmc19jcmVhdGVfZmlsZSgidHN0X2VtdWxhdGVfaW9fZmFpbHVyZXMi
LAo+ICsJCQkJCQkJIFNfSVdVU1IsIGQtPmRmc19kaXIsCj4gKwkJCQkJCQkgKHZvaWQgKil1Ymlf
bnVtLAo+ICsJCQkJCQkJICZkZnNfZm9wcyk7Cj4gKwo+ICsJZC0+ZGZzX2VtdWxhdGVfcG93ZXJf
Y3V0ID0gZGVidWdmc19jcmVhdGVfZmlsZSgidHN0X2VtdWxhdGVfcG93ZXJfY3V0IiwKPiArCQkJ
CQkJICAgICAgIFNfSVdVU1IsIGQtPmRmc19kaXIsCj4gKwkJCQkJCSAgICAgICAodm9pZCAqKXVi
aV9udW0sCj4gKwkJCQkJCSAgICAgICAmZGZzX2ZvcHMpOwoKTml0cGljazogSSB0aGluayB3ZSBt
aXNzIGFuIGVtcHR5IGxpbmUgaGVyZS4gSSBjYW4gZml4IGl0IHdoZW4gYXBwbHlpbmcuCgo+ICsJ
ZC0+ZGZzX3Bvd2VyX2N1dF9taW4gPSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJ0c3RfZW11bGF0ZV9w
b3dlcl9jdXRfbWluIiwKPiArCQkJCQkJICAgU19JV1VTUiwgZC0+ZGZzX2RpciwKPiArCQkJCQkJ
ICAgKHZvaWQgKil1YmlfbnVtLCAmZGZzX2ZvcHMpOwo+ICsKPiArCWQtPmRmc19wb3dlcl9jdXRf
bWF4ID0gZGVidWdmc19jcmVhdGVfZmlsZSgidHN0X2VtdWxhdGVfcG93ZXJfY3V0X21heCIsCj4g
KwkJCQkJCSAgIFNfSVdVU1IsIGQtPmRmc19kaXIsCj4gKwkJCQkJCSAgICh2b2lkICopdWJpX251
bSwgJmRmc19mb3BzKTsKPiArCj4gKwlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJkZXRhaWxlZF9lcmFz
ZV9ibG9ja19pbmZvIiwgU19JUlVTUiwgZC0+ZGZzX2RpciwKPiArCQkJICAgICh2b2lkICopdWJp
X251bSwgJmVyYXNlYmxrX2NvdW50X2ZvcHMpOwo+ICsKPiArCXJldHVybiAwOwo+ICB9Cj4gIAo+
ICAvKioKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
