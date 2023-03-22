Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD85CC6FD1F
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 08:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t0+Jx4clXIdv2r4NcWVMP4dVzNl8C1lNBjBRDWmPwIk=; b=v0vA2Hd+BL6lB8aTKveLzmUny/
	Jz0NY3XELi0ZvcBoAOFRrhyb0HlytF6B51UDI9iYtc6WNq3ljneZjw4Esk/S8D5UN/5ZxBqCBYg1D
	qkKcK8O5e75oc36VqAugngyEQexqfjjwOGGXZv/kc1s/1G9off0VfWdyEp4StPdfnCCvQKKLAEo3G
	c75NrbuITRv2uw41Qark914h/RwJKVGSFDfWpvebk6FcnGxGN4K0VW9wigtr6tPXWR8Yev7+1xIJS
	EoEWYvUAAkKJ+VEQYrc5RjFsCCak1FUTs4T/VxwuwlrIACI2KypEKjG+cdpMYzzr6v1Y3uvLyjcsy
	CdCbZbyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1petvs-00FCtd-0i;
	Wed, 22 Mar 2023 08:34:56 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1petvo-00FCpq-12
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 08:34:54 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id DA8AA6431C32;
	Wed, 22 Mar 2023 09:34:40 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id iS04sMUEkv9H; Wed, 22 Mar 2023 09:34:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0C6536431C2D;
	Wed, 22 Mar 2023 09:34:40 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ISRELn3i-ccd; Wed, 22 Mar 2023 09:34:39 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id E0F0160719A6;
	Wed, 22 Mar 2023 09:34:39 +0100 (CET)
Date: Wed, 22 Mar 2023 09:34:39 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	pratyush <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, 
	Jaime Liao <jaimeliao.tw@gmail.com>, 
	Alvin Zhou <alvinzhou@mxic.com.tw>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>
Message-ID: <1424924498.273909.1679474079885.JavaMail.zimbra@nod.at>
In-Reply-To: <20230310085452.1368716-1-miquel.raynal@bootlin.com>
References: <20230310085452.1368716-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: nandsim: Artificially prevent sequential
 page reads
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: rawnand: nandsim: Artificially prevent sequential page reads
Thread-Index: 4iY3blAxMewiDlyH/NCbZFLrqfL2eA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_013452_678652_F9CA76E2 
X-CRM114-Status: GOOD (  26.02  )
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
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IFRoZSBjb250aW51b3VzIHJlYWQgc3VwcG9ydCBh
ZGRlZCByZWNlbnRseSBtYWtlcyBuYW5kc2ltCj4gdW5oYXBweS4gSW5kZWVkLCBhbGwgdGhlIHN1
cHBvcnRlZCBjb21tYW5kcyBzaG91bGQgYmUgcmUtZW5jb2RlZCBpbnRvCj4gaW50ZXJuYWwgY29t
bWFuZHMsIHNvIG9mIGNvdXJzZSB0aGVyZSBpcyBjdXJyZW50bHkgbm8gc3VwcG9ydCBmb3IgdGhl
Cj4gY29tbWFuZHMgYW5kIHBhdHRlcm5zIG5lZWRlZCBmb3IgY29udGludW91cyByZWFkcyB0byB3
b3JrLgo+IAo+IEkgdHJpZWQgdG8gYWRkIHN1cHBvcnQgZm9yIHRoZW0gYnV0IG5hbmRzaW0gKHdo
aWNoIGlzIG1vcmUgYSB0b29sIHRvCj4gZGV2ZWxvcC9kZWJ1ZyB1cHBlciBsYXllcnMgcmF0aGVy
IHRoYW4gdGhlIHJhdyBOQU5EIGNvcmUpIHN1ZmZlcnMgZnJvbSBhCj4gYmlnIGxpbWl0YXRpb246
IGl0J3MgaW50ZXJuYWwgcGFyc2VyIG5lZWRzIHRvIGtub3cgd2hhdCBleGFjdCBvcGVyYXRpb24K
PiBpcyBoYXBwZW5pbmcgd2hlbiB0aGUgYWRkcmVzcyBjeWNsZXMgYXJlIHBlcmZvcm1lZC4gVGhl
IHJlc2VhcmNoIGlzIHRoZW4KPiBzZXF1ZW50aWFsIGZyb20gdGhlIHN0YXJ0IHVwIHRvIHRoZSBh
ZGRyZXNzIGN5Y2xlcywgYnV0IGRvZXMgbm90IGNoZWNrCj4gd2hhdCdzIGNvbWluZyBuZXh0IGV2
ZW4gdGhvdWdoIHRoZSBpbmZvcm1hdGlvbiBpcyBhdmFpbGFibGUuIFRoaXMgaXMgYQo+IGxpbWl0
YXRpb24gd2hpY2ggaXMgcmVsYXRlZCB0byB0aGUgb2xkIEFQSSB1c2VkIGJ5IHRoZSBjb3JlIHdo
aWNoIGtpbmQKPiBvZiBmb3JjZWQgdGhlIGNvbnRyb2xsZXJzIHRvIGd1ZXNzIHdoYXQgb3BlcmF0
aW9uIHdhcyBiZWluZyBwZXJmb3JtZWQKPiByYXRoZXIgZWFybHkuIFRvZGF5IHRoZSBjb3JlIHVz
ZXMgYSBtb3JlIHRyYW5zcGFyZW50IEFQSSBjYWxsZWQKPiAtPmV4ZWNfb3AoKSB3aGljaCBubyBs
b25nZXIgcmVxdWlyZXMgY29udHJvbGxlciBkcml2ZXJzIHRvIGRvIGFueSBtb3JlCj4gZ3Vlc3Np
bmcsIGJ1dCBkZXNwaXRlIGJlaW5nIHVwZGF0ZWQgdG8gLT5leGVjX29wKCksIG5hbmRzaW0gaXMg
c3RpbGwgYQo+IGJpdCBjb25zdHJhaW5lZCBvbiB0aGlzIHJlZ2FyZCBhbmQgdGh1cyBjYW5ub3Qg
aGFuZGxlIHNlcXVlbnRpYWwgcGFnZQo+IHJlYWRzIGJlY2F1c2UgdGhlIHN0YXJ0IHNlcXVlbmNl
IGJlZ2lubmluZyBpcyBpZGVudGljYWwgdG8gYSByZWd1bGFyCj4gcGFnZSByZWFkLgo+IAo+IElm
IHRoZSBpbnRlcm5hbCBhbGdvcml0aG0gaXMgdXBkYXRlZCBzb21lIGRheSwgaXQgc2hvdWxkIGJl
IHBvc3NpYmxlIHRvCj4gbWFrZSBpdCBzdXBwb3J0IHNlcXVlbnRpYWwgcGFnZSByZWFkcyBieSBh
ZGRpbmcgc29tZXRoaW5nIGxpa2U6Cj4gCj4gICAgICAgLyogTGFyZ2UgcGFnZSBkZXZpY2VzIGNv
bnRpbnVvdXMgcmVhZCBwYWdlIHN0YXJ0ICovCj4gICAgICAge09QVF9MQVJHRVBBR0UsIHtTVEFU
RV9DTURfUkVBRDAsIFNUQVRFX0FERFJfUEFHRSwgU1RBVEVfQ01EX1JFQURTVEFSVCwKPiAgICAg
ICAgICAgICAgICAgICAgICAgIFNUQVRFX0NNRF9SRUFEQ0FDSEVTRVEgfCBBQ1RJT05fQ1BZLCBT
VEFURV9EQVRBT1VULAo+ICAgICAgICAgICAgICAgICAgICAgICAgU1RBVEVfUkVBRFl9fSwKPiAg
ICAgICAvKiBMYXJnZSBwYWdlIGRldmljZXMgY29udGludW91cyByZWFkIHBhZ2UgY29udGludWUg
Ki8KPiAgICAgICB7T1BUX0xBUkdFUEFHRSwge1NUQVRFX0NNRF9SRUFEQ0FDSEVTRVEgfCBBQ1RJ
T05fQ1BZX05FWFQsIFNUQVRFX0RBVEFPVVQsCj4gICAgICAgICAgICAgICAgICAgICAgICBTVEFU
RV9SRUFEWX19LAo+ICAgICAgIC8qIExhcmdlIHBhZ2UgZGV2aWNlcyBjb250aW51b3VzIHJlYWQg
cGFnZSBlbmQgKi8KPiAgICAgICB7T1BUX0xBUkdFUEFHRSwge1NUQVRFX0NNRF9SRUFEQ0FDSEVF
TkQgfCBBQ1RJT05fQ1BZX05FWFQsIFNUQVRFX0RBVEFPVVQsCj4gICAgICAgICAgICAgICAgICAg
ICAgICBTVEFURV9SRUFEWX19LAo+IAo+IEZvciBub3csIHdlIGp1c3QgcmV0dXJuIC1FT1BOT1RT
VVBQIHdoZW4gdGhlIGNvcmUgYXNrcyBjb250cm9sbGVyCj4gZHJpdmVycyBpZiB0aGV5IHN1cHBv
cnQgdGhlIGZlYXR1cmUgaW4gb3JkZXIgdG8gcHJldmVudCBhbnkgZnVydGhlciB1c2UKPiBvZiB0
aGVzZSBvcGNvZGVzLgo+IAo+IE5vdGU6IFRoaXMgaXMgYSBoYWNrLCAtPmV4ZWNfb3AoKSBpcyBu
b3Qgc3VwcG9zZWQgdG8gY2hlY2sgYWdhaW5zdCB0aGUKPiBDT01NQU5EIG9wY29kZXMgdW5sZXNz
IF9yZWFsbHlfIG5lZWRlZC4KPiAKPiBGaXhlczogMDAzZmU0Yjk1NDViICgibXRkOiByYXduYW5k
OiBTdXBwb3J0IGZvciBzZXF1ZW50aWFsIGNhY2hlIHJlYWRzIikKPiBSZXBvcnRlZC1ieTogWmhp
aGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBMaW5rOgo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LW10ZC9mZDM0ZmU1NS03ZjRhLTAzMGQtODY1My05YmI5Y2YwODQx
MGRAaHVhd2VpLmNvbS8KPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgo+IC0tLQo+IGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRzaW0uYyB8
IDE3ICsrKysrKysrKysrKysrKystCj4gMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFu
ZHNpbS5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jCj4gaW5kZXggYzIxYWJmNzQ4
OTQ4Li4xNzliMjg0NTliNGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFu
ZHNpbS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jCj4gQEAgLTIxNjAs
OCArMjE2MCwyMyBAQCBzdGF0aWMgaW50IG5zX2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hpcCAqY2hp
cCwgY29uc3QKPiBzdHJ1Y3QgbmFuZF9vcGVyYXRpb24gKm9wLAo+IAljb25zdCBzdHJ1Y3QgbmFu
ZF9vcF9pbnN0ciAqaW5zdHIgPSBOVUxMOwo+IAlzdHJ1Y3QgbmFuZHNpbSAqbnMgPSBuYW5kX2dl
dF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gCj4gLQlpZiAoY2hlY2tfb25seSkKPiArCWlmIChj
aGVja19vbmx5KSB7Cj4gKwkJLyogVGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgbmFuZHNp
bSBuZWVkcyB0byBrbm93IHRoZQo+ICsJCSAqIG9uZ29pbmcgb3BlcmF0aW9uIHdoZW4gcGVyZm9y
bWluZyB0aGUgYWRkcmVzcyBjeWNsZXMuIFRoaXMKPiArCQkgKiBtZWFucyBpdCBjYW5ub3QgbWFr
ZSB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIGEgcmVndWxhciByZWFkCj4gKwkJICogYW5kIGEgY29u
dGludW91cyByZWFkLiBIZW5jZSwgdGhpcyBoYWNrIHRvIG1hbnVhbGx5IHJlZnVzZQo+ICsJCSAq
IHN1cHBvcnRpbmcgc2VxdWVudGlhbCBjYWNoZWQgb3BlcmF0aW9ucy4KPiArCQkgKi8KPiArCQlm
b3IgKG9wX2lkID0gMDsgb3BfaWQgPCBvcC0+bmluc3Ryczsgb3BfaWQrKykgewo+ICsJCQlpbnN0
ciA9ICZvcC0+aW5zdHJzW29wX2lkXTsKPiArCQkJaWYgKGluc3RyLT50eXBlID09IE5BTkRfT1Bf
Q01EX0lOU1RSICYmCj4gKwkJCSAgICAoaW5zdHItPmN0eC5jbWQub3Bjb2RlID09IE5BTkRfQ01E
X1JFQURDQUNIRUVORCB8fAo+ICsJCQkgICAgIGluc3RyLT5jdHguY21kLm9wY29kZSA9PSBOQU5E
X0NNRF9SRUFEQ0FDSEVTRVEpKQo+ICsJCQkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICsJCX0KPiAr
Cj4gCQlyZXR1cm4gMDsKPiArCX0KPiAKPiAJbnMtPmxpbmVzLmNlID0gMTsKCkFja2VkLWJ5OiBS
aWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgoKVGhhbmtzLAovL3JpY2hhcmQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
