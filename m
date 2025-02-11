Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD78C0219E
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2025 07:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPP864/GBNxe8bt4ZwFW0CBDqmSCTHylSJECgdg6QuA=; b=PI+R0ZpclmEz2a
	P27BkwYZfpo2WVCX+4VXjqFDTE1iPBAojliI7jsmNIKks8/2eTC4acDcgwi9AZcEdrmnWz3veQ2Qc
	h5A1xFX2xcnECHh/hozZjRLNbAR/HeqATh69/L/IFarXR6wX+FXFrdPXT1yTXWlRMsZX9yej9nh7q
	ucqBbtCp3Y6JJ58cUE/CP3ElRfNLn+6S1qpq9ePihDotbYs5RWRNKCLDgQ4MQooY/NfNUTvWzsxVY
	2VYYYDvjhwiGOnBucYwsWWosAsDMywL790RmoxGSwvAVBTyKfpy5euN7chcEk6SV54EAuHL+Amfkn
	bwjB4/RkucOLNITkO0bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thkZR-00000002oSh-2S84;
	Tue, 11 Feb 2025 07:20:37 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thkZP-00000002oSC-0qLf
	for linux-mtd@lists.infradead.org;
	Tue, 11 Feb 2025 07:20:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4395560cc13so1103575e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 10 Feb 2025 23:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739258433; x=1739863233; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mQFUnUHeMNpMv6VttQdjXX85m0xWz9+RSQYykuUCabk=;
        b=NTz0J64CIrZFRGrcWJXDtBTgCurUmf8j8VlMa5f+83kztJAQMcy8v31OZS0s2rI5UI
         zeGKQUYqsJOASFZaXrD3cWky2iH6B1WovgOBE+edGpjOtIim9xNQ91foXF44BR8yeEIM
         XeUfTK3KlLwRwfLYEEc+WcHtYK9iQoiALp9DN35ZztvWzXum07PetAVRmVt/mX55TDwp
         EbqTHdewcxI1JUzXZBQInb2tBQ1JZlv0o41+kJPRtl2rPuH4WO3FBBjRX6WzMCjz3lQO
         0EmDCeJUZHnUUNrrU2aKzhp/L3z0U/NvTbjeajauPXGqUs63q3CyOLvYaO7Ag150SB0R
         /3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739258433; x=1739863233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQFUnUHeMNpMv6VttQdjXX85m0xWz9+RSQYykuUCabk=;
        b=Shk4BLFe5lTQYnG1LNGcKHdAS+/HTpjuBrFA4D2Wt3CGzMSciuPQMbeaXz4MkQe3Kh
         F+jtSH2IzoTBUhf62OhemaYhqtnkzD9mFR+EeJy95SCEQ5s+x85i3375BpRd3BDU8t9s
         FlayudyPTzOznYtNosozl37GVJ2HYTNCvWDLjTB6EPv5H1B/+3JiMSEUgsMfFV+/CmYX
         Q9a60QK88L+9iP6AJDcH29zDQ99u2E6H/JicoGvHkcj67p/c+XjsrLaoLYWox0KCAcmP
         1aryfCuD5wSvd71Xpb90SWDXgvdsvkHod8uJi27BmrozMdhyGyulqp6Ire7eN+eiBt3z
         x0Ug==
X-Forwarded-Encrypted: i=1; AJvYcCU6yqIXdVwjqeJb2FiE3wRyeuH58Ve473pAsJM9amX5NZfSQwTgQSOgOwr84yZGs/pNmnt5Q9EQIJI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyxvkXYoRJ8P1B0Yk6QZJSss0k96v7ZRgwyg+a78k672DBXo5n
	nIqrm3UswjQGUtDH6R/VjfBUBtSWO8hAAPuM7oZAXJmpMmssL/H9AZbgMwRmm6zPMSxtz8//tzS
	+
X-Gm-Gg: ASbGncslZXZITVQzlXjLwR6kQ6yBFIu/HDrjaYqkTbbN9SueZ+Ra8VVJIO6BUh0I8xF
	Qov2CnwFQcfw43ihNo7NfHrlTJiA3/pbvX714XEKFJ+3jTCqEuaqtrI26QqxlH/q/gGKFoFa0uv
	eNkGI6zARYX9hq+loghZi8rtrgE6+yo2Z9rFdHt8Y7R+LG1aDJL/1mGDWsHDhrWJhbJVTRIjDZk
	9D8g0zC51cTRxImlUcx/ukGWji51tUSOdgVEd+TG9CjplZRq/WEEX0RVslbwav88cBaRZr+umP7
	bs2d6x0JuPf8R2JY49Vt9Ok8
X-Google-Smtp-Source: AGHT+IFp0nNIyJ5DPxY3OoV2rGeyCRv1zSNTUe6xL6Z4n2RW40p5qn9RQa0e8xd+y7CFvq7/uzBdgw==
X-Received: by 2002:a05:600c:3d89:b0:439:4bcb:9627 with SMTP id 5b1f17b1804b1-4394bcb9824mr29222305e9.19.1739258433513;
        Mon, 10 Feb 2025 23:20:33 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d7d4sm205464155e9.10.2025.02.10.23.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 23:20:32 -0800 (PST)
Message-ID: <e5458a0e-528f-44ec-a0f0-543472ad3b85@linaro.org>
Date: Tue, 11 Feb 2025 07:20:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for
 Quad Input Page Program
To: Cheng Ming Lin <linchengming884@gmail.com>, pratyush@kernel.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250211063028.382169-1-linchengming884@gmail.com>
 <20250211063028.382169-2-linchengming884@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250211063028.382169-2-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_232035_246382_8E252693 
X-CRM114-Status: UNSURE (   5.46  )
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

Haven't checked the actual bit, but I trust you you verified thoroughly.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

On 2/11/25 6:30 AM, Cheng Ming Lin wrote:
>  		.fixup_flags = SPI_NOR_4B_OPCODES,
> +		.fixups = &macronix_qpp4b_fixups,

For your next patch that'll drop the redundant flash info fields, you
can drop SPI_NOR_4B_OPCODES as well if these flashes define the 4bait
sfdp table.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
