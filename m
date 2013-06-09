Received: from userp1040.oracle.com ([156.151.31.81])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ulnwb-00050k-CJ
 for linux-mtd@lists.infradead.org; Sun, 09 Jun 2013 22:18:38 +0000
Date: Mon, 10 Jun 2013 01:18:08 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] mtd: orion_nand: convert printk to dev_*
Message-ID: <20130609221808.GY23987@mwanda>
References: <1370812614-5724-1-git-send-email-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1370812614-5724-1-git-send-email-andy.shevchenko@gmail.com>
Cc: artem.bityutskiy@linux.intel.com, Emil Goode <emilgoode@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 10, 2013 at 12:16:54AM +0300, Andy Shevchenko wrote:
> It's better to use actual device name as a prefix in error messages.
> 

Gar...

This doesn't apply on top of Emil's patch.  Emil's patch was first
so it should go in first.  Also Emil's patch was a bugfix so it is
more important than this printk cleanup patch.

Really, the kzalloc error messages should just be deleted.  They are
cargo cult error messages as in "we need an error message because
we are copy and pasting from other code without thinking."  Kzalloc
already has far better messages built in.

Ah well...

regards,
dan carpenter
