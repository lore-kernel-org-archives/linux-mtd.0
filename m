Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwwO1-0001b5-OG
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 18:14:18 +0000
Received: by pasz6 with SMTP id z6so74472128pas.2
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 10:13:57 -0800 (PST)
Date: Thu, 12 Nov 2015 10:13:54 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 Brian Foster <brian.foster@maximintegrated.com>
Subject: Re: [PATCH] mtd: partitions: kill unused ecclayout struct
Message-ID: <20151112181354.GC126029@google.com>
References: <1447290356-60040-1-git-send-email-computersforpeace@gmail.com>
 <20151112094241.598944ec@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151112094241.598944ec@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 12, 2015 at 09:42:41AM +0100, Boris Brezillon wrote:
> On Wed, 11 Nov 2015 17:05:56 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> 
> > This field is not used.
> > 
> > Reported here:
> > 
> > http://lists.infradead.org/pipermail/linux-mtd/2015-October/062417.html
> > 
> > Reported-by: Brian Foster <brian.foster@maximintegrated.com>
> > Cc: Brian Foster <brian.foster@maximintegrated.com>
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Adjusted the context a bit and pushed to l2-mtd.git/next
