Date: Tue, 26 Jan 2016 11:26:45 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 Josh Wu <josh.wu@atmel.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>, Kyungmin Park <kyungmin.park@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
 punnaiah choudary kalluri <punnaia@xilinx.com>
Subject: Re: [PATCH 00/23] mtd: rework ECC layout definition
Message-ID: <20160126192645.GA46523@google.com>
References: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Mon, Dec 07, 2015 at 11:25:55PM +0100, Boris Brezillon wrote:
> Hello,
> 
> This patchset aims at getting rid of the nand_ecclayout limitations.
> struct nand_ecclayout is defining fixed eccpos and oobfree arrays which
> can only be increased by modifying the MTD_MAX_ECCPOS_ENTRIES_LARGE and
> MTD_MAX_OOBFREE_ENTRIES_LARGE macros.
> This approach forces us to modify the macro values each time we add a
> new NAND chip with a bigger OOB area, and increasing these arrays also
> penalize all platforms, even those who only support small NAND devices
> (with small OOB area).
> 
> The idea to overcome this limitation, is to define the ECC/OOB layout
> by the mean of two functions: ->eccpos() and ->oobfree(), which will
> basically return the same information has those stored in the
> nand_ecclayout struct.
> 
> Another advantage of this solution is that ECC layouts are usually
> following a repetitive pattern (i.e. leave X bytes free and put Y bytes
> of ECC per ECC chunk), which allows one to implement the ->eccpos()
> and ->oobfree() functions with a simple logic that can be applied
> to any size of OOB.

Thanks for the work! This definitely needed done. I imagined that it
might be best if we just changed the data structure format and have
drivers allocate it dynamically during probe(), but actually, I kinda
like generating it on the fly. The only concern I'd have is if there is
significant penalty to doing this sort of computation on the fly during
(e.g.) AUTO-layout OOB reads/writes. But I guess if there is such a
penalty, nothing would stop us from caching the results in the MTD/NAND
core code.

> Patches 1 to 10 are just cleanups or trivial fixes that can be taken
> independently.

There were some comments for patch 1, and I want to look more closely at
patch 10. But patches 2 to 9 are pushed to l2-mtd.git. Thanks!

> Patch 19 is just an aggregate of several smaller commits (one per
> driver), and has been submitted this way to limit the size of the
> series. If everybody agrees on this approach, I'll resubmit the series
> will those changes separated in different commits (as done here [1]).
> 
> Also note that the last two commits are removing the nand_ecclayout
> definition, thus preventing any new driver to use this structure.
> Of course, this step can be delayed if some of the previous patches
> are not accepted.

I haven't looked in detail at the second half of the series, but I like
the concept. I'll look closer once you fix up things in v2.

Thanks,
Brian

> Best Regards,
> 
> Boris
> 
> [1]https://github.com/bbrezillon/linux-sunxi/commits/nand/ecclayout2
