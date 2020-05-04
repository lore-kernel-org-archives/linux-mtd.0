Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D037C3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 10:32:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5973D20721
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 10:32:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p4n6xcAr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5973D20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vXofpeoObQB8wi0gvbmeUtRf6JWV2ad5gqeIvtMGaE=; b=p4n6xcArSkFazj
	2CTqVThz04ywuhzi24YQk3sJPuMB7E+Y8VU6uvJxyUf90dkg6TxgZHuWwxc6LIuRf7kejcyrWOzO8
	kod3z50y4rVKqYt0fo41vp9hRUpjwfpVp16JxeCglb3FXEJWZ4S16mXSPWMPCyvqGIIxI7untE1QT
	HLyN4ruRsbSnRp3DbdpP7cMr5IQ7E0W8bLjSfaPZeWt+SySOgCfsepNGx5h9dFt5MAXhPWuL+XNfY
	pxOx5Z7F7HgK71kgc5ymsNDW1UXFKy8JBPKZyUZhKrWYahypsZNVZiNO3L50uIzCg7m7Z31/6Urf3
	IGUbXgLs3LnrTwWLNU6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVYP2-00083D-0F; Mon, 04 May 2020 10:32:48 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVYOy-0007yJ-Vu
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 10:32:46 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 10EFE2A0821;
 Mon,  4 May 2020 11:32:40 +0100 (BST)
Date: Mon, 4 May 2020 12:32:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH] nand: raw: use write_oob_raw for MTD_OPS_AUTO_OOB mode
Message-ID: <20200504123237.5c128668@collabora.com>
In-Reply-To: <20200504094253.2741109-1-noltari@gmail.com>
References: <20200504094253.2741109-1-noltari@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_033245_157782_41DB170C 
X-CRM114-Status: GOOD (  17.29  )
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
Cc: christophe.kerello@st.com, vigneshr@ti.com, richard@nod.at,
 s.hauer@pengutronix.de, devik@eaxlabs.cz, linux-kernel@vger.kernel.org,
 stefan@agner.ch, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 tglx@linutronix.de, masonccyang@mxic.com.tw, piotrs@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAgNCBNYXkgMjAyMCAxMTo0Mjo1MyArMDIwMArDgWx2YXJvIEZlcm7DoW5kZXogUm9q
YXMgPG5vbHRhcmlAZ21haWwuY29tPiB3cm90ZToKCj4gU29tZSBOQU5EIGNvbnRyb2xsZXJzIGNo
YW5nZSB0aGUgRUNDIGJ5dGVzIHdoZW4gT09CIGlzIHdyaXR0ZW4gd2l0aCBFQ0MKPiBlbmFibGVk
Lgo+IFRoaXMgaXMgYSBwcm9ibGVtIGluIGJyY21uYW5kLCBzaW5jZSBhZGRpbmcgSkZGUzIgY2xl
YW5tYXJrZXJzIGFmdGVyIHRoZSBwYWdlCj4gaGFzIGJlZW4gZXJhc2VkIHdpbGwgY2hhbmdlIHRo
ZSBFQ0MgYnl0ZXMgdG8gMCBhbmQgdGhlIGNvbnRyb2xsZXIgd2lsbCB0aGluawo+IHRoZSBibG9j
ayBpcyBiYWQuCj4gSXQgY2FuIGJlIGZpeGVkIGJ5IHVzaW5nIHdyaXRlX29vYl9yYXcsIHdoaWNo
IGVuc3VyZXMgRUNDIGlzIGRpc2FibGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVy
bsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfYmFzZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bmFuZF9iYXNlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+IGluZGV4IGMy
NGU1ZTJiYTEzMC4uNzU1ZDI1MjAwNTIwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRfYmFzZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMK
PiBAQCAtNDg4LDcgKzQ4OCw3IEBAIHN0YXRpYyBpbnQgbmFuZF9kb193cml0ZV9vb2Ioc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCwgbG9mZl90IHRvLAo+ICAKPiAgCW5hbmRfZmlsbF9vb2IoY2hpcCwg
b3BzLT5vb2JidWYsIG9wcy0+b29ibGVuLCBvcHMpOwo+ICAKPiAtCWlmIChvcHMtPm1vZGUgPT0g
TVREX09QU19SQVcpCj4gKwlpZiAob3BzLT5tb2RlID09IE1URF9PUFNfQVVUT19PT0IgfHwgb3Bz
LT5tb2RlID09IE1URF9PUFNfUkFXKQo+ICAJCXN0YXR1cyA9IGNoaXAtPmVjYy53cml0ZV9vb2Jf
cmF3KGNoaXAsIHBhZ2UgJiBjaGlwLT5wYWdlbWFzayk7CgpUaGUgZG9jIHNheXM6CgpATVREX09Q
U19QTEFDRV9PT0I6ICBPT0IgZGF0YSBhcmUgcGxhY2VkIGF0IHRoZSBnaXZlbiBvZmZzZXQgKGRl
ZmF1bHQpCkBNVERfT1BTX0FVVE9fT09COiAgIE9PQiBkYXRhIGFyZSBhdXRvbWF0aWNhbGx5IHBs
YWNlZCBhdCB0aGUgZnJlZSBhcmVhcwogICAgICAgICAgICAgICAgICAgICB3aGljaCBhcmUgZGVm
aW5lZCBieSB0aGUgaW50ZXJuYWwgZWNjbGF5b3V0CkBNVERfT1BTX1JBVzogICAgICAgIGRhdGEg
YXJlIHRyYW5zZmVycmVkIGFzLWlzLCB3aXRoIG5vIGVycm9yCgkJICAgICBjb3JyZWN0aW9uOyB0
aGlzIG1vZGUgaW1wbGllcyAlTVREX09QU19QTEFDRV9PT0IKClRvIG1lLCB0aGF0IG1lYW5zIE1U
RF9PUFNfUExBQ0VfT09CIGFuZCBNVERfT1BTX0FVVE9fT09CIGRvIG5vdCBpbXBseQpNVERfT1BT
X1JBVy4gQW55d2F5IHRob3NlIG1vZGVzIGFyZSBqdXN0IHRvbyB2YWd1ZS4gV2UgcmVhbGx5IHNo
b3VsZApzZXBhcmF0ZSB0aGUgRUNDLWRpc2FibGVkL0VDQy1lbmFibGVkIGNvbmNlcHQgKEFLQSBy
YXcgdnMgbm9uLXJhdyBtb2RlKQpmcm9tIHRoZSBPT0IgcGxhY2VtZW50IHNjaGVtZS4gSUlSQywg
TWlxdWVsIGhhZCBhIHBhdGNoc2V0IGRvaW5nIHRoYXQuCgpXZSBhbHNvIHNob3VsZCBoYXZlIHRo
ZSBjb25jZXB0IG9mIHByb3RlY3RlZCBPT0ItcmVnaW9uIHZzCnVucHJvdGVjdGVkLU9PQi1yZWdp
b24gaWYgd2Ugd2FudCBKRkZTMiB0byB3b3JrIHdpdGggY29udHJvbGxlcnMgdGhhdApwcm90ZWN0
IHBhcnQgb2YgdGhlIE9PQiByZWdpb24uIE9uY2Ugd2UgaGF2ZSB0aGF0IHdlIGNhbiBwYXRjaCBK
RkZTMgp0byB3cml0ZSB0aGluZ3Mgd2l0aCAiRUNDLWRpc2FibGVkIisiYXV0by1PT0ItcGxhY2Vt
ZW50LW9uLXVucHJvdGVjdGVkCmFyZWEiLgoKPiAgCWVsc2UKPiAgCQlzdGF0dXMgPSBjaGlwLT5l
Y2Mud3JpdGVfb29iKGNoaXAsIHBhZ2UgJiBjaGlwLT5wYWdlbWFzayk7CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
