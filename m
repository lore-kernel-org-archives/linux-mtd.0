Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlPnp-0006xT-H6
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 21:04:15 +0000
Date: Tue, 26 Nov 2013 22:03:41 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2] mtd/nand: don't use {read,write}_buf for 8-bit
 transfers
Message-ID: <20131126210341.GO28642@pengutronix.de>
References: <1362414924-27506-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1362415655-13073-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1363167184.9457.22.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1363167184.9457.22.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 13, 2013 at 11:33:04AM +0200, Artem Bityutskiy wrote:
> On Mon, 2013-03-04 at 17:47 +0100, Uwe Kleine-König wrote:
> > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> > index 7ccb3c5..8ee4ed1 100644
> > --- a/include/linux/mtd/nand.h
> > +++ b/include/linux/mtd/nand.h
> > @@ -419,6 +419,8 @@ struct nand_buffers {
> >   *                     flash device.
> >   * @read_byte:         [REPLACEABLE] read one byte from the chip
> >   * @read_word:         [REPLACEABLE] read one word from the chip
> > + * @write_byte         [REPLACEABLE] write a single byte to the chip on the
> > + *                     low 8 I/O lines
> >   * @write_buf:         [REPLACEABLE] write data from the buffer to the chip
> >   * @read_buf:          [REPLACEABLE] read data from the chip into the buffer
> >   * @select_chip:       [REPLACEABLE] select chip nr
> > @@ -503,6 +505,7 @@ struct nand_chip {
> >  
> >         uint8_t (*read_byte)(struct mtd_info *mtd);
> >         u16 (*read_word)(struct mtd_info *mtd);
> > +       void (*write_byte)(struct mtd_info *mtd, uint8_t byte);
> >         void (*write_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
> >         void (*read_buf)(struct mtd_info *mtd, uint8_t *buf, int len);
> >         void (*select_chip)(struct mtd_info *mtd, int chip);
> 
> I would like to make the interface symmetric for read and write. I do
> not have any 16 bit flashes, so need to somehow encouredge someone who
> has one to do this. Namely, I'd like to kill 'read_word()', if possible.
> What's your take on this?
I don't have a 16 bit flash, so I have the same excuse as you do :-)

Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
