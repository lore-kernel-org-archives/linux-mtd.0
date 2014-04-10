Date: Thu, 10 Apr 2014 15:25:11 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v5 5/8 fix] mtd: m25p80: use the SPI nor framework
Message-ID: <20140410072509.GA24100@localhost>
References: <1393238262-8622-6-git-send-email-b32955@freescale.com>
 <1393574142-17234-1-git-send-email-b32955@freescale.com>
 <20140409213749.GH32070@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20140409213749.GH32070@ld-irv-0074>
Cc: angus.clark@st.com, Russel King <linux@arm.linux.org.uk>,
 broonie@linaro.org, dwmw2@infradead.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, sourav.poddar@ti.com,
 shawn.guo@linaro.org, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 09, 2014 at 02:37:49PM -0700, Brian Norris wrote:
> >  config MTD_M25P80
> >  	tristate "Support most SPI Flash chips (AT26DF, M25P, W25X, ...)"
> > -	depends on SPI_MASTER
> > +	depends on SPI_MASTER && MTD_SPI_NOR_BASE
> >  	help
> >  	  This enables access to most modern SPI flash chips, used for
> >  	  program and data storage.   Series supported include Atmel AT26DF,
> 
> Now that M25P80 depends on MTD_SPI_NOR_BASE (which I proposed to rename
> to MTD_SPI_NOR a few hours ago), shouldn't we be updating everybody's
> defconfigs? As it stands, the defconfigs that use M25P80 will just drop
> it silently when built.
> 
> And if so, I'm not sure how this should be handled. Should defconfig
> patches be sent to their respective arch maintainers?

IMHO, we should create a patch or several patches to add the MTD_SPI_NOR
to the defconfigs.

Another method is to select the MTD_SPI_NOR which we enable the MTD.

> 
> Also, I think m25p80.c is no longer a "self-contained MTD device driver"
> and should be moved under drivers/mtd/spi-nor/.
If we move the m25p80.c to the drivers/mtd/spi-nor/, we also need to move
other drivers too.

thanks
Huang Shijie
