Date: Mon, 27 Apr 2015 17:36:30 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/3] mtd: nand: Add on-die ECC support
Message-ID: <20150427223630.GA11721@bshelton-desktop>
References: <1427292151-3835-1-git-send-email-richard@nod.at>
 <1427292151-3835-2-git-send-email-richard@nod.at>
 <20150427213558.GA22780@bshelton-desktop> <553EB5E4.3050309@nod.at>
MIME-Version: 1.0
In-Reply-To: <553EB5E4.3050309@nod.at>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: punnaiah.choudary.kalluri@xilinx.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/28, Richard Weinberger wrote:
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
> But you're right there is a corner case.
> 
> What we could do is just using chip->cmdfunc() with a custom NAND command.
> i.e. chip->cmdfunc(mtd, NAND_CMD_READMODE, -1, -1);
> 
> Gerhard Sittig tried to introduce such a command some time ago:
> http://lists.infradead.org/pipermail/linux-mtd/2014-April/053115.html

That sounds reasonable to me.  That's similar to how we're checking the
NAND status after reads in our current out-of-tree PL353 driver.  We
added the extra command:

+ /*
+  * READ0 command only, for checking read status. Note that the real command
+  * here is 0x00, but we can't differentiate between READ0 where we need to
+  * send a READSTART after the address bytes, or a READ0 by itself, after
+  * a read status command to check the on-die ECC status. The high bit is
+  * written into the unused end_cmd field, so we don't need to mask it off.
+  */
+#define NAND_CMD_READ0_ONLY 0x100

and then added it to the struct pl353_nand_command_format of the driver:

 static const struct pl353_nand_command_format pl353_nand_commands[] = {
        {NAND_CMD_READ0, NAND_CMD_READSTART, 5, PL353_NAND_CMD_PHASE},
+       {NAND_CMD_READ0_ONLY, NAND_CMD_NONE, 0, NAND_CMD_NONE},
        {NAND_CMD_RNDOUT, NAND_CMD_RNDOUTSTART, 2, PL353_NAND_CMD_PHASE},
        {NAND_CMD_READID, NAND_CMD_NONE, 1, NAND_CMD_NONE},
        {NAND_CMD_STATUS, NAND_CMD_NONE, 0, NAND_CMD_NONE},

> 
> Maybe Brian can bring some light into that too...
> 
> > When I build this without CONFIG_MTD_NAND_ECC_ON_DIE enabled, I get the
> > following warning here:
> > 
> > In file included from drivers/mtd/nand/nand_base.c:46:0:
> > include/linux/mtd/nand_ondie.h: In function 'nand_read_subpage_on_die':
> > include/linux/mtd/nand_ondie.h:28:1: warning: no return statement in function returning non-void [-Wreturn-type]
> > include/linux/mtd/nand_ondie.h: In function 'nand_read_page_on_die':
> > include/linux/mtd/nand_ondie.h:34:1: warning: no return statement in function returning non-void [-Wreturn-type]
> > 
> > Perhaps return an error code here, even though you'll never get past the BUG()?
> 
> What gcc is this?
> gcc 4.8 here does not warn, I thought it is smart enough that this function does never
> return. Can it be that your .config has CONFIG_BUG=n?
> Anyway, this functions clearly needs a return statement. :)

gcc 4.7.2, and you are correct that I had CONFIG_BUG off.  :)

Thanks,
Ben

> 
> Thanks,
> //richard
