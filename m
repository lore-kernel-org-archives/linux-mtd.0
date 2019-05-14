Return-Path: <SRS0=Ul+2=TO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839D8C04AB7
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 20:01:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5564720881
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 20:01:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="svv0ufix"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5564720881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSZSFOQRLU/q0vV+eExGLqK+5Y4LE+PqqLZ3+CRNfOg=; b=svv0ufixhm7JAV
	yQlNj80rl/cWiCjtEBnXtxkarB6lKKQz8NUC0ayYEhPPi+YKcM/gANWxOaWqeQIAezh5pHeB1ukE7
	O1XNJWNZ5YGSJ9eoZ1qRhsgrN645z5OBHf3KfVflg7WW5U9/vQRjJwVToyMQDdEAntoppCH/8+sjT
	FduYtV3h0IFRZfV98Rt0hEYlHFyypflfydy0bAYcd5k1l4B6SbgetGZ7ZH80DRLqOLqMzkMJReHsg
	bTqfCgiCH5tuFo6iqcdIQLoqcMT0R+gtV8Yx3+dsNVJl4XULHvC/G9A2qpPfdL041DJ7laZU8J7//
	QA4mrd/vk63WGngb+bxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQdcX-0006fe-NL; Tue, 14 May 2019 20:01:53 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQdcU-0006eb-3L
 for linux-mtd@lists.infradead.org; Tue, 14 May 2019 20:01:51 +0000
X-Originating-IP: 46.193.9.130
Received: from xps13 (cust-west-pareq2-46-193-9-130.wb.wifirst.net
 [46.193.9.130]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8B2F240005;
 Tue, 14 May 2019 20:01:38 +0000 (UTC)
Date: Tue, 14 May 2019 22:01:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UFxxG
Message-ID: <20190514220136.5f4624ee@xps13>
In-Reply-To: <e53a0569-6eca-4385-007d-baffc3f5c7ea@kontron.de>
References: <20190510121727.29834-1-lede@allycomm.com>
 <3cb32209-f246-e562-2aee-fdf566a60b30@kontron.de>
 <1023ba21-b188-1dcc-3ecc-c563d4cb8a67@allycomm.com>
 <e53a0569-6eca-4385-007d-baffc3f5c7ea@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_130150_294071_F0645974 
X-CRM114-Status: GOOD (  22.45  )
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
Cc: Jeff Kletsky <lede@allycomm.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2NocmVtcGYsCgpTY2hyZW1wZiBGcmllZGVyIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24u
ZGU+IHdyb3RlIG9uIFR1ZSwgMTQgTWF5CjIwMTkgMTY6MTE6MjggKzAwMDA6Cgo+IEhpIEplZmYs
Cj4gCj4gT24gMTQuMDUuMTkgMTc6NDIsIEplZmYgS2xldHNreSB3cm90ZToKPiA+IE9uIDUvMTMv
MTkgNjo1NiBBTSwgU2NocmVtcGYgRnJpZWRlciB3cm90ZToKPiA+ICAgCj4gPj4gSGkgSmVmZiwK
PiA+Pgo+ID4+IEkganVzdCBub3RpY2VkIEkgaGl0IHRoZSB3cm9uZyBidXR0b24gYW5kIG15IHBy
ZXZpb3VzIHJlcGx5IHdhcyBvbmx5Cj4gPj4gc2VudCB0byB0aGUgTVREIGxpc3QsIHNvIEknbSBy
ZXNlbmRpbmcgd2l0aCBmaXhlZCByZWNpcGllbnRzLi4uCj4gPj4KPiA+PiBPbiAxMC4wNS4xOSAx
NDoxNyxsZWRlQGFsbHljb21tLmNvbSAgd3JvdGU6ICAKPiA+Pj4gRnJvbTogSmVmZiBLbGV0c2t5
PGdpdC1jb21taXRzQGFsbHljb21tLmNvbT4KPiA+Pj4KPiA+Pj4gVGhlIEdpZ2FEZXZpY2UgR0Q1
RjFHUTRVRnh4RyBTUEkgTkFORCBpcyBpbiBjdXJyZW50IHByb2R1Y3Rpb24gZGV2aWNlcwo+ID4+
PiBhbmQsIHdoaWxlIGl0IGhhcyB0aGUgc2FtZSBsb2dpY2FsIGxheW91dCBhcyB0aGUgRS1zZXJp
ZXMgZGV2aWNlcywKPiA+Pj4gaXQgZGlmZmVycyBpbiB0aGUgU1BJIGludGVyZmFjaW5nIGluIHNp
Z25pZmljYW50IHdheXMuCj4gPj4+Cj4gPj4+IFRvIGFjY29tbW9kYXRlIHRoZXNlIGNoYW5nZXMs
IHRoaXMgcGF0Y2ggYWxzbzoKPiA+Pj4KPiA+Pj4gICAgICogQWRkcyBzdXBwb3J0IGZvciB0d28t
Ynl0ZSBtYW51ZmFjdHVyZXIgSURzCj4gPj4+ICAgICAqIEFkZHMgI2RlZmluZS1zIGZvciB0aHJl
ZS1ieXRlIGFkZHJlc3NpbmcgZm9yIHJlYWQgb3BzCj4gPj4+Cj4gPj4+IGh0dHA6Ly93d3cuZ2ln
YWRldmljZS5jb20vZGF0YXNoZWV0L2dkNWYxZ3E0eGZ4eGcvCj4gPj4+Cj4gPj4+IFNpZ25lZC1v
ZmYtYnk6IEplZmYgS2xldHNreTxnaXQtY29tbWl0c0BhbGx5Y29tbS5jb20+ICAKPiA+PiBNYXli
ZSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gc3BsaXQgdGhpcyBwYXRjaCBpbnRvIHRocmVlIHBhcnRz
Ogo+ID4+ICogQWRkIHN1cHBvcnQgZm9yIHR3by1ieXRlIGRldmljZSBJRHMKPiA+PiAqIEFkZCAj
ZGVmaW5lLXMgZm9yIHRocmVlLWJ5dGUgYWRkcmVzc2luZyBmb3IgcmVhZCBvcHMKPiA+PiAqIEFk
ZCBzdXBwb3J0IGZvciBHRDVGMUdRNFVGeHhHCj4gPj4KPiA+PiBBbnl3YXkgdGhlIGNvbnRlbnQg
bG9va3MgZ29vZCB0byBtZSwgc286Cj4gPj4KPiA+PiBSZXZpZXdlZC1ieTogRnJpZWRlciBTY2hy
ZW1wZjxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+Cj4gPj4KPiA+PiBbLi4uXSAgCj4gPiAK
PiA+IFRoYW5rcyBmb3IgdGhlIHRpbWUgaW4gcmV2aWV3IGFuZCBnb29kIHdvcmRzISAgCj4gCj4g
WW91J3JlIHdlbGNvbWUhCj4gCj4gPiBNeSBhcG9sb2dpZXMgZm9yIGFuIGluY29tcGxldGUgZ2l0
LXNlbmQtZW1haWwgY29uZmlnIHRoYXQgbGVmdAo+ID4gbWUgbmFtZWxlc3MgaW4gdGhlIGhlYWRl
cnMuICAKPiAKPiBObyBwcm9ibGVtLCBJIGd1ZXNzZWQgeW91ciBuYW1lIGZyb20gdGhlIFNpZ25l
ZC1vZmYtYnkgdGFnIDspCj4gCj4gPiBJIHdhc24ndCBzdXJlIGlmIHRoYXQgd2FzIGRpcmVjdGlv
biB0byBzdWJtaXQgYXMgdGhyZWUgcGF0Y2hlcwo+ID4gYXQgdGhpcyB0aW1lLCBidXQgd291bGQg
YmUgaGFwcHkgdG8gZG8gc28gaWYgdGhlIGNvbnNlbnN1cyBpcwo+ID4gdGhhdCBpdCB0aGUgZGly
ZWN0aW9uIHRvIGZvbGxvdy4gIAo+IAo+IEkgdGhpbmsgaXQncyBjb21tb24gdG8gc2VwYXJhdGUg
bG9naWNhbCBkaWZmZXJlbnQgY2hhbmdlcy4gVGhpcyBtYWtlcyBpdCAKPiBlYXNpZXIgdG8gcmVh
ZC4KPiBBbHNvIHRoZSBwcmVwYXJhdGlvbiBjaGFuZ2VzIG9ubHkgdG91Y2ggdGhlIFNQSSBOQU5E
IGNvcmUuIEkgZ3Vlc3MgCj4gdGhhdCdzIGFub3RoZXIgcmVhc29uIHdoeSB0aGV5IHNob3VsZCBi
ZSBzZXBhcmF0ZWQgZnJvbSB0aGUgCj4gY2hpcC1zcGVjaWZpYyBjaGFuZ2VzLgo+IAo+ID4gQXQg
bGVhc3QgZm9yIG1lLCBJIGZlZWwgdGhhdCB0aGUgb3RoZXIgdHdvIGRvbid0IHJlYWxseSBzdGFu
ZAo+ID4gb24gdGhlaXIgb3duIHdpdGhvdXQgdGhlIGNvbnRleHQgZm9yIHRoZWlyIG5lZWQuICAK
PiAKPiBJIGRvbid0IHRoaW5rIHRoYXQncyBhIHByb2JsZW0uIEp1c3QgYWRkIGEgbm90ZSB0byB0
aGUgY29tbWl0IG1lc3NhZ2UgCj4gdGhhdCB0aGVzZSBjb3JlIGNoYW5nZXMgYXJlIG5lZWRlZCB0
byBwcmVwYXJlIGZvciB0aGUgR0Q1RjFHUTRVRnh4RyBzdXBwb3J0Lgo+IAo+IFRoYW5rcywKPiBG
cmllZGVyCgpJIGFncmVlIHdpdGggRnJpZWRlciwgaWYgeW91IGRvbid0IG1pbmQsIHBsZWFzZSBz
cGxpdCB0aGlzIGNvbW1pdCBpbgp0aHJlZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
