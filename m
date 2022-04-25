Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3440BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Apr 2022 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aia1A/RhLLQcjfGzqvUgeCqaovjJ6wtHRccKbu4ZKws=; b=1V9FuRtnKlyavW
	BjScPTlhj3V15NXGiYp1E6SI7uovlG0t8s9H08UO25Ny0fnX48zQKzroz/eQ0UauGItlLFdfe+UiU
	fl6kOFn/pYUHvM7wPaMCxT1sYRYhV0mhec08Vv0bxOGZhqSSa7LlCcMzW+P0Tks9I9LyF7OfkWqxg
	0eX2/bqyQ1b7RwgD5OhB7KjIcIYFnphCyqTAES/R/X9z48iILujzz6e2Xy5KrPyjhjHkja9SSlx4J
	f0HVhIJ20AC+nOQtK2sgnMDkOG9GRtD44wY9Wm7CKz/GsIakz7Z6nsVv2Xr1z/5cAFQpsxqVBgWGT
	Waar8dUu9TNTWWntVbWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niu5B-008kTl-I9; Mon, 25 Apr 2022 08:28:33 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niu53-008kRj-D4
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2022 08:28:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E502A240003;
 Mon, 25 Apr 2022 08:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650875300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M1PvE0KJAkJstROW5DfWV0jdUqZeR3ZX64wIRcBKqWY=;
 b=dpL/VBGvBTatHJeEf85vfiHwjVsQlEtKqpgroYG1gYeOzvSvQ2Lsmz50OF8KUMfCrenWYP
 JEbmphFdkakM5V2i7I8WF8cdjM5c0TcGnH7o0dloIHpXPp1KjdtjJR3tKKTt5cFmta/eC3
 wX7ECWHgqoLeXnjnqhTldCn5sjgS32lY3+XSwf8MFl95/Z7R2etb9jgh1EqVXdX6Fd1jLN
 rAbhy5h5LnKEDDLESxZKD71befHkpwMcPc3HvfGPC4gKUUwYXg2ZVuPBLd6/i13PZP/7nO
 bWcUHYFjSbJBbEEu3M3TpSjKJzaDqNUuMFYoxEoIIwPnYAxbJnF5ZFwZR7N0Xg==
Date: Mon, 25 Apr 2022 10:28:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: kernel test robot <lkp@intel.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "richard@nod.at" <richard@nod.at>, "joern@lazybastard.org"
 <joern@lazybastard.org>, "kbuild-all@lists.01.org"
 <kbuild-all@lists.01.org>, kernel <kernel@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] mtd: phram: Allow cached mappings
Message-ID: <20220425102816.54619c66@xps13>
In-Reply-To: <20220414090402.GA11067@axis.com>
References: <20220412135302.1682890-5-vincent.whitchurch@axis.com>
 <202204131446.omJ5mC54-lkp@intel.com>
 <20220414090402.GA11067@axis.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_012825_787830_2871FB05 
X-CRM114-Status: GOOD (  17.15  )
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

SGkgVmluY2VudCwKCnZpbmNlbnQud2hpdGNodXJjaEBheGlzLmNvbSB3cm90ZSBvbiBUaHUsIDE0
IEFwciAyMDIyIDExOjA0OjAyICswMjAwOgoKPiBPbiBXZWQsIEFwciAxMywgMjAyMiBhdCAwODo0
NTo1OUFNICswMjAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90ZToKPiA+IEFsbCBlcnJvcnMgKG5l
dyBvbmVzIHByZWZpeGVkIGJ5ID4+KToKPiA+IAo+ID4gICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9t
IGluY2x1ZGUvbGludXgvaW8uaDoxMywKPiA+ICAgICAgICAgICAgICAgICAgICAgZnJvbSBkcml2
ZXJzL210ZC9kZXZpY2VzL3BocmFtLmM6MjE6Cj4gPiAgICBkcml2ZXJzL210ZC9kZXZpY2VzL3Bo
cmFtLmM6IEluIGZ1bmN0aW9uICdyZWdpc3Rlcl9kZXZpY2UnOiAgCj4gPiA+PiBhcmNoL3NoL2lu
Y2x1ZGUvYXNtL2lvLmg6Mjc0OjMzOiBlcnJvcjogZXhwZWN0ZWQgZXhwcmVzc2lvbiBiZWZvcmUg
J2RvJyAgCj4gPiAgICAgIDI3NCB8ICNkZWZpbmUgaW91bm1hcChhZGRyKSAgICAgICAgICAgZG8g
eyB9IHdoaWxlICgwKQo+ID4gICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+Cj4gPiAgICBkcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmM6MTUwOjQ0OiBub3RlOiBp
biBleHBhbnNpb24gb2YgbWFjcm8gJ2lvdW5tYXAnCj4gPiAgICAgIDE1MCB8ICAgICAgICAgY2Fj
aGVkID8gbWVtdW5tYXAobmV3LT5tdGQucHJpdikgOiBpb3VubWFwKG5ldy0+bXRkLnByaXYpOwo+
ID4gICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xn5+fn5+fgo+ID4gICAgZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jOiBJbiBmdW5jdGlvbiAn
cGhyYW1fcmVtb3ZlJzogIAo+ID4gPj4gYXJjaC9zaC9pbmNsdWRlL2FzbS9pby5oOjI3NDozMzog
ZXJyb3I6IGV4cGVjdGVkIGV4cHJlc3Npb24gYmVmb3JlICdkbycgIAo+ID4gICAgICAyNzQgfCAj
ZGVmaW5lIGlvdW5tYXAoYWRkcikgICAgICAgICAgIGRvIHsgfSB3aGlsZSAoMCkKPiA+ICAgICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefgo+ID4gICAgZHJpdmVycy9t
dGQvZGV2aWNlcy9waHJhbS5jOjM3Mjo1Mzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdp
b3VubWFwJwo+ID4gICAgICAzNzIgfCAgICAgICAgIHBocmFtLT5jYWNoZWQgPyBtZW11bm1hcChw
aHJhbS0+bXRkLnByaXYpIDogaW91bm1hcChwaHJhbS0+bXRkLnByaXYpOwo+ID4gICAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fgo+ID4gCj4gPiAKPiA+IHZpbSArL2RvICsyNzQgYXJjaC9zaC9pbmNsdWRlL2FzbS9pby5o
Cj4gPiAKPiA+IGQ1N2Q2NDA4MGRkYzBmIFBhdWwgTXVuZHQgICAgICAgIDIwMTAtMDEtMTkgIDI3
MiAgCj4gPiAxM2YxZmM4NzBkZDc0NyBDaHJpc3RvcGggSGVsbHdpZyAyMDIwLTA3LTE0ICAyNzMg
ICNlbHNlIC8qIENPTkZJR19NTVUgKi8KPiA+IDEzZjFmYzg3MGRkNzQ3IENocmlzdG9waCBIZWxs
d2lnIDIwMjAtMDctMTQgQDI3NCAgI2RlZmluZSBpb3VubWFwKGFkZHIpCQlkbyB7IH0gd2hpbGUg
KDApCj4gPiAxM2YxZmM4NzBkZDc0NyBDaHJpc3RvcGggSGVsbHdpZyAyMDIwLTA3LTE0ICAyNzUg
ICNkZWZpbmUgaW9yZW1hcChvZmZzZXQsIHNpemUpCSgodm9pZCBfX2lvbWVtICopKHVuc2lnbmVk
IGxvbmcpKG9mZnNldCkpCj4gPiAxM2YxZmM4NzBkZDc0NyBDaHJpc3RvcGggSGVsbHdpZyAyMDIw
LTA3LTE0ICAyNzYgICNlbmRpZiAvKiBDT05GSUdfTU1VICovCj4gPiBkNjI3YTJlYmQxYTMwMyBQ
YXVsIE11bmR0ICAgICAgICAyMDEwLTAxLTI4ICAyNzcgICAgCj4gCj4gVGhhbmsgeW91IGZvciB0
aGUgcmVwb3J0LiAgVGhpcyBwYXRjaCBjb3VsZCBjZXJ0YWlubHkgYmUgY2hhbmdlZCB0byB3b3Jr
Cj4gYXJvdW5kIHRoaXMsIGJ1dCBJU1RNIHRoYXQgdGhlIHJpZ2h0IGZpeCBpcyBpbiB0aGUgU0gg
aGVhZGVyIGZpbGUsIHNpbmNlCj4gdGhlIHByb2JsZW0gY291bGQgaGl0IGluIG90aGVyIGNhc2Vz
IHRvby4gIEkndmUgcG9zdGVkIGEgZml4IGhlcmUgbm93Ogo+IAo+ICBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzIwMjIwNDE0MDgxMjU3LjE0ODc0OTktMS12aW5jZW50LndoaXRjaHVyY2hA
YXhpcy5jb20vCgpMb29rcyBnb29kIHRvIG1lIGJ1dCBJIGRvbid0IHdhbnQgdG8gYmUgdGhlIG9u
ZSAiY2FycnlpbmciIG5ldyBjb21waWxlCmVycm9ycyBzbyBJJ2xsIGRyb3AgdGhlIHNlcmllcyBm
b3Igbm93LCB1bnRpbCB5b3UgZ2V0IHRoaXMgcGF0Y2gKYXBwbGllZC4gUGxlYXNlIHRoZW4ganVz
dCByZXNlbmQgdGhlIHNlcmllcyB3aXRoIHRoaXMgdGhyZWFkIG1lbnRpb25lZAphbmQgSSdsbCB0
YWtlIGl0IGJhY2suCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
