Date: Mon, 20 Jul 2015 10:46:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Roy Spliet <r.spliet@ultimaker.com>
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
 Linux ARM kernel <linux-arm-kernel@lists.infradead.org>,
 Linux sunxi <linux-sunxi@googlegroups.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v5 1/2] mtd: nand: sunxi: Replace failsafe timing cfg
 with calculated value
Message-ID: <20150720174618.GF24125@google.com>
References: <1435309211-15236-1-git-send-email-r.spliet@ultimaker.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435309211-15236-1-git-send-email-r.spliet@ultimaker.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 26, 2015 at 11:00:10AM +0200, Roy Spliet wrote:
> The TIMING_CFG register was previously statically set to a magic value
> (extracted from Allwinner's BSP) when initializing the NAND controller.
> Now that we have more details about the TIMING_CFG register layout
> (extracted from the A83 user manual) we can dynamically calculate the
> appropriate value for each NAND chip and set it when selecting the
> chip.
> 
> Signed-off-by: Roy Spliet <r.spliet@ultimaker.com>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> ---
> V2:
> - Fix crippled comments
> 
> V3:
> - Warn for invalid timings
> - Style
> 
> V4:
> - Make better use of return types
> - Style and comments
> - Remove superfluous initialisation
> 
> V5:
> - Tidy up macros

Pushed both to l2-mtd.git. Thanks!

Brian
