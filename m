Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F094DEB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 05:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+8JOho4KGbUuTLNRoDplNfodJQ2aqqP5ijaSDzbDZw=; b=b1TNn3RdK+u02C
	5chOx1sMlQ2txqTqeGbbPAiNTQKiwnGhaUsH4WsMRZ2rV3yD/5x15ujeEHJjc9TtaaVV+VejCka2W
	Ix3niddza9GrdGio+9G75nmI43oejj+nwqNKmtDkwM2wa1Ayk92G+0azZ74pxqcCJ5WWL5UbS1DWV
	HfYCozySSRccoVp7D3iw9o3Wy/4B+Arji8w/W9CWBaettjqlaFKMS8hM+/BtVE5zjRWeaoBTCecn5
	tT7LcCbnboyfU/ZQLgrtL/dgXOov+MCHeE3mb7L5ypEkkd0iln6sIoaM6v5SAGYNt5IcbUWF6YE7D
	7twjJwnuN9tsGSNGZx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN4nm-00FqRW-28;
	Sat, 22 Jul 2023 05:05:10 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN4nh-00FqQh-2A
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 05:05:08 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9923833737eso365757566b.3
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2023 22:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690002299; x=1690607099;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=26RvMsVKXTX7XjbyZEtVpcSXN1DFh6Pb1rLRwVNN0/Y=;
        b=jtt9qXUS57q2nzAYJV89VKhEBB06TraMDTqTl6aof4xEWxflXK/KBKR13Joi4kDwnS
         s1YVLW+uknHR6mOA3arwLj6kC0ZFe18qEuWdQ27Yti9bhG9QZ08wPlpyXJgIBu0BlM7R
         WigRBAGBAR+THxLhkfh82e7VNlTaOfco1gHU3dbY06slVuhg+jeOfnSsrbSMk7OHuqPB
         dUKMbaq14Enlvjq5tiwYhCAoZmP8DRm7Cd2TYferS2LJDVkDhtqbuEpdntTlnfl4bz2r
         K4Pb43gsNcGErwGKGZqJlF7CNhBwflBCATxUfJC940wHlMK+p3iqrD2ntjTkDbMRefw6
         /+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690002299; x=1690607099;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26RvMsVKXTX7XjbyZEtVpcSXN1DFh6Pb1rLRwVNN0/Y=;
        b=ZeLiJF54xqtG5Y30akA8+ldjKLqrli1utNBaqEqOc6UBteqkA6qfsQAiKP4qkqYiem
         D9DJSdoQ3oefLpnuthXue4uW6rS18AmLO5JESHnnURLzdXtfso/m0X9LrGiLLB/2gabj
         oyBIy1zmVxYFLgvlfN5nYUkV4CwYwhLwHzxISd4I0FdvQxvfKdLLXbwKDX6fESLNxEcY
         2bEEPVAVz2iYVfGFtfUeXocRzAEOwI2mCVjdoi7mAkL9IUegs5iCIzhj7zTwH1c45M1M
         avR1cFUpjqtB4o4A8BCPYw1EGtPJfVw+qXVwi6MCryvn/rA7byeR9b/rLlZHOAmETQkx
         KMsA==
X-Gm-Message-State: ABy/qLbalCavwy3fpVPtBv+CE7xdDtUUtvMtnxRt0oazdsDpS5smMQRL
	VcXFz2mjZ/HcU60DEcK7fVI40Q==
X-Google-Smtp-Source: APBJJlHuFADe7kh+DrzIOCPcehav9pVxLoqFKZIA1JGVywO9WT+aM6wAXUJi4pXWfsD2PgNZFk0glA==
X-Received: by 2002:a17:906:5a54:b0:993:f9b2:93c1 with SMTP id my20-20020a1709065a5400b00993f9b293c1mr3058711ejc.9.1690002299338;
        Fri, 21 Jul 2023 22:04:59 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id i25-20020a17090671d900b009937dbabbdasm2980157ejk.217.2023.07.21.22.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 22:04:58 -0700 (PDT)
Message-ID: <eab70902-0142-72a2-35e5-43ac9a538b96@linaro.org>
Date: Sat, 22 Jul 2023 08:04:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/8] mtd: spi-nor: spansion: Add support for Infineon
 S28HS02GT
To: Takahiro Kuwano <tkuw584924@gmail.com>, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
 <11dc5af4-6c11-5b44-5764-88a5eb734dbd@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <11dc5af4-6c11-5b44-5764-88a5eb734dbd@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_220507_435025_45BA7E89 
X-CRM114-Status: UNSURE (   9.81  )
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



On 20.07.2023 10:54, Takahiro Kuwano wrote:
> I tested with the following devices, as this series updates the code used by
> other SEMPER flash devices than S28HS02GT.
>  - S28HS02GT(Octal, multi-chip)
>  - S28HS01GT(Octal, single-chip)
>  - S25HS02GT(Quad, multi-chip)
>  - S25HS01GT(Quad, single-chip)
>  - S25FS256T(Quad, single-chip)

That's good effort, thanks! Now that you introduced CLPEF and you have
to test all the flashes, is a good time to let SFDP determine the flash
size and let the core select the erase size. Can you please test the
following patch? You'll have to make sure that the flash size and the
selected erase size are sane.

https://lore.kernel.org/linux-mtd/20230722045901.9872-1-tudor.ambarus@linaro.org/T/#u

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
