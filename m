Received: from filter1.ibarracuda.nl ([83.247.7.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XiksL-0002nn-Oj
 for linux-mtd@lists.infradead.org; Mon, 27 Oct 2014 14:02:26 +0000
Date: Mon, 27 Oct 2014 15:01:40 +0100
From: Frans Klaver <frans.klaver@xsens.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH typo-resend] mtd: omap: fix mtd devices not showing up
Message-ID: <20141027140140.GF2383@ci00147.xsens-tech.local>
References: <1414416749-19598-1-git-send-email-frans.klaver@xsens.com>
 <544E4F19.8060205@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <544E4F19.8060205@ti.com>
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

On Mon, Oct 27, 2014 at 03:56:41PM +0200, Roger Quadros wrote:
> Hi Frans,

Hi,

> On 10/27/2014 03:32 PM, Frans Klaver wrote:
> > Since commit 6d178ef2fd5e ("mtd: nand: Move ELM driver and rename as
> > omap_elm"), I don't have any mtd devices present on my am335x. This
> > appears to be related to the link order of the omap_elm and omap2
> > objects. Fix it by swapping the two in the Makefile.
> 
> Alternatively we could fix either elm_config() or omap_nand_probe() to
> return -EPROBE_DEFER in case the device is present but driver not yet probed.

I'd say that that would actually be nicer than having to depend on the
link order. I'll have a go at that.

Thanks,
Frans
