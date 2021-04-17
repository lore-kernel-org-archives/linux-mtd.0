Return-Path: <SRS0=Xxtu=JO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865CAC433B4
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Apr 2021 12:32:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39F8F611AF
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Apr 2021 12:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39F8F611AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1T+tW065JLPUvyHr3ja35z+SD5qYZelOIA4hfL3xrE4=; b=NwdqVIjn9GzUGYkSy5jU7XPXZ
	9NeD+TazlgrA+Kx73JCRDsvU91PV1oePJrZwTnI3iQP9HSgdw+2GkpUudgFBCse2ZVb/LgvJviQCQ
	xcOo0EyvClUh4gwrp+jfdd3rSPGI/gJPycWHLEJPhzkxhnQgAk+OeKZRm0R+biUmJlmU6u6UXoE1M
	aNfxnHpFYfJGOqHpsK6hbNUJc0zQgRtHE4FURr3tf9Pb/u7r0CiOs3mVguMX/PSi2lRRo5LxaaFMY
	KH4AtICr3p0nsmL9JLtF1DrZN4+Qijd5Hey5FWYyxissPfZzE8vAj1yi4N44WAxzVtnnMV9Ot0dtI
	VFop6FIlQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXk6t-005JVe-NC; Sat, 17 Apr 2021 12:31:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXk6r-005JVX-7Q
 for linux-mtd@desiato.infradead.org; Sat, 17 Apr 2021 12:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=RnP5HQ6QT/EhNRRe2K31BIrDzoWU9o1h/FeLJqdDwX8=; b=nLzLY4R2xtuZCoHJ2TiIlYxHmg
 ovh+sWoRuQANHlsRuJRkzIp6Rq5X6taSX076Pz2wtXlymBhoklgI/ydNnk+aztOf5Q9WZaxPwzA17
 3XnihL56toxaVZJ4Uo7o00F2gjfHf5Q8BlfdzV2hFVA9LZWPdJX44aHxG/05n/w/nwoGI55NuyfJK
 lqUKdnV1fUK7/k7CS+dXBlPGM0mWaXb2ozMLeB4reh0f41nfw4Pg2JiUsFjo4h6XMSxA0S1b7Ng7E
 Y4m6AAMLOIya33mj7WbOE5K2ebIL8iceURkHCktAfHakXdAbBrF76u4bZi0YbRMu1YR8BuVoIEg6x
 LpijD/Pg==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXk6o-00A1gg-0T
 for linux-mtd@lists.infradead.org; Sat, 17 Apr 2021 12:31:35 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2A81A240003;
 Sat, 17 Apr 2021 12:31:24 +0000 (UTC)
Date: Sat, 17 Apr 2021 14:31:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Boris Brezillon <boris.brezillon@collabora.com>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Manivannan Sadhasivam
 <mani@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: fix an error code in nand_setup_interface()
Message-ID: <20210417143124.6a79c71c@xps13>
In-Reply-To: <20210417102426.GP6048@kadam>
References: <YHaEEYg2DUFwnxSo@mwanda> <20210416170040.4e467039@xps13>
 <20210417102426.GP6048@kadam>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_053134_211911_8BCFC980 
X-CRM114-Status: GOOD (  23.28  )
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

SGkgRGFuLAoKRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPiB3cm90ZSBv
biBTYXQsIDE3IEFwciAyMDIxCjEzOjI0OjI2ICswMzAwOgoKPiBPbiBGcmksIEFwciAxNiwgMjAy
MSBhdCAwNTowMDo0MFBNICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgRGFuLAo+
ID4gCj4gPiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+IHdyb3RlIG9u
IFdlZCwgMTQgQXByIDIwMjEKPiA+IDA4OjU2OjMzICswMzAwOgo+ID4gICAKPiA+ID4gV2Ugc2hv
dWxkIHJldHVybiBhbiBlcnJvciBjb2RlIGlmIHRoZSB0aW1pbmcgbW9kZSBpcyBub3QgYWNrbm93
bGVkZ2VkCj4gPiA+IGJ5IHRoZSBOQU5EIGNoaXAuICAKPiA+IAo+ID4gVGhpcyB0cnVseSBpcyBx
dWVzdGlvbmFibGUgKGFuZCBJIGFtIG5vdCB5ZXQgZGVjaWRlZCB3aGV0aGVyIHRoZSBhbnN3ZXIK
PiA+IHNob3VsZCBiZSB5ZXMgb3Igbm8pLgo+ID4gCj4gPiBSZXR1cm5pbmcgYW4gZXJyb3IgaGVy
ZSB3b3VsZCBwcm9kdWNlIHRoZSBlbnRpcmUgYm9vdCBzZXF1ZW5jZSB0byBmYWlsLAo+ID4gZXZl
biB0aG91Z2ggdGhlIE5BTkQgY2hpcCB3b3VsZCB3b3JrIGluIG1vZGUgMC4KPiA+IAo+ID4gTm90
IHJldHVybmluZyBhbiBlcnJvciB3b3VsZCBwcmludCB0aGUgYmVsb3cgd2FybmluZyAoc28gdGhl
Cj4gPiB1c2VyL2RldmVsb3BlciBpcyB3YXJuZWQpIGFuZCBjb250aW51ZSB0aGUgYm9vdCB3aXRo
IHRoZSBzbG93ZXN0Cj4gPiB0aW1pbmcgaW50ZXJmYWNlLgo+ID4gCj4gPiBIb25lc3RseSBJIHdv
dWxkIGJlIG1vcmUgaW4gZmF2b3Igb2YgbGV0dGluZyB0aGluZ3MgYXMgdGhleSBhcmUKPiA+IGJl
Y2F1c2UgSSBkb24ndCB0aGluayB0aGlzIG1heSBiZSBjb25zaWRlcmVkIGFzIGEgYnVnZ3kgc2l0
dWF0aW9uLCBidXQgSQo+ID4gYW0gb3BlbiB0byBkaXNjdXNzaW9uLgo+ID4gICAKPiAKPiBJZiB3
ZSBkZWNpZGVkIHRoYXQgdGhlIG9yaWdpbmFsIGNvZGUgaXMgY29ycmVjdCB0aGVuIG9uZSB3YXkg
dG8gc2lsZW5jZQo+IHRoZSB3YXJuaW5nIHdvdWxkIGJlIHRvIGRvOgo+IAo+IAlpZiAodG1vZGVf
cGFyYW1bMF0gIT0gY2hpcC0+YmVzdF9pbnRlcmZhY2VfY29uZmlnLT50aW1pbmdzLm1vZGUpIHsK
PiAJCXByX3dhcm4oInRpbWluZyBtb2RlICVkIG5vdCBhY2tub3dsZWRnZWQgYnkgdGhlIE5BTkQg
Y2hpcFxuIiwKPiAgCQkJY2hpcC0+YmVzdF9pbnRlcmZhY2VfY29uZmlnLT50aW1pbmdzLm1vZGUp
Owo+IAkJcmV0ID0gMDsKPiAJCWdvdG8gZXJyX3Jlc2V0X2NoaXA7Cj4gCX0KPiAKPiBTZXR0aW5n
ICJyZXQgPSAwOyIgcmlnaHQgYmVmb3JlIHRoZSBnb3RvIG1ha2VzIHRoZSBjb2RlIGxvb2sgbW9y
ZQo+IGludGVudGlvbmFsIHRvIGh1bWFuIHJlYWRlcnMgYXMgd2VsbC4KCkFic29sdXRlbHkgcmln
aHQuIExldCdzIGdvdCBmb3IgaXQgdGhlbi4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
