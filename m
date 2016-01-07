Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHH9a-00042A-Oc
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 20:27:27 +0000
Received: by mail-pa0-x233.google.com with SMTP id uo6so248676797pac.1
 for <linux-mtd@lists.infradead.org>; Thu, 07 Jan 2016 12:27:06 -0800 (PST)
Date: Thu, 7 Jan 2016 12:27:03 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Harvey Hunt <harvey.hunt@imgtec.com>,
 Alex Smith <alex@alex-smith.me.uk>
Subject: Re: [PATCH] mtd: jz4780_nand: remove useless mtd->priv = chip
 assignment
Message-ID: <20160107202703.GH109450@google.com>
References: <1452189779-20001-1-git-send-email-computersforpeace@gmail.com>
 <20160107203247.0a6fb5ed@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160107203247.0a6fb5ed@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 07, 2016 at 08:32:47PM +0100, Boris Brezillon wrote:
> On Thu,  7 Jan 2016 10:02:59 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> 
> > As of commit 2d3b77bac34b ("mtd: nand: update mtd_to_nand()"), this
> > assignment isn't necessary, since struct mtd_info is embedded in struct
> > nand_chip.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: Harvey Hunt <harvey.hunt@imgtec.com>
> > Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Cc: Alex Smith <alex@alex-smith.me.uk>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks! Applied to l2-mtd.git
