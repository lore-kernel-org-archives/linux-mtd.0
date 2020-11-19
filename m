Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2693C2D0E4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 11:09:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FDBD22248
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 11:09:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XaLIUtfL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FDBD22248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rT7qTUW8i80iwVfwtSvFVS5kza1w5eDXrsZW22dI8RI=; b=XaLIUtfLpYj4sk4uML9H5RQd2
	OJDekVIhJioSoU+l4nyW6Dyl4/T4QhpV3JQe7gZpIOehXm9CSONawbq2k+Lh51BwAffEJIWIbyf4Z
	N1jeLy4qEwvU/sJTipSA7QoAcfu5QT+hpznxGTKhYQrqpm56EWVcvOwKca4+FTbSkq0foHUweJLLg
	FqZ17xwdHbwUSadMb1T7AmSxE7eOagLyCKQaVmVcRwBE4RvSs6RmKmi6rMmoenJ21jKafB34eHlyf
	Yt42S2YIOZFTcwELOVXiXPBGhOnQ0m/babu9bp8ONDSmw9THRx0E4AWxMN35vkATGuDVaCoDpNE3D
	KaJpzLxtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfhnV-0003ZG-7C; Thu, 19 Nov 2020 11:08:17 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfhnS-0003X1-Ci
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 11:08:15 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 358566000F;
 Thu, 19 Nov 2020 11:08:06 +0000 (UTC)
Date: Thu, 19 Nov 2020 12:08:04 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 01/23] mtd: mtdpart: Fix misdocumented function
 parameter 'mtd'
Message-ID: <20201119120804.549e2e79@xps13>
In-Reply-To: <20201119091402.GY1869941@dell>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
 <20201106213655.1838861-2-lee.jones@linaro.org>
 <20201119091402.GY1869941@dell>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_060814_661132_03C209E2 
X-CRM114-Status: GOOD (  15.29  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Nicolas Pitre <nico@fluxnic.net>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Thomas Gleixner <gleixner@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGVlLAoKTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gd3JvdGUgb24gVGh1LCAx
OSBOb3YgMjAyMCAwOToxNDowMgorMDAwMDoKCj4gT24gRnJpLCAwNiBOb3YgMjAyMCwgTGVlIEpv
bmVzIHdyb3RlOgo+IAo+ID4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4gPiAKPiA+ICBkcml2ZXJzL210ZC9tdGRwYXJ0LmM6MzAwOiB3YXJuaW5nOiBG
dW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdtdGQnIG5vdCBkZXNjcmliZWQgaW4gJ19fbXRk
X2RlbF9wYXJ0aXRpb24nCj4gPiAgZHJpdmVycy9tdGQvbXRkcGFydC5jOjMwMDogd2FybmluZzog
RXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAncHJpdicgZGVzY3JpcHRpb24gaW4gJ19fbXRkX2Rl
bF9wYXJ0aXRpb24nCj4gPiAKPiA+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPgo+ID4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4g
PiBDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+ID4gQ2M6IE5pY29s
YXMgUGl0cmUgPG5pY29AZmx1eG5pYy5uZXQ+Cj4gPiBDYzogVGhvbWFzIEdsZWl4bmVyIDxnbGVp
eG5lckBsaW51dHJvbml4LmRlPgo+ID4gQ2M6IERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFk
ZWFkLm9yZz4KPiA+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gU2lnbmVk
LW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4gIAo+IAo+IElzIHRoZXJl
IGFueXRoaW5nIGVsc2UgeW91IG5lZWQgZnJvbSBtZSBNaXF1ZWwsIG9yIGRvZXMgdGhlIHNldCBu
b3cKPiBsb29rIHN1aXRhYmxlIGZvciBpbmNsdXNpb24/Cj4gCgpJdCdzIHRvdGFsbHkgZmluZSBi
eSBtZSwgSSB3aWxsIGFwcGx5IHRoZSBzZXJpZXMgc29vbi4KClRoYW5rcyEKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
