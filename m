Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eCurz-0004zb-Sj
 for linux-mtd@lists.infradead.org; Thu, 09 Nov 2017 22:00:21 +0000
Date: Thu, 9 Nov 2017 13:59:53 -0800
From: Tony Lindgren <tony@atomide.com>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 Roger Quadros <rogerq@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v3 1/7] memory: omap-gpmc: Refactor OneNAND support
Message-ID: <20171109215953.GH28152@atomide.com>
References: <20171109091155.6a6azfvjarwvlfh2@lenoch>
 <20171109091253.lvrzi5kbaykkxlcb@lenoch>
 <20171109175626.GD28152@atomide.com>
 <20171109181004.g55vx4iveo5sulpt@lenoch>
 <20171109182645.GE28152@atomide.com>
 <20171109183408.xbc4bacawv7li54l@lenoch>
 <20171109184828.GF28152@atomide.com>
 <20171109191028.6r5bmg65gcz7ovv2@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171109191028.6r5bmg65gcz7ovv2@lenoch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Ladislav Michl <ladis@linux-mips.org> [171109 19:12]:
> On Thu, Nov 09, 2017 at 10:48:28AM -0800, Tony Lindgren wrote:
> > Well don't we still need the related dts changes posted
> > and merged first?
> 
> Well, except Roger's feedback, there were complete silence so far.
> Note that simple fix was posted in February, this was rejected as
> we should aim towards clean DT only driver. And here we are with
> some doubts.
> 
> As I have no hardware nor any special knowledge going prior
> initial driver commit it is rather hard to send "related dts changes"
> given simple fact, that I'm unsure whenever we need to distinguish
> between OMAP2 and OMAP3. Based on that we need either one or
> two compatible strings.
> 
> Having two is safe, but u-boot will be unable to bring onenand equipped
> igep up.

Well if you have a complete series with proposed dts changes for
n8x0 and n900, I can try to test those. My n800 seems to have stopped
booting today.. Maybe I need to reflash it after playing with onenand.

Regards,

Tony
