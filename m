Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D819E77188
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2025 11:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvLQvTPkxYdmzhWuabFcyNMeNsxe6KCT2q0v5kR5Jxk=; b=AhBs0ZzuiSMb0J
	hNPctrCuAe73jE7wDpMEdYXLGsEpruSA8jeuAUfOBFKV6xbZ/OOvLXzYkM76ThMoWV7K+P+lxnGuL
	RpkzwxGQ6jYjo6CXwHDACyVJOXNOIVnWQ4fNvzMpTC8K6SKKxiKZbSNVHXMEkyQ1oXM5D+0hAak/V
	21IRKuP15+ewR0C9U0wlXOSjUlhgwniVpBywGeXRP/bdhx6qWtHBszfav+Zem0uEnQrlek/Q5Wvnd
	My1TmfhAp1BLo8g1WLJxNVx4AWL+1OniGZPKf8Gtww/ws2EogYhjF8E1ZIAo2JKd0LDpsgj+PEusW
	ZACtClIf/mv2XQdKoi4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXelz-00000008CkV-3gRr;
	Tue, 14 Jan 2025 11:07:51 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXelx-00000008Ck4-49nW
	for linux-mtd@lists.infradead.org;
	Tue, 14 Jan 2025 11:07:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94BA81C0002;
	Tue, 14 Jan 2025 11:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736852864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z91mxdq404TCduefYxC4gpxwfyjslXNMsT+OaaAh4GE=;
	b=pXL4uiQi3hi0x359JlQRQ67GpaIvtlIEYjHPr417136pCStyr2odiJqgzecE0bnWcCURhN
	D3M+PpoaIpJK5MCiBIoXr14GHDPYGYakXHu5SsS0g2GxNfZNrXO/1G36Gl67HvdMdS3Qr3
	983MQKigyjF01U0/stZjPjZQu7lbDV0CiaifL/hdWrCmq5sg81UJcl6oKHGYhmC92xLCbJ
	axRTdxv/FCZrnf+OsUA3SL5DAqAgt4VnhtBl+XKFhxNGYVdNuLdA8R2DDCz2wUxb3D/R54
	xHG+6hYmRbF6c4RBKazrs0QGGoAzR4jW3DFX5MUxqOKK3k8yMi8E8xn42Rpzzg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael Walle
 <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: winbond: Add support for w25q01jv
In-Reply-To: <mafs0ldve7qms.fsf@kernel.org> (Pratyush Yadav's message of "Mon,
	13 Jan 2025 14:08:43 +0000")
References: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-0-f7c4dff66182@bootlin.com>
	<20241224-winbond-6-12-rc1-nor-volatile-bit-v1-1-f7c4dff66182@bootlin.com>
	<mafs0zfkk7pfm.fsf@kernel.org> <871pxp798c.fsf@bootlin.com>
	<mafs0ldve7qms.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 14 Jan 2025 12:07:42 +0100
Message-ID: <87a5btslfl.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_030750_165826_C89090C4 
X-CRM114-Status: GOOD (  19.65  )
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

SGVsbG8gUHJhdHl1c2gsCgo+PiBXaW5ib25kIGNoaXBzIChtYXliZSB0aGlzIGlzIGEgc2hhcmVk
IGNhcGFiaWxpdHk/KSBhY2NlcHRzIGFub3RoZXIKPj4gY29tbWFuZCwgIldyaXRlIEVuYWJsZSBm
b3IgVm9sYXRpbGUgU3RhdHVzIFJlZ2lzdGVyICg1MGgpIiwgd2hpY2gKPj4gc3BlY2lmaWNhbGx5
IGNoYW5nZSB0aGUgc3RhdHVzIHJlZ2lzdGVyIGJpdHMgdG8gdXNlIHRoZSB2b2xhdGlsZSBtZXRo
b2QuCj4+Cj4+IEhlbmNlLCBpZiB0aGUgb25seSBzaXR1YXRpb24gd2Ugd2FudCB0byBzb2x2ZSBp
cyB0aGUgc3RhdHVzIHJlZ2lzdGVyCj4+IGFjY2VzcywgdGhlbiB3ZSBtYXkganVzdCBlbmFibGUg
dGhpcyBjb21tYW5kICh0aGlzIGlzIHRoZSB0aGlyZCBzb2x1dGlvbgo+PiBJIHRyaWVkIHRvIGV4
cGxhaW4gaW4gdGhlIGNvbW1pdCBsb2cpLCBidXQgaWYgd2UgdGhpbmsgdGhlcmUgYXJlIG90aGVy
Cj4+IHJhY3kgc2l0dWF0aW9ucywgdGhpcyBhcHByb2FjaCBpcyBub3QgY29tcGxldGUgYW5kIHdl
IG11c3QgZmFsbGJhY2sgdG8KPj4gb25lIG9mIHRoZSBhcHByb2FjaGVzIGxpc3RlZCBhYm92ZS4K
Pgo+IEkgYW0gbm90IHF1aXRlIHN1cmUgaG93IHlvdSBmaXggdGhlIHdyaXRlLWVuYWJsZS1iZWlu
Zy1yYWN5IGJ1ZyB3aXRoCj4geW91ciBwYXRjaC4gSWYgeW91IGxvb2sgYXQgdGhlIGNvZGUsIHNw
aV9ub3Jfd3JpdGVfZW5hYmxlKCkgb25seSBjYWxscwo+IHRoZSB3cml0ZSBlbmFibGUgY29tbWFu
ZCAoMDZoKSwgYW5kIGRvZXMgbm90IGNhbGwKPiBzcGlfbm9yX3dhaXRfdGlsbF9yZWFkeSgpIGFm
dGVyIHRoYXQuIEFmdGVyIHRoZSB3cml0ZSBlbmFibGUsIGl0Cj4gaW1tZWRpYXRlbHkgZXhlY3V0
ZXMgdGhlIHByb2dyYW0gb3IgZXJhc2Ugb3BlcmF0aW9uLiBTbyB5b3UgbmV2ZXIKPiBhY3R1YWxs
eSB3YWl0IGZvciBhbGwgZGllcyB0byBiZSByZWFkeSBhZnRlciBhIHdyaXRlIGVuYWJsZS4KCkkg
d2lsbCBkb3VibGUgY2hlY2sgYnV0IG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGUgKnN0YXR1
cyByZWdpc3RlcioKd3JpdGUgaXMgcmFjeSwgbm90IHRoZSBzcGlfbm9yX3dyaXRlX2VuYWJsZSgp
LgoKPiBZb3UgY2FuIHNlZSBhbiBleGFtcGxlIGluIHNwaV9ub3Jfd3JpdGUoKS4gSXQgZG9lczoK
Pgo+ICAgICBzcGlfbm9yX3dyaXRlX2VuYWJsZSgpIC0+IHNwaV9ub3Jfd3JpdGVfZGF0YSgpIC0+
Cj4gICAgIHNwaV9ub3Jfd2FpdF90aWxsX3JlYWR5KCkKCldoYXQgaXMgcmFjeSBpczogYWN0IG9u
IGFsbCBkaWVzIHRoZW4gY2hlY2sgdGhlIHN0YXR1cyBvZiBhIHNpbmdsZSBkaWUuCgo+IERvIHlv
dSBoYXZlIGEgY29uc2lzdGVudCByZXByb2R1Y2VyIGZvciB0aGUgcmFjZT8gSWYgc28sIGRvZXMg
dGhlIHBhdGNoCj4gYWN0dWFsbHkgc29tZWhvdyBtYWtlIHRoZSByYWNlIGdvIGF3YXk/IElmIHNv
LCBJIHdvdWxkIGJlIGN1cmlvdXMgdG8KPiBrbm93IHdoeS4KCk5vdCB3aXRoIExpbnV4LCBpdCBp
cyBhIHByb2JsZW0gdGhhdCBoYXMgYmVlbiAoY29uc2lzdGVudGx5KSBvYnNlcnZlZAp1c2luZyBh
biBydG9zLiBJdCdzIGJlZW4gYW5hbHlzZWQgc28gd2Uga25vdyB3aGF0IHRoZSBpc3N1ZSBpcyBh
bmQgd2UKd2FudCB0byBtYWtlIHN1cmUgdGhpcyBjYW5ub3QgaGFwcGVuIHVzaW5nIExpbnV4LgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
