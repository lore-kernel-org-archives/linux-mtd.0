Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1biYgM-0000uX-KP
 for linux-mtd@lists.infradead.org; Sat, 10 Sep 2016 03:10:19 +0000
Received: by mail-pf0-x242.google.com with SMTP id 128so4820277pfb.0
 for <linux-mtd@lists.infradead.org>; Fri, 09 Sep 2016 20:09:57 -0700 (PDT)
Date: Fri, 9 Sep 2016 20:09:30 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Karl Beldan <kbeldan@baylibre.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Karl Beldan <karl.beldan+oss@gmail.com>
Subject: Re: [PATCH] mtd: nand: davinci: Reinitialize the HW ECC engine in
 4bit hwctl
Message-ID: <20160910024133.GA15644@localhost>
References: <20160829074550.29247-1-kbeldan@baylibre.com>
 <20160829115930.517a133e@bbrezillon>
 <20160829203847.GA102453@google.com>
 <20160829224541.545f622d@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160829224541.545f622d@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 29, 2016 at 10:45:41PM +0200, Boris Brezillon wrote:
> On Mon, 29 Aug 2016 13:38:47 -0700
> Brian Norris <computersforpeace@gmail.com> wrote:
> 
> > On Mon, Aug 29, 2016 at 11:59:30AM +0200, Boris Brezillon wrote:
> > > Brian, can you take this patch directly in your tree. If that's not
> > > possible, let me know, I'll add the Fixes and Cc:stable tags and take
> > > it for 4.9.  
> > 
> > Would this be correct?
> > 
> > Fixes: 6a4123e581b3 ("mtd: nand: davinci_nand, 4-bit ECC for smallpage")
> 
> I'd say so. At least this is where nand_davinci_hwctl_4bit() was
> introduced, and it did not contain this 'reset' step.

Sorry, didn't notice your reply until now. Very busy... (more about that
later)

Applied to linux-mtd.git, with the Fixes and stable tags.
