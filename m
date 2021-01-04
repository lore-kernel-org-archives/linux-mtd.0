Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C8CC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 09:09:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5891721D93
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 09:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5891721D93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=10YA+QnN77lGFdXrS3oOhZbXndDN/n8ymi4sdLqIyuU=; b=1Qs7gGO0ohlioerJf/Bhx6yZU
	o685y65UURXSQzw6M2jExD1WW9WD8IDWGK3zpvwaDvih7o+ONc2/Xs6jgc3TTF6V3587slFtWTb6p
	kMTsScaynbUFP9KZZDKgL4Bi6VDOmJlVaE6hDjjNL9hHKkZoUIdD4dUbXiOPGThL+sAA66qZSSH//
	jUi0uZMD1D7kQbqxhFQXiT3RN90ShpfT7tAWHxxLPGSQESxVBkBD1HccQIXbyNvavSWoAb1NX9UVu
	NM0t1Bn5W+7mZ5x4Rj6nI9Te+CeQ0/bisgbeXlOr2CAXcvTC+oFWU/3ZP61on48pXEtCa3oDa+R/D
	MDCcYCSnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwLqq-00013z-3x; Mon, 04 Jan 2021 09:08:32 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwLqn-00013F-Ja
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 09:08:30 +0000
X-Originating-IP: 90.89.98.255
Received: from xps13 (lfbn-tou-1-1535-bdcst.w90-89.abo.wanadoo.fr
 [90.89.98.255]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 4F7661BF215;
 Mon,  4 Jan 2021 09:08:20 +0000 (UTC)
Date: Mon, 4 Jan 2021 10:08:19 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ian Goegebuer <goegebuer@google.com>
Subject: Re: [PATCH] mtd: parser: cmdline: Support MTD names containing one
 or more colons
Message-ID: <20210104100819.1d623425@xps13>
In-Reply-To: <20201223215630.1917891-1-goegebuer@google.com>
References: <1887c783-7a80-a71c-949f-c07c83c2d0fe@ti.com>
 <20201223215630.1917891-1-goegebuer@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_040829_775135_AC004885 
X-CRM114-Status: GOOD (  20.94  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Jethro Beekman <jethro@fortanix.com>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 "Ronald G . Minnich" <rminnich@google.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gSWFuLCAKCklhbiBHb2VnZWJ1ZXIgPGdvZWdlYnVlckBnb29nbGUuY29tPiB3cm90ZSBv
biBXZWQsIDIzIERlYyAyMDIwIDEzOjU2OjMwCi0wODAwOgoKPiBPbiBJbnRlbCBwbGF0Zm9ybXMs
IHRoZSB1c2FibGUgU1BJIGFyZWEgaXMgbG9jYXRlZCBzZXZlcmFsCj4gTWlCIGluIGZyb20gdGhl
IHN0YXJ0LCB0byBsZWF2ZSByb29tIGZvciBkZXNjcmlwdG9ycyBhbmQKPiB0aGUgTWFuYWdlbWVu
dCBFbmdpbmUgYmluYXJ5LiBGdXJ0aGVyLCBub3QgYWxsIHRoZSByZW1haW5pbmcKPiBzcGFjZSBj
YW4gYmUgdXNlZCwgYXMgdGhlIGxhc3QgMTYgTWlCIGNvbnRhaW5zIGZpcm13YXJlLgo+IAo+IFRv
IG1ha2UgdGhlIFNQSSB1c2FibGUgZm9yIG10ZGJsb2NrIGFuZCBvdGhlciBkZXZpY2VzLAo+IGl0
IGlzIG5lY2Vzc2FyeSB0byBlbmFibGUgY29tbWFuZCBsaW5lIHBhcnRpdGlvbnMgc28gdGhlCj4g
bWlkZGxlIHVzYWJsZSByZWdpb24gY2FuIGJlIHNwZWNpZmllZC4KPiAKPiBBZGQgYSBwYXJ0X3By
b2JlcyBhcnJheSB3aGljaCBpbmNsdWRlcyBvbmx5ICJjbWRlbGluZXBhcnRzIiwKPiBhbmQgY2hh
bmdlIHRvIG10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0ZXIgdG8gdXNlIHRoaXMgcGFydF9wcm9iZXMu
CgpUaGUgY29tbWl0IHRpdGxlIHNlZW0gdG8gYmUgdGFrZW4gZnJvbSBhbm90aGVyIHBhdGNoIGFu
ZCBkb2VzIG5vdAptYXRjaCB0aGUgYmVsb3cgY2hhbmdlLiBPciBhbSBJIG1pc3Npbmcgc29tZXRo
aW5nPwoKPiBTaWduZWQtb2ZmLWJ5OiAiUm9uYWxkIEcuIE1pbm5pY2giIDxybWlubmljaEBnb29n
bGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IElhbiBHb2VnZWJ1ZXIgPGdvZWdlYnVlckBnb29nbGUu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL2ludGVsLXNwaS5j
IHwgNSArKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaW50
ZWwtc3BpLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL2ludGVsLXNwaS5jCj4g
aW5kZXggYjU0YTU2YTY4MTAwLi45ZGUzODg1MWM0MTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvc3BpLW5vci9jb250cm9sbGVycy9pbnRlbC1zcGkuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29udHJvbGxlcnMvaW50ZWwtc3BpLmMKPiBAQCAtOTAzLDYgKzkwMyw4IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9jb250cm9sbGVyX29wcyBpbnRlbF9zcGlfY29udHJvbGxl
cl9vcHMgPSB7Cj4gIAkuZXJhc2UgPSBpbnRlbF9zcGlfZXJhc2UsCj4gIH07Cj4gIAo+ICtzdGF0
aWMgY29uc3QgY2hhciAqIGNvbnN0IHBhcnRfcHJvYmVzW10gPSB7ICJjbWRsaW5lcGFydCIsIE5V
TEwgfTsKPiArCj4gIHN0cnVjdCBpbnRlbF9zcGkgKmludGVsX3NwaV9wcm9iZShzdHJ1Y3QgZGV2
aWNlICpkZXYsCj4gIAlzdHJ1Y3QgcmVzb3VyY2UgKm1lbSwgY29uc3Qgc3RydWN0IGludGVsX3Nw
aV9ib2FyZGluZm8gKmluZm8pCj4gIHsKPiBAQCAtOTUwLDcgKzk1Miw4IEBAIHN0cnVjdCBpbnRl
bF9zcGkgKmludGVsX3NwaV9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gIAlpZiAoIWlzcGkt
PndyaXRlYWJsZSB8fCAhd3JpdGVhYmxlKQo+ICAJCWlzcGktPm5vci5tdGQuZmxhZ3MgJj0gfk1U
RF9XUklURUFCTEU7Cj4gIAo+IC0JcmV0ID0gbXRkX2RldmljZV9yZWdpc3RlcigmaXNwaS0+bm9y
Lm10ZCwgJnBhcnQsIDEpOwo+ICsJcmV0ID0gbXRkX2RldmljZV9wYXJzZV9yZWdpc3RlcigmaXNw
aS0+bm9yLm10ZCwgcGFydF9wcm9iZXMsCj4gKwkJCQkJTlVMTCwgJnBhcnQsIDEpOwo+ICAJaWYg
KHJldCkKPiAgCQlyZXR1cm4gRVJSX1BUUihyZXQpOwo+ICAKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
