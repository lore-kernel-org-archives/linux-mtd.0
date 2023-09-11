Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFB4EE7FF4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 15:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=220AFL8fhf43WPPwngXENiIF5mmQSd+LBxKID+3ozcs=; b=JFOmo5MXRpBq0l
	qIHqbw+J5FCRH0kK1BIjD8WP8l6VKctMd6yAuVrazOMEO0dJp+K3/1zkCuNpsg3318cY10UNlcue0
	EsW61e5k10ZILFpFHVI+ywLV24UHjgUkTpgGx4BBwhr8P0Bz/MfGWEfazyb593q+aUlrSXL816QzV
	I6MYOgtGGtEeX5GNTLS5twsBUl36tVICslIY4hcgBu09ff0Y9WfAoqfSk9VrkxRQ6R+U+GnK2a8AS
	oTCOyyXqlT8JYkQJsJ6mKnBRTY8nx18GGBtb6R5ivUnXwTODX2zfNKqH6y7syIf2fmfxeUPwbJIyM
	H/uafjAzoiXHGAPmS9Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjEa-000wYy-2R;
	Mon, 11 Sep 2023 15:53:56 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjEX-000wWt-37
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 15:53:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77D13C0007;
	Mon, 11 Sep 2023 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694447629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u2f5lbfZPYd8C2pVuPX+yj1FqH0A7MGZvRTckaUi4Rc=;
	b=M4pzQvXTevYM8Jyj3rqfQ4VlmWwhARWFptZoycJ54P9aP/0WBHlObqVso2spX20+1N2rHo
	hV8YHTm2LDl6Lf5p8G92CdK/E9QBI6fHFAH1bXgNtsuyPIcgeWYC9w5p2kXeNa1LGmsDMR
	8CsqvB8dUeQes2ieiuHt9zcOV7ibpk4kWbyR/vzqWnJNd1hcbTiTEe5PZ6nRfZG+ZXq28K
	L9qnynyeuea9KHiFdJbN3yILswMbmitVqhP7Z1/SWNbeYCgmZfOOKo/GUXwckZiUrfFYqZ
	wzsvsQqvZuHPiKdUl1AZ3/VAnYc1s3Cv16Hiv7hFZ1k1WAyYRAQC5AyQu5mTrw==
Date: Mon, 11 Sep 2023 17:52:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Michal Simek
 <michal.simek@amd.com>, stable@vger.kernel.org
Subject: Re: [PATCH 2/3] mtd: rawnand: arasan: Ensure program page
 operations are successful
Message-ID: <20230911175247.44c1d894@xps-13>
In-Reply-To: <20230717194221.229778-2-miquel.raynal@bootlin.com>
References: <20230717194221.229778-1-miquel.raynal@bootlin.com>
	<20230717194221.229778-2-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_085354_138063_A0A91765 
X-CRM114-Status: GOOD (  16.44  )
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

SGkgTWljaGFsLAoKbWlxdWVsLnJheW5hbEBib290bGluLmNvbSB3cm90ZSBvbiBNb24sIDE3IEp1
bCAyMDIzIDIxOjQyOjIwICswMjAwOgoKPiBUaGUgTkFORCBjb3JlIGNvbXBsaWVzIHdpdGggdGhl
IE9ORkkgc3BlY2lmaWNhdGlvbiwgd2hpY2ggaXRzZWxmCj4gbWVudGlvbnMgdGhhdCBhZnRlciBh
bnkgcHJvZ3JhbSBvciBlcmFzZSBvcGVyYXRpb24sIGEgc3RhdHVzIGNoZWNrCj4gc2hvdWxkIGJl
IHBlcmZvcm1lZCB0byBzZWUgd2hldGhlciB0aGUgb3BlcmF0aW9uIHdhcyBmaW5pc2hlZCAqYW5k
Kgo+IHN1Y2Nlc3NmdWwuCj4gCj4gVGhlIE5BTkQgY29yZSBvZmZlcnMgaGVscGVycyB0byBmaW5p
c2ggYSBwYWdlIHdyaXRlIChzZW5kaW5nIHRoZQo+ICJQQUdFIFBST0ciIGNvbW1hbmQsIHdhaXRp
bmcgZm9yIHRoZSBOQU5EIGNoaXAgdG8gYmUgcmVhZHkgYWdhaW4sIGFuZAo+IGNoZWNraW5nIHRo
ZSBvcGVyYXRpb24gc3RhdHVzKS4gQnV0IGluIHNvbWUgY2FzZXMsIGFkdmFuY2VkIGNvbnRyb2xs
ZXIKPiBkcml2ZXJzIG1pZ2h0IHdhbnQgdG8gb3B0aW1pemUgdGhpcyBhbmQgY3JhZnQgdGhlaXIg
b3duIHBhZ2Ugd3JpdGUKPiBoZWxwZXIgdG8gbGV2ZXJhZ2UgYWRkaXRpb25hbCBoYXJkd2FyZSBj
YXBhYmlsaXRpZXMsIHRodXMgbm90IGFsd2F5cwo+IHVzaW5nIHRoZSBjb3JlIGZhY2lsaXRpZXMu
Cj4gCj4gU29tZSBkcml2ZXJzLCBsaWtlIHRoaXMgb25lLCBkbyBub3QgdXNlIHRoZSBjb3JlIGhl
bHBlciB0byBmaW5pc2ggYSBwYWdlCj4gd3JpdGUgYmVjYXVzZSB0aGUgZmluYWwgY3ljbGVzIGFy
ZSBhdXRvbWF0aWNhbGx5IG1hbmFnZWQgYnkgdGhlCj4gaGFyZHdhcmUuIEluIHRoaXMgY2FzZSwg
dGhlIGFkZGl0aW9uYWwgY2FyZSBtdXN0IGJlIHRha2VuIHRvIG1hbnVhbGx5Cj4gcGVyZm9ybSB0
aGUgZmluYWwgc3RhdHVzIGNoZWNrLgo+IAo+IExldCdzIHJlYWQgdGhlIE5BTkQgY2hpcCBzdGF0
dXMgYXQgdGhlIGVuZCBvZiB0aGUgcGFnZSB3cml0ZSBoZWxwZXIgYW5kCj4gcmV0dXJuIC1FSU8g
dXBvbiBlcnJvci4KPgo+IENjOiBNaWNoYWwgU2ltZWsgPG1pY2hhbC5zaW1la0BhbWQuY29tPgo+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gRml4ZXM6IDg4ZmZlZjFiNjVjZiAoIm10ZDog
cmF3bmFuZDogYXJhc2FuOiBTdXBwb3J0IHRoZSBoYXJkd2FyZSBCQ0ggRUNDIGVuZ2luZSIpCj4g
U2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
PiAKPiAtLS0KPiAKPiBIZWxsbyBNaWNoYWwsCj4gCj4gSSBoYXZlIG5vdCB0ZXN0ZWQgdGhpcywg
YnV0IGJhc2VkIG9uIGEgcmVwb3J0IG9uIGFub3RoZXIgZHJpdmVyLCBJCj4gYmVsaWV2ZSB0aGUg
c3RhdHVzIGNoZWNrIGlzIGFsc28gbWlzc2luZyBoZXJlIGFuZCBjb3VsZCBzb21ldGltZXMKPiBs
ZWFkIHRvIHVubm90aWNlZCBwYXJ0aWFsIHdyaXRlcy4KPiAKPiBQbGVhc2UgdGVzdCBvbiB5b3Vy
IHNpZGUgdGhhdCBldmVyeXRoaW5nIHN0aWxsIHdvcmtzIGFuZCBsZXQgbWUKPiBrbm93IGhvdyBp
dCBnb2VzLgoKQW55IG5ld3MgZnJvbSB0aGUgdGVzdGluZyB0ZWFtIGFib3V0IHBhdGNoZXMgMi8z
IGFuZCAzLzM/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
