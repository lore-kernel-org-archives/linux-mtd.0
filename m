Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67A8C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Dec 2022 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPYHhILI/YNya1awk8yv4/u9WJQzDBIx1p4IBRH99gE=; b=tf7EfWPpzbS+KA
	KsiOwNplLod05Zetm5+SDptqCr3LI59j8Sqns3ZYJy9mVbZ0BgqgS0aLM9t8gXTQ3dekaZOo9MeD+
	sqXJkECvRcxAl9JK9HjvdWWHZ0BR9IQT2mePEZ+vMPk6W5b1i3zcshAOJ8YR8gcMcaCoh364vKAEQ
	kiqLjXwLzsZG52CDmZQbJAH0/UuGJVQr9ku5V4dxmfSRa3PKuLwVaR5BwoRd0glUr6MeNYYLGoh8S
	6kQijB3ExzJBZD82jUv/1mSaokCRZZ02/M5ZyKmnluJSP6HPNn7l4ux1vjWGOyKB47Lh7DuwAqhJU
	jw7FBkMCq0JRO5NiP1WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7eoC-0001vo-Ld; Tue, 20 Dec 2022 15:45:36 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7enY-0001I6-03
	for linux-mtd@lists.infradead.org; Tue, 20 Dec 2022 15:44:57 +0000
Received: by mail-ej1-x636.google.com with SMTP id t17so30216054eju.1
        for <linux-mtd@lists.infradead.org>; Tue, 20 Dec 2022 07:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NwruL0979JFuznH/sYcDGOyKnO5iM9PcWtLgGuw0NsU=;
        b=p4V2EGt3ZnZQxaCBjlBhrwCG5HcuYcfA7xUfw/CAQ6IyHD/S44ZCqBrSM5JZDwLerm
         GDjFxBiBAXvKJRwWq0H9SwdUEBM8miqRLpSQR2LBmndgqIQTP+4W5xQSySG7/v7bXpQj
         uHFauQbgi3qKRcAEbHn06zTXAZei2M4vEAg3KFGpHPeGYq0ryjr7WGElleLmEv2cUcQ1
         twbHF5it2suv2ThaShjVv3CPErmvCAy8n58V3dwHL6A4rEpS7EkGa81BUTG1bgxaNGfb
         upWph0T1Xg8ePls6P+kIATtC/FNrnOzBTzZsJ3B8IQAdYU7ufW3f83co90ZVag4iRVFI
         q/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NwruL0979JFuznH/sYcDGOyKnO5iM9PcWtLgGuw0NsU=;
        b=Q/T5bedEqSOB5eC40kr+0LZ9sMXDC8s8FPQjfHWZqNLQt4ThGh8dbNY2pW2YtzFnAk
         /462Y7RDQkAkz5ldImfSE5FvAMD6vmiZ2hSGXbZIlGPI8g6c/jsMaCL2uWEBaCDZmdZ2
         eXpDbeXVDRZMyzVgItqAk9/TDqMXLe2H/PH5YwyVSwYof8FsnJ9kRa1AxIYqOmcn7RZg
         gWZRICUICsKIA8KvXas1Wk76Eqjnc3m1gkAs53mJZoptc7CimQKJYXuChHjcCZWKLdsF
         vysKRYeI99yUJkszD7IqO+2DaaPnZ96OqzJMgSeD+egiiTKwN1g3foIdF56uDl+m0JYs
         Cm+g==
X-Gm-Message-State: ANoB5pnwIrcru1eYeRomMSAC2Rg1Sgj9uL+/XtTZ7D/31a0FAF7fMLA8
	+LVzqbz+YbY9cvt8Qkw/93GDsw==
X-Google-Smtp-Source: AMrXdXseLZUtPK83YwnsfQ0466FsHGDk9R7HCChN4XLU5MhKcRPjDUQ3xQu6Zo3PCJe1EY5ZLlvGVA==
X-Received: by 2002:a17:906:858e:b0:7c2:3b8a:9f0d with SMTP id v14-20020a170906858e00b007c23b8a9f0dmr25004914ejx.51.1671551091036;
        Tue, 20 Dec 2022 07:44:51 -0800 (PST)
Received: from [192.168.0.104] ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id j2-20020a170906410200b007ae693cd265sm5825058ejk.150.2022.12.20.07.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 07:44:50 -0800 (PST)
Message-ID: <cae6328b-5204-a1ab-810d-8fb64e466453@linaro.org>
Date: Tue, 20 Dec 2022 17:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] [v2] mtd: cfi: allow building spi-intel standalone
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mauro Lima <mauro.lima@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221220141352.1486360-1-arnd@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20221220141352.1486360-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_074456_228323_203155F4 
X-CRM114-Status: GOOD (  12.12  )
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

Hi, Arnd,

On 20.12.2022 16:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When MTD or MTD_CFI_GEOMETRY is disabled, the spi-intel driver
> fails to build, as it includes the shared CFI header:
> 
> include/linux/mtd/cfi.h:62:2: error: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-Werror=cpp]
>     62 | #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
> 
> linux/mtd/spi-nor.h does not actually need to include cfi.h, so
> remove the inclusion here to fix the warning. This uncovers a
> missing #include in spi-nor/core.c so add that there to
> prevent a different build issue.
> 
> Fixes: e23e5a05d1fd ("mtd: spi-nor: intel-spi: Convert to SPI MEM")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me. I'll let the linux-0day bot run over it and apply it
once -rc1 is out.

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
