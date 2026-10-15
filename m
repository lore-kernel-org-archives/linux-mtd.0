Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C95CC6B1C
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 03:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbA4OvzNWQwMCLYNXRnv9oO2jSKq+n+ltl1FGinT0/I=; b=UuZKCam2D1y8zS
	tJGA589xmuV85txwQO8CZ1BO/A7tUsv14uQX4F/8CYRYD5Z1rMxfa6pln1o+MBRHBMeucmqSdgQyB
	RIOQwxTLr5/OO5Mm6v8KJaVzrRMFbVqJy1qRDbsI3zRQ6bRvsHRT3n3BOk2URtftv2CvOlG0mFmWt
	nyjRutHG/dHl8l4NxCu16WfafCC/gvf6q9VFwHqz318LE0ImMe+jbr1VjX7Ky6VDjqGn4nmuVZS7i
	C0gNsDfzPMvwjGVIH90zhClESrLXFlfJXzaGiVX9lFRAEKNoyinQR3Im3NYxrVI1pVeXzSZjHwi4b
	rW4M38TR5rNaRQcMb+qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCGd-0000000GkOR-3Dr1;
	Thu, 15 Oct 2026 03:36:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCGc-0000000GkOG-2Wuy
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 03:36:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A5E676022A;
	Thu, 15 Oct 2026 03:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051BA1F000C5;
	Thu, 15 Oct 2026 03:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792035389;
	bh=OUZlpHoXNK4A5NL6sX65mlF87P5ERKIQboVkTXxf1cs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ULwWJaPN3rFyugT/oVq27Rg8aeLEE4Rf/W2xFXJc+m7v4RmYPWLHJoHt7q7b62i/4
	 HZ1RICEo4Y0EfoKErtQqw2mY2jLlw5HQzOaHGMiPl2W/tmdrnOh0ZiZoREc4aAYzqy
	 R5DawJ5XItMUlha4f82ihN7c9k0+B/0G4loTdNHyqreL0jtNEX5/u8ysd8osMGTJtj
	 KzKIp8BWP33p4H7ODuPe81Rd2urdGOw2di9GuCMicUvDVxxneIEEbqEWArPWMnSoCJ
	 aNeXGUvsqHms6f28m79ES2/oPGM+zeVVrrxeyi0Xtpq+HMohZ+OQD8aEH0BOJ8BjZL
	 FJMyR+iQWIcPQ==
Message-ID: <sashiko-outbox-172202@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] mtd: rawnand: nandsim: use a NOFS scope for cache
 file I/O
To: "Tal Zussman" <tz2294@columbia.edu>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: =?utf-8?b?TWF0dGhldyBXaWxjb3ggKE9yYWNsZSk=?= <willy@infradead.org>, linux-mtd@lists.infradead.org
In-Reply-To: <20261014-nandsim-nofs-v1-1-47e49f37e387@columbia.edu>
References: <20261014-nandsim-nofs-v1-0-47e49f37e387@columbia.edu>
 <20261014-nandsim-nofs-v1-1-47e49f37e387@columbia.edu>
Date: Thu, 15 Oct 2026 03:36:28 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogbmFuZHNpbTog
SU8gcmVjbGFpbSBzZWxmLWRlYWRsb2NrIGR1ZSB0byBtZW1hbGxvY19ub2ZzX3NhdmUoKQotLQoK
Y29tbWl0IDZjNDUzMDE2M2FhMDU5YjVmOThlMTdiYTgyYTljMmIwNmMzZjQ4YmIKQXV0aG9yOiBU
YWwgWnVzc21hbiA8dHoyMjk0QGNvbHVtYmlhLmVkdT4KCm10ZDogcmF3bmFuZDogbmFuZHNpbTog
dXNlIGEgTk9GUyBzY29wZSBmb3IgY2FjaGUgZmlsZSBJL08KClRoaXMgY29tbWl0IHJlcGxhY2Vz
IG1lbWFsbG9jX25vcmVjbGFpbV9zYXZlKCkgd2l0aCBtZW1hbGxvY19ub2ZzX3NhdmUoKSB0bwpw
cmV2ZW50IGFsbG9jYXRpb25zIGR1cmluZyBuYW5kc2ltIGNhY2hlIGZpbGUgb3BlcmF0aW9ucyBm
cm9tIHJlY3Vyc2luZyBpbnRvCmZpbGVzeXN0ZW0gcmVjbGFpbS4KCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRzaW0uYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRz
aW0uYwo+IGluZGV4IGZlOTY4MDM3Zjc1YTIuLjQ1NTlkZjJjZmEzY2MgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbmFuZHNpbS5jClsgLi4uIF0KPiBAQCAtMTM0MiwxNCArMTM0MiwxNCBAQCBzdGF0aWMgc3Np
emVfdCBuc19yZWFkX2ZpbGUoc3RydWN0IG5hbmRzaW0gKm5zLCBzdHJ1Y3QgZmlsZSAqZmlsZSwg
dm9pZCAqYnVmLAo+ICB7Cj4gIAlzc2l6ZV90IHR4Owo+ICAJaW50IGVycjsKPiAtCXVuc2lnbmVk
IGludCBub3JlY2xhaW1fZmxhZzsKPiArCXVuc2lnbmVkIGludCBub2ZzX2ZsYWc7Cj4gIAo+ICAJ
ZXJyID0gbnNfZ2V0X3BhZ2VzKG5zLCBmaWxlLCBjb3VudCwgcG9zKTsKPiAgCWlmIChlcnIpCj4g
IAkJcmV0dXJuIGVycjsKPiAtCW5vcmVjbGFpbV9mbGFnID0gbWVtYWxsb2Nfbm9yZWNsYWltX3Nh
dmUoKTsKPiArCW5vZnNfZmxhZyA9IG1lbWFsbG9jX25vZnNfc2F2ZSgpOwo+ICAJdHggPSBrZXJu
ZWxfcmVhZChmaWxlLCBidWYsIGNvdW50LCAmcG9zKTsKPiAtCW1lbWFsbG9jX25vcmVjbGFpbV9y
ZXN0b3JlKG5vcmVjbGFpbV9mbGFnKTsKCltTZXZlcml0eTogSGlnaF0KQ2FuIHRoaXMgY2F1c2Ug
YW4gSU8gcmVjbGFpbSBzZWxmLWRlYWRsb2NrPwoKTmFuZHNpbSBleGVjdXRlcyBNVEQgb3BlcmF0
aW9ucyB3aGlsZSBob2xkaW5nIHRoZSBOQU5EIHN1YnN5c3RlbSBkZXZpY2UKbG9jayAoY2hpcC0+
bG9jaykuIFdoaWxlIG1lbWFsbG9jX25vZnNfc2F2ZSgpIHN0cmlwcyB0aGUgZmlsZXN5c3RlbSBy
ZWNsYWltCmZsYWdzLCBpdCBsZWF2ZXMgZGlyZWN0IElPIHJlY2xhaW0gZW5hYmxlZC4KCklmIG1l
bW9yeSBhbGxvY2F0aW9ucyB3aXRoaW4ga2VybmVsX3JlYWQoKSB0cmlnZ2VyIGRpcmVjdCByZWNs
YWltLCB0aGUKc2hyaW5rZXIgbWlnaHQgYXR0ZW1wdCB0byB3cml0ZSBvdXQgZGlydHkgcGFnZXMg
YmVsb25naW5nIHRvIHRoaXMgc2FtZQpkZXZpY2UgKGZvciBleGFtcGxlLCBpZiB1c2VkIGFzIGEg
c3dhcCBkZXZpY2Ugb3IgdmlhIG10ZGJsb2NrKS4KCldyaXRpbmcgb3V0IHRoZXNlIHBhZ2VzIHdv
dWxkIHJvdXRlIHRocm91Z2ggdGhlIGJsb2NrIGxheWVyIGJhY2sgdG8gdGhlIE1URApsYXllciwg
d2hpY2ggd2lsbCBhdHRlbXB0IHRvIGFjcXVpcmUgY2hpcC0+bG9jayBhZ2FpbiwgcmVzdWx0aW5n
IGluIGEKc2VsZi1kZWFkbG9jay4KClNob3VsZCB0aGlzIHVzZSBtZW1hbGxvY19ub2lvX3NhdmUo
KSBpbnN0ZWFkIHRvIHNhZmVseSBwcmV2ZW50IHJlY2xhaW0KZnJvbSBpc3N1aW5nIGFueSBibG9j
ayBJTyB3aGlsZSB0aGUgTVREIGxvY2sgaXMgaGVsZD8KCj4gIAluc19wdXRfcGFnZXMobnMpOwo+
ICAJcmV0dXJuIHR4Owo+ICB9Cj4gQEAgLTEzNTksMTQgKzEzNTksMTQgQEAgc3RhdGljIHNzaXpl
X3QgbnNfd3JpdGVfZmlsZShzdHJ1Y3QgbmFuZHNpbSAqbnMsIHN0cnVjdCBmaWxlICpmaWxlLCB2
b2lkICpidWYsCj4gIHsKPiAgCXNzaXplX3QgdHg7Cj4gIAlpbnQgZXJyOwo+IC0JdW5zaWduZWQg
aW50IG5vcmVjbGFpbV9mbGFnOwo+ICsJdW5zaWduZWQgaW50IG5vZnNfZmxhZzsKPiAgCj4gIAll
cnIgPSBuc19nZXRfcGFnZXMobnMsIGZpbGUsIGNvdW50LCBwb3MpOwo+ICAJaWYgKGVycikKPiAg
CQlyZXR1cm4gZXJyOwo+IC0Jbm9yZWNsYWltX2ZsYWcgPSBtZW1hbGxvY19ub3JlY2xhaW1fc2F2
ZSgpOwo+ICsJbm9mc19mbGFnID0gbWVtYWxsb2Nfbm9mc19zYXZlKCk7Cj4gIAl0eCA9IGtlcm5l
bF93cml0ZShmaWxlLCBidWYsIGNvdW50LCAmcG9zKTsKPiAtCW1lbWFsbG9jX25vcmVjbGFpbV9y
ZXN0b3JlKG5vcmVjbGFpbV9mbGFnKTsKCltTZXZlcml0eTogSGlnaF0KRG9lcyBrZXJuZWxfd3Jp
dGUoKSBmYWNlIHRoZSBzYW1lIElPIHJlY2xhaW0gc2VsZi1kZWFkbG9jayByaXNrIGhlcmU/CgpB
bGxvY2F0aW9ucyB3aXRoaW4ga2VybmVsX3dyaXRlKCkgY291bGQgYWxzbyB0cmlnZ2VyIGRpcmVj
dCBJTyByZWNsYWltCndoaWxlIHRoZSBjaGlwIGxvY2sgaXMgaGVsZC4gVXNpbmcgbWVtYWxsb2Nf
bm9pb19zYXZlKCkgd291bGQgcHJvdGVjdCB0aGlzCnBhdGggYXMgd2VsbC4KCj4gIAluc19wdXRf
cGFnZXMobnMpOwo+ICAJcmV0dXJuIHR4Owo+ICB9CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDE0LW5hbmRzaW0tbm9mcy12MS0w
LTQ3ZTQ5ZjM3ZTM4N0Bjb2x1bWJpYS5lZHU/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
