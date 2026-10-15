Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5654FCA9EDE
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 03:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwVT4+bh5M/gTpHc/C/Nwm5REMZRfamxPQMkzSzbpWM=; b=dCBVh7CKpaRULQ
	1Ngy7YZ26PCLwshbmoTSsGFUVmBBy3cpY6M4eScSC4osxngEYmmigwNB38AbyEJiHz9I+50oCddD3
	+LS86ALMETDHNwLU1mIMohJIqaEK9QlZp0NK2Wgb+4Qaa53VAQHcqW62Xvz6OBSNx0vrgaH8i1EVi
	LKQPpAJ0pACV6ISiVo+F4pmVkEqkGXjnAIixo96ZqWZOh8eZIFJzeLpVdq67CzTN8YIejh/ROJy1i
	nei3kH5zpRZdRCWCdaR47u5e+vHEAQkRQrvvqxKWBHVQlOOb4HWhrw96i5XH/YGKfSC76ATomWgFQ
	g64WH62tcepYW68nhBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCPn-0000000GlIR-45rQ;
	Thu, 15 Oct 2026 03:45:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCPm-0000000GlI4-2Ms6
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 03:45:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CBC16020C;
	Thu, 15 Oct 2026 03:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E964A1F000C4;
	Thu, 15 Oct 2026 03:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792035957;
	bh=7uEdOHDb8Ud/3cWQqwkaqMWUh0VRMjUBlXBIQnGfJmg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OS98lF0qSM4WICX/7qbpH3Cup3kVDqKSEfg98zMKzQN3q111p8EdtWyilaoy9WBco
	 hLLM0pzTa1NcnC1sf36YceWJgaHlxHau72e8rqpV+pWXQB/JDXoEZHFy1I5RXKj6YM
	 pbKINDti3FgvFukKV2iAryfLBqbfuE5oPE7zx+AIi62PTSGWiEYAuC0BzxYI4WAfan
	 6x+X8NoDs/8KOepwiUx7NsB/FevUZzlSflzGlFJwO3Orh5CcWaBpHxIn+q7Z/ZilIw
	 NhA2PWtLzij9XonOB7IKYMDh7w+UP257pyjmUrexx4cnN4l637nSzdqrjWefrhcEud
	 BtVkkvSPCd1RQ==
Message-ID: <sashiko-outbox-172225@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] mtd: block2mtd: convert _block2mtd_erase() to
 folios
To: "Tal Zussman" <tz2294@columbia.edu>, "Joern Engel" <joern@lazybastard.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
Cc: =?utf-8?b?TWF0dGhldyBXaWxjb3ggKE9yYWNsZSk=?= <willy@infradead.org>, linux-mtd@lists.infradead.org
In-Reply-To: <20261014-block2mtd-folio-v1-3-19d24ae676ee@columbia.edu>
References: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
 <20261014-block2mtd-folio-v1-3-19d24ae676ee@columbia.edu>
Date: Thu, 15 Oct 2026 03:45:56 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbW06IG1pc3Npbmcg
Zm9saW8tPm1hcHBpbmcgcmUtdmFsaWRhdGlvbiBhZnRlciBmb2xpb19sb2NrKCkKLS0KCmNvbW1p
dCA1ZDNiYTM3OWMzNDVkZTc4YjFlYjg5MmU2Njg1YjJlOGY3NTk4N2Y1CkF1dGhvcjogVGFsIFp1
c3NtYW4gPHR6MjI5NEBjb2x1bWJpYS5lZHU+CgptdGQ6IGJsb2NrMm10ZDogY29udmVydCBfYmxv
Y2sybXRkX2VyYXNlKCkgdG8gZm9saW9zCgpFcmFzZSB0aHJvdWdoIGEgZm9saW8gaW5zdGVhZCBv
ZiBhIHBhZ2UsIGFuZCB1c2UgbWVtY2hyX2ludigpIHRvIGNoZWNrCndoZXRoZXIgYSByYW5nZSBz
dGlsbCBuZWVkcyBlcmFzaW5nIGluc3RlYWQgb2YgdGhlIG9wZW4tY29kZWQgc2Nhbi4KVGhpcyBy
ZW1vdmVzIGZvdXIgaGlkZGVuIGNvbXBvdW5kX2hlYWQoKSBjYWxscyBwZXIgcGFnZSwgYW5kIHRo
ZSBsYXN0CnVzZXIgb2YgcGFnZV9yZWFkKCksIHNvIHJlbW92ZSB0aGF0IHRvby4KCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL2RldmljZXMvYmxvY2sybXRkLmMgYi9kcml2ZXJzL210ZC9kZXZp
Y2VzL2Jsb2NrMm10ZC5jCj4gaW5kZXggOTEwNjY5ZDZiYjk0My4uYTFkMjRmZWY0MTVkZCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jCj4gKysrIGIvZHJpdmVy
cy9tdGQvZGV2aWNlcy9ibG9jazJtdGQuYwpbIC4uLiBdCj4gIC8qIGVyYXNlIGEgc3BlY2lmaWVk
IHBhcnQgb2YgdGhlIGRldmljZSAqLwo+ICBzdGF0aWMgaW50IF9ibG9jazJtdGRfZXJhc2Uoc3Ry
dWN0IGJsb2NrMm10ZF9kZXYgKmRldiwgbG9mZl90IHRvLCBzaXplX3QgbGVuKQo+ICB7Cj4gIAlz
dHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZyA9IGRldi0+YmRldl9maWxlLT5mX21hcHBpbmc7
ClsgLi4uIF0KPiArCXdoaWxlIChsZW4pIHsKPiArCQlmb2xpbyA9IHJlYWRfbWFwcGluZ19mb2xp
byhtYXBwaW5nLCB0byA+PiBQQUdFX1NISUZULCBOVUxMKTsKPiArCQlpZiAoSVNfRVJSKGZvbGlv
KSkKPiArCQkJcmV0dXJuIFBUUl9FUlIoZm9saW8pOwo+ICsKPiArCQlvZmZzZXQgPSBvZmZzZXRf
aW5fZm9saW8oZm9saW8sIHRvKTsKPiArCQljaHVuayA9IG1pbihsZW4sIGZvbGlvX3NpemUoZm9s
aW8pIC0gb2Zmc2V0KTsKPiArCQlwID0gZm9saW9fYWRkcmVzcyhmb2xpbykgKyBvZmZzZXQ7Cj4g
KwkJaWYgKG1lbWNocl9pbnYocCwgMHhmZiwgY2h1bmspKSB7Cj4gKwkJCWZvbGlvX2xvY2soZm9s
aW8pOwo+ICsJCQltZW1zZXQocCwgMHhmZiwgY2h1bmspOwo+ICsJCQlmb2xpb19tYXJrX2RpcnR5
KGZvbGlvKTsKPiArCQkJZm9saW9fdW5sb2NrKGZvbGlvKTsKCltTZXZlcml0eTogTWVkaXVtXQpD
b3VsZCBfYmxvY2sybXRkX2VyYXNlKCkgbW9kaWZ5IGEgdHJ1bmNhdGVkIGZvbGlvIGhlcmU/CgpJ
ZiB0aGUgZm9saW8gaXMgdHJ1bmNhdGVkIGZyb20gdGhlIHBhZ2UgY2FjaGUgd2hpbGUgd2FpdGlu
ZyBmb3IgZm9saW9fbG9jaygpLAp3ZSBjb3VsZCBwcm9jZWVkIHdpdGggbW9kaWZ5aW5nIHRoZSBt
ZW1vcnkgd2l0aG91dCBpdCBldmVyIGJlaW5nIHdyaXR0ZW4gYmFjawp0byB0aGUgZGV2aWNlLiBT
aG91bGQgdGhpcyByZS12YWxpZGF0ZSB0aGF0IGZvbGlvLT5tYXBwaW5nID09IG1hcHBpbmcgYWZ0
ZXIKYWNxdWlyaW5nIHRoZSBsb2NrPwoKPiArCQkJYmFsYW5jZV9kaXJ0eV9wYWdlc19yYXRlbGlt
aXRlZChtYXBwaW5nKTsKPiArCQl9Cj4gKwkJZm9saW9fcHV0KGZvbGlvKTsKWyAuLi4gXQoKLS0g
ClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2
MTAxNC1ibG9jazJtdGQtZm9saW8tdjEtMC0xOWQyNGFlNjc2ZWVAY29sdW1iaWEuZWR1P3BhcnQ9
MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
