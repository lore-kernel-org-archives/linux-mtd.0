Received: from [178.115.242.59] (helo=mail.osadl.at)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiDMa-0003VF-3b
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 06:33:34 +0000
Date: Wed, 25 Jul 2018 06:31:37 +0000
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Nicholas Mc Guire <hofrat@osadl.org>,
 Graham Moore <grmoore@opensource.altera.com>,
 Vignesh R <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: cadence-quadspi: make return type fit
 wait_for_completion_timeout
Message-ID: <20180725063137.GB7194@osadl.at>
References: <1532189293-5975-1-git-send-email-hofrat@osadl.org>
 <20180724224626.777149ce@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180724224626.777149ce@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 24, 2018 at 10:46:26PM +0200, Boris Brezillon wrote:
> On Sat, 21 Jul 2018 18:08:13 +0200
> Nicholas Mc Guire <hofrat@osadl.org> wrote:
> 
> > wait_for_completion_timeout returns an unsigned long not int. declare a
> > suitably type timeout and fix up assignment and check.
> > 
> > Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> > Reported-by: Vignesh R <vigneshr@ti.com>
> > Fixes: 140623410536 ("mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller")
> 
> If you don't mind, I'd like to squash all wait_for_completion_timeout()
> fixes into a single commit.
>
makes sense - no objections to that at all.

thx!
hofrat 
