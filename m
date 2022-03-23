Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF0FC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Mar 2022 16:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4vvg2tgZOuHhrc1JWAFABmbWm6gk3sFjH3J2uZe2Bpc=; b=GDLK47TUv/USFh
	ApGkmBik9V4jwiyqn5swQ9SKZuTgHTVU1sUOFeGvk2T+e6ckZBWd/5nGIkfwi50HSoIN+zx7RhTRx
	lLVn32+Tz9+OSYkv30+c9Zf6PmvF2wdjWBdZt+HqAIqL5Ki988wqbBJQeIet+ep3HfvMGfXyEIQ2V
	lOnYrhzdBvV7CUupxaaUNfgDq1UepvwhGzBRQiVkFEPlUIZ4DJJnhawKoXwzesdexKUrgZLOA2afp
	OL8Nzp10TZUyQav69ACzduClYgc4CyTBSG/01jVZkIWhU9xmzxI1ConD2n/UbuHYWxmY81Aer+Ysl
	eQwJ5BCDZS6B9H0THSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX4FC-00EJKI-SJ; Wed, 23 Mar 2022 16:53:58 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX4F3-00EJFo-Jw
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2022 16:53:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7AC7A60005;
 Wed, 23 Mar 2022 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648054427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GS/g/UTeXjfqpr/oHNuJYTSx3SrVeNOfwohuPjoXE2Q=;
 b=kck5ktUQssJ8HJVAL9fisD7KiKZDJ6d+bmHusX3aP4gYfgKFjCoayuvSu4rlO0GBZlyWDE
 FsMVEIZYlcKZFUBgQyrS+mEgzPTu7k8uEfi3FXP6yhEgcRQ02/Xy3uvDnVUB6lnSH0Z6wu
 oZdTcc8I26+NdfE3+Z6s4I1e5GzRDy4W0UvXeQ84fNVby7nldkZOHshfa+2XLNeq5rks0Q
 EaRM0/OCLEPRNYc7iioSkt+iJV5bicBS4IK89i1F8GP3UgBHhcxOk9B5Ge/zieA4BbytnG
 vWk3RhStgcLn04Uodk5bRWKiWdzetLl6Ft1xNmESAUHWReQeJj2BKNfr7aqxvg==
Date: Wed, 23 Mar 2022 17:53:45 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v6 3/3] mtd: cfi_cmdset_0002: Rename chip_ready
 variables and add ID definition
Message-ID: <20220323175345.619ba991@xps13>
In-Reply-To: <48459921-b3a4-a399-3a8a-86bd2695a601@gmail.com>
References: <20220322234952.25520-1-ikegami.t@gmail.com>
 <20220323090257.298130d3@xps13>
 <48459921-b3a4-a399-3a8a-86bd2695a601@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_095350_134302_53AD5A2B 
X-CRM114-Status: GOOD (  19.47  )
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

SGkgVG9rdW5vcmksCgppa2VnYW1pLnRAZ21haWwuY29tIHdyb3RlIG9uIFRodSwgMjQgTWFyIDIw
MjIgMDE6NDY6MDAgKzA5MDA6Cgo+IEhpIE1pcXVlbC1zYW4sCj4gCj4gT24gMjAyMi8wMy8yMyAx
NzowMiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIFRva3Vub3JpLAo+ID4KPiA+IGlrZWdh
bWkudEBnbWFpbC5jb20gd3JvdGUgb24gV2VkLCAyMyBNYXIgMjAyMiAwODo0OTo1MiArMDkwMDoK
PiA+ICAKPiA+PiBUaGUgZGVmaW5pdGlvbiBpcyBmb3IgdGhlIFMyOUdMMDY0TiBtb2RlbCBudW1i
ZXIgMDEsIDAyLCBWMSBhbmQgVjIuICAKPiA+IFBsZWFzZSBrZWVwIHJlc2VuZGluZyB0aGUgZW50
aXJlIHNlcmllcy4gIAo+IEkgc2VlLiAoSW4gdGhlIHBhc3QgaXQgd2FzIG1lbnRpb25lZCBhcyBu
b3QgbmVjZXNzYXJ5IHRvIHNlbmQgYWxsIHBhdGNoZXMgaWYgYSBwYXRjaCBmaXhlZCBvZiBzZXJp
ZXMuKQoKR2VuZXJhbGx5IHNwZWFraW5nLCB3aGlsZSB5b3UgaGF2ZSBub3QgYmVlbiBub3RpZmll
ZCB0aGF0IGEgcGF0Y2ggZ290CmFwcGxpZWQsIGl0J3MgYmVzdCB0byByZXNlbmQgaXQgYXMgcGFy
dCBvZiB5b3VyIHNlcmllcy4KCj4gPiAgCj4gPj4gU2lnbmVkLW9mZi1ieTogVG9rdW5vcmkgSWtl
Z2FtaSA8aWtlZ2FtaS50QGdtYWlsLmNvbT4KPiA+PiBDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4KPiA+PiBDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJk
QG5vZC5hdD4KPiA+PiBDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+
ID4+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyAgCj4gPiBZb3UgZG9uJ3QgbmVl
ZCBhbGwgdGhlc2UgQ2MgdGhlcmUsIGp1c3QgYWRkIHRoZW0gd2hlbiBzZW5kaW5nCj4gPiBldmVy
eXRoaW5nIHdpdGggZ2l0LWZvcm1hdC1wYXRjaC4gSSBiZWxpZXZlIHlvdSBjYW4gdXNlIHRoZXNl
IGZpZWxkcwo+ID4ganVzdCBmb3IgImV4dHJhIiBwZW9wbGUgd2hpY2ggYXJlIG5vdCBub3RhYmx5
IGV4cGVjdGVkLiAgCj4gCj4gV2lsbCBkbyBhcyBzby4gQnkgdGhlIHdheSBpdCB3YXMgY29tbWVu
dGVkIG9uIHRoZSB2ZXJzaW9uIDEgcGF0Y2ggYnkgVmlnbmVzaC1zYW4gYXMgYmVsb3cgc28gYWRk
ZWQgQ0MgbWFpbnRhaW5lcnMgYnkgdmVyc2lvbiAyIHBhdGNoLgo+ICDCoD4gUGxlYXNlIENDIG1h
aW50YWluZXJzIGZyb20KPiAgwqA+Cj4gIMKgPiAuL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwg
LWYgZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPiAgwqA+Cj4gIMKgPiBFbHNl
LCBwYXRjaCB3b3VsZCBub3QgZ2V0IGF0dGVudGlvbiBpbiB0aW1lLiAgCgpBbmQgVmlnbmVzaCBp
cyByaWdodC4gWW91IHNob3VsZCBDYyB0aGUgbWFpbnRhaW5lcnMsIGJ1dCB5b3UgY2FuIGRvCnRo
YXQgYnkgdXNpbmcgZ2l0LXNlbmQtZW1haWwgLS1jYyBmb28gLS1jYyBiYXIuIEFkZGluZyBDYzog
bGluZXMgd2l0aAphbGwgdGhlIG1haW50YWluZXJzIGluIHRoZSBwYXRjaCBkb2VzIG5vdCByZWFs
bHkgaGVscCBhbmQganVzdCBncm93cwp0aGUgY29tbWl0IGxvZyBmb3Igbm8gcmVhc29uLgoKCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
