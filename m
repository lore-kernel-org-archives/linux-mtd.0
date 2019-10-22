Return-Path: <SRS0=fgf0=YP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E060FCA9EA0
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 08:27:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DF3421783
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 08:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CbTlzYuk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="pbduPVqd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DF3421783
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ba0xNqL+L6bJTnEZ83CgM8rVicTSQrDrsHdAY++5iQM=; b=CbTlzYukZQQ9th
	E+mpFieUQScHvw+Y7fHEySlkylC+IyRdJXk04eg4q4/RXfnx5duzsxfkouludLy/ZT9Fe+QvR1GT6
	ol10oOOXWKuaVUJK1769IzziNoGXPj0tmtvb8CSEi068p5bBGlx+ZQFHAfj7O8y+MekzqJyCnw+hH
	zj/AmchHpwg0jFdQboVWdSogwVLJxx9H5f44raKZj4mC8qrIk142Sx8jTVNl6Uqhun/ZrFFClGlmX
	LZAznadAIIOYCgDh3jYKiHa1GgKeZ4ND/rf4HFPPRi4sr5J/CyjVq8BrvGCwAaDy4C1oH31BDxbct
	5JcV5jPNAFte4PGoIGKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMpVi-0005aj-0F; Tue, 22 Oct 2019 08:27:22 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMpVe-0005SA-JJ; Tue, 22 Oct 2019 08:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5NbtpQgTT3ENpHphUcwdOH97IrHrqerBCMB0wEN3nMk=; b=pbduPVqdXXEf/nzVVbslGra/k
 BxRhBecen5uPmXgQryPOFBlmOCcggPUfOYxHy8O8WvP5Hnb2Iwqm1BcBw+DFGMY1Od0XxLP+UHOb/
 pevLZaAB7MrMzzvmUdW3G6mJytz+sqcpNPnrhReSbNrAmQDOaV3rQxp5fOVvRBi1VST/JHnlyVwsA
 8WUghEu54Q0gpHJpleUalrUfJWM2fwiV9C4mieJElUlSaZcLZFepNTjSFPom/ReqyJXoQfRrlbLN6
 E05Tl1r5uKfJqtL8gPohtXgSiprme5nNjzedBHlmht/L3n6RAUi8y6rPgq0I689S1A9saT/MyxhY8
 qONVZyGPA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57534)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iMpV9-0005zQ-Is; Tue, 22 Oct 2019 09:26:47 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iMpV5-0004ON-Kj; Tue, 22 Oct 2019 09:26:43 +0100
Date: Tue, 22 Oct 2019 09:26:43 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spear_smi: Fix nonalignment not handled in
 memcpy_toio
Message-ID: <20191022082643.GO25745@shell.armlinux.org.uk>
References: <20191018143643.29676-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018143643.29676-1-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_012718_637360_9306587B 
X-CRM114-Status: GOOD (  25.10  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 18, 2019 at 04:36:43PM +0200, Miquel Raynal wrote:
> Any write with either dd or flashcp to a device driven by the
> spear_smi.c driver will pass through the spear_smi_cpy_toio()
> function. This function will get called for chunks of up to 256 bytes.
> If the amount of data is smaller, we may have a problem if the data
> length is not 4-byte aligned. In this situation, the kernel panics
> during the memcpy:
> =

>     # dd if=3D/dev/urandom bs=3D1001 count=3D1 of=3D/dev/mtd6
>     spear_smi_cpy_toio [620] dest c9070000, src c7be8800, len 256
>     spear_smi_cpy_toio [620] dest c9070100, src c7be8900, len 256
>     spear_smi_cpy_toio [620] dest c9070200, src c7be8a00, len 256
>     spear_smi_cpy_toio [620] dest c9070300, src c7be8b00, len 233
>     Unhandled fault: external abort on non-linefetch (0x808) at 0xc90703e8
>     [...]
>     PC is at memcpy+0xcc/0x330

I need the full oops if you want me to comment on this.

> =

> Workaround this issue by using the alternate _memcpy_toio() method
> which at least does not present the same problem.
> =

> Fixes: f18dbbb1bfe0 ("mtd: ST SPEAr: Add SMI driver for serial NOR flash")
> Cc: stable@vger.kernel.org
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> =

> Hello,
> =

> This patch could not be tested with a mainline kernel (only compiled)
> but was tested with a stable 4.14.x kernel. I have really no idea why
> memcpy fails in this situation that's why I propose this workaround
> but I bet there is something deeper not working.
> =

> Thanks,
> Miqu=E8l
> =

>  drivers/mtd/devices/spear_smi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_=
smi.c
> index 986f81d2f93e..d888625a3244 100644
> --- a/drivers/mtd/devices/spear_smi.c
> +++ b/drivers/mtd/devices/spear_smi.c
> @@ -614,7 +614,7 @@ static inline int spear_smi_cpy_toio(struct spear_smi=
 *dev, u32 bank,
>  	ctrlreg1 =3D readl(dev->io_base + SMI_CR1);
>  	writel((ctrlreg1 | WB_MODE) & ~SW_MODE, dev->io_base + SMI_CR1);
>  =

> -	memcpy_toio(dest, src, len);
> +	_memcpy_toio(dest, src, len);
>  =

>  	writel(ctrlreg1, dev->io_base + SMI_CR1);
>  =

> -- =

> 2.20.1
> =

> =

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps =
up
According to speedtest.net: 11.9Mbps down 500kbps up

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
