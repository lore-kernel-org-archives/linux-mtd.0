Date: Sun, 25 May 2014 13:29:06 -0400
From: Jason Cooper <jason@lakedaemon.net>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH for v3.15 0/2] ARM: mvebu Specificy ECC scheme for
 A375/385 boards
Message-ID: <20140525172906.GL8664@titan.lakedaemon.net>
References: <1400941030-2123-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1400941030-2123-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
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

On Sat, May 24, 2014 at 11:17:08AM -0300, Ezequiel Garcia wrote:
> Last minute fixes, which help prevent any inconsistencies between the ECC
> scheme expected by the bootloader, and the one expected by the kernel.
> 
> Until now, the kernel was using the ONFI-provided "datasheet ECC requirement",
> and assume the bootloader did the same thing. However, this is not the case
> for these boards, where the vendor provided a bootloader with an ECC strength
> that's weaker than the required.
> 
> After the introduction of the NAND ECC devicetree binding, and its support
> in the pxa3xx-nand driver, we can set these values and expect them to work.
> 
> I hope it's not too late for v3.15 already.
> 
> Ezequiel Garcia (2):
>   ARM: dts: Specify the NAND ECC scheme explicitly on Armada 375 DB
>     board
>   ARM: dts: Specify the NAND ECC scheme explicitly on Armada 385 DB
>     board
> 
>  arch/arm/boot/dts/armada-375-db.dts | 2 ++
>  arch/arm/boot/dts/armada-385-db.dts | 2 ++
>  2 files changed, 4 insertions(+)

As discussed on irc, I'm pushing this for v3.16 right now.  If we later
determine that it needs to be in v3.15, we can send a stable request for
these patches.

Applied to mvebu/dt for v3.16

thx,

Jason.
