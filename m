Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83682C54E58
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2h72q8Ngwm8r5b5IKDZpL2Gyv/94TPGHRiwdU7U0qWY=; b=aB+nwmD6mWlwWm
	zLXwNtBtHhDCpLVTuVdOcTSDIe0lKaj9+XpQ8ayHL79VJO4DNXsVqbPkG7hWYNibfkLuwwkTy4IHJ
	pabu4zprHuvT7ovweN/NZUUzQ/q3JjAu+6VO06g9qrR48Frk1QLUm/+SjnsqyqaGtZ7Bp2dGPsSWg
	iI9oju3GfOimkguIMloUIAJC7w8qI8ZjgT2LKlhxczlNUabhyflry6SwQHs1z0oDMDtw7GzEriPR5
	P+NrcNkhXj+tyxTiRVLpBTK+4/50F5HOeJAPqi6pRfakaXRDrZh7vHdt3sNdvUlXIobV6jUMmoK8u
	U+oEKtjdTjE2BIyYRP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1romZa-00000000aRt-2glz;
	Mon, 25 Mar 2024 15:49:18 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1romZX-00000000aPJ-2fcI
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 15:49:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57EAF1C0008;
	Mon, 25 Mar 2024 15:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711381749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6xI3oxa/7z/SaAzm5xpMub07mC43yyFXlKvi9b83S68=;
	b=B4DoWmJvW09wQ2VZhqZEJHEeiEapLvVpjavzV7e34afNsVTIQE6NnMd5XDeIfE4p/5NayX
	J1Ym22QC+UelmsfIuox1FKMj6+V8fY2GxkMhP8iI4Ii+ZeOAooRLf9ab5/fO4aOJTcpR7J
	MaukblEd1oZFBBpLk/172eFjrLoERtPmZ0CDeJtHTcW/xAqWfXSbkwVs/3tod1WPdyzBab
	CTbhehMgKJbliHIgVbz+4FTKSMeRQP6RsHKWVdIETB+bA0wk4m5MU7IbTMquGMWr7F/bk9
	s0GGRZ8ym5ij9JKmT8/UV344PBIgSSFXNxrBv1/YZg17lGZiqbvtfLzkOZU0SA==
Date: Mon, 25 Mar 2024 16:49:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: core: Align comment with an action in
 mtd_otp_nvmem_add()
Message-ID: <20240325164907.0c8a89fb@xps-13>
In-Reply-To: <ZgGYDMzAWEaPkAXh@smile.fi.intel.com>
References: <20240325151150.3368658-1-andriy.shevchenko@linux.intel.com>
	<ZgGYDMzAWEaPkAXh@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_084915_836147_835C0CD9 
X-CRM114-Status: GOOD (  11.22  )
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

SGkgQW5keSwKCmFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZSBvbiBNb24s
IDI1IE1hciAyMDI0IDE3OjI4OjEyCiswMjAwOgoKPiBPbiBNb24sIE1hciAyNSwgMjAyNCBhdCAw
NToxMTo1MFBNICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gPiBUaGUgY29tbWVudCBp
cyByZWxhdGVkIHRvIHRoZSBub24tZXJyb3IgY2FzZSwgbWFrZSBpdCBtb3JlIGNsZWFyCj4gPiBi
eSBpbnZlcnRpbmcgdGhlIGNvbmRpdGlvbi4gSXQgYWxzbyBtYWtlcyBjb2RlIG5lYXRlciBhdCB0
aGUgZW5kLiAgCj4gCj4gSnVzdCByZWFsaXplZCB0aGF0IGV2ZW4gc2VtYW50aWNhbGx5IGl0J3Mg
YmV0dGVyIGFzIGl0J3MgZG9uZSBoZXJlCj4gc2luY2Ugd2UgaGF2ZSBhbiBlcnJvciBwYXRoIGZy
b20gd2hpY2ggd2UgZXhjZXB0aW9uYWxseSByZXR1cm4gc3VjY2Vzc2VzCj4gKGluIHNvbWUgY2Fz
ZXMpLiBUZWxsIG1lIGlmIEkgbmVlZCB0byBhZGQgdGhpcyB0byB0aGUgY29tbWl0IG1lc3NhZ2Uu
Cj4gCgpJdCdzIGZpbmUgbGlrZSB0aGF0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
