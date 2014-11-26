Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtWUz-0005bh-VC
 for linux-mtd@lists.infradead.org; Wed, 26 Nov 2014 06:54:50 +0000
Received: by mail-pd0-f180.google.com with SMTP id p10so2204536pdj.25
 for <linux-mtd@lists.infradead.org>; Tue, 25 Nov 2014 22:54:29 -0800 (PST)
Date: Tue, 25 Nov 2014 22:54:25 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: improve wait-till-ready timeout loop
Message-ID: <20141126065425.GK3212@norris-Latitude-E6410>
References: <1415183523-16265-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1415183523-16265-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 05, 2014 at 02:32:03AM -0800, Brian Norris wrote:
> There are a few small issues with the timeout loop in
> spi_nor_wait_till_ready():
> 
>  * The first operation should not be a reschedule; we should check the
>    status register at least once to see if we're complete!
> 
>  * We should check the status register one last time after declaring the
>    deadline has passed, to prevent a premature timeout erro (this is
>    theoretically possible if we sleep for a long time after the previous
>    status register check).
> 
>  * Add an error message, so it's obvious if we ever hit a timeout.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Applied to l2-mtd.git.

Brian
