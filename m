Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23992514AbdAFRjphuHz0 (ORCPT
 <rfc822;linux-mtd@lists.infradead.org> + 1 other);
 Fri, 6 Jan 2017 18:39:45 +0100
Date: Fri, 6 Jan 2017 18:39:44 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Tony Lindgren <tony@atomide.com>,
 Teresa Remmet <t.remmet@phytec.de>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?iso-8859-2?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Adam Ford <aford173@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/6] ARM: dts: am335x-phycore-som: Update NAND partition
 table
Message-ID: <20170106173944.t3jq7amga3j5ahe6@lenoch>
References: <1483627851-17996-1-git-send-email-t.remmet@phytec.de>
 <1483627851-17996-2-git-send-email-t.remmet@phytec.de>
 <20170105153637.GA4310@atomide.com>
 <20170105171845.GK4310@atomide.com>
 <20170105175619.GA56877@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170105175619.GA56877@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 05, 2017 at 09:56:20AM -0800, Brian Norris wrote:
[snip]
> The best solution would be to try to migrate away from static device
> tree representations of partition info entirely. UBI volumes are best
> where possible. If not, then some other kind of on-flash data structures
> (along the lines of a GPT) with a corresponding MTD partition parser is
> an OK alternative. Unfortunately, there isn't any good standard format
> for this on MTD, so it's typically all custom -- and so people use the
> easiest approach: device tree. And it's even more difficult with NAND,
> which has reliability problems, especially with static data (e.g., read
> disturb).

Just as a side note, there is some work in this area:
https://www.mail-archive.com/u-boot@lists.denx.de/msg232759.html

> Anyway, the parser solution is helpful only if one can properly fix the
> "flag day" first. And it requires a little bit more work to be generally
> useful; I posted some work for this over a year ago, but bikeshedding
> brought it down.

Best regards,
	ladis
