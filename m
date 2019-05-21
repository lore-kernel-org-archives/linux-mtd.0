Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F049CC04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:53:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C67AA20863
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:53:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CRUvOEGX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C67AA20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/i3J846fWR+ly/4+dCE/iGRNGgxyQrB6xVjtVNvZCg=; b=CRUvOEGXhQuSn8
	d9BIlfVolGG8lLUpZllOXikrZd5pCR/C38HDXixYZTpeHOW2n2tmoDhyAZe41vjoay0JJx15n1noB
	d4C/8k8rOPkDRdgeOX2AzrUA/uboEZTGAgHV9zrAiAuZRgt/VcYzT0IE7/JDjfoHqmijDcNXsm2Ao
	ovh/3xiOw05se2r0Pwv7DBSWiBseNUWEiXS1whB4GEddVpiOtCnvaC5dasrYYk8ve7xvLY0zyEhJo
	sCLe0nO5DAtC5nTG5TvHAFcIzYBvX5p4tgI6XmOOR3SreMwotJffH5Zxe4p1YsgYzWn10VPfCqVhc
	9au0RdCu+RCx1hrKE+lA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT0Wf-0002uw-GH; Tue, 21 May 2019 08:53:37 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT0Wc-0002u6-It
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 08:53:35 +0000
X-Originating-IP: 90.88.22.185
Received: from xps13 (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2CAF1FF80F;
 Tue, 21 May 2019 08:53:31 +0000 (UTC)
Date: Tue, 21 May 2019 10:53:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: brcmnand: Make
 nand-ecc-strength and nand-ecc-step-size optional
Message-ID: <20190521105330.6d9444c0@xps13>
In-Reply-To: <1558379144-28283-1-git-send-email-kdasu.kdev@gmail.com>
References: <1558379144-28283-1-git-send-email-kdasu.kdev@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_015334_770013_4DFD15D9 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgpLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gTW9u
LCAyMCBNYXkgMjAxOSAxNTowNToxMQotMDQwMDoKCj4gbmFuZC1lY2Mtc3RyZW5ndGggYW5kIG5h
bmQtZWNjLXN0ZXAtc2l6ZSBjYW4gYmUgbWFkZSBvcHRpb25hbCBhcwo+IGJyY21uYW5kIGRyaXZl
ciBjYW4gc3VwcG9ydCB1c2luZyByYXcgTkFORCBsYXllciBkZXRlY3RlZCB2YWx1ZXMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogS2FtYWwgRGFzdSA8a2Rhc3Uua2RldkBnbWFpbC5jb20+Cj4gLS0tCj4g
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQg
fCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9icmNtLGJyY21uYW5kLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvYnJjbSxicmNtbmFuZC50eHQKPiBpbmRleCBiY2RhMWRmLi4yOWZlYWJhIDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50
eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJj
bW5hbmQudHh0Cj4gQEAgLTEwMSwxMCArMTAxLDEwIEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG51bWJlciAoZS5nLiwgMCwgMSwgMiwgZXRj
LikKPiAgLSAjYWRkcmVzcy1jZWxscyAgICAgICAgICAgIDogc2VlIHBhcnRpdGlvbi50eHQKPiAg
LSAjc2l6ZS1jZWxscyAgICAgICAgICAgICAgIDogc2VlIHBhcnRpdGlvbi50eHQKPiAtLSBuYW5k
LWVjYy1zdHJlbmd0aCAgICAgICAgIDogc2VlIG5hbmQudHh0Cj4gLS0gbmFuZC1lY2Mtc3RlcC1z
aXplICAgICAgICA6IG11c3QgYmUgNTEyIG9yIDEwMjQuIFNlZSBuYW5kLnR4dAo+ICAKPiAgT3B0
aW9uYWwgcHJvcGVydGllczoKPiArLSBuYW5kLWVjYy1zdHJlbmd0aCAgICAgICAgIDogc2VlIG5h
bmQudHh0Cj4gKy0gbmFuZC1lY2Mtc3RlcC1zaXplICAgICAgICA6IG11c3QgYmUgNTEyIG9yIDEw
MjQuIFNlZSBuYW5kLnR4dAo+ICAtIG5hbmQtb24tZmxhc2gtYmJ0ICAgICAgICAgOiBib29sZWFu
LCB0byBlbmFibGUgdGhlIG9uLWZsYXNoIEJCVCBmb3IgdGhpcwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjaGlwLXNlbGVjdC4gU2VlIG5hbmQudHh0Cj4gIC0gYnJjbSxuYW5kLW9v
Yi1zZWN0b3Itc2l6ZSA6IGludGVnZXIsIHRvIGRlbm90ZSB0aGUgc3BhcmUgYXJlYSBzZWN0b3Ig
c2l6ZQoKClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
