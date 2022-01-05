Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0BFC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jan 2022 09:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2S7YzWdZfAKpwKyFk/lQJOm0FOPfZoT+RXg18eWuOk=; b=H2A0Kvh71j7E9B
	1y/uU5KTACQ/UhjlB+cSwb5a1Jr6bmVBaowVK8fPfSKbr/rXKgZucYiUmKVz/66eXa1potCPFeiy5
	w8Fq5sG8h/vtUQ0RI+gQxBfy9Xbq1vwiCXEqv12/vBaKUc0VKOF06UQbIluAugBW1aXibnD7NR+SY
	c0yPbuSm8PTCFiRXepsXpNx1P9eUFbWFouzElnmcEUjxkdiWxm426UvMhqo8ZBrT8Ow3CgMkvhWi9
	NBvjZSsp2j5cXgw+dM5jQ7MnVhT5l1pYIU6dMjL2Ws1bbvloOMBoaManqP9n6m1q/YOyf8s/+1VH+
	vcSmg9eQH+qY7T57qKsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n52xm-00EPrr-FX; Wed, 05 Jan 2022 09:52:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n52xj-00EPqq-Hr
 for linux-mtd@lists.infradead.org; Wed, 05 Jan 2022 09:52:09 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1FCD01F44273;
 Wed,  5 Jan 2022 09:52:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641376324;
 bh=YOlZt4wlWDPgzl3ELAotsQoHSGbdiyMS1ERP5Zojv2w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HKDb9+W/5fgRZqr8su3iW5HhgJtmgHqUTGr2z6th03Wq99Z81PfsYztZKiC0UCzzM
 yGdjoUci7xc/pKwwMIsdaViofCFzkWbnxFIyADfjvfT9LrbtFr2Nu6qVhXOZmZVNE4
 YyT2XDAf8DHrBkJnZXT+7cuSIHkBFkYLx3ae37VAGU2WWBR5Ki3C/AdjpgN19QS0E8
 U68T+FyE1dDVvhbCpCNJpEIGs9IFitVgdNNDFYcHaGiw2Lw3ogWtRqBgbSY4S/f9pO
 YqONNzVL31SyK+F8G3c37n7t/zwpLhF4MvQN5cZEpABKc1XgmZLOhduvTGbdT1PwZM
 uonWeT/drGRGg==
Date: Wed, 5 Jan 2022 10:52:00 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>, Daniel Palmer
 <daniel@0x0f.com>, Alexander Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <p.yadav@ti.com>
Subject: Re: [PATCH v3 09/17] mtd: spinand: Add change_mode() in
 manufacturer_ops
Message-ID: <20220105105200.67037833@collabora.com>
In-Reply-To: <20220101074250.14443-10-a-nandan@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
 <20220101074250.14443-10-a-nandan@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_015207_781771_0F37D2C7 
X-CRM114-Status: GOOD (  21.52  )
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

On Sat, 1 Jan 2022 13:12:42 +0530
Apurva Nandan <a-nandan@ti.com> wrote:

> Introduce change_mode() manufacturer_op to let the vendor provide the
> implementation of switching of SPI IO modes.
> 
> The method to switch to different SPI IO mode may vary across
> manufacturers. For example, for Winbond, Octal DTR is enabled by
> writing values to the volatile configuration register. So, let the
> manufacturer's code have their own implementation for switching to
> any given SPI IO mode. Manufacturer's code need to take care, if
> the requested protocol change is allowed/needed and how to apply
> it.
> 
> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> ---
>  include/linux/mtd/spinand.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 5dae0649f2fb..ad924271a248 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -298,6 +298,7 @@ struct spinand_devid {
>  /**
>   * struct manufacurer_ops - SPI NAND manufacturer specific operations
>   * @init: initialize a SPI NAND device
> + * @change_mode: switch the SPI NAND flash to a specific SPI protocol
>   * @cleanup: cleanup a SPI NAND device
>   *
>   * Each SPI NAND manufacturer driver should implement this interface so that
> @@ -305,6 +306,8 @@ struct spinand_devid {
>   */
>  struct spinand_manufacturer_ops {
>  	int (*init)(struct spinand_device *spinand);
> +	int (*change_mode)(struct spinand_device *spinand,
> +			   const enum spinand_protocol protocol);

Protocol or mode? Pick one and stick to it. Given you already use
protocol elsewhere, maybe s/select_mode/select_protocol/.

>  	void (*cleanup)(struct spinand_device *spinand);
>  };
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
