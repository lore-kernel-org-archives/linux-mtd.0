Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2zO5-0004GH-Tf
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2014 08:30:19 +0000
Date: Tue, 14 Jan 2014 09:29:48 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4] mtd/nand: don't use {read,write}_buf for 8-bit
 transfers
Message-ID: <20140114082948.GQ29475@pengutronix.de>
References: <20131127073512.GB13929@norris.computersforpeace.net>
 <1386278524-25669-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20140114081216.GM1992@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140114081216.GM1992@norris-Latitude-E6410>
Cc: kernel@pengutronix.de, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Tue, Jan 14, 2014 at 12:12:16AM -0800, Brian Norris wrote:
> On Thu, Dec 05, 2013 at 10:22:04PM +0100, Uwe Kleine-König wrote:
> > According to the Open NAND Flash Interface Specification (ONFI) Revision
> > 3.1 "Parameters are always transferred on the lower 8-bits of the data
> > bus." for the Get Features and Set Features commands.
> > 
> > So using read_buf and write_buf is wrong for 16-bit wide nand chips as
> > they use I/O[15:0]. The Get Features command is easily fixed using 4
> > times the read_byte callback. For Set Features implement a new
> > overwritable callback "write_byte". Still I expect the default to work
> > just fine for all controllers and making it overwriteable was just done
> > for symmetry.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> I think this patch is good now, so pushed to l2-mtd.git (with a fix
> [1]). Thanks Uwe!
> 
> I know there was some more discussion and other patch ideas being thrown
> around (by me and others). Feel free to send patches/comments (or
> Ack's/Tested-by's) if you think they need applied on top.
> 
> Brian
> 
> [1] I got a type safety warning as I pushed this out, so I squashed in
>     this diff:
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 7acbce3b3675..d388c7f6fec9 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -245,7 +245,7 @@ static void nand_write_byte16(struct mtd_info *mtd, uint8_t byte)
>  	 * neither an address nor a command transfer. Let's assume a 0 on the
>  	 * upper I/O lines is OK.
>  	 */
> -	chip->write_buf(mtd, &word, 2);
> +	chip->write_buf(mtd, (uint8_t *)&word, 2);
That's exactly what I suggested before reading your mail. Very
appreciated.

Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
