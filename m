Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC4FC636CC
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Feb 2023 10:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GaEbw/AbxrnO9qwJZrV24bmSjyvQIk05t/y8D/qRRSQ=; b=fhWeHIZElyZ1nB
	JHiXA8Q7SuD7soispfwsdkvY0BWeMWHyKM6memd2l/4OOJspFe7K34QB9XdjKsbSwvVZ20iHXqkhB
	rXdZ3R1Jlz1SmD/TfhIYSTseP3s7AghQcI6LHOOuwP9DyEa/3xHYJThjTyX9yeKb+8u6lNkI98iS6
	zb+TNQUWZEc2vWmPGqOEhqk9vA+WmL4sutIcOov98C4Y9ecU6e6AG7YGpZy2HkdrlT9MkDTMBhyNE
	wL96bqcYngUvOtkjhRFjAZmgCPe1aHiqiN3bTKEqSzB13TIE7/gIR/HE7e2zqFzcNwS4P1PDSvzWi
	zofod/MPDa2P2yi7/zlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbn0-009gzq-8k; Thu, 16 Feb 2023 10:46:58 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbfH-009cUj-MQ
	for linux-mtd@lists.infradead.org; Thu, 16 Feb 2023 10:39:01 +0000
Received: by mail-ej1-x62b.google.com with SMTP id my5so4060581ejc.7
        for <linux-mtd@lists.infradead.org>; Thu, 16 Feb 2023 02:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sLrFLNHeU+0lLuzFD8IVs3u+DZSPRSwwfeLZdEjgDYM=;
        b=hn+vFzEL3ILDwPxJqj6OUOa9CnpR84xsN2Hr6TESe15oV73q3F3WW1o3f4JnPjRsni
         7LRG806AS5WO5/8YYqZzUTU51Dz2nKYeClgphuDAHOSKX5SqbHJ/bauW3dt9fUvykleU
         bts0uLzBeCDqAoaHXovdRxr1Me8hV3XTEqFWqPCa5w/u/egkC/xG+t5HrdGl9jUkit2r
         +gbXsnEMTS+Gmf7L6vpgpLJwxA8X9nIThTpBr+KYTXZWj6MsPIIPnE7vxDPfKEzqCCCU
         UQO365K6JJRkdxCSbnCDFq6/+U5NVLwp4w+y8o2+AHXFecOK0sdyI8TlTivmY2ZY/9c/
         39cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sLrFLNHeU+0lLuzFD8IVs3u+DZSPRSwwfeLZdEjgDYM=;
        b=0BhoiamcvSZHkK5w7lhhZBQTzQ6RbgGDbDSFkFLfZVQW1U401tJLGVlK9V3EhGAj8t
         K1Rr9xWAHJxS+Nf8atruZtvaTJPc62SBd9PerypVNYiIWwgu4EK4gpYL97AzSqkQN0mX
         CVYILtZI5YCLE9XtwEbBoN/+NuRDN1UtYUW6mlq9C0s+n3NE7IwHpVQPaxtDA6BP4hZi
         mZXFVHCURkM9xe2myk8zeNHM4y1+P9gOm20g9eofvmhlGg87kPvB9O8l0OdzhGCFe4Yh
         nEkNFqCNugrqjrAsxXK3Q0Vtj7BxluPO7RAmO2+Jy4B35WZz8cAjCBttEXMzxda/VUS0
         pguw==
X-Gm-Message-State: AO0yUKVxFZrXX659ARC2S9TqgUkJylMhdDokpDxMSwxvMfTZUmLrcFQH
	rcmAufmT6QVXgMF2pey+E9M06w==
X-Google-Smtp-Source: AK7set9/CqKyWkEqPDvPc2d1jdxozbn09liDcmYzlQaGwfPl7/6w6LJzSsv7ImeZK73flh1q13DHTQ==
X-Received: by 2002:a17:906:d114:b0:88b:4962:b72f with SMTP id b20-20020a170906d11400b0088b4962b72fmr5900381ejz.20.1676543937987;
        Thu, 16 Feb 2023 02:38:57 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id kk15-20020a170907766f00b0087329ff591esm637089ejc.132.2023.02.16.02.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:38:52 -0800 (PST)
Message-ID: <028e8b51-621e-e0af-f781-b7395802601b@linaro.org>
Date: Thu, 16 Feb 2023 11:38:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document CPOL/CPHA
 support
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_023859_829209_5181FB26 
X-CRM114-Status: UNSURE (   7.32  )
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

On 14/02/2023 15:26, Geert Uytterhoeven wrote:
> SPI EEPROMs typically support both SPI Mode 0 (CPOL=CPHA=0) and Mode 3
> (CPOL=CPHA=1).  However, using the latter is currently flagged as an
> error by "make dtbs_check", e.g.:
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
