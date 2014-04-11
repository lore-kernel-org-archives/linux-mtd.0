Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYVW0-0002W7-7p
 for linux-mtd@lists.infradead.org; Fri, 11 Apr 2014 07:04:44 +0000
Received: by mail-wg0-f41.google.com with SMTP id n12so5011364wgh.12
 for <linux-mtd@lists.infradead.org>; Fri, 11 Apr 2014 00:04:19 -0700 (PDT)
Date: Fri, 11 Apr 2014 08:04:14 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v5 5/8 fix] mtd: m25p80: use the SPI nor framework
Message-ID: <20140411070414.GA9801@lee--X1>
References: <1393238262-8622-6-git-send-email-b32955@freescale.com>
 <1393574142-17234-1-git-send-email-b32955@freescale.com>
 <20140409213749.GH32070@ld-irv-0074>
 <20140410072509.GA24100@localhost>
 <20140410192902.GM32070@ld-irv-0074>
 <20140411003203.GC3837@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140411003203.GC3837@localhost.localdomain>
Cc: angus.clark@st.com, shawn.guo@linaro.org,
 Russel King <linux@arm.linux.org.uk>, broonie@linaro.org,
 linux-doc@vger.kernel.org, linux-spi@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, sourav.poddar@ti.com,
 Brian Norris <computersforpeace@gmail.com>, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 11 Apr 2014, Huang Shijie wrote:

> On Thu, Apr 10, 2014 at 12:29:02PM -0700, Brian Norris wrote:
> > > IMHO, we should create a patch or several patches to add the MTD_SPI_NOR
> > > to the defconfigs.
> > 
> > Yeah, I think that's best.
> I will create a patch when i back to office.
> Or you can create it yourself.
> 
> > 
> > > > Also, I think m25p80.c is no longer a "self-contained MTD device driver"
> > > > and should be moved under drivers/mtd/spi-nor/.
> > > If we move the m25p80.c to the drivers/mtd/spi-nor/, we also need to move
> > > other drivers too.
> > 
> > Which ones? I think it only makes sense to move those that depend on the
> > same core code (i.e., spi-nor.c), or have a close relation to it (so
> > Lee's st_spi_fsm.c is a candidate).
> 
> yes, i mean the st_spi_fsm.c and other drivers which will use the
> spi-nor core code in the future.

+1 - happy with this.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
