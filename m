Return-Path: <SRS0=QXPY=3F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43600C33CB6
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 18:46:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A4F82064C
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 18:46:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ud560Nws"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A4F82064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VnHKBK33IvAM63NNfm6HfY9rzt2Eq3K3lUQ+ydSZO6U=; b=ud560NwsFPY6dd
	PvD/llNB6sTa8oUoMRHHoZHYdL4Ej4GwUlQgk4CAJQgZdWp5Pxap/rErB3B12dFuOK9AWU1c9E/if
	2GKQr5vWW5he1dkbRmutGndWAcAdVBebEvGF35VvuHWcOWMvlUYu/aSNa3mGa/GgDgqywm70FoSTQ
	FF1hzZ1OxlE381qngw3yj7Kz0j3vKamnH+9n1k19GnYqRcSlwIpvaXrQu33rSleZL6X2yaX4kS4DV
	HRlcSd1aKvQl9lPRxoU+kHJgXIXrcBSyHM/CFfkC3zzJ0Mua1GFfuRUrR8NDW+9eQRfLpqrInmiCH
	NOovg75SjGpufgVFAvLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isA9N-0000JI-QU; Thu, 16 Jan 2020 18:45:49 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is9mo-0007S5-Oq
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2020 18:22:37 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 52FC1C0005;
 Thu, 16 Jan 2020 18:22:23 +0000 (UTC)
Date: Thu, 16 Jan 2020 19:22:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: zdhays@gmail.com
Subject: Re: [PATCH v1] mtd: rawnand: micron: don't error out if internal
 ECC is set
Message-ID: <20200116192221.49986c13@xps13>
In-Reply-To: <20200110162503.7185-1-zdhays@gmail.com>
References: <20200110162503.7185-1-zdhays@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_102231_022701_EE50E19E 
X-CRM114-Status: GOOD (  19.64  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 zhays@lexmark.com, Marco Felsch <m.felsch@pengutronix.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Piotr Sroka <piotrs@cadence.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWmFrLAoKemRoYXlzQGdtYWlsLmNvbSB3cm90ZSBvbiBGcmksIDEwIEphbiAyMDIwIDExOjI1
OjAxIC0wNTAwOgoKPiBGcm9tOiBaYWsgSGF5cyA8emRoYXlzQGdtYWlsLmNvbT4KPiAKPiBSZWNl
bnQgY2hhbmdlcyB0byB0aGUgZHJpdmVyIHJlcXVpcmUgdXNlIG9mIG9uLWRpZSBjb3JyZWN0aW9u
IGlmCj4gdGhlIGludGVybmFsIEVDQyBlbmFibGUgYml0IGlzIHNldC4gT24gc29tZSBNaWNyb24g
cGFydHMsIHRoaXMgYml0Cj4gaXMgZW5hYmxlZCBieSBkZWZhdWx0IGFuZCB0aGVyZSBpcyBubyBt
ZXRob2QgZm9yIGRpc2FibGluZyBpdC4KPiAKPiBUaGlzIGlzIGEgZmFsc2UgYXNzdW1wdGlvbiB0
aG91Z2ggYXMgdGhhdCBiaXQgYmVpbmcgZW5hYmxlZCBkb2VzIG5vdAo+IG5lY2Vzc2FyaWx5IG1l
YW4gdGhhdCB0aGUgb24tZGllIEVDQyAqaGFzKiB0byBiZSB1c2VkLiBJdCBoYXMgYmVlbgo+IHZl
cmlmaWVkIHdpdGggYSBNaWNyb24gRkFFIHRoYXQgb3RoZXIgbWV0aG9kcyBvZiBlcnJvciBjb3Jy
ZWN0aW9uIGFyZQo+IHN0aWxsIHZhbGlkIGV2ZW4gaWYgdGhpcyBiaXQgaXMgc2V0Lgo+IAo+IEhX
IEVDQyBvZmZlcnMgZ2VuZXJhbGx5IGhpZ2hlciBwZXJmb3JtYW5jZSB0aGFuIG9uLWRpZSBzbyBp
dCBpcwo+IHByZWZlcnJlZCBpbiBzb21lIHNpdHVhdGlvbnMuIFRoaXMgYWxzbyBhbGxvd3MgbXVs
dGlwbGUgTkFORCBwYXJ0cyB0bwo+IGJlIHN1cHBvcnRlZCBvbiB0aGUgc2FtZSBQQ0IgYXMgc29t
ZSBwYXJ0cyBtYXkgbm90IHN1cHBvcnQgb24tZGllCj4gZXJyb3IgY29ycmVjdGlvbi4KPiAKPiBX
aXRoIHRoYXQgaW4gbWluZCwgb25seSB0aHJvdyBhIHdhcm5pbmcgdGhhdCB0aGUgb24tZGllIGJp
dCBpcyBzZXQKPiBhbmQgYWxsb3cgdGhlIGluaXQgdG8gY29udGludWUuCgpJIGRvbid0IHRoaW5r
IEkgY2FuIHRha2UgdGhpcyBwYXRjaCBhcy1pcy4gV2UgbXVzdCBmaW5kIGEgcmVsaWFibGUgd2F5
CnRvIGRpc2NyaW1pbmF0ZSBNaWNyb24gcGFydHMgZmVhdHVyZXMuIElmIHdlIGNhbm5vdCAoSSB0
aGluayB3ZSBjYW4ndApiZWZvcmUgb2YgdGhlIGVuZGxlc3MgbGlzdCBvZiBidWdzIHRoZXkgaGF2
ZSBpbnRyb2R1Y2VkIHdpdGhvdXQKZG9jdW1lbnRpbmcgdGhlbSksIHRoZSBiZXN0IHdheSBpcyB0
byBidWlsZCBhIHN0YXRpYyB0YWJsZS4KCj4gCj4gU2lnbmVkLW9mZi1ieTogWmFrIEhheXMgPHpk
aGF5c0BnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWljcm9u
LmMgfCA0ICstLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21pY3Jvbi5j
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9taWNyb24uYwo+IGluZGV4IDU2NjU0MDMwZWM3
Zi4uZWM0MGM3NjQ0M2JlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRf
bWljcm9uLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21pY3Jvbi5jCj4gQEAg
LTQ1NSw5ICs0NTUsNyBAQCBzdGF0aWMgaW50IG1pY3Jvbl9uYW5kX2luaXQoc3RydWN0IG5hbmRf
Y2hpcCAqY2hpcCkKPiAgCj4gIAlpZiAob25kaWUgPT0gTUlDUk9OX09OX0RJRV9NQU5EQVRPUlkg
JiYKPiAgCSAgICBjaGlwLT5lY2MubW9kZSAhPSBOQU5EX0VDQ19PTl9ESUUpIHsKPiAtCQlwcl9l
cnIoIk9uLWRpZSBFQ0MgZm9yY2VmdWxseSBlbmFibGVkLCBub3Qgc3VwcG9ydGVkXG4iKTsKPiAt
CQlyZXQgPSAtRUlOVkFMOwo+IC0JCWdvdG8gZXJyX2ZyZWVfbWFudWZfZGF0YTsKPiArCQlwcl93
YXJuKCJXQVJOSU5HOiBPbi1kaWUgRUNDIGZvcmNlZnVsbHkgZW5hYmxlZCwgdXNlIGNhdXRpb24g
d2l0aCBvdGhlciBtZXRob2RzXG4iKTsKPiAgCX0KPiAgCj4gIAlpZiAoY2hpcC0+ZWNjLm1vZGUg
PT0gTkFORF9FQ0NfT05fRElFKSB7CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
