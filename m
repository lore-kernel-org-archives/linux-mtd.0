Received: from mail-ew0-f177.google.com ([209.85.219.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4DKY-0002Bg-45
	for linux-mtd@lists.infradead.org; Wed, 13 May 2009 12:13:19 +0000
Received: by ewy25 with SMTP id 25so1175901ewy.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 May 2009 05:13:01 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
To: Tobias Simon <tobias.simon@sp-ss.de>
Subject: Re: mtd_dataflash bug
References: <4A0A1F38.6000500@sp-ss.de>
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 May 2009 14:12:58 +0200
In-Reply-To: <4A0A1F38.6000500@sp-ss.de> (Tobias Simon's message of "Wed\,
	13 May 2009 03\:15\:36 +0200")
Message-ID: <87iqk5ryk5.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Tobias" == Tobias Simon <tobias.simon@sp-ss.de> writes:

 Tobias> Hello List,
 Tobias> i have figured out a bug in mtd_datflash.c of kernel 2.6.29, which
 Tobias> causes my ARM bootloader to be killed with every "erase" operation on
 Tobias> arbitrary adresses. The fix is:

Ahh yes, I just sent a patch for the same thing a bit earlier.

This (or my patch) should go to 2.6.29-stable as well.


 Tobias> --- linux-2.6.29.2-a/drivers/mtd/devices/mtd_dataflash.c  2009-05-13
 Tobias> 03:11:16.000000000 +0200
 Tobias> +++ linux-2.6.29.2-b/drivers/mtd/devices/mtd_dataflash.c
 Tobias> 2009-05-13 03:13:30.000000000 +0200
 Tobias> @@ -184,7 +184,7 @@
 Tobias>                /* Calculate flash page address; use block erase (for
 Tobias> speed) if
 Tobias>                 * we're at a block boundary and need to erase the
 Tobias> whole block.
 Tobias>                 */
 Tobias> -               pageaddr = div_u64(instr->len, priv->page_size);
 Tobias> +               pageaddr = div_u64(instr->addr, priv->page_size);
 Tobias>                do_block = (pageaddr & 0x7) == 0 && instr->len >= blocksize;
 Tobias>                pageaddr = pageaddr << priv->page_offset;


-- 
Bye, Peter Korsgaard
