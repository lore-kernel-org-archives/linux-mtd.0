Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9016AFB44CB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2026 08:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=S/Ki9PRlkf9ftYe7UL5zee1/YAIZKwnFZtMZDo4pJTo=; b=XCC53uUNW4g5PG5X2iaTh4Piei
	ckbroGOvZt6ey9tZG2RdgHQbNo+HYNMbphSa5OCfqvQCtZWPzQZGEwdKiwGw2H96chWN4TUdluANF
	mF/OTGi8gqDYFWzJBXXelmFVNWGNxAgjqC1Fog+MS7tcNEhxRPwNynsmVtjS6bVtFn2i0tky8nAuJ
	corbjn1Yi6teAIItgs0WYn/PFK+XQkbmSbyfUrWod3CRYYP1Vath23dPccXyzcRRwqlRBjo8zrKRK
	qFLYnjJtm3ug0KROU1kiqg2R3OOEy1EnvqSzm6Ur1oCQQAv/UtbQCJVayxusf/pfzASq8Ccou5I43
	AvI+kK3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBoa-0000000CrdI-2XDG;
	Fri, 24 Apr 2026 08:23:08 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBoY-0000000CrcR-06Bo
	for linux-mtd@lists.infradead.org;
	Fri, 24 Apr 2026 08:23:07 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-656d749109cso113276d50.3
        for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2026 01:23:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777018985; cv=none;
        d=google.com; s=arc-20240605;
        b=SWWIT3HsaipaeCelFh3Hm/EW7xU3Cihk4tCaHHFMmscg8KffzxRZCvxj7/BsJMojbU
         Vj/wy15n5c9i64aC56+tws4BElSUex41cpGeJx02IBNi0RrL33g5w4QFBDMQjJmwsBL+
         XRw42lcfz8VrAwc9NaTzJU/0nO0mX1d4AGVfCoIFruaEe6sojrsrq+qO7xC3UTt6epv3
         BIEfyJT7lReB5mcLGdEYfe2NVaU4HaJG5P9djJYmM9VfVrX5ZslBrL7Nk36BIO6T/0uV
         mEKki7mf3U5vufrpn47ez1tSR915QEa0y41R8h+ydfHpUP2yy5HQU453JX1rW/BDXnin
         7WYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=SQN0rO9Tzj/+DQYMhwmCTBXrpKo+uLTC66u0nAEI/Ls=;
        fh=B2sv4aDQE/6dppkmvbUu0hs7tNVm5T0bk3Vz6Jl4JNM=;
        b=ksEi/y8oCyo/dmkZBIF8OmQcj5PXqt0KSskSKLmFLmSTxOVnsQPsWSeWujWg7CICI9
         dKxuHHx7wL1OIHEwgn7sORLbawxrdrU8+j5a9M2gVeTBOzamGcjgpU0Irw2HNyMLNY3G
         iBKLwdFsx9gda37qT3H2EU/UI9RJfK8C4G6bTE2SrmAQq7YF6r2L00kMCAe8/Atm86U3
         RjBQIjkVkcZsnEZ9+00n8cmTN7PkNCWXzVN+ZrlsOlsIN6sSHFFne8M/b0s99otJGu44
         O4J5OR43Tetw8dvZOxIbROyLCIrQHe5dVET6z4CkOPZO9SJr8sGKlZolOQn5G/Yszy27
         +bQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777018985; x=1777623785; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQN0rO9Tzj/+DQYMhwmCTBXrpKo+uLTC66u0nAEI/Ls=;
        b=l6AQWZV3yTpwX4y3g6J7cZL5vp3H1jZC1rfqsGMBc7XNCe0R6aBM6yHJuhlKtEPmOl
         mXD33QAkxAPZ3HxjKe1IvS/xYeNs30BmulkgPDn6dyLGn13IRGsedLw6HSMwhgpP18Mb
         swv0ik/5E75bZFQxUJ+14y+LyhR5oGw1OoPTMM+ibf3p5n71ywCzn9QesygrIkzgZ3yH
         a3A0+v4p/smpuCyaootAsArRm1J+ceTnnfEYgh9HpjJ/7+OXvK14Eou+DyZZ8tXEJAMv
         ZCHMSIvhJegZldtAn2TEMHFbtjD2nbhfBivbIfonbIijToZBncvMZAuEEQ+9+cluhcEa
         yHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777018985; x=1777623785;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQN0rO9Tzj/+DQYMhwmCTBXrpKo+uLTC66u0nAEI/Ls=;
        b=fesHnS/Krm43tmNt7UvSyjDQ5Fvkd+2/B5TmEQFsUsRzY9HH492tDumt9oRvT1ARwn
         HlXXNDjHomsWWg/TdDEKIC1YUxD7v5tagIUQ0bL+JXoNuP9nEmRVsU6+Bfqcl16/CiiZ
         BFsGUc+p0M+jxrCV1ltlU0Guw9lEAo5ZShxNUtG7Xa+ggLVspAe/BhbkIdkrN7LEPFsA
         TY1fbGicwfxf2L6BnGoNWPzHM3fKU5lIY/PbelE+fJF/Qpi0NvbqTjZmmu+hZ+sqgE0I
         o9E50JvkDgrg9k1SSCpNIsF8Zz1INu38sl1Vb+CsUK4NqkCIvu3BnE3+uq6q87EzR3yq
         ouXA==
X-Forwarded-Encrypted: i=1; AFNElJ+y9jdYcKxLoEfn7nG0/6rI0tZjx7nEMrES54TWN2Gkiq0zYVio51D3oraLaVOhPOM5DL6bBkjpzms=@lists.infradead.org
X-Gm-Message-State: AOJu0YyaTWprhlne9W6efSgxbrtrgdWBgRVhsMZajmEK/Nnx75Mx6m7e
	wG1d9J5PKeykSYvsHTJm4rXyqRJvta5QedEli8ixOCNtPhXQTJfaowxzzMDCN9VkZwvRPhHjtXk
	OnFhkieaLCd/xiAM/HmIxRv8v1y9P/dk=
X-Gm-Gg: AeBDieuDpxHdyft3k8bu9tnZP5K9ftkAQEZ6cCy2HtN330k9I9sJt0Jc1D38ZcnV4LW
	kEjRSER85F1mGbKBl5ZbxSCNDIqfxIbD1Z56QtZVM811IavPw9pbfXFoIYCrQ1R0jdIMsekP5Ag
	Zxt8EFm/gQJAGb+HdvUywwp5oV5TDZ0xpnX2nfD8KKX5IlePUI1lkEHyknDRIff5ED6+aDN8mbJ
	/WH0+yKjL0Qwc4qkxAD2Rntc7bnZn2e29Pcdlq1iNN67YLHzosQvJQTJzz4i7cTH6k5nK+gb19A
	BT1Sfc6FAdbpmCDS+Wfs
X-Received: by 2002:a53:be4f:0:b0:651:c047:f094 with SMTP id
 956f58d0204a3-653109f9e03mr18571404d50.31.1777018984720; Fri, 24 Apr 2026
 01:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260415170027.3593563-1-lgs201920130244@gmail.com>
In-Reply-To: <20260415170027.3593563-1-lgs201920130244@gmail.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Fri, 24 Apr 2026 16:22:50 +0800
X-Gm-Features: AQROBzDfZ4s3BN-usOWWRgDfUEb5esPbBRcp_sA4SKBzHYX6HgFuKOUBLqO0Nnc
Message-ID: <CANUHTR_qnhserwxcJZ6Gnh9TCQcPaKMbUMep0=F1-kK3Ta0ncA@mail.gmail.com>
Subject: Re: [PATCH] mtd: maps: physmap: fix reference leak on failed device registration
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Linus Walleij <linusw@kernel.org>, 
	Guangshuo Li <lgs201920130244@gmail.com>, David Woodhouse <David.Woodhouse@intel.com>, 
	H Hartley Sweeten <hartleys@visionengravers.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_012306_068687_1312A1CE 
X-CRM114-Status: GOOD (  25.91  )
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

Hi,

Please disregard this patch.

On Thu, 16 Apr 2026 at 01:00, Guangshuo Li <lgs201920130244@gmail.com> wrote:
>
> When platform_device_register() fails in physmap_init(), the embedded
> struct device in physmap_flash has already been initialized by
> device_initialize(), but the failure path only unregisters the platform
> driver and does not drop the device reference for the current platform
> device:
>
>   physmap_init()
>     -> platform_device_register(&physmap_flash)
>        -> device_initialize(&physmap_flash.dev)
>        -> setup_pdev_dma_masks(&physmap_flash)
>        -> platform_device_add(&physmap_flash)
>
> This leads to a reference leak when platform_device_register() fails.
> Fix this by calling platform_device_put() before unregistering the
> platform driver.
>
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
>
> Fixes: 1ca5d2f0196cf ("mtd/maps/physmap: catch failure to register MTD_PHYSMAP_COMPAT device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/mtd/maps/physmap-core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
> index 0dcc25b7ff98..6299a741e65b 100644
> --- a/drivers/mtd/maps/physmap-core.c
> +++ b/drivers/mtd/maps/physmap-core.c
> @@ -659,8 +659,10 @@ static int __init physmap_init(void)
>  #ifdef CONFIG_MTD_PHYSMAP_COMPAT
>         if (err == 0) {
>                 err = platform_device_register(&physmap_flash);
> -               if (err)
> +               if (err) {
> +                       platform_device_put(&physmap_flash);
>                         platform_driver_unregister(&physmap_flash_driver);
> +               }
>         }
>  #endif
>
> --
> 2.43.0
>

After re-checking it, physmap_flash is a static platform_device and it
does not provide a dev.release callback. Therefore calling
platform_device_put() on the platform_device_register() failure path is
not appropriate here and can trigger the missing release callback
warning.

This falls into the same static platform_device pattern pointed out in
the other reviews, so I will drop this patch.

Sorry for the noise.

Best regards,
Guangshuo Li

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
