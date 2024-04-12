Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634D7C4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SqsEH/mjGIMwb0RNqZXc+zkBD9qwjbN32NNOsnWkXy8=; b=WSjeSXNhfJftmM
	+NmrvQX9rA1/cioLrsYNBle0QR/yvQ2pMHc2MX8pLTVPzdgGNeDqEFQimjl9gZMVixOjnXwRAYxzs
	7RBqULeH2nxsm9mibwTWfc1vqsoxjmg8J+RxLJLfd1kbzckbV+JLpdpmVPoltSR3ZFru7jPCu39ZS
	bVaMdpfUgPEbaTt/ACj5wUuyMNQeiVgxTQe7f8o47KoVL856grf+RrFljsIgY7GylvAWx5AA+dRbO
	CGb9DG5qtQoXA9vlbJblDouWl0nm8Xq15VQznHF1uRTVktz7j7gEARDOacrTWCQCrrXaEkkT7rZGs
	wMuNMv+xP/1iwzvsJpPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHLt-0000000HR4C-2WlU;
	Fri, 12 Apr 2024 13:54:01 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHLp-0000000HR1d-2Y2T
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 13:54:00 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a44665605f3so93413466b.2
        for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2024 06:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712930035; x=1713534835; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OZDAh4RJKN0lCfNyM40gq+9n7tFtOvPXFiwnprF//0E=;
        b=lO0gZd3fSJTbDpRN1drCbGon86nsvTRQXqhDETBiArqpDuJNra38S7/AS+Ixpbu6im
         qdmtLZNzz6VM+JO/IJGewMy3yXXkY4+4OuU7O58CGZzI0i7AmaUao0fFQbuQkWGme5sl
         eVj8CGjEcQd8j06fN3zn1bLDNRDHIzWk/oCu22Yv9p2zNRLZkQgFEz1C5UPY+Ahsabtu
         C0T5Slh0q67LzXWsrQOKuUfAKKj3+ETr82KoQxaDbPh062PLacWWMp8JNd2d7SitfR3J
         STzXqwcFZ+i6TR62KlkXKxLRc9WGanDgcc3OBWPwelIyYNI7Vkup1nahxOW5wqcpSheH
         QDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712930035; x=1713534835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZDAh4RJKN0lCfNyM40gq+9n7tFtOvPXFiwnprF//0E=;
        b=P867twN3SkfD5ZNq1ROER5H2KRFpFkK0UCYhs0Mqo3wmwDo27NKp1qjAZfhFhUOteZ
         yEqg/7wlUK/LZ3szTOZqUpb7vM2kp6mZ7usOcKbjSYg6mjw+wQe/y9nxElI+/nmUR90h
         sRErNILXAZjtkxE6eoAY1WZL4FpGme9GjttdRcocvAr6HOyoP3uc/PWaDl6Q8pPIa3iJ
         uQq50sB1WQPDt85PQUDl8FD/zooVZVtAYYr+yZE2d8z20j8EoK1BuQq+/tiKIc5t+51s
         OpAexqXMZmTpc+PEVpdIk/4XdCb4LEVuooFzD9NnuNmjO9tHocMMGW4kp/vWxNdKAllt
         pfsg==
X-Forwarded-Encrypted: i=1; AJvYcCXEQvDwN+qxtHYnzHkX7fHWFRqNTymeR48XsFhGoSLobV9R258apqS6ANJ6xoHz/3FxBJ+nC/amVigDo/t9tgrtH0pzGzpR73ybeIKXsA==
X-Gm-Message-State: AOJu0YxQg9OOx6zqBlhhBGgZxrcX0iqC70Bt9CzYV27rSNABD/9P5dNC
	OwxSG2TgKteuHE9Gk/FqlghUvGD2DAy11dNO3XaqXdSC5hI2CLerJKsBhQh3pvI=
X-Google-Smtp-Source: AGHT+IHGdLT3xh+OfkHFowI0iMM2RnENLU9VQdb2De0ZU6EDTzDcEuMelz1LzDyIXUS/CZzCUCCC3g==
X-Received: by 2002:a17:906:e2cd:b0:a51:b23c:1187 with SMTP id gr13-20020a170906e2cd00b00a51b23c1187mr1700707ejb.12.1712930034691;
        Fri, 12 Apr 2024 06:53:54 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id gx12-20020a1709068a4c00b00a522ef899bbsm1046547ejc.7.2024.04.12.06.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 06:53:54 -0700 (PDT)
Message-ID: <7b2fc5cb-d1ab-4e9d-b955-b88698322057@linaro.org>
Date: Fri, 12 Apr 2024 14:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] mtd: spi-nor: Remove support for Xilinx S3AN
 flashes
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240412134405.381832-1-mwalle@kernel.org>
 <20240412134405.381832-2-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240412134405.381832-2-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_065357_746765_8B893385 
X-CRM114-Status: UNSURE (   9.38  )
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



On 4/12/24 14:44, Michael Walle wrote:
> These flashes are kind of an oddball for the very old Xilinx Spartan 3
> FPGAs to store their bitstream. More importantly, they reuse the Atmel
> JEDEC manufacturer ID and in fact the at45db081d already blocks the use
> of the 3S700AN flash chip. It's time to sunset support for these
> flashes.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Good, I'll let Pratyush review the details:

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Please resend once you get enough feedback and include in To: all the
contributors to this driver.

Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
