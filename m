Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5HIs-00061P-Nm
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 15:30:07 +0000
Message-ID: <1375457698.14869.344.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] nand: mxc_nand: Remove unneeded check for
 platform_get_resource()
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Fabio Estevam <festevam@gmail.com>
Date: Fri, 02 Aug 2013 18:34:58 +0300
In-Reply-To: <1374429122-15514-1-git-send-email-festevam@gmail.com>
References: <1374429122-15514-1-git-send-email-festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 s.hauer@pengutronix.de, dwmw2@infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2013-07-21 at 14:52 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> devm_ioremap_resource() checks its arguments, so there is no need for
> explicitly checking the return value from platform_get_resource().
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
