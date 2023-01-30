Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF35C54EED
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 16:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/zDtLYISc0SRlPFptyMfaO1PP1saW7YwdlhhsKQCwQ=; b=NKr011R2Vu7Po/
	gVjM7NWJRXwBViZUTb7GS6xEBvVzMfVwssLgnZ1tAdUz52Dbt0vZLAd2HWKP/XKL5U7i1nsJ79/Kx
	ZAvG77Mw2bcqVfUec+BbaGd7ue/VNeF9RQVAEl6J4i9d8WL2e5qWKzyfA4Bgsq6SFxXegsuktnooW
	2+gOMzqnldxJdlx3CXnHGg4dgeVUysV8LxMSHrHlwHO8gAFbavWFM48OCM7tFkFPQwc5aqFXzVvXR
	s/hfu7f9jH3Bi5HCU8DU+/dm4Vm9b3fd2W/wtSRF+vvB6nKU7hoQn+4zWM2l4D+DvNvDBbXFYbfyU
	ugppNjDNDSMulQMutP7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWgV-0049sb-To; Mon, 30 Jan 2023 16:07:07 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWfv-0049rJ-T9
	for linux-mtd@lists.infradead.org; Mon, 30 Jan 2023 16:06:33 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2AFCD2000C;
	Mon, 30 Jan 2023 16:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675094788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XuA7wb5OmWItqs+RnDjlDI9NcuNfDc0msk3tAlZKBuk=;
	b=m1YGJXI+YCNKmkIHInsmq+mAlXVUxf7pnqIrwSjZFjdcvfA9uLe4K2dHDkDdxndf3YXDhK
	lirO3RtX963ikx+N4CMEg8VKreb2WaQv12D6sd8KNcvseZi0kWF6ymZYLEx8FxmDSDmfif
	DTSar2U1SXQiFa7Xq2LnPX33Ol+wQnJZMjsXqUPW8iMLKhNyu2X8Zaf7BfBzuuANH0nwAD
	7VLU5D4LvmuXjP+o35sZu8RLIZheN0t0AJBInCL1Zq3z84MkzX3Y2waRFJGgy8KEreMu/o
	a7cvHowQXlLFzaOr3mFIM9g5YJjiw446G7GesgeIUeBq6lsOJFv7GnnDiveP9w==
Date: Mon, 30 Jan 2023 17:06:22 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Jaime Liao <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Subject: Re: [PATCH] mtd: rawnand: Fix nand_chip kdoc
Message-ID: <20230130170622.6f48bed3@xps-13>
In-Reply-To: <20230116094735.11483-1-miquel.raynal@bootlin.com>
References: <20230116094735.11483-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_080632_112620_34750CC8 
X-CRM114-Status: GOOD (  13.22  )
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

SGVsbG8sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIE1vbiwgMTYgSmFuIDIw
MjMgMTA6NDc6MzUgKzAxMDA6Cgo+IERlc2NyaWJlIHRoZSBjb250aW51b3VzIHJlYWQgbmFuZF9j
aGlwIGZpZWxkcyB0byBhdm9pZCB0aGUgZm9sbG93aW5nCj4gaHRtbGRvY3Mgd2FybmluZzoKPiBp
bmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmg6MTMyNTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1l
dGVyIG9yIG1lbWJlcgo+ICdjb250X3JlYWQnIG5vdCBkZXNjcmliZWQgaW4gJ25hbmRfY2hpcCcK
PiAKPiBSZXBvcnRlZC1ieTogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+
Cj4gRml4ZXM6IDAwM2ZlNGI5NTQ1YiAoIm10ZDogcmF3bmFuZDogU3VwcG9ydCBmb3Igc2VxdWVu
dGlhbCBjYWNoZSByZWFkcyIpCj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4KPiAtLS0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LgoKPiAgaW5j
bHVkZS9saW51eC9tdGQvcmF3bmFuZC5oIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5o
IGIvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oCj4gaW5kZXggMWIwOTM2ZmUzYzZlLi5mOGQ0
YmU5YzU4N2EgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oCj4gKysr
IGIvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oCj4gQEAgLTEyNjAsNiArMTI2MCwxMCBAQCBz
dHJ1Y3QgbmFuZF9zZWN1cmVfcmVnaW9uIHsKPiAgICogQHJlYWRfcmV0cmllczogVGhlIG51bWJl
ciBvZiByZWFkIHJldHJ5IG1vZGVzIHN1cHBvcnRlZAo+ICAgKiBAc2VjdXJlX3JlZ2lvbnM6IFN0
cnVjdHVyZSBjb250YWluaW5nIHRoZSBzZWN1cmUgcmVnaW9ucyBpbmZvCj4gICAqIEBucl9zZWN1
cmVfcmVnaW9uczogTnVtYmVyIG9mIHNlY3VyZSByZWdpb25zCj4gKyAqIEBjb250X3JlYWQ6IFNl
cXVlbnRpYWwgcGFnZSByZWFkIGludGVybmFscwo+ICsgKiBAY29udF9yZWFkLm9uZ29pbmc6IFdo
ZXRoZXIgYSBjb250aW51b3VzIHJlYWQgaXMgb25nb2luZyBvciBub3QKPiArICogQGNvbnRfcmVh
ZC5maXJzdF9wYWdlOiBTdGFydCBvZiB0aGUgY29udGludW91cyByZWFkIG9wZXJhdGlvbgo+ICsg
KiBAY29udF9yZWFkLmxhc3RfcGFnZTogRW5kIG9mIHRoZSBjb250aW51b3VzIHJlYWQgb3BlcmF0
aW9uCj4gICAqIEBjb250cm9sbGVyOiBUaGUgaGFyZHdhcmUgY29udHJvbGxlcglzdHJ1Y3R1cmUg
d2hpY2ggaXMgc2hhcmVkIGFtb25nIG11bHRpcGxlCj4gICAqICAgICAgICAgICAgICBpbmRlcGVu
ZGVudCBkZXZpY2VzCj4gICAqIEBlY2M6IFRoZSBFQ0MgY29udHJvbGxlciBzdHJ1Y3R1cmUKCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
