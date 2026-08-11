Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293DCC5AC67
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 10:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dVrxM2amwxA2/6u6Jn390dGcufgMIJmeeNxtssCqm0=; b=4Aqn47NFElKrqQ
	Cpz0X6BJsYb2o/luMY1IPO3XTCGUdwrVrYAkl6m9ScLyOH/tXS0EMLtj95Agz+OhloHFqCKODrE5S
	2Z/l3HkmMME62ostFec84ooNuL/j1JmudUkN4oprFXiE4ECqIS2AAAcM1QlNgb9zkC0sGvkQ2YbhX
	jsQ5yTgiaW3JY/VRY3QjzKiIxBcPOntlX8GvQGRPNkIIQio4J+5OQBjbAHG1F3pCCTJ30FmUSKPtz
	dHyqFUrOmns7P8csy6C+8UuteiWz1nmprv1+AqwWwncbNlbjESfykf1nuvwhIbWXyfxmFfSdxWRKg
	EbL+SbvNNdezBfKn3GFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjMy-0000000DoLZ-3uGu;
	Tue, 11 Aug 2026 10:06:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjMu-0000000DoL0-1qvP
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 10:06:02 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4994c49f588so7846875e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786442757; x=1787047557; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5EFFhRqqKGCmLtFkk6nwPE5SfONW2zlZ18VqIKQ7ONs=;
        b=LhIoLeSrFLmKElLN7EMGutoqQSuBNuHAzO7E2foR8abIE2xtvAiOOubNZpwrmJjEXB
         /TBD/c13r3txeJoifxlBxGm9DKMJdu41TWB7rY7I1cCMfXOmxv9adE47g1/G4fDuzw6d
         ICRHU9lVY7+myng5LSXnQxbS0hMqa2lGi7SPPTuC8CHHDHBXufE1QNqyg9cIny5V69l7
         kDGPLGJDVM2nvqHxGVBSqulOFuPNY8/zAqi9ctwyychTS4mHHOn5kWtlcIwvHsxyovMK
         LhNdw3CAulI+CpiFx0oe6aRi5rfG42I103n2un0plZYw/bYGXlAAF8dbvokmONBEd7UY
         aZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786442757; x=1787047557;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5EFFhRqqKGCmLtFkk6nwPE5SfONW2zlZ18VqIKQ7ONs=;
        b=EkRPSeZ5Z6C5gALqdcej8+O1FwZzgwwL+uPNWt6stI8N/OXvoYSbMgEY4GfyA+QAge
         DbpjfFchSN0Xuq8Z9VI1xxkJkYcEEg5g3276TdEyJ7Dq+KmWYUVo5+hkXw7rPii+aKAC
         1IYqZQoaHW4H5md6NDFXxxs+ujYeaK5NvkD3MU77NJ1vyMRhm/6WJyH9OCLhFperycBS
         RTbWt9PXhN6e/vTv24fsYy2VPW/PSW4Mvfsdr6Vgaum/vpK4/FgLhEj40tY9Q14ZrUSJ
         wWXimMNu1YRvzgjPy02vAROxM4FhIZlkndQ0ZeGCuKE26JU7XO7gKqrrOyCE51Oan2rU
         wCjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/M2WhZVhhCZ3HsfiGgWYCWeu8NUIykQHiooLrmPnuVYgArdbi9L4+5U6daHkaZIGbSWXnlpvEXwc=@lists.infradead.org
X-Gm-Message-State: AOJu0YykTJv+IR4/DnI3SDZyg4rjb48ZpQpeYjhn0lqvuvf/QztR5LCK
	hH16WVq2XIaWDOKe83ToHGjNnWc16EKoHCBWpiQjPwsbi+tyxrZjHNemEJ00gSxgt14=
X-Gm-Gg: AR+sD13kaeIeCIp9CpZBBDxU+cL9DzWgCMGVX4axCWjM2RSzRylDsd/89TUFJ0THjWf
	OLoXG+VUz6oAquaiADerh4wKFRimB1DAhPTk+Lr8yV8zpPC81qxqRK9/FQaVgeP8ucjwq7ksZpH
	MOnWjWVhw91o8VdI6lZ3BqIrTvM1gUq82WnaV/Sh7SdafFGz1QpPgKwk5B4tY/OddVJCNQf052i
	ImSNJ1bPgsalsAkspUsYkbO5Me742p4aR1ZwfjdfPrTWAh5rLfOesbZn+3fnw1v6lecHoYNoRT7
	0s1mkeN6mApk7V/X20CE/QXIGwwjXw7nuZCVIh450u03LlkTckLXqdoDJ4QjRz+fQeIN3xcvLMw
	gznYXrRzcCl53YnDb9URhYM4ZcBWxQXEBGiE4gn22pHBYkuItJhaY8wCFi2EBdRaV9EsKspqD5o
	GUj8wGeY1Yr/GPGQZv0ZJrpxvzSDaxUjCJfxTp9/9aunWhW/V76mkp+omEW6qZinOKbk/KWrQ=
X-Received: by 2002:a05:600c:34c5:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-49978e3f150mr26185875e9.0.1786442756530;
        Tue, 11 Aug 2026 03:05:56 -0700 (PDT)
Received: from [192.168.0.252] ([79.115.156.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977df9489sm59242995e9.1.2026.08.11.03.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 03:05:56 -0700 (PDT)
Message-ID: <6e208a8b-da11-4ba1-adfc-f1e80c891310@linaro.org>
Date: Tue, 11 Aug 2026 13:05:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: scope the exclusive RWW lock
To: Michael Walle <mwalle@kernel.org>, Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn, stable@vger.kernel.org
References: <20260809084223.3596259-1-runyu.xiao@seu.edu.cn>
 <DKL4CBQNKCO2.3NAZ6S25Q60XN@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DKL4CBQNKCO2.3NAZ6S25Q60XN@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_030601_577835_38D1B332 
X-CRM114-Status: UNSURE (   6.67  )
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



On 8/10/26 11:25 AM, Michael Walle wrote:
> Tudor, do
> you know why you've omitted the guard() in spi_nor_rww_start_exclusive()?

because using guard changes the behavior of the code.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
