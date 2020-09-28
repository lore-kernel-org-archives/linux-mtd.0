Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A40AC2D0A8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 15:25:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 143F82100A
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 15:25:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ivTgBxLR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 143F82100A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=db7lTmr28x/Ym8YR6WBBX2lICS8SO4Xrr6+x99+i5cc=; b=ivTgBxLR7EQx2vNzSBRovdler
	43BlmJqaUKCvRBsM0dnwND1Mv9BEjoRY8B0uoxDza+5rE/M7Xq76kbfXxGg92YP8LqYZAR3vk6w/U
	/s8TqWK3jv/eaAQVloNbPXJ4wrgJh9lhCMQC2lTFHZIvyLu1PMxMhga6wnEKVB5nsL2KvGp2XtX6d
	n7tuk2An54cN8hPakwpraqViUwXtoFZO/cKoMtZuLLU/n4ZbSJdoyuhBnNVh0uoOFwAUTp8QRkM/d
	/GL57UKe++g5vev02Bdl0KRfT7j4E6Q69m6CgaknxMEnhVechuf6GicMb2cVFyClJZc8sREV+9N1+
	WLWi2MPig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMv0m-00013k-C3; Mon, 28 Sep 2020 15:24:20 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMuvL-0006vD-2m
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2020 15:18:44 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 95D68240005;
 Mon, 28 Sep 2020 15:18:36 +0000 (UTC)
Date: Mon, 28 Sep 2020 17:18:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v13 19/20] mtd: rawnand: Use the ECC framework user
 input parsing bits
Message-ID: <20200928171835.30c14cf2@xps13>
In-Reply-To: <20200921093603.GA19513@pengutronix.de>
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
 <20200827085208.16276-20-miquel.raynal@bootlin.com>
 <20200921093603.GA19513@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_111843_304361_0A8AEC81 
X-CRM114-Status: GOOD (  19.96  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Fabio Estevam <festevam@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2FzY2hhLAoKU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBNb24sIDIxIFNlcCAyMDIwCjExOjM2OjAzICswMjAwOgoKPiBPbiBUaHUsIEF1ZyAyNywgMjAy
MCBhdCAxMDo1MjowN0FNICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gTWFueSBoZWxw
ZXJzIGFyZSBnZW5lcmljIHRvIGFsbCBOQU5EIGNoaXBzLCB0aGV5IHNob3VsZCBub3QgYmUKPiA+
IHJhdy1OQU5EIHNwZWNpZmljLCBzbyB1c2UgdGhlIGdlbmVyaWMgb25lcy4KPiA+IAo+ID4gVG8g
YXZvaWQgbW92aW5nIGFsbCB0aGUgcmF3IE5BTkQgY29yZSAiaGlzdG9yeSIgaW50byB0aGUgZ2Vu
ZXJpYyBOQU5ECj4gPiBsYXllciwgd2Uga2VlcCBhIHBhcnQgb2YgdGhpcyBwYXJzaW5nIGluIHRo
ZSByYXcgTkFORCBjb3JlIHRvIGVuc3VyZQo+ID4gYmFja3dhcmQgY29tcGF0aWJpbGl0eS4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4KPiA+IC0tLSAgCj4gCj4gLi4uCj4gCj4gPiAtc3RhdGljIGludCBvZl9nZXRfbmFuZF9l
Y2Nfc3RlcF9zaXplKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4gPiArc3RhdGljIHZvaWQgb2Zf
Z2V0X25hbmRfZWNjX2xlZ2FjeV91c2VyX2NvbmZpZyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+
ID4gIHsKPiA+IC0JaW50IHJldDsKPiA+IC0JdTMyIHZhbDsKPiA+ICsJc3RydWN0IGRldmljZV9u
b2RlICpkbiA9IG5hbmRfZ2V0X2ZsYXNoX25vZGUoY2hpcCk7Cj4gPiArCXN0cnVjdCBuYW5kX2Vj
Y19wcm9wcyAqdXNlcl9jb25mID0gJmNoaXAtPmJhc2UuZWNjLnVzZXJfY29uZjsKPiA+ICAKPiA+
IC0JcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJuYW5kLWVjYy1zdGVwLXNpemUiLCAm
dmFsKTsKPiA+IC0JcmV0dXJuIHJldCA/IHJldCA6IHZhbDsKPiA+IC19Cj4gPiArCWlmICh1c2Vy
X2NvbmYtPmVuZ2luZV90eXBlICE9IE5BTkRfRUNDX0VOR0lORV9UWVBFX0lOVkFMSUQpCj4gPiAr
CQl1c2VyX2NvbmYtPmVuZ2luZV90eXBlID0gb2ZfZ2V0X3Jhd25hbmRfZWNjX2VuZ2luZV90eXBl
X2xlZ2FjeShkbik7ICAKPiAKPiBJIHRoaW5rIHRoZSBpbnRlbnRpb24gaXMgdG8gc2V0IHVzZXJf
Y29uZi0+ZW5naW5lX3R5cGUgd2hlbiBpdCdzIG5vdCBzZXQgYWxyZWFkeSwKPiBzbyB0aGlzIHNo
b3VsZCBiZSA9PSBpbnN0ZWFkIG9mICE9Cj4gCj4gPiAgCj4gPiAtc3RhdGljIGludCBvZl9nZXRf
bmFuZF9lY2Nfc3RyZW5ndGgoc3RydWN0IGRldmljZV9ub2RlICpucCkKPiA+IC17Cj4gPiAtCWlu
dCByZXQ7Cj4gPiAtCXUzMiB2YWw7Cj4gPiArCWlmICh1c2VyX2NvbmYtPmFsZ28gIT0gTkFORF9F
Q0NfQUxHT19VTktOT1dOKQo+ID4gKwkJdXNlcl9jb25mLT5hbGdvID0gb2ZfZ2V0X3Jhd25hbmRf
ZWNjX2FsZ29fbGVnYWN5KGRuKTsgIAo+IAo+IGRpdHRvCj4gCj4gPiAgCj4gPiAtCXJldCA9IG9m
X3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAibmFuZC1lY2Mtc3RyZW5ndGgiLCAmdmFsKTsKPiA+IC0J
cmV0dXJuIHJldCA/IHJldCA6IHZhbDsKPiA+ICsJaWYgKHVzZXJfY29uZi0+cGxhY2VtZW50ICE9
IE5BTkRfRUNDX1BMQUNFTUVOVF9VTktOT1dOKQo+ID4gKwkJdXNlcl9jb25mLT5wbGFjZW1lbnQg
PSBvZl9nZXRfcmF3bmFuZF9lY2NfcGxhY2VtZW50X2xlZ2FjeShkbik7ICAKPiAKPiBkaXR0bwo+
IAo+IFNhc2NoYQo+IAoKU29ycnkgZm9yIHRoZSBkZWxheSBJIHdhcyBhd2F5LgoKWW91IGFyZSBj
b21wbGV0ZWx5IHJpZ2h0LCBJIG1lc3NlZCB1cCB3aXRoIHRoZSBsb2dpYyBoZXJlLi4uIFRoaXMg
aXMKbm93IGZpeGVkLCB0aGFua3MhCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
