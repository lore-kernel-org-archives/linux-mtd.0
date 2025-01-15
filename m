Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF369C02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 14:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+NQteiPbF6vZXuEXR6W+NkIGOUiv8jirtYJMcfrCWbM=; b=mqlLVnT4gvD+E8
	0B2zAJvQ9I/mBdWG+bUJo+Qbm8VAM+Rw+qyGK4xFdBSEbn8AdvpmlXlX3aw08yuojBzwL7zAY55Qp
	sADAK0Y2UniUIeLwiW3qL0XKNDLVyoyjkNLxRv/KRK/3Yv5A/BmSz4b68sPCE6z5p9ds3Fk/jBtRK
	V3VobBd2aCXy5IAHMhJur1jGtxSbRCOeQEq0yT+wm43xtiHpI39XlHGxPRg42j4pR8g9FNXfysmiY
	trefo3vItWMnP+mLP53DouZ0hcil4iun6Tl3ALsepdxwcAxqlpu62iPOSyrzMGi96nQ7HNq2+8dQu
	QF5InnhhXtho4a4thghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3zU-0000000C4Ig-2fiu;
	Wed, 15 Jan 2025 14:03:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3zS-0000000C4IJ-3QKA
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 14:03:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BF265C5B30;
	Wed, 15 Jan 2025 14:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654CBC4CEDF;
	Wed, 15 Jan 2025 14:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736949805;
	bh=b4hQ6NunCke1/CWWrRyXZHunsy0DEoKHZi66BbKVvvY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tLaURzo178D75fShPt+NuymZ6HvqxR1pM+axBDgFdInpo0PBvBknTJdmy/UGP6VSy
	 8aZ4ESBtrFb/OIPbT9tes1AOi60zyqtLy+/WxterkOVumzKk4Q3zWxYShTmpEFVl2W
	 Jxc7o8ZER+nqFeSe/uv59+CZMiX+vHFmb43qthMprJ463wcwXiOrR6CgC6vMnIoqjk
	 9qsrKU2b7YlL00A7DCD4w+Utm7eV00Pr3WwF39Gmpx2emef3k7E1/bUeVUpRtt3zfz
	 vhLdyEXjr1hWoZwCsrdSxOBqrNG8C0oCx7oZZLlZ23p1rvgEblOT6vYAWRzYh8v8A8
	 GfGtgn7UdZAVA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: winbond: Add support for w25q01jv
In-Reply-To: <87a5btslfl.fsf@bootlin.com> (Miquel Raynal's message of "Tue, 14
	Jan 2025 12:07:42 +0100")
References: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-0-f7c4dff66182@bootlin.com>
	<20241224-winbond-6-12-rc1-nor-volatile-bit-v1-1-f7c4dff66182@bootlin.com>
	<mafs0zfkk7pfm.fsf@kernel.org> <871pxp798c.fsf@bootlin.com>
	<mafs0ldve7qms.fsf@kernel.org> <87a5btslfl.fsf@bootlin.com>
Date: Wed, 15 Jan 2025 14:03:23 +0000
Message-ID: <mafs08qrc5g44.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_060326_938765_D2C2764E 
X-CRM114-Status: GOOD (  30.64  )
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

T24gVHVlLCBKYW4gMTQgMjAyNSwgTWlxdWVsIFJheW5hbCB3cm90ZToKCj4gSGVsbG8gUHJhdHl1
c2gsCj4KPj4+IFdpbmJvbmQgY2hpcHMgKG1heWJlIHRoaXMgaXMgYSBzaGFyZWQgY2FwYWJpbGl0
eT8pIGFjY2VwdHMgYW5vdGhlcgo+Pj4gY29tbWFuZCwgIldyaXRlIEVuYWJsZSBmb3IgVm9sYXRp
bGUgU3RhdHVzIFJlZ2lzdGVyICg1MGgpIiwgd2hpY2gKPj4+IHNwZWNpZmljYWxseSBjaGFuZ2Ug
dGhlIHN0YXR1cyByZWdpc3RlciBiaXRzIHRvIHVzZSB0aGUgdm9sYXRpbGUgbWV0aG9kLgo+Pj4K
Pj4+IEhlbmNlLCBpZiB0aGUgb25seSBzaXR1YXRpb24gd2Ugd2FudCB0byBzb2x2ZSBpcyB0aGUg
c3RhdHVzIHJlZ2lzdGVyCj4+PiBhY2Nlc3MsIHRoZW4gd2UgbWF5IGp1c3QgZW5hYmxlIHRoaXMg
Y29tbWFuZCAodGhpcyBpcyB0aGUgdGhpcmQgc29sdXRpb24KPj4+IEkgdHJpZWQgdG8gZXhwbGFp
biBpbiB0aGUgY29tbWl0IGxvZyksIGJ1dCBpZiB3ZSB0aGluayB0aGVyZSBhcmUgb3RoZXIKPj4+
IHJhY3kgc2l0dWF0aW9ucywgdGhpcyBhcHByb2FjaCBpcyBub3QgY29tcGxldGUgYW5kIHdlIG11
c3QgZmFsbGJhY2sgdG8KPj4+IG9uZSBvZiB0aGUgYXBwcm9hY2hlcyBsaXN0ZWQgYWJvdmUuCj4+
Cj4+IEkgYW0gbm90IHF1aXRlIHN1cmUgaG93IHlvdSBmaXggdGhlIHdyaXRlLWVuYWJsZS1iZWlu
Zy1yYWN5IGJ1ZyB3aXRoCj4+IHlvdXIgcGF0Y2guIElmIHlvdSBsb29rIGF0IHRoZSBjb2RlLCBz
cGlfbm9yX3dyaXRlX2VuYWJsZSgpIG9ubHkgY2FsbHMKPj4gdGhlIHdyaXRlIGVuYWJsZSBjb21t
YW5kICgwNmgpLCBhbmQgZG9lcyBub3QgY2FsbAo+PiBzcGlfbm9yX3dhaXRfdGlsbF9yZWFkeSgp
IGFmdGVyIHRoYXQuIEFmdGVyIHRoZSB3cml0ZSBlbmFibGUsIGl0Cj4+IGltbWVkaWF0ZWx5IGV4
ZWN1dGVzIHRoZSBwcm9ncmFtIG9yIGVyYXNlIG9wZXJhdGlvbi4gU28geW91IG5ldmVyCj4+IGFj
dHVhbGx5IHdhaXQgZm9yIGFsbCBkaWVzIHRvIGJlIHJlYWR5IGFmdGVyIGEgd3JpdGUgZW5hYmxl
Lgo+Cj4gSSB3aWxsIGRvdWJsZSBjaGVjayBidXQgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRo
ZSAqc3RhdHVzIHJlZ2lzdGVyKgo+IHdyaXRlIGlzIHJhY3ksIG5vdCB0aGUgc3BpX25vcl93cml0
ZV9lbmFibGUoKS4KCk9rYXksIEkgYW0gY29uZnVzZWQgYmVjYXVzZSB5b3Ugc2FpZCBlYXJsaWVy
IHRoYXQ6Cgo+IFRoZSBidWcgdGhhdCBoYXMgYmVlbiBleHBlcmllbmNlZCBmb2xsb3dlZCB0aGlz
IHNlcXVlbmNlOgo+IC0gc2VuZCB0aGUgd3JpdGUgZW5hYmxlIGNvbW1hbmQgKG5vbi12b2xhdGls
ZSkKPiAtIHdhaXQgZm9yIHRoZSByZWFkeS9idXN5IGJpdCwgaWUuIHdhaXQgZm9yIHRoZSBXRUwg
Yml0IHRvIGJlIHNldAo+ICAgYmVjYXVzZSBpdCBpcyBub24tdm9sYXRpbGUgd3JpdGUKPiAtIGFj
dGl2ZSBkaWUgaXMgcmVhZHksIChidXQgaWRsZSBkaWUgaXMgbm90ISkKPiAtIGVudGVyIDQtYnl0
ZSBhZGRyZXNzIG1vZGUsIG9ubHkgdGhlIGRpZSB0aGF0IGlzIHJlYWR5IHByb2Nlc3NlcyB0aGUK
PiAgIGNvbW1hbmQuCgpXaGljaCBzYXlzIHRoZSBXRUwgYml0IGJlaW5nIHNldCBpdHNlbGYgaXMg
cmFjeS4gV2hhdCBJIHVuZGVyc3RhbmQgZnJvbQp0aGF0IGlzIG9uZSBkaWUgaXMgcmVhZHkgdG8g
dGFrZSB3cml0ZXMgYW5kIHRoZSBvdGhlciBpcyBub3QuIE5vdyB3aGVuCnlvdSB0cnkgdG8gd3Jp
dGUgdGhlIFNSIHRvIGVuYWJsZSA0QiBtb2RlLCBpdCB3b3VsZCBvbmx5IHdvcmsgb24gdGhlIGRp
ZQp0aGF0IGdvdCB0aGUgV0VMIHNldC4gVGhlIG90aGVyIG9uZSBpZ25vcmVzIGl0IGFuZCBzdGF5
cyBpbiAzQiBtb2RlLiBEbwpJIHVuZGVyc3RhbmQgdGhpcyBjb3JyZWN0bHk/IFRvIGZpeCB0aGlz
IHlvdSBuZWVkIHRvIHdhaXQgYWZ0ZXIgdGhlCndyaXRlIGVuYWJsZSwgYmVmb3JlIHlvdSBpbml0
aWF0ZSB0aGUgd3JpdGUgU1Igb3BlcmF0aW9uLgoKPgo+PiBZb3UgY2FuIHNlZSBhbiBleGFtcGxl
IGluIHNwaV9ub3Jfd3JpdGUoKS4gSXQgZG9lczoKPj4KPj4gICAgIHNwaV9ub3Jfd3JpdGVfZW5h
YmxlKCkgLT4gc3BpX25vcl93cml0ZV9kYXRhKCkgLT4KPj4gICAgIHNwaV9ub3Jfd2FpdF90aWxs
X3JlYWR5KCkKPgo+IFdoYXQgaXMgcmFjeSBpczogYWN0IG9uIGFsbCBkaWVzIHRoZW4gY2hlY2sg
dGhlIHN0YXR1cyBvZiBhIHNpbmdsZSBkaWUuCgpZb3VyIHBhdGNoIGZpeGVzIGFsbCBzdWNoIG9w
ZXJhdGlvbnMsIGV4Y2VwdCB3cml0ZSBlbmFibGUgSUlVQy4gRm9yCm9wZXJhdGlvbnMgc3VjaCBh
cyB3cml0ZSBTUiAob3IgYW55IG90aGVyIHJlZ2lzdGVyKSBvciBjaGlwIGVyYXNlLCB3ZQp3b3Vs
ZCBjYWxsIHNwaV9ub3Jfd2FpdF90aWxsX3JlYWR5KCksIGFuZCB5b3VyIHBhdGNoIHdvdWxkIG1h
a2Ugc3VyZSBhbGwKZGllcyBhcmUgcmVhZHkuCgpCdXQgd2hlbiB3cml0ZSBlbmFibGUgaXRzZWxm
IGlzIHJhY3ksIHRoZW4gd2Ugd291bGQgbmVlZCB0byBhZGQgYSB3YWl0CmFmdGVyIHRoZSB3cml0
ZSBlbmFibGUsIHdoaWNoIHlvdXIgcGF0Y2ggZG9lcyBub3QgZG8uIEkgYW0gYSBiaXQKY29uZnVz
ZWQgcmlnaHQgbm93IHdoZXRoZXIgdGhhdCBpcyBhbiBhY3R1YWwgcHJvYmxlbSBvciBJIGp1c3Qg
bWlzcmVhZAp5b3VyIG1lc3NhZ2UuIElmIHdyaXRlIGVuYWJsZSBpdHNlbGYgaXNuJ3QgcmFjeSwg
dGhlbiB0aGUgdjMgc2VyaWVzCnNob3VsZCBiZSBnb29kIHRvIGdvLgoKPgo+PiBEbyB5b3UgaGF2
ZSBhIGNvbnNpc3RlbnQgcmVwcm9kdWNlciBmb3IgdGhlIHJhY2U/IElmIHNvLCBkb2VzIHRoZSBw
YXRjaAo+PiBhY3R1YWxseSBzb21laG93IG1ha2UgdGhlIHJhY2UgZ28gYXdheT8gSWYgc28sIEkg
d291bGQgYmUgY3VyaW91cyB0bwo+PiBrbm93IHdoeS4KPgo+IE5vdCB3aXRoIExpbnV4LCBpdCBp
cyBhIHByb2JsZW0gdGhhdCBoYXMgYmVlbiAoY29uc2lzdGVudGx5KSBvYnNlcnZlZAo+IHVzaW5n
IGFuIHJ0b3MuIEl0J3MgYmVlbiBhbmFseXNlZCBzbyB3ZSBrbm93IHdoYXQgdGhlIGlzc3VlIGlz
IGFuZCB3ZQo+IHdhbnQgdG8gbWFrZSBzdXJlIHRoaXMgY2Fubm90IGhhcHBlbiB1c2luZyBMaW51
eC4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgotLSAKUmVnYXJkcywKUHJhdHl1c2ggWWFkYXYKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
