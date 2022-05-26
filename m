Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E67FC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 26 May 2022 16:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SK0TbGSL+wcY1xuHOn0k6b5AmngGFLE9y5p4dKIFwvU=; b=iIYoxZlam3FRW4
	EUOpo/avEcxMVr8qylznHayb/jvsn2g0oMVG7wQTTqWkQNfsHKU1TRpDLWKzkXEDRAs5iYl1juYrw
	IftxHLuVbdyf20cnHHIChTNDjePwikcAuI9tRkK07EBY1jImiM9sB63q5WTFp/4+ILJsiX1lciJ8Z
	GIxHI86wqENGfmAOh7AydYJ6mOWcy7Czkg92S32hd017USk2MD82vhrEkyxhfZUTwag8IgZ1jzDdV
	wIFh+Rjcm/mGmN75zfoe9WqIvaXjxQoMC3phVFHb2313VglzFFvXZrqnsSKDjxKEG5E83cz383wNt
	tq0gg6IUkmaG1drIaYIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuGM4-00FPDb-I6; Thu, 26 May 2022 16:28:56 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuGM1-00FPBY-Ct
	for linux-mtd@lists.infradead.org; Thu, 26 May 2022 16:28:54 +0000
Received: by mail-pf1-x430.google.com with SMTP id b135so2072954pfb.12
        for <linux-mtd@lists.infradead.org>; Thu, 26 May 2022 09:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=ZV2y77FSAdklT7BKF+Tws43T4buN/hfHfm1U5B1OUTY=;
        b=2l+TLfCq3eeZ8fnL4KvNPyIePz/kfWJ3xDqUw9rjbwjbepocHIx4xOokRfKmQZXcjq
         sB5yKd3QPZI5WpbmUONnogFtTwkfTufAtkNQonFhta858pKIj2mrLBfwaThv1XLZ5qUw
         HKIfY772DkudNhL4y/3qsv/BKNLOeELnYiOseGovKA4UxOyeMFRh4NyVQGIC8uqaGZim
         9DhOn5r6/7Sk/fsjJsyGjQPLb6Cq8vkxTNiyMwYleEyaUXMu9ZHZuHnsnYj9aY4063pL
         anmx7dkc0QrcCB3o/tKUCMuIy3+/gM0QRdQoNMrZ6w6nZ8SVa+ajkscjDC/GqA7XbnmK
         m6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=ZV2y77FSAdklT7BKF+Tws43T4buN/hfHfm1U5B1OUTY=;
        b=rY/04x974P5BTaWBwpk2wXV6ak0ir/cOwIU1T/QStPcAHPvqOqCW6DsRKRGc6p77Dj
         wDAjwYN9/ExO4DNJGRm2KZRl9b0nQaTiwSSCtVdZHG3zz9AfEH0WBf54tHeJPd9ACRPZ
         6sW0FvrNApBxfEMlD9i46HW9KNVVVWedoaRCuihNQozXR6eVFfgZGJYnFYkp5lTTlRiz
         uZTlq9tjpKlh0RsI6ucW5RkYMqkWaBORi/jLvv7XRAls8HWFF2Wht3MmOOqm9d736dVw
         s4YT6UuR5PcIpIoIQwUoF7/qxK0t0NV4OxO74+1MLcq4oWImQIyIYIgBGiDT6gaqXnoM
         8wdA==
X-Gm-Message-State: AOAM530rKnPWJM1KlfNrLngtefc6uDbQQObx5/QtH3tgz6L98XZ5WyQU
	zK69fRb4vdToKYeUr6uDyOVM6w==
X-Google-Smtp-Source: ABdhPJzsd/UhDYfCsKi9Q0HQ1PX++LTeTnaX8uCbHKcHAw1xfbhM6zfM0BCJpYZwUgFFGZu7q+LWNw==
X-Received: by 2002:a05:6a00:15c2:b0:518:9911:4952 with SMTP id o2-20020a056a0015c200b0051899114952mr22033146pfu.64.1653582530334;
        Thu, 26 May 2022 09:28:50 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id z12-20020aa785cc000000b0050dc762818bsm1714033pfn.101.2022.05.26.09.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 09:28:49 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: Liang Yang <liang.yang@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, XianWei
 Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui
 Yu <yonghui.yu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] mtd: rawnand: meson: fix the clock
In-Reply-To: <20220513123404.48513-3-liang.yang@amlogic.com>
References: <20220513123404.48513-1-liang.yang@amlogic.com>
 <20220513123404.48513-3-liang.yang@amlogic.com>
Date: Thu, 26 May 2022 09:28:49 -0700
Message-ID: <7hwne88dha.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_092853_487052_C557E769 
X-CRM114-Status: GOOD (  12.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Liang,

Liang Yang <liang.yang@amlogic.com> writes:

> EMMC and NAND have the same clock control register named 'SD_EMMC_CLOCK'
> which is defined in EMMC port internally. bit0~5 of 'SD_EMMC_CLOCK' is
> the divider and bit6~7 is the mux for fix pll and xtal. At the beginning,
> a common MMC and NAND sub-clock was discussed and planed to be implemented
> as NFC clock provider, but now this series of patches of a common MMC and
> NAND sub-clock are never being accepted.  the reasons for giving up are:
> 1. EMMC and NAND, which are mutually exclusive anyway
> 2. coupling the EMMC and NAND.
> 3. it seems that a common MMC and NAND sub-clock is over engineered.
> and let us see the link fot more information:
> https://lore.kernel.org/all/20220121074508.42168-5-liang.yang@amlogic.com
> so The meson nfc can't work now, let us rework the clock.
>
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Thank you for your persistence in working on multiple iterations of this
until we came to a final agreement.

Kevin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
