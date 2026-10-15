Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E327CC6B2F
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 07:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fr83gPLGT6lcYQmwKBHch43puI9WldJkf8L3y76GRzI=; b=kfor7potr6S+M6
	9jaPVWe7nsB7StatBzmdd2VHuwMQEmNcdrjnX1sTOheAWdiLT350aEN5uWdr14EU/mPF/6d58FMvc
	KHliLVy/4Nip/CtS5maiMYy5xWMZUEt3vIcv+ZWktFg+RhTSJDCQooytdNafhqbtw4ck2DFg/p30h
	i7NsVsCvotNQ+nOgkoD0/s5klQ2EEC3mpwE8zNKM2lDx/Srspkrs74j1iiRZ5QGyUfSZAlrQjcoWH
	6jpGD4ouSgnDBJq4lJrRQkG+aQceDwL9zuw7IPb9S6mvSlchIi8JcuiXBB4qKVbYDGNWD09Ab9MhO
	q06FrMFhGOFhhWpax8FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGDS-0000000H4jS-20Gs;
	Thu, 15 Oct 2026 07:49:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGDR-0000000H4iq-0R8g
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 07:49:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73D3A6022A;
	Thu, 15 Oct 2026 07:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBE41F000C4;
	Thu, 15 Oct 2026 07:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792050568;
	bh=xd6hK/zaajgu8MS++QgUbLELls4lByinQPxBbFmL6J8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AFRKUfq0I1kaW8tuCfh3J2P7nHVl5fXqXUmrZTnTbwdQwh0tf5AFek95e+juVUVxd
	 UkOqKjaSf+LXES/8cWIc9TmGaHMiAii85vJjWBMsbAHcXWt/omEcxOywv6GAbLiZRY
	 FmrpPICRnnYpLeSgr+sfm2hejCr38HHqr/mrvdORIDX1Y8iWxHcI0uhCqufZlz4CPS
	 QN6bHkBj3dakSg0wmj9WrxjkOEYvhz3qvrxn1cTDqNNyhruSjzrMhMAnkm5Gsppj8P
	 DUzK+iaK6MyCUcvIJG9bZWceGRAfYixrMrfEQ5LtU/MsaLTsLKrx0nFgwbppL7818s
	 B/1mtVctYlwLg==
Message-ID: <sashiko-outbox-172435@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] mtd: ubi: block: forbid direct reclaim I/O during
 synchronous read
To: "Yelin Fei" <yelinfei66@gmail.com>, linux-mtd@lists.infradead.org
Cc: richard@nod.at, chengzhihao1@huawei.com, miquel.raynal@bootlin.com, vigneshr@ti.com
In-Reply-To: <d2657317d2d8f9cca201f09dbcd6d9b9b82744ba.1792046946.git.yelinfei@ruijie.com.cn>
References: <cover.1792046946.git.yelinfei@ruijie.com.cn>
 <d2657317d2d8f9cca201f09dbcd6d9b9b82744ba.1792046946.git.yelinfei@ruijie.com.cn>
Date: Thu, 15 Oct 2026 07:49:27 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiBibG9jazogdW5p
bml0aWFsaXplZCB1c2Ugb2YgJ3JldCcgb24gMC1ieXRlIHJlYWQKLS0KCmNvbW1pdCBkOThhNmFi
MGNkMGJkMzIwMGU4ZmNhY2ZmNzUxYTg1ZTJmOWVlMzcyCkF1dGhvcjogWWUgTGluZmVpIDx5ZWxp
bmZlaUBydWlqaWUuY29tLmNuPgoKbXRkOiB1Ymk6IGJsb2NrOiBmb3JiaWQgZGlyZWN0IHJlY2xh
aW0gSS9PIGR1cmluZyBzeW5jaHJvbm91cyByZWFkCgpUaGlzIGNvbW1pdCBtYXJrcyB0aGUgZW50
aXJlIHViaWJsb2NrX3JlYWQgb3BlcmF0aW9uIHdpdGgKbWVtYWxsb2Nfbm9pb19zYXZlKCkgYW5k
IG1lbWFsbG9jX25vaW9fcmVzdG9yZSgpIHRvIGZvcmJpZCBkaXJlY3QgcmVjbGFpbQpJL08gd2hp
bGUgdGhlIGRyaXZlciBleGVjdXRlcy4gVGhpcyBwcmV2ZW50cyBhIGRlYWRsb2NrIHdoZXJlIHN5
bmNocm9ub3VzCnN3YXAgd3JpdGViYWNrIGNvdWxkIGJlIHRyaWdnZXJlZCB2aWEgZGlyZWN0IHJl
Y2xhaW0gd2hpbGUgdGhlIHRhc2sgaXMKYWxyZWFkeSBob2xkaW5nIHRoZSBTUkNVIHJlYWQgbG9j
ayBpbiB0aGUgYmxrLW1xIHN5bmNocm9ub3VzIGRpc3BhdGNoIHBhdGguCgpDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZwoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMgYi9k
cml2ZXJzL210ZC91YmkvYmxvY2suYwo+IGluZGV4IDI5YzBkNjk0MWE4MTguLmM5ZDQyMTgxYmY2
NDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMKPiArKysgYi9kcml2ZXJz
L210ZC91YmkvYmxvY2suYwoKWyAuLi4gXQoKPiBAQCAtMTg5LDYgKzE5MCw3IEBAIHN0YXRpYyBi
bGtfc3RhdHVzX3QgdWJpYmxvY2tfcmVhZChzdHJ1Y3QgcmVxdWVzdCAqcmVxKQo+ICAJaW50IGxl
YiA9IHBvczsKPiAgCXN0cnVjdCByZXFfaXRlcmF0b3IgaXRlcjsKPiAgCXN0cnVjdCBiaW9fdmVj
IGJ2ZWM7Cj4gKwl1bnNpZ25lZCBpbnQgbm9pb19mbGFnczsKPiAgCWludCByZXQ7Cj4gIAo+ICAJ
YmxrX21xX3N0YXJ0X3JlcXVlc3QocmVxKTsKPiBAQCAtMjAxLDYgKzIwMywxOCBAQCBzdGF0aWMg
YmxrX3N0YXR1c190IHViaWJsb2NrX3JlYWQoc3RydWN0IHJlcXVlc3QgKnJlcSkKPiAgCXViaV9z
Z2xfaW5pdCgmcGR1LT51c2dsKTsKPiAgCWJsa19ycV9tYXBfc2cocmVxLCBwZHUtPnVzZ2wuc2cp
Owo+ICAKPiArCS8qCj4gKwkgKiBUaGlzIGVudGlyZSBjYWxsYmFjayBydW5zIGluIHRoZSBzeW5j
aHJvbm91cyBkaXNwYXRjaCBwYXRoIG9mCj4gKwkgKiBibGstbXE6IHN1Ym1pdF9iaW9fbm9hY2N0
X25vY2hlY2soKSBvbmx5IHF1ZXVlcyBhIGJpbyBzdWJtaXR0ZWQKPiArCSAqIGZyb20gaGVyZSBv
bnRvIGN1cnJlbnQtPmJpb19saXN0LCBhbmQgdGhlIHNvbGUgZGlzcGF0Y2hlciBvZgo+ICsJICog
dGhhdCBsaXN0IGlzIHRoaXMgdmVyeSB0YXNrLCBidXN5IGluc2lkZSAtPnF1ZXVlX3JxKCkuICBB
bnkKPiArCSAqIGJsb2NrIEkvTyBpc3N1ZWQgZnJvbSBiZWxvdyB3b3VsZCB0aGVyZWZvcmUgZGVh
ZGxvY2sgYWdhaW5zdAo+ICsJICogaXRzZWxmIChlLmcuIHN5bmNocm9ub3VzIHN3YXAgd3JpdGVi
YWNrIHJlYWNoZWQgdmlhIGRpcmVjdAo+ICsJICogcmVjbGFpbSkuICBGb3JiaWQgaXQgZm9yIHRo
ZSB3aG9sZSByZWFkIGluc3RlYWQgb2YgcmVseWluZyBvbgo+ICsJICogZXZlcnkgY2FsbGVlIHVz
aW5nIHNhZmUgYWxsb2NhdGlvbiBmbGFncy4KPiArCSAqLwo+ICsJbm9pb19mbGFncyA9IG1lbWFs
bG9jX25vaW9fc2F2ZSgpOwo+ICsKPiAgCXdoaWxlIChieXRlc19sZWZ0KSB7Cj4gIAkJLyoKPiAg
CQkgKiBXZSBjYW4gb25seSByZWFkIG9uZSBMRUIgYXQgYSB0aW1lLiBUaGVyZWZvcmUgaWYgdGhl
IHJlYWQKPiBAQCAtMjIxLDYgKzIzNSw3IEBAIHN0YXRpYyBibGtfc3RhdHVzX3QgdWJpYmxvY2tf
cmVhZChzdHJ1Y3QgcmVxdWVzdCAqcmVxKQo+ICAKPiAgCXJxX2Zvcl9lYWNoX3NlZ21lbnQoYnZl
YywgcmVxLCBpdGVyKQo+ICAJCWZsdXNoX2RjYWNoZV9wYWdlKGJ2ZWMuYnZfcGFnZSk7Cj4gKwlt
ZW1hbGxvY19ub2lvX3Jlc3RvcmUobm9pb19mbGFncyk7Cj4gIAo+ICAJYmxrX21xX2VuZF9yZXF1
ZXN0KHJlcSwgZXJybm9fdG9fYmxrX3N0YXR1cyhyZXQpKTsKCltTZXZlcml0eTogTG93XQpEb2Vz
IHViaWJsb2NrX3JlYWQoKSBpbiBkcml2ZXJzL210ZC91YmkvYmxvY2suYyBsZWF2ZSByZXQgdW5p
bml0aWFsaXplZCBpZiBhCjAtYnl0ZSByZWFkIHJlcXVlc3QgaXMgc3VibWl0dGVkPwoKSWYgYmxr
X3JxX2J5dGVzKHJlcSkgZXZhbHVhdGVzIHRvIDAsIGJ5dGVzX2xlZnQgaXMgMCBhbmQgdGhlIGxv
b3AgaXMgYnlwYXNzZWQ6CgogICAgaW50IHRvX3JlYWQgPSBibGtfcnFfYnl0ZXMocmVxKTsKICAg
IGludCBieXRlc19sZWZ0ID0gdG9fcmVhZDsKICAgIC4uLgogICAgaW50IHJldDsKICAgIC4uLgog
ICAgd2hpbGUgKGJ5dGVzX2xlZnQpIHsgLy8gYnlwYXNzZWQgY29tcGxldGVseQogICAgICAgIC4u
LgogICAgICAgIHJldCA9IHViaV9yZWFkX3NnKC4uLik7CiAgICB9CgpUaGlzIGxlYXZlcyB0aGUg
dW5pbml0aWFsaXplZCByZXQgdmFsdWUgb24gdGhlIHN0YWNrIHRvIGJlIGNvbnN1bWVkIGhlcmUg
YnkKZXJybm9fdG9fYmxrX3N0YXR1cygpLCByZXR1cm5pbmcgYW4gdW5wcmVkaWN0YWJsZSBibG9j
ayBjb21wbGV0aW9uIHN0YXR1cy4KCldoaWxlIDAtYnl0ZSByZWFkcyBtaWdodCBiZSByYXJlIGlu
IHByYWN0aWNlLCB0aGUgYmxvY2sgbGF5ZXIgZG9lcyBub3QKc3RydWN0dXJhbGx5IGZpbHRlciBv
dXQgZGF0YWxlc3MgUkVRX09QX1JFQUQgYmlvcy4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvY292ZXIuMTc5MjA0Njk0Ni5naXQueWVsaW5m
ZWlAcnVpamllLmNvbS5jbj9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
