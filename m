Date: Thu, 18 Jun 2015 20:27:07 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v4 1/6] mtd: nand: vf610_nfc: Freescale NFC for VF610,
 MPC5125 and others
Message-ID: <20150618182707.GA2254@breakpoint.cc>
References: <1427300909-20825-1-git-send-email-stefan@agner.ch>
 <1427300909-20825-2-git-send-email-stefan@agner.ch>
 <20150603130825.GA23991@breakpoint.cc>
 <b3b09b4b8c97cbfc88fa0d5fdc5e40cd@agner.ch>
 <20150609200751.GC5720@breakpoint.cc>
 <32a7fe8d8df87dfe35ea50c582077c78@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32a7fe8d8df87dfe35ea50c582077c78@agner.ch>
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com,
 aaron@tastycactus.com, pawel.moll@arm.com, marb@ixxat.de,
 ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org,
 shawn.guo@linaro.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, galak@codeaurora.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, bpringlemeir@nbsps.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 17, 2015 at 03:02:03PM +0200, Stefan Agner wrote:
> On 2015-06-09 22:07, Sebastian Andrzej Siewior wrote:
> > yeah, do you have any numbers by chance?
> 
> Just reevaluated the "performance optimizations". On a VF610 SoC (with
> L2 cache) the improvements increase performance by 2.5% and below. On a
> VF500 SoC (without L2 cache) it seems to have slightly more impact, up
> to 4%. Overall, it seems to influence write more than read.

it could have something to do with the CPU clock and how long it is blocked
due to the sync operation.

> Back then, when I implemented the improvements it certainly had a bigger
> impact. I don't have strong opinion on that...

Thanks for doing that. If you could take those numbers, put them in a table
like with/without relaxed and so one, write how you got them (modprobe bla)
and make it part of the commit message then everybody could see about how much
we talk here. Thanks again.

> --
> Stefan

Sebastian
