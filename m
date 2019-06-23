Return-Path: <SRS0=gyp4=UW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623C4C43613
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jun 2019 20:22:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8BF3205ED
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jun 2019 20:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PQD1erA8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8BF3205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKFD8xchKeWzyL6MKbYDrHjF5qLBnn2XSfV4sOgot2Q=; b=PQD1erA8UtcFDl
	0LFpYBjnZK7vBlUgLPEHAEsKUFNwEnQLulKjIugkptTu0KC9U+N1JA5f0MQk8Kld2CMYn8aJeN83B
	luBkfw2BfJQGH9StLbSYAh36hMNmt3J+Q6K4gtlepX4wmoa5Zp93pEb1n/8Ctjjhb7FlYhuK0lwF0
	TYXWAxH/NdPAYAIXTNTqWRQ8zZy3e4CFDgXQ3Cp+B0kuus0vItm4qHtY2zrQg5LMEWsxI/H89VO96
	ATEwmPMZhA5FccgHgvSZmFz8Zj7UA9Pn7geJTWZpRz8gdy4kDLDj+MtNsNONj2HnvW7ApRpCS7XV4
	YLMfuDduLBAgtItPUBKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hf90l-00015n-7X; Sun, 23 Jun 2019 20:22:51 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hf90i-00013K-Ej
 for linux-mtd@lists.infradead.org; Sun, 23 Jun 2019 20:22:50 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3EBDF6088968;
 Sun, 23 Jun 2019 22:22:37 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4AyLc7A0u9sV; Sun, 23 Jun 2019 22:22:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id CD4E66088969;
 Sun, 23 Jun 2019 22:22:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id jMkw9U9zYQa3; Sun, 23 Jun 2019 22:22:34 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5901B6088968;
 Sun, 23 Jun 2019 22:22:34 +0200 (CEST)
Date: Sun, 23 Jun 2019 22:22:34 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Message-ID: <1802416174.14823.1561321354019.JavaMail.zimbra@nod.at>
In-Reply-To: <CAHk-=wgfDU+o1vycUdE7Xp40o=eoFkSkQ9DBHR986iwT-5LDXw@mail.gmail.com>
References: <20190623211004.6743a8dc@xps13>
 <CAHk-=wgfDU+o1vycUdE7Xp40o=eoFkSkQ9DBHR986iwT-5LDXw@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: Fixes for 5.2-rc7
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: Fixes for 5.2-rc7
Thread-Index: 30BIyU+o8y7RLTq7fuQ8TCsv/1E2JA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190623_132248_638484_0F7D7E72 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogInRvcnZhbGRzIiA8dG9ydmFs
ZHNAbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQW46ICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4KPiBDQzogIkJvcmlzIEJyZXppbGxvbiIgPGJvcmlzLmJyZXppbGxv
bkBjb2xsYWJvcmEuY29tPiwgImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQu
b3JnPiwgInJpY2hhcmQiCj4gPHJpY2hhcmRAbm9kLmF0PiwgIk1hcmVrIFZhc3V0IiA8bWFyZWsu
dmFzdXRAZ21haWwuY29tPiwgIkJyaWFuIE5vcnJpcyIgPGNvbXB1dGVyc2ZvcnBlYWNlQGdtYWls
LmNvbT4sICJEYXZpZAo+IFdvb2Rob3VzZSIgPGR3bXcyQGluZnJhZGVhZC5vcmc+LCAiVmlnbmVz
aCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4sICJUdWRvciBBbWJhcnVzIgo+IDxUdWRv
ci5BbWJhcnVzQG1pY3JvY2hpcC5jb20+Cj4gR2VzZW5kZXQ6IFNvbm50YWcsIDIzLiBKdW5pIDIw
MTkgMjE6NTc6MTgKPiBCZXRyZWZmOiBSZTogW0dJVCBQVUxMXSBtdGQ6IEZpeGVzIGZvciA1LjIt
cmM3Cgo+IE9uIFN1biwgSnVuIDIzLCAyMDE5IGF0IDEyOjEwIFBNIE1pcXVlbCBSYXluYWwKPiA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4+Cj4+IEhlbGxvIExpbnVzLAo+Pgo+
PiBIZXJlIGFyZSB0d28gTVREIGZpeGVzIGZvciB0aGUgbmV4dCAtcmMuCj4gCj4gSGkgTWlxdWVs
LAo+IEkgZG9uJ3QgdGhpbmsgSSd2ZSBwdWxsZWQgZnJvbSB5b3UgYmVmb3JlIC0gd2hpY2ggaXMg
bm90IGEgcHJvYmxlbQo+IHBlciBzZSwgYnV0IGdlbmVyYWxseSB3aGVuIEkgc3RhcnQgcHVsbGlu
ZyBmcm9tIG5ldyBzb3VyY2VzIEkgZG8gd2FudAo+IHRvIGZpcnN0IHNlZSBhbiBhY2tub3dkbGVk
Z2VtZW50IG9mIHRoYXQgZnJvbSB0aGUgcGVvcGxlIEkgdXNlZCB0bwo+IHB1bGwgZnJvbS4KPiAK
PiBZZXMsIHlvdSdyZSBpbiB0aGUgTUFJTlRBSU5FUiBmaWxlLCBidXQgdGhpcyBpcyBtb3JlIGFi
b3V0IG1lIGp1c3QKPiB3YW50aW5nIHRvIG1ha2Ugc3VyZSB0aGVyZSBpc24ndCBzb21lIHBvbGl0
aWNhbCBvciBwZXJzb25hbCB0aGluZwo+IGJyZXdpbmcgLSBhbmQgaWYgdGhlcmUgaXMsIEkganVz
dCB3YW50IHRvIGtub3cgYWJvdXQgaXQuCgpObyBuZWVkIHRvIHdvcnJ5LCBNaXF1ZWwgaXMgYWxs
b3dlZCB0byBzZW5kIFBScy4gOi0pCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
