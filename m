Received: from mail1.bemta12.messagelabs.com ([216.82.251.10])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bz0tm-0002Ho-JU
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 12:32:11 +0000
Subject: Re: [PATCH 0/2] mtd: nand: Enforce tCCS wait time after a column
 change
To: Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
References: <1475310243-32625-1-git-send-email-boris.brezillon@free-electrons.com>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <580F50B3.1070702@sigmadesigns.com>
Date: Tue, 25 Oct 2016 14:31:47 +0200
MIME-Version: 1.0
In-Reply-To: <1475310243-32625-1-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/10/2016 10:24, Boris Brezillon wrote:

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

Tested-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>

Regards.
