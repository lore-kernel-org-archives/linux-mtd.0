Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwwMZ-0000hq-LI
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 18:12:48 +0000
Received: by padhx2 with SMTP id hx2so71936570pad.1
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 10:12:26 -0800 (PST)
Date: Thu, 12 Nov 2015 10:12:23 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] mtd: grab a reference to the MTD of_node before
 registering it
Message-ID: <20151112181223.GA126029@google.com>
References: <1447287964-63309-1-git-send-email-computersforpeace@gmail.com>
 <20151112095120.5ae32efd@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151112095120.5ae32efd@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 12, 2015 at 09:51:20AM +0100, Boris Brezillon wrote:
> On Wed, 11 Nov 2015 16:26:04 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> 
> > We now stick the device node representing the current MTD (if any) into
> > sysfs, so let's make sure we have a reference to it before doing that.
> > 
> > Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> 
> Looks good to me,
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Pushed to l2-mtd.git/next
