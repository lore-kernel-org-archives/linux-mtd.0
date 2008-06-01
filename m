Received: from smtp124.sbc.mail.sp1.yahoo.com ([69.147.64.97])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K2uI5-00023x-Qv
	for linux-mtd@lists.infradead.org; Sun, 01 Jun 2008 20:36:34 +0000
From: David Brownell <david-b@pacbell.net>
To: Bryan Wu <cooloney@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>
Subject: Re: [PATCH 1/1] MTD DataFlash: fix bug - ATMEL AT45DF321D spi flash
	card fails to be copied to
Date: Sun, 1 Jun 2008 13:28:58 -0700
References: <1212230324-22201-1-git-send-email-cooloney@kernel.org>
In-Reply-To: <1212230324-22201-1-git-send-email-cooloney@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200806011328.58594.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, linux@maxim.org.za,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 31 May 2008, Bryan Wu wrote:
> From: Michael Hennerich <michael.hennerich@analog.com>
> 
>  - Add support for binary page size DataFlashes.
>  - The driver now prints out pagesize and erasesize.
>    Printout valuable information for creating flash filesystems.

I like the idea, but I'm afraid this approach isn't sufficient.

Thing is, the LSB of the status register is explicitly
undefined for earlier chip revisions (e.g. see datasheets
for AT45DB321B and AT45DB321C vs AT45DB321D), so you should
use a different chip discovery algorithm.  Perhaps:

 * Try the original scheme (read status register);

 * If it indicates a chip that has new versions with
   binary page size options, use the 0x9F command to
   read the JEDEC id (and chip revision);

 * If it's a sufficently new revision, *then* you can
   interpret that LSB as indicating the page size

Example, on the AT45DB321x chips, that JEDEC instruction was
added for the 'C' revision (according to my copies of the
datasheets) and wasn't there for the 'B' revision ... while
it was the 'D' revision which introduced the binary page size.

Maybe the JEDEC code from the m25p80 driver can be reused.

Also, I'd like to see a pre-existing typo fixed (in case anyone
uses a flash that small) ... see below.

- Dave


> @@ -546,29 +551,44 @@ static int __devinit dataflash_probe(struct spi_device *spi)
>  	 * board setup should have set spi->max_speed_max to
>  	 * match f(car) for continuous reads, mode 0 or 3.
>  	 */
> -	switch (status & 0x3c) {
> +	switch (status & 0x3d) {
>  	case 0x0c:	/* 0 0 1 1 x x */
> +	case 0x0d:
>  		status = add_dataflash(spi, "AT45DB011B", 512, 264, 9);
>  		break;
>  	case 0x14:	/* 0 1 0 1 x x */
> +	case 0x15:
>  		status = add_dataflash(spi, "AT45DB021B", 1025, 264, 9);

1024 pages (of 264 bytes), not 1025.  :)


>  		break;
>  	case 0x1c:	/* 0 1 1 1 x x */
> +	case 0x1d:
>		...
