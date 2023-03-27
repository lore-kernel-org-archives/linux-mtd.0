Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B291BC77B6D
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 16:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ULc7WUnKGpz20I8lhrFZ80aJ4Ao8NwYnOmkoygIwayw=; b=RvzUtVoew1Xil+
	//D0xj8PzL85tirKfc9s9BrNy/2ni40aIevVMzzsRYVi+yP5WEfALsvvvuGimlUs+6iBrkoeKG5JS
	6Iut3+mDcSYtvNC6maCOtb5a+Ep7wPS9f5iTYu03VTgIpu2ue+rlIMRNPL4/mKUS6GS3XzPK5b+1L
	ZTFQq1Me6rkxv1WyD4KSjc1tpa0K0R7b1Nz42lai/wCaWIk0/ACnDCbJ20wHCMTI8djIVsk/OUqaI
	xqyHSs7YqSzXGrVOleFPDnPpk7SZQMykxIsu89BP2cH9zL6Hp9EjYHM0wse3LT5tOLX6kJ7afGH+g
	ze7pc22l28CE/g7x6vFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgpLN-00Beez-1i;
	Mon, 27 Mar 2023 16:05:13 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgpLL-00Bee9-1F
	for linux-mtd@lists.infradead.org;
	Mon, 27 Mar 2023 16:05:12 +0000
Received: by mail-ed1-x535.google.com with SMTP id eh3so38219226edb.11
        for <linux-mtd@lists.infradead.org>; Mon, 27 Mar 2023 09:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679933109;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+xWYiS3llu2HpwOSTJeOhknc09GbN4E66RoEIS5/sjs=;
        b=N0lhdKu1Wt1wakJ4GZ5rAE32F86Cwg+uPgtKI8cdDYcQDSOkdI5RqyoenNHspPDbZ1
         NgB6kd/48VFxqqB1/LxR55cRlGZb9KSZFaLqKeBLNE2rv801ii31R0AfpFriWlTJAfJk
         VmzurPJBhLPDddZnCNjJUn1Fc/rjbXCTUw5YL9S56uKbWTHQKMyRB8rIL+jyvKD2sScz
         73RupSe+hfofNOQJiXDWKXdsty7kiMJWrGcc98ERQzv75WJaJw650M0oNKPyHw8JyVjn
         VcSJgSlxCdLx+RnKbBLJl4v8NyWH/nVEVjlWK7IwuCSq3yiAl7lF3sgEW99m+Zuk+YhH
         Qqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679933109;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+xWYiS3llu2HpwOSTJeOhknc09GbN4E66RoEIS5/sjs=;
        b=Xlos39J52KsoiG+0zZ1AdW7PXcjwgQXc2pjZ1ojc9mmjs2X+wgn+RbeYLfLx8qBPny
         J/JIuVLdpdie9pARayS9Bf+zODFJBz6LkzEAhTLCW3bTtruRTwRbx0HOLJ3aEhJ7Y+2b
         WqBZQY1wC3IG3/p1LN8nVjsNRBCymFEtMFlKBh/hDvc261Xx953imnege6k5L0neBWQ3
         hRz7zjFcXm5HK75jQBdkV49SQ2NM82age2aRA6cBiFqQlT5NGshhQ70OdrJfr9WLE/pD
         SITkOyxCtMbqCkEbKuXbpnIlahi/vDAn4ApZTQkJW/ixMgnQt8h25IIHvF+ZA+mQOECP
         YmSQ==
X-Gm-Message-State: AAQBX9c7u+rNBN9h3xH/jnNZLF0+6COQF164CgCnBahNpeLMvewaUDz4
	Xl61it+e1wctbyQrj6QjX8i7pA==
X-Google-Smtp-Source: AKy350ZnoR9P3I9BdnZ/TMQKT/EOkIrQZ1OTR5vigOyQRanxSzAkd1f0gLI52BjTe6OdWnPHmIABVQ==
X-Received: by 2002:a50:ec89:0:b0:4fa:4b1c:5ea3 with SMTP id e9-20020a50ec89000000b004fa4b1c5ea3mr12716995edr.23.1679933109297;
        Mon, 27 Mar 2023 09:05:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:581e:789c:7616:5ee? ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id k24-20020a50ce58000000b004fc9e462743sm14685826edj.91.2023.03.27.09.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 09:05:08 -0700 (PDT)
Message-ID: <efa9a89e-ead7-8604-5d7a-07c728485eee@linaro.org>
Date: Mon, 27 Mar 2023 18:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/2] depends on ARCH_STM32 instead of MACH_STM32MP157
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20230324155105.826063-1-christophe.kerello@foss.st.com>
 <20230324170320.5087c223@xps-13>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324170320.5087c223@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_090511_426210_02CF7056 
X-CRM114-Status: GOOD (  11.88  )
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

On 24/03/2023 17:03, Miquel Raynal wrote:
> Hi Christophe,
> 
> christophe.kerello@foss.st.com wrote on Fri, 24 Mar 2023 16:51:03 +0100:
> 
>> To be able to compile the driver on all STM32MP SOCs, we move the
>> "depends on" on ARCH_STM32.
>>
>> Christophe Kerello (2):
>>   memory: stm32-fmc2-ebi: depends on ARCH_STM32 instead of
>>     MACH_STM32MP157
>>   mtd: rawnand: stm32_fmc2: depends on ARCH_STM32 instead of
>>     MACH_STM32MP157
> 
> I don't see issue with taking these two patches in independent trees so
> if nobody disagrees I will take the second one through the mtd tree and
> let Krzysztof take the first one through mem-ctrl.

Sure, np.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
