Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1br7CW-000094-5w
 for linux-mtd@lists.infradead.org; Mon, 03 Oct 2016 17:38:53 +0000
Date: Mon, 3 Oct 2016 19:38:26 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PULL] mtd: nand: material for 4.9
Message-ID: <20161003193826.414116cf@bbrezillon>
In-Reply-To: <20161003165533.GA66959@google.com>
References: <20160925205326.67b5a9bd@bbrezillon>
 <20161003165533.GA66959@google.com>
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

Hi Brian,

On Mon, 3 Oct 2016 09:55:33 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi Boris,
> 
> On Sun, Sep 25, 2016 at 08:53:26PM +0200, Boris Brezillon wrote:
> > Hi Brian,
> > 
> > Here is my PR for 4.9. Let me know if you see any problem.
> > Also, please let us know ahead of time if you can't take this PR (I know you
> > are busy lately, and I guess I could send this PR directly to Linus or ask
> > Richard to take it in its UBIFS/UBI tree).  
> 
> I made some time for this one. We'll see about the pairing one
> (hopefully trivial? but I'm not sure if there's value in merging without
> users).

Well, I already posted UBI patches using this API, and that'd be easier
if the interface is already available (that would solve cross-tree
dependencies).
> 
> > Thanks,
> > 
> > Boris
> > 
> > The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:
> > 
> >   Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)
> > 
> > are available in the git repository at:
> > 
> >   git@github.com:linux-nand/linux.git tags/for-4.9
> > 
> > for you to fetch changes up to d44154f969a44269a9288c274c1c2fd9e85df8a5:
> > 
> >   mtd: nand: Provide nand_cleanup() function to free NAND related resources (2016-09-23 09:35:16 +0200)  
> 
> Thanks. I only added one trivial fixup that checkpatch.pl's spelling.txt
> (what??) caught:
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 7a00245ebada..e5718e5ecf92 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -746,7 +746,7 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
>  			chip->cmd_ctrl(mtd, column, ctrl);
>  			ctrl &= ~NAND_CTRL_CHANGE;
>  
> -			/* Only ouput a single addr cycle for 8bits opcodes. */
> +			/* Only output a single addr cycle for 8bits opcodes. */
>  			if (!nand_opcode_8bits(command))
>  				chip->cmd_ctrl(mtd, column >> 8, ctrl);
>  		}
> 
> 
> > ----------------------------------------------------------------
> > Notable core changes:
> > - add the infrastructure to automate NAND timings configuration
> > - provide a generic DT property to maximize ECC strength
> > 
> > The rest is just a bunch of minor drivers and core fixes/cleanup
> > patches.
> > 
> > ----------------------------------------------------------------  
> 
> I added a small note in the merge commit about the BBT changes you made.
> That's an especially fragile piece of code I think (and used by every
> NAND driver), but it looked OK to me.

Oh, I completely forgot about this important change.

Thanks for fixing the typo and adding more information in the merge
message.

Boris
