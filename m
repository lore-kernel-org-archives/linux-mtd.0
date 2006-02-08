Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F6ver-0000Mw-LP
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2006 15:11:23 -0500
Message-ID: <43EA5056.2070300@ru.mvista.com>
Date: Wed, 08 Feb 2006 23:11:02 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: "Alexey, Korolev" <alexey.korolev@intel.com>
References: <43D10544.10408@intel.com> <43EA16CC.6060401@intel.com>
In-Reply-To: <43EA16CC.6060401@intel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org, jwboyer@gmail.com
Subject: Re: [PATCH] Fixup in NAND bad block management + fix of misspring
 .(nand_base.c)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexey,

Alexey, Korolev wrote:

>
> ==================================
> --- a/drivers/mtd/nand/nand_base.c    2006-01-20 18:13:49.657859296 +0300
> +++ b/drivers/mtd/nand/nand_base.c    2006-01-20 18:38:50.281729792 +0300
> @@ -410,6 +410,7 @@
> static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
> {
>     int page, chipnr, res = 0;
> +    int badblockpos;

Bah, alignment/tabs problem...

>
> +    /* If pattern is given we must use offset from badblock_pattern
> structure
> +       else we should use badblockpos which is filled by default 
> values */
> +    if (this->badblock_pattern)
> +        badblockpos=this->badblock_pattern->offs;
> +    else
> +        badblockpos=this->badblockpos;
> +

I'm not sure this is right. If badblock_pattern is set, we shouldn't 
ever be here.

>         if (this->badblockpos & 0x1)
> -            bad >>= 8;
> +            bad >>= 1;

And here you do revert the bugfix committed long ago.

>     @@ -470,8 +478,11 @@
>     if (this->options & NAND_USE_FLASH_BBT)
>         return nand_update_bbt (mtd, ofs);
>
> -    /* We write two bytes, so we dont have to mess with 16 bit access */
> -    ofs += mtd->oobsize + (this->badblockpos & ~0x01);
> +    if (this->badblock_pattern)
> +        ofs += (this->badblock_pattern->offs & ~0x01);
> +    else
> +        ofs += (this->badblockpos & ~0x01);
> +

See above.

Vitaly
