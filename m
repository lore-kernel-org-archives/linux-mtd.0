Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F54C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 16:12:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7E442064B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 16:12:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TsDBt2Gw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7E442064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1n5SZ26vltkgdWvYZ/rPKcYV4b8jUpM5hY9cW8U+7io=; b=TsDBt2GwDEN/KN9vb9KXkZwcS
	JwZQ9NQiI82ub+qWDbNcUxn9jFw0puDxrI6lB605hkdGPI/aG/wA3o1fU3R/OL8csVpPI+jGf1h4p
	rp84ypDRsOreq1wNI8GIreckyG3Ean0fNm4VfeuHrbkN5gu7MfkhQifRLUzXvsoX5qyi4jZRZoRSP
	fDvfat3KDhj6hyBshXpvw11jn0cWV+ArkmYoOqvmCL7Zmu9i3t2SgmG2FDzmXDcTMR66SHgYujFGt
	kAiWked7Z6uvVRrjbYUnfHrWCTE+EgUtFt5dWDaFUsRb3HHIRgkrYKQe+YwRJENuz8SlL8ft2wOpH
	YzaLHRYXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxYOD-0000X8-6E; Mon, 20 Jul 2020 16:11:41 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxYO8-0000VM-6n; Mon, 20 Jul 2020 16:11:37 +0000
Received: from localhost (unknown [42.109.212.217])
 (Authenticated sender: me@yadavpratyush.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id D6FE810000E;
 Mon, 20 Jul 2020 16:11:27 +0000 (UTC)
Date: Mon, 20 Jul 2020 21:41:23 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v10 13/17] mtd: spi-nor: core: perform a Soft Reset on
 shutdown
Message-ID: <20200720161123.dth4rzziidpx5pmb@yadavpratyush.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-14-p.yadav@ti.com>
 <ccc128f1-2e7b-e64f-c958-ad5cc272085a@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccc128f1-2e7b-e64f-c958-ad5cc272085a@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_121136_459423_6320311E 
X-CRM114-Status: GOOD (  25.12  )
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, richard@nod.at,
 nsekhar@ti.com, Nicolas.Ferre@microchip.com, boris.brezillon@collabora.com,
 michal.simek@xilinx.com, Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 miquel.raynal@bootlin.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org, p.yadav@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 08/07/20 04:10PM, Tudor.Ambarus@microchip.com wrote:
> On 6/23/20 9:30 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Perform a Soft Reset on shutdown on flashes that support it so that the
> > flash can be reset to its initial state and any configurations made by
> > spi-nor (given that they're only done in volatile registers) will be
> > reset. This will hand back the flash in pristine state for any further
> > operations on it.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/mtd/spi-nor/core.c  | 42 +++++++++++++++++++++++++++++++++++++
> >  include/linux/mtd/spi-nor.h |  2 ++
> >  2 files changed, 44 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 4a1f6b343534..27ad9bab06dc 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -40,6 +40,9 @@
> > 
> >  #define SPI_NOR_MAX_ADDR_WIDTH 4
> > 
> > +#define SPI_NOR_SRST_SLEEP_MIN 200
> > +#define SPI_NOR_SRST_SLEEP_MAX 400
> > +
> >  /**
> >   * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
> >   *                        extension type.
> > @@ -3201,6 +3204,41 @@ static int spi_nor_init(struct spi_nor *nor)
> >         return 0;
> >  }
> > 
> > +static void spi_nor_soft_reset(struct spi_nor *nor)
> > +{
> > +       struct spi_mem_op op;
> > +       int ret;
> > +
> > +       op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRSTEN, 8),
> > +                       SPI_MEM_OP_NO_DUMMY,
> > +                       SPI_MEM_OP_NO_ADDR,
> > +                       SPI_MEM_OP_NO_DATA);
> > +       spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> > +       ret = spi_mem_exec_op(nor->spimem, &op);
> > +       if (ret) {
> > +               dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> > +               return;
> > +       }
> > +
> > +       op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRST, 8),
> > +                       SPI_MEM_OP_NO_DUMMY,
> > +                       SPI_MEM_OP_NO_ADDR,
> > +                       SPI_MEM_OP_NO_DATA);
> > +       spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> > +       ret = spi_mem_exec_op(nor->spimem, &op);
> > +       if (ret) {
> > +               dev_warn(nor->dev, "Software reset failed: %d\n", ret);
> > +               return;
> > +       }
> > +
> > +       /*
> > +        * Software Reset is not instant, and the delay varies from flash to
> > +        * flash. Looking at a few flashes, most range somewhere below 100
> > +        * microseconds. So, sleep for a range of 200-400 us.
> > +        */
> > +       usleep_range(SPI_NOR_SRST_SLEEP_MIN, SPI_NOR_SRST_SLEEP_MAX);
> > +}
> > +
> >  /* mtd resume handler */
> >  static void spi_nor_resume(struct mtd_info *mtd)
> >  {
> > @@ -3220,6 +3258,10 @@ void spi_nor_restore(struct spi_nor *nor)
> >         if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
> >             nor->flags & SNOR_F_BROKEN_RESET)
> >                 nor->params->set_4byte_addr_mode(nor, false);
> > +
> > +       if (nor->info->flags & SPI_NOR_OCTAL_DTR_READ &&
> 
> Why this limitation? Can't we make the software reset available for all
> the modes?

Because I wrote the function spi_nor_soft_reset() from the perspective 
of xSPI support, and the xSPI spec only cares about the 8D-8D-8D version 
of the soft reset.

BFPT says we can execute it on 1, 2, 4, or 8 wires depending on the mode 
so I guess we can support a generalized version as well. Will fix.

> > +           nor->flags & SNOR_F_SOFT_RESET)
> > +               spi_nor_soft_reset(nor);
> >  }
> >  EXPORT_SYMBOL_GPL(spi_nor_restore);
> > 
> > diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> > index cd549042c53d..299685d15dc2 100644
> > --- a/include/linux/mtd/spi-nor.h
> > +++ b/include/linux/mtd/spi-nor.h
> > @@ -51,6 +51,8 @@
> >  #define SPINOR_OP_CLFSR                0x50    /* Clear flag status register */
> >  #define SPINOR_OP_RDEAR                0xc8    /* Read Extended Address Register */
> >  #define SPINOR_OP_WREAR                0xc5    /* Write Extended Address Register */
> > +#define SPINOR_OP_SRSTEN       0x66    /* Software Reset Enable */
> > +#define SPINOR_OP_SRST         0x99    /* Software Reset */
> > 
> >  /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
> >  #define SPINOR_OP_READ_4B      0x13    /* Read data bytes (low frequency) */

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
