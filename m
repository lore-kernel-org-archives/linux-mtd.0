Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A467C61DF0
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 06:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uiQRGio5iQ5gC4N7+S/IbIsz/CQCxUubALgCOpIw5Pw=; b=ealLrxZP22WOQu
	a/9wsTWQvMJRN3gSCfWu1w35kMF39Y4S6lAqF9a0cnQpPJuZsFpLdNtywXEuO4y2S1hvNPXxx5JvG
	XS+UH7hq7pIUuowEPG+W6DMuZcJSznQEiw1T1JsRjy2oRaGUR0BKHSwVZ2/5mvyBxdPkoo1YR73/z
	mKYT5gdGy8DFUOZ369BnIrZXoHuNYesMdgUH29e+MPhgIcDg4hZvUBouTjgvwISgxXYPsJvTpuK79
	P0+qdwerTD4wKAhtugIHDtA3DT0zWKKTm+7QPj8SZ8dfRYq7/4HIiwSo5/OxpGvlbG9/E/DcjIeZT
	oEvu3yVyfi2BYMuYW5Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0vSk-00000008biH-3ofG;
	Mon, 31 Aug 2026 06:25:46 +0000
Received: from chamillionaire.breakpoint.cc ([91.216.245.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0vSi-00000008bhe-3DZI
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 06:25:46 +0000
Date: Mon, 31 Aug 2026 08:25:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025; t=1788157539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/8KNi8b9MX3vlOs17B3ykUK2G4OuKnr8nD6ihRCA0g=;
	b=dTX2J6DafPKluKLHqEpQUfJrLYh3hOLTM7fOfHqLWM1mmGxPOv271ctHE/JUvENA3RiHMD
	538bmNBtk1IjdKy/n0Su38+qbyYg2cr5psHW2E/qzgByraKknVQ9tBHtOZSEazBC2L5V7A
	VHRy/vAvSvr6cl35GDVl4fQwsIV5U+f23E+pbI3j5rfh7A0gl+v/y8czBwWuU3E8A78MQ4
	1fMCU5aeFseHIWqULuAumj5Mjy0D0X86z5uDE1TMjYYNNu3382mTvBR4VOhqdK2hyjuLaw
	lploT9AEQiCEUhEpilJ3NYKSp2elqKd7CY4YR8mwWvMsvGO/pa5tagZq44Iu4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025e; t=1788157539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/8KNi8b9MX3vlOs17B3ykUK2G4OuKnr8nD6ihRCA0g=;
	b=Je7meNesO9nsQPwK9QEfnYZm8FyWUZxcHuRkhA9wUo9bJpiOw+z/dcXdS8Thb/eNJ5jv/B
	wfNw7iFGmlQtVGCQ==
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: Re: [PATCH] ubifs-utils: Don't compile engine support if not
 available
Message-ID: <20260831062538.0E_FwcMd@breakpoint.cc>
References: <20260829173245.5-tFbtxE@breakpoint.cc>
 <481dc2f7-ba6f-743a-b841-a3bdb8807ff6@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <481dc2f7-ba6f-743a-b841-a3bdb8807ff6@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_232544_984335_845EE798 
X-CRM114-Status: GOOD (  11.44  )
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

T24gMjAyNi0wOC0zMSAwOTo1MDoxOCBbKzA4MDBdLCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4g5Zyo
IDIwMjYvOC8zMCAxOjMyLCBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yIOWGmemBkzoKPiA+IEBA
IC0xMzksNiArMTQyLDcgQEAgc3RhdGljIEVWUF9QS0VZICpyZWFkX3ByaXZhdGVfa2V5KGNvbnN0
IGNoYXIgKnByaXZhdGVfa2V5X25hbWUsIFg1MDkgKipjZXJ0KQo+ID4gICAJKmNlcnQgPSBOVUxM
Owo+ID4gICAJaWYgKCFzdHJuY21wKHByaXZhdGVfa2V5X25hbWUsICJwa2NzMTE6IiwgNykpIHsK
PiA+ICsjaWZuZGVmIE9QRU5TU0xfTk9fRU5HSU5FCj4gPiAgIAkJRU5HSU5FICplOwo+ID4gICAJ
CXN0cnVjdCB7Cj4gPiAgIAkJCWNvbnN0IGNoYXIgKnVybDsKPiA+IEBAIC0xNzcsNiArMTgxLDEw
IEBAIHN0YXRpYyBFVlBfUEtFWSAqcmVhZF9wcml2YXRlX2tleShjb25zdCBjaGFyICpwcml2YXRl
X2tleV9uYW1lLCBYNTA5ICoqY2VydCkKPiA+ICAgCQl9Cj4gPiAgIAkJKmNlcnQgPSBwYXJtcy5j
ZXJ0Owo+ID4gICAJCWZwcmludGYoc3RkZXJyLCAiVXNpbmcgY2VydCAlcFxuIiwgKmNlcnQpOwo+
ID4gKyNlbHNlCj4gPiArCQlzc2xfZXJyX21zZygiUEtDUyMxMSBFTkdJTkUgc3VwcG9ydCBub3Qg
YXZhaWxhYmxlLiIpOwo+ID4gKwkJcmV0dXJuIE5VTEw7Cj4gSGkgU2ViYXN0aWFuLAo+IFRoYW5r
cyBmb3IgcG9pbnRpbmcgdGhhdC4gSSBhbSB3b25kZXJpbmcgd2hldGhlciBpdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8KPiBpbXBsZW1lbnQgUEtDUzExIGVuY3J5cHRpb24gaW4gI2Vsc2UgYnJhbmNoIGJ5
IHRoZSBPcGVuU1NMIDQuMCBBUEkgcHJvdmlkZXIuCgpXZWxsLiBUaGlzIGlzIGEgdGhlIHZlcnkg
bGVhc3QgZ2V0cyBpdCBjb21waWxlZC4gVGhlIHByb3ZpZGVyIEFQSSBpcwpzdXBwb3J0ZWQgc2lu
Y2UgT3BlblNTTCAzLjAgc28gSSB3b3VsZG4ndCBtYWtlIGl0IGF2YWlsYWJsZSBvbmx5IGlmCkVO
R0lORSBpc24ndCBzdXBwb3J0ZWQuIFlvdSBzdGlsbCBuZWVkIHRoZSBhY3R1YWwgcHJvdmlkZXIu
Cgo+ID4gKyNlbmRpZgo+ID4gICAJfSBlbHNlIHsKPiA+ICAgCQlCSU8gKmI7Cj4gPiAKClNlYmFz
dGlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
