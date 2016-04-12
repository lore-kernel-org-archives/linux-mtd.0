Date: Wed, 13 Apr 2016 00:51:55 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Han Xu <han.xu@nxp.com>
Cc: Markus Pargmann <mpa@pengutronix.de>, David Woodhouse
 <dwmw2@infradead.org>, Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, Huang Shijie
 <shijie.huang@intel.com>, Brian Norris <computersforpeace@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RESEND] gpmi-nand: Handle ECC Errors in erased pages
Message-ID: <20160413005155.03cb7bc6@bbrezillon>
In-Reply-To: <DB5PR0401MB1845DD983AF9195311DEB20F97950@DB5PR0401MB1845.eurprd04.prod.outlook.com>
References: <1456059126-25469-1-git-send-email-mpa@pengutronix.de>
 <20160224145750.21050def@bbrezillon> <3992227.rRuQ67A3ma@galactica>
 <20160411092916.793d5abd@bbrezillon>
 <DB5PR0401MB1845DD983AF9195311DEB20F97950@DB5PR0401MB1845.eurprd04.prod.outlook.com>
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

On Tue, 12 Apr 2016 22:39:08 +0000
Han Xu <han.xu@nxp.com> wrote:

> > Thanks for the feedback. Talking with a coworker about this we may have found a
> > better approach to this that is less complicated to implement. The hardware
> > unit allows us to set a bitflip threshold for erased pages. The ECC unit
> > creates an ECC error only if the number of bitflips exceeds this threshold, but
> > it does not correct these. So the idea is to change the patch so that we set
> > pages, that are signaled by the ECC as erased, to 0xff completely without
> > checking. So the ECC will do all the work and we completely trust in its
> > abilities to do it correctly.
> 
> Sounds good.
> 
> some new platforms with new gpmi controller could check the count of 0 bits in page,
> refer to my patch https://patchwork.ozlabs.org/patch/587124/
> 
> But for all legacy platforms, IMO, considering bitflip is rare case, set threshold to 0 and
> only check the uncorrectable branch and then correct data sounds better. Setting threshold
> and correcting all erased page may highly impact the performance.

Indeed, bitflips in erased pages is not so common, and penalizing the
likely case (erased pages without any bitflips) doesn't look like a good
idea in the end.

You can still implement this check in software. You can have a look at
nand_check_erased_ecc_chunk() [1] if you need an example, but you'll
have to adapt it because your controller does not guarantees that ECC
bits for a given chunk are byte aligned :-/

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L1200


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
