Return-Path: <SRS0=prEm=YR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD2DCA9EAF
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Oct 2019 18:28:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F7EF21872
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Oct 2019 18:28:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hQhADyTD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="QAvRgty4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F7EF21872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5usBIp1IYFKXfVTC1n+7Ma5eRS6XLRjwWURew0n4cnQ=; b=hQhADyTDnOVJo6
	kEkAF8wIAoDqTr5xCT95m23Yscg5gaxo3Q3XR/rvTO0IdzjPHxy/3iMdJNPFddSL/NbhwqI+kjt68
	hLhe7/Pyrf41mTIumKYXnc18BM7Ja+8aVwRPiIKKAvOFhpqnVDY50AI1MxvMBJTidJA5ImbmklLHc
	WS3NebZvXafvjRz8CBNW8iJdXEln+dXeEZnjfM3D4GREpuV2b7Lo4XD6wYGJpx8WdmtqwSFg42GpL
	Wk9cDkx2Rh1V6xR+DKcsFdGRaL/kB4dB5jS9NsYFo+16kj5frvZ5UgG2JtGT7t7L7LYNqikQHsuU4
	8wWfA0Zm/LEfxj+SxERg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNhpx-0001bv-Fk; Thu, 24 Oct 2019 18:27:53 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNhps-0001ZX-On; Thu, 24 Oct 2019 18:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wSs3crh3v+ghEUMqcRdP1izZZc554CJ2OfqXDmCA/CY=; b=QAvRgty4bBFa2WYeeHQ8u3s9m
 91CozvVGZt84yS61WHb5sHlNNb6oaySih3uc+zGsrxAvl5/zIxtmKG8SOXjhQ9KmRlO9YjNphYR98
 LYXyIJXT6r6WoWBv6AemFdB5yJvhjhr0ciZ9TtCjysmy80p56S39tMu3BdlJW5kdj6EhxWecoio6j
 SbiGcr87ltYhdGSWGsBn2jugYfS9HbWZEiSpIGyb5OWiCCdzxL+zYtLGzhPbofkMsK1iJZkCoZVQk
 KDKrDvntxueHxbL3MI2FcIc+LkUG/PQfZK54trP0TyCOrtAt5BbKRVKRHUvN+UJDSMoY2zVhDDLe2
 WWde8+3Bw==;
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:54452)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iNhpJ-0005re-Kw; Thu, 24 Oct 2019 19:27:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iNhp8-0006hn-VG; Thu, 24 Oct 2019 19:27:02 +0100
Date: Thu, 24 Oct 2019 19:27:02 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4] mtd: spear_smi: Fix Write Burst mode
Message-ID: <20191024182702.GD25745@shell.armlinux.org.uk>
References: <20191022145859.5202-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022145859.5202-1-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_112750_125378_E9925660 
X-CRM114-Status: GOOD (  37.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Oct 22, 2019 at 04:58:59PM +0200, Miquel Raynal wrote:
> Any write with either dd or flashcp to a device driven by the
> spear_smi.c driver will pass through the spear_smi_cpy_toio()
> function. This function will get called for chunks of up to 256 bytes.
> If the amount of data is smaller, we may have a problem if the data
> length is not 4-byte aligned. In this situation, the kernel panics
> during the memcpy:
> 
>     # dd if=/dev/urandom bs=1001 count=1 of=/dev/mtd6
>     spear_smi_cpy_toio [620] dest c9070000, src c7be8800, len 256
>     spear_smi_cpy_toio [620] dest c9070100, src c7be8900, len 256
>     spear_smi_cpy_toio [620] dest c9070200, src c7be8a00, len 256
>     spear_smi_cpy_toio [620] dest c9070300, src c7be8b00, len 233
>     Unhandled fault: external abort on non-linefetch (0x808) at 0xc90703e8
>     [...]
>     PC is at memcpy+0xcc/0x330
> 
> The above error occurs because the implementation of memcpy_toio()
> tries to optimize the number of I/O by writing 4 bytes at a time as
> much as possible, until there are less than 4 bytes left and then
> switches to word or byte writes.
> 
> Unfortunately, the specification states about the Write Burst mode:
> 
>         "the next AHB Write request should point to the next
> 	incremented address and should have the same size (byte,
> 	half-word or word)"
> 
> This means ARM architecture implementation of memcpy_toio() cannot
> reliably be used blindly here. Workaround this situation by update the
> write path to stick to byte access when the burst length is not
> multiple of 4.
> 
> Fixes: f18dbbb1bfe0 ("mtd: ST SPEAr: Add SMI driver for serial NOR flash")
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Changes in v4:
> ==============
> * Change a cast to avoid potential warnings:
>   s/unsigned int/uintptr_t/
> 
> Changes in v3:
> ==============
> * Prevent writes to non 4-byte aligned addresses to fail.
> * Use the IS_ALIGNED() macro.
> * Add a comment to explain why the 'memcpy_toio_b' helper is needed
>   directly in the code.
> 
> Changes in v2:
> ==============
> * This time I think the patch really fixes the problem: we use a
>   memcpy_toio_b() function to force byte access only when needed. We
>   don't use the _memcpy_toio() helper anymore as the fact that it is
>   doing byte access is purely an implementation detail and is not part
>   of the API, while the function is also flagged as "should be
>   optimized".
> * One could argue that potentially memcpy_toio() does not ensure by
>   design 4-bytes access only but I think it is good enough to use it
>   in this case as the ARM implementation of this function is already
>   extensively optimized. I also find clearer to use it than 
>   adding my own spear_smi_mempy_toio_l(). Please tell me if you disagree
>   with this.
> * The volatile keyword has been taken voluntarily from the _memcpy_toio()
>   implementation I was about to use previously.
> 
>  drivers/mtd/devices/spear_smi.c | 38 ++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
> index 986f81d2f93e..47ad0766affa 100644
> --- a/drivers/mtd/devices/spear_smi.c
> +++ b/drivers/mtd/devices/spear_smi.c
> @@ -592,6 +592,26 @@ static int spear_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	return 0;
>  }
>  
> +/*
> + * The purpose of this function is to ensure a memcpy_toio() with byte writes
> + * only. Its structure is inspired from the ARM implementation of _memcpy_toio()
> + * which also does single byte writes but cannot be used here as this is just an
> + * implementation detail and not part of the API. Not mentioning the comment
> + * stating that _memcpy_toio() should be optimized.
> + */
> +static void spear_smi_memcpy_toio_b(volatile void __iomem *dest,
> +				    const void *src, size_t len)
> +{
> +	const unsigned char *from = src;
> +
> +	while (len) {
> +		len--;
> +		writeb(*from, dest);
> +		from++;
> +		dest++;
> +	}
> +}
> +
>  static inline int spear_smi_cpy_toio(struct spear_smi *dev, u32 bank,
>  		void __iomem *dest, const void *src, size_t len)
>  {
> @@ -614,7 +634,23 @@ static inline int spear_smi_cpy_toio(struct spear_smi *dev, u32 bank,
>  	ctrlreg1 = readl(dev->io_base + SMI_CR1);
>  	writel((ctrlreg1 | WB_MODE) & ~SW_MODE, dev->io_base + SMI_CR1);
>  
> -	memcpy_toio(dest, src, len);
> +	/*
> +	 * In Write Burst mode (WB_MODE), the specs states that writes must be:
> +	 * - incremental
> +	 * - of the same size
> +	 * The ARM implementation of memcpy_toio() will optimize the number of
> +	 * I/O by using as much 4-byte writes as possible, surrounded by
> +	 * 2-byte/1-byte access if:
> +	 * - the destination is not 4-byte aligned
> +	 * - the length is not a multiple of 4-byte.
> +	 * Avoid this alternance of write access size by using our own 'byte
> +	 * access' helper if at least one of the two conditions above is true.
> +	 */
> +	if (IS_ALIGNED(len, sizeof(u32)) &&
> +	    IS_ALIGNED((uintptr_t)dest, sizeof(u32)))

The only slight eye-brow raising bit is the use of uintptr_t - we tend
to shy away from C99 types in the kernel.  However, as linux/kernel.h
uses it, I suppose it's fine.

Reviewed-by: Russell King <rmk+kernel@armlinux.org.uk>

Thanks.

> +		memcpy_toio(dest, src, len);
> +	else
> +		spear_smi_memcpy_toio_b(dest, src, len);
>  
>  	writel(ctrlreg1, dev->io_base + SMI_CR1);
>  
> -- 
> 2.20.1
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
