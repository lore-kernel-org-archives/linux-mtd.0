Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEBCC47089
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 17:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YHgrjNrSjRUUKfYXpyuabI5QRyR+yDu+/KV3H9omtr8=; b=VAHpizclea9yuD
	RZC10RrHyIIxSLsspgVHQTB/zgRid1dChIk8N5PYli0cwzM5IgqF0l1pSquYTtURQdua02jUWAPzT
	vjYhBt1ZO41lBHRuoJlAwozxVskrjy+y2TBglE/4NDveERMKwi/JVPJoUq5nbbFT5iwDGSZifTZDR
	boWYsn6Eozz3HVaJQBfijdSz4oC0U1gBZmJaEsUKmTDgRZgqPzhsaGL/cP7Uq9eNq7svpxOnB5Y0o
	1mZs+rAX0//9VO2u5060eq5ngZCzjunsroAxL0CTBob63+1M6es+fZneDnJak/DMx+YMZaWYNJWsE
	EIojbOh3HfOIWEfB5l1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p19Os-000B6Y-QU; Fri, 02 Dec 2022 17:00:34 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p19M6-0009KZ-0M; Fri, 02 Dec 2022 16:57:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B8260240007;
	Fri,  2 Dec 2022 16:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670000257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=etV1734mfvPax6/p8v/lvQ2TEAFZx3vL9Ncfy36x1/M=;
	b=JF2tgYrz642xaQPLHkiGmJiM2nH0qI2IHlE76bzooVceCMHmb7QZgLxZF5riFGnWRFvSH9
	fsS4w4LchSvYci+mJxBBYsIXv1HXLpUJG7iYOKDRaec1w/9pQLTI8BUaZrX/KWcZ++Lzll
	mlAgYG6ZLgswg75Z6z6AkWsWENqSguNArHyN3GGBYwrGvSIhSQHMd2qQqn45wJ0ucXTodE
	4ctUpyP48csCXvIK67y1LcP4tEH5Jvcp/YvofnFe2FZPjjh+aqXQB5xaFi5J1ZEB0vrV7U
	BM9LrHjT/7QceVfVEbfmn+lu7TLCvx/ESJR64j2TxlFJj1p6kC6uSLABYxuJgg==
Date: Fri, 2 Dec 2022 17:57:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco@dolcini.it>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Francesco Dolcini
 <francesco.dolcini@toradex.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 u-boot@lists.denx.de
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is
 0
Message-ID: <20221202175730.231d75d5@xps-13>
In-Reply-To: <e80377c9-1542-d47d-6d35-2efdc15bcbf8@denx.de>
References: <20221202071900.1143950-1-francesco@dolcini.it>
	<20221202101418.6b4b3711@xps-13>
	<Y4nPmzdgaabg3a3/@francesco-nb.int.toradex.com>
	<Y4nSXQirO2N5IRfu@francesco-nb.int.toradex.com>
	<20221202115327.4475d3a2@xps-13>
	<Y4ngOaKq224LIpQc@francesco-nb.int.toradex.com>
	<20221202150556.14c5ae43@xps-13>
	<2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
	<20221202160030.1b8d0b8a@xps-13>
	<223b7a4e-3aff-8070-7387-c77d2ded1dd6@denx.de>
	<20221202164904.08d750df@xps-13>
	<0503c46d-c385-74f5-f762-51d87a5ebaff@denx.de>
	<20221202174255.2c1cb2ff@xps-13>
	<e80377c9-1542-d47d-6d35-2efdc15bcbf8@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_085742_427168_44E3D2D2 
X-CRM114-Status: GOOD (  38.12  )
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

SGkgTWFyZWssCgptYXJleEBkZW54LmRlIHdyb3RlIG9uIEZyaSwgMiBEZWMgMjAyMiAxNzo1Mjow
NSArMDEwMDoKCj4gT24gMTIvMi8yMiAxNzo0MiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhp
IE1hcmVrLCAgCj4gCj4gSGksCj4gCj4gWy4uLl0KPiAKPiA+Pj4gSG93ZXZlciwgaXQgc2hvdWxk
IG5vdCBiZSBlbXB0eSwgYXQgdGhlIHZlcnkgbGVhc3QgYSByZWcgcHJvcGVydHkKPiA+Pj4gc2hv
dWxkIGluZGljYXRlIG9uIHdoaWNoIENTIGl0IGlzIHdpcmVkLCBhcyBleHBlY3RlZCB0aGVyZToK
PiA+Pj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRk
L2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFu
ZC1jaGlwLnlhbWw/aD1tdGQvbmV4dCAgCj4gPj4KPiA+PiBPSywgSSBzZWUgeW91ciBwb2ludC4g
U28gYmFzaWNhbGx5IHRoaXM/Cj4gPj4KPiA+PiAmZ3BtaSB7Cj4gPj4gICAgICNzaXplLWNlbGxz
ID0gPDE+Owo+ID4+ICAgICAuLi4KPiA+PiAgICAgbmFuZC1jaGlwQDAgewo+ID4+ICAgICAgIHJl
ZyA9IDwwPjsKPiA+PiAgICAgfTsKPiA+PiB9Owo+ID4+Cj4gPj4gYnR3LiB0aGUgR1BNSSBOQU5E
IGNvbnRyb2xsZXIgc3VwcG9ydHMgb25seSBvbmUgY2hpcHNlbGVjdCwgc28gdGhlIHJlZyBpbiBu
YW5kLWNoaXAgbm9kZSBtYWtlcyBsaXR0bGUgc2Vuc2UuICAKPiA+IAo+ID4gSSByYW5kb21seSBv
cGVuZWQgYSByZWZlcmVuY2UgbWFudWFsIChJTVg2RFFMLnBkZiksIHRoZXkgc2F5Ogo+ID4gCj4g
PiAJIlVwIHRvIGZvdXIgTkFORCBkZXZpY2VzLCBzdXBwb3J0ZWQgYnkgZm91ciBjaGlwLXNlbGVj
dHMgYW5kIG9uZQo+ID4gCSBnYW5nZWQgcmVhZHkvIGJ1c3kuIiAgCj4gCj4gRG9oLCBhbmQgTVg3
RCBoYXMgdGhlIHNhbWUgY29udHJvbGxlciwgc28gc2l6ZS1jZWxscyA9IDwxPjsgbWFrZXMgc2Vu
c2Ugd2l0aCBuYW5kLWNoaXBATiB7fSAuCgpBY3R1YWxseSAjYWRkcmVzcy1jZWxscyBpcyBoZXJl
IGZvciB0aGF0LiBZb3UgbmVlZCB0byBwb2ludCBhdCBvbmUgQ1MsCnNvIGluIG1vc3QgY2FzZXMg
dGhpcyBpczoKCmNvbnRyb2xsZXIgewoJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cgkjc2l6ZS1jZWxs
cyA9IDwwPjsKCWNoaXBATiB7CgkJcmVnID0gPE4+OwoJfTsKfTsKCj4gCj4gPiBBbnl3YXksIHRo
ZSBOQU5EIGNvbnRyb2xsZXIgZ2VuZXJpYyBiaW5kaW5ncyB3aGljaCByZXF1aXJlIHRoaXMgcmVn
Cj4gPiBwcm9wZXJ0eSwgd2hhdCB0aGUgY29udHJvbGxlciBvciB0aGUgZHJpdmVyIGFjdHVhbGx5
IHN1cHBvcnRzLCBvciBldmVuCj4gPiBob3cgaXQgaXMgdXNlZCBvbiBjdXJyZW50IGRlc2lnbnMg
aXMgbm90IHJlbGV2YW50IGhlcmUuCj4gPiAgIAo+ID4+PiBCdXQsIGFzIG5hbmQtY2hpcC55YW1s
IHJlZmVyZW5jZXMgbXRkLnlhbWwsIHlvdSBjYW4gYXMgd2VsbCB1c2UKPiA+Pj4gd2hhdGV2ZXIg
aXMgZGVzY3JpYmVkIGhlcmU6Cj4gPj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbXRkL210ZC55YW1sP2g9bXRkL25leHQgIAo+ID4+PiAgICA+Pj4+IFdoYXQg
d291bGQgYmUgdGhlIGdwbWkgY29udHJvbGxlciBzaXplIGNlbGxzIChYKSBpbiB0aGF0IGNhc2Us
IHN0aWxsIDAsIHJpZ2h0ID8gU28gaG93IGRvZXMgdGhhdCBoZWxwIHNvbHZlIHRoaXMgcHJvYmxl
bSwgd291bGRuJ3QgVS1Cb290IHN0aWxsIHBvcHVsYXRlIHRoZSBwYXJ0aXRpb25zIGRpcmVjdGx5
IHVuZGVyIHRoZSBncG1pIG5vZGUgb3IgaW50byBwYXJ0aXRpb25zIHN1Yi1ub2RlID8gIAo+ID4+
Pgo+ID4+PiBUaGUgY29tbWl0IHRoYXQgd2FzIHBvaW50ZWQgaW4gdGhlIG9yaWdpbmFsIGZpeCBj
bGVhcmx5IHN0YXRlZCB0aGF0IHRoZQo+ID4+PiBOQU5EIGNoaXAgbm9kZSB3YXMgdGFyZ2V0ZWQg
IAo+ID4+Cj4gPj4gSSB0aGluayB0aGlzIGlzIGFub3RoZXIgbWlzY29tbXVuaWNhdGlvbiBoZXJl
LiBUaGUgY29tbWl0Cj4gPj4KPiA+PiA3NTMzOTVlYTFlNDUgKCJBUk06IGR0czogaW14NzogRml4
IE5BTkQgY29udHJvbGxlciBzaXplLWNlbGxzIikKPiA+Pgo+ID4+IG1vZGlmaWVzIHRoZSBzaXpl
LWNlbGxzIG9mIHRoZSBOQU5EIGNvbnRyb2xsZXIuIFRoZSBuYW5kLWNoaXAgaXMgbm90IGludm9s
dmVkIGluIHRoaXMgYXQgYWxsIC4gSW4gdGhlIGV4YW1wbGVzIGFib3ZlLCBpdCdzIHRoZSAiJmdw
bWkiIG5vZGUgc2l6ZS1jZWxscyB0aGF0IGlzIG1vZGlmaWVkLiAgCj4gPiAKPiA+IFllcyBJIGtu
b3cuIEkgd2FzIHJlZmVycmluZyB0byB0aGlzIGNvbW1pdCwgc29ycnk6Cj4gPiAzNmZlZTJmNzYy
MWUgKCJjb21tb246IGZkdF9zdXBwb3J0OiBhZGQgc3VwcG9ydCBmb3IgInBhcnRpdGlvbnMiIHN1
Ym5vZGUgdG8gZmR0X2ZpeHVwX210ZHBhcnRzKCkiKQo+ID4gCj4gPiBUaGUgbG9nIHNheXM6Cj4g
PiAKPiA+IAlMaXN0aW5nIE1URCBwYXJ0aXRpb25zIGRpcmVjdGx5IGluIHRoZSBmbGFzaCBtb2Rl
IGhhcyBiZWVuCj4gPiAJZGVwcmVjYXRlZCBmb3IgYSB3aGlsZSBmb3Iga2VybmVsIERldmljZSBU
cmVlcy4gTG9vayBmb3IgYSBub2RlICJwYXJ0aXRpb25zIiBpbiB0aGUKPiA+IAlmb3VuZCBmbGFz
aCBub2RlcyBhbmQgdXNlIGl0IGluc3RlYWQgb2YgdGhlIGZsYXNoIG5vZGUgaXRzZWxmIGZvciB0
aGUKPiA+IAlwYXJ0aXRpb24gbGlzdCB3aGVuIGl0IGV4aXN0cywgc28gRGV2aWNlIFRyZWVzIGZv
bGxvd2luZyB0aGUgY3VycmVudAo+ID4gCWJlc3QgcHJhY3RpY2VzIGNhbiBiZSBmaXhlZCB1cC4K
PiA+IAo+ID4gV2hpY2ggKEkgaG9wZSkgbWVhbnMgVS1ib290IHdpbGwgZXF1aXZhbGVudGx5IHRy
eSB0byBwbGF5IHdpdGggdGhlCj4gPiBwYXJ0aXRpb25zIGNvbnRhaW5lciwgZWl0aGVyIGluIHRo
ZSBjb250cm9sbGVyIG5vZGUgb3IgaW4gdGhlIGNoaXAgbm9kZS4KPiA+ICAgCj4gPj4+ICwgbm90
IHRoZSBOQU5EIGNvbnRyb2xsZXIgbm9kZS4gSSBob3BlIHRoaXMKPiA+Pj4gaXMgY29ycmVjdGx5
IHN1cHBvcnRlZCBpbiBVLUJvb3QgdGhvdWdoLiBTbyBpZiB0aGVyZSBpcyBhIE5BTkQgY2hpcAo+
ID4+PiBzdWJub2RlLCBJIHN1cHBvc2UgVS1Cb290IHdvdWxkIHRyeSB0byBjcmVhdGUgdGhlIHBh
cnRpdGlvbnMgdGhhdCBhcmUKPiA+Pj4gaW5zaWRlLCBvciBldmVuIGluIHRoZSBzdWIgInBhcnRp
dGlvbnMiIGNvbnRhaW5lci4gIAo+ID4+Cj4gPj4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IFUt
Qm9vdCBjaGVja3MgdGhlIG5hbmQtY29udHJvbGxlciBub2RlIHNpemUtY2VsbHMsIG5vdCB0aGUg
bmFuZC1jaGlwe30gb3IgcGFydGl0aW9uc3t9IHN1Ym5vZGUgc2l6ZS1jZWxscyAuICAKPiA+IAo+
ID4gSSBkb24ndCB0aGluayBVLUJvb3QgY2FyZXMuCj4gPiAgIAo+ID4+IEZyYW5jZXNjbywgY2Fu
IHlvdSBwbGVhc2Ugc2hhcmUgdGhlIERULCBpbmNsdWRpbmcgdGhlIFUtQm9vdCBnZW5lcmF0ZWQg
cGFydGl0aW9ucywgd2hpY2ggaXMgcGFzc2VkIHRvIExpbnV4IG9uIENvbGlicmkgTVg3ID8gSSB0
aGluayB0aGF0IHNob3VsZCBtYWtlIGFsbCBjb25mdXNpb24gZ28gYXdheS4gIAo+ID4gCj4gPiBQ
bGVhc2UgYWxzbyBkbyBpdCB3aXRoIHRoZSBOQU5EIGNoaXAgZGVzY3JpYmVkLiBJZiwgd2hlbiB0
aGUgTkFORCBjaGlwCj4gPiBpcyBkZXNjcmliZWQgVS1Cb290IHRyaWVzIHRvIGNyZWF0ZSBwYXJ0
aXRpb25zIGluIHRoZSBjb250cm9sbGVyIG5vZGUsCj4gPiB0aGVuIHRoZSBzaXR1YXRpb24gaXMg
ZXZlbiB3b3JzZSB0aGFuIEkgdGhvdWdodC4gQnV0IEkgYmVsaWV2ZQo+ID4gZGVzY3JpYmluZyB0
aGUgbm9kZSBsaWtlIGEgc3VnZ2VzdCBpbiB0aGUgRFQgc2hvdWxkIHByZXZlbnQgdGhlIGJvb3QK
PiA+IGZhaWx1cmUgd2hpbGUgc3RpbGwgYWxsb3dpbmcgYSByYXRoZXIgZ29vZCBkZXNjcmlwdGlv
biBvZiB0aGUgaGFyZHdhcmUuCj4gPiAKPiA+IEJUVyBJIHN0aWxsIHRoaW5rIHRoZSByZWxldmFu
dCBhY3Rpb24gcmlnaHQgbm93IGlzIHRvIHJldmVydCB0aGUgRFQKPiA+IHBhdGNoLiAgCj4gCj4g
SSBhbSBzdGFydGluZyB0byBiYW5rIHRvd2FyZCB0aGF0IHZhcmlhbnQgYXMgd2VsbCAodGhhbmtz
IGZvciBjbGFyaWZ5aW5nIHRoZSByYXRpb25hbGUgaW4gdGhlIGRpc2N1c3Npb24sIHRoYXQgaGVs
cGVkIGEgbG90KS4KPiAKPiBCdXQgdGhlbiwgdGhlIGZvbGxvdyB1cCBmaXggd291bGQgYmUgd2hh
dCBleGFjdGx5LCB1cGRhdGUgdGhlIGJpbmRpbmcgZG9jdW1lbnQgdG8gcmVxdWlyZSAjc2l6ZS1j
ZWxscyA9IDwxPjsgPwoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
