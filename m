Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907D8C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 10:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XbKHSjBg4RNIcYjqP9GslpncU47+uGMRjb93AzEzCSE=; b=R4X9WfQvMAe5S8
	NOAav1GzKTiGabw3XjAy1mZs/Xv/IpTGmu0NUz0duNjK84aEwiXqEJE0e/H5MvujtdZd7CSgvulOg
	sO0k2tnUGxg6UBlUMySpmoIKDza450lsekw3fJcSexQadfb4Q/Rshpdye8DeLEMRddu/zZ4qCYZQG
	tybTT6GDehlAH2FktB59FJ77HhP5W9juEhAIjbnRzkFrZuQa2h63nAsBWouTQ7PIS0hdapaA3zdwz
	G6pdttRGn29+SRLlLYEfVNykVfs2iirjaTjRO1KqJb2tkzvbVv+nRsshIpLMz7MBtotWTNu13j7qm
	gMlCOJIlgUPHjADXnQ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwiuX-0098SG-QW; Mon, 13 Dec 2021 10:50:25 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwiuU-0098PZ-Hl
 for linux-mtd@lists.infradead.org; Mon, 13 Dec 2021 10:50:24 +0000
Received: from skn-laptop (unknown [195.24.41.109])
 by first.geanix.com (Postfix) with ESMTPSA id 1C885E1D01;
 Mon, 13 Dec 2021 10:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1639392614; bh=cGxFVdayz5jAaqQX0zPXjvkju3c6WvmCUgBcKAZPV0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=cS23gm/a38x3zfw858JVQzfU+NOG0lg1sHsfkkCjK/fcYFTCUqhwGmjNrrh/OW8nB
 +s2p5caiTdXgujox/EVVWxX/h3VI3gBeiZQ/yKbfU9IeQkXP7mPHvXpS3rDTKppBUg
 tssMieQEkBNXsqkW/9HidFUGXjoZM3CfOyq+BJcaFw3+qagPrUdJgG9pp29Iyp8DC4
 YjD3jLzPc0dOckfQi1ds3Xr4f15Ian2wHijeYbMtlGi5h+qgLUTMkcfVYdasqCD5BK
 IATqXq37qr8RqdEM2pxZE28eavvI+ZP+QD+7CbD/CDZBI258BspnT7t+Oqp1zFgQgG
 oRNFHWZYya/MQ==
Date: Mon, 13 Dec 2021 12:50:12 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5 3/4] mtd: core: protect access to MTD devices while in
 suspend
Message-ID: <20211213105012.65jk4rylxzncqdfy@skn-laptop>
References: <20211130132912.v6v45boce2zbnoy3@skn-laptop>
 <20211130143705.5d0404aa@collabora.com>
 <20211203143958.40645506@xps13>
 <20211209140721.6ki7gznvxwyn3cze@skn-laptop.hinnerup>
 <20211209152811.318bdf17@xps13>
 <20211210132535.gy7rqj5zblqlnz5y@skn-laptop.hadsten>
 <20211213101025.42c27b43@xps13>
 <20211213102801.569b50b1@collabora.com>
 <20211213103350.22590c13@xps13>
 <20211213105336.7be369b7@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211213105336.7be369b7@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_025022_783791_85447F88 
X-CRM114-Status: GOOD (  22.54  )
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

SGkgTWlxdWVsIGFuZCBCb3JpcywKCk9uIE1vbiwgRGVjIDEzLCAyMDIxIGF0IDEwOjUzOjM2QU0g
KzAxMDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiBPbiBNb24sIDEzIERlYyAyMDIxIDEwOjMz
OjUwICswMTAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3Jv
dGU6Cj4gCj4gPiBIZWxsbywKPiA+IAo+ID4gYm9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20g
d3JvdGUgb24gTW9uLCAxMyBEZWMgMjAyMSAxMDoyODowMSArMDEwMDoKPiA+IAo+ID4gPiBPbiBN
b24sIDEzIERlYyAyMDIxIDEwOjEwOjI1ICswMTAwCj4gPiA+IE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gPiAgIAo+ID4gPiA+IEhpIFNlYW4sCj4g
PiA+ID4gCj4gPiA+ID4gc2VhbkBnZWFuaXguY29tIHdyb3RlIG9uIEZyaSwgMTAgRGVjIDIwMjEg
MTQ6MjU6MzUgKzAxMDA6Cj4gPiA+ID4gICAgIAo+ID4gPiA+ID4gT24gVGh1LCBEZWMgMDksIDIw
MjEgYXQgMDM6Mjg6MTFQTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZTogICAgICAKPiA+ID4g
PiA+ID4gSGkgU2VhbiwKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IHNlYW5AZ2Vhbml4LmNvbSB3
cm90ZSBvbiBUaHUsIDkgRGVjIDIwMjEgMTU6MDc6MjEgKzAxMDA6Cj4gPiA+ID4gPiA+ICAgICAg
ICAgCj4gPiA+ID4gPiA+ID4gT24gRnJpLCBEZWMgMDMsIDIwMjEgYXQgMDI6Mzk6NThQTSArMDEw
MCwgTWlxdWVsIFJheW5hbCB3cm90ZTogICAgICAgIAo+ID4gPiA+ID4gPiA+ID4gSGVsbG8sCj4g
PiA+ID4gPiA+ID4gPiAgICAgICAgICAgCj4gPiA+ID4gPiA+ID4gPiA+ID4gRmluZSBieSBtZSwg
bGV0cyBkcm9wIHRoaXMgc2VyaWVzLiAgICAgICAgICAKPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiA+ID4gRllJIEkndmUgZHJvcHBlZCB0aGUgZW50aXJlIHNlcmllcyBmcm9tIG10ZC9uZXh0
LiBJJ20gd2FpdGluZyBmb3IgdGhlCj4gPiA+ID4gPiA+ID4gPiBmaXggZGlzY3Vzc2VkIGJlbG93
ICh3aXRob3V0IGFidXNpbmcgdGhlIGNoaXAgbXV0ZXggOy0pICkuICAgICAgICAgIAo+ID4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiA+IENvb2wsIGxvb2tpbmcgZm9yd2FyZCB0byB0ZXN0IGEgcGF0
Y2ggc2VyaWVzIDopICAgICAgICAKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IFRlc3Q/IFlvdSBt
ZWFuICJ3cml0ZSI/IDopCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBDaGVlcnMsCj4gPiA+ID4g
PiA+IE1pcXXDqGwgICAgICAgIAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBIaSBNaXF1ZWwsCj4gPiA+
ID4gPiAKPiA+ID4gPiA+IFNob3VsZCB3ZSB1cyBhIGF0b21pYyBmb3IgdGhlIHN1c3BlbmRlZCB2
YXJpYWJsZT8gICAgICAKPiA+ID4gPiAKPiA+ID4gPiBJIGhhdmVuJ3QgdGhvdWdodCBhYm91dCBp
dCBleHRlbnNpdmVseSwgYW4gYXRvbWljIHZhcmlhYmxlIHNvdW5kIGZpbmUKPiA+ID4gPiBidXQg
SSBhbSBkZWZpbml0ZWx5IG5vdCBhIGxvY2tpbmcgZXhwZXJ0Li4uICAgIAo+ID4gPiAKPiA+ID4g
Tm8gbmVlZCB0byB1c2UgYW4gYXRvbWljIGlmIHRoZSB2YXJpYWJsZSBpcyBhbHJlYWR5IHByb3Rl
Y3RlZCBieSBhIGxvY2sKPiA+ID4gd2hlbiBhY2Nlc3NlZCwgYW5kIHRoaXMgc2VlbXMgdG8gYmUg
Y2FzZS4gIAo+ID4gCj4gPiBNYXliZSB0aGVyZSB3YXMgYSBjb25mdXNpb24gYWJvdXQgdGhpcyBs
b2NrOiBJIHRoaW5rIEJvcmlzIGp1c3QgZG8gbm90Cj4gPiB3YW50IHRoZSBjb3JlIHRvIHRha2Ug
YW55IGxvY2sgZHVyaW5nIGEgc3VzcGVuZCBvcGVyYXRpb24uIEJ1dCB5b3UgY2FuCj4gPiBzdGls
bCB1c2UgbG9ja3MsIGFzIGxvbmcgYXMgeW91IHJlbGVhc2UgdGhlbSBiZWZvcmUgc3VzcGVuZGlu
Zy4KPiA+IAo+ID4gQW5kIGFsc28sIHRoYXQgY2hpcCBsb2NrIG1pZ2h0IG5vdCBiZSB0aGUgb25l
IHlvdSB3YW50IHRvIHRha2UgYmVjYXVzZQo+ID4gaXQncyBiZWVuIGludHJvZHVjZWQgZm9yIGFu
b3RoZXIgcHVycG9zZS4KPiAKPiBBY2Nlc3MgdG8gdGhlIHN1c3BlbmRlZCBmaWVsZCBpcyBhbHJl
YWR5IHByb3RlY3RlZCBieSB0aGUgY2hpcCBsb2NrLAo+IGFuZCBJIHRoaW5rIGl0J3MganVzdCBm
aW5lIHRvIGtlZXAgaXQgdGhpcyB3YXkuCgpJJ20gcmVhZGluZyB0aGUgc3VzcGVuZGVkIHZhcmlh
YmxlIGluIHdhaXRfZXZlbnQoKSBvdXRzaWRlIHRoZSBsb2NrIDovCgovU2VhbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
