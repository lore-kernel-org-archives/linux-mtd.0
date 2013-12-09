Date: Mon, 9 Dec 2013 16:40:35 -0500
From: Jason Cooper <jason@lakedaemon.net>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] Partially revert "mtd: nand: pxa3xx: Introduce
 'marvell,armada370-nand' compatible string"
Message-ID: <20131209214035.GP10053@titan.lakedaemon.net>
References: <1386624986-404-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386624986-404-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Andrew Lunn <andrew@lunn.ch>, stable@vger.kernel.org,
 Lior Amsalem <alior@marvell.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 09, 2013 at 06:36:26PM -0300, Ezequiel Garcia wrote:
> This reverts c0f3b8643a6fa2461d70760ec49d21d2b031d611.
> 
> The "armada370-nand" compatible support is not complete, and it was mistake
> to add it. Revert it and pospone the support until the infrastructure is
> in place.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Acked-by: Jason Cooper <jason@lakedaemon.net>

thx,

Jason.
