Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B190C369CB
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Apr 2025 07:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Wa0V8YaLrzRkGUHUNsrbBmt7ziriZtnAcI6UV+X63g8=; b=XeuzS4J35g/sSAJC0V7rNj2af/
	4vpZ1Hw2n+CyXIN7yOGwCMUtzN45tMzUcWeF4Y2fKkacSZ30fdzQ/6grrfp0abdW/XHGORt01u5o4
	+nhqCKps1iYyeWvaFTZnJ/4CBAHYnn9ifBHQLJcm9JjMQrp8H9+n4SlhjqE4WAQet9OqQzNy99bC4
	WhMWZFLj3H96Ofdd56O3OWfWXHwC+i1LGw5hrbSD0OR6ppwdOMemKwvi1kwvzU0UwjkZGAcd9I0fv
	S3TCz8i85OMQ0ZC50tbOWgKjE3aU0iR0+XGZpjDWjb4h7VZ8CnDNmRBwwSm8D5zc1Gli4F775BNUh
	5VM7+rJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UcA-00000009XES-2T1c;
	Wed, 23 Apr 2025 07:33:50 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UKJ-00000009TRv-2RTR
	for linux-mtd@lists.infradead.org;
	Wed, 23 Apr 2025 07:15:25 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id CDA28298562;
	Wed, 23 Apr 2025 09:15:10 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id DZHaED16jdEb; Wed, 23 Apr 2025 09:15:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 71C9B298566;
	Wed, 23 Apr 2025 09:15:09 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BBTVQAOqKOEG; Wed, 23 Apr 2025 09:15:09 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 43B6C298562;
	Wed, 23 Apr 2025 09:15:09 +0200 (CEST)
Date: Wed, 23 Apr 2025 09:15:08 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Matthew Wilcox <willy@infradead.org>, 
	regressions <regressions@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Message-ID: <1915007212.329812247.1745392508953.JavaMail.zimbra@nod.at>
In-Reply-To: <20250423065432.GA4811@francesco-nb>
References: <20250408082018.GA23886@francesco-nb> <20250422175409.GA877874@francesco-nb> <aAhAylotNK_zHl0C@gondor.apana.org.au> <20250423065432.GA4811@francesco-nb>
Subject: Re: Linux 6.15-rc1 regression, folio/ubifs Oops
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF136 (Linux)/8.8.12_GA_3809)
Thread-Topic: Linux 6.15-rc1 regression, folio/ubifs Oops
Thread-Index: aSEnPblkZA1AkRc1OuHeR6xBDkS3zw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001523_787447_0455145D 
X-CRM114-Status: UNSURE (   8.41  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkZyYW5jZXNjbyBEb2xjaW5p
IiA8ZnJhbmNlc2NvQGRvbGNpbmkuaXQ+Cj4gQW46ICJIZXJiZXJ0IFh1IiA8aGVyYmVydEBnb25k
b3IuYXBhbmEub3JnLmF1Pgo+IENDOiAiRnJhbmNlc2NvIERvbGNpbmkiIDxmcmFuY2VzY29AZG9s
Y2luaS5pdD4sICJjaGVuZ3poaWhhbzEiIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4sICJyaWNo
YXJkIiA8cmljaGFyZEBub2QuYXQ+LAo+ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5m
cmFkZWFkLm9yZz4sICJNYXR0aGV3IFdpbGNveCIgPHdpbGx5QGluZnJhZGVhZC5vcmc+LCAicmVn
cmVzc2lvbnMiCj4gPHJlZ3Jlc3Npb25zQGxpc3RzLmxpbnV4LmRldj4sICJsaW51eC1rZXJuZWwi
IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPiwgIkxpbnV4IENyeXB0byBNYWlsaW5nIExp
c3QiCj4gPGxpbnV4LWNyeXB0b0B2Z2VyLmtlcm5lbC5vcmc+Cj4gR2VzZW5kZXQ6IE1pdHR3b2No
LCAyMy4gQXByaWwgMjAyNSAwODo1NDo0Ngo+IEJldHJlZmY6IFJlOiBMaW51eCA2LjE1LXJjMSBy
ZWdyZXNzaW9uLCBmb2xpby91YmlmcyBPb3BzCgo+IE9uIFdlZCwgQXByIDIzLCAyMDI1IGF0IDA5
OjIyOjE4QU0gKzA4MDAsIEhlcmJlcnQgWHUgd3JvdGU6Cj4+IE9uIFR1ZSwgQXByIDIyLCAyMDI1
IGF0IDA3OjU0OjA5UE0gKzAyMDAsIEZyYW5jZXNjbyBEb2xjaW5pIHdyb3RlOgo+PiA+IAo+PiA+
IE9uIFR1ZSwgQXByIDA4LCAyMDI1IGF0IDEwOjIwOjE4QU0gKzAyMDAsIEZyYW5jZXNjbyBEb2xj
aW5pIHdyb3RlOgo+PiA+ID4gSSBkbyBoYXZlIHRoZSBmb2xsb3dpbmcgcmVncmVzc2lvbiBvbiBz
aW5nbGUgY29yZSBzeXN0ZW0gdXNpbmcgVUJJRlMsCj4+ID4gPiBkdWFsIGNvcmUgc2VlbXMgbm90
IGFmZmVjdGVkLCBhbnkgaWRlYT8KPj4gCj4+IFBsZWFzZSB0cnkgdGhpcyBwYXRjaCB3aGljaCB3
aWxsIGdvIGluIHRvZGF5Ogo+PiAKPj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9q
ZWN0L2xpbnV4LWNyeXB0by9wYXRjaC9hQVc4RTlOcktXcTFYazJ3QGdvbmRvci5hcGFuYS5vcmcu
YXUvCj4gCj4gWWVzLCBJIGZpeGVzIHRoZSBpc3N1ZSwgdGhhbmtzLgoKVGhhbmtzIGZvciB0ZXN0
aW5nIHRoaXMhCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
