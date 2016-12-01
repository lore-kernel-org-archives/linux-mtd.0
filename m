Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCGlS-0004tB-VG
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 02:06:24 +0000
Received: by mail-pf0-x241.google.com with SMTP id i88so1584825pfk.2
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2016 18:06:02 -0800 (PST)
Date: Wed, 30 Nov 2016 18:05:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PULL] mtd: nand: 4.10 materials
Message-ID: <20161201020559.GA79662@google.com>
References: <20161127154416.6ce36b76@bbrezillon>
 <20161128113934.53058563@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161128113934.53058563@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Mon, Nov 28, 2016 at 11:39:34AM +0100, Boris Brezillon wrote:
> On Sun, 27 Nov 2016 15:44:16 +0100
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
> > Hi Brian,
> > 
> > Here is my PR for 4.10.
> > As usual, don't hesitate to tell me if there's anything wrong, or fix
> > things after pulling the changes if you think it does not require a new 
> > PR.
> > 
> 
> I realized I forgot to Cc the MTD ML.
> 
> > Thanks,
> > 
> > Boris
> > 
> > The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:
> > 
> >   Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)
> > 
> > are available in the git repository at:
> > 
> >   git@github.com:linux-nand/linux.git tags/nand/for-4.10
> > 
> > for you to fetch changes up to 8fcfba072420518fda4b2fe00a3f3c9c3e2774e2:
> > 
> >   mtd: nand: tango: Use nand_to_mtd() instead of directly accessing chip->mtd (2016-11-21 11:55:59 +0100)
> > 
> > ----------------------------------------------------------------
> > This pull request contains the following notable changes:
> > - new tango NAND controller driver
> > - new ox820 NAND controller driver
> > - addition of a new full-ID entry in the nand_ids table
> > - rework of the s3c240 driver to support DT
> > - extension of the nand_sdr_timings to expose tCCS, tPROG and tR
> > - addition of a new flag to ask the core to wait for tCCS when sending
> >   a RNDIN/RNDOUT command
> > - addition of a new flag to ask the core to let the controller driver
> >   send the READ/PROGPAGE command
> > 
> > This pull request also contains minor fixes/cleanup/cosmetic changes:
> > - properly support 512 ECC step size in the sunxi driver
> > - improve the error messages in the pxa probe path
> > - fix module autoload in the omap2 driver
> > - cleanup of several nand drivers to return nand_scan{_tail}() error
> >   code instead of returning -EIO
> > - various cleanups in the denali driver
> > - cleanups in the ooblayout handling (MTD core)
> > - fix an error check in nandsim
> > 
> > ----------------------------------------------------------------

I think this all looks good except:

...

> > Marc Gonzalez (5):
> >       mtd: nand: add tango NFC dt bindings doc
> >       mtd: nand: add tango NAND flash controller support
> >       mtd: nand: Support controllers with custom page
> >       mtd: nand: tango: Enable custom page accessors
> >       mtd: nand: tango: Cleanup raw_write and raw_read

this driver was missing a copyright header. Presumably we can get a
proper one before the merge window.

Merged the whole thing to l2-mtd.git.

Brian
