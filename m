Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794BACA0ED3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2024 08:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAo7g/Vg4+it41A41g+Bq5lzYATFSYaWAG5dREPguaw=; b=uTJCDedrpvHtTj
	W4r8A7mzorx2rWxYzA6gOZcw2smMHQDkPM/K+WlFPBuXFvAwLOSxV41hEsa8Rj6XpvalzDgn/jBkZ
	CEUz3XFuLG3eRhXnZItLM3kRPLOZc+J4YYwtM7VSi3sFlyMiEs5reSthlW99tOHJa4GYhE4gdEQnE
	ktEp3mjml2nRYGGZcDW1En0JRCeRheLxXPBn+Wi2dL7SK6d9tgalP2x5IV3GMiz/quR0V59blKtBZ
	fG3Ddlc7HjrVjrDbrrR4nRa/TWVY19hDf9zmJgmj/80Bhe+D70TIDjjOJxvyy9pEddGvfS8eZaABO
	rW5ntDbKSqy/ffCAz+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl2c3-0000000DYVx-2cYw;
	Mon, 02 Sep 2024 08:40:39 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl2bD-0000000DYNU-1HAx
	for linux-mtd@lists.infradead.org;
	Mon, 02 Sep 2024 08:39:48 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-70cec4aa1e4so2845205b3a.1
        for <linux-mtd@lists.infradead.org>; Mon, 02 Sep 2024 01:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725266386; x=1725871186; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2hoLnYFfOGemlntb3egVQrjUR4/SgapZuQTT6xekaI=;
        b=k0XfsB18aUf+3/gKz4Wy4vXZkc1rqbrFiKBc4CsMq3rca6LCFQc3GGDXmriJE0A2Hu
         7vjjEzmEvIIbd8Oqck6qHuFy+tFWfx8rS/Ejq3FB0nesk/lSn/5SjEHR9vxm+vB8TFTL
         WeqbnIPoavTsSgsxF7lS3bnGRtz+UQJ4LAut6AF+a+0fmoTE1Ohx4y0seIFF68D8l03c
         2w97uNZnJE31jI/nPoRcCIxp3jN3td9KEZvNl0bFnvLWT2wOZ5kaGkx01ZuDpAP69rZq
         XEBStQa3x/iRnIaajUQcyvHWkIVtz+hoUdwVB+WLuCao34hraJXEA/wUBmbkJQEhMe0j
         Ttmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725266386; x=1725871186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2hoLnYFfOGemlntb3egVQrjUR4/SgapZuQTT6xekaI=;
        b=LVnNuVvaCA6AL1x/S0MIvqrWPCs9DAuTKz1DPLbqh3E0WSowPB+R2UiNX3Y8bmYbm6
         L23rup8tSq+0C1TVDzCc6NL7FO9PToXs0UsI9SLnUP57IPNriAluOOkEk5eq+9SsD23a
         kml51q7tj/DHIDPXaZmu82MJvyP8/Mv6KxlxGVZz/Fj1Dw45FskZ3lMjLY+5Oag2owJa
         3EUhwd19b7TqQh/xqKeyuJ2fsrbrwc5AbkeRERaqcaD2lWM9ttGMGKaGxF+3rsgO0l8l
         nW86GfbX1BH6u/1c+F6wpJWNT2phuXzf5uu2RD8N055kJg8j9NNtmJUGvdrxqk848wAT
         XScw==
X-Forwarded-Encrypted: i=1; AJvYcCVyjQCGfTMabPe+wDTg0juvWt9+G4zHljZ+WjFfBKMLZz37FD2X3KeVCRYNuY2InBtQsYr2M9n227Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPgKUYN8LwG37KYs39U3QBIn0l1xCSFnBYOHB49I2O9cDNKzZL
	8cdx2GNPbC2Cgh3ulaEBJjGMubo2f4F+huA9eGDVtuzYKcu1E9h9mItzdqphM/R0xdch3M8rdhb
	smsffA0pl5Zt238zsB6jV4ribeR8VVg==
X-Google-Smtp-Source: AGHT+IEN7wSn9ANmj1DN/9TmftBVOHUgtX5aXOzJ9LLRdFRLj0WzAGG51HYdLYFjdnXPPigqRrBQZzf7D09ezk0LfLY=
X-Received: by 2002:a05:6a20:9f09:b0:1ca:2789:c3ad with SMTP id
 adf61e73a8af0-1cce1003843mr15325036637.4.1725266385820; Mon, 02 Sep 2024
 01:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240830100310.1553675-1-linchengming884@gmail.com>
 <20240830100310.1553675-2-linchengming884@gmail.com> <20240830175504.746fb2ec@xps-13>
In-Reply-To: <20240830175504.746fb2ec@xps-13>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 2 Sep 2024 16:37:35 +0800
Message-ID: <CAAyq3SY=o_UGwddEhD9O6EGoEhrEf8YZ61PwBP2cduL+bt0BgA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] mtd: spinand: Add support for setting plane select bits
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_013947_398684_C733FD6E 
X-CRM114-Status: GOOD (  18.56  )
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
IDIwMjTlubQ45pyIMzDml6Ug6YCx5LqUIOS4i+WNiDExOjU15a+r6YGT77yaCj4KPiBIaSBDaGVu
Z01pbmcsCj4KPiBsaW5jaGVuZ21pbmc4ODRAZ21haWwuY29tIHdyb3RlIG9uIEZyaSwgMzAgQXVn
IDIwMjQgMTg6MDM6MDkgKzA4MDA6Cj4KPiA+IEZyb206IENoZW5nIE1pbmcgTGluIDxjaGVuZ21p
bmdsaW5AbXhpYy5jb20udHc+Cj4gPgo+ID4gQWRkIHR3byBmbGFncyBmb3IgaW5zZXJ0aW5nIHRo
ZSBQbGFuZSBTZWxlY3QgYml0IGludG8gdGhlIGNvbHVtbgo+ID4gYWRkcmVzcyBkdXJpbmcgdGhl
IHdyaXRlX3RvX2NhY2hlIGFuZCB0aGUgcmVhZF9mcm9tX2NhY2hlIG9wZXJhdGlvbi4KPiA+Cj4g
PiBBZGQgdGhlIFNQSU5BTkRfSEFTX1BQX1BMQU5FX1NFTEVDVF9CSVQgZmxhZyBmb3Igc2VyaWFs
IE5BTkQgZmxhc2gKPgo+IFRoaXMgZmxhZyBoYXMgYmVlbiByZW5hbWVkIDopCgpUaGFuayB5b3Ug
Zm9yIHRoZSByZW1pbmRlci4gSSB3aWxsIG1ha2UgdGhlIG5lY2Vzc2FyeSBjaGFuZ2VzLgoKPgo+
ID4gdGhhdCByZXF1aXJlIGluc2VydGluZyB0aGUgUGxhbmUgU2VsZWN0IGJpdCBpbnRvIHRoZSBj
b2x1bW4gYWRkcmVzcwo+ID4gZHVyaW5nIHRoZSB3cml0ZV90b19jYWNoZSBvcGVyYXRpb24uCj4g
Pgo+ID4gQWRkIHRoZSBTUElOQU5EX0hBU19SRUFEX1BMQU5FX1NFTEVDVF9CSVQgZmxhZyBmb3Ig
c2VyaWFsIE5BTkQgZmxhc2gKPiA+IHRoYXQgcmVxdWlyZSBpbnNlcnRpbmcgdGhlIFBsYW5lIFNl
bGVjdCBiaXQgaW50byB0aGUgY29sdW1uIGFkZHJlc3MKPiA+IGR1cmluZyB0aGUgcmVhZF9mcm9t
X2NhY2hlIG9wZXJhdGlvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuZyBNaW5nIExpbiA8
Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9z
cGkvY29yZS5jIHwgNiArKysrKysKPiA+ICBpbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmggfCAy
ICsrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkv
Y29yZS5jCj4gPiBpbmRleCBlMGI2NzE1ZTVkZmUuLmU3YjU5MmNkYmI0YyAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9zcGkvY29yZS5jCj4gPiBAQCAtMzg2LDYgKzM4Niw5IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9y
ZWFkX2Zyb21fY2FjaGVfb3Aoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ID4gICAg
ICAgZWxzZQo+ID4gICAgICAgICAgICAgICByZGVzYyA9IHNwaW5hbmQtPmRpcm1hcHNbcmVxLT5w
b3MucGxhbmVdLnJkZXNjX2VjYzsKPiA+Cj4gPiArICAgICBpZiAoc3BpbmFuZC0+ZmxhZ3MgJiBT
UElOQU5EX0hBU19SRUFEX1BMQU5FX1NFTEVDVF9CSVQpCj4gPiArICAgICAgICAgICAgIGNvbHVt
biB8PSByZXEtPnBvcy5wbGFuZSA8PCBmbHMobmFuZGRldl9wYWdlX3NpemUobmFuZCkpOwo+Cj4g
SXNuJ3QgdGhlcmUgYW55IGJldHRlciB3YXkgdG8ga25vdyB3aGF0IHRoZSBiaXQgcG9zaXRpb24g
aXM/CgpUaGVyZSBhcmUgdHdvIG90aGVyIG1ldGhvZHMgdG8gZGV0ZXJtaW5lIHRoZSBiaXQgcG9z
aXRpb246Ci0gY29sdW1uIHw9Cgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
