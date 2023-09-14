Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C963EEDE990
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 08:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sT6FF8yl5+kzUxMGpSKdBdpyvjl3/PzbTWGY0JZZESM=; b=JnxyqBORDu5snu
	PCKemtaBfhdKpVWyJAiC6PCjVRbAZXZR1CyY44/uvOaZLDmMyb6ylcj0rGDHrddpjaKgBWB2G4Zrx
	ftJDI9DBYkC0RZ/8W6WVPD5ZzotW6yBYATVOzYDgNo11TXi6k5HaZcTN/7h0hnrCkM0DWEMCLl/5f
	Y1MebyPCC/z3MM2yB4DsFmYLRztcJ8NAOaEoKTzkzWaIDfnGffhhGl8sw1dRGHZPwz47BTa8Rprr2
	kTlvyA2ZbN46vs9wKCvJeCI0nOAA9HVD/TlGbgKw2jklegLLciZ2YrmSMTMxwXuw84p9gvh0ZmNSv
	CNo5+gKLtoOSPRw3dW6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghrd-007jAY-2g;
	Thu, 14 Sep 2023 08:38:17 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghrb-007j82-2P
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 08:38:16 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d7830c5b20aso1059142276.0
        for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2023 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694680692; x=1695285492; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tw+IM7T28OUZCuFvNNtZ4r0LwLPv3E7VBk0HU9CwOkM=;
        b=vztLcdx5vjdTzPL0Ffp72ukGvAXnbbog0aFWr3JG+ev5YGkvhXFDISswxi3aKmzH6p
         51prmQOBSQd8mi2bCmFq0EYXJy1Pl/QG1U+UaUF/SEZaQOyWfXNayEkUlV0Fd6Djjkiz
         RXSpKY8LACrOWFE5+OAJIevRkxu6DSQ7MXvk+srfNNE0C1saZKdisv9anCTUcU4i7fl2
         qebrEYRDuQ6OiwYOsfoVSH0sxblRB8C1PGOp/9pCy9JDrHCu7wJLW3z2S1NNYiWM3ZIQ
         mo2kT/DXWtXUmgxUP926LsSTcmoce6evYCb0c71NchaLIrKRn71fdJtn4yf1IbP/U5uy
         gaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694680692; x=1695285492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tw+IM7T28OUZCuFvNNtZ4r0LwLPv3E7VBk0HU9CwOkM=;
        b=mx4rFhBSr5dAJOd/wAFEvLBA8ypSEVkrzfgbwE8SHOD7h4HY10NQ1QMyrGsFLan5IY
         +NkpY3d23h/LxaqJgkN7vfETJFjxBM0UfHEhP05MXnRIa5i2UeAfU0tufDiYI1xlXOB+
         J95cECy6dHrCX7lJvrL9hUE4/ZSibXjEHjGZ3uJTYE88Lrxx4FujBFW9z6C6Yljs/3Au
         KrZuyBXWM8unBOSFT9JjKmg9sMmRlzD2DAL25k1jiiwaK+5b570dnabWweRem2cYZ9cc
         WIY128e+FACxkDT3NBkquAzf4jDNI4Pt1SmceWoFOPALmCRCWKVbumMnNdgvEMxP/ATA
         erLA==
X-Gm-Message-State: AOJu0Yw2SmJxDugEPdALm5q2VpXB2nUXMvc9EcKCD1E0kAoP/PGke8y8
	wSaIYTaRhG2tG3eMSejGRZcqCfv2xcg2cISOarhq/g==
X-Google-Smtp-Source: AGHT+IFyY43h1oRCVKhhChEd117O1PDuUi9sFE50e09WDnGshfwxm7/vGR5ngRDde3sVsJopmuH3eR/c9W658nqJCQo=
X-Received: by 2002:a25:7714:0:b0:d07:b677:3349 with SMTP id
 s20-20020a257714000000b00d07b6773349mr806404ybc.25.1694680691812; Thu, 14 Sep
 2023 01:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230913115001.23183-1-brgl@bgdev.pl> <20230913115001.23183-4-brgl@bgdev.pl>
 <CACRpkdax-CrB42LeQ1bs3E7VqMncsgEwMs7b_v7J6R5AE+BjAg@mail.gmail.com>
 <CAMRc=Mdt0wbjzbwBLK5m--VLV2WE5JybgrNYWXtbinPu_c=psw@mail.gmail.com> <CACRpkdYVGR0Wj9zS9cuS3qa_tNZHE1t95wQ-4MXAEL6s_4jdFQ@mail.gmail.com>
In-Reply-To: <CACRpkdYVGR0Wj9zS9cuS3qa_tNZHE1t95wQ-4MXAEL6s_4jdFQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Sep 2023 10:38:00 +0200
Message-ID: <CACRpkdaar4UsYcnMmjMPd5NnhaJq-LMSW0gQfBnjS3_u0_UkYQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] mmc: slot-gpio: use gpiod_set_active_[low|high]()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Daniel Scally <djrscally@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_013815_790856_CBA08395 
X-CRM114-Status: GOOD (  15.10  )
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

T24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMTA6MzHigK9BTSBMaW51cyBXYWxsZWlqIDxsaW51cy53
YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+IE9uIFdlZCwgU2VwIDEzLCAyMDIzIGF0IDI6Mzni
gK9QTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPiB3cm90ZToKCj4gPiBBbHRl
cm5hdGl2ZWx5IHdlIGNvdWxkIHJlaW1wbGVtZW50IHRoZSB0b2dnbGUgc2VtYW50aWNzIGxvY2Fs
bHkgaW4gYQo+ID4gaGVscGVyIGZ1bmN0aW9uIGluIG9yZGVyIHRvIGdldCByaWQgb2YgaXQgZnJv
bSBHUElPTElCLgo+Cj4gSSBkb24ndCBrbm93IGFib3V0IHRoYXQsIHRoZSBmbGFnIGlzIGluc2lk
ZSBncGlvX2Rlc2Mgc28gd2UgY2Fubm90Cj4gYWNjZXNzIGl0IChzdHJ1Y3QgaXMgcHJpdmF0ZSB0
byBncGlvbGliLi4uKQoKQWN0dWFsbHkgSSB0aGluayB0aGUgd2F5IHRoZSB0b2dnbGUgY2FsbCBj
YW1lIGFib3V0IHdhcyBmb3IgdGhpcyBvbmUKTU1DIHVzZWNhc2UuCgpUaGVuIG90aGVyIHN1YnN5
c3RlbXMgaGF2ZSB1c2VkIGl0IHdpdGhvdXQgYXNraW5nIHRoZSBHUElPCm1haW50YWluZXJzIG9y
IHdpdGhvdXQgaW1wbGVtZW50aW5nIHRoZSBtb3JlIHByb3BlciBhY2Nlc3NvcnMKb3IgcGF0Y2hp
bmcgZHJpdmVycy9ncGlvL2dwaW9saWItb2YuYyBiZWNhdXNlIHdoeSBub3QsIHByb2JhYmx5CnRo
aW5raW5nIHNvbWV0aGluZyBsaWtlICJoZXkgd2VpcmQgdGhhdCBpdCBpcyBqdXN0IHRvZ2dsZSBJ
IGd1ZXNzIHRoZXkKYXJlIG5vdCBzbyBzbWFydCwgYnV0IGl0IHdvcmtzLCBzaGlwIGl0Ii4KCllv
dXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
