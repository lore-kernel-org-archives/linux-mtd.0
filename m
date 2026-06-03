Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FFFCD6E55
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2026 15:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZKHJyueFUMSDpZ+7gp9KSvD5ntiQNu3vg5u5b/8jw8=; b=w0eDgfNUk6SbIB
	0UtekganUCAmtzz17RiwkKDkM2pzY7E0e3W09dDlyMvPzfdRW2EMCj4MwNdC39MnJ2HS8vBoEwCRA
	0DHs2cniCbW5ztUYUmjY92PGlwsH23SsdyYjhovzixPnAU4hIxfj9tIyg2VBcJFG+BNuY9fs6osK5
	fkv9opOiRFCwBITKqACNVLh0kHnj5G+Un5olRe/4FurJvfDMOtdGWfeqU8qFyUXiZ2m1speNRUcC3
	b0jO0G5LL4DhOGxFexrvDKHi5d+xUeCjNoXsicLtYA9BCkOPN1zaWrpoJQiQi1dzkkuBadMRmUAoV
	nET+z2c6vq3y8cbrsvsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnvl-0000000FTOb-3uqp;
	Wed, 03 Jun 2026 15:54:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnvg-0000000FTNs-42fD
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jun 2026 15:54:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 677441A011B;
	Wed,  3 Jun 2026 15:54:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 385655FA0A;
	Wed,  3 Jun 2026 15:54:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95B8810888CC6;
	Wed,  3 Jun 2026 17:54:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780502087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Lo6IT/7MpBt7kiejYK9XQhaa0DR0JIClmkz8iuTUcIk=;
	b=gzDMRG/9vrsqa1QELcLPHb5nfVqmtUFHd7BrAubSVkCUDkjACpsbUZF7DLhs6dJ3JYktG0
	loDp97FTQe/AB9xWzlISl1MyDrpZZPy5fz0kCg1nR4xXt6sbxG6gkxupnv67R7l3WZTQ3F
	mONARMYljzes5oZ90fSFU5Zy3CsKr+UZqIkcel8UyUW/5HTrEZl7pWMm967Kw6RRofldym
	0W3yKHiaq1TeU5UkRg70GcIATNhn+rzyc+HnoAM9eU18Y0uSaWFwfpt2yDMztyGVDNdj5y
	t16++dLC28TjSVIQLd74+VLV5uFuAdqAd2XGTz36oFleMMPqdqP1m4Vgnc28jg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Santhosh Kumar K <s-k6@ti.com>,  broonie@kernel.org,  robh@kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  richard@nod.at,
  vigneshr@ti.com,  pratyush@kernel.org,  mwalle@kernel.org,
  takahiro.kuwano@infineon.com,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  praneeth@ti.com,  u-kumar1@ti.com,
  a-dutta@ti.com
Subject: Re: [PATCH v3 01/13] spi: dt-bindings: allow spi-max-frequency to
 specify a frequency pair
In-Reply-To: <20260602-aptly-bunkbed-1bd3a8d63d54@spud> (Conor Dooley's
	message of "Tue, 2 Jun 2026 17:18:15 +0100")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-2-s-k6@ti.com>
	<20260528-clergyman-kindling-20971775ba78@spud>
	<eaa75113-2b89-468d-aca8-932bc7e33a7d@ti.com>
	<87cxy92llq.fsf@bootlin.com>
	<20260602-aptly-bunkbed-1bd3a8d63d54@spud>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 03 Jun 2026 17:54:41 +0200
Message-ID: <875x3zzkji.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_085453_182208_CC9EDC93 
X-CRM114-Status: GOOD (  31.98  )
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

SGkgQ29ub3IsCgpPbiAwMi8wNi8yMDI2IGF0IDE3OjE4OjE1ICswMSwgQ29ub3IgRG9vbGV5IDxj
b25vckBrZXJuZWwub3JnPiB3cm90ZToKCj4gT24gVHVlLCBKdW4gMDIsIDIwMjYgYXQgMDI6MDU6
NTNQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4gSGVsbG8gQ29ub3IsIFNhbnRob3No
LAo+PiAKPj4gPj4gSSBhbHNvIGRvbid0IGdldCB0aGUgcG9pbnQgb2YgdGhpcyBwcm9wZXJ0eSwg
d2h5IGNhbid0IHlvdSBqdXN0IHNldAo+PiA+PiB0aGUKPj4gPj4gbWF4IHRoYXQgdGhlIGRldmlj
ZSBjYW4gZG8gYW5kIGlmIHRoZSBjb250cm9sbGVyIGNhbiBjb25maWd1cmUgaXRzZWxmIHRvCj4+
ID4+IGJlIGZhc3QgZW5vdWdoIGl0IHdpbGwgZG8gc28sIGFuZCBpZiBpdCBjYW4ndCB0aGVuIGl0
J2xsIHBpY2sgd2hhdGV2ZXIKPj4gPj4gdGhlIGZhc3Rlc3QgaXQgY2FuIGFjdHVhbGx5IGRvIGlu
c3RlYWQ/Cj4+IAo+PiBJZiBJIG1heSwgdGhpcyBpcyBub3QgZG9hYmxlIGJlY2F1c2UgdGhlcmUg
aXMgYWx3YXlzIGEgcGhhc2UgYXQgbG93Cj4+IHNwZWVkLiBCeSBsb3cgc3BlZWQsIEkgbWVhbiB0
aGUgc3BlZWQgd2hpY2ggYWxsb3dzIHJlbGlhYmxlIGRhdGEKPj4gdHJhbnNmZXJzIGJldHdlZW4g
dGhlIGhvc3QgYW5kIHRoZSBkZXZpY2UuIFRoaXMgIm1heGltdW0gbG93IiBzcGVlZCBpcwo+PiBu
b24gZGlzY292ZXJhYmxlLCBpdCBpcyBuZWNlc3NhcnkgdG8gZGVzY3JpYmUgaXQuIEFzIG9mIHRv
ZGF5LCBpdCBpcwo+PiB3aWRlbHkgdXNlZCAoYW5kIEkgYmVsaWV2ZSBmb3IgZ29vZCByZWFzb25z
KSBhbmQgY292ZXJzIDk5Ljk5JSBvZiB0aGUKPj4gdXNlIGNhc2VzLgo+PiAKPj4gPj4gU2VlbXMg
bGlrZSB5b3UncmUgYWJ1c2luZyBhIHBlcmlwaGVyYWwgcHJvcGVydHkgdG8gZW5jb2RlIGluZm9y
bWF0aW9uCj4+ID4+IGFib3V0IHRoZSBjb250cm9sbGVyLgo+PiA+Cj4+ID4gVGhlIGNvbnRyb2xs
ZXItc2lkZSBhcHByb2FjaCB5b3UgbWVudGlvbmVkIGlzIHNpbWlsYXIgdG8gd2hhdCBJIGhhZCBp
bgo+PiA+IHYyLCB3aGVyZSBhIGNvbXBhdGlibGUtc3BlY2lmaWMgYmFzZV9mcmVxIGlzIHVzZWQg
Zm9yIG5vbi1QSFkgb3BzLgo+PiA+Cj4+ID4gTWlxdWVsLAo+PiA+Cj4+ID4gSSB0aGluayB3ZSBz
aG91bGQgcmV2ZXJ0IHRvIHRoZSB2MiBhcHByb2FjaC4KPj4gPgo+PiA+IFRoZSBub24tUEhZIGZy
ZXF1ZW5jeSBpcyBhIGNvbnRyb2xsZXIgbGltaXRhdGlvbi9jYXBhYmlsaXR5IHJhdGhlciB0aGFu
Cj4+ID4gYSBmbGFzaCBjaGFyYWN0ZXJpc3RpYywgc28gaXQgc2VlbXMgbW9yZSBhcHByb3ByaWF0
ZSB0byBrZWVwIGl0IGluIHRoZQo+PiA+IGNvbnRyb2xsZXIgZHJpdmVyIGFzIENvbm9yIHN1Z2dl
c3RlZC4KPj4gCj4+IFRoZSBub24gdHVuZWQgZnJlcXVlbmN5IGlzIHRoZSBtYXhpbXVtIGZyZXF1
ZW5jeSBvbmUgY291bGQgdXNlCj4+IHJlbGlhYmx5LiBJdCBpcyBub3QgY29udHJvbGxlciBzcGVj
aWZpYy4gSXQgaXMgbW9zdGx5IGJvYXJkIHNwZWNpZmljLAo+PiBhbmQgdG8gc29tZSBleHRlbmQg
bWF5IGFsc28gYmUgY2hpcCBzcGVjaWZpYy4KPj4gCj4+IFRoZSB0dW5lZCBmcmVxdWVuY3kgaXMg
dGhlIG1heGltdW0gZnJlcXVlbmN5IG9uZSBjb3VsZCB1c2UgcmVsaWFibHkKPj4gYWZ0ZXIgbGlu
ZSBhIGNvbnRyb2xsZXIgb3IgY2hpcCBzcGVjaWZpYyB0cmFpbmluZyBwcm9jZWR1cmUuIEl0IGlz
Cj4+IGFsc28gdGhlIHJlc3VsdCBvZiBhbiBhZ2dyZWdhdGVkIHNldCBvZiBub24gZGlzY292ZXJh
YmxlIGhhcmR3YXJlCj4+IGxpbWl0YXRpb25zOgo+PiAtIGJvYXJkIHJvdXRpbmcKPj4gLSBjaGlw
IGNhcGFiaWxpdHkKPj4gLSBjb250cm9sbGVyIGNhcGFiaWxpdHkKPgo+IFJpZ2h0LCBhbmQgdGhp
cyBJIGd1ZXNzIGlzIHdoYXQgc2N1cHBlcnMgbGV0dGluZyB0aGUgY29udHJvbGxlciBkcml2ZXIK
PiBzb3J0IHRoZSBjb25maWd1cmF0aW9uIG91dCBpdHNlbGYgYW5kIGxlYXZpbmcgdGhlIHByb3Bl
cnR5IGFzLWlzLgo+IEl0IGNvdWxkIGJlIHRoYXQgdGhlIHNwZWVkIGluIHNwaS1tYXgtZnJlcXVl
bmN5IGlzIGxvd2VyIHRoYW4gdGhlICJiYXNlCj4gc3BlZWQiIG9mIHRoZSBjb250cm9sbGVyIGJ1
dCBiZWNhdXNlIG9mIGJvYXJkIHJvdXRpbmcgb3IgZGV2aWNlCj4gY2FwYWJpbGl0eSB0aGF0IHRo
ZSB0dW5lZCBtb2RlIGlzIHN0aWxsIHJlcXVpcmVkLCByaWdodD8KCkkgZG8gbm90IGFjdHVhbGx5
IGV4cGVjdCBhbnkgdHVuZWQgbW9kZS9mcmVxdWVuY3kgdG8gYmUgbWFuZGF0b3J5LgpXaGF0IFNh
bnRob3NoIGNhbGxzIHRoZSBiYXNlIHNwZWVkIGlzIHR5cGljYWxseSB3aGF0IHdlIGhhdmUgdG9k
YXksIHNvCnRoZSBiZXN0IG9mIHdoYXQgd2UgY2FuIGRvIHdpdGhvdXQgYW55IGxpbmUgdHJhaW5p
bmcuIHNwaS1tYXgtZnJlcXVlbmN5CmV4cHJlc3NlcyBleGFjdGx5IHRoaXMgdG9kYXkuCgo+PiBX
ZSBtdXN0IHRyeSB0byB0aGluayBhYm91dCBvdGhlciAobm9uIFRJKSBwb3NzaWJsZSB1c2UgY2Fz
ZXMgb2YgdGhlc2UKPj4gcHJvcGVydGllcyBhbmQgYWxzbyB0YWtlIGludG8gYWNjb3VudCB0aGUg
ZXhpc3RpbmcgRFQgZXhwZWN0YXRpb25zLiBJZgo+PiB0dXJuaW5nIHRoZSBwcm9wZXJ0eSBpbnRv
IGFuIGFycmF5IGlzIHRvbyBjb21wbGV4LCB3ZSBtYXkgZ28gZm9yIGEKPgo+IEkgZG9uJ3QgdGhp
bmsgaXQgaXMgInRvbyBjb21wbGV4IiwgYnV0IGl0IHJlcXVpcmVzIHJlbW92aW5nIHRoZQo+IGRl
ZmluaXRpb25zIG9mIHNwaS1tYXgtZnJlcXVlbmN5IGZyb20gdGhlIDQgb3IgNSBiaW5kaW5ncyB0
aGF0IHJlZGVmaW5lCj4gaXQgYW5kIG1ha2luZyBhIG1lY2hhbmljYWwgY2hhbmdlIHRvIGFsbCBz
cGkgZGV2aWNlIGJpbmRpbmdzIHRoYXQKPiBzcGVjaWZ5IGEgbGltaXQuIEl0J3Mgbm90IGNvbXBs
ZXgsIGJ1dCBpdCB3aWxsIGJlIGFubm95aW5nIHdpdGhvdXQKPiB0b29saW5nIGRvaW5nIGl0IGZv
ciB5b3UuCgpJbmRlZWQuCgo+PiBzZWNvbmQgcHJvcGVydHksIGJ1dCBJIGJlbGlldmUgdGhlIG5h
bWUgc2hvdWxkIG5vdCBiZSBUSSBzcGVjaWZpYyAoYnV0Cj4+IEknbGwgbGV0IHRoZSBmaW5hbCBk
ZWNpc2lvbiB0byB0aGUgRFQgZ3VydXMpLgo+Cj4gWWVhaCwgSSBjb25jdXIuIElmIG5vdCBkb2lu
ZyB0aGUgMiBjZWxsIHNwaS1tYXgtZnJlcXVlbmN5LCB0aGVuCj4gc29tZXRoaW5nIGxpa2Ugc3Bp
LW1heC1wb3N0LXR1bmluZy1mcmVxdWVuY3kgb3Igdy9lIEkgdGhpbmsgc2hvdWxkIGJlCj4gdXNl
ZC4gRG9lc24ndCBzZWVtIGxpa2UgVEkgd291bGQgYmUgdGhlIG9ubHkgcGVvcGxlIHRoYXQgZW5k
IHVwIGRvaW5nCj4gc29tZXRoaW5nIGxpa2UgdGhpcy4KCldoeSBub3QuIE1pZ2h0IGJlIHNpbXBs
ZXIgYXBwcm9hY2ggZnJvbSBhIGJpbmRpbmcgc2lkZSwgd2hpbGUgYWxzbwpyYXRoZXIgZWFzeSB0
byB3b3JrIHdpdGggaW4gdGhlIHNwaSBjb3JlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
