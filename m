Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B67EC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 07:23:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D21B2071A
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 07:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PI7TCDoc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D21B2071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BMX5yQYVJoGlSCjavkFkoDvI453LRFosdIAIM9a/Zg=; b=PI7TCDocXOZ24o
	3iKAVPX7NX4z+CoJix4fZsU3frgej06jc94UHBQXZKltdj/m/kJ+GclGkbwW4BIInNGEGbKDD1cNU
	2Fb+Ornt+okjJSa5x5fe9pJSFeLiv7Kpt4RA73VU0TixU3LjUTx2IhRcukt8ptsupuc418SiVfyeL
	esJQ2d/BnqYYCZIgRyV9E+H4RXoSkIaUremfVggpfxgLH1VUJ0aEox4PEKFXfOzKqtAayZtTm6YV7
	H6Ub6rDywIb6yQKovOL4xUSIAwc0XsWfs92Kswwt3t9e557JQR6fpnDLvJIa1wCVJW4iZoxBGsGNk
	Rs5ZUINdIgaUwR6uszMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd7SH-0005hu-TN; Mon, 25 May 2020 07:23:25 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd7SD-0005h4-Va
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 07:23:23 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 30301200012;
 Mon, 25 May 2020 07:23:17 +0000 (UTC)
Date: Mon, 25 May 2020 09:23:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 17/17] mtd: rawnand: nandsim: Reorganize
 ns_cleanup_module()
Message-ID: <20200525092315.5f950554@xps13>
In-Reply-To: <20200525084735.0ca0dad3@collabora.com>
References: <20200509191431.15862-1-miquel.raynal@bootlin.com>
 <20200509191431.15862-18-miquel.raynal@bootlin.com>
 <CAFLxGvzU2ESxZ74cve9w=CLBY2v95MMMJqzOFEmCAhVHYF5VvA@mail.gmail.com>
 <20200525001328.6b52da1f@xps13>
 <20200525084637.328d2872@collabora.com>
 <20200525084735.0ca0dad3@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_002322_152012_749EFAD9 
X-CRM114-Status: GOOD (  14.65  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Richard Weinberger <richard@nod.at>, dedekind@infradead.org,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBNb24sIDI1IE1heQoyMDIwIDA4OjQ3OjM1ICswMjAwOgoKPiBPbiBNb24sIDI1
IE1heSAyMDIwIDA4OjQ2OjM3ICswMjAwCj4gQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxs
b25AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4gCj4gPiBPbiBNb24sIDI1IE1heSAyMDIwIDAwOjEz
OjI4ICswMjAwCj4gPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3
cm90ZToKPiA+ICAgCj4gPiA+IEhpIFJpY2hhcmQsCj4gPiA+IAo+ID4gPiBSaWNoYXJkIFdlaW5i
ZXJnZXIgPHJpY2hhcmQud2VpbmJlcmdlckBnbWFpbC5jb20+IHdyb3RlIG9uIFN1biwgMjQgTWF5
Cj4gPiA+IDIwMjAgMjM6Mzc6MTMgKzAyMDA6Cj4gPiA+ICAgICAKPiA+ID4gPiBPbiBTYXQsIE1h
eSA5LCAyMDIwIGF0IDk6MTkgUE0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4gd3JvdGU6ICAgICAgCj4gPiA+ID4gPiAgICAgICAgIG5zX2RlYnVnZnNfcmVtb3ZlKG5z
KTsKPiA+ID4gPiA+IC0gICAgICAgbnNfZnJlZShucyk7ICAgIC8qIEZyZWUgbmFuZHNpbSBwcml2
YXRlIHJlc291cmNlcyAqLwo+ID4gPiA+ID4gLSAgICAgICBuYW5kX3JlbGVhc2UoY2hpcCk7IC8q
IFVucmVnaXN0ZXIgZHJpdmVyICovCj4gPiA+ID4gPiAtICAgICAgIGtmcmVlKG5zKTsgICAgICAg
IC8qIEZyZWUgb3RoZXIgc3RydWN0dXJlcyAqLwo+ID4gPiA+ID4gLSAgICAgICBuc19mcmVlX2xp
c3RzKCk7Cj4gPiA+ID4gPiArICAgICAgIFdBUk5fT04obXRkX2RldmljZV91bnJlZ2lzdGVyKG5z
bXRkKSk7Cj4gPiA+ID4gPiArICAgICAgIG5zX2ZyZWUobnMpOwo+ID4gPiA+ID4gKyAgICAgICBr
ZnJlZShlcmFzZV9ibG9ja193ZWFyKTsKPiA+ID4gPiA+ICsgICAgICAgbmFuZF9jbGVhbnVwKGNo
aXApOwo+ID4gPiA+ID4gKyAgICAgICBsaXN0X2Zvcl9lYWNoX3NhZmUocG9zLCBuLCAmZ3JhdmVf
cGFnZXMpIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBrZnJlZShsaXN0X2VudHJ5KHBvcywg
c3RydWN0IGdyYXZlX3BhZ2UsIGxpc3QpKTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBsaXN0
X2RlbChwb3MpOyAgICAgICAgCj4gPiA+ID4gCj4gPiA+ID4gQXJlIHlvdSBzdXJlIHlvdSBjYW4g
dXNlIHBvcyBhZnRlciBmcmVlaW5nIHRoZSBlbnRyeT8KPiA+ID4gPiBTbWVsbHMgbGlrZSB1c2Ug
YWZ0ZXIgZnJlZS4KPiA+ID4gPiAgICAgICAKPiA+ID4gCj4gPiA+IE1tbW1oLCBJIHNob3VsZCBw
cm9iYWJseSBpbnZlcnQgdGhvc2UgdHdvIGxpbmVzLCBmaXJzdCBjYWxsIGxpc3RfZGVsKCkKPiA+
ID4gYW5kIHRoZW4gY2FsbCBrZnJlZSgpIG9uIGxpc3RfZW50cnkoKS4gICAgCj4gPiAKPiA+IFlv
dSBjYW4gYWxzbyB1c2UgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZSgpOgoKSSB1c3VhbGx5IHVz
ZSB0aGlzIGhlbHBlciwgYnV0IEkgZ3Vlc3MgSSBjb3B5L3Bhc3RlZCB0aGUgYmVsb3cgbGluZXMK
ZnJvbSBzb21ld2hlcmUgZWxzZSBpbiB0aGlzIGZpbGUuLi4gSSdsbCB1c2UgbGlzdF9mb3JfZWFj
aF9lbnRyeV9zYWZlKCkuCgo+ID4gCj4gPiAJc3RydWN0IGdyYXZlX3BhZ2UgKnBvcywgKm47Cj4g
PiAKPiA+IAkuLi4KPiA+IAo+ID4gCWxpc3RfZm9yX2VhY2hfc2FmZShwb3MsIG4sICZncmF2ZV9w
YWdlcywgbGlzdCkgeyAgCj4gCj4gCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShwb3MsIG4sICZn
cmF2ZV9wYWdlcywgbGlzdCkgewo+IAo+ID4gCQlsaXN0X2RlbCgmcG9zLT5saXN0KTsKPiA+IAkJ
a2ZyZWUocG9zKTsKPiA+IAl9Cj4gPiAgIAo+ID4gPiAKPiA+ID4gVGhhbmtzIGZvciBub3RpY2lu
ZyEKPiA+ID4gTWlxdcOobCAgICAKPiA+ICAgCj4gCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
