Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C49EA3F38
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Feb 2026 10:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leqncpwlpwhS2sFhIiUo43WpRu1lGJ9rfA8uzquUYDY=; b=ay7pU6EAO7lDQ6
	4b1mbt+ZmqUVPgSf6mj94vKz2wXCwM5KxpufWnnXCO658ubjcKySaZ7/4tbWI14+CyiU/b3lOw0PS
	Z01XkFTwC+2wS/lmx4RK7XCobM49GfLbS1yc+s5Kdd9VjE3Dp4ef8NGOtpA+jQCyzikAbSpBWNkE4
	7tRGiSNHkjBM4ZLMoNqqHzlIr/YHDWeZXsbCXIGqlJ5TbzK1v6C5peUr58fEKH5W1G2LY5VFXcj9B
	IY/LQxCd48xSou7IRlBELrrPH7VGTdafRyfO1wfDMx2tcIRqY1DhG9wBUgqWGiVGtROEHHHr35xFr
	rvOjJ6KbTIGh9vCJ/81A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkub-0000000Gpsd-0ems;
	Tue, 10 Feb 2026 10:24:05 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkuX-0000000GpsH-3k0u
	for linux-mtd@lists.infradead.org;
	Tue, 10 Feb 2026 10:24:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 195EA1A0BD7;
	Tue, 10 Feb 2026 10:23:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D4852606BD;
	Tue, 10 Feb 2026 10:23:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5266F119D10AB;
	Tue, 10 Feb 2026 11:23:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770719038; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/Imw93ygjLS91BX1TYQywEnwPobZLvvLSfN2yGVqTa8=;
	b=NUGOt2qjI0L9+6HoPSM4LgZhESsfIeMdnzahBizANCDctJp73VqtmCphDg2+KQak+ZT4c9
	1BXOkH3PiXfSer7FuJ3PKRSSkLm7hkUNi3ehN2clm1j/fRMDaM9M09VyC/IYllnwi9bjvx
	0NE5el19DmMVvEtLAhC3a6nocVh6Mse3BVG8AERs0viJ7HfRu35w4bMiiHqeYuIA7/CeXe
	k3T5OeAda+fYO526blJDuaSKAqqg+bfb0fsTH0UkdPIZxssWnv3ui1Iy8JdHiJVRLLKLRQ
	ivt6MhCoP6ncTBQ8VbPzM8f62ifHQ/X9MJqwXa/438gYFKkpebEEkgBIJOQwJg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <p-mantena@ti.com>,  <a-dutta@ti.com>,  <linux-spi@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH RFC 0/4] mtd/spi-mem: Enable DQS support
In-Reply-To: <41f49187-e68b-4731-ac86-7c346de63173@ti.com> (Santhosh Kumar
	K.'s message of "Sat, 7 Feb 2026 01:02:12 +0530")
References: <20260205-winbond-nand-next-phy-tuning-v1-0-5e7d3976f0f1@bootlin.com>
	<41f49187-e68b-4731-ac86-7c346de63173@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 10 Feb 2026 11:23:55 +0100
Message-ID: <87pl6czykk.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_022402_063488_4331FDBF 
X-CRM114-Status: GOOD (  19.37  )
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

T24gMDcvMDIvMjAyNiBhdCAwMTowMjoxMiArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBIZWxsbyBNaXF1ZWwsCj4KPiBPbiAwNi8wMi8yNiAwMDozNiwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPj4gRm9yIGhpcyBQSFkgdHVuaW5nIHNlcmllcyBvbiB0aGUgQ2Fk
ZW5jZSBRU1BJIGNvbnRyb2xsZXIgZW1iZWRkZWQgaW4gVEkKPj4gU29DcywgU2FudGhvc2ggbmVl
ZHMgdG8gYWNjZXNzIHRoZSBhdmFpbGFiaWxpdHkgb2YgdGhlIERRUyAoZGF0YSBzdHJvYmUpCj4+
IHNpZ25hbC4gVGhpcyBpcyBhIGNoaXAgZGVwZW5kZW50IGNhcGFiaWxpdHksIHdoaWNoIG1heSBz
b21ldGltZXMgYmUKPj4gZW5hYmxlZC4KPj4gQ3JlYXRlIGEgU1BJIG1lbW9yeSBmbGFnIGZvciBp
dCwgbGV0IHRoZSBTUEkgTkFORCBjb3JlIHNldCB0aGlzIGZsYWcKPj4gd2hlbiBpdCBrbm93cyBh
Ym91dCB0aGUgY2FwYWJpbGl0eSwgYW5kIHNob3cgaG93IHRvIHVzZSBpdCBmcm9tIGEgU1BJCj4+
IGNvbnRyb2xsZXIgZHJpdmVyLgo+PiBUaGlzIGlzIGFuIGFsdGVybmF0aXZlIGF0IG5lZWRpbmcg
YSBEVCBwcm9wZXJ0eS4gUGxlYXNlIG5vdGUgdGhhdAo+PiB0aGVyZQo+PiBhcmUgYSBmZXcgYmxp
bmQgc3BvdHM6Cj4+IC0gdGhlIGxpbmUgbWF5IG5vdCBiZSB3aXJlZCAodGhpcyB3b3VsZCBiZSBz
dXJwcmlzaW5nLCBidXQgY2FuIGJlCj4+ICAgIGZsYWdnZWQgdGhpcyB0aW1lIGJ5IGEgRFQgcHJv
cGVydHkpCj4+IC0gbWFudWZhY3R1cmVyIGRyaXZlcnMgbXVzdCBlbmFibGUgdGhlIGZlYXR1cmUg
aWYgaXQgaXMKPj4gICAgYXZhaWxhYmxlIChlc3BlY2lhbGx5IGZvciBoaWdoIHNwZWVkIERUUiBt
b2RlcykKPj4gLSB0aGlzIGltcGxlbWVudGF0aW9uIGlzIHByb3Bvc2VkIGZvciBTUEkgTkFORHMg
b25seSwgaWYgdGhpcyBwcm9wb3NhbAo+PiAgICBpcyBhY2NlcHRlZCB0aGUgc2FtZSBhcHByb2Fj
aCBtdXN0IGJlIHRha2VuIGluIFNQSSBOT1IuCj4KPiBUaGFuayB5b3UgZm9yIHRoZSBzZXJpZXMh
Cj4KPiBBcyBtZW50aW9uZWQgaW4gdGhlIHR1bmluZyBzZXJpZXMsIGluIGFkZGl0aW9uIHRvIHRo
ZSBmbGFzaCBhZHZlcnRpc2luZwo+IGl0cyBEUVMgY2FwYWJpbGl0eSwgd2UgYWxzbyBuZWVkIGEg
RFQgcHJvcGVydHkgdG8gZGVzY3JpYmUgd2hldGhlciBEUVMKPiBpcyBwaHlzaWNhbGx5IGNvbm5l
Y3RlZCB0byB0aGUgY29udHJvbGxlci4gVGhpcyBjYW4gYmUgcmVwcmVzZW50ZWQgdXNpbmcKPiBl
aXRoZXIgYSAiZHFzLXdpcmVkIiBvciAiZHFzLW5vdC13aXJlZCIgcHJvcGVydHk7IHRoZSBleGFj
dCBuYW1pbmcgY2FuCj4gYmUgY2hvc2VuIGJhc2VkIG9uIHRoZSBtYWpvcml0eSBjYXNlLgo+Cj4g
V2l0aCB0aGlzIHNlcmllcywgdGhlIGNvbnRyb2xsZXIgd2lsbCBlbmFibGUgb3IgZGlzYWJsZSBE
UVMgYnkgbG9naWNhbGx5Cj4gQU5ELWluZyBib3RoIHBpZWNlcyBvZiBpbmZvcm1hdGlvbi4KCkRv
IHdlIHJlYWxseSBuZWVkIHRoaXM/CgpNeSBleHBlY3RhdGlvbiBpcyB0aGF0IHNvbWVvbmUgd2ly
aW5nIGFuIG9jdGFsIERUUiBTUEkgY2hpcCBmb3IgaGlnaApzcGVlZCBvY3RhbCBEVFIgdXNlICoq
d2lsbCoqIHJvdXRlIHRoZSBEUVMgc2lnbmFsLiBJZiB0aGlzIHNpZ25hbCBpcyBub3QKd2lyZWQs
IEkgd2FudCB0byBjb25zaWRlciB0aGlzIGFzIGEgaGFyZHdhcmUgYnVnLgoKQXMgYSByZXN1bHQs
IHRoZSBkZWZhdWx0IGNhc2Ugc2hvdWxkIGJlICJpZiB0aGVyZSBpcyBhIERRUyBzaWduYWwsIHVz
ZQppdCIuCgpJZiwgaG93ZXZlciBwZW9wbGUgY29tZSB1cCB3aXRoIG5vbiBjb3JyZWN0bHkgcm91
dGVkIGNoaXBzIGJ1dCBzdGlsbAp3YW50IGhpZ2ggZnJlcXVlbmN5IHN1cHBvcnQsIHRoZSBidXJk
ZW4gd2lsbCBiZSBvbiB0aGVtIHRvIGFzayBmb3IgYSBEVApwcm9wZXJ0eSBkZXNjcmliaW5nIGEg
bm9uIGNvbXBsaWFudCBoYXJkd2FyZSBsYXlvdXQsIGVnLiB0aGUgIm5vLWRxcyIKcHJvcGVydHku
IFlvdSBjYW4gdGFrZSB0aGlzIG9uIHlvdXIgc2hvdWxkZXJzIGlmIHlvdSB3YW50LCBidXQgSSB3
b3VsZApyZWNvbW1lbmQgbm90IHRvLCBiZWNhdXNlIHRoaXMgd2lsbCByZXF1aXJlIG1vcmUgcGF0
Y2hlcyBhbmQgYW5vdGhlcgpyb3VuZCBvZiByZXZpZXcgZnJvbSBEVCBtYWludGFpbmVycyB3aGlj
aCwgSSBiZWxpZXZlLCB3ZSBkbyBub3QgbmVlZCBhdAp0aGUgbW9tZW50LiBUaGlzIERUIHByb3Bl
cnR5IHdvdWxkIGJlIG9ydGhvZ29uYWwgYW5kIGNvdWxkIHZlcnkgZWFzaWx5CmJlIGFkZGVkIGlu
IGEgc2Vjb25kIHN0ZXAsIGtlZXBpbmcgdGhpcyBzZXJpZXMgInNtYWxsIi4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
