Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AB0C5479A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2024 10:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YW5nwEe+KxTMAwTTZ7CcSfWBdU8swS57RZ8ngxTYmsc=; b=tR60DQMwnrAiQA
	ngWCRhj4OM8AXIpqHPQ6SnVMA5gaYHBlH/vItxKPqyeMBuULtcisVdHuwcVOpt2W951MwfQhafZ6m
	eqsx69igDqnv5Sm0YzUtMnmTBF+C/+wk3AQw/W/UQ7iJvOmlAegsgiqxqpRNAb8dVVbzO5OyPMOUn
	kDoo/vxmH0oPgy6FdMYOB/7OwU4zAViAdt3GovavRlQmJkT6gl9l1iZvZHagK8lT/8SNXlTBfxoiY
	Fo8SUsXm9LE46HFuEXwIYtCu9pTNgTMSzr8PtSrjjvBjG7LH/nTy3NT7XZ9+onFYvxPwngpko3z9x
	aVnVY9JoHQlOm4lp+/7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjFUw-0000000Eq51-3u5i;
	Wed, 28 Aug 2024 10:01:54 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjFUu-0000000Eq3z-18jG
	for linux-mtd@lists.infradead.org;
	Wed, 28 Aug 2024 10:01:53 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2d3d7a1e45fso4607214a91.3
        for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2024 03:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724839311; x=1725444111; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTY/Og4VQMLH0YC5+kxfePDsZ5hXWXQ3Xo9cBmBQwt8=;
        b=NYSPVkhy/uLceYJ743ScU0WwjRTdYGvqk5QBgIOszgokqpFVqLNAKrhPNXzMFRaMGt
         fHGe90ww7MmO1RNjR3+rOG2kbGd9aWIQVB4uDTpwVM5WbLnFgtC8WoY4Ezvw47e4dlD3
         6Yca0Oo4DiyR4QVFayUYtOw3c1yWFvJxQlDhzibyq/DipwmT//q3kkK/Ofvx8oUp347v
         kYk2h47N/MBrlKRfB/ec6FfPyu2OJc/rj/vC8XiE5ifiIareY9EUqsf0jsBjO+BsfPEi
         UN5FDZdbzz5duNVcmSMewWROWqUrrUGInNfUr60fsHUwG7MDdJqmFahlEGFw6JNqGXA1
         0msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724839311; x=1725444111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTY/Og4VQMLH0YC5+kxfePDsZ5hXWXQ3Xo9cBmBQwt8=;
        b=mE945P+PlNUegb3VCry31ab3ocjz6RogkZ7id7puAEfcrpJhe/BJ4WtjstYTKw41Um
         b4nH6nKhOIuW+pmR1qhEt/OQd3NvUV4cN+aWnCyWnNFyLdZpK1FOmtAr3SKnCr/tQakd
         HiDkXLUVwg9PD7bUabCbyYQ7GIkdM23IemGulMY81d3IsqP/EwwdyJ6NvXaoeo3b+kAq
         8iv3XdHiiRkfbrNGh4Zd7946qJf1nIryHKqew4efghNFmg/asDjHHLlS3VrMt8kLg9Ny
         JcrHMyUynI/GHDvfKC+Rh9uvauUfcttYFh9gQJaU8uT6biOY8ehgDtrqTASWWC1KmPqA
         d+2g==
X-Forwarded-Encrypted: i=1; AJvYcCUvaT61i9WbbkZo359inehAlqDg1QRtchNja16/EqlV6pHUnkNpETFVbrazvh8H7yfyo0yfnd8TkQE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjP1Thj4QOsa70qTibQk+X5DVhdqYlW0GvAZ53vCyBSwLidk21
	yqYUj2NzNgA7v/5prDsCiEkAV1dHvOk9iF2oZBI3U0Q+j61ZQUwl3Tj/Ps387spk/vlrKfY9bFC
	uVNr/oLh+nZiSnvOjV7mI9Mcqkmc=
X-Google-Smtp-Source: AGHT+IEo3imk3467gY5+oMGywhmrGKPDfE4sOhkF04SPsjQLb6STHoAUwEBLz1qdy7R2d7fA4YxzWANSz7urAVS65Ig=
X-Received: by 2002:a17:90b:1e06:b0:2d3:d95a:36dd with SMTP id
 98e67ed59e1d1-2d646b8fb12mr16331092a91.8.1724839311013; Wed, 28 Aug 2024
 03:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240828062131.1491580-1-linchengming884@gmail.com>
 <20240828062131.1491580-2-linchengming884@gmail.com> <20240828094728.583dc7c5@xps-13>
 <CAAyq3SbLATwXbDN6icx44cm8-PX+DrUvq2xiYor7bLn4wmfVrw@mail.gmail.com> <20240828115224.28ab48dc@xps-13>
In-Reply-To: <20240828115224.28ab48dc@xps-13>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Wed, 28 Aug 2024 17:59:47 +0800
Message-ID: <CAAyq3SZdyjzOQLZuttfFuygOFr++nq_oAss=g-dBCRLKROA3wA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] mtd: spinand: Add flags for the Plane Select bit
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_030152_330243_A54A4976 
X-CRM114-Status: GOOD (  21.34  )
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
IDIwMjTlubQ45pyIMjjml6Ug6YCx5LiJIOS4i+WNiDU6NTLlr6vpgZPvvJoKPgo+IEhpIENoZW5n
LAo+Cj4gPiA+ID4gQEAgLTI2Myw3ICsyNjYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaW5h
bmRfaW5mbyBtYWNyb25peF9zcGluYW5kX3RhYmxlW10gPSB7Cj4gPiA+ID4gICAgICAgICAgICAg
ICAgICAgIFNQSU5BTkRfSU5GT19PUF9WQVJJQU5UUygmcmVhZF9jYWNoZV92YXJpYW50cywKPiA+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ3cml0ZV9j
YWNoZV92YXJpYW50cywKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICZ1cGRhdGVfY2FjaGVfdmFyaWFudHMpLAo+ID4gPiA+IC0gICAgICAgICAgICAg
ICAgICBTUElOQU5EX0hBU19RRV9CSVQsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgIFNQSU5B
TkRfSEFTX1FFX0JJVCB8IFNQSU5BTkRfSEFTX1BQX1BMQU5FX1NFTEVDVF9CSVQsCj4gPiA+ID4g
ICAgICAgICAgICAgICAgICAgIFNQSU5BTkRfRUNDSU5GTygmbXgzNWxmeGdlNGFiX29vYmxheW91
dCwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG14MzVsZjFnZTRh
Yl9lY2NfZ2V0X3N0YXR1cykpLAo+ID4gPiA+ICAgICAgIFNQSU5BTkRfSU5GTygiTVgzNVVGMkcy
NEFELVo0STgiLAo+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9zcGluYW5k
LmggYi9pbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmgKPiA+ID4gPiBpbmRleCA1YzE5ZWFkNjA0
OTkuLmNlYzQ1MWU3YzcxYyAxMDA2NDQKPiA+ID4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9z
cGluYW5kLmgKPiA+ID4gPiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmgKPiA+ID4g
PiBAQCAtMzEyLDYgKzMxMiw4IEBAIHN0cnVjdCBzcGluYW5kX2VjY19pbmZvIHsKPiA+ID4gPgo+
ID4gPiA+ICAjZGVmaW5lIFNQSU5BTkRfSEFTX1FFX0JJVCAgICAgICAgICAgQklUKDApCj4gPiA+
ID4gICNkZWZpbmUgU1BJTkFORF9IQVNfQ1JfRkVBVF9CSVQgICAgICAgICAgICAgIEJJVCgxKQo+
ID4gPiA+ICsjZGVmaW5lIFNQSU5BTkRfSEFTX1BQX1BMQU5FX1NFTEVDVF9CSVQgICAgICAgICAg
ICAgIEJJVCgyKQo+ID4gPiA+ICsjZGVmaW5lIFNQSU5BTkRfSEFTX1JFQURfUExBTkVfU0VMRUNU
X0JJVCAgICAgICAgICAgIEJJVCgzKQo+ID4gPgo+ID4gPiBEbyB5b3UgdGhpbmsgd2UgY2FuIGhh
dmUgdGhlIFBQIHBsYW5lIHNlbGVjdCBiaXQgd2l0aG91dCB0aGUgcmVhZCBwbGFuZQo+ID4gPiBz
ZWxlY3QgYml0PyBJJ2QgdXNlIGEgc2luZ2xlIGZsYWcgZm9yIG5vdy4KPiA+Cj4gPiBNYWNyb25p
eCBzZXJpYWwgTkFORCBmbGFzaCB3aXRoIGEgdHdvLXBsYW5lIHN0cnVjdHVyZSBhbHdheXMgcmVx
dWlyZXMKPiA+IHRoZSBpbnNlcnRpb24gb2YgdGhlIFBsYW5lIFNlbGVjdCBiaXQgaW4gdGhlIHdy
aXRlX3RvX2NhY2hlIGZ1bmN0aW9uLiBIb3dldmVyLAo+ID4gb25seSB0aGUgTVgzNXtVLEZ9Mkcx
NEFDIGFuZCBNWDM1TEYyR0U0QUIgcmVxdWlyZSB0aGUgaW5zZXJ0aW9uIG9mIHRoZQo+ID4gUGxh
bmUgU2VsZWN0IGJpdCBpbiB0aGUgcmVhZF9mcm9tX2NhY2hlIGZ1bmN0aW9uLgo+ID4KPiA+IEhv
d2V2ZXIsIEkgaGF2ZSBvYnNlcnZlZCB0aGF0IGZvciBmbGFzaCByZXF1aXJpbmcgdGhlIGluc2Vy
dGlvbiBvZiB0aGUKPiA+IFBsYW5lIFNlbGVjdAo+ID4gYml0IGR1cmluZyB0aGUgcmVhZF9mcm9t
X2NhY2hlIG9wZXJhdGlvbiwgdGhlIEVDQyBzdHJlbmd0aCBpcyA0Lgo+ID4KPiA+IENhbiB3ZSB1
c2UgdGhlIEVDQyBzdHJlbmd0aCBpbiBjb25qdW5jdGlvbiB3aXRoIHRoZQo+ID4gU1BJTkFORF9I
QVNfUFBfUExBTkVfU0VMRUNUX0JJVCBmbGFnIHRvIGRldGVybWluZQo+ID4gd2hldGhlciB0aGUg
UGxhbmUgU2VsZWN0IGJpdCBuZWVkcyB0byBiZSBpbnNlcnRlZCBkdXJpbmcgdGhlCj4gPiByZWFk
X2Zyb21fY2FjaGUgb3BlcmF0aW9uPwo+ID4KPiA+IFRoaXMgbWV0aG9kIGNhbm5vdCBndWFyYW50
ZWUgdGhhdCBhIG5ldyBmbGFzaCB3aXRoYSB0d28tcGxhbmUKPiA+IHN0cnVjdHVyZSByZXF1aXJp
bmcgdGhlIGluc2VydGlvbiBvZiB0aGUgUGxhbmUgU2VsZWN0IGJpdCB3aWxsIGhhdmUKPiA+IGFu
IEVDQyBzdHJlbmd0aCBvZiA0Lgo+ID4KPiA+IEJhc2VkIG9uIHRoZSBhYm92ZSBwb2ludHMsIEkg
dGhpbmsgd2UgbmVlZCB0byB1c2UgdHdvIHNlcGFyYXRlIGZsYWdzCj4gPiB0byBoYW5kbGUgdGhl
c2UgcmVxdWlyZW1lbnRzIGVmZmVjdGl2ZWx5Lgo+Cj4gSW5kZWVkLCBwbGVhc2UgdXNlIHR3byBm
bGFncy4KCk5vIHByb2JsZW0sIHRoYW5rcyEKCj4KPiBUaGFua3MsCj4gTWlxdcOobAoKVGhhbmtz
LApDaGVuZyBNaW5nIExpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
