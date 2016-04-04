Received: from mail-qg0-x22e.google.com ([2607:f8b0:400d:c04::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1an7bR-0001f3-Dy
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 16:43:50 +0000
Received: by mail-qg0-x22e.google.com with SMTP id c6so28079180qga.1
 for <linux-mtd@lists.infradead.org>; Mon, 04 Apr 2016 09:43:28 -0700 (PDT)
Date: Mon, 4 Apr 2016 09:43:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/2] mtd: nand: Remove BUG() abuse in nand_scan_tail
Message-ID: <20160404164319.GG13995@localhost>
References: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1459546164-6269-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160402155524.55e34fe4@bbrezillon>
 <20160404172048.6a76b472@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160404172048.6a76b472@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 04, 2016 at 05:20:48PM +0200, Boris Brezillon wrote:
> On Sat, 2 Apr 2016 15:55:24 +0200
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
> > On Fri,  1 Apr 2016 18:29:24 -0300
> > Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> > 
> > > There's no reason to BUG() when parameters are being
> > > validated. Drivers can get things wrong, and it's much nicer
> > > to just throw a noisy warn and fail gracefully, than calling
> > > BUG() and throwing the whole system down the drain.
> > 
> > I'm fine with this change as long as all callers are checking
> > nand_scan_tail() return value.
> 
> Actually, the s3c2410 driver is not checking nand_scan_tail() return
> value. Could you send a v2 addressing that?

One could argue that we as a kernel community don't care about those
systems which are currently configured to hit 100%-reproducible BUG()
statements at boot time, and so this wouldn't really be a regression.
Also, there are already error cases in nand_scan_tail() that might
return non-zero, so such drivers are already broken.

Of course, it'd be nice to fix these drivers anyway.

Brian
