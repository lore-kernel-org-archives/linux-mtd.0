Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E874C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 15:04:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E524820721
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 15:04:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S6UVVu78"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E524820721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDHBzkVPy6NXquuF4TunWTn7xlTywqsfTzqJcUKdnnE=; b=S6UVVu78HUzMl6
	U9F0HzCtqotV+fHTv2BIwN03QbEFMWXXIUf+Shgsn9YYSy1gdmAvv4FEGGY6sJwPiVmnghCMhiLnF
	i+SaDfwey/SORpyTUVfvkAxRo9RQmy/crsqkq6YotIkCAsz1ER0rhBOTR1W9JLjTIY2zCd6W9L4wW
	LBvuFY+rVMS1dlkehoWrIiN5H7lx/beXQhte6bZVOEpOL6jZ4QonbqsXHbkrz6P8F7jqAqp4ToK30
	l3/iBGHjc7n5eOY+UzATMAUPI9GCIpSaliaefDbFiupbjibcSKvbMZWz1aIuYbdnpJI1CI+w/WbW/
	qocd5ssLBk+mCMNoF8ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipZM6-0001We-1E; Thu, 09 Jan 2020 15:04:14 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipZM2-0001Vu-Ef
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 15:04:13 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 38014200005;
 Thu,  9 Jan 2020 15:03:53 +0000 (UTC)
Date: Thu, 9 Jan 2020 16:03:52 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: set mtd partition panic write flag
Message-ID: <20200109160352.6080e1e5@xps13>
In-Reply-To: <1718371158.75883.1572995022606.JavaMail.zimbra@nod.at>
References: <20191021193343.41320-1-kdasu.kdev@gmail.com>
 <20191105200344.1e8c3eab@xps13>
 <1718371158.75883.1572995022606.JavaMail.zimbra@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_070410_627083_4B472951 
X-CRM114-Status: GOOD (  17.36  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PiB3cm90ZSBvbiBXZWQs
IDYgTm92IDIwMTkgMDA6MDM6NDIKKzAxMDAgKENFVCk6Cgo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hl
IE1haWwgLS0tLS0KPiA+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPgo+ID4gQW46ICJLYW1hbCBEYXN1IiA8a2Rhc3Uua2RldkBnbWFpbC5jb20+Cj4gPiBD
QzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImJjbS1rZXJu
ZWwtZmVlZGJhY2stbGlzdCIgPGJjbS1rZXJuZWwtZmVlZGJhY2stbGlzdEBicm9hZGNvbS5jb20+
LAo+ID4gImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+LCAiRGF2
aWQgV29vZGhvdXNlIiA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4sICJCcmlhbiBOb3JyaXMiCj4gPiA8
Y29tcHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tPiwgIk1hcmVrIFZhc3V0IiA8bWFyZWsudmFzdXRA
Z21haWwuY29tPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJWaWduZXNoIFJhZ2hhdmVu
ZHJhIgo+ID4gPHZpZ25lc2hyQHRpLmNvbT4KPiA+IEdlc2VuZGV0OiBEaWVuc3RhZywgNS4gTm92
ZW1iZXIgMjAxOSAyMDowMzo0NAo+ID4gQmV0cmVmZjogUmU6IFtQQVRDSF0gbXRkOiBzZXQgbXRk
IHBhcnRpdGlvbiBwYW5pYyB3cml0ZSBmbGFnICAKPiAKPiA+IEhpIEthbWFsLAo+ID4gCj4gPiBS
aWNoYXJkLCBzb21ldGhpbmcgdG8gbG9vayBpbnRvIGJlbG93IDopICAKPiAKPiBJJ20gc3RpbGwg
cmVjb3ZlcmluZyBmcm9tIGEgYmFkIGNvbGQuIFNvIG15IGJyYWluIGlzIG5vdCBmdWxseSB3b3Jr
aW5nIDspCj4gIAo+ID4gS2FtYWwgRGFzdSA8a2Rhc3Uua2RldkBnbWFpbC5jb20+IHdyb3RlIG9u
IE1vbiwgMjEgT2N0IDIwMTkgMTU6MzI6NTIKPiA+IC0wNDAwOgo+ID4gICAKPiA+PiBDaGVjayBt
dGQgcGFuaWMgd3JpdGUgZmxhZyBhbmQgc2V0IHRoZSBtdGQgcGFydGl0aW9uIHBhbmljCj4gPj4g
d3JpdGUgZmxhZyBzbyB0aGF0IGxvdyBsZXZlbCBkcml2ZXJzIGNhbiB1c2UgaXQgdG8gdGFrZQo+
ID4+IHJlcXVpcmVkIGFjdGlvbiB0byBlbnN1cmUgb29wcyBkYXRhIGdldHMgd3JpdHRlbiB0byBh
c3NpZ25lZAo+ID4+IG10ZCBwYXJ0aXRpb24uICAKPiA+IAo+ID4gSSBmZWVsIHRoZXJlIGlzIHNv
bWV0aGluZyB3cm9uZyB3aXRoIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uCj4gPiByZWdhcmRp
bmcgcGFydGl0aW9ucyBidXQgSSBhbSBub3Qgc3VyZSB0aGlzIGlzIHRoZSByaWdodCBmaXguIElz
IHRoaXMKPiA+IHNvbWV0aGluZyB5b3UgZGV0ZWN0ZWQgd2l0aCBzb21lIGtpbmQgb2Ygc3RhdGlj
IGNoZWNrZXIgb3IgZGlkIHlvdQo+ID4gYWN0dWFsbHkgZXhwZXJpZW5jZSBhbiBpc3N1ZT8KPiA+
IAo+ID4gSW4gdGhlIGNvbW1pdCBsb2cgeW91IHNheSAiY2hlY2sgbXRkIChJIHN1cHBvc2UgeW91
IG1lYW4gdGhlCj4gPiBtYXN0ZXIpIHBhbmljIHdyaXRlIGZsYWcgYW5kIHNldCB0aGUgbXRkIHBh
cnRpdGlvbiBwYW5pYyB3cml0ZSBmbGFnIgo+ID4gd2hpY2ggbWFrZXMgc2Vuc2UsIGJ1dCBpbiBy
ZWFsaXR5IG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB5b3UgZG8gdGhlCj4gPiBvcHBvc2l0ZTog
eW91IGNoZWNrIG10ZC0+b29wc19wYW5pY193cml0ZSB3aGljaCBpcyB0aGUgcGFydGl0aW9ucycK
PiA+IHN0cnVjdHVyZSwgYW5kIHNldCBwYXJ0LT5wYXJlbnQtPm9vcHNfcGFuaWNfd3JpdGUgd2hp
Y2ggaXMgdGhlIG1hc3RlcidzCj4gPiBmbGFnLiAgCj4gCj4gSUlVQyB0aGUgcHJvYmxlbSBoYXBw
ZW5zIHdoZW4geW91IHJ1biBtdGRvb3BzIG9uIGEgbXRkIHBhcnRpdGlvbi4KPiBUaGUgdGhlIGZs
YWcgaXMgb25seSBzZXQgZm9yIHRoZSBwYXJ0aXRpb24gaW5zdGVhZCBmb3IgdGhlIG1hc3Rlci4K
PiAKPiBTbyB0aGUgcmlnaHQgZml4IHdvdWxkIGJlIHNldHRpbmcgdGhlIHBhcmVudCdzIG9vcHNf
cGFuaWNfd3JpdGUgaW4KPiBtdGRfcGFuaWNfd3JpdGUoKS4KPiBUaGVuIHdlIGRvbid0IGhhdmUg
dG8gdG91Y2ggbXRkcGFydC5jCj4gCgpUaGlzIGlzc3VlIGlzIHN0aWxsIG9wZW4sIHJpZ2h0PyBL
YW1hbCBjYW4geW91IHNlbmQgYW4gdXBkYXRlZCB2ZXJzaW9uPwoKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
