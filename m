Received: from mail-yh0-f45.google.com ([209.85.213.45])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqiMp-00010R-5H
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2013 11:54:16 +0000
Received: by mail-yh0-f45.google.com with SMTP id v1so4901579yhn.18
 for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2013 03:53:52 -0800 (PST)
Date: Wed, 11 Dec 2013 11:53:45 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 2/4] mtd: spi-nor: add the basic data structures
Message-ID: <20131211115345.GL16780@lee--X1>
References: <1386318764-15882-1-git-send-email-b32955@freescale.com>
 <201312101407.59958.marex@denx.de>
 <20131211062428.GA25147@shlinux2.ap.freescale.net>
 <201312111102.18554.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201312111102.18554.marex@denx.de>
Cc: angus.clark@st.com, broonie@linaro.org, linux-spi@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 pekon@ti.com, sourav.poddar@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > > > The spi_nor{} is cloned from the m25p{}.
> > > > +	struct spi_nor_xfer_cfg	cfg;
> > > > +
> > > > +	/* for write_reg */
> > > > +	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
> > > > +
> > > > +	/* the two fundamental primitives */
> > > > +	int (*read_xfer)(struct spi_nor *nor, struct spi_nor_xfer_cfg *cfg,
> > > > +			 u8 *buf, size_t len);
> > > > +	int (*write_xfer)(struct spi_nor *nor, struct spi_nor_xfer_cfg *cfg,
> > > > +			  u8 *buf, size_t len);
> > > > +
> > > > +	int (*read_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
> > > > +	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
> > > > +			int write_enable);
> > > 
> > > Does the vybrid really support accelerated SPI NOR register IO or does it
> > 
> > The vybrid does not support the accelerated SPI NOR register IO.
> > these hooks are for Lee's driver.
> 
> Which one please?

It's not in Mainline yet, but the patches are on the list.

If you search for st_spi_fsm, you'll find them.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
