Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD91C32750
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 08:44:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DCC820679
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 08:44:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="elcjAUgM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJtewxdP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DCC820679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amsat.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0C53NSZ1vjwrs0tbsGoizeGY/5cGV5x5Ze7VYmw0eQ=; b=elcjAUgMp2QycS
	K3rZ0dkLFFeTraPxXFVHG73y03BU/rNMqorunKWRjgkcE0mbZ4iOiKgMr69KSu4vQJBX2bOgXN2J7
	93s2Ui+b8cjfoV5OpH4hg7251391nSpcjmR5KndaSqCypts0c5RraYYHeSu2z05CdFFaE0Kwt+Aa5
	jmEhbzuUCrGuT44rsPyAuQZgJXfXCJMDLdhmCDTXNZa51/eX2KbAoPf7GJgDa0fcgUN9Nr/kQkhvI
	4qxVZkoCi+W3MA1VwxS7NVh1MRSQt8FwRttZ/j9n3V16LfAmNTeBhQIW0MBqZJPIcKRFMuI7TK2yK
	8F1HB61g6wCVDVTYvxtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxSQ2-0008Se-R0; Tue, 13 Aug 2019 08:44:38 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxSPz-0008RP-2r
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2019 08:44:37 +0000
Received: by mail-wr1-x441.google.com with SMTP id 31so107005972wrm.1
 for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2019 01:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:openpgp:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SDJwnQjuv8+cFv70gCeD4pPzDeWrNoPVh3U04PT4UTo=;
 b=fJtewxdPG91j4ntA6IRwYWaehG/C7ZE1FeBUd+Yf8PiTqWCE2rhuklmiys/EBFkqtX
 UqVrHjsFgRF88ZLDIxUk/PtD8H7MfvWr6RdgPNBa2i/lky+2NeHlvfriIinGYsgEt588
 eypIYoXICelKldnhDzyEy7o9xnhErO0tlhl+sY2DM24LHAkI/3Y0yYvurZP+fb6ZwRLq
 xpYDqMaw37Sa4I4ikaPkNuh7dD+Rv6OpRWPO0T8Jcc+lu9jo80gfzkLQjoseIxIURVNt
 19KxsxM3vXIu5ge12T8A+3/8etiRG2Mux4y6Gw66OTRwTsxgjc648d/VYitBFBZd45T+
 GLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SDJwnQjuv8+cFv70gCeD4pPzDeWrNoPVh3U04PT4UTo=;
 b=mFA76fYHoWEuc5kglrHDbvb4u/ApOoVxiltTf19NZic2POj7d3jvtXSH52Tbp6Ch/B
 u1MqbzlyFMVPk8hL8iuMdz2iFgF+n9jVEdXtW+tJDSoWdt30gSRvxCZxliJEAVOK37fi
 yWqU312pxNm5cc8TTZjELbVuD3QgmyjT/lS1QInhXTIgqUHFyPOPtDDviArzT5BfaHS8
 7dPErBye9uGLsvECTW0OPs6HEj7GT+gP2dGwp23SUwjBaA5OsJjexNbOOUa5BU+T1ByW
 TFBgH0OajgKI49hJN+RhSld8JHl77vdcJFO3tOsI01r46P+JBJ+H5EA6neFbsZYkbDYw
 7vXg==
X-Gm-Message-State: APjAAAUn/XDYStpYa8jJSlaovq3RrRQYq5l3IOiy1s0izTjQmA/2yrhi
 mfi9CN9ZJaPRB6r3B4kGTXRg1W73
X-Google-Smtp-Source: APXvYqyh5cs0zBfsrQ9/9b4GlmZJ4f1O1rnDXbQI6CpyecdaWis32Z7KfISDGKCOzITPkf4SiQ85Zg==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr37133406wrl.331.1565685873196; 
 Tue, 13 Aug 2019 01:44:33 -0700 (PDT)
Received: from [192.168.1.35] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id k124sm1896121wmk.47.2019.08.13.01.44.31
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 01:44:32 -0700 (PDT)
Subject: Re: [PATCH 10/11] mfd: Drop obsolete JZ4740 driver
To: Lee Jones <lee.jones@linaro.org>, Paul Cercueil <paul@crapouillou.net>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-11-paul@crapouillou.net> <20190812081640.GA26727@dell>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <4b48e597-951e-45fd-dfb2-4a1292a8b067@amsat.org>
Date: Tue, 13 Aug 2019 10:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190812081640.GA26727@dell>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_014435_153671_D8CEA73A 
X-CRM114-Status: GOOD (  14.61  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, od@zcrc.me, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Lee,

On 8/12/19 10:16 AM, Lee Jones wrote:
> On Thu, 25 Jul 2019, Paul Cercueil wrote:
> 
>> It has been replaced with the ingenic-iio driver for the ADC.
>>
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> Tested-by: Artur Rojek <contact@artur-rojek.eu>
>> ---
>>  drivers/mfd/Kconfig      |   9 --
>>  drivers/mfd/Makefile     |   1 -
>>  drivers/mfd/jz4740-adc.c | 324 ---------------------------------------
>>  3 files changed, 334 deletions(-)
>>  delete mode 100644 drivers/mfd/jz4740-adc.c
> 
> Applied, thanks.

It seems the replacement is done in "MIPS: qi_lb60: Migrate to
devicetree" which is not yet merged.

Probably easier if this patch goes thru the MIPS tree as part of the
"JZ4740 SoC cleanup" series.

Regards,

Phil.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
