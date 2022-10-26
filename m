Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E03C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Oct 2022 08:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBti1MVfsRvuknwBPBo8Jip4/bNNRvSDLBQcGW4zH3Q=; b=iC1TXqX0LtQCkm
	Ri6IP6xSJIU7/EK6mjUhRzALe1fWCmxasWLea/Xki1nIsxte42/3dAK0nR/5JTvqskmGvpP2Nu+3t
	pb8NA6COgJ+y+ROZiUNpG8Zi70m+vu0Mexdb6zPodUsg/i5c/dH9K5Xh0TZQ+Gpf982HCA8XW8Wzi
	BxMcah1azrMpYELxPLBAaUWrjf9FUFtqShF1vSWXIe5V2bPko21O6dL4VuitDSETms/yRO6FZUZiu
	mb6sd/FjUIFcjurO+jtiCLA6LMHsovJ/bFuZspjmwZXB1a4Z1HIrcVysv92twMo84J2DkQgEB6iue
	a/r78iVmdNn0H24OF0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onbcb-008WjD-1E; Wed, 26 Oct 2022 08:18:45 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onbcU-008Wg5-Bn
	for linux-mtd@lists.infradead.org; Wed, 26 Oct 2022 08:18:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0E7F4E0005;
	Wed, 26 Oct 2022 08:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666772315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5F15LdH32ppPGR7bide78pa8Ark7aZO1AYqZ8pGDmqE=;
	b=d/SDmjbz3Z03QjOQOWqgfunmMJaLYawBtS7mOgjeHbi1au4a561Nz52ntTRWH+Qw/9bUam
	+sStSlwrt6Jna+u2R01SpxFuvZYckYZYHhs2LhOSSdD0oiUGkNWZqPwskQoAic9lVdeEpU
	MSw8iyAJi9LCGxZFOiM7hBGV8Mx37KzP+84/6U/n4ZorTzePNOR83UXQf7110/lRuv8GOm
	0dnTvf+3hxloJjRHMVAv3vimFMP5+ol2msdM+7N3DNseUm8rA0xaknevz8kxNkJiFGGgDb
	wXWb0beCz4P9Jjk6p9ZUrAlLW242twz3l9ZKnq0AYGVgwSeMNdbMJxJGJJC+DA==
Date: Wed, 26 Oct 2022 10:18:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Tomasz =?UTF-8?B?TW/FhA==?=
 <tomasz.mon@camlingroup.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, Sasha Levin <sashal@kernel.org>,
 torvalds <torvalds@linux-foundation.org>, Han Xu <han.xu@nxp.com>, kernel
 <kernel@pengutronix.de>, stable <stable@vger.kernel.org>, k drobinski
 <k.drobinski@camlintechnologies.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on
 program/erase times
Message-ID: <20221026101829.4a0e9da7@xps-13>
In-Reply-To: <CAJ+vNU2R=FVSpRVWh8RBJ7XZmRRjkqHce1WTGXDKrjeHRbuzSw@mail.gmail.com>
References: <20220701110341.3094023-1-s.hauer@pengutronix.de>
	<c2d545d1f5478e66c0dac47f4bc4c04256ff44aa.camel@camlingroup.com>
	<fd830c7e94de6b4a0b532dfcf46cf1edd22b42fb.camel@camlingroup.com>
	<YtD/9KJZwlVj+6hS@kroah.com>
	<20220715074631.GA7333@pengutronix.de>
	<YtEdIujszEKSprbF@kroah.com>
	<770744970.283550.1657871950910.JavaMail.zimbra@nod.at>
	<20220902090252.75285234@xps-13>
	<CAJ+vNU0r3Enkwn+WzvEJYc_O4NurRyCssx2S-_ZS_cYCpk2-cA@mail.gmail.com>
	<20221024100114.627f87bd@xps-13>
	<CAJ+vNU2R=FVSpRVWh8RBJ7XZmRRjkqHce1WTGXDKrjeHRbuzSw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_011838_846509_2BDB20C7 
X-CRM114-Status: GOOD (  38.80  )
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

SGkgVGltLAoKdGhhcnZleUBnYXRld29ya3MuY29tIHdyb3RlIG9uIFR1ZSwgMjUgT2N0IDIwMjIg
MTU6MDI6MjcgLTA3MDA6Cgo+IE9uIE1vbiwgT2N0IDI0LCAyMDIyIGF0IDE6MDEgQU0gTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgVGlt
LAo+ID4KPiA+IHRoYXJ2ZXlAZ2F0ZXdvcmtzLmNvbSB3cm90ZSBvbiBGcmksIDIxIE9jdCAyMDIy
IDE0OjU1OjE1IC0wNzAwOgo+ID4gIAo+ID4gPiBPbiBGcmksIFNlcCAyLCAyMDIyIGF0IDEyOjAz
IEFNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOiAgCj4g
PiA+ID4KPiA+ID4gPiBIZXkgZm9sa3MsCj4gPiA+ID4KPiA+ID4gPiByaWNoYXJkQG5vZC5hdCB3
cm90ZSBvbiBGcmksIDE1IEp1bCAyMDIyIDA5OjU5OjEwICswMjAwIChDRVNUKToKPiA+ID4gPiAg
Cj4gPiA+ID4gPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tICAKPiA+ID4gPiA+ID4+
IE15IElSQyBoaXN0b3J5IGRvZXNuJ3QgZ28gYmFjayBmYXIgZW5vdWdoLCBidXQgaWYgSSByZWNh
bGwgY29ycmVjdGx5Cj4gPiA+ID4gPiA+PiBNaXF1ZWwgaXMgb24gdmFjYXRpb24sIGhlIHdvdWxk
IGhhdmUgcGlja2VkIHVwIHRoaXMgcGF0Y2ggZm9yIGxpbnV4LW5leHQKPiA+ID4gPiA+ID4+IG90
aGVyd2lzZS4gIAo+ID4gPiA+ID4KPiA+ID4gPiA+IEV4YWN0bHkuICAKPiA+ID4gPgo+ID4gPiA+
IEluZGVlZCwgSSB3YXMgb2ZmIGZvciBhbiBleHRlbmRlZCBwZXJpb2Qgb2YgdGltZSwgSSdtICh2
ZXJ5KSBzbG93bHkKPiA+ID4gPiBjYXRjaGluZyB1cCBub3cuCj4gPiA+ID4gIAo+ID4gPiA+ID4g
IAo+ID4gPiA+ID4gPiBPaywgbGV0IG1lIGRvIGEgcm91bmQgb2Ygc3RhYmxlIHJlbGVhc2VzIHNv
IHRoYXQgcGVvcGxlIGRvbid0IGdldCBoaXQgYnkKPiA+ID4gPiA+ID4gdGhpcyBub3cuLi4gIAo+
ID4gPiA+ID4KPiA+ID4gPiA+IFRoYW5rcyBhIGxvdCBmb3IgZG9pbmcgc28uCj4gPiA+ID4gPiAg
Cj4gPiA+ID4gPiA+IEhvcGVmdWxseSB0aGlzIGdldHMgZml4ZWQgdXAgYnkgNS4xOS1maW5hbC4g
IAo+ID4gPiA+ID4KPiA+ID4gPiA+IFN1cmUsIEknbGwgcGlja3VwIHRoaXMgcGF0Y2guICAKPiA+
ID4gPgo+ID4gPiA+IFRoYW5rcyBHcmVnICYgUmljaGFyZCBmb3IgdGhlIGhhbmRsaW5nIG9mIHRo
aXMgaXNzdWUuCj4gPiA+ID4KPiA+ID4gPiBDaGVlcnMsCj4gPiA+ID4gTWlxdcOobAo+ID4gPiA+
ICAKPiA+ID4KPiA+ID4gSGVsbG8gQWxsLAo+ID4gPgo+ID4gPiBBcyBUb21hc3ogc3RhdGVkIHBy
ZXZpb3VzbHkgMDY3ODFhNTAyNjM1MCB3YXMgbWVyZ2VkIGluIHY1LjE5LXJjNCBhbmQKPiA+ID4g
dGhlbiB3YXMgcGlja2VkIHVwIGJ5IHNldmVyYWwgc3RhYmxlIGtlcm5lbHMuIFdoaWxlIHRoaXMg
bWFkZSBpdCBpbnRvCj4gPiA+IHRoZSA1LjE1IGFuZCA1LjE4IHN0YWJsZSBicmFuY2hlcyBpdCBk
aWQgbm90IG1ha2UgaXQgaW50byB0aGUKPiA+ID4gZm9sbG93aW5nIHdoaWNoIGFyZSB0aHVzIHRo
ZSBhcmUgY3VycmVudGx5IGJyb2tlbjoKPiA+ID4gNS4xMC55Cj4gPiA+IDUuMTcueQo+ID4gPgo+
ID4gPiBIb3cgZG8gd2UgZ2V0IHRoaXMgcGF0Y2ggYXBwbGllZCB0byB0aG9zZSBzdGFibGUgYnJh
bmNoZXMgYXMgd2VsbCB0bwo+ID4gPiByZXNvbHZlIHRoaXM/ICAKPiA+Cj4gPiBJdCBpcyBsaWtl
bHkgdGhhdCB0aGUgb3JpZ2luYWwgcGF0Y2ggKHRhcmdldGluZyBhIG1haW5saW5lIGtlcm5lbCkg
ZGlkCj4gPiBub3QgYXBwbHkgdG8gdGhvc2UgYnJhbmNoZXMuIEluIHRoaXMgY2FzZSB5b3UgY2Fu
IGFkYXB0IHRoZSBmaXggdG8gdGhlCj4gPiBjb25jZXJuZWQga2VybmVscyBhbmQgc2VuZCBpdCB0
byBzdGFibGVAIChmb2xsb3dpbmcgdGhlIERvY3VtZW50YXRpb24KPiA+IGd1aWRlbGluZXMgZm9y
IGJhY2twb3J0cykuCj4gPgo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobCAgCj4gCj4gTWlxdcOobCwK
PiAKPiBUaGFua3MgZm9yIHRoZSBwb2ludGVyLiBZb3UgYXJlIGNvcnJlY3QgdGhhdCB0aGlzIHBh
dGNoIHdoaWNoIHJlc29sdmVzCj4gdGhlIHJlZ3Jlc3Npb24gZG9lcyBub3QgYXBwbHkgZGlyZWN0
bHkgdG8gNS40LzUuMTAvNS4xNyBzdGFibGUgdHJlZXMuCj4gSSdtIGxvb2tpbmcgb3Zlcgo+IGh0
dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjQuMTAvcHJvY2Vzcy9zdGFibGUta2VybmVs
LXJ1bGVzLmh0bWwKCk9wdGlvbiAzIGZpdHMsIHJpZ2h0PwoKPiBhbmQgSSdtIG5vdCBjbGVhciB3
aGF0IEkgbmVlZCB0byBwdXQgaW4gdGhlIGNvbW1pdCB0byBtYWtlIGl0IGNsZWFyCj4gdGhhdCBp
dCBvbmx5IGFwcGxpZXMgdG8gdGhvc2Ugc3BlY2lmaWMgdHJlZXMuIERvIEkgc2ltcGx5IGFkanVz
dCB0aGUKPiAnRml4ZXMnIHRhZyB0byBhZGRyZXNzIHRoZSBjb21taXQgZnJvbSB0aGF0IHNwZWNp
ZmljIHN0YWJsZSBicmFuY2ggYW5kCj4gc2VuZCBvbmUgZm9yIGVhY2ggc3RhYmxlIGJyYW5jaCAo
dGh1cyBlYWNoIHdvdWxkIGhhdmUgYSBkaWZmZXJlbnQgc2hhCj4gaW4gdGhlIEZpeGVzIHRhZykg
d2hpbGUgYWxzbyBhZGRpbmcgdGhlICdjb21taXQgPHNoYT4gdXBzdHJlYW0nIHRvIHRoZQo+IHRv
cD8KCkhlcmUgYXJlIHRoZSBmYWlsdXJlczoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvc3RhYmxl
LzE2NTg1ODM4MTYyMzM2MEBrcm9haC5jb20vCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3N0YWJs
ZS8xNjU4NTgzODE0NzIxMzlAa3JvYWguY29tLwpodHRwczovL2xvcmUua2VybmVsLm9yZy9zdGFi
bGUvMTY1ODU4MzgxMzEzMjE4QGtyb2FoLmNvbS8KCllvdSBzaG91bGQgbm90IGFkanVzdCB0aGUg
Rml4ZXMgdGFnLCB0aGlzIHRhZyBzaG91bGQgcmVhbGx5CnJlZmxlY3Qgd2hhdCB5b3UgYXJlIHRy
eWluZyB0byBmaXgsIGFuZCBub3Qgc29tZSBraW5kIG9mIHRhcmdldCBmb3IgdGhlCmJhY2twb3J0
LiBIb3dldmVyIHlvdSdyZSBjaGFuZ2luZyB0aGUgY29tbWl0IGNvbnRlbnQgc28geW91IGNhbiBh
bHNvCmNoYW5nZSB0aGUgY29tbWl0IGxvZywgd2l0aCBlZy4gdGhlIHVwc3RyZWFtIG9yaWdpbmFs
IGNvbW1pdCBzb21ld2hlcmUKdGhlcmUgaW4gcGxhaW4gdGV4dC4gWW91IGNhbiB0YXJnZXQgYSBr
ZXJuZWwgdmVyc2lvbiBvbiB0aGUgQ2M6IHN0YWJsZQpsaW5lIChzZWUgdGhlIGRvYykgYW5kIHlv
dSBjYW4gYWxzbyB1c2UKCgktLXN1YmplY3QtcHJlZml4PSJQQVRDSCBzdGFibGUgPHZlcnNpb24+
IgoKZHVyaW5nIGdpdC1mb3JtYXQtcGF0Y2gsIGV2ZW4gdGhvdWdoIEknbSBub3Qgc3VyZSB0aGlz
IGlzIGFjdHVhbGx5Cm5lZWRlZCwgaXQncyBtb3JlIGxpa2UgY291cnRlc3kgdG8gbGV0IHJldmll
d2VycyBrbm93IHdoYXQgeW91IGFyZQpkb2luZy4KCkhlcmUgaXMgYW4gZXhhbXBsZSwgbWF5YmUg
bm90IHRoZSBiZXN0IG9uZSAoZm9yZ2V0IGFib3V0IHRoZSBSRVNFTkQpCmJ1dCBhIHR5cGljYWwg
Y2FzZToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjIwMjIzMTc0NDMxLjEw
ODMtMS1mLmZhaW5lbGxpQGdtYWlsLmNvbS8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
