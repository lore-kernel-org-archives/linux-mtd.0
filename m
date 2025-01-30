Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99591C0218A
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jan 2025 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTncfTDyLX0GGreyqE4yUOgQj5uXC1+fBgd56hD5oaM=; b=LYm16p2wGDQ2a6
	RxyyDoVQOEIQypmYw+R+sNeWWiQqlCyPsx5p/SoTJtbpBZLON2IxPmHALVnj75UcWI2i/XruZA2Af
	ylLlCdyrfXwxLLTPo8S8mycWaj+eaX1DwOndoBZBQE5yvpPihHwxbydbOQhjxWD1MkEq6oYXF5T1/
	eFLq6lRDR17l+ES0NddIS9ZgUI6e0vSeeUYDdIm+n4ee9np01LyQ1/3W8XiZu2fC7n64lKhu6msny
	pdZezW/OR72zvCprOk1OU5N4e3mEWsylU9v3PNshB+eGi4wqxTe+4Y0GXgF+kXPUY/pP7h/vALJw9
	Mi/by2cF9Bk/sbbpYmeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdWKp-000000093VS-47Gn;
	Thu, 30 Jan 2025 15:20:03 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdWKl-000000093Ue-3f4o
	for linux-mtd@lists.infradead.org;
	Thu, 30 Jan 2025 15:20:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 535D544280;
	Thu, 30 Jan 2025 15:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738250395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mthSOymJzZU3NBmJRQSU6dHuOu/XGt2aFg8/OQCwRBI=;
	b=hlX/R9OCvuRRz9TzdoX5x2NhDsPTeQ5LsAlA0ZE7l7BchG9XBhMUjmgWYMOP8J0Ifhwxh7
	8Th0Hg2aH6+/RaAmzvGY6hY/vWhXV2lPSwbf5kEdzEO4gK4zbdywX+RwxhILhoRKy7jQM6
	fNkqlkYEMNYV78vY1/vJ5p2iThdAi4sITHhKRjz/Zw7kZSDEIU9auSE+P43fmxl/pWTpKl
	YknKucUQo5Yp/fGaN+jGImu45E4ZDlVgntE7qw32BP5fl2xwWKUHIq+laW92GXd0Y5W6O+
	9f8VfIxoCb+/pqjoO1HMw5wdyVChvXnyMre7kDdvxOVtELsPxPJ9/deli5pDSw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  "linux@treblig.org" <linux@treblig.org>,  Shen Lichuan
 <shenlichuan@vivo.com>,  Jinjie Ruan <ruanjinjie@huawei.com>,
  "u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] mtd: rawnand: cadence: support deferred prob
 when DMA is not ready
In-Reply-To: <BL3PR11MB65321B556C59C995DC05C70AA2E92@BL3PR11MB6532.namprd11.prod.outlook.com>
	(Niravkumar L. Rabara's message of "Thu, 30 Jan 2025 03:51:08 +0000")
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
	<20250116032154.3976447-2-niravkumar.l.rabara@intel.com>
	<87plkgpk8k.fsf@bootlin.com>
	<BL3PR11MB653276DFD3339ADAADC70CCFA2EE2@BL3PR11MB6532.namprd11.prod.outlook.com>
	<874j1i0wfq.fsf@bootlin.com>
	<BL3PR11MB65321B556C59C995DC05C70AA2E92@BL3PR11MB6532.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 30 Jan 2025 16:19:53 +0100
Message-ID: <87msf8z5uu.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehnihhrrghvkhhumhgrrhdrlhdrrhgrsggrrhgrsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigsehtrhgvsghlihhgrdhorhhgpdhrtghpthhtohepshhhvghnlhhitghhuhgrnhesvhhivhhordgtohhmpdhrtghpthhtoheprhhurghnjhhinhhji
 hgvsehhuhgrfigvihdrtghomhdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_072000_375644_9ADEF14B 
X-CRM114-Status: GOOD (  21.65  )
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

SGVsbG8sCgo+PiA+IERyaXZlciB3b3JrcyB3aXRob3V0IGV4dGVybmFsIERNQSBpbnRlcmZhY2Ug
aS5lLiBoYXNfZG1hPTAuCj4+ID4gSG93ZXZlciBjdXJyZW50IGRyaXZlciBkb2VzIG5vdCBoYXZl
IGEgbWVjaGFuaXNtIHRvIGNvbmZpZ3VyZSBpdCBmcm9tCj4+ID4gZGV2aWNlIHRyZWUuCj4+IAo+
PiBXaGF0PyBXaHkgYXJlIHlvdSByZXF1ZXN0aW5nIGEgRE1BIGNoYW5uZWwgZnJvbSBhIGRtYWVu
Z2luZSBpbiB0aGlzIGNhc2U/Cj4+IAo+PiBQbGVhc2UgbWFrZSB0aGUgZGlzdGluY3Rpb24gYmV0
d2VlbiB0aGUgT1MgaW1wbGVtZW50YXRpb24gKHRoZSBkcml2ZXIpIGFuZAo+PiB0aGUgRFQgYmlu
ZGluZyB3aGljaCBkZXNjcmliZSB0aGUgSFcgYW5kIG9ubHkgdGhlIEhXLgo+PiAKPgo+IExldCBt
ZSBjbGFyaWZ5IGZyb20gYmluZGluZ3MoaHcpIGFuZCBkcml2ZXIgcHJvc3BlY3RpdmUuIAo+Cj4g
QmluZGluZ3MgOi0KPiBDYWRlbmNlIE5BTkQgY29udHJvbGxlciBIVyBoYXMgTU1JTyByZWdpc3Rl
cnMsIHNvIGNhbGxlZCBzbGF2ZSBETUEgaW50ZXJmYWNlCj4gZm9yIHBhZ2UgcHJvZ3JhbW1pbmcg
b3IgcGFnZSByZWFkLiAKPiAgICAgICAgIHJlZyA9IDwweDEwYjgwMDAwIDB4MTAwMDA+LAo+ICAg
ICAgICAgICAgICAgPDB4MTA4NDAwMDAgMHgxMDAwMD47Cj4gICAgICAgICByZWctbmFtZXMgPSAi
cmVnIiwgInNkbWEiOyAvLyBzZG1hID0gIFNsYXZlIERNQSBkYXRhIHBvcnQgcmVnaXN0ZXIgc2V0
Cj4KPiBJdCBhcHBlYXJzIHRoYXQgZHQgYmluZGluZ3MgaGFzIGNhcHR1cmVkIHNkbWEgaW50ZXJm
YWNlIGNvcnJlY3RseS4KClNsYXZlIERNQSBpcyB2ZXJ5IGNvbmZ1c2luZyBiZWNhdXNlIGluIExp
bnV4IHdlIG1ha2UgdGhlIGRpc3RpbmN0aW9uCmJldHdlZW46CjEtIGV4dGVybmFsIERNQSAoZ2Vu
ZXJpYyBETUEgY29udHJvbGxlcikgZHJpdmVuCiAgIHRocm91Z2ggdGhlIGRtYWVuZ2luZSBBUEks
IHRocm91Z2ggd2hpY2ggd2UgaW50ZXJhY3QgdXNpbmcgdGhlIHNvCiAgIGNhbGxlZCBzbGF2ZSBB
UEkKMi0gcGVyaXBoZXJhbCBETUEgKERNQSBjb250cm9sbGVyIGVtYmVkZGVkIGluIHRoZSBOQU5E
IElQKSB3aGVuIHRoZXJlIGlzCiAgIG5vICJleHRlcm5hbC9nZW5lcmljIiBlbmdpbmUuIEluIHRo
aXMgY2FzZSB3ZSBjb250cm9sIERNQSB0cmFuc2ZlcnMKICAgdXNpbmcgdGhlIHJlZ2lzdGVycyBv
ZiB0aGUgTkFORCBjb250cm9sbGVyIChvciBhIG5lYXJieSByYW5nZSwgaW4KICAgdGhpcyBjYXNl
KSwgdGhlIHNhbWUgZHJpdmVyIGhhbmRsZXMgYm90aCB0aGUgTkFORCBhbmQgdGhlIERNQSBwYXJ0
LgoKWW91IHVzZWQgdGhlIHdvcmRpbmcgU2xhdmUgRE1BICgjMSksIGJ1dCBpdCBmZWVscyBsaWtl
IHlvdSBhcmUgdGFsa2luZwphYm91dCB0aGUgb3RoZXIgKCMyKS4gQ2FuIHlvdSBwbGVhc2UgY29u
ZmlybSBpbiB3aGljaCBjYXNlIHdlIGFyZT8KCj4gTGludXggRHJpdmVyOi0KPiBEcml2ZXIgY2Fu
IHJlYWQgdGhlc2Ugc2RtYSByZWdpc3RlcnMgZGlyZWN0bHkgb3IgaXQgY2FuIHVzZSB0aGUgRE1B
Lgo+IEV4aXN0aW5nIGRyaXZlciBjb2RlIGhhcyBoYXJkY29kZWQgaGFzX2RtYSB3aXRoIGFuIGFz
c3VtcHRpb24gdGhhdAo+IGFuIGV4dGVybmFsIERNQSBpcyBhbHdheXMgdXNlZCBhbmQgcmVsaWVz
IG9uIERNQSBBUEkgZm9yIGRhdGEKPiB0cmFuc2Zlci4KCkkgYW0gc29ycnkgYnV0IERNQSBBUEkg
ZG9lcyBub3QgbWVhbiBtdWNoLiBUaGVyZSBhcmUgMyBBUElzOgotIGRtYS1tYXBwaW5nLCBmb3Ig
dGhlIGJ1ZmZlcnMgYW5kIHRoZSBjb2hlcmVuY3kKLSBkbWFlbmdpbmUsIHVzZWQgaW4gY2FzZSAj
MSBvbmx5LCB0byBkcml2ZSB0aGUgZXh0ZXJuYWwgRE1BIGNvbnRyb2xsZXJzCi0gZG1hLWJ1ZiB0
byBzaGFyZSBidWZmZXJzIGJldHdlZW4gYXJlYXMgaW4gdGhlIGtlcm5lbCAob3V0IG9mIHNjb3Bl
KQoKPiBUaGFudCBpcyB3aHkgaXQgcmVxdWlyZXMgdG8gdXNlIERNQSBjaGFubmVsIGZyb20gZG1h
ZW5naW5lLgoKSWYgSSB1bmRlcnN0YW5kIGl0IHJpZ2h0LCBubyA6LSkKCkVpdGhlciB5b3UgaGF2
ZSBhbiBleHRlcm5hbCBETUEgY29udHJvbGxlciAoIzIpIG9yIGFuIGludGVybmFsIG9uZSAoIzEp
CmJ1dCBpbiB0aGlzIHNlY29uZCBjYXNlIHRoZXJlIGlzIG5vIERNQSBjaGFubmVsIHJlcXVlc3Qg
bm9yIGFueQplbmdpbmUtcmVsYXRlZCBBUEkuIE9mIGNvdXJzZSB5b3UgbmVlZCB0byB1c2UgdGhl
IGRtYS1tYXBwaW5nIEFQSSBmb3IKdGhlIGJ1ZmZlcnMuCgo+IEluIG15IHByZXZpb3VzIHJlcGx5
LCBJIHRyaWVkIHRvIGRlc2NyaWJlIHRoaXMgZHJpdmVyIHNjZW5hcmlvIGJ1dCBtYXliZSBJIG1p
eGVkIHVwLiAKPiBoYXNfZG1hPTAsIGkuZS4gYWNjZXNzaW5nIHNkbWEgcmVnaXN0ZXIgd2l0aG91
dCB1c2luZyBkbWFlbmdpbmUgaXMKPiBhbHNvIHdvcmtpbmcuCgpCdXQgZG8geW91IGhhdmUgYW4g
ZXh0ZXJuYWwgRE1BIGVuZ2luZSBpbiB0aGUgZW5kPyBPciBpcyBpdCBzcGVjaWZpYyB0bwp0aGUg
TkFORCBjb250cm9sbGVyPwoKPiBIb3dldmVyLCBjdXJyZW50bHkgdGhlcmUgaXMgbm8gb3B0aW9u
IGluIGRyaXZlciB0byBjaG9vc2UgYmV0d2VlbiB1c2luZyBkbWFlbmdpbmUgYW5kCj4gZGlyZWN0
IHJlZ2lzdGVyIGFjY2Vzcy4KPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
