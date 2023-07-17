Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145AAEB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 16:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3BLNsqvshENYQt/MOaZVlmDv1EhxnmJDYSlbpZfm6A=; b=Mvxu8tee+LSMeY
	0lHO8x36q+MCBGgRGSCb6C7RtlQV+fDwbADYd5AxSIhBiEiUJQuA8w0rZnsszy6RAkysWVb0J+cPP
	P6BreXj4PndwooMnchfVwYfJmG6Ta4/lv6jSWGLlPVZXUntDQcTfhsP1QyxGbbKFzjCl5c9s4cnaw
	p3SGGheecrTqTqBAEgzZxM97pwf2vq1l/qbI0UY44JgmLnLxWzth6tMO0X8mqgPdAhVbTV6+pE+L9
	MYMqKXm7PXq3/cdOqRZgrdqgeqOxlUQtY+FAofTYJXRO6i4gxr1mjs76MgtRYv2nHOCrK5JYk6ZbJ
	Rmgk4gbW16SkphOaCsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLRDa-004Yu5-10;
	Mon, 17 Jul 2023 16:37:02 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLRDW-004Yr9-0Q
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 16:36:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A76620004;
	Mon, 17 Jul 2023 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689611810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ixxmggQcHOQoObT0Q1aqAXVMahJLMMF50h5hpShqe0=;
	b=puyqSvgz+Fa7II6HYjcwNPVuRuIcE1eEcI97oAfES2lGeePzdlCi8qAirL29UBIDoCMiTg
	6wRRMXYNXnZPbWudb6Gqevf8UyjJ3lW/HF4U99mPUnLoaxJEOz+3p10UZ+K8n7AFLwJzcu
	WnQf/5crhzlfne02P07ZQlS2NyPKx5tbgl6+FT/fVUj7a2tAfQp9blZTlLOrWsxJmu3v8+
	Nt7ZaddxL9Z07E6L3jO2E/3mQwhmWXvqq5cpu20aK6SDj6RNDn0xYql41sLd+NN2F2Kk7L
	Xar/PEokeE8dt7Dkj8k4p0Iif74DzCg6yf9eo5Af7GeNUUS/zCWewVZwiLlj4g==
Date: Mon, 17 Jul 2023 18:36:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, JaimeLiao
 <jaimeliao.tw@gmail.com>, Alexander Shiyan <eagle.alexander923@gmail.com>,
 Domenico Punzo <dpunzo@micron.com>, Bean Huo <beanhuo@micron.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: Support for sequential cache reads
Message-ID: <20230717183645.32ef90b0@xps-13>
In-Reply-To: <yw1x351mznr0.fsf@mansr.com>
References: <20230112093637.987838-1-miquel.raynal@bootlin.com>
	<20230112093637.987838-4-miquel.raynal@bootlin.com>
	<yw1xfs6j4k6q.fsf@mansr.com>
	<20230716174917.3a9ca7a7@xps-13>
	<yw1x7cqzzr4d.fsf@mansr.com>
	<20230717091900.52ed815a@xps-13>
	<yw1x351mznr0.fsf@mansr.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_093658_510110_3C69DAAD 
X-CRM114-Status: GOOD (  19.48  )
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

SGkgTcOlbnMsCgptYW5zQG1hbnNyLmNvbSB3cm90ZSBvbiBNb24sIDE3IEp1bCAyMDIzIDE0OjEx
OjMxICswMTAwOgoKPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3
cml0ZXM6Cj4gCj4gPiBTbywgSSBzaG91bGQgaGF2ZSBkb25lIHRoYXQgZWFybGllciBidXQsIGNv
dWxkIHlvdSBwbGVhc2Ugc2xvdyB0aGUKPiA+IHdob2xlIG9wZXJhdGlvbiBkb3duLCBqdXN0IHRv
IHNlZSBpZiB0aGVyZSBpcyBzb21ldGhpbmcgd3Jvbmcgd2l0aCB0aGUKPiA+IHRpbWluZ3Mgb3Ig
aWYgd2Ugc2hvdWxkIGxvb2sgaW4gYW5vdGhlciBkaXJlY3Rpb24uCj4gPgo+ID4gTWF5YmUgeW91
IGNvdWxkIGFkZCBhIGJvb2xlYW4gdG8gZmxhZyBpZiB0aGUgbGFzdCBDTUQgd2FzIGEKPiA+IFJF
QURDQUNIRVNFUSwgUkVBRENBQ0hFU1RBUlQgb3IgUkVBRENBQ0hFRU5ELCBhbmQgaWYgdGhlIGZs
YWcgaXMKPiA+IHRydWUsIHBsZWFzZSBnZXQgdGhlIGppZmZpZXMgYmVmb3JlIGFuZCBhZnRlciBl
YWNoIHdhaXRyZHkgYW5kCj4gPiBkZWxheV9ucy4gRmluYWxseSwgcGxlYXNlIHByaW50IHRoZSBl
eHBlY3RlZCBkZWxheSBhbmQgdGhlIGFjdHVhbCBvbmUKPiA+IGFuZCBjb21wYXJlIHRvIHNlZSBp
ZiBzb21ldGhpbmcgd2FzIHRvbyBmYXN0IGNvbXBhcmVkIHRvIHdoYXQgd2UKPiA+IGV4cGVjdGVk
LiAgCj4gCj4gQmV0d2VlbiB3aGljaCBwb2ludHMgZXhhY3RseSBzaG91bGQgdGhlIGRlbGF5IGJl
IG1lYXN1cmVkPyAgQWxzbywgdGhlcmUKPiBpcyBubyBjb21tYW5kIGNhbGxlZCBSRUFEQ0FDSEVT
VEFSVC4gIERpZCB5b3UgbWVhbiBSRUFEU1RBUlQgb3IKPiBzb21ldGhpbmcgZWxzZT8KClllYWgs
IHdoYXRldmVyIGNvbW1hbmQgaXMgc3BlY2lmaWMgdG8gc2VxdWVudGlhbCBjYWNoZSByZWFkczoK
aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyNMMTIxOApodHRwczovL2VsaXhpci5ib290bGluLmNvbS9s
aW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jI0wxMjI4
Cgo+ID4gSW4gYSBzZWNvbmQgdGVzdCwgeW91IGNvdWxkIHNpbXBseSBhZGQgYSB1ZGVsYXkoNTAp
OyBhdCB0aGUgZW5kIG9mCj4gPiBvbWFwX25hbmRfZXhlY19pbnN0cigpLiAgCj4gCj4gVGhhdCBk
aWRuJ3QgaGVscC4KClJlYWxseT8gVGhhdCdzIGRpc2FwcG9pbnRpbmcgKHRoYW5rcyBhIGxvdCBm
b3IgeW91ciBxdWljayBmZWVkYmFjaykuCgpMZXQncyBzZWUgd2hhdCB0aGUgbWVhc3VyZW1lbnRz
IHdpbGwgcmV0dXJuLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
