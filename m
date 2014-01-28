Received: from mail-pd0-f178.google.com ([209.85.192.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W81C7-0001wb-OB
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2014 05:26:45 +0000
Received: by mail-pd0-f178.google.com with SMTP id y13so6588116pdi.23
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jan 2014 21:26:18 -0800 (PST)
Date: Mon, 27 Jan 2014 21:26:12 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/4] m25p80 Quad/Dual updates
Message-ID: <20140128052612.GE3162@norris-Latitude-E6410>
References: <1390309159-19643-1-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1390309159-19643-1-git-send-email-geert@linux-m68k.org>
Cc: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 Sourav Poddar <sourav.poddar@ti.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 21, 2014 at 01:59:15PM +0100, Geert Uytterhoeven wrote:
> This patch series allows to really use Quad and Dual SPI Read Tranfers
> with the m25p80 driver:
>     [1/4] mtd: m25p80: Enable Quad SPI read transfers for s25fl512s
>     [2/4] mtd: m25p80: Set rx_nbits for Quad SPI transfers

Pushed 1 and 2 to l2-mtd.git/master and will submit for 3.14-rc1, as
they are trivial extensions/bugfixes for stuff we have queued now.

>     [3/4] mtd: m25p80: Add dual read support
>     [4/4] mtd: m25p80: Enable Dual SPI read transfers for s25fl256s1 and
> 	  s25fl512s

Patches 3 and 4 are queued in l2-mtd.git/next and should go in next
merge window.

> Patch [2/4] is a bug fix.
> Patches [3/4] and [4/4] may be considered of limited use (why use Dual
> transfers if you have Quad transfers?), but
>   1. not all Quad-capable devices may be connected using 6 wires,
>   2. it allows to test Dual SPI transfers in SPI master drivers.

Reason 1 is especially good. Thanks for the patches.

Brian
