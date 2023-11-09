Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B93C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 07:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2z4bVZwwhWUONNtAZmWCGqbZyYiB4wQPAM6Md+KwKhY=; b=LJZAcp1n926wgb
	fHUqWZqPci+v/JX6UmOznC5jQEwAYWe/PQHQr9n4Trn5Ew3UHZdUXM0X0Ayr3l/2NM9Tux2cBxB5Z
	9CBzQOgE+CY2nVzNQoIZsM+sjDiiPu6Oj/O6YFo0OYjAemXh8Tc/z6JvrGZNe7+Oc+Sy1KPMChDbt
	UCXajnALl+d2vRl4jXQBzE6C99nOnKMKYfw/YwiqyhY4mH/OKyAg9MUylUWN8BEV/4KYELoNVXEyq
	DHhaDPt1MtV63gDumvN1SKC1ITI1Gy1ILN7H/iZ3V/sDPnXtmOxmdHyStSDqwy8fZhsPd1V1xvQUL
	yICFhHMqOH71d81OzNQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0zuj-005YMG-2u;
	Thu, 09 Nov 2023 07:57:21 +0000
Received: from mail-yw1-f174.google.com ([209.85.128.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0zuh-005YL8-28
	for linux-mtd@lists.infradead.org;
	Thu, 09 Nov 2023 07:57:21 +0000
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5ae143e08b1so7185957b3.1
        for <linux-mtd@lists.infradead.org>; Wed, 08 Nov 2023 23:57:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699516630; x=1700121430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b28VPbp8gB3rXtgafI6M110iwvDhv/DLhKESOoHQijM=;
        b=tWvNZaP+Z6hXFSlrXyt01F2ZG7Uwfcuym946aCcz+kiw0nQB8TqzbbDfbxNOhTpVos
         n6Yg7GILelFkIhDb5RDL3hnftiHlZxwYayf7lhsfsG+a46n4maT2xuPmWYrk+BKeL3hA
         e4o4Iv4T8zsciQ02D9zUuWpZ0UNkasW34FRpRIKQCaPVy4cyEYUnd7AAXQf6g4pi+3dr
         ATjM6e4yIJZGifNuvzHgRM/MjBd059Dy3631gCq6yLmUOGd+F+PcQNwHx7IbVi0o0nx3
         YGxLiuD2/0Mq3ALggsmELtRa9IKctM33lYtr0NUxKplLViFAP1gyB44f12LNwF0bktlQ
         zLvw==
X-Gm-Message-State: AOJu0YydvQ5nsQA8iI0mJSbguqOMz6+iUDrtSCRRD0b8rUQ8poqzhm3E
	GQ72J3j3E/CVA7sWy8fCXFZpUFeNH02KkQ==
X-Google-Smtp-Source: AGHT+IEt2qBjHylsx/rNOwANJoYZclJdgH5Wx3bR0lUKNCh8nCWG8IQsPfdP8gSoccU67XOBe5Jxag==
X-Received: by 2002:a0d:d952:0:b0:5a7:ba09:52c7 with SMTP id b79-20020a0dd952000000b005a7ba0952c7mr4297748ywe.11.1699516630037;
        Wed, 08 Nov 2023 23:57:10 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id b12-20020a0dd90c000000b005b59652bcdesm7734669ywe.60.2023.11.08.23.57.09
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 23:57:09 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5bf58914bacso4143037b3.3
        for <linux-mtd@lists.infradead.org>; Wed, 08 Nov 2023 23:57:09 -0800 (PST)
X-Received: by 2002:a81:84cc:0:b0:5a7:fa8b:3fa6 with SMTP id
 u195-20020a8184cc000000b005a7fa8b3fa6mr4343779ywf.9.1699516629341; Wed, 08
 Nov 2023 23:57:09 -0800 (PST)
MIME-Version: 1.0
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com> <20231108171149.258656-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231108171149.258656-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Nov 2023 08:56:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdzbtR+ruXwfS1a74rnH494kMsFvaT9MTz7cW-LFpB1A@mail.gmail.com>
Message-ID: <CAMuHMdXdzbtR+ruXwfS1a74rnH494kMsFvaT9MTz7cW-LFpB1A@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] spi: spi-mem: Add set_iofv() callback
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Michael Walle <michael@walle.cc>, 
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_235719_700333_16BB2E5A 
X-CRM114-Status: GOOD (  26.14  )
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

SGkgQmlqdSwKCk9uIFdlZCwgTm92IDgsIDIwMjMgYXQgNjoxMuKAr1BNIEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6Cj4gQXMgcGVyIHNlY3Rpb24gOC4xNCBvbiB0
aGUgQVQyNVFMMTI4QSBoYXJkd2FyZSBtYW51YWwsCj4gSU8wLi5JTzMgbXVzdCBiZSBzZXQgdG8g
SGktWiBzdGF0ZSBmb3IgdGhpcyBmbGFzaCBmb3IgZmFzdCByZWFkIHF1YWQgSU8uCj4gU25pcHBl
dCBmcm9tIEhXIG1hbnVhbCBzZWN0aW9uIDguMTQ6Cj4gVGhlIHVwcGVyIG5pYmJsZSBvZiB0aGUg
TW9kZShNNy00KSBjb250cm9scyB0aGUgbGVuZ3RoIG9mIHRoZSBuZXh0IEZBU1QKPiBSZWFkIFF1
YWQgSU8gaW5zdHJ1Y3Rpb24gdGhyb3VnaCB0aGUgaW5jbHVzaW9uIG9yIGV4Y2x1c2lvbiBvZiB0
aGUgZmlyc3QKPiBieXRlIGluc3RydWN0aW9uIGNvZGUuIFRoZSBsb3dlciBuaWJibGUgYml0cyBv
ZiB0aGUgTW9kZShNMy0wKSBhcmUgZG9uJ3QKPiBjYXJlLiBIb3dldmVyLCB0aGUgSU8gcGlucyBt
dXN0IGJlIGhpZ2gtaW1wZWRhbmNlIGJlZm9yZSB0aGUgZmFsbGluZyBlZGdlCj4gb2YgdGhlIGZp
cnN0IGRhdGEgb3V0IGNsb2NrLgo+Cj4gQWRkIHNldF9pb2Z2KCkgY2FsbGJhY2sgZm9yIGNvbmZp
Z3VyaW5nIElPIGZpeGVkIHZhbHVlcyB0byBjb250cm9sIHRoZQo+IHBpbiBzdGF0ZS4KPgo+IFNp
Z25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4KClRoYW5r
cyBmb3IgeW91ciBwYXRjaCEKCj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLW1lbS5jCj4gKysrIGIv
ZHJpdmVycy9zcGkvc3BpLW1lbS5jCj4gQEAgLTI5Nyw2ICsyOTcsMjYgQEAgc3RhdGljIHZvaWQg
c3BpX21lbV9hY2Nlc3NfZW5kKHN0cnVjdCBzcGlfbWVtICptZW0pCj4gICAgICAgICAgICAgICAg
IHBtX3J1bnRpbWVfcHV0KGN0bHItPmRldi5wYXJlbnQpOwo+ICB9Cj4KPiArLyoqCj4gKyAqIHNw
aV9tZW1fc2V0X2lvZnYoKSAtIFNldCBJTyBmaXhlZCB2YWx1ZXMgdG8gY29udHJvbCB0aGUgcGlu
IHN0YXRlCj4gKyAqIEBtZW06IHRoZSBTUEkgbWVtb3J5Cj4gKyAqIEB2YWw6IHRoZSBJTyBmaXhl
ZCB2YWx1ZXMKClBsZWFzZSBkb2N1bWVudCB0aGUgbWVhbmluZyBvZiB0aGlzIHZhbHVlIChpLmUu
IHdoYXQgZG9lcyBhCnNldCBvciBjbGVhcmVkIGJpdCBtZWFuPykuCgo+ICsgKgo+ICsgKiBTZXQg
SU8gZml4ZWQgdmFsdWVzIHRvIGNvbnRyb2wgdGhlIHBpbiBzdGF0ZS4KPiArICoKPiArICogUmV0
dXJuOiAwIGluIGNhc2Ugb2Ygc3VjY2VzcywgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG90aGVyd2lz
ZS4KPiArICovCj4gK2ludCBzcGlfbWVtX3NldF9pb2Z2KHN0cnVjdCBzcGlfbWVtICptZW0sIHUz
MiB2YWwpCj4gK3sKPiArICAgICAgIHN0cnVjdCBzcGlfY29udHJvbGxlciAqY3RsciA9IG1lbS0+
c3BpLT5jb250cm9sbGVyOwo+ICsKPiArICAgICAgIGlmIChjdGxyLT5tZW1fb3BzICYmIGN0bHIt
Pm1lbV9vcHMtPnNldF9pb2Z2KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gY3Rsci0+bWVtX29w
cy0+c2V0X2lvZnYobWVtLCB2YWwpOwo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gK0VY
UE9SVF9TWU1CT0xfR1BMKHNwaV9tZW1fc2V0X2lvZnYpOwo+ICsKPiAgLyoqCj4gICAqIHNwaV9t
ZW1fZXhlY19vcCgpIC0gRXhlY3V0ZSBhIG1lbW9yeSBvcGVyYXRpb24KPiAgICogQG1lbTogdGhl
IFNQSSBtZW1vcnkKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cndo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
