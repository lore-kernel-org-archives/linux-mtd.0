Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpLHR-0001VV-Aj
 for linux-mtd@lists.infradead.org; Wed, 28 Sep 2016 20:16:38 +0000
Received: by mail-pf0-x244.google.com with SMTP id q2so2544192pfj.0
 for <linux-mtd@lists.infradead.org>; Wed, 28 Sep 2016 13:16:16 -0700 (PDT)
Date: Wed, 28 Sep 2016 13:16:11 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Daniel Walter <dwalter@sigma-star.at>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/46] mtdpart: Propagate _get/put_device()
Message-ID: <20160928201611.GB142302@google.com>
References: <cover.1474450295.git.dwalter@sigma-star.at>
 <984fd8eb53b742bd46e7b42605ae4e0ceaf5ba08.1474450295.git.dwalter@sigma-star.at>
 <20160921121531.7786ee9b@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160921121531.7786ee9b@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 21, 2016 at 12:15:31PM +0200, Boris Brezillon wrote:
> On Wed, 21 Sep 2016 11:43:56 +0200
> Daniel Walter <dwalter@sigma-star.at> wrote:
> 
> > From: Richard Weinberger <richard@nod.at>
> > 
> > If the master device has callbacks for _get/put_device()
> > and this MTD has slaves a get_mtd_device() call on paritions
> > will never issue the registered callbacks.
> > Fix this by propagating _get/put_device() down.
> 
> Brian, can we have this one queued for 4.9? I can't take it in my tree
> if you want, but it's probably better if it's in the mtd tree.

Applied this patch to l2-mtd.git
