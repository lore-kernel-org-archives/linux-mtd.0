Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2B2CA0ED3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2024 01:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUoS8i+nSs+Nregq9xrmm2+SkW/jlxD4DBzcGBfwS8E=; b=NJSdd60GOx7zlH
	knGBWmFOrnRY5R//nkaPj74P+tdaZT23KFV8tLNhD/D6G71Y1JrBwL7KtQ4la2k1R29eFJ+xAzaXr
	r2CJTuudyNGgNA/HXYXRt4VN/6MPMp4LzNPvGjHlKgAtX4XMhBAbsClo+6LZWeZqQgK+jmh15o6Cb
	qQzy3QVC4+piDPSM40c1WJkhh7MMRvrJq1zHGS/RJ+csbUj0i7oZD8t+1MLh7X8HT30jE7h9GBd5r
	0ak/90uoJExtq9SJLZUCCq0PHWS7T0vQI3GJFt3YA/A8jKMTRDKRjJNesFxYCRzVOH8dderKZjjwG
	VD3stuu5wuzwLllRmIHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slICQ-0000000FvRs-0Vag;
	Tue, 03 Sep 2024 01:19:14 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slICM-0000000FvRN-354b
	for linux-mtd@lists.infradead.org;
	Tue, 03 Sep 2024 01:19:11 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7b0c9bbddb4so3242291a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 02 Sep 2024 18:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725326350; x=1725931150; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wtf/Ee4Dft8BBuZx9uP5ZFryavcj7r6mlo07L0UCQIY=;
        b=aAdw1mYIb8Z/PiXhuUxH3SHKMvoMgHr5TJsB7HtN8KqJ1ibJOonLIkQhhbplYCaaIB
         1dcKmcvbjmd/fTAyECQTyoYCcXgeBSd1tNkKXhahH2TpRsXNlw6nWHv+b/FnkLPBZb8Q
         xLjaBdsd64uhG8CWBr+o9ZDbpAXoIzePSwHySCVbuAXHEd+wQCkvCm89iU4M3Qjck69s
         WH0A1cIlh/xScAx1IWNDOKVQd1ABbOxuw9q+hcQk7JDsQfKlGsUZC3lZY3mD7w35tfbj
         /cTKFIBkn63K9GSk/dq7VSnwnUtgJmBlH6OIS5x+ifsIW2T5M4mFdyRF8j9Ifl8FoX8b
         RBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725326350; x=1725931150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wtf/Ee4Dft8BBuZx9uP5ZFryavcj7r6mlo07L0UCQIY=;
        b=uY1GY5U7Jo2t5v+ZhCjdrh6S20Y/ic0+jGTv+ucwnh0871M8NlkFGwo4iRO5xCgZme
         Sq3pi72Huz0aF25Hk1M6qr5yBn72jCKslorz5wGemgE/1duzR2eCD8YDmq35yGAOgoqT
         0gQ0C7028nSN+qcmGjzK5KlxN/xUZVWOkh1JsEDP0ak2BdhmdDh575pvj0zc/456wXjk
         6YSQw1R322/rqItCQiVk6qKTwDIIIMoZqUOh1fxf7ZekSQtXssoqvR2Uy2I7K/I3SYFz
         dUESPAtvSFE00KjWTXHSy0JQOyx/wW67+0v6VZsRWa7i+uVUiXLIV7WUza1TF5KC43MU
         uFRw==
X-Forwarded-Encrypted: i=1; AJvYcCWCSuXvzwgQCboNbPLRGQjAaCkVxLM9mLieqivFbMMAzP7w3GWEj+YDkCkeMsGx0XdEhEGhXbRhPtY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzmaM5+vegDm3Xl+yyV4xNYWB7FuTHlrXCxyS3mmL7YcULgKSl
	Chkw1zklmxxaAn7LBaGylthkLt3SqnDwhy8IIlhZV5fWlzl8vhsB1mXzIPnHwbnn37kuy65dZ1V
	N+7hoqWQ0SjneLPkrznl3c4rM5DX8xQ==
X-Google-Smtp-Source: AGHT+IFYFe6coyn7vjRDqRbe/FCNHDg3Ss9+kQJeWWsci1b7/Ud58eA49PNyMcJH2d+tHrQr7woeOe3agXVslD/BGPM=
X-Received: by 2002:a17:90b:88b:b0:2d8:94d6:3499 with SMTP id
 98e67ed59e1d1-2d894d6356bmr9607797a91.37.1725326349613; Mon, 02 Sep 2024
 18:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240830100310.1553675-1-linchengming884@gmail.com>
 <20240830100310.1553675-2-linchengming884@gmail.com> <20240830175504.746fb2ec@xps-13>
 <CAAyq3Sbta_p9WNOTEdCA7V=huPkeFFxUvxTqfzRJz0dsJMJBwg@mail.gmail.com> <20240902142853.5fff056a@xps-13>
In-Reply-To: <20240902142853.5fff056a@xps-13>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 3 Sep 2024 09:16:58 +0800
Message-ID: <CAAyq3SYaK02yV=JOj5qdrJQbkt71n4E0CZ5KUkk5u5uG755-Mw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] mtd: spinand: Add support for setting plane select bits
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_181910_797184_01CB0739 
X-CRM114-Status: GOOD (  22.92  )
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
IDIwMjTlubQ55pyIMuaXpSDpgLHkuIAg5LiL5Y2IODoyOOWvq+mBk++8mgo+Cj4gSGkgQ2hlbmcs
Cj4KPiBsaW5jaGVuZ21pbmc4ODRAZ21haWwuY29tIHdyb3RlIG9uIE1vbiwgMiBTZXAgMjAyNCAx
Njo0Mjo1NSArMDgwMDoKPgo+ID4gSGkgTWlxdWVsLAo+ID4KPiA+IEkgYWNjaWRlbnRhbGx5IHNl
bnQgdGhlIHByZXZpb3VzIGVtYWlsIGJlZm9yZSBpdCB3YXMgZmluaXNoZWQuCj4gPgo+ID4gTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8IDIwMjTlubQ45pyIMzDm
l6Ug6YCx5LqUIOS4i+WNiDExOjU15a+r6YGT77yaCj4gPiA+Cj4gPiA+IEhpIENoZW5nTWluZywK
PiA+ID4KPiA+ID4gbGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbSB3cm90ZSBvbiBGcmksIDMwIEF1
ZyAyMDI0IDE4OjAzOjA5ICswODAwOgo+ID4gPgo+ID4gPiA+IEZyb206IENoZW5nIE1pbmcgTGlu
IDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gPiA+ID4KPiA+ID4gPiBBZGQgdHdvIGZsYWdz
IGZvciBpbnNlcnRpbmcgdGhlIFBsYW5lIFNlbGVjdCBiaXQgaW50byB0aGUgY29sdW1uCj4gPiA+
ID4gYWRkcmVzcyBkdXJpbmcgdGhlIHdyaXRlX3RvX2NhY2hlIGFuZCB0aGUgcmVhZF9mcm9tX2Nh
Y2hlIG9wZXJhdGlvbi4KPiA+ID4gPgo+ID4gPiA+IEFkZCB0aGUgU1BJTkFORF9IQVNfUFBfUExB
TkVfU0VMRUNUX0JJVCBmbGFnIGZvciBzZXJpYWwgTkFORCBmbGFzaAo+ID4gPgo+ID4gPiBUaGlz
IGZsYWcgaGFzIGJlZW4gcmVuYW1lZCA6KQo+ID4KPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHJlbWlu
ZGVyLiBJIHdpbGwgbWFrZSB0aGUgbmVjZXNzYXJ5IGNoYW5nZXMuCj4gPgo+ID4gPgo+ID4gPiA+
IHRoYXQgcmVxdWlyZSBpbnNlcnRpbmcgdGhlIFBsYW5lIFNlbGVjdCBiaXQgaW50byB0aGUgY29s
dW1uIGFkZHJlc3MKPiA+ID4gPiBkdXJpbmcgdGhlIHdyaXRlX3RvX2NhY2hlIG9wZXJhdGlvbi4K
PiA+ID4gPgo+ID4gPiA+IEFkZCB0aGUgU1BJTkFORF9IQVNfUkVBRF9QTEFORV9TRUxFQ1RfQklU
IGZsYWcgZm9yIHNlcmlhbCBOQU5EIGZsYXNoCj4gPiA+ID4gdGhhdCByZXF1aXJlIGluc2VydGlu
ZyB0aGUgUGxhbmUgU2VsZWN0IGJpdCBpbnRvIHRoZSBjb2x1bW4gYWRkcmVzcwo+ID4gPiA+IGR1
cmluZyB0aGUgcmVhZF9mcm9tX2NhY2hlIG9wZXJhdGlvbi4KPiA+ID4gPgo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gPiA+
ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyB8IDYgKysrKysrCj4g
PiA+ID4gIGluY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaCB8IDIgKysKPiA+ID4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMK
PiA+ID4gPiBpbmRleCBlMGI2NzE1ZTVkZmUuLmU3YjU5MmNkYmI0YyAxMDA2NDQKPiA+ID4gPiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL210
ZC9uYW5kL3NwaS9jb3JlLmMKPiA+ID4gPiBAQCAtMzg2LDYgKzM4Niw5IEBAIHN0YXRpYyBpbnQg
c3BpbmFuZF9yZWFkX2Zyb21fY2FjaGVfb3Aoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5k
LAo+ID4gPiA+ICAgICAgIGVsc2UKPiA+ID4gPiAgICAgICAgICAgICAgIHJkZXNjID0gc3BpbmFu
ZC0+ZGlybWFwc1tyZXEtPnBvcy5wbGFuZV0ucmRlc2NfZWNjOwo+ID4gPiA+Cj4gPiA+ID4gKyAg
ICAgaWYgKHNwaW5hbmQtPmZsYWdzICYgU1BJTkFORF9IQVNfUkVBRF9QTEFORV9TRUxFQ1RfQklU
KQo+ID4gPiA+ICsgICAgICAgICAgICAgY29sdW1uIHw9IHJlcS0+cG9zLnBsYW5lIDw8IGZscyhu
YW5kZGV2X3BhZ2Vfc2l6ZShuYW5kKSk7Cj4gPiA+Cj4gPiA+IElzbid0IHRoZXJlIGFueSBiZXR0
ZXIgd2F5IHRvIGtub3cgd2hhdCB0aGUgYml0IHBvc2l0aW9uIGlzPwo+ID4KPiA+IFRoZXJlIGFy
ZSB0d28gb3RoZXIgbWV0aG9kcyB0byBkZXRlcm1pbmUgdGhlIGJpdCBwb3NpdGlvbjoKPiA+IC0g
Y29sdW1uIHw9IHJlcy0+cG9zLnBsYW5lIDw8IGZscyhuYW5kLT5tZW1vcmcucGFnZXNpemUpCj4g
PiAtIGNvbHVtbiB8PSB3ZGVzYy0+aW5mby5vZmZzZXQKPgo+IE9rLCBsZXQncyBrZWVwIGl0IGlz
IGFzLWlzIGZvciBub3cuCj4KCkdvdCBpdC4gSSdsbCBrZWVwIGl0IGFzLWlzIGZvciBub3cuCgo+
IFRoYW5rcywKPiBNaXF1w6hsCgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
