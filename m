Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E610C4829E
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Feb 2024 10:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SI/YUPTgH/ifDZbTLZU0KdFw8Y7Rcnql8D7dIKteZhU=; b=ViqF1BHqloAPMHk8KxuOKRbbEL
	35HqneGJebJ7uI2EqBaWm0BuN7utbULpKEEeUB2r/sWpSUZ7aqDHnEIu3A7dbbEh09DnQFs6X3Tl0
	Qt2+A19uuf8ofQlWj1EtTV6jDA/aevwNoj+NPk4huj3/ZyhmWPQZLm0wvOY4bx4Sn6UHA6fYQGy7P
	RSWkSX307bH+8ls8KDbMdB37oDcvyoCakNuFBS6elO8Z+5r06A0dYHPRyrkVwCeQTwLk/ZbUlqbsT
	yVVApKpR97/0uwpZ0PShfts+q80ngwDv8zfiFJXfqJjWCKmIwg/25mY/KBY0xbA3MR4XBH0mX4wP7
	y/9QonjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbeNB-00000007VYD-1Fox;
	Sun, 18 Feb 2024 10:26:13 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbeN7-00000007VV0-0BhX
	for linux-mtd@lists.infradead.org;
	Sun, 18 Feb 2024 10:26:11 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D2C2D626FB03;
	Sun, 18 Feb 2024 11:25:56 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id zTwMf50YHRo2; Sun, 18 Feb 2024 11:25:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 34C4362348B6;
	Sun, 18 Feb 2024 11:25:56 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BNvjYnE6md31; Sun, 18 Feb 2024 11:25:56 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id ECFFF64507D7;
	Sun, 18 Feb 2024 11:25:55 +0100 (CET)
Date: Sun, 18 Feb 2024 11:25:55 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Martin Kepplinger-Novakovic <martink@posteo.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	stable <stable@vger.kernel.org>, patches@lists.linux.dev, 
	ZhaoLong Wang <wangzhaolong1@huawei.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Sasha Levin <sashal@kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	dpervushin <dpervushin@embeddedalley.com>, 
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	yi zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>, 
	Henri Roosen <Henri.Roosen@ginzinger.com>, 
	Melchior Franz <Melchior.Franz@ginzinger.com>
Message-ID: <1171523562.70108.1708251955853.JavaMail.zimbra@nod.at>
In-Reply-To: <a53aacd3-4270-2d80-f14c-8cfd763e4404@huawei.com>
References: <20240122235719.206965081@linuxfoundation.org> <20240122235721.687806578@linuxfoundation.org> <fdfcc3b6e1a884bb986acf072bcc13611eae8bdd.camel@posteo.de> <a53aacd3-4270-2d80-f14c-8cfd763e4404@huawei.com>
Subject: Re: [PATCH 5.4 058/194] mtd: Fix gluebi NULL pointer dereference
 caused by ftl notifier
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Fix gluebi NULL pointer dereference caused by ftl notifier
Thread-Index: qlWIfU/4hKJxU5rpLtwP8PpFM4piaQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_022609_264083_F99E8150 
X-CRM114-Status: UNSURE (   8.95  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+PiBIaSBHcmVnLCBoaSBwYXRjaC1kZXZlbG9wZXJzLAo+
PiAKPj4gd2FpdCBhIHNlY29uZC4gdGhpcyBhbHJlYWR5IHdlbnQgaW50byB2NS40LjI2OCBidXQg
c3RpbGw6IERvZXNuJ3QgdGhpcwo+PiBicmVhayB1c2Vyc3BhY2U/Cj4+IAo+PiBBY2NvcmRpbmcg
dG8KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC80NDExMDcxMDAuMjM3MzQuMTY5Nzkw
NDU4MDI1Mi5KYXZhTWFpbC56aW1icmFAbm9kLmF0Lwo+PiB3aGVyZSB0aGlzIHNvbHV0aW9uIHNl
ZW1zIHRvIGNvbWUgZnJvbSwgdGhlIGJlaGF2aW91ciBjaGFuZ2VzOiAibm8KPj4gbXRkYmxvY2sg
KGhlbmNlLCBhbHNvIG5vIEZUTHMpIG9uIHRvcCBvZiBnbHVlYmkuIgo+PiAKPj4gSSBmZWxsIGFj
Y3Jvc3MgdGhpcyBiZWNhdXNlIG9mIGFuIG91dC1vZi10cmVlIG1vZHVsZSB0aGF0IGRvZXMKPj4g
c3lzX21vdW50KCkgYW4gbXRkYmxvY2ssIHNvIEkgd29uJ3QgY29tcGxhaW4gYWJvdXQgbXkgY29k
ZSBzcGVjaWZpY2FsbHkKPj4gOikgQnV0IGRvZXNuJ3QgaXQgYnJlYWsgbW91bnRpbmcsIHNheSwg
amZmczIgaW5zaWRlIGFuIHViaSB2aWEKPj4gbXRkYmxvY2s/IElmIHNvLCBpcyB0aGlzIHJlYWxs
eSBzb21ldGhpbmcgdGhhdCB5b3Ugd2FudCB0byBzZWUKPj4gYmFja3BvcnRlZCB0byBvbGQga2Vy
bmVscz8KPj4gCj4+IE9yIGRpZmZlcmVudGx5IHB1dDogSGFzIHRoaXMgcGF0Y2ggYmVlbiBwaWNr
ZWQgdXAgZm9yIG9sZCBzdGFibGUKPj4ga2VybmVscyBieSBzY3JpcHRzIG9yIGJ5IGEgaHVtYW4/
Cj4+IAo+PiBJIGp1c3Qgd2FudCB0byBtYWtlIHN1cmUsIGFuZCB3aG8ga25vd3MsIGl0IG1pZ2h0
IGhlbHAgb3RoZXJzIHRvbywgd2hvCj4+IHdvdWxkIGp1c3QgZG8gYSAocG9zc2libHkgZGFuZ2Vy
b3VzPykgcmV2ZXJ0IGluIHRoZWlyIHRyZWVzLgo+PiAKPiAKPiBUaGlzIGNoYW5nZSBkb2VzIGFm
ZmVjdCB0aGUgbW91bnRpbmcobXRkYmxvY2sgYmFzZWQgb24gZ2x1ZWJpKSBiZWhhdmlvcgo+IGlu
IHVzZXJzcGFjZS4gSXQgd2FzIHBpY2tlZCBpbnRvIHN0YWJsZSB2ZXJzaW9ucyBiZWNhdXNlIHRo
ZSBmaXhlZAo+IHByb2JsZW0gaXMgc2VyaW91cyBhbmQgZWFzeSB0byBiZSByZXByb2R1Y2VkLCBJ
IGd1ZXNzLgo+IEEgdGVtcG9yYXJ5IHNvbHV0aW9uIGlzIHRoYXQgbW9kaWZ5IG1vdW50aW5nIHNv
dXJjZSB0YXJnZXQgaW4gdXNlcnNwYWNlLAo+IGp1c3QgcmVwbGFjZSBtdGRibG9jayB3aXRoIG10
ZCBjaGFyIGRldmljZS4gRm9yIGV4YW1wbGUsIG1vdW50IC10IGpmZnMyCj4gbXRkMCAvbW50CgpJ
IGRvbid0IHRoaW5rIHRoaXMgbmVlZHMgYmFja3BvcnRpbmcgdG8gc3RhYmxlLiBJdCdzIG5vdCBz
ZXJpb3VzIGJlY2F1c2UgeW91CnN0aWxsIG5lZWQgdG8gYmUgcm9vdCB0byBzZXR1cCBhbmQgdHJp
Z2dlciBzdWNoIGEgc2NlbmFyaW8uCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
