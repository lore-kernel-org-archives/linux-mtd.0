Received: from mail-ie0-x236.google.com ([2607:f8b0:4001:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VH1gG-0008Cj-MV
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 01:14:49 +0000
Received: by mail-ie0-f182.google.com with SMTP id aq17so12128836iec.13
 for <linux-mtd@lists.infradead.org>; Tue, 03 Sep 2013 18:14:27 -0700 (PDT)
Date: Tue, 3 Sep 2013 18:14:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: 4byte addressing mode on Micron n25q256a vs write enable
Message-ID: <20130904011419.GA12654@ld-irv-0074.broadcom.com>
References: <CAGWqfijpGuwqEh5oW8F=DFoQ=hG72ErMZge2cDsSjJZ=iD--kA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGWqfijpGuwqEh5oW8F=DFoQ=hG72ErMZge2cDsSjJZ=iD--kA@mail.gmail.com>
Cc: marex@denx.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Elie,

On Thu, Aug 29, 2013 at 11:15:26AM +0200, Elie De Brauwer wrote:
> Hello,
> 
> I pulled a the " m25p80: Micron SPI uses Macronix-style 4-byte
> addressing" from Linux-next (see (1) and (2) ) and applied it on my
> 3.9 tree in order to get a Micron n25q256a (N25Q256A13ESF40F to be
> complete) functional on custom board with an i.mx28.  The patch came
> close to get this combination functional but it lacked something. If
> we look at the n25q256a datasheet (3) page 68 contains in paragraph
> "ENTER or EXIT 4-BYTE ADDRESS MODE Command" the following:
> 
> <quote>
> To enter or exit the 4-byte address mode, the WRITE ENABLE command
> must be executed to set the write enable latch bit to 1. (Note: The
> WRITE ENABLE command must NOT be executed on the N25Q256A83ESF40x and
> N25Q256A83E1240x devices.) S# must be driven LOW. The effect of the
> command is immediate; after the command has been executed, the write
> enable latch bit is cleared to 0.
> </quote>
> 
> So with just your patch (1), (2) applied:
> 
>   switch (JEDEC_MFR(jedec_id)) {
>   case CFI_MFR_MACRONIX:
> + case CFI_MFR_ST: /* Micron, actually */
>   case 0xEF /* winbond */:
> 
> The result is that the SPI flash does not enter 4byte mode. If I
> however rework this patch as:
> 
>   switch (JEDEC_MFR(jedec_id)) {
> + case CFI_MFR_ST: /* Micron, actually */
> + write_enable(flash);
>   case CFI_MFR_MACRONIX:
>   case 0xEF /* winbond */:
> 
> It just-seems-to-work, but I have no idea how general this patch is
> for other Micron devices which support the 4byte mode.

Hmm, that's interesting. I overlooked the note about WRITE ENABLE, and
it so happens I am working on the N25Q256A83ESF40x, so I am happily
oblivious.

Heeding the note in the quote there, though, I would hesitate to apply
WRITE ENABLE to all Micron 4-byte addressed flash. I am contacting
Micron about this unusual inconsistency, since it's not very easy to
programmatically discover which Micron flash need WRITE ENABLE and which
don't.

I'll try to get around to testing your patch on my N25Q256A83ESF40x
sometime, just to see what happens when I disobey the datasheet.

> my 2 cents.
> E.
> 
> References:
> (1) https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/mtd/devices/m25p80.c?id=7b9497fcaaceb84acbb62e80e04eba2e36ee5ed4
> (2) http://patchwork.ozlabs.org/patch/266130/
> (3) http://www.micron.com/~/media/Documents/Products/Data%20Sheet/NOR%20Flash/Serial%20NOR/N25Q/n25q_256mb_3v_65nm.pdf

Thanks for the detailed report.

Brian
