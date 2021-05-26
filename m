Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0980DC2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 11:42:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAE3A61248
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 11:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAE3A61248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VuFAsj7M/USwsTj87NDRWmYhFRcGxLSFQqnYXiWrw2k=; b=s8b5aK2URGGSdw
	eHTbbSTQZOUmwKkNNuRBcprzXq8S9Ad9buoywBjR7KXL8fCkdxaL6RR3s8OUzA6AK8jv99K5B432A
	+/sNjstqlsiOkG1bPwja007njx/W73QutNsZ8+IN84swiHe1+F+Aih+W4eLNjWtl0HBIhfKHZLOYF
	n5DPx4Q3UVU/yW6qaBa4kdXXZxb41lOeHKDP7b4lq4IdSD8kvosIzFOo1T9kKVLSM8OFOMiP3r11U
	HTMe3GERbk5see30ek9dhV5Pz9SNfWBLpZ6O2h4BXayrLD6ahVM5YHy/KVEGnvQF884smN4wHq0f2
	XvGWFyv1yVq/KD3g0tMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llrvU-00De2R-Lk; Wed, 26 May 2021 11:42:16 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpvr-00CvLr-Lp
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:34:33 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 66EA96000D;
 Wed, 26 May 2021 09:34:28 +0000 (UTC)
Date: Wed, 26 May 2021 11:34:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring
 <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, Naga Sureshkumar Relli
 <nagasure@xilinx.com>, Michal Simek <monstr@monstr.eu>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 2/5] mtd: rawnand: Move struct gpio_desc declaration
 to the top
Message-ID: <20210526113427.77533069@xps13>
In-Reply-To: <20210526090334.181225-1-miquel.raynal@bootlin.com>
References: <20210510104051.9701-3-miquel.raynal@bootlin.com>
 <20210526090334.181225-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_023431_918626_F71E6EA9 
X-CRM114-Status: GOOD (  12.66  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3Jv
dGUgb24gV2VkLCAyNiBNYXkgMjAyMQoxMTowMzozNCArMDIwMDoKCj4gT24gTW9uLCAyMDIxLTA1
LTEwIGF0IDEwOjQwOjQ4IFVUQywgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IFRoZSBzdHJ1Y3Qg
Z3Bpb19kZXNjIGlzIGRlY2xhcmVkIGluIHRoZSBtaWRkbGUgb2YgdGhlIHJhd25hbmQuaCBoZWFk
ZXIsCj4gPiByaWdodCBiZWZvcmUgdGhlIGZpcnN0IGZ1bmN0aW9uIHVzaW5nIGl0IChuYW5kX2dw
aW9fd2FpdHJkeSkuIEJlZm9yZQo+ID4gYWRkaW5nIGEgbmV3IGZ1bmN0aW9uIGFuZCB0byBtYWtl
IGl0IGNsZWFyOiBtb3ZlIHRoZSBkZWNsYXJhdGlvbiB0byB0aGUKPiA+IHRvcCBvZiB0aGUgZmls
ZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gIAo+IAo+IEFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBuYW5kL25leHQuCj4gCj4gTWlxdWVs
CgpGWUksIGR1ZSB0byBhbiBlcnJvciBpbiB0aGUgaGVhZGVycyBvZiB0aGlzIHNlcmllcywgcGF0
Y2h3b3JrL2xvcmUgZ290CmNvbmZ1c2VkIGJldHdlZW4gdjIgYW5kIHYzLiBUaGlzIHZlcnNpb25z
IGlzIG5vdCB0aGUgb25lIEkgc2hvdWxkIGhhdmUKYXBwbGllZC4gSSBqdXN0IGRyb3BwZWQgaXQs
IHdpbGwgcmVzZW5kIHYzIGFuZCBhcHBseSBpdCBpbW1lZGlhdGVseS4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
