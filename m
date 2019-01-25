Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50098C282C2
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 12:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F7052146E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 12:36:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GsI5Q7O+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F7052146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ta7BhC9qqtsomuE3Mo2gDffyHqXy8YOvsFTRfcQymDM=; b=GsI5Q7O+QM7AeG
	MbMrQGIXXURN0G0b9JgJHCsg1C4HKuroK03ftK+7q2Dcnz+XxolWC7J80OarkxV/u7zfQam9M1dcQ
	jNWxSLcv3uau1okUuhFUGytQqtL25cibnnngkf0LRjsuLd8MuuA2uab5Efc87h5u0iZl7jtneh+xy
	UWpT823jwPB/GHkxKJrJg8Sn1WkEMgUJx2EBux85u3yMP20ioykWEvOaSjtexxR6ired/9gvtxcZv
	+BcUeZbw3Az6BX51bu3ojx1k6KJs975oJ11CewDbjc+K+rqDxitUECyBuUQtC6YM5CaUE/ebjJ+RV
	KpM2T69+TSnyjxsx8TBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn0io-0005Iq-4g; Fri, 25 Jan 2019 12:36:34 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn0il-0005IW-FQ
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 12:36:32 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id E539C209B6; Fri, 25 Jan 2019 13:36:29 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206])
 by mail.bootlin.com (Postfix) with ESMTPSA id A89C5207AD;
 Fri, 25 Jan 2019 13:36:19 +0100 (CET)
Date: Fri, 25 Jan 2019 13:36:19 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mathieu Malaterre <malat@debian.org>
Subject: Re: [PATCH 1/2] mtd: Annotate implicit fall through in
 nand_command/nand_command_lp
Message-ID: <20190125133619.5991c2d4@xps13>
In-Reply-To: <20190116195004.2499-1-malat@debian.org>
References: <20190116195004.2499-1-malat@debian.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_043631_648275_F6EF6873 
X-CRM114-Status: GOOD (  17.58  )
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
biBXZWQsIDE2IEphbiAyMDE5IDIwOjUwOjAzCiswMTAwOgoKPiBUaGVyZSBpcyBhIHBsYW4gdG8g
YnVpbGQgdGhlIGtlcm5lbCB3aXRoIC1XaW1wbGljaXQtZmFsbHRocm91Z2ggYW5kCj4gdGhlc2Ug
cGxhY2VzIGluIHRoZSBjb2RlIHByb2R1Y2VkIHdhcm5pbmdzIChXPTEpLgo+IAo+IFRoaXMgY29t
bWl0IHJlbW92ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nczoKPiAKPiAgIGRyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfbGVnYWN5LmM6MzMyOjY6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBm
YWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+ICAgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbmFuZF9sZWdhY3kuYzo0ODM6Mzogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZh
bGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gCj4gU2lnbmVkLW9mZi1ieTog
TWF0aGlldSBNYWxhdGVycmUgPG1hbGF0QGRlYmlhbi5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfbGVnYWN5LmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfbGVnYWN5LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2xlZ2FjeS5j
Cj4gaW5kZXggNDM1NzU5NDNmMTNiLi5mMjUyNmVjNjE2YTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF9sZWdhY3kuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L25hbmRfbGVnYWN5LmMKPiBAQCAtMzMxLDYgKzMzMSw3IEBAIHN0YXRpYyB2b2lkIG5hbmRfY29t
bWFuZChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgY29tbWFuZCwKPiAgCQkg
Ki8KPiAgCQlpZiAoY29sdW1uID09IC0xICYmIHBhZ2VfYWRkciA9PSAtMSkKPiAgCQkJcmV0dXJu
Owo+ICsJCS8qIGZhbGwgdGhyb3VnaCAqLwo+ICAKPiAgCWRlZmF1bHQ6Cj4gIAkJLyoKPiBAQCAt
NDgzLDcgKzQ4NCw3IEBAIHN0YXRpYyB2b2lkIG5hbmRfY29tbWFuZF9scChzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgY29tbWFuZCwKPiAgCQljaGlwLT5sZWdhY3kuY21kX2N0
cmwoY2hpcCwgTkFORF9DTURfTk9ORSwKPiAgCQkJCSAgICAgIE5BTkRfTkNFIHwgTkFORF9DVFJM
X0NIQU5HRSk7Cj4gIAo+IC0JCS8qIFRoaXMgYXBwbGllcyB0byByZWFkIGNvbW1hbmRzICovCj4g
KwkJLyogZmFsbCB0aHJvdWdoIC0gVGhpcyBhcHBsaWVzIHRvIHJlYWQgY29tbWFuZHMgKi8KPiAg
CWRlZmF1bHQ6Cj4gIAkJLyoKPiAgCQkgKiBJZiB3ZSBkb24ndCBoYXZlIGFjY2VzcyB0byB0aGUg
YnVzeSBwaW4sIHdlIGFwcGx5IHRoZSBnaXZlbgoKQXBwbGllZCB0byBuYW5kL25leHQgd2l0aCB0
aGUgc3ViamVjdCBwcmVmaXggYmVpbmcgIm10ZDogcmF3bmFuZDoiCgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
