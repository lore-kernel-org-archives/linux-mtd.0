Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545ABEEAA40
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 13:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TmCHCdcyJK73MhfK+tTOnPKis+fWxEmPgUJ5/HDOmvk=; b=TfdDmfgVGFuaLg
	Mgn43vyisE2NVpLbx7KRO/ub5EpFDWVH/aiQAx07ER2jHDhcS+8Un7UNc/RoTJZ8XHX9HbiPpT8qz
	fmWaOm/AhaE1iId/DisxDQqxb5h3NbIHtvKu0ZdrRud8JK8VGTKfPN3dS61OpbpAt5BZjBqWR1FcA
	7F0m26/Dlxh5wCSThnCbsmySMflzzL1jQe+A1fzdwBiAARIzQTOjRR1x9QCRedzunwbsyByf+kEqD
	xXdb6co+cAdy63sNKwHbIkA73ujCd2qei8uKa0l6B3hiOXJnwCIEi1kkYZecB198amyydQCZ+9/2o
	z863SfD/SK9K+2ZqFdEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmol-008Yxw-14;
	Thu, 14 Sep 2023 13:55:39 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmoi-008Ywv-1h
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 13:55:37 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d7ecdb99b7aso1018880276.3
        for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2023 06:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694699734; x=1695304534; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lVufp3CfPA+avJJEdJfW22ymBTvw516wdd+VxBZzds=;
        b=XmD7IeRzIG081oIyJWxzjBPWfzkozYTgv2tzNHlqtOwlwtSsCSFodHqwUsJwmG/rPK
         4BDXkAfY/JjmpAl+A+3Vgfgj3BVhyAx/gvc2am7qPwL1scWNCGEtaHXAP1sHTYTv8Zqr
         xzH7NziDtb6fzOU+e+APunDhSGeYiTuYfBNoIMpbgFR7blnM2wKd0PeF9fDnO7xsPL8t
         E0F84yX83bi+77XMmaRGPYAAksKrzKKkk9aHBNakm/apdFSaW1jkMJI5ItqUM1uibDAq
         ai46u84gEh50a6f838FuA8sE2vn3cPv5JgDXbUsZG6giNEipfNwbS+MeMghf0xozDTG1
         /V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694699734; x=1695304534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lVufp3CfPA+avJJEdJfW22ymBTvw516wdd+VxBZzds=;
        b=IcpDhpykNeVrxFNaG3AxrlzjcQZ5ajEMP/o4vqWZO0Dw+9jFSvt6VGY9W/6aj2RrRF
         39ujzzExPadlGKUjusrFrU9b+f13qTmR/uLTActs4uNhqvgrKpKXYz9vzyk+ot6/RcRN
         LVd/ZdANOQd0e79z4dQEJcgqGuENW20yXUgVQJ5i2NAwsUu8Dr9/t+eXM6pyrJIfK9VL
         /pRKEWq3/lXbPzXp4A2dSTtHzrhHtdY4CrX5Kcd2nCkhOuthOqu1Nvx/Xq4FzWwhkO3z
         uV7CL5SJnCPzCmGgnpZeZEvgC+/QDOKoXEDKazgNAVHXanN8TPyWFP7U7gH04Rs/3JVw
         I2IA==
X-Gm-Message-State: AOJu0YxPTqhJk6b17c954VOtHwjJ1M0YO0o69IJSqBi9V/pv7kbG4iee
	EaBfL8voymmmG6wMrAgmrRfsNFRcYFnsJdFzArm5ew==
X-Google-Smtp-Source: AGHT+IHmzARiZmGAsVvUQi6lwHQOEn26bk87VErr5TXYZTtaPzwucwTkpNwUE9Hz/2T2a3UepOFa7PTmuZyP0PLHJ8A=
X-Received: by 2002:a25:d683:0:b0:d81:9ba3:43bc with SMTP id
 n125-20020a25d683000000b00d819ba343bcmr1489848ybg.12.1694699734333; Thu, 14
 Sep 2023 06:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230913115001.23183-1-brgl@bgdev.pl> <20230913115001.23183-3-brgl@bgdev.pl>
 <CAHp75Ve8aK4Pfid1JYWH86mKy-Zb-G2QDPrJYmRzPCYOsn1TqQ@mail.gmail.com>
 <CACRpkdYtYDJa6fo6RnizHNzUsyazBQxEaNMznaij8rBF4ie+ew@mail.gmail.com>
 <20230913222338.07d1625b@xps-13> <CAHp75Vd2a06rnGCEiJW0reN00amso0RyvgLT516nZiYLYZ-xcQ@mail.gmail.com>
 <4de724a1630eda74f4f304dc224dc981eb3b0875.camel@crapouillou.net> <CAMRc=MfnPdr66OPSkkjjpZY2VY7wN4WO2uBPbpyExFH0F6e=1Q@mail.gmail.com>
In-Reply-To: <CAMRc=MfnPdr66OPSkkjjpZY2VY7wN4WO2uBPbpyExFH0F6e=1Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Sep 2023 15:55:22 +0200
Message-ID: <CACRpkdah0+HjQ3Co=eHitK8srbWgT7e956+oeH-K+yjYs9=iuw@mail.gmail.com>
Subject: Re: [PATCH 2/5] mtd: rawnand: ingenic: use gpiod_set_active_high()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Paul Cercueil <paul@crapouillou.net>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Andy Shevchenko <andy@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Daniel Scally <djrscally@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_065536_568354_E09B6942 
X-CRM114-Status: GOOD (  14.67  )
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

T24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMTE6MzDigK9BTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
cmdsQGJnZGV2LnBsPiB3cm90ZToKPiBPbiBUaHUsIFNlcCAxNCwgMjAyMyBhdCAxMDozMOKAr0FN
IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZToKCj4gPiA+IEkgYmVs
aWV2ZSBMaW51cyB3YXMgZm9yIG1vdmluZy4KClllcy4KCj4gPiBXaGljaCBMaW51cz8gQmVjYXVz
ZSB0aGUgb25lIHdobydzIGFsc28gdGhlIGdwaW8gbWFpbnRhaW5lciBqdXN0IHdyb3RlCj4gPiBh
Ym92ZSB0aGF0IGl0IHdhcyBiZXR0ZXIgdG8ga2VlcCBpdCBpbiB0aGUgZHJpdmVyLgoKV2hhdC4g
Tm8uIEkgZXhwcmVzc2VkIG15c2VsZiB1bmNsZWFybHk6Cgo+ID4gV2h5IG5vdCBtb3ZpbmcgdGhp
cyBxdWlyayB0byBncGlvbGliLW9mLmM/Cj4KPiBUaGF0J3MgYSBiZXR0ZXIgaWRlYSBoZXJlIEkg
dGhpbmssIGl0J3MgY2xlYXJseSBhIHF1aXJrIGZvciBhCj4gYnVnZ3kgZGV2aWNlIHRyZWUuCgoi
VGhhdCdzIGEgYmV0dGVyIGlkZWEgaGVyZSBJIHRoaW5rIgoKbWVhbnMKCiJUaGF0J3MgYSBiZXR0
ZXIgaWRlYSBbSU4gVEhJUyBDQVNFXSBJIHRoaW5rIgoKaS5lLiBpbiB0aGlzIGNhc2UgaXQgaXMg
YSBiZXR0ZXIgaWRlYSB0byBtb3ZlIGl0IGludG8gZ3Bpb2xpYi1vZi5jCgo+IEknbSBhbHNvIHVu
ZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgTGludXMgbWVhbnQgbW92aW5nIGl0IHRvIGdwaW9saWIt
b2YuYy4gTGV0J3MKPgo+IExpbnVzOiBDb3VsZCB5b3UgY2xhcmlmeT8KClllcy4KCkkgaW52ZW50
ZWQgdGhhdCB0aGluZyBzbyBJJ20gYSBmYW4gb2YgaXQuCgpZb3VycywKTGludXMgV2FsbGVpagoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
