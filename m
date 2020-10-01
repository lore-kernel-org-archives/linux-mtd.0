Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D408C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:37:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 897F820780
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:37:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nRir9MdG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 897F820780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KxkuezkoEwB02vZ75dM/rzvayCwOK0DaHG3X3h9kzxg=; b=nRir9MdGUG7t2vNG4Gwm8dSUC
	RF6vhwCyzcnq1qubCg1XY1hmdMIgUB3ZEP/F3nVyZyLLSggDZiobfpFySxOnzqtxa0+yOMwxEm4tA
	cr0Va7oAlPdi+AZ4nfo7P5SbGgezwsayJ2yfzPFwdZLKizDU6FJGusVXCVOwPsguqZnRBC7YOmSQN
	/2shkTrBipuhLeD94GoZ96SfivXzyntLcpNdDkRq946w/dicjaOyAVzo1DiLploSmxxAT1doTffU6
	6P+fvLwkaZn2QwIpJ6sfTUuW1ozyzR7rNryclxYpvz9Rxw9UvW3tW7iAi6eAxWRfsbY2ALjG5ddlo
	QQlrm8rtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNu4n-0003lj-Rv; Thu, 01 Oct 2020 08:36:33 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNu4k-0003l8-UX
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 08:36:32 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 02C1FFF80A;
 Thu,  1 Oct 2020 08:36:25 +0000 (UTC)
Date: Thu, 1 Oct 2020 10:36:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/5] mtd: spinand: Move ECC related definitions earlier
 in the driver
Message-ID: <20201001103624.10672f23@xps13>
In-Reply-To: <20200930205226.533d4887@windsurf.home>
References: <20200930154109.3922-1-miquel.raynal@bootlin.com>
 <20200930154109.3922-3-miquel.raynal@bootlin.com>
 <20200930205226.533d4887@windsurf.home>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_043631_086803_0AD5F281 
X-CRM114-Status: GOOD (  14.94  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, ycllin@mxic.com.tw,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVGhvbWFzLAoKVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNv
bT4gd3JvdGUgb24gV2VkLCAzMCBTZXAKMjAyMCAyMDo1MjoyNiArMDIwMDoKCj4gT24gV2VkLCAz
MCBTZXAgMjAyMCAxNzo0MTowNiArMDIwMAo+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+IHdyb3RlOgo+IAo+ID4gUHJlcGFyZSB0aGUgY3JlYXRpb24gb2YgYSBTUEkt
TkFORCBvbi1kaWUgRUNDIGVuZ2luZSBieSBnYXRoZXJpbmcgdGhlCj4gPiBFQ0MtcmVsYXRlZCBj
b2RlIGVhcmxpZXIgZW5vdWdoIGluIHRoZSBjb3JlIHRvIGF2b2lkIHRoZSBuZWVkIGZvcgo+ID4g
Zm9yd2FyZCBkZWNsYXJhdGlvbnMuCj4gPiAKPiA+IFRoZSBuZXh0IHN0ZXAgaXMgdG8gYWN0dWFs
bHkgY3JlYXRlIHRoYXQgZW5naW5lIGJ5IGltcGxlbWVudGluZyB0aGUKPiA+IGdlbmVyaWMgRUND
IGludGVyZmFjZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL2Nv
cmUuYyAgICAgICAgICAgICAgfCAxMDYgKysrKysrKysrKystLS0tLS0tLS0tLS0KPiA+ICBkcml2
ZXJzL210ZC9uYW5kL3NwaS9vbi1kaWUtZWNjLWVuZ2luZS5jIHwgICAwCj4gPiAgMiBmaWxlcyBj
aGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCA1MyBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9tdGQvbmFuZC9zcGkvb24tZGllLWVjYy1lbmdpbmUuYyAgCj4gCj4g
WW91J3JlIGFkZGluZyBhbiBlbXB0eSBvbi1kaWUtZWNjLWVuZ2luZS5jIGZpbGUgaW4gdGhpcyBj
b21taXQuCj4gCj4gVGhvbWFzCgpNbW1oLCB0aGlzIGlzIGEgbGVmdCBvdmVyIGZyb20gYSBwcmV2
aW91cyBpbXBsZW1lbnRhdGlvbiwgSSBkaWRuJ3Qgc2VlCml0IGluIHRoZSBkaWZmLCB0aGFua3Mg
Zm9yIHNwb3R0aW5nIGl0IQoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
