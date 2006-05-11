Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FeDTH-0005kQ-O9
	for linux-mtd@lists.infradead.org; Thu, 11 May 2006 11:53:09 -0400
Message-ID: <44635DD6.10805@arcom.com>
Date: Thu, 11 May 2006 16:52:54 +0100
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: Leon Woestenberg <leon.woestenberg@gmail.com>
References: <c384c5ea0605110820m606a04e7nc87cbc9302fd619c@mail.gmail.com>
In-Reply-To: <c384c5ea0605110820m606a04e7nc87cbc9302fd619c@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Do not oops when configured flash size is less then chip
 size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Leon Woestenberg wrote:
> 
> [MTD] CHIPS: Do not oops when configured flash size is less then chip size
> 
> My kernel oopsed when the on-board flash chips where quadruple the size of the
> platform default physmap_map.size. Turned out that max_chips becomes zero,
> resulting in an oops later in locking chip->mutex being non-initialized.


> --- a/drivers/mtd/chips/gen_probe.c
> +++ b/drivers/mtd/chips/gen_probe.c
> @@ -100,6 +100,11 @@ #endif
>  	 * Align bitmap storage size to full byte.
>  	 */
>  	max_chips = map->size >> cfi.chipshift;
> +	if (max_chips == 0) {
> +		printk(KERN_WARNING "Single flash chip size exceeds the configured flash area size. Check your kernel configuration.\n");

This sounds like a valid, if unlikely, board configuration.  e.g., a
board with chips fitted that are larger than the chip-select memory window.

It might be better to pretend such configuration is a single chip that's
smaller than it physically is.

Maybe something as simple as:

    /* there's at least one chip present */
    max_chips = max(map->size >> cfi.chipshift, 1);

?

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
