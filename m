Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4050EC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 13:48:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE84761350
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 13:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE84761350
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cC/jvNC1yHSXpj9ATBck0gnyxhk4+A16ERxjWsQ0NjE=; b=e7aJ9BSYM/kH5d
	nMPAbkT6p2Zxt+fRBjDuTBFcJsoGKhdO3NcJPMite9Ss+mTwRLr9mNkkN141nqbGsEg/FJ5Tc498S
	xAqlu2sCot8fhHtI1BRArovjbNYN7uOMNuOqMiZJOB+NOTDCspJqnyitRXeCuoJUvNK66ukFpYKLF
	7yJPESpJtqsg0sSQGwp12cFBkU41K0AmbUhhIgrIgwo3PX70cf+WErThYu35FD0G3UC96uwWkXDtv
	MNnfPW1XFn+jjQQ+Z+jjXJFCZNzcUejMaIkgKww0NLMo/SsnUI+RH+rnGqVI8T/+xfDzFCwGkhnsX
	T3rm9mUrs5OreeqWM6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnLHf-004wjS-Bh; Wed, 17 Nov 2021 13:47:31 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnLHV-004wg6-R2
 for linux-mtd@lists.infradead.org; Wed, 17 Nov 2021 13:47:23 +0000
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 43FB6E0003;
 Wed, 17 Nov 2021 13:47:16 +0000 (UTC)
Date: Wed, 17 Nov 2021 14:47:15 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] mtd: rawnand: fsmc: Force to use 8 bits access when
 expected
Message-ID: <20211117144715.731a9856@bootlin.com>
In-Reply-To: <20211112163859.23a2487a@xps13>
References: <20211112143855.2678989-1-herve.codina@bootlin.com>
 <20211112143855.2678989-3-herve.codina@bootlin.com>
 <20211112163859.23a2487a@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_054722_078408_AA862EEF 
X-CRM114-Status: GOOD (  17.70  )
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

SGksCgpPbiBGcmksIDEyIE5vdiAyMDIxIDE2OjM4OjU5ICswMTAwCk1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIaSBIZXJ2w6ksCj4gCj4gaGVydmUu
Y29kaW5hQGJvb3RsaW4uY29tIHdyb3RlIG9uIEZyaSwgMTIgTm92IDIwMjEgMTU6Mzg6NTMgKzAx
MDA6Cj4gCj4gPiBTb21lIGRhdGEgdHJhbnNmZXJzIGFyZSBleHBlY3RlZCBvbiA4IGJpdHMgYnkg
dGhlIG5hbmQgY29yZS4KPiA+IFRoZSBmc21jIGRyaXZlciBkaWQgbm90IGNoZWNrIHRoaXMgY29u
c3RyYWludCBhbmQgdGhlc2UgdHJhbnNmZXJzCj4gPiBjYW4gYmUgZG9uZSBvbiAzMiBiaXRzIGRl
cGVuZGluZyBvbiBidWZmZXIgYWxpZ25tZW50IGFuZCB0cmFuc2ZlcnMKPiA+IGRhdGEgc2l6ZS4K
PiA+IAo+ID4gVGhpcyBwYXRjaCBlbnN1cmVzIHRoYXQgdGhlc2UgdHJhbnNmZXJzIHdpbGwgYmUg
OGJpdHMgdHJhbnNmZXJzIGluCj4gPiBhbGwgY2FzZXMuICAKPiAKPiBJIGJlbGlldmUgdGhlcmUg
aXMgYSBtaXN1bmRlcnN0YW5kaW5nIGhlcmU6IE5BTkQgYnVzZXMgLWJldHdlZW4gdGhlCj4gTkFO
RCBjb250cm9sbGVyIGFuZCB0aGUgTkFORCBjaGlwLSBhcmUgZWl0aGVyIDgtYml0IG9yIDE2LWJp
dCB3aWRlIGFuZAo+IHRoZSBhbW91bnQgb2YgYnl0ZXMgdGhhdCB5b3Ugd2lsbCByZXRyaWV2ZSBw
ZXIgcmVnaXN0ZXIgcmVhZCBpcyBub3QKPiByZWxhdGVkIHRvIGl0Lgo+IAo+IFdoZW4gdGhlIGNv
bnRyb2xsZXIgc3VwcG9ydHMgMTYtYml0IGFjY2Vzc2VzLCB0aGVyZSBhcmUgY2VydGFpbgo+IG9w
ZXJhdGlvbnMgdGhhdCBtdXN0IGJlIHBlcmZvcm1lZCB1c2luZyBvbmx5IHRoZSBsb3dlc3QgOCBi
aXRzIG9mIHRoZQo+IE5BTkQgYnVzLCBzdWNoIGFzIHJlYWRpbmcgYSBzdGF0dXMgWzFdLiBJbiB0
aGlzIGNhc2UsIHRoZSBjb250cm9sbGVyCj4gbXVzdCBoYXZlIGEgd2F5IHRvIGRpc2FibGUgdGhl
IDE2LWJpdCBtb2RlIHRlbXBvcmFyaWx5LiBTZWUgWzJdIGFuZCBbM10KPiBmb3IgYW4gZXhhbXBs
ZS4gUmVhZGluZyB3aXRoIHJlYWRiKCkgb3IgcmVhZGwoKSB3aWxsIElNSE8gbm90IGltcGFjdCB0
aGUKPiBhbW91bnQgb2YgZGF0YSBsaW5lcyB1c2VkIGZvciB0aGUgb3BlcmF0aW9uLgo+IAoKSW5k
ZWVkLCBJIG1pc3VuZGVyc3Rvb2QgdGhlIGZvcmNlXzhiaXQgdXNhZ2UuClRoaXMgcGF0Y2ggaXMg
bm90IG5lZWRlZCBhbmQgd2lsbCBiZSBzaW1wbHkgcmVtb3ZlZCBpbiB2MiBzZXJpZXMuCgpUaGFu
a3MsCkhlcnbDqQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
