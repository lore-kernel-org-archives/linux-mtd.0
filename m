Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629C2C4320A
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 12:05:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B040604DC
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 12:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B040604DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aOqjkIJtlKI7iDWfz5j/URmuO+B6gg0kWAspiOwnKAA=; b=GKL/7e+FW/AE9h
	SweX9YpCsgx/BXNemugnHQX4HZAB8o4DFMP+uVIX7NUtARJIrsYfFFZbqgXFpPDLY1yrZjEnf3enC
	cd5AdPSEJSjhB3Kapjj6mTOYELGRDpOUlOTn8gkS3epLB/D7BzbdfYtn64hRjCY1wsaEM/wxIWRZs
	LTLyBuJBCtrqqcw970kdT6JeiAjFmhYU6tkRNWuRtySOqO03nPpufBxMliENquqx3RbONsbt7TZIK
	qR69IgcpCF8DVf1LATj/gE6GpRRvyjWDoD4vpa7VYP4NkKsBKisuoXlvg0P7e8G1PNWBMP5nQzh+D
	O9QDqRc9GN5GZkseLAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH3Gg-00B3Bq-Hc; Fri, 20 Aug 2021 12:05:03 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH3E1-00B2Y2-LJ
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 12:02:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C18EB60005;
 Fri, 20 Aug 2021 12:02:11 +0000 (UTC)
Date: Fri, 20 Aug 2021 14:02:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>
Subject: Re: [PATCH 13/13] mtd: spinand: Add support for Winbond W35N01JW
 SPI NAND flash
Message-ID: <20210820140210.47d348dc@xps13>
In-Reply-To: <64f130dc-1d87-5657-ae93-09bfdb7e93a1@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-14-a-nandan@ti.com>
 <20210806211423.5c9d3e96@xps13>
 <64f130dc-1d87-5657-ae93-09bfdb7e93a1@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_050217_926622_2C204792 
X-CRM114-Status: GOOD (  17.46  )
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

SGkgQXB1cnZhLAoKQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBGcmks
IDIwIEF1ZyAyMDIxIDE3OjIxOjMzCiswNTMwOgoKPiBIaSBNaXF1w6hsLAo+IAo+IE9uIDA3LzA4
LzIxIDEyOjQ0IGFtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgQXB1cnZhLAo+ID4gCj4g
PiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+IHdyb3RlIG9uIFR1ZSwgMTMgSnVsIDIw
MjEgMTM6MDU6MzgKPiA+ICswMDAwOgo+ID4gICAKPiA+PiBXaW5ib25kIFczNU4wMUpXIGlzIFNQ
SSBOQU5EIGZsYXNoIHN1cHBvcnRpbmcgT2N0YWwgRFRSIFNQSSBwcm90b2NvbC4gIAo+ID4gCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgYQo+ID4gICAKPiA+PiBBZGQgb3BfdmFpcmFudHMgZm9y
IFczNU4wMUpXLCB3aGljaCBpbmNsdWRlIHRoZSBPY3RhbCBEVFIgcmVhZC93cml0ZSAgCj4gPiAK
PiA+IHZhcmlhbnRzCj4gPiAgIAo+ID4+IHBhZ2Ugb3BzIGFzIHdlbGwuIEFkZCBXMzVOMDFKVydz
IG9vYiBsYXlvdXQgZnVuY3Rpb25zIGZvciB0aGUgIAo+ID4gCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBPT0IKPiA+ICAgCj4gCj4gT2theSwgd2lsbCBjb3JyZWN0IHRo
ZXNlLgo+IAo+ID4+IG10ZF9vb2JsYXlvdXRfb3BzLiBBZGQgYWxsIG9wIGFkanVzdG1lbnRzIHJl
cXVpcmVkIGZvciBPY3RhbCBEVFIgU1BJCj4gPj4gbW9kZSB1c2luZyB0aGUgYWRqdXN0X29wKCku
IEZpbmFsbHksIGFkZCBhbiBlbnRyeSBmb3IgVzM1TjAxSlcgaW4KPiA+PiBzcGluYW5kX2luZm8g
dGFibGUuCj4gPj4KPiA+PiBEYXRhc2hlZXQ6IGh0dHBzOi8vd3d3LndpbmJvbmQuY29tL2V4cG9y
dC9zaXRlcy93aW5ib25kL2RhdGFzaGVldC9XMzVOMDFKV19EYXRhc2hlZXRfQnJpZWYucGRmCj4g
Pj4gIAo+ID4gCj4gPiBNYXliZSB3ZSBjYW4gc3BsaXQgdGhpcyBpbnRvIHR3byBwYXJ0czoKPiA+
IDEvIHN1cHBvcnQgdGhlIGNoaXAKPiA+IDIvIGFkZCA4LUQgc3VwcG9ydAo+ID4gICAKPiAKPiBJ
IGNhbiBzcGxpdCB0aGUgcGF0Y2ggaW50bzoKPiAxLyBBZGQgaW1wbGVtZW50YXRpb24gb2YgbWFu
dWZhY3R1cmVyX29wczogYWRqdXN0X29wKCkgdG8gaGFuZGxlIHZhcmlhdGlvbnMgb2Ygb3BzIGlu
IDhELThELThEIG1vZGUKPiAyLyBBZGQgc3VwcG9ydC9lbnRyeSBmb3IgV2luYm9uZCBXMzVOMDFK
VyBTUEkgTkFORCBmbGFzaCBjaGlwCj4gCj4gQXMgOC1EIHN1cHBvcnQgaGFzIGFscmVhZHkgYmVl
biBhZGRlZCBpbiBhIHByZXZpb3VzIHBhdGNoLgoKSSBhbHNvIGRvbid0IHdhbnQgdGhlIHJlbmFt
aW5nIHRvIGhhcHBlbiBpbiB0aGUgcGF0Y2ggYWRkaW5nIG1vcmUKbG9naWMuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
