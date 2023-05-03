Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF178C77B75
	for <linux-mtd@archiver.kernel.org>; Wed,  3 May 2023 19:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phhrvwzIC4eNR2IPvjbBItQxJHD17yXHC8ORovQr+2Q=; b=Mi/6Shcspw1Wno
	hqi87ma7143+xOoncE1oqfJFsRmwl4Hbym4PB4U+FYKPk9uOlgA0K3UD+zlQxRsyqWdutch7c5HaR
	L8Dy6gb7VCnSL+4vOj39loZEBvEULznGJBUJQIyAxekk+l3e69OkhBMMQhstCcLQFcG4fV0ZoLTzW
	rshNRmt0ioXE5IT2+7WMPJW5VJ1IBMyzZuV8+pE9gGj000UPmRO4OTZgwjQDI9OxMADAmIr08iq0k
	N4/ir7ZtneJ/SzsMDpN2mlH+dmkWwYHg0N/rr1ffknEpFxgzoaWHEq9zjgZGOjnURF0libX5xJH1h
	2HAazI3m9Te+i63biVwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puITC-005daJ-2Y;
	Wed, 03 May 2023 19:48:58 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puIT9-005dZH-2z;
	Wed, 03 May 2023 19:48:57 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2a8baeac4d1so58121421fa.1;
        Wed, 03 May 2023 12:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683143331; x=1685735331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgxHMAd2AIMSIN7wxwztZQuxCjRjDT1lsufiXrNyadA=;
        b=aogvjXXKvsH1JCvlSuu99w3M49a+Rox9nlF1yW7PWiOObH1fXAT5pOak8lxxjRSSs/
         uUUB2uES6rNkgkhJE0lSCAgPN/H7/tXyEsAywz+0KRgUTa1uomGgUKEP7H6HcCX9rhmr
         t3Erd3e6uNTmrhG1d/mAtgjoudH2HZMmUfGolqPePtU4Xljlni3kDasUhsNoxvT+owOA
         +y9OgsP9ajUid7qTrnqieZvGFHXE/MigJy9SH2sp8bCjsbLDXl0sALVYAUPC8u8/4iK2
         ztsSOWVNk7tEjd3X6W8mGLPZjN4p3AuCZXOS4wR6qGVWEMzLD+KhnEqKe9Az7gfEJNtY
         wJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683143331; x=1685735331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgxHMAd2AIMSIN7wxwztZQuxCjRjDT1lsufiXrNyadA=;
        b=iykDhazrnLmKkD7AzNFBJgFsdjbjzQxF/+ayGQVe5Kvpc1IXilS748WIygTvTVEUJs
         D3IFweFfag1x/wuwEYXey+X8saVYbAMsorwiKtDMtN7J0rtMGbWd2dqq0MHfjNIX5sAk
         aJiUxuqcFAIrOO7B1zXpAZjt2dUrSvJA5FJ7Y+FbL5PaJGZehvenIyds66xyoJEC7dRn
         AZkrphZNLiw8nZd0wZIjLcm8CtZFgqIfdI//bEBy2VnOZOXaGwtMC9nx4QuNBs03z3c4
         zXRs2gluUN86p+6z35yA85hduwqvJCr22oS8qEF0B+S6Y3/Iy3goqycsMtXS6SAkVCJE
         qOkg==
X-Gm-Message-State: AC+VfDwIvq7S0FisIJmyJdjL7YTgxxQUh5IKRSAcEN4gsNTph2VQYoiK
	nSYob3TAEit8YRZv0Juzazt8YYusuriSeeImZWU=
X-Google-Smtp-Source: ACHHUZ4NybURc8uLsP4LiiPVzi+nXZYpmTbylkvjCdEyJuSHfBGFZ4e/0y65cuVcRE8Kp/ENoMgol/Mx3aZAwrVJoGg=
X-Received: by 2002:a2e:680e:0:b0:2ac:775f:6fd3 with SMTP id
 c14-20020a2e680e000000b002ac775f6fd3mr287789lja.13.1683143330477; Wed, 03 May
 2023 12:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <60fa656e-bda1-1de6-a79e-3e3041cd69a8@sberdevices.ru> <780c0cae-18b6-2652-1c2c-6d398ea60451@amlogic.com>
 <e7c49f2d-b3c1-8d9b-76fe-c8759b37c7c7@sberdevices.ru> <20230418152505.72fc16da@xps-13>
 <15a6e415-1489-a81f-fc8f-2372678ad2cb@sberdevices.ru> <ee10bdeb-416c-70f0-d323-7107fe0746e8@amlogic.com>
 <5e4b395e-bf9d-0123-a0f2-2b378d950b29@sberdevices.ru> <fda1ae91-4bf8-6945-bd0d-b6dabc9cb4bd@sberdevices.ru>
 <a5010dcf-a8ce-f144-949c-687548cefce7@amlogic.com> <cf27b6b4-a75b-c5a6-32ea-ac20a2984192@sberdevices.ru>
 <20230502115913.78012d98@xps-13> <2274b432-d1a9-b3cf-4f7b-08c4a4c580b5@sberdevices.ru>
 <20230502132745.14349770@xps-13> <2b2f5cb4-84f7-65f6-13b2-42f965503023@sberdevices.ru>
 <20230502141703.29f0bc30@xps-13> <91cb8e19-e782-b847-8d2b-22580c371c34@sberdevices.ru>
 <20230502150553.65fdeb7f@xps-13> <8996d53c-54ff-6a37-e08b-95cae0629703@sberdevices.ru>
 <20230503100342.63215058@xps-13>
In-Reply-To: <20230503100342.63215058@xps-13>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 3 May 2023 21:48:38 +0200
Message-ID: <CAFLxGvwfi2RH3y2M6n0vqUHarp6DwR-wT7oBto3raA7oC3nJvg@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Arseniy Krasnov <avkrasnov@sberdevices.ru>, Liang Yang <liang.yang@amlogic.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>, 
	Yixun Lan <yixun.lan@amlogic.com>, oxffffaa@gmail.com, kernel@sberdevices.ru, 
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"yonghui.yu" <yonghui.yu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_124855_962963_7CB230B9 
X-CRM114-Status: GOOD (  16.13  )
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

U29ycnkgZm9yIGpvaW5pbmcgdGhlIHBhcnR5IGxhdGUuCgpPbiBXZWQsIE1heSAzLCAyMDIzIGF0
IDEwOjA34oCvQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3Jv
dGU6Cj4gPiBTbyBmb3IgbWUgbWFpbiBxdWVzdGlvbiBoZXJlIGlzOgo+ID4KPiA+IEhvdyBKRkZT
MiBzaG91bGQgd29yayB3aXRoIGNvbnRyb2xsZXJzIHdoZXJlIHdlIGNhbid0IHVwZGF0ZSBkYXRh
IGFuZCBPT0IKPiA+IGluZGVwZW5kZW50bHk/IERyaXZlciBvZiB0aGlzIGZpbGVzeXN0ZW0ga25v
d3Mgbm90aGluZyBhYm91dCB0aGlzIGZlYXR1cmVzIG9mCj4gPiB0aGUgY29udHJvbGxlci4KPiA+
Cj4gPiBPciBKRkZTMiB3b3JrcyBpbmNvcnJlY3RseSBpbiBteSBjYXNlIHdoZW4gaXQgdHJpZXMg
dG8gY2FsbCB3cml0ZSBwYWdlIGNhbGxiYWNrCj4gPiBhZnRlciBjYWxsaW5nIHdyaXRlIE9PQiBj
YWxsYmFjayAoSUlVQyBpdCBpcyBiZXR0ZXIgdG8gYXNrIFJpY2hhcmQgYXMgWW91IG1lbnRpb25l
ZCBhYm92ZSkuCj4gPgo+ID4gT3IgbWF5IGJlIGl0IGlzIGJldHRlciB0byBzdXBwcmVzcyBPT0Ig
d3JpdGUgY2FsbGJhY2sgKG9yIHNldCBpdCB0byBOVUxMKSBpbiB0aGlzCj4gPiBkcml2ZXIgYXMg
aW4gdmVuZG9yJ3MgZHJpdmVyPwo+Cj4gSSB3b3VsZCBhc3N1bWUgdXNpbmcgdGhlIHVucHJvdGVj
dGVkIGZyZWUgT09CIGJ5dGVzIHRvIHN0b3JlIHRoZQo+IGNsZWFubWFya2VycyBzaG91bGQgd29y
ay4gQnV0IHRoYXQncyBhIGJpdCBmcmFnaWxlIGFuZCB2ZXJ5IGZpbGVzeXN0ZW0KPiBvcmllbnRl
ZC4gSSBkb24ndCBsaWtlIHRoaXMgbXVjaC4gQnV0IG9uIHRoZSBvdGhlciBzaWRlIEpGRlMyIGlz
Cj4gbGVnYWN5LCB5b3Ugc2hvdWxkIHVzZSBVQkkgKHdoaWNoIGRvZXMgbm90IHBsYXkgd2l0aCBP
T0IgYXJlYXMpIDotKQoKUGxlYXNlIG5vdGUgdGhhdCBKRkZTMidzIG1haW4gdXNlIGNhc2UgaXMg
Tk9SIGZsYXNoLiBTdXBwb3J0IGZvciBOQU5ECmZsYXNoIHdhcyBuZXZlcgpjb25zaWRlcmVkIGFz
IGZ1bGx5IGNvbXBsZXRlL3N0YWJsZS4gVGhhdCdzIHdoeSBVQklGUyAoSkZGUzMgaW4gdGhlCnZl
cnkgYmVnaW5uaW5nKQp3YXMgaW52ZW50ZWQuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
