Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D37C3DA66
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 21:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0y0/C5RJgB1cypS7MXBimQr9BL8/AYNAgPMCQ+Qtc04=; b=Xrt6vKZGpE66iz
	cZxTT6z+kKivOVu+U6IFbHbCyiJ4Zra59nfp3O4oyc3bjZbBjzlGDb6euOaZdph1Ebvjja7WcPL1s
	w4nVLIGOgJZ/ubuOENxq8+kTS/CYGO6uGFpcSLUizb3wStoylXsQ+1AY9Ju6dYfIUGpTYp1FHiGlX
	SISNqj33ik4Sbsfm14ljNs0EfJNBEVa5OwKBEEqqWIaPNrPyj2548XlH0rr/bdLe/Exb9ejNsT88e
	U9RxRgzXiuWPcofXNdjlftoHfkmpfCTDOIXElpDX/6Z1Ku7kLwTEZ2FugElAnbCo5RPObxeDu5JZm
	MxXd0sNBt8lnkBEqcHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYvDU-001YXv-0P;
	Wed, 23 Aug 2023 21:16:40 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYvDQ-001YWg-1L
	for linux-mtd@lists.infradead.org;
	Wed, 23 Aug 2023 21:16:38 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d650a22abd7so5996338276.3
        for <linux-mtd@lists.infradead.org>; Wed, 23 Aug 2023 14:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692825394; x=1693430194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEpTjrnLVqxen66G7Uvz7Jyy/E11cVlVrjCW6/VyKj8=;
        b=ZDmv2BjJU3fBSftYGcNM3tb+ILU/d9+cLODcLN7bJx5jE0GqvFKrPnlSYGlL0k9kWu
         m0bch7za38IJ+CLWsWjflpljG/O8F9HEsNE/VWjVNStBDOBq3iJDnH2eTLO/dJEAtALA
         zbXY+4ZWcbcUYtwqB7UctSATyz1sDYmgfZ/uZj88iB4dhaAHsNB4lm1XJShf+lSlTUF4
         q1mw8cBg/PsTLqlxfYRQ9OdT1JyBSqfrgsLuehUHu9V36ypWdR+RMX9JIQmW7yxqcnfx
         Bu1+6uVlgAFqvayOjaJa8cEpXa7Hm+cDiofeMeKPmewLASFqzTHTuUzB1cC9zTcv8uzK
         +bQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692825394; x=1693430194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEpTjrnLVqxen66G7Uvz7Jyy/E11cVlVrjCW6/VyKj8=;
        b=mFsHG5KitDw02aSlHewFC73tBh6eo/A/h6Z2tz6dMr0vj77QKP2vMC9OEFuk8BhGDR
         E12XLcgeUIZK0/ek0PgKlAynrtQv27G9ElJeVElsdnGrS+/aKikIGQAhhwCsAYNotOgL
         GpTFviJxJ8wmvu8ubk6Xe0BjpkjQ/h8M4fqtz1LK+9LHJ9miQUKnCb6+1nfGOAIuIOmt
         ikI/AOq1lW5fXuOFf1Wjr5PvavTSCkD4LY1EbPQiQ1OZn8FE45N9THGddqhXWPJ4M7BI
         BH+tG1Xv5WtoFXCHaCYpf6FrMSNLiM89BRa45zQ9UlLyiTyU/yEuw10XLm//36STgItD
         hnkw==
X-Gm-Message-State: AOJu0YzCVVZpRKQIzagxwg2pQKsC/pbQAdQUEVIiWLZq4gUUwUQe8Guq
	aYWHGBzXKY5BSsXjvy2e2TILQzQowX8UCYMmmcKnoA==
X-Google-Smtp-Source: AGHT+IGU5hlAbzjKR6dHf8nG7wjH+gLTIhLdkOAR0BQZYCAzmvxO+0vsobrLpwu8+6G8uJRZXAov+P50unjaO9+ZE7g=
X-Received: by 2002:a25:c08f:0:b0:d09:f39b:cecf with SMTP id
 c137-20020a25c08f000000b00d09f39bcecfmr12862557ybf.9.1692825393910; Wed, 23
 Aug 2023 14:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230823183749.2609013-1-robh@kernel.org>
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Aug 2023 23:16:22 +0200
Message-ID: <CACRpkdbuB-NotnMXc9vZj-byjk7spCSkZ+Dx=R_eOqoSV5CdTA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@arm.com>, Leo Yan <leo.yan@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Emil Renner Berthing <kernel@esmil.dk>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Corey Minyard <minyard@acm.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, M ark Brown <broonie@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Bart Van Assche <bvanassche@acm.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, 
	linux-iio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
	alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_141636_920716_727BE0D0 
X-CRM114-Status: GOOD (  10.16  )
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

T24gV2VkLCBBdWcgMjMsIDIwMjMgYXQgODozOOKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgoKPiBDbGVhbnVwIGJpbmRpbmdzIGRyb3BwaW5nIHRoZSBsYXN0IHJlbWFp
bmluZyB1bm5lZWRlZCBxdW90ZXMuIFdpdGggdGhpcywKPiB0aGUgY2hlY2sgZm9yIHRoaXMgY2Fu
IGJlIGVuYWJsZWQgaW4geWFtbGxpbnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
