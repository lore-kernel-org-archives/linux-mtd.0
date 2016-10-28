Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c02w6-0004aI-QV
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 08:54:51 +0000
Date: Fri, 28 Oct 2016 10:54:25 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>
Cc: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: Re: [PATCH 0/2] mtd: nand: Enforce tCCS wait time after a column
 change
Message-ID: <20161028105425.61868d75@bbrezillon>
In-Reply-To: <1475310243-32625-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1475310243-32625-1-git-send-email-boris.brezillon@free-electrons.com>
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

On Sat,  1 Oct 2016 10:24:01 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi,
> 
> Marc recently struggled with the RNDIN/RNDOUT commands when trying to
> add support for the Tango NAND controller.
> After some investigation it appeared that nothing in the
> nand_command_lp() code waits tCCS, which is required to make sure the
> NAND chip is ready to receive/send data on the bus after a column
> change.
> 
> This series adds some more timings to the nand_sdr_timings struct
> (including tCCS) and try to extract them from the ONFI parameter table
> (if available).
> 
> It then adds a new flags to ask the core to enforce the tCCS
> constraint.
> As noted in the commit message, this is an opt-in flag to avoid perf
> regressions on existing implementations (adding an ndelay() might be
> useless if the controller IP or driver already takes care of that),
> but it might appear that some implementations are actually broken and
> needs this flag as well.

Applied.

> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (2):
>   mtd: nand: Add a few more timings to nand_sdr_timings
>   mtd: nand: Wait tCCS after a column change
> 
>  drivers/mtd/nand/nand_base.c    | 26 +++++++++++++++++++++++++-
>  drivers/mtd/nand/nand_timings.c | 26 +++++++++++++++++++++++++-
>  include/linux/mtd/nand.h        | 18 ++++++++++++++++++
>  3 files changed, 68 insertions(+), 2 deletions(-)
> 
