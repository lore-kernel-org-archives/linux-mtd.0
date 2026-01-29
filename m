Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439C3D73E83
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 19:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8ZHSXjb4GimLF33qE406FhJKTXD/lqVss+Am6z4+gc=; b=zQj+gKRtHKy/GN
	OEXWkl6gpP239D56UpoOHNInS+ttfDprBtpuSo3jiwcpnTaBu5MiVfNzmzAygTrgtMGirsZhx83AY
	x6OUu0CEkqxIEHIwYr5H7iENrjExSmxMx8J/kU6gabzqlndkMKoab+NI6jtmTLBggLEAvPLExC2Iz
	xbj46Jp94xT/QT+Q5ufCeAo68w9qLwVJ5Uk6RFGpjuPjMk0wLz1SsaMzOl9p59tDf5R0R0H88lGRV
	u6oRz9k7RJ5xtyiRyeoN/zgKEb6WDYDogl7idS07fvtvruxmq2fIfxqrRkSEo4k/H2UhW3gdDju68
	+//gSW55ltnhksMQSCwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXMP-00000000XjY-1bgy;
	Thu, 29 Jan 2026 19:07:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXMM-00000000XjC-2hZP
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 19:07:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2B1CF4E42325;
	Thu, 29 Jan 2026 19:07:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB61960746;
	Thu, 29 Jan 2026 19:07:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1F4C119A880F;
	Thu, 29 Jan 2026 20:07:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769713634; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fcAwqBDdQkFXqd6/5h4Qc6cmwL5RaborgdhAPBGEaac=;
	b=sRC1tpxSzPdy6tXRzw4JHmqsNxVKuflNAaWaZRuSVqdrS093/DeT84hpfmsd7Xf2DlDsZP
	W19Q+tdHmO8AERGZRPBsVlKiUYdluQgU36B9EA917UnEjgJcxLJMg9+iZkCYe/yCuKTEWm
	DJcrDB0HUlwDkjvBAhz0SKyrLT0YQg7LaL+pleoTEtZx07cHviws3JodxVUUzJBA24ZsyC
	Iu2KqW81C1eE2FONADlUWUa1kWpz+XANkeCOz6WGsvg2rgnss+blGbn8QaHBWEVb/in80E
	tHjE2aujbhAKzLU6jNFr9FHC1v1RvojesmaBRSfvLlvEWMTueZTclYLiRaliJQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andrea Scian via B4 Relay <devnull+andrea.scian.dave.eu@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  andrea.scian@dave.eu,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Amit Kumar <amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v2 1/2] mtd: rawnand: pl353: Fix software ECC support
In-Reply-To: <20260126-pl353-soft-ecc-support-v2-1-fcd74b6e955f@dave.eu>
	(Andrea Scian via's message of "Mon, 26 Jan 2026 17:58:55 +0100")
References: <20260126-pl353-soft-ecc-support-v2-0-fcd74b6e955f@dave.eu>
	<20260126-pl353-soft-ecc-support-v2-1-fcd74b6e955f@dave.eu>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 29 Jan 2026 20:07:10 +0100
Message-ID: <874io4kzkx.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_110718_817662_8435AF7C 
X-CRM114-Status: GOOD (  13.27  )
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

SGVsbG8gQW5kcmVhLAoKT24gMjYvMDEvMjAyNiBhdCAxNzo1ODo1NSArMDEsIEFuZHJlYSBTY2lh
biB2aWEgQjQgUmVsYXkgPGRldm51bGwrYW5kcmVhLnNjaWFuLmRhdmUuZXVAa2VybmVsLm9yZz4g
d3JvdGU6Cgo+IEZyb206IEFuZHJlYSBTY2lhbiA8YW5kcmVhLnNjaWFuQGRhdmUuZXU+Cj4KPiBX
ZSBuZWVkIHRvIHNldCBhbm90aGVyIGNvdXBsZSBvZiBmaWVsZHMgaW4gZWNjIHN0cnVjdHVyZSB0
byBhbGxvdwo+IGNob29zaW5nIFNXIEVDQyBpbnN0ZWFkIG9mIEhXIG9uZSwgb3RoZXJ3aXNlIHdy
aXRlIG9wZXJhdGlvbiBmYWlsLgoKSSdtIG5vdCBzdXJlIEkgY2FwdHVyZWQgaW4gb3VyIHByZXZp
b3VzIGV4Y2hhbmdlcyB0aGF0IHlvdSB3ZXJlIHRlc3RpbmcKd2l0aCBTVyBFQ0MuCgo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJlYSBTY2lhbiA8YW5kcmVhLnNjaWFuQGRhdmUuZXU+Cj4gLS0tCj4gIGRy
aXZlcnMvbXRkL25hbmQvcmF3L3BsMzV4LW5hbmQtY29udHJvbGxlci5jIHwgMiArKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvcGwzNXgtbmFuZC1jb250cm9sbGVyLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9w
bDM1eC1uYW5kLWNvbnRyb2xsZXIuYwo+IGluZGV4IDExYmQ5MGUzZjE4Y2IuLmZjYjYyYjllYzk0
N2IgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcGwzNXgtbmFuZC1jb250cm9s
bGVyLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9wbDM1eC1uYW5kLWNvbnRyb2xsZXIu
Ywo+IEBAIC05NzYsNiArOTc2LDggQEAgc3RhdGljIGludCBwbDM1eF9uYW5kX2F0dGFjaF9jaGlw
KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gIAkJZmFsbHRocm91Z2g7Cj4gIAljYXNlIE5BTkRf
RUNDX0VOR0lORV9UWVBFX05PTkU6Cj4gIAljYXNlIE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQ6
Cj4gKwkJY2hpcC0+ZWNjLmFsZ28gPSBOQU5EX0VDQ19BTEdPX0hBTU1JTkc7CgpUaGlzIGlzIHVu
Zm9ydHVuYXRlbHkgbm90IHJlbGV2YW50IGhlcmUuIEluIHNvZnR3YXJlIHlvdSBjYW4gdXNlCndo
YXRldmVyIGFsZ29yaXRobSB5b3Ugd2FudC4gSXQgaXMgd3JpdGVhYmxlIGluIERUIGFuZCBzaG91
bGQgbm90IGJlCmhhcmRjb2RlZCBoZXJlLiBUaGUgb25seSBsaW1pdCBpcyB0aGUgYXZhaWxhYmxl
IE9PQiBhcmVhIGZvciB0aGUKc3RyZW5ndGggKGRlcGVuZGluZyBvbiB0aGUgTkFORCBnZW9tZXRy
eSkuCgo+ICsJCWNoaXAtPmVjYy53cml0ZV9wYWdlX3JhdyA9IG5hbmRfbW9ub2xpdGhpY193cml0
ZV9wYWdlX3JhdzsKClRoaXMsIGhvd2V2ZXIsIHNlZW1zIHJlbGV2YW50IGFuZCBzaG91bGQgYmUg
dGhlIG9uZWxpbmVyIQoKUGxlYXNlIGFkZCBDYzogc3RhYmxlICYgRml4ZXMgdGFncyB0byB5b3Vy
IHYzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
