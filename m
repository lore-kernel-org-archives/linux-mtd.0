Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VaTFC-0001t2-33
 for linux-mtd@lists.infradead.org; Sun, 27 Oct 2013 16:31:15 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/5] mtd: m25p80: remove obsolete FIXME
Date: Sun, 27 Oct 2013 17:30:52 +0100
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
 <1382583503-13748-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1382583503-13748-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201310271730.52634.marex@denx.de>
Cc: sourav.poddar@ti.com, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

> The FIXME and NOTE have already been fixed (we have FAST_READ support).
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 63a95ac..7c4cbad 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -367,10 +367,6 @@ static int m25p80_read(struct mtd_info *mtd, loff_t
> from, size_t len, spi_message_init(&m);
>  	memset(t, 0, (sizeof t));
> 
> -	/* NOTE:
> -	 * OPCODE_FAST_READ (if available) is faster.
> -	 * Should add 1 byte DUMMY_BYTE.
> -	 */
>  	t[0].tx_buf = flash->command;
>  	t[0].len = m25p_cmdsz(flash) + (flash->fast_read ? 1 : 0);
>  	spi_message_add_tail(&t[0], &m);
> @@ -388,11 +384,6 @@ static int m25p80_read(struct mtd_info *mtd, loff_t
> from, size_t len, return 1;
>  	}
> 
> -	/* FIXME switch to OPCODE_FAST_READ.  It's required for higher
> -	 * clocks; and at this writing, every chip this driver handles
> -	 * supports that opcode.
> -	 */
> -
>  	/* Set up the write data buffer. */
>  	opcode = flash->read_opcode;
>  	flash->command[0] = opcode;

Makes great share of sense ;-)

Acked-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
