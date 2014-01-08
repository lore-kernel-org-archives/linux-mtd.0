Date: Wed, 8 Jan 2014 20:38:16 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 0/3] omap2: Assorted GPMC cleanups
Message-ID: <20140108233815.GC2595@localhost>
References: <1382921508-5104-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140108191836.GD31323@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140108191836.GD31323@atomide.com>
Cc: Javier Martinez Canillas <martinez.javier@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Jon Hunter <jgchunter@gmail.com>,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 08, 2014 at 11:18:37AM -0800, Tony Lindgren wrote:
> * Ezequiel Garcia <ezequiel.garcia@free-electrons.com> [131027 17:52]:
> > (I'm CCing the MTD list, because GPMC is the memory controller
> > used for NOR, NAND and OneNAND devices).
> > 
> > Hi all,
> > 
> > Just a small patchset containing two small cleanups and a minor fix
> > for the GPMC memory controller. The first two are cleanups and can
> > be considered as preparation work for the fix.
> > 
> > The fix is patch 3/3: "Move legacy GPMC width setting". It makes
> > explicit use of the DT property "gpmc,device-width" and removes the
> > subsequent (and redundant) setting of the GPMC width, based in the
> > NAND bus widht.
> 
> Thanks and sorry for the delay. Applying these all into branch
> omap-for-v3.14/fixes-not-urgent.
> 

No problem. I'll give this a test/review next week.

Do we still need the board-file (legacy) workaround in this patchset?
I was actually waiting for you to clean-up completely that, before
re-sending the series, without the board-file workaround.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
