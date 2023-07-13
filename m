Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BF6EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 11:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KmdbUqb2rorgNPn2x6hKbiW2ahvR58KsTWFlq+igo+w=; b=Q1O3WSlHLt/aaI
	HKHbMwVNpZqObsNz+Oh2nXc1oUTbd9J8Xqim23SbWLVCPgsh36+Rme0Ngk6YGZoLULN3VL4Lxi+c1
	2To1SAOBAYHCOWP+P4l+UofosDUNIciR67Dy0k6cBo4HLoyCrfKilP8TN8/9HsiCN8ULXC3aEsyt+
	RJ9C8jV8GCUeEbs5AqkevedvWdnty5PhfeLDXwi/zHocFSldFyLs8tn2sdsTExQAkMTEREgmbbFB9
	1cMHeWJCqvNqqbMSsFg9Lq8j3PrOS/tuwJwiyT+tcntchv0i/wxB54yl3OpKx4sL97xvYwZ5HEOKE
	sJD/UrdLBVcLBMc0QFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuS9-0034pc-0X;
	Thu, 13 Jul 2023 11:25:45 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuS5-0034pB-33
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 11:25:44 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3158a5e64b6so697982f8f.0
        for <linux-mtd@lists.infradead.org>; Thu, 13 Jul 2023 04:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689247540; x=1691839540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X0vKf1zs+ZgtEJ2oYzwaLCBOP/8w/8N4x/DUGall/y0=;
        b=Mb5W3UGq0K6PMDeDXpV7yWPresyuN3EWVsKIjh/HlsuBLmQpgz2sgareb+46tsWBLC
         EeptKcZ0UhiZ62ZpDWNmAsMGGzZa623jX6B+t/Y+DpikeigiToBZ5tk0S7wY+jOdZX+/
         XuEMCpG+qmBKkFJNzBc8u4BaFdC4vjkKGemt6H+JQIhRv0wH41V0eJCvkJz+VsS/EvVS
         PJf+NN8RiZ+/EPbATZYI5hfyaMZo0zYvkbkDqzUePTYC6JAxXQsA2Qc9SDxk04gHSemA
         iZKAl2StNEoC/HixmxeNYreV5RqWEVJO0DjITj0TV6CUkbeZmMWQge8uYl+MrimLReKA
         PFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689247540; x=1691839540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X0vKf1zs+ZgtEJ2oYzwaLCBOP/8w/8N4x/DUGall/y0=;
        b=B8P1+/SIrrVAUo8y8OSUalf9HXOCKQ+FZPBM40zwCOofYmXKjg89lbVK3mxjrHhG8+
         HpIuFwXKqCLC3xposO6RNbcrELKiHB1YvefVOr/j1aQGDRcctGTMFCnDoTyI4LUKhsv7
         9BCb0b8xLLfE+0NL5sWYqkI3HhMSMUuyFeBsrTO8kYVUhi77jikBGL3M7GXrKTICbvgd
         gtqD9j1w7ckinxAJTdmN6R3YG6m2YFJBoIoc6LhydSD6SyGc+qwvtq1A7Q/OSchcJVMQ
         z+yyY2hnqHBwqeVcwKsYH/RKLk3YRpi75t1dLqfcslt6l20fFnBKBnu1joxsIWbGvkca
         NoqQ==
X-Gm-Message-State: ABy/qLZ3YkeEJC/ySQ8dvbtx6WcCAZfal4HnVGifIY3p6SqdF1T/y/qN
	GFr9ki/bcCEcmRyQ/6rd47PJuA==
X-Google-Smtp-Source: APBJJlFVwasQXx0IzTX5dOjq8JpsLPQfY5tOkrTJ+7b1T+gbDx/zQM5wXYJe5dQLW8J/70e5pUsDaQ==
X-Received: by 2002:adf:e5d2:0:b0:314:2ff2:b051 with SMTP id a18-20020adfe5d2000000b003142ff2b051mr1178686wrn.41.1689247540434;
        Thu, 13 Jul 2023 04:25:40 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id c6-20020adffb46000000b0030ae3a6be4asm7706803wrs.72.2023.07.13.04.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 04:25:40 -0700 (PDT)
Message-ID: <76b5a9e6-bf90-e63f-0669-502bba0bd0dd@linaro.org>
Date: Thu, 13 Jul 2023 12:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 1/3] mtd: spi-nor: Modify rule for parse sfdp
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw
References: <20230713105058.101321-1-jaimeliao.tw@gmail.com>
 <20230713105058.101321-2-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230713105058.101321-2-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_042542_361518_1E3BC80F 
X-CRM114-Status: UNSURE (   8.18  )
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



On 7/13/23 11:50, Jaime Liao wrote:
>     With various vendors adhering to the JEDEC Standard, the percentage
>     of SPI-NOR flash devices on the market that can read SFDP table is
>     increasing.
>     To enhance reliance on SFDP table, remove PARSE_SFDP flag,
>     allowing all SPI-NOR flash devices to read SFDP talbe. The exception
>     to this ule is for ICs that included SPI_NOR_SKIP_SFDP flag.
>     Furthermore, to establish a complementary relationship between ID
>     table information and SFDP talbe, organize no_sfdp_flags into
>     nor->info->flags.
>     The flash parameters are then organized by spi_nor_init_flags.

what are you trying to achieve?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
