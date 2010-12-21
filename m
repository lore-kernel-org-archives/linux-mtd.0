Date: Tue, 21 Dec 2010 12:18:31 -0800
From: Tony Lindgren <tony@atomide.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: [PATCH 0/2] Add 104MHz support for OMAP OneNAND
Message-ID: <20101221201831.GI5829@atomide.com>
References: <20101221194433.3127.74744.sendpatchset@ahunter-work.research.nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20101221194433.3127.74744.sendpatchset@ahunter-work.research.nokia.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	linux-omap Mailing List <linux-omap@vger.kernel.org>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
	Felipe Balbi <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Adrian Hunter <adrian.hunter@nokia.com> [101221 11:44]:
> Hi
> 
> Here is OMAP2/3: OneNAND: add 104MHz support.
> 
> Adrian Hunter (2):
>       OMAP2/3: GPMC: put sync_clk value in picoseconds instead of nanoseconds
>       OMAP2/3: OneNAND: add 104MHz support

Gave these a quick try and the GPMC changes work fine for smc91x
on 2430sdp and tusb6010 g_ether for n810.  So I'll queue these,
thanks.

Tony
