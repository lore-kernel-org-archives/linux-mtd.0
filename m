Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB7BC25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 08:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CCjzcCt+RmHqJxOzUztcsIzk2SyVFIHCnNLp7Q0fHM=; b=mHttR/4WxrWQOL
	Gnzu/2FKJAM17pUZCPRDde0ZdfcrAZ7NpQbxTxot5s8yxvglUGm6kFVIBjCWz+i0Lk3HhD9VC+0/c
	1HKrp13bR570YYCSz1WmCz+wpLu4Rqhj6GdDI+Y5XPQI41LEPnKQ5e+NX6DogWUdKpMDTfB6nJ84C
	WUkm7pwH4nvIm0bMUyoajHPfLLJuZYI+Xt+ihJzqIgoVNi0HPtoTiav50s/sn06jkjAdIGgGcDENq
	U1TtuVbBsRUPRUYAPR1OlD0KnRnfd6uDT/2OlcLacziFppFnFDvflVSIltj4ESjXU0YQSXuiLofKZ
	gj6D892n6kPojNcbSbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WYR-00000004AYt-1TGd;
	Thu, 16 May 2024 08:33:35 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WYN-00000004AVj-03iU
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 08:33:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67DA62000A;
	Thu, 16 May 2024 08:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715848405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OlCEWWB6cFyweBKAuWpYX1M2Skf3YxIZvcOY5o0N+rQ=;
	b=pboRvf7pkvdGdjXae92hHGo9tJTRMHWN9xy3c+Cz2JPV4eki+saN8Qs7fe92e4GhLWe7Ml
	s8DFAd3QtBYQC7V3WKAYSdHABuyXqD68XCtX02GulT0t2g4oIWL2JYbCrH7TjsVKALc9SE
	Lcdk3eJBSuVSAqFJmM1T+quTxBEJxBE8VfZG0T+gKhIWFbPkSnfwIZJx739gBV48xZd1oe
	YxrJPOjsgSrjncNRiXYS18WHiZeRCABkqz/Xso74kb3RJnDQg0GBQ1ZFKmHGbdymtksFDN
	4j5k/15QSBUvOWgKsWN7H9t/cHslvk0WStO4TROagBjHIB/ayPHf+ygcSopprA==
Date: Thu, 16 May 2024 10:33:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mtd: nand: mxc_nand: support software ECC
Message-ID: <20240516103321.25b49576@xps-13>
In-Reply-To: <ZkRyTT7FcDQ-5UeV@pengutronix.de>
References: <20240514-mtd-nand-mxc-nand-exec-op-v3-0-3e6f45fd3d82@pengutronix.de>
	<20240514-mtd-nand-mxc-nand-exec-op-v3-3-3e6f45fd3d82@pengutronix.de>
	<ZkRyTT7FcDQ-5UeV@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_013331_245469_043845ED 
X-CRM114-Status: GOOD (  18.26  )
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

SGkgU2FzY2hhLAoKPiA+ICsJLyoKPiA+ICsJICogRHVyaW5nIGEgcGFnZSB3cml0ZSB0aGUgaS5N
WCBOQU5EIGNvbnRyb2xsZXIgd2lsbCByZWFkIDUxMmIgZnJvbQo+ID4gKwkgKiBtYWluX2FyZWEw
IFNSQU0sIHRoZW4gb29iX3Blcl9zdWJwYWdlIGJ5dGVzIGZyb20gc3BhcmUwIFNSQU0sIHRoZW4K
PiA+ICsJICogNTEyYiBmcm9tIG1haW5fYXJlYTEgU1JBTSBhbmQgc28gb24gdW50aWwgdGhlIGZ1
bGwgcGFnZSBpcyB3cml0dGVuLgo+ID4gKwkgKiBGb3Igc29mdHdhcmUgRUNDIHdlIHdhbnQgdG8g
aGF2ZSBhIDE6MSBtYXBwaW5nIGJldHdlZW4gdGhlIHJhdyBwYWdlCj4gPiArCSAqIGRhdGEgb24g
dGhlIE5BTkQgY2hpcCBhbmQgdGhlIHZpZXcgb2YgdGhlIE5BTkQgY29yZS4gVGhpcyBpcwo+ID4g
KwkgKiBuZWNlc3NhcnkgdG8gbWFrZSB0aGUgTkFORF9DTURfUk5ET1VUIHJlYWQgdGhlIGRhdGEg
aXQgZXhwZWN0cy4KPiA+ICsJICogVG8gYWNjb21wbGlzaCB0aGlzIHdlIGhhdmUgdG8gd3JpdGUg
dGhlIGRhdGEgaW4gdGhlIG9yZGVyIHRoZSBjb250cm9sbGVyCj4gPiArCSAqIHJlYWRzIGl0LiBU
aGlzIGlzIHJldmVyc2VkIGluIGNvcHlfcGFnZV9mcm9tX3NyYW0oKSBiZWxvdy4KPiA+ICsJICov
Cj4gPiArCWZvciAoaSA9IDA7IGkgPCBub19zdWJwYWdlczsgaSsrKSB7Cj4gPiArCQltZW1jcHkx
Nl90b2lvKGhvc3QtPm1haW5fYXJlYTAgKyBpICogNTEyLCBidWYsIDUxMik7Cj4gPiArCQlidWYg
Kz0gNTEyOwo+ID4gKwo+ID4gKwkJbWVtY3B5MTZfdG9pbyhob3N0LT5zcGFyZTAgKyBpICogaG9z
dC0+ZGV2dHlwZV9kYXRhLT5zcGFyZV9sZW4sIGJ1ZiwKPiA+ICsJCQkgICAgICBvb2JfcGVyX3N1
YnBhZ2UpOwo+ID4gKwkJYnVmICs9IG9vYl9wZXJfc3VicGFnZTsKPiA+ICsJfQo+ID4gK30gIAo+
IAo+IEkgbm90aWNlZCB0aGUgbmFuZGJpdGVyciB0ZXN0IHdvbid0IHdvcmsgd2l0aCB0aGlzLiBJ
dCBuZWVkcyB0aGUgZm9sbG93aW5nCj4gZml4dXAuIFRoZSBwcm9ibGVtIGlzIHRoYXQgdGhlIGNv
cmUgd2FudHMgdG8gd3JpdGUgb25seSB1c2VyIGRhdGEKPiB3aXRob3V0IE9PQiwgc28gd2UgaGF2
ZSB0byBtYWtlIHN1cmUgdGhlIHJlbWFpbmluZyBTUkFNIGlzIGZpbGxlZCB1cAo+IHdpdGggMHhm
Zi4KClllcy4gSSBsb29rZWQgcmFwaWRseSBhdCB0aGUgZGlmZiwgbG9va3Mgb2suCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
