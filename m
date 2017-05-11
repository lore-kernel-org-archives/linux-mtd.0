Received: from vps0.lunn.ch ([178.209.37.122])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8rvO-0005G9-Su
 for linux-mtd@lists.infradead.org; Thu, 11 May 2017 17:30:52 +0000
Date: Thu, 11 May 2017 19:30:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Brian Norris <computersforpeace@gmail.com>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 zajec5@gmail.com, linux-mtd@lists.infradead.org
Subject: Re: [patchv4] mtd: mchp23k256: Add driver for this SPI SRAM device
Message-ID: <20170511173022.GD565@lunn.ch>
References: <1492011271-15099-1-git-send-email-andrew@lunn.ch>
 <20170511171551.GF70297@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170511171551.GF70297@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
> > new file mode 100644
> > index 000000000000..ed3d1724e5de
> > --- /dev/null
> > +++ b/drivers/mtd/devices/mchp23k256.c
> > @@ -0,0 +1,182 @@
> > +/*
> > + * mchp23k256.c
> > + *
> > + * Driver for Microchip 23k256 SPI RAM chips
> > + *
> > + * Copyright © 20016 Andrew Lunn <andrew@lunn.ch>
> 
> Whoa, you have a time machine, and you used it to write this driver??
> I'm in awe!
> 
> I've deleted a zero from this :)

Great, thanks.

> > +static int mchp23k256_read(struct mtd_info *mtd, loff_t from, size_t len,
> > +			   size_t *retlen, unsigned char *buf)
> > +{
> > +	struct mchp23k256_flash *flash = to_mchp23k256_flash(mtd);
> > +	struct spi_transfer transfer[2] = {};
> > +	struct spi_message message;
> > +	unsigned char command[3];
> > +
> > +	spi_message_init(&message);
> > +
> > +	memset(&transfer, 0, sizeof(transfer));
> 
> Isn't this memset redundant, since you're initialized the struct above?
> 
> (I haven't touched this when applying.)

I think was getting compiler warnings somewhere. Used but not set. I
could of been too liberal spreading around the memset's.

      Thanks
	Andrew
