Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF07C43467
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 07:54:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BD822084C
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 07:54:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VW77IwzU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BD822084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3uhEsDbM9Bp+fQxyQrHA2bzrdiZ06zz0RClU5rFp7m4=; b=VW77IwzURf8zutiAh2w22SAkp
	YmR6+QGFqgeiJmW/fgj0rGVEs4mkj/CyX8e9T7rBK0SX51/pHc8O7TNRucgR5EyansCUOVKe9m+rB
	XhCb5XrFSD+v3QQEGmW4MNs6q9vN6hkAhnBk1I8vcRm1RMgUWgmOo7NdHkEu53brct4z+Mw+oebHq
	jH56fnVGowCwvMPFAaWrLN2AifW/TnxuQpb+7fWlmLjxIEGdZH5TFkGdwRbSd2rVQkOLs3uvsL7tB
	PQEe7KqEyMFaJijqGt+sPJuYOlIs7gGGpT2gRP2wBJHptm2dkN4LNG9Wp7fWZAZuQbs9llQjcCSLl
	zQCrLmJIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTKYI-0007zI-JL; Fri, 16 Oct 2020 07:53:26 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTKYF-0007yI-Pr
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 07:53:24 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 263A91BF20C;
 Fri, 16 Oct 2020 07:53:20 +0000 (UTC)
Date: Fri, 16 Oct 2020 09:53:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: imx27: Unsupported ECC algorithm
Message-ID: <20201016095318.296ce8bf@xps13>
In-Reply-To: <20201016063910.GK13710@pengutronix.de>
References: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
 <20200921094010.GH21278@pengutronix.de>
 <20200928172012.712035f8@xps13>
 <CAOMZO5CzNrGnwAB4zuUzeO3LVUqxaD4u0UXfYO8HBNcKSS-mvw@mail.gmail.com>
 <CAOMZO5D8W+Z5enehxFt7XTPn6sEXe9pWM6Tn1SixMntkZ31Wgw@mail.gmail.com>
 <20200930165831.418b8edd@xps13>
 <CAOMZO5BVHBqxLSEZgEqHEdAXstaK8GHHqjQnY+FtOJhXjX--qw@mail.gmail.com>
 <622a62489fa717fe8a94cd2e9cdf3d906da5141f.camel@pengutronix.de>
 <CAOMZO5Cq6v0OvpLSYwqqpHQFDjviM3mwozHcH35qoOTFvdnJ-w@mail.gmail.com>
 <20201014152659.6ef6a2fc@xps13>
 <20201016063910.GK13710@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_035323_944371_D3292C89 
X-CRM114-Status: GOOD (  20.07  )
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
Cc: linux-mtd@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+IHdyb3RlIG9uIEZy
aSwgMTYgT2N0IDIwMjAKMDg6Mzk6MTAgKzAyMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiBXZWQs
IE9jdCAxNCwgMjAyMCBhdCAwMzoyNjo1OVBNICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
ID4gSGkgRmFiaW8sIFNhc2NoYSwgTHVjYXMsCj4gPiAKPiA+ID4gCj4gPiA+IFRoZSBFQ0MgaXNz
dWVzIGFyZSBzdGlsbCBwcmVzZW50IG9uIGlteDI3LXBoeXRlYy1waHljYXJkLXMtcmRrOgo+ID4g
PiBodHRwczovL3N0b3JhZ2Uua2VybmVsY2kub3JnL25leHQvbWFzdGVyL25leHQtMjAyMDEwMTMv
YXJtL2lteF92NF92NV9kZWZjb25maWcvZ2NjLTgvbGFiLXBlbmd1dHJvbml4L2Jhc2VsaW5lLWlt
eDI3LXBoeXRlYy1waHljYXJkLXMtcmRrLmh0bWwKPiA+ID4gCj4gPiA+IEJUVywgRUNDIGVycm9y
cyBhcmUgYWxzbyByZXBvcnRlZCBvbiBhIEZyZWVzY2FsZSBMYXllcnNjYXBlIDIwODhBIFJEQiBC
b2FyZDoKPiA+ID4gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvaW9tbXUvbXNnNDk3NzIu
aHRtbAo+ID4gPiAKPiA+IAo+ID4gSSBzdXBwb3NlZCB0aGUgZmFpbGluZyBkaXZpc2lvbiBpcyB0
aGlzIG9uZToKPiA+IAo+ID4gICAgICAgICAvKgo+ID4gICAgICAgICAgKiBTZXQgdGhlIG51bWJl
ciBvZiByZWFkIC8gd3JpdGUgc3RlcHMgZm9yIG9uZSBwYWdlIGRlcGVuZGluZyBvbiBFQ0MKPiA+
ICAgICAgICAgICogbW9kZS4KPiA+ICAgICAgICAgICovCj4gPiAgICAgICAgIGVjYy0+c3RlcHMg
PSBtdGQtPndyaXRlc2l6ZSAvIGVjYy0+c2l6ZTsKPiA+ICAgICAgICAgaWYgKGVjYy0+c3RlcHMg
KiBlY2MtPnNpemUgIT0gbXRkLT53cml0ZXNpemUpIHsKPiA+ICAgICAgICAgICAgICAgICBXQVJO
KDEsICJJbnZhbGlkIEVDQyBwYXJhbWV0ZXJzXG4iKTsKPiA+ICAgICAgICAgICAgICAgICByZXQg
PSAtRUlOVkFMOwo+ID4gICAgICAgICAgICAgICAgIGdvdG8gZXJyX25hbmRfbWFudWZfY2xlYW51
cDsKPiA+ICAgICAgICAgfQo+ID4gCj4gPiBXaGljaCBwcm9kdWNlcyB0aGUgd2FybmluZyByaWdo
dCBhZnRlci4gVGhpcyB3b3VsZCBtZWFuIHRoYXQKPiA+IAo+ID4gCWVjYy0+c2l6ZSA9PSAwCj4g
PiAKPiA+IEJ1dCB0aGlzIGVudHJ5IGlzIHNldCBiZWZvcmUgY2FsbGluZyBuYW5kX3NjYW4oKSBp
biBteGNuZF9wcm9iZSgpIHRvCj4gPiA1MTIsIGFuZCB0aGF0IGRvZXMgbm90IG1ha2Ugc2Vuc2Uu
Cj4gPiAKPiA+IEkgZ3Vlc3Mgd2Ugc2hvdWxkIGJlIGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgZXJy
b3Igd2l0aCBhbnkgYm9hcmQgdXNpbmcKPiA+IHRoZSBteGMgTkFORCBkcml2ZXIgd2l0aCBoYXJk
d2FyZSBjb3JyZWN0aW9uIChub3cgYWxzbyBjYWxsZWQgIm9uCj4gPiBob3N0IikuIERvIHlvdSBo
YXZlIHN1Y2ggYSBib2FyZCBhdmFpbGFibGUgdG8gYXQgbGVhc3QgdmVyaWZ5IHRoYXQgdGhlCj4g
PiBiZWdpbm5pbmcgb2YgbXkgbG9naWMgaXMgcmlnaHQ/Cj4gCj4gV2UgaGF2ZSBhIGJvYXJkLCBJ
J2xsIGdpdmUgaXQgYSB0ZXN0CgpUaGFua3MgdG8gSGFuJ3MgYW5hbHlzaXMgSSBtYXkgaGF2ZSBm
b3VuZCB0aGUgaXNzdWUuIFBsZWFzZSBoYXZlIGEgbG9vawphdCBbMV0uCgpTYXNjaGEsIGlmIHlv
dSByZXByb2R1Y2UgdGhlIGVycm9yIHlvdSBtYXkgYWxzbyB3YW50IHRvIHRlc3QgdGhpcyBwYXRj
aC4KClsxXSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtbXRkL3Bh
dGNoLzIwMjAxMDE2MDc0OTQyLjI5NjUwLTEtbWlxdWVsLnJheW5hbEBib290bGluLmNvbS8KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
