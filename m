Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlxYB-0006eX-4m
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 10:10:51 +0000
Received: by mail-pa0-f41.google.com with SMTP id rd3so490350pab.28
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 02:10:28 -0800 (PST)
Date: Wed, 5 Nov 2014 02:10:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/8] mtd: spi-nor: refactor wait-till-ready
Message-ID: <20141105101024.GI22361@norris-Latitude-E6410>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, zajec5@gmail.com,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 06, 2014 at 06:16:54PM -0700, Brian Norris wrote:
> Hi all,
> 
> This patch series tackles a few pieces of the spi-nor framework that weren't
> abstracted very well. I did some limited testing on m25p80.c, and you can see
> patch 8, which adds a few test BUG_ON()'s. If any of them fail for you, please
> holler. I don't plan to merge that patch, although I could be convinced to
> rework it if it adds value to someone...
> 
> I'm especially interested in getting test coverage on fsl-quadspi.
> 
> Thanks,
> Brian

Pushed the first 6, with some small rebasing. I took v2 for patch 1.

I'll update patch 7 and send it out later.

Brian
