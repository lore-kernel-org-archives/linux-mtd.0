Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BA6C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 16:25:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC92C2245C
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 16:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC92C2245C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p73J01jbF5z85V5Fe4cHoOsiDnL0NsgVdKXcs7Ts+7M=; b=APwBGGrxI5qmvwyYhULoqHJw/
	ZfF7VlJnM0MkpWk0ZiO/FeXzjJrxQY9Rmaty9BSNhHnFPsWLcKXi2knd1Wa96IylqICnrxk65vz3k
	5k7CUadFG1zn/0AFqZ/enQpiMYeSEn9+VlpgNHRpsL0+MHQ1EAg6N/hhYvJpXgN8O7CUlNFtY2Yqz
	9m/sJ+cVHjArlF15GfnXOyN4erAF+kOZHkso3UN/xgQzWrFYAkiu7frx3J6Jrt6TkIkNpzZfDVa0k
	Ssdg8HEJ7fOreVuGkMLQcBksiPHZqBz4xL4w+bw8aAAhXuic5Y34+srOK7jPVpktOTW/ym7I+KeGt
	Xgg+992EA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwSew-0008R4-UD; Mon, 04 Jan 2021 16:24:42 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwSeu-0008Mr-Tc
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 16:24:41 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id f6so26472747ybq.13
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jan 2021 08:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vBpBXC/9ucY1+ky5wV7xowNsqbFwGWckofXS204rVUQ=;
 b=FHEcoMksa41Km7fKX837180GO3o30lrAwKJbxW6ZrHuJkImz/Zis2eWrIKFRQPe77E
 smf/bcOvtwBWDzodW8vI+rpEtUhvEyhoUVgGXkXiG4KSayf8tcBVExlOG7An/aTTS2a1
 M7BQkmO0T1fs60txK65LKNwctysgjBplL+dj6V1V1gWJXM/+Y7AwFIMk0wssfUMq9Ryu
 yNbEsz9g3rCMOxIwvULYnEgvHAluK4plLl/lfXiI4WUMlqgwXjZnKAHJvE3pHUIEVM1Z
 pvsOvZ/inis7jITWN5qFLfdDyiwz4RkJXlonp0XFELorjqmNbW8xOovVHVHs9wycfRpi
 rKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vBpBXC/9ucY1+ky5wV7xowNsqbFwGWckofXS204rVUQ=;
 b=NQB7goDmgotyrCOI9nHk88iaOldIrt5D1DCYYoRuwSLd8WqMEgVqmSkFtTyic5ZMRu
 GSJlxJbb6LosMlJ61pTCBPUTgBaQmhM/qEIdEgRNHQQxUCTuO3EDwQdxDVCSCQS3j8SG
 Dlvmw6I0LnLgxiIUzaG4NV5fPr6PrbNdxryQAIhbH6jFVs+COYIHmJMFfmHKBwbwWfSx
 5OeuMRck7+L8ZjPnVtMGXPVfmDu16+tjGLqk+XeFKs8lHdFackf0OSuc6T04ZhhZx7p2
 HYpkmdtC3VQEHmB1yJnQ6pTLk/YPZFlMPwagS6pUXwSULBgpjFk4QG3E1OTcpEhv7/Ua
 oHXg==
X-Gm-Message-State: AOAM530hOAoblxuzx/FaH24J0SW6Q3gpsStsOrR6ORzoIjTUCSH/E9fC
 gI3xdarQ79fMUpgzil81rDctWsS3wnF8k2jZDRwdbg==
X-Google-Smtp-Source: ABdhPJx+EDGFBTYfc+IfvHW+c6PkHSt+Bv/qUNxm4NQQgkFgBuSQHHs6LcKW9aDPYUgzlXvHE8dF7D+7e7dsZGQFzGg=
X-Received: by 2002:a25:23d7:: with SMTP id
 j206mr110313103ybj.243.1609777476473; 
 Mon, 04 Jan 2021 08:24:36 -0800 (PST)
MIME-Version: 1.0
References: <1887c783-7a80-a71c-949f-c07c83c2d0fe@ti.com>
 <20201223215630.1917891-1-goegebuer@google.com>
 <20210104100819.1d623425@xps13>
In-Reply-To: <20210104100819.1d623425@xps13>
From: Ron Minnich <rminnich@google.com>
Date: Mon, 4 Jan 2021 08:24:25 -0800
Message-ID: <CAPAv03OXCAAPA7B8sAF-JX-8LSVHwk16Tnx_N-beRvZQXN7CVQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: parser: cmdline: Support MTD names containing one or
 more colons
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_112441_004082_8BAC1EB5 
X-CRM114-Status: GOOD (  24.76  )
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
 Jethro Beekman <jethro@fortanix.com>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ian Goegebuer <goegebuer@google.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SXQgaXMgbGlrZWx5IHdlJ3JlIG1pc3Npbmcgc29tZXRoaW5nIC0tIEkgYW0gbm90IGZ1bGx5IGNo
ZWNrZWQgb3V0IG9uCnRoZSBMaW51eCBwYXRjaCBwcm9jZXNzIGFuZCBpdCdzIElhbidzIGZpcnN0
IHBhdGNoLgoKR3VpZGFuY2UgYXBwcmVjaWF0ZWQuCgpPbiBNb24sIEphbiA0LCAyMDIxIGF0IDE6
MDggQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4K
PiBIZWxsbyBJYW4sCj4KPiBJYW4gR29lZ2VidWVyIDxnb2VnZWJ1ZXJAZ29vZ2xlLmNvbT4gd3Jv
dGUgb24gV2VkLCAyMyBEZWMgMjAyMCAxMzo1NjozMAo+IC0wODAwOgo+Cj4gPiBPbiBJbnRlbCBw
bGF0Zm9ybXMsIHRoZSB1c2FibGUgU1BJIGFyZWEgaXMgbG9jYXRlZCBzZXZlcmFsCj4gPiBNaUIg
aW4gZnJvbSB0aGUgc3RhcnQsIHRvIGxlYXZlIHJvb20gZm9yIGRlc2NyaXB0b3JzIGFuZAo+ID4g
dGhlIE1hbmFnZW1lbnQgRW5naW5lIGJpbmFyeS4gRnVydGhlciwgbm90IGFsbCB0aGUgcmVtYWlu
aW5nCj4gPiBzcGFjZSBjYW4gYmUgdXNlZCwgYXMgdGhlIGxhc3QgMTYgTWlCIGNvbnRhaW5zIGZp
cm13YXJlLgo+ID4KPiA+IFRvIG1ha2UgdGhlIFNQSSB1c2FibGUgZm9yIG10ZGJsb2NrIGFuZCBv
dGhlciBkZXZpY2VzLAo+ID4gaXQgaXMgbmVjZXNzYXJ5IHRvIGVuYWJsZSBjb21tYW5kIGxpbmUg
cGFydGl0aW9ucyBzbyB0aGUKPiA+IG1pZGRsZSB1c2FibGUgcmVnaW9uIGNhbiBiZSBzcGVjaWZp
ZWQuCj4gPgo+ID4gQWRkIGEgcGFydF9wcm9iZXMgYXJyYXkgd2hpY2ggaW5jbHVkZXMgb25seSAi
Y21kZWxpbmVwYXJ0cyIsCj4gPiBhbmQgY2hhbmdlIHRvIG10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0
ZXIgdG8gdXNlIHRoaXMgcGFydF9wcm9iZXMuCj4KPiBUaGUgY29tbWl0IHRpdGxlIHNlZW0gdG8g
YmUgdGFrZW4gZnJvbSBhbm90aGVyIHBhdGNoIGFuZCBkb2VzIG5vdAo+IG1hdGNoIHRoZSBiZWxv
dyBjaGFuZ2UuIE9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/Cj4KPiA+IFNpZ25lZC1vZmYtYnk6
ICJSb25hbGQgRy4gTWlubmljaCIgPHJtaW5uaWNoQGdvb2dsZS5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBJYW4gR29lZ2VidWVyIDxnb2VnZWJ1ZXJAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gIGRy
aXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaW50ZWwtc3BpLmMgfCA1ICsrKystCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL2ludGVsLXNwaS5jIGIv
ZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9pbnRlbC1zcGkuYwo+ID4gaW5kZXggYjU0
YTU2YTY4MTAwLi45ZGUzODg1MWM0MTEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9zcGkt
bm9yL2NvbnRyb2xsZXJzL2ludGVsLXNwaS5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9y
L2NvbnRyb2xsZXJzL2ludGVsLXNwaS5jCj4gPiBAQCAtOTAzLDYgKzkwMyw4IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc3BpX25vcl9jb250cm9sbGVyX29wcyBpbnRlbF9zcGlfY29udHJvbGxlcl9v
cHMgPSB7Cj4gPiAgICAgICAuZXJhc2UgPSBpbnRlbF9zcGlfZXJhc2UsCj4gPiAgfTsKPiA+Cj4g
PiArc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBwYXJ0X3Byb2Jlc1tdID0geyAiY21kbGluZXBh
cnQiLCBOVUxMIH07Cj4gPiArCj4gPiAgc3RydWN0IGludGVsX3NwaSAqaW50ZWxfc3BpX3Byb2Jl
KHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ICAgICAgIHN0cnVjdCByZXNvdXJjZSAqbWVtLCBjb25z
dCBzdHJ1Y3QgaW50ZWxfc3BpX2JvYXJkaW5mbyAqaW5mbykKPiA+ICB7Cj4gPiBAQCAtOTUwLDcg
Kzk1Miw4IEBAIHN0cnVjdCBpbnRlbF9zcGkgKmludGVsX3NwaV9wcm9iZShzdHJ1Y3QgZGV2aWNl
ICpkZXYsCj4gPiAgICAgICBpZiAoIWlzcGktPndyaXRlYWJsZSB8fCAhd3JpdGVhYmxlKQo+ID4g
ICAgICAgICAgICAgICBpc3BpLT5ub3IubXRkLmZsYWdzICY9IH5NVERfV1JJVEVBQkxFOwo+ID4K
PiA+IC0gICAgIHJldCA9IG10ZF9kZXZpY2VfcmVnaXN0ZXIoJmlzcGktPm5vci5tdGQsICZwYXJ0
LCAxKTsKPiA+ICsgICAgIHJldCA9IG10ZF9kZXZpY2VfcGFyc2VfcmVnaXN0ZXIoJmlzcGktPm5v
ci5tdGQsIHBhcnRfcHJvYmVzLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBOVUxMLCAmcGFydCwgMSk7Cj4gPiAgICAgICBpZiAocmV0KQo+ID4gICAgICAgICAgICAg
ICByZXR1cm4gRVJSX1BUUihyZXQpOwo+ID4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
