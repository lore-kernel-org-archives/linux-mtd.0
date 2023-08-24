Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4871C7113B
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 07:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEhmIzYPfA4/ih/Hb9gZVlXNw53Vs71m/mnm2aYXH2E=; b=IxBdyiA6UUwtiJ
	FjyOpZvdsfnQNuTirrlrhfQFKU4K4QZ7NAJr7jZbp24nkP4BGMyE0xQsWxx1hVtJwE0Sg1DP/Wt1W
	q597s4jRtGRDK7SozQ8DmoZnEVOcp9IpsvmHYSYqyHCMrwtZ2IiJRfxFVWEyud7i1NtLbQs8Y/rih
	L0xwo6XoKJOhEG13pjbtAXlSktcu6pHFkGZdnvXjwUEFGaGZH6W6ym3DXLp4G5lMDm0ZytVsag4S3
	AD2dk9opdQ7abB0MEfM3PIFvRLuFhmiQOHsgFZo0cl7kd0Zk2FpennNHQ4PAwX59T6+x2GB6B81Io
	ZZgU4JDSeWeDWHEPPAvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ4z7-002ReW-0Z;
	Thu, 24 Aug 2023 07:42:29 +0000
Received: from mail-vs1-f48.google.com ([209.85.217.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ4z2-002RaR-22;
	Thu, 24 Aug 2023 07:42:26 +0000
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-44d5696fad1so1373973137.1;
        Thu, 24 Aug 2023 00:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692862931; x=1693467731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhv4Bg1fdD4fcuHP4DlJnIZ9JdHOfbSov1NYQWp3Ek8=;
        b=asuFLBkQw6HiXVkvIHqjSdPU10B/425cSEszDlfDqt1JAbMZPfruIG5/LCvsByNhuo
         +0/Aacbk8AU42RR4edMR//5HyFC8pBjWetvVWomWh7qZX1+2aYNUG76lbT1HDVlFrfDf
         GGqE5w4DmnKUJy6Q8rKBCOrDf5z/CQabKISEdXxq9UAra4ymBZ8NbTyroBdCIMXb5Hqw
         PWIEQJG6mt9hZ2d5nZRuFoP45nJtCLl7sIqTwKZGEnXCAQx4zqX4hxtEzOjuWl32slcQ
         MQyknf40yNB3khaynnRL3VCAFTNGGtErjvQYd/yYsS1cTj40Fv3w/js6OI2DuWNZoLnO
         HYLg==
X-Gm-Message-State: AOJu0YzkVnzZd7uSfxClMvMeUzFFWEmNwn49qE5UV0Wx0sPkAxlL81Uo
	tq/StA1PY5Y4dZq8NS5zBlIJfyJSZP5+cw==
X-Google-Smtp-Source: AGHT+IGHF0H/J33iGF2zPDW9yZdEU+lqkPPNzXzgfiDncDYN6b8h/V47QqNUHDxpGFx4+CG0O4Wg8g==
X-Received: by 2002:a67:eb92:0:b0:443:8034:be4b with SMTP id e18-20020a67eb92000000b004438034be4bmr7904025vso.35.1692862931187;
        Thu, 24 Aug 2023 00:42:11 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id u80-20020a0deb53000000b00592236855cesm1962650ywe.61.2023.08.24.00.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 00:42:09 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d77f614243aso478614276.0;
        Thu, 24 Aug 2023 00:42:08 -0700 (PDT)
X-Received: by 2002:a25:ae92:0:b0:d3b:e659:5331 with SMTP id
 b18-20020a25ae92000000b00d3be6595331mr14472125ybj.58.1692862928507; Thu, 24
 Aug 2023 00:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230823183749.2609013-1-robh@kernel.org>
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Aug 2023 09:41:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWSrpjUK4Fa9cBiRqsnhh2GxyXK5fCt8B-RmaDgEy6OeA@mail.gmail.com>
Message-ID: <CAMuHMdWSrpjUK4Fa9cBiRqsnhh2GxyXK5fCt8B-RmaDgEy6OeA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@arm.com>, Leo Yan <leo.yan@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Emil Renner Berthing <kernel@esmil.dk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Corey Minyard <minyard@acm.org>, 
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
X-CRM114-CacheID: sfid-20230824_004224_689628_955BC0D9 
X-CRM114-Status: GOOD (  17.03  )
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
bC5vcmc+IHdyb3RlOgo+IENsZWFudXAgYmluZGluZ3MgZHJvcHBpbmcgdGhlIGxhc3QgcmVtYWlu
aW5nIHVubmVlZGVkIHF1b3Rlcy4gV2l0aCB0aGlzLAo+IHRoZSBjaGVjayBmb3IgdGhpcyBjYW4g
YmUgZW5hYmxlZCBpbiB5YW1sbGludC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+Cgo+ICAuLi4vYmluZGluZ3Mvc29jL3JlbmVzYXMvcmVuZXNhcyxyemcy
bC1zeXNjLnlhbWwgICAgIHwgIDQgKystLQoKQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90
cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29u
YWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBo
YWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInBy
b2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
