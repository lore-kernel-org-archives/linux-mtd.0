Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C5DC47258
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 05:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czbNxd53XX2Ymw/4jjQfsIMQrl/eQPMK8BMPKakGO2Q=; b=tW8jlR3+1M89Mw
	pz5V4ghrbwkrIB0Z9oVCHJEC9+aKsykUMSzwSPAZudPy11yBm5fX9zOyNeto7wqlIxoJVuYqBGDQR
	EUQiFMsswQ5+orY87Q/ImkHvwFQxuIzSGwi/TiueFYuTm7EJ0wemrDk2RVMReVLwIq85urCUKIJwN
	ygptSIKV8Cb9JUCHbOJnRolvlvXYgJBO0GdzBZORyUVhf7Vme0sc9eINHE7b8V08GDs9edE2ZyLaM
	AAvXQbdLDjsIVTTGzK6v6fqZED5WZc7+hCN9g3ePWJYHYTuQJvNKJf4jw1zJCTFyQ9SnaF9S4o6RK
	JmGyHamGNegdXGSh+rWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOALq-001xxg-2q;
	Fri, 12 Jan 2024 05:45:06 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOALn-001xwK-2G
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 05:45:04 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-28c0df4b42eso4980667a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 11 Jan 2024 21:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705038302; x=1705643102; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rJ6WYMP4n6++vBNu5or8T5xc3E33jbxEjknN6ZOAaU0=;
        b=RAtKMvjCeiSp4SNnBTUP88Z8U7tQYefklu26fUiWkHEhW6UlKtQ+C2z7bdLW/m5Y27
         rwlblIOCpFCx93tXUR+22HDc75GW8A7zcbnWTpQXg4gz6f8p+XvZe61U7gqDzdEHpurv
         x6JY5pMv3lfMHu76dz5eMw6DdZu8BrCg3jdFEFYIeuwZeSA4nKD7Ri58C9am4udUTC1M
         t/QkRXuMuIJ9ium6hWDlF9JTjq5+NcihLhuMU5cIjMNNk4x9D7cdMRCQXsLq2o+ytSay
         hLmSzQ+zDyjSzUTt5VBuHIAe594yb9rOhenf6ZSS+XWeVaQQWyLNXT6EK8QqOt6ohgRL
         6YgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705038302; x=1705643102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJ6WYMP4n6++vBNu5or8T5xc3E33jbxEjknN6ZOAaU0=;
        b=GxW4A8eCf25Rlh+gtW0Q427WkHLbiLcVzyYpPWKbP7v3BPkcWptgNicugx0m8vEJnO
         XxcwPWDIsMdydm8EdsReDo9DA7HoGcDWIXuAewlazohbHKe0SZ/KdVyuxTqpT8v/Hrv9
         sbXtd76F5Huj55ds7KohZUMft3vdti6jimQQq/Fn6c+sqAugkexPz9RVXJSXc34XviNN
         2y63Q+7pnTISTBltIyE4A1E2U3679y7ED4Dxgpjhhkou0L2jhkmdlVyiWTXsD58rL8l7
         ePSj+qeyksr7pL9pQgFetipKXTsmtfMhv4iQO8fozAS2D3VHcS1+4s/i7zxUZ6QMbW/n
         a3tQ==
X-Gm-Message-State: AOJu0YxwmmKk90tKUlOxilsYFbfsqSpXSmSmX2ZoEDcCYXk67tUgi/xa
	4/0li8yRQCh1QSJq9FoPWz5uD3zc3kCY5FYd6Ag=
X-Google-Smtp-Source: AGHT+IFiJse/XKivRkYhPbSUm0IjBGd9swLG9s/C3Ulj45Ame4sCNcj2F3N+51Bpd+oRFvQSCmV+gj8tH/i5RdhEGbY=
X-Received: by 2002:a17:90a:e514:b0:28c:4527:ef9a with SMTP id
 t20-20020a17090ae51400b0028c4527ef9amr1299139pjy.40.1705038302021; Thu, 11
 Jan 2024 21:45:02 -0800 (PST)
MIME-Version: 1.0
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-3-jaimeliao.tw@gmail.com> <0c80946c777cfe2019ed5d183b5be304@kernel.org>
In-Reply-To: <0c80946c777cfe2019ed5d183b5be304@kernel.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Fri, 12 Jan 2024 13:44:22 +0800
Message-ID: <CAAQoYRk3tHU-Em63XFJLi=PXo+WALVoj+V+kF_-X4RJ-LB=t0Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] spi: spi-mem: Allow specifying the byte order in
 DTR mode
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_214503_739501_48BEB504 
X-CRM114-Status: UNSURE (   7.13  )
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

Hi Michael


>
> I've just noticed you didn't include the SPI maintainer nor linux-spi.
> Please make sure you run script/get_maintainer.pl on your patches.
Sorry I missed this part.
Thanks for your reminder,

>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
