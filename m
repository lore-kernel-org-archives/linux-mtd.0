Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127B5C282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 13:11:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D46B1218FC
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 13:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WzdOEpnn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D46B1218FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AI3kR9LC/Vs6NkNdyCWOWETzND2x5aASaqVvYHATTD8=; b=WzdOEpnn8JPyyB
	RMiTKxNsLAOI8oPqlaLHgbuwbqiqp3srjT5zTc+vN4pg7kaVV2RBDKeDLdHn6enEOPef9h7dSuIv+
	3vQDgCqXZ/U6fGXrXip3v4sXw1IfAzWDo/MIT/QfCI83pOUFeL+0Evmmg835XNJgguh5HxT0/BrRq
	k+KM9ERb5WOeYKMqSdfL/xSoZTc8AmCEaNWI8ENK0x3FxzYPHIftA1NL8jamHkh0LLlyaC7P7xlLe
	witr1A6sY8PeUo+cgJ6FR6MxwankU2tqBUDAoMEacGlTVBwSAr3vq+OPH43MaIIQKrZTLLyTGZs6p
	/+yJm5H/SV1idOk4QRTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn1Gr-00057Y-5W; Fri, 25 Jan 2019 13:11:45 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn1Go-00057B-6D
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 13:11:44 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id A913C209BE; Fri, 25 Jan 2019 14:11:40 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206])
 by mail.bootlin.com (Postfix) with ESMTPSA id 6803C20397;
 Fri, 25 Jan 2019 14:11:30 +0100 (CET)
Date: Fri, 25 Jan 2019 14:11:30 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH v5] mtd: spinand: Use the spi-mem dirmap API
Message-ID: <20190125141130.7e87582b@xps13>
In-Reply-To: <20190124145643.3195-1-bbrezillon@kernel.org>
References: <20190124145643.3195-1-bbrezillon@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_051142_365202_A67413C2 
X-CRM114-Status: GOOD (  12.54  )
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
Cc: Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4gd3JvdGUg
b24gVGh1LCAyNCBKYW4gMjAxOQoxNTo1Njo0MyArMDEwMDoKCj4gTWFrZSB1c2Ugb2YgdGhlIHNw
aS1tZW0gZGlyZWN0IG1hcHBpbmcgQVBJIHRvIGxldCBhZHZhbmNlZCBjb250cm9sbGVycwo+IG9w
dGltaXplIHJlYWQvd3JpdGUgb3BlcmF0aW9ucyB3aGVuIHRoZXkgc3VwcG9ydCBkaXJlY3QgbWFw
cGluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2Vy
bmVsLm9yZz4KPiBDYzogU3RlZmFuIFJvZXNlIDxzckBkZW54LmRlPgo+IFNpZ25lZC1vZmYtYnk6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gLS0tCj4gTm90ZSB0
aGF0IHRoaXMgcGF0Y2ggbm93IGRlcGVuZHMgb24gWzFdIGFuZCBbMl0gYW5kIHNob3VsZCBub3Qg
YmUKPiBxdWV1ZWQgZm9yIDUuMSBidXQgZm9yIDUuMi4KPiAKPiBbMV1odHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3BhdGNoLzEwNzcyMDY3Lwo+IFsyXWh0dHA6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wYXRjaC8xMDMwNDc5Lwo+IAo+IENoYW5nZXMgaW4gdjU6Cj4gLSBVcGRhdGUgbXkgZW1h
aWwgYWRkcmVzcyBpbiB0aGUgU29CIGFuZCBBdXRob3IgZmllbGRzCj4gCj4gQ2hhbmdlcyBpbiB2
NDoKPiAtIEZpeCB2YXJpb3VzIGJ1Z3MgcmVwb3J0ZWQgYnkgU3RlZmFuCj4gLSBVc2UgZGV2bV9z
cGlfbWVtX2Rpcm1hcF9jcmVhdGUoKSB0byBzaW1wbGlmeSB0aGUgZXJyb3IvcmVtb3ZlIHBhdGgK
PiAtIERyb3AgTWlxdWVsJ3MgUi1iIGFzIGEgZmV3IGltcG9ydGFudCB0aGluZ3MgaGF2ZSBjaGFu
Z2VkIGluIHRoaXMgdjQKCkl0IGxvb2tzIGxpa2UgeW91IGFsc28gcmVtb3ZlZCB0aGUgdW51c2Vk
IHNwaW5hbmRfZmluZF9zdXBwb3J0ZWRfb3AoKQpoZWxwZXIuCgpJIGRyb3BwZWQgdGhlIGN1cnJl
bnQgZGlybWFwIGltcGxlbWVudGF0aW9uLiBJJ2xsIHF1ZXVlIHRoaXMgb25lIGZvcgo1LjIuCgpU
aGFuayB5b3UgdmVyeSBtdWNoIEJvcmlzIGFuZCBTdGVmYW4gZm9yIHRoaXMgd29yay4KTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
