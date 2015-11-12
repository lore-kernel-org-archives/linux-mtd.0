Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwwNR-0000zi-Ln
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 18:13:42 +0000
Received: by pacdm15 with SMTP id dm15so71822421pac.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 10:13:20 -0800 (PST)
Date: Thu, 12 Nov 2015 10:13:18 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: zero out mtd_partion struct before using it
Message-ID: <20151112181318.GB126029@google.com>
References: <1447289272-131828-1-git-send-email-computersforpeace@gmail.com>
 <20151112095219.666e32c2@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151112095219.666e32c2@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 12, 2015 at 09:52:19AM +0100, Boris Brezillon wrote:
> On Wed, 11 Nov 2015 16:47:52 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> 
> > It's easier to guarantee we've cleared out all unused fields with
> > memset() than by manually initializing each field.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Pushed to l2-mtd.git/next
