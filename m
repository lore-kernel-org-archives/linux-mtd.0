Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81817C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Oct 2023 15:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1DfwTLABsFhCxVyJP9pPFmRyz/+3Gr7EaxZkFoXHhf8=; b=W9+1zRCgoKN5fe
	818mB7UEtZjT1ZyflvrrEMBFTj6rWCMqfjbI/8R+AGxZ7oQfOExiBVY/nQA7062+GE3TGk0cljP6S
	nUGkxPIfe+TCn8Ix+LoYpNBkcF+OFYR0dOPOx7QnwtmztImWC/kvcXYIAQcFWx7SqVK4UOwqJgZEt
	rW3GhODMmGlQqa7vgo0fMYrBD8GOvGeSzwL96b1BBUDfm4iWXYiBb94pExXqgTKYasJZBCqlj5Qyr
	x+TgNyjWXvxl9q1ORo6+suyL0Hq0Be9PPwDKc5nUJWewhRLpgSdJLK+XgLNJWQVIRChz8GEcp1FgG
	9s7wDmigj4pBmvt0Q4OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxTxE-003XqK-1x;
	Mon, 30 Oct 2023 15:13:24 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxTxC-003XpZ-0Q
	for linux-mtd@lists.infradead.org;
	Mon, 30 Oct 2023 15:13:23 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2739c8862d2so679884a91.1
        for <linux-mtd@lists.infradead.org>; Mon, 30 Oct 2023 08:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698678796; x=1699283596; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTDTF1FXxhrepxV7nTz/zoWDQdhVK3BDaj40w9RlQv0=;
        b=E17UqHVqFBr4RFQMcSNJcQRiZHJZevPNczIyPTM+U8Wn2ua2EJMKTv/K9Yw7QGiYxv
         GL4eJMdNrN/Y5ygtoYyUwvd8wCSN2CzSjRy+E2KXmuC2uaV3atymgDspipDPl5Z+TsIX
         z7cSBZaJfulL+G7jkhL6B4LgjSzbD1MI5xIrs4K6j8Mpey8ClVk+CHbKs3U3uYONBvaE
         995ksXpMAFYP/U2CZQ3+Aa2A5Umqj61K/C2vbfzWpN473hupjNxOgM0mKKTw5izRI+vR
         kp+G42lathcD5d2N8Z8yf5Q/a1yzkQkvGOSibmDEqXWZ1T4zL93zaSyk33GgC8oPBgV4
         Gf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698678796; x=1699283596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTDTF1FXxhrepxV7nTz/zoWDQdhVK3BDaj40w9RlQv0=;
        b=T06VCFJL28VtXW+GqK/k5Z/qK4QLW8AxtnxLLEwobdcH7L55nHmXMNxNWZTcQV3GH4
         kjO8scO+msGOF8h+8k37wODackczV1693glIt+KGzDywK3NUZGR0S8mlUbVcZLAp4WSX
         ZZ0iqgxjWbeaznjfkz1Cp7IfxlIaInNz1slQ38BACTK0iNVvVvtOviBJjQZ/D/xXMdje
         uvs3QiFv9Dh03bfpXeFFVAC5OZohd4FvWRNnJErRf4UzYV3cVNaMshWfzG6du5xxI1VT
         jtt0zM5YY0utm+oF/8lHNsgBOo97nlJUyA+V8ZQ0JTuUBWmaT2OIlIshwxv65wfhEHYV
         /3yg==
X-Gm-Message-State: AOJu0YxC35Kdo0DI8Nq8MkPp4uq7bK4SjeVCsW1ZrbIfPuNRX68qNwzj
	rkumoK82XvaFK8hxQWhUADOUHM0nafmLnBbVFIM=
X-Google-Smtp-Source: AGHT+IEWkRFFQ4tL+rGvX9L3fkJS5E76J/Fs+ttgzyUbz9AoWsGcdIkOJoqPGufXnwL2R62uYctBgKakvPlx3fHjQsg=
X-Received: by 2002:a17:90a:4b4e:b0:280:215e:7aed with SMTP id
 o14-20020a17090a4b4e00b00280215e7aedmr6898857pjl.1.1698678796215; Mon, 30 Oct
 2023 08:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231026112312.3217502-1-festevam@gmail.com> <20231026112312.3217502-2-festevam@gmail.com>
 <82fb8908-f24f-4918-810f-1c83b06ebe08@linaro.org> <CAOMZO5AxBwG_LFNNFVMXVwv2YLd2f_BJD5e+dOUGyOtMWTMvOw@mail.gmail.com>
 <eecb8ddf-eb12-4f86-a2d3-db19718f5705@linaro.org> <CAOMZO5BFO4cgNRv507HpqhSDR+JKL7BcEUTWMeVRpMroqhmCjA@mail.gmail.com>
In-Reply-To: <CAOMZO5BFO4cgNRv507HpqhSDR+JKL7BcEUTWMeVRpMroqhmCjA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 30 Oct 2023 12:13:04 -0300
Message-ID: <CAOMZO5AhzwLewBG2OqRT6H+BKqTPbfr+ZQ5W02Mgyu3uoTfhmA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: micron-st: Add support for mt25qu01g
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: michael@walle.cc, pratyush@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	tkuw584924@gmail.com, Fabio Estevam <festevam@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_081322_165434_6193DECA 
X-CRM114-Status: UNSURE (   6.91  )
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

SGkgVHVkb3IsCgpPbiBGcmksIE9jdCAyNywgMjAyMyBhdCAxMDo1MuKAr0FNIEZhYmlvIEVzdGV2
YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEhlcmUgYXJlIHRoZSBjcm9zcy1kaWUg
cmVzdWx0czoKCkRvIHlvdSBzdGlsbCBoYXZlIGNvbmNlcm5zIGFib3V0IHYyPwoKaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjMxMDI0MTM1ODI2LjI3MjkwODgtMS1mZXN0ZXZh
bUBnbWFpbC5jb20vCgpQbGVhc2Ugbm90ZSB0aGF0IG4yNXEwMCwgbXQyNXFsMDJnLCBuMjVxMDBh
LCBhbmQgbXQyNXF1MDJnIGFyZQpjdXJyZW50bHkgc3VwcG9ydGVkIGFuZCBhcmUgYWxzbyBtdWx0
aS1kaWUgY2hpcHMuCgpJIGp1c3QgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgbXQyNXF1MDFnIGNhbm5v
dCBqb2luIHRoZSBwYXJ0eS4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
