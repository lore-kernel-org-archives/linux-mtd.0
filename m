Return-Path: <SRS0=DmJj=5M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1073C43331
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 16:52:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C30BA2072F
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 16:52:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EU8Ygf9w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C30BA2072F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcyL0grcOcq7rknbu0Pxs2tQ3cowcMNnqA9/6/xG2Hw=; b=EU8Ygf9wVQ6PCv
	l19cgeM+Lgi1XSodS6emWkEP7iIa5uQAwWUyXApUUKxYc0yS+WOJ+eO/zOFN8WQC+7wjGBihvMRbM
	ZFjvw7th9BbLvVK0LgXevYW7uUNyG5cdTIYDE4rm/Yx3RO3F4+tdsfcE2ABBsjfPokDGvQ/p9DUDq
	GVd1Uie1/5yrB8phCQUa9ftdx8F4v4tpwGXNtGwd6pikFzEdaSBoFcLzhtZxIlrLz+8F0kaNQ2JNs
	svamPq5z8voKAI/0WOEXD0ltJUQiluBtnnrY/KPKKw2ZxyLJVEI+/YH7D0BP9AeEabMjoLVFZ00QN
	oIsP5x3g201c4Hmoo+3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHsDu-0004GX-PB; Fri, 27 Mar 2020 16:52:46 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHsDr-0004Fp-6F
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2020 16:52:44 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id F228820007;
 Fri, 27 Mar 2020 16:52:39 +0000 (UTC)
Date: Fri, 27 Mar 2020 17:52:38 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
Message-ID: <20200327175238.784cf47c@xps13>
In-Reply-To: <20200327164802.GN2564@lahna.fi.intel.com>
References: <CAP6exYJ3xk46PODgT=5WAdiLDNY=9MggxyaEwov6qyDQstLj7g@mail.gmail.com>
 <CAP6exY+W+zTtEB1LmHYDnhEnPj26Y97Ld9TBAxsgX3vGDb4LnQ@mail.gmail.com>
 <CAP6exYKrAs_OpC_qkoW2cH0MxpqxDrgP2nhJGkp=2BX-6kAWbQ@mail.gmail.com>
 <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <CAP6exYJ_jzrB0D=RLXMNeegu4BwQq8raXVOMugkqzX2ZP_JSqw@mail.gmail.com>
 <20200327155608.GM2564@lahna.fi.intel.com>
 <20200327171907.7a7ffc73@xps13>
 <20200327164802.GN2564@lahna.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_095243_368045_812B7A4F 
X-CRM114-Status: GOOD (  17.05  )
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
Cc: ron minnich <rminnich@gmail.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlrYSwKCk1pa2EgV2VzdGVyYmVyZyA8bWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNv
bT4gd3JvdGUgb24gRnJpLCAyNyBNYXIKMjAyMCAxODo0ODowMiArMDIwMDoKCj4gT24gRnJpLCBN
YXIgMjcsIDIwMjAgYXQgMDU6MTk6MDdQTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+
IEhpIE1pa2EsCj4gPiAKPiA+IE1pa2EgV2VzdGVyYmVyZyA8bWlrYS53ZXN0ZXJiZXJnQGxpbnV4
LmludGVsLmNvbT4gd3JvdGUgb24gRnJpLCAyNyBNYXIKPiA+IDIwMjAgMTc6NTY6MDggKzAyMDA6
Cj4gPiAgIAo+ID4gPiBIaSwKPiA+ID4gCj4gPiA+IEkgZG9uJ3QgdGhpbmsgaXQgaXMgZ29vZCBp
ZGVhIHRvIGNoYW5nZSBQQ0kgZGV2aWNlIG5hbWUgbGlrZSB0aGF0Lgo+ID4gPiAKPiA+ID4gSW5z
dGVhZCB0aGUgTVREIGNtZGxpbmUgcGFyc2VyIHNob3VsZCBiZSB0ZWFjaCB0byBoYW5kbGUgbmFt
ZXMgbGlrZSB0aGlzCj4gPiA+IHByb3Blcmx5LiAgCj4gPiAKPiA+IEl0IGlzIGEgYml0IG1vcmUg
Y29tcGxpY2F0ZWQgdGhhbiB0aGF0IHNpbmNlIHBhcnNlcnMgaGF2ZSBiZWVuIHVzaW5nCj4gPiB0
aGlzIHN5bnRheCBmb3IgYSBsb25nIHRpbWUgYW5kLCBtb3JlIGltcG9ydGFudGx5LCBpdCBtZWFu
cwo+ID4gcG90ZW50aWFsbHkgdXBkYXRpbmcgYWxsIGJvb3Rsb2FkZXJzLgo+ID4gCj4gPiBJIGFt
IG5vdCBhZ2FpbnN0IHVwZGF0aW5nIHRoZSBwYXJzZXIsIGJ1dCB0aGUgcy86L3wvIHNvbHV0aW9u
IHByb3Bvc2VkCj4gPiBiZWZvcmUgaXMgcmF0aGVyIHVuZGVzY3JpcHRpdmUgYW5kIGl0IGlzIGhh
cmQgdG8gZmluZCBhbiBhbHRlcm5hdGl2ZQo+ID4gY2hhcmFjdGVyIHRoYXQgd291bGQgaGF2ZSBh
IG1lYW5pbmcgaGVyZS4gIAo+IAo+IEknbSBjb21wbGV0ZWx5IHVuZmFtaWxpYXIgd2l0aCB0aGVz
ZSBidXQgd291bGQgZXNjYXBlIGNoYXIgd29yayBoZXJlPyBJCj4gbWVhbiBpZiB5b3Ugd2FudCAi
OiIgdG8gYmUgcGFyc2VkIGxpdGVyYWxseSB0aGVuIHlvdSBwYXNzICJcOiIgaW4gdGhlCj4gY29t
bWFuZCBsaW5lLiBUaGF0IHNob3VsZCB3b3JrIHdpdGggdGhlIGV4aXN0aW5nIGFuZCBhbHNvIGFs
bG93Cj4gc3VwcG9ydGluZyBTUEkgTk9SIGNvbnRyb2xsZXJzIG9uIFBDSSBidXMuCgpXZSB3b3Vs
ZCBzdGlsbCBoYXZlIHRvIHVwZGF0ZSBib290bG9hZGVycyBjb2RlIGJ1dCB0aGF0IHdvdWxkIGJl
IGVhc3kKdG8gaGFuZGxlLiBUaGUgbG9naWMgYmVpbmcgInNlYXJjaCBmb3IgdGhlIG5leHQgJzon
LCB3aGVuIHlvdSBoYXZlIG9uZQpjaGVjayBpZiB0aGVyZSBpcyBhICdcJyBpbiBmcm9udCBvZiBp
dC4gSWYgeWVzLCBzZWFyY2ggYWdhaW4iLiBXaHkKbm90Li4uIFRoaXMgYWxzbyBtZWFucyByZWNv
bnN0cnVjdGluZyB0aGUgbmFtZSBieSBkcm9wcGluZyBtYW51YWxseSB0aGUKYWRkaXRpb25hbCAn
XCcgaW4gTGludXguCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
