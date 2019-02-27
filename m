Return-Path: <SRS0=gTFy=RC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2ADDC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 13:56:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F22B20C01
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 13:56:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sYhYBQlz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F22B20C01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVlHUsDefO1pqiJprj4fm5hxW+6GJK3NGlCq/gMiPhM=; b=sYhYBQlzXTMYJ8
	P3ZL3rpyVhjng73dPcz+OZ2EfOO71RUpNBcJXNqan6m71HNLpqaJdxnFw/ht2CkRPW7SHCqlXIE1j
	wRKeH3u9NBy2a2LSSaPuIexBF2/gz14eKJqFl3pp49GFHgf2fTuoTMnYo3e7v5R5/aRXqV/K4AVWU
	WNmdakFJt3/5nRMiFzFq8KPbSPwrdF0b81+y3DZ3KkzTFxFllAdtWzK8ATK0HxPmgCiwqnx3kNM5Y
	7+h04ShYuYg5DWEi6yYaQLnzcFpxK9QAMNTSCqwdmI4FOhzWqX+rWMcjPaJhe1QhMfvHsd1W92TOE
	ajJwOLykGG8miLzaurKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyzhG-00013E-Fn; Wed, 27 Feb 2019 13:56:30 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyzh7-0000vI-0l; Wed, 27 Feb 2019 13:56:23 +0000
X-Originating-IP: 90.88.147.150
Received: from xps13 (aaubervilliers-681-1-27-150.w90-88.abo.wanadoo.fr
 [90.88.147.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 777E040008;
 Wed, 27 Feb 2019 13:56:08 +0000 (UTC)
Date: Wed, 27 Feb 2019 14:56:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [RFC PATCH 03/27] mtd: nand: Introduce the ECC engine abstraction
Message-ID: <20190227145607.24e49014@xps13>
In-Reply-To: <20190225195543.27799e77@kernel.org>
References: <20190221100216.25255-1-miquel.raynal@bootlin.com>
 <20190221100216.25255-4-miquel.raynal@bootlin.com>
 <20190225195543.27799e77@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_055621_209034_69A99F42 
X-CRM114-Status: GOOD (  14.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4gd3JvdGUg
b24gTW9uLCAyNSBGZWIgMjAxOQoxOTo1NTo0MyArMDEwMDoKCj4gT24gVGh1LCAyMSBGZWIgMjAx
OSAxMTowMTo1MiArMDEwMAo+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+IHdyb3RlOgo+IAo+ID4gKwo+ID4gKy8qKgo+ID4gKyAqIHN0cnVjdCBuYW5kX2VjY19lbmdp
bmVfb3BzIC0gR2VuZXJpYyBFQ0MgZW5naW5lIG9wZXJhdGlvbnMKPiA+ICsgKgo+ID4gKyAqIEBp
bml0X2N0eDogZ2l2ZW4gYSBkZXNpcmVkIHVzZXIgY29uZmlndXJhdGlvbiBmb3IgdGhlIHBvaW50
ZWQgTkFORCBkZXZpY2UsCj4gPiArICogICAgICAgICAgICByZXF1ZXN0cyB0aGUgRUNDIGVuZ2lu
ZSBkcml2ZXIgdG8gc2V0dXAgYSBjb25maWd1cmF0aW9uIHdpdGgKPiA+ICsgKiAgICAgICAgICAg
IHZhbHVlcyBpdCBzdXBwb3J0cy4KPiA+ICsgKiBAY2xlYW51cF9jdHg6IGNsZWFuIHRoZSBjb250
ZXh0IGluaXRpYWxpemVkIGJ5IEBpbml0X2N0eC4KPiA+ICsgKiBAcHJlcGFyZV9pb19yZXE6IGlz
IGNhbGxlZCBiZWZvcmUgcmVhZGluZy93cml0aW5nIGEgcGFnZSB0byBwcmVwYXJlIHRoZSBJL08K
PiA+ICsgKiAgICAgICAgICAgICAgICAgIHJlcXVlc3QgdG8gYmUgcGVyZm9ybWVkIHdpdGggRUND
IGNvcnJlY3Rpb24uCj4gPiArICogQGZpbmlzaF9pb19yZXE6IGlzIGNhbGxlZCBhZnRlciByZWFk
aW5nL3dyaXRpbmcgYSBwYWdlIHRvIHRlcm1pbmF0ZSB0aGUgSS9PCj4gPiArICogICAgICAgICAg
ICAgICAgIHJlcXVlc3QgYW5kIGVuc3VyZSBwcm9wZXIgRUNDIGNvcnJlY3Rpb24uCj4gPiArICov
Cj4gPiArc3RydWN0IG5hbmRfZWNjX2VuZ2luZV9vcHMgeyAgCj4gCj4gV2UgbWlnaHQgd2FudCB0
byBhZGQgYQo+IAo+IAl2b2lkICgqcHV0X2VuZ2luZSkoc3RydWN0IG5hbmRfZWNjX2VuZ2luZSAq
ZW5naW5lKTsKPiAKPiBoZXJlIGlmIHdlIHdhbnQgdGhlIG5hbmRkZXYgY2xlYW51cCBwYXRoIHRv
IGJlIGdlbmVyaWMuCj4gVGhpcyBob29rIHdvdWxkIGJlIGltcGxlbWVudGVkIGJ5IGRyaXZlcnMg
d2hlcmUgdGhlIEVDQyBlbmdpbmUgb2JqZWN0IGlzCj4gcmVmY291bnRlZCAodHlwaWNhbGx5IHRo
ZSBjYXNlIGZvciBIVyBFQ0MgZW5naW5lcyBzaGFyZWQgYnkgdGhlIHJhdyBOQU5ECj4gY29udHJv
bGxlciBhbmQgdGhlIFNQSSBjb250cm9sbGVyKS4KPiAKPiBBbHRlcm5hdGl2ZWx5LCB5b3UgY2Fu
IGp1c3QgYWRkIG9uZSBuYW5kX3B1dF94eHhfZWNjX2VuZ2luZSgpIGZ1bmMgcGVyCj4gZW5naW5l
IGNsYXNzIChTVywgb25kaWUgYW5kIEhXKS4KCkNhbid0IHRoaXMgYmUgaGFuZGxlZCBpbiB0aGUg
aW5pdC9jbGVhbnVwX2N0eCgpIHBhdGggZGlyZWN0bHk/CgpGdXJ0aGVybW9yZSBpZiB0aGlzIGlz
IGp1c3QgYSBob29rIHRvIGRvIHJlZmVyZW5jZSBjb3VudGluZy4KCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
