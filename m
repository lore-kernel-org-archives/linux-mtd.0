Return-Path: <SRS0=01Ca=NV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16ACAC432BE
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 09:22:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACB7560F44
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 09:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ACB7560F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iottRBh8NHnQ+4WYBXat97l1DCC2a0H6l0pdOql9odk=; b=O/aEkiuGoXobae
	Wd9FN4lT/8L8JZ62VTuHFN7KwnZYtq6IruuaUARV1MOz25P7BfUMG6A7Ng0RLRP7A1m5wqEv5Z0EA
	ExdTUHwLhkki269oArSwzPY6ma/5MRlUe2HqiuLrbAIX2m+6gWSK6/J5v/tSV934keYcgrJeBLttm
	MHVOkjxERsfwYe0I2gVZxKb5nLRTV9DGpRbf7DASumMinQGpghAzdB7P5i9j6Z4ANSNOX5Q5ZOAFV
	3b6/oZMdCoW4dzrJ6x0DGpY7VjEsc5JddRV645iI+SUKXrRwpzsQZGf8/h6vfv5tRmQKf1dFQ/xKy
	DqdAEQ1GMFbnbkzl1WJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKdTa-00GqqB-Tb; Mon, 30 Aug 2021 09:21:10 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKdTU-00Gqok-3K
 for linux-mtd@lists.infradead.org; Mon, 30 Aug 2021 09:21:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2E0A5240007;
 Mon, 30 Aug 2021 09:20:59 +0000 (UTC)
Date: Mon, 30 Aug 2021 11:20:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Frieder Schrempf <frieder@fris.de>, stable@vger.kernel.org, voice INTER
 connect GmbH <developer@voiceinterconnect.de>, Alexander Lobakin
 <alobakin@pm.me>, Felix Fietkau <nbd@nbd.name>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 YouChing Lin <ycllin@mxic.com.tw>
Subject: Re: [RESEND PATCH 5.10.x] mtd: spinand: Fix incorrect parameters
 for on-die ECC
Message-ID: <20210830112057.202355ef@xps13>
In-Reply-To: <35e30f69-c6f8-ac9c-2314-f566190ac2cb@kontron.de>
References: <20210830072108.13770-1-frieder@fris.de>
 <20210830104122.58f9cdaf@xps13>
 <35e30f69-c6f8-ac9c-2314-f566190ac2cb@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_022104_351485_3D0D72FD 
X-CRM114-Status: GOOD (  22.96  )
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

SGkgRnJpZWRlciwKCkZyaWVkZXIgU2NocmVtcGYgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5k
ZT4gd3JvdGUgb24gTW9uLCAzMCBBdWcKMjAyMSAxMToxODo1MCArMDIwMDoKCj4gT24gMzAuMDgu
MjEgMTA6NDEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGcmllZGVyLAo+ID4gCj4gPiBG
cmllZGVyIFNjaHJlbXBmIDxmcmllZGVyQGZyaXMuZGU+IHdyb3RlIG9uIE1vbiwgMzAgQXVnIDIw
MjEgMDk6MjE6MDcKPiA+ICswMjAwOgo+ID4gICAKPiA+PiBGcm9tOiBGcmllZGVyIFNjaHJlbXBm
IDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+Cj4gPj4KPiA+PiBUaGUgbmV3IGdlbmVyaWMg
TkFORCBFQ0MgZnJhbWV3b3JrIHN0b3JlcyB0aGUgY29uZmlndXJhdGlvbiBhbmQgcmVxdWlyZW1l
bnRzCj4gPj4gaW4gc2VwYXJhdGUgcGxhY2VzIHNpbmNlIGNvbW1pdCA5M2VmOTJmNmY0MjIgKCIg
bXRkOiBuYW5kOiBVc2UgdGhlIG5ldyBnZW5lcmljIEVDQyBvYmplY3QgIikuCj4gPj4gSW4gNS4x
MC54IFRoZSBTUEkgTkFORCBsYXllciBzdGlsbCB1c2VzIG9ubHkgdGhlIHJlcXVpcmVtZW50cyB0
byB0cmFjayB0aGUgRUNDCj4gPj4gcHJvcGVydGllcy4gVGhpcyBtaXNtYXRjaCBsZWFkcyB0byB2
YWx1ZXMgb2YgemVybyBiZWluZyB1c2VkIGZvciBFQ0Mgc3RyZW5ndGgKPiA+PiBhbmQgc3RlcF9z
aXplIGluIHRoZSBTUEkgTkFORCBsYXllciB3aGVyZXZlciBuYW5kZGV2X2dldF9lY2NfY29uZigp
IGlzIHVzZWQgYW5kCj4gPj4gdGhlcmVmb3JlIGJyZWFrcyB0aGUgU1BJIE5BTkQgb24tZGllIEVD
QyBzdXBwb3J0IGluIDUuMTAueC4KPiA+Pgo+ID4+IEJ5IHVzaW5nIG5hbmRkZXZfZ2V0X2VjY19y
ZXF1aXJlbWVudHMoKSBpbnN0ZWFkIG9mIG5hbmRkZXZfZ2V0X2VjY19jb25mKCkgZm9yCj4gPj4g
U1BJIE5BTkQsIHdlIG1ha2Ugc3VyZSB0aGF0IHRoZSBjb3JyZWN0IHBhcmFtZXRlcnMgZm9yIHRo
ZSBkZXRlY3RlZCBjaGlwIGFyZQo+ID4+IHVzZWQuIEluIGxhdGVyIHZlcnNpb25zICg1LjExLngp
IHRoaXMgaXMgZml4ZWQgYW55d2F5IHdpdGggdGhlIGltcGxlbWVudGF0aW9uCj4gPj4gb2YgdGhl
IFNQSSBOQU5EIG9uLWRpZSBFQ0MgZW5naW5lLgo+ID4+Cj4gPj4gQ2M6IHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmcgIyA1LjEwLngKPiA+PiBSZXBvcnRlZC1ieTogdm9pY2UgSU5URVIgY29ubmVjdCBH
bWJIIDxkZXZlbG9wZXJAdm9pY2VpbnRlcmNvbm5lY3QuZGU+Cj4gPj4gU2lnbmVkLW9mZi1ieTog
RnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPiAgCj4gPiAKPiA+
IFdoeSBub3QganVzdCByZXZlcnRpbmcgOWEzMzNhNzJjMWQwICgibXRkOiBzcGluYW5kOiBVc2UK
PiA+IG5hbmRkZXZfZ2V0X2VjY19jb25mKCkgd2hlbiByZWxldmFudCIpPyBJIHRoaW5rIHVzaW5n
IHRoaXMgIm5ldyIKPiA+IG5hbmRkZXZfZ2V0X2VjY19yZXF1aXJlbWVudHMoKSBoZWxwZXIgYmVj
YXVzZSBpdCBmaXRzIHRoZSBwdXJwb3NlIGV2ZW4KPiA+IGlmIGl0IGlzIHdyb25nIFsxXSBkb2Vz
bid0IGJyaW5nIHRoZSByaWdodCBpbmZvcm1hdGlvbi4gSSBrbm93IGl0IGlzCj4gPiBzdHJpY3Rs
eSBlcXVpdmFsZW50IGJ1dCBJIHdvdWxkIHBlcnNvbmFsbHkgcHJlZmVyIGtlZXBpbmcgdGhlIG9s
ZAo+ID4gd3JpdGluZyAibmFuZC0+ZWNjcmVxLnh4eHgiLiAgCj4gCj4gSSB0aGluayByZXZlcnRp
bmcgOWEzMzNhNzJjMWQwIHRvIHVzZSBuYW5kLT5lY2NyZXEueHh4eCBkb2Vzbid0IHdvcmsgYXMg
dGhlIGVjY3JlcSBtZW1iZXIgaGFzIGFscmVhZHkgYmVlbiByZW1vdmVkIGluIDkzZWY5MmY2ZjQy
MiAoIm10ZDogbmFuZDogVXNlIHRoZSBuZXcgZ2VuZXJpYyBFQ0Mgb2JqZWN0IikuIFNvIHdlIHdv
dWxkIG5lZWQgdG8gcmV2ZXJ0IHRoaXMgY29tbWl0LCB0b28uIFRoYXQgd291bGQgd29yayBmb3Ig
dGhlIFNQSSBOQU5EIGxheWVyLCBidXQgbWlnaHQgaGF2ZSBpbXBsaWNhdGlvbnMgb24gUkFXIE5B
TkQgYXMgaXQgYWxyZWFkeSB1c2VzIHRoZSBuZXcgZ2VuZXJpYyBFQ0Mgb2JqZWN0IHdpdGggJ2N0
eC5jb25mJyBhbmQgJ3JlcXVpcmVtZW50cycuIEF0IGxlYXN0IEkgY2FuJ3QgdGVsbCBob3cgdGhp
cyB3b3VsZCBhZmZlY3QgdGhlIFJBVyBOQU5EIGxheWVyLgoKSSBtaXNzZWQgdGhhdCwgeW91J3Jl
IHJpZ2h0LgoKQWNrZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+Cgo+IAo+ID4gCj4gPiBbMV0gV2UgZG9uJ3Qgd2FudCB0aGUgcmVxdWlyZW1lbnRzIGJ1dCB0
aGUgYWN0dWFsIGN1cnJlbnQgY29uZmlndXJhdGlvbgo+ID4gaGVyZSwgd2hpY2ggd2FzIHRoZSBw
cmltYXJ5IHB1cnBvc2Ugb2YgdGhlIGluaXRpYWwgcGF0Y2ggd2hpY2ggZW5kZWQKPiA+IGJlaW5n
IGEgbWlzdGFrZSBhdCB0aGF0IHBvaW50IGluIHRpbWUgYmVjYXVzZSB0aGUgU1BJLU5BTkQgY29y
ZSB3YXMgbm90Cj4gPiByZWFkeSB5ZXQuCj4gPiAKPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwgIAoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
