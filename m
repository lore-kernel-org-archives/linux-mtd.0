Received: from filter1.ibarracuda.nl ([83.247.7.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjRag-0002z8-8Y
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 11:39:03 +0000
Date: Wed, 29 Oct 2014 12:36:12 +0100
From: Frans Klaver <frans.klaver@xsens.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v2] mtd: omap: fix mtd devices not showing up
Message-ID: <20141029113612.GA2499@ci00147.xsens-tech.local>
References: <1414416749-19598-1-git-send-email-frans.klaver@xsens.com>
 <1414420445-9020-1-git-send-email-frans.klaver@xsens.com>
 <544F6611.1000801@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <544F6611.1000801@ti.com>
Cc: linux-omap@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel =?utf-8?Q?Garc=C3=ADa?= <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 28, 2014 at 11:46:57AM +0200, Roger Quadros wrote:
> On 10/27/2014 04:34 PM, Frans Klaver wrote:
> > Since commit 6d178ef2fd5e ("mtd: nand: Move ELM driver and rename as
> > omap_elm"), I don't have any mtd devices present on my am335x. This
> > changes the link order of the omap_elm and omap2 objects, causing them
> > to probe in the wrong order.
> > 
> > To fix this, make elm_config defer probing until the omap_elm driver is
> > actually loaded.
> > 
> > Signed-off-by: Frans Klaver <frans.klaver@xsens.com>
> 
> Acked-by: Roger Quadros <rogerq@ti.com>

Thanks. How about Ezequiel's remark about doing both changes?

Thanks,
Frans
