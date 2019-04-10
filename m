Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F2FC10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 07:16:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80E442133D
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 07:16:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S8qnOZ4v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80E442133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7kS9/prozEFmP5T+H93AeCNwGWhfufGMmuopkKt29s=; b=S8qnOZ4vYzQxdO
	KkJqEn8UypNrw1RauI+ZQmO+Sry8u+w31t371DaoGxhUqeWT2eZN1iCYk7/hsAYR9NWlcGplK7TkE
	kBBBfdFVorg1kxBqbv3caRzQcl5yVnPuGOyUvdlJ/6vbFuDzF8E7J+Q3G1ftTgogx5WIoUfLOdEyi
	DseUIBsPNYTIrsOwsAo0PJIO9WUydZmY583wl73vUdeKk/0x9OG4Cp+tdhB9Khba1w27V4uXelNO7
	rcq5CWbSkXI75Kslxtll2Hi1y68QvTesYo34ZuFFFspRwZuvo+WDoDfgvMr+0QEDzqygVx0yXQRMr
	lIfLQ8ry7w4lK8kpC1Sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE7TC-0003Sa-Ub; Wed, 10 Apr 2019 07:16:30 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE7T9-0003S2-Cj
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 07:16:29 +0000
X-Originating-IP: 90.88.18.121
Received: from xps13 (aaubervilliers-681-1-63-121.w90-88.abo.wanadoo.fr
 [90.88.18.121]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B6D7EFF808;
 Wed, 10 Apr 2019 07:16:13 +0000 (UTC)
Date: Wed, 10 Apr 2019 09:16:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH] mtd: rawnand: Add Macronix NAND read retry and
 randomizer support
Message-ID: <20190410091612.229c91b4@xps13>
In-Reply-To: <OF9601E14B.A48284C4-ON482583D8.0005E3EB-482583D8.0006CC14@mxic.com.tw>
References: <1554780172-23111-1-git-send-email-masonccyang@mxic.com.tw>
 <20190409090427.22de9917@collabora.com>
 <OF6C97E4DE.45261545-ON482583D7.00340468-482583D7.0034B3FE@mxic.com.tw>
 <20190409114701.744c2c8c@collabora.com>
 <OF9601E14B.A48284C4-ON482583D8.0005E3EB-482583D8.0006CC14@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_001627_584156_231C4188 
X-CRM114-Status: GOOD (  19.21  )
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

SGkgTWFzb24sCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZSBvbiBXZWQsIDEwIEFwciAy
MDE5IDA5OjE0OjE0ICswODAwOgoKPiBIaSBCb3JpcywKPiAKPiA+IAo+ID4gU3ViamVjdAo+ID4g
Cj4gPiBSZTogW1BBVENIXSBtdGQ6IHJhd25hbmQ6IEFkZCBNYWNyb25peCBOQU5EIHJlYWQgcmV0
cnkgYW5kIHJhbmRvbWl6ZXIgICAKPiBzdXBwb3J0Cj4gPiAKPiA+IE9uIFR1ZSwgOSBBcHIgMjAx
OSAxNzozNTozOSArMDgwMAo+ID4gbWFzb25jY3lhbmdAbXhpYy5jb20udHcgd3JvdGU6Cj4gPiAg
IAo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qga29ial9hdHRyaWJ1
dGUgc3lzZnNfbXhpY19uYW5kID0KPiA+ID4gPiA+ICsgICBfX0FUVFIobmFuZF9yYW5kb20sIFNf
SVJVR08gfCBTX0lXVVNSLAo+ID4gPiA+ID4gKyAgICAgICAgICBteGljX25hbmRfcmFuZF90eXBl
X3Nob3csCj4gPiA+ID4gPiArICAgICAgICAgIG14aWNfbmFuZF9yYW5kX3R5cGVfc3RvcmUpOyAg
IAo+ID4gPiA+IAo+ID4gPiA+IE5vLCB3ZSBkb24ndCB3YW50IHRvIGV4cG9zZSB0aGF0IHRocm91
Z2ggYSBzeXNmcyBmaWxlLCBlc3BlY2lhbGx5ICAgCj4gc2luY2UKPiA+ID4gPiBjaGFuZ2luZyB0
aGUgcmFuZG9taXplciBjb25maWcgbWVhbnMgbWFraW5nIHRoZSBOQU5EIHVucmVhZGFibGUgZm9y
Cj4gPiA+ID4gdGhvc2UgdGhhdCBoYXZlIHVzZWQgaXQgYmVmb3JlIHRoZSBjaGFuZ2UuCj4gPiA+
ID4gICAKPiA+ID4gCj4gPiA+IE91ciBvbi1kaWUgcmFuZG9taXplciBpcyBzdGlsbCByZWFkYWJs
ZSBmcm9tIHVzZXIgYWZ0ZXIgdGhlIGZ1bmN0aW9uIAo+ID4gPiBpcyBlbmFibGVkLiAgCj4gPiAK
PiA+IFlvdSBtZWFuIHRoZSBtZW1vcnkgaXMgc3RpbGwgcmVhZGFibGUgbm8gbWF0dGVyIHRoZSBy
YW5kb21pemVyIHN0YXRlLgo+ID4gTm90IHN1cmUgaG93IHRoYXQncyBwb3NzaWJsZSwgYnV0IG9r
YXkuCgpTbyBpZiB5b3Ugd3JpdGUgbm9uLXJhbmRvbWl6ZWQgZGF0YSB0byB0aGUgTkFORCBjaGlw
LCB0aGVuIGVuYWJsZSB0aGUKcmFuZG9taXplciBlbiByZWFkIGJhY2sgdGhlIGRhdGEsIGFsbCB3
aWxsIGJlIG9rPwoKQW5kIGlmIHJhbmRvbWl6ZWQgZGF0YSBpcyB3cml0dGVuIHRvIHRoZSBOQU5E
IGNoaXAgYW5kIHdlIGRpc2FibGUgdGhlCnJhbmRvbWl6ZXIsIHRoZW4gdGhlIGRhdGEgd2lsbCBh
bHNvIGJlIGNvcnJlY3Q/Cgo+ID4gICAKPiA+ID4gVGhpcyByYW5kb21pemVyIGlzIGp1c3QgbGlr
ZSBhIGludGVybmFsIG1lbW9yeSBjZWxsIAo+ID4gPiByZWxpYWJpbGl0eSBlbmhhbmNlZC4gIAo+
ID4gCj4gPiBXaHkgZG9uJ3QgeW91IGVuYWJsZSBpdCBieSBkZWZhdWx0IHRoZW4/ICAKPiAKPiBU
aGUgcGVuYWx0eSBvZiByYW5kb21pemVyIGlzIHJlYWQvd3JpdGUgcGVyZm9ybWFuY2UgZG93bi4K
PiBpLmUsLiB0UFJPRyAzMDAgdXMgdG8gMzQwIHVzIChyYW5kb21pemVyIGVuYWJsZSkKPiB0aGVy
ZWZvcmUsIGRpc2FibGUgaXQgYnkgZGVmYXVsdC4KCklzIHRoaXMgaW5mbyBzb21ld2hlcmUgaW4g
dGhlIE9ORkkgcGFyYW0gcGFnZT8gSSBzdXBwb3NlIG9uY2UKcmFuZG9taXphdGlvbiBpcyBlbmFi
bGVkIHdlIHNob3VsZCBhbHNvIHR3ZWFrIHRoZSB0aW1pbmdzIGFuZCB2ZXJpZnkKdGhhdCB0aGUg
Y29udHJvbGxlciBzdXBwb3J0cyBpdC4KCj4gPiA+IEl0IGNvdWxkIGJlIGVuYWJsZSBhdCBhbnkg
dGltZSB3aXRoIE9UUCBiaXQgZnVuY3Rpb24gYW5kIHRoYXQncyB3aHkKPiA+ID4gd2UgcGF0Y2gg
aXQgYnkgc3lzLWZzLiAgCj4gPiAKPiA+IFNvcnJ5LCBidXQgdGhhdCdzIG5vdCBhIGdvb2QgcmVh
c29uIHRvIGV4cG9zZSB0aGF0IHRocm91Z2ggc3lzZnMuICAKPiAKPiBBbnkgZ29vZCB3YXkgdG8g
ZXhwb3NlIHJhbmRvbWl6ZXIgZnVuY3Rpb24gZm9yIHVzZXIgPwo+IAo+IHRoYW5rcyAmIGJlc3Qg
cmVnYXJkcywKPiBNYXNvbgo+IAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
