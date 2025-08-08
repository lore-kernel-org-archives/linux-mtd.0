Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EA4C87FDA
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Aug 2025 12:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5S2oRlYy+SGrnRC39uTXJIf1mGlchitvixnrxt2Js0=; b=1PEnWMXCI8hQ5O
	6r/AkJkwNihCQyLtOgBnqERW+OvWsgmnn9wvk39M9IGnBhwTwN/x5FTXPjxLDN2cON67k1ce/yHp1
	BCjy94UwY/I4xImZN+AMVdWIuySeXVo7E+M1GA7qu2cgH6mCS0QOfdwchgrDAegk+1+LmR9dHbI2m
	ppsB05sWZHxd2iiqlTJm2xoEj0c0u6G/t5dUxWpFhhUbPhO7uiiAxTKMkOmDoxDnkEUSMG4VhC9DS
	NCO/Vsos6CWkHTmq1tUQ71eCr1AE4PIw+p5bH++yT6ikgQE/xTaogCLJbNCChVjr9OehOauRgOywN
	989CtoqOiGNiWXp26d3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukM6n-00000002n8q-3TIA;
	Fri, 08 Aug 2025 12:22:05 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLbj-00000002iw9-2Aci
	for linux-mtd@lists.infradead.org;
	Fri, 08 Aug 2025 11:50:00 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-240b3335c20so13152295ad.3
        for <linux-mtd@lists.infradead.org>; Fri, 08 Aug 2025 04:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754653799; x=1755258599; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4U8t1hCYMmSASvz9snQHZPW7Ew1JL75mQvLxEN50nE=;
        b=dY7FDavMRF8OILxWHXmY4FpFFQTS/l9guxz3ATqsCfulya+zcyIjxcbtru5ifVw1LX
         ubWNSn+IvSI0EDhmxPvGHxVGBnIAuRlCEPJFsjVw8r+f69y6UNQrbO7+oiqZsHnMrq0E
         xLZw1cC7DkLInIQAwQrP2d1bFEbTIrpa5Fz2E6c2t5TI1vTUHSsQfe/GuxSxJqD2mu5l
         qMvYeANyaMFxl23vQ2mGreFyj779SJuSroP+cgReLNihNbDDAzW/8ODJqODG8usDlA+X
         9a2cOihPHKl4vIuH3PFvqo2mNg6A0+ypYGtlqdlno7I9BBL840RZy0w/JKmcHNtg2tJu
         7nJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754653799; x=1755258599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4U8t1hCYMmSASvz9snQHZPW7Ew1JL75mQvLxEN50nE=;
        b=Ksv8cbdexrBx8Yy9MJ0QeTxYE97s5KfJsemRUrK4jFuEqBVOJkVv73nyc9QxEu3qG0
         ZNzInKnQUrvh1nwlze1tljiFWJ/9+mDP0CKh/ZzlMnc+DRPw5UXgVIETBJK5BBh1Sxeo
         ucTPjyc72Do4gmSC9V9nTm7wEi9KmGjVtK/q8CSP19ZiKXmlrcrlNBZgyESUbbrFFMW7
         jCkeFagbKp92vfn3JSaXy+8D/BZNTCYbvtC0bm3n+kLetuiQLIpPSWSS9+VQO/27G6do
         DBKKC4d19YG2VJwgHsRlC0l/gFJWYU1KIoGrASd9hNO33IPEsAkX+A1Sj0m8cCD/h2e+
         kAqg==
X-Forwarded-Encrypted: i=1; AJvYcCUjnh5JgxgtEUrf/aUeS0x5VuM07zQs1e8q2ycMrS1x156St/ypHzJmlf/QgdzqsG0V1VmclpSZu2w=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPqVKw8jYZZPR03LojAFMas0pZBLkPK3vgYiyu7IWtYNUvFdb2
	ZAu8zmcD5aZRShtH/UGQA3gJEkc452OphfGag2OYNaH9xFDyG9R1SAOmhN4k03cKOFx5jxBwF66
	pcTFURsOm/4YzPU9bXAGDGQLIVjBRCvc=
X-Gm-Gg: ASbGncvq2NqL9gkIyzgfo3p8X8ySKktfzaP7XjIk25aM/iDKubz7ADWATBWnuHgK6LT
	2GcFh7sxsh/e1RQxjAedmDJ6DEUh7ttW56Zo6cnrxIEj9YvIJqVmBNI7pXvGWnPrJEwQC+HNoJJ
	hXPOGqBbkR9xbv9wS52hOR9hu4wvar5Iq64Qn+hI6Qhco+vN0Oa35raLJZdm0Iviu/6ia5VjK9Q
	hgzXxr9xE4l8D78
X-Google-Smtp-Source: AGHT+IH0s9s6aEdmFhMvXZ4jC3JQQ+y7jerlRSgp7hlj83FuNqzsn0TqKg9ZFWYeqJAVpEDhAQfMyUTG7SsgXKTpfiI=
X-Received: by 2002:a17:903:b0e:b0:235:1b91:90a3 with SMTP id
 d9443c01a7336-242c1fdb197mr41704705ad.7.1754653798769; Fri, 08 Aug 2025
 04:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250808095503.906244-1-linchengming884@gmail.com>
 <20250808095503.906244-3-linchengming884@gmail.com> <87zfca9kur.fsf@bootlin.com>
In-Reply-To: <87zfca9kur.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Fri, 8 Aug 2025 19:49:49 +0800
X-Gm-Features: Ac12FXy4tzXGUM6oD18C6VZVKs6r2WLP8uQSAD1KjLa_SaRxd-7zezNNfL7wkKs
Message-ID: <CAAyq3SZC2R_9_CVJURAvhZe8_-iE6t8ErGBV16vKPbgVsOhbbg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nand: macronix: Add randomizer support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_044959_573228_241DA482 
X-CRM114-Status: GOOD (  14.52  )
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
IDIwMjXlubQ45pyIOOaXpSDpgLHkupQg5LiL5Y2INjoxOeWvq+mBk++8mgo+Cj4gT24gMDgvMDgv
MjAyNSBhdCAxNzo1NTowMyArMDgsIENoZW5nIE1pbmcgTGluIDxsaW5jaGVuZ21pbmc4ODRAZ21h
aWwuY29tPiB3cm90ZToKPgo+ID4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBt
eGljLmNvbS50dz4KPiA+Cj4gPiBFbmFibGUgcmFuZG9taXplciBmdW5jdGlvbiBieSBzcGVjaWZp
YyBmbG93Y2hhcnQgdG8gc2V0IHRoZSBkZWZhdWx0IHZhbHVlCj4gPiBvZiBSQU5ERU4gdG8gMS4K
PiA+Cj4gPiBSYW5kb21pemVyIGludHJvZHVjZXMgdHdvIG5ldyBEVCBwcm9wZXJ0aWVzIGZvciBj
aGlsZCBub2RlcyB0byBjb25maWd1cmUKPiA+IHRoZSByYW5kb21pemVyIGZ1bmN0aW9uYWxpdHkg
YW5kIGNvdmVyYWdlIG9wdGlvbnMuCj4gPiAgLSBteGljLGVuYWJsZS1yYW5kb21pemVyLW90cDog
U3BlY2lmeSB3aGV0aGVyIHRvIGFjdGl2YXRlIHRoZSByYW5kb21pemVyCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZmVhdHVyZS4KPiA+ICAtIG14aWMscmFuZG9wdDogRGVmaW5l
IHRoZSByYW5kb21pemVyIGFyZWEgcGVyIHBhZ2UuCj4KPiBDYW4gd2UgY3JlYXRlIGEgZ2xvYmFs
IE5BTkQgRFQgcHJvcGVydHkgZm9yIHRoYXQ/IEVuYWJsaW5nIGEgcmFuZG9taXplcgo+IGlzIHF1
aXRlIGEgZ2VuZXJpYyBzdGVwLgoKU3VyZSwgSSBhZ3JlZS4gSeKAmWxsIHVwZGF0ZSBpdCB0byB1
c2UgYSBnbG9iYWwgTkFORCBEVCBwcm9wZXJ0eS4KCj4KPiA+IFRoZSBwZW5hbHR5IG9mIHJhbmRv
bWl6ZXIgYXJlIHN1YnBhZ2UgYWNjZXNzZXMgcHJvaGliaXRlZCBhbmQgbW9yZSB0aW1lCj4gPiBw
ZXJpb2QgaXMgbmVlZGVkIGluIHByb2dyYW0gb3BlcmF0aW9uIGFuZCBlbnRlcmluZyBkZWVwIHBv
d2VyLWRvd24gbW9kZS4KPiA+IGkuZS4sIHRQUk9HIDMyMHVzIHRvIDM2MHVzIChyYW5kb21pemVy
IGVuYWJsZWQpLgo+Cj4gRG8geW91IHdhbnQgdG8gc2hhcmUgd2hhdCBpcyB0aGUgYWRkZWQgdmFs
dWUgaW4gdGVybXMgb2YgbGlmZXRpbWUgdG8KPiBlbmFibGUgdGhlIHJhbmRvbWl6ZXIsIGdpdmVu
IHRoZSBkcmF3YmFja3Mgd2hpY2ggYXJlIHNpZ25pZmljYW50PwoKVGhhbmtzIGZvciB0aGUgcXVl
c3Rpb24uIEnigJlsbCBkZXNjcmliZSB0aGUgYmVuZWZpdHMgb25jZSBJ4oCZdmUgZmluaXNoZWQK
b3JnYW5pemluZyBhbmQgcmV2aWV3aW5nIG91ciBkYXRhLgoKPgo+IFRoYW5rcywKPiBNaXF1w6hs
CgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
