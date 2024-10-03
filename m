Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A3DCF34A9
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2024 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpglz472UgH9U/x13FRGziORi50CXVIyUFzbd+Dz8hQ=; b=SOL0BCnJGG35+3
	l7Y0YiJ7Y+CGNLk8lzidHJO1HdnhE2ysA8+lnE1sZf7TI71LtaPKhn89dZAvCtn+oEooR/L84ZWAr
	w+bg5InRRF5ZRpmRZg4vthHO6acUwy6fLw1gU8Sdelhe1RLTRsqURlNw5ZKN47g7ZtF0EA0aD/7IE
	1WecjX9YoveqrvCnCISNvXWCIagaXnpP7zM6GkkWZLn5CMl2en4WZHMMk/jb43N94KP/gUpdsgkm/
	kLYditYEh5sKnOMpv0p9CpVow2DRCxXHlER65hn8uqENJLxivpHwIBhKM5CMsabWSxIEohJGJ/eX1
	VcHedllhunV1hP8NlPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swNkh-00000009agf-1yVM;
	Thu, 03 Oct 2024 15:28:27 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swNke-00000009aed-0j8N
	for linux-mtd@lists.infradead.org;
	Thu, 03 Oct 2024 15:28:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51F40240007;
	Thu,  3 Oct 2024 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727969301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uxCb51voBr0vjEKD8Q9WRN/h6yqu39Aa5iGYpPO4WHM=;
	b=LczFIZBQBywG/pvyV+PJInj0A/ure9+4X9XrYO+ADcmJvKs85YwuuAol2kPqw5kC/zAk7W
	KW+K9QESHu6r2EiGFUIFVnR2xswJuJKNFfBhURnd7rjx22L4dGJoUxcKE7Ib48L55oCmtB
	7kGj506/RD6XSv5e0B+P2RFcGv/OHmuD098Um52Wu/EK972kYgJN+S8mL3tfmbGEleeQ/u
	ESrzlctfK9Hvu3DAXUePCOXEKowvT0+/raVHY/H5l/hE/9z18jvTYKfVUs7FOZkzoO8TPB
	v47DIC6MenA9s3iEBG9IAAtLraXOng5wuEkeio166YTAffoiAX+mFCmqctQTxg==
Date: Thu, 3 Oct 2024 17:28:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, imx@lists.linux.dev, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: nand: raw: gpmi: improve power management
 handling
Message-ID: <20241003172820.50324192@xps-13>
In-Reply-To: <20241003150500.uz2efay7kadu47if@cozumel>
References: <20241002153944.69733-1-han.xu@nxp.com>
	<20241002153944.69733-2-han.xu@nxp.com>
	<20241003093840.2965be20@xps-13>
	<20241003150500.uz2efay7kadu47if@cozumel>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_082824_532589_2DE18871 
X-CRM114-Status: GOOD (  16.38  )
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

SGkgSGFuLAoKaGFuLnh1QG54cC5jb20gd3JvdGUgb24gVGh1LCAzIE9jdCAyMDI0IDEwOjA1OjE2
IC0wNTAwOgoKPiBPbiAyNC8xMC8wMyAwOTozOEFNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4g
SGkgSGFuLAo+ID4gCj4gPiBoYW4ueHVAbnhwLmNvbSB3cm90ZSBvbiBXZWQsICAyIE9jdCAyMDI0
IDEwOjM5OjQ0IC0wNTAwOgo+ID4gICAKPiA+ID4gVGhlIGNvbW1pdCByZWZhY3RvcnMgdGhlIHBv
d2VyIG1hbmFnZW1lbnQgaGFuZGxpbmcgaW4gdGhlIGdwbWkgbmFuZAo+ID4gPiBkcml2ZXIuIEl0
IHJlbW92ZXMgcmVkdW5kYW50IHBtX3J1bnRpbWUgY2FsbHMgaW4gdGhlIHByb2JlIGZ1bmN0aW9u
LAo+ID4gPiBoYW5kbGVzIHRoZSBwYWQgY29udHJvbCBpbiBzdXNwZW5kIGFuZCByZXN1bWUsIGFu
ZCBtb3ZlcyB0aGUgY2FsbHMgdG8KPiA+ID4gYWNxdWlyZSBhbmQgcmVsZWFzZSBETUEgY2hhbm5l
bHMgdG8gdGhlIHJ1bnRpbWUgc3VzcGVuZCBhbmQgcmVzdW1lCj4gPiA+IGZ1bmN0aW9ucy4gIAo+
ID4gCj4gPiBNYXkgSSBrbm93IHRoZSBtb3RpdmF0aW9uIHRvIGFjcXVpcmUgYW5kIHJlbGVhc2Ug
dGhlIERNQSBjaGFubmVscwo+ID4gZHVyaW5nIHN1c3BlbmQ/IEluIGdlbmVyYWwgaXQgc2VlbXMg
bGlrZSBhIGRpZmZlcmVudCBjaGFuZ2Ugd2hpY2ggSSdkCj4gPiBwcmVmZXIgdG8gc2VlIGluIGl0
cyBvd24gY29tbWl0IHdpdGggYSBqdXN0aWZpY2F0aW9uLiBUaGUgcmVzdCBsb29rcwo+ID4gb2sg
b3RoZXJ3aXNlLiAgCj4gCj4gSGkgTWlxdWVsLAo+IAo+IFRoYW5rcyBmb3IgeW91ciBjb21tZW50
cy4gSU1ITyB0aGVyZSBpcyBubyBtdWNoIGxvZ2ljIGNoYW5nZXMgaW5kZWVkLCBqdXN0IG1vdmUK
PiB0aGUgZG1hIGNoYW5uZWwgYWNxdWlyZSBhbmQgcmVsZWFzZSBmcm9tIHN5c3RlbSBwbSB0byB0
aGUgcnVudGltZSBwbSwgcmVsZWFzaW5nCj4gdGhlIHVudXNlZCByZXNvdXJjZXMgYXMgZWFybHkg
YXMgcG9zc2libGUuIElmIHlvdSB0aGluayBpdCdzIG5lY2Vzc2FyeSBJIHdpbGwKPiBzcGxpdCB0
aGUgcGF0Y2ggaW50byB0d28gcGFydHMuCgpBY3R1YWxseSBJIGRvbid0IHVuZGVyc3RhbmQgd2h5
IHRoZXNlIGNoYW5uZWxzIGFyZSByZWxlYXNlZCBhbmQKYWNxdWlyZWQgYWdhaW4uIERvZXMgaXQg
bWFrZSBzZW5zZSB0byBkbyB0aGF0IGluIHRoZSAocnVudGltZSkKc3VzcGVuZC9yZXN1bWUgcGF0
aD8gSSdkIGJlIGluIGZhdm9yIG9mIGF2b2lkaW5nIHRoaXMgZXh0cmEKY29uZmlndXJhdGlvbiB3
aGljaCBhcyBhIGZpcnN0IHNpZ2h0IGRvZXMgbm90IHNlZW0gcmVxdWlyZWQgaGVyZS4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
