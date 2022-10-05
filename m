Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941B1C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Oct 2022 07:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fbMDwCk6wAbHb2e2uYCrS16thl4UQeaxXaq2GmI50x0=; b=VEdAEPsf9fhRce
	1U7TxY02tfz0mMrz7U17KB/oHiH/u5i29Ic3gVMj/nCD5pdKCtL5l4xvaug45CeDRtq0THaWS7MfI
	4FfJCw3RM1Xf/7Ou6zsVXVskB6uLYvhlRkt6ITLfUX8LY1pvx7LM7I9FD+YrRb48gpdzvj5u2lssC
	zUDNQGWOr2bAxbaA5/3kwCt+MGImk8wF5motuTwn0zmqJSkllQcs1jM8/c0Plq7WQuTLoFXSByWZS
	MhEx43bRX6BGkhQAwCEWftosUqBnJ9wX7J5/HxlGFnOw9jjQF92FJIWF6HBBN2EVKEhvTzJp1l1WE
	BRCM9VKPOcZI+rrVLtzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofyvt-00CpSL-5L; Wed, 05 Oct 2022 07:35:09 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofyvo-00CpMb-NA
	for linux-mtd@lists.infradead.org; Wed, 05 Oct 2022 07:35:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8A30BC000E;
	Wed,  5 Oct 2022 07:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664955300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o51MC15nrQ0rN7I4frR2hsdNrjM5T/AKcMbBeqGeDko=;
	b=QX0S6gyDklGJzTclQHwqaNJvxme+8iqKh1ZDLop4A/edupHQ9noGXLrn/hUlidxPcMknKH
	bZ+JILYLs2XUSYhnd9MbHCt7AH2NkKsj3QSnMR6bs5pVT0mKHlKkvORMiK7jnntDwaE2fU
	rmgj38dSHeUD+CXwmNMXY4aj7DkcrCKcGDwS3XjgcMYgjRORY3jPr9Y8Y2E/Bnihv8+h29
	xOq+SK3tAHi0F5nSqoGHD1Tj5RgcPNqyWAKIlUzQYfBhUFwRK34+6XoQn5NkGO4aCAvoYB
	fjmJpmIOAbbtUtn0038U/ncMMLQwHUbT7l5YYtik++LBY8TQSN49og0EM6NV5A==
Date: Wed, 5 Oct 2022 09:34:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>, Tony O'Brien
 <Tony.OBrien@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: Use correct logic for
 nand-keep-config
Message-ID: <20221005093457.466e02a4@xps-13>
In-Reply-To: <55e5672f-b3e5-4c14-b5e9-01cdde2f4472@alliedtelesis.co.nz>
References: <20220927024728.28447-1-chris.packham@alliedtelesis.co.nz>
	<e234270c-4169-bddb-5c2d-9c6ac48467b6@alliedtelesis.co.nz>
	<20221004120212.6389b96a@xps-13>
	<953cbfc0-1ac0-9bc8-155f-57e1cd37dc70@alliedtelesis.co.nz>
	<55e5672f-b3e5-4c14-b5e9-01cdde2f4472@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_003505_197725_4FE1026F 
X-CRM114-Status: GOOD (  20.57  )
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

SGkgQ2hyaXMsCgpDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubnogd3JvdGUgb24gVHVl
LCA0IE9jdCAyMDIyIDIxOjIxOjM3CiswMDAwOgoKPiBPbiA1LzEwLzIyIDA4OjQxLCBDaHJpcyBQ
YWNraGFtIHdyb3RlOgo+ID4KPiA+IE9uIDQvMTAvMjIgMjM6MDIsIE1pcXVlbCBSYXluYWwgd3Jv
dGU6ICAKPiA+PiBIaSBDaHJpcywKPiA+Pgo+ID4+IENocmlzLlBhY2toYW1AYWxsaWVkdGVsZXNp
cy5jby5ueiB3cm90ZSBvbiBUdWUsIDI3IFNlcCAyMDIyIDAyOjU0OjQwCj4gPj4gKzAwMDA6Cj4g
Pj4gIAo+ID4+PiBPbiAyNy8wOS8yMiAxNTo0NywgQ2hyaXMgUGFja2hhbSB3cm90ZTogIAo+ID4+
Pj4gRnJvbTogVG9ueSBPJ0JyaWVuIDx0b255Lm9icmllbkBhbGxpZWR0ZWxlc2lzLmNvLm56Pgo+
ID4+Pj4KPiA+Pj4+IE9yaWdpbmFsbHkgdGhlIGFic2VuY2Ugb2YgdGhlIG1hcnZlbGwsbmFuZC1r
ZWVwLWNvbmZpZyBwcm9wZXJ0eSBjYXVzZWQKPiA+Pj4+IHRoZSBzZXR1cF9kYXRhX2ludGVyZmFj
ZSBmdW5jdGlvbiB0byBiZSBwcm92aWRlZC4gSG93ZXZlciB3aGVuCj4gPj4+PiBzZXR1cF9kYXRh
X2ludGVyZmFjZSB3YXMgbW92ZWQgaW50byBuYW5kX2NvbnRyb2xsZXJfb3BzIHRoZSBsb2dpYyB3
YXMKPiA+Pj4+IHVuaW50ZW50aW9uYWxseSBpbnZlcnRlZC4gVXBkYXRlIHRoZSBsb2dpYyBzbyB0
aGF0IG9ubHkgaWYgdGhlCj4gPj4+PiBtYXJ2ZWxsLG5hbmQta2VlcC1jb25maWcgcHJvcGVydHkg
aXMgcHJlc2VudCB0aGUgYm9vdGxvYWRlciBOQU5EIAo+ID4+Pj4gY29uZmlnCj4gPj4+PiBrZXB0
Lgo+ID4+Pj4KPiA+Pj4+IEZpeGVzOiA3YTA4ZGJhZWRkMzYgKCJtdGQ6IHJhd25hbmQ6IE1vdmUg
LT5zZXR1cF9kYXRhX2ludGVyZmFjZSgpIAo+ID4+Pj4gdG8gbmFuZF9jb250cm9sbGVyX29wcyIp
Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBUb255IE8nQnJpZW4gPHRvbnkub2JyaWVuQGFsbGllZHRl
bGVzaXMuY28ubno+Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5w
YWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+Cj4gPj4+PiAtLS0KPiA+Pj4+Cj4gPj4+PiBOb3Rl
czoKPiA+Pj4+IMKgwqDCoMKgwqAgSSB0aGluayB0aGlzIGlzIGEgYnVnIHRoYXQncyBiZWVuIGx1
cmtpbmcgZm9yIDQgeWVhcnMgb3Igc28uIAo+ID4+Pj4gSSdtIG5vdAo+ID4+Pj4gwqDCoMKgwqDC
oCBzdXJlIHRoYXQncyBwYXJ0aWN1bGFybHkgbG9uZyBpbiB0aGUgbGlmZSBvZiBhbiBlbWJlZGRl
ZCAKPiA+Pj4+IGRldmljZSBidXQgaXQKPiA+Pj4+IMKgwqDCoMKgwqAgZG9lcyBtYWtlIG1lIHdv
bmRlciBpZiB0aGVyZSBoYXZlIGJlZW4gb3RoZXIgYnVnIHJlcG9ydHMgCj4gPj4+PiBhYm91dCBp
dC4KPiA+Pj4+IMKgwqDCoMKgwqAgwqDCoMKgwqDCoCBXZSBub3RpY2VkIHRoaXMgYmVjYXVzZSB3
ZSBoYWQgYSBib290bG9hZGVyIHRoYXQgdXNlZCAKPiA+Pj4+IG1heGVkIG91dCBOQU5ECj4gPj4+
PiDCoMKgwqDCoMKgIHRpbWluZ3Mgd2hpY2ggbWFkZSB0aGUgdGltZSBpdCB0b29rIHRoZSBrZXJu
ZWwgdG8gZG8gYW55dGhpbmcgCj4gPj4+PiBvbiB0aGUKPiA+Pj4+IMKgwqDCoMKgwqAgZmlsZSBz
eXN0ZW0gbG9uZ2VyIHRoYW4gd2UgZXhwZWN0ZWQuICAKPiA+Pj4gSSB0aGluayB0aGVyZSBtaWdo
dCBiZSBhIHNpbWlsYXIgbG9naWMgaW52ZXJzaW9uIGJ1ZyBpbgo+ID4+PiBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9kZW5hbGkuYyBidXQgSSBsYWNrIHRoZSBhYmlsaXR5IHRvIHRlc3QgZm9yIHRoYXQK
PiA+Pj4gcGxhdGZvcm0uICAKPiA+PiBBZ3JlZWQsIHRoZSBkZW5hbGkgZHJpdmVyIGhhcyB0aGUg
c2FtZSBpc3N1ZS4gQ291bGQgeW91IHBsZWFzZSBzZW5kIGEKPiA+PiBwYXRjaD8gIAo+ID4gU3Vy
ZSBhbHRob3VnaCBpdCdsbCBiZSBjb21waWxlIHRlc3RlZCBvbmx5LiAgCj4gQWN0dWFsbHkgbG9v
a3MgbGlrZSBpdCB3YXMgYWxyZWFkeSBmaXhlZCBpbiBjb21taXQgZDMxMWUwYzI3YjhmICgibXRk
OiAKPiByYXduYW5kOiBkZW5hbGk6IGdldCAtPnNldHVwX2RhdGFfaW50ZXJmYWNlKCkgd29ya2lu
ZyBhZ2FpbiIpLgoKT2ssIHBlcmZlY3QuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
