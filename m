Return-Path: <SRS0=YEqx=46=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1374C10DCE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 09:30:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FBF72073E
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 09:30:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z8Q548HV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FBF72073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HmCWm/+83O2wx1ac2gC7UZ8MDr4/AwauVohYAjOiWn0=; b=Z8Q548HV/2pQlL
	66QG1RXyClbiAlywVU+Y6rUa27WT2EFPZR1CSoDGtMi/KYQ3Qc4VTHmoppIC1Ow4EPNxh1BBq0yFT
	8j0jZp9qBjMSIXTY3xil0UR6Dcieus7JXHzOenugePCfM5eeoOeismaKKtGXziwHtfNUOtMebBpCo
	uGKco44oaZEXaIfxYBP1v+3Z7IZ22FiqLtILDP9ensSxA9scf8a2ayF+ZnqdYJlF16IKXAWWh/GI3
	micw50eHwfNllG4yGgBYIj9yYwNbZjbGmSzhBcyWhpLY4e3nxzxquAceEj5Bo1VhhjEph7gDYHBft
	Gk41mIH5eJGH80OQS15g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCgeG-0004oU-9f; Fri, 13 Mar 2020 09:30:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCgdz-0004bF-Uw; Fri, 13 Mar 2020 09:30:17 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 83AF0295CF8;
 Fri, 13 Mar 2020 09:30:11 +0000 (GMT)
Date: Fri, 13 Mar 2020 10:30:07 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 01/23] mtd: spi-nor: Stop prefixing generic functions
 with a manufacturer name
Message-ID: <20200313103007.7d7ea6af@collabora.com>
In-Reply-To: <91394111-cbd6-c24e-485d-88fcd6825dc7@ti.com>
References: <20200302180730.1886678-1-tudor.ambarus@microchip.com>
 <20200302180730.1886678-2-tudor.ambarus@microchip.com>
 <91394111-cbd6-c24e-485d-88fcd6825dc7@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_023016_128546_39F27EB3 
X-CRM114-Status: GOOD (  19.17  )
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
Cc: kstewart@linuxfoundation.org, alexandre.belloni@bootlin.com,
 linux-aspeed@lists.ozlabs.org, thor.thayer@linux.intel.com,
 jethro@fortanix.com, rfontana@redhat.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, opensource@jilayne.com, richard@nod.at,
 allison@lohutok.net, michal.simek@xilinx.com, Ludovic.Desroches@microchip.com,
 joel@jms.id.au, nishkadg.linux@gmail.com, Tudor.Ambarus@microchip.com,
 john.garry@huawei.com, vz@mleia.com, alexander.sverdlin@nokia.com,
 matthias.bgg@gmail.com, tglx@linutronix.de, swboyd@chromium.org,
 mika.westerberg@linux.intel.com, ludovic.barre@st.com,
 linux-arm-kernel@lists.infradead.org, bbrezillon@kernel.org, andrew@aj.id.au,
 Nicolas.Ferre@microchip.com, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 michael@walle.cc, linux-mediatek@lists.infradead.org, info@metux.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 13 Mar 2020 11:34:55 +0530
Vignesh Raghavendra <vigneshr@ti.com> wrote:

> On 02/03/20 11:37 pm, Tudor.Ambarus@microchip.com wrote:
> > From: Boris Brezillon <bbrezillon@kernel.org>
> > 
> > Replace the manufacturer prefix by something describing more precisely
> > what those functions do.
> > 
> > Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
> > [tudor.ambarus@microchip.com: prepend spi_nor_ to all modified methods.]
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 88 ++++++++++++++++++-----------------
> >  1 file changed, 45 insertions(+), 43 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index caf0c109cca0..b15e262765e1 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -568,14 +568,15 @@ static int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
> >  }
> >  
> >  /**
> > - * macronix_set_4byte() - Set 4-byte address mode for Macronix flashes.
> > + * spi_nor_en4_ex4_set_4byte() - Enter/Exit 4-byte mode for Macronix like
> > + * flashes.
> >   * @nor:	pointer to 'struct spi_nor'.
> >   * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
> >   *		address mode.
> >   *
> >   * Return: 0 on success, -errno otherwise.
> >   */
> > -static int macronix_set_4byte(struct spi_nor *nor, bool enable)
> > +static int spi_nor_en4_ex4_set_4byte(struct spi_nor *nor, bool enable)  
> 
> 
> Sounds a bit weird, how about simplifying this to:
> 
> 	spi_nor_set_4byte_addr_mode()
> 
> Or if you want to be specific:
> 
> 	spi_nor_en_ex_4byte_addr_mode()

You're right. Maybe we can simplify things by having a single function
that does optional steps based on new flags

SPI_NOR_EN_EX_4B_NEEDS_WEN
SPI_NOR_CLEAR_EAR_ON_4B_EXIT

This should probably be done in a separate patch though, so ack on the
spi_nor_en_ex_4byte_addr_mode() rename, assuming we also change the
bool argument name to enter.

> 
> >  {
> >  	int ret;
> >  
> > @@ -604,14 +605,15 @@ static int macronix_set_4byte(struct spi_nor *nor, bool enable)
> >  }
> >  
> >  /**
> > - * st_micron_set_4byte() - Set 4-byte address mode for ST and Micron flashes.
> > + * spi_nor_en4_ex4_wen_set_4byte() - Set 4-byte address mode for ST and Micron
> > + * flashes.
> >   * @nor:	pointer to 'struct spi_nor'.
> >   * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
> >   *		address mode.
> >   *
> >   * Return: 0 on success, -errno otherwise.
> >   */
> > -static int st_micron_set_4byte(struct spi_nor *nor, bool enable)
> > +static int spi_nor_en4_ex4_wen_set_4byte(struct spi_nor *nor, bool enable)  
> 
> 
> Unrelated to this patch itself, but can we just have one set_4byte
> variant that uses WREN and drop the other one?

Hm, not sure that's a good idea to insert WEN instructions for
everyone, sounds like a recipe for regressions.

> I expect sending WREN should be harmless even for cmds that don't expect
> one.

In theory yes, but you know flash chips are capricious, so let's not
take the risk of breaking things :-).

> 
> Rest looks good to me.
> 
> Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
