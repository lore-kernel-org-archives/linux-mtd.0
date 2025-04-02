Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2794C28B20
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 12:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kjSXhUzweec6PfSfzNXNAxX1WQ9d7DmvQQFj1Z17II=; b=2UR2wiG+B0xll1
	Y94Ce8aB4T9ek9yWBfcZHALY7LVcNykXXs+F6NbpM862VdYrTHZ9olJj7JE0i8D/PofFKLJEAFEZd
	VgdqJIu5eJV0ZReau9gj2ljcPocXMAIJgogRQnR7FOti4kWANcbYsc4iUyTjlC1k4QHiLy/x262y5
	k6zkp8O3EH9HsRi4drxYtHAScPoA5WGUem8x+FS5IY5ADSFTiexEiZ28nMWItLeEtNkBhMv+qydyL
	b1oYixC596UxNX/hj5eC1bWD4+4LkQzzJSqfm4c2JUbngdVHAy8V5tX1YXIW2kgEI9ThNP+UblrUG
	fqeruC9qNsGuS2runyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzx3w-0000000634y-3H7A;
	Wed, 02 Apr 2025 12:19:20 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzx2S-000000062oq-0S90
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 12:17:49 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso11569768a91.1
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 05:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743596267; x=1744201067; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+Aiff+VJ5TY6uCX0FsWx+P2OR8WRq2iXQA2EiISelM=;
        b=I8AOW9kk6kHZhLQVfSPj+1WLPb9LDJzs/eWStVKYruTa22+/L1OlTDgeQanaXE1Vnk
         cCkOuGrI7un1PnXO7cdQdzUZ5mPs/zUqIX8nEeOS32mw8i6UiZ2J+ZEMfAV5qr95h3xz
         EL50GCx3wCCIlf8yVetcAsTLjkm0iKZ3iPNk9+aYUOQY97liumuo+kwJFzr2p9sP394E
         winxjcj+m0fwdDE3n5cdaKfH8+KMleYYp42xszOwucGfD0rEgki8uhxyofrHY3rjcsnI
         EkJ0K/nWHiSqt7TtVWHaHHIAkq0PndYWLDuo5pje6Qce9FMny0gnXsF/Us76MG7P0gcw
         vUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596267; x=1744201067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+Aiff+VJ5TY6uCX0FsWx+P2OR8WRq2iXQA2EiISelM=;
        b=YbEjDoXhfNbS173FhwDgz00+SCM2KnV/4IwrxunFVGKahWBrmLsm2ShSwThuxM7wht
         ZlDWvLdxePBu3ReS3qE5jm/PyHeE+h/sFSYfRzyYeeCMFfCDC0EKKDHdjcukbO9rHADw
         DoKt5qy+B5dmyujy6YfSfDb0aF/pSHA0iz1v0PObqgRjyXbQ+hE21SBZ1p2+gJ7FepgW
         6Yz+ZDl/Cx/OyCm5y5wNnDw7jclz6p1gDfLaXFZsEf0KoGAJLklyWAVsOl5i0KuLWx13
         BA3F/T/ikI7ow69HCqc9fV4/IoQY7jjOYzm3QmIxL+hpbB82f+2Ys2n14pGmtaQOehqN
         bd/A==
X-Forwarded-Encrypted: i=1; AJvYcCVX32cgiLkZGObJpHTPd6lYCsvZDKYLCtKLaWKoJ03nHW3e1CGK/+haQLjhgVb1XbcqNbTGV2SwMB4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYHxvb8ptV+Iw8jRte+qwChNtXmoJNiE59ZGdqXn/oW7nx+wkX
	rLfoXd6gObSt6HM4QiqOjD5rLT0Wm8dwLlAUmiiwRN5xIyurahDkJYYyO2AkN+7swpSjY7OJLda
	/ew7Jaqdga5V/7s0/JDexWvriNsI=
X-Gm-Gg: ASbGncskCz/VuEvd/+pETMCWbgG2sx0sgBwmYcOqp7ngRxjmgjhlgO4/RHmqSow40P/
	LGQabeVaC9MsKFRCIkNHE9+CtMqIewjr9TfgiFinyniW1ALzCRWRLRqrKw2/hjNQ+92gJmGK3TR
	ZMhQryQTZk67J9M/3RZqOb0r/sAw==
X-Google-Smtp-Source: AGHT+IG/LSbxzvoT/xeeqSmcctchEHRvDPSpksIPAmeT+7qawSM51TsN38gRTABv6UdwIco+b2JR0lGysRQUSGt6XfU=
X-Received: by 2002:a17:90b:1f91:b0:2ff:693a:7590 with SMTP id
 98e67ed59e1d1-305321705f1mr28534600a91.33.1743596267133; Wed, 02 Apr 2025
 05:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250402085129.1027670-1-linchengming884@gmail.com>
 <20250402085129.1027670-4-linchengming884@gmail.com> <7aca2dd2-611d-4af2-b4a8-265528de2534@linaro.org>
In-Reply-To: <7aca2dd2-611d-4af2-b4a8-265528de2534@linaro.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Wed, 2 Apr 2025 20:17:34 +0800
X-Gm-Features: AQ5f1JopUT7LorM0AaVO02_XOUBs7eOBdk1-K1hYSvDKdfihdC8IWeJ3LAk33zE
Message-ID: <CAAyq3Sb6XLC3WfDDZF1WpiBN1LtkP5A0rGBbVQFmC3=zSp3pWg@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: spi-nor: macronix: Move macronix_nor_default_init
 logic to macronix_nor_late_init
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_051748_145593_2481D0A4 
X-CRM114-Status: GOOD (  22.94  )
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

SGkgVHVkb3IsCgpUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IOaWvCAy
MDI15bm0NOaciDLml6Ug6YCx5LiJIOS4i+WNiDg6MTDlr6vpgZPvvJoKPgo+Cj4KPiBPbiA0LzIv
MjUgOTo1MSBBTSwgQ2hlbmcgTWluZyBMaW4gd3JvdGU6Cj4gPiBGcm9tOiBDaGVuZyBNaW5nIExp
biA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+ID4KPiA+IFJlbW92ZSBtYWNyb25peF9ub3Jf
ZGVmYXVsdF9pbml0IGFuZCBtb3ZlIGl0cyBmdW5jdGlvbmFsaXR5IHRvCj4gPiBtYWNyb25peF9u
b3JfbGF0ZV9pbml0IHRvIGVuc3VyZSBwcm9wZXIgcXVhZF9lbmFibGUgaW5pdGlhbGl6YXRpb24u
Cj4gPgo+ID4gRm9yIE1YMjVMMzI1NUUsIFNGRFAgZm9sbG93cyBKRVNEMjE2LCB3aGljaCBkb2Vz
IG5vdCBpbmNsdWRlIHRoZSBRdWFkCj4gPiBFbmFibGUgYml0IFJlcXVpcmVtZW50cyBmaWVsZCBp
biBpdHMgdmVyc2lvbi4gV2hlbiB0aGUgc2l6ZSBmaWVsZCBpcwo+ID4gcmVtb3ZlZCwgbWFudWZh
Y3R1cmVyLT5maXh1cHMtPmRlZmF1bHRfaW5pdCBob29rIGlzIG5vdCBleGVjdXRlZCwgY2F1c2lu
Zwo+ID4gcGFyYW1zLT5xdWFkX2VuYWJsZSBub3QgYmVpbmcgb3ZlcndyaXR0ZW4gd2l0aCB0aGUg
aW50ZW5kZWQgZnVuY3Rpb24uCj4gPiBDb25zZXF1ZW50bHksIGl0IHJlbWFpbnMgYXMgdGhlIGRl
ZmF1bHQgc3BpX25vcl9zcjJfYml0MV9xdWFkX2VuYWJsZS4KPiA+Cj4gPiBCeSBtb3ZpbmcgcXVh
ZF9lbmFibGUgc2V0dXAgZnJvbSBkZWZhdWx0X2luaXQgdG8gbGF0ZV9pbml0LCBxdWFkX2VuYWJs
ZQo+ID4gaXMgY29ycmVjdGx5IGFzc2lnbmVkIGFmdGVyIHNwaV9ub3JfaW5pdF9wYXJhbXMsIHJl
Z2FyZGxlc3Mgb2YgdGhlIHNpemUKPiA+IGZpZWxkIHJlbW92YWwuCj4gPgo+ID4gQWRkaXRpb25h
bGx5LCBhY2NvcmRpbmcgdG8gc3BpLW5vci9jb3JlLmgsIHF1YWRfZW5hYmxlIGlzIG1vcmUKPiA+
IGFwcHJvcHJpYXRlbHkgcGxhY2VkIGluIGxhdGVfaW5pdCwgYXMgb2xkZXIgU0ZEUCB2ZXJzaW9u
cyBkaWQgbm90IGRlZmluZQo+ID4gdGhlIFF1YWQgRW5hYmxlIGJpdCBSZXF1aXJlbWVudHMuIFRo
aXMgY2hhbmdlIHJlbW92ZXMgZGVmYXVsdF9pbml0IGFuZAo+ID4gbW92ZXMgcXVhZF9lbmFibGUg
aGFuZGxpbmcgdG8gbGF0ZV9pbml0IGFjY29yZGluZ2x5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMgfCA3ICstLS0tLS0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFj
cm9uaXguYwo+ID4gaW5kZXggMDdlMGJkMGI3MGEwLi4yMTZjMDJiOTJiZmUgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3IvbWFjcm9uaXguYwo+ID4gQEAgLTI4MiwyMiArMjgyLDE3IEBAIHN0YXRpYyBpbnQg
bWFjcm9uaXhfbm9yX3NldF9vY3RhbF9kdHIoc3RydWN0IHNwaV9ub3IgKm5vciwgYm9vbCBlbmFi
bGUpCj4gPiAgICAgICByZXR1cm4gZW5hYmxlID8gbWFjcm9uaXhfbm9yX29jdGFsX2R0cl9lbihu
b3IpIDogbWFjcm9uaXhfbm9yX29jdGFsX2R0cl9kaXMobm9yKTsKPiA+ICB9Cj4gPgo+ID4gLXN0
YXRpYyB2b2lkIG1hY3Jvbml4X25vcl9kZWZhdWx0X2luaXQoc3RydWN0IHNwaV9ub3IgKm5vcikK
PiA+IC17Cj4gPiAtICAgICBub3ItPnBhcmFtcy0+cXVhZF9lbmFibGUgPSBzcGlfbm9yX3NyMV9i
aXQ2X3F1YWRfZW5hYmxlOwo+ID4gLX0KPiA+IC0KPiA+ICBzdGF0aWMgaW50IG1hY3Jvbml4X25v
cl9sYXRlX2luaXQoc3RydWN0IHNwaV9ub3IgKm5vcikKPiA+ICB7Cj4gPiAgICAgICBpZiAoIW5v
ci0+cGFyYW1zLT5zZXRfNGJ5dGVfYWRkcl9tb2RlKQo+ID4gICAgICAgICAgICAgICBub3ItPnBh
cmFtcy0+c2V0XzRieXRlX2FkZHJfbW9kZSA9IHNwaV9ub3Jfc2V0XzRieXRlX2FkZHJfbW9kZV9l
bjRiX2V4NGI7Cj4gPiArICAgICBub3ItPnBhcmFtcy0+cXVhZF9lbmFibGUgPSBzcGlfbm9yX3Ny
MV9iaXQ2X3F1YWRfZW5hYmxlOwo+Cj4gTm90IGF0IG1hbnVmYWN0dXJlciBsZXZlbCwgcGxlYXNl
LiBZb3UgY2hhbmdlIHRoZSBiZWhhdmlvciBhbmQgb3ZlcndyaXRlCj4gd2hhdGV2ZXIgaXMgcmV0
cmlldmVkIGZyb20gU0ZEUCBmb3IgYWxsIHRoZSBmbGFzaGVzLiBJbnN0ZWFkIHlvdSBzaG91bGQK
PiBpbnRyb2R1Y2UgbGF0ZSBpbml0IGp1c3QgZm9yIE1YMjVMMzI1NUUsIGJlY2F1c2Ugc2V0XzRi
eXRlX2FkZHJfbW9kZSBpcwo+IG5vdCBjb3ZlcmVkIGluIHJldiBBIG9mIEpFU0QyMTYgSSBhc3N1
bWUuIFRoZW4gaWYgb3RoZXIgZmxhc2hlcyBnZXQgdGhpcwo+IHBhcmFtIHdyb25nIGZyb20gQkZQ
VCwgYW1lbmQgdGhlbSB3aXRoIHBvc3RfYmZwdCBob29rcy4KClllcywgdGhpcyBwYXJ0IGluZGVl
ZCBvbmx5IHJlcXVpcmVzIGFkZGluZyB0aGUgbGF0ZV9pbml0IGZpeHVwCmZvciBvbGRlciB2ZXJz
aW9ucyBvZiBKRVNEMjE2IGZsYXNoLCByYXRoZXIgdGhhbiBhIG1hbnVmYWN0dXJlci1sZXZlbAps
YXRlX2luaXQuIEkgd2lsbCBtYWtlIHRoZSBuZWNlc3NhcnkgbW9kaWZpY2F0aW9ucyBhbmQgc2Vu
ZCBvdXQgdjIuClRoYW5rIHlvdSBmb3IgeW91ciBjb3JyZWN0aW9uIQoKPgo+Cj4gPiAgICAgICBu
b3ItPnBhcmFtcy0+c2V0X29jdGFsX2R0ciA9IG1hY3Jvbml4X25vcl9zZXRfb2N0YWxfZHRyOwo+
ID4KPiA+ICAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+Cj4gPiAgc3RhdGljIGNvbnN0IHN0cnVj
dCBzcGlfbm9yX2ZpeHVwcyBtYWNyb25peF9ub3JfZml4dXBzID0gewo+ID4gLSAgICAgLmRlZmF1
bHRfaW5pdCA9IG1hY3Jvbml4X25vcl9kZWZhdWx0X2luaXQsCj4gPiAgICAgICAubGF0ZV9pbml0
ID0gbWFjcm9uaXhfbm9yX2xhdGVfaW5pdCwKPiA+ICB9Owo+ID4KPgoKVGhhbmtzLApDaGVuZyBN
aW5nIExpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
