Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D2FC3F2D0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 07:47:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D4ED246A2
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 07:47:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TDJ7QoIL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D4ED246A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVlNIsbyTe0sfty20LUM5Kgi1E0m/j+NDqk7x2JQa7w=; b=TDJ7QoILkO412s
	+UIVqLrWowJj+GGffjEYilySmfOisAu8Ah8nXR/PP2F4N57W9hHto/9oo8jIdhHDCgchgVhzU+dgT
	HOhv2wPquXnFmr3iyTQzDmg8foanOnvH10sgVixz5WqV1erOE1OMkvdfJA9MilRuWXvaP3VPkmMIp
	8+WKn3PoZlLSyyNftV+DBII5cObCLT/sgzPVB7VX2vrgYcspyQazUk+9ia0zMwL+2F+s4EcakbkMT
	9DK99Fp5NriHYcZSSxryKTkDLbLDFqMCnpxpIEHcZrMuAUduef/No+rLOoqTYcdNdcLXwIVFcX3gR
	IXBrlQ6cg/aMq2pBzetw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7aMP-0008Bn-7p; Fri, 28 Feb 2020 07:47:01 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7aML-0008Am-Ia
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 07:46:59 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CC48B29691E;
 Fri, 28 Feb 2020 07:46:54 +0000 (GMT)
Date: Fri, 28 Feb 2020 08:46:51 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v11 2/2] spi: cadence-quadspi: Add support for the
 Cadence QSPI controller
Message-ID: <20200228084651.1ad0e334@collabora.com>
In-Reply-To: <f82e4964-f030-9aac-5895-a715921ed6db@linux.intel.com>
References: <20200227062708.21544-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200227062708.21544-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200227183032.77ef0795@collabora.com>
 <f82e4964-f030-9aac-5895-a715921ed6db@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_234657_745272_0AAAC202 
X-CRM114-Status: GOOD (  16.61  )
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
Cc: mark.rutland@arm.com, tudor.ambarus@gmail.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 cyrille.pitchen@atmel.com, marex@denx.de, boris.brezillon@free-electrons.com,
 tien.fong.chee@intel.com, richard@nod.at, simon.k.r.goldschmidt@gmail.com,
 devicetree@vger.kernel.org, cheol.yong.kim@intel.com, robh+dt@kernel.org,
 qi-ming.wu@intel.com, david.oberhollenzer@sigma-star.at,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, dinguyen@kernel.org,
 broonie@kernel.org, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyOCBGZWIgMjAyMCAxMjoxMTowOSArMDgwMAoiUmFtdXRoZXZhciwgVmFkaXZlbCBN
dXJ1Z2FuWCIKPHZhZGl2ZWwubXVydWdhbngucmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+IHdy
b3RlOgoKPiBIaSBCb3JpcywKPiAKPiAgwqDCoMKgwqAgVGhhbmsgeW91IHNvIG11Y2ggZm9yIHRo
ZSByZXZpZXcgY29tbWVudHMuLi4KPiAKPiBPbiAyOC8yLzIwMjAgMTozMCBBTSwgQm9yaXMgQnJl
emlsbG9uIHdyb3RlOgo+ID4gT24gVGh1LCAyNyBGZWIgMjAyMCAxNDoyNzowOCArMDgwMAo+ID4g
IlJhbXV0aGV2YXIsIFZhZGl2ZWwgTXVydWdhblgiCj4gPiA8dmFkaXZlbC5tdXJ1Z2FueC5yYW11
dGhldmFyQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiAgCj4gPj4gRnJvbTogUmFtdXRoZXZh
ciBWYWRpdmVsIE11cnVnYW4gPHZhZGl2ZWwubXVydWdhbngucmFtdXRoZXZhckBsaW51eC5pbnRl
bC5jb20+Cj4gPj4KPiA+PiBBZGQgc3VwcG9ydCBmb3IgdGhlIENhZGVuY2UgUVNQSSBjb250cm9s
bGVyLiBUaGlzIGNvbnRyb2xsZXIgaXMKPiA+PiBwcmVzZW50IGluIHRoZSBJbnRlbCBMaWdodG5p
bmcgTW91bnRhaW4oTEdNKSBTb0NzLCBBbHRlcmEgYW5kIFRJIFNvQ3MuCj4gPj4gVGhpcyBkcml2
ZXIgaGFzIGJlZW4gdGVzdGVkIG9uIHRoZSBJbnRlbCBMR00gU29Dcy4KPiA+Pgo+ID4+IFRoaXMg
ZHJpdmVyIGRvZXMgbm90IHN1cHBvcnQgZ2VuZXJpYyBTUEkgYW5kIGFsc28gdGhlIGltcGxlbWVu
dGF0aW9uCj4gPj4gb25seSBzdXBwb3J0cyBzcGktbWVtIGludGVyZmFjZSB0byByZXBsYWNlIHRo
ZSBleGlzdGluZyBkcml2ZXIgaW4KPiA+PiBtdGQvc3BpLW5vci9jYWRlbmNlLXF1YWRzcGkuYywg
dGhlIGV4aXN0aW5nIGRyaXZlciBvbmx5IHN1cHBvcnQgU1BJLU5PUgo+ID4+IGZsYXNoIG1lbW9y
eSAgCj4gPiBJcyBpdCByZWFsbHkgc3VwcG9ydGluZyBTUEkgTk9ScyBvbmx5LCBvciBpcyBpdCBq
dXN0IHRoYXQgeW91IG9ubHkKPiA+IHRlc3RlZCBpdCB3aXRoIGEgc3BpLW5vcj8gIAo+IAo+IFRo
ZSBleGlzdGluZyBkcml2ZXJzL210ZC9zcGktbm9yL2NhZGVuY2UtcXVhZHNwaS5jIHN1cHBvcnRz
IFNQSS1OT1JzIAo+IG9ubHksIGJlY2F1c2UgdGhlIGRyaXZlciBpcyBkZXZlbG9wZWQKPiAKPiBz
dWNoIGEgd2F5IHRoYXQgaXQgZG9lcyBub3Qgc3VwcG9ydCBvdGhlciBTUEkgYmFzZWQgZmxhc2gg
bWVtb3JpZXMsIGFsc28gCj4gbmV2ZXIgdXNlcyBTUEkvU1BJLU1FTSBiYXNlZCBmcmFtZXdvcmsu
Cj4gCj4gU28gd2UgVmlnbmVzaCBzdWdnZXN0ZWQgbWUgdG/CoCBkZXZlbG9wIHRoZSBuZXcgZHJp
dmVyIHdoaWNoIHN1cHBvcnRzIAo+IGJvdGggU1BJLU5PUiBhbmQgU1BJLU5BTkQgYmFzZWQgb24g
dGhlIFNQSS1NRU0gZnJhbWV3b3JrLgoKSG0sIHlvdXIgY29tbWl0IG1lc3NhZ2UgbWFrZXMgaXQg
c291bmQgbGlrZSBldmVuIHRoZSBuZXcgZHJpdmVyIGlzbid0CmdlbmVyaWMgZW5vdWdoIHRvIHN1
cHBvcnQgU1BJIE5BTkRzLiBNYXliZSB0aGVyZSdzIHNvbWV0aGluZyB0byBpbXByb3ZlCnRvIGNs
YXJpZnkgdGhlIGZhY3QgdGhhdCB0aGlzIG5ldyB2ZXJzaW9uIGlzIG5vdCBsaW1pdGVkIHRvIFNQ
SSBOT1JzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
