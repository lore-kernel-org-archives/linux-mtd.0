Return-Path: <SRS0=se+M=5P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD678C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 07:27:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2BA820774
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 07:27:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fAqcgj+c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2BA820774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kPljQae/PQX2tQQiC646atz+F7dSo3wPtXN+gWcH0xU=; b=fAqcgj+cjQWyy9
	EJ8khgW9yDIBKYk3UL6pn0GkuR9DJzeRw7kFu+kjamE1ojebjyF6bbc05qfJs478h3IqEuk8df2dq
	LOmGkMkjxvGFHAEvAze7o7irDsoeqHL0dgjbjKDMdRcGgkmEu+OpjFt5+3mZAEUxPvpksP83lcJmg
	py7vhO3StJWwhc6Tw6SE5X/pwBCxuGwdiXT2YyM/UKpjqFRvWxjk1p6ZevxcF3pkyvmqzu0v1DZkT
	9CRjT1AAZp79YjEfLrAhl5FCE0z705zotz0yKvfNmkFLkSREdnH2GAO1Bqge4Iq9alH9fffiul67x
	kd1Yjajcbm0lSDlALtRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIopY-0001Qu-Dc; Mon, 30 Mar 2020 07:27:32 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIopV-0001Q7-02
 for linux-mtd@lists.infradead.org; Mon, 30 Mar 2020 07:27:31 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 99A7E20008;
 Mon, 30 Mar 2020 07:27:23 +0000 (UTC)
Date: Mon, 30 Mar 2020 09:27:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
Message-ID: <20200330092722.2ff41863@xps13>
In-Reply-To: <20200330060859.GR2564@lahna.fi.intel.com>
References: <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <CAP6exYJ_jzrB0D=RLXMNeegu4BwQq8raXVOMugkqzX2ZP_JSqw@mail.gmail.com>
 <20200327155608.GM2564@lahna.fi.intel.com>
 <20200327171907.7a7ffc73@xps13>
 <20200327164802.GN2564@lahna.fi.intel.com>
 <20200327175238.784cf47c@xps13>
 <CAP6exYJ4-pBBZKA0z8TKPqh_0tKzJadjXEBZk9dc9ij8BJ9Xew@mail.gmail.com>
 <20200327171619.GO2564@lahna.fi.intel.com>
 <CAP6exYJWWT2SFLjPCdjAEEjmZYwqYuTxd_aRaf=xEELmXqfMpA@mail.gmail.com>
 <CAP6exY+p-Chi2R4Y1H8UvcbE6rvEpMiK3UaX2OyBq=ZO6uULpg@mail.gmail.com>
 <20200330060859.GR2564@lahna.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_002729_310387_6826A990 
X-CRM114-Status: GOOD (  25.71  )
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
Cc: ron minnich <rminnich@gmail.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlrYSwKCk1pa2EgV2VzdGVyYmVyZyA8bWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNv
bT4gd3JvdGUgb24gTW9uLCAzMCBNYXIKMjAyMCAwOTowODo1OSArMDMwMDoKCj4gTm8gb2JqZWN0
aW9ucyBmcm9tIG15IHNpZGUgOikKPiAKPiBPbiBGcmksIE1hciAyNywgMjAyMCBhdCAwNDo1Mzoy
OFBNIC0wNzAwLCByb24gbWlubmljaCB3cm90ZToKPiA+IE9LLCBJJ3ZlIGRvbmUgYSBxdWljayBw
cm90b3R5cGUgb2YgdXNpbmcgKCkgYXMgb25lIHdheSB0byBzcGVjaWZ5IHRoZQo+ID4gSUQuIFRo
ZSBtdHBhcnRzIGNhbiBsb29rIGxpa2UgdGhpcyAodGVzdGVkKQo+ID4gCj4gPiBtdGRwYXJ0cz0o
MDAwMDowMDoxZi41KTI1MTY1ODI0KEJJT1MpLC0oc3F1YXNoZnMpCgpXb3VsZCBpdCBiZSBoYXJk
IHRvIHN1cHBvcnQgYW4gZXh0cmEgJzonIGFmdGVyIHRoZSBNVEQgZGV2aWNlIG5hbWU/ClRoaXMg
d2F5IHdvdWxkIHdvdWxkIGFsbG93IGFueXRoaW5nIGluc2lkZSB0aGUgb3B0aW9uYWwgJygnICcp
JyBidXQKd291bGQga2VlcCB0aGUgdHJhaWxpbmcgJzonLgoKdG9UYXk6CgltdGRwYXJ0cz1uYW1l
OnBhcnQxLHBhcnQyCgpTbzoKCW10ZHBhcnRzPSgwMDAwOjAwOjFmLjUpOjI1MTY1ODI0KEJJT1Mp
LC0oc3F1YXNoZnMpCgo/Cgo+ID4gCj4gPiBUaGUgdGV4dCBpbiAoKSBjYW4gYmUgcHJldHR5IGFy
Yml0cmFyeTsgb25seSApIGlzIGRpc2FsbG93ZWQuCj4gPiBJdCdzIGFib3V0IDEwIG1vcmUgbGlu
ZXMgb2YgY29kZSBpbiBjbWRsaW5lcGFydC5jIGFuZCB0aGF0J3MgaXQuCj4gPiBGdXJ0aGVyLCB0
aGUgZXhpc3Rpbmcgc3ludGF4IGlzIHN0aWxsIHN1cHBvcnRlZDoKPiA+IG10ZHBhcnRzPWlkOnBh
cnRzCj4gPiAKPiA+IHdoYXQgZG8geW91IHRoaW5rPwo+ID4gCj4gPiB0aGFua3MKPiA+IAo+ID4g
cm9uCj4gPiAKPiA+IE9uIEZyaSwgTWFyIDI3LCAyMDIwIGF0IDEwOjM5IEFNIHJvbiBtaW5uaWNo
IDxybWlubmljaEBnbWFpbC5jb20+IHdyb3RlOiAgCj4gPiA+Cj4gPiA+IHllYWgsIDo6IGlzIG5v
dCBzbyBiYWQsIGJ1dCB5b3UndmUgZ290IGEgbG90IG9mIGNvcm5lciBjYXNlcyBhcyB5b3UgY2hl
Y2sgZm9yIDo6Cj4gPiA+IG10ZHBhcnRzPTA6Cj4gPiA+IGZvciBvbmUgZXhhbXBsZS4KPiA+ID4K
PiA+ID4gQ292ZXJpbmcgYWxsIHRoZSB3YXlzIHRoaW5ncyBjYW4gZ28gd3JvbmcgZ2V0cyBtZXNz
eS4gWW91IGNhbiBwcmV0dHkKPiA+ID4gbXVjaCBndWFyYW50ZWUgYWxsIHRob3NlIGNvcm5lciBj
YXNlcyB3aWxsIGdldCBleGVyY2lzZWQgLi4uCj4gPiA+Cj4gPiA+IEFuZCBwZW9wbGUgYXJlIGdv
aW5nIHRvIG1lc3MgdGhpcyB1cCBhbmQgZW5kIHVwIHdpdGggaGFyZCB0byBkZWJ1ZyBlcnJvcnM6
Cj4gPiA+IG10ZHBhcnRzPTAwMDA6OjA6MWYuMzpwYXJ0cwo+ID4gPgo+ID4gPiBUaGF0IGNvdWxk
IGJlIGEgaGFyZCBlcnJvciB0byBzcG90Lgo+ID4gPgo+ID4gPiBJIHN0aWxsIHdvbmRlciBpZiB3
ZSBzaG91bGQgbm90IGp1c3QgZGVmaW5lIHNvbWUgY2hhcmFjdGVyIGFzCj4gPiA+IGF2YWlsYWJs
ZSBpbiBhZGRpdGlvbiB0byA6LiBJIHJlYWxpemUgfCB3YXMgcHJldHR5IGF3ZnVsLCBidXQgLi4u
IGlzCj4gPiA+IHRoZXJlIHNvbWUgb3RoZXIgY2hhcmFjdGVyIHdlIG1pZ2h0IHVzZT8gSSBraW5k
IG9mIGxpa2UgdGhlIHNpbXBsaWNpdHkKPiA+ID4gb2YgdGhlIGN1cnJlbnQgc2NoZW1lOyB0aGVy
ZSByZWFsbHkgd291bGQgYmUgbm8gaXNzdWUgaGFkIGl0IGJlZW4KPiA+ID4gYWxtb3N0IGFueXRo
aW5nIGJ1dCBhIDogOi0pCj4gPiA+Cj4gPiA+IEJ1dCBpZiB0aGUgc2Vuc2UgaXMgdGhhdCA6OiBp
cyB0aGUgd2F5IHRvIGdvLCBJIGNhbiBnaXZlIGl0IGEgc2hvdC4KPiA+ID4KPiA+ID4gcm9uCj4g
PiA+Cj4gPiA+IE9uIEZyaSwgTWFyIDI3LCAyMDIwIGF0IDEwOjE2IEFNIE1pa2EgV2VzdGVyYmVy
Zwo+ID4gPiA8bWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6ICAKPiA+ID4g
Pgo+ID4gPiA+IE9uIEZyaSwgTWFyIDI3LCAyMDIwIGF0IDEwOjA1OjUyQU0gLTA3MDAsIHJvbiBt
aW5uaWNoIHdyb3RlOiAgCj4gPiA+ID4gPiBJIGRpZCB0cnkgdGhlIFwgdGhpbmcgYnV0IGZvdW5k
IGl0IGEgYml0IHRyaWNreSB0byB3b3JrIHdpdGgsIHdpdGgKPiA+ID4gPiA+IGxvdHMgb2YgcG90
ZW50aWFsIGZvciBzaW1wbGUgZXJyb3JzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEl0IHdvdWxkIHJl
cXVpcmUgY21kbGluZXMgbGlrZSB0aGlzCj4gPiA+ID4gPiBtdGRwYXJ0cz0wMDAwXDowMFw6MC4x
ZjpldGNldGMKPiA+ID4gPiA+Cj4gPiA+ID4gPiBBIGxvdCBvZiB0aGVzZSBtdGRwYXJ0cyBkZWZp
bml0aW9ucyBhcmUgcHJvZHVjZWQgYnkgc2NyaXB0cyBhbmQKPiA+ID4gPiA+IE1ha2VmaWxlcyBh
bmQgdGhlcmUgYXJlIG1hbnksIG1hbnkgcGxhY2VzIHdoZXJlIFxcIGhhdmUgYSB3YXkgb2YKPiA+
ID4gPiA+IHZhbmlzaGluZy4gIAo+ID4gPiA+Cj4gPiA+ID4gUmlnaHQuIE9uZSBvcHRpb24gd291
bGQgYmUgdG8gdXNlIHRoZSBwcmludGYoKSBzdHlsZSBlc2NhcGluZyBhbmQgbWFrZQo+ID4gPiA+
IDo6IHRvIGJlIGxpdGVyYWwgOiBpbiB0aGUgc2FtZSB3YXkgJSUgaXMgbGl0ZXJhbCAlLiAgCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
