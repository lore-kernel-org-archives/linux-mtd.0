Received: from mail-qc0-x22c.google.com ([2607:f8b0:400d:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMln3-0000q1-QK
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 21:29:34 +0000
Received: by mail-qc0-f172.google.com with SMTP id l13so5948579qcy.31
 for <linux-mtd@lists.infradead.org>; Thu, 19 Sep 2013 14:29:12 -0700 (PDT)
Date: Thu, 19 Sep 2013 14:29:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: Fix 4 byte addressing mode for Micron
 devices.
Message-ID: <20130919212908.GS4550@ld-irv-0074.broadcom.com>
References: <20130917014706.GL4550@ld-irv-0074.broadcom.com>
 <1379440103-5167-1-git-send-email-eliedebrauwer@gmail.com>
 <20130919052526.GB31275@brian-ubuntu>
 <CAGWqfijXn6DWXiZBc7Kwsz=XK2WYdFY97EL9v7s6Ghxf85Tqgw@mail.gmail.com>
 <20130919212557.GR4550@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130919212557.GR4550@ld-irv-0074.broadcom.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 19, 2013 at 02:25:57PM -0700, Brian Norris wrote:
> Re-include linux-mtd

Whoops, forgot to actually include linux-mtd!

> On Thu, Sep 19, 2013 at 09:03:54AM +0200, Elie De Brauwer wrote:
> > On Thu, Sep 19, 2013 at 7:25 AM, Brian Norris
> > <computersforpeace@gmail.com> wrote:
> > > On Tue, Sep 17, 2013 at 07:48:22PM +0200, Elie De Brauwer wrote:
> > >> According to the datasheet for Micron n25q256a (N25Q256A13ESF40F) 4-byte
> > >> addressing mode should be entered as follows:
> > >>
> > >> <quote>
> > >> To enter or exit the 4-byte address mode, the WRITE ENABLE command
> > >> must be executed to set the write enable latch bit to 1. (Note: The
> > >> WRITE ENABLE command must NOT be executed on the N25Q256A83ESF40x and
> > >> N25Q256A83E1240x devices.) S# must be driven LOW. The effect of the
> > >> command is immediate; after the command has been executed, the write
> > >> enable latch bit is cleared to 0.
> > >> </quote>
> > >>
> > >> Micron's portable way to perform this for all types of Micron flash
> > >> is to first issue a write enable, then switch the addressing mode
> > >> followed by a write disable to avoid leaving the flash in a write-
> > >> able state.
> 
> BTW, I just tested this myself on my N25Q256A83ESF40F, and the extra
> write-enable/write-disable doesn't seem to cause problems.
> 
> > > I just noticed, you're missing a
> > >
> > >   "Signed-off-by: Your Name <your@email.com>"
> > 
> > Oops, my -s went missing in action:
> 
> As did your Cc: linux-mtd@infradead.org ;)
> 
> > Signed-off-by: Elie De Brauwer <eliedebrauwer@email.com>
> > 
> > >
> > > If you reply with a line like that, I can past it into the commit.
> > >
> > >> ---
> > >>  drivers/mtd/devices/m25p80.c |   10 +++++++++-
> > >>  1 file changed, 9 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> > >> index 26b14f9..272d483 100644
> > >> --- a/drivers/mtd/devices/m25p80.c
> > >> +++ b/drivers/mtd/devices/m25p80.c
> > >> @@ -169,8 +169,16 @@ static inline int write_disable(struct m25p *flash)
> > >>  static inline int set_4byte(struct m25p *flash, u32 jedec_id, int enable)
> > >>  {
> > >>       switch (JEDEC_MFR(jedec_id)) {
> > >> -     case CFI_MFR_MACRONIX:
> > >>       case CFI_MFR_ST: /* Micron, actually */
> > >> +     {
> > >> +             int status;
> > >> +             write_enable(flash);
> > >> +             flash->command[0] = enable ? OPCODE_EN4B : OPCODE_EX4B;
> > >> +             status = spi_write(flash->spi, flash->command, 1);
> > >> +             write_disable(flash);
> > >> +             return status;
> > >> +     }
> > >> +     case CFI_MFR_MACRONIX:
> > >>       case 0xEF /* winbond */:
> > >>               flash->command[0] = enable ? OPCODE_EN4B : OPCODE_EX4B;
> > >>               return spi_write(flash->spi, flash->command, 1);
> > >
> > > I personally don't like the code duplication from the Macronix and
> > > Winbond cases, and the extra context braces may not be needed. How about
> > > the following? If it's OK, I'll just squash your description and my
> > > patch.
> > 
> > Fine with me, squash em !.
> 
> Squashed and pushed to l2-mtd.git. Thanks!
> 
> Brian
