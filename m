Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WcLnR-0008CS-3U
 for linux-mtd@lists.infradead.org; Mon, 21 Apr 2014 21:30:37 +0000
From: Marek Vasut <marex@denx.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH] mtd: spi-nor: add DDR quad read support
Date: Mon, 21 Apr 2014 17:25:04 +0200
References: <1397641641-11430-1-git-send-email-b32955@freescale.com>
 <201404171624.36700.marex@denx.de>
 <CAMuHMdVY_n88uR7zOAZTo_V7Sg5zzaUFQjdaTSZeVj6Jbh0Txw@mail.gmail.com>
In-Reply-To: <CAMuHMdVY_n88uR7zOAZTo_V7Sg5zzaUFQjdaTSZeVj6Jbh0Txw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404211725.04505.marex@denx.de>
Cc: angus.clark@st.com, Huang Shijie <b32955@freescale.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, April 17, 2014 at 08:41:50 PM, Geert Uytterhoeven wrote:
> On Thu, Apr 17, 2014 at 4:24 PM, Marek Vasut <marex@denx.de> wrote:
> >> @@ -1016,8 +1038,15 @@ int spi_nor_scan(struct spi_nor *nor, const
> >> struct spi_device_id *id, if (info->flags & SPI_NOR_NO_FR)
> >> 
> >>               nor->flash_read = SPI_NOR_NORMAL;
> >> 
> >> -     /* Quad/Dual-read mode takes precedence over fast/normal */
> >> -     if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
> >> +     /* DDR Quad/Quad/Dual-read mode takes precedence over fast/normal
> >> */ +     if (mode == SPI_NOR_DDR_QUAD && info->flags &
> >> SPI_NOR_DDR_QUAD_READ) { +             ret = set_ddr_quad_mode(nor,
> >> info->jedec_id);
> >> +             if (ret) {
> >> +                     dev_err(dev, "DDR quad mode not supported\n");
> >> +                     return ret;
> > 
> > Is it really necessary to fail here? Can we not fall back to some "lower"
> > mode ?
> 
> IIRC, the original m25p80 also fails, FWIW...

OK, so let's keep consistent. But maybe we should add a note for future 
generations that this can be improved.

Best regards,
Marek Vasut
