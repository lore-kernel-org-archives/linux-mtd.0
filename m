Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21724C10F29
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 07:19:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4E33208C3
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 07:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u/iHAGbb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4E33208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wC5mfV8juhqDmLTVdoJz6hVkXgk12kChqw+UouNt2cE=; b=u/iHAGbbSGmJw0
	RHeHeeKraX16qRgRfCOwRIljvxTUmwonyLkuff+niT5MX4JDmY9Ls5caM+1+hF4uzW58a4t4hs8t6
	saZc42/cDutEGcJzXVs2yrDwUvOfpw/Lz8ruGPez+O+wqz4tM9J3MeI/2RinjELjhgwq8gYawrYAQ
	/rHnTns8dcshe8RS2c3Y9b7iRfk6FoQmMR8350EjhvOVGsdFjex9zPXdaJ3aTyqruajljD8l4x1ZH
	jTI4dhptVKTOtywA6HoQbNhtCOxUN0+SZSaGQHvtb9Cv1Ox/fw5tVCzxJd6ywiqGGVYwOnsxep/Gv
	KUuUiPwniEtm61yDfKVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBveV-0007NR-7h; Wed, 11 Mar 2020 07:19:39 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBveQ-0007IW-TH
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 07:19:36 +0000
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id F2B9E1BF209;
 Wed, 11 Mar 2020 07:19:18 +0000 (UTC)
Date: Wed, 11 Mar 2020 08:19:18 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon
 <bbrezillon@kernel.org>
Subject: Re: [PATCH v4] mtd: nand: spi: rework detect procedure for
 different read id op
Message-ID: <20200311081918.0f2c64c2@xps13>
In-Reply-To: <20200310183338.19961-1-miquel.raynal@bootlin.com>
References: <20200208074439.146296-1-gch981213@gmail.com>
 <20200310183338.19961-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_001935_109714_44DBC6D1 
X-CRM114-Status: GOOD (  13.60  )
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
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2h1YW5ob25nLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g
d3JvdGUgb24gVHVlLCAxMCBNYXIgMjAyMAoxOTozMzozOCArMDEwMDoKCj4gT24gU2F0LCAyMDIw
LTAyLTA4IGF0IDA3OjQzOjUwIFVUQywgQ2h1YW5ob25nIEd1byB3cm90ZToKPiA+IEN1cnJlbnRs
eSB0aGVyZSBhcmUgMyBkaWZmZXJlbnQgdmFyaWFudHMgb2YgcmVhZF9pZCBpbXBsZW1lbnRhdGlv
bjoKPiA+IDEuIG9wY29kZSBvbmx5LiBGb3VuZCBpbiBHRDVGeEdRNHhGLgo+ID4gMi4gb3Bjb2Rl
ICsgMSBhZGRyIGJ5dGUuIEZvdW5kIGluIEdENUd4R1E0eEEvRQo+ID4gMy4gb3Bjb2RlICsgMSBk
dW1teSBieXRlLiBGb3VuZCBpbiBvdGhlciBjdXJyZW50bHkgc3VwcG9ydGVkIGNoaXBzLgo+ID4g
Cj4gPiBPcmlnaW5hbCBpbXBsZW1lbnRhdGlvbiB3YXMgZm9yIHZhcmlhbnQgMSBhbmQgbGV0IGRl
dGVjdCBmdW5jdGlvbgo+ID4gb2YgY2hpcHMgd2l0aCB2YXJpYW50IDIgYW5kIDMgdG8gaWdub3Jl
IHRoZSBmaXJzdCBieXRlLiBUaGlzIGlzbid0Cj4gPiByb2J1c3Q6Cj4gPiAKPiA+IDEuIEZvciBj
aGlwcyBvZiB2YXJpYW50IDIsIGlmIFNQSSBtYXN0ZXIgZG9lc24ndCBrZWVwIE1PU0kgbG93Cj4g
PiBkdXJpbmcgcmVhZCwgY2hpcCB3aWxsIGdldCBhIHJhbmRvbSBpZCBvZmZzZXQsIGFuZCB0aGUg
ZW50aXJlIGlkCj4gPiBidWZmZXIgd2lsbCBzaGlmdCBieSB0aGF0IG9mZnNldCwgY2F1c2luZyBk
ZXRlY3QgZmFpbHVyZS4KPiA+IAo+ID4gMi4gRm9yIGNoaXBzIG9mIHZhcmlhbnQgMSwgaWYgaXQg
aGFwcGVucyB0byBnZXQgYSBkZXZpZCB0aGF0IGVxdWFscwo+ID4gdG8gbWFudWZhY3R1cmUgaWQg
b2YgdmFyaWFudCAyIG9yIDMgY2hpcHMsIGl0J2xsIGdldCBpbmNvcnJlY3RseQo+ID4gZGV0ZWN0
ZWQuCj4gPiAKPiA+IFRoaXMgcGF0Y2ggcmV3b3JrcyBkZXRlY3QgcHJvY2VkdXJlIHRvIGFkZHJl
c3MgcHJvYmxlbXMgYWJvdmUuIE5ldwo+ID4gbG9naWMgZG8gZGV0ZWN0aW9uIGZvciBhbGwgdmFy
aWFudHMgc2VwYXJhdGVkbHksIGluIDEtMi0zIG9yZGVyLgo+ID4gU2luY2UgYWxsIGN1cnJlbnQg
ZGV0ZWN0IG1ldGhvZHMgZG8gZXhhY3RseSB0aGUgc2FtZSBpZCBtYXRjaGluZwo+ID4gcHJvY2Vk
dXJlLCB1bmlmeSB0aGVtIGludG8gY29yZS5jIGFuZCByZW1vdmUgZGV0ZWN0IG1ldGhvZCBmcm9t
Cj4gPiBtYW51ZmFjdHVyZV9vcHMuCj4gPiAKPiA+IFRlc3RlZCBvbiBHRDVGMUdRNFVBWUlHIGFu
ZCBXMjVOMDFHVlpFSUcuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IENodWFuaG9uZyBHdW8gPGdj
aDk4MTIxM0BnbWFpbC5jb20+ICAKPiAKPiBBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbmFuZC9uZXh0LCB0aGFu
a3MuCgpJIGFsc28gY2hhbmdlZCB0aGUgcHJlZml4IHRvICJtdGQ6IHNwaW5hbmQ6Ii4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
