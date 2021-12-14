Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77133C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Dec 2021 16:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p43wVSc7k17BOWcosixFtQK55r+z8PmrVub8JsWS/aU=; b=AQm8P25amJNLK5
	Z50syfto4tMkbfYveaj8qxhZ4sgzkJWrwAFmX11AOv+XoQLI+dNDoFwTjXr9O9p/DJmP4Fnp+jo4o
	ggjDSJSFlt2z3vmldtJj235AyeLZ2YDx1XeByGrMC7V0TuX6iscQdAkT7gBckiO81a1hd1nDLwJLS
	UCe3Oi35NWse5G/kZUyVIHDKA5D9GjivaDNuVqd8Xb1AvBk6na/Atk/11xOrvjv6CT1NzNHktDtPg
	vCJfV8vadpEoxJejtxLD8koAUYb4nSCRN+05DTqdB2Kx7vmP4qxZeQKsgD4INPKazkic1MySwCdPY
	tiXDQPViLgf0zPo2zYRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxAbE-00Eqst-Li; Tue, 14 Dec 2021 16:24:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxAbB-00Eqqx-Ou
 for linux-mtd@lists.infradead.org; Tue, 14 Dec 2021 16:24:19 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F147E1F45083;
 Tue, 14 Dec 2021 16:24:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639499054; bh=q5FLUqmXp3eMoXGl3ayVU2dNgxeDuQyuxsp5KTMhAPM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Nm0cTcndYYKJM+XqQHWiW4PSjbUPZ/WNwsyAOy3IPGZsje2s4A/lP0l/PlH5N6R23
 4Vyz3RMvGjQz9AoF/pLqEhPsmRTGRRqg8Kg1kkRi+OkF5EZqdrw5udNJuuXxIdqRt/
 jCFpM+82TwbtMB68Wgo+MpDJwa6WX6KSQiYvfMqjK4xd5V13gFH/ydmk1VZjlBT340
 EWtCW1cjeyLQrVdsMPI1yQjNeD8LMpp0ZfGlVhB4jkARHZne4OfML/SEedRA2et5ol
 dY/vjO2LgsDmpzWnNDRyzy9KX4LbETklep+9TBnybfAkYtVEftSs4IxyvRk52pZ1Vy
 9uVcaVhzUrI2A==
Date: Tue, 14 Dec 2021 17:24:10 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v5 12/13] spi: mxic: Use spi_mem_generic_supports_op()
Message-ID: <20211214172410.2b26c17e@collabora.com>
In-Reply-To: <20211214114140.54629-13-miquel.raynal@bootlin.com>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
 <20211214114140.54629-13-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_082417_999160_D8D736D8 
X-CRM114-Status: GOOD (  21.75  )
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

On Tue, 14 Dec 2021 12:41:39 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> This driver can be simplified a little bit by using
> spi_mem_generic_supports_op() instead of the
> spi_mem_default/dtr_supports_op() couple. The all_false boolean is
> inverted to become a dtr boolean, which checks if at least one of the
> operation member uses dtr mode. The idea behind this change is to
> simplify the introduction of the pipelined ECC engine.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/spi/spi-mxic.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> index 485a7f2afb44..5e71aa630504 100644
> --- a/drivers/spi/spi-mxic.c
> +++ b/drivers/spi/spi-mxic.c
> @@ -452,7 +452,7 @@ static ssize_t mxic_spi_mem_dirmap_write(struct spi_mem_dirmap_desc *desc,
>  static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
>  				     const struct spi_mem_op *op)
>  {
> -	bool all_false;
> +	struct spi_mem_controller_caps caps = {};
>  
>  	if (op->data.buswidth > 8 || op->addr.buswidth > 8 ||
>  	    op->dummy.buswidth > 8 || op->cmd.buswidth > 8)
> @@ -465,13 +465,9 @@ static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
>  	if (op->addr.nbytes > 7)
>  		return false;
>  
> -	all_false = !op->cmd.dtr && !op->addr.dtr && !op->dummy.dtr &&
> -		    !op->data.dtr;
> +	caps.dtr = op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr;

Are you sure that's what you want to do? spi_mem_controller_caps is
supposed to encode the controller capabilities, not whether the
operation contains a DTR cycle or not. I'd expect this caps object to be
statically defined, with possibly one instance per-compat if the caps
depend on the HW revision.

>  
> -	if (all_false)
> -		return spi_mem_default_supports_op(mem, op);
> -	else
> -		return spi_mem_dtr_supports_op(mem, op);
> +	return spi_mem_generic_supports_op(mem, op, &caps);
>  }
>  
>  static int mxic_spi_mem_dirmap_create(struct spi_mem_dirmap_desc *desc)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
