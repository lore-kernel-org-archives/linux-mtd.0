Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AA3C48BC4
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 04:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8A0urGLXQBGfu4WwlsDpnpzCZmGQkV2S2KbyH8BRibI=; b=lBXJAeYUSeV+2q
	6lbKdoMN1NB21mRuztCKAURLkZgajrJ9KQWqz14OzcT4o/L1eRyC91MNlYtt1MRG8chbWbfaV2/0h
	SmLqzZnDYm7hnVf7/A9Kpjn5iiBQHcuT/Jl7tgqVAotZvvj6sGedRJH1jBYh5tp817VU/KozwJcRX
	0PVkWD3YdSEauASGQFKh74iH1K8NHp0uac1xzh78tFSQpFT1mkDNRx3coDzxoMUDVNFyftkmjOuK0
	CfG6QyBz6A6zrrbSRK/bGASmmYkXiqi1JfjrlSp0aD9MO3I4HzHYfu/rnm9dzOd8uEHQ+nDNXrvCw
	GYSdq+TSRNK00DPtq9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdN3F-00000007oWT-1YPO;
	Fri, 23 Feb 2024 04:20:51 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdN2m-00000007oTX-38CO;
	Fri, 23 Feb 2024 04:20:18 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7d130979108so203888241.1;
        Thu, 22 Feb 2024 20:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708662013; x=1709266813; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IlVNrNUcEvLBYtZ/R3wczPrppgdB8B334NNJl78BewM=;
        b=maPsMYfgB8Vk112BIjFIEr25cIyOtbjkfqAchNwCFg+eB7gon5fINJh5Sr+otJpXQq
         uUp9vBr2jurBeQgEP2j2h00022Tp20/9ev/1uzKV2zhEY74MTGZq89CIOKy0wH8nnVwR
         fmq8521knu28jxl9g7Lrv1Y1PEneCB0PgBnb9QAl1kCuB1Jad7KHyBcfaINyb9ozbkqj
         jbVwvjImN1L2wy6SoRvPBXfeQvuTKrWH5dYYwGapPP5NTLWUnaTLK41Dr8kbZ0xwXoyt
         1sc/tgwWiutpF/q142C2noNonwX4mzuqGIO4cLOKbiTV2QVtRwwmUQoqOln6Cp5Rky6o
         Mhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708662013; x=1709266813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IlVNrNUcEvLBYtZ/R3wczPrppgdB8B334NNJl78BewM=;
        b=VgWlploorhXM79wELML/HuHLaGefPQqEtL/05VsYjHMgyT6ajPQFnF2L8PSdaSVJyI
         F9tBEtHaRt/2cGKvt1jvSMOiIgJU97c9BhM9IYKBZzbvn7PZKQOyfa1iOSLod5ocNx4Z
         dnyXOMjmUgo5kt///OnL5ykckBHYTbxS/ItOYlCyExuoW5qsByHwq+EWrVkd/LSjFBW3
         b2LfvAYjyp4WjtOp8AauIdwNP7qtTb4PufMVJ/+gJ5xCmrx2Wlxqprq1VgcnszWgYpPx
         QK3KdFwcwDvuLIbPq3FhwZC50ctyXFV5tPXlBW8kV0EzelqeyvRv+lDwBTXOrIseVsMQ
         r0AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI9ojRea34IfXIupJwJtv2ANxZEcEWcXXIO8Sl1SIy5LdbU1ljakD21/5sMzuBtjdZzEpARlR8HYr5Kx59A/d7dDbzJ+J9bPf5c0kTpys/K+FVEj0cpst706ZKVqETwcqP2cpZHGmwai7GuDUz4zB/z4Ou
X-Gm-Message-State: AOJu0YzHKPRB+FZjUbi+FAWKJWIrx7401gZANX2Q0hS+TyyUb+Q9E8bd
	GpFgnV8CE0Fdc8OvLBYTV7QgoP5MJL2hZfYiTqO/+ZFdJvpJBjv7
X-Google-Smtp-Source: AGHT+IHNYz8ui9bmM5AXfuUQTZHUJJqwDxpL3NhzRWFZom+4Tbuq2mDgCO5c/ar3KzUA7uEadTMX/g==
X-Received: by 2002:a67:ad19:0:b0:46d:2d23:f500 with SMTP id t25-20020a67ad19000000b0046d2d23f500mr951202vsl.18.1708662013521;
        Thu, 22 Feb 2024 20:20:13 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id xq18-20020a05620a5cb200b007853f736893sm6004275qkn.5.2024.02.22.20.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 20:20:12 -0800 (PST)
Message-ID: <dd64a40d-0a7e-4f70-a516-632a3d57807a@gmail.com>
Date: Thu, 22 Feb 2024 20:20:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/13] mtd: rawnand: brcmnand: exec_op helper functions
 return type fixes
Content-Language: en-US
To: William Zhang <william.zhang@broadcom.com>,
 Linux MTD List <linux-mtd@lists.infradead.org>,
 Linux ARM List <linux-arm-kernel@lists.infradead.org>,
 Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 David Regan <dregan@broadcom.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
References: <20240223034758.13753-1-william.zhang@broadcom.com>
 <20240223034758.13753-2-william.zhang@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20240223034758.13753-2-william.zhang@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_202016_936120_DF73DBEA 
X-CRM114-Status: UNSURE (   6.53  )
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



On 2/22/2024 7:47 PM, William Zhang wrote:
> From: David Regan <dregan@broadcom.com>
> 
> Fix return types for exec_op reset and status helper functions.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: http://lists.infradead.org/pipermail/linux-mtd/2023-December/102423.html
> Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> Signed-off-by: David Regan <dregan@broadcom.com>
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: William Zhang <william.zhang@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
