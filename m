Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E218DC88CB2
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 17:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJu3GD/otRxE56mP7+Y6C4EL+kP4tByGz4Vxv7TZjRk=; b=pbsLmmWEKy84WR
	imxuHFJiXUreXFuM4e/Y94Hta1VHMDkMKfXaoNc0YRXNESHYCG5NBa2anKycvyYG0+zKozkq0+8q2
	oE2yLfVOn9UnvcZvI9O+E1xjcOsdoMusuv7mEbqwtym5gFxuKJT9qV5B7d2yMYQe//0LISwe0Dt2W
	Lu+Jf3OEVhuLURqxHSmSUM534l0oD2Qp/aiMLfQZBUtQNJ6P4Mv8Cz4XoNlhrZfFzw+Pwxhk2Tcyq
	8DArqXVHe81Sg6ZD7V490j/LQfmmm+FoChA8HGn1G8HpqIPGOJb5Ohchm5B9gv0dmrntj/kHlu69w
	yo8ab8BprZMhvXW5ASCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8l03-004hbx-2d;
	Mon, 12 Jun 2023 17:06:39 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8l00-004hb8-0V
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 17:06:37 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686589591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQBc3fhdsVp5qzH3qA/+QTN+oL4mlTTyS8nfMMlKL1M=;
	b=GrMQJJF42taq7fRwipCnc6tPQTRxB15dXVKh4N+qUV427ePamLeuuw2gHyPgo3FCu1juSN
	eIZDbMjgwSgq7iad/iccPsXergkpUPECDuuRc8LJEdhPfROQnLPgaMqK9qTfKUbw3taLLz
	z4PdhPMNki4ox4CfUsBDPNEtVTdX3m+4J20TqycmP73d+Okj68IrqekS1OHgenvczkrYT9
	jQIxieYVZLsN7LEx0zbfmd+en0uzQSOKFLv6OOxuH43q0D5PpBHjcjJC70bRMiWtea7mSQ
	ImqZDJyz0/xuITY7aL45BZW5BqBX9+ul34H0DHLj+6PBGYVmyEkkkRAX+Lhgkg==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 029EAFF807;
	Mon, 12 Jun 2023 17:06:28 +0000 (UTC)
Date: Mon, 12 Jun 2023 19:06:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle
 <michael@walle.cc>, linux-mtd@lists.infradead.org, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: Support for another sst flash
Message-ID: <20230612190626.7a6ee8d6@xps-13>
In-Reply-To: <b5c403ad-f8d2-5f00-e345-ef412a706544@linaro.org>
References: <20230609144324.850617-1-miquel.raynal@bootlin.com>
	<b5c403ad-f8d2-5f00-e345-ef412a706544@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_100636_349954_0727D3D6 
X-CRM114-Status: GOOD (  20.03  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gTW9uLCAxMiBKdW4g
MjAyMyAxMTowMzo1NSArMDEwMDoKCj4gT24gNi85LzIzIDE1OjQzLCBNaXF1ZWwgUmF5bmFsIHdy
b3RlOgo+ID4gSGVsbG8gVHVkb3IsICAKPiAKPiBIaSwgTWlxdWVsIQo+IAo+ID4gCj4gPiBIZXJl
IGFyZSBhIGNvdXBsZSBvZiBwYXRjaGVzIGFkZGluZyBzdXBwb3J0IGZvciB0aGUgc3N0MjZ2ZjAz
MmIgc3BpLW5vciwKPiA+IG5vdGhpbmcgc3BlY2lmaWMgaGVyZS4gSSBob3BlIEkgcmFuIGFsbCB0
aGUgcmVxdWlyZWQgdGVzdHMgY29ycmVjdGx5LAo+ID4gb3RoZXJ3aXNlIGxldCBtZSBrbm93LiAg
Cj4gCj4gVGhlIHRlc3RzIGFyZSBmaW5lLCB0aGFua3MuIEkgdGhpbmsgaXQncyBkZWJhdGFibGUg
d2hldGhlciB3ZSBpbmNsdWRlCj4gdGhlIG91dHB1dCBvZiB0aGUgdGVzdHMgaW4gdGhlIGNvbW1p
dCBtZXNzYWdlIG9yIGluIHRoZSBjb21tZW50cyBzZWN0aW9uCj4gYmVsb3cgdGhlIC0tLSBsaW5l
LCBidXQgSSdtIGZpbmUgZWl0aGVyIHdheS4KCkkgaGF2ZSBhIHNsaWdodCBwcmVmZXJlbmNlIHRv
IGhhdmUgdGhlbSBpbiB0aGUgY29tbWl0IGxvZywgdGhpcyB3YXkKdGhleSBhcmUgcGFydCBvZiB0
aGUgZ2l0IGhpc3RvcnkgYW5kIGVhc2llciB0byBmaW5kLiBCdXQgSSBhZ3JlZSwgc2luY2UKd2Ug
bm93IGhhdmUgd2VsbCB0cmFja2VkIG1haWxpbmcgbGlzdHMsIG15IGNvbmNlcm5zIG1pZ2h0IHNs
b3dseSBnbwphd2F5LgoKPiBJIGhhZCBzb21lIGNvbW1lbnRzIGZvciB0aGUgcGF0Y2hlcywgSSds
bCBsZXQgeW91IHJlYWQgdGhlbS4KClllcCwgSSdsbCBtYWtlIGFkZGl0aW9uYWwgdGVzdHMgYW5k
IHNlZSB3aGF0IEkgY2FuIGNvbWUgdXAgd2l0aC4KCj4gQ2hlZXJzLAo+IHRhCj4gPiAKPiA+IENo
ZWVycywKPiA+IE1pcXXDqGwKPiA+IAo+ID4gTWlxdWVsIFJheW5hbCAoMik6Cj4gPiAgIGR0LWJp
bmRpbmdzOiBtdGQ6IHNwaS1ub3I6IERvY3VtZW50IHNzdDI2dmYweHhiIGZsYXNoIHNlcmllcwo+
ID4gICBtdGQ6IHNwaS1ub3I6IEFkZCBzdXBwb3J0IGZvciBzc3QyNnZmMDMyYiBmbGFzaAo+ID4g
Cj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9y
LnlhbWwgfCAyICstCj4gPiAgZHJpdmVycy9tdGQvc3BpLW5vci9zc3QuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCA0ICsrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gICAKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
