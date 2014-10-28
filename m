Received: from filter1.ibarracuda.nl ([83.247.7.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xj2bj-0004sT-DV
 for linux-mtd@lists.infradead.org; Tue, 28 Oct 2014 08:58:28 +0000
Date: Tue, 28 Oct 2014 09:57:41 +0100
From: Frans Klaver <frans.klaver@xsens.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH typo-resend] mtd: omap: fix mtd devices not showing up
Message-ID: <20141028085740.GG2383@ci00147.xsens-tech.local>
References: <1414416749-19598-1-git-send-email-frans.klaver@xsens.com>
 <544E4F19.8060205@ti.com> <544E9CB1.5020804@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <544E9CB1.5020804@vanguardiasur.com.ar>
Cc: linux-omap@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 27, 2014 at 04:27:45PM -0300, Ezequiel Garcia wrote:
> 
> On 10/27/2014 10:56 AM, Roger Quadros wrote:
> 
> > Alternatively we could fix either elm_config() or omap_nand_probe() to
> > return -EPROBE_DEFER in case the device is present but driver not yet probed.
> > 
> 
> Yes, that's a good idea. Can't we do both? Getting a systematic deferred
> probe sounds like a bit silly to me.

It may be. If we do both and something moves again, or something is
added that depends on omap_elm but is probed earlier, you won't be
noticing the new systematic probe deferral until you really start
looking at it.

There isn't a real dependency system in the drivers, is there?

Thanks,
Frans
