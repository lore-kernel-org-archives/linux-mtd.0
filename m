Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE65C2BA1A
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2024 10:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoI9+L2cwGUbbCrGVhxvhIq+ygMjxji3ZmDI/jiTPSI=; b=eN+u52PxBQZPXW
	Lmn8TRcGu1INdV4NSupsJk7NxcOC5MyaEEqySvPA6oPlcEOC+qhZJlyhZV9DswZmjCcg0i6xI931C
	FWcFoePktk+i5rgOYetHQS/YdRSvYAf2DLAQah4i1InxjcnkpAPdigPhGnjkRKq1vjm4DZW89xgIa
	MIZvqPV2YETBW80DamUvD/Tmoi0D9GvZV75V8aH+aim5nztXgkl79wD4TBcms/ay0mVsBXUm/czI2
	6QdUV9RAhnmxSu8LJJIedKFggrY8v1UbPRYybZjhjXZM+NBkE9fqiO2a2Z4tIY2+RaZTHXP3ng1hd
	fGVJ/juHes5jydB9iAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVnH-0000000EH76-08XM;
	Tue, 18 Jun 2024 10:10:27 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVnE-0000000EH51-1IVf
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jun 2024 10:10:25 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso86937901fa.1
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2024 03:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718705420; x=1719310220; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRdvEX8LeL4ZldtK1EB4UBDTGqjoriC0preu44uvUtI=;
        b=geJ5gfYksj1E2s6dVXKe2+lR6vGencZ6ZZZUqi+iA7ErGtH/R7c1dzAD+Rt6bCDDfh
         ai3tIVvpwst6NgMFNPEy08jlAey2rSeDcA6zKDZCBiVucM8bPtGFeCQVX/3Twm8Jqeze
         hmFL9XBZ5bpRfK1LC+lw1iz6ySB4UYafFYFe1cZe/Q571HVYzVr4fcW64XFT2UFbz04O
         IUx3yllYf2FFAhM6XO5dryJp/JDmkVP4rhwDJJ1w1PPbHiIvGXS7ukT5f6ABwIJgNua7
         4Pa4kRpXH8Kq0DJskaZth+wNcKKq2pRE5GfQqJipmRQeSX1TN+VMolEOKQB9+RNKeHSd
         getg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718705420; x=1719310220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRdvEX8LeL4ZldtK1EB4UBDTGqjoriC0preu44uvUtI=;
        b=C7HDBTn4inNMJLmqIlPOXRJcE0q8evPvwGKVyJPLVpwsIFdyUytc7/BEJeFFg9fpxp
         Jc4ksj1KqUe7xYI+6x7PwAabCJ5LY6ibf7TE+BmZBJgwzZwYuKuaGI+W56n8oDgc9nII
         ipb/TGBemworGAslw4LduHJTd/2LyQNfOTe92Tq8gOLVssyJ3bzaiw1MIUcI2j/gwG63
         UTVSePHk64pQgo4/Tw0uLQ2NOWXu7+01VweE7TUBhJlynSG7iP7W8Q/hAk/0nzL2j3BB
         0Cm55a5RFqqRxtCDgmzuOUOzZSYaXx+Wr+auv7EGtxH9IdS5A5PskNI2V5zAgaXfHthX
         s81w==
X-Forwarded-Encrypted: i=1; AJvYcCU6lDVHjlSXUL5q8wbYtW5NMedVmbxrsDT2Aw5hT4LkJJ8RLxsVmd9Wkb2AZpKNVkL3eowYks8GBfENwMYeR0aSoKmH+IerB11r+8VUmQ==
X-Gm-Message-State: AOJu0YylEIV7pyWn+cdnpM1fTgbto2czjI57PBpeDNlBzCXMQp+TBeun
	DvLQ6hmOZAfrrGCAE3As9NuKUzvB4IHydCwePjo8bHuxR8SBtO++QRGtoI/dYiNN5W1Kf4KhISq
	2sbtJWriN4sqy5kwgfy2PjFZPgHGE6KLYD+KTWQ==
X-Google-Smtp-Source: AGHT+IF6Xt+V7qAkTNt3OUDshHfo309i5lYo8MHcybfwbujbr4eDujZIPADYU0a0RAObz82l0EeG0F+biFDYfMB+ZUk=
X-Received: by 2002:a05:6512:34d9:b0:52c:993d:b462 with SMTP id
 2adb3069b0e04-52ca6e6e25amr8100164e87.29.1718705418225; Tue, 18 Jun 2024
 03:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240610074809.2180535-1-mwalle@kernel.org>
In-Reply-To: <20240610074809.2180535-1-mwalle@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 12:10:07 +0200
Message-ID: <CACRpkdbXpcjUxbrMTmAmWgmMoCHR0dxvNzn4gSYfBjr83k4kAQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: winbond: fix w25q128 regression
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, e9hack <e9hack@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_031024_371408_2C1A306A 
X-CRM114-Status: GOOD (  13.58  )
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

T24gTW9uLCBKdW4gMTAsIDIwMjQgYXQgOTo0OOKAr0FNIE1pY2hhZWwgV2FsbGUgPG13YWxsZUBr
ZXJuZWwub3JnPiB3cm90ZToKCj4gQ29tbWl0IDgzZTgyNGE0YTU5NSAoIm10ZDogc3BpLW5vcjog
Q29ycmVjdCBmbGFncyBmb3IgV2luYm9uZCB3MjVxMTI4IikKPiByZW1vdmVkIHRoZSBmbGFncyBm
b3Igbm9uLVNGRFAgZGV2aWNlcy4gSXQgd2FzIGFzc3VtZWQgdGhhdCBpdCB3YXNuJ3QgaW4KPiB1
c2UgYW55bW9yZS4gVGhpcyB0dXJuZWQgb3V0IHRvIGJlIHdyb25nLiBBZGQgdGhlIG5vX3NmZHBf
ZmxhZ3MgYXMKPiB3ZWxsIGFzIHRoZSBzaXplIGFnYWluLgo+Cj4gUmVwb3J0ZWQtYnk6IGU5aGFj
ayA8ZTloYWNrQGdtYWlsLmNvbT4KPiBGaXhlczogODNlODI0YTRhNTk1ICgibXRkOiBzcGktbm9y
OiBDb3JyZWN0IGZsYWdzIGZvciBXaW5ib25kIHcyNXExMjgiKQo+IFNpZ25lZC1vZmYtYnk6IE1p
Y2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPgo+IC0tLQo+IEhhcnRtdXQsIExpbnVzLCBj
b3VsZCB5b3UgcGxlYXNlIHRlc3QgaXQgb24geW91ciBib2FyZHM/IEFsc28sIGRvCj4geW91IGhh
dmUgYSByZWFsIG5hbWUgd2Ugc2hvdWxkIHB1dCBpbiB0aGUgUmVwb3J0ZWQtYnkgdGFnPwoKSSdt
IHVuYWJsZSB0byBicmluZyBtYWlubGluZSBMaW51eCBiYWNrIHVwIG9uIHRoaXMgZGV2aWNlLCBz
byBzYWRseSBJIGNhbid0CnRlc3QgaXQgcmlnaHQgbm93LiBCdXQgaXQgc3VyZSBsb29rcyBmaW5l
IHRvIG1lOgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
