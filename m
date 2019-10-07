Return-Path: <SRS0=6eB4=YA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5396C4740A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2019 08:54:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A50821655
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2019 08:54:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n0opeQAi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A50821655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DUsiemi2VcPxhSYAt548Gos4NVYmNMQ2O0ICp1Pfcyc=; b=n0opeQAij6E4K8
	1BHmXC2G9SnDP1qQkV5GUqzp4ss3Tk/zHqBkfLdFe6PYR43TNJANRrE+AfuoGEDwJ/M8HXphTcN2O
	FQ/xlDqtBS/a3jyBZBxsaZufMGnAYPKs+1Ok6DiQ/xoK+6qYO71K9JBDqBfdDAn2XNcstzCLtA7q/
	I2HqtJo/k6n8sgoW63NHIPyVCnXI/ILBFov2Phs8Gtw9O5LaVyr57iTWfpj7dHjKpSWYQopN++Plt
	BhxdnO+b/Ywv8tOaflyHqVQnzJT+2qzQp5eLJGlWoiq3GSFx5C+tXZgiM/2JuhacouANIC+y8ec1a
	c8orndSnoSFS1BznHBtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHOmZ-0003WO-VE; Mon, 07 Oct 2019 08:54:19 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHOmW-0003VR-Pm
 for linux-mtd@lists.infradead.org; Mon, 07 Oct 2019 08:54:18 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 14FEA240013;
 Mon,  7 Oct 2019 08:54:08 +0000 (UTC)
Date: Mon, 7 Oct 2019 10:54:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH v2] mtd: onenand: prevent memory leak in onenand_scan
Message-ID: <20191007105408.2b4b9fd6@xps13>
In-Reply-To: <20191004171909.6378-1-navid.emamdoost@gmail.com>
References: <20191004175740.5dd84c38@xps13>
 <20191004171909.6378-1-navid.emamdoost@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_015416_974526_ACCC8B09 
X-CRM114-Status: GOOD (  17.09  )
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
 emamd001@umn.edu, linux-mtd@lists.infradead.org, smccaman@umn.edu,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTmF2aWQsCgpOYXZpZCBFbWFtZG9vc3QgPG5hdmlkLmVtYW1kb29zdEBnbWFpbC5jb20+IHdy
b3RlIG9uIEZyaSwgIDQgT2N0IDIwMTkKMTI6MTk6MDUgLTA1MDA6Cgo+IEluIG9uZW5hbmRfc2Nh
biBpZiBzY2FuX2JidCBmYWlscyB0aGUgYWxsb2NhdGVkIGJ1ZmZlcnMgZm9yIG9vYl9idWYsCj4g
dmVyaWZ5X2J1ZiwgYW5kIHBhZ2VfYnVmIHNob3VsZCBiZSByZWxlYXNlZC4KPiAKPiBGaXhlczog
NTk4OGFmMjMxOTc4ICgibXRkOiBGbGV4LU9uZU5BTkQgc3VwcG9ydCIpCgpNaXNzaW5nIENjOiBz
dGFibGVAdmdlci5rZXJuZWwub3JnCgo+IFNpZ25lZC1vZmYtYnk6IE5hdmlkIEVtYW1kb29zdCA8
bmF2aWQuZW1hbWRvb3N0QGdtYWlsLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+IAktLSBh
ZGRlZCByZWxlYXNlIGZvciB0aGlzLT52ZXJpZnlfYnVmICh0aGFua3MgdG8gTWlxdWVsIFJheW5h
bAo+IGZvciB0aGUgaGludCkuCj4gLS0tCgpUaGVzZSB0aHJlZSBkYXNoZXMgYXJlIG5vdCBuZWVk
ZWQuCgo+ICBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmMgfCA4ICsrKysr
KystCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jIGIv
ZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jCj4gaW5kZXggNzdiZDMyYTY4
M2UxLi42MzI5YWRhM2YxNWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5k
L29uZW5hbmRfYmFzZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRf
YmFzZS5jCj4gQEAgLTM5NzcsOCArMzk3NywxNCBAQCBpbnQgb25lbmFuZF9zY2FuKHN0cnVjdCBt
dGRfaW5mbyAqbXRkLCBpbnQgbWF4Y2hpcHMpCj4gIAl0aGlzLT5iYWRibG9ja3BvcyA9IE9ORU5B
TkRfQkFEQkxPQ0tfUE9TOwo+ICAKPiAgCXJldCA9IHRoaXMtPnNjYW5fYmJ0KG10ZCk7Cj4gLQlp
ZiAoKCFGTEVYT05FTkFORCh0aGlzKSkgfHwgcmV0KQo+ICsJaWYgKCghRkxFWE9ORU5BTkQodGhp
cykpIHx8IHJldCkgewo+ICsJCWtmcmVlKHRoaXMtPm9vYl9idWYpOwo+ICsjaWZkZWYgQ09ORklH
X01URF9PTkVOQU5EX1ZFUklGWV9XUklURQo+ICsJCWtmcmVlKHRoaXMtPnZlcmlmeV9idWYpOwo+
ICsjZW5kaWYKClNvcnJ5IGZvciB0aGUgcGluZy1wb25nIGJ1dCBhY3R1YWxseSwgb25seSB0aGUg
b29iX2J1ZiBhbmQgcGFnZV9idWYKaGF2ZSBiZWVuIGludHJvZHVjZWQgYnkgdGhlIGNvbW1pdCA1
OTg4YWYgeW91IHBvaW50IGluIHRoZSBGaXhlcyB0YWcuCgpUbyBoZWxwIHN0YWJsZSBrZXJuZWxz
IG1haW50YWluZXJzIEkgc3VnZ2VzdCB5b3UgZnJlZSB0aGUgdmVyaWZ5X2J1ZgppbiBhIHNlY29u
ZCBwYXRjaCB3aGljaCBmaXhlczoKCjRhOGNlMGIwMzA3MSBtdGQ6IG9uZW5hbmQ6IGFsbG9jYXRl
IHZlcmlmeSBidWZmZXIgaW4gdGhlIGNvcmUKCj4gKwkJa2ZyZWUodGhpcy0+cGFnZV9idWYpOwo+
ICAJCXJldHVybiByZXQ7Cj4gKwl9Cj4gIAo+ICAJLyogQ2hhbmdlIEZsZXgtT25lTkFORCBib3Vu
ZGFyaWVzIGlmIHJlcXVpcmVkICovCj4gIAlmb3IgKGkgPSAwOyBpIDwgTUFYX0RJRVM7IGkrKykK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
