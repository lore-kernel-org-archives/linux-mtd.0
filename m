Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9561DC2BA4C
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 09:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dx2WoHwF18DTl8RmFMochihGYRb9r3NTueVFDoe4eYo=; b=U7L1pHO3LDRlDy
	tqgnxob1YzhXnP/HFZO68iA3aCg1HXrc3j1EXP8V9HpV2F+NwRDtDfc4GjqcETQ6kH9n4VbN5JamW
	sWSUbZZoGIqVFCREeJZzmTGKFjfjjFMXnfAsQfLWJSlKO8yxe5HIHTqurftMVEOkquNaTTDYmB2Oh
	mMwzSJSGLjEu+6PpRcxlYTsmAfaOZ4tEHXTrspLfxc+7UVEENXQirh/OxNbC/VnUAqm+IQHxsPqU4
	/ehLkjtH7WaIWuqhI3aMiHRBh3TJ4jiwzFO9FbjdIawbO9HjobGz2YCR3pKE42Rwj0vf+dRKKUsz2
	dv8IxQ3N7OGz35y+ovlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCeKA-00As6t-BF; Wed, 26 Jan 2022 09:10:42 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCeK6-00As4j-Po
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 09:10:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6BFD420009;
 Wed, 26 Jan 2022 09:10:36 +0000 (UTC)
Date: Wed, 26 Jan 2022 10:10:35 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: david regan <dregan@mail.com>, linux-mtd@lists.infradead.org, Kamal Dasu
 <kdasu.kdev@gmail.com>, Joel Peshkin <joel.peshkin@broadcom.com>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: Fixed incorrect sub-page ECC
 status
Message-ID: <20220126101035.709ef839@xps13>
In-Reply-To: <5ea1a3c7-a8fa-f88e-7575-8d8e96833398@gmail.com>
References: <trinity-0c92e0e4-dcf8-4753-a934-f2cc41b5e6de-1642021707668@3c-app-mailcom-lxa14>
 <5ea1a3c7-a8fa-f88e-7575-8d8e96833398@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_011039_003214_05D45A3F 
X-CRM114-Status: GOOD (  16.22  )
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

SGkgRmxvcmlhbiwKCmYuZmFpbmVsbGlAZ21haWwuY29tIHdyb3RlIG9uIFR1ZSwgMjUgSmFuIDIw
MjIgMTA6NTk6MTkgLTA4MDA6Cgo+ICtNaXF1ZWwsCj4gCj4gT24gMS8xMi8yMDIyIDE6MDggUE0s
IGRhdmlkIHJlZ2FuIHdyb3RlOgo+ID4gVGhlIGJyY21uYW5kIGRyaXZlciBjb250YWlucyBhIGJ1
ZyBpbiB3aGljaCBpZiBhIHBhZ2UgKGV4YW1wbGUgMmsgYnl0ZSkKPiA+IGlzIHJlYWQgZnJvbSB0
aGUgcGFyYWxsZWwvT05GSSBOQU5EIGFuZCB3aXRoaW4gdGhhdCBwYWdlIGEgc3VicGFnZSAoNTEy
Cj4gPiBieXRlKSBoYXMgY29ycmVjdGFibGUgZXJyb3JzIHdoaWNoIGlzIGZvbGxvd2VkIGJ5IGEg
c3VicGFnZSB3aXRoCj4gPiB1bmNvcnJlY3RhYmxlIGVycm9ycywgdGhlIHBhZ2UgcmVhZCB3aWxs
IHJldHVybiB0aGUgd3Jvbmcgc3RhdHVzIG9mCj4gPiBjb3JyZWN0YWJsZSAoYXMgb3Bwb3NlZCB0
byB0aGUgYWN0dWFsIHN0YXR1cyBvZiB1bmNvcnJlY3RhYmxlLikKPiA+IAo+ID4gVGhlIGJ1ZyBp
cyBpbiBmdW5jdGlvbiBicmNtbmFuZF9yZWFkX2J5X3BpbyB3aGVyZSB0aGVyZSBpcyBhIGNoZWNr
IGZvcgo+ID4gdW5jb3JyZWN0YWJsZSBiaXRzIHdoaWNoIHdpbGwgYmUgcHJlZW1wdGVkIGlmIGEg
cHJldmlvdXMgc3RhdHVzIGZvcgo+ID4gY29ycmVjdGFibGUgYml0cyBpcyBkZXRlY3RlZC4KPiA+
IAo+ID4gVGhlIGZpeCBpcyB0byBzdG9wIGNoZWNraW5nIGZvciBiYWQgYml0cyBvbmx5IGlmIHdl
IGFscmVhZHkgaGF2ZSBhIGJhZAo+ID4gYml0cyBzdGF0dXMuCj4gPiAKPiA+IEZpeGVzOiAyN2M1
YjE3Y2QxYjEgKCJtdGQ6IG5hbmQ6IGFkZCBOQU5EIGRyaXZlciAibGlicmFyeSIgZm9yIEJyb2Fk
Y29tIFNUQiBOQU5EIGNvbnRyb2xsZXIiKQo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBkYXZpZCBy
ZWdhbiA8ZHJlZ2FuQG1haWwuY29tPiAgCj4gCj4gTWlxdWVsIHNpbmNlIHlvdSB3ZXJlIG5vdCBj
b3BpZWQgZXhwbGljaXRseSwgYWRkaW5nIHlvdSBub3cuIFJlLXNlbmRpbmcgbXkgdGFnOgo+IAo+
IFJldmlld2VkLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4KClJp
Z2h0IEkgbWlzc2VkIHRoYXQuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
