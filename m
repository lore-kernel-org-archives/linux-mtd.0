Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ambJ7-0002Cj-UF
 for linux-mtd@lists.infradead.org; Sun, 03 Apr 2016 06:14:47 +0000
Received: by mail-pa0-x22b.google.com with SMTP id tt10so121032452pab.3
 for <linux-mtd@lists.infradead.org>; Sat, 02 Apr 2016 23:14:25 -0700 (PDT)
Date: Sat, 2 Apr 2016 23:14:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/2] mtd: nand: Drop mtd.owner requirement in nand_scan
Message-ID: <20160403061416.GB13995@localhost>
References: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1459546164-6269-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160401222649.GK2545@google.com>
 <20160402155216.48866776@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160402155216.48866776@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Apr 02, 2016 at 03:52:16PM +0200, Boris Brezillon wrote:
> On Fri, 1 Apr 2016 15:26:49 -0700
> Brian Norris <computersforpeace@gmail.com> wrote:
> > On Fri, Apr 01, 2016 at 06:29:23PM -0300, Ezequiel Garcia wrote:
> > > Since commit 807f16d4db95 ("mtd: core: set some defaults
> > > when dev.parent is set"), it's now legal for drivers
> > > to call nand_scan and nand_scan_ident without setting
> > > mtd.owner.
> > > 
> > > Drop the check and while at it remove the BUG() abuse.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
[...]

> > 
> > Ooh, yikes! Forgot this was there. I guess no one noticed, because fewer
> > drivers are using plain nand_scan() these days (instead of splitting up
> > nand_scan_ident() and nand_scan_tail()), and also, many NAND users don't
> > run their drivers as modules.
> > 
> > Anyway, this is probably worth -stable, right? (i.e., "Fixes:
> > 807f16d4db95 ..." and "Cc: <stable@vger.kernel.org>")
> > 
> > I can take this directly, or Boris, if you feel like there will be other
> > for-v4.5 NAND material, you can queue this up instead.
> 
> No, take it directly.

Applied patch 1 to linux-mtd.git. Thanks!

> On a more general note, not sure creating a nand/fixes branch and
> sending you PRs after each -rc (if fixes are available of course) is
> really efficient. Maybe I'm wrong, but I don't expect to see more than a
> couple of fixes per release, and it's probably better if you keep
> taking them directly (with my acks).
> 
> What do you think?

That's probably fine. I'll still keep my eyes open for fixes like this,
but ping me if you think I've missed anything.

Brian
