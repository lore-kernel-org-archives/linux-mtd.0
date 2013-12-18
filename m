Date: Tue, 17 Dec 2013 21:42:45 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] Partially revert "mtd: nand: pxa3xx: Introduce
 'marvell,armada370-nand' compatible string"
Message-ID: <20131218004245.GB10369@localhost>
References: <1386624986-404-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131212230715.GX27149@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131212230715.GX27149@ld-irv-0074.broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 Lior Amsalem <alior@marvell.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Thu, Dec 12, 2013 at 03:07:15PM -0800, Brian Norris wrote:
> On Mon, Dec 09, 2013 at 06:36:26PM -0300, Ezequiel Garcia wrote:
> > This reverts c0f3b8643a6fa2461d70760ec49d21d2b031d611.
> 
> Modified to say "partially reverts".
> 
> > 
> > The "armada370-nand" compatible support is not complete, and it was mistake
> > to add it. Revert it and pospone the support until the infrastructure is
> > in place.
> > 
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > ---
> > Note this won't apply to v3.12 as it is, although fixing it should be easy.
> 
> Pushed this patch to linux-mtd.git, noting -stable for 3.12+.
> 

Just to have some context, this compatible was removed because it was
wrongly added and it doesn't belong at v3.12 and v3.13.

Now the revert is in place in v3.13-rc4 and it should be queued for
v3.12.x, so we are good. Thanks for taking care of it!

On the other side, all the work needed for the driver to work OK on
Armada 370/XP SoC is already in l2-mtd.git master, and I have some fixes
ready to support 2048B pages.

In conclusion, I think it's safe to add the compatible on top of such work,
and queue it for v3.14.

How should I send a patch to re-add this compatible? Do you plan to rebase
l2-mtd.git master on top of v3.13-rc4 or so?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
