Return-Path: <SRS0=wdd2=GW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96488C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jan 2021 15:54:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D8B220780
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jan 2021 15:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D8B220780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vOWbl8GCHaf2j4nKqx/DKRPRVloa/AXz4ZfmOCeAwoY=; b=jK+8Rn1DGmjnYp09gtXjZvqO2
	n3EIEjG5IFER/e6ucXRkx0WxPuTTJ7Oj0FWvLbPtaxyhONMZ5CmqILWmR4d/ftwvPVFNFJhYbf0xZ
	msDkAp1Yg8zAiE9uFSG8lalbOOBXUDzoCSARTjDTMTFbIIO1alDBLz0B4A3QZdwBR8nAbE7hieOko
	E8EBwG5UTJgXqK2B73uXyWfo31D4V+/voq9fF2rL2TyVVsz37GE4y2rGDSAWyir1Sj5W0I0zT9Rx7
	kXKAZ6y3f8dLAL+o3En7T7BlhZTlsTt5d1LDRxZIG3q6CYO54I8dLmLjFD4KzMnQkjPFvsgPzo33Y
	TXm8tXosA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1tK8-0005lB-5C; Tue, 19 Jan 2021 15:53:40 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1tK5-0005jo-O7
 for linux-mtd@lists.infradead.org; Tue, 19 Jan 2021 15:53:38 +0000
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr
 [86.201.233.230]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E4AA260050;
 Tue, 19 Jan 2021 15:53:30 +0000 (UTC)
Date: Tue, 19 Jan 2021 16:53:29 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH 04/20] mtd: nand: ecc-bch: Stop exporting the private
 structure
Message-ID: <20210119165329.6123ad05@xps13>
In-Reply-To: <CAHCN7xKtSwEDEXwU=df0FYzL0ivrWser0-kioW2BSrfU+XQFWQ@mail.gmail.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-5-miquel.raynal@bootlin.com>
 <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
 <20210111112027.7cbda0ba@xps13> <20210112153534.5ba93cde@xps13>
 <CAHCN7xJCn8TD+T8pi5P=QMU=uZJ_LN1_wOEQON-noagf2H9+nw@mail.gmail.com>
 <CAHCN7xL-uzvKqBiYq6R3=-8wNT-V9DZX5ca2ZQ9Y_Wahh0_rAA@mail.gmail.com>
 <20210114164224.5d21c170@xps13>
 <CAHCN7xKYSPzW-Qbeqzqvey+=V9KiYcsy8uxJeW=2WRXUwAq0JA@mail.gmail.com>
 <CAHCN7x+pHusxQj+r0SN4KPD=ZgGg5fdLHZxasu54pPf0k4dVjA@mail.gmail.com>
 <20210115171736.1c837c29@xps13>
 <CAHCN7xKWBcuF0h5+brHndZCD5dFbbcxxZZxEPXRPVK7kZGbM1Q@mail.gmail.com>
 <20210119125634.6d4c5c1e@xps13>
 <CAHCN7xJUCsOvmtkYgWU7+_H4jMDJe7fNnpJuuRov+Qu7qh+xGg@mail.gmail.com>
 <20210119153521.7d5de79d@xps13>
 <CAHCN7xKtSwEDEXwU=df0FYzL0ivrWser0-kioW2BSrfU+XQFWQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_105337_958405_F2F0991B 
X-CRM114-Status: GOOD (  19.63  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, ycllin@mxic.com.tw,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQWRhbSwKCkFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPiB3cm90ZSBvbiBUdWUsIDE5
IEphbiAyMDIxIDA5OjQ5OjM2IC0wNjAwOgoKPiBPbiBUdWUsIEphbiAxOSwgMjAyMSBhdCA4OjM2
IEFNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4K
PiA+IEhpIEFkYW0sCj4gPiAgCj4gPiA+ID4gLS0tODwtLS0KPiA+ID4gPgo+ID4gPiA+IEF1dGhv
cjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+ID4gPiBEYXRl
OiAgIFR1ZSBKYW4gMTkgMTI6Mjc6MDcgMjAyMSArMDEwMAo+ID4gPiA+Cj4gPiA+ID4gICAgIHdp
cDogZml4IG9tYXAKPiA+ID4gPgo+ID4gPiA+ICAgICBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gPiA+ICAKPiA+ID4gVGhhbmtzIGZv
ciBmaXhpbmcgdGhpcy4KPiA+ID4KPiA+ID4gSSB0ZXN0ZWQgeW91ciBwYXRjaCwgYW5kIEkgbm8g
bG9uZ2VyIGdldCBhIFBhbmljIGFuZCB0aGUgTVREIGRldmljZQo+ID4gPiBhcHBlYXJzIHRvIGFw
cGVhciBjb3JyZWN0bHk6Cj4gPiA+Cj4gPiA+IG10ZG9vcHM6IG10ZCBkZXZpY2UgKG10ZGRldj1u
YW1lL251bWJlcikgbXVzdCBiZSBzdXBwbGllZAo+ID4gPiBvbWFwMi1uYW5kIDMwMDAwMDAwLm5h
bmQ6IEdQSU8gbG9va3VwIGZvciBjb25zdW1lciByYgo+ID4gPiBvbWFwMi1uYW5kIDMwMDAwMDAw
Lm5hbmQ6IHVzaW5nIGRldmljZSB0cmVlIGZvciBHUElPIGxvb2t1cAo+ID4gPiBvZl9nZXRfbmFt
ZWRfZ3Bpb2RfZmxhZ3M6IHBhcnNlZCAncmItZ3Bpb3MnIHByb3BlcnR5IG9mIG5vZGUKPiA+ID4g
Jy9vY3BANjgwMDAwMDAvZ3BtY0A2ZTAwMDAwMC9uYW5kQDAsMFswXScgLSBzdGF0dXMgKDApCj4g
PiA+IGdwaW8gZ3Bpb2NoaXA2OiBQZXJzaXN0ZW5jZSBub3Qgc3VwcG9ydGVkIGZvciBHUElPIDAK
PiA+ID4gbmFuZDogZGV2aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4MmMsIENoaXAgSUQ6
IDB4YmMKPiA+ID4gbmFuZDogTWljcm9uIE1UMjlGNEcxNkFCQkRBM1cKPiA+ID4gbmFuZDogNTEy
IE1pQiwgU0xDLCBlcmFzZSBzaXplOiAxMjggS2lCLCBwYWdlIHNpemU6IDIwNDgsIE9PQiBzaXpl
OiA2NAo+ID4gPiBuYW5kOiB1c2luZyBPTUFQX0VDQ19CQ0g4X0NPREVfSFdfREVURUNUSU9OX1NX
Cj4gPiA+IDYgY21kbGluZXBhcnQgcGFydGl0aW9ucyBmb3VuZCBvbiBNVEQgZGV2aWNlIG9tYXAy
LW5hbmQuMAo+ID4gPiBDcmVhdGluZyA2IE1URCBwYXJ0aXRpb25zIG9uICJvbWFwMi1uYW5kLjAi
Ogo+ID4gPiAuLi4gIAo+ID4KPiA+IEdvb2QgdG8ga25vdy4gQ2FuIHlvdSBqdXN0IHRlbGwgbWUg
aWYgdGhlIHZhbHVlcyBvZgo+ID4gLSBjaGlwLT5lY2MuYnl0ZXMgdnMuIGVuZ2luZV9jb25mLT5j
b2RlX3NpemUKPiA+IC0gY2hpcC0+ZWNjLnN0ZXBzIHZzLiBlbmdpbmVfY29uZi0+bnN0ZXBzCj4g
PiBhcmUgdGhlIHNhbWUgaW4gYm90aCBjYXNlcyAoeW91ciBwYXRjaCBhbmQgbWluZSk/IE90aGVy
d2lzZSB5b3VyIGRhdGEKPiA+IG1pZ2h0IGFwcGVhciBjb3JydXB0ZWQgc29tZWhvdy4gIAo+IAo+
IEkgZGlkbid0IGZ1bGx5IHZldCBteSBoYWNrLCBiZXlvbmQgZWxpbWluYXRpbmcgdGhlIEtlcm5l
bCBwYW5pYywgc28gSQo+IGZlbHQgbW9yZSBjb21mb3J0YWJsZSBjb21wYXJpbmcgdGhlIHZhbHVl
cyB0byBhIHN0YWJsZSByZWxlYXNlLgo+IEkgY29tcGFyZWQgdGhlIHZhbHVlcyBpbiA1LjEwIHRv
IDUuMTEtcmM0ICsgeW91ciBwYXRjaCwgYW5kIHRoZSBudW1iZXIKPiBvZiBzdGVwcyBhbmQgb29i
cmVnaW9uLT5sZW5ndGggYXJlIGlkZW50aWNhbCBiZXR3ZWVuIHRoZW0uCj4gCj4gNS4xMC41Ogo+
ICAgY2hpcC0+ZWNjLnN0ZXBzID0gNAo+ICAgb29icmVnaW9uLT5sZW5ndGggPSBkCj4gCj4gNS4x
MS1yYzQgKyBwYXRjaDoKPiAgIGVuZ2luZV9jb25mLT5uc3RlcHMgPSA0Cj4gICBvb2JyZWdpb24t
Pmxlbmd0aCA9IGQKCkdyZWF0LCB0aGFua3MgZm9yIGNoZWNraW5nLgoKSSdsbCBzZW5kIHRoZSBm
b3JtYWwgcGF0Y2ggdGhlbi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
