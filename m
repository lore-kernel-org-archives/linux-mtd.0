Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHb9Y-0002CC-7V
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2016 17:48:44 +0000
Received: by mail-pa0-x242.google.com with SMTP id yy13so21797232pab.1
 for <linux-mtd@lists.infradead.org>; Fri, 08 Jan 2016 09:48:23 -0800 (PST)
Date: Fri, 8 Jan 2016 09:48:20 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, Alex Smith <alex@alex-smith.me.uk>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: jz4780: Update ecc correction error codes
Message-ID: <20160108174820.GM109450@google.com>
References: <1452271517-18993-1-git-send-email-harvey.hunt@imgtec.com>
 <20160108181422.4b94ffbd@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160108181422.4b94ffbd@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 08, 2016 at 06:14:22PM +0100, Boris Brezillon wrote:
> On Fri, 8 Jan 2016 16:45:17 +0000
> Harvey Hunt <harvey.hunt@imgtec.com> wrote:
> 
> > Update jz4780_bch_ecc_correct's return codes with appropriate values,
> > as specified in /include/linux/mtd/nand.h.
> 
> Oh, nice catch.

Agreed.

> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Applied, thanks
