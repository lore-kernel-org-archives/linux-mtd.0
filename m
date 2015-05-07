Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqUOZ-0008FX-KC
 for linux-mtd@lists.infradead.org; Thu, 07 May 2015 22:35:56 +0000
Received: by pabsx10 with SMTP id sx10so51877694pab.3
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2015 15:35:32 -0700 (PDT)
Date: Thu, 7 May 2015 15:35:25 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH] mtd: Switch to PM ops
Message-ID: <20150507223525.GQ32500@ld-irv-0074>
References: <1428314439-10853-1-git-send-email-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1428314439-10853-1-git-send-email-lars@metafoo.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 06, 2015 at 12:00:39PM +0200, Lars-Peter Clausen wrote:
> Use dev_pm_ops instead of the legacy suspend/resume callbacks for the MTD
> class suspend and resume operations.
> 
> While we are at it slightly reorder things to avoid the need for forward
> declarations.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Pushed to l2-mtd.git
