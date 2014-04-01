Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WV2Yz-0000CT-Or
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 17:33:30 +0000
Received: by mail-pa0-f46.google.com with SMTP id kx10so4653301pab.19
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 10:33:08 -0700 (PDT)
Date: Tue, 1 Apr 2014 10:33:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH v4 5/5] mtd: nand: Improve bitflip detection for on-die
 ECC scheme.
Message-ID: <20140401173305.GI29542@ld-irv-0074>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-6-git-send-email-davidm@egauge.net>
 <20140401075020.GD6400@brian-ubuntu>
 <CALnQHM2Afp8LD6MtGQTT5jrcb9xJdYXRGD0TZ_s5GASZsbRZeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALnQHM2Afp8LD6MtGQTT5jrcb9xJdYXRGD0TZ_s5GASZsbRZeg@mail.gmail.com>
Cc: gsi@denx.de, linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Re-constructing CC list and leaving message intact, since you missed
the "Reply-All" button)

On Tue, Apr 01, 2014 at 10:03:00AM -0600, David Mosberger wrote:
> Brian,
> 
> On Tue, Apr 1, 2014 at 1:50 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > On Mon, Mar 31, 2014 at 05:28:57PM -0600, David Mosberger wrote:
> 
> >> +static int
> >> +set_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip, int on)
> >> +{
> >> +     u8 data[ONFI_SUBFEATURE_PARAM_LEN] = { 0, };
> >> +
> >> +     if (chip->ecc.mode != NAND_ECC_HW_ON_DIE)
> >> +             return 0;
> >
> > I think this check is unnecessary, and probably wrong. The caller should
> > make sure not to call this for devices that don't support it. Or else,
> > there should at least be an error code, like -EOPNOTSUPP.
> 
> Fair enough.  I removed the check for ecc.mode.
> 
> >> +
> >> +     if (on)
> >> +             data[0] = ONFI_FEATURE_ARRAY_OP_MODE_ENABLE_ON_DIE_ECC;
> >> +
> >> +     return chip->onfi_set_features(mtd, chip,
> >> +                                    ONFI_FEATURE_ADDR_ARRAY_OP_MODE, data);
> >> +}
> >
> > This should be implemented on a per-vendor basis and provided as a
> > callback (perhaps chip->set_internal_ecc()?). Then, you would only make
> > chip->set_internal_ecc non-NULL for flash that support it.
> 
> It's not clear at all to me how (un-)standardized this stuff is.  It
> may be Micron specific,
> but it may not be.  I don't know.  Since it's only called for Micron
> chips with on-die enabled,
> the code is safe as it is.
> 
> > Do you actually need to re-read, or can you use the existing data? Or at
> > least, you could overwrite the databuf, instead of using a new chkbuf.
> 
> In general,  you have to (re-)read.  Consider read_oob or read_subpage.
> 
> >> +
> >> +     /* Re-read page with on-die ECC off: */
> >> +     set_on_die_ecc(mtd, chip, 0);
> >> +     chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> >> +     chip->read_buf(mtd, rawbuf, read_size);
> >> +     set_on_die_ecc(mtd, chip, 1);
> >> +
> >> +     chkoob = chkbuf + mtd->writesize;
> >> +     rawoob = rawbuf + mtd->writesize;
> >> +     eccpos = chip->ecc.layout->eccpos;
> >> +     for (i = 0; i < chip->ecc.steps; ++i) {
> >> +             /* Count bit flips in the actual data area: */
> >> +             flips = bitdiff(chkbuf, rawbuf, chip->ecc.size);
> >> +             /* Count bit flips in the ECC bytes: */
> >> +             for (j = 0; j < chip->ecc.bytes; ++j) {
> >> +                     flips += hweight8(chkoob[*eccpos] ^ rawoob[*eccpos]);
> >
> > Why didn't you use bitdiff() here too?
> 
> Because the data is not contiguous and I didn't think the overhead
> of an extra function call was warranted for individual bytes.  But yeah,
> we could certainly use bitdiff() here on individual bytes, if you prefer.
> 
> >>               /*
> >> -              * Simple but suboptimal: any page with a single stuck
> >> -              * bit will be unusable since it'll be rewritten on
> >> -              * each read...
> >> +              * The Micron chips turn on the REWRITE status bit for
> >> +              * ANY bit flips.  Some pages have stuck bits, so we
> >> +              * don't want to migrate a block just because of
> >> +              * single bit errors because otherwise, that block
> >> +              * would effectively become unusable.  So, work out in
> >> +              * software what the max number of flipped bits is for
> >> +              * all subpages in a page:
> >
> > Can you shorten this comment? It's rather verbose, and it's making
> > assumptions about upper-layer "migrations". I think we can leave it at
> > something much simpler, like:
> >
> >         /*
> >          * Micron on-die ECC doesn't report the number of bitflips, so
> >          * we have to count them ourself to see if the error rate is too
> >          * high.
> >          */
> 
> Sure, I did add "This is particularly important for pages with stuck
> bits." since
> I think that is an important case to think about here.
> 
>   --david
> -- 
> eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768
