Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01280C33CA9
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 17:31:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C715C206DA
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 17:30:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JMFinklJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C715C206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opcoRmzE5mNpBhFCaVQi6s1zRJiCdaNzMsU96d5+kcY=; b=JMFinklJQT9dhz
	RIJeKTCgUNLu9uk8TGKa5is08GxP+flxIrTeYX+NYufCM8mZGdxvzgXuZ9oam5bK/ei43cJFMGhfS
	3lkYlUr1a7avdRHcLWTNCeTC37BZYsEljPGrK2+Apa0mWEIEIjiQgmGBeWV3JJHopjDrui1oLgvM0
	cWh8NjEbUEDZU0Cfuq+8I+VpQDiYMbHtoqJxQy+JtZS9r3ZNTNQYULvpSQ4Kfxrw7CDiezWUuREf2
	BVcDjryMK6IyfJ+YnHgIxUAwMkIFWiMetig8qlxzS3obunY/sVjyYR98eYEY8NpddxbH7UyZEmzgG
	1JotOZDGyMoFhW9iju5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir3Y3-0006m5-MP; Mon, 13 Jan 2020 17:30:43 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir3Xx-0006lV-Cf
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 17:30:39 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id EC7A6FF80D;
 Mon, 13 Jan 2020 17:30:28 +0000 (UTC)
Date: Mon, 13 Jan 2020 18:30:27 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <xhnjupt@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix the suspend/resume issue
Message-ID: <20200113183027.50baf519@xps13>
In-Reply-To: <CA+EcR23zwQ2SMH5MYewXXDrGLT04hmjZVetZR6JrKvG9D19CQg@mail.gmail.com>
References: <1578589556-683-1-git-send-email-han.xu@nxp.com>
 <20200109200127.0ace18cb@xps13> <87v9pkmm34.fsf@geanix.com>
 <CA+EcR23zwQ2SMH5MYewXXDrGLT04hmjZVetZR6JrKvG9D19CQg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_093037_574637_F5749312 
X-CRM114-Status: GOOD (  14.57  )
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
 Esben Haabendal <esben@geanix.com>, martin@geanix.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, sean@geanix.com,
 Han Xu <han.xu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSGFuLAoKSGFuIFh1IDx4aG5qdXB0QGdtYWlsLmNvbT4gd3JvdGUgb24gVGh1LCA5IEphbiAy
MDIwIDE0OjA5OjI0IC0wNjAwOgoKPiBPbiBUaHUsIEphbiA5LCAyMDIwIGF0IDI6MDYgUE0gRXNi
ZW4gSGFhYmVuZGFsIDxlc2JlbkBnZWFuaXguY29tPiB3cm90ZToKPiA+Cj4gPiBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cml0ZXM6Cj4gPiAgCj4gPiA+IEhpIEVz
YmVuLCBIYW4sCj4gPiA+Cj4gPiA+IEhhbiBYdSA8aGFuLnh1QG54cC5jb20+IHdyb3RlIG9uIEZy
aSwgMTAgSmFuIDIwMjAgMDE6MDU6NTYgKzA4MDA6Cj4gPiA+ICAKPiA+ID4+IGZpeCBzZXZlcmFs
IGlzc3VlcyB3aGVuIHN5c3RlbSBzdXNwZW5kL3Jlc3VtZSwKPiA+ID4+Cj4gPiA+PiAtIGxldmVy
YWdlIHRoZSBydW50aW1lIHBtIGZvciBzeXN0ZW0gc3VzcGVuZC9yZXN1bWUKPiA+ID4+IC0gZW5h
YmxlIHRoZSBjbG9jayBiZWZvcmUgcmVnaXN0ZXIgYWNjZXNzCj4gPiA+PiAtIHJlLWFwcGx5IHRp
bWluZyBzZXR0aW5ncwo+ID4gPj4gLSBzZXQgdGhlIHByb3BlciBwaW5jdHJsIHN0YXRlICAKPiA+
ID4KPiA+ID4gRXNiZW4gYXJlIHlvdSBmaW5lIHdpdGggdGhpcyBwYXRjaD8gIAo+ID4KPiA+IEl0
IHNvdW5kcyBsaWtlIHNvbWV0aGluZyB0aGF0IHNob3VsZCBwcm9iYWJseSBiZSA0IHNlcGFyYXRl
IHBhdGNoZXMuCj4gPiAgCj4gPiA+IE9yIG1heWJlIEhhbiB5b3UgY291bGQgdGFrZSBvdmVyIEVz
YmVuJ3MgcGF0Y2ggYW5kIGV4dGVuZCBpdD8gIAo+ID4KPiA+IEkgZG9uJ3Qgc2VlIHdoeSBteSB0
d28gcGF0Y2hlcywgd2hpY2ggY292ZXJzIHBvaW50IDEgYW5kIDMgaW4gdGhlIGxpc3QKPiA+IG9m
IGlzc3VlcyBjb3ZlcmVkIGJ5IEhhbidzIHBhdGNoLCBzaG91bGQgbm90IGJlIG1lcmdlZC4KPiA+
Cj4gPiBIYW4sIHdvdWxkIHlvdSBtaW5kIHJlLXNwaW4geW91ciBwYXRjaCB0byB0d28gc2VwYXJh
dGUgcGF0Y2hlcyBjb3ZlcmluZwo+ID4gdGhlIHJlbWFpbmluZyBpc3N1ZXMgIAo+IAo+IEkgYW0g
ZmluZSB0byBrZWVwIHlvdXIgcGF0Y2hlcyBhbmQgcmUtc3BpbiB0aGUgcmVzdCBjaGFuZ2VzLgoK
R3JlYXQsIEknbGwgcXVldWUgRXNiZW4gcGF0Y2hlcyBmb3IgNS42IHRoZW4uCgpXb3VsZCB5b3Ug
bWluZCBhY2tpbmcgdGhlbT8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
