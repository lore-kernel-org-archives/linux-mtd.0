Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9806BC54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4JkNFSHyw3zOvagUh9AqEModtoXO9S4MfkZ5ypjvJA=; b=AuOPTpKBHoi5qc
	QW6sUl1XfO6/Mj6rjk/GrgTydn1B7znJhXTlGfN8/btRcUnWb8RMGfzaJLwiFENwtXDby9WsdIlvu
	5Kt1JhzcxI+9pp7PtYEjNOQ/A+0oMBFzScoCjHaxI8TnH4EA3b1kmk0nZJY2nF8lPjjmrky11pUwd
	VOm5aViqtfCHurfqNEJaTWhimFu6mvIHKNuhOEPATpJrPe7gBRDq6DTPKJM3jGHuFalr/f1288o7X
	vg2Sd4+SA5LUplqF+UqShBgxPu50DY7PVgnmgjEjnyscu61aToIfn5+hla/kIPJUV5F831ylRjz5b
	Ul6AUuJA00szIx/SoXYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYKz-001dJp-6x; Tue, 20 Sep 2022 08:10:37 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYKt-001dHL-8M
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:10:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7A2E34001E;
	Tue, 20 Sep 2022 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZTRGNviQHFqWuM3ffV1RWQ7rlvrVGJjSIWFr0QbELOo=;
	b=HbOYFV1wqgSj5sIyE9m9/t0E8rf1loYpPmRpkmrjCvbPAfdYFaCNaLfG8ribybz+fjM4BW
	hTLhDRFal7T8FAl3ffPfdFpb7vnVQB1sWb2U+Ajnqfo64hfNOPCeo6WqYSNfZxYgI592fS
	LBUz7Ghe5xPXgRfGx25BJgPzRhzh03TWcZ2urJXIZmeU109P0PCT9m7mvikFrcCJR4esor
	BY+IROz2U6ZUanEoRPIhNPv48T9/h4ifXEohDwzYT3wUdAxbIQhesK6BJCvqA0pw5gWtl5
	vKfVPKsNZ7bMuc7uvbJDvySv40QrktwNCCg9F1lmwoo0/vYwYwJ05wEurUH0Mw==
Date: Tue, 20 Sep 2022 10:10:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <novikov@ispras.ru>,
 <vasilyev@ispras.ru>, <kirill.shilimanov@huawei.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: intel: Remove macro that is already
 defined in the core
Message-ID: <20220920101022.7bfa5304@xps-13>
In-Reply-To: <20220801025740.47191-1-tudor.ambarus@microchip.com>
References: <20220801025740.47191-1-tudor.ambarus@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011035_037547_5BDA6FB4 
X-CRM114-Status: GOOD (  13.49  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20gd3JvdGUgb24gTW9uLCAxIEF1
ZyAyMDIyIDA1OjU3OjQwICswMzAwOgoKPiBOQU5EX0RBVEFfSUZBQ0VfQ0hFQ0tfT05MWSBpcyBh
bHJlYWR5IGRlZmluZWQgaW4KPiBpbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmguIFRoZSBpbnRl
bCBkcml2ZXIgaW5jbHVkZXMKPiA8bGludXgvbXRkL3Jhd25hbmQuaD4sIHNvIHJlbW92ZSB0aGUg
ZHVwbGljYXRlIGRlZmluaXRpb24gZnJvbSB0aGUgaW50ZWwKPiBkcml2ZXIuCj4gCj4gU2lnbmVk
LW9mZi1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRlbC1uYW5kLWNvbnRyb2xsZXIuYyB8IDIgLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L2ludGVsLW5hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvaW50ZWwtbmFuZC1jb250cm9sbGVyLmMKPiBpbmRleCA3YzFjODBkYWU4MjYuLmZiZjY3
MzE0MjBkNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRlbC1uYW5kLWNv
bnRyb2xsZXIuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ludGVsLW5hbmQtY29udHJv
bGxlci5jCj4gQEAgLTk5LDggKzk5LDYgQEAKPiAgCj4gICNkZWZpbmUgSFNOQU5EX0VDQ19PRkZT
RVQJMHgwMDgKPiAgCj4gLSNkZWZpbmUgTkFORF9EQVRBX0lGQUNFX0NIRUNLX09OTFkJLTEKPiAt
Cj4gICNkZWZpbmUgTUFYX0NTCTIKPiAgCj4gICNkZWZpbmUgVVNFQ19QRVJfU0VDCTEwMDAwMDBM
CgpBY3R1YWxseSBJIGFscmVhZHkgcmVjZWl2ZWQgYSBzZXJpZXMgd2hpY2ggY29udGFpbnMgYSBw
YXRjaCBkb2luZwpleGFjdGx5IHRoYXQuIEJ1dCB0aGFua3MgYW55d2F5IDotKQoKQ2hlZXJzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
