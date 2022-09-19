Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F499C54EE9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Sep 2022 15:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnEjD0y92oUl0IdpEjo8NTeH8rSU0tBv+I2dYXjYvDw=; b=uKnxkR7Rtg3Bl0
	gDnYUKIUa+uxiF4ahNFUphB+MXSBpJ2Q7Uf1YC29AlvOsK3w9MdqlLniJJEoNbXlmm/LsDS5d8GTE
	u+hJpHhfvmVOWknZBNMyp+ArXUwO2rqWCAlw75pYflYI5iNWtIHgqv4jPYOV/9yVdlkDxF6L6nf8K
	L/HZGmd9hxsd5fQBVgckWlJXWfXzpRZXIjhyE5Ku5e2gwS8jVQ6r6Mkjfor/S1w37hIei+QZJHkR7
	5/X6tuA32CQzkBhmxepb3XwdTLBLdceameLVkCGFlvUuzWgtKlQbgeeoRpn2b8rKAzb7wAWU8cdug
	pfMfoz69S8KRgouehIQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJ8X-00Cgls-0G; Mon, 19 Sep 2022 15:56:45 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIyD-00CcMP-4Z
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2022 15:46:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D370DFF806;
	Mon, 19 Sep 2022 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663602358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7Wxr9PSijhZGWTkRtV1y/YLavAq24fTU1JLn1YD7jA=;
	b=OFGnC/qeE7JttDYUfQlXdAmhk4US/RyAF6ZtNeiQGRwpnCvEWyglpSs+K4yPDga7sMlQor
	A40FED73dSh30eixYQ0K/EKDhojSLE0xYdKDdg3wrA6rUJ5Nn00NTNfeqTNjZOsjCESyPt
	usMgoIxDlTodvXpoO1d+dc5zw149/eLqWpR7AL5he+sNqLUrxSDnGyGc66uQlXQ9c8AgfB
	AlXQNFOGujXbL7gmy/XdY0FCdKeAVMKVHndQsnVZuubI0VRClKUetbAVG4vwH3nkD9L/gB
	6f8bT+YtjfuLr4+/Md/r/Wsrob1jhD80CQUQzipLipbQCnRyWpoBSkXmP73J9A==
Date: Mon, 19 Sep 2022 17:45:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jilin Yuan <yuanjilin@cdjrlc.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/mtd: fix repeated words in comments
Message-ID: <20220919174556.35597018@xps-13>
In-Reply-To: <20220810131539.51108-1-yuanjilin@cdjrlc.com>
References: <20220810131539.51108-1-yuanjilin@cdjrlc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_084605_393729_95816011 
X-CRM114-Status: GOOD (  16.92  )
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

SGkgSmlsaW4sCgp5dWFuamlsaW5AY2RqcmxjLmNvbSB3cm90ZSBvbiBXZWQsIDEwIEF1ZyAyMDIy
IDIxOjE1OjM5ICswODAwOgoKPiAgRGVsZXRlIHRoZSByZWR1bmRhbnQgd29yZCAnaXQnLgogIF4K
Tm8gc3BhY2UgCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppbGluIFl1YW4gPHl1YW5qaWxpbkBjZGpy
bGMuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9pbmZ0bGNvcmUuYyB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL2luZnRsY29yZS5jIGIvZHJpdmVycy9tdGQvaW5mdGxjb3JlLmMKPiBpbmRl
eCA2YjQ4Mzk3Yzc1MGMuLjE3MDlmN2Y2YmY2ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9p
bmZ0bGNvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL2luZnRsY29yZS5jCj4gQEAgLTM1Niw3ICsz
NTYsNyBAQCBzdGF0aWMgdTE2IElORlRMX2ZvbGRjaGFpbihzdHJ1Y3QgSU5GVExyZWNvcmQgKmlu
ZnRsLCB1bnNpZ25lZCB0aGlzVlVDLCB1bnNpZ25lZAo+ICAJICogTmV3ZXN0IHVuaXQgaW4gY2hh
aW4gbm93IGNvbnRhaW5zIGRhdGEgZnJvbSBfYWxsXyBvbGRlciB1bml0cy4KPiAgCSAqIFNvIGdv
IHRocm91Z2ggYW5kIGVyYXNlIGVhY2ggdW5pdCBpbiBjaGFpbiwgb2xkZXN0IGZpcnN0LiAoVGhp
cwo+ICAJICogaXMgaW1wb3J0YW50LCBieSBkb2luZyBvbGRlc3QgZmlyc3QgaWYgd2UgY3Jhc2gv
cmVib290IHRoZW4gaXQKPiAtCSAqIGl0IGlzIHJlbGF0aXZlbHkgc2ltcGxlIHRvIGNsZWFuIHVw
IHRoZSBtZXNzKS4KPiArCSAqIGlzIHJlbGF0aXZlbHkgc2ltcGxlIHRvIGNsZWFuIHVwIHRoZSBt
ZXNzKS4KClBsZWFzZSBzZW5kIG9ubHkgb25lIHBhdGNoIGZvciB0aGUgdGhyZWUgImRvdWJsZSB3
b3JkcyIgeW91J3ZlIGZvdW5kIGluCm10ZCwgYW5kIHByZWZpeCB0aGUgc3ViamVjdCB3aXRoICJt
dGQ6ICIuCgo+ICAJICovCj4gIAlwcl9kZWJ1ZygiSU5GVEw6IHdhbnQgdG8gZXJhc2UgdmlydHVh
bCBjaGFpbiAlZFxuIiwgdGhpc1ZVQyk7Cj4gIAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
