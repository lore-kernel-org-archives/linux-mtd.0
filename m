Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4988ECDB46B
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jun 2026 07:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rm/JkQOJuf8fH+XNiMDyj5N0gdAY1s7IMvDygJM07jg=; b=mHot/B6xj2QW3k
	Jawl+ba3uiIohxt3KX91XG/8p+oxiopkydiNrNvT1LbHENqim3IoI76r051SRvcMCOS/08PME1Gpo
	X1j2UCLWQZAALgUDLZXJm/RTuZ4EbmkyzI7AopBBRBUQtRJUtiq+43ITtTSTg4Z7pJDU55WsqBUk6
	UWAe7FPKpRk7x2+TBBU1Ip8eVUPgsWwkpn4kDxFF/DQnz4eRksf/igYOfFaZzki7v+n6inqx6LXp3
	nE/WTo1xzEUox5P8CBlS3dx7oKemQBwGV0/ROW5sSdZx3H5VaSDHm9GbPLegnMEN9+vGV86ZinpLK
	9gr+YK3LPauo5hljZ+WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZ9K-00000004XoU-3wxZ;
	Mon, 22 Jun 2026 07:32:54 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZ9H-00000004Xo5-2t98
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jun 2026 07:32:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B06B2C62208;
	Mon, 22 Jun 2026 07:32:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CCB9601BB;
	Mon, 22 Jun 2026 07:32:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1112F106C898A;
	Mon, 22 Jun 2026 09:32:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782113568; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F1WzrJAQoi06uIZ3fIKeNj1JU/5aZLhBz05F4gML+eo=;
	b=lK25WbJfW41zUnB34avBqSf+9NXYnwgLTQC0ZTcbS9SaYEFGk3hwIgsmPy6qD4mbR1aNJ9
	W6dkiQeymFtT31dC06rtuxCRaTzB5DGb7gBhr7c4YaXCLsxvQpO9O/i9Eod1XTv6/XMqZn
	ZDatIXDlJa7CdO0Rggrp8G7bO1U+WS4q0HbyAozFlcu0u0HJbSmHuaj6QuTY7ExMYzOel0
	IKo4bIGoZMiKWaoH946F5VDHMWiQF1gXBjyPyfbQHqE0RaJpup4GJ/WpUUWVATXbbeBLC8
	7PvP4E81Osl8ggtteXB6QUOmju2CWUoNOnqPGpDg+DJqUOeDWzfOAmza8zQJ8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Dan Carpenter" <error27@gmail.com>,  "Harshit Mogalapalli"
 <harshit.m.mogalapalli@oracle.com>,  "Richard Weinberger"
 <richard@nod.at>,  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Amit Kumar
 Mahapatra" <amit.kumar-mahapatra@amd.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] mtd: virt_concat: fix use-after-free in
 mtd_virt_concat_destroy_joins()
In-Reply-To: <DJARC89F2VJR.1EDEQ27GSDAK6@bootlin.com> (Luca Ceresoli's message
	of "Tue, 16 Jun 2026 22:31:28 +0200")
References: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
	<DJADQJ8GEDNF.334T2EXRX7DXJ@bootlin.com>
	<ajEhuS8xwcX1AA_I@stanley.mountain>
	<DJARC89F2VJR.1EDEQ27GSDAK6@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 22 Jun 2026 09:32:43 +0200
Message-ID: <874iiv3u90.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_003251_931663_40C6C736 
X-CRM114-Status: GOOD (  10.73  )
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

T24gMTYvMDYvMjAyNiBhdCAyMjozMToyOCArMDIsICJMdWNhIENlcmVzb2xpIiA8bHVjYS5jZXJl
c29saUBib290bGluLmNvbT4gd3JvdGU6Cgo+IE9uIFR1ZSBKdW4gMTYsIDIwMjYgYXQgMTI6MTMg
UE0gQ0VTVCwgRGFuIENhcnBlbnRlciB3cm90ZToKPj4gT24gVHVlLCBKdW4gMTYsIDIwMjYgYXQg
MTE6NTE6NTNBTSArMDIwMCwgTHVjYSBDZXJlc29saSB3cm90ZToKClllcywgY29udGFpbmVyX29m
KCkgZm9yIGlzc3VlIDEgc2VlbXMgdG8gYmUgYSBiZXR0ZXIgYXBwcm9hY2guCgo+Pj4gSXNzdWUg
MjogaW4gbXRkX3ZpcnRfY29uY2F0X2Rlc3Ryb3lfam9pbnMoKToKPj4+Cj4+PiAJbGlzdF9mb3Jf
ZWFjaF9lbnRyeV9zYWZlKGl0ZW0sIHRtcCwgJmNvbmNhdF9ub2RlX2xpc3QsIGhlYWQpIHsKPj4+
IAkJbXRkID0gJml0ZW0tPmNvbmNhdC0+bXRkOyBbMF0KPj4+IAkJaWYgKGl0ZW0tPmNvbmNhdCkg
eyBbMV0KPj4+Cj4+PiBBdCBsaW5lIFswXSB3ZSBkZXJlZmVyZW5jZSBpdGVtLT5jb25jYXQsIGJ1
dCBhdCBsaW5lIFsxXSB3ZSBhcHBhcmVudGx5Cj4+PiBoYW5kbGUgdGhlIGNhc2Ugd2hlcmUgaXRl
bS0+Y29uY2F0IGNhbiBiZSBOVUxMLiBFaXRoZXIgWzFdIGlzIGFsd2F5cyB0cnVlCj4+PiBhbmQg
d2UgY2FuIHJlbW92ZSB0aGUgaWYoKSwgb3IgWzFdIGNhbiBiZSBmYWxzZSwgc28gWzBdIGlzIGEg
YnVnIGFuZCBzaG91bGQKPj4+IHByb2JhYmx5IGJlIG1vdmVkIHRvIGluc2lkZSB0aGUgaWYoKS4K
Pj4KPj4gVGhhdCdzIG5vdCBhIGRlcmVmZXJlbmNlIG9uIGxpbmUgMCwgaXQncyBwb2ludGVyIG1h
dGguICBTbyB0aGUgY29kZQo+PiB3b3Jrcy4gIEJ1dCBhIGxvdCBvZiBwZW9wbGUgZmluZCB0aGUg
ZGlzdGluY3Rpb24gY29uZnVzaW5nLgo+Cj4gQWgsIGluZGVlZCwgeW91IGFyZSByaWdodCBvbiBi
b3RoIGFzcGVjdHM6IGl0J3MganVzdCBwb2ludGVyIG1hdGggKG5vdCBhCj4gYnVnKSArIGl0IGlz
IGNvbmZ1c2luZyBjb2RlLgo+Cj4gU28gbW92aW5nIFswXSBpbnNpZGUgdGhlIGlmKCkgd291bGQg
YmUgYSByZWFkYWJpbGl0eSBpbXByb3ZlbWVudCBJTU8sIGJ1dAo+IGRlZmluaXRlbHkgbm90IGEg
YnVnZml4LgoKWWVzIQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
