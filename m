Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a50JN-0005GT-9a
 for linux-mtd@lists.infradead.org; Sat, 05 Dec 2015 00:02:49 +0000
Received: by pfnn128 with SMTP id n128so33356679pfn.0
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2015 16:02:28 -0800 (PST)
Date: Fri, 4 Dec 2015 16:02:25 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Simon Arlott <simon@fire.lp0.eu>
Subject: Re: [PATCH v2 3/6] mtd: partitions: rename MTD parser get/put
Message-ID: <20151205000225.GJ120110@google.com>
References: <1449271518-118900-1-git-send-email-computersforpeace@gmail.com>
 <1449271518-118900-4-git-send-email-computersforpeace@gmail.com>
 <20151205010002.51a1bd57@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151205010002.51a1bd57@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 05, 2015 at 01:00:02AM +0100, Boris Brezillon wrote:
> On Fri,  4 Dec 2015 15:25:15 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> > We're going to reuse put_partition_parser(), so let's fix up the prefix
> > naming a bit, to hopefully be more consistent. Also make convert to a
> > true C function instead of a macro.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> > v2: keep mtd_part_parser_put() in the *.c file instead of the header, since
> >     we'll only use it in a wrapper now instead of exporting it directly
> 
> Don't know if you forgot my R-b tag or if you dropped it on purpose
> because of this change, but it still applies here.

Was intentional, for that reason.

> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks!
