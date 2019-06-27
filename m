Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA09C48BE7
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 17:47:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C8A920644
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 17:47:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ionTLQqD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C8A920644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4JeBlrjJNM9Ha7c3HNp7wUbq/j4Jy7bvmtiCWseaJc=; b=ionTLQqDIE75Z2
	m19+rX4zPrdhaCFHVOs53qetdBQy0cNpBbXV/0JIkuaI1qk0WevUMb+AmvrA+g8I6yvTK50sxiKdP
	hFtGLXnhGwhmryEGwcYhpkvLDTDkSH4wBEym2Wsl2BqiKHxxL0/X4v+2SseDtnpTEUysxcDqaZbYq
	6iLq6Mhfwu8ijenoQpBi+AZ5pFNRg3LQNh9pQp2IS+0UWVyQF7qSILhKwNKxKrso095ZoQCN6Gdvd
	fbUoCbp/9bIVER1fgk/XXS6Xx9NBwoA+D2hXpPD2XV2IDin+o1SbkafWQhuKXTjWW1TX8mU34JnZ8
	lo6fdvXgPI+Lwz+jmHKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgYU2-0000vq-2j; Thu, 27 Jun 2019 17:46:54 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgYTz-0000uy-Rd
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2019 17:46:53 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5B41B20000A;
 Thu, 27 Jun 2019 17:46:47 +0000 (UTC)
Date: Thu, 27 Jun 2019 19:46:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fuqian Huang <huangfq.daxian@gmail.com>
Subject: Re: [PATCH 35/87] mtd: nand: replace kmalloc and memset with
 kzalloc in nand_bch.c
Message-ID: <20190627194645.3d0af6b8@xps13>
In-Reply-To: <20190627173906.3675-1-huangfq.daxian@gmail.com>
References: <20190627173906.3675-1-huangfq.daxian@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_104652_056775_88CCC3EC 
X-CRM114-Status: GOOD (  14.17  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRnVxaWFuLAoKRnVxaWFuIEh1YW5nIDxodWFuZ2ZxLmRheGlhbkBnbWFpbC5jb20+IHdyb3Rl
IG9uIEZyaSwgMjggSnVuIDIwMTkKMDE6Mzk6MDUgKzA4MDA6Cgo+IGttYWxsb2MgKyBtZW1zZXQo
MCkgLT4ga3phbGxvYwo+IAo+IFNpZ25lZC1vZmYtYnk6IEZ1cWlhbiBIdWFuZyA8aHVhbmdmcS5k
YXhpYW5AZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2JjaC5j
IHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2JjaC5jIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iY2guYwo+IGluZGV4IDU1YWE0YzFjZDQxNC4uMTc1Mjcz
MTBjM2ExIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmNoLmMKPiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2JjaC5jCj4gQEAgLTE3MCw3ICsxNzAsNyBA
QCBzdHJ1Y3QgbmFuZF9iY2hfY29udHJvbCAqbmFuZF9iY2hfaW5pdChzdHJ1Y3QgbXRkX2luZm8g
Km10ZCkKPiAgCQlnb3RvIGZhaWw7Cj4gIAl9Cj4gIAo+IC0JbmJjLT5lY2NtYXNrID0ga21hbGxv
YyhlY2NieXRlcywgR0ZQX0tFUk5FTCk7Cj4gKwluYmMtPmVjY21hc2sgPSBremFsbG9jKGVjY2J5
dGVzLCBHRlBfS0VSTkVMKTsKPiAgCW5iYy0+ZXJybG9jID0ga21hbGxvY19hcnJheSh0LCBzaXpl
b2YoKm5iYy0+ZXJybG9jKSwgR0ZQX0tFUk5FTCk7Cj4gIAlpZiAoIW5iYy0+ZWNjbWFzayB8fCAh
bmJjLT5lcnJsb2MpCj4gIAkJZ290byBmYWlsOwo+IEBAIC0xODIsNyArMTgyLDYgQEAgc3RydWN0
IG5hbmRfYmNoX2NvbnRyb2wgKm5hbmRfYmNoX2luaXQoc3RydWN0IG10ZF9pbmZvICptdGQpCj4g
IAkJZ290byBmYWlsOwo+ICAKPiAgCW1lbXNldChlcmFzZWRfcGFnZSwgMHhmZiwgZWNjc2l6ZSk7
Cj4gLQltZW1zZXQobmJjLT5lY2NtYXNrLCAwLCBlY2NieXRlcyk7Cj4gIAllbmNvZGVfYmNoKG5i
Yy0+YmNoLCBlcmFzZWRfcGFnZSwgZWNjc2l6ZSwgbmJjLT5lY2NtYXNrKTsKPiAgCWtmcmVlKGVy
YXNlZF9wYWdlKTsKPiAgCgpBcmUgdGhlcmUgYW55IGd1aWRlbGluZXMgb24gdGhpcyB0b3BpYyB0
aGF0IEkgbWlzc2VkPyBPdGhlcndpc2UgSSBkb24ndAp0aGluayB0aGlzIGlzIGltcG9ydGFudCB0
byBjaGFuZ2UuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
