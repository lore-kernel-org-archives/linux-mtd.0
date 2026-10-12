Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F39CC6B19
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 17:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u17fmAh6m05LKA/TBsiwarQW7SEVjDydf7tyljkYy2Q=; b=4mOePl1VCEFBx7
	zQvJ+W9jYMU4qiN6LPCV4xBlnAFtTvpETeQfdEpHfOp0nSHN6lduYYldGtpzBv1S0B9tHwwp50K3x
	ZJP7YL/0QLUaSHqjeBD2LdfcBnL7/+/j/yoJjBjto+0J9y9HQGknTuvBJy6z666dRB9pigpWtoQVa
	Di3j26IDdRfYK3Ovimv6TZQKI+1j7Wis38ETFK+R9phDEBo8PiQcACjH/Sp0akedOc26CKqnQ4N5I
	Nfip9EfzRKlubp+RKEAGv89Y9/3U8I2w+fisfjbO1EClqvqAFpvNs8exGRZ3++V0Hjs77r1BgIXjo
	x549skEiW6SKfGqyH2wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgg7-0000000DlRB-0Et4;
	Tue, 13 Oct 2026 17:52:43 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgg4-0000000DlPH-2WRv
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 17:52:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E8D46C653FA
	for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 17:53:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E9CE60362
	for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 17:52:38 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 5921511D71892; Tue, 13 Oct 2026 19:49:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913957; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MH6j8M7pFAPnzl94LKdOgm6/3MkJo7wgCk+vr5dg8Bc=;
	b=jGpSqy+h6uehfAb0JvOkvsonp7+xdjxghIJm52/ed+frTgpHhXPXKQ6d3brMNl8AkKqPIW
	AQwE7L1HSSX9ow917eb3XyttCE8qJA+yG7dLRrYZGYZrroojFzkY5//AvIf9f213VcvbH6
	WHQmsXOEQQce/NAP7ICLJ1PvL9M1jZlwPXWcN4xcIFBtVCynqrHs9vF0Siwdb+aZsALogr
	WgG9kCjhBlh+81Uw5q8izI4cG+g6K+jmb+7QZ+tOkflxRIXBVSq95ollZl3APLNuuOozOc
	uiYIUKhHtvZOUrr1IRH2nuMay1Cn85cK2YElTmdmjzOWdpvkmGiJz4u+QibOyA==
Authentication-Results: mail.galae.net;
	none
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Frieder Schrempf
 <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v2] mtd: spinand: Do not re-enable continuous reads
 vetoed during variant selection
In-Reply-To: <20261007-spinand-cont-read-supported-v2-1-4c63a0f8828a@kontron.de>
	(Frieder Schrempf's message of "Wed, 07 Oct 2026 15:06:57 +0200")
References: <20261007-spinand-cont-read-supported-v2-1-4c63a0f8828a@kontron.de>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 18:56:28 +0200
Message-ID: <874ieq3lj7.fsf@bootlin.com>
MIME-Version: 1.0
X-TUID: 810iom4XMpmB
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 5921511D71892
X-Spamd-Result: default: False [0.88 / 30.00];
	DATE_IN_PAST(1.00)[24];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.02)[50.51%];
	RCVD_COUNT_ZERO(0.00)[0];
	BCC(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	URIBL_BLOCKED(0.00)[kontron.de:email,localhost:rdns,localhost:helo,bootlin.com:mid];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105240_812475_2B5731A7 
X-CRM114-Status: GOOD (  19.89  )
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

SGkgRnJpZWRlciwKCj4gRml4ZXM6IDZlYjdjMTkzZTc1MSAoIm10ZDogc3BpbmFuZDogVXNlIHNl
Y29uZGFyeSBvcHMgZm9yIGNvbnRpbnVvdXMgcmVhZHMiKQo+IEFzc2lzdGVkLWJ5OiBMTE0KPiBT
aWduZWQtb2ZmLWJ5OiBGcmllZGVyIFNjaHJlbXBmIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24u
ZGU+Cj4gLS0tCj4gSSB3YXMgdXNpbmcgYW4gTExNIHRvIGNoZWNrIHN5bmMgcGF0Y2hlcyBmb3Ig
VS1Cb290IGFuZCB0aGUgTExNIHJlcG9ydGVkCj4gYSBidWcgaW4gdGhlIHVwc3RyZWFtIGtlcm5l
bCBjb2RlLiBUbyBtZSBpdCBsb29rcyBsaWtlIHRoaXMgaXMgaW5kZWVkIGEKPiBidWcgYW5kIHRo
ZSBmaXggYWxzbyBsb29rcyBjb3JyZWN0IHRvIG1lLCBidXQgSSB3b3VsZCBsaWtlIHRvIG1lbnRp
b24sIHRoYXQKPiB0aGlzIGlzIHB1cmVseSBMTE0tZ2VuZXJhdGVkIGFuZCB0aGVvcmV0aWNhbC4g
SSBkaWRuJ3QgdmVyaWZ5IHRoZSBidWcgYW5kCj4gdGhlIGZpeCBvbiBhY3R1YWwgaGFyZHdhcmUu
Cj4KPiBATWlxdWVsOiBEbyB5b3UgaGF2ZSBhIGhhcmR3YXJlIHNldHVwIHRoYXQgd291bGQgYmUg
YWZmZWN0ZWQgYnkgdGhpcz8KCkkgZG8gbm90LgoKPiBEbyB5b3UgdGhpbmsgdGhlcmUgaXMgYSBi
ZXR0ZXIgZml4PwoKSSBhZ3JlZSB3aXRoIHlvdXIgYnVnIGFuYWx5c2lzIGFuZCB3aXRoIHRoZSBw
cm9wb3NhbCwganVzdCBhIGZldyBuaXRzIGJlbG93LgoKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L210
ZC9zcGluYW5kLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmgKPiBAQCAtNzcy
LDYgKzc3Miw5IEBAIHN0cnVjdCBzcGluYW5kX21lbV9vcHMgewo+ICAgKgkJc3VpdGFibGUgdG8g
dXNlIG9yIG5vdCBpbiBnZW5lcmFsIHdpdGggdGhpcyBjaGlwL2NvbmZpZ3VyYXRpb24uCj4gICAq
CQlBIHBlci10cmFuc2ZlciBjaGVjayBtdXN0IG9mIGNvdXJzZSBiZSBkb25lIHRvIGVuc3VyZSBp
dCBpcwo+ICAgKgkJYWN0dWFsbHkgcmVsZXZhbnQgdG8gZW5hYmxlIHRoaXMgZmVhdHVyZS4KPiAr
ICogQGhhc19jb250X3JlYWRfdmFyaWFudHM6IFRoZSBjaGlwIG5lZWRzIGRlZGljYXRlZCBjb250
aW51b3VzIHJlYWQgZnJvbQo+ICsgKgkJCSAgICBjYWNoZSBvcGVyYXRpb25zLCB3aGljaCBtdXN0
IHRoZW4gYmUgYXZhaWxhYmxlIGZvcgo+ICsgKgkJCSAgICB0aGUgYnVzIGludGVyZmFjZSBpbiB1
c2UKCiJUaGUgY2hpcCBuZWVkcyBkZWRpY2F0ZWQgY29udGludW91cyByZWFkIGZyb20gY2FjaGUg
dmFyaWFudHMiCgo+ICAgKiBAc2V0X2NvbnRfcmVhZDogRW5hYmxlL2Rpc2FibGUgdGhlIGNvbnRp
bnVvdXMgcmVhZCBmZWF0dXJlCj4gICAqIEBwcml2OiBtYW51ZmFjdHVyZXIgcHJpdmF0ZSBkYXRh
Cj4gICAqIEBmYWN0X290cDogU1BJIE5BTkQgZmFjdG9yeSBPVFAgaW5mby4KPiBAQCAtODEwLDYg
KzgxMyw3IEBAIHN0cnVjdCBzcGluYW5kX2RldmljZSB7Cj4gIAlpbnQgKCpjb25maWd1cmVfY2hp
cCkoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ICAJCQkgICAgICBlbnVtIHNwaW5h
bmRfYnVzX2ludGVyZmFjZSBpZmFjZSk7Cj4gIAlib29sIGNvbnRfcmVhZF9wb3NzaWJsZTsKPiAr
CWJvb2wgaGFzX2NvbnRfcmVhZF92YXJpYW50czsKCkNhbiB3ZSBuYW1lIGl0IG5lZWRzX2NvbnRf
cmVhZF9vcD8KCj4gIAlpbnQgKCpzZXRfY29udF9yZWFkKShzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2Ug
KnNwaW5hbmQsCj4gIAkJCSAgICAgYm9vbCBlbmFibGUpOwo+ICAJaW50ICgqc2V0X3JhbmRvbWl6
ZXIpKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPgoKVGhlIHJlc3QgaXMgZ29vZCB0
byBtZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
