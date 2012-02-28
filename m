Received: from gw1.transmode.se ([195.58.98.146])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S2UYF-00073w-Ua
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2012 21:25:40 +0000
In-Reply-To: <1330443135.75072.YahooMailClassic@web29019.mail.ird.yahoo.com>
References: <1330443135.75072.YahooMailClassic@web29019.mail.ird.yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: Paul Parsons <lost.distance@yahoo.com>
Message-ID: <OF718A97E1.ACAF6B20-ONC12579B2.00754C8D-C12579B2.0075B1B3@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 28 Feb 2012 22:25:32 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, philipp.zabel@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> If an Erase Suspend Command (0xb0) is issued while a Block Erase operation
> (0x20, 0xd0) is in progress, Status Register bit 6 (SR.6) will be set to 1.
> After an Erase Resume Command (0xd0) is issued, SR.6 will be set back to 0.
>
> Unfortunately when inval_cache_and_wait_for_operation() is called to wait for
> a Block Erase operation to finish, it never checks that SR.6 = 0 before
> returning. Consequently it can (and does) return while a Block Erase operation
> is still suspended, resulting in random breakage.
>
> This patch ensures that when inval_cache_and_wait_for_operation() is called to
> wait for a Block Erase operation to finish (chip->state == FL_ERASING), it does
> not return until both SR.7 = 1 (as before) and SR.6 = 0.

Interesting but I do wonder, should not the
  if (chip->state != chip_state)
test just before the status test prevent this in the first place?

>
> Signed-off-by: Paul Parsons <lost.distance@yahoo.com>
> ---
>
> I found this after switching my HP iPAQ hx4700 from using jffs2 to ubifs. It
> then consistently reported "block erase error: (bad VPP)" errors. Intriguingly,
> the bootloader never reporting erase or programming failures; it turned out that
> the bootloader never issued Erase Suspend Commands.
>
> Should SR.6 = 0 also be checked after an Erase Suspend Command (0xb0) is issued?
> This should preclude an unnecessary (and perhaps unpredictable) subsequent Erase
> Resume Command (0xd0).
>
> --- clean-3.3-rc5/drivers/mtd/chips/cfi_cmdset_0001.c   2012-02-25 20:18:16.000000000 +0000
> +++ linux-3.3-rc5/drivers/mtd/chips/cfi_cmdset_0001.c   2012-02-28 03:13:30.521537614 +0000
> @@ -1211,6 +1211,7 @@ static int inval_cache_and_wait_for_oper
>  {
>     struct cfi_private *cfi = map->fldrv_priv;
>     map_word status, status_OK = CMD(0x80);
> +   map_word status_76 = (chip->state == FL_ERASING) ? CMD(0xc0) : CMD(0x80);

hmm, I wonder if you can get by without the chip->state test? Just always set it to 0xc0?

 Jocke
