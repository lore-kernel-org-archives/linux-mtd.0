Date: Fri, 15 Apr 2016 10:35:08 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Han Xu <han.xu@nxp.com>, David Woodhouse <dwmw2@infradead.org>, Fabio
 Estevam <fabio.estevam@freescale.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, Huang Shijie <shijie.huang@intel.com>, Brian
 Norris <computersforpeace@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Stefan Christ <s.christ@phytec.de>,
 Elie De Brauwer <eliedebrauwer@gmail.com>, Richard Weinberger
 <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH RESEND] gpmi-nand: Handle ECC Errors in erased pages
Message-ID: <20160415103508.5f6bc8c8@bbrezillon>
In-Reply-To: <7168760.YSQBa3GsdA@adelgunde>
References: <1456059126-25469-1-git-send-email-mpa@pengutronix.de>
 <DB5PR0401MB1845DD983AF9195311DEB20F97950@DB5PR0401MB1845.eurprd04.prod.outlook.com>
 <20160413005155.03cb7bc6@bbrezillon> <7168760.YSQBa3GsdA@adelgunde>
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

Hi Markus,

On Fri, 15 Apr 2016 09:55:45 +0200
Markus Pargmann <mpa@pengutronix.de> wrote:

> On Wednesday 13 April 2016 00:51:55 Boris Brezillon wrote:
> > On Tue, 12 Apr 2016 22:39:08 +0000
> > Han Xu <han.xu@nxp.com> wrote:
> > 
> > > > Thanks for the feedback. Talking with a coworker about this we may have found a
> > > > better approach to this that is less complicated to implement. The hardware
> > > > unit allows us to set a bitflip threshold for erased pages. The ECC unit
> > > > creates an ECC error only if the number of bitflips exceeds this threshold, but
> > > > it does not correct these. So the idea is to change the patch so that we set
> > > > pages, that are signaled by the ECC as erased, to 0xff completely without
> > > > checking. So the ECC will do all the work and we completely trust in its
> > > > abilities to do it correctly.
> > > 
> > > Sounds good.
> > > 
> > > some new platforms with new gpmi controller could check the count of 0 bits in page,
> > > refer to my patch https://patchwork.ozlabs.org/patch/587124/
> > > 
> > > But for all legacy platforms, IMO, considering bitflip is rare case, set threshold to 0 and
> > > only check the uncorrectable branch and then correct data sounds better. Setting threshold
> > > and correcting all erased page may highly impact the performance.
> > 
> > Indeed, bitflips in erased pages is not so common, and penalizing the
> > likely case (erased pages without any bitflips) doesn't look like a good
> > idea in the end.
> 
> Are erased pages really read that often?

Yes, it's not unusual to have those "empty pages?" checks (added Artem
and Richard to get a confirmation). AFAIR, UBIFS check for empty pages
in its journal heads after an unclean unmount (which happens quite
often) to make sure there's no corruption.

> I am not sure how UBI handles
> this, does it read every page before writing?

Nope, or maybe it does when you activate some extra checks.

> 
> > 
> > You can still implement this check in software. You can have a look at
> > nand_check_erased_ecc_chunk() [1] if you need an example, but you'll
> > have to adapt it because your controller does not guarantees that ECC
> > bits for a given chunk are byte aligned :-/
> 
> Yes I used this function in the patch. The issue is that I am not quite
> sure yet where to find the raw ECC data (without rereading the page).
> The reference manual is not extremely clear about that, ecc data may be
> in the 'auxilliary data' but I am not sure that it really is available
> somewhere.

AFAIR (and I'm not sure since it was a long time ago), you don't have
direct access to ECC bytes with the GPMI engine. If that's the case,
you'll have to read the ECC bytes manually (moving the page pointer
using ->cmdfunc(NAND_CMD_RNDOUT, column, -1)), which is a pain with
this engine, because ECC bytes are not guaranteed to be byte aligned
(see gpmi ->read_page_raw() implementation).
Once you've retrieved ECC bytes (or bits in this case), for each ECC
chunk, you can use the nand_check_erased_ecc_chunk() function (just make
sure you're padding the last ECC byte of each chunk with ones so that
bitflips cannot be reported on this section).

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
