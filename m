Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D8DC4707C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 08:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=niOH9F6vHwbH3BO3CtOn7yt3qj73nwQoH3GNSSSHmto=; b=COGkNQCHUoNoyd
	iNMgF2SbD3LQkWAoe1S3lMMjt9Ft5nJZFhkkhZDTcY3Jl0najcbOx1+GvsSuL3AIR8yFqJ5Qdtd7n
	CAt9zmh6f/xRmuoqYIi2N/SKzXBrODwHPHNU9MmoRtBLexHohYG7jfG1HWFQmhG7TtIJEJLQHvH/X
	xWyra/psGN6sPT4zTDanGFXQXpSfMYeyu0DyLZJafFCPFyVwB5eKLZoefnXwfhjIl6Ks9clYLP7HC
	DGLuiKeKPNWzDUEITXTxGZByDNP1sVw3TYOcBnUa0KhjXvvBWmkHlChi1lN13Ysd5RHz8Dh47h4Pd
	bPEE6LKlA1UJOUQuL/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOChQ-002BJx-10;
	Fri, 12 Jan 2024 08:15:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOChN-002BJK-0V
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 08:15:30 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-336990fb8fbso4905060f8f.1
        for <linux-mtd@lists.infradead.org>; Fri, 12 Jan 2024 00:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705047327; x=1705652127; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=frN9Sw2dyyYDQ/NZPgAQPGsxKg0VNI4bsjlukFx1sZE=;
        b=MYTA0OmYDPJ/5ETt6V/sioP+45niT2TxegGa30WXxwH+N7MGOz8NSx7YWl+R8rXxeh
         y3sUU2c60icA4W4lskoy9tSneWeL4sMRYa6fffjqPSm55TibBaP5kmgXDZzUDWluFzHD
         IpxABQDtC3RHKJMaUDdJSVOc+2n9lqDaMUeRlSGKLbtHqxo0L8wir8A+AETLQK1VyDmM
         K7P9i++Phop2PSJHWmRcxzHOFhSHcxPmBuUYPMwYGufjTGUtXHkbwdsdqM2Gi1bbQJrQ
         mPVc7KvM/C3xcJyTkCdw7zA7P/uYKy1ScrR3wPYIPJmo08xuIibEAyDSC0KVzDfD7nOt
         Q3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705047327; x=1705652127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frN9Sw2dyyYDQ/NZPgAQPGsxKg0VNI4bsjlukFx1sZE=;
        b=dfokbrPWuez8Bj8m6S2Pc/JjTVyHOhFYvV0EVsxYOkATfrZwxyObTiqEHh5KsfeMHF
         +nToyuMbZ27LnxcxtftAcLy94XFaDMJt3ouMFk1aZdq/mS16ezfN2+iedONj4YS4Ae4g
         avrReWp/Zb3fI7PiIOaoE+qAXPlWFgLOBlE8zVwhAUxLAfhZLd1w/qUe6KjoZBXC/hy5
         28OdMCA7/GyUH86zDWPIWvxhRKmzhYvCnbxAV+hJRpPPm3iqeQV1GbHkC8XYw7YMbzHc
         ffQ3+35uR1VFV/5VXHGyfD9Ins2rxtHgfIzmR5ITK9nYvbBCvnV+lKBqGyRQLOtHfeGk
         2TJA==
X-Gm-Message-State: AOJu0YxW3M42nwWEn3BoqXB9faZg4+/bAc6ZLL7ZIXd6fZnnQa7NuZS4
	1JruHTTwuM4pdqgk3tHjaSJZokkmZv34cg==
X-Google-Smtp-Source: AGHT+IE3viCA12opMSDp2p+f0F1u8iFpY5InFlh/GOusb6KTuPcMuB3FKsAHkHUDLb7QXvVlSvQJZw==
X-Received: by 2002:a5d:6602:0:b0:336:9aaf:2f36 with SMTP id n2-20020a5d6602000000b003369aaf2f36mr486614wru.128.1705047326770;
        Fri, 12 Jan 2024 00:15:26 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id i6-20020adff306000000b003377e22ffdcsm3147632wro.85.2024.01.12.00.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 00:15:26 -0800 (PST)
Message-ID: <736a4fac-264e-4d13-bad4-3273eb7c6997@linaro.org>
Date: Fri, 12 Jan 2024 08:15:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] spi: spi-mem: Allow specifying the byte order in
 DTR mode
Content-Language: en-US
To: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-3-jaimeliao.tw@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231221090702.103027-3-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_001529_202589_9CD23F17 
X-CRM114-Status: UNSURE (   5.62  )
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



On 12/21/23 09:06, Jaime Liao wrote:
> From: JaimeLiao <jaimeliao@mxic.com.tw>
> 

The patch set does not differ from what I sent here

https://patchwork.ozlabs.org/project/linux-mtd/patch/20220311080147.453483-2-tudor.ambarus@microchip.com/

so please keep my authorship and add your Signed-off-by tag and maybe a
[Jaime Liao: describe your changes]

section above your S-o-b tag.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
