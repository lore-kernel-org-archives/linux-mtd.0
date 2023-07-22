Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2A8C0015E
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 05:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/pGG7tK/W50ukFMzPiiw4MGSwtJeELIiRR0SCVbJXM=; b=GSi20qtnDM+NXg
	srTbOsy3vFp1b5MJqm8cdIMiHPHgNHdRspMgdHjB4w6hmARJYIfuwnJZ/gLqO6XnPxdCf7t0QbG6y
	1hb67kADTkQF24LRSPeC3UmrLlalStv1mtbDka/x+nB7zi1KuVNKl6L+/3flRVzBtMu1ZTOWIRREJ
	wJPm6IYpxxty5nIQ6V7yqYjKKdFopxH2/yVS147JTqwT+KQlGDr5FqQgmdKbx1zutXvhUvQeFTlQj
	Nj2PeHFzdObpBaTyqlIOLEdoSFUXkTac1Q4STF719kniZLIolcALkoNAAoPaVsGZYD0K1yHSuRUvP
	bLmzTms+odF36CJcEZUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN4wi-00Fr3L-1z;
	Sat, 22 Jul 2023 05:14:24 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN4wg-00Fr2U-0r
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 05:14:23 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9926623e367so423973166b.0
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2023 22:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690002859; x=1690607659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/fJ++rD7IhcYQa3mlA8l9n2h0lbuUQyxIsuA/Pokas=;
        b=x9i43kGUm52Dw2XwZ9G0GWo2GtlHg/ZIY0QxwXWGSLd3ougP4ahxD/mLXXNrmLOQ4K
         FubkTtuGUKX8dkhf5oWiDkOamtN+NiW5Gy79d2lG1EMJBNzpVs8GCbYAjmIqqnNGo5ir
         xQh1GzO4q9uRADlOxXzkGiZA/NjJL9T+JxAlFtgUEOAqvZZXyh6ix/0PJBx9UO/PRnYc
         Gfk4Os3Qec7dP4SuMY8Qe3fVi6bz1Af6/vK9UnGHt+AJJve3kr1iK7RlZmEEFg1r9nYT
         R40XCBR2Y6KsBrn5Wp+I5+inIkc1ubj+4UdbUwIj6ZLOj3x6thnV+BMrGtYkkPdM0p4c
         3c2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690002859; x=1690607659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/fJ++rD7IhcYQa3mlA8l9n2h0lbuUQyxIsuA/Pokas=;
        b=GUsTdYNPAeGm9It9DZXKzXojmiZ/UV8HTCikH4CKmA2YX3oidrqAY39kEdll15i1Fo
         k4XwpXtY6N2HYy5JzJjF+h3cpmP7MFyWbPeP0vlxwOBXd2MDz/NvHud6Gajd6BAaQn15
         qc/biMZ9DqaAtCZtc1zBZxhUbnhmCTMQ1rRqZIKY77OU+3hxxFhkpylD7KwFkmZ8cvO3
         EURodyqI+273XfmEfCNh8rSoAfPnKesoHTf7bDbKPTyaiaEqqD2NrMofQAaJ1m4TlifC
         opblspm6pyg7KvwBiI46MTfaC+AlM8O5BA2vrZo3Xucw5QB/GaG+G1AyveQ2ktswJqye
         6h/Q==
X-Gm-Message-State: ABy/qLY9n5KUN/KPsClcyfv01Uf5PDCt2AMle6jsNlwD0eO3hL60MvQK
	Z6iGUVaey2/U+XuGvSs5BMJVWA==
X-Google-Smtp-Source: APBJJlFmNhatXmfajxatwljET+9ZqXKrHVZ2b/TAtg7AtDfB4aOnw9zNm++j9SEQIJAT2QTgtgwv2g==
X-Received: by 2002:a17:907:7606:b0:994:522f:3f4a with SMTP id jx6-20020a170907760600b00994522f3f4amr3451668ejc.29.1690002859078;
        Fri, 21 Jul 2023 22:14:19 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id d19-20020a170906041300b009883a3edcfcsm3078107eja.171.2023.07.21.22.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 22:14:18 -0700 (PDT)
Message-ID: <fd57fe7e-ca0e-27d4-1692-d6d9301fb79c@linaro.org>
Date: Sat, 22 Jul 2023 08:14:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] mtd: spi-nor: let SFDP determine the flash and sector
 size
Content-Language: en-US
To: tkuw584924@gmail.com, takahiro.kuwano@infineon.com, michael@walle.cc,
 pratyush@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
References: <20230722045901.9872-1-tudor.ambarus@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230722045901.9872-1-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_221422_316580_C2FDA0D5 
X-CRM114-Status: UNSURE (   4.73  )
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

subject should have started with "mtd: spi-nor: spansion:"

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
