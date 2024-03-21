Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783E6C54E58
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2024 03:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECFVnXMIe7AWOw0Iek2Jv45/hNLfrkKQlonuqoOc7yE=; b=2htfQbIVM4M6Un
	zkz3hqsKh9pvNaar37pzGU9l6/AoZoSQD+qDdj4TZy5xTK0/jm7ivUWGn+ah0iAP9GoWwxu9YvpxA
	a3wfvCD62nEwBN1EyI5sTlAJQB6zNuPUB8hWzz0QZ3+04EOjNvMG6MCTrLHj/katIoywzbOCTes2a
	JfZT5PYMtr4zTmUUmecqnsxPriEkPBXsrxCoON1b+bzGqfZvPgJIite//Ix3A2Jxw7lF4E+H1MYWo
	VaHyTEi2R4Eu8Dl0wsOLKoKjBrb9SiYbAaiaLsEIbnOKDUNppAF1D/OCKCtDfMQ5HR6iXDA8GKR1v
	nid1LeMDOKBi+8oloAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn96W-00000001hO7-0GA0;
	Thu, 21 Mar 2024 03:28:32 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn96T-00000001hNd-3kyI
	for linux-mtd@lists.infradead.org;
	Thu, 21 Mar 2024 03:28:31 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-229a90b7aa9so304263fac.1
        for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2024 20:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710991707; x=1711596507; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7cheEznH9/bunJzLxgRV2InNzXngEocXk8K3lCsX5Ro=;
        b=PdDc0f7siC1d2vM35RFKEpoPkGvCd8+PW+V61cKt9+hbQANjRT/b6Mkj4O2MFI2/4r
         bC6wLqBmol3YfIb4j0IGeSLDdGfBExi+qiNghj8RQYjzFNoCumXlxCyLy70HpQYRGQvS
         H28LUv94J4uc8jCmWsFvgy6kdBKe9/azMIeRdkvkkOaCk0CsweS/GTkUuh+YjWk8ggd5
         /gCX7vgAgm8QF0qXCFiVLuPBpwsk+WyxPnYBF2edqTXh8JuZPqY0wW+Xynd6tsHFmlPZ
         fVYa1vF+gOPU4LczATn19Xkj6L7WhSvzC1Vum8vZKUD0BsJNlZtWvN1uOpB7zaWrTzEy
         /sHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710991707; x=1711596507;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cheEznH9/bunJzLxgRV2InNzXngEocXk8K3lCsX5Ro=;
        b=OYyojn7HUB+ZVgWYmbJKtuPe2MjnLhfQJ+IwmWaXtPrKnXUOvoCsaTELe5eduqIMw+
         pGH8BsAKaicL8+Z7BeSwAVfehah5JmZCzbtc6zidazIiwU1Kl9l7OlRxLJr5tuk0VKzA
         NLHPP1oN9EcDS2r4NnuAwDl8iqByjUi6/8Hs0RR68+RzMCVhq2WBcwTl07qH516NUAZW
         QcvJi4ThtT25a/i+57+9lWXfRaLGuiLvDWkPxkMFvKKcB/Nl5N4zUZBbfKumYg0gt3oJ
         0jJPRB4w52waSVvaBzlybqBeG88QrvBiQRRIc5eDYhpx2iHB3VXVWvyLLFu3P0gRjSX/
         rGJA==
X-Forwarded-Encrypted: i=1; AJvYcCU1ceLtnfiDgPP9ku1/kQwFyEznot/ybjyVusdI9WPiYgTi7XLNg0wSTyxas5IhdujmmgLaXQOU7UVm7XoFj7hWzP9Rm1aGkOtYuxhGTQ==
X-Gm-Message-State: AOJu0YyDekmDR3AvG4rUn8dClD7jNgov1mSOaQK1oDN2FtKWyCh70LOc
	OUVI0qxvmlaM+N7VhIf46YN8OGapX1LKVHxgaFpXQQ8EyES8wdnc
X-Google-Smtp-Source: AGHT+IFPqaRShwuDsNLqtZOfOtCcU42vj7hJqYUzDGKSw0DtTHuhRD2ByvpcEZ80TWkbUf82hZSikQ==
X-Received: by 2002:a05:6870:f60d:b0:221:c9ef:5b with SMTP id ek13-20020a056870f60d00b00221c9ef005bmr4044811oab.18.1710991707382;
        Wed, 20 Mar 2024 20:28:27 -0700 (PDT)
Received: from [10.230.29.214] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id jw35-20020a056a0092a300b006e6a16acf85sm12519916pfb.87.2024.03.20.20.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 20:28:26 -0700 (PDT)
Message-ID: <8aa7d7ac-1c8e-4a8f-8d88-ffaadcbcafb8@gmail.com>
Date: Wed, 20 Mar 2024 20:28:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: brcmnand: Fix data access violation for STB
 chip
To: William Zhang <william.zhang@broadcom.com>,
 Linux MTD List <linux-mtd@lists.infradead.org>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
 joel.peshkin@broadcom.com, miquel.raynal@bootlin.com, dregan@mail.com,
 kamal.dasu@broadcom.com, kursad.oney@broadcom.com,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Regan <dregan@broadcom.com>
References: <20240320222623.35604-1-william.zhang@broadcom.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20240320222623.35604-1-william.zhang@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_202829_973749_E8B8E833 
X-CRM114-Status: GOOD (  13.80  )
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



On 3/20/2024 3:26 PM, William Zhang wrote:
> Florian reported the following kernel NULL pointer dereference issue on
> a BCM7250 board:
> [    2.829744] Unable to handle kernel NULL pointer dereference at virtual address 0000000c when read
> [    2.838740] [0000000c] *pgd=80000000004003, *pmd=00000000
> [    2.844178] Internal error: Oops: 206 [#1] SMP ARM
> [    2.848990] Modules linked in:
> [    2.852061] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.8.0-next-20240305-gd95fcdf4961d #66
> [    2.860436] Hardware name: Broadcom STB (Flattened Device Tree)
> [    2.866371] PC is at brcmnand_read_by_pio+0x180/0x278
> [    2.871449] LR is at __wait_for_common+0x9c/0x1b0
> [    2.876178] pc : [<c094b6cc>]    lr : [<c0e66310>]    psr: 60000053
> [    2.882460] sp : f0811a80  ip : 00000012  fp : 00000000
> [    2.887699] r10: 00000000  r9 : 00000000  r8 : c3790000
> [    2.892936] r7 : 00000000  r6 : 00000000  r5 : c35db440  r4 : ffe00000
> [    2.899479] r3 : f15cb814  r2 : 00000000  r1 : 00000000  r0 : 00000000
> 
> The issue only happens when dma mode is disabled or not supported on STB
> chip. The pio mode transfer calls brcmnand_read_data_bus function which
> dereferences ctrl->soc->read_data_bus. But the soc member in STB chip is
> NULL hence triggers the access violation. The function needs to check
> the soc pointer first.
> 
> Fixes: 546e42599120 ("mtd: rawnand: brcmnand: Add BCMBCA read data bus interface")
> 
> Reported-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: William Zhang <william.zhang@broadcom.com>

Thanks for the quick fix William, I had missed that the difference 
between systems was indeed FLASH_DMA being enabled or not.
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
