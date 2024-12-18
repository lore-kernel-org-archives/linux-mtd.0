Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909BEE77187
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 14:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNn0aCau1U5D/cEDoMVAhi3HLx8fPDth9KWuF+/YvGg=; b=AG/NV6xC6S7KyD
	upa8l4rbbccoufIkPko/eRfB9YMvSevWG5yhuFmY1CfCG288wYVlwujvvp0d91mbKcmzhx1amGPOP
	j2f3iJvgVo0f4YMZnwc2cb03uUqhF4cXtKFFDE+mSQZ5j7vnihEkQQ96ON8Cf9KFDS3/AsHVayRLv
	MD/yedFtx0ETqOSTjLE8uche2UajKZRWvPCfurR94tESnSY8OQfdNZQSAeMbx0LWbAmm1AROAkoAw
	7+a2z2yDLDbdUb04s5mzUMDSwKygMu2KHf0hv1cNzWwhrurGLyzm5HCO7mUg2+0VOikmKyjgrDXGe
	2z9UDWjcTedo5jUH2Mew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNv5M-0000000Gr76-1f8X;
	Wed, 18 Dec 2024 14:31:36 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNv5J-0000000Gr6h-3Ryw
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 14:31:34 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso43978335e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 06:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734532292; x=1735137092; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VzstG4O7LyDBQ1I/671gtiXDyXSPDz83xDQKTsRhJms=;
        b=oiktJOw/EEG37Hr8yUiMXv0i12vLgSNaf/Fim5YANIIjJSl19kfp6I+ccuYvaQ8hcq
         5UJOKRzH1mSLPUosaxI7ZCgGUcBIzEvWKnfXq3hzlLnuoI35CwzO7N3zVjyQinHKl6Mp
         lEUJlSIPhD41rQTxtQWwx5o7EOy6Wu1pIH+JR/04rnXeNRtHj0XUXDBzs7L0aAGkiifL
         mFTjZb90VJAbSXTgQihZyofAnxctFKvlx5N2D4Pbav1rOVEB8ooay31gOzUGDpnzAN/l
         A0T6JK+A8SKx3xhSn7iaOn7CesAe4K1OtejJi+MC32GOrDO/vtsQXHibQpUwzfPu9a5f
         Hy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734532292; x=1735137092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VzstG4O7LyDBQ1I/671gtiXDyXSPDz83xDQKTsRhJms=;
        b=uIl/+y+bt/JXr9x/C3vk1TAGX742eFi0oEAWgpV0yuPpyo2i/hjEBa1vFfWxq4Vuo6
         022Hl62HGtIwodGZINFodiZZyHrQtK4Ixh6csQ1lXfR3eCL4y/bQKWBcY5H1sTFnDQEF
         kA84exJOgWQwKPV2PKZTy+HD8WdGSCfH/wNZ2a55ln1VdDP2DjEi8tH5OlZGUehbNkYf
         Mao88PcNLOxF8BxD9ruSBLk+tD/PDdT6hhi7Zm+7tp+EkwQh6Y0Yn/y/eyq3zRqyeP+j
         Xiw3eLs8Bc/5LMHRpVdyC+OZv/GYQLYPJPcU61vsLcaO61PSsLb1V9GInxj7Y4KikwCW
         g92A==
X-Gm-Message-State: AOJu0Yw7olQloh3Y1k9h72VmPDTBxMgXfPMOFMCEfCW6hQZO+5ydY3nh
	Vr0PUfa13fEdmt7a5YFXG91ik+ixGD1mvYtV5Kq0bn2hKBj5y6yU/bbXWE6w8c0=
X-Gm-Gg: ASbGnctpgHCrRqXjFzFvq8iP9mvQ5/AcSSa/Y+vQOZZgz/HIgwxOJIjcVUlUYx8F4dp
	cl8TO9I++SEww7gPQvQcuzUwoaEsqMU+djtErnBFqyJFfQdaeB9GC4hphHGX+56fESYQBZCZj8D
	IMjKpEX8uC/FIcTDjCDxKOu9Cympl13JZfS77mhH1f2Rn9jHwCmJ/YeDR3rO0rv0tSY3nlyb0+v
	uBJOEYv0GcwywQEkhe5IugkvqoktJoSuk7DRMsY7pz2V6EHZYr8HTj5UyonT2ZL
X-Google-Smtp-Source: AGHT+IFn5cmTzthX289xG9LxpQ0BMRIPXN/IzooSU7rf003ntrJdRvueDE0wIgEBtCGtgvJJF9HRZA==
X-Received: by 2002:a05:6000:1541:b0:385:e0ea:d4ef with SMTP id ffacd0b85a97d-388e4db930cmr2422905f8f.58.1734532291893;
        Wed, 18 Dec 2024 06:31:31 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801ace1sm14264121f8f.60.2024.12.18.06.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 06:31:31 -0800 (PST)
Message-ID: <7b656aba-cd7c-46f3-a299-75ef987150a8@linaro.org>
Date: Wed, 18 Dec 2024 14:31:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: add missing flash_info.size
 field for gd25q256.
To: Renjun Wang <renjunw0@foxmail.com>, pratyush@kernel.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <tencent_1FA1D9D85AD8E448F1B5F349EB5B9230EC06@qq.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <tencent_1FA1D9D85AD8E448F1B5F349EB5B9230EC06@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_063133_866696_CD845FD7 
X-CRM114-Status: UNSURE (   5.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 12/18/24 2:27 PM, Renjun Wang wrote:
> The flash_info.size field be used in spi_nor_init_default_params()
> which assigned to spi_nor_flash_parameter.size as default value.

see spi_nor_needs_sfdp().

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
