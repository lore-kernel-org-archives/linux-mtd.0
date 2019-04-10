Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C960C10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 21:46:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5824020820
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 21:46:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ld4nESiK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gzAHvdsg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5824020820
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9KHN2X/Gv/KrTkTuKExiY+twKdb0dvEWMQrO8LOIaA=; b=Ld4nESiKLOidcZ
	xPqMksPJfoUTRcKQpFvTO1l0aeDOTv6jXJlTTHbxjff2cadXsyQFSPcOieOYGLqJ7FpF7oIh6JdlR
	cVQse/Zoocc1t+viEgLVO2n6CNd+U0IJDxcl/L0hnOtHKX0TKas5RO1RoDK2IZiyvIzkjv3MevzeE
	Yr6NMP6rgHCgat/vydbqU7sfsCzsgxmX/BrK6WL1rilXIxFkl2x0t4rZ+creeQ+in+G+coAjm7MbZ
	81yHZ5OYKCZ9Lslv0TlGsVWx7jDQTUT9amCtjR22CKHIo9Admk84dnVtSXHbxJzgY1w7YRqOacVbh
	xhaNJXjcBKeKOvw80qzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEL3F-0001MJ-Oo; Wed, 10 Apr 2019 21:46:37 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEL3D-0001Lu-4i
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 21:46:36 +0000
Received: by mail-vs1-xe44.google.com with SMTP id d8so2292577vsp.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2019 14:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L4wfj6kbBNmWuCSiV+dDFg+QkSIBv+gB6fE5Jwj8vIs=;
 b=gzAHvdsgoeWoVQBFxGJBJxZT9XP8+Imiedq3yDGVpJfp0hsdyMXPywrdY+pGvFUNw/
 CanjlOjhYObsTSrHMtndU6GnSdlHjXpQjnSm1JyJoRcuJy5TXZLnIjQy1aBbNwsQFsXh
 92mG9J3EcTFM3TTeNM03P8Y5O6p0yKAKHuv/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L4wfj6kbBNmWuCSiV+dDFg+QkSIBv+gB6fE5Jwj8vIs=;
 b=i4c0S/ewWArrL1m5j2MgVM9cHZsXwceEqbOM87I3NmS6jbK9YbuCeGtMFLhtjmcL3i
 R/atnXbtSycl8KKiRYZr/RiAH13n6BzzwuRm3QKBCkffCk1BVtlp5TqrxCAOzPkHDhoF
 qIJAVGpsfwz1iUT2bV2Ht8x2Tho9oZRhKVlQNn/NLC5hCAIqKc3ddPrt3We8AyLBRLTF
 wDLD41ZI6iegNB9JcmwkCntYxpJdlTZnZTmWhPYJ9k5tUzXlnuU3xOjejWddO+A91OrA
 iQHn1S43DbWhlU6K0hk2hNVhXqkQtKidupUMcXntNCqzX9pFlFS2PNz/LGrY1h9xJapP
 Pxvg==
X-Gm-Message-State: APjAAAXq+GiffS3t0iEKFOIBaCEcEXlJpMgsA+hnkQeLMeLGzbuuSfYf
 Yrq7lY9mgSEs5tL7XIokoFW0QQpQgg0=
X-Google-Smtp-Source: APXvYqw5MDz4WWZ5KF9q0ypw8zTBC0QpSyi3omTYABYeHz6gGiOI5uExbm8kZJEs6ZVb2OVCd6EEJg==
X-Received: by 2002:a67:e2d4:: with SMTP id i20mr27307217vsm.193.1554932792997; 
 Wed, 10 Apr 2019 14:46:32 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com.
 [209.85.217.41])
 by smtp.gmail.com with ESMTPSA id j71sm29541695vsd.0.2019.04.10.14.46.32
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Apr 2019 14:46:32 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id s2so2282719vsi.5
 for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2019 14:46:32 -0700 (PDT)
X-Received: by 2002:a67:1345:: with SMTP id 66mr24844706vst.30.1554932791555; 
 Wed, 10 Apr 2019 14:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190208180202.GA16603@embeddedor>
In-Reply-To: <20190208180202.GA16603@embeddedor>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 10 Apr 2019 14:46:20 -0700
X-Gmail-Original-Message-ID: <CAGXu5j+p6aSOR5Tz_0TkqC7k30yxsSzSU0vAP44a0dMCbtEaeQ@mail.gmail.com>
Message-ID: <CAGXu5j+p6aSOR5Tz_0TkqC7k30yxsSzSU0vAP44a0dMCbtEaeQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: cfi_util: mark expected switch fall-throughs
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_144635_186421_9EC3C434 
X-CRM114-Status: GOOD (  18.65  )
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
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Linux mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBGZWIgOCwgMjAxOSBhdCAxMDowMiBBTSBHdXN0YXZvIEEuIFIuIFNpbHZhCjxndXN0
YXZvQGVtYmVkZGVkb3IuY29tPiB3cm90ZToKPgo+IEluIHByZXBhcmF0aW9uIHRvIGVuYWJsaW5n
IC1XaW1wbGljaXQtZmFsbHRocm91Z2gsIG1hcmsgc3dpdGNoCj4gY2FzZXMgd2hlcmUgd2UgYXJl
IGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCj4KPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xs
b3dpbmcgd2FybmluZ3M6Cj4KPiBkcml2ZXJzL210ZC9jaGlwcy9jZmlfdXRpbC5jOiBJbiBmdW5j
dGlvbiDigJhjZmlfYnVpbGRfY21k4oCZOgo+IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV91dGlsLmM6
MTEwOjEwOiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxp
Y2l0LWZhbGx0aHJvdWdoPV0KPiAgICBvbmVjbWQgfD0gKG9uZWNtZCA8PCAoY2hpcF9tb2RlICog
MzIpKTsKPiAgICB+fn5+fn5+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IGRyaXZl
cnMvbXRkL2NoaXBzL2NmaV91dGlsLmM6MTEyOjI6IG5vdGU6IGhlcmUKPiAgIGNhc2UgNDoKPiAg
IF5+fn4KPiBkcml2ZXJzL210ZC9jaGlwcy9jZmlfdXRpbC5jOjExMzoxMDogd2FybmluZzogdGhp
cyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4g
ICAgb25lY21kIHw9IChvbmVjbWQgPDwgKGNoaXBfbW9kZSAqIDE2KSk7Cj4gICAgfn5+fn5+fl5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBkcml2ZXJzL210ZC9jaGlwcy9jZmlfdXRp
bC5jOjExNDoyOiBub3RlOiBoZXJlCj4gICBjYXNlIDI6Cj4gICBefn5+Cj4gZHJpdmVycy9tdGQv
Y2hpcHMvY2ZpX3V0aWwuYzogSW4gZnVuY3Rpb24g4oCYY2ZpX21lcmdlX3N0YXR1c+KAmToKPiBk
cml2ZXJzL210ZC9jaGlwcy9jZmlfdXRpbC5jOjE2Mzo3OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVu
dCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPiAgICByZXMgfD0g
KG9uZXN0YXQgPj4gKGNoaXBfbW9kZSAqIDMyKSk7Cj4gICAgfn5+fl5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+Cj4gZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3V0aWwuYzoxNjU6Mjogbm90
ZTogaGVyZQo+ICAgY2FzZSA0Ogo+ICAgXn5+fgo+IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV91dGls
LmM6MTY2Ojc6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1w
bGljaXQtZmFsbHRocm91Z2g9XQo+ICAgIHJlcyB8PSAob25lc3RhdCA+PiAoY2hpcF9tb2RlICog
MTYpKTsKPiAgICB+fn5+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBkcml2ZXJz
L210ZC9jaGlwcy9jZmlfdXRpbC5jOjE2NzoyOiBub3RlOiBoZXJlCj4gICBjYXNlIDI6Cj4gICBe
fn5+Cj4KPiBXYXJuaW5nIGxldmVsIDMgd2FzIHVzZWQ6IC1XaW1wbGljaXQtZmFsbHRocm91Z2g9
Mwo+Cj4gVGhpcyBwYXRjaCBpcyBwYXJ0IG9mIHRoZSBvbmdvaW5nIGVmZm9ydHMgdG8gZW5hYmxp
bmcKPiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLgo+Cj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBB
LiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KClJldmlld2VkLWJ5OiBLZWVzIENv
b2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KCi1LZWVzCgo+IC0tLQo+ICBkcml2ZXJzL210ZC9j
aGlwcy9jZmlfdXRpbC5jIHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV91dGlsLmMgYi9kcml2
ZXJzL210ZC9jaGlwcy9jZmlfdXRpbC5jCj4gaW5kZXggNmYxNjU1MmNkNTlmLi5lM2IyNjZlZTA2
YWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3V0aWwuYwo+ICsrKyBiL2Ry
aXZlcnMvbXRkL2NoaXBzL2NmaV91dGlsLmMKPiBAQCAtMTA5LDEwICsxMDksMTMgQEAgbWFwX3dv
cmQgY2ZpX2J1aWxkX2NtZCh1X2xvbmcgY21kLCBzdHJ1Y3QgbWFwX2luZm8gKm1hcCwgc3RydWN0
IGNmaV9wcml2YXRlICpjZmkKPiAgICAgICAgIGNhc2UgODoKPiAgICAgICAgICAgICAgICAgb25l
Y21kIHw9IChvbmVjbWQgPDwgKGNoaXBfbW9kZSAqIDMyKSk7Cj4gICNlbmRpZgo+ICsgICAgICAg
ICAgICAgICAvKiBmYWxsIHRocm91Z2ggKi8KPiAgICAgICAgIGNhc2UgNDoKPiAgICAgICAgICAg
ICAgICAgb25lY21kIHw9IChvbmVjbWQgPDwgKGNoaXBfbW9kZSAqIDE2KSk7Cj4gKyAgICAgICAg
ICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLwo+ICAgICAgICAgY2FzZSAyOgo+ICAgICAgICAgICAg
ICAgICBvbmVjbWQgfD0gKG9uZWNtZCA8PCAoY2hpcF9tb2RlICogOCkpOwo+ICsgICAgICAgICAg
ICAgICAvKiBmYWxsIHRocm91Z2ggKi8KPiAgICAgICAgIGNhc2UgMToKPiAgICAgICAgICAgICAg
ICAgOwo+ICAgICAgICAgfQo+IEBAIC0xNjIsMTAgKzE2NSwxMyBAQCB1bnNpZ25lZCBsb25nIGNm
aV9tZXJnZV9zdGF0dXMobWFwX3dvcmQgdmFsLCBzdHJ1Y3QgbWFwX2luZm8gKm1hcCwKPiAgICAg
ICAgIGNhc2UgODoKPiAgICAgICAgICAgICAgICAgcmVzIHw9IChvbmVzdGF0ID4+IChjaGlwX21v
ZGUgKiAzMikpOwo+ICAjZW5kaWYKPiArICAgICAgICAgICAgICAgLyogZmFsbCB0aHJvdWdoICov
Cj4gICAgICAgICBjYXNlIDQ6Cj4gICAgICAgICAgICAgICAgIHJlcyB8PSAob25lc3RhdCA+PiAo
Y2hpcF9tb2RlICogMTYpKTsKPiArICAgICAgICAgICAgICAgLyogZmFsbCB0aHJvdWdoICovCj4g
ICAgICAgICBjYXNlIDI6Cj4gICAgICAgICAgICAgICAgIHJlcyB8PSAob25lc3RhdCA+PiAoY2hp
cF9tb2RlICogOCkpOwo+ICsgICAgICAgICAgICAgICAvKiBmYWxsIHRocm91Z2ggKi8KPiAgICAg
ICAgIGNhc2UgMToKPiAgICAgICAgICAgICAgICAgOwo+ICAgICAgICAgfQo+IC0tCj4gMi4yMC4x
Cj4KCgotLSAKS2VlcyBDb29rCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
