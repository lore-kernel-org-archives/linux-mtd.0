Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DC1C4727E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 14:59:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD122206FC
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 14:59:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P/dFAkSR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD122206FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZOlcjUVvqnTyo4CmNlDfOVsGkS+lzGeFeomCSPlSaYI=; b=P/dFAkSRS85MCEhEW5qGi3Ojb
	KqwjHZ0UnRz52mmogolmhiu4uG8m3JDKua1Db4pO0yGvwe2m3Rlrv3208M5cPz/Tf++hOMObWT+Bm
	H8PMiTC7qR0VxzXkecGqtJ57gIzMIInVBl6hFMJHcMvJyrLrqsVOM748Iqddy10V89GvaqR0CebIS
	5ey/EIP8szA3CS2wjAsyNMycM39BH0IHYBTKyHzAOg8w+DqjXNfdiEA8AD+n1dSgxCBjKDNUhwRYt
	1orWiHvmYjxaobW5PtvX2fok5pGK316iYUX+vokTq+2hcwLidb2lxvzgV50VHbd1JvUcsOMvPDj4v
	lWkGrgRVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNdZ3-0001wS-OF; Wed, 30 Sep 2020 14:58:41 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNdZ1-0001vR-4a
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 14:58:40 +0000
Received: from xps13 (71.53.205.77.rev.sfr.net [77.205.53.71])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 87336240005;
 Wed, 30 Sep 2020 14:58:33 +0000 (UTC)
Date: Wed, 30 Sep 2020 16:58:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: imx27: Unsupported ECC algorithm
Message-ID: <20200930165831.418b8edd@xps13>
In-Reply-To: <CAOMZO5D8W+Z5enehxFt7XTPn6sEXe9pWM6Tn1SixMntkZ31Wgw@mail.gmail.com>
References: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
 <20200921094010.GH21278@pengutronix.de>
 <20200928172012.712035f8@xps13>
 <CAOMZO5CzNrGnwAB4zuUzeO3LVUqxaD4u0UXfYO8HBNcKSS-mvw@mail.gmail.com>
 <CAOMZO5D8W+Z5enehxFt7XTPn6sEXe9pWM6Tn1SixMntkZ31Wgw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_105839_268304_0164EAA6 
X-CRM114-Status: GOOD (  18.80  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlIG9uIFR1ZSwg
MjkgU2VwIDIwMjAgMTM6MzE6MDMKLTAzMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiBUdWUsIFNl
cCAyOSwgMjAyMCBhdCA4OjM5IEFNIEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4g
d3JvdGU6Cj4gCj4gPiBsaW51eC1uZXh0IGZyb20gMjAyMDA5Mjggc3RpbGwgcmVwb3J0cyB0aGUg
c2FtZSBlcnJvcjoKPiA+Cj4gPiBodHRwczovL3N0b3JhZ2Uua2VybmVsY2kub3JnL25leHQvbWFz
dGVyL25leHQtMjAyMDA5MjgvYXJtL2lteF92NF92NV9kZWZjb25maWcvZ2NjLTgvbGFiLXBlbmd1
dHJvbml4L2Jhc2VsaW5lLWlteDI3LXBoeXRlYy1waHljYXJkLXMtcmRrLmh0bWwKPiA+Cj4gPiBJ
IGNoZWNrZWQgdGhhdCB0aGUgZml4IHBvaW50ZWQgb3V0IGJ5IFNhc2NoYSBpcyBub3QgcHJlc2Vu
dCBpbiB0aGlzIHRyZWUgdGhvdWdoLgo+ID4KPiA+IEkgZG8gc2VlIGl0IGZpeGVkIGluIGxpbnV4
LW5leHQgZnJvbSB0b2RheSAoMjAyMDA5MjkpLCBidXQgdGhlIHJlcG9ydAo+ID4gZnJvbSAyMDIw
MDkyOSBpcyBub3QgeWV0IGF2YWlsYWJsZS4KPiA+Cj4gPiBJIHdpbGwgbGV0IHlvdSBrbm93IGFm
dGVyIGtlcm5lbGNpIHB1Ymxpc2hlcyB0aGUgYm9vdCByZXN1bHRzIGZyb20gdG9kYXkncyBuZXh0
LiAgCj4gCj4gbGludXgtbmV4dCAyMDIwMDkyOSBoYXMgYW4gZXZlbiB3b3JzZSBsb2cgd2l0aCBh
IG5ldyBkaXZpc2lvbiBieSB6ZXJvOgo+IAo+IGh0dHBzOi8vc3RvcmFnZS5rZXJuZWxjaS5vcmcv
bmV4dC9tYXN0ZXIvbmV4dC0yMDIwMDkyOS9hcm0vaW14X3Y0X3Y1X2RlZmNvbmZpZy9nY2MtOC9s
YWItcGVuZ3V0cm9uaXgvYmFzZWxpbmUtaW14MjctcGh5dGVjLXBoeWNhcmQtcy1yZGsuaHRtbAoK
SSBmb3VuZCBhIGJvYXJkIChOVEMgQy5ILkkuUCwgc3VuNWkgUjggU29DKSB3aXRoIGEgcGFyYWxs
ZWwgTkFORC4KCndpdGggdGhlIHNhbWUgRFQgcHJvcGVydGllcyBidXQgYSBkaWZmZXJlbnQgTkFO
RCBjb250cm9sbGVyIGRyaXZlciBJCmNvdWxkIG5vdCByZXByb2R1Y2UgdGhlIGlzc3VlLgoKSG93
ZXZlciwgSSBkaWQgdHJpZWQgd2l0aCBzb2Z0IEJDSCBhbmQgSSBmb3VuZCBhIHJlbGF0ZWQgZXJy
b3Igd2hpY2ggSQpqdXN0IGZpeGVkLiBJIGFsc28gZ290IGEgYnVnIHJlcG9ydCBmcm9tIEludGVs
J3Mgcm9ib3Qgd2hpY2ggSSBhbHNvCmZpeGVkLiBQZXJoYXBzIHdoYXQgeW91IHNlZSBpcyByZWxh
dGVkIChzdGlsbCBhcm91bmQgdGhpcyAtPnRvdGFsIGVudHJ5Cm5vdCBiZWluZyBzZXQgYXQgdGhl
IHJpZ2h0IG1vbWVudCBhdCBwcm9iZSB0aW1lKS4KCklmIHRvbW9ycm93J3MgcmVwb3J0IHN0aWxs
IHJldHVybnMgYW4gZXJyb3IsIHdlIHdpbGwgbmVlZCBzb21lb25lCnRvIGdldCBwaHlzaWNhbCBh
Y2Nlc3MgdG8gdGhlIGRldmljZSB0byBhZGQgZGVidWdnaW5nIGNvZGUgYW5kIHRyYWNrCmRvd24g
dGhlIGZhaWx1cmUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
