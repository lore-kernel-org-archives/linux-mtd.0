Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB3EC433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 12:34:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1861610C8
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 12:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1861610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bi21Sve75y3IPWUVhvP/ULO9a1YYvlfGN1zx9aPYwdA=; b=P+4Gro+75j4b3uIGtn45kfBAvv
	gOc1pWY6s4yzi0Cr7dmEh7p5/+bJ/gl+btJMZ9P/HaLq+t+GaqelKlopAxGrwKD6q99OrHh4nyFOk
	NHG3M32WrmRPOCa+EkmAbhspBqaUOpIXR84QCO3lU6A47fD6ihQFNdPq00QMSMzBxsYzq+JR4M7cA
	Ht9tCKwhMlBHYgD1RaUVuFGITbsuXUR8g/qKcp2vL2fE9oCS6UlxVDIi9ZQnFA4a1/kX8IB36Cju3
	cWiuCxnFzyxBDZKRB0NFgf62Cr6NDq1L5NfQBezGA6w34NbFRvZeP52RAroVEPPx82SHyXymPWQqA
	Bd+1yXAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1madSG-00GaNN-JJ; Wed, 13 Oct 2021 12:33:56 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1macBs-00GEDQ-Bm
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 11:12:58 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id BEBA6608F449;
 Wed, 13 Oct 2021 13:12:44 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id hD8vYjuatPF1; Wed, 13 Oct 2021 13:12:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 20E5C608F457;
 Wed, 13 Oct 2021 13:12:44 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id uPKosP6akgM5; Wed, 13 Oct 2021 13:12:44 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id E9D45608F449;
 Wed, 13 Oct 2021 13:12:43 +0200 (CEST)
Date: Wed, 13 Oct 2021 13:12:43 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: david oberhollenzer <david.oberhollenzer@sigma-star.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <308700286.68659.1634123563780.JavaMail.zimbra@nod.at>
In-Reply-To: <20211013100807.306920-1-miquel.raynal@bootlin.com>
References: <20211013100807.306920-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH mtd-utils] mtd-tests: Read and write pages during speed
 tests
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF93 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtd-tests: Read and write pages during speed tests
Thread-Index: z7oJeXGsgoZbbPqA/Jc0yvaT7wyjag==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_041256_614166_66962938 
X-CRM114-Status: GOOD (  16.05  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IEFuOiAiZGF2aWQgb2JlcmhvbGxlbnplciIgPGRh
dmlkLm9iZXJob2xsZW56ZXJAc2lnbWEtc3Rhci5hdD4KPiBDQzogInJpY2hhcmQiIDxyaWNoYXJk
QG5vZC5hdD4sICJWaWduZXNoIFJhZ2hhdmVuZHJhIiA8dmlnbmVzaHJAdGkuY29tPiwgIlR1ZG9y
IEFtYmFydXMiIDxUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20+LAo+ICJsaW51eC1tdGQiIDxs
aW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4KPiBHZXNlbmRldDogTWl0dHdvY2gsIDEzLiBPa3RvYmVyIDIwMjEg
MTI6MDg6MDcKPiBCZXRyZWZmOiBbUEFUQ0ggbXRkLXV0aWxzXSBtdGQtdGVzdHM6IFJlYWQgYW5k
IHdyaXRlIHBhZ2VzIGR1cmluZyBzcGVlZCB0ZXN0cwoKPiBUaGUgc3BlZWQgdGVzdCBkb2VzIHJl
YWRzIGFuZCB3cml0ZXMgb2YgZGlmZmVyZW50IHNpemVzOgo+IC0gZXJhc2VibG9jawo+IC0gcGFn
ZQo+IC0gdHdvIHBhZ2VzCj4gCj4gQXQgbGVhc3QgdGhpcyBpcyB0aGUgdGhlb3J5IGJlY2F1c2Us
IGFzIG9wcG9zZWQgdG8gdGhlIGxlZ2FjeSBrZXJuZWwKPiBtb2R1bGUgZG9pbmcgdGhlIHNhbWUg
bWVhc3VyZW1lbnQsIHRoZSB1c2Vyc3BhY2UgdG9vbCB1c2VzIHRoZSBzdWJwYWdlCj4gc2l6ZSAo
aGVuY2UgYWNjZXNzaW5nIHRoZSBzYW1lIHBhZ2UgNCwgOCBvciAxNiB0aW1lcyBkZXBlbmRpbmcg
b24gdGhlCj4gc3VicGFnZSBzZXR0aW5nKS4gT2YgY291cnNlIGlmIHRoZSBjb250cm9sbGVyIGRv
ZXMgbm90IHN1cHBvcnQgc3VicGFnZXMsCj4gdGhpcyBpc3N1ZSBpcyBub3QgdmlzaWJsZS4KPiAK
PiBVc2UgbXRkLm1pbl9pb19zaXplIGluc3RlYWQgZm9yIG5vbi1OT1IgZGV2aWNlcyBpbiBvcmRl
ciB0byBnZXQgdGhlCj4gcmlnaHQgYmFuZHdpZHRoIChhdCBsZWFzdCBvbmUgdGhhdCBmaXRzIHRo
ZSBsb2dzKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPgo+IC0tLQo+IHRlc3RzL210ZC10ZXN0cy9mbGFzaF9zcGVlZC5jIHwgMiAr
LQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS90ZXN0cy9tdGQtdGVzdHMvZmxhc2hfc3BlZWQuYyBiL3Rlc3RzL210ZC10ZXN0
cy9mbGFzaF9zcGVlZC5jCj4gaW5kZXggMDA1ODI2OS4uMmZjNzBhMSAxMDA2NDQKPiAtLS0gYS90
ZXN0cy9tdGQtdGVzdHMvZmxhc2hfc3BlZWQuYwo+ICsrKyBiL3Rlc3RzL210ZC10ZXN0cy9mbGFz
aF9zcGVlZC5jCj4gQEAgLTM0Myw3ICszNDMsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAq
KmFyZ3YpCj4gCQlwdXRzKCJub3QgTkFORCBmbGFzaCwgYXNzdW1lIHBhZ2Ugc2l6ZSBpcyA1MTIg
Ynl0ZXMuIik7Cj4gCQlwZ3NpemUgPSA1MTI7Cj4gCX0gZWxzZSB7Cj4gLQkJcGdzaXplID0gbXRk
LnN1YnBhZ2Vfc2l6ZTsKPiArCQlwZ3NpemUgPSBtdGQubWluX2lvX3NpemU7CgpOb3cgdGhlIHVz
ZXJzcGFjZSBkb2VzIHRoZSBzYW1lIGFzIHRoZSBrZXJuZWwgdGVzdC4KT24gdGhlIGtlcm5lbCBz
aWRlIGl0IHVzZXMgbXRkLT53cml0ZXNpemUuCgpSZXZpZXdlZC1ieTogUmljaGFyZCBXZWluYmVy
Z2VyIDxyaWNoYXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
