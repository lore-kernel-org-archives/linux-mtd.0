Return-Path: <SRS0=r2JG=TA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83804C04AA6
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 09:33:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5406721670
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 09:33:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TZh3hmrw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5406721670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHU9487FRDhUC3keYi1N2GUAzbdsLKi5AfeI+1P80i4=; b=TZh3hmrw1PZckQ
	PBIP6T7sv3an0iQY2pWwO3T8Uqk/c+PJRTvt4AOyuRWp+S0cGKXSOp1mbkXqQwmxc8WHcTx8/LjyA
	UCsticX3nPDPA2NhctI6FFwrnl8v0bHtDKOUwPs7f55LvL0kqmK1RgVwkNqBHL5ob9TpWjYFCjUCb
	Wi4kAlJ1hJ4zIAVmXkI/w5yrmz5G+yhS2lc8Ra8zzJ++dn5TIkK50A+qWPPgrcle+qWICNOY1tt7l
	H2JV620FzuvGGIlS6eHVr96SMNd2/te70cq6iMg0HUH0bWvRghZnITqdmQqsDnLsuIj9K7WgK++9Z
	CWObPVqvjxOiW9G1sBlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLP8S-0002Fw-EM; Tue, 30 Apr 2019 09:33:12 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLP8D-0001to-0J
 for linux-mtd@lists.infradead.org; Tue, 30 Apr 2019 09:32:59 +0000
X-Originating-IP: 90.88.147.33
Received: from xps13 (aaubervilliers-681-1-27-33.w90-88.abo.wanadoo.fr
 [90.88.147.33]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7AA54240015;
 Tue, 30 Apr 2019 09:32:42 +0000 (UTC)
Date: Tue, 30 Apr 2019 11:32:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Dahl <ada@thorsis.com>
Subject: Re: atmel nand bindings vs. actual dts files
Message-ID: <20190430113242.5cad2f16@xps13>
In-Reply-To: <1947914.CcHDgmXbBm@ada>
References: <1823900.qPX5mxbl1h@ada> <4099561.5sHrvDXGx3@ada>
 <20190429115540.7d577a50@xps13> <1947914.CcHDgmXbBm@ada>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_023257_195601_990390F4 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQWxleGFuZGVyLAoKQWxleGFuZGVyIERhaGwgPGFkYUB0aG9yc2lzLmNvbT4gd3JvdGUgb24g
VHVlLCAzMCBBcHIgMjAxOSAxMToyNDo0NAorMDIwMDoKCj4gSGVsbG8gTWlxdcOobCwKPiAKPiBB
bSBNb250YWcsIDI5LiBBcHJpbCAyMDE5LCAxMTo1NTo0MCBDRVNUIHNjaHJpZWIgTWlxdWVsIFJh
eW5hbDoKPiA+IEFsZXhhbmRlciBEYWhsIDxhZGFAdGhvcnNpcy5jb20+IHdyb3RlIG9uIFRodSwg
MDcgTWFyIDIwMTkgMTc6MjU6MTcgIAo+ID4gPiBBbSBNaXR0d29jaCwgNi4gTcOkcnogMjAxOSwg
MTU6MDc6NTIgQ0VUIHNjaHJpZWIgQWxleGFuZGVyIERhaGw6ICAKPiA+ID4gPiBTbyBpbnN0ZWFk
IG9mICJhbHdheXMgMHg4MDAwMDAiIHRoYXQgbm9kZSBoYXMgMHgyIGFzIHRoaXJkIGVudHJ5IGZv
ciB0aGUKPiA+ID4gPiAncmVnJyBwcm9wZXJ0eS4gV2h5IGlzIHRoYXQ/ICAKPiA+ID4gCj4gPiA+
IEkgZGlkbid0IGludmVzdGlnYXRlIHRoYXQgZnVydGhlciB5ZXQsIGJ1dCBJJ20gY3VyaW91cywg
c28gaWYgYW55b25lCj4gPiA+IGtub3dzPyAgCj4gPiAKPiA+IEkgc3VwcG9zZSB0aGUgYmluZGlu
Z3MgWzFdIGV4cGxhaW4gdGhlIHNpdHVhdGlvbi4KPiA+IAo+ID4gWzFdCj4gPiBodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC92NS4wL3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGkKPiA+IG5ncy9tdGQvYXRtZWwtbmFuZC50eHQjTDMyICAKPiAKPiBObywgdGhhdCB3
YXMgbm90IHdoYXQgSSB3YW50ZWQgdG8ga25vdy4gVGhlIGJpbmRpbmdzIHNheXMgZm9yIHRoYXQg
cmVnIAo+IHByb3BlcnR5OiDigJwzcmQgZW50cnk6IHRoZSBtZW1vcnkgcmVnaW9uIHNpemUgKGFs
d2F5cyAweDgwMDAwMCnigJ0KPiAKPiBUaGlzIGlzIHRydWUgZm9yIHNvbWUgZHRzIGZpbGVzIGlu
Y2x1ZGluZyB0aGlzIG5hbmQgbm9kZSwgYnV0IG5vdCBmb3IgYWxsLCAKPiBzb21lIGhhdmUgdGhp
czoKPiAKPiAJbmFuZEAzIHsKPiAJCXJlZyA9IDwweDMgMHgwIDB4ODAwMDAwPjsKPiAKPiBPdGhl
cnMgaGF2ZSB0aGlzOgo+IAo+IAluYW5kQDMgewo+IAkJcmVnID0gPDB4MyAweDAgMHgyPjsKPiAK
PiBUaGUgc2Vjb25kIGNvbnRyYWRpY3RzIHRoZSBiaW5kaW5nIGRvYy4gTW9zdCBvZiB0aGlzIHdh
cyBjaGFuZ2VkIHdoZW4gCj4gc3dpdGNoaW5nIGZyb20gdGhlIG9sZCBiaW5kaW5ncyBpbiBjaGFu
Z2VzZXQgdjQuMTItcmMxLTctZzEwMDRhMjk3N2JkYyBieSAKPiBCb3JpcyBCcmV6aWxsb24uIEkg
d2FudGVkIHRvIGtub3cgd2h5IHRoZSBkaWZmZXJlbmNlPyAKCkluZGVlZC4gQWRkaW5nIEFsZXhh
bmRyZSB3aG8gbWlnaHQgYWxzbyBoYXZlIGFuIGlkZWEgYW5kIFR1ZG9yIGZvcgpyZWZlcmVuY2Uu
CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
