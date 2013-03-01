Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBLg6-0008Na-75
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2013 08:50:55 +0000
Date: Fri, 1 Mar 2013 09:50:48 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd/nand: don't use {read,write}_buf for 8-bit transfers
Message-ID: <20130301085048.GJ22886@pengutronix.de>
References: <1361977852-18233-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <512EC54F.3090400@freescale.com>
 <20130228104819.GH22886@pengutronix.de>
 <513021C3.2000503@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <513021C3.2000503@freescale.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Huang Shijie (is this the right name to use in a greeting?),

On Fri, Mar 01, 2013 at 11:34:27AM +0800, Huang Shijie wrote:
> 于 2013年02月28日 18:48, Uwe Kleine-König 写道:
> >On Thu, Feb 28, 2013 at 10:47:43AM +0800, Huang Shijie wrote:
> >>于 2013年02月27日 23:10, Uwe Kleine-König 写道:
> >>>According to the Open NAND Flash Interface Specification (ONFI) Revision
> >>>3.1 "Parameters are always transferred on the lower 8-bits of the data
> >>>bus." for the Get Features and Set Features commands.
> >>>
> >>yes. the set/get features should works in 8-bit.
> >>
> >>I have never met a 16-bit onfi nand yet. :)
> >>
> >>>So using read_buf and write_buf is wrong for 16-bit wide nand chips as
> >>>they use I/O[15:0]. The Get Features command is easily fixed using 4
> >>>times the read_byte callback. For Set Features error out as there is no
> >>yes. for get features, it's easy to fix it.
> >>>write_byte callback.
> >>Most of the time, the nand controller will overwrite the write_buf hook...
> >>I also think we need a write_byte callback.
> >a default implementation could be something like that:
> >
> >	static void nand_write_byte(struct mtd_info *mtd, uint8_t byte)
> >	{
> >		struct nand_chip *chip = mtd->priv;
> >
> >		if (chip->options&  NAND_BUSWIDTH_16)
> >			chip->write_buf(mtd, (uint8_t[]){ byte, 0 }, 2);
> >		else
> >			chip->write_buf(mtd,&byte, 1);
> >	}
> >
> >(Is this the correct order in the array? Or might that depend on
> >endianess?)
> >
> >Does this look right?
> >
> IMHO, the nand_write_byte() should not call the chip->write_buf()
> again. Since the ->write_buf() could
> be the nand_write_buf16(). it makes a little mess.
I think it does the right thing though. With a 16-bit chip doing

	chip->write_buf(mtd, (uint8_t[]){ byte, 0 }, 2)

puts $byte to I/O[7:0] and 0 to I/O[15:8]. This is what I want it to
do---not sure if I/O[15:8] should better be tri-stated?

> In my opinion, the default nand_write_byte() hook could use the
> nand_write_buf() to  write just one byte;
This feels much more wrong. nand_write_buf() uses chip->IO_ADDR_W which
might not be initialized by the driver.

> and the nand controller can overwrite the nand_write_byte() hook if
> it could.
> Of course, it's just a suggest.
I will create a patch ...

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
