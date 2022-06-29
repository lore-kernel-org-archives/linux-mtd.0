Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB0BC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 17:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l84ZBASgxh+HQloLEGPtmFWFbUGmwtAnkhRjK5BvF6A=; b=SeLu7QzctiqsOv
	NwviqUr/S5vPsNvoApUtXdMDIbrZPwxTU9w2RyRDE92dh/zLPHpYZd14ZVo4SqD9eTpaUnUQGeoAZ
	K/M+UMFwgKUo6h9rJM8orKCI6RwslEVSFDdxHijneLwQpawpdx6C52LcyBMU4Dsm2IX15Ae8w0+XF
	wl5ZjP2rUo5Hbv1kCI/0booUhtxWEW+/YVl5Xg7tiv87O1edQpu9LduaOH/75O+kxBlzIQAVE1NWR
	DSfPSFFRV4FTzvb9IGkQx1ErrPIuZJGDvtvbPLr62kZtx4mRovggaQ30ZC6tdVNrA3XmfFX1MLa3d
	2SGkTa2wxmkz0tXe1ILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6bjf-00DEP7-Tc; Wed, 29 Jun 2022 17:44:19 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6bjd-00DEMZ-Ja
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 17:44:18 +0000
Received: by mail-ed1-x52a.google.com with SMTP id z41so4671857ede.1
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 10:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tVekIMrtplwlYMH10GYN3NLEVF7rPzw2Ll0nVajDUj0=;
        b=w9vxn/UmjXGR/AxVPDa1AWAET4ZJSi/d7RKxJWbXb7NdzNnJmBooZ3j04DTGg2aRmv
         tLPrXK0sXmcc+VPM9SnLizG97ehS7Wgm5m2GgA5Y/E4F+mSUJXnfqgUkhNW1qbd9Vbuk
         3Ku48VOLtWJW7RyymLVXW+QViJ949T9Cpv5uNHg8Ii5/eClbUPoeb/EK4c4PddVjOiOc
         lmCz+tWzOphiK7etLDCgy2KJd1B0za2hnkJ1Uis67labgAnMFEuqxFukByyYRGGnZeI/
         EZx8HDGnCJdPxUiYOf3z4h9gyfvL/maNLCyHKmpGAIbAO0fCEmF0pKDKQjKy6BtB7Hlb
         aNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tVekIMrtplwlYMH10GYN3NLEVF7rPzw2Ll0nVajDUj0=;
        b=FjB5W7Z86vA/ERERnZ0DrBY+Na1lHLE1zjIb+rtT2rkga1klrQq1hkQ2ue+8PGJDGN
         ZFVBgp/HSMhY83MjOYTWCHED3ESwy/OO0fA5eMDx12W4EIDv2pD1FHtD1gIQiz97BcGb
         UiqcRovspm6YCcDn0loTNXPgBRku7E9smD94a06hfkMCKnZ0YIGhFTOlrCgIq+kh5OEC
         BVm8RCSncDOAHgy+hBL8tX5Ag4D31lPtD1/4BRjHJRd+zzk/HFpivTLhwPE6dOT3s6aw
         g9zs+nosX2zNF6XOmufMu+3wWqO9b8PiYgU8OuhTXx8tqkHZld6U1+U81qS3ok4oiN+X
         K4Uw==
X-Gm-Message-State: AJIora8cvS3SyUf05uE5KUS4ExpgtclZVJ+Df2bL2y/KRx3jXOJ+Qh01
	IlAt+XpyLJpabjWzaommXVlJBw==
X-Google-Smtp-Source: AGRyM1ua6BwpBragxQEeeAoYqEOJa4FdY4s48iFIdywyOYpjX3jiRhNVEbP0A5P0HdINP+n6ybuMGw==
X-Received: by 2002:a05:6402:847:b0:437:62bd:bbc0 with SMTP id b7-20020a056402084700b0043762bdbbc0mr5713257edz.285.1656524653206;
        Wed, 29 Jun 2022 10:44:13 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j12-20020a1709062a0c00b00722e1bca239sm8074199eje.204.2022.06.29.10.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 10:44:12 -0700 (PDT)
Message-ID: <c65d6a94-b5c2-e2e4-6fdb-b7982d291e01@linaro.org>
Date: Wed, 29 Jun 2022 19:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/7] memory: renesas-rpc-if: Move resource acquisition to
 .probe()
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1656341824.git.geert+renesas@glider.be>
 <2fd9b9e3f60fe555d9dcad499c90e3ec869aa96e.1656341824.git.geert+renesas@glider.be>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2fd9b9e3f60fe555d9dcad499c90e3ec869aa96e.1656341824.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_104417_690133_B91673D5 
X-CRM114-Status: GOOD (  12.14  )
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

On 27/06/2022 17:31, Geert Uytterhoeven wrote:
> While the acquired resources are tied to the lifetime of the RPC-IF core
> device (through the use of managed resource functions), the actual
> resource acquisition is triggered from the HyperBus and SPI child
> drivers.  Due to this mismatch, unbinding and rebinding the child
> drivers manually fails with -EBUSY:
> 
>     # echo rpc-if-hyperflash > /sys/bus/platform/drivers/rpc-if-hyperflash/unbind
>     # echo rpc-if-hyperflash > /sys/bus/platform/drivers/rpc-if-hyperflash/bind
>     rpc-if ee200000.spi: can't request region for resource [mem 0xee200000-0xee2001ff]
>     rpc-if-hyperflash: probe of rpc-if-hyperflash failed with error -16
> 
> Fix this by moving all resource acquisition to the core driver's probe
> routine.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This looks like a fix, so how about putting it as first in the series,
so backporting is easy/automatic? Plus a fixes tag?

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
