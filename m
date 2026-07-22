Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3A3C44536
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 14:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mnz+6IzXRxGxmSfFhSfOd9N0vBqfEHR6fQZaluFkbQk=; b=tImUeiEHZLPLd6
	gW0+vzjJrat2r6e0SVCO1IDz6YNxi4Gv72FxNzLRPLO31IRenmuehWxCV+oUDI3iEME+hIeLuX+q1
	d/23Kba9XuUMlgIw82YyMAmSgc22gMYPSJVz34WEQqUqpM3qTn/qnm+qDSX6jCGKo8gleNJ+sTsHH
	oftrt5o5S1XBYpcRbqV+4avKkZ3DEnTb41Jusl5Mw4iu2O21XWYXAV+/NDGLGnveRdtXyZP8WOFSX
	JhZIVce/WL4amBsklnh+aNmccVQIqA/dkTtK5lg1KA8ZWfKseLJHKFbzqBaR2D0cQa773X0jY4Mhj
	ReQNNTf9TLqAb8u4WWpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmY5a-0000000C3Ri-2c3t;
	Wed, 22 Jul 2026 14:38:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmY5X-0000000C3RF-2ISF
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 14:38:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so67100205e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 22 Jul 2026 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784731102; x=1785335902; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSoPFhIT4GcrO3+gpf71dMCyUK816G+K3oFaDYU6bdo=;
        b=Deh0IcGadurvik+GEERkSdj/adKlbdjhnOooibEqYR9QnohCJUPjIJBq1VA1RsON9j
         lqEBdmpsbj9OIHoNNQpqlon64TVIspufnkhcwgESfUpYnbFt0LOyBbUiRYFyE69RnV2k
         ggXl+Hl78Bnr7agFNDiW+dyhbtiWdQ/8tYb5gvQjwYzTEj9Ta5tQvWUoACdOgubu7nDA
         BcGfS7aIp5IKLxtlJMYi3AFYFcqDmopahr8vWMeULp1bdcqQIVwx+Mi4vGK8mn8DKJME
         wQkAEEpMQb/abHKGqNWWbnU+/wOnn35bHw3wZh33gdqrPaDdzQeNDwn7es3LONOwOcZX
         PxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784731102; x=1785335902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tSoPFhIT4GcrO3+gpf71dMCyUK816G+K3oFaDYU6bdo=;
        b=aTnnJYxp64F1HjqcKXtzPBqtLcVwLt/9iMWpsBjAvryGRHsat4y2i/2gZi5FqP5KIL
         sZoyOtDtk/65SeLS+otOoBwNz1kQevMUOhOoaJXqGKvzwK+GGJA5v2epBF3IcVUbOxh/
         nKH67XSCeaXVtH0vfjtlq18RQ9XZjhcNN9AgeeN8ObJ4yGyXnW0rqzxfm/pX3QYgNeFg
         zhBPe53HDX/I6PMQS4ZyAuhIv1k/H9DbZjvy22HtJ0ayf4g1yGKc7wReutY1BS1GYmEp
         tNmG6dL2/a6rs+frzEvTm/KYf6lwgRlKcpIRucIzQuw3U7WEdafr1SyAVEMiHeoLtFQX
         ymJA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2745DNNlc9BjaCobB7M6K9A1cDBHij3bUIA47wr8rsNXNGnEVqTly3KL4eKOyf3TiUMTbwUiWgVM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyvUPG5gytSE/x4yBYywvX5aZ3wxj3VNSqUxteFpZMCBVOfEjA4
	Gm7g0yeqQanfip5XzjNQRQ56EW1gcXaQ4jPKK8du78nr1llDQek9fnfp
X-Gm-Gg: AR+sD10/wmK+fR26oiCihtCJfD1yP0JaiVOwBKQnUAjviYo7nynMufwLAJ0QAJFgZDA
	AU0h+7Srkjxsy5YU4EYRA+8DA2MnlTAXkB0QRA3lrVz1zukO0DEpv8EShJHddNqvVdX6h4lTp+T
	CrseDwEr3SS+80b3WqjTxMQtuoZoMSq5fZEbkKY43Es6EMbJcAsMunTpiKUQivsy2yzka+GLR9V
	sZ1/1MBNL34nnyccr0TTQte3dTUxT+4nG4/cynAQR6pqZknXybzFJMvZ01gUKJl+dMGVr9XktNd
	Sykep9YQXGcVTYtrcL3QqqyIvDbhMcm8ZCLIh8bPPBLlJBwdvUkKp56VWN+lLllRuDYPthiLtG8
	tRBgbufv9dVLJ6TaPDiu1L7yYfLGEfr2KkaGHh9sDdyTZwkHa3OiDWJXQC2WeD7Gg9ER0yi54zP
	g0X0fP+xC4xUhIxg7bxPD6OHi9AU6QGrLKbaCiw57a9axlvW+MnfFq0xaws6IY2bjhepil7rci1
	ce95tn+
X-Received: by 2002:a05:600c:4f44:b0:495:5b02:23a5 with SMTP id 5b1f17b1804b1-4955b02253amr173928875e9.30.1784731101556;
        Wed, 22 Jul 2026 07:38:21 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a63fa41sm83538585e9.14.2026.07.22.07.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 07:38:20 -0700 (PDT)
Message-ID: <d80fdd0a-6ee1-4eb9-9355-608070819d92@gmail.com>
Date: Wed, 22 Jul 2026 15:38:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: maps: fix dead select of MTD_CFI_BE_BYTE_SWAP
To: Arnd Bergmann <arnd@arndb.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Sean Young <sean@mess.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
References: <20260722001003.36598-1-julianbraha@gmail.com>
 <73b310a6-e97c-4bcc-ba82-9ed781f4bba6@app.fastmail.com>
 <64f0f609-9b24-4830-b0c6-c7ec0a01028a@gmail.com>
 <c6268184-4904-49d9-b14f-0e11dce8bdad@app.fastmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <c6268184-4904-49d9-b14f-0e11dce8bdad@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_073823_617066_E6BABD6E 
X-CRM114-Status: UNSURE (   6.99  )
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

Hi Arnd,

On 7/22/26 14:59, Arnd Bergmann wrote:
> Sound good to me, if that helps you get through your list
> backlog of known issues,

Right, my bigger goal is to modify the Kconfig interpreter to disallow
select-choice instead of silently failing (as has been the case for 10+
years...), but we need to remove all existing usage first.

Thanks,
Julian Braha

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
