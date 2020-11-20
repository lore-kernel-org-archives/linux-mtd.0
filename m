Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BB3C56202
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 10:52:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83CF42078B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 10:52:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dnShs5r/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83CF42078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j6wv9jxw7C3QgRS3hu9tQ4EtkWHBJ+RKT14WFDA5NxE=; b=dnShs5r/6nPMWtUGb/XnzJwB5
	HdN8QilRvG7VQB/SfuQED5aR0LMNxK3rDEcOalsG9SapecKGFb9dMeMk+a7470rz2TiZB5AjtD2uq
	WlNC4eiS7O2g0cSHdKUtXFoU16r60fqVai/uiVmnVWnEZuD+sQhJV8667cIwpuUivBNfhxrsDA9s/
	egdsG3C9PKuh1t/CDP0v/Lxp5JpiiYesKMfgaqqhCvVPuw9JwE6bXFSb2oYNb1mODoWRhvmFdhUBg
	59HHtq5OIrtEAYgGVB1CLdWVlFLyF223Rp4j/1HOeQA5aN6yG2hSdbSegXEmwmESqv2h6HbInp/ka
	16FkUpONQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg40b-0003oS-8I; Fri, 20 Nov 2020 10:51:17 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg40Y-0003nw-79
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 10:51:15 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 73236E0029;
 Fri, 20 Nov 2020 10:51:11 +0000 (UTC)
Date: Fri, 20 Nov 2020 11:51:09 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: mtd: rawnand: gpmi: regression since
 e5e5631cc88987a6f3cd8304660bd9190da95916
Message-ID: <20201120115109.198d0e5d@xps13>
In-Reply-To: <20201117123001.GE29830@pengutronix.de>
References: <315838324eb25d3a1ab37ee90fa28fa1cdc48cae.camel@pengutronix.de>
 <20201117123001.GE29830@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_055114_473712_152D8E8C 
X-CRM114-Status: GOOD (  16.20  )
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
 linux-kernel@vger.kernel.org, Juergen Borleis <jbe@pengutronix.de>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+IHdyb3RlIG9uIFR1ZSwg
MTcgTm92IDIwMjAKMTM6MzA6MDEgKzAxMDA6Cgo+IE9uIFR1ZSwgTm92IDE3LCAyMDIwIGF0IDEx
OjE2OjI2QU0gKzAxMDAsIEp1ZXJnZW4gQm9ybGVpcyB3cm90ZToKPiA+IEhpLAo+ID4gCj4gPiBy
ZWFkaW5nIGEgTkFORCBwYWdlIGluIHJhdyBtb2RlIGlzIHJlcXVpcmVkIHRvIGNoZWNrIHRoZSBj
b25zaXN0ZW5jZSBvZiB0aGUgc28tCj4gPiBjYWxsZWQgRkNCcyAodXNlZCB0byBib290IHRoZSBT
b0MgZnJvbSBOQU5EIGNvbnRlbnQpLgo+ID4gCj4gPiBCZWZvcmUgZTVlNTYzMWNjODg5ODdhNmYz
Y2Q4MzA0NjYwYmQ5MTkwZGE5NTkxNiAoIm10ZDogcmF3bmFuZDogZ3BtaTogVXNlCj4gPiBuYW5k
X2V4dHJhY3RfYml0cygpIikgaXQgcmVhZHMgdGhlIGZpcnN0IHBhZ2Ugb2YgdGhlIE5BTkQgY29y
cmVjdGx5IGFzOgo+ID4gCj4gPiAwMDAwMDAwMCAgMDAgMDAgODggZmIgZmYgZmYgNDYgNDMgIDQy
IDIwIDAwIDAwIDAwIDAxIDUwIDNjICB8Li4uLi4uRkNCIC4uLi5QPHwKPiA+IDAwMDAwMDEwICAx
OSAwNiAwMCAwMCAwMCAwMCAwMCAwOCAgMDAgMDAgODAgMDggMDAgMDAgNDAgMDAgIHwuLi4uLi4u
Li4uLi4uLkAufAo+ID4gMDAwMDAwMjAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAwMCAwMCAw
MCAwMCAwMCAwMCAwOSAwMCAgfC4uLi4uLi4uLi4uLi4uLi58Cj4gPiAwMDAwMDAzMCAgMDAgMDAg
MDAgMDIgMDAgMDAgMDAgMDIgIDAwIDAwIDA5IDAwIDAwIDAwIDBhIDAwICB8Li4uLi4uLi4uLi4u
Li4uLnwKPiA+IDAwMDAwMDQwICAwMCAwMCAwMyAwMCAwMCAwMCAwMCAwMCAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgIHwuLi4uLi4uLi4uLi4uLi4ufAo+ID4gMDAwMDAwNTAgIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgfC4uLi4uLi4uLi4uLi4uLi58
Cj4gPiAwMDAwMDA2MCAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIDAwIDAwIDAwIDAxIDAwIDAw
IDgwIDEwICB8Li4uLi4uLi4uLi4uLi4uLnwKPiA+IDAwMDAwMDcwICAwMCAwMCA1NSAwMSAwMCAw
MCA1NSAwMSAgMDAgMDAgMDEgMDAgMDAgMDAgOWUgMDcgIHwuLlUuLi5VLi4uLi4uLi4ufAo+ID4g
MDAwMDAwODAgIDAwIDAwIDAyIDAwIDAwIDAwIDAwIDA4ICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAgfC4uLi4uLi4uLi4uLi4uLi58Cj4gPiAwMDAwMDA5MCAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICB8Li4uLi4uLi4uLi4uLi4uLnwKPiA+ICoKPiA+
IDAwMDAwMjAwICA0MCAwNSAwMCAwMCAwMCAwMCAwMCAwMCAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgIHxALi4uLi4uLi4uLi4uLi4ufAo+ID4gMDAwMDAyMTAgIDQwIDAxIDAwIDAwIDAwIDgwIDA1
IDAwICAwMCA4MCAwNSAwMCA0MCAwMSAwMCAwMCAgfEAuLi4uLi4uLi4uLkAuLi58Cj4gPiAwMDAw
MDIyMCAgYzAgMDMgMDAgMDAgODAgMDIgMDAgMDAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICB8
Li4uLi4uLi4uLi4uLi4uLnwKPiA+IDAwMDAwMjMwICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIHwuLi4uLi4uLi4uLi4uLi4ufAo+ID4gMDAwMDAyNDAg
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAwMCAwMCAwMCAwMCAwMCAwMCAwNyAwMCAgfC4uLi4u
Li4uLi4uLi4uLi58Cj4gPiAwMDAwMDI1MCAgODAgODMgMDYgMDAgMDAgMDAgMDcgMDAgIDAwIDAw
IDA3IDAwIDAwIDA3IDAwIDAwICB8Li4uLi4uLi4uLi4uLi4uLnwKPiA+IDAwMDAwMjYwICAwMCA0
MiAwNiAwMCA4MCAwNSAwMCAwMCAgMDAgNDAgMDYgMDAgMDAgMDAgMDAgMDAgIHwuQi4uLi4uLi5A
Li4uLi4ufAo+ID4gMDAwMDAyNzAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAgfC4uLi4uLi4uLi4uLi4uLi58Cj4gPiAqCj4gPiAwMDAwMDc5MCAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIGZjICB8Li4uLi4uLi4u
Li4uLi4uLnwKPiA+IDAwMDAwN2EwICAwMyAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgIHwuLi4uLi4uLi4uLi4uLi4ufAo+ID4gMDAwMDA3YjAgIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgfC4uLi4uLi4uLi4uLi4u
Li58Cj4gPiAqCj4gPiAwMDAwMDgwMCAgZmYgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIDAwIDAwIDAw
IDAwIDE3IDE1IDA2IDA2ICB8Li4uLi4uLi4uLi4uLi4uLnwKPiA+IDAwMDAwODEwICAxMCAxZiAw
MyAwNyAwMCAwMCAwMCAxYyAgMGYgMTcgMWYgMDUgMDAgMDAgMDAgMDAgIHwuLi4uLi4uLi4uLi4u
Li4ufAo+ID4gMDAwMDA4MjAgIDAwIDE5IDAwIDAwIDBlIDE5IDAwIDAwICAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAgfC4uLi4uLi4uLi4uLi4uLi58Cj4gPiAwMDAwMDgzMCAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICB8Li4uLi4uLi4uLi4uLi4uLnwK
PiA+ICoKPiA+IDAwMDAwODgwCj4gPiAKPiA+IEFmdGVyIGFwcGx5aW5nIGU1ZTU2MzFjYzg4OTg3
YTZmM2NkODMwNDY2MGJkOTE5MGRhOTU5MTYgcmVhZGluZyB0aGUgc2FtZSBwYWdlCj4gPiB0aGUg
cmVwb3J0ZWQgY29udGVudCBpcyBicm9rZW4gKHRoZSBOQU5EIHBhZ2Ugc3RpbGwgY29udGFpbnMg
Y29ycmVjdCBkYXRhKToKPiA+IAo+ID4gMDAwMDAwMDAgIDAwIDAwIDg4IGZiIGZmIGZmIDQ2IDQz
ICA0MiAyMCAwMCAwMCAwMCAwMSA1MCAzYyAgfC4uLi4uLkZDQiAuLi4uUDx8Cj4gPiAwMDAwMDAx
MCAgMTkgMDYgMDAgMDAgMDAgMDAgMDAgMDggIDAwIDAwIDgwIDA4IDAwIDAwIDQwIDAwICB8Li4u
Li4uLi4uLi4uLi5ALnwKPiA+IDAwMDAwMDIwICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgMDAg
MDAgMDAgMDAgMDAgMDAgMDkgMDAgIHwuLi4uLi4uLi4uLi4uLi4ufAo+ID4gMDAwMDAwMzAgIDAw
IDAwIDAwIDAyIDAwIDAwIDAwIDAyICAwMCAwMCAwOSAwMCAwMCAwMCAwYSAwMCAgfC4uLi4uLi4u
Li4uLi4uLi58Cj4gPiAwMDAwMDA0MCAgNDAgMDUgMDAgMDAgMDAgMDAgMDAgMDAgIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwICB8QC4uLi4uLi4uLi4uLi4uLnwKPiA+IDAwMDAwMDUwICA0MCAwMSAw
MCAwMCAwMCA4MCAwNSAwMCAgMDAgODAgMDUgMDAgNDAgMDEgMDAgMDAgIHxALi4uLi4uLi4uLi5A
Li4ufAo+ID4gMDAwMDAwNjAgIGMwIDAzIDAwIDAwIDgwIDAyIDAwIDAwICAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAgfC4uLi4uLi4uLi4uLi4uLi58Cj4gPiAwMDAwMDA3MCAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICB8Li4uLi4uLi4uLi4uLi4uLnwK
PiA+ICoKPiA+IDAwMDAwMjUwICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgZmMgIHwuLi4uLi4uLi4uLi4uLi4ufAo+ID4gMDAwMDAyNjAgIDAzIDAwIDAwIDAw
IDAwIDAwIDAwIDAwICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgfC4uLi4uLi4uLi4uLi4uLi58
Cj4gPiAwMDAwMDI3MCAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwICB8Li4uLi4uLi4uLi4uLi4uLnwKPiA+ICoKPiA+IDAwMDAwMmMwICAwNiA3MCBjMCBh
OCAwMCAwMCAwMCAwMCAgMDAgMDAgMDAgMDAgNDAgMDAgMDAgMDAgIHwucC4uLi4uLi4uLi5ALi4u
fCAgCj4gCj4gTm90ZSBiZWdpbm5pbmcgZnJvbSBvZmZzZXQgMHgyYzAgd2UgZ2V0IHNvbWUgdW5p
bml0aWFsaXplZCBkYXRhLiBBbW9uZwo+IG90aGVyIHRoaW5ncyB3ZSBzYXcgc3lzdGVtZCB1bml0
IGZpbGVzIHRoZXJlLgoKSW5kZWVkLCB0aGlzIHVuaXRpYWxpemVkIGRhdGEgbWFrZXMgbWUgdGhp
bmcgdGhhdCBpdCBpcyBub3QgZnVsbHkKcmVsYXRlZCB0byB0aGlzIHBhdGNoLiBIb25lc3RseSB0
aGlzIGlzIHN1cGVyIHdlaXJkLgoKSnVlcmdlbiB3b3VsZCB5b3UgaGF2ZSB0aGUgdGltZSB0byBk
ZWJ1ZyBpdCBmdXJ0aGVyPyBJIGRvbid0IGhhdmUgdGhlCm5lY2Vzc2FyeSBoYXJkd2FyZSB0byBp
bnZlc3RpZ2F0ZSB0aGlzIHJpZ2h0IG5vdy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
