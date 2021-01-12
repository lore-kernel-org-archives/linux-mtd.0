Return-Path: <SRS0=hgS/=GP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0CEC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Jan 2021 14:37:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0705620771
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Jan 2021 14:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0705620771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fu86B0QaCvZvgCYyh0EsAfjw7UphZZpAkKZ393YriO8=; b=Ft7y/5sPOKF2mt7cDwPB19MdJ
	WGuuHAIPkcYMyH2vQghjIeQVxj6VDT+UIlOYL4UHEoKYBMDcJjfA8EtckBRXtguBR7jE2fylFAd61
	y1LT1Z1IFSdjYiUg7u7hZY46Mm+WQN4Vp+p3t+Hqv5uCV6JmPv2mLZQai7YArKuiuEs2xc+Nr95b6
	hpxbNbmnaHcfDpvasN2I5f8mbn9F3lFC5RAGzfr+NFRLcfUP3EIKi+1Y/i4md43S7tyF6KuNM0jAr
	r2OXEIkJOgKl8t118ogqmjG5jr1E4Q+H4WFxafqE0X6CRlMsxQSNhEYSnQVGW0EnqDjKnDYmUGbQa
	XumFmHQgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzKm1-0003ek-GW; Tue, 12 Jan 2021 14:35:53 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzKlr-0003az-S1
 for linux-mtd@lists.infradead.org; Tue, 12 Jan 2021 14:35:48 +0000
X-Originating-IP: 109.220.210.98
Received: from xps13 (lfbn-tou-1-1619-98.w109-220.abo.wanadoo.fr
 [109.220.210.98]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 99CD140002;
 Tue, 12 Jan 2021 14:35:35 +0000 (UTC)
Date: Tue, 12 Jan 2021 15:35:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH 04/20] mtd: nand: ecc-bch: Stop exporting the private
 structure
Message-ID: <20210112153534.5ba93cde@xps13>
In-Reply-To: <20210111112027.7cbda0ba@xps13>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-5-miquel.raynal@bootlin.com>
 <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
 <20210111112027.7cbda0ba@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_093544_037543_04D1C13E 
X-CRM114-Status: GOOD (  23.94  )
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

SGkgQWRhbSwKCk1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3Rl
IG9uIE1vbiwgMTEgSmFuIDIwMjEKMTE6MjA6MjcgKzAxMDA6Cgo+IEhpIEFkYW0sCj4gCj4gQWRh
bSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+IHdyb3RlIG9uIFNhdCwgOSBKYW4gMjAyMSAwODo0
Njo0NCAtMDYwMDoKPiAKPiA+IE9uIFR1ZSwgU2VwIDI5LCAyMDIwIGF0IDY6MDkgUE0gTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6ICAKPiA+ID4KPiA+ID4g
VGhlIE5BTkQgQkNIIGNvbnRyb2wgc3RydWN0dXJlIGhhcyBub3RoaW5nIHRvIGRvIG91dHNpZGUg
b2YgdGhpcwo+ID4gPiBkcml2ZXIsIGFsbCB1c2VycyBvZiB0aGUgbmFuZF9iY2hfaW5pdC9mcmVl
KCkgZnVuY3Rpb25zIGp1c3Qgc2F2ZSBpdAo+ID4gPiB0byBjaGlwLT5lY2MucHJpdiBzbyBkbyBp
dCBpbiB0aGlzIGRyaXZlciBkaXJlY3RseSBhbmQgcmV0dXJuIGEKPiA+ID4gcmVndWxhciBlcnJv
ciBjb2RlIGluc3RlYWQuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiA+IC0tLSAgICAKPiA+IAo+ID4gU3RhcnRp
bmcgd2l0aCB0aGlzIGNvbW1pdDogIDNjMGZlMzZhYmViZSwgdGhlIGtlcm5lbCBlaXRoZXIgZG9l
c24ndAo+ID4gYnVpbGQgb3IgcmV0dXJucyBlcnJvcnMgb24gc29tZSBvbWFwMnBsdXMgZGV2aWNl
cyB3aXRoIHRoZSBmb2xsb3dpbmcKPiA+IGVycm9yOgo+ID4gCj4gPiAgICAgbmFuZDogZGV2aWNl
IGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4MmMsIENoaXAgSUQ6IDB4YmMKPiA+ICAgICBuYW5k
OiBNaWNyb24gTVQyOUY0RzE2QUJCREEzVwo+ID4gICAgIG5hbmQ6IDUxMiBNaUIsIFNMQywgZXJh
c2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAyMDQ4LCBPT0Igc2l6ZTogNjQKPiA+ICAgICBu
YW5kOiB1c2luZyBPTUFQX0VDQ19CQ0g4X0NPREVfSFdfREVURUNUSU9OX1NXCj4gPiAgICAgSW52
YWxpZCBFQ0MgbGF5b3V0Cj4gPiAgICAgb21hcDItbmFuZCAzMDAwMDAwMC5uYW5kOiB1bmFibGUg
dG8gdXNlIEJDSCBsaWJyYXJ5Cj4gPiAgICAgb21hcDItbmFuZDogcHJvYmUgb2YgMzAwMDAwMDAu
bmFuZCBmYWlsZWQgd2l0aCBlcnJvciAtMjIKPiA+ICAgICA4PC0tLSBjdXQgaGVyZSAtLS0KPiA+
IAo+ID4gVGhlcmUgYXJlIGZldyBjb21taXRzIHVzaW5nIGdpdCBiaXNlY3QgdGhhdCBoYXZlIGJ1
aWxkIGVycm9ycywgc28gaXQKPiA+IHdhc24ndCBwb3NzaWJsZSBmb3IgbWUgdG8gZGV0ZXJtaW5l
IHRoZSBleGFjdCBjb21taXQgdGhhdCBicm9rZSB0aGUKPiA+IEVDQy4gIElmIHRoZSBidWlsZCBm
YWlsZWQsIEkgbWFya2VkIGl0IGFzICdiYWQnIHRvIGdpdCBiaXNlY3QuICAKPiAKPiBJIGFtIHNv
cnJ5IHRvIGhlYXIgdGhhdCwgSSByZWd1bGFybHkgcmViYXNlIHdpdGggYSBtYWtlIHJ1biBiZXR3
ZWVuIGVhY2gKPiBwaWNrIGFuZCBwdXNoIG15IGJyYW5jaGVzIHRvIGEgMC1kYXkgcmVwb3NpdG9y
eSB0byBoYXZlIHJvYm90cyBjaGVjawo+IGZvciBzdWNoIGVycm9ycywgYnV0IHNvbWV0aW1lcyBJ
IGZhaWwuCj4gCj4gPiBOZXdlciBjb21taXRzIGhhdmUgcmVtZWRpZWQgdGhlIGJ1aWxkIGlzc3Vl
LCBidXQgdGhlIEludmFsaWQgRUNDCj4gPiBsYXlvdXQgZXJyb3Igc3RpbGwgZXhpc3RzIGFzIG9m
IDUuMTEtUkMyLiAgCj4gCj4gT2sgc28gbGV0J3MgZm9jdXMgb24gdGhlc2UuCj4gCj4gPiBEbyB5
b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgb24gd2hhdCBJIGNhbiBkbyB0byByZW1lZHkgdGhpcz8g
IEkgYW0KPiA+IHdpbGxpbmcgdG8gdHJ5IGFuZCB0ZXN0LiAgCj4gCj4gR2xhZCB0byBoZWFyIHRo
YXQuCj4gCj4gQ2FuIHlvdSBzaGFyZSB0aGUgTkFORCBjb250cm9sbGVyIERUIG5vZGUgeW91IGFy
ZSB1c2luZz8KPiAKPiBBbHNvLCBjYW4geW91IHBsZWFzZSBhZGQgYSBmZXcgcHJpbnRrJ3MgbGlr
ZSBiZWxvdyBhbmQgZ2l2ZSBtZSB0aGUKPiBvdXRwdXQ/CgpXaWxsIHlvdSBoYXZlIHRoZSB0aW1l
IHRvIGNoZWNrIHRoZXNlIHNvb24/IEkgYW0gcmVhZHkgdG8gaGVscCBhbmQKd291bGQgbGlrZSB0
byBmaXggaXQgYXNhcC4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
