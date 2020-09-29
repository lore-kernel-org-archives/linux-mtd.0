Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5A9C4741F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 17:47:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ABB8207F7
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 17:47:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xtJKiLgA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ABB8207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c1mbmWy0pKoNib1cCP1hrqqkJUSpeU02DWVspxigHMw=; b=xtJKiLgA4WtWkaN/IrZL96FJT
	pYsVnWQrPsF2Hk8MNwil7OHr69ng27I5Ay4LlZIbtwRWl9Bu1cwPvUhZAGcIzBGKsoFyGid3M6B2N
	CMTdHmFHDwBhI18hIhUJWccXdBMbhw/ZsaMDxB0wOf+BgGZH7jmQpVg2KQ1gIgRHS7Tde1y9Af3iT
	M1zGvoGxqAMddWbILW+xwe6UtLaHBXF+swRd0FwCT2J0Dv+5wNR7VL8LDGvu8Zx/99vY4TErtx3OW
	kNRInmRYhCX80NiLYT1ae/+CsCFgZnnlf1Dm8X1MXwKEI17Y7tlUbGZUL+UOF4bOvElhvbVzYNyRx
	mVi4b8CBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNJhf-00052V-7p; Tue, 29 Sep 2020 17:46:15 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNJhb-00050T-6Y
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 17:46:12 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 451201C0003;
 Tue, 29 Sep 2020 17:46:04 +0000 (UTC)
Date: Tue, 29 Sep 2020 19:46:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: imx27: Unsupported ECC algorithm
Message-ID: <20200929194603.7d60a7f0@xps13>
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
X-CRM114-CacheID: sfid-20200929_134611_329220_49756446 
X-CRM114-Status: GOOD (  17.04  )
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

SGkgRmFiaW8sCgpGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlIG9uIFR1
ZSwgMjkgU2VwIDIwMjAgMTM6MzE6MDMKLTAzMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiBUdWUs
IFNlcCAyOSwgMjAyMCBhdCA4OjM5IEFNIEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gCj4gPiBsaW51eC1uZXh0IGZyb20gMjAyMDA5Mjggc3RpbGwgcmVwb3J0cyB0
aGUgc2FtZSBlcnJvcjoKPiA+Cj4gPiBodHRwczovL3N0b3JhZ2Uua2VybmVsY2kub3JnL25leHQv
bWFzdGVyL25leHQtMjAyMDA5MjgvYXJtL2lteF92NF92NV9kZWZjb25maWcvZ2NjLTgvbGFiLXBl
bmd1dHJvbml4L2Jhc2VsaW5lLWlteDI3LXBoeXRlYy1waHljYXJkLXMtcmRrLmh0bWwKPiA+Cj4g
PiBJIGNoZWNrZWQgdGhhdCB0aGUgZml4IHBvaW50ZWQgb3V0IGJ5IFNhc2NoYSBpcyBub3QgcHJl
c2VudCBpbiB0aGlzIHRyZWUgdGhvdWdoLgo+ID4KPiA+IEkgZG8gc2VlIGl0IGZpeGVkIGluIGxp
bnV4LW5leHQgZnJvbSB0b2RheSAoMjAyMDA5MjkpLCBidXQgdGhlIHJlcG9ydAo+ID4gZnJvbSAy
MDIwMDkyOSBpcyBub3QgeWV0IGF2YWlsYWJsZS4KPiA+Cj4gPiBJIHdpbGwgbGV0IHlvdSBrbm93
IGFmdGVyIGtlcm5lbGNpIHB1Ymxpc2hlcyB0aGUgYm9vdCByZXN1bHRzIGZyb20gdG9kYXkncyBu
ZXh0LiAgCj4gCj4gbGludXgtbmV4dCAyMDIwMDkyOSBoYXMgYW4gZXZlbiB3b3JzZSBsb2cgd2l0
aCBhIG5ldyBkaXZpc2lvbiBieSB6ZXJvOgo+IAo+IGh0dHBzOi8vc3RvcmFnZS5rZXJuZWxjaS5v
cmcvbmV4dC9tYXN0ZXIvbmV4dC0yMDIwMDkyOS9hcm0vaW14X3Y0X3Y1X2RlZmNvbmZpZy9nY2Mt
OC9sYWItcGVuZ3V0cm9uaXgvYmFzZWxpbmUtaW14MjctcGh5dGVjLXBoeWNhcmQtcy1yZGsuaHRt
bAoKR2FzcC4uLgoKSSdsbCBoYXZlIGEgbG9vayB0b21vcnJvdy4gVW5mb3J0dW5hdGVseSBJIGRv
bid0IGhhdmUgYWNjZXNzIHRvIGEKYm9hcmQgd2l0aCBhIHJhdyBOQU5EIG9uIGl0IHJpZ2h0IG5v
dyBzbyBJIGNhbm5vdCB0ZXN0IGVhc2lseS4KCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
