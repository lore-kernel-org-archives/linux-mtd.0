Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA60C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 08:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XsPkO4C4Rvj9BgjMwH+hAIyj3vHGIRgBEYGumwmQMXs=; b=DLzFaUwVcM52yF
	kC/HasmEfk/z9OJ20FtBjkqxjsXdCV3IwFrIst22qAGQM/iFzZgfV2XHxZPyWIKWbOSG6lqENgj6d
	g50UwPS7QLgdD/C/W32jvUsPFxLm2c12GcNO3lVFsC8Lzttr/cPA8hdG+RYBiOilg51GIjekSpvjU
	brGXFCgWzpJaZZZhTLXfS5duOLknlTMpIsz4umu85oDsmeDG+jB5MEhU+6iqr9Hc0i84TQKUSNikj
	nPX2HpZYvurW0DZ1EgLa+pAnRuaOnAxTASJUPrxrh4VT/KNqMPy9xTSAx8qbD8NKvppEDMr90Lx0X
	ZW5a03hih819/RAKdFUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3V5-002Sh7-2C;
	Fri, 15 Dec 2023 08:24:51 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3V3-002SgG-0A
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 08:24:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c6a71e88cso5111335e9.0
        for <linux-mtd@lists.infradead.org>; Fri, 15 Dec 2023 00:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702628684; x=1703233484; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sll+9qWsACg9WSZZSvDuRd5P7YLwP0CwcrFN2KVP0h4=;
        b=g3lm102enq8OmQ4YRGkYgNivBnbpu5PxKTx8AeAqoXiZuUcH2nLiLXc6Bbea53Ri8w
         +YTqFHZy85oGBWU5/OuOL33Qv9wpj9tsZp42VT5H8ff+UrvzkDqnC6dJwycR5AIw5Sfc
         N580NhIkOs+Yhivv7vZyZHYSb/Jz8ECpneIBZBLzm8QoM3772X8NKnme+j1f2PoMosKt
         CAWmCaazTbo4URTnJqiMFWWM4XZrvKP0C7RDII5fTefkTn4s5hn+EOP516PBfTCpmYi2
         JFoAjgxEKs0czzkx5GbxJJQAGDHOhVpSg4CnxhKZoSM4TTeGwWJaPYtMG8u7KvDOtt6Q
         6m0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702628684; x=1703233484;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sll+9qWsACg9WSZZSvDuRd5P7YLwP0CwcrFN2KVP0h4=;
        b=Nt3veKtwGjr/88hSRsoswFRmChg/0uFt0dq8Xzg6R7nHZHBijF+au+jX8aBmw3sAHk
         Mmo9oilgsukAR6EgaSyJNLs2ldu9sugSeGnOeC3x1ak0YW6cB9hSIsbWZpo5qlEVzMmQ
         sxbp9XrPQxWVaLhiMruIwrRwx2xOahTrR8nvRYHaBvsqFWiR277dl5lio6gzXZj9CTL1
         ULB1mM22cEkfYoQaU8i6xCWAtvXXXReVP/jysGaUi6hSNz48llEKPg8EHajHks/8XDD/
         YmatUkWR9KuU9SZYMfO/mbGDhcPW6K5NjuXIAf3FlI2SCUvO9so0drSPvQKAT4mP8lk6
         xgfw==
X-Gm-Message-State: AOJu0YyXFGxScey4AQ3L6615Oyftjn17FOJmLBPyfcPisPjc6S2vDf9P
	NSZlrU0xGdaNMR4kemiTXdKIFA==
X-Google-Smtp-Source: AGHT+IFC8/hzB5AHQqnVCaSLspwYNhdYIQ/9XR47KJueX6t6Iyz+C59Le/39vFUnmejukr2l5BqFTQ==
X-Received: by 2002:a05:600c:1e0a:b0:40c:6c79:2a43 with SMTP id ay10-20020a05600c1e0a00b0040c6c792a43mr159046wmb.108.1702628684547;
        Fri, 15 Dec 2023 00:24:44 -0800 (PST)
Received: from [192.168.2.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c198900b0040c490db950sm17872657wmq.47.2023.12.15.00.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 00:24:44 -0800 (PST)
Message-ID: <120bf090-0c07-4971-a18a-a1b326f1b139@linaro.org>
Date: Fri, 15 Dec 2023 10:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mtd: spi-nor: drop superfluous debug prints
Content-Language: en-US
To: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com
Cc: richard@nod.at, jaimeliao@mxic.com.tw, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231215082138.16063-1-tudor.ambarus@linaro.org>
 <20231215082138.16063-5-tudor.ambarus@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231215082138.16063-5-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_002449_119424_5E041A03 
X-CRM114-Status: UNSURE (   6.28  )
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

I missed to drop some unused variables. Will drop them if everything
else is fine.

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a708c3448809..92c992eb73d5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3492,9 +3492,7 @@ int spi_nor_scan(struct spi_nor *nor, const char
*name,
 {
        const struct flash_info *info;
        struct device *dev = nor->dev;
-       struct mtd_info *mtd = &nor->mtd;
        int ret;
-       int i;

        ret = spi_nor_check(nor);
        if (ret)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
