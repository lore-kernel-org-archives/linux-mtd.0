Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACA3CF9C5B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 06:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Uv/kgftVV3g80GcfVX8kRpBbbc4hbT42/aGfxaXQxU=; b=PY+YpWQFmreFAa
	7ukSVXTCYUEhJDewClcszx6JL0q+KwO1LUfnq16a/wfxPx+Ru9pByIHlzCnR+yShbOugfCuawzD/Y
	7YQUeWLWYRE7I2t+M/oouO6MHC+RWV59hIGRDcAWQb3WwRmdT/qBivedGaUsWfXZTF/kmidq4zHlH
	zkHQL6P8boEUomq9umdSktcDhGNzBMjPUCXFOBemWsp5BgeBS6J89OS3j8Cb59AHj0WQ4qLaposJH
	R/2aFoI0WUZga15cpNxvyY/qVu1N+MvtkHP8n6mzONXvIjo86XvBqvGDZFFRzC2XTbPq4hK3OmLpX
	oalPwQvN+rLhS7Ah6zlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sscnP-0000000GROv-3uCY;
	Mon, 23 Sep 2024 06:43:43 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sscnN-0000000GROS-08Rp
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 06:43:42 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-374d29ad870so2081828f8f.3
        for <linux-mtd@lists.infradead.org>; Sun, 22 Sep 2024 23:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727073819; x=1727678619; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zgbBHbv4FuijbhlYghMI1MFALkmpVrZlKRQ/ARFR2gw=;
        b=nWefBtrQfnIogfZpx4ZbWALa3v5oLKRT0V+asm5aura7qkEanH5fOfGWSDgTcIBXgO
         e5v+fK1UC6qTxWEPuMTcFPf/NpLY+u4r2navybe5sHSx8N0CWPFf/iR6wy0oYu75wqdZ
         iB5AV2vH59HhGREwiMpT52njt7HKxOw7lkcTxgGQdqP7Ti+SIfAfWpu1TJ6maxmp8+PT
         mU2qXtWA7t/UxbUJjrLr9es7RedcKwuOQGXTE7xj/XtcCHz1AfthkTwb19IihtbJsi5G
         fOH4QqXl2acAIGlo7b/3SZQ0B/usHXV2Xk8GNHVez8pmahxGKNlZi4Q1Ip+BJ40EmjqW
         rGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727073819; x=1727678619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgbBHbv4FuijbhlYghMI1MFALkmpVrZlKRQ/ARFR2gw=;
        b=O48Q1+I8+yABWF+COPhDPW/OtuN3CA5q+As7EVXrhuTGg+Ad1SuajVWuKabaiVUQRW
         HSHf7kGyuS8BbDZjDXVfF2TjrhQeDjRe2fgzQ3XTOkRxtaexuYFh4SfRjtNeyeNkBl5z
         FiZKh3Gsp06csU4gI309j2YdNJcteVFcr1fRVMqzheDGPjz4QBDNvSufA1Dl8rF4akrG
         mF0tf39oZ6PYaEQOoqCeSK1zZk23SYp8M5GN5mYGqdgRAIULgNwwu+JiXfwkz+ZIRaB6
         nFz/sXM6Y6TQzsIp0iaemtdDfAJHgt6nOy+MumLzeMBRs9pwCzShrF0BuJRsHHTvdxbO
         7z1A==
X-Gm-Message-State: AOJu0YzJ+5XVBGtep2IeILPkagRPuitl7TqUox77DZUbBNyNrPGANLE1
	kl+szY53UHOmsUJMXlm7uIXjJ5IvKj6ppDLKniuD8aL4MOJqyOk5SXpmi7B7gzwS+qQWInZZRbb
	1
X-Google-Smtp-Source: AGHT+IGu2g8dOYoWg9b4gTlyc7bEGySh0bOJjgOXgH+TS15q5b8mvGR4EYQlvPF+nkDkuoQfq4+BOQ==
X-Received: by 2002:adf:f04d:0:b0:374:b9d7:5120 with SMTP id ffacd0b85a97d-37a42278321mr6934823f8f.23.1727073819186;
        Sun, 22 Sep 2024 23:43:39 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7afeb1c2sm91119975e9.36.2024.09.22.23.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2024 23:43:37 -0700 (PDT)
Message-ID: <bd2786d9-4613-4284-9d5d-58f608a09617@linaro.org>
Date: Mon, 23 Sep 2024 07:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/15] mtd: spi-nor: macronix: add support for Macronix
 octaflash
To: Bough Chen <haibo.chen@nxp.com>,
 "zhengxunli.mxic@gmail.com" <zhengxunli.mxic@gmail.com>,
 Alvin Zhou <alvinzhou@mxic.com.tw>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <DU0PR04MB9496BBC402007AED8E2A98DF909A2@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DU0PR04MB9496BBC402007AED8E2A98DF909A2@DU0PR04MB9496.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_234341_111824_DDB813C7 
X-CRM114-Status: GOOD (  11.74  )
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



On 9/10/24 4:04 AM, Bough Chen wrote:
> Hi Zhengxun,
> 
> I find you send a patch set to support octal flash for Macronix, but seems this patch set has no reply or following for two years.
> Is there anything missing or do you have time to continue this work? If you do not have time, I can pick this up.
> 
> 
> https://lore.kernel.org/all/20210812150135.4005-3-zhengxunli.mxic@gmail.com/T/#rf6e301cf020ac3ad2e8257aa03a1ca3a428bcaeb
I think the last attempt was done here
https://lore.kernel.org/linux-mtd/20240718034614.484018-1-alvinzhou.tw@gmail.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
