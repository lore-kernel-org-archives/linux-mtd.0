Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm7nM-0005bQ-NA
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 21:07:13 +0000
Received: by mail-pd0-f175.google.com with SMTP id y13so1482109pdi.34
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 13:06:51 -0800 (PST)
Date: Wed, 5 Nov 2014 13:06:47 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for SST spi flash
Message-ID: <20141105210647.GU23619@ld-irv-0074>
References: <29606567142da0d52c462ef0aebacc2b91fe2508.1413891469.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29606567142da0d52c462ef0aebacc2b91fe2508.1413891469.git.michal.simek@xilinx.com>
Cc: Marek Vasut <marex@denx.de>, monstr@monstr.eu,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Peter Crosthwaite <peter.crosthwaite@xilinx.com>, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Harini Katakam <harini.katakam@xilinx.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 21, 2014 at 01:37:59PM +0200, Michal Simek wrote:
> From: Harini Katakam <harini.katakam@xilinx.com>
> 
> Add sst25wf080 to the spi-nor device id table.
> 
> Signed-off-by: Harini Katakam <harinik@xilinx.com>
> Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Applied to l2-mtd.git. Thanks!

Brian
