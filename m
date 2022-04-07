Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78442C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 15:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xC9FUeRBhwD/rUJfY4rPwgfeAlL0X5KOD9oq2sib934=; b=sCMz6gIt0aOqKa
	gyZu+CYD2g/9TZ7x06a91edKtB0yCcoooFG1qnQcjW9m0Al4f58/XO0DC7HAwxG37gCvKhyR7PQes
	aZFKZnXLEkXuTePZiKFgJa2U8gdHF5HlNMoqVODcpZSgjZBLwy6uRffm8ixLCIMzVLKDngd/HJE03
	ewLgBUd/vwmH+wRGL8Zizyv3skUAvDpdyKGekoPrXEt8n0wErloKJpp8Rx+OnLmtH0p1l2GWixPBr
	Rn7rzKouu3x90STgb0lQwQCJH3BzQjLiFfcmTA6KFckKcKQXI0rew6jnzjbpDyaoYm7Oxq3S8JKcG
	APEXR1o+QWOix2YlE/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncTwu-00CeIw-WA; Thu, 07 Apr 2022 15:21:29 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncTwq-00CeH7-Di
 for linux-mtd@lists.infradead.org; Thu, 07 Apr 2022 15:21:25 +0000
Received: by mail-ed1-x534.google.com with SMTP id d7so6783385edn.11
 for <linux-mtd@lists.infradead.org>; Thu, 07 Apr 2022 08:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WrflAjleUvotKO6ONszyHWgkRAJT1uadUqHg4VfzFzw=;
 b=ToNWt1yjm4njDg28WkBmwydHhMb541dvaQNQm/KL/cpKnfBRg6JWbY/rX8tn9HeDVZ
 JQi/QRYWOH7cb7EF8CrtWZS7j2bg6kYik82SJqZa4gRnATt4ag7QdG0o+5AwrRmvwDaQ
 e9Kowb7F+hf8ve+dE2EQHxPvEoCLy40ZEnun26C4ZXBXAEQUK95H8DB/xWu7cHbFNNH0
 D03DbnfwyQ/vDQ31m1ijbaJaqYZrIAvJrJse+ITTxqO2P4aTk9Yl0GfSJUgebiCHV0fq
 NHuWYj6CiLEyQOc7ST62qk5HmqdceF9ExmnZDK9OASV30dfkoRaoK7R0yFS5X4E8mhZT
 lVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WrflAjleUvotKO6ONszyHWgkRAJT1uadUqHg4VfzFzw=;
 b=ZKmU3Rc+CU0bvJCLPwD+KEOrZS8ua2JDg1KIfKJgAA53dgN5JivbbujJFA71s4O7Jx
 cqgj7dTDM1+RwA+MNZWWznkrU75bOjuuyKH4lr6f0woT2yHnmoUTjBrHY/2GXEXosPw/
 jJ1//v2seS2HWmZR44FV6ynBszOkIHwtVX0MPsWyglXsYPGUPrx53+ZntElgqJfOFje2
 HFd5fQ0S9uWhFMh20JVfNuv5vmHgE87SIiOqmAMsYWEO4FrF92KLGmqIJuAuaghXvWmg
 4mooZ24/ENxbOSX6GHGXa9V+u/Xk0tXvAUmP1hb9ymIdEePILX7L4wEMOFJVu/e6gWLk
 YqfQ==
X-Gm-Message-State: AOAM530476DHRx1H1hwbEhU6rZTXqZnSL/Je40xcufCLxdxGwoEyYBLq
 J/pYPEn35cDGHcpRbxWQZEViww==
X-Google-Smtp-Source: ABdhPJzJ72Zd0fdqGMuGZTMhO7l74vyKe6JXeXWfSy5lBxiAwbOFxqPN9om6goQRd5yHHkKcX8M22g==
X-Received: by 2002:aa7:d682:0:b0:419:3b78:e489 with SMTP id
 d2-20020aa7d682000000b004193b78e489mr14947186edr.372.1649344882144; 
 Thu, 07 Apr 2022 08:21:22 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 ka6-20020a170907990600b006ce54c95e3csm7740203ejc.161.2022.04.07.08.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 08:21:21 -0700 (PDT)
Message-ID: <c6d85486-16af-d798-5e55-a6801e5402c0@linaro.org>
Date: Thu, 7 Apr 2022 17:21:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 4/5] dt-bindings: spi: add binding doc for spi-mtk-snfi
Content-Language: en-US
To: Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>, Florian Fainelli
 <f.fainelli@gmail.com>, Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, Pratyush Yadav <p.yadav@ti.com>,
 Yu Kuai <yukuai3@huawei.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
References: <20220407150652.21885-1-gch981213@gmail.com>
 <20220407150652.21885-5-gch981213@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407150652.21885-5-gch981213@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_082124_543207_4B881E09 
X-CRM114-Status: UNSURE (   8.87  )
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

On 07/04/2022 17:06, Chuanhong Guo wrote:
> Add device-tree binding documentation for Mediatek SPI-NAND Flash
> Interface.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
> 

Looks good. The subject should be rather "spi: dt-bindings:" (as
requirement for SPI subsystem).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
