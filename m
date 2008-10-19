Received: from smtp124.sbc.mail.sp1.yahoo.com ([69.147.64.97])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Krh3s-0005Qn-AF
	for linux-mtd@lists.infradead.org; Sun, 19 Oct 2008 22:47:48 +0000
From: David Brownell <david-b@pacbell.net>
To: linux-mtd@lists.infradead.org, Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH 1/3] mtd m25p80: add support for Macronix MX25L12805D
Date: Sun, 19 Oct 2008 15:47:45 -0700
References: <200810191516.30804.david-b@pacbell.net>
In-Reply-To: <200810191516.30804.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200810191547.45449.david-b@pacbell.net>
Cc: lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry for the "1/3" -- there's only this one patch.
The other two would have been resends of patches that
never got acked, but do seem to be in the MTD git tree.

However I noticed that this patch will have a problem
applying against that MTD git ... the m25p80 driver
got taught how to use two of the "extended" JEDEC ID
bytes provided by some vendors, so the initializers here
are all missing an extra "u16" value following the JEDEC
code.  Swap in a 0 for the Macronix part and all should
be OK ...

- Dave

On Sunday 19 October 2008, David Brownell wrote:
> From: Lennert Buytenhek <buytenh@wantstofly.org>
> 
> Support one more flavor of SPI flash:  Macronix MX25L12805D
> (128 Mbit, 16 MByte).
> 
> Signed-off-by: Lennert Buytenhek <buytenh@marvell.com>
> Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
> 
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -467,6 +467,9 @@ static struct flash_info __devinitdata m25p_data [] = {
>  	{ "at26df161a", 0x1f4601, 64 * 1024, 32, SECT_4K, },
>  	{ "at26df321",  0x1f4701, 64 * 1024, 64, SECT_4K, },
>  
> +	/* Macronix */
> +	{ "mx25l12805d", 0xc22018, 64 * 1024, 256, SECT_4K, },
> +
>  	/* Spansion -- single (large) sector size only, at least
>  	 * for the chips listed here (without boot sectors).
>  	 */
> 
> 
> 
