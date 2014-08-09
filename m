Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XG2Eo-0002lF-79
 for linux-mtd@lists.infradead.org; Sat, 09 Aug 2014 08:42:54 +0000
Received: by mail-pd0-f180.google.com with SMTP id v10so6401738pde.25
 for <linux-mtd@lists.infradead.org>; Sat, 09 Aug 2014 01:42:31 -0700 (PDT)
Date: Sat, 9 Aug 2014 16:42:24 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 3/8] mtd: spi-nor: move "wait-till-ready" checks into
 erase/write functions
Message-ID: <20140809084221.GA32664@localhost.localdomain>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
 <1407374222-8448-4-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1407374222-8448-4-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 zajec5@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 06, 2014 at 06:16:57PM -0700, Brian Norris wrote:
> We shouldn't have *every* function checking if a previous write is
> complete; this should be done synchronously after each write/erase.

IMHO, this is not a good idea. :(
this patch prevents the erase-suspend and program-suspend.
We should add these two features for spi-nor in future.

thanks
Huang Shijie
