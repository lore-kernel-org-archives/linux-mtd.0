Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0E3606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pjIyKp5C;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=Ko6SikcA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gGncRDQ+NkDsnWZJ/POx1uSbwUxLNUbPoWCs4gyKF1Y=; b=pjIyKp5CcszWua1hw0KAcF83ZO
	Xpc/FAHiN9sXT984NGpcal39bWjEztGc2xE2cNpBVCNMyqyt3bZ7sND30EKscRXFY1aANrPSIi6np
	fcNlf7XG/7t7DYZnU89OiQx639sPE/k+nJahoT18aUzCzouNKdYHNVe9DkHqq2tSqa8C2Eb92rNz1
	HcSxTi84pU0ypsNhfL/CJJWylUXKk23OobrB/R/UzKxkU1GlaL6p8g/uirMvcIhh+GNnz7qrkxbZd
	qbOR0nuk78ob9H2bAiF0TxCFWcjE/T1NP8HbBPipj+AgfF6ZXF0GbEfUddDQYIiJxIrgnfUGUezDK
	khqpo9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMJX-00000006T2I-1s3O;
	Tue, 17 Nov 2026 16:45:47 +0000
Received: from mail.simonwunderlich.de ([2a01:4f8:c17:e8c0::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMJT-00000006Szb-0Cgd
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 16:45:44 +0000
Received: by mail.simonwunderlich.de (Postfix) id 7F3C0FA039;
	Tue, 17 Nov 2026 17:45:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794933937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7rA3f+5kZ4ohnzATtzU3IQFFAM5nwbvX+N6Ax6dlwg=;
	b=Ko6SikcAnFscPuvoOl+h9YTtyPLrjZi7kEEQLf3A0K+Imfmwfx22QXglwfosAAXMVs2uB+
	wATDpXH7/ggdyQl7iLTGzySpVWrVrrpEHIPzNwngA7mROUnuUHNR6TBAE2ergZLhyBnfVW
	RUVYgW5+9rqEMt8F1MWf8qwR7UUjv4mQEdYnwQYT1gK7bv8HgC6qGoQ5UE+JSqaMnV+9u/
	IFr7NZO8PUVfpea5ZWAqdymWRGwnyLYrrOZGIhfqvZhLgoQHt5WMGCeFgh6Ny4F+swoqAX
	TyByTHT9kqL2KHViMHVKIOlVjIHFY9/qRhncM3rENORPktp5RHmDX+NjrIgG+w==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Hauke Mehrtens <hauke@hauke-m.de>, Aleksander Jan Bajkowski <olek2@wp.pl>,
 John Crispin <john@phrozen.org>, Sebastien Decourriere <sebtx452@gmail.com>,
 Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: mtd: Add lantiq,nor
Date: Tue, 17 Nov 2026 17:45:36 +0100
Message-ID: <5155531.6YUMPnJmAY@prime>
In-Reply-To: <87fqwzn3tq.fsf@bootlin.com>
References: <20261114100608.3432120-1-sw@simonwunderlich.de>
 <20261114100608.3432120-3-sw@simonwunderlich.de> <87fqwzn3tq.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_084543_332569_898EB0F6 
X-CRM114-Status: GOOD (  25.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlc2RheSwgTm92ZW1iZXIgMTcsIDIwMjYgMTE6MzU6MTPigK9BTSBDZW50cmFsIEV1cm9w
ZWFuIFN0YW5kYXJkIFRpbWUgCk1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgU2ltb24sCj4gCj4g
T24gMTQvMTEvMjAyNiBhdCAxMTowNjowNCArMDEsIFNpbW9uIFd1bmRlcmxpY2ggPHN3QHNpbW9u
d3VuZGVybGljaC5kZT4gCndyb3RlOgo+ID4gVGhlIE5PUiBmbGFzaCBvbiB0aGUgRXh0ZXJuYWwg
QnVzIFVuaXQgKEVCVSkgb2YgTGFudGlxIFNvQ3MgaXMgaGFuZGxlZAo+ID4gYnkgdGhlIGxhbnRp
cS1mbGFzaCBkcml2ZXIgYW5kIHVzZWQgYnkgZGFudWJlX2Vhc3k1MDcxMi5kdHMsIGJ1dCBpdHMK
PiA+IGJpbmRpbmcgd2FzIG5ldmVyIGRvY3VtZW50ZWQuCj4gPiAKPiA+IEFkZCBhIHNjaGVtYSBm
b3IgaXQsIGluY2x1ZGluZyBhIG5ldyBvcHRpb25hbCBsYW50aXEsZWJ1LXN3YXAtY2hlY2sKPiA+
IHByb3BlcnR5LiBTb21lIGJvb3QgbG9hZGVycywgbGlrZSB0aGUgQk9TUyBib290bW9uaXRvciBv
biB0aGUgYmludGVjCj4gPiBlbG1lZyBSUzEyMyBhbmQgUlMzNTMsIGVuYWJsZSB0aGUgRUJVJ3Mg
b3duIGVuZGlhbm5lc3Mgc3dhcHBpbmcgZm9yIHRoZQo+ID4gZmxhc2ggY2hpcCBzZWxlY3QgKEVC
VV9CVVNDT04wIGJpdCAzMCksIGFuZCB0aGUgZmxhc2ggdGhlbiBhcHBlYXJzIGF0Cj4gPiBpdHMg
dW5zd2FwcGVkIGFkZHJlc3Nlcy4gV2hldGhlciB0aGF0IGJpdCBjYW4gYmUgdHJ1c3RlZCBkZXBl
bmRzIG9uIHRoZQo+ID4gU29DOiBpdCBvbmx5IHdvcmtzIG9uIFZSOSAoeFJYMjAwKSBmcm9tIHJl
dmlzaW9uIDEuMiBhbmQgb24gQVIxMAo+ID4gKHhSWDMwMCksIGFuZCBGYWxjb24gaGFzIG5vIHN1
Y2ggcmVnaXN0ZXIuIEEgYm9hcmQgcHJvcGVydHkgaW5zdGVhZCBvZgo+ID4gYSBsaXN0IG9mIFNv
QyByZXZpc2lvbnMgaW4gdGhlIGRyaXZlciB3YXMgcmVxdWVzdGVkIGluIHRoZSByZXZpZXcgb2Yg
YW4KPiA+IGVhcmxpZXIgYXR0ZW1wdCBhdCB0aGlzLiBUaGUgcHJvcGVydHkgZG9lcyBub3Qgc3Rh
dGUgdGhlIGJpdCdzIHZhbHVlLAo+ID4gc28gYSBib2FyZCBrZWVwcyB3b3JraW5nIHdpdGggZWl0
aGVyIGJvb3QgbG9hZGVyIHNldHRpbmcuCj4gPiAKPiA+IExpbms6Cj4gPiBodHRwczovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDE3LUphbnVhcnkvMDcxNzQ5Lmh0
bWwKPiA+IExpbms6Cj4gPiBodHRwczovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xp
bnV4LW10ZC8yMDE3LUphbnVhcnkvMDcxODE4Lmh0bWwKPiA+IFNpZ25lZC1vZmYtYnk6IFNpbW9u
IFd1bmRlcmxpY2ggPHN3QHNpbW9ud3VuZGVybGljaC5kZT4KPiAKPiBMZXQncyBiZSBob25lc3Qs
IEkgYW0gbm90IHZlcnkgZmFtaWxpYXIgd2l0aCB0aGF0IE1URCBhcmVhIGFuZCBhbGwgdGhlCj4g
bGVnYWN5IGNvbnRlbnQgaXMgaGFzLCBidXQgd291bGQgaXQgYmUgYSBsb3QgbW9yZSB3b3JrIHRv
IGFkZCBsYW50aXEgYXMKPiBhIHBoeXNtYXAgdmFyaWFudD8gSSBkb24ndCBsaWtlIG11Y2ggdGhl
IGZhY3QgdGhhdCB5b3UgZGVzY3JpYmUgdGhlCj4gZmxhc2ggd2l0aG91dCBkZXNjcmliaW5nIHRo
ZSBFQlUuIFBoeXNtYXAgdmVyc2lvbnMgdHlwaWNhbGx5IGFyZSBtYXRjaGVkCj4gdXNpbmcgdGhl
IG1vcmUgc3BlY2lmaWMgY29tcGF0aWJsZSAobGFudGlxLGVidT8pIGFuZCB0aGUgY2ZpLWZsYXNo
Cj4gZmFsbGJhY2suIEFsbCB5b3VyIHR3ZWFrcyBhcmUgRUJVL21hY2hpbmUvaW50ZWdyYXRpb24g
ZGV0YWlscywgbm90Cj4gcmVsYXRlZCB0byB0aGUgZmxhc2ggaXRzZWxmLgo+IAo+IE9uZSBjb25z
ZXF1ZW5jZSBvZiBub3QgbW9kZWxpbmcgdGhlIGNvbnRyb2xsZXIgaXMgeW91ciBuZWVkIGZvcgo+
IEVYUE9SVF9TWU1CT0xfR1BMKGx0cV9lYnVfbWVtYmFzZSkgaW4gcGF0Y2ggMy81LCB3aGljaCBp
cyBxdWl0ZSBhIGhhY2suCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCkhpIE1pcXXDqGwsCgp0aGFu
ayB5b3UgZm9yIGFwcGx5aW5nIHBhdGNoIDEhCgpBYm91dCBwaHlzbWFwOiB5b3Ugd2VyZSByaWdo
dCwgYW5kIHRoaXMgd2FzIGFjdHVhbGx5IGEgZ3JlYXQgaGludC4gSSB0ZXN0ZWQgb24gCnRoZSBt
eSBSUzEyMzogd2l0aCB0aGUgRUJVIHN3YXAgdGhhdCBpdHMgYm9vdCBsb2FkZXIgZW5hYmxlcywg
dGhlIGZsYXNoIGlzIApzaW1wbHkgYSBwbGFpbiBDRkkgZmxhc2guIFdpdGggY29tcGF0aWJsZSA9
ICJjZmktZmxhc2giIGFuZCB0aGUgZ2VuZXJpYyBwaHlzbWFwIApkcml2ZXIsIHByb2JpbmcsIHJl
YWRzIChpZGVudGljYWwgdG8gd2hhdCBsYW50aXEtZmxhc2ggcmVhZHMsIHVuYWxpZ25lZCByZWFk
cyAKaW5jbHVkZWQpLCBlcmFzZSBhbmQgd3JpdGUgYWxsIHdvcmsuIFNvIHRoaXMgYm9hcmQgbmVl
ZHMgbm8gbGFudGlxLWZsYXNoIGNoYW5nZSAKYXQgYWxsLCBhbmQgSSdtIGRyb3BwaW5nIHBhdGNo
ZXMgMiB0byA1LiBUaGVyZSB3b24ndCBiZSBhIHYyLgoKVHVybmluZyBsYW50aXEtZmxhc2ggaXRz
ZWxmIGludG8gYSBwaHlzbWFwIHZhcmlhbnQgZm9yIHRoZSBib2FyZHMgd2l0aCB0aGUgCmNsYXNz
aWMgVS1Cb290IHNldHVwIHdvdWxkIHByb2JhYmx5IGJlIHRoZSBjbGVhbmVyIG1vZGVsLCBidXQg
SSBkb24ndCBoYXZlIApzdWNoIGEgYm9hcmQgdG8gdGVzdCBpdCwgc28gSSdtIGxlYXZpbmcgdGhh
dCBhbG9uZSBmb3Igbm93LgoKVGhhbmsgeW91IGFnYWluIQogICAgIFNpbW9uCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
