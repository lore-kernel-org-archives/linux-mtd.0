Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C3BC169C4
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 14:08:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1AB420823
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 14:08:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QZUtbU69";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BANXZKK+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1AB420823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIxEvLb22YzhjVz1lRluwjDDdCpT9ija8TLQuXxcRH4=; b=QZUtbU69Hcw1G9
	icdLLRcG9pPQBkP0r69N+egYgikliuCuyI5KqsYURM4aDLsiiJ6FtgkLPln7HxnnwdrRmukI6E+8o
	kaxX5HxwfdPXzQtyobEkt1zsa+bSGu32WSjQsxNtE/YeeiIastkXJMQYEyGIN0BNYU5GeU2F2mH8i
	P/YwuiMZ9TG4rsqVwu3smxmUDxJhDS7gIf9w9RTbwMSH+B5nscPfGMcYJYpzV79BaazjNIdLZbpWL
	2YzL3mbQx1f+jrp5YZM7NLdtyRjpHMFkBdFBp00M3FCwdCYc96RsJntozV1n4+gWtQLKIdwAsWHrZ
	o6bXSWSJgJfwetw+Xzyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqIRy-000890-5d; Sun, 03 Feb 2019 14:08:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqIRv-00088M-Jb
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 14:08:44 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E044520823;
 Sun,  3 Feb 2019 14:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549202921;
 bh=m578Ap1IUsphbWMvNDrbrmxIuE2xsjsUOTEcjHWuwH4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BANXZKK+cidl6/sTGKBGEB2LRUXnKPhKCYwUENqEkDdcgHVSwFCtZgGkt6fTA/ptF
 39En1pB+Q79lBOQEVEJv9BCVt6VVenAz2ve0efFnfQ0F00d8QQvNJYphMK182A/rJ3
 u3HTarSmSrrLcVoglAY19VjzeS7q7iH88/FbXcCc=
Date: Sun, 3 Feb 2019 15:08:27 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 4/9] mtd: rawnand: jz4780: Add support for the JZ4740
Message-ID: <20190203150827.401ac31d@bbrezillon>
In-Reply-To: <1549202213.1950.1@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
 <20190202231926.2444-5-paul@crapouillou.net>
 <20190203083151.4fc29c5b@bbrezillon>
 <1549202213.1950.1@crapouillou.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_060843_670886_1678A362 
X-CRM114-Status: GOOD (  22.86  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Mathieu Malaterre <malat@debian.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAwMyBGZWIgMjAxOSAxMDo1Njo1MyAtMDMwMApQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4gd3JvdGU6Cgo+IExlIGRpbS4gMyBmw6l2ci4gMjAxOSDDoCA0OjMxLCBC
b3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4gCj4gYSDDqWNyaXQgOgo+ID4g
T24gU2F0LCAgMiBGZWIgMjAxOSAyMDoxOToyMSAtMDMwMAo+ID4gUGF1bCBDZXJjdWVpbCA8cGF1
bEBjcmFwb3VpbGxvdS5uZXQ+IHdyb3RlOgo+ID4gICAKPiA+PiAgQWRkIHN1cHBvcnQgZm9yIHBy
b2JpbmcgdGhlIGp6NDc4MC1uYW5kIGRyaXZlciBvbiB0aGUgSlo0NzQwIFNvQyAKPiA+PiBmcm9t
Cj4gPj4gIEluZ2VuaWMuCj4gPj4gCj4gPj4gIFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwg
PHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+ID4+ICAtLS0KPiA+PiAKPiA+PiAgQ2hhbmdlczoKPiA+
PiAKPiA+PiAgdjI6IC0gQWRkIHN1cHBvcnQgZm9yIHRoZSBKWjQ3NDAgYW5kIG5vdCB0aGUgSlo0
NzI1QjogdGhleSBiZWhhdmUgCj4gPj4gdGhlCj4gPj4gICAgICAgIHNhbWUsIGFuZCBKWjQ3NDAg
aXMgZnVsbHkgdXBzdHJlYW0gd2hpbGUgSlo0NzI1QiBpcyBub3QuIFRoZQo+ID4+ICAgICAgICBK
WjQ3MjVCIGRldmljZXRyZWUgd2lsbCB0aGVuIHNpbXBseSB1c2UgdGhlIAo+ID4+ICJpbmdlbmlj
LGp6NDc0MC1uYW5kIgo+ID4+ICAgICAgICBjb21wYXRpYmxlIHN0cmluZy4KPiA+PiAgICAgIC0g
Rml4IHRoZSBudW1iZXIgb2YgYnl0ZXMgZm9yIHRoZSBFQ0Mgd2hlbiB0aGUgRUNDIHN0cmVuZ3Ro
IGlzIAo+ID4+IDQuCj4gPj4gICAgICAgIFRoaXMgaXMgbmVlZGVkIGZvciB0aGUgSlo0NzQwLCB3
aGljaCB1c2VzIFJlZWQtU29sb21vbiAKPiA+PiBpbnN0ZWFkIG9mCj4gPj4gICAgICAgIEJDSC4K
PiA+PiAKPiA+PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvano0NzgwX25hbmQuYyB8
IDQ4IAo+ID4+ICsrKysrKysrKysrKysrKysrLS0tLS0gIAo+ID4gCj4gPiBJZiB3ZSdyZSBnb2lu
ZyB0byBtYWtlIHRoZSBkcml2ZXIgY29tcGF0aWJsZSB3aXRoIGp6NDc0MCBhbmQgano0NzI1Ygo+
ID4gbWF5YmUgd2Ugc2hvdWxkIHJlbmFtZSB0aGUgc291cmNlIGZpbGVzIGp6NDd4eF97bmFuZCxi
Y2h9LntjLGh9LiAgCj4gCj4gSSBkb24ndCBrbm93IGFib3V0IHRoYXQuIEFkZGluZyBzdXBwb3J0
IGZvciBuZXcgaGFyZHdhcmUgaXNuJ3QgYSBnb29kIAo+IHJlYXNvbiB0bwo+IHJlbmFtZSB0aGUg
ZHJpdmVyLCBvciBzbyBJJ3ZlIGJlZW4gdG9sZCBhcm91bmQgaGVyZSwgYXMgeW91IHRoZW4gbWFr
ZSAKPiBpdCBoYXJkZXIKPiB0byByZXZpZXcgdGhlIGdpdCBoaXN0b3J5IG9mIHRoZSBkcml2ZXIu
CgpZb3UgYWxyZWFkeSBtb3ZlIGZpbGVzIHRvIGEgc3ViLWRpcmVjdG9yeSBzbyB0aGF0IGRvZXNu
J3QgbWFrZSBhIGh1Z2UKZGlmZmVyZW5jZSwgaGlzdG9yeSB3aWxsIGJlIGhhcmQgdG8gZm9sbG93
IGJlY2F1c2Ugb2YgdGhpcyBtb3ZlIGFueXdheS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
