Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8eir-0005Ik-Kz
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 00:43:42 +0000
Received: by mail-pa0-f45.google.com with SMTP id lf10so1169964pab.4
 for <linux-mtd@lists.infradead.org>; Tue, 06 Jan 2015 16:43:19 -0800 (PST)
Date: Tue, 6 Jan 2015 16:43:16 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: Fix module unbound
Message-ID: <20150107004316.GI9759@ld-irv-0074>
References: <1417814086-30512-1-git-send-email-festevam@gmail.com>
 <20150106064931.GB13447@norris-Latitude-E6410>
 <CAOMZO5B7=zgxUU1RGm_YpfGU4yBGD529DogeoGYa-CX4yPv8hA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5B7=zgxUU1RGm_YpfGU4yBGD529DogeoGYa-CX4yPv8hA@mail.gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Frank Li <Frank.Li@freescale.com>, Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 06, 2015 at 10:52:00AM -0200, Fabio Estevam wrote:
> On Tue, Jan 6, 2015 at 4:49 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> 
> > Huh? Why was this property even needed in the first place? It seems
> > oddly specific, without actually being very explanatory/descriptive.
> 
> Huang, care to comment as you were the one that added it?
> 
> >
> >> -             has_second_chip = true;
> >> +             q->has_second_chip = true;
> >>
> >>       /* iterate the subnodes. */
> >>       for_each_available_child_of_node(dev->of_node, np) {
> >>               char modalias[40];
> >>
> >>               /* skip the holes */
> >> -             if (!has_second_chip)
> >> +             if (!q->has_second_chip)
> >>                       i *= 2;
> >
> > Why do you need to "skip" anything here? It doesn't really look like
> > you're skpping anything functionally, as this indexing is purely
> > artificial. So you're just jumping through hoops for no reason.
> >
> > Can this just be more straightforward by dropping 'has_second_chip' and
> > indexing straightforwardly? e.g. this patch:
> 
> With your proposed patch I get probe failure:
> 
> root@freescale /$ dmesg | grep qspi
> [    1.688344] fsl-quadspi 21e4000.qspi: s25fl128s (16384 Kbytes)
> [    1.698146] fsl-quadspi 21e4000.qspi: unrecognized JEDEC id bytes: ff, ff, ff
> [    1.705350] fsl-quadspi 21e4000.qspi: Freescale QuadSPI probe failed

I think there was one more subtle piece to this driver; it relies on the
implicit layout of the nor[] array for determining a MMIO offset in
fsl_qspi_set_base_addr(). It seems like it would be clearer to avoid
this pointer subtraction.

Brian
