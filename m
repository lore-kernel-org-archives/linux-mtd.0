Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBA0E68956
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2024 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pe3dRyaHlMmMy2owtS0ZDKr5lG44jNcBBI+SSuaaR2w=; b=RuhbDgVg7D4+xz
	zdx7v5P/mujkI8PiZcBF9e7nd8O8Sb5QoXtFR7TokdmmP5gTMK9h0k3pz45SIEy1lb9WA4PWxEa7i
	z6D+Kxhtn7TXZlX5G9eI/0XovlQ7Y82hKJ6rQ1xpDacptq1y6wCFL1q/HJ2Wf8CLvGieWTtR9p7Su
	u1YnQ7McgVYUgmW+jGoOndE5m+7bTj8vV97aDS/MtpObTmJiUhCSzpSjSi1D4tfPx79tND2JwdvPV
	hmyFTM7YTz7k23aPkmiF9j0KFrOlzA2T7r0H3oFeuQht6LQW+gSJOXKy/9HqPZoyjRCV82a3WR3Cf
	YrJVk25DOl36Dvd44H7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6OwL-00000002iNS-2WZE;
	Thu, 31 Oct 2024 06:45:53 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6OwJ-00000002iN3-06xT
	for linux-mtd@lists.infradead.org;
	Thu, 31 Oct 2024 06:45:52 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-431481433bdso5019695e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2024 23:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730357149; x=1730961949; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3OWm6Y24vWekejAsxWu5X3sn1wr2f2rD7TRcvjtf2NQ=;
        b=fwlZkiGgl5JV/cMh/ZwFRwml+u/fF005QKCroG0DtBS897XQmuY8vFZX/gtXu0rZu2
         ie8jOkbJwxQTszzv/q74Z+khoXqWq68l5qNkIBlmdjRTmBNlgIdFzQOQJYhxOlrBBU/1
         7emDXXLhM+btaBQJS443ykPXVCrXzjbolQ0iW4t9DD2XHbC2Cu1Q1h8TxwD6A47vk7hy
         /xlDNQlTHHGXl2aGcwUEANWbQQj05fbJmlT/EZnVywSH+4o6VSQWS0fe4z2Kf5bBgTNF
         aVkPIaqdwomE8sM0MJFO0rY+CFGod0LdmiSx5VsCWCLqUvz2/ysdxM+bH02wsc9R4+l0
         frgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730357149; x=1730961949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3OWm6Y24vWekejAsxWu5X3sn1wr2f2rD7TRcvjtf2NQ=;
        b=O5iAPb0p23a0lqIyld52D3n27bn0Ctc/Zle7WYHVw0TX3V/OQK6dYqzSURooBrzg9X
         ZMFbnEN/WOWYfS0h4VQEAShMEwR19H+P3r8/S9G+QMJ1PN0VVDJ4rFKlvZJtviaVOAMf
         BZy+G9mEkMFLbxNZ701ix4UvRHHieg2p2Gb+89Ufm5K6fQ33FPTnz/CXuu31C0xIlSkj
         10KBRmPwLHzKp6lRAXDswX1oBtyPmwLkhn15Hm5i0WJqmUg5rtLHbzdNdnMgfUleivo3
         +h7EBlk/U+MhLS212NnDwHOnr1b8+lY/SLj8H+lzWy6DCg4mOkB9kceRL61PlKB4PFI2
         ZuiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiCLxVoUZ/CjCgWxOgISyh3de7ANSEVjm502CXD0o7XTnb144o/U0BytKUTzpE25Y9ka2CrxGNyQ0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9YQRvONvj4C0yl+JOYDUv4iAUf1yWtneX2t4iT64oU1rRXDBh
	fIaKT7b64z1IlOln+shVYJ49JLVSq/9c81jsjQdDqw+Ixai+gh6ag+rUzftpTDQ=
X-Google-Smtp-Source: AGHT+IGCu52QNibWfbGLHARc+Q4U99DmGNqH3nGQBT77e42jajVuBVneE0F2NGfY1fDI5WmG4AbRyw==
X-Received: by 2002:a05:600c:4511:b0:42f:8515:e490 with SMTP id 5b1f17b1804b1-4327b6f959emr18859015e9.5.1730357148888;
        Wed, 30 Oct 2024 23:45:48 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm12987225e9.12.2024.10.30.23.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 23:45:47 -0700 (PDT)
Message-ID: <b4564eac-2ac9-4027-87e0-9510f6be8321@linaro.org>
Date: Thu, 31 Oct 2024 06:45:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] spi: spi-mem: Extend spi-mem operations with a
 per-operation maximum frequency
To: Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sanjay R Mehta <sanju.mehta@amd.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
 <20241025161501.485684-2-miquel.raynal@bootlin.com>
 <20241030205252.ufylezzvhravfqr4@cozumel>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241030205252.ufylezzvhravfqr4@cozumel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_234551_111041_88EB4A85 
X-CRM114-Status: GOOD (  13.71  )
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



On 10/30/24 8:52 PM, Han Xu wrote:
> Hi Miquel,

Hi!

> 
> I met the similar problem when working on the Micron MT35XU01GBBA SPI NOR chip.
> The chip can work at 166MHz in SDR mode but 200MHz in DDR mode. I found Read ID
> failed on some platforms when using 200MHz as maximum frequency, so I have to
> lower the maximum frequency with some performance loss.
> 
> I think the patch is useful but the SPI NOR doesn't have such vendor-specific
> predefined SPI_MEM_OPS like SPI NAND. Do you have any suggestion on how to handle
> this case? Thanks.

Why can't we add similar predefined SPI_MEM_OPS in SPI NOR?

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
