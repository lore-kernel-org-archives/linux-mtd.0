Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B829DC43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 07:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWqaQo85O1tIBIatNPiKEOJOMjfvkZ3QvYzJGUOse8A=; b=ySxE579pAphV4v
	9QxDQ7FsO7oA29pSsmNPVzVrz543JiuoNkHpRVu66DF8qzTasMCv569VMtOgTzBGqTli6KQ1/T5Uw
	VsYdR0HlH6IKsyhdvhnEFDgEgUr2MxMBLr2Er9IEc/cjowN2MOXzDy8DeI5uwSqSEKtMFp/rmTYvr
	39/IJ0d4emP3BvdA6niuVIuNbtEwK9X0ER0IZ+WTHj/0mA7xxqpPgm1jx8uuDhV4A5s2+3SXUaLT+
	CTl2mEXNKEuXB4KZz2rxLknJdGvr3lIOAtJOx4YXGeNYlWU7JNlCQcTtWFdPZ+Ptf2QSFzMjG8807
	peQUPy47Kk01F0ZM2Ccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTPD-005MpJ-Sv; Tue, 07 Jun 2022 07:13:35 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTOG-005MLo-UG
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 07:12:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id r123-20020a1c2b81000000b0039c1439c33cso8983129wmr.5
        for <linux-mtd@lists.infradead.org>; Tue, 07 Jun 2022 00:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=hV9ibKa+5FNAjQgy5QNiMgxjWN0tLjtbBZr6sMB8+Q8=;
        b=zvk7iA/34h/WCj5IyLEzFyarVpBveV+Ub4CzbBtdV7qFdQFCeBaBVp1VyjjmZfZ06M
         PbeRy2dP5bbH0dZRJUpHdmRTPoO3RzyEZNMmRdyhOFIXO6wsci8zXehtX2EKqFRk94Sz
         yGLX4rOgtCxD9W3RPr8Fw5CHA/8Inl6ERNabJW9gKsmrbDYVCL78/DG/CXz76EBS4Xmj
         3hQ3Uf6GckYlGgHHDLzfxVy1U9elpvnYxH7FnzFhKuWRR2jYqMmqHMMheB+LHviI7YUN
         MyNkrXn9Qu+mBs7z2/YWm23lEqtem7Iqk+n3hZNYnSaky9CX5WiL62yeReaMwEDvARUo
         VVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=hV9ibKa+5FNAjQgy5QNiMgxjWN0tLjtbBZr6sMB8+Q8=;
        b=yfJSHdv8hcmGEAiXv5LtA2dItjbNxBkSKKWgnJLDkN5J9yXxgG5Sp49xBtSVOfW4eb
         DZ5L5VrRw/qrWP4Uj9v+QP66OhcBg7VN5p15MiwiF41UnUXLXoo8N2VF76RpofyBtiDf
         QzmlZ4nGoGhIPQWs9lqxRaLKi4YEBceTl3Obh2XiRUi/mgw1zOJ2bkk6mHXb2TnUVDQb
         V7QZLja4W+bWQqTPRxL8OH3fK/dl85pBn+q81MChPh742a6ry3ggjA/dhQE2JX5NUQxq
         fKpbm2dVjt/jPU9YX0OL4qbTHOdVOSMz3y676ec0IKpF1uT6S05yKzX5lAUt8O5xaEGA
         rk0g==
X-Gm-Message-State: AOAM533CNdk/nq/m5gQL4Dd8SrvLJVgv7isAORRjEW9AsnamegU7Ygzn
	E9NjncPOurW+xqSbE4xor4WwaQ==
X-Google-Smtp-Source: ABdhPJzlssNl6pDyIvExhHNcmbJ/WP0P23bmwp4ZRY1qET14Oc7c06VwNQoOLjo6L5f2tNzIkvpUkw==
X-Received: by 2002:a05:600c:3513:b0:39c:2a32:37a6 with SMTP id h19-20020a05600c351300b0039c2a3237a6mr25770455wmq.161.1654585953165;
        Tue, 07 Jun 2022 00:12:33 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:87c5:1f51:1550:2ebc? ([2001:861:44c0:66c0:87c5:1f51:1550:2ebc])
        by smtp.gmail.com with ESMTPSA id h4-20020adffd44000000b002102d4ed579sm17017696wrs.39.2022.06.07.00.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 00:12:32 -0700 (PDT)
Message-ID: <791b3e4e-7348-997a-0ead-136739ec10bf@baylibre.com>
Date: Tue, 7 Jun 2022 09:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 5/5] mtd: rawnand: meson: not support legacy clock
Content-Language: en-US
To: Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, XianWei Zhao
 <xianwei.zhao@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui Yu
 <yonghui.yu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220607064731.13367-1-liang.yang@amlogic.com>
 <20220607064731.13367-6-liang.yang@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220607064731.13367-6-liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_001237_049896_736C613C 
X-CRM114-Status: GOOD (  16.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 07/06/2022 08:47, Liang Yang wrote:
> meson NFC driver use common clock interfaces. so the test robot report
> some errors once using the legacy clock with HAVE_LEGACY_CLK on.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> ---
>   drivers/mtd/nand/raw/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index 67b7cb67c030..5169412a4af4 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -395,7 +395,7 @@ config MTD_NAND_STM32_FMC2
>   
>   config MTD_NAND_MESON
>   	tristate "Support for NAND controller on Amlogic's Meson SoCs"
> -	depends on ARCH_MESON || COMPILE_TEST
> +	depends on ARCH_MESON || COMPILE_TEST || !HAVE_LEGACY_CLK

I think depending on CCF would be better than excluding legacy clock.

>   	select MFD_SYSCON
>   	help
>   	  Enables support for NAND controller on Amlogic's Meson SoCs.

Neil

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
