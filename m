Return-Path: <SRS0=UEO3=YJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E0FFA3728
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 10:44:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81B8820872
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 10:44:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sMlFVKx8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81B8820872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FphzEKNV3INQ5ucunk4s2KqafEcyAAtdB5xJ8Jm9c7I=; b=sMlFVKx8rntEVF
	yL3vlBFe1ghwDmY7DNpUjJrig3RQV8JTlNsZswxcqcVwP7is36MFMsKKQMrGOa+KC894pnyMiJ9YL
	b2ReTTdgSQKUmZRigR0TWG4oZ3ugefan7ZhsLYoF5nc7aBEP3U2hZt1I/kEQyuT5cQDt6Ca+iTy/Z
	xVXPMx29haelCsYHLZ1vna2A1ARj1H3s5EFKzOf3qj8ECeUgiRCQVk1JgsnZRRbQZzlxV0bk5zVP0
	vTGrb+6dSe+GlK2xUJj4v7Gz8DFcvin0koEsbTucEl4uLF6p/Zw/x/4MqahMVp1kbn5Chlc9b4m21
	no0YmdFFDAeqyAaXGnQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKgnS-00088Z-2v; Wed, 16 Oct 2019 10:44:50 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKgnO-00086K-JV
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2019 10:44:48 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E0BB860632C6;
 Wed, 16 Oct 2019 12:44:35 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 6FufNbvA2Q6M; Wed, 16 Oct 2019 12:44:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8312360632EE;
 Wed, 16 Oct 2019 12:44:35 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id sYeCDUamV9iC; Wed, 16 Oct 2019 12:44:35 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4ED9760632C6;
 Wed, 16 Oct 2019 12:44:35 +0200 (CEST)
Date: Wed, 16 Oct 2019 12:44:35 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Message-ID: <1581937397.24882.1571222675188.JavaMail.zimbra@nod.at>
In-Reply-To: <20191016100803.31003-1-ben.dooks@codethink.co.uk>
References: <20191016100803.31003-1-ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] ubifs: possible missed le64_to_cpu() in journal
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: possible missed le64_to_cpu() in journal
Thread-Index: w8iv2kuYlm145q0tWl6kPtPgp4Op6g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_034446_786533_25EA297B 
X-CRM114-Status: GOOD (  12.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@lists.codethink.co.uk,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkJlbiBEb29rcyAoQ29kZXRo
aW5rKSIgPGJlbi5kb29rc0Bjb2RldGhpbmsuY28udWs+Cj4gQW46IGxpbnV4LWtlcm5lbEBsaXN0
cy5jb2RldGhpbmsuY28udWsKPiBDQzogIkJlbiBEb29rcyAoQ29kZXRoaW5rKSIgPGJlbi5kb29r
c0Bjb2RldGhpbmsuY28udWs+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgIkFydGVtIEJp
dHl1dHNraXkiCj4gPGRlZGVraW5kMUBnbWFpbC5jb20+LCAiQWRyaWFuIEh1bnRlciIgPGFkcmlh
bi5odW50ZXJAaW50ZWwuY29tPiwgImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRl
YWQub3JnPiwKPiAibGludXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4K
PiBHZXNlbmRldDogTWl0dHdvY2gsIDE2LiBPa3RvYmVyIDIwMTkgMTI6MDg6MDMKPiBCZXRyZWZm
OiBbUEFUQ0hdIHViaWZzOiBwb3NzaWJsZSBtaXNzZWQgbGU2NF90b19jcHUoKSBpbiBqb3VybmFs
Cgo+IEluIHRoZSB1Ymlmc19qbmxfd3JpdGVfaW5vZGUoKSBmdW5jdG9uLCBpdCBjYWxscyB1Ymlm
c19pZ2V0KCkKPiB3aXRoIHhlbnQtPmludW0uIFRoZSB4ZW50LT5pbnVtIGlzIF9fbGU2NCwgYnV0
IHRoZSB1Ymlmc19pZ2V0KCkKPiB0YWtlcyBuYXRpdmUgY3B1IGVuZGlhbi4KPiAKPiBJIHRoaW5r
IHRoYXQgdGhpcyBzaG91bGQgYmUgY2hhbmdlZCB0byBwYXNzaW5nIGxlNjRfdG9fY3B1KHhlbnQt
PmludW0pCj4gdG8gZml4IHRoZSBmb2xsb3dpbmcgc3BhcnNlIHdhcm5pbmc6Cj4gCj4gZnMvdWJp
ZnMvam91cm5hbC5jOjkwMjo1ODogd2FybmluZzogaW5jb3JyZWN0IHR5cGUgaW4gYXJndW1lbnQg
MiAoZGlmZmVyZW50IGJhc2UKPiB0eXBlcykKPiBmcy91Ymlmcy9qb3VybmFsLmM6OTAyOjU4OiAg
ICBleHBlY3RlZCB1bnNpZ25lZCBsb25nIGludW0KPiBmcy91Ymlmcy9qb3VybmFsLmM6OTAyOjU4
OiAgICBnb3QgcmVzdHJpY3RlZCBfX2xlNjQgW3VzZXJ0eXBlXSBpbnVtCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgo+IC0tLQo+IENjOiBS
aWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IENjOiBBcnRlbSBCaXR5dXRza2l5
IDxkZWRla2luZDFAZ21haWwuY29tPgo+IENjOiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVy
QGludGVsLmNvbT4KPiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IC0tLQo+IGZzL3ViaWZzL2pvdXJuYWwuYyB8IDIg
Ky0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZnMvdWJpZnMvam91cm5hbC5jIGIvZnMvdWJpZnMvam91cm5hbC5jCj4gaW5k
ZXggZDYxMzZmN2MxY2ZjLi4zODhmZThmNWRjNTEgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvam91
cm5hbC5jCj4gKysrIGIvZnMvdWJpZnMvam91cm5hbC5jCj4gQEAgLTg5OSw3ICs4OTksNyBAQCBp
bnQgdWJpZnNfam5sX3dyaXRlX2lub2RlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBjb25zdCBzdHJ1
Y3QKPiBpbm9kZSAqaW5vZGUpCj4gCQkJZm5hbWVfbmFtZSgmbm0pID0geGVudC0+bmFtZTsKPiAJ
CQlmbmFtZV9sZW4oJm5tKSA9IGxlMTZfdG9fY3B1KHhlbnQtPm5sZW4pOwo+IAo+IC0JCQl4aW5v
ID0gdWJpZnNfaWdldChjLT52ZnNfc2IsIHhlbnQtPmludW0pOwo+ICsJCQl4aW5vID0gdWJpZnNf
aWdldChjLT52ZnNfc2IsIGxlNjRfdG9fY3B1KHhlbnQtPmludW0pKTsKCkdvb2QgY2F0Y2ghCgpU
aGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
