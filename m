Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0345CA0EC4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Aug 2025 08:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7g6Yb7J7+VIR5UoI83rVrEAhpfyyXJEV5uiyc0Ir3Q=; b=baBanNyray3UjQ
	gjvaP18TxflfGNHVCw8gLZIlDDf2ixmH3rvO3xuZ5w6IAdCnLEGyqgDZ/90U9ndq8ydHg5nledqx4
	CvxBiJLoKrw5CcnjyfvEI7X+GnG4m1cmpsnA2VKRdoEpOZktALBspIA2o0AOXQMd6ttUzHQJKsWC2
	3ZFioxssrgX9jaTysZD3KqcSSrdj9EBfLd4A+en5rXBnCSs+1dDSgE9ddWU6H/x2RPZFheJoIVbyP
	aRVyIgU+1ogiBHVlQGOnl1gaTmTmDzTgOh4N1xAD79r+1jc39DNFtVWjP2Xt0D02jgUnAEUMU95Ot
	y+UnTOVCM8A0K6TmseXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukIjI-00000002M5T-2mgs;
	Fri, 08 Aug 2025 08:45:36 +0000
Received: from relay15.mail.gandi.net ([2001:4b98:dc4:8::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukIfT-00000002LYM-3LPz
	for linux-mtd@lists.infradead.org;
	Fri, 08 Aug 2025 08:41:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C643E43136;
	Fri,  8 Aug 2025 08:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754642497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yLhzjSRYeybpsHxFLLsL0cmijqL7oU80srHzy511Bfo=;
	b=NBt4qSbJb/VW2a3SB+T/eZLmv6oRUR+u/rL27pQUDUk00BGuajJMAMWofEm+s8wEYwDjvE
	m5BfHWSVJ5wK9o9NZjYdlfLH/+jVIigD7WoiugHFNvseLeWxg7oB9mywdx6Z2qm/BtG8kT
	OyzdiN21dBd7+Yla6WqjxO6oBgL2/HyTdEy/5/eA1qXAs/aCQanQndRka9iAbRH2/YjySy
	MZuqH/RL3tIegq1+kvRLPaj3SsEmMmutPym+7wD0yHG4DhkwCy6qIuasEBCgxRoD5WG9AM
	5yvDowyZNhsJ3m4H1TgT0Or8ZX0pbKK5dZ0NV+vfmE3erXNiztPRtGfWXc5R5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "markus.stockhausen@gmx.de" <markus.stockhausen@gmx.de>,
  "vigneshr@ti.com" <vigneshr@ti.com>,  "richard@nod.at" <richard@nod.at>,
  "tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: AW: NAND ECC errors
In-Reply-To: <a1794cf8-ed93-45db-8ac1-7e5d2ccd9fe9@alliedtelesis.co.nz> (Chris
	Packham's message of "Thu, 7 Aug 2025 21:32:37 +0000")
References: <118501dc07ae$3f6379a0$be2a6ce0$@gmx.de>
	<2537e2a1-f958-4e9c-b346-b4fac2152a47@alliedtelesis.co.nz>
	<034f01dc07e1$8dd75dd0$a9861970$@gmx.de>
	<a1794cf8-ed93-45db-8ac1-7e5d2ccd9fe9@alliedtelesis.co.nz>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 08 Aug 2025 10:41:35 +0200
Message-ID: <87pld6b3y8.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdeffeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrdeiheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrieehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepvehhrhhishdrrfgrtghkhhgrmhesrghllhhivgguthgvlhgvshhishdrtghordhniidprhgtphhtthhopehmrghrkhhushdrshhtohgtkhhhrghushgvnhesghhmgidruggvpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrg
 hdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_014139_979291_F3AA8574 
X-CRM114-Status: GOOD (  15.93  )
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

T24gMDcvMDgvMjAyNSBhdCAyMTozMjozNyBHTVQsIENocmlzIFBhY2toYW0gPENocmlzLlBhY2to
YW1AYWxsaWVkdGVsZXNpcy5jby5uej4gd3JvdGU6Cgo+IE9uIDA4LzA4LzIwMjUgMDk6MjMsIG1h
cmt1cy5zdG9ja2hhdXNlbkBnbXguZGUgd3JvdGU6Cj4+PiBBbnlvbmUgZ29vZCBpZGVhcyB3aGF0
IHRvIGRvIGZpcnN0IGZyb20gaGVyZT8KPj4+Cj4+PiBQcm9iYWJseSBkZXBlbmRzLiBCbGFua2lu
ZyB0aGUgTkFORCBjaGlwIGFuZCByZWZvcm1hdHRpbmcgaXQgd2lsbAo+Pj4gcmVzb2x2ZSB0aGUg
ZXJyb3JzIGZyb20gYW5kIHVwc3RyZWFtIHBvaW50IG9mIHZpZXcuIFRoYXQncyBvYnZpb3VzbHkg
bm90Cj4+PiByZWFsbHkgZ29pbmcgdG8gYmUgc29tZXRoaW5nIHlvdSB3YW50IHRvIGRvIGlmIHlv
dSBleHBlY3QgdG8gc3dhcCBiYWNrCj4+PiBhbmQgZm9ydGggYmV0d2VlbiB0aGUgc3RvY2sgZmly
bXdhcmUgYW5kIGFuIHVwc3RyZWFtIGtlcm5lbC4KPj4+Cj4+PiBZb3UnbGwgcHJvYmFibHkgd2Fu
dCB0byBjb252aW5jZSB0aGUgbXRkIGNvZGUgdG8gYWxsb3cgdGhlIG9uLWRpZSBFQ0MgdG8KPj4+
IGJlIGRpc2FibGVkIGFuZCBmaW5kIHdoYXRldmVyIHNvZnR3YXJlIEJDSCBzZXR0aW5ncyBhcmUg
bmVlZGVkIHRoYXQgd29yawo+Pj4gd2l0aCB0aGUgc3RvY2sgZmlybXdhcmUuIFRoZW4gd2UgY291
bGQgbWF5YmUgbG9vayBhdCB1c2luZyB0aGUgRUNDCj4+PiBjb250cm9sbGVyIHRvIGFjY2VsZXJh
dGUgdGhhdC4KPj4gR29vZCBkaXJlY3Rpb24uIFNvIGFzc3VtcHRpb24gaXM6Cj4+IC0gdmVuZG9y
IHdyb3RlIEJDSDYgaW50byBPT0IKPj4gLSBUaGlzIGRlc2lnbiBpcyBhbHNvIGFjdGl2ZSBpbiBo
aXMgZmlybXdhcmUgKHdpdGggUmVhbHRlayBFQ0MgZW5naW5lKQo+PiAtIG5vdyB3ZSByZWFkIGRh
dGEgd2l0aCB1cHN0cmVhbSBrZXJuZWwgYW5kIG9uLWRpZSBFQ0MKPj4gLSBFYWNoIHJlYWQgcHJv
ZHVjZXMgYW4gb24tZGllIEVDQyBlcnJvcgo+PiAtIEFzIHNvb24gYXMgd2Ugd3JpdGUgbmV3IGRh
dGEgb24tZGllIEVDQyB3aWxsIGJlIGNyZWF0ZWQKPj4KPj4gQnV0IHdoZXJlIGlzIHRoZSBFQ0Mg
a25vYiBpbiBiZXR3ZWVuIHNwaS1yZWFsdGVrLW5hbmQsIG10ZCBhbmQgdWJpPwo+IFllYWggdGhh
dCdzIHRoZSBwYXJ0IEkgZG9uJ3Qga25vdy4gSSBkb24ndCB0aGluayB0aGVyZSBpcyBhbiBleGlz
dGluZyAKPiBvbmUgZm9yIFNQSS1OQU5EICh0aGVyZSBpcyBvbmUgZm9yIHBhcmFsbGVsIE5BTkQp
LiBJIHRoaW5rIGl0J3MgYSBjaGlwIAo+IGxldmVsIHRoaW5nIHNvIHNwaS1yZWFsdGVrLW5hbmQg
d2lsbCBwcm9iYWJseSBiZSBpZ25vcmFudCBvZiBhbnkgc3VjaCAKPiBvcHRpb24gKGF0IGxlYXN0
IHVudGlsIHRoZSBFQ0MgY29udHJvbGxlciBjb21lcyBpbnRvIHBsYXkpLiBJIGFsc28gdGhpbmsg
Cj4gdWJpIGRvZXNuJ3QgY2FyZSB3aG8gZG9lcyB0aGUgRUNDIGFzIGxvbmcgYXMgdGhleSB0ZWxs
IHRoZW0gd2hlbiB0aGVyZSAKPiBpcyBhbiBlcnJvci4KCkFzIGV4cGxhaW5lZCBpbiBteSBvdGhl
ciBhbnN3ZXIsIHlvdSBjYW4gbm93IGNob29zZSBiZXR3ZWVuIEVDQyBlbmdpbmVzCndoZW4gdGhl
cmUgYXJlIHNldmVyYWwuIEFsbCBoYXBwZW5zIGF0IHRoZSBTUEkgTkFORCBsZXZlbCB0aG91Z2gs
IE1URCwKVUJJIG9mIGZpbGVzeXN0ZW1zIGFyZSBpZ25vcmFudCBhYm91dCBpdC4gVGhleSBqdXN0
IGV4cGVjdCAoY29ycmVjdGVkKQpkYXRhLgoKSG93ZXZlciBpZiB5b3VyIGZ3IHVzZWQgdG8gcGxh
eSB3aXRoIGFuIGV4dGVybmFsIG9yIHBpcGVsaW5lZCBFQ0MKZW5naW5lLCB5b3UgYXJlIGdvb2Qg
dG8gd3JpdGUgYSBkcml2ZXIgZm9yIGl0ISBCdXQgYmUgaGFwcHksIG5vdyB0aGVyZQppcyBhbGwg
dGhlIGluZnJhc3RydWN0dXJlIG5lZWRlZCBmb3IgaXQuCgpSZWZlcmVuY2UgaW1wbGVtZW50YXRp
b25zOgotIGRyaXZlcnMvbXRkL25hbmQvZWNjLW14aWMuYwotIGRyaXZlcnMvbXRkL25hbmQvZWNj
LW10ay5jCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
