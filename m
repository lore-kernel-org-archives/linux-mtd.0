Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A4BC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 16:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/wntfmDtrE7KzgCYGM+4CWlgRxC+vFDmZ70kbqvPLIU=; b=2RxXgImRmz7His
	bM06UApRa8HKw2Nj0x5dAE02jn2OeBq9leHJtpGKXYJoyc4uSXGZEM5R4RS21/8i1k5S/4wvqZrW3
	2ox+hNkeB2kB69TUwZLBzSU4YYCZEKR9HRU+DW5ilbHYw3URz+7y/5x3MayyVXkBXRmjtzkKwjgBq
	QIsBNb2jonkPDqNs33xAN/Fd/W5XwoIaxgU7LXW+zIDheVEG9XjFWRbFhNr8bcDmPtLC193L9OGLs
	5uyraCNr0KioQeTEq4829eoaapEFHI+M3UE4KPtNyopth/K3byPmbtN3gMFi/txfIEeE8Q6KcVpMh
	FyJoXWoX88gdLQZaiasg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvMgV-00Gmvk-36; Thu, 09 Dec 2021 16:54:19 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvMgR-00GmuO-0R
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 16:54:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 61B9F20000D;
 Thu,  9 Dec 2021 16:54:10 +0000 (UTC)
Date: Thu, 9 Dec 2021 17:54:09 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yihao Han <hanyihao@vivo.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@vivo.com
Subject: Re: [PATCH] mtd: nand: fix boolreturn.cocci warning
Message-ID: <20211209175409.7260f5f9@xps13>
In-Reply-To: <20211206121531.31808-1-hanyihao@vivo.com>
References: <20211206121531.31808-1-hanyihao@vivo.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_085415_215366_229DF29C 
X-CRM114-Status: GOOD (  16.59  )
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

SGkgWWloYW8sCgpoYW55aWhhb0B2aXZvLmNvbSB3cm90ZSBvbiBNb24sICA2IERlYyAyMDIxIDA0
OjE1OjMwIC0wODAwOgoKPiAuL2RyaXZlcnMvbXRkL25hbmQvY29yZS5jOjI1OjktMTA6IFdBUk5J
Tkc6IHJldHVybiBvZiAwLzEgaW4KPiBmdW5jdGlvbiAnbmFuZGRldl9pc2JhZCcgd2l0aCByZXR1
cm4gdHlwZSBib29sCj4gCj4gUmV0dXJuIHN0YXRlbWVudHMgaW4gZnVuY3Rpb25zIHJldHVybmlu
ZyBib29sIHNob3VsZCB1c2UgdHJ1ZS9mYWxzZQo+IGluc3RlYWQgb2YgMS8wLgoKVGhpcyBpcyAt
bmV4dCBtYXRlcmlhbCwgSSB3YW50IHRvIGhhdmUgYSBjbGVhbiBicmFuY2ggdGhlcmUgc28gSQph
cHBsaWVkIHRoaXMgY2hhbmdlIGlubGluZSwgSSBob3BlIHlvdSBkb24ndCBtaW5kLgoKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBZaWhhbyBIYW4gPGhhbnlpaGFvQHZpdm8uY29tPgo+IC0tLQo+ICBkcml2
ZXJzL210ZC9uYW5kL2NvcmUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvY29y
ZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9jb3JlLmMKPiBpbmRleCAzM2M3Nzg4ZDc2YzIuLjQxNjk0
N2YyOGI2NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL2NvcmUuYwo+ICsrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvY29yZS5jCj4gQEAgLTIyLDcgKzIyLDcgQEAKPiAgYm9vbCBuYW5kZGV2
X2lzYmFkKHN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCwgY29uc3Qgc3RydWN0IG5hbmRfcG9zICpw
b3MpCj4gIHsKPiAgCWlmIChXQVJOX09OQ0UobXRkX2V4cGVydF9hbmFseXNpc19tb2RlLCBtdGRf
ZXhwZXJ0X2FuYWx5c2lzX3dhcm5pbmcpKQo+IC0JCXJldHVybiAwOwo+ICsJCXJldHVybiBmYWxz
ZTsKPiAgCj4gIAlpZiAobmFuZGRldl9iYnRfaXNfaW5pdGlhbGl6ZWQobmFuZCkpIHsKPiAgCQl1
bnNpZ25lZCBpbnQgZW50cnk7CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
