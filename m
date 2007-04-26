Subject: Re: NAND bad block checking when no memory based BBT is available
From: David Woodhouse <dwmw2@infradead.org>
To: "Knobloch, Thomas" <knobloch@siemens.com>
In-Reply-To: <2EDADF4ED023F04BAD4D7A4131ECEB930105514A@mchp7rfa.ww002.siemens.net>
References: <2EDADF4ED023F04BAD4D7A4131ECEB930105514A@mchp7rfa.ww002.siemens.net>
Content-Type: text/plain
Date: Thu, 26 Apr 2007 17:40:43 +0100
Message-Id: <1177605643.2755.420.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-04-26 at 17:38 +0200, Knobloch, Thomas wrote:
>         if (getchip) {
>                 page = (int)(ofs >> chip->page_shift);
>                 chipnr = (int)(ofs >> chip->chip_shift);
> 
>                 nand_get_device(chip, mtd, FL_READING);
> 
>                 /* Select the NAND device */
>                 chip->select_chip(mtd, chipnr);
>         } else
>                 page = (int)ofs; 

I think we'll accept a patch which makes that last line also shift right
by chip->page_shift.

-- 
dwmw2
