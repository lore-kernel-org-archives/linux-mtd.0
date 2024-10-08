Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4986CCEF172
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 14:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6R4WYIrA0mxyaRXjEeq8VvqnNRJgeaXvqelzenIp+MM=; b=3JiLVVYpA/VrZF
	SLbBddCdNWC+GrbXwCzVWqKgD3wVQqxZTJC0mKYwPMOx+qrfsXiJwLC34FVwpHL9mBL+wleNzSmiZ
	NIBGMeyILCg0Ej9WDNyS+GMeZ5QuCshJX5ZLfKBTlFzdz+9BbYo7NBjOsudpo4eFSsMTEx0T1udle
	4+kAWoHbsYyoCyfAbfGX0+2YOOZb3w1ZaC9isVdMK5UVc1d8Ap2u39lQJMM6/kK8ktOCoeNeRBe+c
	/9xTdTpLkXPmnhsQ8pVEksqc4+UXKpnUUJ9Eh35XPKhbjo6tns8wWzQi/+xluLYCSdKuPdugCVH9j
	QnvAQo0iB/B+c4u2zmYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syBgF-00000006HHP-2UoM;
	Tue, 08 Oct 2024 14:59:19 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syBbL-00000006GCS-2uyq
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 14:54:17 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso4560406a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2024 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728399254; x=1729004054; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQ4LVhvFHLa0eWBgE9k6FrixkUFYtnCP97x2+SmMe3Y=;
        b=SaHtY0isPgydFUHatK7tRt/YciZ6e/tEsoj/QBhw2azgBG9O4phXAjhztMITjg82t9
         YJxdZT5z8MaS+YKY0Z6xgNhLi0mbm25LVtmlufFkgilaUL5cFpJl9fMI4I0jEaf1fqAM
         lzpN/7wSFwdzMHWsYW3Y03sHN17vVMC27lASs4WGVCWCq7nFpbgiS/J/TWrmPCX79iFu
         0JjvaFyO+roHxEGc+LKKXnAtm/ZH53KwUwuJjG9ImmTAGqvXDpr0x5lMzi6xQPZlx+1O
         nEUTheyKnJcH1jZG5rS17cWHQx6xz8u2WTxC6tQ2tLOhKwJwt2d5cVwfX4jxKYNv38aY
         4DIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728399254; x=1729004054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ4LVhvFHLa0eWBgE9k6FrixkUFYtnCP97x2+SmMe3Y=;
        b=XJy+fgazLAvuz71EX0v8wMzT+Dzc4SfpNxYnBA4ERtyPmIKru3q5gBVLvse6pBfxiu
         r4EVkY9PhLxCPszZSpV/rPkotd2wVtAuwiyNnIKYOfvdfOglqYkY/0XxkssL/g10y4X1
         wUz/rE/us1ivwesn2Eu8djiA+g12S2AvvqXSStJfucPajaFcM31UqtE/9FEqrjOThK9Q
         aqxuPHWhzbW0rnfEUbVw+o5ka+TUihEYDi6gs4u8TZm5uJ4PMp5qMFrXIJeUYyE1uBrk
         xurKMAYXZZhP2EzustuozWwsrenXr3BLSGAvPdA31xR4QXJ0hJzacWb25ClXs4z05wo4
         kzEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXbRGTsEM9XnxrQ4ak3jBtLOU4+p31VXDyL2x1Jyq+2ql4fEP7NkiekHt9I4roBsRzHLQQUTQ8pPQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXFjGp7GibaaUUHvL3+Nt/ZcVzLOhoL+Xl1Ufrj7hixnDz/s/b
	/nqRovOI3gd1tL1yoXZR6WApwH8FFEcU8cNz8B71U2TUbqS+34hvFoRkT6vESPQ=
X-Google-Smtp-Source: AGHT+IEE7e5dtXU6pMg21/0OJnrotv0zSN5hz6Qh4qER1MpIu7AV7t7dgpJ2YGuT0VFYFJ+iVS/TPg==
X-Received: by 2002:a05:6a21:4581:b0:1d2:eaea:39d7 with SMTP id adf61e73a8af0-1d8a193d1c4mr595970637.9.1728399253860;
        Tue, 08 Oct 2024 07:54:13 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cd5006sm6207044b3a.77.2024.10.08.07.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 07:54:13 -0700 (PDT)
Message-ID: <5fe42a14-5070-43f7-8333-ed37c29c947f@linaro.org>
Date: Tue, 8 Oct 2024 07:54:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/14] alpha: Align prototypes of IO memcpy/memset
To: Julian Vetter <jvetter@kalrayinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org,
 Yann Sionneau <ysionneau@kalrayinc.com>
References: <20241008075023.3052370-1-jvetter@kalrayinc.com>
 <20241008075023.3052370-7-jvetter@kalrayinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241008075023.3052370-7-jvetter@kalrayinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_075415_791346_46A1D057 
X-CRM114-Status: GOOD (  19.27  )
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

On 10/8/24 00:50, Julian Vetter wrote:
> Align the prototypes of the memcpy_{from,to}io and memset_io functions
> with the new ones from iomap_copy.c and remove function declarations,
> because they are now declared in asm-generic/io.h.
> 
> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>
> ---
> Changes for v8:
> - Mask the argument with 0xff because now it's an int and not a u8
>    anymore


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
> ---
>   arch/alpha/include/asm/io.h | 6 ++----
>   arch/alpha/kernel/io.c      | 4 ++--
>   2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
> index b191d87f89c4..e7d52c8159b0 100644
> --- a/arch/alpha/include/asm/io.h
> +++ b/arch/alpha/include/asm/io.h
> @@ -591,13 +591,11 @@ extern inline u64 readq_relaxed(const volatile void __iomem *addr)
>   /*
>    * String version of IO memory access ops:
>    */
> -extern void memcpy_fromio(void *, const volatile void __iomem *, long);
> -extern void memcpy_toio(volatile void __iomem *, const void *, long);
>   extern void _memset_c_io(volatile void __iomem *, unsigned long, long);
>   
> -static inline void memset_io(volatile void __iomem *addr, u8 c, long len)
> +static inline void memset_io(volatile void __iomem *dst, int c, size_t count)
>   {
> -	_memset_c_io(addr, 0x0101010101010101UL * c, len);
> +	_memset_c_io(dst, 0x0101010101010101UL * (c & 0xff), count);
>   }
>   
>   #define __HAVE_ARCH_MEMSETW_IO
> diff --git a/arch/alpha/kernel/io.c b/arch/alpha/kernel/io.c
> index c28035d6d1e6..69c06f1b158d 100644
> --- a/arch/alpha/kernel/io.c
> +++ b/arch/alpha/kernel/io.c
> @@ -481,7 +481,7 @@ EXPORT_SYMBOL(outsl);
>    * Copy data from IO memory space to "real" memory space.
>    * This needs to be optimized.
>    */
> -void memcpy_fromio(void *to, const volatile void __iomem *from, long count)
> +void memcpy_fromio(void *to, const volatile void __iomem *from, size_t count)
>   {
>   	/* Optimize co-aligned transfers.  Everything else gets handled
>   	   a byte at a time. */
> @@ -535,7 +535,7 @@ EXPORT_SYMBOL(memcpy_fromio);
>    * Copy data from "real" memory space to IO memory space.
>    * This needs to be optimized.
>    */
> -void memcpy_toio(volatile void __iomem *to, const void *from, long count)
> +void memcpy_toio(volatile void __iomem *to, const void *from, size_t count)
>   {
>   	/* Optimize co-aligned transfers.  Everything else gets handled
>   	   a byte at a time. */


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
