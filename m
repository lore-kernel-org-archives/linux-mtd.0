Date: Sun, 10 Nov 2013 20:24:07 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 00/31] Armada 370/XP NAND support
Message-ID: <20131110232406.GB15892@localhost>
References: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>, Huang Shijie <b32955@freescale.com>,
 Igor Grinberg <grinberg@compulab.co.il>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>,
 Nikita Kiryanov <nikita@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Thu, Nov 07, 2013 at 12:17:04PM -0300, Ezequiel Garcia wrote:
> Another version of the Armada 370/XP SoCs v3 patchset, addressing
> all the feedback provided by Brian Norris.
> 
> Please see Documentation/mtd/nand/pxa3xx-nand.txt for specific details
> about the controller and the driver.
> 
> Just as the last version, the bad block factory initial detection issue
> is not addressed by this patchset, but support for it will be added in
> a near future once we decide the proper roadmap. See here the discussion
> about it:
> 
>   http://permalink.gmane.org/gmane.linux.drivers.mtd/49401
> 
> As usual patches 1-4, adding the clock infrastructure have already been merged
> and will be dropped once this series can be based on v3.13-rc1.
> I'm including them just for completeness.
> 
> Based in l2-mtd's master branch. Also, I've pushed a branch to our github
> in case anyone wants to test it:
> 
>   https://github.com/MISL-EBU-System-SW/mainline-public/tree/l2-mtd/upstream-nand-v4
> 
> As per Jason Cooper's suggestion I'm Ccing devicetree mailing list, to get a review
> on the small binding changes this patchset contains. If the devicetree people wants
> us to just Cc you on the relevant patches, just let us know.
> 
> Of course, there's some room for improvements in this driver, and I'll probably
> continue working on it. However, for now I'd like to focus in adding the strict
> minimum amount of changes required to support the new SoC family and pospone any
> improvements.
> 

After some powering issues, I could boot my PXA3xx board (CM-X300 from
Compulab) and I've tested this patchset on it. In other words: no
regression on PXA! both DMA and non-DMA works.

Daniel: feel free to confirm my check, but it's no longer required,
in case you are too busy at the moment. I'll be able to test your
dmaengine work on this board, so feel free to Cc me on it.

Big thanks to Compulab for sending me the board, and specially
to Igor and Nikita!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
