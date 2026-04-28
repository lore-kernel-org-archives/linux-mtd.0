Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601BCFF885A
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2026 07:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asLJQi209LlKhxB7LAECKH0de4g5VXkPk0PLCRByzM4=; b=b1YKUQQfxWj5gW
	7rjwQo5OGbgvDikn35I/ik/J+nhEQaTYhHZS/+qVEW3i4Tl97ocVuBdoaopP/PIguvQjoMB89hlUh
	yYmj7402dGa+Okqgs4HtMY4Xr9Y6S3L4hxX6fhpKfSt/Y35taflchGUbGbDwuyLTsKl7iHI4xm40m
	Ae1ve3HBaXJP06jyFqgTEiKE8DuHFKEIjTvhOgOeW0w6lgVXhFBdUXHAaro1wZUhnvRweIZaDcGHl
	3AAfHbFvgvc0WI27Z3m7VRRLUnwO/6QXNl967JNDHfoMkl94LDtQl+7bsLsVJi/NGI2qTluUSNrAk
	gFr46cvhXcwkFT1extwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdJH-00000000pSc-29RY;
	Tue, 28 Apr 2026 07:56:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdJD-00000000pQX-1dFZ
	for linux-mtd@lists.infradead.org;
	Tue, 28 Apr 2026 07:56:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 69C4D1A346A;
	Tue, 28 Apr 2026 07:56:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 33528601D0;
	Tue, 28 Apr 2026 07:56:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D090A10728487;
	Tue, 28 Apr 2026 09:56:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777362999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zmPPipIm+6cvKey1X/BfUOrTJ48Xi+8NNi1kXYdMK9g=;
	b=1kA44cfyy2gAqoFZaCFLU5/x4mwJmrpX9NnolxKVP6VTuS7lhG8uvn4xmMMpXjIV/WNn/L
	Rj2kVMG5LJl/l3WtmVMnjJCPe4UtzG1M5RnVYuCPczMNL/OPdxB91HcyWcqaFATKIfT1cs
	5LAqTuj2K9NNv7oOpvgHyHBBKyQWKsNSQ8fVQohGOsiIM90eQKTHeRvOjjy8yWCG73nvjx
	5Gj4hF1bvPI4oqfjCOmG0KMQ+pL57wxklAmmRy7VHBgOd3wDAKC8uvQUaEX0DyfJPvYogk
	zZhvzoq5w4x8ifzGJJKTnNmlTkWY9ljyELJewso789/KhyKKC8aOCdreYrc/UQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: <Takahiro.Kuwano@infineon.com>,  <mwalle@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <corbet@lwn.net>,  <sean.anderson@linux.dev>,
  <thomas.petazzoni@bootlin.com>,  <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 17/27] mtd: spi-nor: debugfs: Add locking support
In-Reply-To: <2vxz7bps5qoi.fsf@kernel.org> (Pratyush Yadav's message of "Mon,
	27 Apr 2026 18:11:25 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-17-833dab5e7288@bootlin.com>
	<c8521e12e49040ce8683f81692644574@infineon.com>
	<87h5owh69c.fsf@bootlin.com> <2vxz7bps5qoi.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 28 Apr 2026 09:56:36 +0200
Message-ID: <87v7dbecwb.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_005643_870005_D54A669E 
X-CRM114-Status: GOOD (  12.15  )
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

SGVsbG8gUHJhdHl1c2gsCgo+PiBJIGRvbid0IHdhbnQgdG8gYmUgdG9vIHB1c2h5IGJ1dCB0aGlz
IHNlcmllcyBoYXMgYmVlbiBwZW5kaW5nIGZvciBhCj4+IHdoaWxlLCB0aGVyZSBhcmUgcmVhbCBm
aXhlcyBpbnNpZGUsIGl0IChJTU8pIGdyZWF0bHkgaW1wcm92ZSB0aGUKPj4gZG9jdW1lbnRhdGlv
biwgYWRkcyBhIHRlc3RpbmcgcHJvY2VkdXJlLCBnaXZlcyBhIGZyaWVuZGx5IGludGVyZmFjZSB0
bwo+PiB1bmRlcnN0YW5kIHdoYXQgaXMgbG9ja2VkLCBldGMuIEkgYW0gd29ya2luZyBvbiBjbGFy
aWZ5aW5nIGFuZCBpbXByb3ZpbmcKPj4gdGhlIFdpbmJvbmQgdmVuZG9yIGRyaXZlciBldmVuIG1v
cmUgbm93IGFuZCBJIG5lZWQgdGhlc2UgY2hhbmdlcyB0byBnZXQKPj4gaW4gZm9yIHRoZSBjbGVh
bnVwIHRvIGNvbnRpbnVlLiBDYW4gc29tZW9uZSBidW1wIHNwaS1ub3IvbmV4dCBvbiB0b3Agb2YK
Pj4gdjcuMS1yYzEgYW5kIGFwcGx5IHRoaXM/IFVubGVzcyB0aGVyZSBhcmUgbW9yZSBjaGFuZ2Vz
LCBvZiBjb3Vyc2UuCj4KPiBZZWFoLCBteSBiYWQgb24gdGhpcy4gSSB0aGluayBhIGdvb2QgcGFy
dCBvZiB0aGlzIHNlcmllcyBzaG91bGQgaGF2ZQo+IGxhbmRlZCBpbiB0aGUgcHJldmlvdXMgbWVy
Z2Ugd2luZG93LiBJIHdhcyB3YWl0aW5nIHRvIGNvbGxlY3Qgc29tZQo+IHJldmlld3Mgb24gdGhp
cyBiZWZvcmUgYXBwbHlpbmcgYW5kIGRpZG4ndCByZWFsaXplIG1hbnkgcGF0Y2hlcyBhbHJlYWR5
Cj4gaGFkIHNvbWUuCgpObyBwcm9ibGVtIDspCgo+IEFueXdheSwgdGhlIHNlcmllcyBvdmVyYWxs
IGxvb2tzIHByZXR0eSBnb29kLCBhbHRob3VnaCBJIGRpZG4ndCBzcGVuZAo+IHRpbWUgbG9va2lu
ZyB0b28gY2xvc2VseS4gV2lsbCBhcHBseSBzb21lIHRpbWUgdGhpcyB3ZWVrLiBUaGFua3MgZm9y
IHRoZQo+IGNsZWFudXAsIGl0IGlzIG11Y2ggYXBwcmVjaWF0ZWQuCgpQZXJmZWN0ISBJJ20gbG9v
a2luZyBpbnRvIGRvaW5nIG1vcmUgY2xlYW51cC4gVGhhbmtzIGEgbG90IQoKQ2hlZXJzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
