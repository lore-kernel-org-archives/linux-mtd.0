Received: from emh07.mail.saunalahti.fi ([62.142.5.117])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZ11V-0005JP-AF
 for linux-mtd@lists.infradead.org; Tue, 09 Jan 2018 21:01:31 +0000
Date: Tue, 9 Jan 2018 23:01:14 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v5 00/16] OMAP2+ OneNAND driver update
Message-ID: <20180109210114.s66rpdg2jjdps5bc@darkstar.musicnaut.iki.fi>
References: <20171115162306.2o2w2yrf7wucroxd@lenoch>
 <20171130111840.41c92d34@bbrezillon>
 <20171130160936.GO28152@atomide.com>
 <434bd733-0ba2-6e75-9de5-017eef905fd2@ti.com>
 <20180109130812.GA338@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180109130812.GA338@lenoch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Jan 09, 2018 at 02:08:12PM +0100, Ladislav Michl wrote:
> Merge window is really close now and patches seems still to be untested on
> n8x0. So unless someone is going to test it soon, I'll pick used N800 on
> ebay :-/

Today I tried to test them on Nokia N810, and I get:

[    0.174804] omap-gpmc 6800a000.gpmc: GPMC revision 2.0
[    0.174865] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000
[    0.177459] omap-gpmc 6800a000.gpmc: /ocp/gpmc@6800a000/onenand@0,0 has no 'bank-width' property
[    0.177612] omap-gpmc 6800a000.gpmc: failed to probe DT child 'onenand': -22

With plain v4.15-rc7+ it probes fine.

A.
