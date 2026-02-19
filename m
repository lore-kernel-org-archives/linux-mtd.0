Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F3AE9A03B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Feb 2026 10:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nf+8LC1QD9iYDj9ye8uRyrm2v116dHlWbPAIUw8Lrkk=; b=rwtwE/MajqH2VZ
	IQASIrvGTIjaIHzyqLOsIVtpJUBgxU8umqv64OG9cswj5Wh+3qBNEk71cqG/yg85d+yBG+ge8MjMr
	tXrXl+Mz0lHNUJCkLb7/KdTrwSfBC+jOZEHGjSVA5IUOqmIjOUsB1qwjPWeRxhzhAtk11gyUst3ak
	DWqt5/1cuEege75kBzG+Bf1ZRR7w895OMP/h+O+vAN9zRwEL2DJcLCcujunjr/5RspQ1vw7AFp1RQ
	BHpP0ky02/ndSAKWMFwNHHLbpA2nHlOiFGOfkoKdcVG+KxLkdTp4aWT2N5mbL5UiCf+V2ICCZhqgJ
	1/C0GmRVc6MSbz5MVo3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1N1-0000000BERE-2TUo;
	Thu, 19 Feb 2026 10:34:55 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1My-0000000BEQq-2TQN
	for linux-mtd@lists.infradead.org;
	Thu, 19 Feb 2026 10:34:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F2AC4C2F4EF;
	Thu, 19 Feb 2026 10:35:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CBF55FB45;
	Thu, 19 Feb 2026 10:34:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7E05102F175B;
	Thu, 19 Feb 2026 11:34:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771497289; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=S/icmQtLFk7NKlE6/ITNmjfkCaauJszmzt1HAFFFVM0=;
	b=cW98++mQOsRHtNGKlHdBK2Ni8lc9CQgCiVv+uI60rXe4NnFwjLpkEHOxQxjZ4abdFSNSCy
	03fdbIfYnpvw26AC6hpr37UrjJqaihno22zsGzrOurg0wF4GsoVQG56Fv28eaH9uxVoHK1
	6BHYSEBwJXrYXoMBi9v6vaDHYA4nmdhJFGUEuBradbcCIyCWmydlwWV3OGWoczxmK7snkm
	8OINAM7SJXJPBUrjwTLW1C05/xd3gdREV/Hl44/J5dN6HWhf4+X4MMMdKh9iOeSjXxCVkh
	Z6esTw2vEvVvqBYnLEcPk3Vl6Gcp8XIbYPgJZcmG+uZv2WWOcksmMwxGwyhDEA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: Michael Walle <mwalle@kernel.org>,  <broonie@kernel.org>,
  <robh@kernel.org>,  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,
  <richard@nod.at>,  <vigneshr@ti.com>,  <tudor.ambarus@linaro.org>,
  <pratyush@kernel.org>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <p-mantena@ti.com>,  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 09/12] spi: cadence-quadspi: add PHY tuning
 infrastructure
In-Reply-To: <54964ad3-64d7-4f4e-bcf9-f0b92b1df034@ti.com> (Santhosh Kumar
	K.'s message of "Wed, 18 Feb 2026 23:37:00 +0530")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-10-s-k6@ti.com>
	<DGAC4N62UZQQ.3R7TLX87PECU3@kernel.org> <87qzqqxml7.fsf@bootlin.com>
	<DGCXTWSCAH6R.22SIL82AUVGYI@kernel.org> <87fr76xgsl.fsf@bootlin.com>
	<54964ad3-64d7-4f4e-bcf9-f0b92b1df034@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 19 Feb 2026 11:34:46 +0100
Message-ID: <877bs9t41l.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_023452_774872_CB7D49FC 
X-CRM114-Status: GOOD (  18.74  )
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

T24gMTgvMDIvMjAyNiBhdCAyMzozNzowMCArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBIZWxsbyBNaWNoYWVsIGFuZCBNaXF1ZWwsCj4KPiBPbiAxMi8wMi8y
NiAxODoyNSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4gSGVsbG8sCj4+IAo+Pj4+Pj4gKwlmb3Jf
ZWFjaF9jaGlsZF9vZl9ub2RlKHBhcnRpdGlvbl9ucCwgcGFydF9ucCkgewo+Pj4+Pj4gKwkJaWYg
KG9mX3Byb3BlcnR5X3JlYWRfc3RyaW5nKHBhcnRfbnAsICJsYWJlbCIsICZsYWJlbCkgfHwKPj4+
Pj4+ICsJCSAgICAhc3Ryc3RyKGxhYmVsLCAicGh5cGF0dGVybiIpKQo+Pj4+Pj4gKwkJCWNvbnRp
bnVlOwo+Pj4+Pgo+Pj4+PiBUaGVyZSB3YXMgYWxyZWFkeSBhIHJldmlldyBjb21tZW50IG9uIHRo
ZSBsYXN0IHZlcnNpb24uIE1vdmluZyB0aGlzCj4+Pj4+IGludG8gdGhlIGRyaXZlciBkb2Vzbid0
IG1ha2UgaXQgYW55IGJldHRlci4gSW4gZmFjdCB0aGlzIG1pZ2h0Cj4+Pj4+IGNyZWF0ZSBhIChi
YWQpIHByZWNlZGVudCBmb3IgZnV0dXJlIGRyaXZlcnMuCj4+Pj4KPj4+PiBJIHJlbWVtYmVyIGNv
bXBsYWluaW5nIGFib3V0IGl0IGJ1dCBub3QgaWYgdGhlcmUgd2FzIGEgc29sdXRpb24KPj4+PiBm
b3Jlc2Vlbi4gSW4gU1BJIE5BTkQgdGhlIHNvbHV0aW9uIGhhcyBiZWVuIGZvdW5kOiB0aGUgcGF0
dGVybiBpcyBpbiB0aGUKPj4+PiBkcml2ZXIgYW5kIHdlIGxvYWQgaXQgaW50byBjYWNoZSBiZWZv
cmUgUEhZIHR1bmluZy4gQnV0IGZvciBTUEkgTk9SIEkKPj4+PiB1bmRlcnN0b29kIHRoaXMgd2Fz
bid0IHBvc3NpYmxlLiBXaGF0IHdvdWxkIGJlIGFuIGFsdGVybmF0aXZlPwo+Pj4KPj4+IEknbSBu
b3QgY29tcGxhaW5pbmcgYWJvdXQgdXNpbmcgYSBwYXJ0aXRpb24gZm9yIHRoZSBwYXR0ZXJuIGJ1
dAo+Pj4gYWJvdXQgdGhlIGhhcmRjb2RlZCBuYW1lIG9mIGl0Lgo+Pj4KPj4+IEl0IHdhcyBwcm9w
b3NlZCB0byB1c2UgYXQgbGVhc3QgYSBkZXZpY2UgdHJlZSBwaGFuZGxlIHRvIHBvaW50IHRvIGEK
Pj4+IHBhcnRpdGlvbiAob3Igc28pLgo+PiBBaCwgeWVzIGluZGVlZCwgdGhhbmtzIGZvciBjbGFy
aWZ5aW5nIHRoaXMgdXAgKGFnYWluKSBmb3IgbWUuIEkgYWxzbwo+PiBhZ3JlZSB0aGUgaGFyZGNv
ZGVkIG5hbWUgaXMgbm90IGlkZWFsLgo+Cj4gSSByZW1lbWJlciB0aGlzIHdhcyBkaXNjdXNzZWQg
aW4gdGhlIHByZXZpb3VzIHZlcnNpb24uIEFzIG1lbnRpb25lZAo+IGluIHYxLCB1c2luZyBhIHBo
YW5kbGUgbWF5IG5vdCBiZSBpZGVhbCBzaW5jZSBhIHNpbmdsZSBjb250cm9sbGVyIGNhbgo+IGJl
IGFzc29jaWF0ZWQgd2l0aCBtdWx0aXBsZSBmbGFzaGVzLiBSZWdhcmRpbmcgdGhlIHN1Z2dlc3Rp
b24gdG8KPiBtYWludGFpbiBhbiBhcnJheSBvZiBwaGFuZGxlcyAtIGNvbnNpZGVyIGEgY29uZmln
dXJhdGlvbiB3aXRoIHRocmVlCj4gZmxhc2hlcyAoTkFORCwgTk9SLCBhbmQgYW5vdGhlciBOQU5E
KS4gSW4gc3VjaCBhIGNhc2UsIHdlIHdvdWxkIG5vdAo+IG5lZWQgYSBwaGFuZGxlIGZvciB0aGUg
TkFORCBkZXZpY2VzLCByaWdodD8KCldlIGNvdWxkIGhhdmUgYSBwZXItY2hpcCBwaHktdHVuaW5n
LWRhdGEgcGhhbmRsZT8KCj4gQWxzbywgSSdtIHRyeWluZyB0byB1bmRlcnN0YW5kIHRoZSBwcmFj
dGljYWwgZGlmZmVyZW5jZSBiZXR3ZWVuIHVzaW5nCj4gdGhlIHBhcnRpdGlvbiBuYW1lIHZlcnN1
cyBhIHBoYW5kbGUuIFNpbmNlIHRoZSBwaGFuZGxlIHdvdWxkIHN0aWxsIGJlCj4gbmFtZWQgc29t
ZXRoaW5nIGxpa2UgInBoeV9wYXJ0aXRpb24iLCBpdCBzZWVtcyBmdW5jdGlvbmFsbHkgc2ltaWxh
ci4KPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSdtIG1pc3Npbmcgc29tZXRoaW5nIGhlcmUuCgpG
dW5jdGlvbmFsbHksIHllcywgYnV0IGNvbmNlcHR1YWxseSBJJ2Qgc2F5IGl0IGxvb2tzIGNsZWFu
ZXIgKGFuZApzb21ld2hhdCBhIGJpdCBmYXN0ZXIgd2hlbiB0aGVyZSBhcmUgbWFueSBwYXJ0aXRp
b25zKS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
