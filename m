Date: Sat, 23 Nov 2013 22:42:38 -0500
From: Jason Cooper <jason@lakedaemon.net>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v4 29/31] ARM: mvebu: Add support for NAND controller
 in Armada 370/XP
Message-ID: <20131124034238.GX29241@titan.lakedaemon.net>
References: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1383837455-30721-30-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1383837455-30721-30-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, devicetree@vger.kernel.org,
 Tawfik Bayouk <tawfik@marvell.com>, Daniel Mack <zonque@gmail.com>,
 Huang Shijie <b32955@freescale.com>, Willy Tarreau <w@1wt.eu>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 07, 2013 at 12:17:33PM -0300, Ezequiel Garcia wrote:
> The Armada 370 and Armada XP SoC have a NAND controller (aka NFCv2).
> This commit adds support for it in Armada 370 and Armada XP SoC
> common devicetree.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  arch/arm/boot/dts/armada-370-xp.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)

Patches 29 (this one), 30 and 31 applied to mvebu/dt

I'll be working on the core-divider clock issue over the next couple of
days.

thx,

Jason.
