Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41155C47074
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Jan 2024 12:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dmnB3+bmeKAKGoCAcjsdBjQ1h0a72JbhUBHMXeSPYuU=; b=ic8V7h/QjcaSR90PE8ZnNjdKoX
	WDwLbcu1ooie2dQrfD7S2UgUA3ekdqGT8gnxwm/56j/WTgerbMGvwdWW94QZ9+3ev6RFw6rfvCqpo
	bOQttyonr42y0m02xDktZaHCCdqn3NKfI95ih1RxKMO/yuzhSi23CgeyRB1NHhZgOHhiVar02nSnM
	5kdkhW1eXpKvQ6Pw/duMtfGlKeTIK58NX1HjCFKANFqklVLK7xOxlFY2b8Hz5fdvXYeqrAWG2Jp11
	lDS26syAWqQHJOHxTdrnXR6VdRJnz4nteUzlwJLrOeb8/StpeUUoCQpjX+Y6+q+ri+5Z9PGNVmzZ6
	43+33iPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMSgJ-0032pf-2x;
	Sun, 07 Jan 2024 12:55:11 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMSgH-0032oz-1F
	for linux-mtd@lists.infradead.org;
	Sun, 07 Jan 2024 12:55:11 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EECEC64103E1;
	Sun,  7 Jan 2024 13:54:56 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 9EJQji6biAYo; Sun,  7 Jan 2024 13:54:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6970C64103EC;
	Sun,  7 Jan 2024 13:54:56 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Jla9XxQbNqpQ; Sun,  7 Jan 2024 13:54:56 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4AB3764103E1;
	Sun,  7 Jan 2024 13:54:56 +0100 (CET)
Date: Sun, 7 Jan 2024 13:54:56 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Mauri Sandberg <maukka@ext.kapsi.fi>
Cc: david oberhollenzer <david.oberhollenzer@sigma-star.at>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1131962034.206205.1704632096123.JavaMail.zimbra@nod.at>
In-Reply-To: <bab7fbe2-384e-4a52-92a6-2aabc9f69dbc@ext.kapsi.fi>
References: <20231229135653.4764-1-maukka@ext.kapsi.fi> <fbce5a93-c3b8-45f4-9698-c76838ac5fea@ext.kapsi.fi> <1214686551.202632.1704536161145.JavaMail.zimbra@nod.at> <022816c4-7afd-4bd9-80a7-6bd5e9e0edd0@ext.kapsi.fi> <1464457733.203332.1704554608470.JavaMail.zimbra@nod.at> <bab7fbe2-384e-4a52-92a6-2aabc9f69dbc@ext.kapsi.fi>
Subject: Re: [PATCH] mkfs.ubifs: Add option to minimize the amount of LEBs
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: mkfs.ubifs: Add option to minimize the amount of LEBs
Thread-Index: yqmwwBsXC5Gd3vD4Uqq1nYqcnLOCtQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_045509_605106_934F25F2 
X-CRM114-Status: UNSURE (   5.03  )
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
bWF1a2thQGV4dC5rYXBzaS5maT4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4KPiBD
QzogIk1hdXJpIFNhbmRiZXJnIiA8bWF1a2thQGV4dC5rYXBzaS5maT4sICJkYXZpZCBvYmVyaG9s
bGVuemVyIiA8ZGF2aWQub2JlcmhvbGxlbnplckBzaWdtYS1zdGFyLmF0PiwgImxpbnV4LW10ZCIK
PiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+Cj4gR2VzZW5kZXQ6IFNvbm50YWcsIDcu
IEphbnVhciAyMDI0IDA4OjUzOjA1Cj4gQmV0cmVmZjogUmU6IFtQQVRDSF0gbWtmcy51Ymlmczog
QWRkIG9wdGlvbiB0byBtaW5pbWl6ZSB0aGUgYW1vdW50IG9mIExFQnMKCj4gT24gNi4xLjIwMjQg
MTcuMjMsIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToKPj4gSG0sIEkgZ2F2ZSB5b3VyIHBhdGNo
IGEgdHJ5LiBBcyBzb29uIEkgdXNlICItTSIsIHRoZSByZXN1bHRpbmcgZmlsZSBzeXN0ZW0KPj4g
ZG9lcyBub3QgbW91bnQuIE5vIG1hdHRlciBob3cgbGFyZ2UgdGhlIFVCSSB2b2x1bWUgaXMuCj4g
Cj4gWW91IGFyZSBtb3N0IGNvcnJlY3QgaGVyZSwgaXQgZG9lcyBub3QgbW91bnQgbmljZWx5IHdp
dGggdGhlICctTScuIE9uCj4gdGhlIG90aGVyIGhhbmQgdGhlIG1pbmltYWwgZmlsZXN5c3RlbSBw
cm9kdWNlZCB3aXRoLCBzYXksICctYyBYWCBhbmQgLWwKPiAyJyBkb2VzIG1vdW50IG5pY2VseSBh
cyBydyB0b28uIFNvIGluIHRoZW9yeSB0aGlzIGNvdWxkIHdvcmssIHRoZQo+IHNvbHV0aW9uIGp1
c3Qgd2FzIG5vdCB0aGF0IHNpbXBsZS4KCkh1aD8gSSBhc3N1bWVkIHRoZSBwYXRjaCB5b3Ugc2Vu
dCBhY3R1YWxseSB3b3Jrcy4gQXQgbGVhc3QgZm9yIHlvdXIgdXNlIGNhc2UuLi4KUGxlYXNlIGRv
bid0IHNlbmQgdW50ZXN0ZWQgbWF0ZXJpYWwuIAoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
