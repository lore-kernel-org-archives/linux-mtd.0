Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2D5C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:22:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D86E3208E4
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:22:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kqmuaW4P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D86E3208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1G8sS8IP7pGIqv/Pe2Hcie8c6/3V5eknTp/0YUfzAU=; b=kqmuaW4PolTcpq
	twARn153AAMmBvJVjImo5ntFtgJpNJL05p08aRuz+2U81VWegjeiJVtMLjE/UUffE92iB138vjEoH
	tUfB5GBkH41xuSBVe9V64+Ay0nlDmm6hztMN1wR520IZePdWnpMsdTBmNF23SjG4yPn8PJwHGrePX
	VUwXGO0xl0P1pKb9OUis2orlUJqlQ3Q+ys2W9KonSpLGRy1OK3xN+eIWuJ9MD+1mZN3MO7aG0N3tp
	Qmm/BrnKjL3M1pT1P/CBbd/6MtK5p5DcL7tAPPghNs7ARIg0JYDSsLzd5nq0j0nbbnAyzgfFyTMBi
	UncnSt41ejj8yZKWNPdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAylH-00048W-5y; Mon, 01 Apr 2019 15:22:11 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAylD-000483-RZ
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 15:22:09 +0000
X-Originating-IP: 90.88.32.136
Received: from xps13 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 70851FF819;
 Mon,  1 Apr 2019 15:22:04 +0000 (UTC)
Date: Mon, 1 Apr 2019 17:22:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH v5] mtd: spinand: Use the spi-mem dirmap API
Message-ID: <20190401172203.61ae76c4@xps13>
In-Reply-To: <20190124145643.3195-1-bbrezillon@kernel.org>
References: <20190124145643.3195-1-bbrezillon@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_082208_041372_B8CEB4FF 
X-CRM114-Status: GOOD (  12.49  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4gd3JvdGUg
b24gVGh1LCAyNCBKYW4gMjAxOQoxNTo1Njo0MyArMDEwMDoKCj4gTWFrZSB1c2Ugb2YgdGhlIHNw
aS1tZW0gZGlyZWN0IG1hcHBpbmcgQVBJIHRvIGxldCBhZHZhbmNlZCBjb250cm9sbGVycwo+IG9w
dGltaXplIHJlYWQvd3JpdGUgb3BlcmF0aW9ucyB3aGVuIHRoZXkgc3VwcG9ydCBkaXJlY3QgbWFw
cGluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2Vy
bmVsLm9yZz4KPiBDYzogU3RlZmFuIFJvZXNlIDxzckBkZW54LmRlPgo+IFNpZ25lZC1vZmYtYnk6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gLS0tCj4gTm90ZSB0
aGF0IHRoaXMgcGF0Y2ggbm93IGRlcGVuZHMgb24gWzFdIGFuZCBbMl0gYW5kIHNob3VsZCBub3Qg
YmUKPiBxdWV1ZWQgZm9yIDUuMSBidXQgZm9yIDUuMi4KPiAKPiBbMV1odHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3BhdGNoLzEwNzcyMDY3Lwo+IFsyXWh0dHA6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wYXRjaC8xMDMwNDc5Lwo+IAo+IENoYW5nZXMgaW4gdjU6Cj4gLSBVcGRhdGUgbXkgZW1h
aWwgYWRkcmVzcyBpbiB0aGUgU29CIGFuZCBBdXRob3IgZmllbGRzCj4gCj4gQ2hhbmdlcyBpbiB2
NDoKPiAtIEZpeCB2YXJpb3VzIGJ1Z3MgcmVwb3J0ZWQgYnkgU3RlZmFuCj4gLSBVc2UgZGV2bV9z
cGlfbWVtX2Rpcm1hcF9jcmVhdGUoKSB0byBzaW1wbGlmeSB0aGUgZXJyb3IvcmVtb3ZlIHBhdGgK
PiAtIERyb3AgTWlxdWVsJ3MgUi1iIGFzIGEgZmV3IGltcG9ydGFudCB0aGluZ3MgaGF2ZSBjaGFu
Z2VkIGluIHRoaXMgdjQKPiAKPiBDaGFuZ2VzIGluIHYzOgo+IC0gQWRkIE1pcXVlbCdzIFItYgo+
IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSBOZXcgcGF0Y2gKPiAtLS0KCkFwcGxpZWQgdG8gZ2l0Oi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQKb24g
bmFuZC9uZXh0LgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
