Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53FCC3DA41
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 14:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzxe/EPSEf6v1BBLukewAwrmuiCS9lSaIlBalp7ONRw=; b=0ZE+9hBCbuZ/MI
	ooVAjueRoxmVoFq/hsZRnTRWvqSkIpp/JotUntrxGGCgF5UlXSLtePyCR3R8M+jfWit14QzXmOO3/
	sYJyGNK+5P9xqVCAol2W4q9osu+L9MiLqEz2CzWd7KgIJSMxvI53/6d2FhJ6oVlI+4tR4JoA/Deqq
	m+gBrAdMU2xCOhgWtS8DR5sw10G820Cb+aJv2kb6L+LUvAzN3SxEAAwz/hf/nT1UgiCwgJ9dCESUS
	40pjYOIdMTJt5+2oXqH95dUY4TY5ZsoPLsRC7imDbLYpBWr6mxDYB3kVP7FC8vrL2YTfngKAXOf5a
	TX8kjn8f3rC3pqLf1OAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRYmU-0000000AtiP-120b;
	Wed, 10 Jul 2024 14:58:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRYmN-0000000AtgI-3rME
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jul 2024 14:58:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 769FF619E5;
	Wed, 10 Jul 2024 14:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE72C32781;
	Wed, 10 Jul 2024 14:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720623526;
	bh=6HLFABBIzqnkp5fPqmIas3ZO5215/W6jH+WPjQdDzvI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qRbiRA/348fPzZAvDn1adrYXsoEMCL8c2nemBkMhd1GqPcNLbcO/uqv9oqx9oOcpR
	 s90cV1LF052MXuwnKy0UfH9NXtLwLaztCeD+EFL/ZigGe3RaL+8KjR6s/PbS7Hejwv
	 jLBrVKULHVGA6NNu/GUsM4B7x5hQ63XtnRrQAQohrEa7MVhSfhhqrQa1VEhIL/DJdv
	 Js6Te8VSqvdwt3QvbsmUHAv1NyXCbbVNX+NGOu7Pt3LT/1gTMEAjE2tFr26rrmua5a
	 w2Cy+oXWYRWoC6qT/XVl7st6xlhqOZCfxpa830ezQigm68TxJMJoJnvnvzrTR31uQ9
	 OVhTvuG1eqHCg==
From: Pratyush Yadav <pratyush@kernel.org>
To: =?utf-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>
Cc: Pratyush Yadav <pratyush@kernel.org>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  "Tudor Ambarus"
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,  "Miquel
 Raynal" <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: sst: Factor out common write operation to
 `sst_nor_write_data()`
In-Reply-To: <5fe0e312-0844-4de7-8096-eae24361c0a4@prolan.hu>
 (=?utf-8?B?IkNzw7Nrw6Fz?=
	Bence"'s message of "Wed, 10 Jul 2024 15:35:38 +0200")
References: <20240710091401.1282824-1-csokas.bence@prolan.hu>
	<mafs07cdto0t9.fsf@kernel.org>
	<5fe0e312-0844-4de7-8096-eae24361c0a4@prolan.hu>
Date: Wed, 10 Jul 2024 16:58:43 +0200
Message-ID: <mafs034ohnvj0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_075848_212668_9779BB79 
X-CRM114-Status: GOOD (  23.28  )
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

T24gV2VkLCBKdWwgMTAgMjAyNCwgQ3PDs2vDoXMgQmVuY2Ugd3JvdGU6Cgo+IEhpIQo+Cj4gT24g
Ny8xMC8yNCAxNTowNCwgUHJhdHl1c2ggWWFkYXYgd3JvdGU6Cj4+PiBOb3RlczoKPj4+ICAgICAg
UkZDOiBJJ20gdGhpbmtpbmcgb2YgcmVtb3ZpbmcgU1BJTk9SX09QX0JQIGluIGZhdm9yIG9mCj4+
PiAgICAgIFNQSU5PUl9PUF9QUCAodGhleSBoYXZlIHRoZSBzYW1lIHZhbHVlKS4gU1BJTk9SX09Q
X1BQCj4+PiAgICAgIGlzIHRoZSAic3RhbmRhcmQiIG5hbWUgZm9yIHRoZSBlbGVtZW50YXJ5IHVu
aXQtc2l6ZWQKPj4+ICAgICAgKDEgYnl0ZSwgaW4gdGhlIGNhc2Ugb2YgTk9SKSB3cml0ZSBvcGVy
YXRpb24uIEkgZmluZCBpdAo+Pj4gICAgICBjb25mdXNpbmcgdG8gaGF2ZSB0d28gbmFtZXMgZm9y
IHRoZSBzYW1lIG9wZXJhdGlvbiwKPj4+ICAgICAgc28gaW4gYSBmb2xsb3d1cCBJIHBsYW4gdG8g
cmVtb3ZlIHRoZSB2ZW5kb3Itc3BlY2lmaWMKPj4+ICAgICAgbmFtZSBpbiBmYXZvciBvZiB0aGUg
c3RhbmRhcmQgb25lLgo+PiBFdmVuIHRob3VnaCB0aGUgb3BlcmF0aW9ucyBoYXZlIHRoZSBzYW1l
IG9wY29kZSwgSSBzZWUgdGhlbSBhcyBkaWZmZXJlbnQKPj4gb3BlcmF0aW9ucy4gT25lIGlzIGEg
Ynl0ZSBwcm9ncmFtOiBpdCBjYW4gb25seSB3cml0ZSBvbmUgYnl0ZSBhdCBhIHRpbWUuCj4+IFRo
ZSBvdGhlciBpcyBhIHBhZ2UgcHJvZ3JhbTogaXQgY2FuIHdyaXRlIHVwIHRvIG9uZSBwYWdlICgy
NTYgYnl0ZXMKPj4gdXN1YWxseSkgYXQgYSB0aW1lLgo+PiBTbyBJIHdvdWxkIGFjdHVhbGx5IGZp
bmQgaXQgbW9yZSBjb25mdXNpbmcgaWYgeW91IHVzZSBwYWdlIHByb2dyYW0gaW4gYQo+PiBzaXR1
YXRpb24gd2hlcmUgdGhlIG9wZXJhdGlvbiBpcyBhY3R1YWxseSBhIGJ5dGUgcHJvZ3JhbSwgYW5k
IGF0dGVtcHRpbmcKPj4gdG8gcHJvZ3JhbSB0aGUgd2hvbGUgcGFnZSB3aWxsIGZhaWwuCj4KPiBZ
ZXMsIFNTVCBlbmdpbmVlcnMgdG9vayBzb21lIF91bmNvbnZlbnRpb25hbF8gc3RlcHMgd2hlbiBk
ZXNpZ25pbmcgdGhpcwo+IGZhbWlseS4uLiBIb3dldmVyLCB0aGVyZSBhcmUgbm8gMjU2IGJ5dGUg
cGFnZXMgaW4gdGhlc2UgY2hpcHMuIFlvdSBlaXRoZXIKPiBwcm9ncmFtIGl0IG9uZSBieXRlIGF0
IGEgdGltZSwgb3IgYXMgYSBzZXF1ZW5jZSBvZiB0d28gYnl0ZSB2YWx1ZXMuIFNvLCBpbiBteQo+
IGV5ZXMsIHRoYXQgbWFrZXMgaXQgYSBGbGFzaCB3aGVyZSB0aGUgcGFnZSBzaXplIGlzIDEgYnl0
ZSwgYW5kIHRoZQo+IHZlbmRvci1zcGVjaWZpYyB3cml0ZSBpcyBzb21ldGhpbmcgZXh0cmEgYWRk
ZWQgb24gKGFuZCBtaW5kIHlvdSwgdGhhdCdzIG5vdCBhCj4gcGFnZSBwcm9ncmFtIGVpdGhlciwg
eW91IGp1c3QgZmVlZCBpdCBhbiAqYXJiaXRyYXJ5KiBldmVuIG51bWJlciBvZiBieXRlcywgdGhl
cmUKPiByZWFsbHkgYXJlIG5vIHBhZ2VzIGhlcmUgYXQgYWxsLCBvbmx5IGVyYXNlIHNlY3RvcnMp
LgoKRXhhY3RseS4gU2luY2UgdGhlcmUgYXJlIG5vIHBhZ2VzLCBjYWxsaW5nIHRoZSBvcGVyYXRp
b24gIlBhZ2UgUHJvZ3JhbSIKd291bGQgYmUgYSBtaXNub21lciwgbm8/IEJ5dGUgUHJvZ3JhbSBp
cyBhIGZpdHRpbmcgbmFtZSBJTU8uCgpCZXlvbmQgY29zbWV0aWMgcmVhc29ucywgZG8geW91IHNl
ZSBhbnkgbmVlZCBmb3IgY2hhbmdpbmcgdGhpcz8KT3RoZXJ3aXNlLCBJJ2QgcmF0aGVyIGF2b2lk
IHRoZSBjaHVybiBvbiBzb21ldGhpbmcgdGhhdCBpcyBpbiB0aGUgZ3JheQp6b25lIGFueXdheS4K
Cj4KPj4gTm90IGRpcmVjdGx5IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaCwgYnV0IHdoZW4gcmV2aWV3
aW5nIHRoaXMgcGF0Y2ggSQo+PiBub3RpY2VkIGFub3RoZXIgc21hbGwgaW1wcm92ZW1lbnQgeW91
IGNhbiBtYWtlLiBbLi4uXQo+PiBIZXJlLCB3ZSBkbyBhIHdyaXRlIGRpc2FibGUuIFRoZW4gaWYg
YSBvbmUtYnl0ZSB3cml0ZSBpcyBuZWVkZWQsIGRvIGEKPj4gd3JpdGUgZW5hYmxlIGFnYWluLCB3
cml0ZSB0aGUgZGF0YSBhbmQgd3JpdGUgZGlzYWJsZS4KPj4gRG8gd2UgcmVhbGx5IG5lZWQgdG8g
dG9nZ2xlIHdyaXRlIGVuYWJsZSBiZXR3ZWVuIHRoZXNlPyBJZiBub3QsIGl0IGNhbgo+PiBiZSBz
aW1wbGlmaWVkIHRvIG9ubHkgZG8gdGhlIHdyaXRlIGRpc2FibGUgYWZ0ZXIgYWxsIGJ5dGVzIGhh
dmUgYmVlbgo+PiB3cml0dGVuLgo+Cj4gSG9uZXN0bHksIEknbSBub3Qgc3VyZSwgSSB3YXMgdG9v
IGFmcmFpZCB0byB0b3VjaCB0aGF0IHBhcnQuIEhvd2V2ZXIsIGZyb20gdGhlCj4gZGF0YXNoZWV0
IG9mIFNTVDI1VkYwNDBCIEkgcHJlc3VtZSB0aGF0IGlmIHdlIGRpZCBub3QgdG9nZ2xlIGl0LCB0
aGVuIHRoZSBGbGFzaAo+IGNoaXAgd291bGQgaW50ZXJwcmV0IHRoZSAweDAyIG9wY29kZSBhbmQg
aXRzIGFyZ3VtZW50IGFzIGFub3RoZXIgMiBieXRlcyBvZiBkYXRhCj4gdG8gd3JpdGUgYXQgdGhl
IGVuZC4gQnl0ZSBQcm9ncmFtIHRha2VzIGV4YWN0bHkgMSBhcmd1bWVudCwgc28gaXQgY2FuIGJl
Cj4gZm9sbG93ZWQgYnkgYW5vdGhlciBjb21tYW5kLCBidXQgQUFJIFdQIGdvZXMgb24gdW50aWwg
fkNTIGdvZXMgaGlnaC4KCkkgc2VlLiBUaGVuIGxldCdzIF9ub3RfIGZpeCB3aGF0IGlzbid0IGJy
b2tlbiEKCi0tIApSZWdhcmRzLApQcmF0eXVzaCBZYWRhdgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
