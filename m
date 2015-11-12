Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwgNy-0003ym-Ha
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 01:09:12 +0000
Received: by pasz6 with SMTP id z6so48465468pas.2
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 17:08:50 -0800 (PST)
Date: Wed, 11 Nov 2015 17:08:47 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Foster <brian.foster@maximintegrated.com>
Subject: Re: [PATCH] mtd: partitions: kill unused ecclayout struct
Message-ID: <20151112010847.GF96199@google.com>
References: <1447290356-60040-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447290356-60040-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 11, 2015 at 05:05:56PM -0800, Brian Norris wrote:
> Depends on this for killing its last use:
> 
>   http://patchwork.ozlabs.org/patch/543159/

Also depends on this, for context:

  http://patchwork.ozlabs.org/patch/543161/

I should have just made these a series...
