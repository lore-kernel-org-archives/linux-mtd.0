Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04DCEDE99C
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 09:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4IGD9ooxvDYVkJuV3DEcoGgJMUrx/kC9QPI63v0ENA8=; b=zhfZHgPjpDxK3c
	eAWqW1xDLqS/6XMaLLtY+f9zouUze1yLtf7rfFqnR5FBOuRFWj062m/HtNW3JRlpsVIVBrb8KByyi
	dAnfIUYOvMsiSXGCA7hAnJIrrAW24qIG0n+uck4K37evkU24MqF3LjJmIFzqiMP5FvmgdDQstMb1b
	Zlvp+is8Gfqin6XNwU9R42vQ9vcmNgjsf11cDGc95UmY+e5u05o7B5KL1qTV0RqYjlg/+2Tl+954S
	KKIIazAmVT/mjtw9FlYcBZl8HZl7bjL+tmXQQsm8IuqznlEuv3U66pXTJ9swmWH1pUrf/2w7pauuG
	6FHHe7W1Xp1/gIcD6HYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgig2-007pmC-0V;
	Thu, 14 Sep 2023 09:30:22 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgifz-007pkw-0W
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 09:30:20 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-7a7e11a53c3so1203942241.1
        for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2023 02:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694683813; x=1695288613; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2ppFbBJ6eSrXngOvBl4Cb6zXMC/U2RNI6NUtLKD4qk=;
        b=wYdNXaK1fQ/nnlmHme67fDIhys3N6wEWqEge9U3CNhUcT9lZjaeV+QcbfNBLyrr3J/
         rfiOeI9HzBqZqAzBwd72JFGEw4rVxfju4IFsYxIdfS3s6cPAn4yCimbrnZp8sujuHKqK
         dkCFeeuNdKmT6plSHFjRtQYg+DYhZNp4EYpQQQSSLel+33T3ifg13oRhteIOHTAkcTbc
         /fli3ATPyiVivlAYRYY87S5acE9wr2IS7rs+S7GKbeF0k34frFH4kna6v2+iTkX+JLPq
         4jYdVfPyRvJf0WHoHOa9m0mHWO/EQiOW2WAauTNdUWUAAx76Kzfla6fsPUa7XhA58uOX
         33WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694683813; x=1695288613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2ppFbBJ6eSrXngOvBl4Cb6zXMC/U2RNI6NUtLKD4qk=;
        b=wOyMXDtOXT+XcB0BBbpY1fV4uzieMr3OfnVEZk2dtORFVi4vYarycSIjFgroif9mZe
         fMMSmMTRoieTC3SkMB8epWAM/Lha7p/r2DukMhbTacKC6VnDirw+yd7mssNF2c/m/KQN
         wmApSDxGTIz1ZrbUCN8908RGzWWEZsaealbIVLd0Fi+oXp1GdD8exsVUPJRBLycDJ/HP
         S3cmKojqLpPeV8KepI/AsTMpMewV5R0tE3HQ2LvV/d3rL2lgFo6WAXOeGwh8gEJ07Fak
         06YA/bmxWQFPheYbSRBrN19/1eXxhrDoWazImzn8TV25dvRccv4Ewlw2e/rn4JDUIxIS
         i95Q==
X-Gm-Message-State: AOJu0YzbDhrxxKZIWezu85JCqS3VFq9bfb/khVlGaF3hL6Mk/X/A5qKo
	fUdhkQmWZKa80K6w+ixCcDECLN284CsdKZiH9YWqTg==
X-Google-Smtp-Source: AGHT+IFdpKc86Ba4+Ce1Kw+37JilCE4JPGPOzMp6WOHfoT2BLvKGNI+DWUjLDVVh+a1NN/cT820cMVMpi35QbT24b9U=
X-Received: by 2002:a05:6102:3169:b0:450:6ef1:e415 with SMTP id
 l9-20020a056102316900b004506ef1e415mr582724vsm.13.1694683813313; Thu, 14 Sep
 2023 02:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230913115001.23183-1-brgl@bgdev.pl> <20230913115001.23183-3-brgl@bgdev.pl>
 <CAHp75Ve8aK4Pfid1JYWH86mKy-Zb-G2QDPrJYmRzPCYOsn1TqQ@mail.gmail.com>
 <CACRpkdYtYDJa6fo6RnizHNzUsyazBQxEaNMznaij8rBF4ie+ew@mail.gmail.com>
 <20230913222338.07d1625b@xps-13> <CAHp75Vd2a06rnGCEiJW0reN00amso0RyvgLT516nZiYLYZ-xcQ@mail.gmail.com>
 <4de724a1630eda74f4f304dc224dc981eb3b0875.camel@crapouillou.net>
In-Reply-To: <4de724a1630eda74f4f304dc224dc981eb3b0875.camel@crapouillou.net>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Sep 2023 11:30:02 +0200
Message-ID: <CAMRc=MfnPdr66OPSkkjjpZY2VY7wN4WO2uBPbpyExFH0F6e=1Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] mtd: rawnand: ingenic: use gpiod_set_active_high()
To: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Andy Shevchenko <andy@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Harvey Hunt <harveyhuntnexus@gmail.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Daniel Scally <djrscally@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_023019_205430_54EEF7B9 
X-CRM114-Status: GOOD (  20.17  )
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

T24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMTA6MzDigK9BTSBQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4gd3JvdGU6Cj4KPiBIaSwKPgo+IExlIGpldWRpIDE0IHNlcHRlbWJyZSAy
MDIzIMOgIDEwOjAyICswMzAwLCBBbmR5IFNoZXZjaGVua28gYSDDqWNyaXQgOgo+ID4gT24gV2Vk
LCBTZXAgMTMsIDIwMjMgYXQgMTE6MjPigK9QTSBNaXF1ZWwgUmF5bmFsCj4gPiA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPiA+IGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZyB3
cm90ZSBvbiBXZWQsIDEzIFNlcCAyMDIzIDIyOjEyOjQwICswMjAwOgo+ID4gPiA+IE9uIFdlZCwg
U2VwIDEzLCAyMDIzIGF0IDEwOjA14oCvUE0gQW5keSBTaGV2Y2hlbmtvCj4gPiA+ID4gPGFuZHku
c2hldmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gT24gV2VkLCBTZXAgMTMsIDIw
MjMgYXQgMjo1MOKAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kKPiA+ID4gPiA+IDxicmdsQGJnZGV2
LnBsPiB3cm90ZToKPiA+Cj4gPiAuLi4KPiA+Cj4gPiA+ID4gPiBXaHkgbm90IG1vdmluZyB0aGlz
IHF1aXJrIHRvIGdwaW9saWItb2YuYz8KPiA+ID4gPgo+ID4gPiA+IFRoYXQncyBhIGJldHRlciBp
ZGVhIGhlcmUgSSB0aGluaywgaXQncyBjbGVhcmx5IGEgcXVpcmsgZm9yIGEKPiA+ID4gPiBidWdn
eSBkZXZpY2UgdHJlZS4KPiA+ID4KPiA+ID4gQWdyZWVkLCBpdCdzIGp1c3QgZm9yIGJhY2t3YXJk
IGNvbXBhdGliaWxpdHkgcHVycG9zZXMgaW4gYSBzaW5nbGUKPiA+ID4gZHJpdmVyLiBJIGJlbGll
dmUgaXQgc2hvdWxkIHN0YXkgaGVyZS4KPiA+Cj4gPiBJIGJlbGlldmUgTGludXMgd2FzIGZvciBt
b3ZpbmcuCj4KPiBXaGljaCBMaW51cz8gQmVjYXVzZSB0aGUgb25lIHdobydzIGFsc28gdGhlIGdw
aW8gbWFpbnRhaW5lciBqdXN0IHdyb3RlCj4gYWJvdmUgdGhhdCBpdCB3YXMgYmV0dGVyIHRvIGtl
ZXAgaXQgaW4gdGhlIGRyaXZlci4KPgoKSSdtIGFsc28gdW5kZXIgdGhlIGltcHJlc3Npb24gdGhh
dCBMaW51cyBtZWFudCBtb3ZpbmcgaXQgdG8gZ3Bpb2xpYi1vZi5jLiBMZXQncwoKTGludXM6IENv
dWxkIHlvdSBjbGFyaWZ5PwoKQmFydAoKPiBDaGVlcnMsCj4gLVBhdWwKPgo+ID4KPiA+IGdwaW9s
aWItb2YuYyBjb250YWlucyBhIGxvdCBvZiBxdWlya3MsIGluY2x1ZGluZyB0aGlzIG9uZS4gQ2Fs
bGluZwo+ID4gdGhlc2UgbmV3IChvciBvbGQpIEFQSXMgZm9yIG92ZXJyaWRpbmcgcG9sYXJpdHkg
aW4gbWFueSBjYXNlcwo+ID4gc2hvdWxkbid0IGJlIG5lZWRlZCBpZiB3ZXJlIG5vIGlzc3VlcyB3
aXRoIERUIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCj4gPgo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
