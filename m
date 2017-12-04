Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eLn4m-000327-Ew
 for linux-mtd@lists.infradead.org; Mon, 04 Dec 2017 09:30:21 +0000
Date: Mon, 4 Dec 2017 10:29:41 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Adam Ford <aford173@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/3] mtd: nand: Remove support for block locking/unlocking
Message-ID: <20171204102941.7c57ad13@bbrezillon>
In-Reply-To: <CAHCN7xKtR=kjLLFYkQkhjKGsuU+ttRE9FA_p7aWGDWVWxf2S8Q@mail.gmail.com>
References: <1494886663-20700-1-git-send-email-boris.brezillon@free-electrons.com>
 <1494886663-20700-3-git-send-email-boris.brezillon@free-electrons.com>
 <20170804103237.58eed266@bbrezillon>
 <CAHCN7xKtR=kjLLFYkQkhjKGsuU+ttRE9FA_p7aWGDWVWxf2S8Q@mail.gmail.com>
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

Hi Adam,

On Sun, 3 Dec 2017 08:57:17 -0600
Adam Ford <aford173@gmail.com> wrote:

> On Fri, Aug 4, 2017 at 3:32 AM, Boris Brezillon <
> boris.brezillon@free-electrons.com> wrote:
> 
> > On Tue, 16 May 2017 00:17:42 +0200
> > Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> >  
> > > Commit 7d70f334ad2b ("mtd: nand: add lock/unlock routines") introduced
> > > support for the Micron LOCK/UNLOCK commands but no one ever used the
> > > nand_lock/unlock() functions.
> > >
> > > Remove support for these vendor-specific operations from the core. If
> > > one ever wants to add them back they should be put in nand_micron.c and
> > > mtd->_lock/_unlock should be directly assigned from there instead of
> > > exporting the functions.  
> >
> >  
> I am running into some issues with a board using Micron Flash that cannot
> boot from a UBIFS partition and it appears to be related the NAND being
> locked.  I was going to investigate how to unlock the NAND and I came
> across this.  I am attempting to do what you suggested by moving these
> functions to the nand_micron.c file, but these functions are dependant on
> several static functions inside nand_base.c
> namely: check_offs_len, nand_get_device, nand_check_wp,
> and nand_release_device.  I assume that we don't want to export all those
> functions, but it seems redundant to copy these functions to nand_micron.c.

I don't see a problem in exposing those symbols so that NAND vendor
drivers can use them (note that you don't need to use EXPORT_SYMBOL()
in this case, because nand_xxx.c files are all linked in a single
object)?

This being said, I think the check_offs_len() can be dropped since it's
already checked in mtd_[un]lock().

> 
> Do you have any thoughts or suggestions on how to go about using these
> functions without replicating code?

I have no objection to adding this feature back in the Micron driver,
though I'd like to wait for the ->exec_op() series [1] to be merged,
because I'm not sure all NAND controller drivers handle the UNLOCK/LOCK
operations properly (custom ->cmdfunc() implementations tend to only
support basic operations). The idea is to check whether the controller
supports the LOCK/UNLOCK operations and in this case assign the
mtd->_lock/_unlock() hooks to micron's implementation.

Regards,

Boris

[1]http://patchwork.ozlabs.org/project/linux-mtd/list/?series=16013&state=%2A&archive=both
