Date: Tue, 20 Jan 2015 12:47:40 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH 1/2] mtd: atmel_nand: introduce a new compatible string
 for sama5d4 chip
Message-ID: <20150120204740.GR9759@ld-irv-0074>
References: <1421656387-12538-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421656387-12538-1-git-send-email-josh.wu@atmel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, Rob Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 19, 2015 at 04:33:06PM +0800, Josh Wu wrote:
> Since in SAMA5D4 chip, the PMECC can correct bit flips in erased page.
> So we add a DT property to indicate this hardware character.
> 
> If the PMECC support correct bitflip erased page (all data are 0xff).
> Then we can use the PMECC correct the page and skip the erased page
> check.
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Pushed to l2-mtd.git.

Brian
