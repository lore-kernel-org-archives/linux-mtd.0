Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2870EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjsYBTv39QjCmfP2EeAIu6ARxw96miil7cPcDJzr4Yw=; b=Dk/6JjE90RDuMP
	w8eTsllaN9cUijsRj7mtWb2Nc90u9LM/sdIJuEg7T99rVvnEmZL1P9dbAQMY/YQPuWtzDzg6XrZEH
	r+6sylRZ9ak3PJotleXl2tBPNY1eOp0WBtoRwn3lnpzabQaF42mUSpARWurBybO6yxxKn0MgP6Xuh
	BGeEabD0/GDeNFyOV+p2zUgyeudbxCaTvyVk2JD5/9ahZp8BxXAm/m43mQLzOlsORt+PG0ArWcx6X
	XqvnSSfcAgiOEQajDGKKWjVXrrQinYcXMeXIVHpgNz5GLhwiiI5sbqSnYupZuzfHJb2s9YCcQC2xC
	kzCziWr5BqTd70c9gBoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0zx-005um0-1A;
	Wed, 19 Jul 2023 06:49:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0zr-005uht-0y
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=98ERLGEzzFsSGM5kWcXTpFq/KRJ2f5sxbyycdksneCo=; b=EpQQZiLBra3Gr00nrwuJ0+uYoE
	Vc1ESsHWf4sSLdygCm4JRk4TEcCYGIDHoJr3sKVaPTr8g1Jy/poeOgCbHjkwx7uqIQNUvHhEhIwAl
	whcl/UP6aB+7D5oL0IUNu8S9DumqcgETYeX6aum5exck7fikXPMwFHW1BCXeBPlkcN12Np4d0b2mS
	dPeY++8zxtsxz3hlqzM6bv+Lf5ja41w+eRjOrhaKpGzc7K8dvtD3iXDrifBw38knSrlsTtWcCIkGW
	odxD8sf5bZPuASMXKvQZ81sOLKUUA2jhRP3hFruFejl1jD7to8y89cNzyigj/+vBHTjygaCZXuNAL
	67gt0yWg==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLokB-00Bp1L-12
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 17:44:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbc59de0e2so55863915e9.3
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 10:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689702192; x=1692294192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98ERLGEzzFsSGM5kWcXTpFq/KRJ2f5sxbyycdksneCo=;
        b=YYm8PUxAVR223qq2FGu7rlknrk0r+PwaSRnJClvpTpXDLBU17aO8J6lCfNRUEE4C7V
         9ebMljIfMH/fHHANYn+Kxqh3Mw3nq5KvtYn3PKH0b5m1R2a9Ep0YI2NJqSiRtS8uCOFT
         AKX2y3mOVAbGo9g++6hCqomP+nekoCFFg1VYSOFD2IDDO7y06Ahgr3idr6Csh3Y1TZlD
         +YZs+XV9oKK2I/wesJ1DQd8pUhXeZZ3Af1lW7JvaHJGKj/ohhDYGnNxlr3WBH4VXDx8c
         5TAtVsmDeVCGkyp/oZi/A964+NeZvdSiyNkPMB/sDU9WTRV1NeUzs2ITnP/4lKNKGrcZ
         lhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689702192; x=1692294192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98ERLGEzzFsSGM5kWcXTpFq/KRJ2f5sxbyycdksneCo=;
        b=JZEqDaRhp/L1VYSaK58qIAp4vioRy4eakPtLeYNa7qQ9qgQqP0PNAcIbljVx0HxY84
         PQbRGe/+Tb8jsF8BryGgcL37SWNkPdIjzgN/g72YghBSGKTRigZxtHklrgWIOErAkIi7
         XhwH8j9HLYjUXbBCzgyorvq0TOFiqNI/q86IUIjTSNi9WQQ5gAdbrctkPBSoUhzbVMZ7
         LRyUoKPR/0Sef2P5iawVqMoB40O+vM+78jfQPKWkOFTFUOTsKZ0MZ65x1y+YwnwEi1zW
         gzvlBTB2ofg/pJMbmAzfEilc1RjoqT+Xf+6K2LywtIv/E5dkcNzVFs9FwlyzxCxsDQwe
         tAZw==
X-Gm-Message-State: ABy/qLYlLq3W9oT3idZwy3w8GRmsVdFO1dJz+PT6rCEv8Nn9dX+KLFCE
	I+fQDGPv5CiJbn8N39wqgx7J8w==
X-Google-Smtp-Source: APBJJlHyMltQW8ciWBdPi/f4EOTqO9ZS9c26e5KDJ8Qq+syvkgJ09AZ87262Y9A/jo9xrK8GYhDuVw==
X-Received: by 2002:a05:600c:ac8:b0:3fc:6b:15d4 with SMTP id c8-20020a05600c0ac800b003fc006b15d4mr2658444wmr.27.1689702192236;
        Tue, 18 Jul 2023 10:43:12 -0700 (PDT)
Received: from 1.. ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id b5-20020a5d6345000000b003143b14848dsm2951442wrw.102.2023.07.18.10.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 10:43:11 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5] mtd: spi-nor: Correct flags for Winbond w25q128
Date: Tue, 18 Jul 2023 20:43:06 +0300
Message-Id: <168970217897.7924.10145147121934448003.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230718-spi-nor-winbond-w25q128-v5-1-a73653ee46c3@linaro.org>
References: <20230718-spi-nor-winbond-w25q128-v5-1-a73653ee46c3@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=610; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=yycelzf1xRPrlA4DjYfbz/GMcmdf2Vty6uB2xU9GFBw=; b=owGbwMvMwMXoHervvrRX5CXjabUkhpRt5zV5ePc9n3OFQV3i+da0ixGMHXt+7jgqN6Hj24Z61 Vql1DD/TkZjFgZGLgZZMUUWWSetU+f5TuTGyf67DzOIlQlkCgMXpwBMxCGSg2F1Z5l7nyNjsEFZ 7qUz0nEFgbNaMg1KYxckd1SuLlc+qN02abPGc7GetmOart22S1U0m07NOJcr+8j8pxATg4DJr4K s4kNaEjEnHxw/XLvovliKT2D9tIlFAe5hdyt7FVkvMTPMzk4Ktv12OjxW/q6xbza3q4lH2DHBHQ 3P74ppFv27GSfccS9VUS1jReKh2ac/mIjumO/u9S5NZ/aX9D8zL7YyK7ybuajy9c56vjMcKzMf/ Eo5eMefqS14fbrIb35Zi0srngpuWrKqwuurkO2dS3X6Mqcl6wSNJqTx2k0Obrr3yvtCcQ/H270z VWUq/uRtbH5nZRi0cJ/SC4HFM1+lreVOK/A/FOE1oXoCAA==
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_184415_546208_EF4C78E4 
X-CRM114-Status: UNSURE (   8.54  )
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

On Tue, 18 Jul 2023 13:56:11 +0200, Linus Walleij wrote:
> The Winbond "w25q128" (actual vendor name W25Q128JV) has
> exactly the same flags as the sibling device "w25q128jv".
> The devices both require unlocking to enable write access.
> 
> The actual product naming between devices vs the Linux
> strings in winbond.c:
> 
> [...]

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/1] mtd: spi-nor: Correct flags for Winbond w25q128
      https://git.kernel.org/mtd/c/83e824a4a595

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
