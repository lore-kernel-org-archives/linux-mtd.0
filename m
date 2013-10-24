Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZGnO-0002Ey-P8
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 09:01:35 +0000
Message-ID: <5268E1D3.2040304@ti.com>
Date: Thu, 24 Oct 2013 14:31:07 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/5] mtd: m25p80: remove obsolete FIXME
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
 <1382583503-13748-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1382583503-13748-2-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 24 October 2013 08:28 AM, Brian Norris wrote:
> The FIXME and NOTE have already been fixed (we have FAST_READ support).
>
> Signed-off-by: Brian Norris<computersforpeace@gmail.com>
Reviewed-by: Sourav Poddar <sourav.poddar@ti.com>
> ---
>   drivers/mtd/devices/m25p80.c | 9 ---------
>   1 file changed, 9 deletions(-)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 63a95ac..7c4cbad 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -367,10 +367,6 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
>   	spi_message_init(&m);
>   	memset(t, 0, (sizeof t));
>
> -	/* NOTE:
> -	 * OPCODE_FAST_READ (if available) is faster.
> -	 * Should add 1 byte DUMMY_BYTE.
> -	 */
>   	t[0].tx_buf = flash->command;
>   	t[0].len = m25p_cmdsz(flash) + (flash->fast_read ? 1 : 0);
>   	spi_message_add_tail(&t[0],&m);
> @@ -388,11 +384,6 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
>   		return 1;
>   	}
>
> -	/* FIXME switch to OPCODE_FAST_READ.  It's required for higher
> -	 * clocks; and at this writing, every chip this driver handles
> -	 * supports that opcode.
> -	 */
> -
>   	/* Set up the write data buffer. */
>   	opcode = flash->read_opcode;
>   	flash->command[0] = opcode;
