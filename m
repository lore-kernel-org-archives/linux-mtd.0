Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80ACACD13CF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2024 08:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WuNvFORsh+0J8F4g5WYsyv+nVTBegyfBe7AHSqvSiq0=; b=Jwp/DvSxldmtSo
	48IiF9nqA2uiY+I6hJIrrRpOJeigu5H/CCdUi8w11G+DqSIxq/6NH8qdpIj9NzwMuVCG1cjJ5g7o3
	6CS31RXfvmdpDtRRvtUMaD4oS3hwd64oR/pwDw80NZ0pqYLlYXkpZFfGyFLf1JZQfva8QFIRgIbJ1
	rXFHoklNL4ai4lzMJT7qHVhS/Z6D7qMiYAsubJXaJkShDQ0BSNiJhx6dsBfykxorh2/LhySuQaJFF
	AoA5afWIxGfcHqJQFkt/JyZhmO88oH+xzVWtnD3kKRZtrXOEgbr3vElyo7PJKH5kPW0Cw9eOdvasx
	Bmj8z/6BJs/VKjwb7xgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl2gX-0000000DZPr-36AG;
	Mon, 02 Sep 2024 08:45:17 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl2gN-0000000DZNP-0Gqz
	for linux-mtd@lists.infradead.org;
	Mon, 02 Sep 2024 08:45:08 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7cdf2ac6130so1115441a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 02 Sep 2024 01:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725266706; x=1725871506; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdqvCtx4hCTgy7BAxwzQbRHtzAPunqaxxME8+E7kXXY=;
        b=ioI/j88afk4ywHrjMHBpyybHTCFbZtl/KdcOSE80om63frOt+9v6OGcd6TyotYTVcB
         r6mbSC/xwGsfTn2QqDb0JrY7PqoJnekyO+RDVXTjEcDE7+IeZy5xeJYHChiAY0+GfGRA
         QL9q7glhFVc/8NiwguhHVT4BSMRD5sCRjhQN+n9aUW88zRzSnytFkoYJktXUlLX4gkxr
         9h5enj0Bm7/iPAc7pP3yTjbTWr6E9radXokSRABzgBLoAyfrhMRGmFW23GKS8zTkh9FI
         6HhNQEMde6EvDFCOMZn9hWwioAewwDgJHUhxhUiVTJjRmQW+2b2TESf9ppTCswWRj4Fn
         jkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725266706; x=1725871506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdqvCtx4hCTgy7BAxwzQbRHtzAPunqaxxME8+E7kXXY=;
        b=xKN1tce2CFTMMC828jqVIQSVd0+gOdcICheramcuKDUu7uXqLHaWu5DT3EfC76SiL2
         uqofULRD4WYYn0CHpOmkiwFXKrjPmV+XvepybnSh6puEcT0wZMNh7/g52+kfLXezYVar
         DtAWBs3/e8NYSRdtnbpa9MFbeQ/1wW49nNrmPsxveWbysbJOyOKiLgIwEiDPdcmd2BJ/
         RJCC+H+96hmWmgWrp9n1Ji6LR2CjlrJkCKKBAbj1uhuvwxJyy8jWnCVX5Ashj9gtRtEn
         Odye9rz9TUUcJwESU9JkXFzkUm1pPphC/n3vz1vVWnyyuRpXwkU0itEcc2tVnLeBPTB8
         lUXw==
X-Forwarded-Encrypted: i=1; AJvYcCV71A54ceKNe1k25KlrrJRZfxZ4PZaOmhzeyBRTFJ4+Cpsd1zba2nH+dK83BSAtEw2VymSzFUSDXUY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqKCfWVHLraOHmnjpeMQyJGbQ032+dtsxZd9KBl6R4WXpTdlNH
	rXGZ6nk///sJ0vaiJVioAGKQTfuKGq4DgN4HkkrhGniiAr7aClIyQetSOg7DC6fuigaYY/u5Eyg
	VXLe1VDOW9Xy0ikxN4EzqgqFs4p0=
X-Google-Smtp-Source: AGHT+IHAI7kM0DcQ1Kk+xb1ziGWteM2SawbzG1IhlHiizIJbRX7VFUfJXcHjFVQg8b+4YnDofi7gqQcXaYryXdNCJIA=
X-Received: by 2002:a05:6a20:e687:b0:1c4:ae14:4e3d with SMTP id
 adf61e73a8af0-1cece4fcfe8mr6562127637.13.1725266705966; Mon, 02 Sep 2024
 01:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240830100310.1553675-1-linchengming884@gmail.com>
 <20240830100310.1553675-2-linchengming884@gmail.com> <20240830175504.746fb2ec@xps-13>
In-Reply-To: <20240830175504.746fb2ec@xps-13>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 2 Sep 2024 16:42:55 +0800
Message-ID: <CAAyq3Sbta_p9WNOTEdCA7V=huPkeFFxUvxTqfzRJz0dsJMJBwg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] mtd: spinand: Add support for setting plane select bits
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_014507_134487_0B3371DF 
X-CRM114-Status: GOOD (  19.10  )
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

SGkgTWlxdWVsLAoKSSBhY2NpZGVudGFsbHkgc2VudCB0aGUgcHJldmlvdXMgZW1haWwgYmVmb3Jl
IGl0IHdhcyBmaW5pc2hlZC4KCk1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+IOaWvCAyMDI05bm0OOaciDMw5pelIOmAseS6lCDkuIvljYgxMTo1NeWvq+mBk++8mgo+Cj4g
SGkgQ2hlbmdNaW5nLAo+Cj4gbGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbSB3cm90ZSBvbiBGcmks
IDMwIEF1ZyAyMDI0IDE4OjAzOjA5ICswODAwOgo+Cj4gPiBGcm9tOiBDaGVuZyBNaW5nIExpbiA8
Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+ID4KPiA+IEFkZCB0d28gZmxhZ3MgZm9yIGluc2Vy
dGluZyB0aGUgUGxhbmUgU2VsZWN0IGJpdCBpbnRvIHRoZSBjb2x1bW4KPiA+IGFkZHJlc3MgZHVy
aW5nIHRoZSB3cml0ZV90b19jYWNoZSBhbmQgdGhlIHJlYWRfZnJvbV9jYWNoZSBvcGVyYXRpb24u
Cj4gPgo+ID4gQWRkIHRoZSBTUElOQU5EX0hBU19QUF9QTEFORV9TRUxFQ1RfQklUIGZsYWcgZm9y
IHNlcmlhbCBOQU5EIGZsYXNoCj4KPiBUaGlzIGZsYWcgaGFzIGJlZW4gcmVuYW1lZCA6KQoKVGhh
bmsgeW91IGZvciB0aGUgcmVtaW5kZXIuIEkgd2lsbCBtYWtlIHRoZSBuZWNlc3NhcnkgY2hhbmdl
cy4KCj4KPiA+IHRoYXQgcmVxdWlyZSBpbnNlcnRpbmcgdGhlIFBsYW5lIFNlbGVjdCBiaXQgaW50
byB0aGUgY29sdW1uIGFkZHJlc3MKPiA+IGR1cmluZyB0aGUgd3JpdGVfdG9fY2FjaGUgb3BlcmF0
aW9uLgo+ID4KPiA+IEFkZCB0aGUgU1BJTkFORF9IQVNfUkVBRF9QTEFORV9TRUxFQ1RfQklUIGZs
YWcgZm9yIHNlcmlhbCBOQU5EIGZsYXNoCj4gPiB0aGF0IHJlcXVpcmUgaW5zZXJ0aW5nIHRoZSBQ
bGFuZSBTZWxlY3QgYml0IGludG8gdGhlIGNvbHVtbiBhZGRyZXNzCj4gPiBkdXJpbmcgdGhlIHJl
YWRfZnJvbV9jYWNoZSBvcGVyYXRpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbmcgTWlu
ZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRk
L25hbmQvc3BpL2NvcmUuYyB8IDYgKysrKysrCj4gPiAgaW5jbHVkZS9saW51eC9tdGQvc3BpbmFu
ZC5oIHwgMiArKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25h
bmQvc3BpL2NvcmUuYwo+ID4gaW5kZXggZTBiNjcxNWU1ZGZlLi5lN2I1OTJjZGJiNGMgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMv
bXRkL25hbmQvc3BpL2NvcmUuYwo+ID4gQEAgLTM4Niw2ICszODYsOSBAQCBzdGF0aWMgaW50IHNw
aW5hbmRfcmVhZF9mcm9tX2NhY2hlX29wKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwK
PiA+ICAgICAgIGVsc2UKPiA+ICAgICAgICAgICAgICAgcmRlc2MgPSBzcGluYW5kLT5kaXJtYXBz
W3JlcS0+cG9zLnBsYW5lXS5yZGVzY19lY2M7Cj4gPgo+ID4gKyAgICAgaWYgKHNwaW5hbmQtPmZs
YWdzICYgU1BJTkFORF9IQVNfUkVBRF9QTEFORV9TRUxFQ1RfQklUKQo+ID4gKyAgICAgICAgICAg
ICBjb2x1bW4gfD0gcmVxLT5wb3MucGxhbmUgPDwgZmxzKG5hbmRkZXZfcGFnZV9zaXplKG5hbmQp
KTsKPgo+IElzbid0IHRoZXJlIGFueSBiZXR0ZXIgd2F5IHRvIGtub3cgd2hhdCB0aGUgYml0IHBv
c2l0aW9uIGlzPwoKVGhlcmUgYXJlIHR3byBvdGhlciBtZXRob2RzIHRvIGRldGVybWluZSB0aGUg
Yml0IHBvc2l0aW9uOgotIGNvbHVtbiB8PSByZXMtPnBvcy5wbGFuZSA8PCBmbHMobmFuZC0+bWVt
b3JnLnBhZ2VzaXplKQotIGNvbHVtbiB8PSB3ZGVzYy0+aW5mby5vZmZzZXQKCj4KPiBUaGFua3Ms
Cj4gTWlxdcOobAoKVGhhbmtzLApDaGVuZyBNaW5nIExpbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
