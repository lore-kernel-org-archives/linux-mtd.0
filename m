Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2361BD41C3B
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Dec 2025 14:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ba2IJvCOHXiAIcEP0sUFGs47kXA8omXaJpskWiBvbrM=; b=DPBZwSLA1TgNrI
	OibjyxaA34W/S4zep1c/IsZdxR8djxUF2NQcRIVX2NNHAHbbnWK3JFuqlnO1QZfDjFWFEjx2ucRnR
	uOFQNa/b1fiVVHz3QZSK7sCesun5UtCp0n4TI9x2g8nJ6AzuriOWFzfH8jY3FA/64DozKDJrNl+rn
	EEp5NrkDmEfEkiTA9Po1hApbNqElAMdu7WuiPLrLGbuXs0Qx7wF06yqXRJqzf3u+yG1LZH/+Tyqjh
	1C/V49cKBEbnTeiNIBjSU70Q3mFd35IprbIasNERCGtG0csGk65tPDbzJemfsMa02gQqZAE7azRzM
	NoLvbEFbC6q3kUETFtmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThTU-0000000GiJ5-34Lp;
	Thu, 11 Dec 2025 14:16:56 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThTR-0000000GiI5-3JhC
	for linux-mtd@lists.infradead.org;
	Thu, 11 Dec 2025 14:16:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 464C4C1934C;
	Thu, 11 Dec 2025 14:16:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 372A96068C;
	Thu, 11 Dec 2025 14:16:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE08B103C8C1E;
	Thu, 11 Dec 2025 15:16:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765462608; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LN2XRvJPP64/tzjn2G4k9S/sITzG6yY/jxfa/OMZy/U=;
	b=F51875p7OT407UAmMFyy2xslQJqdFc+r9NgYdqDorB7cQTU04s3jIFN9UJfITEWvBsMnPh
	+GLocod0FOo8RsEhHvNqDTPmjzaoHObupoq9n2A51iDxzTNE25C3J5uoRL7L1S82E5AU6c
	ralrEIHHjvwTAcB8azruXAbWhvJPtqDKWdpTFLdv7NjwUyS7GkIHsUnlDRpjhxr5Vhq3sc
	ljcDVrkAe99eLf09xwSyH4WdbSrpVBaTZXTsiTGHarNFc0UkuK3bzmYhcvyNV8/SZaX70q
	5DWMkd+ODnfJd7ya8M/McQqyKSXeXspRGdklx56MELSDcFHIj0yiJknktOhEvQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: Michael Walle <mwalle@kernel.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <broonie@kernel.org>,  <tudor.ambarus@linaro.org>,  <p-mantena@ti.com>,
  <linux-spi@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <a-dutta@ti.com>,  <u-kumar1@ti.com>,
  <praneeth@ti.com>
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
In-Reply-To: <ea6f3dd7-0732-4de9-8bf1-e88a45ad6ac2@ti.com> (Santhosh Kumar
	K.'s message of "Wed, 10 Dec 2025 17:04:09 +0530")
References: <20250811193219.731851-1-s-k6@ti.com>
	<20250811193219.731851-2-s-k6@ti.com> <87seguemzu.fsf@bootlin.com>
	<cb04a4ec-c643-4b80-9288-8fd8944cb4f7@ti.com>
	<mafs0ikf74fja.fsf@kernel.org>
	<fe103265-7a68-41b8-b168-15a5e19abb3f@ti.com>
	<DEOH4AUI33SQ.DGKJ4W258658@kernel.org> <87jyz3ao8b.fsf@bootlin.com>
	<ea6f3dd7-0732-4de9-8bf1-e88a45ad6ac2@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 11 Dec 2025 15:16:43 +0100
Message-ID: <878qf96r3o.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_061653_990091_4118143B 
X-CRM114-Status: GOOD (  15.46  )
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

Cj4+Pj4gMi4gVXNpbmcgb2ZfZ2V0XyogQVBJczoKPj4+PiAgICAgICAgIFVzaW5nIHRoZSBzdGFu
ZGFyZCBPRiBoZWxwZXJzIHRvIGxvY2F0ZSB0aGUgcGh5cGF0dGVybiBwYXJ0aXRpb24KPj4+PiAg
ICAgICAgIGFuZCByZXRyaWV2ZSBpdHMgb2Zmc2V0IGlzIGJvdGggcmVsaWFibGUgYW5kIHN0cmFp
Z2hmb3J3YXJkLCBhbmQKPj4+PiAgICAgICAgIGlzIHRoZSBhcHByb2FjaCBjdXJyZW50bHkgaW1w
bGVtZW50ZWQgaW4gdjIuCj4+Pgo+Pj4gSSBkb24ndCBsaWtlIHRoYXQgaGFyZGNvZGVkIHBhcnRp
dGlvbiBuYW1lIHdoaWNoIGlzIGJhc2ljYWxseQo+Pj4gYmVjb21pbmcgYW4gQUJJIHRoZW4uCj4+
Pgo+Pj4gQXQgbGVhc3Qgd2UnZCBuZWVkIHNvbWUga2luZCBvZiBwaGFuZGxlIHRvIHRoZSBwYXJ0
aXRpb24gaW5zaWRlIHRoZQo+Pj4gY29udHJvbGxlciBub2RlIChhbmQgZ2V0IHRoZSBBQ0sgZnJv
bSB0aGUgRFQgbWFpbnRhaW5lcnMpLgo+PiBZZXMsIGFncmVlZCwgdGhpcyBpcyBjb250cm9sbGVy
IHNwZWNpZmljLCBpZiB3ZSBuZWVkIHRvIHVzZSBhbiBvZl8gQVBJCj4+ICh3aGljaCBpcyBzdGls
bCBub3QgbmVlZGVkIGZvciBTUEkgTkFORHMsIG9ubHkgZm9yIHR1bmluZyB0aGUgcmVhZCBTUEkK
Pj4gTk9SIHBhdGgpLCBpdCBzaG91bGQgbm90IGp1c3QgYmUgYSBwYXJ0aXRpb24gaGFyZGNvZGVk
IG5hbWUgYnV0IGEKPj4gcGhhbmRsZSBpbiB0aGUgY29udHJvbGxlciBub2RlLgo+Cj4gWWVzLCB1
c2luZyBhIHBoYW5kbGUgaXMgYSB2YWxpZCBpZGVhIHRvIGF2b2lkIHJlbHlpbmcgb24gYSBoYXJk
LWNvZGVkCj4gbmFtZS4gQnV0LCBpdCBkb2VzIG5vdCB3b3JrIHdlbGwgd2hlbiBtdWx0aXBsZSBj
aGlwIHNlbGVjdHMgYXJlCj4gaW52b2x2ZWQuIFRoZSBjb250cm9sbGVyIGlzIG5vdCB0aWVkIHRv
IGEgc2luZ2xlIGZsYXNoIGRldmljZSAtIGEgc2luZ2xlCj4gU1BJIGNvbnRyb2xsZXIgbWF5IGhv
c3QgYm90aCBOT1IgYW5kIE5BTkQgZmxhc2hlcywgZm9yIGV4YW1wbGUuIEluIHN1Y2gKPiBjYXNl
LCBvbmx5IHRoZSBOT1Igd291bGQgcmVxdWlyZSB0aGlzIHBoYW5kbGUsIHdoaWxlIHRoZSBOQU5E
IHdvdWxkCj4gbm90LAoKVGhpcyBob25lc3RseSBkb2Vzbid0IHNlZW0gYSBwcm9ibGVtIHRvIG1l
LgoKPiB3aGljaCBtYWtlcyB0aGUgcGhhbmRsZSBhcHByb2FjaCB1bnN1aXRhYmxlLiBBbm90aGVy
IGV4YW1wbGUgaXMgYQo+IGNvbnRyb2xsZXIgaG9zdGluZyB0d28gTk9SIGZsYXNoZXMgLSBib3Ro
IHdvdWxkIHRoZW4gbmVlZCB0aGVpciBvd24KPiBwaGFuZGxlIHJlZmVyZW5jZXMuCj4KPiBBbiBh
bHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBhc3NvY2lhdGUgdGhlIHBoYW5kbGUgd2l0aCB0aGUgZmxh
c2ggZGV2aWNlCj4gaXRzZWxmIHJhdGhlciB0aGFuIHdpdGggdGhlIGNvbnRyb2xsZXIuIExldCBt
ZSBrbm93IHlvdXIgdGhvdWdodHMgb24KPiB0aGlzIGFwcHJvYWNoLgoKSSBmaW5kIHByZXR0eSBz
dHJhbmdlIHRvIGhhdmUgdGhpcyBwcm9wZXJ0eSBpbiB0aGUgZmxhc2ggbm9kZSwgZXZlbgp0aG91
Z2ggSSB1bmRlcnN0YW5kIHRoZSByZWFzb24uIFBlcmhhcHMgYW4gYXJyYXkgb2YgcGhhbmRsZXMg
bWF5IHdvcmsgaW4KdGhlIGNvbnRyb2xsZXIgbm9kZSBpbnN0ZWFkPwoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
