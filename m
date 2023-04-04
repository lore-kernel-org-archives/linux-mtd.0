Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0953BC7618D
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Apr 2023 06:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRRyOI2tVylW2Dkc7XmygaeDY+upXNmDn8j7y9fIj74=; b=C1lEVMMGCUJclm
	gRyfKPYRsx58YcS7ocl7ZDtiL3rHmdiaGZoCFStMNU30ImAFXqnpHayM0C/KnCjcasasSTnu/OjHG
	HstsFcwqwiG1qKUZOd3ym2e7UaIi+i9WGtq4eArsHOYRFND1If32ecSLx7Vdbb50Op6FeqEtg6TdP
	tMaWajeoTVDTa0fq1UOgXcCazO9GubS8PJGqmkiwZLVB2+YGnJ+iTc/8pfAqgJg5NIrlIsuE/BX4K
	q5PSzoH2Hz8SnTuOgXZFBIC4TbnwUjP/qhXlIn23MA6j3s2uY1MjO0ZFjC+6OHejpZA83lO5N41sK
	mdjHv9riHX9PDuIlH49A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjaRK-000ERE-1X;
	Tue, 04 Apr 2023 06:46:46 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjaRG-000EQ0-2G
	for linux-mtd@lists.infradead.org;
	Tue, 04 Apr 2023 06:46:44 +0000
Received: by mail-ed1-x52b.google.com with SMTP id w9so126386629edc.3
        for <linux-mtd@lists.infradead.org>; Mon, 03 Apr 2023 23:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680590799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6reM3CR+EnTJl040eW8tVHsbd/S3Hsd46LjmTMEDqnA=;
        b=JUBRKmd0w7gCq8gb3tU35f33XiIF1cyp8CJRQT5f4GOLNO1UnQR0+s9pA/JAm3lwi8
         iGn8/2gwzhkqWHIZc25AZ0Kc6PDBxzzZ8SLDEfgXbP6LNIU0nvolZ7f186HFTun1y/0p
         wb+1dB3TXfCjeo45pMYubW1drPFeX5YzqFUcYuEzdKFjwD2opsqmMnUt+EQo2rbElnbx
         IWUI5CsKpwqa0N6IP7d2vVSaurhYWu0ck9OPbfm2GDf6+ueeGEVTzqVm2v7CnwVB4tf7
         L7qfchrkKPhXikiMfztp4GkquYSlltiycqidARpDbHcPJ4tm02q8MydZDcsibedwmEOS
         PyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680590799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6reM3CR+EnTJl040eW8tVHsbd/S3Hsd46LjmTMEDqnA=;
        b=K7AkGqTgqGYElE95AcIefTzd4QthvpiZJaDtkdiX087ox+PQwHm4tP+IjS4FYRd6Ga
         yPxeBDtqs0VHDGWy3kAf7z12gocFGbYIukUMPv2wu+JnTXXwIdWp3sVjIIkMjtj+HoAJ
         k6I6mt3l0Xr6TIVVrvfBkYGXCqEZRR6uCIaZqaoiTFfjfm/a1/wlVwFTj8jJKetj3U3A
         3IGm/Dzf68gT5lOWzLA5M0HQyhlNjpgeA6BBR6NgT9yWC3vFhNrq2aatqtuH0zFnpagJ
         y8TUY3LzFG6VevVHuLHC1DHM1DkCcSWbD6pGpjLPIe2wXiNdSlSMVcqoM2vp+gMzD64e
         s17A==
X-Gm-Message-State: AAQBX9eIKfMFdAnd5F4iMNbwYgmneOwRk5wonloGQprDODMGSMM4m7Ec
	dL/88JrzwEiZECJR30f/OCjckw==
X-Google-Smtp-Source: AKy350ZkQtMQtYty+O/TBwrZMdG9C9bNjCJ5A6TvzhOOT+A5FHhbEYFFw9PwVBET/FGYVeJ5Cz3OlQ==
X-Received: by 2002:a17:906:71d7:b0:920:388c:5c60 with SMTP id i23-20020a17090671d700b00920388c5c60mr1295527ejk.41.1680590799334;
        Mon, 03 Apr 2023 23:46:39 -0700 (PDT)
Received: from 1.. ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id h12-20020a1709063c0c00b00947eafc76fbsm4488311ejg.144.2023.04.03.23.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 23:46:39 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v6 1/2] mtd: spi-nor: Delay the initialization of bank_size
Date: Tue,  4 Apr 2023 09:46:33 +0300
Message-Id: <168059071208.13361.8364230840096938172.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331194620.839899-1-miquel.raynal@bootlin.com>
References: <20230331194620.839899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=4ZLv0CykHZHG3xfkSUG4VcdQ7UVUb5iSYaP8mea/gMI=; b=owGbwMvMwMXoHervvrRX5CXjabUkhhTt4yeumB6Lmay2nfeVIjcDzwfnw9O0rxvccvZknPc74 MuLSgGBTkZjFgZGLgZZMUUWWSetU+f5TuTGyf67DzOIlQlkCgMXpwBMRDuZ/X88958QyU6LjFTm Azabf/ae356vvCXn/xpmvtWx5Yu+VHoYK+sJHjc5/UZybm+6nZBG+MrbU1Idsl/mnFc9n6JxWvf f+XUTkmbtUgpeaP3G+TqHr4qMYd6+8xPN7ns/WXPZ/eMNnmNVf987zYkWUrmkpr/ztJx86k/WZM 3VPI/4Cy1eenf57mXJmmew71r+Vr+TPv7Xo59+FeNwltPcUOfM9u5J7BtTwxu6MnVB8tkZytOjO hMir2vuLtu8WZzdYe/eh2/f8//2OjNLsadKzKjo1Z3Y0GfpM43OBSUKTi3z/VyZzrCfxc9o94V5 mTPTUqyNwiP5bReK+HSe+Kni5OpjoLlXx/lWmKqyvtNXAA==
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_234642_771519_352439D8 
X-CRM114-Status: GOOD (  13.70  )
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

On Fri, 31 Mar 2023 21:46:19 +0200, Miquel Raynal wrote:
> Bank size is derived from the chip's size, which in
> spi_nor_init_default_params() can still be zero if the size is not
> hardcoded in a table (eg. sfdp parsing). We need to delay the
> initialization of this field in the "late" helpers.
> 
> Based on the fact that RWW compatible devices will use the bank_size to
> derive in which bank an access is made, we absolutely want to avoid
> divisions by 0. Right now there is no such opportunity between
> spi_nor_init_default_params() and spi_nor_late_init_params() but it is
> probably safer to enforce a default value (assuming 1 bank) as early as
> possible, just in case some day code using this variable is moved
> earlier than expected.
> 
> [...]

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/2] mtd: spi-nor: Delay the initialization of bank_size
      https://git.kernel.org/mtd/c/79a4db50192c
[2/2] mtd: spi-nor: macronix: Add support for mx25uw51245g with RWW
      https://git.kernel.org/mtd/c/f0a499acb4b6

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
