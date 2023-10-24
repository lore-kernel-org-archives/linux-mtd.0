Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E27C00A8F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 15:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWfUoR9T8Xl0+UcilYjJKZikjZs7YZpHokr87MUPKoY=; b=LqOUtE2nJnajwt
	yA1KKCtbQulab8P9jzRAybdBOCR6ynGTJYYRLGOLHMIgJ2w6nwkFx0G4uxCdzWUT23P+2BHBrkgEV
	XM0OSE87JT+EuJalPz5/ZAMNDCbbYmxnznly/mwPqPoDwBSlFc824mtdpJ3yVsjLYvnNj/kdPNekm
	MGEMYRYNNY9stfX5mawCPNJ49iE8c3Op/wMZiboQwztci/DdefqeeyIbnn+r3cqYtMLW7Bu6e2iN6
	Q/+I2sk1AA8yqufcOH5drIWT/H51CPDkHsjJ4lI+LuSWsN5YCWi1WqQgew/HjPL1GdlSPT2Asb6Ok
	Yq7lWWsKHgfKmRiF2U7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJdc-00ANZY-1D;
	Tue, 24 Oct 2023 15:48:12 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJda-00ANYZ-0e
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 15:48:11 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-27d1433c4ebso1222601a91.0
        for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 08:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698162485; x=1698767285; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnuZe+qPMrCfj6MlheABjOJrQzhnX0izHwnMAQ6Odzo=;
        b=nLfWIMIxV2+SRO16P0nyB+W4KiG498t81H3pn1+we2fRWTcjIovoG1E5WWQoFHTPtB
         D0CfARACN2NcOGxauKaEChRGUm0loA9sYOP55mEulqGxRI80aw97M2Brj+dkxWctD9Xp
         hM7ipHsH0XgBmcYNY1u1jNGcl3w9xrqoGOkuBt/v73RcWVC23agCOYwCT07YesGaEmM2
         5oMKhtRYO1R+pEcAzroIWGmCpr4jQ3oEGTcPPvu0bsd5Czm7uINn9xiM0u27gmupHPnW
         ainQSeCJK/CrYPVsKyLS94jD2QWrVSQZbXsPLmurL+/WaxoOO/NG/7L/UfnTdeAwUv17
         HEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698162485; x=1698767285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnuZe+qPMrCfj6MlheABjOJrQzhnX0izHwnMAQ6Odzo=;
        b=YYO6hu7cXiGAIf4krKU9KRNspLhQDxVds8H902kWGbk29J0X1bVCqMqPEfaNB/4aBL
         BtMS3WACzpPtCEtVSNn3pX1LUn1P06tVrjUbbXAIYCVAhak2M9CCxf/uLhz9Xte3cSnY
         u3kf+u8CLkJkrOoJzmZNR64DJ8j73ng+zdVh11R44ru26jx/kZ6OD6P0mhLaLLa3Ppld
         YLtRJt9WUIXe4GURqFRt7KX8P9N15nBU7udXab6H494LrhR/SGDwyLihcXqnIty/gFx+
         aOkvr7oBfTyOo/LyM1gpriQnSI2ZvWV/NNA6FOEWeUnuULBPmN0T7T88hxwblMZOQhdx
         wV3Q==
X-Gm-Message-State: AOJu0YxjoJyg/86eVPLIPOFGV98sNGyUVEIrlnmj6/3pTReD/umb0STn
	/GuRGMojH2QUehkn2OPBTroZS3GJ9tfZYMtxp+Q=
X-Google-Smtp-Source: AGHT+IHx6FRpn2UnR+8xMuv856Ngru/vs2lq9fmmiliF0K6+aztsepd5ahEivIFTrBaa/sECSI8ZkTxVnVScGAS0msU=
X-Received: by 2002:a17:90b:1d0e:b0:27d:193f:2130 with SMTP id
 on14-20020a17090b1d0e00b0027d193f2130mr14565220pjb.3.1698162485615; Tue, 24
 Oct 2023 08:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231023213800.2599704-1-festevam@gmail.com> <6183891066787b6c24df11e0d601ed26@walle.cc>
 <CAOMZO5BNcFZcLsi+0Qx5zxwTHqzrnUsGgb0AMptAtY4Kj9Apmg@mail.gmail.com> <1ac379836d4e1e3f7bec565ba7c9bc49@walle.cc>
In-Reply-To: <1ac379836d4e1e3f7bec565ba7c9bc49@walle.cc>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Oct 2023 12:47:53 -0300
Message-ID: <CAOMZO5BfEsB2vv__F7kkMo9Q-oHD5PiCmaK-ruU-ds9XabUc4Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
To: Michael Walle <michael@walle.cc>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>, tkuw584924@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_084810_242515_4442209D 
X-CRM114-Status: GOOD (  12.00  )
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

SGkgTWljaGFlbCwKCk9uIFR1ZSwgT2N0IDI0LCAyMDIzIGF0IDEwOjU54oCvQU0gTWljaGFlbCBX
YWxsZSA8bWljaGFlbEB3YWxsZS5jYz4gd3JvdGU6Cgo+IFlvdSdkIG5lZWQgdG8gY2hhbmdlIHRo
ZSBjb3JlIHRvIGFzc3VtZSB0aGVyZSBpcyBubyBjaGlwCj4gZXJhc2Ugc3VwcG9ydCBpZiAibl9k
aWNlID4gMSIuIFNvIGZpcnN0IHN0ZXAgd291bGQgYmUgdGhhdAo+IHlvdXIgU1BJIGZsYXNoIHdp
bGwgc3VjY2Vzc2Z1bGx5IHBhcnNlIHRoZSBTRkRQIGFuZCBzZXQgbl9kaWNlCj4gY29ycmVjdGx5
LiBUaGVuIGFkYXB0IHRoZSBjb3JlIHRvIHNldCBTTk9SX0ZfTk9fT1BfQ0hJUF9FUkFTRQo+IGlm
ICJuX2RpY2UgPiAxIi4KPiBUaGUgZ29hbCBoZXJlIGlzIHRvIGF2b2lkIGFueSBlbnRyeSBpbiBv
dXIgZGF0YWJhc2UgYXQgYWxsIGFuZAo+IHN1cHBvcnQgdGhpcyBmbGFzaCBvdXQgb2YgdGhlIGJv
eCBieSBqdXN0IHBhcnNpbmcgU0ZEUCBjb3JyZWN0bHkuCgpXaGVyZSBpbiBTRkRQIGlzIGxvY2F0
ZWQgdGhlIGluZm9ybWF0aW9uIGFib3V0IHRoZSBudW1iZXIgb2YgZGllcz8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
