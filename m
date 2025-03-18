Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B914CC282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 07:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDE0orbOY17T0tQVjsaT/4Uh2pheXBvfpyb/ZuLfGAY=; b=Zp0i/2st43FQEd
	VdCnve8/WU0Je9frDDJ6GppaXB6zJ/KY1+u/OiKEvabeqo79UxqoE38SxKGwULYA9xIFm9WDJaeOM
	wL8SswCarNPU5p9F2QOu2SPS53M5jWbyoiOwsYvocl3evYxJhmNu4x9GUIAmTEd63oBPHNe6QfbXp
	7BYF1QSoJjFmb5lt1pkOLfTzfihkUJlBdNMw/Hw5zSjE9xRiprLJlRMHb1h8Uy3eQuhczTmBAdosx
	mBXSM9KmysDBBwKGvizqwSh8wa+VaOXJ0jrFsYVEjQNMKjGzZUvlRREDU6ateVmv8UXkPpvg4/EFM
	j4ci839HCVfVUl9EBqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuR7u-00000004tJc-3MVF;
	Tue, 18 Mar 2025 07:12:38 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuR7s-00000004tJH-0ltZ
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 07:12:37 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4394a823036so27818185e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Mar 2025 00:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742281954; x=1742886754; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9aPkWt15kdE0cstq+uoRNw2VwO5y2gHFLSM304k0pNo=;
        b=lwUiGaZukc29VkWPeroCXjlWUIMz3wzZgo2WRYbUXimP/2Ut8EMP6RcQnIPROI7oqK
         A7e0jc0URfqPeFP18LjLtSpwIdzqdYY2B4zZp75qf20d02Jn1OFgcFvYikqco/xuPAtA
         PwFlH/neP+ojLsnOmNwaWMx6NynDUjxYBIfQOxwbR2W14QEH3nkqhgHZI9J5C3mkPY1D
         JuLd7BzWiQf1uT7mFhnFJliCpKH6GX0QqPaU5RmJ6PRw8X2WGrSGUEdYJPfljEmAs3Ft
         s4UrRsKWr2Pfxi9yjtT3ZL4D8cgaNXUmX2Gju5PNWB8so8MDsdPHg9o2gb3BOkyUEBjh
         0n6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742281954; x=1742886754;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9aPkWt15kdE0cstq+uoRNw2VwO5y2gHFLSM304k0pNo=;
        b=B9lbdDVLORCEYgEvlPJcyA1vlQYuGc87RpjI28dQ9P1IiF7qt2xBwGIPOpNeJYK853
         4pHYZ7AGyWs8fdpBJSmMOGw0bMmILVOZPPE/UHrA9Rf1nqJpafIB2q2P3gn6IHxEFApf
         fiKekBxUlKf2SLtR5Nkm/S01uQV3NwTzu7J6CY6fmHEhbdHKwyPPRddOwhIGzYU3sul5
         uhL+zrSmDgrgRAM67HQI6MsYIOUmO6HKuU6Cv6AzOGFGyTveAf5zGUSTiIxBxiSAmgP7
         hhRgm/97rUguCwYyZITUk3q4w3RzbqccXCD1JIq+sABhEl1eCS3VQ2tFjmsn042DjOPq
         Bjww==
X-Forwarded-Encrypted: i=1; AJvYcCW4/9lSqqgF7DgfTJkUyP0CquJQtMA05kpHa7nRIoE3Oc4VlX1vHt5Ur6BRQFHBlcW3Jt/Gf/W/8is=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5gguOLLcf55RwTFrRFjHGw48gwy3wnn3DAgSRlV594rUfZfor
	d1VZkDdN12o2u6i2u3VgLVVcx+wUzUluGKGFmrOMAQseddyT0rhnU9QP6+KBdFs=
X-Gm-Gg: ASbGncs1uqNm0ne4FVQn2jQ5bswRygzoyqWmgQSiso4kgjkIUDIghYXfYB4VRFiGG7K
	ve+dERucPWgv55luC8IUPAg1P1u4FpUScTx93+E9EFHPrE5XxUMZWL3H3TIuRlymg4y147fEUnx
	6JezkRShrzT2s8vWB/ERQzVnc770uXlWDphEW6BQKbjfijJlSYPufnI9dJ+KTWMSyBtY5kNZaM/
	9h/utRerfb0B1OCv/u2ypNyl1HfhxrEvlaNxNs0ysmJx8hS0Q/HpmSvE/v0XHlOwCtopTUAr3QD
	FeuLQ7nx14Q571v/29hjpKvAyiT83sX9BcBjWkatQtEi9L2WiiKUAA==
X-Google-Smtp-Source: AGHT+IGRzgw0td7tUQ8o6QejSgw5whaNPyJevgCIAzLbJrIbqfpv0Ac/GK08yGIn1kKOLzsYXV2gpg==
X-Received: by 2002:a05:600c:63d1:b0:43c:ec28:d310 with SMTP id 5b1f17b1804b1-43d3e14fa7dmr4229575e9.10.1742281954415;
        Tue, 18 Mar 2025 00:12:34 -0700 (PDT)
Received: from [192.168.0.62] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fdda30esm128241455e9.5.2025.03.18.00.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 00:12:34 -0700 (PDT)
Message-ID: <47905b67-c0b5-45c9-98e2-0dc4dcf9651e@linaro.org>
Date: Tue, 18 Mar 2025 09:12:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: eon: fix lock and non-SFDP flags
To: Jakub Czapiga <czapiga@google.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250317181856.2059536-1-czapiga@google.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <20250317181856.2059536-1-czapiga@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_001236_231656_915F4939 
X-CRM114-Status: UNSURE (   6.77  )
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



On 17.03.2025 20:18, Jakub Czapiga wrote:
> Set appropriate FLASH lock feature flags for chips that support it.
> Set top-bottom protection bit flag for chips that support it.
> Add no-SFDP flags for chips with missing SFDP or without clear
> SFDP description regarding 4K sectors, dual and quad read support.
> Remove no-SFDP flags for chips which documentation states that this
> information can be extracted from SFDP.

Patches per flash please. Then dedicated patch for each logical change.
With testing.

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
