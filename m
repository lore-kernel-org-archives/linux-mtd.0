Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9A5C4360C
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 15:58:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC99207FF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 15:58:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DZWVMCsy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CajKsEX5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC99207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oREeAgN2WZsqNKN2f3QBq4SC8xLdYG4xDtqqbhJinvo=; b=DZWVMCsyL/tFiG
	VMptL/sINbw1KBjOfqp/2Ty3pjUNzs6gYvN5WZhJWq5mO8H/TSJxhzaYYhnbkJZ90/jObOBZjTNYW
	zz6Ts6s1L9/k15t5kFJe29DRhrDbi9tGrGTpKIMH7WlhXrZRbzgmVg7m0MipG8Lx457u/Bstj1AQm
	QzyJv/IBQHSqoe2pF40+08yIJh3Rsl8L85XfkAvI131hqcGakTKFI4h0cghuEFhXwbhk0mBO8ttmo
	bRft0TUUTQxiZygBSKmjVYAsuxhV2Z3BOVdgAm4/KotzwZTC+AVmW9yZHpdznnfXt7o59l/F+OWQZ
	ItbqpqDoYPq675IpLohg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGPyJ-00018j-TG; Fri, 04 Oct 2019 15:58:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGPyH-00018K-R2
 for linux-mtd@bombadil.infradead.org; Fri, 04 Oct 2019 15:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MzpA19dbwk4THiCweWuy/xEcrfgQuxzwmbXdI/v+ig8=; b=CajKsEX5BGuWCmyONjrAe9SAd3
 dj+Y/UtIT2hQcoNNB1oOAlQcSHpg1RP18feTTE/170++YTd018vq8gc6ddG/0No4LyZX9HWyd1G4i
 pHFM3dApNZQCmWeZhdI33q1Pl01/pTBXKU3Cv5s2fU5SQxuAmffhpRwn2Li2w0x1TwnW8zfC5lDka
 hLGmPMOl/nj0DhVGIZFV35AGyn8ZcEJDS43K2fe6d6seHwauunZIovi4zshX0Rs87e6KzsbXCm3Pv
 mrXpVVv8aL4sVVAZwO9gVMEMlC3UrpqgO6NP3rvIadpRYa8ExG0fGmsvjp9z0Pe1uBvz1+CSClTa+
 /aQUojxA==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by casper.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGPyd-0006s0-VO
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 15:58:45 +0000
X-Originating-IP: 93.23.105.117
Received: from xps13 (117.105.23.93.rev.sfr.net [93.23.105.117])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5BDA1240007;
 Fri,  4 Oct 2019 15:57:42 +0000 (UTC)
Date: Fri, 4 Oct 2019 17:57:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] mtd: onenand: prevent memory leak in onenand_scan
Message-ID: <20191004175740.5dd84c38@xps13>
In-Reply-To: <CAEkB2ETTmCsuOFDsJQ8LbBPHNgckpDFn2XhVePwAQEsCRsJo6g@mail.gmail.com>
References: <20190925154302.17708-1-navid.emamdoost@gmail.com>
 <CAEkB2ETTmCsuOFDsJQ8LbBPHNgckpDFn2XhVePwAQEsCRsJo6g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_165844_036260_10FA6D0E 
X-CRM114-Status: GOOD (  19.73  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Navid Emamdoost <emamd001@umn.edu>, linux-mtd@lists.infradead.org,
 Stephen McCamant <smccaman@umn.edu>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTmF2aWQsCgpOYXZpZCBFbWFtZG9vc3QgPG5hdmlkLmVtYW1kb29zdEBnbWFpbC5jb20+IHdy
b3RlIG9uIE1vbiwgMzAgU2VwIDIwMTkKMTY6Mzc6MTcgLTA1MDA6Cgo+IFdvdWxkIHlvdSBwbGVh
c2UgdGFrZSBhIGxvb2sgYXQgdGhpcyBwYXRjaD8KPiAKPiBPbiBXZWQsIFNlcCAyNSwgMjAxOSBh
dCAxMDo0MyBBTSBOYXZpZCBFbWFtZG9vc3QKPiA8bmF2aWQuZW1hbWRvb3N0QGdtYWlsLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gSW4gb25lbmFuZF9zY2FuIGlmIHNjYW5fYmJ0IGZhaWxzIHRoZSBhbGxv
Y2F0ZWQgYnVmZmVycyBzaG91bGQgYmUKPiA+IHJlbGVhc2VkLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IE5hdmlkIEVtYW1kb29zdCA8bmF2aWQuZW1hbWRvb3N0QGdtYWlsLmNvbT4KPiA+IC0tLQo+
ID4gIGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYyB8IDUgKysrKy0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYyBiL2Ry
aXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwo+ID4gaW5kZXggNzdiZDMyYTY4
M2UxLi43OWMwMWY0MjkyNWEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL29uZW5h
bmQvb25lbmFuZF9iYXNlLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVu
YW5kX2Jhc2UuYwo+ID4gQEAgLTM5NzcsOCArMzk3NywxMSBAQCBpbnQgb25lbmFuZF9zY2FuKHN0
cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgbWF4Y2hpcHMpCj4gPiAgICAgICAgIHRoaXMtPmJhZGJs
b2NrcG9zID0gT05FTkFORF9CQURCTE9DS19QT1M7Cj4gPgo+ID4gICAgICAgICByZXQgPSB0aGlz
LT5zY2FuX2JidChtdGQpOwo+ID4gLSAgICAgICBpZiAoKCFGTEVYT05FTkFORCh0aGlzKSkgfHwg
cmV0KQo+ID4gKyAgICAgICBpZiAoKCFGTEVYT05FTkFORCh0aGlzKSkgfHwgcmV0KSB7Cj4gPiAr
ICAgICAgICAgICAgICAga2ZyZWUodGhpcy0+cGFnZV9idWYpOwoKQXBwYXJlbnRseSB5b3UgbWlz
c2VkOgoKI2lmZGVmIENPTkZJR19NVERfT05FTkFORF9WRVJJRllfV1JJVEUKICAgICAgICBrZnJl
ZSh0aGlzLT52ZXJpZnlfYnVmKTsKI2VuZGlmCgo+ID4gKyAgICAgICAgICAgICAgIGtmcmVlKHRo
aXMtPm9vYl9idWYpOwo+ID4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiArICAgICAg
IH0KPiA+Cj4gPiAgICAgICAgIC8qIENoYW5nZSBGbGV4LU9uZU5BTkQgYm91bmRhcmllcyBpZiBy
ZXF1aXJlZCAqLwo+ID4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgTUFYX0RJRVM7IGkrKykKPiA+
IC0tCj4gPiAyLjE3LjEKPiA+ICAKPiAKPiAKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
