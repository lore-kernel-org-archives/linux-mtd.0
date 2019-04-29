Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5183C43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:34:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A72F121473
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 09:34:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SMz5DnlJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A72F121473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrCRn3q9f6/lyXs8PlgeBPRrvZ4smzHzAoKflxJOidk=; b=SMz5DnlJZaKPg1
	Msyez6QGbsOxmrFLeWjdcWHToKDApNLcLtpvUeIXs+zFIwW6HmEVQ8Z36owh8odmQgTQc1/ZZ1wrT
	8KZCl1pNjhjz/ynncJEDEeKC157LvE+69yA4LKmPDjq8nCOr4WsQXwEhLb8ELyNUX5HhCvB15zhaS
	KE+iSnBYj1FZKiU/NGmnjAsYthkgPiRuwv+UEKQIuMrqxy87Sy3kuDzHPzBaxv+pBo2kDnuSGWk5V
	oDjn0YWnWWntYZzuK+DzFtudmTibExEzbgldsXbAy48+9Wwhkl42ajUR5+4oqOaZYQxaQGQIRI2d7
	GsdJa8Inp4+sfgZDhMPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL2g7-0006sk-3W; Mon, 29 Apr 2019 09:34:27 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL2fy-0006lK-0L
 for linux-mtd@lists.infradead.org; Mon, 29 Apr 2019 09:34:19 +0000
X-Originating-IP: 90.88.147.33
Received: from xps13 (aaubervilliers-681-1-27-33.w90-88.abo.wanadoo.fr
 [90.88.147.33]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id BE49DFF825;
 Mon, 29 Apr 2019 09:34:07 +0000 (UTC)
Date: Mon, 29 Apr 2019 11:34:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH] mtd: rawnand: Add Macronix NAND read retry and
 randomizer support
Message-ID: <20190429113406.09d5b68f@xps13>
In-Reply-To: <OFD55A67FA.88C5BFBC-ON482583E0.0011385B-482583E0.00133C32@mxic.com.tw>
References: <1554780172-23111-1-git-send-email-masonccyang@mxic.com.tw>
 <20190409090427.22de9917@collabora.com>
 <OF6C97E4DE.45261545-ON482583D7.00340468-482583D7.0034B3FE@mxic.com.tw>
 <20190409114701.744c2c8c@collabora.com>
 <OF9601E14B.A48284C4-ON482583D8.0005E3EB-482583D8.0006CC14@mxic.com.tw>
 <20190410092258.332ef399@collabora.com>
 <OF071D3608.9D6D2523-ON482583D9.00173F52-482583D9.0018188C@mxic.com.tw>
 <20190411085353.4c1af008@collabora.com>
 <OF34672B6F.AACFE22C-ON482583D9.00335814-482583D9.0033A673@mxic.com.tw>
 <20190411112943.1fecfa69@collabora.com>
 <OF84BD5411.301E92AC-ON482583DF.000CC3CC-482583DF.000F4920@mxic.com.tw>
 <20190417090817.7a0c4638@xps13>
 <OFD55A67FA.88C5BFBC-ON482583E0.0011385B-482583E0.00133C32@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_023418_355528_55B25435 
X-CRM114-Status: GOOD (  31.80  )
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
Cc: bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sIEJvcmlzLAoKbWFzb25jY3lhbmdAbXhpYy5jb20udHcgd3JvdGUgb24gVGh1LCAx
OCBBcHIgMjAxOSAxMTozMDowNSArMDgwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IAo+ID4gPiA+ID4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiA+IFJlOiBbUEFUQ0hdIG10ZDogcmF3bmFuZDog
QWRkIE1hY3Jvbml4IE5BTkQgcmVhZCByZXRyeSAgIAo+IGFuZCAKPiA+ID4gPiA+ID4gPiByYW5k
b21pemVyICAgCj4gPiA+ID4gPiA+ID4gPiA+IHN1cHBvcnQgICAKPiA+ID4gPiA+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gPiA+ID4gPiBPbiBUdWUsIDkgQXByIDIwMTkgMTc6MzU6MzkgKzA4MDAK
PiA+ID4gPiA+ID4gPiA+ID4gPiBtYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZToKPiA+ID4g
PiA+ID4gPiA+ID4gPiAgIAo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBrb2JqX2F0dHJpYnV0ZSAgIAo+IHN5
c2ZzX214aWNfbmFuZCA9Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgIF9fQVRUUihuYW5k
X3JhbmRvbSwgU19JUlVHTyB8IFNfSVdVU1IsCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAg
ICAgICAgICBteGljX25hbmRfcmFuZF90eXBlX3Nob3csCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gKyAgICAgICAgICBteGljX25hbmRfcmFuZF90eXBlX3N0b3JlKTsgICAKPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IE5vLCB3ZSBkb24ndCB3YW50IHRv
IGV4cG9zZSB0aGF0IHRocm91Z2ggYSBzeXNmcyAgIAo+IGZpbGUsIAo+ID4gPiA+ID4gPiA+IGVz
cGVjaWFsbHkgICAKPiA+ID4gPiA+ID4gPiA+ID4gc2luY2UgICAKPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gY2hhbmdpbmcgdGhlIHJhbmRvbWl6ZXIgY29uZmlnIG1lYW5zIG1ha2luZyB0aGUgTkFO
RCAgIAo+ICAKPiA+ID4gPiA+IHVucmVhZGFibGUgICAKPiA+ID4gPiA+ID4gPiBmb3IgICAKPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gdGhvc2UgdGhhdCBoYXZlIHVzZWQgaXQgYmVmb3JlIHRoZSBj
aGFuZ2UuCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICAgCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gPiA+ID4gPiA+IE91ciBvbi1kaWUgcmFuZG9taXplciBpcyBzdGlsbCByZWFk
YWJsZSBmcm9tIHVzZXIgICAKPiBhZnRlciAKPiA+ID4gdGhlICAgCj4gPiA+ID4gPiA+ID4gZnVu
Y3Rpb24gICAKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGlzIGVuYWJsZWQuICAgCj4gPiA+ID4gPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4gWW91IG1lYW4gdGhlIG1lbW9yeSBpcyBzdGls
bCByZWFkYWJsZSBubyBtYXR0ZXIgdGhlICAgCj4gPiA+IHJhbmRvbWl6ZXIgICAKPiA+ID4gPiA+
ID4gPiBzdGF0ZS4gICAKPiA+ID4gPiA+ID4gPiA+ID4gPiBOb3Qgc3VyZSBob3cgdGhhdCdzIHBv
c3NpYmxlLCBidXQgb2theS4KPiA+ID4gPiA+ID4gPiA+ID4gPiAgIAo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gVGhpcyByYW5kb21pemVyIGlzIGp1c3QgbGlrZSBhIGludGVybmFsIG1lbW9yeSBjZWxs
IAo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gcmVsaWFiaWxpdHkgZW5oYW5jZWQuICAgCj4gPiA+ID4g
PiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4gV2h5IGRvbid0IHlvdSBlbmFibGUgaXQg
YnkgZGVmYXVsdCB0aGVuPyAgIAo+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4g
VGhlIHBlbmFsdHkgb2YgcmFuZG9taXplciBpcyByZWFkL3dyaXRlIHBlcmZvcm1hbmNlIGRvd24u
Cj4gPiA+ID4gPiA+ID4gPiA+IGkuZSwuIHRQUk9HIDMwMCB1cyB0byAzNDAgdXMgKHJhbmRvbWl6
ZXIgZW5hYmxlKQo+ID4gPiA+ID4gPiA+ID4gPiB0aGVyZWZvcmUsIGRpc2FibGUgaXQgYnkgZGVm
YXVsdC4gICAKPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gSSdtIGEgYml0IHB1enps
ZWQuIE9uIHRoZSBOQU5EIEkndmUgc2VlbiB0aGF0IHJlcXVpcmVkIGRhdGEKPiA+ID4gPiA+ID4g
PiA+IHJhbmRvbWl6YXRpb24gaXQncyBub3Qgc29tZXRoaW5nIHlvdSdkIHdhbnQgdG8gZGlzYWJs
ZSBhcyAgIAo+IHRoaXMgCj4gPiA+ID4gPiBpbXBsaWVkICAgCj4gPiA+ID4gPiA+ID4gPiBwb29y
IGRhdGEgcmV0ZW50aW9uLiBXaGF0J3MgdGhlIHVzZSBjYXNlIGhlcmU/IEFyZSB3ZSAgIAo+IHRh
bGtpbmcgCj4gPiA+IGFib3V0ICAgCj4gPiA+ID4gPiBTTEMgICAKPiA+ID4gPiA+ID4gPiA+IG9y
IE1MQyBOQU5Ecz8gU2hvdWxkIHdlIGVuYWJsZSB0aGlzIGZlYXR1cmUgb25jZSB3ZSAgIAo+ID4g
c3RhcnQgc2VlaW5nICAgCj4gPiA+ICAgCj4gPiA+ID4gPiB0aGF0ICAgCj4gPiA+ID4gPiA+ID4g
PiB0aGUgTkFORCBzdGFydHMgYmVpbmcgbGVzcyByZWxpYWJsZSAoYmFzaWNhbGx5IHdoZW4gICAK
PiByZWFkLXJldHJ5IAo+ID4gPiA+ID4gaGFwcGVucyAgIAo+ID4gPiA+ID4gPiA+ID4gbW9yZSBv
ZnRlbik/IEkgcmVhbGx5IHRoaW5rIHRoaXMgaXMgc29tZXRoaW5nIHlvdSAgIAo+IHNob3VsZGRl
Y2lkZSAKPiA+ID4gICAKPiA+ID4gPiA+IGtlcm5lbCAgIAo+ID4gPiA+ID4gPiA+ID4gc2lkZSwg
YmVjYXVzZSB1c2VycyBoYXZlIG5vIGNsdWUgd2hlbiBpdCdzIGFwcHJvcHJpYXRlICAgCj4gPiB0
byBzd2l0Y2ggICAKPiA+ID4gICAKPiA+ID4gPiA+IHRoaXMgICAKPiA+ID4gPiA+ID4gPiA+IGZl
YXR1cmUgb24vb2ZmLgo+ID4gPiA+ID4gPiA+ID4gICAKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gPiBJdCdzIFNMQyBOQU5EIGFuZCBzZWVtcyB0byBoYXMgbm90aGluZyB0byBkbyB3aXRoIHJl
YWQtcmV0cnkgICAKPiA+ID4gaGFwcGVucy4gIAo+ID4gPiA+ID4gPiA+IGxhdGVyLCBJIHdpbGwg
Z2V0IG1vcmUgaW5mb3JtYXRpb24gZm9yIHlvdXIgY29uY2VybnMuICAgCj4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiBXZWxsLCB0aGlzIGZlYXR1cmUgaXMgb3B0aW9uYWwsIGFuZCBjYW4gYmUgZW5h
YmxlZCB0byBpbXByb3ZlCj4gPiA+ID4gPiA+IHJlbGlhYmlsaXR5LiBTb3VuZHMgbGlrZSBhIGdv
b2QgcmVhc29uIHRvIGVuYWJsZSBpdCB3aGVuIHlvdXIgICAKPiBOQU5ECj4gPiA+ID4gPiA+IGRl
dmljZSBzdGFydHMgc2hvd2luZyByZWxpYWJpbGl0eSBpc3N1ZXMsIGFuZCB0aGUgbnVtYmVyIG9m
ICAgCj4gPiA+IHJlYWRfcmV0cnkgIAo+ID4gPiA+ID4gPiBhdHRlbXB0cyByZWZsZWN0cyB0aGUg
d2VhciBsZXZlbCBwcmV0dHkgd2VsbC4gQWx0ZXJuYXRpdmVseSwgeW91ICAgCj4gIAo+ID4gPiBj
b3VsZCAgCj4gPiA+ID4gPiA+IHVzZSB0aGUgbnVtYmVyIG9mIGJpdGZsaXBzLCBidXQsIGluIGFu
eSBjYXNlLCBkb24ndCBleHBlY3QgdGhlICAgCj4gdXNlciAKPiA+ID4gdG8gIAo+ID4gPiA+ID4g
PiB0YWtlIHRoaXMgZGVjaXNpb24sIGJlY2F1c2UgYWxtb3N0IG5vYm9keSBrbm93cyB3aGF0IHRo
ZSAgIAo+IHJhbmRvbWl6ZXIKPiA+ID4gPiA+ID4gaXMgbmVlZGVkIGZvci4KPiA+ID4gPiA+ID4g
ICAKPiA+ID4gPiA+ID4gPiAgIAo+ID4gPiA+ID4gPiA+ID4gPiAgIAo+ID4gPiA+ID4gPiA+ID4g
PiA+ICAgCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBJdCBjb3VsZCBiZSBlbmFibGUgYXQgYW55IHRp
bWUgd2l0aCBPVFAgYml0IGZ1bmN0aW9uICAgCj4gYW5kIAo+ID4gPiA+ID4gdGhhdCdzICAgCj4g
PiA+ID4gPiA+ID4gd2h5ICAgCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiB3ZSBwYXRjaCBpdCBieSBz
eXMtZnMuICAgCj4gPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+ID4gU29ycnks
IGJ1dCB0aGF0J3Mgbm90IGEgZ29vZCByZWFzb24gdG8gZXhwb3NlIHRoYXQgICAKPiB0aHJvdWdo
IAo+ID4gPiA+ID4gc3lzZnMuICAgCj4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4g
PiBBbnkgZ29vZCB3YXkgdG8gZXhwb3NlIHJhbmRvbWl6ZXIgZnVuY3Rpb24gZm9yIHVzZXIgPyAg
IAo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBEb24ndCBleHBvc2UgaXQgOlAuICAg
Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gb2gsIG9rYXksIEkgd2lsbCByZW1vdmUgc3lz
LWZzIHJhbmRvbWl6ZXIuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gSXMgaXQgT0sgdG8g
a2VlcCBzZXQvZ2V0IGZlYXR1cmVzIGZvciByYW5kb21pemVyID8gICAKPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+IEkgZG9uJ3QgdGhpbmsgaXQncyBhIGdvb2QgaWRlYSB0byBoYXZlIGRlYWQgY29k
ZSwgc28gbm8uIEJ1dCBJJ20gICAKPiAgCj4gPiA+IHByZXR0eSAgCj4gPiA+ID4gPiA+IHN1cmUg
d2UnbGwgZmluZCBhIHdheSB0byB1c2UvZXhwb3NlIHRoaXMgZmVhdHVyZS4gICAKPiA+ID4gPiA+
IAo+ID4gPiA+ID4gb2theSwgZ3JlYXQhCj4gPiA+ID4gPiBMb29raW5nIGZvcndhcmQgdG8gaGVh
cmluZyB0aGlzIGZlYXR1cmUgdXNlL2V4cG9zZS4gICAKPiA+ID4gPiAKPiA+ID4gPiBCdXQgZm9y
IHRoYXQgdG8gaGFwcGVuIHdlIGFyZSB3YWl0aW5nIGZvciBpbnB1dHMgYWJvdXQgd2hlbiB0aGlz
IGlzCj4gPiA+ID4gc3VwcG9zZWQgdG8gYmUgdXNlZC4uLiAgIAo+ID4gPiAKPiA+ID4gCj4gPiA+
IFRoZSBtYWluIHJlYXNvbiB0byBkaXNhYmxlIFJhbmRvbWl6ZXIgaW4gZGVmYXVsdCBpcwo+ID4g
PiBOT1AgPSA0IChkZWZhdWx0KSBjaGFuZ2UgdG8gTk9QID0gMSAoUmFuZG9taXplciBlbmFibGUp
LCAKPiA+ID4gTk9QOiBudW1iZXIgb2YgcGFydGlhbCBwcm9ncmFtIGN5Y2xlcyBpbiBzYW1lIHBh
Z2UgIAo+ID4gCj4gPiBJIGFtIG5vdCBzdXJlIHRvIHVuZGVyc3RhbmQsIGlzIHRoaXMgcmVsYXRl
ZCB0byB3aGF0IHdlIGNhbGwgJ3N1YnBhZ2VzJz8KPiA+ICAgCj4geWVzLAo+IAo+ID4gPiAKPiA+
ID4gU29tZSBPUyBmaWxlIHN5c3RlbXMob3IgRlRMKSBtdWNoIGNvbmNlcm4gTk9QID0gNCBhbmQg
Cj4gPiA+IGFueSBiZXR0ZXIgd2F5IHRoYW4gc3lzLWZzIHRvIGVuYWJsZSBpdD8gIAo+ID4gCj4g
PiBzeXNmcyBlbnRyeSA9PiB1c2VyIGFjdGlvbgo+ID4gVGhlIHVzZXIgaGFzIGFic29sdXRlbHkg
bm8gd2F5IHRvIGtub3cgd2hlbiBpdCBpcyByZWxldmFudCB0byBlbmFibGUKPiA+IHRoZSByYW5k
b21pemVyLiBUaGUga2VybmVsIG11c3QgYmUgaW4gY2hhcmdlIG9mIGl0LiBTbyB0aGUgcXVlc3Rp
b24gaXM6Cj4gPiB3aGVuIGlzIGl0IHJlbGV2YW50IHRvIGVuYWJsZSB0aGUgcmFuZG9taXplcj8g
V2hhdCBjcml0ZXJpYT8gV2hhdAo+ID4gdGhyZXNob2xkPwo+ID4gICAKPiAKPiBSYW5kb21pemVy
IGlzIGFjY29yZGluZyB0byB1c2VycycgZGVtYW5kIHRoYXQgYXQgbGVhc3QgdHdvIGRpZmZlcmVu
dCB1c2UgCj4gY2FzZXMuCj4gMS4gYSBuZWVkIGZvciBhbiBvcGVyYXRpb24gbW9kZS91c2UgY2Fz
ZSB0byB0YWtlIGFkdmFudGFnZSBvZiBOT1Agb2YgNCAKPiB3aXRob3V0IHR1cm5pbmcgb24gcmFu
ZG9taXplcgo+IDIuIGFub3RoZXIgdXNlIGNhc2UgZm9yIGhpZ2ggZGF0YSBpbnRlZ3JpdHkgYnkg
ZW5hYmxpbmcgcmFuZG9taXplciBhbmQgCj4gc2FjcmlmaWNpbmcgTk9QIAo+IAo+IElmIHVzZXIg
YXBwbGljYXRpb24gZG9uJ3QgbmVlZCBzdWJwYWdlIHByb2dyYW0gKE5PUCA9IDEgaXMgb2spLAo+
IHRoZXkgY291bGQgZW5hYmxlIFJhbmRvbWl6ZXIgZnJvbSBrZXJuZWwgZHJpdmVyIAo+IChpLmUu
LCBjaGlwLT5vcHRpb25zIHw9IE5BTkRfTk9fU1VCUEFHRV9XUklURTsgJiBzZXQgZmVhdHVyZSB0
byBlbmFibGUgCj4gcmFuZG9taXplcikKPiBvciB1c2VyIHNwYWNlKGkuZS4sIHN5cy1mcy4pLgo+
IAo+IFRoZXJlZm9yZSwgZGVmYXVsdCB0byBkaXNiYWxlIHJhbmRvbWl6ZXIoZm9yIE5PUD00KS4K
CldoYXQgYWJvdXQgYSBEVCBwcm9wZXJ0eSBpbiB0aGUgTkFORCBjaGlwIG5vZGUgdGhhdCB3b3Vs
ZCBiZSBjaGVja2VkIGluCk1hY3Jvbml4IGRyaXZlcj8gT3IgbWF5YmUgYSBkZWZjb25maWcgZW50
cnk/IFRoaXMgY2Fubm90IGJlIGNoYW5nZWQgYXQKcnVudGltZS4KClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
