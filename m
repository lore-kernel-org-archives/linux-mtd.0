Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDF5C52D7C
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2024 06:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LO/7DWfUW3L/RrJXZ4PvC9EOl5tIXBWa/d8TT8NiuA=; b=DD9pPVlPhL1xEz
	kyWrR4wW0CsOP+5kaSlW90tsP9v11VskKlG/cPGGgPpQ/fb+4CFDGMJNjVXBvFR3lEScYo64FMtah
	bR5eLbpW/k9I3nKlR1Syo/pe1QCYdkrs/DacuwSum3kbyPaOJcAUljlMFujwUYcdSVMJD6kkHDJHY
	d5zHUW/P+0EnivhJshRe8Cl3pM6RPpWcmgllqZZiSC3t3+AlN9AkYMhJJg4ZGkSa4HuubCh8IXhTO
	me9FyocCTaIe+5l8Qo9kBc7ui8uPyusDxZNtzHvD7b2MbA2u2Lfl37VFKerfRJT8p7vMcbFccAFfB
	SxcngWIE/bmYkf30SRoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdkdy-00000002WEA-3VHg;
	Tue, 13 Aug 2024 06:04:30 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdkdu-00000002WDh-1vDS
	for linux-mtd@lists.infradead.org;
	Tue, 13 Aug 2024 06:04:28 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2cdadce1a57so3967314a91.2
        for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2024 23:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723529065; x=1724133865; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJLsE7Xr/p93PhEhSOjWGpmLu5pfF3uWp3jc7+NUeN4=;
        b=XSgSkyT9d8eAA2Pf/C/m4Js/XKoGc8+nQo+N6BpvMfjoVljnXsvKgB33+vHowjVQTe
         b3OG8e0JnQhQLDzUwtRQlosTz6XD/dnioYVLy49P6lwx7SXhyttR6D6f01NQQ2Tykfdc
         wWiF7WqHaz/P4l72+hnPHxMZBDmGhJMz2i/gTCGzHM8hCVs15eHsBbVxl2+iMbD4gswi
         5O54iWeMTAXGTEr8QhREuc9WkQ6oP7KfYlhnSp6swAqpFrCOLEsJTNmipRaVpRgWa1nr
         MLUvldM0qzpiXccBT6GxVmBqXS82H2srm0ajVNdMJSu2ZL2qCZPobRT0rZRE4cv2RvbP
         5pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723529065; x=1724133865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJLsE7Xr/p93PhEhSOjWGpmLu5pfF3uWp3jc7+NUeN4=;
        b=uaIygyDIncJ7jIWAQ0xXCh4IFJ+J6+nveUbjUw1w8380cUvtl19+i88MONyj3iTCP2
         50n8jIjP0o3MltNbG8t+Q9OQ271EoA95v1UskfnTQFxFtBhEzYD5n+BHPYYnEjHtNpXi
         ixmLV+utiXwBp7wjjpdpfFvWSpD1bEePJGKbnJm1UPoMSQuJbCs/XvZyIgrN0OnOxVZ3
         j7qd0BCnntKXN/Zlh1GFz6LiIhriwQPXmpJlbnLwRS+gr/qP8xR8wOOIxwACjrNmNGlB
         MTOtQnUuX75MkkRyEOTASkcgo5UYpDdJmrCM3JYRcxnCy0NLlfNWBSRBU1G63DgFYSsq
         s6og==
X-Forwarded-Encrypted: i=1; AJvYcCU05X2EdzpAX/NxZbSFZaKT2TZmmVKSdoKQtUVLO5bs0UmW9KBC13MLKxA6i6NfK6/xuZlkjQiRM3JwjLeJHUgSXBrUOKhmqyK2stbkQg==
X-Gm-Message-State: AOJu0YzOE8ri6P6qot7496KBRuUr6M0pHXYZNF46Kikj8tTp4Rd/je/v
	rJ6hK4Lc3uLCbTY6zwjYl/Icv4jOtX9HX+PF1XlA33ys55vOeheKASo9Q1F+YLg7SpZlMGOlcJA
	UZZ/CesIBEAUTdgImz5MXSlE/lTg=
X-Google-Smtp-Source: AGHT+IHqhg7Fh7b0TIq7m0lUpP+gnrWZRgw8uTbB2WK2/ABQlNCExOmUDrbZ+YpR7/f/tAtvyqerpK34MsO1kNQK6hE=
X-Received: by 2002:a17:90a:d794:b0:2c7:ab00:f605 with SMTP id
 98e67ed59e1d1-2d39254ebe9mr2709394a91.20.1723529065033; Mon, 12 Aug 2024
 23:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240718075356.488253-1-linchengming884@gmail.com> <20240812105630.2b71ed19@xps-13>
In-Reply-To: <20240812105630.2b71ed19@xps-13>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 13 Aug 2024 14:02:44 +0800
Message-ID: <CAAyq3SazQFSU9C5Z5YURP9cFdc6gLNJfF2ReQ9Z_-GpzVWhoeQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add fixups for two-plane serial NAND flash
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_230426_527730_909813AF 
X-CRM114-Status: GOOD (  24.30  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjTlubQ45pyIMTLml6Ug6YCx5LiAIOS4i+WNiDQ6NTblr6vpgZPvvJoKPgo+IEhpIENoZW5n
LAo+Cj4gbGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbSB3cm90ZSBvbiBUaHUsIDE4IEp1bCAyMDI0
IDE1OjUzOjU0ICswODAwOgo+Cj4gPiBGcm9tOiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdtaW5nbGlu
QG14aWMuY29tLnR3Pgo+ID4KPiA+IE1hY3Jvbml4IHNlcmlhbCBOQU5EIGZsYXNoIHdpdGggYSB0
d28tcGxhbmUgc3RydWN0dXJlCj4gPiByZXF1aXJlcyBpbnNlcnRpb24gb2YgUGxhbmUgU2VsZWN0
IGJpdCBpbnRvIHRoZSBjb2x1bW4KPiA+IGFkZHJlc3MgZHVyaW5nIHRoZSB3cml0ZV90b19jYWNo
ZSBvcGVyYXRpb24uCj4gPgo+ID4gQWRkaXRpb25hbGx5LCBmb3IgTVgzNXtVLEZ9MkcxNEFDLCBp
bnNlcnRpb24gb2YgUGxhbmUKPiA+IFNlbGVjdCBiaXQgaW50byB0aGUgY29sdW1uIGFkZHJlc3Mg
aXMgcmVxdWlyZWQgZHVyaW5nCj4gPiB0aGUgcmVhZF9mcm9tX2NhY2hlIG9wZXJhdGlvbi4KPgo+
IEkgZ3Vlc3MgaWYgdGhlIHBsYW5lIGJpdCBpcyBuZWVkZWQgZm9yIHlvdXIgY2hpcHMsIGl0IGlz
IGFsc28gbmVlZGVkCj4gZm9yIG90aGVyIHdoaXBzIHdpdGggdHdvIHBsYW5lcz8gQ291bGQgaXQg
YmUgcG9zc2libGUgdGhhdCB3ZSBuZXZlciBoYWQKPiBzdXBwb3J0IGZvciBkZXZpY2VzIHdpdGgg
bW9yZSB0aGFuIG9uZSBwbGFuZSBhbmQgeW91IGp1c3QgZmFsbCBpbnRvIGEKPiBjb21tb24gaXNz
dWU/IE1heWJlIHdlIHNob3VsZCBhbHdheXMgYWRkIHRoZSBwbGFuZSBpbmZvcm1hdGlvbiB3aGVu
Cj4gdGhlcmUgaXMgbW9yZSB0aGFuIG9uZSBwbGFuZSB0byBhZGRyZXNzPyBDYW4geW91IGNoZWNr
IHdoZXRoZXIgdGhpcyBpcwo+IHNwZWNpZmljIHRvIE1hY3Jvbml4IG9yIG5vdD8KPgoKSSBoYXZl
IHJldmlld2VkIHRoZSBjaGlwcyBsaXN0ZWQgYnkgZWFjaCB2ZW5kb3IuCgpNaWNyb24gb2ZmZXJz
IE1UMjlGMkcwMUFCe0EsQn1HRCwgTVQyOUYyRzAxQUFBRUQgd2l0aCB0d28gcGxhbmVzOwpob3dl
dmVyLCBvbmx5IE1UMjlGMkcwMUFBQUVEIHJlcXVpcmVzIHRoZSBwbGFuZSBzZWxlY3QgYml0IHdo
ZW4gcGVyZm9ybWluZwpwcm9ncmFtIGxvYWQgb3IgcmVhZCBmcm9tIGNhY2hlLgoKTGluazogaHR0
cHM6Ly9zZW1pY29uZHVjdG9ycy5lcy9wZGYtZG93bi9NL1QvMi9NVDI5RjJHMDFBQUFFRC1NaWNy
b25UZWNobm9sb2d5LnBkZgoKV2luYm9uZCBwcm92aWRlcyBXMjVOMDRLViB3aXRoIHR3byBwbGFu
ZXMsIGJ1dCBpdCBkb2VzIG5vdCByZXF1aXJlIHRoZSBwbGFuZQpzZWxlY3QgYml0IGZvciBwcm9n
cmFtIGxvYWQgb3IgY2FjaGUgcmVhZCBvcGVyYXRpb25zLgoKVGhlcmVmb3JlLCB3ZSBzaG91bGQg
bm90IGFsd2F5cyBpbmNsdWRlIHRoZSBwbGFuZSBzZWxlY3QgYml0IHdoZW4gZGVhbGluZyB3aXRo
Cm11bHRpcGxlIHBsYW5lcy4KCj4gSW4gdGhpcyBjYXNlIHdlIHdvdWxkbid0IG5lZWQgYSBzcGVj
aWZpYyBmaXh1cC4KPgoKQmFzZWQgb24gdGhlIGFib3ZlIHBlcnNwZWN0aXZlLCBkbyB3ZSBzdGls
bCBuZWVkIHRvIHVzZSBmaXh1cCwgb3IgY2FuIHdlIHVzZQpmbGFncyB0byBkZXRlcm1pbmUgd2hl
dGhlciB0aGUgcGxhbmUgc2VsZWN0IGJpdCBpcyBuZWNlc3Nhcnk/Cgo+ID4KPiA+IFRoZXNlIGZs
YXNoZXMgaGF2ZSBiZWVuIHZhbGlkYXRlZCBvbiBYaWxpbnggenlucS1waWNvemVkCj4gPiBib2Fy
ZCB3aGljaCBpbmNsdWRlZCBNYWNyb25peCBTUEkgSG9zdC4KPiA+Cj4gPiBDaGVuZyBNaW5nIExp
biAoMik6Cj4gPiAgIG10ZDogc3BpbmFuZDogQWRkIGZpeHVwcyBmb3Igc3BpbmFuZAo+ID4gICBt
dGQ6IHNwaW5hbmQ6IG1hY3Jvbml4OiBGaXh1cHMgZm9yIFBsYW5lIFNlbGVjdCBiaXQKPiA+Cj4g
PiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jICAgICB8ICA3ICsrKysKPiA+ICBkcml2ZXJz
L210ZC9uYW5kL3NwaS9tYWNyb25peC5jIHwgNjYgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tCj4gPiAgaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oICAgICB8IDE3ICsrKysrKysr
Kwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgODQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
PiA+Cj4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpUaGFua3MsCkNoZW5nTWluZyBMaW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
