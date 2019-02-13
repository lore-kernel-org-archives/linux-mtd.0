Return-Path: <SRS0=N2Dg=QU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864A4C282CA
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 14:05:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57EE4222B2
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 14:05:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OqO2yuNz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kerXPDxX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57EE4222B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmQtAqAXimi3tvKnyGl4KhSdQHc9XgCgbwq4aD9Qzjw=; b=OqO2yuNz3hlKOd
	Q/2FLqJLxEiuWRE3Mgdcel5xfxCtW1LYJVZh/7OXwjaY3FhHP7fI4CsGgdJcKdKSVwQIrAKDUtUX4
	tTWVJb2hpYyA0gEL2UoEOXThzjvb1MgIomrNKaI9T0mkaTuAQGzAf+kRRvow85dqDJu3Za/oOeLR7
	i6GDrDYPBSKfVnGy7RDo0clFFNRomGFcuyooNE+ffUvM36hstD5/oAmfNBe+eQFWHVi5zFIlR3aKL
	xGbUDcHmPBfw06c+5hiDf5EtTBTqRFcX9sXhL4zFBwERqdIPilNE6yn+iD0Q5AONea+Q5He8FSdFO
	lrbT8DIwgM60Bvs1uXxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtvAj-0002EY-LH; Wed, 13 Feb 2019 14:05:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtvAg-0002De-07
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2019 14:05:56 +0000
Received: from localhost (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1CFA52075D;
 Wed, 13 Feb 2019 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550066753;
 bh=7GmzglS2u/JkI574oyrQ1SMa8YsPu1Z/11NkARXHqkw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kerXPDxXvHzyPq5xUayKtAP5YHBFgiYx8ZcB9MMUIGzh21LpFeppOHdGfwGqL9SU3
 PdpNuRaQ9omE49/jaHhIrRtxzY0Msqko5wleCzpAk5lbECk2NbEvRo2630IVClhCON
 SOvcHpKT6ouAM21XgXPrZE4xZLv2V/Dak/LAIDnU=
Date: Wed, 13 Feb 2019 15:05:42 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] mtd: lpddr_cmds: Mark expected switch fall-through
Message-ID: <20190213150542.552adeb1@kernel.org>
In-Reply-To: <20190212153131.GA5746@embeddedor>
References: <20190212153131.GA5746@embeddedor>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_060554_060692_084D92F5 
X-CRM114-Status: GOOD (  17.46  )
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
Cc: Kees Cook <keescook@chromium.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxMiBGZWIgMjAxOSAwOTozMTozMSAtMDYwMAoiR3VzdGF2byBBLiBSLiBTaWx2YSIg
PGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+IHdyb3RlOgoKPiBJbiBwcmVwYXJhdGlvbiB0byBlbmFi
bGluZyAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLCBtYXJrIHN3aXRjaAo+IGNhc2VzIHdoZXJlIHdl
IGFyZSBleHBlY3RpbmcgdG8gZmFsbCB0aHJvdWdoLgo+IAo+IFRoaXMgcGF0Y2ggZml4ZXMgdGhl
IGZvbGxvd2luZyB3YXJuaW5nOgo+IAo+IGRyaXZlcnMvbXRkL2xwZGRyL2xwZGRyX2NtZHMuYzog
SW4gZnVuY3Rpb24g4oCYY2hpcF9yZWFkeeKAmToKPiBkcml2ZXJzL210ZC9scGRkci9scGRkcl9j
bWRzLmM6MzE5OjY6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1X
aW1wbGljaXQtZmFsbHRocm91Z2g9XQo+ICAgIGlmIChtb2RlID09IEZMX1JFQURZICYmIGNoaXAt
Pm9sZHN0YXRlID09IEZMX1JFQURZKQo+ICAgICAgIF4KPiBkcml2ZXJzL210ZC9scGRkci9scGRk
cl9jbWRzLmM6MzIyOjI6IG5vdGU6IGhlcmUKPiAgIGRlZmF1bHQ6Cj4gICBefn5+fn5+Cj4gCj4g
V2FybmluZyBsZXZlbCAzIHdhcyB1c2VkOiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTMKPiAKPiBU
aGlzIHBhdGNoIGlzIHBhcnQgb2YgdGhlIG9uZ29pbmcgZWZmb3J0cyB0byBlbmFibGUKPiAtV2lt
cGxpY2l0LWZhbGx0aHJvdWdoLgo+IAoKWW91IHNlbnQgbWUgdGhhdCBvbmUgdHdpY2UsIGlzIHRo
YXQgZXhwZWN0ZWQ/IElzIHRoaXMgYSBuZXcgdmVyc2lvbiwKYW5kIGluIHRoYXQgY2FzZSwgd2hh
dCBoYXMgY2hhbmdlZD8KCj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3Vz
dGF2b0BlbWJlZGRlZG9yLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbHBkZHIvbHBkZHJfY21k
cy5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9scGRkci9scGRkcl9jbWRzLmMgYi9kcml2ZXJzL210ZC9scGRkci9s
cGRkcl9jbWRzLmMKPiBpbmRleCBiMTM1NTdmZTUyYmQuLjc2YTRjNzNlMTAwZSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL210ZC9scGRkci9scGRkcl9jbWRzLmMKPiArKysgYi9kcml2ZXJzL210ZC9s
cGRkci9scGRkcl9jbWRzLmMKPiBAQCAtMzE4LDYgKzMxOCw3IEBAIHN0YXRpYyBpbnQgY2hpcF9y
ZWFkeShzdHJ1Y3QgbWFwX2luZm8gKm1hcCwgc3RydWN0IGZsY2hpcCAqY2hpcCwgaW50IG1vZGUp
Cj4gIAkJLyogT25seSBpZiB0aGVyZSdzIG5vIG9wZXJhdGlvbiBzdXNwZW5kZWQuLi4gKi8KPiAg
CQlpZiAobW9kZSA9PSBGTF9SRUFEWSAmJiBjaGlwLT5vbGRzdGF0ZSA9PSBGTF9SRUFEWSkKPiAg
CQkJcmV0dXJuIDA7Cj4gKwkJLyogZmFsbCB0aHJvdWdoICovCj4gIAo+ICAJZGVmYXVsdDoKPiAg
c2xlZXA6CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
