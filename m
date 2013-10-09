Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTiE2-0003Fh-Pv
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 01:06:07 +0000
Received: by mail-ob0-f177.google.com with SMTP id wm4so132144obc.22
 for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2013 18:05:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201310071824.01028.marex@denx.de>
References: <201310071824.01028.marex@denx.de>
Date: Tue, 8 Oct 2013 18:05:40 -0700
Message-ID: <CAN8TOE_C+uU+JXn2OJ_5y6DbvxQXTQK7emEqoxXkCHkCzSQ13g@mail.gmail.com>
Subject: Re: N25Q256A 13E40
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 7, 2013 at 9:24 AM, Marek Vasut <marex@denx.de> wrote:
> Let's talk about our favourite chip :) I just got my hands on N25Q256A . Since
> there was quite a flurry of patches for this and similar chips and I got it
> working on a different chip with exactly the same IDs and type, I'd would expect
> linux to work with this one too. Guess what ... ;-)
>
> This particular incarnation of N25Q256A completely ignores the 4-byte ERASE
> (0xdc) command. Apparently, if I look closely, it's N25Q256A 13E40 variant and
> seeing the Note #14 (datasheet page 30 / below Table 18. Command set), quoting:
>
> 14.This command is only for part numbers N25Q256A83ESF40x and N25Q256A83E1240x.

This note also applies to PAGE_PROGRAM_4B (0x12) as well, right?

> they are not supported on this part. Someone surely did some hard thinking
> inventing such a crappy part.

Yeah, we were already seeing this kind of inconsistency. I recall
Micron saying that they tried to make the N25Q256A83xx... parts
compatible with Macronix. Why they didn't just do that for the whole
product line is anybody's guess...

> I can surely cook a patch, but I wonder what
> direction we should take here. We can switch this chip into 4-byte mode by
> 0xb7/0xe9 opcodes, which would in turn break BootROMs which depend on the SPI
> NOR to be in 3-byte mode upon reboot. We can program the BAR register before
> erase, which will do the same.
>
> Sigh, if you have any idea, that'd be nice to hear.

Is there any way to differentiate the N25Q256Axx... flavors by ID or
similar? (I believe I know the answer to this already, and it's not
the answer I want.)

I don't think we want to start using the BAR. I think the 0xb7/0xe9
opcodes are best (if we really have to...), since we already support
them, and we never really *guarantee* that m25p80.c will leave the
flash in 3-byte mode. It was just an added bonus that we are able to
be mode-less on some flash.

[Now that I went back to look at some more code:] Wait, but we don't
even try to use the 4-byte dedicated commands like 0xdc on Micron
flash, so why are you having this problem? The code currently stands
as:

  if (JEDEC_MFR(info->jedec_id) == CFI_MFR_AMD) {
          /* Dedicated 4-byte command set */
          ...

They are only used on Spansion. IIRC, I wrote it this way specifically
because Micron is so inconsistent, at least on their current
generation (they're fixing that for the future, I think, but that
doesn't help us of course). And I haven't had a chance to look at
others too closely to judge them on this.

Brian
