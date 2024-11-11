Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0378ED2E9F0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 13:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhadSlot+6qVMYuhSs/wplv85GJktxxDfX8oR3l0O/k=; b=s3rsR2ZSetTX3t
	gBNgTjoamA5Eny3Lcygt39OAPcO/XUDTisbeNsi2hWbTL/sdLuol/1Sby/lupDu1r5a8MMFLprQCI
	ThpHDVz2wjCb6Ki4XCxgLFmKd0+ZZwbYq11Z4DndXIiye9NLTDfLBUNfMJO+BHMbP6hi/j8foXbxr
	HAPiuQMsdUJWQlleBJ9Fq+/nxDMW3L0d8cYW3U9N7YsgLMJXFkMPzAdzbqvB8QyLNKBTNXz3zt82J
	l8bnbpU4aEN2Cbob07vGhgx4E7P/aO1+pk6Bds/EmGzMCmYaxFcfoyfJKmKuhEuiTJjlGElDOwxam
	uLFZ9n8AAdM6Ez4A0TJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUqF-00000000Dvu-2n5N;
	Mon, 11 Nov 2024 13:52:31 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUoX-00000000DiH-160J
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 13:50:46 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a9ed49edd41so810266166b.0
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 05:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731333044; x=1731937844; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SpaD1h+qgSUegWPIErtuApILd4uPZKqBeb/+8dSEdD4=;
        b=edRZkuJA05x0t9UKmErcU41o2RvXnsCxa74rtTprTDh2GdVHUl+smgAI+pPth9XSv3
         QHAMMCcWldrHsgBTmzFf9rco42Y4NqF/o3505rJnggzPlUV2qgRdTSKcEJtPQ4OaWmB0
         ErC0zhRd0XBRMky4l+mdACVwnWRWZ7FDDA39cbKf5ZPyqOasCUAC16uOrh0BiB9cVpwm
         zzpqsQCUU+SIF6Vo0rQuBCO4L2cky/oc3M/ezxUS0IUkWgK/og6O3xs9/QGsPxVJloRZ
         o4A7J9aWTuZ8zYR2kt960DzovDnmYSHK3xxhfzN1PeOJkBHwrpJMURMnB1b/2ZlenTRw
         7Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731333044; x=1731937844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SpaD1h+qgSUegWPIErtuApILd4uPZKqBeb/+8dSEdD4=;
        b=jcIWuLLtJ9oKs2BkMiNp3N9eR5+ZFeJyIfBXdGQjR1xd4jHxES97Bg+PMBZWy1TIXt
         Ca55YNyeDi7w0y/zx6g4icVudJ6zbW9oubbY+9VIG8w07QW3Yz8dD/3Q+UmeDFqXJTwP
         6gMRlYz2yAdR3ywdIpJqhoSlEzO2dtDI+nz2GwJtWbcRMK/hv2VxCoaLEk1Mjv2s5UQP
         ApFCbZUo4fcGphJLNGKCHKt7NO8V2RRu+xLlckQmFfJGGxRYZBvKiVca9hf5x0NMiION
         KjhHGsvq6GwBEZ5XN6OkOH0svEfhMsynLId9MWuo58XxNYDZWesBvmi7QufsPD3/xH5a
         M8VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJDokruhKemN+l1piZSFDVpc2ro4FWRpyKjTySEyUoGIMWUTcH5ZpcfXQrHT9iqe1HaHOuz4Vc/hY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ/2V5QWD2KUEr4RfL42Z9pu4s+GnPznOQOlbQZKjk3a2PPrVY
	oN4uMubgs+44MKghiyjFuqu0K1lUwuYxvSPlELK/mFtOq10I0MXdnfIGO+6wm76KEKCnRf7sTvv
	x
X-Google-Smtp-Source: AGHT+IFag61yfodkZmr5TS3cmwy+FvF75Uec4Yswjg4hxvXQDmRP7g7+z1T2wq5sRQC78AQ1tGkGKw==
X-Received: by 2002:a17:907:7205:b0:a99:60c8:f2c4 with SMTP id a640c23a62f3a-a9eeff0d8d4mr1261372366b.15.1731333043626;
        Mon, 11 Nov 2024 05:50:43 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0ad2f76sm591418266b.89.2024.11.11.05.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 05:50:43 -0800 (PST)
Message-ID: <48c1512e-91f4-42f2-a935-b5b8b1506d0a@linaro.org>
Date: Mon, 11 Nov 2024 13:50:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/24] spi: cadence-qspi: Support per spi-mem operation
 frequency switches
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sanjay R Mehta <sanju.mehta@amd.com>, Han Xu <han.xu@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-6-miquel.raynal@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241025161501.485684-6-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_055045_490180_19BBA7E2 
X-CRM114-Status: GOOD (  10.33  )
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



On 10/25/24 5:14 PM, Miquel Raynal wrote:
> Every ->exec_op() call correctly configures the spi bus speed to the
> maximum allowed frequency for the memory using the constant spi default
> parameter. Since we can now have per-operation constraints, let's use
> the value that comes from the spi-mem operation structure instead. In
> case there is no specific limitation for this operation, the default spi
> device value will be given anyway.
> 
> The per-operation frequency capability is thus advertised to the spi-mem
> core.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
