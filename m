Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E170AC3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 20:06:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ABD420707
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 20:06:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kT1WWjWr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ABD420707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pa8pb21Rn8XsHsd3iJtQiu8SrYN3q+Bgx5fy3ubo8Wg=; b=kT1WWjWrD6nbJP
	V7nq7gDchOvd8oEkVNBcUVTic4gLzLMkftJ0HOxjKMVcgLDBu3hfjQqBGjEq/27PirC3/v36BAfIw
	HSk1ljkCbIJJo3AYF04EnUpSfXqKsL3Ot6pqsC//91vOJPj27q73QTLdgLRcoLNg8f9daryCC5xBF
	KEg2bJInp1tKizGMSmodhcL4bvrH4diPaIctsnqhLHw37c/RGR+L5cgSp7xVX3ny8nmd4+E61QoQj
	K3xkLP5xEKgbEBq6fMZvCDDMzyaqH1FQ1UdvehnFcLqFGry6UBwTNvttgDkFQZsvSCE4+tbgcdTVD
	Re30G4V5iuH/HkufKa2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVhMM-0007xn-TD; Mon, 04 May 2020 20:06:38 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVhMI-0007qy-NF
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 20:06:36 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B16162A18BC;
 Mon,  4 May 2020 21:06:32 +0100 (BST)
Date: Mon, 4 May 2020 22:06:30 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 0/5] mtd: rawnand: davinci: Convert to exec_op()
Message-ID: <20200504220630.716d328f@collabora.com>
In-Reply-To: <CAMpxmJXmPcwo6uomrrwbcFe9gkhxvYVw0Y6o1n5uSGBwPKd5_A@mail.gmail.com>
References: <20200501100729.1237040-1-boris.brezillon@collabora.com>
 <CAMpxmJXmPcwo6uomrrwbcFe9gkhxvYVw0Y6o1n5uSGBwPKd5_A@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_130634_890499_7ACBB7EA 
X-CRM114-Status: GOOD (  18.80  )
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
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCA0IE1heSAyMDIwIDE4OjM0OjU1ICswMjAwCkJhcnRvc3ogR29sYXN6ZXdza2kgPGJn
b2xhc3pld3NraUBiYXlsaWJyZS5jb20+IHdyb3RlOgoKPiBwdC4sIDEgbWFqIDIwMjAgbyAxMjow
NyBCb3JpcyBCcmV6aWxsb24KPiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IG5hcGlz
YcWCKGEpOgo+ID4KPiA+IEhlbGxvLAo+ID4KPiA+IEEgYml0IG9mIGNvbnRleHQgdG8gZXhwbGFp
biB0aGUgbW90aXZhdGlvbiBiZWhpbmQgdGhvc2UgY29udmVyc2lvbnMKPiA+IEkndmUgYmVlbiBz
ZW5kaW5nIGZvciB0aGUgbGFzdCBjb3VwbGUgb2Ygd2Vla3MuIFRoZSByYXcgTkFORCBzdWJzeXN0
ZW0KPiA+IGNhcnJpZXMgYSBsb3Qgb2YgaGlzdG9yeSB3aGljaCBtYWtlcyBhbnkgcmV3b3JrIG5v
dCBvbmx5IHBhaW5mdWwsIGJ1dAo+ID4gYWxzbyBzdWJqZWN0IHRvIHJlZ3Jlc3Npb25zIHdoaWNo
IHdlIG9ubHkgZGV0ZWN0IHdoZW4gc29tZW9uZSBkYXJlcyB0bwo+ID4gdXBkYXRlIGl0cyBrZXJu
ZWwgb24gb25lIG9mIHRob3NlIGFuY2llbnQgSFcuIFdoaWxlIGNhcnJ5aW5nIGRyaXZlcnMKPiA+
IGZvciBvbGQgSFcgaXMgbm90IGEgcHJvYmxlbSBwZXIgc2UsIGNhcnJ5aW5nIGFuY2llbnQgYW5k
IHVubWFpbnRhaW5lZAo+ID4gZHJpdmVycyB0aGF0IGFyZSBub3QgY29udmVydGVkIHRvIG5ldyBB
UElzIGlzIGEgbWFpbnRlbmFuY2UgYnVyZGVuLAo+ID4gaGVuY2UgdGhpcyBtYXNzaXZlIGNvbnZl
cnNpb24gYXR0ZW1wdCBJJ20gY29uZHVjdGluZyBoZXJlLgo+ID4KPiA+IFNvIGhlcmUgaXMgYSBz
ZXJpZXMgY29udmVydGluZyB0aGUgRGF2aW5jaSBOQU5EIGNvbnRyb2xsZXIgZHJpdmVyIHRvCj4g
PiBleGVjX29wKCksIHBsdXMgYSBidW5jaCBvZiBtaW5vciBpbXByb3ZlbWVudHMgZG9uZSBhbG9u
ZyB0aGUgd2F5Lgo+ID4KPiA+IFJlZ2FyZHMsCj4gPgo+ID4gQm9yaXMKPiA+Cj4gPiBCb3JpcyBC
cmV6aWxsb24gKDUpOgo+ID4gICBtdGQ6IHJhd25hbmQ6IGRhdmluY2k6IEluaGVyaXQgZnJvbSBu
YW5kX2NvbnRyb2xsZXIKPiA+ICAgbXRkOiByYXduYW5kOiBkYXZpbmNpOiBTdG9wIHVzaW5nIG5h
bmRfY2hpcC5sZWdhY3kuSU9fQUREUl97UixXfQo+ID4gICBtdGQ6IHJhd25hbmQ6IGRhdmluY2k6
IEltcGxlbWVudCBleGVjX29wKCkKPiA+ICAgbXRkOiByYXduYW5kOiBkYXZpbmNpOiBHZXQgcmlk
IG9mIHRoZSBsZWdhY3kgaW50ZXJmYWNlIGltcGxlbWVudGF0aW9uCj4gPiAgIG10ZDogcmF3bmFu
ZDogZGF2aW5jaTogQ2hhbmdlIHRoZSB7cmVhZCx3cml0ZX1fYnVmIHByb3RvdHlwZXMKPiA+Cj4g
PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvZGF2aW5jaV9uYW5kLmMgfCAxNjEgKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4NSBpbnNlcnRpb25zKCspLCA3
NiBkZWxldGlvbnMoLSkKPiA+Cj4gPiAtLQo+ID4gMi4yNS4zCj4gPiAgCj4gCj4gSGkgQm9yaXMs
Cj4gCj4gVGhhbmtzIGZvciBkb2luZyB0aGlzLiBVbmZvcnR1bmF0ZWx5IHRoaXMgYnJlYWtzIE5B
TkQgb24gZGE4NTAtbGNkawo+IHdpdGggdGhlIGZvbGxvd2luZyBlcnJvciBtZXNzYWdlOgo+IAo+
ICAgICBuYW5kOiBObyBOQU5EIGRldmljZSBmb3VuZAo+IAo+IEknbSBzdXBlciBidXN5IHRoaXMg
d2VlayBhbmQgc28gSSBkb24ndCBoYXZlIHRoZSB0aW1lIHRvIGludmVzdGlnYXRlCj4gZnVydGhl
ciwgSSBjYW4gZ2V0IGJhY2sgdG8gaXQgbmV4dCB3ZWVrIGhvcGVmdWxseS4KCk5vIHdvcnJpZXMu
IEFuZCBsZXQgbWUga25vdyBpZiB5b3UgbmVlZCBhbnkgaGVscCB0byBkZWJ1ZyB0aGF0LgoKVGhh
bmtzIQoKQm9yaXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
