Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhKa0-0004R1-KI
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 16:50:09 +0000
Received: by padhy16 with SMTP id hy16so45631030pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2015 09:49:48 -0700 (PDT)
Date: Wed, 30 Sep 2015 09:49:45 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: mtdpart: fix add_mtd_partitions error path
Message-ID: <20150930164945.GD143959@google.com>
References: <1438251483-20888-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438251483-20888-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 30, 2015 at 12:18:03PM +0200, Boris Brezillon wrote:
> If we fail to allocate a partition structure in the middle of the partition
> creation process, the already allocated partitions are never removed, which
> means they are still present in the partition list and their resources are
> never freed.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: stable@vger.kernel.org

Pushed to l2-mtd.git, thanks
