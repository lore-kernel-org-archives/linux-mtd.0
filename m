Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079BFCCA476
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Oct 2025 10:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gG9/4SPYv9G/Cru611USWdn9nsFVk3AHyvB87qie+IQ=; b=lASsxILhbpcksV
	21W09RK+iqGUQzxrczkzcb3u3vh2YeYzA0Yih0q6Auw4OfIgCmqB5xvGel0XsSisJ8i0jdZACXGYY
	zYZhS560tMY9+0SC9yty0jo2urV7RKq0KGs0wKBO8XLkXbx9h+xwChuejM8WPpqa/Hn3+PUwznB94
	5EcM1UMx4Zm2v1OrvGogNZdQPsWmebNqIBnvDszD7xzEgUZsajCAExvPyGyn3z+qw1UZG8Ee9h2F9
	tM2NO5ZPUdYsyMGi2/joG86gON3rwppKfevF2NXU4ePs4Xx5wugJWf8uCAcP5UIKKgx/AlfoBwyqC
	ZkA6C3wvn6GvruKhYr2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Wi6-0000000A1iq-0d2h;
	Sat, 11 Oct 2025 10:20:22 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Wi2-0000000A1iA-4Bd8
	for linux-mtd@lists.infradead.org;
	Sat, 11 Oct 2025 10:20:20 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-afcb78ead12so448244966b.1
        for <linux-mtd@lists.infradead.org>; Sat, 11 Oct 2025 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760178017; x=1760782817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kH6m3q9Go+WlNJw/7g8dG1h/aaEJpSAxzZprEUvs9Nc=;
        b=PMIdiWh4D/Xoamtjog82BbmuFpeIP/Cr6SjngkyvVFju5tm9zFVLYBjATysxkYegzl
         2unMkp7p39PlnIIjlPgDxOnf1ixTKg6MBm/F3pXeUjZBiwKl4evl6JiEY4VSTqmbkB4Z
         lHKq+mk9A4q+avZeG4ync+gKxkeJgFMzUykbRsrRqqjfj/xuJJx4bmByo7MaJXlrC6Aj
         nY6t/RmEB7FN57aaUWL4thuCtXo+Tjy7OLYz8cpGPMA6Q2/cLqcnZlult4H79tzq34ZS
         x32tON/LpR7+fdzIgWg1gfHAF3x/6aT2HsyQRG8cZJHUfTUQB+enXFbiyDH+WVAvaXQd
         o+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760178017; x=1760782817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kH6m3q9Go+WlNJw/7g8dG1h/aaEJpSAxzZprEUvs9Nc=;
        b=CtRVbAbX3jb3QJ8mVYaK5UwfErzRtqoPmcMeJScY7E7BhTpbMaDSE7gdIVkTXlQLJ1
         187JcPF49srejeq5x3+avmVXn1zTApAXm/Ik53xu2Zt+u56QBUZuiH89oAzhPAgDBXu8
         bHHAIns6KvbPrk/f+UblK9x39wI2c6145+oXI4FRzuxtJdrqRjiLCJaZsdVRjInvyiPX
         IcmxCrNoTFfnsCY8P0gIViXVe+lUpXb9c3WP7fDwrkErLzhjUt2aZ0YQKpKVka3oMTVe
         +/aJEf2tZmlj0dQ7jM8Ryk5Oi+NJnhyNYJU0ocl1LrH5UOXCrJLzRJ7fSErkbrTfLZfE
         lWdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUswIDf6Pc3Uk3Y3sF6wxd9mjUGb+x+3BuNqwmG9Y/RAMPrxH6YQ492dMF1hRM+BhU6daJZkmjl1oM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr6WyPqUlFBU03XRdQjZuirFhWhFASUYyzm19g39xFI3WT9sEt
	R+NmRVCo5gFhmPVHr2NRJBkENjOtO6+oMRuKwSJyoF+EytInJf1dwsiQqgqMSg==
X-Gm-Gg: ASbGncvzEQD08XjM/ju9hLxRz0WPy2kZuA8bVPsOr1dpQHRBj+2S5MSYlJCmsppGV+2
	fyGrHN6a/XZtezMIy+UIMhj2QoCsNW7j5to5U/5+UG1BLT8WX976+mt38ARPfH2pGbqEKJ666xo
	HaMotXFpvHhYVn56sPWRUv+IqN1MkTNaNRatnwuOjuY4TwehCEfSJ1dzaoDdYS/dccuQznLz4E8
	e3h0nFkFsTYvbmyyA/DHzZH4wTEsOrYveK9/EmYaKDpCKlsdEra17WnMid7Cxvi61yzxQdKWTXU
	3W1NQj77ZDK8kN79N0EB4YaG7ew0jS90hXDRriqKmcpoz1KeQOojOOxgqJ1p7wCacyJo9q4xNIu
	aHRmCmIVa9t8+f04ktUrNmi1g+3PhO+nPmXrajMJ0IJsNZ14GQLbbri6NHFEQKQA=
X-Google-Smtp-Source: AGHT+IHolFmrbsPL01Gij9mDgcL6wtIFQuNZ62CxZG1hurbWV+WEoYmcgYDEtNQjTwVOdmXwqzHL9A==
X-Received: by 2002:a17:907:6d25:b0:b40:52:19c2 with SMTP id a640c23a62f3a-b50aaa9c937mr1500673066b.20.1760178016637;
        Sat, 11 Oct 2025 03:20:16 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12a8esm454077866b.42.2025.10.11.03.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 03:20:16 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 01/15] mtd: rawnand: sunxi: Remove superfluous register readings
Date: Sat, 11 Oct 2025 12:15:03 +0200
Message-ID: <12756386.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20251010084042.341224-2-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-2-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_032019_049570_9E711118 
X-CRM114-Status: UNSURE (   6.63  )
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

RG5lIHBldGVrLCAxMC4gb2t0b2JlciAyMDI1IG9iIDEwOjQwOjI4IFNyZWRuamVldnJvcHNraSBw
b2xldG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPiBUaGUgcmVnaXN0ZXIg
TkZDX1JFR19FQ0NfQ1RMIHdhcyByZWFkIHR3aWNlIGFuZCB0aGUgcmVzdWx0IHdhcyBub3QgdXNl
ZCwKPiB0aGVuIGEgdGhpcmQgdGltZSB3aXRoIGEgbWFzayBhcHBsaWVkLgo+IFJlbW92aW5nIHRo
b3NlIGNhbGxzIGRpZG4ndCBjaGFuZ2UgdGhlIGJlaGF2aW9yLgo+IAo+IFRlc3RlZCBvbiBINjE2
IFNvQywgc2NyYW1ibGluZyBlbmFibGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgR2Vu
b3VkIDxyaWNoYXJkLmdlbm91ZEBib290bGluLmNvbT4KClJldmlld2VkLWJ5OiBKZXJuZWogU2ty
YWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
