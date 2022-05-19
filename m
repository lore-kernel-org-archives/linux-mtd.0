Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FA7C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 19 May 2022 16:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5S7t35Y7oufQOurC7ItfC0aTE0HOTou6psKumf2TvBo=; b=Mx0vPzmK1dPfPn
	GcpsOi54s3jJlp8gShY1prE3n0i78Dpg9Ii/CNbS+NgsWR2fbshgJBsZtBYMeGEI0OkR3FSCLDxXP
	9R1cRE+BE+Svrl/wwmwqQJwvITOInQNGFXTnhoWRPwB00x3psh3OfpSIs6ACFRJx010XiwQz4Oj3C
	hc4T2bt9I321/OR2rM+7drg1VZaK6p6ierT+jYaVB8TVVYYfmCv6nYvFElwIeWO6BRUhfd9mAb6Sh
	WKfIsnEKP30RrnreZRYfyHy11GWhEsqXOiaIkaH+pwM4YQARjuwOogjl3Dey/KaFcIWYiWinO8c+m
	C5x4rIjv+PwF/lmhK7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrigY-008IiF-5J; Thu, 19 May 2022 16:07:34 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrigU-008Ifu-3u
 for linux-mtd@lists.infradead.org; Thu, 19 May 2022 16:07:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2B54520005;
 Thu, 19 May 2022 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652976447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GYaczLJ6nFP5sHDhkQRr0BiEitBW3OJnxOwYOqKvU3c=;
 b=XcnSXV5vqisgy0+SXcEC/iR0zTN+S3hBaOsRWu+4mCQX1C+4twlvzA1OScv8EyRfCDQ9zr
 XqV7tg882d+rBsDKRXMWiC/ufZaZ65fUbACrzA9HRApKA0IHtGWe87Pr1zPxKTHjXgASib
 juRPqBirV4WCRGn5sN89KqYr7/weG0LVhTAkWeSbtYUHyQds5GjEnHpIvNHVRNE/l+BImV
 O6sKxuDtRJPDunM1g9u4mdT6YvOMGi6pMuivosAk3Q/G7tFTorCp+bF4mLLyIbWstNOFHK
 /i+UO94EXWL9o29IqyyLto3xs4es7JA0aRTE2p8G2uTCWMP8sSv8ELkENkTeyA==
Date: Thu, 19 May 2022 18:07:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhengxun <zhengxunli.mxic@gmail.com>
Cc: linux-mtd@lists.infradead.org, zhengxunli@mxic.com.tw
Subject: Re: [PATCH v2 4/4] mtd: spinand: macronix: Add continuous read
 support for MX35LF2GE4AD
Message-ID: <20220519180723.52b478cb@xps-13>
In-Reply-To: <20220209091022.30155-5-zhengxunli.mxic@gmail.com>
References: <20220209091022.30155-1-zhengxunli.mxic@gmail.com>
 <20220209091022.30155-5-zhengxunli.mxic@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_090730_337489_9DDC9D0C 
X-CRM114-Status: GOOD (  12.79  )
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

SGkgWmhlbmd4dW4sCgp6aGVuZ3h1bmxpLm14aWNAZ21haWwuY29tIHdyb3RlIG9uIFdlZCwgIDkg
RmViIDIwMjIgMTc6MTA6MjIgKzA4MDA6Cgo+IEFkZCBjb250aW51b3VzIHJlYWQgZmxhZyBmb3Ig
TVgzNUxGMkdFNEFECgogICAgICAgICAgICAgICAgICAgICAgICAgICB0byBNWHh4eHh4eHguCgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFpoZW5neHVuIDx6aGVuZ3h1bmxpLm14aWNAZ21haWwuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9tYWNyb25peC5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9zcGkvbWFjcm9uaXguYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL21h
Y3Jvbml4LmMKPiBpbmRleCAzZjMxZjEzODFhNjIuLjAyZmI4ZjM3OTQ3ZCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3NwaS9tYWNyb25peC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9zcGkvbWFjcm9uaXguYwo+IEBAIC0xMjYsNyArMTI2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBzcGluYW5kX2luZm8gbWFjcm9uaXhfc3BpbmFuZF90YWJsZVtdID0gewo+ICAJCSAgICAgU1BJ
TkFORF9JTkZPX09QX1ZBUklBTlRTKCZyZWFkX2NhY2hlX3ZhcmlhbnRzLAo+ICAJCQkJCSAgICAg
ICZ3cml0ZV9jYWNoZV92YXJpYW50cywKPiAgCQkJCQkgICAgICAmdXBkYXRlX2NhY2hlX3Zhcmlh
bnRzKSwKPiAtCQkgICAgIFNQSU5BTkRfSEFTX1FFX0JJVCwKPiArCQkgICAgIFNQSU5BTkRfSEFT
X1FFX0JJVCB8IFNQSU5BTkRfSEFTX0NPTlRfUkVBRF9CSVQsCj4gIAkJICAgICBTUElOQU5EX0VD
Q0lORk8oJm14MzVsZnhnZTRhYl9vb2JsYXlvdXQsCj4gIAkJCQkgICAgIG14MzVsZjFnZTRhYl9l
Y2NfZ2V0X3N0YXR1cykpLAo+ICAJU1BJTkFORF9JTkZPKCJNWDM1TEY0R0U0QUQiLAoKClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
