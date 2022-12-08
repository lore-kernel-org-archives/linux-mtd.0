Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776E4C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 09:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w863XTJBN/ntjafo3wMuLDhtytqt+8EdBManA57GoWU=; b=T7T1uAVlhpMsfB
	JbSEnRVsxsxqNT2d1Y0ER821oW01fMPzsHYorFqNwG6bP6edf6MaYqbyxsq19pJPdZlEEiXJCkpze
	QLPV15vZCsrutor+XKQgRbb/r8Sxeu5iYpbDCsBKpQpAJEbL2VFDtYwrBRCm08wtoSFQHCCQFdUyL
	kM4cjzQWBIWBUfUk2nUX0SGhGTtDfeS4b1u8iOx7FkgQYjLgtJPOWKHLjy0uyuXfBRoTD18+tThjz
	OdkjC42fis1B0gsQ21mYHeq477SIu35nKMcJDnMaleym4P0QVA/vIZzozMHd/9Cn/4UxvISPq3iqo
	aybfN2ZzSsbDZomzMUTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DWM-00BDHY-H8; Thu, 08 Dec 2022 09:48:50 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DSM-00B8ZT-Br
	for linux-mtd@lists.infradead.org; Thu, 08 Dec 2022 09:44:44 +0000
Received: by mail-lf1-x12c.google.com with SMTP id j4so1255033lfk.0
        for <linux-mtd@lists.infradead.org>; Thu, 08 Dec 2022 01:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Au11CpDwn/UURJjwp0rA3AGArUSenl9oJW8Wm3b2MRI=;
        b=oQVy6g6ftbqQnTmQTVvMb8OUxjzE6cI+OwClMDRYtJL4J7shXtdgl9dnIFESMg6CXE
         sqwdeTvpk+qjGrsm+NgWkouPci01Y2frsw5t7yX1DRHmgqOunKOtK3ff8qRUg8Bt6A84
         Lz01eBaKYwHp2SPGwO0/kHZYYcALchNo1wb9OaGkV2K3RFNjkOos7mwrjM3fwYhaH5Cl
         Tv06SYsr8e41IzLg1ZKClIDbCOinFFZwWjxbVSTs+84VG3IA7Je/PalFrAQL584XFyZ6
         hgnxUFkMqlfRGGUHzu+jDTev1aojSSEBZ2qbJY49MFOf1CiPoBozUAiK5YI4c/XvKlwo
         h2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Au11CpDwn/UURJjwp0rA3AGArUSenl9oJW8Wm3b2MRI=;
        b=bkmpBJfJttUPgS7LB8cvZ90eu2GbGNmvw8wLXCLNYAU7aLzU1C91PKfQIcuLVmMHik
         xgarwwSPWjgzBEIhbKFcdHpZR3J+etsUi+eHNbTz/FXz8FEGkCQxTCbLK33ZZklBFXoG
         pv2L08N8xAhKob9AN9f4apVJ2mGXCkKoweJtblQHIp+wyhxaH7RFyHRzjigM20E6L3Hi
         Jix6dKeexX/aQgUUXxxZ4hZBAESZKdtxRmYQwSLZEd7NHDRaI+VNcsHGANndlexpFAcq
         tVo1VbZOQQ16GeEECD2FD/KluML2HYmSqpsUIA3ixebG+T1fL5MG6Y1iNo+b0ACuEZ+2
         ZQgg==
X-Gm-Message-State: ANoB5pmLQ82eVhmXOnDUPK2WhDYyjbz5/KdU9h1VQVnS6iIZmGTm7PPj
	HDscbYzHTZv8fbk/ptYrkwSUFQ==
X-Google-Smtp-Source: AA0mqf7iPq8OR3W99hPV0n9RoC8HsGux0XFBkldIaraeJ45vK01ol6MYOTxEh2bE5pnb0/WQaoLOKA==
X-Received: by 2002:a05:6512:3f0b:b0:4b5:22:7fbc with SMTP id y11-20020a0565123f0b00b004b500227fbcmr19179516lfa.183.1670492681820;
        Thu, 08 Dec 2022 01:44:41 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p21-20020a05651212d500b00497b198987bsm3273986lfg.26.2022.12.08.01.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 01:44:41 -0800 (PST)
Message-ID: <4dd69cca-3ae1-7fda-b1ad-01087449afa0@linaro.org>
Date: Thu, 8 Dec 2022 10:44:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 9/9] dt-bindings: mtd: mediatek,nand-ecc-engine: Add
 compatible for MT7986
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221208062955.2546-1-xiangsheng.hou@mediatek.com>
 <20221208062955.2546-10-xiangsheng.hou@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208062955.2546-10-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_014442_488300_E541A0C8 
X-CRM114-Status: UNSURE (   7.92  )
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

On 08/12/2022 07:29, Xiangsheng Hou wrote:
> Add dt-bindings documentation of ECC for MediaTek MT7986 SoC
> platform.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
