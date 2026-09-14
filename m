Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD255C88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 12:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JcrA6o60Z/8X6swz4kcbKDrExcF1bqgPp0sYI5zPNM=; b=KpYUnib0rtuEOI
	H7X73gWFCHIB2a7yLxpNShWJ6N9Y6xoxKkDJF/P+6F6F9K1GDmMALiHePVJ/ScxfGtVrA6EpoQynQ
	CVbLGCTFhUycsv3oyTh7r9GFCn3hhjoM7IYNZUbqMd1buhV+hWI2NgGL9kLriIMtR2M40+NfDQJOd
	ZthMSdwgAx9FzYp0YDU4lEluUbLqK8gqIuyebC+YIDIrZhr0Yn5/GPZhTKjxU5SS1LrOUkZ1cs2Za
	tPemPGyUJJe1if0tLusMeJED/sTjgu/9Z/mPF5GmLwB+zI4f5wH9WWjbSk/w02xgJQPPtLh/G4NbD
	a03bSJwMamytf2yZUx2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65VU-00000003Uke-1qyD;
	Mon, 14 Sep 2026 12:09:56 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65VQ-00000003Ujz-3rMM
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 12:09:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DEC6AC6220A;
	Mon, 14 Sep 2026 12:10:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD8AA60323;
	Mon, 14 Sep 2026 12:09:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00C7E11C7AFEA;
	Mon, 14 Sep 2026 14:09:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789387787; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=imnBdl+Y6imr4XHv64a6LJ2Rk4vo6DK7imSA+6oOEmY=;
	b=qanpWb6bTANqCQiqendoxvJEOtm+FThRWr7Wufa6tx8owz2Ve3ibimrT5eyKlS4BjM+XzV
	MyCgowQ3UhWagZCsZj360UTbNMLCze4f2xZaUBLu/HERDJwK+8YLuqUeDQp9I+Bsh7tH3S
	HHJ6YjV0nZNPf4LU8OKZJpqdmFL268SOSwg61jNaOWnteRz0rc2jvyEsl+jxEZfEAxz/Ie
	mJlmpt0wO4aDtlRslaTupTYvbKjSSWqmp4Z026T2sx1iDVlwQksO8ulsX92osfEirbOIP0
	F1zV6r8laK0HKPJxQ2cw0H4b2kIZjYfl6Vdl31JrDcHRJsN7oeH+590KDdfiRg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Itai Handler <itai.handler@gmail.com>
Cc: mwalle@kernel.org,  pratyush@kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  vigneshr@ti.com,  richard@nod.at,
  takahiro.kuwano@infineon.com,  stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: fix the lock left held by
 spi_nor_rww_start_exclusive()
In-Reply-To: <20260914081149.1916589-2-itai.handler@gmail.com> (Itai Handler's
	message of "Mon, 14 Sep 2026 11:11:47 +0300")
References: <20260914081149.1916589-1-itai.handler@gmail.com>
	<20260914081149.1916589-2-itai.handler@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 14 Sep 2026 14:09:36 +0200
Message-ID: <87ld94owzj.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_050953_166560_2691FC25 
X-CRM114-Status: GOOD (  16.84  )
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

T24gMTQvMDkvMjAyNiBhdCAxMToxMTo0NyArMDMsIEl0YWkgSGFuZGxlciA8aXRhaS5oYW5kbGVy
QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IHNwaV9ub3Jfcnd3X3N0YXJ0X2V4Y2x1c2l2ZSgpIHRha2Vz
IG5vci0+bG9jayBhbmQgbmV2ZXIgZHJvcHMgaXQuIEl0Cj4gcmV0dXJucyB3aXRoIHRoZSBtdXRl
eCBoZWxkIHdoZXRoZXIgaXQgaGFuZHMgb3V0IHRoZSBleGNsdXNpdmUgY2xhaW0gb3IKPiByZXBv
cnRzIHRoZSBmbGFzaCBidXN5LCBsZWF2aW5nIHRoZSBjYWxsZXIgaG9sZGluZyBhIGxvY2sgaXQg
ZG9lcyBub3QKPiBrbm93IGl0IGhhcy4KPgo+IENvbW1pdCAwM2U3YmI4NjRkOWEgKCJtdGQ6IHNw
aS1ub3I6IHVzZSBzY29wZS1iYXNlZCBtdXRleCBjbGVhbnVwCj4gaGVscGVycyIpIHR1cm5lZCBp
dHMgImdvdG8gYnVzeSIgaW50byBhIHBsYWluICJyZXR1cm4gZmFsc2UiIGFuZCBkZWxldGVkCj4g
dGhlIGJ1c3k6IGxhYmVsIHRoYXQgZGlkIHRoZSBtdXRleF91bmxvY2soKSwgYnV0IGtlcHQgdGhl
IG11dGV4X2xvY2soKQo+IGF0IHRoZSB0b3AgaW5zdGVhZCBvZiByZXBsYWNpbmcgaXQgd2l0aCBn
dWFyZChtdXRleCkuIEl0IGlzIG5vdyB0aGUgb25seQo+IG9uZSBvZiB0aGUgdGVuIHNwaV9ub3Jf
cnd3X3tzdGFydCxlbmR9XyogaGVscGVycyB0aGF0IGRvZXMgbm90IHVzZSB0aGUKPiBndWFyZC4K
Pgo+IEl0cyBvbmx5IGNhbGxlciBpcyBzcGlfbm9yX3ByZXBfYW5kX2xvY2soKSwgc28gb24gYSBm
bGFzaCB3aXRoCj4gU05PUl9GX1JXVyBzZXQ6Cj4KPiAgLSBpZiB0aGUgZmxhc2ggaXMgaWRsZSBp
dCByZXR1cm5zIHRydWUgd2l0aCBub3ItPmxvY2sgaGVsZCwgYW5kIHRoZQo+ICAgIG1hdGNoaW5n
IHNwaV9ub3JfdW5sb2NrX2FuZF91bnByZXAoKSBjYWxscwo+ICAgIHNwaV9ub3Jfcnd3X2VuZF9l
eGNsdXNpdmUoKSwgd2hvc2UgZ3VhcmQobXV0ZXgpKCZub3ItPmxvY2spIHRoZW4KPiAgICBkZWFk
bG9ja3Mgb24gdGhlIG5vbi1yZWN1cnNpdmUgbXV0ZXg7Cj4KPiAgLSBpZiB0aGUgZmxhc2ggaXMg
YnVzeSBpdCByZXR1cm5zIGZhbHNlIHdpdGggbm9yLT5sb2NrIGhlbGQsIGFuZAo+ICAgIHdhaXRf
ZXZlbnRfa2lsbGFibGUoKSBzbGVlcHMgaG9sZGluZyBpdCwgc28gdGhlIG9wZXJhdGlvbiB0aGF0
IHdvdWxkCj4gICAgY2xlYXIgb25nb2luZ18qIGNhbiBuZXZlciB0YWtlIHRoZSBsb2NrIHRvIGRv
IHNvLgo+Cj4gTm90aGluZyByZWFjaGVzIHRoaXMgdG9kYXk6IHRoZSBvbmx5IGZsYXNoIHdpdGgg
U1BJX05PUl9SV1cgaXMgdGhlCj4gTVgyNVVXNTEyNDVHLCB3aGljaCBoYXMgbmVpdGhlciBPVFAg
bm9yIGxvY2tpbmcgb3BzLCBzbyBub25lIG9mIHRoZQo+IGV4aXN0aW5nIHNwaV9ub3JfcHJlcF9h
bmRfbG9jaygpIGNhbGxlcnMgaW4gb3RwLmMsIHN3cC5jIGFuZCBzc3QuYyBhcHBseQo+IHRvIGl0
LiBJdCBiZWNvbWVzIHJlYWNoYWJsZSBhcyBzb29uIGFzIGFueSBjb21tb24gcGF0aCB0YWtlcyB0
aGUKPiBleGNsdXNpdmUgbG9jay4KPgo+IFVzZSBndWFyZChtdXRleCkgYXMgdGhlIG90aGVyIGhl
bHBlcnMgZG8uCj4KPiBGaXhlczogMDNlN2JiODY0ZDlhICgibXRkOiBzcGktbm9yOiB1c2Ugc2Nv
cGUtYmFzZWQgbXV0ZXggY2xlYW51cCBoZWxwZXJzIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwo+IFNpZ25lZC1vZmYtYnk6IEl0YWkgSGFuZGxlciA8aXRhaS5oYW5kbGVyQGdtYWlsLmNv
bT4KCk1pY2hhZWwsIHNpbmNlIHdlIGFscmVhZHkgZ290IGEgY3ljbGUgd2l0aCBBSSB3YWxscyBv
ZiB0ZXh0IGp1c3QgdG8gdGVsbAoiZml4IHRoYXQgZGFtbiBjb252ZXJzaW9uIiwgY2FuIEkgKG9y
IHlvdSkgYXBwbHkgdGhhdCBvdGhlciBwYXRjaCwgc28gd2UKY2FuIGdldCByaWQgb2YgdGhlc2U/
IExldCBtZSBrbm93IHdoYXQgeW91IHByZWZlciwgYWx0aG91Z2ggSSBkb24ndApyZW1lbWJlciB3
aGVyZSB0aGF0IHRocmVhZCBpcy4KCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
