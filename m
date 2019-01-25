Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2158C282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 12:36:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EC192146E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 12:36:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fiEaP72+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EC192146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hLs7s8rJabKR8HkmPXVi3aeZbFEouiEVxPJK2MBtMfU=; b=fiEaP72+Cd7GOi
	vnrt1Iz/U7CPzBNSwJ8m5X3bJNrBsLZU0o/wGFJHps9yb2u8wsR3l4ws/b43sKKGBpfbDwkfiTS1S
	I24x1DElSp/28qsFmBDe6ZL0cplb0Hr+fM+NLMnJDYT0QU7XdFkIUOYWVRiO9C6z6f5rPkPGYrsdM
	IzQs5xnpMzuVUSx8WdDllT9eNLXAmmIC1q/uk1QJc0L/m8MpnLn/Sge5xjs67cqhuwftc1cgengMi
	hvnDzgy3m+PsrUfQ2SPbufOXMCsyH//SkdPbYv65WhKmO1SyntRZkFqDhYRn2yrMYPnJGf1W/xoud
	/wEZosdOxq8KfdyRndYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn0j1-0005Vt-DW; Fri, 25 Jan 2019 12:36:47 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn0ix-0005TE-Gx
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 12:36:45 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 19116209BF; Fri, 25 Jan 2019 13:36:42 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206])
 by mail.bootlin.com (Postfix) with ESMTPSA id C4019207AD;
 Fri, 25 Jan 2019 13:36:31 +0100 (CET)
Date: Fri, 25 Jan 2019 13:36:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mathieu Malaterre <malat@debian.org>
Subject: Re: [PATCH 2/2] mtd: Annotate implicit fall through in nand_scan_tail
Message-ID: <20190125133631.48a32268@xps13>
In-Reply-To: <20190116195004.2499-2-malat@debian.org>
References: <20190116195004.2499-1-malat@debian.org>
 <20190116195004.2499-2-malat@debian.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_043643_880147_37E6BB6E 
X-CRM114-Status: GOOD (  15.40  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWF0aGlldSwKCk1hdGhpZXUgTWFsYXRlcnJlIDxtYWxhdEBkZWJpYW4ub3JnPiB3cm90ZSBv
biBXZWQsIDE2IEphbiAyMDE5IDIwOjUwOjA0CiswMTAwOgoKPiBUaGVyZSBpcyBhIHBsYW4gdG8g
YnVpbGQgdGhlIGtlcm5lbCB3aXRoIC1XaW1wbGljaXQtZmFsbHRocm91Z2ggYW5kCj4gdGhlc2Ug
cGxhY2VzIGluIHRoZSBjb2RlIHByb2R1Y2VkIHdhcm5pbmdzIChXPTEpLgo+IAo+IFRoaXMgY29t
bWl0IHJlbW92ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nczoKPiAKPiAgIGRyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfYmFzZS5jOjU1NTY6Njogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZh
bGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9uYW5kX2Jhc2UuYzo1NTc1OjY6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxs
IHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+ICAgZHJpdmVycy9tdGQvbmFuZC9y
YXcvbmFuZF9iYXNlLmM6NTYxMzoxMzogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwg
dGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0
aGlldSBNYWxhdGVycmUgPG1hbGF0QGRlYmlhbi5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfYmFzZS5jIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gaW5kZXggY2NhNGIyNGQyZmZhLi5k
YTM0NGMyNzYwODggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNl
LmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+IEBAIC01NTU1LDYg
KzU1NTUsNyBAQCBzdGF0aWMgaW50IG5hbmRfc2Nhbl90YWlsKHN0cnVjdCBuYW5kX2NoaXAgKmNo
aXApCj4gIAkJfQo+ICAJCWlmICghZWNjLT5yZWFkX3BhZ2UpCj4gIAkJCWVjYy0+cmVhZF9wYWdl
ID0gbmFuZF9yZWFkX3BhZ2VfaHdlY2Nfb29iX2ZpcnN0Owo+ICsJCS8qIGZhbGwgdGhyb3VnaCAq
Lwo+ICAKPiAgCWNhc2UgTkFORF9FQ0NfSFc6Cj4gIAkJLyogVXNlIHN0YW5kYXJkIGh3ZWNjIHJl
YWQgcGFnZSBmdW5jdGlvbj8gKi8KPiBAQCAtNTU3NCw2ICs1NTc1LDcgQEAgc3RhdGljIGludCBu
YW5kX3NjYW5fdGFpbChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICAJCQllY2MtPnJlYWRfc3Vi
cGFnZSA9IG5hbmRfcmVhZF9zdWJwYWdlOwo+ICAJCWlmICghZWNjLT53cml0ZV9zdWJwYWdlICYm
IGVjYy0+aHdjdGwgJiYgZWNjLT5jYWxjdWxhdGUpCj4gIAkJCWVjYy0+d3JpdGVfc3VicGFnZSA9
IG5hbmRfd3JpdGVfc3VicGFnZV9od2VjYzsKPiArCQkvKiBmYWxsIHRocm91Z2ggKi8KPiAgCj4g
IAljYXNlIE5BTkRfRUNDX0hXX1NZTkRST01FOgo+ICAJCWlmICgoIWVjYy0+Y2FsY3VsYXRlIHx8
ICFlY2MtPmNvcnJlY3QgfHwgIWVjYy0+aHdjdGwpICYmCj4gQEAgLTU2MTEsNiArNTYxMyw3IEBA
IHN0YXRpYyBpbnQgbmFuZF9zY2FuX3RhaWwoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAgCQkJ
ZWNjLT5zaXplLCBtdGQtPndyaXRlc2l6ZSk7Cj4gIAkJZWNjLT5tb2RlID0gTkFORF9FQ0NfU09G
VDsKPiAgCQllY2MtPmFsZ28gPSBOQU5EX0VDQ19IQU1NSU5HOwo+ICsJCS8qIGZhbGwgdGhyb3Vn
aCAqLwo+ICAKPiAgCWNhc2UgTkFORF9FQ0NfU09GVDoKPiAgCQlyZXQgPSBuYW5kX3NldF9lY2Nf
c29mdF9vcHMoY2hpcCk7CgpBcHBsaWVkIHRvIG5hbmQvbmV4dCB3aXRoIHRoZSBzdWJqZWN0IHBy
ZWZpeCBiZWluZyAibXRkOiByYXduYW5kOiIKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
