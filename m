Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276D6CEDDA3
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 14:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRA0oJw2xOA1qkOVwlYNQIMAS35+HRn20B3lhcVIKPY=; b=gEfcPrzPD2o67f
	87gyMWxKD7YF+3h4pHdc0FPbyaIEDEdZPrs/6zeMhWJFa42WDkuYV9+1/WvSnVKbIe3Rhnncz49z5
	TWiEuEW//gwomyA5g2oiFlFM04JlmqM2wvuYzm3PxGnOLE58HZIem6A6UOycOPGDLBipHCdeRlgrW
	QOGPNLH90qXcvGJiQe0m2upIi4/hcSfgkG/N5UJo6HGz98Iui1B993uvGljG/kyZ0klSlRUmgQ7oa
	WRYWlT1ABUJ7opyXTzmQ4g5lJLewR+BiOb9zqwRT6/slIKxG/kbSmYmOVY2gMOWcffi70quL0OplL
	NUNpQUjE4ha0jIM4YOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syXyv-00000009eqi-1vtG;
	Wed, 09 Oct 2024 14:48:05 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syXys-00000009eq1-000t
	for linux-mtd@lists.infradead.org;
	Wed, 09 Oct 2024 14:48:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E81131C000A;
	Wed,  9 Oct 2024 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728485279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uk0KPCtVm1MKB9yeaaWwBQIEavfH89OFn7myYjG6PVc=;
	b=GN3QVd8vooavbeQJM+8xQxNXCaS6ufJA89s1aJ5pznYI/d9rODUASXTo6A1fhLCdmG0UOq
	TBVDSuD59Z9K2Yk5m6dYdUcncz3SrPkpsUn+2uu/1EmuMAxNZeaLrjUoy7Kkl2Hfyn8a0E
	uVexEHTaCNSVwHhN1y3rwQdmIp9dA59jofbwf8DMVE6VotDQPmUnEwM8XMvJo0OATbOnuq
	72qKnUuVzu5sjJjPEYpBDygh8W/Sr7tMX3UIXpTbAhQtZ3erd+fDDY6QAPxbQOFvwIi/go
	S0oEx3l/42HkVZJfScvSL/+fWjkfXMTgkXZUbcB7GWrNn3P6Y+BM6cGPlfxauw==
Date: Wed, 9 Oct 2024 16:47:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Steam Lin <stlin2@winbond.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Md Sadre Alam
 <quic_mdalam@quicinc.com>, Sridharan S N <quic_sridsn@quicinc.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH 2/4] mtd: spi-nand: winbond: Fix 512GW, 01GW, 01JW and
 02JW ECC information
Message-ID: <20241009164757.049d702c@xps-13>
In-Reply-To: <3345c66e-6f18-4bc7-8e52-4af7de6ff401@kontron.de>
References: <20241009125002.191109-1-miquel.raynal@bootlin.com>
	<20241009125002.191109-3-miquel.raynal@bootlin.com>
	<3345c66e-6f18-4bc7-8e52-4af7de6ff401@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_074802_504848_7C3635A1 
X-CRM114-Status: GOOD (  15.55  )
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

SGkgRnJpZWRlciwKCmZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZSB3cm90ZSBvbiBXZWQsIDkg
T2N0IDIwMjQgMTU6MzM6MTEgKzAyMDA6Cgo+IE9uIDA5LjEwLjI0IDI6NTAgUE0sIE1pcXVlbCBS
YXluYWwgd3JvdGU6Cj4gPiBUaGVzZSBmb3VyIGNoaXBzOgo+ID4gKiBXMjVONTEyR1cKPiA+ICog
VzI1TjAxR1cKPiA+ICogVzI1TjAxSlcKPiA+ICogVzI1TjAySlcKPiA+IGFsbCByZXF1aXJlIGEg
c2luZ2xlIGJpdCBvZiBFQ0Mgc3RyZW5ndGggYW5kIHRodXMgZmVhdHVyZSBhbiBvbi1kaWUKPiA+
IEhhbW1pbmctbGlrZSBFQ0MgZW5naW5lLiBUaGVyZSBpcyBubyBwb2ludCBpbiBmaWxsaW5nIGEg
LT5nZXRfc3RhdHVzKCkKPiA+IGNhbGxiYWNrIGZvciB0aGVtIGJlY2F1c2UgdGhlIG1haW4gRUND
IHN0YXR1cyBieXRlcyBhcmUgbG9jYXRlZCBpbgo+ID4gc3RhbmRhcmQgcGxhY2VzLCBhbmQgcmV0
cmlldmluZyB0aGUgbnVtYmVyIG9mIGJpdGZsaXBzIGluIGNhc2Ugb2YKPiA+IGNvcnJlY3RlZCBj
aHVuayBpcyBib3RoIHVzZWxlc3MgYW5kIHVuc3VwcG9ydGVkIChpZiB0aGVyZSBhcmUgYml0Zmxp
cHMsCj4gPiB0aGVuIHRoZXJlIGlzIDEgYXQgbW9zdCwgc28gbm8gbmVlZCB0byBxdWVyeSB0aGUg
Y2hpcCBmb3IgdGhhdCkuCj4gPiAKPiA+IFdpdGhvdXQgdGhpcyBjaGFuZ2UsIGEga2VybmVsIHdh
cm5pbmcgdHJpZ2dlcnMgZXZlcnkgdGltZSBhIGJpdCBmbGlwcy4KPiA+IAo+ID4gRml4ZXM6IDZh
ODA0ZmI3MmRlNSAoIm10ZDogc3BpbmFuZDogd2luYm9uZDogYWRkIHN1cHBvcnQgZm9yIHNlcmlh
bCBOQU5EIGZsYXNoIikKPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPiBTaWduZWQt
b2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiAgCj4gCj4g
SSBoYWQgYSBxdWljayBsb29rIGF0IHRoZSBkYXRhc2hlZXRzIGFuZCB0aGlzIHNlZW1zIGNvcnJl
Y3QgdG8gbWUuCgpUaGFua3MgYSBsb3QgZm9yIHRoZSByYXBpZCByZXZpZXchCgo+IFJldmlld2Vk
LWJ5OiBGcmllZGVyIFNjaHJlbXBmIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+CgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
