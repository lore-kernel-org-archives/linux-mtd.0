Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PDK6t-0003Tl-KE
	for linux-mtd@lists.infradead.org; Tue, 02 Nov 2010 16:53:25 +0000
Date: Tue, 2 Nov 2010 18:53:16 +0200
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: ext Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 3/3] mtd: onenand: implement cache program feature for
	4kb page onenand
Message-ID: <20101102165316.GA15304@nokia.com>
References: <1288697130-12772-1-git-send-email-roman.tereshonkov@nokia.com>
	<1288697130-12772-4-git-send-email-roman.tereshonkov@nokia.com>
	<AANLkTinq7HS5VHww8aq2XPKCwGnjEYSintsN4qRFJq1o@mail.gmail.com>
	<20101102143759.GA15222@nokia.com>
	<AANLkTikunPYxpG_8HONV6BnOo54GNk3wvmMasEq1G9tO@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AANLkTikunPYxpG_8HONV6BnOo54GNk3wvmMasEq1G9tO@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 02, 2010 at 03:50:51PM +0100, ext Kyungmin Park wrote:
> On Tue, Nov 2, 2010 at 11:37 PM, Roman Tereshonkov
> <roman.tereshonkov@nokia.com> wrote:
> > On Tue, Nov 02, 2010 at 03:00:41PM +0100, ext Kyungmin Park wrote:
> >> Hi,
> >>
> >> On Tue, Nov 2, 2010 at 8:25 PM, Roman Tereshonkov
> >> <roman.tereshonkov@nokia.com> wrote:
> >> > Implement cache program feature for 4KB page onenand.
> >> > This feature improves the write data performance.
> >> > The observed 128KB data program speed change is
> >> > from 8827KB/s to 14156 KB/s when the feature is enabled.
> >> >
> >> > Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
> >> > ---
> >> >  drivers/mtd/onenand/omap2.c        |   12 ++++++++--
> >> >  drivers/mtd/onenand/onenand_base.c |   39 ++++++++++++++++++++++++++++++++++-
> >> >  2 files changed, 46 insertions(+), 5 deletions(-)
> >>
> >> Please make separate the two patches, one for OMAP, another is for
> >> onenand_base.c
> >>
> >> >
> >> > diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
> >> > index 9f322f1..da25a90 100644
> >> > --- a/drivers/mtd/onenand/omap2.c
> >> > +++ b/drivers/mtd/onenand/omap2.c
> >> > @@ -108,8 +108,9 @@ static void wait_warn(char *msg, int state, unsigned int ctrl,
> >> >  static int omap2_onenand_wait(struct mtd_info *mtd, int state)
> >> >  {
> >> >        struct omap2_onenand *c = container_of(mtd, struct omap2_onenand, mtd);
> >> > +       struct onenand_chip *this = mtd->priv;
> >> >        unsigned int intr = 0;
> >> > -       unsigned int ctrl;
> >> > +       unsigned int ctrl, ctrl_mask;
> >> >        unsigned long timeout;
> >> >        u32 syscfg;
> >> >
> >> > @@ -180,7 +181,8 @@ retry:
> >> >                        if (result == 0) {
> >> >                                /* Timeout after 20ms */
> >> >                                ctrl = read_reg(c, ONENAND_REG_CTRL_STATUS);
> >> > -                               if (ctrl & ONENAND_CTRL_ONGO) {
> >> > +                               if (ctrl & ONENAND_CTRL_ONGO &&
> >> > +                                   !this->ongoing) {
> >> >                                        /*
> >> >                                         * The operation seems to be still going
> >> >                                         * so give it some more time.
> >> > @@ -269,7 +271,11 @@ retry:
> >> >                return -EIO;
> >> >        }
> >> >
> >> > -       if (ctrl & 0xFE9F)
> >> > +       ctrl_mask = 0xFE9F;
> >> > +       if (this->ongoing)
> >> > +               ctrl_mask &= ~0x8000;
> >> > +
> >> > +       if (ctrl & ctrl_mask)
> >> >                wait_warn("unexpected controller status", state, ctrl, intr);
> >> >
> >> >        return 0;
> >> > diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
> >> > index 6b3a875..b2c3e97 100644
> >> > --- a/drivers/mtd/onenand/onenand_base.c
> >> > +++ b/drivers/mtd/onenand/onenand_base.c
> >> > @@ -440,6 +440,19 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
> >> >                default:
> >> >                        if (ONENAND_IS_2PLANE(this) && cmd == ONENAND_CMD_PROG)
> >> >                                cmd = ONENAND_CMD_2X_PROG;
> >> > +
> >> > +                       /* Exclude 1st OTP and OTP blocks */
> >> Are there any reason? I think 1st OTP block is just block 0 so no need
> >> to consider block 0 case.
> >
> >
> > Specification tells:
> > 3.9.1 Cache Program Operation
> > "Note that Cache Program command cannot be performed on OTP block and 1st block OTP"
> 
> Okay I'm not yet check the Spec. I will check it at office.
> >
> >
> >> > +                       if (ONENAND_IS_CACHE_PROGRAM(this) &&
> >> > +                           likely(onenand_block(this, addr) != 0) &&
> >> > +                           ONENAND_IS_4KB_PAGE(this)) {
> >> and I think no need to check 4KB_PAGE.
> >
> >
> > This patch is for 4kb page onenand only. The 2kb page onenand uses different
> > commands for cache program. Also 2kb page case cache program depends on
> > CONFIG_MTD_ONENAND_2X_PROGRAM.
> >
> >
> >> > +
> >> > +                               if (cmd == ONENAND_CMD_CACHE_PROG)
> >> > +                                       cmd = ONENAND_CMD_2X_CACHE_PROG;
> >> > +                               else if (cmd == ONENAND_CMD_CACHE_PROG_LAST)
> >> > +                                       cmd = ONENAND_CMD_PROG;
> >> > +
> >> > +                       }
> >> > +
> >> >                        dataram = ONENAND_CURRENT_BUFFERRAM(this);
> >> >                        break;
> >> >                }
> >> > @@ -1845,7 +1858,7 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
> >> >        const u_char *buf = ops->datbuf;
> >> >        const u_char *oob = ops->oobbuf;
> >> >        u_char *oobbuf;
> >> > -       int ret = 0;
> >> > +       int ret = 0, cmd;
> >> >
> >> >        DEBUG(MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, len = %i\n",
> >> >                __func__, (unsigned int) to, (int) len);
> >> > @@ -1954,7 +1967,25 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
> >> >                        ONENAND_SET_NEXT_BUFFERRAM(this);
> >> >                }
> >> >
> >> > -               this->command(mtd, ONENAND_CMD_PROG, to, mtd->writesize);
> >> > +               this->ongoing = 0;
> >> > +
> >> > +               /* Exclude 1st OTP and OTP blocks */
> >> > +               if (ONENAND_IS_CACHE_PROGRAM(this) &&
> >> > +                   likely(onenand_block(this, to) != 0) &&
> >> > +                   ONENAND_IS_4KB_PAGE(this)) {
> >> check the length here instead of 4KB_PAGE.
> >
> >
> > This patch is for 4kb page onenand only. The 2kb page onenand uses different
> > commands for cache program.
> I see, check it both 4KiB and 2KiB at office.
> >
> >
> >> > +
> >> > +                       if ((written + thislen) < len) {
> >> > +                               cmd = ONENAND_CMD_CACHE_PROG;
> >> > +                               this->ongoing = 1;
> >> > +                       } else {
> >> > +                               cmd = ONENAND_CMD_CACHE_PROG_LAST;
> >> > +                       }
> >> Need to check how to pass the cmd properly. How/When send the CACHE_PROG_LAST?
> >
> >
> > CACHE_PROG_LAST command must be sent for last programmed piece of data, that is
> > (written + thislen) >= len.
> Yes I know, I mean to use the CACHE program I think write size should
> be more than 4KiB. e.g., 8KiB write size,

Considering 4KB page onenand, for each program command the 4KB data is written at once.
If the condition ((written + thislen) < len) is true it means that there is more
than 4KB data to written. That means at least one more data program command.
Otherwise the ONENAND_CMD_CACHE_PROG_LAST is used which is normal program command.


> >
> >
> >> > +
> >> > +               } else {
> >> > +                       cmd = ONENAND_CMD_PROG;
> >> > +               }
> >> > +
> >> > +               this->command(mtd, cmd, to, mtd->writesize);
> >> >
> >> >                /*
> >> >                 * 2 PLANE, MLC, and Flex-OneNAND wait here
> >> > @@ -3380,6 +3411,8 @@ static void onenand_check_features(struct mtd_info *mtd)
> >> >                else if (numbufs == 1)
> >> >                        this->options |= ONENAND_HAS_4KB_PAGE;
> >> >
> >> > +               this->options |= ONENAND_HAS_CACHE_PROGRAM;
> >> It also needs to set CACHE_PROGRAM option.
> >
> >
> > Sorry. What do mean here?
> Ah, Now it always set the CACHE_PROGRAM, so it should be set on each chip spec.

Is there any problem that CACHE_PROGRAM feature is set for each 4Gb chip?
I suppose each of them supports cache program either as 4KB page cache or
2KB page 2x cache program feature.

> >
> >
> >> > +
> >> >        case ONENAND_DEVICE_DENSITY_2Gb:
> >> >                /* 2Gb DDP does not have 2 plane */
> >> >                if (!ONENAND_IS_DDP(this))
> >> > @@ -3415,6 +3448,8 @@ static void onenand_check_features(struct mtd_info *mtd)
> >> >                printk(KERN_DEBUG "Chip has 2 plane\n");
> >> >        if (this->options & ONENAND_HAS_4KB_PAGE)
> >> >                printk(KERN_DEBUG "Chip has 4KiB pagesize\n");
> >> > +       if (this->options & ONENAND_HAS_CACHE_PROGRAM)
> >> > +               printk(KERN_DEBUG "Chip has cache program feature\n");
> >> >  }
> >>
> >> Thank you,
> >> Kyungmin Park
> >
