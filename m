Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5987EEB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 11:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wfxbc1BkSQBDESjS42h8D6iTANTHWY7CuTZoWmvVULE=; b=ClJnRG3WWT1PjaU7enUTssLTRV
	C2jTJUlJEkxpTfNQ4i3KvayftzPIuMJrfTAyzU62Aq/cRb6ac4U2hV3tmqcZS8mjK/RK1HToQONUe
	P47lKI9jHVn5UfKye5foRk7wrKJxK9JOL/LDA5FkUVoxISYJsoa54Z9w1GYR295NCDPSRrFV/+99D
	C5yhdsvkOjpiT2pkUuKK7P58NriW7n+h3d7ycXY6BXaoHCl1Jz2AIFMRLhKzC/8hcqhYT+rtLy8iO
	0+2/VMa9giHNQ6NntdnyL1ycgT4rFAdu50+vCjK5F3sizQcEgeiDB4BnGl0eGFy9gUuzTiDGzyHIO
	1KDP+Ubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLM0g-003o9p-1R;
	Mon, 17 Jul 2023 11:03:23 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLM0Z-003o87-14
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 11:03:17 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 26144634203B;
	Mon, 17 Jul 2023 13:03:10 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id fG7YnavCyVgh; Mon, 17 Jul 2023 13:03:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id AB868634203A;
	Mon, 17 Jul 2023 13:03:09 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id B_LkhE8nHIJf; Mon, 17 Jul 2023 13:03:09 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 829A66342026;
	Mon, 17 Jul 2023 13:03:09 +0200 (CEST)
Date: Mon, 17 Jul 2023 13:03:09 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Stephan Wurm <stephan.wurm@a-eberle.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Johannes Eigner <johannes.eigner@a-eberle.de>
Message-ID: <260741266.3681.1689591789332.JavaMail.zimbra@nod.at>
In-Reply-To: <ZLUXruUkYMrPK+GQ@PC-LX-Wurm>
References: <ZLT2qEYjaWgSpRD6@PC-LX-Wurm> <736980270.3262.1689586950735.JavaMail.zimbra@nod.at> <ZLUXruUkYMrPK+GQ@PC-LX-Wurm>
Subject: Re: ubiblock: null pointer dereference using scatterlist in
 work_queue
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubiblock: null pointer dereference using scatterlist in work_queue
Thread-Index: ss6EAmPjKXAVOTJ0bHjviSj8oPd3/Q==
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

U3RlcGhhbiwKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJTdGVwaGFu
IFd1cm0iIDxzdGVwaGFuLnd1cm1AYS1lYmVybGUuZGU+Cj4+IFNvIHJlYWRpbmcgZnJvbSB1Ymli
bG9jayB3b3JrcyBhcyBsb25nIHlvdSBkb24ndCBhY2Nlc3MgaXQgdmlhIGRtLXZlcml0eT8KPj4g
SG93IGFib3V0IG90aGVyIHN0YWNrZWQgZGV2aWNlcyBzdWNoIGFzIGRtY3J5cHQ/Cj4gCj4gV2Ug
ZGlkIG5vdCBjaGVjayBvdGhlciBzdGFja2VkIGRldmljZXMsIGJ1dCB3ZSdsbCBnaXZlIHRoaXMg
YSB0cnkuCgpQbGVhc2UgYXBwbHkgdGhpcyBwYXRjaCB0b286CgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvdWJpL2Jsb2NrLmMgYi9kcml2ZXJzL210ZC91YmkvYmxvY2suYwppbmRleCA3NWVhZWNj
ODYzOWYwLi43OTVlMmQwZjYxMDg2IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC91YmkvYmxvY2su
YworKysgYi9kcml2ZXJzL210ZC91YmkvYmxvY2suYwpAQCAtMzA0LDcgKzMwNCw3IEBAIHN0YXRp
YyB2b2lkIHViaWJsb2NrX2RvX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogICAgICAg
ICAqIHRoZSBudW1iZXIgb2Ygc2cgZW50cmllcyBpcyBsaW1pdGVkIHRvIFVCSV9NQVhfU0dfQ09V
TlQKICAgICAgICAgKiBhbmQgdWJpX3JlYWRfc2coKSB3aWxsIGNoZWNrIHRoYXQgbGltaXQuCiAg
ICAgICAgICovCi0gICAgICAgYmxrX3JxX21hcF9zZyhyZXEtPnEsIHJlcSwgcGR1LT51c2dsLnNn
KTsKKyAgICAgICB1YmlfYXNzZXJ0KGJsa19ycV9tYXBfc2cocmVxLT5xLCByZXEsIHBkdS0+dXNn
bC5zZykgPiAwKTsKIAogICAgICAgIHJldCA9IHViaWJsb2NrX3JlYWQocGR1KTsKIAoKSSBmZWFy
IHRoZSBhc3NlcnQgd2lsbCBmYWlsLiBCdXQgbGV0J3Mgc2VlLiA6LUQKQXQgbGVhc3QgaXQgd291
bGQgZXhwbGFpbiB0aGUgTlVMTCBkZXJlZi4KIAo+PiBEaWQgeW91IHByaW50IHRoZSBMRUIgbnVt
YmVyLCByZWFkIGxlbmd0aCBhbmQgb2Zmc2V0IGluIHViaWJsb2NrX3JlYWQoKT8KPj4gTWF5YmUg
dGhlcmUgaXMgYSBidWcgcmVsYXRlZCB0byBzZXR0aW5nIHVwIHRoZSBjb3JyZWN0IGRldmljZSBn
ZW9tZXRyeQo+PiBhbmQgdGhlIHJlYWQgcmVxdWVzdCBpcyBvZmYuCj4gSGVyZSBpcyBzb21lIGV4
Y2VycHQgZnJvbSBhbm90aGVyIHRyeSB3aXRoIEtBU0FOIGVuYWJsZWQgYW5kIGZ1bGwgZGVidWcg
b3V0cHV0OgoKSG0sIHdlIGFyZSB3aXRoaW4gYm91bmRzLiBBbmQgbG9va3MgbGlrZSBvdGhlciBy
ZWFkcyB3b3JrZWQuCgo+ICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAgWyAgMjkzLjM0MzY3NV0gQlVHOiBLQVNBTjog
bnVsbC1wdHItZGVyZWYgaW4gdWJpX2lvX3JlYWQrMHgxZDQvMHg0NmMKPiAgWyAgMjkzLjM0OTgy
Ml0gUmVhZCBvZiBzaXplIDEgYXQgYWRkciAwMDAwMDAwMCBieSB0YXNrIGt3b3JrZXIvMDozLzE4
Cj4gIFsgIDI5My4zNTYwMzddCj4gIFsgIDI5My4zNTc1NTFdIENQVTogMCBQSUQ6IDE4IENvbW06
IGt3b3JrZXIvMDozIE5vdCB0YWludGVkIDYuMS4zNiAjMQo+ICBbICAyOTMuMzYzNzc0XSBIYXJk
d2FyZSBuYW1lOiBGcmVlc2NhbGUgaS5NWDYgUXVhZC9EdWFsTGl0ZSAoRGV2aWNlIFRyZWUpCj4g
IFsgIDI5My4zNzAzMzFdIFdvcmtxdWV1ZTogdWJpYmxvY2swXzIgdWJpYmxvY2tfZG9fd29yawo+
ICBbICAyOTMuMzc1MjY5XSAgdW53aW5kX2JhY2t0cmFjZSBmcm9tIHNob3dfc3RhY2srMHgxMC8w
eDE0Cj4gIFsgIDI5My4zODA1NTddICBzaG93X3N0YWNrIGZyb20gZHVtcF9zdGFja19sdmwrMHgz
NC8weDQ4Cj4gIFsgIDI5My4zODU2NjhdICBkdW1wX3N0YWNrX2x2bCBmcm9tIGthc2FuX3JlcG9y
dCsweGI4LzB4ZTgKPiAgWyAgMjkzLjM5MDk1Nl0gIGthc2FuX3JlcG9ydCBmcm9tIHViaV9pb19y
ZWFkKzB4MWQ0LzB4NDZjCj4gIFsgIDI5My4zOTYxNDZdICB1YmlfaW9fcmVhZCBmcm9tIHViaV9l
YmFfcmVhZF9sZWIrMHgzYzQvMHg1Y2MKPiAgWyAgMjkzLjQwMTY4Nl0gIHViaV9lYmFfcmVhZF9s
ZWIgZnJvbSB1YmlfZWJhX3JlYWRfbGViX3NnKzB4ODQvMHgxZjgKPiAgWyAgMjkzLjQwNzgzMV0g
IHViaV9lYmFfcmVhZF9sZWJfc2cgZnJvbSB1YmlfbGViX3JlYWRfc2crMHhiNC8weDExMAoKQ2Fu
IHlvdSBwbGVhc2UgZG91YmxlIGNoZWNrIHdoZXRoZXIgdGhlIHZlcnkgZmlyc3QgY2FsbCB0byB1
YmlfZWJhX3JlYWRfbGViX3NnKCkKZmFpbHMgb3IgYSBsYXRlciBvbmU/CgpUaGFua3MsCi8vcmlj
aGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
