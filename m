Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F79EDE990
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1jhw/YOgAZHVl3EywWzXjOsle+NPBAGTo5499dyVlE=; b=SsXYJc7CONndnI
	oT7qFaduu8OBl20+jRA4OWGKf+bF9WQUtkZTU63KOJAgEM6vQihnIS6blkPNBKX+2lkviEy4rSs/E
	p9TNDT19l3oP05Q4TRMpP5dXWLjVi7A/Q8hBnywXr+6hDldM4XP8DWCptViciahitmgV0m6UZQrLV
	lMkwBcjZrbl/8Gsj9pMzRDWsDs+OXTme272c8j/XtcW1eiCZwkUHP+h3+vjEnH8rOsQQUP94JkXqn
	dTu45Alce53aBtEgh12A2DlZKiZxqh4yincODMv0DrwZWHzK0io1B0X3iyi3S/ry3ViUXEh3S0dPt
	qHf5GrVd3G8AYIHxfuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghlg-007iK4-1b;
	Thu, 14 Sep 2023 08:32:08 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghld-007iIf-2b
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 08:32:07 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-59bd2e19c95so8249157b3.0
        for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2023 01:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694680321; x=1695285121; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/f7PUGJTcZo4gRvXha7omFj7WFQCwx9ue2jacqTY10Y=;
        b=Ts9m5NUQBiozng6OawNLbpwjEDxgjC1CM3dz5u1imSyp5pSRiY6X0HvUGP6kvLUaMN
         xf3+JroGXYJay5NJdCzczd4cuLFLHwI5/P0U41AjteYol+QAHM9jqFtqkaSQlqBAgrtN
         LMEzZOgFHwLFEwlaGT/qhF4UPne0bMp9uocDcjkP/wQxgMEHvntdegNvFS0QX8F1N8zl
         m/VPxMzrCWXGbuknu/TgX+aV877DPD0oHz6P/RWlFjJNa6eLDNx0TxXAg+xHBg8PV0Id
         tp+QRxGIX3XO5DqLZURczwObc9DMilpylty+0d7HsuW+LdxZBhEevr5lRexq1kFupclW
         Yv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694680321; x=1695285121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/f7PUGJTcZo4gRvXha7omFj7WFQCwx9ue2jacqTY10Y=;
        b=kSEnOGSOw97o0C6hksYGE9QT40bJe0h+T0hk4Hb2sYExeIF49T1gvJOm2kE50UJHcV
         tJ2NR4qZ09GY0FGGF75Gy9k8N5U8chB2+sycE99VcEFY/NMmXKVXQD96sXy+vER3Bw3p
         kIJws2T4CyQnLhXtycXnZ3cMUAsfN+E44bpOb2oipT6Xunl2I+0oZIs6CwWgegYXxAF3
         kjJNToBSTKWDmQueMPcQJoUQGKs0g9gTQX0hfO8+YqcSPYwUZZqvAEFqoemcF18kywNK
         SJIqqA9u4RsoarL/2A75mzQ/Ow7ozWPz3bHLftKQXY4BRcCd7dnwPVzhmGi4NfDK0rEY
         /y8g==
X-Gm-Message-State: AOJu0YxdFfdkMtKCpI/ubZDzJABSaNlEXkwermRcbSWh96oQfYF6QDT+
	6WQpV6LnQOne9rfzoLVkfYcwpQQAlJbWRwUn5G6vgA==
X-Google-Smtp-Source: AGHT+IGge3otYJuN1x0KCIdiXLzKUbPNNkQs8DyMIv7UvmMGiKxCFx+kZRRvM9RVN2cdKaa4LF8eeb7vGkOJrVNORhs=
X-Received: by 2002:a25:b45:0:b0:d63:44e:cbcc with SMTP id 66-20020a250b45000000b00d63044ecbccmr4689080ybl.22.1694680321572;
 Thu, 14 Sep 2023 01:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230913115001.23183-1-brgl@bgdev.pl> <20230913115001.23183-4-brgl@bgdev.pl>
 <CACRpkdax-CrB42LeQ1bs3E7VqMncsgEwMs7b_v7J6R5AE+BjAg@mail.gmail.com> <CAMRc=Mdt0wbjzbwBLK5m--VLV2WE5JybgrNYWXtbinPu_c=psw@mail.gmail.com>
In-Reply-To: <CAMRc=Mdt0wbjzbwBLK5m--VLV2WE5JybgrNYWXtbinPu_c=psw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Sep 2023 10:31:48 +0200
Message-ID: <CACRpkdYVGR0Wj9zS9cuS3qa_tNZHE1t95wQ-4MXAEL6s_4jdFQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230914_013205_842681_3CD08D42 
X-CRM114-Status: GOOD (  28.25  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgMjozOeKAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgo+IE9uIFdlZCwgU2VwIDEzLCAyMDIzIGF0IDI6MjTigK9QTSBM
aW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+IE9u
IFdlZCwgU2VwIDEzLCAyMDIzIGF0IDE6NTDigK9QTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmds
QGJnZGV2LnBsPiB3cm90ZToKPiA+Cj4gPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJh
cnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KPiA+ID4KPiA+ID4gV2UgaGF2ZSBuZXcsIGxl
c3MgY3VtYmVyc29tZSBhbmQgY2xlYXJlciBpbnRlcmZhY2VzIGZvciBjb250cm9sbGluZyBHUElP
Cj4gPiA+IHBvbGFyaXR5LiBVc2UgdGhlbSBpbiB0aGUgTU1DIGNvZGUuCj4gPiA+Cj4gPiA+IFNp
Z25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGlu
YXJvLm9yZz4KPiA+Cj4gPiBJIGxpa2UgdGhlIGxvb2tzIG9mIHRoZSBjb2RlIGJldHRlciwgb2J2
aW91c2x5IGJ1dCB0aGlzIGxvb2tzIGxpa2UgdGhpcyBmb3IKPiA+IGEgcmVhc29uIHVuZm9ydHVu
YXRlbHkuCj4gPgo+ID4gU2VlIHRoZSBmb2xsb3dpbmcgZnJvbQo+ID4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9tbWMtY29udHJvbGxlci55YW1sOgo+ID4KPiA+ICAgIyBD
RCBhbmQgV1AgbGluZXMgY2FuIGJlIGltcGxlbWVudGVkIG9uIHRoZSBoYXJkd2FyZSBpbiBvbmUg
b2YgdHdvCj4gPiAgICMgd2F5czogYXMgR1BJT3MsIHNwZWNpZmllZCBpbiBjZC1ncGlvcyBhbmQg
d3AtZ3Bpb3MgcHJvcGVydGllcywgb3IKPiA+ICAgIyBhcyBkZWRpY2F0ZWQgcGlucy4gUG9sYXJp
dHkgb2YgZGVkaWNhdGVkIHBpbnMgY2FuIGJlIHNwZWNpZmllZCwKPiA+ICAgIyB1c2luZyAqLWlu
dmVydGVkIHByb3BlcnRpZXMuIEdQSU8gcG9sYXJpdHkgY2FuIGFsc28gYmUgc3BlY2lmaWVkCj4g
PiAgICMgdXNpbmcgdGhlIEdQSU9fQUNUSVZFX0xPVyBmbGFnLiBUaGlzIGNyZWF0ZXMgYW4gYW1i
aWd1aXR5IGluIHRoZQo+ID4gICAjIGxhdHRlciBjYXNlLiBXZSBjaG9vc2UgdG8gdXNlIHRoZSBY
T1IgbG9naWMgZm9yIEdQSU8gQ0QgYW5kIFdQCj4gPiAgICMgbGluZXMuICBUaGlzIG1lYW5zLCB0
aGUgdHdvIHByb3BlcnRpZXMgYXJlICJzdXBlcmltcG9zZWQsIiBmb3IKPiA+ICAgIyBleGFtcGxl
IGxlYXZpbmcgdGhlIEdQSU9fQUNUSVZFX0xPVyBmbGFnIGNsZWFyIGFuZCBzcGVjaWZ5aW5nIHRo
ZQo+ID4gICAjIHJlc3BlY3RpdmUgKi1pbnZlcnRlZCBwcm9wZXJ0eSBwcm9wZXJ0eSByZXN1bHRz
IGluIGEKPiA+ICAgIyBkb3VibGUtaW52ZXJzaW9uIGFuZCBhY3R1YWxseSBtZWFucyB0aGUgIm5v
cm1hbCIgbGluZSBwb2xhcml0eSBpcwo+ID4gICAjIGluIGVmZmVjdC4KPiA+Cj4KPiBJIGhhdGUg
aXQsIHRoYW5rcy4gOikKPgo+ID4gV2lsbCB5b3Ugc3RpbGwgcHJvdmlkZSB0aGUgZGVzaXJlZCAi
ZG91YmxlIGludmVyc2lvbiIgYWZ0ZXIgdGhpcyBwYXRjaD8KPiA+Cj4KPiBOb3QgaW4gdGhlIGN1
cnJlbnQgZm9ybS4gV291bGQgaXQgd29yayB0byBnbzoKPgo+IGlmIChvdmVycmlkZV9hY3RpdmVf
bGV2ZWwpIHsKPiAgICAgaWYgKCEoaG9zdC0+Y2FwczIgJiBNTUNfQ0FQMl9DRF9BQ1RJVkVfSElH
SCkpCj4gICAgICAgICBncGlvZF9zZXRfYWN0aXZlX2hpZ2goZGVzYyk7Cj4gICAgIGVsc2UKPiAg
ICAgICAgIGdwaW9kX3NldF9hY3RpdmVfbG93KGRlc2MpOwo+IH0gZWxzZSB7Cj4gICAgIGlmICho
b3N0LT5jYXBzMiAmIE1NQ19DQVAyX0NEX0FDVElWRV9ISUdIKQo+ICAgICAgICAgZ3Bpb2Rfc2V0
X2FjdGl2ZV9oaWdoKGRlc2MpOwo+ICAgICBlbHNlCj4gICAgICAgICBncGlvZF9zZXRfYWN0aXZl
X2xvdyhkZXNjKTsKPiB9Cj4KPiA/CgpJICp0aGluayogc28gYnV0IG15IGJvb2xlYW4gcGFyc2Vy
IGkga25vd24gdG8gYmUgZmxhd2VkIHNpbmNlIEkgaGF2ZQpzY3Jld2VkIHVwIGRvdWJsZSBpbnZl
cnNpb25zIHJlcGVhdGVkbHkgb3ZlciB0aGUgeWVhcnMsIHNvIGl0IHNob3VsZApub3QgYmUgdHJ1
c3RlZCBhdCBhbGwuCgo+IEFsdGVybmF0aXZlbHkgd2UgY291bGQgcmVpbXBsZW1lbnQgdGhlIHRv
Z2dsZSBzZW1hbnRpY3MgbG9jYWxseSBpbiBhCj4gaGVscGVyIGZ1bmN0aW9uIGluIG9yZGVyIHRv
IGdldCByaWQgb2YgaXQgZnJvbSBHUElPTElCLgoKSSBkb24ndCBrbm93IGFib3V0IHRoYXQsIHRo
ZSBmbGFnIGlzIGluc2lkZSBncGlvX2Rlc2Mgc28gd2UgY2Fubm90CmFjY2VzcyBpdCAoc3RydWN0
IGlzIHByaXZhdGUgdG8gZ3Bpb2xpYi4uLikKCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
