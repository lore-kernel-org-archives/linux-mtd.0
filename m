Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC93C54EBD
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 16:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=In0T7vjANbU+h6wUL0nsnUNFoZXpPbGBfO9aMpv7jxQ=; b=IABjh5WFgwPT6o
	8WZnWejbwJU7Ud1ldMEzs3Nhy2b6jF6KohFPrrJVowLGrTTPF4qSIq9XTUzarxygqUXqyimVWlrXz
	hHP5YggRMSQuEsbdHKIedFKs7YTaM7P6LbAPF9iFihwmvjZpTmBe/B3Ql9BesoRHKd4G7v/PeA1Q5
	McLrJN07RUDGcT/rGZpTjfw2u+lqcm7DG8pHJMpGZuUVbnDhOsN5l5+G4CZGb0JGkGm+uvWChvTMy
	l+sEaE8DYSHptcoKPqKXr4gFYoIsxS41QWhNYYwXthXJxxBpYn8xXWSJiePBGDy4jlFziIQkW8BcD
	qfxgEOySi1Ld8H29cnRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGN38-003SQG-3j; Fri, 13 Jan 2023 16:37:02 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGN33-003SOW-HK
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 16:36:59 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B66F224000E;
	Fri, 13 Jan 2023 16:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673627814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S100NOZa82PHHXnU6NzeATHAjLKlh4e+L0/HgPqAONE=;
	b=ZvTCVeXzmMtuqhKDihBRVR6cU3sJw+Jq5wMg5CiFWZoP7o1R7ZHIAW9yxg3Jk3jLzMJw0Y
	ZNhFFOyaXZ2OHUYnbQrB52n2YXSr0k4AqNAOT1NUeGAh42hFSq84k+ksTDT0L9RdsTLsrW
	m2Ip0Kv6rbcnKDUUKphG22ldyhHy3HnqUzbcBq4SpDk9PL8a7lwpeN37uMWX5tCxTqC0su
	37EFzGhTN9UAjb1INrvcJ3z1OjKGniKGfsz5VnvqTOSSFXaAXahW0ZZ3erGkp6tyCJG5ah
	GCgm80bDmo6JpxEYM9JJRtuXw/04GRwaFij9YnrKvwR9XbpjDrKu6X8D+DJt6A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	JaimeLiao <jaimeliao.tw@gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: Support for sequential cache reads
Date: Fri, 13 Jan 2023 17:36:52 +0100
Message-Id: <20230113163652.1296020-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112093637.987838-4-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'003fe4b9545b83cca4f7a7633695d1f69a0b0011'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_083657_872902_727C2EE0 
X-CRM114-Status: GOOD (  17.62  )
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

T24gVGh1LCAyMDIzLTAxLTEyIGF0IDA5OjM2OjM3IFVUQywgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBGcm9tOiBKYWltZUxpYW8gPGphaW1lbGlhby50d0BnbWFpbC5jb20+Cj4gCj4gQWRkIHN1cHBv
cnQgZm9yIHNlcXVlbnRpYWwgY2FjaGUgcmVhZHMgZm9yIGNvbnRyb2xsZXJzIHVzaW5nIHRoZSBn
ZW5lcmljCj4gY29yZSBoZWxwZXJzIGZvciB0aGVpciBmYXN0IHJlYWQvd3JpdGUgaGVscGVycy4K
PiAKPiBTZXF1ZW50aWFsIHJlYWRzIG1heSByZWR1Y2UgdGhlIG92ZXJoZWFkIHdoZW4gYWNjZXNz
aW5nIHBoeXNpY2FsbHkKPiBjb250aW51b3VzIGRhdGEgYnkgbG9hZGluZyBpbiBjYWNoZSB0aGUg
bmV4dCBwYWdlIHdoaWxlIHRoZSBwcmV2aW91cwo+IHBhZ2UgZ2V0cyBzZW50IG91dCBvbiB0aGUg
TkFORCBidXMuCj4gCj4gVGhlIE9ORkkgc3BlY2lmaWNhdGlvbiBwcm92aWRlcyB0aGUgZm9sbG93
aW5nIGFkZGl0aW9uYWwgY29tbWFuZHMgdG8KPiBoYW5kbGUgc2VxdWVudGlhbCBjYWNoZWQgcmVh
ZHM6Cj4gCj4gKiAweDMxIC0gUkVBRCBDQUNIRSBTRVFVRU5USUFMOgo+ICAgUmVxdWlyZXMgdGhl
IE5BTkQgY2hpcCB0byBsb2FkIHRoZSBuZXh0IHBhZ2UgaW50byBjYWNoZSB3aGlsZSBrZWVwaW5n
Cj4gICB0aGUgY3VycmVudCBjYWNoZSBhdmFpbGFibGUgZm9yIGhvc3QgcmVhZHMuCj4gKiAweDNG
IC0gUkVBRCBDQUNIRSBFTkQ6Cj4gICBUZWxscyB0aGUgTkFORCBjaGlwIHRoaXMgaXMgdGhlIGVu
ZCBvZiB0aGUgc2VxdWVudGlhbCBjYWNoZSByZWFkLCB0aGUKPiAgIGN1cnJlbnQgY2FjaGUgc2hh
bGwgcmVtYWluIGFjY2Vzc2libGUgZm9yIHRoZSBob3N0IGJ1dCBubyBtb3JlCj4gICBpbnRlcm5h
bCBjYWNoZSBsb2FkaW5nIG9wZXJhdGlvbiBpcyByZXF1aXJlZC4KPiAKPiBPbiB0aGUgYnVzLCBh
IG11bHRpIHBhZ2UgcmVhZCBvcGVyYXRpb24gaXMgY3VycmVudGx5IGhhbmRsZWQgbGlrZSB0aGlz
Ogo+IAo+IAkwMCAtLSBBRERSMSAtLSAzMCAtLSBXQUlUX1JEWSAodFIrdFJSKSAtLSBEQVRBMV9J
Tgo+IAkwMCAtLSBBRERSMiAtLSAzMCAtLSBXQUlUX1JEWSAodFIrdFJSKSAtLSBEQVRBMl9JTgo+
IAkwMCAtLSBBRERSMyAtLSAzMCAtLSBXQUlUX1JEWSAodFIrdFJSKSAtLSBEQVRBM19JTgo+IAo+
IFNlcXVlbnRpYWwgY2FjaGVkIHJlYWRzIG1heSBpbnN0ZWFkIGJlIGFjaGlldmVkIHdpdGg6Cj4g
Cj4gCTAwIC0tIEFERFIxIC0tIDMwIC0tIFdBSVRfUkRZICh0UikgLS0gXAo+IAkJICAgICAgIDMx
IC0tIFdBSVRfUkRZICh0UkNCU1krdFJSKSAtLSBEQVRBMV9JTiBcCj4gCQkgICAgICAgMzEgLS0g
V0FJVF9SRFkgKHRSQ0JTWSt0UlIpIC0tIERBVEEyX0lOIFwKPiAJCSAgICAgICAzRiAtLSBXQUlU
X1JEWSAodFJDQlNZK3RSUikgLS0gREFUQTNfSU4KPiAKPiBCZWxvdyBhcmUgdGhlIHJlYWQgc3Bl
ZWQgdGVzdCByZXN1bHRzIHdpdGggcmVndWxhciByZWFkcyBhbmQKPiBzZXF1ZW50aWFsIGNhY2hl
ZCByZWFkcywgb24gTlhQIGkuTVg2IFZBUi1TT00tU09MTyBpbiBtYXBwaW5nIG1vZGUgd2l0aAo+
IGEgTkFORCBjaGlwIGNoYXJhY3Rlcml6ZWQgd2l0aCB0aGUgZm9sbG93aW5nIHRpbWluZ3M6Cj4g
KiB0UjogMjAgwrVzCj4gKiB0UkNCU1k6IDUgwrVzCj4gKiB0UlI6IDIwIG5zCj4gYW5kIHRoZSBm
b2xsb3dpbmcgZ2VvbWV0cnk6Cj4gKiBkZXZpY2Ugc2l6ZTogMiBNaUIKPiAqIGVyYXNlYmxvY2sg
c2l6ZTogMTI4IGtpQgo+ICogcGFnZSBzaXplOiAyIGtpQgo+IAo+ID09PT09PT09PT09PT0gTm9y
bWFsIHJlYWQgQCAzM01IeiA9PT09PT09PT09PT09PT09PQo+IG10ZF9zcGVlZHRlc3Q6IGVyYXNl
YmxvY2sgcmVhZCBzcGVlZCBpcyAxNTYzMyBLaUIvcwo+IG10ZF9zcGVlZHRlc3Q6IHBhZ2UgcmVh
ZCBzcGVlZCBpcyAxNTUxNSBLaUIvcwo+IG10ZF9zcGVlZHRlc3Q6IDIgcGFnZSByZWFkIHNwZWVk
IGlzIDE1Mzk4IEtpQi9zCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Cj4gCj4gPT09PT09PT09IFNlcXVlbnRpYWwgY2FjaGUgcmVhZCBAIDMzTUh6
ID09PT09PT09PT09Cj4gbXRkX3NwZWVkdGVzdDogZXJhc2VibG9jayByZWFkIHNwZWVkIGlzIDE4
Mjg1IEtpQi9zCj4gbXRkX3NwZWVkdGVzdDogcGFnZSByZWFkIHNwZWVkIGlzIDE1ODc1IEtpQi9z
Cj4gbXRkX3NwZWVkdGVzdDogMiBwYWdlIHJlYWQgc3BlZWQgaXMgMTYyNTMgS2lCL3MKPiA9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAKPiBXZSBv
YnNlcnZlIGFuIG92ZXJhbGwgc3BlZWQgaW1wcm92ZW1lbnQgb2YgYWJvdXQgNSUgd2hlbiByZWFk
aW5nCj4gMiBwYWdlcywgdXAgdG8gMTUlIHdoZW4gcmVhZGluZyBhbiBlbnRpcmUgYmxvY2suIFRo
aXMgaXMgZHVlIHRvIHRoZQo+IH4xNHVzIGdhaW4gb24gZWFjaCBhZGRpdGlvbmFsIHBhZ2UgcmVh
ZCAodFIgLSAodFJDQlNZICsgdFJSKSkuCj4gCj4gQ28tZGV2ZWxvcGVkLWJ5OiBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBS
YXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFpbWVM
aWFvIDxqYWltZWxpYW8udHdAZ21haWwuY29tPgo+IFRlc3RlZC1ieTogTGlhbyBKYWltZSA8amFp
bWVsaWFvLnR3QGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBuYW5kL25leHQuCgpNaXF1ZWwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
