Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07DDE77184
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 07:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgGhSX6+w04qlOFAXPIpKcA8L+P5dDVNizB9DlK7k7Q=; b=YmGJGRa03JkVvl
	K41rBRuA9EciP1lILl/KIWWeowPxEAryvXu7vEcAA26yEgrDDGgG9amdNEB+LQG5mjOBOBSGRiLPO
	wsL3C2EwuXNPVZSfeuKLhOORNI0ur1/iiXuviH5SBevS73AIb4RlJHflxfpH3QbB7Cv7gxPHJqAEo
	iv8uCC5nCF5j70kQ6UZv/3AAWOL4KNDsdOBhRyiBoCeHVqse7Dwr/J/bINPFTsZBSMBk4fUT1LwuS
	3Gh1BGQuEpu/ONzgFSDbmXrrF+JRkviEDYtva/qpTHYpa3IOvXeywDJflOH0LwD0LP06hPvSrye9q
	D5QHcBOF8UZYdVhI7lZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOBEV-000000018rt-0Dpv;
	Thu, 19 Dec 2024 07:46:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOB3l-000000016o1-3rJT
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 07:35:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso4448975e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 23:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734593700; x=1735198500; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=f4Y50n+wIrDHVXGBIzmro1zW2AzzbKQ2y4kfD2qpvrbJPLIyaRGggkXbw6Vstg07Of
         3Qq3k6MOUJ7zxIXwax/IIldON4d26eMgCEOU++aOhSc0q537AiL1nI+1cKKYnbR28Y9R
         hZz8fbblBgDEl4piI7nVucj/4lgajWGKcHCtcU7IIk3Fd54bCNdZ8bqY/IYnWdpktZ9D
         dqWQ3kS4qTCErDWjMOQEPaBzkzKV4rs1OhVN+8hZhsQqInxBjBBD4xf47nbXevRvGDOU
         D1LgdDoa5/w3iF6xMdl3t6DJ/IzgBeyD3qENR0LzlR69+otvDAkHoVdkCMGAzdFmC3DQ
         P+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734593700; x=1735198500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=slP9vtFqjLIhfimPIfE47nmOMSWe1fOfKj44ciK5KABFM3f+IMk5xE4wZTIWQAa+2A
         vClP9XKp2JmtUva67acs2OZjKf2VMDK9rbwYD64xozSedG2fmY77igzzysgfa5Ep88Or
         riLEBpaD2GfAyfn14dEIbyZS15EqrOKKME0Fv3INNYT6S17Gcrtj9Quofs4MY17GEa9Z
         aIt5zHgO5SzmTBAGaIll3zGVZ5UlfARyqcDU/y695lbY7navQT0e7QzpgVNGIrOAKpwI
         WwANRWx8vlO2AS41RS5lJ1LgqDcZ4YmkI/VNSAfmP7+BI/G3Ieo8ecUAQSR4YVZ2bEvR
         F+tA==
X-Forwarded-Encrypted: i=1; AJvYcCWqCEn0YVLHLZU21A3GLEpvLT8fjjNgAmdr/sABE4LwT+pk5e+LmbdjeJdCDT6U6c8alpqdXcomyeI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqOMcK3GVRDfldwC356PKbpLDtw6zFeBsN+DeyroKSWW9ZKFmA
	5m7KPdbY3uMmMmnPBgMu5OC8ui5CbChorcxFOwaPdMvHE+zLEzWGtFxG62LAgEY=
X-Gm-Gg: ASbGnctxZBBfFP2N2gyFdZBbm9MqikZy4O1yaElQut9UWaYjvz6U7oGL6rbxin4J2V/
	vU8vZYe/UrPASz/sUM7nUBdGvKCCcD4BkQ2yMtIQ1U4O7OXvNyvAbQm6Yv9T2B6JWnFMm3DbAXz
	2dE3oFXp6vWhGfkE+YNVEgx/45t4JLwy5JkBOJaqQE+G9LA2SZgo9P37hN/LvBrQuC7nVGH8DtQ
	DJxad/v++PYyECUbd7rV3sbliWtK7gWccweqSQM4SKTxunKQUVyIUJm7XZlkh3T
X-Google-Smtp-Source: AGHT+IEN7Lx4QjsP8ZjY1jKUymrHRA+hMX2JtyYhymgndeX9Uu3U4QfO0qHPOV8m0JH3WOlGFPYcfQ==
X-Received: by 2002:a05:600c:4ed3:b0:434:ffb2:f9df with SMTP id 5b1f17b1804b1-4365536f8c3mr56413855e9.17.1734593700136;
        Wed, 18 Dec 2024 23:35:00 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm43239125e9.12.2024.12.18.23.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 23:34:59 -0800 (PST)
Message-ID: <b4eb4f9a-3476-4154-86fb-ba01fba01375@linaro.org>
Date: Thu, 19 Dec 2024 07:34:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Add support for S28HL02GT
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1734588106.git.Takahiro.Kuwano@infineon.com>
 <dc6aa706253a5200ff0c0d4523c2540312575c01.1734588106.git.Takahiro.Kuwano@infineon.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <dc6aa706253a5200ff0c0d4523c2540312575c01.1734588106.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_233501_962779_7849E218 
X-CRM114-Status: UNSURE (   4.26  )
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

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
