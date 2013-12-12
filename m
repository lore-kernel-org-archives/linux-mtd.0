Date: Thu, 12 Dec 2013 15:07:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] Partially revert "mtd: nand: pxa3xx: Introduce
 'marvell,armada370-nand' compatible string"
Message-ID: <20131212230715.GX27149@ld-irv-0074.broadcom.com>
References: <1386624986-404-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386624986-404-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 stable@vger.kernel.org, Lior Amsalem <alior@marvell.com>,
 linux-mtd@lists.infradead.org,
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

On Mon, Dec 09, 2013 at 06:36:26PM -0300, Ezequiel Garcia wrote:
> This reverts c0f3b8643a6fa2461d70760ec49d21d2b031d611.

Modified to say "partially reverts".

> 
> The "armada370-nand" compatible support is not complete, and it was mistake
> to add it. Revert it and pospone the support until the infrastructure is
> in place.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
> Note this won't apply to v3.12 as it is, although fixing it should be easy.

Pushed this patch to linux-mtd.git, noting -stable for 3.12+.

Ezequiel,

Please double-check linux-mtd.git to ensure it fits your liking.

Brian
