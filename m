Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNMAS-0005ks-4W
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 14:29:33 +0000
Received: by pdrg1 with SMTP id g1so33233442pdr.2
 for <linux-mtd@lists.infradead.org>; Thu, 06 Aug 2015 07:28:51 -0700 (PDT)
Date: Thu, 6 Aug 2015 23:27:51 +0900
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Salah Triki <salah.triki@acm.org>, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] jffs2: Remove NULL checks from jffs2_destroy_slab_caches
Message-ID: <20150806142751.GC4292@swordfish>
References: <1438717590-4263-1-git-send-email-salah.triki@acm.org>
 <20150804200639.GP10676@google.com>
 <20150805133247.GB576@swordfish>
 <alpine.DEB.2.10.1508060923250.2343@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1508060923250.2343@hadrien>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On (08/06/15 09:24), Julia Lawall wrote:
> > >
> > > Please provide the appropriate context next time. And for the moment, I will
> > > not apply this, because this does not work on the current MTD development tree.
> > > Try your patch bomb on the next release, as it's not worth my time to
> > > cross-merge a -next branch just for a "cleanup".
> > >
> >
> > Julia already has a patch set to cleanup all the existing users
> > (not published yet, though).
> 
> We should probably have put our patches into a series.  Because it is true
> that the cleanup patch breaks existing code.  So one has to be aware of
> the dependency between them.
> 

I guess we can wait until 3 patches in question will land in Linus's
tree. What do you think?

	-ss
