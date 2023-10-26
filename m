Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2383C25B6B
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Oct 2023 06:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UltfcaAwrq3rEzbTvy0zh/5HzzNbfFxjjHR8NmXIApU=; b=XYEc8GLxa9IChl
	r6vG9pVmYxm1NCXsA52u1pII/kzTJ3430Dnlpp0L61KxprrvI2373UgU98oBIBW1s3pfFRJj99IV5
	fxbDUFJPQ64E5gyrN3W9WglaRV9/lIi9afcVBcjEFviUZ6elO42SRWmCV67FAUebrwtLV1vLvVxUr
	Ceu8Vwfp1gJdlrsd7Ne1KltSYJoZ4TwPseynxW+nJ6/kLtsET7KWbC3uzUXjLWnhyICGxGAmMpstK
	QR9MjTt5XN6cilJ+UaOzWDu49M/XDpz+Tu9fwsbMpnWxvYkWH7wGEMqGqH+K4boLky0BjkrBHhpwY
	UiUnniJcJV0ii3mqJH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvtl4-00Dlhm-3D;
	Thu, 26 Oct 2023 06:22:19 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvtl0-00Dlge-2s
	for linux-mtd@lists.infradead.org;
	Thu, 26 Oct 2023 06:22:17 +0000
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EA68E3FB55
	for <linux-mtd@lists.infradead.org>; Thu, 26 Oct 2023 06:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698301327;
	bh=z38Oz/Mtbr9Xt0C0ZNzKPQKhWmhzEaxeE+ZSwP8lwk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=uXUuFYdFCUjQ6XKuIe7hOiNQ56yIWRHrgdm5IFNzv/uoBskBxTknJ2PThfKUGzTZU
	 KTyf7bp9F7MsWlEOYcD1hPQ4AuKFNhDC2Oca9d0Jml10cumWSjYrKD7vdjZyKeEGPK
	 tYXHAjlm9aisdFg7YMaQrOXUQtv0+CWuyNgp8mGkVg1kTrZgEgtY9t0G0LNn0w/Eow
	 0J6/2CMJ9rpSnnyNG3QezGCWlBty/fv0PIXVM9xVkGWxHSmLOc2gv+hKpTPNrSHrGM
	 ItCpGp6u86ltG7hThod71cIms+KTWoe8yYIQeJGfmLLBWXbrWVAlqD79cnT3lJ2f/T
	 e9I+N4muUUUFQ==
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-5a8ead739c3so4961047b3.3
        for <linux-mtd@lists.infradead.org>; Wed, 25 Oct 2023 23:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698301327; x=1698906127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z38Oz/Mtbr9Xt0C0ZNzKPQKhWmhzEaxeE+ZSwP8lwk8=;
        b=PNbHDDJoBrrZg1XFk3Vgng/QSkHEmuj/Vc5I6STRSWB53HzNXUqsnW7A4bfws30sIG
         vHpDxs4lEHvPGmj8DNCKcqXbfjvJ0jOuGygjHbQAO6djQo9UwAF+UL1fsDriOshMZEfI
         D9RIwYrQcbet4HEegyrhYzDHHwNmj6+yQswgQBLk7gXbk4MA0RWexICnjzVmEB/ikfhU
         5VmwhcCsNPu9d7zP0NZIMuieGLDZKIo1EiTHiVXZS0JOknIKmdZWsxrs0QXaKygzJh7l
         9dVJcRoCUBI2RX3+mLcFSKbW+HA2+Prcve6AVXYC2aMUlxHX2YTUQmz0jxJzb9ZIEQzD
         oBKA==
X-Gm-Message-State: AOJu0Yx9XFoFnDrew/8Tstkp/PI+C51yiuO1vF27IgbBwBvLYfgxc4B8
	6m6ryfxgb00vnWr3VbrZ2UOmzq5udADrT3TjyW0FcNJAfFkr3FuuMTs99MFIFz+07s3zqf8u4uv
	vjL3BmC8xKFe0KGY89vr9ibitVYP+IjaEk9JsI/SRhIBeSDiMWUoeaAaj3Ic=
X-Received: by 2002:a25:2d14:0:b0:d9b:4f28:f6ce with SMTP id t20-20020a252d14000000b00d9b4f28f6cemr17333068ybt.1.1698301326892;
        Wed, 25 Oct 2023 23:22:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5PqzqKXKjiv9pPATB/SXMg3Ux/7AIueNRDtpnk0Z46tFQQAt6NVTeptyV5v8FU27yjN2kCrMWfAO4Xe9VFig=
X-Received: by 2002:a25:2d14:0:b0:d9b:4f28:f6ce with SMTP id
 t20-20020a252d14000000b00d9b4f28f6cemr17333053ybt.1.1698301326645; Wed, 25
 Oct 2023 23:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231026012017.518610-1-acelan.kao@canonical.com> <20231026061143.bjbgfkyhnnyh2ovb@dhruva>
In-Reply-To: <20231026061143.bjbgfkyhnnyh2ovb@dhruva>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Thu, 26 Oct 2023 14:21:54 +0800
Message-ID: <CAFv23Q=UXVd0qGBD3irDQejFhiK=qQaWf6B4KpiMkCzzGmP4hQ@mail.gmail.com>
Subject: Re: [PATCH v4] mtd: spi-nor: Improve reporting for software reset failures
To: Dhruva Gole <d-gole@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_232215_422546_B2A09B5F 
X-CRM114-Status: GOOD (  22.44  )
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

RGhydXZhIEdvbGUgPGQtZ29sZUB0aS5jb20+IOaWvCAyMDIz5bm0MTDmnIgyNuaXpSDpgLHlm5sg
5LiL5Y2IMjoxMeWvq+mBk++8mgo+Cj4gT24gT2N0IDI2LCAyMDIzIGF0IDA5OjIwOjE3ICswODAw
LCBBY2VMYW4gS2FvIHdyb3RlOgo+ID4gRnJvbTogIkNoaWEtTGluIEthbyAoQWNlTGFuKSIgPGFj
ZWxhbi5rYW9AY2Fub25pY2FsLmNvbT4KPiA+Cj4gPiBXaGVuIHRoZSBzb2Z0d2FyZSByZXNldCBj
b21tYW5kIGlzbid0IHN1cHBvcnRlZCwgd2Ugbm93IHJlcG9ydCBpdAo+ID4gYXMgYW4gaW5mb3Jt
YXRpb25hbCBtZXNzYWdlKGRldl9pbmZvKSBpbnN0ZWFkIG9mIGEgd2FybmluZyhkZXZfd2Fybiku
Cj4gPiBUaGlzIGFkanVzdG1lbnQgaGVscHMgYXZvaWQgdW5uZWNlc3NhcnkgYWxhcm0gYW5kIGNv
bmZ1c2lvbiByZWdhcmRpbmcKPiA+IHNvZnR3YXJlIHJlc2V0IGNhcGFiaWxpdGllcy4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBDaGlhLUxpbiBLYW8gKEFjZUxhbikgPGFjZWxhbi5rYW9AY2Fub25p
Y2FsLmNvbT4KPiA+IC0tLQo+ID4gdjIuIG9ubHkgbG93ZXIgdGhlIHByaW9yaXR5IGZvciB0aGUg
bm90IHN1cHBvcnRlZCBmYWlsdXJlCj4gPiB2My4gcmVwbGFjZSBFTk9UU1VQUCB3aXRoIEVPUE5P
VFNVUFAgYW5kIGNoZWNrIHRoZSBmaXJzdCBjb21tYW5kIG9ubHkKPiA+IHY0LiBtb3ZlIHRoZSB2
ZXJzaW9uIGluZm9ybWF0aW9uIGJlbG93IHRoZSAnLS0tJyBsaW5lCj4gPiAtLS0KPiA+ICBkcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuYyB8IDUgKysrKy0KPiA+ICBkcml2ZXJzL3NwaS9zcGktbWVt
LmMgICAgICB8IDIgKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3Jl
LmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+ID4gaW5kZXggMWIwYzY3NzBjMTRlLi40
MmU1MmFmNzYyODkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+
ID4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiA+IEBAIC0zMjUyLDcgKzMyNTIs
MTAgQEAgc3RhdGljIHZvaWQgc3BpX25vcl9zb2Z0X3Jlc2V0KHN0cnVjdCBzcGlfbm9yICpub3Ip
Cj4gPgo+ID4gICAgICAgcmV0ID0gc3BpX21lbV9leGVjX29wKG5vci0+c3BpbWVtLCAmb3ApOwo+
ID4gICAgICAgaWYgKHJldCkgewo+ID4gLSAgICAgICAgICAgICBkZXZfd2Fybihub3ItPmRldiwg
IlNvZnR3YXJlIHJlc2V0IGZhaWxlZDogJWRcbiIsIHJldCk7Cj4gPiArICAgICAgICAgICAgIGlm
IChyZXQgPT0gLUVPUE5PVFNVUFApCj4gPiArICAgICAgICAgICAgICAgICAgICAgZGV2X2luZm8o
bm9yLT5kZXYsICJTb2Z0d2FyZSByZXNldCBlbmFibGUgY29tbWFuZCBkb2Vzbid0IHN1cHBvcnQ6
ICVkXG4iLCByZXQpOwo+Cj4gRG9lcyAiU29mdHdhcmUgcmVzZXQgY29tbWFuZCBpc24ndCBzdXBw
b3J0ZWQ6IiBtYWtlIG1vcmUgc2Vuc2U/ClRoYXQncyBiZWNhdXNlIHRoZSBvcCBpcyAic29mdHdh
cmUgcmVzZXQgZW5hYmxlIiBjb21tYW5kCgojZGVmaW5lIFNQSU5PUl9PUF9TUlNURU4gICAgICAg
IDB4NjYgICAgLyogU29mdHdhcmUgUmVzZXQgRW5hYmxlICovCiNkZWZpbmUgU1BJTk9SX1NSU1RF
Tl9PUCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAg
ICAgICAgIFNQSV9NRU1fT1AoU1BJX01FTV9PUF9DTUQoU1BJTk9SX09QX1NSU1RFTiwgMCksICAg
ICAgICAgICAgICAgICBcCiAgICAgICAgICAgICAgICAgICAgIFNQSV9NRU1fT1BfTk9fRFVNTVks
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgICAgICBT
UElfTUVNX09QX05PX0FERFIsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAg
ICAgICAgICAgICAgICAgICAgU1BJX01FTV9PUF9OT19EQVRBKQpvcCA9IChzdHJ1Y3Qgc3BpX21l
bV9vcClTUElOT1JfU1JTVEVOX09QOwoKPgo+ID4gKyAgICAgICAgICAgICBlbHNlCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgZGV2X3dhcm4obm9yLT5kZXYsICJTb2Z0d2FyZSByZXNldCBmYWls
ZWQ6ICVkXG4iLCByZXQpOwo+ID4gICAgICAgICAgICAgICByZXR1cm47Cj4gPiAgICAgICB9Cj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1tZW0uYyBiL2RyaXZlcnMvc3BpL3Nw
aS1tZW0uYwo+ID4gaW5kZXggZWRkNzQzMGQ0YzA1Li45M2I3N2FjMGI3OTggMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPiA+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1tZW0u
Ywo+ID4gQEAgLTMyMyw3ICszMjMsNyBAQCBpbnQgc3BpX21lbV9leGVjX29wKHN0cnVjdCBzcGlf
bWVtICptZW0sIGNvbnN0IHN0cnVjdCBzcGlfbWVtX29wICpvcCkKPiA+ICAgICAgICAgICAgICAg
cmV0dXJuIHJldDsKPiA+Cj4gPiAgICAgICBpZiAoIXNwaV9tZW1faW50ZXJuYWxfc3VwcG9ydHNf
b3AobWVtLCBvcCkpCj4gPiAtICAgICAgICAgICAgIHJldHVybiAtRU5PVFNVUFA7Cj4gPiArICAg
ICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPgo+IFJldmlld2VkLWJ5OiBEaHJ1dmEgR29s
ZSA8ZC1nb2xlQHRpLmNvbT4KPgo+ID4KPiA+ICAgICAgIGlmIChjdGxyLT5tZW1fb3BzICYmIGN0
bHItPm1lbV9vcHMtPmV4ZWNfb3AgJiYgIXNwaV9nZXRfY3NncGlvZChtZW0tPnNwaSwgMCkpIHsK
PiA+ICAgICAgICAgICAgICAgcmV0ID0gc3BpX21lbV9hY2Nlc3Nfc3RhcnQobWVtKTsKPiA+IC0t
Cj4gPiAyLjM0LjEKPiA+Cj4gPgo+Cj4KPiAtLQo+IEJlc3QgcmVnYXJkcywKPiBEaHJ1dmEgR29s
ZSA8ZC1nb2xlQHRpLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
