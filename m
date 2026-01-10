Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980E7D277C1
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Jan 2026 15:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M38NUikAEn6G1v070BrQzFluMtzlUVNVSf5JB3BjqkQ=; b=Ggv9dLLQ9n18hv
	LAGaWQN7PVvphpY63INLt8NrVMaO70rHmk0BUtaMh0QgYUJQom8HC7juUJs5EmGxoH+Jl7Huw4cm9
	qkYB6yy3H/e7XsuOBjvBjM8wbREL2qen5jqzEX+VE29GDe8zzFmSPcZVjgvlMrWgU0a9xgQ/4Huwl
	vr535fro49ajLBXL9iMINu6L1z6EFGiAZUR0w5t+1fh+yILlzEtC3wN1lIT1WtclDIMN+b5jFF5iV
	XdH62mY9KFKDzS6lYuyMwycah9A3DiQ64A4OaryrncGEmhpaYocwOzlS5agxsCYAf21g3/ZyqeNVT
	GEAWP3zPPF80rvi9lWGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vebLq-00000003X7i-3oTT;
	Sat, 10 Jan 2026 15:58:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vebLm-00000003X72-2FX1
	for linux-mtd@lists.infradead.org;
	Sat, 10 Jan 2026 15:58:03 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so38186835e9.3
        for <linux-mtd@lists.infradead.org>; Sat, 10 Jan 2026 07:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768060680; x=1768665480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MstKQXEBKQFl1f23eAMncxqsqWPHstHgdU9Q+t8Q39Y=;
        b=ae3tTKn3W4GUjGXmNNwYpxhhZEfSwo8c7dC69ImtYlvidL2Q1FawyIZC/L6KJxWvMx
         nHRuMqghNmJsYQWzTIH6IHQIDq55nSJvWJiDmJXMIvpm2cTsHcJ3uK3tVmnrTpA3Hr6k
         gF+AFTBszuQLoICKgCx/Cl6089Kd4bRP7OK6mpuULheoDR9HvbWy9MlXQzQeNU0Lhx4+
         biA5MjUFmlHxNcbjoi3+JPX64p49u997ifZZ7Ql2yQOBqTQDx91SL4YKHFE3BUR6GR5q
         HMv0ZCS2s9nNK1dDF+FsmEcM+rUixmacbAxZBOJ0+IluJ/YQY2v46xXhgthjLjbxOPgN
         wvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768060680; x=1768665480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MstKQXEBKQFl1f23eAMncxqsqWPHstHgdU9Q+t8Q39Y=;
        b=dLDDaqP1Uc1EKw6RKcMdO53D92zci28dX4lXlBD5UHxbMBR1cGpcBFgYzg5diJrthy
         Cm+cWkbEjgCJR7utfje2qc7R5EfESpMc152q0ZzONfyl2VCtALw6roL4ztNR9n2igQLy
         indFmoZTM0s2Ihmz7dKOqVaKKRgo+2UrJrdM2Pk2x2muc+3vqZBMWuOhQ4aGryYxosHm
         cUy0I2RYco56bF5SPaeBCHutNH30i7tzBYdRZPyhxqtlNDQopBqgSW3Ey2FklGEouKVa
         YJoygcMkL50OGd+EnC8YBOe17no2a7gsbhjr6zt6DLX44Zd03pR8l8g/FV3TPBFIM0Yj
         UDBw==
X-Gm-Message-State: AOJu0Yyt+xScyQodURrJI9P9AhyfDCTpeAT0hrOO2TB8gdAZnq40waSu
	XYRrGplbRsNLtoH9ysl7sMXSQCHDd7WjVAKJNmJTW85csz+M4Aqm+I/w+RfOECiRWHs=
X-Gm-Gg: AY/fxX6+qmqR6Pmflr+dr07Ux93SSVsMtSW0eaZaWbF4vfX4lWTYYEVXMa+/WmjC5c1
	BoRjb/Hq4XWtzqOG1mIJBn2nnRAALoaQk3XNoJi71BT46N2D1zoV98I2ekGTdP+tt9EKTjrh+Mi
	hcwkT7INPXBas1h9Ln0alhVZi0clnY+NPJJ+euQJf4e98g3+kyugbEcD+hLzqEyFm8VTUUkZmY7
	waMCdhkX2NO3Godt2ETBNByjXAF15/bKALiyO76VnyXYmIzofEGM7NKRFwbSU0mF04RZwJ2RYqn
	2n4VHpQJ+M1hTUDjfmyxlgOMoZK1I81x+FSAFHmS3W0nOQ6JRBtK2Z1oZCUX3X/CjqY+sd59jUB
	Tkk9uP/jmral5rQND6x248E5aa0H+IwkteizSuQTmOd+UAexq9uKlQ0dMI3rnzUWiS43kvUyTtj
	1rfy8TY1x+tcqBo3cMcA==
X-Google-Smtp-Source: AGHT+IFYcunSwtyzYzP/GgN+bi6QmSaJiBJZBLYMQbalcyroaWLcgspATNjy9vqQEsUZ4z3Uv8byVA==
X-Received: by 2002:a05:600c:4447:b0:477:3e0b:c0e3 with SMTP id 5b1f17b1804b1-47d84b3b8b9mr141151465e9.32.1768060680374;
        Sat, 10 Jan 2026 07:58:00 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f41eb3bsm273462685e9.7.2026.01.10.07.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 07:57:59 -0800 (PST)
Message-ID: <45802d15-e094-4033-8810-a19ea5a501be@tuxon.dev>
Date: Sat, 10 Jan 2026 17:57:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] at91: Remove of_platform_default_populate() calls
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_075802_608514_16780AFB 
X-CRM114-Status: UNSURE (   5.68  )
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



On 1/5/26 23:06, Rob Herring (Arm) wrote:
> Rob Herring (Arm) (3):
>        ARM: at91: Move PM init functions to .init_late hook
>        ARM: at91: remove unnecessary of_platform_default_populate calls

Applied to at91-soc, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
