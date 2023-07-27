Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F46C0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 10:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmajfRnt6jl0l9IDXFi6zaZ0vqaxDILdWDGMi2WEeH4=; b=t7oLYvEiQqjFT1
	JJZ61njvkGkprWdpTM7rlIL7sOLM4eEz78XdBD/MjixI8aTtFHi3iojEvhmolpD7F6LGqalIexaey
	atJXUYnK20NRfrwzJpm+/UZWIoUj6t/zFaZJYwYdVfv1juL7Gdh3W9nhpvpcV2o772ZS1xyE5Fb9c
	F3Iaaa8ur0Xq/Qeumfd1gIt4hwTaz13LbCog6Kbd14nE6xsAlH6Y+iG6XMgrRD0yCpLFP++R2AYXR
	Zqp6M8rCx3sZoRhrNQy4DdbJnps0tLUp9xr6Y4wQ4Z7q45gvE0QXHMLUShlCfqlb1LCfdTzSLUK4X
	uBj3v1BCXr2qZAg5JuJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxrQ-00CvSs-21;
	Thu, 27 Jul 2023 10:04:44 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxrN-00CvQb-0R
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 10:04:42 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99b78fda9a8so105536866b.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690452277; x=1691057077;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WIQqexNkL0T1/okfYWbG18u8/LgniGPJaktQ2H1U3tQ=;
        b=IMD0Q5b1QvBPZAF4mvXaSwrREhoxvAsuS1vphpL252i4Dj/HMcTy1e2a+TPFqh5xjH
         ap4qlk+LtOTqJ1Ws858JXzoqmvikAjCufJIl5YaokHKug8ZZgjdnAZpoYi4gBJLlvmO7
         +QdgSiYxSh0OS0HeyoGixZkHadGbouJb5OPV67bBtcJ3RgBkFVt/NzK5tAhWu6BnjkRO
         5AM0dCrDsd9fmr5tU235RRcY8fs2eyJUagLkDPNfp0PrCraMCWc5fzlohvhlPGZsn9Vn
         hXLQiM5DhJschKLwtw77zsLms8nw5jI4/cM7+ehuLCYtU2vYyN34sLcF2wc6jjMDw/IC
         DRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690452277; x=1691057077;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WIQqexNkL0T1/okfYWbG18u8/LgniGPJaktQ2H1U3tQ=;
        b=kseizOhUsfScGdrW4N9L9k7qlBfbNl45xJJ2bB4R2brKmPxwLPTB9hikwnFiHL2mEu
         Z4ASsCZvw754Zn4sKgyZ6XKioR6Ue/2T/uxNbT6K72ZXRBzlmlps9NorAoFriac3pJGr
         cISZVaNQXJAa8BPFYZBEI9Gnr1fxUGw9a/mreF4U2Iu+TtgfJmBaWDu8me9BBnd9WaQu
         szdsmx9DZ4bN+AvWliQxVA4EcwL3KbUfcc5m8uV6Y2al31CTsycWD7CXzPiiP+jfQuoc
         hg5JSBHXf6ZpBDoxwp/WA9t/2XkNPyIzlTTQINVX6YO2IFGF40+gyRHlf0Wz3glLnkyL
         y5og==
X-Gm-Message-State: ABy/qLYIa9Fv4bBgfcNyhicqZ5yGujulvcl5ms4OOZjbex0UPeXm8Kmg
	N5McGlHdpJ8lbCpoGmYWv+OLvg==
X-Google-Smtp-Source: APBJJlG/aKgP1TEZK+Ne0UiUY1ORdHxo/8h1NzbKdo8s0URzOXovpE38q9yvkme5PZrTYazh+KFrcg==
X-Received: by 2002:a17:906:1d:b0:994:673:8af6 with SMTP id 29-20020a170906001d00b0099406738af6mr1463904eja.29.1690452277484;
        Thu, 27 Jul 2023 03:04:37 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id u27-20020a1709063b9b00b0098e42bef732sm558963ejf.183.2023.07.27.03.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 03:04:37 -0700 (PDT)
Message-ID: <0f874948-c68c-f5a1-4914-d9cafd162cd9@linaro.org>
Date: Thu, 27 Jul 2023 11:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: add Octal DTR support for Macronix
 flash
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, JaimeLiao <jaimeliao@mxic.com.tw>
References: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
 <20230727091610.234132-2-jaimeliao.tw@gmail.com>
 <ae53bde4-33d0-861d-b7f4-b86114cd6f58@linaro.org>
In-Reply-To: <ae53bde4-33d0-861d-b7f4-b86114cd6f58@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_030441_173737_193C5ECC 
X-CRM114-Status: UNSURE (   9.37  )
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



On 7/27/23 11:00, Tudor Ambarus wrote:
> +	/* Macronix SPI-NOR flash 8D-8D-8D read ID would get 6 bytes data A-A-B-B-C-C */
> +	for (i = 0; i < nor->info->id_len; i++)
> +		if (buf[i * 2] != nor->info->id[i])
> +			return -EINVAL;

check all the bytes, not just some

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
