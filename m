Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EBFC46CD2
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Jan 2024 10:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=glT5FnzBTd7vq4kLkvMkp4OVZVUVamcvVJrGKed0o5k=; b=aa00Y4iGlb1BXbKp6rB/b2lvec
	5tEla+Jc7NC6lSsMu/mZptiEpnZa5cjvK2P9HmV9QbVHuYcFaxs63qY6o5h2NBnRZ+OlaFRIeKziE
	F35PXOmhzop9n7HNumKxZACb5FebKpdwe24ojJpbBskDy7MaC9bmcoapbA+NN/pKnHwHOzUyy6cf6
	cIUSsRyk62+tOFNE5e+ZK7o4zaOcFVHkCMhEnnJqVWZnHTLrYzIqM7ccsBpNMSwvUQf6YY03f/kNm
	n/9Npch8WgK37uiJl+OZeEmYO8cmiDaFBcyczApcWVUAB1OyvWpLHLZyw0R6Tr0RYpfOqaGj0Uzzt
	2UM+6iaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rM3iz-0010ns-0w;
	Sat, 06 Jan 2024 10:16:17 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rM3iw-0010mO-1l
	for linux-mtd@lists.infradead.org;
	Sat, 06 Jan 2024 10:16:16 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5A9B164103EA;
	Sat,  6 Jan 2024 11:16:02 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id BzIrOH74C1Tt; Sat,  6 Jan 2024 11:16:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C927264103EB;
	Sat,  6 Jan 2024 11:16:01 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0-mkODJxtc8M; Sat,  6 Jan 2024 11:16:01 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6D1E264103EA;
	Sat,  6 Jan 2024 11:16:01 +0100 (CET)
Date: Sat, 6 Jan 2024 11:16:01 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Mauri Sandberg <maukka@ext.kapsi.fi>
Cc: david oberhollenzer <david.oberhollenzer@sigma-star.at>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1214686551.202632.1704536161145.JavaMail.zimbra@nod.at>
In-Reply-To: <fbce5a93-c3b8-45f4-9698-c76838ac5fea@ext.kapsi.fi>
References: <20231229135653.4764-1-maukka@ext.kapsi.fi> <fbce5a93-c3b8-45f4-9698-c76838ac5fea@ext.kapsi.fi>
Subject: Re: [PATCH] mkfs.ubifs: Add option to minimize the amount of LEBs
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: mkfs.ubifs: Add option to minimize the amount of LEBs
Thread-Index: bxKH/eZ/NN0OI8aTSqxbHfoYI9swVw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240106_021614_761428_D0B15A89 
X-CRM114-Status: UNSURE (   5.94  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1hdXJpIFNhbmRiZXJnIiA8
bWF1a2thQGV4dC5rYXBzaS5maT4KPj4gVXNlIGNhc2UgZm9yIHRoZSBuZXcgb3B0aW9uIHdvdWxk
IGJlIHdoZW4geW91IHdhbnQgdG8gaGF2ZSBhCj4+IG5vbi1tdXRhYmxlIGZpbGVzeXN0ZW0gaW4g
YSBzdGF0aWMgdWJpZnMgdm9sdW1lIGFuZCBhbm90aGVyCj4+IHZvbHVtZSBmb3Igd3JpdGFibGUg
ZGF0YS4KPj4gCj4+IEN1cnJlbnRseSB5b3UgY2FuIGZpbmQgdGhlIG1pbmltYWwgTEVCIGNvdW50
IGJ5IHJ1bm5pbmcgdGhlCj4+IG1rZnMudWJpZnMgb25jZSB3aXRoIHRvbyBzbWFsbCBtYXhfbGVi
X2NudC4gVGhpcyBwYXRjaCB1c2VzCj4+IHRoZSBhbHJlYWR5IGNhbGN1bGF0ZWQgbWluaW1hbCBh
bW91bnQgb2YgTEVCcyBhcyB0aGUgbWF4X2xlYl9jbnQKPj4gYW5kIHRoZW4gcHJvY2VlZHMgdG8g
Y3JlYXRlIHRoZSBpbWFnZSBhcyB1c3VhbC4KClsuLi5dCgo+IEZyaWVuZGx5IHBpbmcuIEFsc28g
YnJpbmdpbmcgaW4gUmljaGFyZCBhbmQgRGF2aWQgYXMgSSB0aG91Z2h0IGF0IGxlYXN0Cj4gdGhl
eSBjb3VsZCBiZSByZWxldmFudCBtYWludGFpbmVycy4gVGhhbmtzLgoKU2VlbXMgbGlrZSBhIGxl
Z2l0IGZlYXR1cmUuIEJ1dCB3aGF0IHdpbGwgaGFwcGVuIGlmIHNvbWVib2R5IHRyaWVzIHRvCnVz
ZSBhIG1pbmltaXplZCBVQklGUyBpbiBydy1tb2RlPwpJIGZlYXIgdGhlbiBVQklGUyB3aWxsIGZh
aWwgYmVjYXVzZSBpdCBoYXMgbm90IGVub3VnaCBsb2cgTEVCcyBvciBzdWNoPwoKVGhhbmtzLAov
L3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
