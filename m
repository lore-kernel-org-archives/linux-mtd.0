Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7DEC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 16:25:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BE9F2065F
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 16:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yoLknRRT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BE9F2065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5M0Dg3QIJQv4PEUpjkQeFYgape4FtTHclANY4Jgwv9s=; b=yoLknRRTH0zp6KXwcp7nrJELD
	W60Ym1M3ujS6hFI90FL2PxIxVYsZXRoy8WNP4SMVBEn33wl5E4YKUQtvRDUGEy8PBmLqY4KYEu+UG
	QBYK+eazkC4HnHjiJIzY7mZAJALKfaYOlY/mK6fTzOl7+Cqp/wHzs4/dYtnR6WkpNM+PSDV2Ko59K
	pD34kuyie7ZIzgWe1ttz2KVgIz75Rnr6V/8EVtBQ3uSI2HgD6YiaNjLVrW3/HGuVB+wJDkl/XBtgd
	j8ygggsTBA7RrqRWpjz/N4T/j+FZJgMlbY6CkkSAVVfod9vfiO99HdV03mzbQ05mITmK5r51tWi7R
	tQxo76VQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxYbM-0003Dg-Og; Mon, 20 Jul 2020 16:25:16 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxYbH-0003Br-44; Mon, 20 Jul 2020 16:25:12 +0000
X-Originating-IP: 42.109.212.217
Received: from localhost (unknown [42.109.212.217])
 (Authenticated sender: me@yadavpratyush.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9F2B360007;
 Mon, 20 Jul 2020 16:25:04 +0000 (UTC)
Date: Mon, 20 Jul 2020 21:54:56 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v10 08/17] mtd: spi-nor: core: use dummy cycle and
 address width info from SFDP
Message-ID: <20200720162456.juud5ytn3tnbwloa@yadavpratyush.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-9-p.yadav@ti.com>
 <d4b5178e-debb-1397-caae-f20086f5c3fc@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4b5178e-debb-1397-caae-f20086f5c3fc@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_122511_370204_40D5E165 
X-CRM114-Status: GOOD (  18.36  )
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

On 08/07/20 04:03PM, Tudor.Ambarus@microchip.com wrote:
> On 6/23/20 9:30 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > The xSPI Profile 1.0 table specifies how many dummy cycles and address
> > bytes are needed for the Read Status Register command in octal DTR mode.
> > Use that information to send the correct Read SR command.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/mtd/spi-nor/core.c | 25 +++++++++++++++++++++++--
> >  1 file changed, 23 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 7d24e63fcca8..f2748f1d9957 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -357,6 +357,8 @@ int spi_nor_write_disable(struct spi_nor *nor)
> >  static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
> >  {
> >         int ret;
> > +       u8 addr_bytes = nor->params->rdsr_addr_nbytes;
> > +       u8 dummy = nor->params->rdsr_dummy;
> 
> no need to introduce local variables for a single dereference

Ok.
 
> > 
> >         if (nor->spimem) {
> >                 struct spi_mem_op op =
> > @@ -365,10 +367,21 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
> >                                    SPI_MEM_OP_NO_DUMMY,
> >                                    SPI_MEM_OP_DATA_IN(1, sr, 1));
> > 
> > +               if (spi_nor_protocol_is_dtr(nor->reg_proto)) {
> > +                       op.addr.nbytes = addr_bytes;
> > +                       op.addr.val = 0;
> 
> isn't addr already initialized to 0?

Yes, it is. But I figured it won't hurt to be explicit about what we 
intend the address to be.

> > +                       op.dummy.nbytes = dummy;
> > +               }
> > +
> > +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> > +
> >                 ret = spi_mem_exec_op(nor->spimem, &op);
> >         } else {
> > -               ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR,
> > -                                                   sr, 1);
> > +               if (spi_nor_protocol_is_dtr(nor->reg_proto))
> > +                       ret = -ENOTSUPP;
> > +               else
> > +                       ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR,
> > +                                                           sr, 1);
> >         }
> 
> doesn't this belong to a previous patch?

It does. Will fix.
 
> > 
> >         if (ret)
> > @@ -388,6 +401,8 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
> >  static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
> >  {
> >         int ret;
> > +       u8 addr_bytes = nor->params->rdsr_addr_nbytes;
> > +       u8 dummy = nor->params->rdsr_dummy;
> > 
> >         if (nor->spimem) {
> >                 struct spi_mem_op op =
> > @@ -396,6 +411,12 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
> >                                    SPI_MEM_OP_NO_DUMMY,
> >                                    SPI_MEM_OP_DATA_IN(1, fsr, 1));
> > 
> > +               if (spi_nor_protocol_is_dtr(nor->reg_proto)) {
> > +                       op.addr.nbytes = addr_bytes;
> > +                       op.addr.val = 0;
> > +                       op.dummy.nbytes = dummy;
> > +               }
> > +
> >                 spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> > 
> >                 ret = spi_mem_exec_op(nor->spimem, &op);

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
