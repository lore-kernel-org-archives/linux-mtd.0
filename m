Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F16C10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 21:47:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5966520830
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 21:47:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jZAOwEOf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WhvzkP+O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5966520830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1htWXpQMGS9R0TEK5VsCCv10KHdWO8bm4Py/oif+I4Y=; b=jZAOwEOfGNMHw2
	b7DvwNrVTmY7p0e0PdfiTpIhwKtbYx+VKOZ/umAqPNaYjsGtHe/NKDXkOZRX8RsPqWWfgvt4vITPT
	uk+cYPeJ9NRzYwgIFAUWRfWd7vW7f2gOByxEVemXbo8FqBTGldH9+dTNFxvvt2mJ0ec45KxFnWLkI
	pWbXERqSBXnqk4+q0IKOulvDoLoyY3fHZMLIk6Cr5WSbBst8HbYWcd3rbMG8OEYa6JfN1tjhLW8kk
	ple4hqrOw3ODqZK6Vi5UfiQUqm2P/jgkvbSyljPM3bqyD1AUviEYTz5k9gf/A9WI+3TkpJvrRfvhf
	RIvFnHWVpRTxzwxBWXtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEL3e-0001cT-4X; Wed, 10 Apr 2019 21:47:02 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEL3b-0001be-88
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 21:47:00 +0000
Received: by mail-vs1-xe41.google.com with SMTP id e2so2252209vsc.13
 for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2019 14:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Lq4+RxT8k6KGTV+dt1jcaoPACyMOT5GrI4v17X71x+0=;
 b=WhvzkP+OOJLUbpjVXtK0ScHPtIQfCI0xvx1j0Oxq5S52VQNE4EyoYzc7E4T4KvnZjG
 YFfpTjo7DdTi8E0QHrIIWghFNmfuPpQRZXCE+T58c5TWnoz2LRYqYFkCZd4SX8wy3fDi
 mAy9AU866AgWj5Yk8cSVP6dE8799V45Zvjvyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Lq4+RxT8k6KGTV+dt1jcaoPACyMOT5GrI4v17X71x+0=;
 b=mTuTcWuOPnpxb00CzZZAej6v5p7xxUFNXMKD2/sfjvo+88zKh4Nf0+IuVK0nDqw4EG
 0b4VVg2FpoDP8XikFR8yHyIvh5nlNUTV1685ORwnua958JRWVzSb/Z2bXvlgZ1xAg3UL
 QirmM0hfGJH6Vf4waYx93OG2DWHKn9NjSmsbFyqij4RqNjCzlN0qZsxIo8k9Zg3zehfO
 Uos+WwnhfX702L72GvfutNjVvqoPHKJ1p4h+Y4L7Z/iCxCIT7Kv6ngzOIkjZ3UlEzepw
 XcKvyB7ccLsEi7S2f7W/ly58mZojj82Tr5klVXS0an/DVRbncL72DFKFoXf2wN8bcx3L
 bYvg==
X-Gm-Message-State: APjAAAVRfJa73NdGVPEk0YxvYlcUobdyRgLJeX/qLiVqoThPADgcV6dX
 S0/WTVCi3S6XzOoO0eHEOeLuZJXSkY4=
X-Google-Smtp-Source: APXvYqxVoZtJCu3t5PXTiyclnuRyJfcNnbMC+m3fXGnAbXnsiDZR981NqzwbuAGpD7EdlfOQZ9rw3A==
X-Received: by 2002:a67:7b53:: with SMTP id w80mr24327820vsc.144.1554932817679; 
 Wed, 10 Apr 2019 14:46:57 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com.
 [209.85.217.54])
 by smtp.gmail.com with ESMTPSA id q190sm14095736vkd.50.2019.04.10.14.46.56
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Apr 2019 14:46:57 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id f15so2272256vsk.9
 for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2019 14:46:56 -0700 (PDT)
X-Received: by 2002:a67:7816:: with SMTP id t22mr24729535vsc.115.1554932816316; 
 Wed, 10 Apr 2019 14:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190208180911.GA32525@embeddedor>
In-Reply-To: <20190208180911.GA32525@embeddedor>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 10 Apr 2019 14:46:45 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJkrpGd+WWRx3C2Njp6jZ4UKU0KqinjqmTO8fxyfo7oOw@mail.gmail.com>
Message-ID: <CAGXu5jJkrpGd+WWRx3C2Njp6jZ4UKU0KqinjqmTO8fxyfo7oOw@mail.gmail.com>
Subject: Re: [PATCH] mtd: phram: Mark expected switch fall-throughs
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_144659_293042_8FAA134A 
X-CRM114-Status: GOOD (  18.28  )
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
 Richard Weinberger <richard@nod.at>, Joern Engel <joern@lazybastard.org>,
 LKML <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Linux mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBGZWIgOCwgMjAxOSBhdCAxMDoxNyBBTSBHdXN0YXZvIEEuIFIuIFNpbHZhCjxndXN0
YXZvQGVtYmVkZGVkb3IuY29tPiB3cm90ZToKPgo+IEluIHByZXBhcmF0aW9uIHRvIGVuYWJsaW5n
IC1XaW1wbGljaXQtZmFsbHRocm91Z2gsIG1hcmsgc3dpdGNoCj4gY2FzZXMgd2hlcmUgd2UgYXJl
IGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCj4KPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xs
b3dpbmcgd2FybmluZ3M6Cj4KPiBkcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmM6IEluIGZ1bmN0
aW9uIOKAmHBhcnNlX251bTY04oCZOgo+IGRyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYzoxNDk6
MTE6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQt
ZmFsbHRocm91Z2g9XQo+ICAgICAgc2hpZnQgKz0gMTA7Cj4gICAgICB+fn5+fn5efn5+fgo+IGRy
aXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYzoxNTA6NDogbm90ZTogaGVyZQo+ICAgICBjYXNlICdN
JzoKPiAgICAgXn5+fgo+IGRyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYzoxNTE6MTE6IHdhcm5p
bmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91
Z2g9XQo+ICAgICAgc2hpZnQgKz0gMTA7Cj4gICAgICB+fn5+fn5efn5+fgo+IGRyaXZlcnMvbXRk
L2RldmljZXMvcGhyYW0uYzoxNTI6NDogbm90ZTogaGVyZQo+ICAgICBjYXNlICdrJzoKPiAgICAg
Xn5+fgo+Cj4gV2FybmluZyBsZXZlbCAzIHdhcyB1c2VkOiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdo
PTMKPgo+IFRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJs
aW5nCj4gLVdpbXBsaWNpdC1mYWxsdGhyb3VnaC4KPgo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8g
QS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+CgpSZXZpZXdlZC1ieTogS2VlcyBD
b29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CgotS2VlcwoKPiAtLS0KPiAgZHJpdmVycy9tdGQv
ZGV2aWNlcy9waHJhbS5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jIGIvZHJpdmVycy9t
dGQvZGV2aWNlcy9waHJhbS5jCj4gaW5kZXggOWVlMDRiNWY5MzExLi44YTg2MjdjMzBhZWQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jCj4gKysrIGIvZHJpdmVycy9t
dGQvZGV2aWNlcy9waHJhbS5jCj4gQEAgLTE0Nyw4ICsxNDcsMTAgQEAgc3RhdGljIGludCBwYXJz
ZV9udW02NCh1aW50NjRfdCAqbnVtNjQsIGNoYXIgKnRva2VuKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHN3aXRjaCAodG9rZW5bbGVuIC0gMl0pIHsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBjYXNlICdHJzoKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNoaWZ0ICs9IDEw
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogZmFsbCB0aHJvdWdoICovCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgY2FzZSAnTSc6Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzaGlmdCArPSAxMDsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC8qIGZhbGwgdGhyb3VnaCAqLwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNhc2UgJ2snOgo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2hpZnQgKz0gMTA7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB0b2tlbltsZW4gLSAyXSA9IDA7Cj4gLS0KPiAyLjIwLjEK
PgoKCi0tIApLZWVzIENvb2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
