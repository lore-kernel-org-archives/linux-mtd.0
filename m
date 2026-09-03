Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D55C624A4
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2026 10:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tAKhoRXly3sxBZfV8FoglDsNIRwv/2YFyYMRr2CjIyw=; b=3AvZOzf3JHIECe
	8lmNPuLh+XyuzAMsOjF9q/o3b6agdyOetd/59th5RqXVqeN1JUX0W5hGrroxiD/q4glYikjuxl6Oi
	7JrfzegXHquhrpWKciEF8pLel4XVSYrqXGrEjd7SObFcI/okrsR6LEttekzXYRVSvp4h22dUNFRsb
	qwlRZC3ua9kQh0q+UahXKjyK+aam69dFd8DHM6EDlSYFQ0Nj4Jy52JSH8L74AchGiOhzqHzTr5Ktk
	LhrdI5c6dUvE/PoJImRwlGj5+xxMvGjXv/v+EdnAOvWR3tH8M9N6CkIZ6dbpN5qcRd8jDUEkotzPs
	vJYAqOn4EP0HmpeXYxwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24GN-0000000H1LD-1GUM;
	Thu, 03 Sep 2026 10:01:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24GK-0000000H1KU-0P3n
	for linux-mtd@lists.infradead.org;
	Thu, 03 Sep 2026 10:01:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D4E781A1977;
	Thu,  3 Sep 2026 10:01:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A778B602B8;
	Thu,  3 Sep 2026 10:01:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 589D411C792CB;
	Thu,  3 Sep 2026 12:01:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788429694; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GH3CzqGYy8DHLJD2SkUKUQsn8Gk6wieYL0uqvzjySG8=;
	b=QG13max6Ym4fBRgbJpbZbnv6VJMWqqu357US/ep1+2zQ2OX4F++h8b3xs7CTxrILtZnxm4
	a3cs+nBV4C0iDg5DpcjxMdo2uwzOMYa6wtnEH0+9nSSN+H8niCE8dDVizZLHGsru8gQX7c
	5GICTTsvt0yM2sxEY1oVfyA1GOLk3//xjGAQh1kBxC47NTNul0n59a9vyQTuL5Nt6oBvyR
	e82FsU8wI4GLPN2AkiiI7sEM9ROcnuL4a7Xv/kNqewy6Gz8FPmHR8JbPy/n0oxUOtzaxIK
	graFW6kBImpJMVsGMGnmMyWkzWBy2MkptNeLyApVMGTpz2aqdgKAUWtOT7WLZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?B?5p6X5L2z6bmP?= <ljp1205831794@gmail.com>
Cc: linux-mtd@lists.infradead.org,  richard@nod.at,  vigneshr@ti.com,
  linux-kernel@vger.kernel.org,  Aohan Mei <henrymei@tencent.com>,
  TencentOS Corvus AI <corvus@tencent.com>,  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: inftl: validate MediaHeader partition geometry
 before allocating tables
In-Reply-To: <906239c1-e78c-435c-954f-1198595d62b2@gmail.com>
 (=?utf-8?B?Iuael+S9s+m5jyIncw==?=
	message of "Thu, 3 Sep 2026 17:43:04 +0800")
References: <20260902124044.3942821-1-henrymei@tencent.com>
	<87h5k67ocd.fsf@bootlin.com>
	<906239c1-e78c-435c-954f-1198595d62b2@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 03 Sep 2026 12:01:22 +0200
Message-ID: <87y0di4psd.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_030140_284196_75581D90 
X-CRM114-Status: GOOD (  18.69  )
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

T24gMDMvMDkvMjAyNiBhdCAxNzo0MzowNCArMDgsIOael+S9s+m5jyA8bGpwMTIwNTgzMTc5NEBn
bWFpbC5jb20+IHdyb3RlOgoKPiBIaSBNaXF1w6hsLAo+Cj4gT24gMDIvMDkvMjAyNiwgTWlxdWVs
IFJheW5hbCB3cm90ZToKPj4gPiBpcyBldmFsdWF0ZWQgaW4gdW5zaWduZWQgMzItYml0IGFyaXRo
bWV0aWMuwqAgV2l0aCBsYXN0VW5pdCA8IGZpcnN0VW5pdAo+PsKgCj4+IGxhc3RVbml0IDwgZmly
c3RVbml0PyBEaWQgeW91IGV2ZW4gcmVhZCB0aGF0IHNlbnRlbmNlPwo+Cj4gSSBzaG91bGQgaGF2
ZSBtYWRlIHRoZSBhcml0aG1ldGljIGV4cGxpY2l0IGluIHRoZSBmaXJzdCBwbGFjZS4KPiBBbGwg
dGhyZWUgZmllbGRzIGFyZSBfX3UzMiAoc3RydWN0IElORlRMUGFydGl0aW9uKSwgc28gd2l0aCB0
aGUKPiBjcmFmdGVkIGhlYWRlciB1c2VkIGluIHRlc3RpbmcgKGZpcnN0VW5pdD03MDAwLCBsYXN0
VW5pdD0zLAo+IHZpcnR1YWxVbml0cz0xMDApOgo+Cj4gwqAgwqAgKDMgLSA3MDAwICsgMSkgPT0g
NDI5NDk2MDMwMMKgIMKgIC8qIHUzMiB3cmFwICovCj4gwqAgwqAgNDI5NDk2MDMwMCA8IDEwMCA9
PSBmYWxzZcKgIMKgIC8qIHNhbml0eSBjaGVjayBwYXNzZXMgKi8KPgo+IEV4ZWN1dGlvbiB0aGVu
IGNvbnRpbnVlcyB3aXRoIG5iX2Jvb3RfYmxvY2tzPTcwMDAgYXMgdGhlIGxvb3AKPiBib3VuZCBh
Z2FpbnN0IGEga21hbGxvY19hcnJheShsYXN0VW5pdCArIDEgPSA0LCAyKSA9IDgtYnl0ZQo+IFBV
dGFibGUsIGFuZCB0aGUgYm9vdC1ibG9jayBtYXJraW5nIGxvb3Agd3JpdGVzIH4xNCBLQiBwYXN0
Cj4gdGhlIG9iamVjdC7CoCBSZXByb2R1Y2VkIG9uIHY3LjItcmM0IHdpdGggYSBSQU0tYmFja2Vk
IGZha2UKPiBEaXNrT25DaGlwIE1URCBkZXZpY2UgY2FycnlpbmcgdGhhdCBoZWFkZXI6Cj4KPiDC
oCDCoCBCVUc6IEtBU0FOOiBzbGFiLW91dC1vZi1ib3VuZHMgaW4gZmluZF9ib290X3JlY29yZAo+
IMKgIMKgIFdyaXRlIG9mIHNpemUgMiAuLi4gMCBieXRlcyB0byB0aGUgcmlnaHQgb2YgYWxsb2Nh
dGVkIDgtYnl0ZSByZWdpb24KPgo+IFRoYXQgc2FpZCwgdGhlIHJlYWNoYWJpbGl0eSBpcyBhZG1p
dHRlZGx5IG5hcnJvdzogdGhpcyBpcyBhCj4gbW91bnQtdGltZSBwYXRoLCBzbyB0cmlnZ2VyaW5n
IHJlcXVpcmVzIHJvb3QgKGRldmljZQo+IHJlZ2lzdHJhdGlvbikgb3IgcGh5c2ljYWwgY29udHJv
bCBvZiB0aGUgZmxhc2ggY29udGVudHM7Cj4gdW5wcml2aWxlZ2VkIHVzZXJzIGNhbm5vdCByZWFj
aCBpdC7CoCBUaGUgaW50ZW50IGlzIG9ubHkKPiBoYXJkZW5pbmcgb2YgdGhlIE1lZGlhSGVhZGVy
IHBhcnNlciwgaW4gdGhlIHNhbWUgc3Bpcml0IGFzCj4gdGhlIHNhbml0eSBjaGVja3MgYWxyZWFk
eSBpbiBmaW5kX2Jvb3RfcmVjb3JkKCkuCj4KPiBPbmUgZmFpciBwb2ludCBhYm91dCB2MTogdGhl
IG5ldyBjaGVjayBydW5zIG9uIGV2ZXJ5IHBhcnRpdGlvbgo+IGVudHJ5IGR1cmluZyB0aGUgc2Nh
biwgd2hpbGUgb25seSB0aGUgc2VsZWN0ZWQgQkRUTCBlbnRyeSdzCj4gZmllbGRzIGFyZSBhY3R1
YWxseSB1c2VkIGZvciB0aGUgYWxsb2NhdGlvbnMuwqAgSWYgZW50cmllcyB3aXRoCj4gbGFzdFVu
aXQgPCBmaXJzdFVuaXQgY2FuIGxlZ2l0aW1hdGVseSBhcHBlYXIgaW4gb3RoZXIgc2xvdHMKPiBv
biByZWFsIG1lZGlhLCBJIGNhbiByZXNwaW4gdG8gdmFsaWRhdGUgb25seSB0aGUgc2VsZWN0ZWQK
PiBwYXJ0aXRpb24gKGFuZCBkcm9wIHRoZSBib290LXJlY29yZC11bml0IGNoZWNrIGlmIHByZWZl
cnJlZCkuCj4KPiBIYXBweSB0byBzZW5kIGEgdjIgYWxvbmcgdGhvc2UgbGluZXMgaWYgeW91IHRo
aW5rIHRoZQo+IGhhcmRlbmluZyBpcyB3b3J0aHdoaWxlOyBvdGhlcndpc2UgSSB3aWxsIGRyb3Ag
aXQuwqAgRWl0aGVyCj4gd2F5LCB0aGFua3MgZm9yIHRoZSB0aW1lLgoKU2luY2UgdGhpcyBpcyBh
IHJvb3Qtb25seSBleHBsb2l0LCBJIGRvbid0IHNlZSB0aGUgcG9pbnQgaW4gZ29pbmcKZnVydGhl
ci4gVGhlc2UgImhhcmRlbmluZyIgc3RlcHMganVzdCBkYXJrZW4gdGhlIGNvZGUgZnJvbSBteSBv
cGluaW9uLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
