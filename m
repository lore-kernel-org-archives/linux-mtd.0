Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1an9HU-00072m-FJ
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 18:31:22 +0000
Date: Mon, 4 Apr 2016 20:30:54 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/2] mtd: nand: Remove BUG() abuse in nand_scan_tail
Message-ID: <20160404203054.6da8f60a@bbrezillon>
In-Reply-To: <CAAEAJfCuqAB_io_XG1wjH7ce-de+yixh5A81RFk--Vbaw_DVmQ@mail.gmail.com>
References: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1459546164-6269-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160402155524.55e34fe4@bbrezillon>
 <20160404172048.6a76b472@bbrezillon> <570288A2.2010401@nod.at>
 <CAAEAJfCuqAB_io_XG1wjH7ce-de+yixh5A81RFk--Vbaw_DVmQ@mail.gmail.com>
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

On Mon, 4 Apr 2016 12:34:00 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> On 4 April 2016 at 12:30, Richard Weinberger <richard@nod.at> wrote:
> > Am 04.04.2016 um 17:20 schrieb Boris Brezillon:
> >> On Sat, 2 Apr 2016 15:55:24 +0200
> >> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> >>
> >>> On Fri,  1 Apr 2016 18:29:24 -0300
> >>> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> >>>
> >>>> There's no reason to BUG() when parameters are being
> >>>> validated. Drivers can get things wrong, and it's much nicer
> >>>> to just throw a noisy warn and fail gracefully, than calling
> >>>> BUG() and throwing the whole system down the drain.
> >>>
> >>> I'm fine with this change as long as all callers are checking
> >>> nand_scan_tail() return value.
> >>
> >> Actually, the s3c2410 driver is not checking nand_scan_tail() return
> >> value. Could you send a v2 addressing that?
> >
> > And maybe add __must_check to nand_scan_tail() such that we catch issues like
> > these.
> >
> 
> In fact, why not adding must_check to all the functions that can fail
> in the kernel?
> 
> That'll help catch even more issues ;-)

I'll take your patch and patch the s3c2410 driver myself. Still think
that keeping the BUG() calls until all callers have been patched to
check nand_scan_tail() return code would be safer, but I don't care
enough to spend more time arguing on this :P.

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
