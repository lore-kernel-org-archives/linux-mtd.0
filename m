Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3117EC282C4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 11:01:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE8F420879
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 11:01:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="csIVtgJv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE8F420879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7UeK6nNHPC/mdrWdKNpPkH94w0bkOggEW5Ea1CW84Es=; b=csIVtgJvd4P+6b
	jZit8Xrke+0hmE7MTlYc24Bbl1lHM4d2cGAUGiqLnQEvb+hIIz1go1LZnNCD9JRdZRga+T0qZhEEK
	TcxVtTG6M1BwgfIkC33X9/rIRpRTb/3S58IriZczYE74RTwOhf2GgOLjYi85gHby/T/YOHzisnwdl
	IprlN7UZrRMqNSf6hHKgjYWuz9cUi3jpQ2wIG3AMzq3j88g6rxnkt9jzKZDZbko64C+w7mZNmPJwg
	X+YgrZCT9x+Elfq333mNpKlKJGm3lxuUv+qMOjr8yRDOmByFBwdQHcW/01UwglNqI5d2k2Qy6Ae+f
	qMlsavbDSBCtemUXfsBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gltoN-0000Xe-DU; Tue, 22 Jan 2019 11:01:43 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gltoF-0000Wv-Rd
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 11:01:42 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 121EA207B2; Tue, 22 Jan 2019 12:01:34 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-37-87.w90-88.abo.wanadoo.fr
 [90.88.156.87])
 by mail.bootlin.com (Postfix) with ESMTPSA id B978D206DC;
 Tue, 22 Jan 2019 12:01:23 +0100 (CET)
Date: Tue, 22 Jan 2019 12:01:23 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH v3 1/2] mtd: partitions: clarify __mtd_del_partition() name
Message-ID: <20190122120123.211c385f@xps13>
In-Reply-To: <20190121110324.1367d527@bbrezillon>
References: <20190117152929.28256-1-miquel.raynal@bootlin.com>
 <20190121110324.1367d527@bbrezillon>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_030136_030248_8D008DCB 
X-CRM114-Status: GOOD (  12.09  )
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
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4gd3JvdGUg
b24gTW9uLCAyMSBKYW4gMjAxOQoxMTowMzoyNCArMDEwMDoKCj4gT24gVGh1LCAxNyBKYW4gMjAx
OSAxNjoyOToyOCArMDEwMAo+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+IHdyb3RlOgo+IAo+ID4gX19tdGRfZGVsX3BhcnRpdGlvbigpIGlzIGEgaGVscGVyIHRoYXQg
bXVzdCBiZSBjYWxsZWQgYWZ0ZXIgdGhlCj4gPiBwYXJ0aXRpb24gbG9jayBoYXMgYmVuIHRha2Vu
LiBBcyB0aGVyZSBhcmUgYWxyZWFkeSBhIGZldyBzaW1pbGFyIG5hbWVzICAKPiAKPiAJCSAgICAg
XmJlZW4KCldpbGwgY29ycmVjdCBpdC4KCj4gCj4gPiAobXRkX2RlbF9wYXJ0aXRpb25zKCksIGRl
bF9tdGRfcGFydGl0aW9ucygpLCBfX210ZF9kZWxfcGFydGl0aW9ucygpKSwKPiA+IG1ha2UgdGhp
cyBjbGVhciBieSByZW5hbWluZyB0aGUgaGVscGVyIG10ZF9kZWxfcGFydGl0aW9uX2xvY2tlZCgp
LiAgCj4gCj4gVGhhdCdzIGluZGVlZCBhIGdvb2Qgc3RlcCBmb3J3YXJkLCBidXQgd2Ugc3RpbGwg
aGF2ZSBhbGwgdGhvc2UgdmFyaWFudHMKPiB1c2luZyBzaWdodGx5IGRpZmZlcmVudCBuYW1lcyAo
bXRkXzxhY3Rpb24+KCkgYW5kIDxhY3Rpb24+X210ZCgpKS4KPiBXb3VsZCBiZSBncmVhdCBpZiB3
ZSBjb3VsZCBtYWtlIHRoZSBuYW1lcyBtb3JlIGV4cGxpY2l0IGZvciB0aG9zZQo+IGZ1bmN0aW9u
cyB0b28gKG9yIHJlbW92ZSB0aG9zZSB0aGF0IGFyZSB1bm5lZWRlZCkuIAoKSSB0cnVseSBhZ3Jl
ZS4gSSBhY3R1YWxseSB0cmllZCBidXQgdGhpcyBpcyBtdWNoIG1vcmUgdGltZSBjb25zdW1pbmcK
dGhhbiBleHBlY3RlZCBzbyBJIHdpbGwgbGV0IHRoaXMgY2hhbmdlIGFzaWRlIGZvciBub3cgYnV0
IEkgd291bGQKcmVhbGx5IGxpa2UgdGhlc2UgaGVscGVycyB0byBiZSBtZXJnZWQuCgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
