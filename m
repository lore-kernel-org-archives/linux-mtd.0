Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AC3C77B7A
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jun 2023 23:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zVONIokJz35XAnE4rshsU4Ia0wlJ7R7nL6YsgyVq/Nc=; b=h6UXknwUT6V86c
	qy2bbG4l3Ya6aLQqqBVpEOFJE4sZmc4TytE4dkKK0thGD+MpdO8baEeG31OirnufE/9nQ2k7aLO3l
	onbskRsnha7FSjgVjgQ2xVBBOkMcitYj3oLcg37cAk3EszPvY7jlJLK+7GZDRdXv8LuS9HrcrF6gy
	7gIA4Nq1hbNBEDLBbCKKel1wE/NxqNsvPrgI/O/ktrFnkwN9A9smRiGeof7KJppQo5NTfeiHYRv02
	POYgC67gA01DJaAIQZGLVNknkYkG2LU1u1NVMBvlZ4lcz2VSt2UKcrnKYR1mzPMkvcTS3bH2rGieP
	lKETQiokdfcXbb0qWeZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5E8g-0089v0-1d;
	Fri, 02 Jun 2023 23:24:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5E8d-0089uV-29
	for linux-mtd@bombadil.infradead.org;
	Fri, 02 Jun 2023 23:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3XSUlErwSJjbRpAY7CWY7PZr9eQ9mGrmKgBtPJTl17s=; b=qP02yCXTFB2NcPA/bi2dG8YfJu
	1PiNrFwVDKdXmeGT0Ybddplzwq3qbDPG4mp8r9S9CLqC8qg/R/s4VohAZ91WmeIxCvHCzH8qHXl0r
	wThItvD8YMZUgfVQYJwWOHwC7R7Ua/+NXHeUAp1sYZKzyhVu/sr3pBSsrSru655LflXlBeu9DdwEp
	xfJKsD3Tc38Oh9YBrAt+EuCMdrb273u1/bEYn6vMujNG98jJH5smarpXZI2R7wmpO4/Y5SzjtgnRI
	71hrPTK6fuwqyi7MVVmZf16zxR/NiTeT1MOmYi5nxwZGx24wui+ZkweXRQkAjlYQvaFZUk1yXO6Nj
	tiNU+3yA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5E8Z-001UAT-0i
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jun 2023 23:24:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F3FF60EA5;
	Fri,  2 Jun 2023 23:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDDFC433EF;
	Fri,  2 Jun 2023 23:24:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="KVUNmB26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1685748280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3XSUlErwSJjbRpAY7CWY7PZr9eQ9mGrmKgBtPJTl17s=;
	b=KVUNmB26QTymlcTuPPbMPkDb4Y+B45qVW68BlrLfktKdMwa0nONQOq39YIyQpju/xlp3wo
	p+WPQ0aL5BZXCT9xpwTFkn0Dv2siWeWE5663AzWRp4hFRaYzMlAydi8IH47dZHYwgpEaO7
	ddCFWxvREbMSpVccnnOByiCtvhYgYHI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b8a3e245 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 2 Jun 2023 23:24:39 +0000 (UTC)
Date: Sat, 3 Jun 2023 01:24:36 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH] mtd: otp: Put factory OTP/NVRAM into the entropy pool
Message-ID: <ZHp6NM-6Gtd68qlQ@zx2c4.com>
References: <20230602212318.3524782-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230602212318.3524782-1-linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_002452_022810_4541F9BC 
X-CRM114-Status: GOOD (  29.25  )
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

On Fri, Jun 02, 2023 at 11:23:18PM +0200, Linus Walleij wrote:
> The factory OTP, if supported, contains factory-programmed
> information such as typically the serial number or production
> week for the chip.
> 
> As this is device-unique information, submit it into the
> system entropy pool.
> 
> This does not count as improvement of the entropy as such
> but in practice it makes it a bit more random to mix in these
> numbers.
> 
> Cc: Jason A. Donenfeld <Jason@zx2c4.com>
> Cc: Michael Walle <michael@walle.cc>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>

Great idea!

Just one question below. Feel free to disregard if it's silly.

> ---
> This is similar to the patch I made to add MMC/SD-card serial
> numbers to randomness, just with raw NOR flash.
> ---
>  drivers/mtd/mtdcore.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 60670b2f70b9..efc8cf76dc60 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -23,6 +23,7 @@
>  #include <linux/idr.h>
>  #include <linux/backing-dev.h>
>  #include <linux/gfp.h>
> +#include <linux/random.h>
>  #include <linux/slab.h>
>  #include <linux/reboot.h>
>  #include <linux/leds.h>
> @@ -966,6 +967,25 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
>  		}
>  
>  		if (size > 0) {
> +			/*
> +			 * The factory OTP contains thing such as a unique serial
> +			 * number and is small, so let's read it out and put it
> +			 * into the entropy pool.
> +			 */
> +			void *otp;
> +
> +			otp = kmalloc(size, GFP_KERNEL);
> +			if (!otp)
> +				return -ENOMEM;
> +			err = mtd_nvmem_fact_otp_reg_read(mtd, 0, otp, size);
> +			if (err < 0) {
> +				kfree(otp);
> +				return err;
> +			}
> +			if (err == size)
> +				add_device_randomness(otp, size);

What if instead you just did `add_device_randomness(otp, err)`, without
the conditional checking that `err == size`? You check for the actual
error case above (`err < 0`), and so in the case that
mtd_nvmem_fact_otp_reg_read() returns less than you thought it should,
it can't hurt to still add it to the rng.

Jason

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
