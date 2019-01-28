Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7256C282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:55:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3A6E21736
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 09:55:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BlBbV0Km"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3A6E21736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYc2umpj0sM3N5eFVkdzRhiPk9crQCpy8/MmDZwlS7Q=; b=BlBbV0Km3MzuVr
	hqSyhsQ6IEOr1BgFM0fWMT3vSTRJqXLGzXJHpKH5ye2+0UJeIw2f60VlVofy36fW9vYOyEepJkRwT
	fmOlYkxt2c4VQhGX9/o7nlrC9bgDDxSTin8+TlnC6+z57AGpZaZeU20S10pW1P3P09KckKnE3cTpM
	RmO8xBoSUIspKqkkFa4+llS36fd5efL2/l8vwEW6hvkqwg7Dtn68UxY/Oyss5jIIN86ReAGL+8wF2
	TkGTkijIpYoUd61JZLZh/MGTL1+GgZlG4pv/Mp4lJePAIJihunwIYFCSFsU/f+vsBIZ1j33nrjHgZ
	HQnutZFjBpJ3A1Fe3P2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go3dX-0002W1-Nm; Mon, 28 Jan 2019 09:55:27 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go3dV-0002VT-1m
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 09:55:26 +0000
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id E6D8220000C;
 Mon, 28 Jan 2019 09:55:15 +0000 (UTC)
Date: Mon, 28 Jan 2019 10:55:14 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] mtd: spinand: Handle the case where PROGRAM LOAD does
 not reset the cache
Message-ID: <20190128105514.5cae236e@xps13>
In-Reply-To: <20190125170851.3d918da5@bbrezillon>
References: <20190124142007.11607-1-bbrezillon@kernel.org>
 <8f80c33f-b236-27e6-3d87-a8362ad41326@denx.de>
 <CAO1O6scZ12d-5rLnakDy0Wefg4fw=dGS3jPoJtqKztsdMrsjhw@mail.gmail.com>
 <20190124173357.2a4d7f13@bbrezillon>
 <20190125120910.59c33a4b@xps13>
 <20190125170851.3d918da5@bbrezillon>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_015525_252001_263AB9A7 
X-CRM114-Status: GOOD (  18.11  )
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
Cc: Stefan Roese <sr@denx.de>, Richard Weinberger <richard@nod.at>,
 Emil Lenngren <emil.lenngren@gmail.com>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4gd3JvdGUg
b24gRnJpLCAyNSBKYW4gMjAxOQoxNzowODo1MSArMDEwMDoKCj4gT24gRnJpLCAyNSBKYW4gMjAx
OSAxMjowOToxMCArMDEwMAo+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+IHdyb3RlOgo+IAo+ID4gSGVsbG8sCj4gPiAKPiA+IEJvcmlzIEJyZXppbGxvbiA8YmJyZXpp
bGxvbkBrZXJuZWwub3JnPiB3cm90ZSBvbiBUaHUsIDI0IEphbiAyMDE5Cj4gPiAxNzozMzo1NyAr
MDEwMDoKPiA+ICAgCj4gPiA+IE9uIFRodSwgMjQgSmFuIDIwMTkgMTc6MTY6MzcgKzAxMDAKPiA+
ID4gRW1pbCBMZW5uZ3JlbiA8ZW1pbC5sZW5uZ3JlbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiAg
ICAgCj4gPiA+ID4gSGksCj4gPiA+ID4gCj4gPiA+ID4gRGVuIHRvcnMgMjQgamFuLiAyMDE5IGts
IDE2OjI4IHNrcmV2IFN0ZWZhbiBSb2VzZSA8c3JAZGVueC5kZT46ICAgICAgCj4gPiA+ID4gPgo+
ID4gPiA+ID4gT24gMjQuMDEuMTkgMTU6MjAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZTogICAgICAg
IAo+ID4gPiA+ID4gPiBMb29rcyBsaWtlIFBST0dSQU0gTE9BRCAoQUtBIHdyaXRlIGNhY2hlKSBk
b2VzIG5vdCBuZWNlc3NhcmlseSByZXNldAo+ID4gPiA+ID4gPiB0aGUgY2FjaGUgY29udGVudCB0
byAweEZGIChkZXBlbmRzIG9uIHZlbmRvciBpbXBsZW1lbnRhdGlvbiksIHNvIHdlCj4gPiA+ID4g
PiA+IG11c3QgZmlsbCB0aGUgcGFnZSBjYWNoZSBlbnRpcmVseSBldmVuIGlmIHdlIG9ubHkgd2Fu
dCB0byBwcm9ncmFtIHRoZQo+ID4gPiA+ID4gPiBkYXRhIHBvcnRpb24gb2YgdGhlIHBhZ2UsIG90
aGVyd2lzZSB3ZSBtaWdodCBjb3JydXB0IHRoZSBCQk0gb3IgdXNlcgo+ID4gPiA+ID4gPiBkYXRh
IHByZXZpb3VzbHkgcHJvZ3JhbW1lZCBpbiBPT0IgYXJlYS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gRml4ZXM6IDc1MjlkZjQ2NTI0OCAoIm10ZDogbmFuZDogQWRkIGNvcmUgaW5mcmFzdHJ1Y3R1
cmUgdG8gc3VwcG9ydCBTUEkgTkFORHMiKQo+ID4gPiA+ID4gPiBSZXBvcnRlZC1ieTogU3RlZmFu
IFJvZXNlIDxzckBkZW54LmRlPgo+ID4gPiA+ID4gPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmc+Cj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8YmJyZXppbGxv
bkBrZXJuZWwub3JnPiAgICAgICAgCj4gPiA+ID4gPgo+ID4gPiA+ID4gV29ya3MgZmluZSAobGlt
aXRlZCB0ZXN0aW5nIG9ubHkgeWV0KSwgc286Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVGVzdGVkLWJ5
OiBTdGVmYW4gUm9lc2UgPHNyQGRlbnguZGU+Cj4gPiA+ID4gPiBSZXZpZXdlZC1ieTogU3RlZmFu
IFJvZXNlIDxzckBkZW54LmRlPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoYW5rcywKPiA+ID4gPiA+
IFN0ZWZhbgo+ID4gPiA+ID4gICAgICAgIAo+ID4gPiA+IAo+ID4gPiA+IENhbiB0aGlzIHF1aXJr
IGJlIG1hZGUgdmVuZG9yIHNwZWNpZmljPyAgICAgIAo+ID4gPiAKPiA+ID4gV2UgY2FuIG1ha2Ug
aXQgdmVuZG9yIHNwZWNpZmljLCBhcyBsb25nIGFzIGl0J3MgYW4gb3B0LWluIHRoaW5nLiBUaGlz
Cj4gPiA+IHdheSwgdGhlIGRlZmF1bHQgYmVoYXZpb3IgaXMgdGhlIHNhZmVzdCBvbmUsIGFuZCBv
bmx5IHdoZW4gd2Uga25vdyBhCj4gPiA+IGNoaXAgZG9lcyByZXNldCB0aGUgY2FjaGUgY29udGVu
dCBvbiBhIFBST0dSQU0gTE9BRCB0aW1lIGNhbiB3ZSBhZGQgdGhpcwo+ID4gPiBmbGFnLiAgICAK
PiA+IAo+ID4gSSBhbSBmaW5lIHdpdGggdGhpcyBhcHByb2FjaC4gIAo+IAo+IERvZXMgdGhhdCBz
dGFuZCBmb3IgYSBSZXZpZXdlZC1ieS9BY2tlZC1ieT8gVG8gbWFrZSBpdCBjbGVhciwgSSB3YXMK
PiBzYXlpbmcgdGhhdCB3ZSBzaG91bGQgZml4IHRoaW5ncyBmaXJzdCAod2l0aCB0aGlzIGZpeCkg
YW5kIG9ubHkgdGhlbgo+IG9wdGltaXplIHRoaW5ncyBmb3IgY2hpcHMgdGhhdCBhY3R1YWxseSBy
ZXNldCB0aGUgY2FjaGUgd2hlbiBQUk9HUkFNCj4gTE9BRCBpcyBleGVjdXRlZC4gSSB3YXMgbm90
IHBsYW5uaW5nIG9uIHNlbmRpbmcgYSBuZXcgdmVyc2lvbiBvZiB0aGlzCj4gcGF0Y2gsIHVubGVz
cyB5b3Ugc2VlIGdvb2QgcmVhc29ucyB0byBkbyBzby4KCkkgdGhvdWdodCB5b3Ugd291bGQgc2Vu
ZCBhIHYyIGJ1dCBJIGFtIGZpbmUgd2l0aCB0aGlzIGFwcHJvYWNoIHRvby4KCkFja2VkLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
