Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6njc-00029D-Jp
 for linux-mtd@lists.infradead.org; Wed, 09 Dec 2015 23:01:21 +0000
Received: by pfnn128 with SMTP id n128so37103561pfn.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2015 15:00:57 -0800 (PST)
Date: Wed, 9 Dec 2015 15:00:55 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Simon Arlott <simon@fire.lp0.eu>
Subject: Re: [PATCH v3 6/6] mtd: partitions: support a cleanup callback for
 parsers
Message-ID: <20151209230055.GC144338@google.com>
References: <1449271518-118900-1-git-send-email-computersforpeace@gmail.com>
 <1449271518-118900-7-git-send-email-computersforpeace@gmail.com>
 <20151209182403.GW120110@google.com>
 <20151209224650.47d644d8@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151209224650.47d644d8@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 09, 2015 at 10:46:50PM +0100, Boris Brezillon wrote:
> On Wed, 9 Dec 2015 10:24:03 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> 
> > If partition parsers need to clean up their resources, we shouldn't
> > assume that all memory will fit in a single kmalloc() that the caller
> > can kfree(). We should allow the parser to provide a proper cleanup
> > routine.
> > 
> > Note that this means we need to keep a hold on the parser's module for a
> > bit longer, and release it later with mtd_part_parser_put().
> > 
> > Alongside this, define a default callback that we'll automatically use
> > if the parser doesn't provide one, so we can still retain the old
> > behavior.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Applied, thanks!
