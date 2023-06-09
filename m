Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC1EC7EE25
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 08:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fGI80vBno3OQZSPxl6VPXdAG1m26BGBq4q6gkxmH0CU=; b=l56cYDdBcNwthn
	9hn4I1RBUkZEYLvH+AWCoU86gUU3YnP6qN2J0N1z/T+Lxx1/GlZNgEW8oqFlOaoM++tO3ODTMw02s
	pOJb1rb4vuYYUXfTu4fkoYGeIy2jIUTzdHoedsqL1dGvgfhup+6ZjAAiUidhzd1ccEa3PhR1eSwpm
	yzkF1o0PqQ926VbBSIqoPfzPPH4NwJF5TMtpUGxynbftbN7AsRZOEBraG/o8NZhlVTIG5BOLz9Dmi
	FHG2uWZuzLyvwIK+qTMWtQ5xhQK39GTdXKjJYpiU/sv7Jm91Ce5+DZtvj9J18n15PpmVArRwi4C1Y
	xgtK4uIoknVBK3rHB9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7XcC-00CGGI-0q;
	Fri, 09 Jun 2023 08:37:00 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Xc9-00CGEF-11
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jun 2023 08:36:59 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686299809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1eY5GTnPw+xhSBGqh+ImXa9pURJfbwTwAGOSZRd94M=;
	b=An+in9OvQ9JsndWXNv5l+3JCLSEaeOgvoiA8F/nTrD2dvT9jzP2lb71VyS6m9X9gZ65Uf2
	z67aa8dShB3by9Fv4UuH0qS5WDgcPZXw/+Rf+bh9tnYcqPAs8OrIsea6PWQxFy4iZPDrPI
	8azZrp93E6W2E4lBywflY6RL/7a2lfq3gmXYNkUxG3nk4PiehmEKFnhhxJiG2d2+pa7zqy
	mdVOfuj7xwXC12LvJuv7U/II+EoVC5EreDoed9QrR0C1gj6N3d7MHB6qMW08iDj/mZta1T
	78Pm5xB5zm5raSz3pDIGBwYqsUQW1f185ltRJdp0GimNy+l+aHJgda/PgfdXIA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D28A1C0006;
	Fri,  9 Jun 2023 08:36:47 +0000 (UTC)
Date: Fri, 9 Jun 2023 10:36:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 Pratyush Yadav <pratyush@kernel.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Michael Walle
 <michael@walle.cc>, Paul Cercueil <paul@crapouillou.net>, Richard
 Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 07/17] dt-bindings: mtd: ingenic: Prevent NAND chip
 unevaluated properties
Message-ID: <20230609103644.5924186c@xps-13>
In-Reply-To: <20230608152041.GA2702460-robh@kernel.org>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
	<20230606175246.190465-8-miquel.raynal@bootlin.com>
	<168607750937.1468225.8457774415279003681.robh@kernel.org>
	<20230607113314.5da62276@xps-13>
	<20230608152041.GA2702460-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_013657_612831_D39D32B2 
X-CRM114-Status: GOOD (  25.02  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIFRodSwgOCBKdW4gMjAyMyAwOToyMDo0
MSAtMDYwMDoKCj4gT24gV2VkLCBKdW4gMDcsIDIwMjMgYXQgMTE6MzM6MTRBTSArMDIwMCwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIFJvYiwKPiA+IAo+ID4gcm9iaEBrZXJuZWwub3JnIHdy
b3RlIG9uIFR1ZSwgMDYgSnVuIDIwMjMgMTI6NTI6MDAgLTA2MDA6Cj4gPiAgIAo+ID4gPiBPbiBU
dWUsIDA2IEp1biAyMDIzIDE5OjUyOjM2ICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4g
PiA+ID4gTGlzdCBhbGwgdGhlIHBvc3NpYmxlIHByb3BlcnRpZXMgaW4gdGhlIE5BTkQgY2hpcCBh
cyBwZXIgdGhlIGV4YW1wbGUgYW5kCj4gPiA+ID4gc2V0IHVuZXZhbHVhdGVkUHJvcGVydGllcyB0
byBmYWxzZSBpbiB0aGUgTkFORCBjaGlwIHNlY3Rpb24uCj4gPiA+ID4gCj4gPiA+ID4gQ2M6IFBh
dWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiA+ID4gLS0tCj4g
PiA+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvaW5nZW5pYyxuYW5k
LnlhbWwgfCA0ICsrKysKPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+
ID4gPiA+ICAgICAKPiA+ID4gCj4gPiA+IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFr
ZSBEVF9DSEVDS0VSX0ZMQUdTPS1tIGR0X2JpbmRpbmdfY2hlY2snCj4gPiA+IG9uIHlvdXIgcGF0
Y2ggKERUX0NIRUNLRVJfRkxBR1MgaXMgbmV3IGluIHY1LjEzKToKPiA+ID4gCj4gPiA+IHlhbWxs
aW50IHdhcm5pbmdzL2Vycm9yczoKPiA+ID4gCj4gPiA+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9l
cnJvcnM6Cj4gPiA+IC4vRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9pbmdl
bmljLG5hbmQueWFtbDogVW5hYmxlIHRvIGZpbmQgc2NoZW1hIGZpbGUgbWF0Y2hpbmcgJGlkOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvcmF3LW5hbmQtY2hpcC55YW1sICAKPiA+
IAo+ID4gSXQgc2VlbXMgbGlrZSB5b3VyIGF1dG9tYXRlZCB0b29saW5nIGZhaWxlZCB0byBhcHBs
eSB0aGUgc2Vjb25kIHBhdGNoCj4gPiBpbiB0aGlzIHNlcmllcyAoY3JlYXRpbmcgcmF3LW5hbmQt
Y2hpcC55YW1sKS4gSXQgc2F5cyAic2hhMSBpbmZvcm1hdGlvbgo+ID4gaXMgbGFja2luZyBvciB1
c2VsZXNzIi4gVGhpcyB3b3JrIGlzIGJhc2VkIG9uIGEgcmVjZW50IC1yYyBzbyBJJ20gbm90Cj4g
PiBzdXJlIHdoYXQgaXMgImxhY2tpbmcgb3IgdXNlbGVzcyIgaW4gdGhpcyBjYXNlLiAgCj4gCj4g
VGhlIGJhc2UgdXNlZCBpcyByYzEuCgpBY2suCgo+IAo+ID4gQW55d2F5LCBkbyB5b3UgcGxhbiB0
byBnaXZlIHRoaXMgc2VyaWVzIGEgbG9vayBhbnl3YXk/IE9yIHNob3VsZCBJCj4gPiByZWJhc2Ug
YWdhaW5zdCBhIHNwZWNpZmljIGJyYW5jaD8gIAo+IAo+IFllcywgSSdsbCBsZWF2ZSBpdCBpbiB0
aGUgcXVldWUuIEknbSBqdXN0IGdldHRpbmcgYmFjayBhZnRlciBiZWluZyBvdXQgYSAKPiBtb250
aC4KClN1cmUuIEdvb2QgbHVjayB3aXRoIHlvdXIgbW9udGgtb2xkIGJhY2tsb2cgOikKClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
