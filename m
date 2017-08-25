Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dl6cl-0007Xr-Bo
 for linux-mtd@lists.infradead.org; Fri, 25 Aug 2017 04:53:41 +0000
Received: by mail-pg0-x243.google.com with SMTP id 83so2253255pgb.3
 for <linux-mtd@lists.infradead.org>; Thu, 24 Aug 2017 21:53:18 -0700 (PDT)
Date: Thu, 24 Aug 2017 21:53:14 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Andrea Adami <andrea.adami@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mtd: sharpslpart: Add sharpslpart partition parser
Message-ID: <20170825045314.GC68252@google.com>
References: <1503394972-12541-1-git-send-email-andrea.adami@gmail.com>
 <20170822145424.54e57b94@bbrezillon>
 <CAAQYJAsTCy2nWYjMTmSGqSCn-ttWJ5H8LANmyaaVJ+mPs7x1bg@mail.gmail.com>
 <20170824120428.46e266c7@bbrezillon>
 <CAAQYJAtkHGO1-5mQsgmAA=Q6oOuN0e=OaNftXE=iKBoUYBs8Kg@mail.gmail.com>
 <20170824132710.5fdea20c@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170824132710.5fdea20c@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 24, 2017 at 01:27:10PM +0200, Boris Brezillon wrote:
> On Thu, 24 Aug 2017 12:30:02 +0200
> Andrea Adami <andrea.adami@gmail.com> wrote:
> 
> > On Thu, Aug 24, 2017 at 12:04 PM, Boris Brezillon
> > <boris.brezillon@free-electrons.com> wrote:
> > > On Thu, 24 Aug 2017 11:19:56 +0200
> > > Andrea Adami <andrea.adami@gmail.com> wrote:

...

> > >> >> +     /* create physical-logical table */
> > >> >> +     for (block_num = 0; block_num < phymax; block_num++) {
> > >> >> +             block_adr = block_num * mtd->erasesize;
> > >> >> +
> > >> >> +             if (mtd_block_isbad(mtd, block_adr))
> > >> >> +                     continue;
> > >> >> +
> > >> >> +             if (sharpsl_nand_read_oob(mtd, block_adr, mtd->oobsize, oob))
> > >> >> +                     continue;
> > >> >> +
> > >> >> +             /* get logical block */
> > >> >> +             log_num = sharpsl_nand_get_logical_num(oob);
> > >> >> +
> > >> >> +             /* FTL is not used? Exit here if the oob fingerprint is wrong */
> > >> >> +             if (log_num == UINT_MAX) {
> > >> >> +                     pr_info("sharpslpart: Sharp SL FTL not found.\n");
> > >> >> +                     ret = -EINVAL;
> > >> >> +                     goto exit;
> > >> >> +             }  
> > >
> > > Okay, I overlooked that part. Why do you exit if there's a fingerprint
> > > mismatch? Can't you just ignore this physical block and continue
> > > scanning the remaining ones?  
> > 
> > Norris asked to quit immediately in this case.
> > https://patchwork.kernel.org/patch/9758361/

I didn't specifically ask for you to quit in *that* case. Quoting myself
here, as you did:

> > "I wouldn't expect people to want to use this parser, but if we have a
> > quick way to say "this doesn't match, skip me", then that would be
> > helpful."
> > "We don't want to waste too much time scanning for this partition
> > table if possible."

That means, is there something (not necessarily writting in the
"original code" that you're massaging) that could be used to reliably
detect that this is/isn't a valid "Sharp FTL"? I don't think the check
you wrote is a good one. Particularly, you *don't* want to just abort
completely because there's one corrupt block. This check is a
reliability check (so you can possibly ignore old/bad copies and skip
onto better blocks), not a validity check. It is counter-productive to
abort here, IIUC.

> Actually, you don't save much by exiting on "bad OOB fingerprint". If
> you look at the code you'll see that the only thing you check is
> whether some oob portions are equal or not, and most of the time the
> OOB area is left untouched by the upper layer, which means all free
> bytes will be left to 0xff, which in turn means the "is fingerprint
> good?" test will pass.

Agreed.

I'd drop this "abort early" check and just admit that it's not possible
to do what I asked.

> > Now we are quitting ever before checking for parity erors ...
> 
> Honestly, I'd recommend not using this parser for anything but SHARPSL
> platforms, so I don't think we care much about the "scan all blocks"
> overhead.

Sounds about right.

> Moreover, the sharpsl parser is the last one in the
> part_parsers list, so it should be quite fast if the user specifies a
> valid mtdparts= on the cmdline or valid partitions in the DT.

Brian

P.S. I alluded to it earlier, but I figured I should write it down
properly here sometime, as food for thought; you don't actually need any
of this parser at all if you're willing to contruct an initramfs that
will do the parsing in user space (e.g., some scripting and 'nanddump';
or link to libmtd) and then add partitions yourself (e.g., with
'mtdpart add ...', or calling the BLKPG ioctls directly). This would
just require you have a kernel with CONFIG_MTD_PARTITIONED_MASTER=y.
