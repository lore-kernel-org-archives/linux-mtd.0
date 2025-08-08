Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A6DC87FD2
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Aug 2025 12:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MRcd7YvP+NjmZ02ATIgwS9Bu1jy8D7Ean+8KfoZIdhc=; b=lV31hLuBzzD86V
	J1PpwMkYBmpLIiaFHdu6XAb9dnl8imMT0/XHQLoUDXcPp2qm2j1boLMrCCIIJxAvxQcdy1te4b3VK
	hdM6/ppG3SxWfXUN8+2cSydnSLmkBTKD0jTLk3H1LlfVSOC6E2Cxl6Mq8Z5aCqkbOG0bb+IrrT2Ct
	7XfTl3RbxqWN63x3SOJ71eJ0fAt3VMQShZ0BuRDIH1fUMQRf53E6Z8Et4DoO0ufo9+oQnEN2tMNi5
	jS/KVFdCzCPJ2/UOxuQzk6xOe0Wm/MCaE6HLCtwg8gWh09ctz3f6hm6tCH1pAfEWySL+11s61nFaA
	DLuABdpukJ2o+hCl4LHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLzR-00000002mEL-3JIa;
	Fri, 08 Aug 2025 12:14:29 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLO4-00000002guX-1s1e
	for linux-mtd@lists.infradead.org;
	Fri, 08 Aug 2025 11:35:53 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-31ed9a17f1fso1751894a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 08 Aug 2025 04:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754652952; x=1755257752; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAD7rJU1Hc8HGnWSwBg44AH+u2lXTkldlX/xxRuByOQ=;
        b=ZQ/NJ7sawEDyYPpi+BaXaRlqMovU5JrMiyFu0lwDqtVtn87wlKkdOLZm0ExsA9AdR4
         HnnvA9uMUtJYUcSYKNBmyVKbgr5CW+L1rxTp49UiU5OlvEKk7KBWJ6uFv0WYHOGqEXSU
         Gab5h2O39TyVFvjRDvrQGDQTS8Qc/1qQ7an+EvLsmnFuHYCudDZmtTiQVCf5but8mWTu
         l3kVaizdJvgQqABtel4cbWYunVLKETlYNwREKNB3zXRN60xvkqEe2ID4MO94QQgqQ4ha
         rMnapuUnwh0F75t5QH459wYnSiQIdVRrKwH8hx7ibJ6UUF0sXm7orCz1e2WeiCimuMEw
         D+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652952; x=1755257752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAD7rJU1Hc8HGnWSwBg44AH+u2lXTkldlX/xxRuByOQ=;
        b=lPpSxmM6EjOnIzr2EkFbce6Qu02mZd/6BkPQhgScr/aNLr0Xvuchw91ERwLSmW5NSu
         x0MTIVWrS4BjSD/SQ2vrs2OToLM79pswufNqLs48+n0v8s6bu4jV0tj1KdyqgRoHNNyk
         4NLdXmp4xnFxzNtT5uO+OwiiI0+Ndf2pbGBWV1UeOoFrUsd8EfGFpnsf8Y1LdjlfxFC0
         BoHC/fhb6NOAvXtMn3COLKwTbIM/XyowhmvEihYFuXJLpeckqjANjdZayuET9tGqtXW0
         dMwWwhXdlETJh5x7VtF6Ak/VHaOx7nHNQlsKq7C64xG+UUkXUHCQQyw/jF4y0aEQWH7f
         eqXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXisc0B+4lsjwKUt6fM+OC+Kw/01eMJxdyqsgzUx1vZ2a6rNuVc+CjPLCt7ivD5qEE5SxM7nn4vJOE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrj5L0udVnchhITW4C5t8hQq/ZIKxB6DiWVJQ5+50jIGYJ43kh
	frpHmka/NnWmhJymPBlG6FTodIZsYGBjKRYCJuW2N6HkcA4zAPnUiR85KljWH6Dkc7vKNHLzlCZ
	SPs1fUHmkw2n7ITldsRVytGsxq/5j5fQ=
X-Gm-Gg: ASbGncsLyG9v906TV+q2CX/uB36bouYl11gCsw53u7Fx9CcKAloUS/ZPyY3tr0/Id1U
	pcyltrs02ebKhGk/2/HFBErSRe/WxSM6jrTfypDIQv2yfC+2gjOWnoGbnHC4H3zap+Ru7k0GEae
	ZCq7hf85qYpLkhl/At0Jh+0XqdZasOKlsng+PA9LJtmjUyEDurXnIr0oz/5+X6twvUAry4D1EmF
	6aQlw==
X-Google-Smtp-Source: AGHT+IFibUzuC7PIMW/b88XLYM4lA4IZIvE07obnrmykoxG7aOzC/f26bPAO9bOvz6u6YkO34Qzy2p0xSx5Dcssnks8=
X-Received: by 2002:a17:90b:498d:b0:313:2206:adf1 with SMTP id
 98e67ed59e1d1-321839c8d3cmr4280632a91.4.1754652951490; Fri, 08 Aug 2025
 04:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250808095503.906244-1-linchengming884@gmail.com>
 <20250808095503.906244-2-linchengming884@gmail.com> <878qjuazlp.fsf@bootlin.com>
In-Reply-To: <878qjuazlp.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Fri, 8 Aug 2025 19:35:41 +0800
X-Gm-Features: Ac12FXzyy70S3yo1kqO-v8rEt6fo-e6sv9cx2MGOgokOTOEyG07YDGEgi4eJQss
Message-ID: <CAAyq3SYHchAXb6_jOsCs_R_iCboAQq6jBpbLmF4_7uGzME=+iQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nand: Add support for randomizer
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_043552_481864_659133FE 
X-CRM114-Status: GOOD (  15.85  )
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
IDIwMjXlubQ45pyIOOaXpSDpgLHkupQg5LiL5Y2INjoxNeWvq+mBk++8mgo+Cj4gSGkgQ2hlbmcg
TWluZywKPgo+IE9uIDA4LzA4LzIwMjUgYXQgMTc6NTU6MDIgKzA4LCBDaGVuZyBNaW5nIExpbiA8
bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IEZyb206IENoZW5nIE1pbmcg
TGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gPgo+ID4gQWRkIHJhbmRvbWl6ZXIgb3Bl
cmF0aW9uIHN1cHBvcnQgZm9yIHVzZXIgZGF0YSBzY3JhbWJsaW5nLgo+ID4KPiA+IEZvciBtb3Jl
IGhpZ2gtcmVsaWFiaWxpdHkgY29uY2VybiwgaWYgc3VicGFnZSB3cml0ZSBub3QgYXZhaWxhYmxl
IHdpdGgKPiA+IGhhcmR3YXJlIEVDQyBhbmQgdGhlbiB0byBlbmFibGUgcmFuZG9taXplciBpcyBy
ZWNvbW1lbmRlZCBieSBkZWZhdWx0Lgo+Cj4gQ291bGQgd2UgYWRvcHQgYSBoZWxwZXIgdGhhdCBh
bGxvd3MgdG8gZW5hYmxlIGFuZCBkaXNhYmxlIHRoZQo+IHJhbmRvbWl6ZXI/CgpJIHVuZGVyc3Rh
bmQgdGhlIGlkZWEsIGJ1dCBmcm9tIHRoZSBmbGFzaOKAmXMgcGVyc3BlY3RpdmUsIG9uY2UgdGhl
CnJhbmRvbWl6ZXIgaXMgZW5hYmxlZCwgaXTigJlzIGdlbmVyYWxseSBub3QgaW50ZW5kZWQgdG8g
YmUgZGlzYWJsZWQuIFNvIEkKZmVlbCB0aGF0IHByb3ZpZGluZyBhIGRpc2FibGUgb3B0aW9uIG1p
Z2h0IG5vdCBiZSBtZWFuaW5nZnVsIGluIHRoaXMKY2FzZS4KCj4KPiBJIGhhdmUgbm8gdXNlIGNh
c2UgaW4gbWluZCByaWdodCBub3csIGJ1dCBJIGZlZWwgbGlrZSBpdCB3b3VsZCBiZSBhCj4gYmV0
dGVyIGFwcHJvYWNoLgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKClRoYW5rcywKQ2hlbmcgTWluZyBM
aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
