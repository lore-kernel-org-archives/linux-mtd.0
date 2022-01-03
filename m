Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518D7C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vw34G5F0xlgYuAa4Av+vrJ+mx8cRJM5q0dw/6M/8SrY=; b=gIosm7sK4IuF+w
	DQCJfuPpr1MgU68DFJj82GltQi3gq3YDrTJnS9325kSnbFEdxypqrrrnI56Ckfmdw76zAbJWNHZLm
	UYXzMvjrlEKMvAF7/ZAAhrzAavGedNbqP5b1o92wJ604kBYR2W4fRxKGpzzIrq/XOcQbzlBgKQDsL
	x7RzG8JXdSEPKrvYq4RhNGEO/O6Tc/KHcs2BEQllMpVXmVRSykVwe8L4Qe4sm67OH3pebP23op6mH
	dJ4fc2u9lm13vnrqMW53I0qLIP+bqqqsjUZCGfFooOTUkDV+HmwRcg571Hwzw9JRvfrieosvpxKe7
	NkT5pE8zxzVSuRKQwiSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4KPG-008kxa-1D; Mon, 03 Jan 2022 10:17:34 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4KPC-008kwY-G3
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 10:17:31 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AEA5D1F41D7C;
 Mon,  3 Jan 2022 10:17:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641205049;
 bh=ocbIJznQCqUQhCxdWJ6da5NCU1wQ2RLHpXKaimR61ok=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ApL3RROiIA61nFmL87rahNxhTzVwNJ0DT2FR1qj219bj/7tUqjnvi7LTQNmYKm27e
 ip+v5Kpugmu5RNIK6uE9z4AzqdPDB4KBnZXRLRuMujtYnX1kjtE0OkmTmy2izNwc9x
 iA0v+RDrLuJgZNSrPrUFabblu77dqk5ByeWjaqyyTUMxM22lmTKyw7gUCrakLiNfUH
 625aeY9ymm4Ovq50bhv7FzgpuO7M1m9AoC/zn7AkI+SNe3HdYGpOI1MVWLhy++dxo/
 fBkA+A17Q8sDytk0CIDZCg6nK4bUmXhFb4tB6uaMxpY/OnLMTDBfQHxATiwAo+Fg/K
 aYq/0PsjiDMiw==
Date: Mon, 3 Jan 2022 11:17:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>, Daniel Palmer
 <daniel@0x0f.com>, Alexander Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <p.yadav@ti.com>
Subject: Re: [PATCH v3 12/17] mtd: spinand: Add mtd_suspend() to disable
 Octal DTR mode at suspend
Message-ID: <20220103111725.3e3ce291@collabora.com>
In-Reply-To: <20220101074250.14443-13-a-nandan@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
 <20220101074250.14443-13-a-nandan@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_021730_703385_4ABDE8D2 
X-CRM114-Status: GOOD (  22.34  )
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

On Sat, 1 Jan 2022 13:12:45 +0530
Apurva Nandan <a-nandan@ti.com> wrote:

> The flash might or might not have gone a power-down during sleep.
> Hence, its SPI IO mode is unpredictable for the core at the time of
> resume. To ensure proper reinitialization during resume, disable the
> Octal DTR SPI IO mode and bring the flash to 1S-1S-1S mode when
> performing suspend using mtd_suspend().
> 
> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> ---
>  drivers/mtd/nand/spi/core.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 2fd08085db6f..9d1c72634e5a 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -1307,6 +1307,16 @@ static void spinand_mtd_resume(struct mtd_info *mtd)
>  	spinand_ecc_enable(spinand, false);
>  }
>  
> +static int spinand_mtd_suspend(struct mtd_info *mtd)
> +{
> +	struct spinand_device *spinand = mtd_to_spinand(mtd);
> +
> +	if (spinand->ctrl_ops->protocol == SPINAND_8D_8D_8D)
> +		return spinand_init_octal_dtr_disable(spinand);

Ok, so you're calling it here. I'd re-order commmits so that DTR
support is added after the suspend hook is defined, even if this hook
does nothing at first. This way you don't have an unused warning in the
previous commit, and most importantly, you don't enter 8DTR before
you're sure things will be set back to 1S when entering suspend.

> +
> +	return 0;
> +}
> +
>  static int spinand_init(struct spinand_device *spinand)
>  {
>  	struct device *dev = &spinand->spimem->spi->dev;
> @@ -1381,6 +1391,7 @@ static int spinand_init(struct spinand_device *spinand)
>  	mtd->_erase = spinand_mtd_erase;
>  	mtd->_max_bad_blocks = nanddev_mtd_max_bad_blocks;
>  	mtd->_resume = spinand_mtd_resume;
> +	mtd->_suspend = spinand_mtd_suspend;
>  
>  	if (nand->ecc.engine) {
>  		ret = mtd_ooblayout_count_freebytes(mtd);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
