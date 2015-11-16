Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyOtu-0000Yy-JR
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 18:53:15 +0000
Received: by padhx2 with SMTP id hx2so183302015pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 10:52:53 -0800 (PST)
Date: Mon, 16 Nov 2015 10:52:51 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Ray Jui <rjui@broadcom.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Scott Branden <sbranden@broadcom.com>,
 "Andrew E . Mileski" <andrewm@isoar.ca>
Subject: Re: [PATCH] mtd: nand: fix shutdown/reboot for multi-chip systems
Message-ID: <20151116185251.GN8456@google.com>
References: <1447115848-92621-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447115848-92621-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 09, 2015 at 04:37:28PM -0800, Brian Norris wrote:
> If multiple NAND chips are registered to the same controller, then when
> rebooting the system, the first one will grab the controller lock, while
> the second will wait forever for the first one to release it. i.e., a
> classic deadlock.
> 
> This problem was solved for a similar case (suspend/resume) back in
> commit 6b0d9a841249 ("mtd: nand: fix multi-chip suspend problem"), and
> the shutdown state really isn't much different for us, so rather than
> adding a new special case to nand_get_device(), we can just overload the
> FL_PM_SUSPENDED state.
> 
> Now, multiple chips can "get" the same controller lock (preventing
> further I/O), while we still allow other chips to pass through
> nand_shutdown().
> 
> Original report:
> http://thread.gmane.org/gmane.linux.drivers.mtd/59726
> http://lists.infradead.org/pipermail/linux-mtd/2015-July/059992.html
> 
> Fixes: 72ea403669c7 ("mtd: nand: added nand_shutdown")
> Reported-by: Andrew E. Mileski <andrewm@isoar.ca>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: Andrew E. Mileski <andrewm@isoar.ca>

Pushed to linux-mtd.git
