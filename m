Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088BFCCD1A5
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Oct 2025 11:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUk8kwOu4QCeq0Kx1QfJfl/5kXVv6bTyW6yzUvGHy40=; b=dWuugNJ+y96hAw
	0GLXqDpcP6n2RORR9GiYwJ2b/wiSs49gFpB/cn2KwJ1FaL2UmPcd5m2+a6qGFMYeZ3HTe/wGCvCc0
	mAwkcxvlxDhX8KBpx9vvSeFvEUwioc36WPBiEP7s/3CnUrzBppFAwiMnlFA9sOD7X9H/p0Iwteuuv
	W3ORmZOZtIQ6D0Fd42eVEi4ozQvUymD6xbeYzVY6Q+eMmueGtZ5Dnw4CYEmq7E+qhpqOpZGsavkp8
	dDomIDQbzngLOY8HomRQUr7EzlnHZsmhJg4W+kYKhiWSAZmNh8ST9OIVwD0VqmNTFkSTEQy02dLDY
	PByX6VfOyFGhmU5qasiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFiS-000000098xy-3WvF;
	Fri, 24 Oct 2025 11:12:16 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFiP-000000098w3-0EMp
	for linux-mtd@lists.infradead.org;
	Fri, 24 Oct 2025 11:12:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EE4424E412DA;
	Fri, 24 Oct 2025 11:12:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7ADE60703;
	Fri, 24 Oct 2025 11:12:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A3CC102F247D;
	Fri, 24 Oct 2025 13:11:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761304314; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vse7BFpQSZKGEFHYELT9rSihMyyNPAxVb6yV+MS8nJA=;
	b=C+M7i9nHsiZCr0kOsA3TLOzcvEti3GGZzsuqJDbCMh3qjQJFig4VIW2PWE1PQQv1VRwBl5
	O/PRfqRmIxRTTfL15P2H7B+2p7lWQj3H6fzyKHBnGtUvMHQPa4N5GbUShBE+etxqA/EWeF
	WfsXwjI88mDwQcdjKF+jDBeESmz2rM7fdrYXsuCsgObzRQ6Yk7I9J7JdMYHNpdAT2kSJD+
	A9eXbXnyrOmWAgjbWT4BjT14dU+36J1a9RC1M3j4wdhiVrVlkD7D23FBOpo9jz6W/FM03o
	E121D1bOEKskDclLAEhh33Y8eDxz2NzukqU5zIyDb9ZexUtGbOpBg6ZQQIh8kQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: cadence: Add support for NV-DDR interface
 mode
In-Reply-To: <4a6577ff-7417-4d34-a683-2402736fd9d7@altera.com> (Niravkumar
	L. Rabara's message of "Fri, 24 Oct 2025 17:47:11 +0800")
References: <20251024071306.242227-1-niravkumarlaxmidas.rabara@altera.com>
	<87bjlwrbqd.fsf@bootlin.com>
	<4a6577ff-7417-4d34-a683-2402736fd9d7@altera.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 24 Oct 2025 13:11:37 +0200
Message-ID: <875xc4r1ue.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_041213_222479_52481D37 
X-CRM114-Status: GOOD (  12.17  )
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

Cj4+PiArCWlmIChkbGxfcGh5X2dhdGVfb3Blbl9kZWxheSA+IE5WRERSX0dBVEVfQ0ZHX01JTikK
Pj4+ICsJCWllX3N0YXJ0ID0gTlZERFJfR0FURV9DRkdfTUlOOwo+PiBDYW4geW91IGRvdWJsZSBj
aGVjayBoZXJlPyBJIHdvdWxkIGV4cGVjdCA8IGluc3RlYWQgb2YgPiBnaXZlbiB0aGF0Cj4+IHlv
dQo+PiBjb21wYXJlIHdpdGggc29tZXRoaW5nIHlvdSBuYW1lZCAibWluaW11bSIuIE1heWJlIGl0
IGlzIGxlZ2l0aW1hdGUsIGp1c3QKPj4gd2FybmluZy4KPgo+IEkgaGF2ZSBkb3VibGUgY2hlY2tl
ZCwgdGhlIGxvZ2ljIGlzIGNvcnJlY3QuIE1heSBiZSBJIHNob3VsZG4ndCB1c2UgX01JTgo+IHRv
IGF2b2lkIGNvbmZ1c2lvbi4KPiBJbiB2MiBJIHdpbGwgY2hhbmdlIE5WRERSX0dBVEVfQ0ZHX01J
TiB0byBOVkREUl9HQVRFX0NGR19TVEQuCgpPay4KCj4+PiArCWlmIChuYW5kX2ludGVyZmFjZV9p
c19zZHIoY29uZikpIHsKPj4+ICsJCWNvbnN0IHN0cnVjdCBuYW5kX3Nkcl90aW1pbmdzICpzZHIg
PSBuYW5kX2dldF9zZHJfdGltaW5ncyhjb25mKTsKPj4+ICsKPj4+ICsJCWlmIChJU19FUlIoc2Ry
KSkKPj4+ICsJCQlyZXR1cm4gUFRSX0VSUihzZHIpOwo+Pj4gKwo+Pj4gKwkJcmV0ID0gY2FkZW5j
ZV9uYW5kX3NldHVwX3Nkcl9pbnRlcmZhY2UoY2hpcCwgc2RyKTsKPj4+ICsJfSBlbHNlIGlmIChj
aGlwbnIgPj0gMCkgewo+PiBUaGlzIGlzbid0IHZlcnkgY2xlYXIuIFBsZWFzZSBtYWtlIGl0IGEg
c2VwYXJhdGUgY29uZGl0aW9uIGlmIHlvdQo+PiB0aGluawo+PiB5b3UgbXVzdCBoYW5kbGUgdGhp
cyBjYXNlLiBPdGhlcndpc2UgeW91J3JlIG1peGluZyBpdCB3aXRoIHRoZSBTRFIKPj4gdnMuIE5W
RERSIGNob2ljZSwgYW5kIHRoYXQncyBtaXNsZWFkaW5nLgo+IE5vdGVkLgo+IEkgd2lsbCBtYWtl
IGEgc2VwYXJhdGUgY29uZGl0aW9uIGNoZWNrIGFzIGJlbG93IGluIHYyLgo+Cj4gLSAgICAgICB9
IGVsc2UgaWYgKGNoaXBuciA+PSAwKSB7Cj4gLSAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBu
YW5kX252ZGRyX3RpbWluZ3MgKm52ZGRyID0KPiAgICAgICAgICAgICAgICAgbmFuZF9nZXRfbnZk
ZHJfdGltaW5ncyhjb25mKTsKPiArICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgIGlm
IChjaGlwbnIgPCAwKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7CgpXaHkg
ZG8geW91IGNoZWNrIGNoaXBuciBvbmx5IGZvciB0aGUgTlZERFIgaW50ZXJmYWNlPyBJIGRvbid0
IHRoaW5rIGl0Cm1ha2VzIHNlbnNlLiBjaGlwbnIgc2hvdWxkIHByb2JhYmx5IGJlIGNoZWNrZWQg
YmVmb3JlIHRoZSB3aG9sZSBpZigpCmJsb2NrLgoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
