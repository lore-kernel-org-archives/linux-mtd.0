Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1djh7Q-0001tt-Px
 for linux-mtd@lists.infradead.org; Mon, 21 Aug 2017 07:27:31 +0000
Received: by mail-wr0-x22c.google.com with SMTP id p8so26792176wrf.5
 for <linux-mtd@lists.infradead.org>; Mon, 21 Aug 2017 00:27:08 -0700 (PDT)
Date: Mon, 21 Aug 2017 08:27:03 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Andrea Adami <andrea.adami@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/9] mfd: tmio: Add partition parsers platform data
Message-ID: <20170821072703.nmzarvksj6l7omrg@dell>
References: <1502743720-28672-1-git-send-email-andrea.adami@gmail.com>
 <1502743720-28672-4-git-send-email-andrea.adami@gmail.com>
 <20170815065835.jcuweb377lqioddc@dell>
 <20170819092603.1c919b4b@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170819092603.1c919b4b@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 19 Aug 2017, Boris Brezillon wrote:

> Hi Lee,
> 
> Le Tue, 15 Aug 2017 07:58:35 +0100,
> Lee Jones <lee.jones@linaro.org> a écrit :
> 
> > On Mon, 14 Aug 2017, Andrea Adami wrote:
> > 
> > > With the introduction of sharpslpart partition parser we can now read the
> > > offsets from NAND: we specify the list of the parsers as platform data, with
> > > cmdlinepart and ofpart parsers first allowing to override the part. table
> > > written in NAND. This is done in the board files using this driver.
> > > 
> > > Thus, we need to extend tmio_nand_data to consider the partition parsers.
> > > 
> > > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > > ---
> > >  include/linux/mfd/tmio.h | 1 +
> > >  1 file changed, 1 insertion(+)  
> > 
> > Acked-by: Lee Jones <lee.jones@linaro.org>
> > 
> 
> I'm about to apply patches 1 to 5 of this series to the nand/next
> branch. Do you want me to create an immutable branch with this patch?

No, not for a single line change.  Git should figure that out.

Thanks for asking though.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
