Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UaoWT-0007yV-HN
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 14:42:14 +0000
Message-ID: <1368197079.26780.172.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] mtd: sst25l: use spi_get_drvdata() and
 spi_set_drvdata()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Date: Fri, 10 May 2013 17:44:39 +0300
In-Reply-To: <001401ce3291$a1bdcba0$e53962e0$%han@samsung.com>
References: <001401ce3291$a1bdcba0$e53962e0$%han@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2013-04-06 at 15:40 +0900, Jingoo Han wrote:
> Use the wrapper functions for getting and setting the driver data using
> spi_device instead of using dev_{get|set}_drvdata with &spi->dev, so we
> can directly pass a struct spi_device.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
