Return-Path: <SRS0=Ud6c=HD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35A2C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 15:18:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DFCA64E9C
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 15:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DFCA64E9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V5ghmP9vDSjJe5zO6XKBzYaL8RKxm3g5SA3T7D+O3JU=; b=h3EGBJVflZflJisoduAQBvy2t
	XsojagZT+yD1yJP3gXKOpTy1Tt6W63x1rJQYj/J71Ba+yZkoS26DxC/h4U6+UMkr41B0juM9Jz0+z
	HugmPjd+S4wmNDCJ4RD2F4iqwmliNrqqGNBqyQ+Hyp233IC8qpXI26d13Bsv+8ZAMQtRlfKkfkE1Z
	zJiCZrsxQuhnBLXeXqjPNqGFqdLC/1DhLWdO3zdf31GtMyZoA4lRELbcDGQtTNGZ6GVSvp+MyHcAn
	/amcLxC42dJ0GBN+U6cudqlPD8ux82xRcvKA2zvyKUjKFKsKsEz+sCo/hgZpfKqM5qMlHiyw/KIyp
	UkqHiyGXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6axu-0003Jl-NP; Mon, 01 Feb 2021 15:18:10 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6axs-0003JO-2R
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2021 15:18:08 +0000
Received: by mail-wr1-x430.google.com with SMTP id q7so16952924wre.13
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2021 07:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l7+1496abPG2W/ef2ZxcdGvGyVNZG/jY4Ap/dWqQU2A=;
 b=Kanr6zR8dqC505yrnxHs/Flw9ZqW9PjpqQZsE8VIQXb4t1pnO5HlwHK5bFbvkDOAL8
 oaNUe4cCzqC0QxvgZj3PCng5m8mPjANJX5yJKLXry/iJ05OPEouJytFkLDhV21vWhYG+
 ihbwDXt3FQZ7Tbf1jfYT+4N8NG4rjbarOiIoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l7+1496abPG2W/ef2ZxcdGvGyVNZG/jY4Ap/dWqQU2A=;
 b=e6ArNvHvtgP747SnPZEBZvT/EYfkQs3VatAtJH+QXIpeFFAWDKmUkxqbOKNa0R0cv2
 BsxwOfKISY+Z1TjnMiTIH58pktSqaLGIrq0oiXHe4aHeNChruoW9gow5c1ocMGIiuGBg
 AAl4ehm36k03v1HRhqOs4KbxN2K0dtWHcsZPQYodX/NgK97mW1LVNAr6IWTcy/y4wNB5
 is/7R+3U5tYrOLa2qD5JqOypaAMjn+CLRaVLvvJHXeZQUkAB0GTs7w3m7MQijvwGhWfg
 I+VMt8PzMXc3TMQ+JharA0TPIoqHNNbOO0gZXWrGvCChfuWv+jTwO7XWa9FJgdNg5S/v
 hB2w==
X-Gm-Message-State: AOAM532HDMRTtLNNAdQpRyHaEx1Hp2dE2vRgqt3qg7ys7VWB05LnIXk5
 EfedAJ0vTTSIq+CuWvD6BsHAYob33AEx4fl39PRHQXQXvTU=
X-Google-Smtp-Source: ABdhPJxWQixLYzYtL9r07kc+TpZDeuL5NxUH+YiF1I5r+WK+nD52Lzf1HE8u67CWRtju+nSbb5yHP9bY1y+kznzj9fo=
X-Received: by 2002:adf:eccc:: with SMTP id s12mr12456965wro.383.1612192685579; 
 Mon, 01 Feb 2021 07:18:05 -0800 (PST)
MIME-Version: 1.0
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20190802145109.00c4a4eb@collabora.com>
 <b739696d-bb1d-bb04-cd45-3019712e29ad@kernel.org>
 <20190808183651.7c0962e7@collabora.com>
 <694cb2ac-68e6-72b1-3d55-e405b176a17f@kernel.org>
 <20190809082356.0cf60555@collabora.com>
 <ce7157e2-a8d0-7204-4003-8a711acb65b8@kernel.org>
 <20190809093235.09d89e20@collabora.com>
 <c5af9334-f679-6fc9-4d2a-1366a295598a@kernel.org>
 <20190809155934.40c43f29@collabora.com>
 <00b31833-69ba-42c5-57c9-37fa1f70efc5@kernel.org>
 <20190812093129.75888dad@collabora.com>
 <a47792dc-b19f-8af3-8748-5a21fb63271e@kernel.org>
 <CAOf5uwmPzCU8WFRQ1tQBdN7OVGZZ9SvdAG0YqVAyxmA1zwtUhg@mail.gmail.com>
 <2e9e1f1c-ee57-425d-1791-70c66de52637@kernel.org>
 <CAOf5uwm93+ARf=_BckjMar1tpeBs6YHeUwORj5cyhFfvu5fNWQ@mail.gmail.com>
 <20210201151335.210af8ca@xps13>
 <CAOf5uwkivHhMX_mPJymBZxQge_wc4K1p_1S3gsQYHPV40aaj3w@mail.gmail.com>
 <CAOf5uwnXB-2xXXXxvH9Fo3ngscccA5Hv7iNTbUYRNFs_iLGJqw@mail.gmail.com>
 <20210201161433.0c4ff0e3@xps13>
In-Reply-To: <20210201161433.0c4ff0e3@xps13>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 1 Feb 2021 16:17:54 +0100
Message-ID: <CAOf5uwm6xHORBcYV8RKEvyqcmQvKofKQyReXd=rQy-imrZBPzQ@mail.gmail.com>
Subject: Re: GPMI iMX6ull timeout on DMA
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_101808_137695_5A797FA0 
X-CRM114-Status: GOOD (  35.87  )
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
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Greg Ungerer <gerg@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkKCk9uIE1vbiwgRmViIDEsIDIwMjEgYXQgNDoxNCBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIE1pY2hhZWwsCj4KPiBNaWNoYWVsIE5h
enphcmVubyBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlIG9u
Cj4gTW9uLCAxIEZlYiAyMDIxIDE2OjA4OjIzICswMTAwOgo+Cj4gPiBIaQo+ID4KPiA+IE9uIE1v
biwgRmViIDEsIDIwMjEgYXQgMzozMiBQTSBNaWNoYWVsIE5henphcmVubyBUcmltYXJjaGkKPiA+
IDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkKPiA+
ID4KPiA+ID4gT24gTW9uLCBGZWIgMSwgMjAyMSBhdCAzOjEzIFBNIE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gSGkgTWljaGFl
bCwKPiA+ID4gPgo+ID4gPiA+IE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSA8bWljaGFlbEBh
bWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGUgb24KPiA+ID4gPiBTYXQsIDMwIEphbiAyMDIxIDEw
OjQxOjI5ICswMTAwOgo+ID4gPiA+Cj4gPiA+ID4gPiBIaSBNaXF1ZWwKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBjb21taXQgZjhlNmFkMTQzODgwNjdmOTFiMjZkMDQ0MTg1ZDk1NjIzZmJjOTUzNQo+ID4g
PiA+ID4gQXV0aG9yOiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25z
LmNvbT4KPiA+ID4gPiA+IERhdGU6ICAgRnJpIEphbiAyOSAwODo0Njo1MyAyMDIxICswMTAwCj4g
PiA+ID4gPgo+ID4gPiA+ID4gICAgIG10ZDogbmFuZDogQ2FsY3VsYXRlIHRoZSBjbG9jayBiZWZv
cmUgZW5hYmxlIGl0Cj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgIFNpZ25lZC1vZmYtYnk6IE1pY2hh
ZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4gPiA+ID4gICAg
IENoYW5nZS1JZDogSTc5YjBkYTM5ZGUwYTliMzJlYTBiMDAyZmEyMDBkN2Y0NGQ0ZjhjZTcKPiA+
ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1u
YW5kL2dwbWktbGliLmMKPiA+ID4gPiA+IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5k
L2dwbWktbGliLmMKPiA+ID4gPiA+IGluZGV4IDMyMmEwMDgyOTBlNS4uMGJjYTUyYjNiYzhmIDEw
MDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWkt
bGliLmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1p
LWxpYi5jCj4gPiA+ID4gPiBAQCAtMzc3LDYgKzM3Nyw3IEBAIHN0YXRpYyB2b2lkIGdwbWlfbmZj
X2NvbXB1dGVfdGltaW5ncyhzdHJ1Y3QKPiA+ID4gPiA+IGdwbWlfbmFuZF9kYXRhICp0aGlzLAo+
ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCBuYW5kX3Nkcl90aW1pbmdzICpzZHIpCj4gPiA+ID4gPiAgewo+ID4gPiA+ID4gICAgICAgICBz
dHJ1Y3QgZ3BtaV9uZmNfaGFyZHdhcmVfdGltaW5nICpodyA9ICZ0aGlzLT5odzsKPiA+ID4gPiA+
ICsgICAgICAgc3RydWN0IHJlc291cmNlcyAqciA9ICZ0aGlzLT5yZXNvdXJjZXM7Cj4gPiA+ID4g
PiAgICAgICAgIHVuc2lnbmVkIGludCBkbGxfdGhyZXNob2xkX3BzID0gdGhpcy0+ZGV2ZGF0YS0+
bWF4X2NoYWluX2RlbGF5Owo+ID4gPiA+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgcGVyaW9kX3Bz
LCByZWZlcmVuY2VfcGVyaW9kX3BzOwo+ID4gPiA+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgZGF0
YV9zZXR1cF9jeWNsZXMsIGRhdGFfaG9sZF9jeWNsZXMsIGFkZHJfc2V0dXBfY3ljbGVzOwo+ID4g
PiA+ID4gQEAgLTQ0MCw2ICs0NDEsOCBAQCBzdGF0aWMgdm9pZCBncG1pX25mY19jb21wdXRlX3Rp
bWluZ3Moc3RydWN0Cj4gPiA+ID4gPiBncG1pX25hbmRfZGF0YSAqdGhpcywKPiA+ID4gPiA+ICAg
ICAgICAgICAgICAgICBody0+Y3RybDFuIHw9IEJGX0dQTUlfQ1RSTDFfUkROX0RFTEFZKHNhbXBs
ZV9kZWxheV9mYWN0b3IpIHwKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEJNX0dQTUlfQ1RSTDFfRExMX0VOQUJMRSB8Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAodXNlX2hhbGZfcGVyaW9kID8gQk1fR1BNSV9DVFJMMV9IQUxGX1BFUklPRCA6
IDApOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICBjbGtfc2V0X3JhdGUoci0+Y2xvY2tb
MF0sIGh3LT5jbGtfcmF0ZSk7Cj4gPiA+ID4gPiAgfQo+ID4gPiA+ID4KPiA+ID4gPiA+ICB2b2lk
IGdwbWlfbmZjX2FwcGx5X3RpbWluZ3Moc3RydWN0IGdwbWlfbmFuZF9kYXRhICp0aGlzKQo+ID4g
PiA+ID4gQEAgLTQ0OSw4ICs0NTIsNiBAQCB2b2lkIGdwbWlfbmZjX2FwcGx5X3RpbWluZ3Moc3Ry
dWN0IGdwbWlfbmFuZF9kYXRhICp0aGlzKQo+ID4gPiA+ID4gICAgICAgICB2b2lkIF9faW9tZW0g
KmdwbWlfcmVncyA9IHItPmdwbWlfcmVnczsKPiA+ID4gPiA+ICAgICAgICAgdW5zaWduZWQgaW50
IGRsbF93YWl0X3RpbWVfdXM7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gLSAgICAgICBjbGtfc2V0X3Jh
dGUoci0+Y2xvY2tbMF0sIGh3LT5jbGtfcmF0ZSk7Cj4gPiA+ID4gPiAtCj4gPiA+ID4gPiAgICAg
ICAgIHdyaXRlbChody0+dGltaW5nMCwgZ3BtaV9yZWdzICsgSFdfR1BNSV9USU1JTkcwKTsKPiA+
ID4gPiA+ICAgICAgICAgd3JpdGVsKGh3LT50aW1pbmcxLCBncG1pX3JlZ3MgKyBIV19HUE1JX1RJ
TUlORzEpOwo+ID4gPiA+ID4KPiA+ID4gPiA+IFJpZ2h0IG5vdyBJIGhhdmUgdGhpcyBjaGFuZ2Ug
YXBwbGllZCBhbmQgc2VlbXMgZmluZS4gVGhhdCBpcyB0aGUgb25seQo+ID4gPiA+ID4gZGlmZmVy
ZW5jZSBJIGdldC4gQ2xvY2sgaXMgYXBwbHkgYSBiaXQgZWFybGllciB0aGF0IHdoZW4gaXMgZW5h
YmxlZAo+ID4gPiA+ID4gaXQuCj4gPiA+ID4KPiA+ID4gPiBUaGlzIGlzIHZlcnkgaW50ZXJlc3Rp
bmcuIFNvIHRoaXMgd291bGQgbWVhbiB0aGUgaXNzdWUgeW91IGFyZQo+ID4gPiA+IGV4cGVyaWVu
Y2luZyBjb21lcyBmcm9tIHRoZSBjbG9jayBkcml2ZXIgd2hpY2gga2luZCBvZiByZXR1cm5zIHRv
bwo+ID4gPiA+IGVhcmx5IGZyb20gY2xrX3NldF9yYXRlKCk/IENvdWxkIHlvdSByZXBvcnQgdGhp
cyB0byB0aGUgY2xrIE1ML05YUCBjbGsKPiA+ID4gPiBtYWludGFpbmVycyBhbmQga2VlcCB1cyBp
biBjb3B5PyBJZiBpdCBpcyBhcyBnbG9iYWwgYXMgaXQgc291bmRzLCB3ZQo+ID4gPiA+IG1pZ2h0
IG5vdCBiZSB0aGUgb25seSBvbmVzIGFmZmVjdGVkLgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFRoZSBp
bXgyOCBpcyBicm9rZW4gdG9vLCBzbyBpdCdzIGEgZ2VuZXJhbCBwcm9ibGVtLiBJIG5lZWQgdG8g
dHJhY2UgaXQgZG93bgo+ID4gPiBJIGhhdmUgYSByZXZlcnRpbmcgZm9yIGx0cyBidXQgaXRccyBu
b3QgdGhlIHdheSB0byBnbwo+ID4gPgo+ID4KPiA+IEZvciBpbXgyOCB5b3UgYXNrIHRvIHNldCB0
aGUgcmF0ZSB0byAyMk1oeiBidXQgeW91IGRvbid0IGNhcmUgYWJvdXQgdGhlIGNsb2NrCj4gPiB0
aGF0IHlvdSBnZXQgYmFjay4gWW91IGdldCBiYWNrIDEyTWh6IGJlY2F1c2UgdGhlIGJhc2UgY2xv
Y2sgaXMgMjQgTWh6IGFuZCBzZWVtcwo+ID4gdGhhdCBpdCBjYW4gbm90IGdldCB0aGUgcG9pbnQu
IFlvdSBuZWVkIHRvIGNoZWNrIGlmIHRoZSBjbG9jawo+ID4gcmVxdWVzdGVkIGlzIGluIHJhbmdl
IG9yIGFzawo+ID4gZm9yIHNldF9yYXRlX2Nsa19taW4gdG8gYXZvaWQgdG8gaGF2ZSBzb21lbnRo
aW5nIGxvd2VyLiBUaGVuIGZvcgo+ID4gaW14NnVsbCBiZWNhdXNlIGlzIHNwb3JhZGljCj4gPiBJ
IHRoaW5rIHRoYXQgaXMgbW9yZSBjb25uZWN0ZWQgdG8gdGhlIGNsa19zZXRfcmF0ZSBhbmQgd2hl
biB5b3UgY2hhbmdlCj4gPiB0aGUgcmVnaXN0ZXIuIENhbiBub3QgYmUgYQo+ID4gc2V0dGluZyB0
aW1lPwo+Cj4gU28sIGlmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHdlIGZhY2UgdHdvIGRpZmZl
cmVudCBwcm9ibGVtczoKPiAtIGlteDYqOiBzZWVtcyBsaWtlIGEgY2xvY2sgaXNzdWUgcmVnYXJk
aW5nIHRoZSBjbG9jayBzZXR0bGVtZW50Cj4gLSBpbXgyODogYWN0dWFsIE5BTkQgZHJpdmVyIGlz
c3VlIChkb2VzIG5vdCBjaGVjayB0aGUgdmFsaWRpdHkgb2YgdGhlCj4gICBuZXcgZnJlcXVlbmN5
KS4gVGhpcyBzaG91bGQgYmUgaGFuZGxlZCBwcm9wZXJseSBpbgo+ICAgLT5zZXR1cF9pbnRlcmZh
Y2UoKS4KCkknbSBwbGFubmluZyB0byB3b3JrIG9uIGl0LCBJIG5lZWQgdG8gZGVsaXZlciBvbiB0
aGUgZmllbGQgdXBkYXRlcyBvbgp0aGUgbmV3IExUUyByZWxlYXNlLgpFdmVyeXRoaW5nIGlzIGNv
cnJlY3Qgd2hhdCB5b3Ugc2FpZC4gSSB3aWxsIGNoZWNrIGFuZCB0cnkgdG8gZml4IHRoZQppc3N1
ZXMgcHJvcGVybHkgYWZ0ZXIgdGhpcwoKTWljaGFlbAoKPgo+IFRoYW5rcywKPiBNaXF1w6hsCgoK
Ci0tIApNaWNoYWVsIE5henphcmVubyBUcmltYXJjaGkKQW1hcnVsYSBTb2x1dGlvbnMgQlYKQ09P
IENvLUZvdW5kZXIKQ3J1cXVpdXNrYWRlIDQ3IEFtc3RlcmRhbSAxMDE4IEFNIE5MClQuICszMSgw
KTg1MTExOTE3MgpNLiArMzkoMCkzNDc5MTMyMTcwCltgYXNdIGh0dHBzOi8vd3d3LmFtYXJ1bGFz
b2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
