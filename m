Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583BEC4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 17:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jl5pTjxbAucQaITxVyUCuD/4UXbms7oYGlbfz96nhE0=; b=QH5KgtbYdqhuW8
	+wfCFaHw0seXKvgp+Aniy+L5fBTpQ9SaeCzRn2OVypE2fedxUA+snFi5I4NDleLKHNxwt27eaq5rG
	LlqlEJtOSXGIMARGm8B4orFgdTAHahAJkxw4ITBz6J9K1J1d65K0IpoQJIjUyZfzO6QUtu6Dihm48
	gNN1qJobRnhlySJz1mKbLaWAYsJYR7UyTTnozzW+e20NytUduqzfjtQ6S/8xGIu1Lnh7OnHNV978r
	lQwKfpN+pZp3xJDNkVTstmZPwy7LaOWUISJZaxAmY+Rayks0IMSvfJA9UKHhXqqsecjB+nu/EwrYo
	ygEdGzj3SBpPYOo/HKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qybtz-00A1e5-1R;
	Thu, 02 Nov 2023 17:54:43 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qybtt-00A1dP-1t
	for linux-mtd@lists.infradead.org;
	Thu, 02 Nov 2023 17:54:41 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-53ed4688b9fso2041279a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 02 Nov 2023 10:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698947674; x=1699552474; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2c7YsGccKrWBpx6EFLhnyV5IoeDT8xDkW+k9YfMiNE=;
        b=m1OhKMuyBtP60vg/ioUgUmtXUZ+LpLm/F0aL5pI9SFsAYAGh4ZgJvGijD+8xAj1deL
         djzA6GMllN89/gbDCqevNviHcP6nScDTzjYfAtgWzBM/m8GljhC1vrjcV32LdVl0J5+Y
         EfVmxkF+K5VqOMuCDkg8KrixSUTo4vPQXsJrLtnqbdi/qWAAH10M0FhYzOF5a7nr6nPZ
         Uk7dxZOQMaDsv5JtKVm0h6FIanFbu77knT0thY7Q2cBjeWs7YTTeDTjBmFSKRL4JashC
         1X1DAfmi1UjTAeiEtOI6zMR0CuexJg6ivU3U/4hRWMYiK0FVvPf87HWU2kBVHvD7RLWw
         wBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698947674; x=1699552474;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M2c7YsGccKrWBpx6EFLhnyV5IoeDT8xDkW+k9YfMiNE=;
        b=rQDMGNOKtJV22Wq16rfKvq4zTVQE3isEGwtp0kyteGqZVYjRWImSYmzDkQc/m+ghOC
         8zvXkljiGdrDzfM5qdJdQ0HD6uNni6HMK+0v7MS1IQS7V/zdX1z8DsMISl7MPvEPkNUH
         H8AXioBDGgTMBmJ7fHGYaU27iQ7Wfypo2VWn7tk0X3sk2e5atntX/KWBxe7Ge+H7NPez
         wNnDv5EFu8t6k2Q5ikb/Z0g1sg8KXIBqgw/5z5h6Nml7T7DsiDpp45F9gaYVXnChfc0g
         NWl35qs2Uh91qepIUi08PTPweJMS0A0srYUB46n/MGItp605oyzQUp5+1ykaLjk8HLwd
         mTOA==
X-Gm-Message-State: AOJu0YwHTQxG0hKFRyOr7P49N1/XPsmJFckW/lu9iEmoSsBTT5cURMaR
	rr5lPwjY4Zsoyqqx1c6bvSq+2w==
X-Google-Smtp-Source: AGHT+IGkoy/foCscS6MAZz2+KsxnHF0jcOYoDV9K0cZmy84tLhOqgt1f0/uJMPvfrxYcV3hhC64T7A==
X-Received: by 2002:a17:907:807:b0:9c5:158e:f61e with SMTP id wv7-20020a170907080700b009c5158ef61emr5734449ejb.34.1698947674476;
        Thu, 02 Nov 2023 10:54:34 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id i9-20020a1709061cc900b009b2cc87b8c3sm1395407ejh.52.2023.11.02.10.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 10:54:34 -0700 (PDT)
Message-ID: <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
Date: Thu, 2 Nov 2023 17:54:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Fabio Estevam <festevam@denx.de>
Cc: michael@walle.cc, takahiro.kuwano@infineon.com, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <20231101145853.524045-3-tudor.ambarus@linaro.org>
 <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
 <216d99d671caa2465519fcc3360c5001@denx.de>
 <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
 <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
In-Reply-To: <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_105437_660417_BE66B578 
X-CRM114-Status: UNSURE (   8.11  )
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

Does this help?

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 05f3e93794bd..54e342a7e73c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1870,7 +1870,7 @@ static int spi_nor_erase(struct mtd_info *mtd,
struct erase_info *instr)

        if (n_dice) {
                die_size = div_u64(mtd->size, n_dice);
-               if (len == die_size && (addr & (die_size - 1)))
+               if (!(len & (die_size - 1)) && !(addr & (die_size - 1)))
                        multi_die_erase = true;
        } else {
                die_size = mtd->size;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
