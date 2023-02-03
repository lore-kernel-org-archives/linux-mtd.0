Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051A3C636CC
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 10:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6tei2TaRqBKwmcMc8MxP7IHH1MENEPFB9tMgrM1Deg=; b=NSK9F1ypXGqNCe
	qwznYJya/YGQ9j7+6MnSIPd7HYPWOu56wCN9KFeRdQvOZsaMGsk7eq3TFt/aZXDvp+hX0j7SYbm7M
	9kGwYXnxMJMqEuXx/+4ddioIbJBOwfbpYAVP87mSgtqTjDPQklefb+ovPNFIG02mc8+3m64WvEYQz
	UInufsr4DlWAOibvSfl3WuTA3AQxnzvide/yhyvUit/7y/42mA037U6NmtL0inGwkoo6uWEe7sFes
	2HdVCjPR874VRNc+FnKqyN5ruEH/Oql2QYhzBL4k5u1YeoeI6UGuvKe0SdNnTxbwW7yuR9HQ/OjyX
	VtI22TiIDPDKukstlXnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNt9W-001M6b-1k; Fri, 03 Feb 2023 10:18:42 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNt9T-001M1S-GX
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 10:18:40 +0000
Received: by mail-wm1-x32d.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso3445897wmq.5
        for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2023 02:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=odqpSFJ0f+PZ4TN9H2HUGPRDThnkRj1i7Ss7xOqwBxo=;
        b=i451dYbIAyZj97RdoG0OxW6lW/PyYuGjExH7g9ddi2DZ/iAaWKdl88WX3qB7Ipj+AV
         pQ0xJzmT0VbBX2Tu67xPwbfUnLPBWyqH7rAqM8CYo0Cku6kip5DGsaZCqtSTthboB/TV
         Y2Bb0z4fb7ZRy/h8WGWotAROur6X5slJ/31Lyd6vG2X6WoPYcVcrqwN93Nzx99np0HO5
         CPHSVNSsUeLqaqsiW4qpGW/E2UkU6SnPnIIN4RiYTw/mIJw4SuzZoAsVl1IRrxZ/D3ea
         ilNUTDwEKHH2jgT0rP7DzXn8EMa58y3kFFvpeTWtfczQ7hlA76qrQxOffiK33Ud4Z1gm
         0CVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odqpSFJ0f+PZ4TN9H2HUGPRDThnkRj1i7Ss7xOqwBxo=;
        b=VHUtW8Z+HW5Ti74p50dyxwWydKaz6QriWAKq5mnsMIizOzlQBqvEIXDe+v847Ac+U4
         NEKaoxfWTLk1/Mcb7PoWYppcuDBJmMmGctXVHrInIdHLP6ZrxnSYxiTpdgQGr8+ormRT
         KvfsEyNpDfKTIbmzFCgtwTaixgJtRkR8jDgE1eb+VlJB+bHN4M6q9yHt1/OOElkvyojJ
         +DtPMR28syvm+wb4vX2xsqKlnEMP9s+PlgXvwUU8oUmp6Gluw6H2Jbt+ieUJew5142Wo
         d9QzSqyAn3NBCGPo15WHN0zPuD3v5l/t08Bv2ctk3cAgVSDUjagLzCT9y75FOJ7HVFez
         mSow==
X-Gm-Message-State: AO0yUKW8kZOktAXVvp2zl1fQa5KA7TKI9/nDTmCegNV2M0apzHbiEwzR
	89h5Z9vV1l3LQ8NWdhNvfhBzug==
X-Google-Smtp-Source: AK7set9aoXVU9IWToK+isfFL82L36CsVp6BwtwC/p4t87yEO8hLr12swDiuNMDdgXui8s7jCqU9b9g==
X-Received: by 2002:a05:600c:350a:b0:3dc:2af8:83c0 with SMTP id h10-20020a05600c350a00b003dc2af883c0mr8955937wmq.31.1675419506856;
        Fri, 03 Feb 2023 02:18:26 -0800 (PST)
Received: from [192.168.2.104] ([79.115.63.122])
        by smtp.gmail.com with ESMTPSA id m2-20020a05600c4f4200b003dc522dd25esm2422403wmq.30.2023.02.03.02.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 02:18:26 -0800 (PST)
Message-ID: <dac961df-c43a-03a1-2d85-33075f75589b@linaro.org>
Date: Fri, 3 Feb 2023 12:18:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] mtd: s/a SPI/an SPI
Content-Language: en-US
To: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at
Cc: broonie@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230203080136.68505-1-tudor.ambarus@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230203080136.68505-1-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_021839_598025_16F0C7EC 
X-CRM114-Status: UNSURE (   4.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Sent a tree wide patch instead, feel free to comment at:
https://lore.kernel.org/all/20230203101624.474611-1-tudor.ambarus@linaro.org/T/#u

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
