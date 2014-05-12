Received: from mail-ie0-x236.google.com ([2607:f8b0:4001:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjzXQ-0001bz-0O
 for linux-mtd@lists.infradead.org; Mon, 12 May 2014 23:21:40 +0000
Received: by mail-ie0-f182.google.com with SMTP id to1so737118ieb.41
 for <linux-mtd@lists.infradead.org>; Mon, 12 May 2014 16:21:18 -0700 (PDT)
Date: Mon, 12 May 2014 16:21:14 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 1/3] mtd: st_spi_fsm: Make of_device_id array const
Message-ID: <20140512232114.GU28907@ld-irv-0074>
References: <021e01cf69d0$e89e8290$b9db87b0$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <021e01cf69d0$e89e8290$b9db87b0$%han@samsung.com>
Cc: linux-mtd@lists.infradead.org, 'Lee Jones' <lee.jones@linaro.org>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 07, 2014 at 05:46:59PM +0900, Jingoo Han wrote:
> Make of_device_id array const, because all OF functions
> handle it as const.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Pushed all 3 to l2-mtd.git. Thanks!

Brian
