Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YmsNy-0001tz-Ha
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2015 23:24:23 +0000
Received: by pdbqa5 with SMTP id qa5so144034605pdb.1
 for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2015 16:24:01 -0700 (PDT)
Date: Mon, 27 Apr 2015 16:23:53 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/3] mtd: nand: Add on-die ECC support
Message-ID: <20150427232353.GD32500@ld-irv-0074>
References: <1427292151-3835-1-git-send-email-richard@nod.at>
 <1427292151-3835-2-git-send-email-richard@nod.at>
 <20150427213558.GA22780@bshelton-desktop> <553EB5E4.3050309@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <553EB5E4.3050309@nod.at>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ben Shelton <ben.shelton@ni.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, punnaiah.choudary.kalluri@xilinx.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 28, 2015 at 12:19:16AM +0200, Richard Weinberger wrote:
> Am 27.04.2015 um 23:35 schrieb Ben Shelton:
> > I tested this against the latest version of the PL353 NAND driver that Punnaiah
> > has been working to upstream (copying her on this message).  With a few changes
> > to that driver, I got it most of the way through initialization with on-die ECC
> > enabled, but it segfaults here with a null pointer dereference because the
> > PL353 driver does not implement chip->cmd_ctrl.  Instead, it implements a
> > custom override of cmd->cmdfunc that does not call cmd_ctrl.  Looking through
> > the other in-tree NAND drivers, it looks like most of them do implement
> > cmd_ctrl, but quite a few of them do not (e.g. au1550nd, denali, docg4).
> > 
> > What do you think would be the best way to handle this?  It seems like this gap
> > could be bridged from either side -- either the PL353 driver could implement
> > cmd_ctrl, at least as a stub version that provides the expected behavior in
> > this case; or the on-die framework could break this out into a callback
> > function with a default implementation that the driver could override to
> > perform this behavior in the manner of its choosing.
> 
> Oh, I thought every driver has to implement that function. ;-\

Nope.

> But you're right there is a corner case.

And it's not the only one! Right now, there's no guarantee even that
read_buf() returns raw data, unmodified by the SoC's controller. Plenty
of drivers actually have HW-enabled ECC turned on by default, and so
they override the chip->ecc.read_page() (and sometimes
chip->ecc.read_page_raw() functions, if we're lucky) with something
that pokes the appropriate hardware instead. I expect anything
comprehensive here is probably going to have to utilize
chip->ecc.read_page_raw(), at least if it's provided by the hardware
driver.

> What we could do is just using chip->cmdfunc() with a custom NAND command.
> i.e. chip->cmdfunc(mtd, NAND_CMD_READMODE, -1, -1);
> 
> Gerhard Sittig tried to introduce such a command some time ago:
> http://lists.infradead.org/pipermail/linux-mtd/2014-April/053115.html

Yikes! Please no! It's bad enough to have a ton of drivers doing
switch/case on a bunch of real, somewhat well-known opcodes, but to add
new fake ones? I'd rather not. We're inflicting ourselves with a
kernel-internal version of ioctl(). What's the justification, again? I
don't really remember the context of Gerhard's previous patch.

Brian
