Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4732E95A61
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Oct 2023 10:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjPTk046RbE+aGY8ibdtU54lqUIIcxvC7mNgEqAmSpo=; b=Arz5VpunjTbq5W
	DFOq9pSOLjwEVa90WatPTq1Ylk8dSlup/Xl0yVrZS4BoMAG5XFmBF2qkOh1Fc9WgIGjs7u491lKQh
	m9fXUnLy631dZXdiDeUDDluo3gB5CSHqCUbGTYFb5i/E621K5lZlUBaevlUo23cJbb/+RiDrXwjbw
	vB9KVfzZSkyhe9Snt5IEWNFu5/FMZcVZo17pJ7dwEPByhv6qR6E4YsrQPHyK5Ae4Aaym+MAGawynf
	lEEP298JxBz5wYEt679OcK492t2aDWApOfkXLAyYkMY0SLmgnoKCPykLAXjkwHWZ827yGQji9yQlU
	sWIegcEFo26EbEz/ocCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp4NH-007Iqh-0l;
	Sat, 07 Oct 2023 10:17:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp4NC-007Ipt-1m
	for linux-mtd@lists.infradead.org;
	Sat, 07 Oct 2023 10:17:29 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-406609df1a6so28198505e9.3
        for <linux-mtd@lists.infradead.org>; Sat, 07 Oct 2023 03:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696673842; x=1697278642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUq2GChJDBAKCbgHi9jypYjxbAWC/TgAtVYt/nWCOxI=;
        b=nn76HA8BVCHZ/3RHZJS21QDFCEn67M75YP254BEPTJABdf3Jjp8XLFCGGUUewKd4XT
         H4FsAb3CL/VSO6jt2biLpsnnhPm5NSS+4mwxVglXxbvExfGXbLBObJkkgz//SWeIAYZO
         u+cmvmy7Q5GuZ4LYUZDyIVKfr2AcaYlhGjXUM/32/LPDJasSRVepM6uEMsfQiif7nXqK
         gJFzenCQzYzTwVluNvEt7joKTLI7U2Vm6vAl2KxCbBMYSMlI7AjlE78GgYzyVFNP21Pz
         /mFQqcCdomU8whcouuLIxlFd1BfTS+Hgayieue27YVOif6JgO8v6gJjiVgGLw3ysIQcN
         w2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696673842; x=1697278642;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUq2GChJDBAKCbgHi9jypYjxbAWC/TgAtVYt/nWCOxI=;
        b=Q+FCGUcZYv7WQXO5n6YFhKT0LAIYJ8irVm+3eU8CNBcx095G2mfFPZl6O4ND/Mwe+d
         Rjxv+gegEsG49JArq5DR3lrINKn6FuijRlL85/21yHju1hHfT6EO0h1Tyl1wNSx9qcRu
         ljB0VTNxgmwiNDTYdt1sEBBKKwWNZTEx9RtejNwwhJlvUmirxPCbHNWJsGlbha84zXqV
         ZmcFA+aK2M6EYCdgSTYUC/MKQvl0Y2rlGaVZ9hy+f0ib4WvKW2N5Rp/qLxGGisLYBObd
         hFl+vCbj+R3+rM0e7nOdg7p0rKaPKVGVyAtWK8hG/ZQ8SH3UXQEbLuQ5qwCTRAPz8auM
         hSPQ==
X-Gm-Message-State: AOJu0YyUYmByZiY4GyQLaSl0W41+0BuczO/c88ib4BCgG+4znL25ELvS
	5M8ZeLeB5pmwSMQkw6BDu82q8Q==
X-Google-Smtp-Source: AGHT+IH5RU1FO5UDsMVN6VHVw0Z9Pw2rfg0BXTjWX5ElKB1kOGIgKscevIIUak6oNQPhBUiSM6Z2xA==
X-Received: by 2002:a7b:c397:0:b0:406:52f1:7e6f with SMTP id s23-20020a7bc397000000b0040652f17e6fmr9554590wmj.12.1696673842247;
        Sat, 07 Oct 2023 03:17:22 -0700 (PDT)
Received: from [172.20.10.4] (82-132-213-54.dab.02.net. [82.132.213.54])
        by smtp.gmail.com with ESMTPSA id c6-20020adfed86000000b003279518f51dsm3892835wro.2.2023.10.07.03.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 03:17:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
 Alban Bedel <albeu@free.fr>, Christian Marangi <ansuelsmth@gmail.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20230718084804.20139-1-zajec5@gmail.com>
References: <20230718084804.20139-1-zajec5@gmail.com>
Subject: Re: [PATCH] Revert "nvmem: add new config option"
Message-Id: <169667383992.74538.16857754377608067842.b4-ty@linaro.org>
Date: Sat, 07 Oct 2023 11:17:19 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_031726_595633_39375D4E 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
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

Ck9uIFR1ZSwgMTggSnVsIDIwMjMgMTA6NDg6MDQgKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBUaGlzIHJldmVydHMgY29tbWl0IDUxN2YxNGQ5Y2YzNTMzZDVhYjRmZGVkMTk1YWI2Zjgw
YTkyZTM3OGYuCj4gCj4gSXQgc2VlbXMgdGhhdCAibm9fb2Zfbm9kZSIgY29uZmlnIG9wdGlvbiB3
YXMgYWRkZWQgdG8gaGVscCBtdGQncyBjYXNlLgo+IAo+IERUIG5vZGVzIG9mIE1URCBwYXJ0aXRp
b25zICh0aGF0IGFyZSBhbHNvIE5WTUVNIGRldmljZXMpIG1heSBjb250YWluCj4gc3Vibm9kZXMg
dGhhdCBTSE9VTEQgTk9UIGJlIHRyZWF0ZWQgYXMgTlZNRU0gZml4ZWQgY2VsbHMuIFRvIHByZXZl
bnQKPiBOVk1FTSBjb3JlIGNvZGUgZnJvbSBwYXJzaW5nIHRoZW0gIm5vX29mX25vZGUiIHdhcyBz
ZXQgdG8gdHJ1ZSBhbmQgdGhhdAo+IG1hZGUgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZSgpIGluIE5W
TUVNIGEgbm8tb3AuCj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClsxLzFdIFJldmVydCAi
bnZtZW06IGFkZCBuZXcgY29uZmlnIG9wdGlvbiIKICAgICAgY29tbWl0OiBiYjUxOTI2MmYxYTli
NGMzNzA0NmJlNWEzODUxYWIxNjgxZDcxNThhCgpCZXN0IHJlZ2FyZHMsCi0tIApTcmluaXZhcyBL
YW5kYWdhdGxhIDxzcmluaXZhcy5rYW5kYWdhdGxhQGxpbmFyby5vcmc+CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
