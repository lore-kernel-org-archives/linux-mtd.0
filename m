Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C65C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 14:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWWP0tMWPl/aDf0CBOROc43TBVR6V7TWKOw1+M417lA=; b=5GAAB1hkTR2j0x
	JCSZcBrmQAE3s2P6RjsJ4bQhOQVhIy40j8119Me91RWajjOyo+K8xrdXJ8/069Ga2A+XcE1zk75bA
	IdBDF9f9QheTyIj3cMoeVS1GatyTK8p1VVytf+a0KNp9zvGEGTk9L+n7rfW3b6mXutqs7OmWcA2jI
	S7fck+qTHjqnd4car5ZfJSGgPiFdAV83+EF0/kbq2KIJnZcC5hjTkIg/DzVQ78h3KlKKKLPPcp5Y4
	FA56Vaw7FuutA6hXsPdyOXN/bkeO5aA4/gLuUkbDhAxAfTE/XNmZhMG0sJkoi07RWvqlPCNo2k/zI
	vB8mqw2jfs6AMhXGWdew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n02Sw-00Aeae-8q; Wed, 22 Dec 2021 14:19:38 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n02Si-00AeWN-Sn
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 14:19:26 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6A7D2200002;
 Wed, 22 Dec 2021 14:19:21 +0000 (UTC)
Date: Wed, 22 Dec 2021 15:19:19 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Roger Quadros <rogerq@kernel.org>, tony@atomide.com, robh@kernel.org,
 kishon@ti.com, nm@ti.com, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/4] mtd: rawnand: omap2: Select GPMC device driver
 for ARCH_K3
Message-ID: <20211222151919.5d95d72c@xps13>
In-Reply-To: <2b4386a4-0acc-5db1-fc55-b57ad8a84be3@canonical.com>
References: <20211221131757.2030-1-rogerq@kernel.org>
 <20211221131757.2030-5-rogerq@kernel.org>
 <20211221144917.0a5d8f1a@xps13>
 <2b4386a4-0acc-5db1-fc55-b57ad8a84be3@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_061925_088253_3A9EF6B1 
X-CRM114-Status: GOOD (  15.37  )
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

SGkgS3J6eXN6dG9mLAoKa3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tIHdyb3RlIG9u
IFdlZCwgMjIgRGVjIDIwMjEgMTI6NTA6MTgKKzAxMDA6Cgo+IE9uIDIxLzEyLzIwMjEgMTQ6NDks
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBSb2dlciwKPiA+IAo+ID4gcm9nZXJxQGtlcm5l
bC5vcmcgd3JvdGUgb24gVHVlLCAyMSBEZWMgMjAyMSAxNToxNzo1NyArMDIwMDoKPiA+ICAgCj4g
Pj4gVGhlIEdQTUMgZGV2aWNlIGRyaXZlciBpcyByZXF1aXJlZCBmb3IgTkFORCBjb250cm9sbGVy
Cj4gPj4gdG8gd29yayBvbiBLMyBBcmNoaXRlY3R1cmUuIFNlbGVjdCBpdCBpZiByZXF1aXJlZC4K
PiA+Pgo+ID4+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+
ID4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFF1YWRyb3MgPHJvZ2VycUBrZXJuZWwub3JnPgo+ID4+
IC0tLQo+ID4+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnIHwgMSArCj4gPj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L0tjb25maWcgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4gPj4g
aW5kZXggNjdiN2NiNjdjMDMwLi41ODdmMjBjNjE4NGYgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+ID4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tj
b25maWcKPiA+PiBAQCAtNDIsNiArNDIsNyBAQCBjb25maWcgTVREX05BTkRfT01BUDIKPiA+PiAg
CXRyaXN0YXRlICJPTUFQMiwgT01BUDMsIE9NQVA0IGFuZCBLZXlzdG9uZSBOQU5EIGNvbnRyb2xs
ZXIiCj4gPj4gIAlkZXBlbmRzIG9uIEFSQ0hfT01BUDJQTFVTIHx8IEFSQ0hfS0VZU1RPTkUgfHwg
Q09NUElMRV9URVNUCj4gPj4gIAlkZXBlbmRzIG9uIEhBU19JT01FTQo+ID4+ICsJc2VsZWN0IE9N
QVBfR1BNQyBpZiBBUkNIX0szICAKPiA+IAo+ID4gQWNrZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiAgIAo+IAo+IFRoaXMgcGF0Y2ggbG9va3MgYWN0
dWFsbHkgaW5kZXBlbmRlbnQuIE1pcXVlbCwgZG8geW91IHdhbnQgbWUgdG8gdGFrZSBpdAo+IHZp
YSBtZW1vcnkgY29udHJvbGxlciBkcml2ZXJzIHRyZWUgKGxpa2UgdGhyZWUgb3RoZXIgcGF0Y2hl
cyk/CgpZZXMgcGxlYXNlLCB5b3UgY2FuIHRha2UgaXQgaW4geW91ciB0cmVlLCBJIGRvbid0IGV4
cGVjdCBhbnkgY29uZmxpY3RzCmluIHRoaXMgYXJlYS4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
