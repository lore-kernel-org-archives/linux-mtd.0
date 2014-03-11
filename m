Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNPkI-0004g3-Pn
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 16:41:39 +0000
Received: by mail-pd0-f174.google.com with SMTP id y13so8796521pdi.33
 for <linux-mtd@lists.infradead.org>; Tue, 11 Mar 2014 09:41:15 -0700 (PDT)
Date: Tue, 11 Mar 2014 09:41:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH V4] mtd: gpmi: fix the bitflips for erased pag
Message-ID: <20140311164109.GN31517@norris-Latitude-E6410>
References: <20980858CB6D3A4BAE95CA194937D5E73EAB0919@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB0919@DBDE04.ent.ti.com>
Cc: Elie De Brauwer <eliedebrauwer@gmail.com>,
 "bpringlemeir@nbsps.com" <bpringlemeir@nbsps.com>,
 Huang Shijie <b32955@freescale.com>,
 "Vikram.Narayanan@in.bosch.com" <Vikram.Narayanan@in.bosch.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 07, 2014 at 09:22:30AM +0000, Pekon Gupta wrote:
> >From: Brian Norris
> >On Mon, Mar 03, 2014 at 08:47:07AM +0100, Elie De Brauwer wrote:
> >> On Fri, Feb 21, 2014 at 7:08 AM, Huang Shijie <b32955@freescale.com> wrote:
> >> > On Mon, Jan 13, 2014 at 04:47:18PM +0800, Huang Shijie wrote:
> >> > Just a ping.
> >> >
> >> > could you merge this patch?
> >>
> >> Also a ping from my side, I'm also a demanding party for a solution
> >> for this issue, and I'm also waiting for a solution to get applied
> >> upstream to integrate it into my board.
> >
> >Hmm, I'm not terribly opposed to this patch, but you, Pekon, and I
> >(in my local driver) are all doing something very similar, and I believe
> >Pekon has gotten the logic wrong one or more times.
> >
> Apart from some minor bugs, I tried presenting same ideology in
> different ways, because it was difficult to convince the maintainer :-)

You still haven't convinced me you're right :)

> > I believe I actually
> >have a version of this type of patch locally that could probably be put
> >into the nand_base layer, with a flag so that drivers could request the
> >check themselves (something like chip->options |=
> >NAND_NEED_FF_ECC_CHECK; or pick your own name!).
> >
> Also, you need to be careful here that GPMI (Freescale controller) supports
> a built-in hardware-bit to tell that read_data == all(0xFF). But such features
> may not be supported in other controllers like GPMC (TI controller).

As I read this last GPMI patch, they're not making use of any
particularly special hardware. If GPMI (or any other hardware, for that
matter) can easily flag "all 0xff", then that's just fine. But many
controllers can't handle the case of "all 0xff and a few flips." It
doesn't look like GPMI HW is handling this case.

> So, may be those would require NAND_NEDD_FF_ECC_CHECK..
> (This is why I din't comment on this particular GPMI patch, as it follows
>  different approach than GPMC controller).

The approach looks nearly identical, modulo the bugs I see in each.

> >What do you think? All interested parties please chime in. I can try to
> >push a patch out soon for you all to test soon, or else I can see about
> >taking your patches as-is for now, then try to unify them myself
> >afterward.
> >
> There was discussion about this earlier also ..
> Apart from reasons given in [3], I have some additional apprehensions about
> Ideas given in [1] and [2]. And I have reasons also..
> 
> (a) ROM code expects a predefined ecc-layout. Now, if we introduce some
>  ECC markers in OOB to differentiate between programmed v/s erased page.
>  Then I don't have an idea on how older legacy devices will behave.
>  And also, ECC marker may itself be subjected to bit-flips (considering MLC NANDs)

Right, this is not a general-purpose solution. You have to have special
control of every page that was written; it's hard to add this solution
to an existing system. Plus it still doesn't really fully solve the
problem of reading erased pages with bitflips; you still have to check
the whole page eventually.

> (b) As suggested in [2], If we add new polynomial to before writing to OOB
>  then ecc-syndrome may become un-compatible to existing ROM codes
>  in legacy devices.

Plus, this is plain impossible for many existing hardware, which don't
allow you to modify their data path in this way (to place a
transformation between the ECC encoder/decoder and the flash interface).

> I think this needs to be analyzed case by case. So please accept the current GPMI
> and also GPMC patches for now :-)

I agree with the "case by case," but as far as I've judged both GPMI and
GPMC/OMAP, both cases are the same, and both have incorrect patch
submissions! I just spun a patch set and CC'd all of you. I think it's
at least an improvement on the independent solutions I've seen so far.

Brian
