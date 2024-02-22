Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA8CC48BF6
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Feb 2024 00:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YAuYOmZV296IZCTzYtQu9EEAFlelxxXvuxLrpISUr9Y=; b=4xpsuFjak1yE+b
	QQ9UBu8w5BrP4TZH2sRxDV55aujhOA7Rxf3//GpC2CnVpLABrw2LU2sgnLGpDhCuomkHwAxlQQ1K5
	5EjP+ZER/EH4qR3KoGyc5SeLbWYH/37mF1lcKgTd1mZKrkdcKnAvEyGQmhU88wXyCruU4X9d6xoOj
	R6kyw8Ics+amx7hmSU4P/WG5P5l7HG0RzEWzpAFVl5gOn+Ejojvs5cTm/1YmBSmtlLqJ6BkexcSHb
	wKXSLcT8dd9zE22WM3qVd5N9TD3WfLJGmBqh77qTJiTlzwsJxChfjHRBrNayHzvikXGYFe5ISpxEm
	HoNcnFj52jVDoZ20CN+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcx3e-000000033V2-2xyP;
	Thu, 22 Feb 2024 00:35:26 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcx3c-000000033T0-0AMI;
	Thu, 22 Feb 2024 00:35:25 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7810827e54eso81900385a.2;
        Wed, 21 Feb 2024 16:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708562122; x=1709166922; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uQcSzwYTlfpfWbC6MSH72/ZoCsP8jeNoOiicayAEZtY=;
        b=TnnwjOAbEldS20rz/Na2mSvwbdCB/jfhhbA+9+hOM7F1zR5niUUw4a1/EpS9hfswWM
         6/7CtYUxOwex0hVuBhTucpVyl8PClNlAHOS+R54asGof+FPO6rd4B/BM6q1D3OFYL0vv
         HZ3hmCufR9oK1dcH54pxdzDX4IDYCUnL1nVUs084gOqqYhICDb3A9d64pQQs6fuydpXB
         gZ8PGPAs9cJDjMj+J0jCVR7MTE5CYD375gJEGJPEFVeAADzDgIR9fWONB0UEMU4TwWxz
         DDq0vgmvqxX7k6fONRESjajN4NAoOFKqHmInCL00rcW4h3UWa0joH+2z553JvWzHRiSf
         lPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708562122; x=1709166922;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQcSzwYTlfpfWbC6MSH72/ZoCsP8jeNoOiicayAEZtY=;
        b=vjUPDtrbBHr/mSKy8gG01A81JUvC9DZBXThDoWSdR0x4ITJ82Vb8SnggQ/uuQhHjyi
         Y9Ma7tUk0EsthHrWM5r8t5tewiz6kd9SpdagsSM6Kk1S5ACyPByOZCt+0IGmiaswXWMr
         gVRnk9Z9cVX/Y5bFc9bx7KZOjQdNUOq1WFE7+9H+XvzOfKEMZujiMsP7G8Rkioc9OK1j
         mORSzJjl47bBfXoPU06KZJ6nOUJFTszk78HEWXfwqcL2HnWcu1wuRQzRJdL0HfTJESkY
         YdqglCqTByzkpv1vTHINyUPxDVXhOuCF7GZSwyYoFnN1XEDiUR/YVFFSgOA9BA+o4Mw9
         wCEw==
X-Forwarded-Encrypted: i=1; AJvYcCU+B303O+hGYKf70xZYQYZXHSiQLLVLmu4AAu5aQgd4UfXC4MDnrWIxroG1meLJIdYZv7KpSkLSmbEMPh+zY6KQuChL72vN6s4P60b04R3CSH+dV0GkXXbyhoA2RlVpOnQmBhIUx+B25y3hDAT+uvV6Wrdz
X-Gm-Message-State: AOJu0Yx4N0gM7v7npK7YVPtePCU0t+ZXGgy1AlWOKYg4n5dNGbRPM3oO
	PMa2Wtgldxgmlltv10NB80hd4X+5thzTtKtxug2eGKvqdox3/2pQ
X-Google-Smtp-Source: AGHT+IGLYs/AqW3ANawAK7DT3YYIZr8BCGmTNtcMollWrLax0a8fj192lb91A98q6G/j28j+aPI7Ww==
X-Received: by 2002:a05:620a:b52:b0:787:3820:8d9 with SMTP id x18-20020a05620a0b5200b00787382008d9mr20353756qkg.0.1708562121729;
        Wed, 21 Feb 2024 16:35:21 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id w5-20020a05620a148500b0078723db4da9sm4804921qkj.98.2024.02.21.16.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 16:35:21 -0800 (PST)
Message-ID: <7be28a94-f0f4-4098-aaa3-be3194fc14b0@gmail.com>
Date: Wed, 21 Feb 2024 16:35:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] dt-bindings: mtd: brcmnand: Add WP pin
 connection property
Content-Language: en-US
To: William Zhang <william.zhang@broadcom.com>,
 Linux MTD List <linux-mtd@lists.infradead.org>,
 Linux ARM List <linux-arm-kernel@lists.infradead.org>,
 Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
 <20240207202257.271784-3-william.zhang@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240207202257.271784-3-william.zhang@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_163524_123857_5F893679 
X-CRM114-Status: UNSURE (   6.32  )
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

On 2/7/24 12:22, William Zhang wrote:
> Add brcm,wp-not-connected property to have an option for disabling this
> feature on broadband board design that does not connect WP pin.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
