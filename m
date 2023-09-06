Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52962EB8FAF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 07:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2IotbFXCzrqeeVRdb0GbP04+VGNiDlTCh/3p+ctI8vY=; b=Yk8+rZlSeGc/76
	FEeyfoS2wwdC/VdaWNHdlGwL1q9auqqVzkhZFRRaRbwrX6lpr4ID64ZD36gvA74l1XECppyrawClm
	prj9D0deefmcVsSqC+QHUpxh3tAKIRS/IfMhsq01+pK/UxZxYDVrGJ6nmlLCr59N2GhFXxmBgD1qv
	DzPz62JZ7D42zdc/Mdud7aQ5y1kh+TZs8Cj6vxtW/XuWlztibQefNHJtGrj1tK5g+Xps3QKhXXndC
	smXJyXZUAcv2awYjklhO5inQcUBpMiS8Qr10yEHQeHULYLSJ1j3xtcPKPlNTp+RaI8ygjtSTkbb7G
	4ZEWlKx0UPEUMHkz180w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdnC5-007YDg-1W;
	Wed, 06 Sep 2023 07:43:21 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdnC1-007YCa-2h
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 07:43:19 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9a645e54806so443712766b.0
        for <linux-mtd@lists.infradead.org>; Wed, 06 Sep 2023 00:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693986196; x=1694590996; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7c2BDsoYBazb4ISVLs01WogwNBRf2oRcEB6Brsaem24=;
        b=O3WUbT5fcfEj7eDLYTezlL43F8XMqqPnFeKaODxmDMqR+KrYAw7ehb595Kt5OrobNR
         VJgcZTIx95+kXIIgVX/qZT+yl4I9onzi7ycmfAeudl8x1TAUXMrSdC/dublkw4eXIaLV
         Rj2b761EA9IxtphZ2dn9BrtW39aBl8t1fjZd6QE/Eolyx2+vk5PQ8vEyTUD6ti+dZ454
         Wt+e8Zn0zcWNLiqlyn4qLUzxueh52HBFMbD7fvk9yC4p49kk3axtL3Pz/apQb+tw2k7B
         gIGIVDYTKYH4ZOakSgIul4R000OsSyfeuFykaiB/2WUJFFUf9kztM4YyBRXAurdBOmeD
         rVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693986196; x=1694590996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7c2BDsoYBazb4ISVLs01WogwNBRf2oRcEB6Brsaem24=;
        b=lN16fugehb0CtsQ/5Xwh7eVwBH5dOuCCT8yOXzHS7EjB+CZeK1wK0+vBMyel70p+JI
         xRTStGPWmz2M4FHbXZZty5QScNaDB66Jo6K+ustyBPxVVvVFK5UDN6F3/9aDXx25Lna9
         ih+B5vkHVjp61Zb5OdzJHXpvsn2GWAT6ldCM4G8wlj/029riZGHmhdXh7s9W+AiEFOwc
         Ik1M3rRuGofCEaxsNUWZzkbgFMhdoxNXKFxJxZ+VKn53n3+w7F+dqB2m4AKJGZQIv/en
         G+z4VZDP0X0qFvOF4wqo3R/cGQDXqPxSJdHpZ+MD0tK+0dziqBcSy5eR9/8W90FiGIcu
         d/TA==
X-Gm-Message-State: AOJu0YwUTOOEwO36bOWbdGGmmlOpOMZK4ksrxoVlcmkTbLEgqsYduayy
	m/LmHjeTeUNouVuWe9BRx7ssCQ==
X-Google-Smtp-Source: AGHT+IEkG1mCGUFejPHYpjZoGgZXtpiwV95wQ7nB10DJ2L1nsBt50yGnVRZ/jfFG8Doa0xYf9mmgcA==
X-Received: by 2002:a17:907:d1c:b0:9a1:e58d:73b8 with SMTP id gn28-20020a1709070d1c00b009a1e58d73b8mr1895924ejc.72.1693986195951;
        Wed, 06 Sep 2023 00:43:15 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.137])
        by smtp.gmail.com with ESMTPSA id x18-20020a170906805200b0099cf9bf4c98sm8600667ejw.8.2023.09.06.00.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 00:43:15 -0700 (PDT)
Message-ID: <0df0be29-8ad7-c319-475f-c22ce57efa3e@linaro.org>
Date: Wed, 6 Sep 2023 10:43:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 00/41] mtd: spi-nor: clean the flash_info database up
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_004317_882527_81BB0E2D 
X-CRM114-Status: UNSURE (   8.59  )
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

That's wonderful work, Michael, thanks!

Please specify in the cover letter the flashes with which you tested the
series, we need some sanity checks.

Apart of that, please address the small comments and resend, I'd like to
have this integrated at -rc1 so that we give time to users to spot bugs
and to still have reasonable amount of time to fix them, if any.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
