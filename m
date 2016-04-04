Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1an6WG-0002gb-1p
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 15:34:25 +0000
Date: Mon, 4 Apr 2016 17:33:47 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 0/2] nand: Remove BUG abuse
Message-ID: <20160404173347.40a1b563@bbrezillon>
In-Reply-To: <CAAEAJfA2wYAR+ZO0CL1dAy=OPi4gEUBf1zoT1JHO076UyvZmQQ@mail.gmail.com>
References: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1459546164-6269-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160402155524.55e34fe4@bbrezillon>
 <20160404172048.6a76b472@bbrezillon>
 <CAAEAJfA2wYAR+ZO0CL1dAy=OPi4gEUBf1zoT1JHO076UyvZmQQ@mail.gmail.com>
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

On Sat, 2 Apr 2016 12:37:06 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> On 4 April 2016 at 12:20, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Sat, 2 Apr 2016 15:55:24 +0200
> > Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> >
> >> On Fri,  1 Apr 2016 18:29:24 -0300
> >> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> >>
> >> > There's no reason to BUG() when parameters are being
> >> > validated. Drivers can get things wrong, and it's much nicer
> >> > to just throw a noisy warn and fail gracefully, than calling
> >> > BUG() and throwing the whole system down the drain.
> >>
> >> I'm fine with this change as long as all callers are checking
> >> nand_scan_tail() return value.
> >
> > Actually, the s3c2410 driver is not checking nand_scan_tail() return
> > value. Could you send a v2 addressing that?
> >
> 
> Hmm, I don't see how that relates to this patch.
> As far as I can see, it's two completely independent issues.
> 
> Or am I missing something here?

Well, you're removing BUG() calls and are returning an error instead, so
if existing nand_scan_tail() callers don't check the return status you
may hide an existing bug...

I know it's unlikely to happen, but I'd still prefer to have all
nand_scan_tail() callers to check the return value before removing
those calls to BUG().

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
