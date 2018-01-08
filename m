Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYfZo-0001nM-Ss
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 22:07:30 +0000
Date: Mon, 8 Jan 2018 23:07:00 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: Frieder Schrempf <frieder.schrempf@exceet.de>, "Peter Pan
 =?UTF-8?B?5r2Y5qCL?= (peterpandong)" <peterpandong@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v6 00/15] A SPI NAND framework under generic NAND framework
Message-ID: <20180108230700.15e32d03@bbrezillon>
In-Reply-To: <CAAyFORKfQ-82=HhnjQcaU3n8VkmqQ9VHCXoMh=47BSzMc8en3Q@mail.gmail.com>
References: <20170529225931.226da943@bbrezillon>
 <20171205140313.40f3f17d@bbrezillon>
 <256b4ab6-c104-4580-87cd-527178bde460@exceet.de>
 <20171213222710.32d12514@bbrezillon>
 <CAAyFORJcT1abbo21iA4cetLKmF0zE4akFGFryxPpwPO+730LDQ@mail.gmail.com>
 <20171214085036.436b4fcf@bbrezillon>
 <CAAyFOR+=JwTRTm2MXVdMy7KRPsnV8LV4t71kHUh_s=+QOsVurA@mail.gmail.com>
 <23d17416-e555-4b92-cc47-f644fbe676c6@exceet.de>
 <20171214163848.41f6d277@bbrezillon>
 <CAAyFORKeFq+=tF9AK+8hp6GYYiyp3DKcw8+LWrC3RWS2zLNU_w@mail.gmail.com>
 <CAAyFORJEuEaHDXgk+m0ax5RoZ-3cRJs6uFXw7syR4vHE1veEwQ@mail.gmail.com>
 <a06312e4-a7e6-8b7b-9eb5-8320302dcc55@exceet.de>
 <CAAyFORL6mUFXFRvku6sm=Pj2=+Bf4wSV7EoBM_7+wRdPrF-ufw@mail.gmail.com>
 <CAAyFOR+m7GvXU66XKphu+cETP9SQTJ6GuZQEZQA600MX1R6cYw@mail.gmail.com>
 <20171222145147.3697fb02@bbrezillon>
 <CAAyFORK9v-V1WrJzTnKk0sAt7_f_st_PHc6nJ6dz0zTL-Jih5A@mail.gmail.com>
 <20180103174614.6d760b3d@bbrezillon>
 <CAAyFORKfQ-82=HhnjQcaU3n8VkmqQ9VHCXoMh=47BSzMc8en3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 4 Jan 2018 10:01:57 +0800
Peter Pan <peterpansjtu@gmail.com> wrote:

> Boris,
> 
> On Thu, Jan 4, 2018 at 12:46 AM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Tue, 2 Jan 2018 10:51:25 +0800
> > Peter Pan <peterpansjtu@gmail.com> wrote:
> >  
> >> Hi Boris,
> >>
> >>
> >> On Fri, Dec 22, 2017 at 9:51 PM, Boris Brezillon
> >> <boris.brezillon@free-electrons.com> wrote:  
> >> > On Fri, 22 Dec 2017 14:37:06 +0800
> >> > Peter Pan <peterpansjtu@gmail.com> wrote:
> >> >  
> >> >> Hi Boris and Frieder
> >> >>
> >> >> On Fri, Dec 22, 2017 at 8:49 AM, Peter Pan <peterpansjtu@gmail.com> wrote:  
> >> >> > Hi Frieder,
> >> >> >
> >> >> > On Thu, Dec 21, 2017 at 7:48 PM, Frieder Schrempf
> >> >> > <frieder.schrempf@exceet.de> wrote:  
> >> >> >> Hello Boris,
> >> >> >>  
> >> >> >>>>>> So shouldn't there be an spinand_die_select_op in the SPI NAND core
> >> >> >>>>>> that
> >> >> >>>>>> is executed when necessary and skipped if there's only one die.  
> >> >> >>>>>
> >> >> >>>>>
> >> >> >>>>> Sure, I was arguing against a ->select_chip() at the generic NAND
> >> >> >>>>> level. That's something you can add in the SPI NAND framework.  
> >> >> >>
> >> >> >>
> >> >> >> I added an op to send the die selection command and call it, where I think
> >> >> >> it is needed: [1]  
> >> >> >
> >> >> > I think we should add die_select_op in vendor's file and call a hook in core.c
> >> >> > since the die select command implementation is different by vendors.
> >> >> >
> >> >> > Thanks
> >> >> > Peter Pan
> >> >> >
> >> >> >  
> >> >> >>
> >> >> >> Accessing both dies on the Winbond SPI NAND works fine like this.
> >> >> >>
> >> >> >> While running tests I came across some problems:
> >> >> >>
> >> >> >> * On accessing the BBT in RAM via nanddev_bbt_[set/get]_block_status, the
> >> >> >> calculation of position and offset seems to be wrong.
> >> >> >> My fix is here: [2]
> >> >> >>
> >> >> >> * On calculating the row address for read/program/erase via
> >> >> >> nanddev_pos_to_row, it seems like the eraseblock_addr_shift is wrong.
> >> >> >>
> >> >> >> * Also, I'm not sure if the LUN should be taken into account when
> >> >> >> calculating the row address. At least when you select the LUN by issuing a
> >> >> >> separate command, the row address sent to the chip should only contain the
> >> >> >> page address.
> >> >> >> But I'm not sure if that's the case in general, or if some code is needed to
> >> >> >> differentiate.
> >> >> >>
> >> >> >> See my changes of nanddev_pos_to_row here: [3]
> >> >> >>
> >> >> >> * I run into a mutex deadlock, when spinand_write_page fails (e.g. because
> >> >> >> of a bad block) as the lock is not released in such cases. See my fix here:
> >> >> >> [4]
> >> >> >>
> >> >> >> With these fixes applied and as far as I can tell everything seems to work
> >> >> >> fine. I'll do some tests with UBI next and look into the ECC topic.  
> >> >>
> >> >> UBI attach failed since missing mtd->writebufsize assignment in nanddev_init()
> >> >> After fixing it and with Frieder's fixing, UBIFS can be mounted successfully on
> >> >> Zedboard with generic spi controller and Micron SPI NAND 2Gb device.
> >> >>
> >> >> Also, the code now can pass mtd read and page test. 1 error found in oob test
> >> >> since we don't have "past end of partition" check in part_write_oob() which I
> >> >> mentioned in earlier mail. Since we don't support ECC right now, I didn't try
> >> >> nandbiterror test.
> >> >>  
> >> >
> >> > Peter, Frider, I just pushed a new version to my nand/spi-nand branch
> >> > [1] fixing the authorship, adding/fixing/removing comments where needed.
> >> >
> >> > Can you please have a look at those changes (everything I changed
> >> > should appear as !fixup commits) and let me know if I did something
> >> > wrong.  
> >>
> >> You forgot to initialize mtd->writebufsize and mtd->oobavail.
> >> For mtd->writebufsize I think we can do it in nanddev_init() like below:
> >>
> >> --- a/drivers/mtd/nand/core.c
> >> +++ b/drivers/mtd/nand/core.c
> >> @@ -196,7 +196,9 @@ int nanddev_init(struct nand_device *nand, const
> >> struct nand_ops *ops,
> >>         mtd->flags = MTD_CAP_NANDFLASH;
> >>         mtd->erasesize = memorg->pagesize * memorg->pages_per_eraseblock;
> >>         mtd->writesize = memorg->pagesize;
> >> +       mtd->writebufsize = mtd->writesize;
> >>         mtd->oobsize = memorg->oobsize;
> >>         mtd->size = nanddev_size(nand);
> >>         mtd->owner = owner;  
> >
> > I fixed it already, see [1]. Note that I haven't squashed fixup commits
> > yet.  
> 
> Noted.
> 
> >  
> >>
> >> For mtd->oobavail, I think we need to call some hooks in spinand_init(),
> >> and implement on-die ECC layout in vendor's file and HW ECC layout in
> >> controller's file.
> >>
> >> What's your opinion?  
> >
> > Hm, I'm not so sure. spinand_init() should be called just before
> > registering the MTD device, so by that time everything should have been
> > setup correctly by the upper layer. This being said, I'd like to keep a
> > clear separation between the MTD and NAND layers, and this means
> > preventing any NAND sub-layer from directly manipulating the MTD device
> > and its fields.
> >
> > Really, I don't know yet how I want to abstract ECC stuff, so let's
> > keep it simple for now and expose the whole OOB area (I'll fix the core
> > to do that if you're okay).  
> 
> OK.
> 
> >  
> >>
> >> With the two thing fixed, we can pass UBIFS mount and mtd test.  
> >
> > Do you still have the problem you reported earlier (OOB test)?  
> 
> I forgot to reply that mail :(. Actually there is no problem because
> mtd_write_oob() already has mtd_check_oob_ops() to check it.
> That failure in OOB test occurs because mtd->oobavail is zero.

I reconsidered what I said earlier, and I think it's safer to set
->oobavail to 0 are for now, otherwise we might end up with setups that
start using some of it and we'll break things as soon as we'll add
support for ECC.
