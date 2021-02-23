Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C1EC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 16:10:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 357B364E3F
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 16:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 357B364E3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bs+hPvyRnjaAIcIXu+gRCKbY/bs2QQmEX3iCUZRhYCs=; b=g4EHTFPIB8+Xwa304UHFbVBUj
	wBdVgjM/jQIEWdK2QyXhPVvWj8txZHH5GSwOt1nVM2Ic2r/mGxa3DyDRabdGrDODrDAdieP2PHlSl
	1bSfsB+kGzevy7PWo0d+PHsIOAriHrVarTS6efoTh+Eq37tKvJVoRZnjaZokOEQXe4omfLcNDCZu9
	XaR0qn5yMMMySQ0msPEQwEyYz938OgP+s+Ij6Z0ySv9QcQHehB5GKwGULJRgKsZyau/shmF4m+MAu
	wEVeBdmuuG4YdXK6ebuIzw6cssUlzzxuoj3IIHThaU0QS05mAXCHQ0ZFPY5y+/7MzsKNpW3iAsf2E
	S7zboOdIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEaGO-0007g0-1f; Tue, 23 Feb 2021 16:10:16 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEaGK-0007f0-VR
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 16:10:14 +0000
X-Originating-IP: 86.210.203.113
Received: from xps13 (lfbn-tou-1-972-113.w86-210.abo.wanadoo.fr
 [86.210.203.113]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 02CFB1C0009;
 Tue, 23 Feb 2021 16:10:07 +0000 (UTC)
Date: Tue, 23 Feb 2021 17:10:06 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>
Subject: Re: [PATCH] mtd: rawnand: qcom: Convert nandc to chip in Read/Write
 helper
Message-ID: <20210223171006.3e2030ce@xps13>
In-Reply-To: <1613939101-23001-1-git-send-email-mdalam@codeaurora.org>
References: <1613939101-23001-1-git-send-email-mdalam@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_111013_160041_50007A70 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
Cc: mani@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 sricharan@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+IHdyb3RlIG9uIE1v
biwgMjIgRmViIDIwMjEKMDE6NTU6MDEgKzA1MzA6Cgo+IFRoaXMgY2hhbmdlIHdpbGwgY29udmVy
dCBuYW5kYyB0byBjaGlwIGluIFJlYWQvV3JpdGUgaGVscGVyLCB0aGlzCj4gY2hhbmdlIGlzIG5l
ZWRlZCBiZWNhdXNlIGlmIHdlIHduYXRlZCB0byBhY2Nlc3MgbnVtYmVyIG9mIHN0ZXBzCj4gaW4g
UmVhZC9Xcml0ZSBoZWxwZXIgdGhlbiB3ZSBuZWVkIHRvIGdldCB0aGUgY2hpcC0+ZWNjLnN0ZXBz
LAo+IGN1cnJlbnRsbHkgaXRzIG5vdCBwb3NzaWJsZS5BZnRlciB0aGlzIGNoYW5nZSB3ZSBjYW4g
ZGlyZWN0bHkKPiBhY2NlcyBjaGlwLT5lY2Muc3RlcHMgaW4gUmVhZC9Xcml0ZSBoZWxwZXIuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8bWRhbGFtQGNvZGVhdXJvcmEub3JnPgoK
VGhhbmtzIGZvciBzcGxpdHRpbmcgeW91ciBzZXJpZXMsIEkgdGhpbmsgaXQncyBtdWNoIGVhc2ll
ciB0byByZXZpZXcKYW5kIGNvbnRhaW5zIG11Y2ggbGVzcyBpbXByZWNpc2UgY2hhbmdlcy4KCkkg
aGF2ZSBhIGZldyBtaW5vciBjb21tZW50cyAoc2VlIHRoZSBmb2xsb3dpbmcgZS1tYWlscyksIHBs
ZWFzZSBhZGRyZXNzCnRoZW0gYW5kIHRoZW4gcGxlYXNlIHNlbmQgYWxsIHlvdXIgcGF0Y2hlcyBh
IHNpbmdsZSBzZXJpZXMsIG5vdCBsaWtlIDYrCmluZGVwZW5kZW50IHBhdGNoZXMuCgpJJ2xsIHRo
ZW4gcmVxdWlyZSBzb21lb25lIHRvIHRlc3QgaXQgaWYgd2UgYXJlIGdvb2QgSSdsbCBtZXJnZSBp
dC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
