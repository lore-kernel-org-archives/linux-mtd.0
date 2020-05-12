Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698D0C54E4B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 08:54:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30DC020714
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 08:54:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fc8WO+kW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30DC020714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOwa++mcU3P64mZLN8JUwATdjaJd1X6uOvtZb9vTAOU=; b=fc8WO+kWesTaTL
	0IMYcYWpp9HTwiNY372vJJ+4Mv3YD8cOo6aWHoxG28xxw9sV/WVEGOgKVA9SLvDiJOSBm6osZfF9h
	kvd94CVg8QJUrmWQBJ/kVU2tXVKNjeFTtWUCvXlbH1p3xLw7anvIt9nTTbjzzhQgBI63KW196yjgI
	a2qMW8hvbNlonuZ1dO6zFFl1NyHUrjK8W0nlguy5yqmYhkRpdo/gnCdkvzquKoZoBy1g2/JcI0Hei
	Rus9I5LlEMLeFtj985kyoBdc6punD9J6p0SegANumfhgjnQByUtHG7Z4Y8Uj9Cz3ghpssOs9dPzky
	aL5cfRq9Olguro4rp4rA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYQg6-0003Qi-SI; Tue, 12 May 2020 08:54:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYQg3-0003OX-DX
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 08:54:17 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3FA352A1F41;
 Tue, 12 May 2020 09:54:12 +0100 (BST)
Date: Tue, 12 May 2020 10:54:09 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] nand: raw: use write_oob_raw for MTD_OPS_AUTO_OOB mode
Message-ID: <20200512105409.785febfe@collabora.com>
In-Reply-To: <20200512104422.4c31f7e0@xps13>
References: <20200504094253.2741109-1-noltari@gmail.com>
 <20200504123237.5c128668@collabora.com>
 <20200511182923.6a4961ab@xps13>
 <6F41AA9B-71D6-47FA-BC12-24941F84DA71@gmail.com>
 <20200512104422.4c31f7e0@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_015415_725290_CE3BA90A 
X-CRM114-Status: GOOD (  25.95  )
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
Cc: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>,
 christophe.kerello@st.com, vigneshr@ti.com, richard@nod.at,
 s.hauer@pengutronix.de, devik@eaxlabs.cz, linux-kernel@vger.kernel.org,
 stefan@agner.ch, linux-mtd@lists.infradead.org, tglx@linutronix.de,
 masonccyang@mxic.com.tw, piotrs@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxMiBNYXkgMjAyMCAxMDo0NDoyMiArMDIwMApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGVsbG8sCj4gCj4gUmljaGFyZCwgbWF5YmUg
eW91J2xsIGhhdmUgYW4gaWRlYSB0byBmaXggdGhlIHNpdHVhdGlvbiBoZXJlPwo+IAo+IMOBbHZh
cm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+IHdyb3RlIG9uIFR1ZSwgMTIg
TWF5IDIwMjAKPiAxMDozNjoyNSArMDIwMDoKPiAKPiA+IEhpLAo+ID4gICAKPiA+ID4gRWwgMTEg
bWF5IDIwMjAsIGEgbGFzIDE4OjI5LCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPiBlc2NyaWJpw7M6Cj4gPiA+IAo+ID4gPiBIZWxsbywKPiA+ID4gCj4gPiA+IEJvcmlz
IEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IHdyb3RlIG9uIE1vbiwg
NCBNYXkKPiA+ID4gMjAyMCAxMjozMjozNyArMDIwMDoKPiA+ID4gICAgIAo+ID4gPj4gT24gTW9u
LCAgNCBNYXkgMjAyMCAxMTo0Mjo1MyArMDIwMAo+ID4gPj4gw4FsdmFybyBGZXJuw6FuZGV6IFJv
amFzIDxub2x0YXJpQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+PiAgICAgCj4gPiA+Pj4gU29tZSBO
QU5EIGNvbnRyb2xsZXJzIGNoYW5nZSB0aGUgRUNDIGJ5dGVzIHdoZW4gT09CIGlzIHdyaXR0ZW4g
d2l0aCBFQ0MKPiA+ID4+PiBlbmFibGVkLgo+ID4gPj4+IFRoaXMgaXMgYSBwcm9ibGVtIGluIGJy
Y21uYW5kLCBzaW5jZSBhZGRpbmcgSkZGUzIgY2xlYW5tYXJrZXJzIGFmdGVyIHRoZSBwYWdlCj4g
PiA+Pj4gaGFzIGJlZW4gZXJhc2VkIHdpbGwgY2hhbmdlIHRoZSBFQ0MgYnl0ZXMgdG8gMCBhbmQg
dGhlIGNvbnRyb2xsZXIgd2lsbCB0aGluawo+ID4gPj4+IHRoZSBibG9jayBpcyBiYWQuCj4gPiA+
Pj4gSXQgY2FuIGJlIGZpeGVkIGJ5IHVzaW5nIHdyaXRlX29vYl9yYXcsIHdoaWNoIGVuc3VyZXMg
RUNDIGlzIGRpc2FibGVkLgo+ID4gPj4+IAo+ID4gPj4+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8g
RmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Cj4gPiA+Pj4gLS0tCj4gPiA+Pj4g
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgfCAyICstCj4gPiA+Pj4gMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Pj4gCj4gPiA+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9iYXNlLmMKPiA+ID4+PiBpbmRleCBjMjRlNWUyYmExMzAuLjc1NWQyNTIw
MDUyMCAxMDA2NDQKPiA+ID4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2Uu
Ywo+ID4gPj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gPiA+Pj4g
QEAgLTQ4OCw3ICs0ODgsNyBAQCBzdGF0aWMgaW50IG5hbmRfZG9fd3JpdGVfb29iKHN0cnVjdCBu
YW5kX2NoaXAgKmNoaXAsIGxvZmZfdCB0bywKPiA+ID4+PiAKPiA+ID4+PiAJbmFuZF9maWxsX29v
YihjaGlwLCBvcHMtPm9vYmJ1Ziwgb3BzLT5vb2JsZW4sIG9wcyk7Cj4gPiA+Pj4gCj4gPiA+Pj4g
LQlpZiAob3BzLT5tb2RlID09IE1URF9PUFNfUkFXKQo+ID4gPj4+ICsJaWYgKG9wcy0+bW9kZSA9
PSBNVERfT1BTX0FVVE9fT09CIHx8IG9wcy0+bW9kZSA9PSBNVERfT1BTX1JBVykKPiA+ID4+PiAJ
CXN0YXR1cyA9IGNoaXAtPmVjYy53cml0ZV9vb2JfcmF3KGNoaXAsIHBhZ2UgJiBjaGlwLT5wYWdl
bWFzayk7ICAgICAgCj4gPiA+PiAKPiA+ID4+IFRoZSBkb2Mgc2F5czoKPiA+ID4+IAo+ID4gPj4g
QE1URF9PUFNfUExBQ0VfT09COiAgT09CIGRhdGEgYXJlIHBsYWNlZCBhdCB0aGUgZ2l2ZW4gb2Zm
c2V0IChkZWZhdWx0KQo+ID4gPj4gQE1URF9PUFNfQVVUT19PT0I6ICAgT09CIGRhdGEgYXJlIGF1
dG9tYXRpY2FsbHkgcGxhY2VkIGF0IHRoZSBmcmVlIGFyZWFzCj4gPiA+PiAgICAgICAgICAgICAg
ICAgICAgIHdoaWNoIGFyZSBkZWZpbmVkIGJ5IHRoZSBpbnRlcm5hbCBlY2NsYXlvdXQKPiA+ID4+
IEBNVERfT1BTX1JBVzogICAgICAgIGRhdGEgYXJlIHRyYW5zZmVycmVkIGFzLWlzLCB3aXRoIG5v
IGVycm9yCj4gPiA+PiAJCSAgICAgY29ycmVjdGlvbjsgdGhpcyBtb2RlIGltcGxpZXMgJU1URF9P
UFNfUExBQ0VfT09CCj4gPiA+PiAKPiA+ID4+IFRvIG1lLCB0aGF0IG1lYW5zIE1URF9PUFNfUExB
Q0VfT09CIGFuZCBNVERfT1BTX0FVVE9fT09CIGRvIG5vdCBpbXBseQo+ID4gPj4gTVREX09QU19S
QVcuIEFueXdheSB0aG9zZSBtb2RlcyBhcmUganVzdCB0b28gdmFndWUuIFdlIHJlYWxseSBzaG91
bGQKPiA+ID4+IHNlcGFyYXRlIHRoZSBFQ0MtZGlzYWJsZWQvRUNDLWVuYWJsZWQgY29uY2VwdCAo
QUtBIHJhdyB2cyBub24tcmF3IG1vZGUpCj4gPiA+PiBmcm9tIHRoZSBPT0IgcGxhY2VtZW50IHNj
aGVtZS4gSUlSQywgTWlxdWVsIGhhZCBhIHBhdGNoc2V0IGRvaW5nIHRoYXQuCj4gPiA+PiAKPiA+
ID4+IFdlIGFsc28gc2hvdWxkIGhhdmUgdGhlIGNvbmNlcHQgb2YgcHJvdGVjdGVkIE9PQi1yZWdp
b24gdnMKPiA+ID4+IHVucHJvdGVjdGVkLU9PQi1yZWdpb24gaWYgd2Ugd2FudCBKRkZTMiB0byB3
b3JrIHdpdGggY29udHJvbGxlcnMgdGhhdAo+ID4gPj4gcHJvdGVjdCBwYXJ0IG9mIHRoZSBPT0Ig
cmVnaW9uLiBPbmNlIHdlIGhhdmUgdGhhdCB3ZSBjYW4gcGF0Y2ggSkZGUzIKPiA+ID4+IHRvIHdy
aXRlIHRoaW5ncyB3aXRoICJFQ0MtZGlzYWJsZWQiKyJhdXRvLU9PQi1wbGFjZW1lbnQtb24tdW5w
cm90ZWN0ZWQKPiA+ID4+IGFyZWEiLiAgICAKPiA+ID4gCj4gPiA+IEkgc2VlIHRoZSBwcm9ibGVt
IGJ1dCBhcyBCb3JpcyBzYWlkIHRoZSBmaXggaXMgbm90IHZhbGlkIGFzLWlzLgo+ID4gPiBQcm9i
bGVtIGlzOiBJIGRvbid0IGhhdmUgYSBiZXR0ZXIgcHJvcG9zYWwgeWV0Lgo+ID4gPiAKPiA+ID4g
SXMgZm9yY2luZyBKRkZTMiB0byB3cml0ZSBjbGVhbm1hcmtlcnMgaW4gcmF3IG1vZGUgb25seSBh
biBvcHRpb24/ICAgIAo+ID4gCj4gPiBUaGUgZG9jIHNheXMgdGhhdCBmb3IgTVREX09QU19BVVRP
X09PQiAidGhlIGRhdGEgaXMgYXV0b21hdGljYWxseSBwbGFjZWQgYXQgdGhlIGZyZWUgYXJlYXMg
d2hpY2ggYXJlIGRlZmluZWQgYnkgdGhlIGludGVybmFsIGVjY2xheW91dOKAnS4KPiA+IFNvLCBp
ZiB3ZeKAmXJlIHBsYWNpbmcgdGhpcyBkYXRhIGluIHRoZSBmcmVlIE9PQiBhcmVhIGxlZnQgYnkg
dGhlIEVDQyBieXRlcyBpdCBtZWFucyB0aGF0IHRoaXMgYXV0b21hdGljYWxseSBwbGFjZWQgZGF0
YSB3b27igJl0IGJlIGVycm9yIGNvcnJlY3RhYmxlLCBzaW5jZSBpdOKAmXMgaW4gdGhlIE9PQiwg
YW5kIHRoZSBPT0IgZGF0YSBpc27igJl0IGVycm9yIGNvcnJlY3RlZCwgcmlnaHQ/ICAKPiAKPiBO
bywgZnJlZSBieXRlcyBzb21ldGltZXMgYXJlIGFuZCBzb21ldGltZXMgYXJlIG5vdCBjb3ZlcmVk
IGJ5IHRoZSBFQ0MKPiBlbmdpbmUuIEl0IGRlcGVuZHMgb24gdGhlIGNvbnRyb2xsZXIuCj4gCj4g
PiBUaGUgcHJvYmxlbSBpcyB0aGF0ICJmbGFzaF9lcmFzZSAtauKAnSB1c2VzIE1URF9PUFNfQVVU
T19PT0IgdG8gd3JpdGUgdGhlIE9PQiBKRkZTMiBjbGVhbiBtYXJrZXJzIGFuZCBpZiB0aGlzIGlz
IHdyaXR0ZW4gd2l0aCBFQ0MgZW5hYmxlZCB0aGUgTkFORCBjb250cm9sbGVyIHdpbGwgY2hhbmdl
IHRoZSBFQ0MgYnl0ZXMgdG8gYW4gaW52YWxpZCB2YWx1ZSAob3IgYXQgbGVhc3QgYnJjbW5hbmQg
Y29udHJvbGxlcikuCj4gPiAKPiA+IEFub3RoZXIgb3B0aW9uIGNvdWxkIGJlIGFkZGluZyBhbm90
aGVyIG1vZGUsIHNvbWV0aGluZyBsaWtlIE1URF9PUFNfQVVUT19PT0JfUkFXIGFuZCB1c2luZyBp
dCBpbiBtdGQtdXRpbHMgYW5kIEpGRlMyLiAgCj4gCj4gTm8sIHRoZXNlIG1vZGVzIGFscmVhZHkg
YXJlIGNvbXBsZXRlbHkgd3JvbmcsIEkgbXVzdCByZXNlbmQgbXkgc2VyaWVzCj4gZml4aW5nIHRo
ZW0uCj4gCgpUb3RhbGx5IGFncmVlIHdpdGggTWlxdWVsIG9uIHRoYXQgb25lOiBsZXQncyBmaXgg
dGhlCndyaXRlL3JlYWQvZWNjLWxheW91dCBzZW1hbnRpY3MgaW5zdGVhZCBvZiBhZGRpbmcgbW9y
ZSBvYnNjdXJlIG1vZGVzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
