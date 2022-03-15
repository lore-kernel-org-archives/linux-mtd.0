Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A01C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Mar 2022 09:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdhLZBzvTmlk8Dxce1Zj3ZLQpLs6XxB1SpTjQn+a99c=; b=SdoybibF9DMaNa
	xcTtatp4luzPdqWFvMTyNYr+x5G/YYY4WUybREQloCyWBIwu5pRRreChp5NkLqXgdMPdq1BLa/z5i
	P8yw9Ddtw0/vyvArgkyvaXMzH7MZIc5NWf434PkF5L2lRkH5TeZEL1RFR7mZtdPaKo3MPy4tMd3pm
	4cFy0SCN+iU3e6pFwxOCv+xKvc6Y+u3GLcO6XJMRajMj3bPd7s4VOII2DRItWo7KcElDFJn03bI9F
	83/A0CKv1Uc5qvH95+TCQm5briLytIBNFkKohlS2INFj0Z9W1HszKsuhc6G8BmWfK3rKonTG0K82M
	8o2fQgWR0DRQGj6Eas4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU3on-008cef-BB; Tue, 15 Mar 2022 09:50:17 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU3oj-008ccR-0k
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2022 09:50:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3EF5940003;
 Tue, 15 Mar 2022 09:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647337810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SpDh/YOmZE0tfqfw9TvVDeDtVzmr/ynI2LxlxjRdlSc=;
 b=VfAeZOzVCU999ZLIP+3z5jv0Ejzjjk3RaqUJBOvVuN7WajIbOTdGjuB1Wtvj0o+Ju3pdoB
 veWzUzL3wwn+DhCWJgdHf4W19Ok/aHlB4XTOxeH10c3hBcEqBP7mJFnCIUxr2HZttIIy8A
 BFBgSTlFtP4BaNNaaMZl4/rZSdalU501IzCKYcTwkbJ5BGP0SqluS4bishm6sGub2oNOH0
 dbP9phc41LR+XxAsx61rBi5UHbyh3bE/ejl3ZWp6KZ4bjlkn6jl9TJl+ydc4D2r2mHK24b
 HEpl4ZMjGiiI7G1O3wRoF9iCW9cswtYnaqpGekYSKlqLM19dXu8RM6bhYFkISQ==
Date: Tue, 15 Mar 2022 10:50:08 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tokunori Ikegami <ikegami.t@gmail.com>, <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: Use chip_ready() for write on
 S29GL064N
Message-ID: <20220315105008.7cca3e2e@xps13>
In-Reply-To: <983a44fb-2f79-57b5-c161-2684feb2a0dc@ti.com>
References: <20220306153213.411425-1-ikegami.t@gmail.com>
 <983a44fb-2f79-57b5-c161-2684feb2a0dc@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_025013_309720_40C20207 
X-CRM114-Status: GOOD (  20.01  )
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

SGVsbG8sCgp2aWduZXNockB0aS5jb20gd3JvdGUgb24gVHVlLCAxNSBNYXIgMjAyMiAxMTo0MTo1
MiArMDUzMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9uIDA2LzAzLzIyIDk6MDIgcG0sIFRva3Vub3Jp
IElrZWdhbWkgd3JvdGU6Cj4gPiBUaGUgcmVncmVzc2lvbiBpc3N1ZSBoYXMgYmVlbiBjYXVzZWQg
b24gUzI5R0wwNjROIGFuZCByZXBvcnRlZCBpdC4KPiA+IEFsc28gdGhlIGNoYW5nZSBtZW50aW9u
ZWQgaXMgdG8gdXNlIGNoaXBfZ29vZCgpIGZvciBidWZmZXJlZCB3cml0ZS4KPiA+IFNvIGRpc2Fi
bGUgdGhlIGNoYW5nZSBvbiBTMjlHTDA2NE4gYW5kIHVzZSBjaGlwX3JlYWR5KCkgYXMgYmVmb3Jl
Lgo+ID4gCj4gPiBGaXhlczogZGZlYWUxMDczNTgzKCJtdGQ6IGNmaV9jbWRzZXRfMDAwMjogQ2hh
bmdlIHdyaXRlIGJ1ZmZlciB0byBjaGVjayBjb3JyZWN0IHZhbHVlIikKPiA+IFNpZ25lZC1vZmYt
Ynk6IFRva3Vub3JpIElrZWdhbWkgPGlrZWdhbWkudEBnbWFpbC5jb20+Cj4gPiBDYzogTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+IENjOiBSaWNoYXJkIFdlaW5i
ZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+ID4gQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25l
c2hyQHRpLmNvbT4KPiA+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvYjY4N2MyNTktNjQxMy0yNmM5LWQ0YzktYjNhZmE2OWVhMTI0QHBlbmd1dHJvbml4LmRlLyAg
Cj4gCj4gQ291bGQgeW91IHBsZWFzZSBwdWxsIHRoaXMgaW4gZm9yIHY1LjE4LXJjMSBhcyB0aGlz
IGlzIGEgcmVncmVzc2lvbgo+IGJlaW5nIHRyYWNrZWQgZm9yIGEgd2hpbGU/CgpJIHdhcyBhYm91
dCB0byBhcHBseSB0aGUgcGF0Y2ggYnV0IHJldmlld2luZyBpdCBxdWlja2x5IHNob3duIGEgbnVt
YmVyCm9mIGlzc3Vlcy4gSSBjYW4gc3RpbGwgcHVsbCB0aGUgcGF0Y2ggZm9yIC1yYzEgaWYgYWxs
IHRoaXMgaXMKY29ycmVjdGVkIHJhdGhlciBxdWlja2x5IGJ1dCBvdGhlcndpc2UgaXQgd2lsbCBn
byB0aHJvdWdoIEZpeGVzIGxhdGVyCm9uLgoKLSBJIGp1c3QgZG9uJ3QgdW5kZXJzdGFuZCB0aGUg
Y29tbWl0IGxvZywgcGxlYXNlIHJlcGhyYXNlIGl0IGVudGlyZWx5LgogIFlvdSBjYW4gaW5jbHVk
ZSB0aGUgbGluayB0byB0aGUgYnVnIHJlcG9ydCBhcyB3ZWxsIGluc2lkZSB0aGUgY29tbWl0CiAg
dGV4dCwgbm90IGFzIHBhcnQgb2YgYSBMaW5rIHRhZywgYmVjYXVzZSB0aGUgTGluayB0YWcgaXMg
aGVyZSB0bwogIHJlZmVyIHRvIHRoZSBtYWlsaW5nIGxpc3QgZGlzY3Vzc2lvbiBhbmQgaXMgYWRk
ZWQgYXV0b21hdGljYWxseS4KICBTb21ldGhpbmcgbGlrZToKCglBcyBwb2ludGVkIG91dCBieSB0
aGlzIGJ1ZyByZXBvcnQgWzFdLCA8d2hhdD4gaXMgbm93IGJyb2tlbiBvbgoJUzI5R0wwNjROLiBU
aGUgcmVhc29uIGlzIHRoYXQgPGV4cGxhaW4gdGhlIHByb2JsZW0+LiBPbmUgd2F5IHRvCglzb2x2
ZSB0aGUgaXNzdWUgaXMgdG8gPGV4cGxhaW4gd2h5IEkgc2hvdWxkIGNob29zZSB0aGlzCglzb2x1
dGlvbj4uCgoJWzFdIDx0aGUgbGluayBoZXJlPgoKLSBUaGUgcGF0Y2ggaXRzZWxmIHNob3VsZCBi
ZSBzcGxpdCBpbnRvIGF0IGxlYXN0IHRocmVlIHBhcnRzOgogICogVGhlIElEIGRlZmluaXRpb24g
KHNob3VsZCBub3QgYmUgcGFydCBvZiB0aGUgZml4KS4KICAqIFRoZSBjaGlwX2NoZWNrL2NoaXBf
cmVhZHkvY2hpcF9nb29kX2Zvcl93cml0ZSBjb2RlIG1vdmVzL3JlbmFtaW5nCiAgICBpbmRlcGVu
ZGVudGx5IG9mIGFueSBmdW5jdGluYWwgY2hhbmdlIGFzIGEgcHJlcGFyYXRpb24gcGF0Y2guCiAg
KiBUaGUgYWN0dWFsIGZpeCB3aXRoaW4gb25lIG9mIHRoZSBhYm92ZSBmdW5jdGlvbnMuCgpBc2lk
ZSBmcm9tIHRoZXNlLCBJIGRvbid0IHF1aXRlIGdldCB3aGF0IHRoZSBfX3hpcHJhbSBrZXl3b3Jk
IGlzCnN1cHBvc2VkIHRvIGNhcnJ5LiBXZSByZXR1cm4gYSBib29sZWFuIGV4cHJlc3Npb24gc3Rv
cmVkIGluIGFuIGludApwcm92aWRlZCBieSB0aGUgbWFwX3dvcmRfZXF1YWwoKSBtYWNybyB3aGlj
aCBkb2VzIHJldHVybiBhIHNpbXBsZSBpbnQKZGVjbGFyZWQgb24gdGhlIHN0YWNrLiBJdCdzIG5v
dCBzdG9yZWQgYW55d2hlcmUgZWxzZSB0aGFuIHJlZ3VsYXIgUkFNLApvciBhbSBJIG1pc3Npbmcg
c29tZXRoaW5nPwoKPiBBY2tlZC1ieTogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGku
Y29tPgo+IAo+IFsuLi5dCj4gCj4gUmVnYXJkcwo+IFZpZ25lc2gKPiAKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
